# Hodge Theory

Source title: MATH 731: HODGE THEORY

Converted from: `24.pdf`


## Page 1

MATH 731: HODGE THEORY
LECTURES BY PROF. MIRCEA MUSTAT ¸˘A; NOTES BY ALEKSANDER HORAWA
These are notes from Math 731 taught by Professor Mircea Mustat ¸˘ a in Fall 2019, LATEX’ed
by Aleksander Horawa (who is the only person responsible for any mistakes that may be
found in them).
I would like to thank David Schwein for sharing his typed notes with me during the times I
was away. I indicate within the notes the contributions that were made by him.
This version is from February 27, 2020. Check for the latest version of these notes at
http://www-personal.umich.edu/~ahorawa/index.html
If you ﬁnd any typos or mistakes, please let me know at ahorawa@umich.edu.
The goal of the course is to give an introduction to the basic results in Hodge theory. The
prerequisites are: familiarity with algebraic varieties and sheaf cohomology (no familiarity
with scheme theory is required) and with smooth manifolds (the tangent bundle, diﬀerential
forms, integration).
The course will not follow a single textbook but most of the material covered can be found
in [Voi07]. Additional references will be given where appropriate throughout the notes.
Contents
1. The classical topology on a complex algebraic variety 2
2. Holomorphic functions 7
3. Complex manifolds 17
4. Dolbeaux cohomology 33
5. Hodge theory of compact, oriented, Riemannian manifolds 45
6. Hodge theory of complex manifolds 57
7. K¨ ahler manifolds 62
8. Chern classes of line bundles 82
9. Algebraic cycles and some cohomology computations 88
10. Pure Hodge structures 97
11. Algebraic de Rham cohomology 101
Date: February 27, 2020.
1


## Page 2

2 MIRCEA MUSTAT ¸ ˘A
12. Introduction to Variations of Hodge structures 106
References 114
1. The classical topology on a complex algebraic variety
The set up is as follows. Let X be an algebraic variety over C, i.e. (the closed points of) a
reduced scheme of ﬁnite type over C.
Suppose X is aﬃne. Then there is a closed immersion X ↪→ AN
C = CN. Note that CN carries
the Euclidean topology. By deﬁnition, the classical topology on X is the induced subspace
topology. This is well-deﬁned: given two closed embeddings
CN
X
CN′
i
j
there are polynomial functions CN → CN′
and CN′
→ CN that make the triangle commute;
since polynomial functions Cm → Cn are continuous with respect to the Euclidean topology,
the two embeddings induce the same topology on X.
To give some more details, the two closed immersions correspond to surjective maps
C[x1, . . . , xN]
O(X)
C[y1, . . . , yN]
and we may deﬁned the map C[x1, . . . , xN] → C[y1, . . . , yN] (and vice versa) by taking any
lifts from O(X).
Proposition 1.1.
(1) The classical topology on X is ﬁner than the Zariski topology.
(2) If X is aﬃne and Z ↪→ X is a closed subvariety, then in the classical topology on Z
is the subspace topology with respect to the classical topology on X.
(3) The same is holds for an open subvariety U ↪→ X (if U is aﬃne).
Proof. It is enough to check (1) for CN; there, we use the deﬁnition of the Zariski topology
and the fact that polynomial functions are continuous with respect to the Euclidean topology.


## Page 3

MATH 731: HODGE THEORY 3
Part (2) follows directly from the deﬁnition.
To prove (3), we ﬁrst note that by covering U by principal aﬃne open subsets, we may
assume that U is principal aﬃne:
U = {x ∈ X | f(x) ̸= 0}
for some f ∈ O (X). Indeed, if U = U1 ∪ · · · ∪ Ur and Ui is principal aﬃne with respect to
X (hence also U), then the principal case implies that the topology on Ui is the subspace
topology on Ui with respect to both the classical topologies on U and on X, and hence the
assertion holds for U.
Given a closed immersion X ↪ → CN and f ∈ O (X), choose g ∈ C[x1, . . . , xN] such that
g|X = f and embed U in CN+1 as {(u, t) | u ∈ X, g(u)t = 1}:
X CN
U CN+1
The two maps:
• CN+1 → CN given by projecting only the ﬁrst component,
• CN \ V (g) → CN+1 given by u ↦→ (u, 1
g(u))
are both continuous with respect to the Euclidean topology. Thus the topology on U as a
subspace of CN and CN+1 coincide. □
We now glue the above construction. Let X be an algebraic variety over C. Take an aﬃne
open cover X =
r⋃
i=1
Ui. Each Ui has the classical topology introduced above.
We know that:
(1) Ui ∩ Uj is open in both Ui and Uj with respect to the classical topology,
(2) by covering Ui∩Uj by aﬃne open subsets, Proposition 1.1 (3) implies that the classical
topology on Ui and Uj induce the same topology on Ui ∩ Uj.
It is now easy to check that in this case there is a unique topology on X such that the
subspace topology on each Ui is the classical topology.
By deﬁnition, a subset U ⊆ X is classically open if U ∩ Ui is open for all i in the classical
topology. Note that each Ui is open in X in this topology.
It is easy to see that:
(1) the deﬁnition is independent of the choice of cover,
(2) Proposition 1.1 extends to an arbitrary complex variety.
Deﬁnition 1.2. We write Xan for the topological space X with the classical topology.
Remarks 1.3.


## Page 4

4 MIRCEA MUSTAT ¸ ˘A
(1) If f : X → Y is a morphism of algebraic varieties, then f : Xan → Y an is continuous.
Indeed, by covering X and Y by aﬃnes, we reduce to X and Y aﬃne. Given closed
immersions
X Cm
Y Cn
f g
there is a polynomial map g that makes the square above commute. Since polynomial
maps are continuous, this proves the assertion.
In particular, regular functions on X are continuous with respect to the classical
topology.
(2) Every points has a countable basis of open neighborhoods in the classical topology.
(3) If X, Y are complex algebraic variety, then (X × Y )an = Xan × Y an in the category of
topological spaces (i.e. the classical topology of X × Y is the product of the classical
topologies on X and Y ).
Indeed, we reduce again to X, Y aﬃne, and using the deﬁnition of classical topol-
ogy, we reduce to X = Cm, Y = Cn — then the claim follows since the Euclidean
topology on Cm+n is the product topology.
Theorem 1.4. If X is an irreducible complex algebraic variety and U ⊆ X is Zariski open,
nonempty, then U is dense in the classical topology.
We will prove this theorem next time.
Corollary 1.5. Let X be a complex algebraic variety and U ⊆ X be Zariski open and dense
in the Zariski topology, then U is dense in the classical topology.
Proof. If X = X1 ∪ · · · ∪ Xr is an irreducible decomposition and U ⊆ X is Zariski dense,
then U ∩ Xi ̸= ∅ for all i. Theorem 1.4 then implies that U ∩ Xi is dense in Xi in the classical
topology, and hence U is dense in X in the classical topology. □
The proof of Theorem 1.4 follows [Mum99].
Proof of Theorem 1.4. Step 1. We may assume that X is aﬃne. Indeed, given an open
aﬃne cover X = U1 ∪ · · · ∪ Ur then U ∩ Ui ̸= 0 for all i, and if we know U ∩ Ui is dense in
(Ui)an, then U is dense in Xan.
Step 2. We apply Noether normalization to get a ﬁnite surjective map
π : X → Cn.
We need to show that given and p ∈ Z = X \ U, we can ﬁne a sequence ym → p with ym ∈ U.
Let u = π(p). Since π is ﬁnite, π(Z) is a closed proper subset of Cn, there exists g ̸= 0 in
C[x1, . . . , xn] such that π(Z) ⊆ V (g).
Consider
R
ϕ
→ C
t ↦→ g(tu + (1 − t)w)


## Page 5

MATH 731: HODGE THEORY 5
where w ∈ Cn is such that g(w) ̸= 0. Since ϕ(0) ̸= 0 and ϕ is a polynomial, ϕ only vanishes
at ﬁnite many points. Thus there is a sequence um → u, g(um) ̸= 0. After passing to a
subsequence, we need to ﬁnd ym ∈ π−1(um) such that ym → y. Since um ̸∈ V (g), ym ∈ U, so
p ∈ U.
Step 3. Finding the ym’s. Recall that we have a map
π : X → Cn ∋ um → u
and we want to ﬁnd elements in ﬁbers over um’s. Write
π−1(u) = {p = p1, p2, . . . , pr}.
Choose g ∈ O(X) such that g(p) = 0 but g(pj) ̸= 0 for j ≥ 2. Since π is ﬁnite, there exists
F ∈ O(Cn)[t] monic such that F (x, g) = 0.
Write
F = td + a1(x)td−1 + · · · + ar(x).
Since O(X) is a domain, we may assume that F is irreducible. The map π factors as
X
Cn+1 ⊇ V (F )
Cn
π
π2
π1
where π2(x) = (π(x), g(x)). Since π is ﬁnite, π2 is also ﬁnite. Since π is surjective, this shows
that π2 is also surjective (otherwise, π2(X) has dimension less than n, and hence so does
π(X)).
Recall that g(p) = 0 and hence ar(u) = 0. Since |ar(x)| is the absolute value of the product
of the roots of F (x, −) and um → u, we can choose tm such that F (um, tm) = 0 for all m
and tm → 0.
Now choose ym ∈ π−1
2 (um, tm) arbitrarily.
We claim that, after passing to a subsequence, we assume thatym converges to some y. Since
π(ym) = um → u, we see that y ∈ π−1(U). Since g(y) = lim g(ym) = lim tm = 0, we have
that y ̸= pj for j ≥ 2. Hence y = p.
We thus just need to prove this claim. Choose generators h1, . . . , hs of O(X) to get a closed
immersion X ↪→ Cs given by (h1, . . . , hs).
We use the fact that each hi satisﬁes a monic equation:
tdi + ai,1(x)tdi−1 + · · · = 0.
We want to show that each ( hi(ym))m≥1 is bounded. Since hi satisﬁes the monic equation
above, we just need to show that the coeﬃcients (ai,j(π(ym)))m≥1 is bounded. Since π(ym) =
um is convergent, it is bounded, and hence ai,j(π(ym)) is bounded for all i, j. □


## Page 6

6 MIRCEA MUSTAT ¸ ˘A
Corollary 1.6. Let X be an algebraic variety over C and W ⊆ X is a constructible1 subset.
Then W
Zar
= W
an
.
Proof. Since the classical topology is ﬁner than the Zariski topology, W
an
⊆ W
Zar
.
Since W is constructible, there exists U ⊆ W such that U is open and dense in W
Zar
.
By Corollary 1.5, U is dense in W
Zar
in the classical topology. This shows that W
Zar
⊆
W
an
. □
Remark 1.7 (Chevalley’s theorem). Let f : X → Y be a ﬁnite morphism. The the image
of a constructible set under f is constructible.
Theorem 1.8. Suppose X is a complex algebraic variety. Then
(1) X is separated if and only if Xan is Hausdorﬀ,
(2) X is complete if and only if Xan is compact2,
(3) if f : X → Y is a morphism of separated varieties, then f is proper (in the algebraic
sense) if and only if f : Xan → Y an is proper (i.e. K ⊆ Y an is compact implies that
f−1(K) is compact).
Proof. We ﬁrst show (1). Recall that, in general, the diagonal map
∆: X → X × X
is a locally closed immersion. By deﬁnition, X is separated if ∆ is a closed immersion, i.e.
∆(X) is closed in X × X (in the Zariski topology).
By Corollary 1.6, ∆( X) is Zariski closed in X × X if and only if it is closed in the classical
topology. But ∆( X) is closed in Xan × Xan if and only if Xan is Hausdorﬀ.
We will now prove (2). Note ﬁrst that ( Pn)an is compact. Indeed, we have a continuous
surjective map from the n-sphere which is compact:

z = (z0, z1, . . . , zn) ∈ Cn+1
⏐⏐⏐⏐⏐⏐
n∑
i=0
|zi|2 = 1


 → (Pn)an.
Suppose now that X is complete. In particular, it is separated, so we know that Xan is
Hausdorﬀ by (1). By Chow’s lemma, there is a surjective (birational) morphism
π : ˜X → X
with ˜X projective, ˜X ↪→ Pn Zariski-closed. Then ( ˜X)an is closed in ( Pn)an, hence compact.
Therefore, π( ˜Xan) = Xan is compact.
Conversely, suppose Xan is compact. In particular, it is Hausdorﬀ and hence X is separated.
We need to show that for every algebraic variety Y , the projection map
X × Y
f
→ Y
is closed in the Zariski topology, i.e. if Z ⊆ X × Y is Zariski-closed, f(Z) is Zariski-closed.
1Recall that a subset is constructible if it is a ﬁnite union of locally closed sets.
2Recall that compact means quasicompact and Hausdorﬀ.


## Page 7

MATH 731: HODGE THEORY 7
By Chevalley’s theorem 1.7, f(Z) is constructible. By Corollary 1.6, f(Z) is Zariski closed
if and only if it is closed in the classical topology. Suppose yn ∈ f(Z) is such that lim
n→∞
yn =
b ∈ Y . Then there exists xn ∈ X such that ( xn, yn) ∈ Z for all n. Since Xan is compact,
after passing to a subsequence, we may assume that xn → a ∈ X. Since Z is Zariski closed
in X × Y , it is closed in the classical topology. Since ( xn, yn) ∈ Z, ( a, b) ∈ Z, and hence
b ∈ f(Z). □
Remark 1.9. A related result is that if X is an irreducible variety over C, then Xan is
connected. We will come back to this when we discuss holomorphic function. A challenge
exercise is to prove this statement directly.
Exercise. Show that if f : X → Y is a morphism of separated algebraic varieties, then f is
proper if and only if f an is proper.
Remark 1.10. From now on, all varieties over C will be assumed to be separated.
2. Holomorphic functions
The reference for this section is [GH94].
2.1. Holomorphic functions in one variable. First, we consider the case of 1-variable
functions.
Setup. Consider an open set U ⊆ C = R2. All functions considered will be smooth ( C∞).
Coordinate functions on U will be denoted by z = x + yi, z = x − yi. We have
dz = dx + idy, d z = dz − idy,
dz ∧ dz = (−2i)dx ∧ dy.
Dually, we have
∂
∂z = 1
2
( ∂
∂x − i ∂
∂y
)
, ∂
∂z = 1
2
( ∂
∂x + i ∂
∂y
)
(this is dual to the basis of diﬀerentials given by dz, dz).
These operators acts on zm by
∂
∂z (zm) = mzm−1, ∂
∂z zm = 0
(by product rule, it is enough to check these for m = 1).
If f : U → C is smooth, we write
d f= ∂f
∂x dx + ∂f
∂y dy = ∂f
∂z dz + ∂f
∂z dz.
Exercise. Check that ∂f
∂z = ∂f
∂z .
Proposition 2.1 (Cauchy’s formula). Let ∆ be an open disc in C. If f is a smooth function
on an open neighborhood of ∆, then
f(z) = 1
2πi
∫
∂∆
f(w)
w − z dw + 1
2πi
∫
∆
∂f
∂w
dw ∧ dw
w − z


## Page 8

8 MIRCEA MUSTAT ¸ ˘A
for all z ∈ ∆.
Remark 2.2.
(1) The loop ∂∆ is oriented counterclockwise.
(2) Part of the statement is that the second integral is well-deﬁned.
(3) We will deﬁne a holomorphic function to be annihilated by ∂
∂z. In particular, the
second integral vanishes when f is holomorphic.
Proof. Let ∆ϵ be a disc of radius 0 < ϵ ≪ 1 around z.
z
∆ϵ
∆
We apply Stokes’ formula for
η = f(w)
w − z dw
on ∆ \ ∆ϵ. Note that
dη = − ∂
∂w
( f(w)
w − z
)
dw ∧ dw.
By the quotient rule and
∂
∂w
( 1
w − z
)
= 0,
we have that
dη = − ∂f
∂w
dw ∧ dw
w − z .
Stokes’ theorem then says that
−
∫
∆\∆ϵ
∂f
∂w
dw ∧ dw
w − z =
∫
∂∆
f(w)
w − z dw −
∫
∂∆ϵ
f(w)
w − z dw.
We evaluate the last integral. We change variables to w = z + ϵeiθ for θ ∈ [0, 2π] and
dw = ϵieiθdθ:
∫
∂∆ϵ
f(w)
w − z dw =
∫ 2π
0
f(z + ϵeiθ)
ϵeiθ ϵieiθdθ = i
∫ 2π
0
f(z + ϵeiθ)dθ.


## Page 9

MATH 731: HODGE THEORY 9
For ϵ → 0, this converges (by the dominated convergence theorem, for example) to
i
∫ 2π
0
f(z)dθ = 2πif (z).
Finally, we deal with the integral on the left hand side of Stokes’ theorem. Again, we change
variables to w = reiθ + z for r ≥ 0 and θ ∈ [0, 2π] and
dw = eiθdr + ireiθdθ,
dw = e−iθdr − ire−iθdθ,
dw ∧ dw = −2irdr ∧ dθ.
Then
dw ∧ dw
w − z = −2ie−iθdr ∧ dθ.
This is integrable on any compact subset of C and∫
∆
∂f
∂w
dw ∧ dw
w − z = lim
ϵ→0
∫
∆\∆ϵ
∂f
∂w
dw ∧ dw
w − z .
This completes the proof. □
Deﬁnition 2.3. A smooth function f : U → C is
• holomorphic if ∂f
∂z = 0 (if f = u + iv, this is equivalent to the Cauchy–Riemann
equations ∂u
∂x = ∂v
∂y , ∂u
∂y = − ∂v
∂x ),
• analytic if for any a ∈ U, there exists an open disc ∆ r(a) centered at a inside U such
that
f(z) =
∑
n≥0
cn(z − a)n
for some cn ∈ C where the convergence is absolute and uniform for z ∈ ∆r(a).
Theorem 2.4. A function f is holomorphic if and only if it is analytic.
Proof. We start with the ‘only if’ implication. Given a ∈ U, let ∆ be a disc centered at a
such that ∆ ⊆ U. Cauchy’s formula 2.1 then shows that
f(z) = 1
2πi
∫
∂∆
f(w)
w − z dw.
We write
f(w)
w − z = f(w)
(w − a) − (z − a) = f(w)
(w − a)
(
1 − z−a
w−a
).
If R is the radius of ∆, we ﬁx a disc ∆ ′ centered at a of radius R′ < R. Then⏐⏐⏐⏐
z − a
w − a
⏐⏐⏐⏐ ≤ R′
R < 1
for z ∈ ∆′. Then
f(w)
w − z =
∑
n≥0
f(w)
(w − a)n+1 (z − a)n


## Page 10

10 MIRCEA MUSTAT ¸ ˘A
converges absolutely and uniformly for z ∈ ∆′ and w ∈ ∂∆. Therefore,
f(z) =
∑
n≥0
cn(z − a)n
is absolutely and uniformly convergence for z ∈ ∆′, where
cn = 1
2πi
∫
∂∆
f(w)
(w − a)n+1 dw.
Hence f is analytic.
For the ‘if’ implication, suppose f is analytic and choose around a ∈ U a small disc ∆ such
that ∆ ⊆ U and
f(z) =
∑
n≥0
cn(z − a)n
converges absolutely and uniformly for z ∈ ∆.
Since ∂P
∂z = 0 for any polynomial P , if Pn is the nth partial sum, by Cauchy’s theorem 2.1,
Pn(z) = 1
2πi
∫
∂∆
Pn(w)
w − z dw,
and hence
f(z) = 1
2πi
∫
∂∆
f(w)
w − z dw.
Therefore:
∂f
∂z = 1
2πi
∫
∂∆
∂
∂z
( f(w)
w − z
)
dw = 0
because the integrand is 0. Hence f is holomorphic. □
Theorem 2.5 (∂-lemma in 1 variable) . Let U ⊆ C and g : U → C be a smooth function.
If ∆ is a disc such that ∆ ⊆ U and we deﬁne
f(z) = 1
2πi
∫
∆
g(w) dw ∧ dw
w − z , for z ∈ ∆,
then f is a smooth function and
∂f
∂z = g on ∆.
Remark 2.6. This theorem will later be used to compute Dolbeaux cohomology. See Lemma
Proof. Given z0 ∈ ∆, choose discs centered at z0 such that ∆′ ⊆ ∆′′ ⊆ ∆ (and the closure
of the previous is contained in the next).


## Page 11

MATH 731: HODGE THEORY 11
z0
∆′
∆′′ ∆
We can write g = g1 + g2 with g1, g2 smooth on U such that
{
g1 = 0 inside ∆ ′,
g2 = 0 outside ∆ ′′.
Consider separately
fi(z) = 1
2πi
∫
∆
gi(w) dw ∧ dw
w − z , for i = 1, 2.
For z ∈ ∆′, f1 is clearly smooth and
∂f1
∂z = 1
2πi
∫
∆
∂
∂z
(g1(w)
w − z
)
dw ∧ dw = 0.
Now note that
f2(z) = 1
2πi
∫
C
g2(w) dw ∧ dw
w − z because g2 = 0 outside ∆′′
=
∫ 2π
0
e−iθ
∫ ∞
0
g2(z + reiθ)drdθ where w = z + reiθ and dw ∧ dw
w − z = −2ie−iθdr ∧ dθ
This implies that f2 is smooth on ∆. After going back via the change of variables, we see
that
∂f2
∂z = 1
2πi
∂g2
∂w · dw ∧ dw
w − z .
Cauchy’s formula 2.1 for g2 then shows that
g2(z) = 1
2πi
∫
∂∆
g2(w)
w − z dw
  
=0 since g2=0 on ∂∆
+ 1
2πi
∫
∆
∂g2
∂w
dw ∧ dw
w − z = ∂f2
∂z
on ∆. Since ∂f1
∂z = 0 = g1 on ∆′, this shows that
∂f
∂z = g on ∆′.


## Page 12

12 MIRCEA MUSTAT ¸ ˘A
This shows that ∂f
∂z = g for any z ∈ ∆. □
Remark 2.7. The proof also shows that if g is a smooth function of U1 × · · · ×Un ⊆ Cn, so
is f. Moreover, if g is holomorphic (separately) in each of z2, . . . , zr, so is f.
2.2. Holomorphic functions in several variables. Let U ⊆ Cn be open with coordinate
functions z1, . . . , zn, zj = xj + iyj.
Deﬁnition 2.8. A smooth function f : U → C is
• holomorphic if it is holomorphic in each variable, i.e.
∂f
∂zi
= 0 on U.
• analytic if for every a ∈ U, there is a polydisc B = Br(a) = {z | |zj −aj| < r for all j}
such that
f(z) =
∑
α∈Nn
cα(z − a)α,
where we use the multiindex notation:
(z − a)α =
n∏
i=1
(zi − ai)αi.
Theorem 2.9. If f : U → C is a smooth function, the following are equivalent:
(1) f is holomorphic,
(2) f is analytic,
(3) for every polydisc ∆ =
n∏
i=1
{zi | | zi − ai| < α i} ⊆ U,
f(z) =
( 1
2πi
)n ∫
|zi−ai|=αi
f(w)
(w1 − z1) . . .(wn − zn) dw1 ∧ · · · ∧ dwn,
where the integral is over the product of circles with product orientation.
Proof. It is clear that if f is analytic, it is analytic in each variable, hence holomorphic in
each variable, i.e. f is holomorphic. This proves that (2) implies (1). To prove (3) implies
(2), we argue as in the proof of Theorem 2.4. We get
f(z) =
∑
β∈Nn
cβ(z − a)β
where
cβ =
( 1
2πi
)n ∫
|zi−ai|=αi
f(w)
(w − 1 − z1)β1+1 . . .(wn − zn)βn+1 dw1 ∧ · · · ∧ dwn.
For (1) implies (3), use Cauchy’s formula 2.1 for holomorphic functions in each variable:
f(z) = 1
2πi
∫
|zn−an|=αn
f(z1, . . . , zn−1, wn)
zn − wn
dwn = · · ·


## Page 13

MATH 731: HODGE THEORY 13
and use that f is continuous and Fubini’s theorem. □
For an open subset U ⊆ Cn, we write
O(U) = {f : U → C | f holomorphic}.
Then the following are true.
• The subset O(U) ⊆ C∞(U) is a C-subalgebra. To prove this, use the fact that ∂
∂zj
are linear (so closed under + and scalar multiplication) and derivations (so closed
under product).
• If f ∈ O (U) and f(z) ̸= 0 for all z ∈ U, then 1
f ∈ O (U). Indeed, ∂
∂zj
satisﬁes the
quotient rule.
Deﬁnition 2.10. A function f = (f1, . . . , fm): U → Cm is holomorphic if all fj are holo-
morphic.
We start by checking that the composition of holomorphic functions is holomorphic.
Identifying Cn = R2n with coordinates z1, . . . , zn and Cm = R2m with coordinates z′
1, . . . , z′
m,
and fj = uj + ivj, we have a map
TpR2n d fp
→ Tf(p)R2m
which can be written explicitly as
∂
∂xj
(p) ↦→
m∑
k=1
∂uk
∂xj
(p) ∂
∂x′
k
(f(p)) +
m∑
k=1
∂vk
∂xj
(p) ∂
∂y′
k
(f(p))
∂
∂yj
(p) ↦→ · · ·
Exercise. Show that after we tensor with C, we have the formulas
∂
∂zj
(p) ↦→
m∑
k=1
∂fk
∂zj
(p) ∂
∂z′
k
(f(p)) +
m∑
k=1
∂fk
∂zj
(p) ∂
∂z′
k
(f(p)),
∂
∂zj
(p) ↦→
m∑
k=1
∂fk
∂zj
(p) ∂
∂z′
k
(f(p)) +
m∑
k=1
∂fk
∂zj
(p) ∂
∂z′
k
(f(p)).
The upshot is that if f is holomorphic, then ∂fk
∂zj
= ∂fk
∂zj
= 0. Therefore
span
(
∂
∂zj
⏐⏐⏐⏐⏐ j
)
→ span
(
∂
∂z′
k
⏐⏐⏐⏐⏐ k
)
span
(
∂
∂zj
⏐⏐⏐⏐⏐ j
)
→ span
(
∂
∂z′
k
⏐⏐⏐⏐⏐ k
)
.


## Page 14

14 MIRCEA MUSTAT ¸ ˘A
Consider maps U
f
→ V
g
→ C. The upshot is that if g is also holomorphic, then g ◦ f is also
holomorphic. In fact, for any g, we have that
∂(g ◦ f)
∂zj
(p) =
m∑
k=1
∂fk
∂z′
j
(
∂g
∂z′
k
◦ g
)
.
This implies that
• if f, g is holomorphic, then g ◦ f is also holomorphic,
• if f is a holomorphic diﬀeomorphism f : U → V (for U, V ⊆ Cn), g ◦f is holomorphic,
and the matrix
(
∂fi
∂zj
)
i,j
is invertible at every point, then g is holomorphic.
Moreover, if both f and g : V → C are holomorphic, then
∂(g ◦ f)
∂zj
=
∑
k
∂fk
∂zj
(
∂gk
∂z′
k
◦ g
)
.
Remark 2.11. We only assume that g : V → C to simplify the notation. The above asser-
tions also hold for g : V → Cp in general.
Let U ⊆ Cn and f : U → Cn. The next goal is to prove the inverse function theorem.
We want to compare the real Jacobian of f with det
(
∂fj
∂zj
)
, and deduce it from the inverse
function theorem for smooth functions.
Write f = ( f1, . . . , fn) and ( z1, . . . , zn) for the variables on U and Cn. One can compute
that:
f∗(dx1 ∧ dy1 ∧ · · · ∧ dxn ∧ dyn) =


determinant of
real Jacobian
of f

 dx1 ∧ dy1 ∧ · · · ∧ dxn ∧ dyn,
dzj ∧ dzj = (dxj + idyj) ∧ (dxj − idyj) = (−2i)dxj ∧ dyj,
and hence (after tensoring with C):
f∗(dz1 ∧ dz1 ∧ · · · ∧ dzn ∧ dzn) =


determinant of
real Jacobian
of f

 dz1 ∧ dz1 ∧ · · · ∧ dzn ∧ dzn.
The left hand side is equal to
d f1 ∧ df1 ∧ · · · ∧ d fn ∧ dfn.
Recall that
d f=
∑
j
(
∂f
∂xj
dxj + ∂f
∂yj
dyj
)
=
∑
j
(
∂f
∂zj
dzj + ∂f
∂zj
dzj.
)
.
In particular, if f is holomorphic, then each fk is holomorphic, and hence
d fk =
n∑
j=1
∂fk
∂zj
dzj,


## Page 15

MATH 731: HODGE THEORY 15
dfk =
n∑
j=1
∂fk
∂zj
dzj.
Finally, this shows that
d f1 ∧ df1 ∧ · · · ∧ d fn ∧ dfn =
(
det ∂fj
∂zk
) (
det ∂fj
∂zk
)
dz1 ∧ dz1 ∧ · · · ∧ dzn ∧ dzn
=
⏐⏐⏐⏐det ∂fj
∂zk
⏐⏐⏐⏐
2
dz1 ∧ dz1 ∧ · · · ∧ dzn ∧ dzn
The overall conclusion is that


determinant of the
real Jacobian
matrix of f

 =
⏐⏐⏐⏐⏐⏐
determinant of the
complex Jacobian
matrix of f
⏐⏐⏐⏐⏐⏐
2
.
In particular:
• the left hand size is ≥ 0,
• the left hand size is = 0 if and only if the right hand side is.
Theorem 2.12 (Holomorphic inverse function theorem). If U ⊆ Cn is open and f : U → Cn
is holomorphic. Then for p ∈ U such that det
(
∂fi
∂zj
(p)
)
̸= 0, there are open neighborhoods
U′ ⊆ U of p and V′ ⊆ Cn of f(p) such that f gives a bijective map U′ → V′ and its inverse
is holomorphic.
Proof. By the previous discussion, the hypothesis implies that the determinant of the real
Jacobian of f is nonzero at p. The inverse function theorem for smooth maps implies that
there are open subsets U′, V′ as above such that U′ f
→ V′ is bijective and its inverse is
smooth. We may assume that det
(
∂fj
∂zk
)
̸= 0 on U′, and hence g is holomorphic on V since f
and g ◦ f are. □
Remark 2.13.
(1) If f : U → C is holomorphic, then ∂|α|f
∂z α is holomorphic for all α (since ∂
∂zj
and ∂
∂zk
commute).
(2) If a ∈ U is such that ∂|α|
∂z α (a) = 0 for all α, then f ≡ 0 in a neighborhood of a. Indeed,
if B = {z | | zi − ai| < ϵ for all i} is such that B ⊆ U, then
f(z) =
( 1
2πi
)n ∫
|zi−ai|=αi
f(w)
(w1 − z1) . . .(wn − zn) dw1 ∧ · · · ∧ dwn,
and using this we got ∑
α∈Nn
cα(z − a)α


## Page 16

16 MIRCEA MUSTAT ¸ ˘A
for z ∈ B, where
cα =
( 1
2πi
)n ∫
|zi−ai|=αi
f(w)
(w − 1 − z1)α1+1 . . .(wn − zn)αn+1 dw1 ∧ · · · ∧ dwn
= 1
α!
∂|α|f
∂z α (a)
= 0.
Proposition 2.14. Suppose f : U → C is holomorphic and U is connected. If f = 0 on
some V ⊆ U open, then f = 0.
Proof. Let U′ = {z ∈ U | f = 0 on some open neighborhood of z}. This set is non-empty
by hypothesis and clearly open. It is enough to show that it is closed. If zn ∈ U′ converges
to a, then for every α
∂|α|
∂z α (zn) = 0
and hence
∂|α|
∂z α (a) = 0.
This holds for all α, so f = 0 in a neighborhood of a. Thus a ∈ U′. □
The next goal is to state and prove the maximum modulus principle.
Theorem 2.15 (Maximumu modulus principle) . If U ⊆ Cn is open and connected, and
f : U → C is a holomorphic function such that |f | has a local max at a ∈ U, then f is
constant.
Proof. By Proposition 2.14, it is enough to show that there is an open neighborhood U0 of
a such that f is constant on U0.
We ﬁrst reduce to the case n = 1. Take U0 to be an polydisc containing a,
U0 = {z | | zi − ai| < ϵ for all i}.
For any z ∈ U0, consider the 1-variable function
C ∋ w ↦→ f(wa + (1 − w)z) ∈ C for |wai − (1 − w)zi − ai| < ϵ.
This function is deﬁned on an open subset of C containing 0 and 1. It is a holomorphic
function and its has absolute value has a local maximum at w = 1. The 1-variable case then
implies that this is constant, and hence f(z) = f(a).
We now prove the theorem for n = 1. Let ∆ = BR(a) be a disc centered at a such that
∆ ⊆ U. Cauchy’s formula 2.1 implies that
f(a) = 1
2πi
∫
∂∆
f(w)
w − a dw = 1
2πi
∫ 1
0
f(a + Re2πiθ)
Re2πiθ Re2πiθ · 2πi dθ =
∫ 1
0
f(a + Re2πiθ) dθ


## Page 17

MATH 731: HODGE THEORY 17
where w = a + Re2πiθ. Therefore,
|f(a)| ≤
∫ 1
0
|f(a + Re2πiθ)|  
≤|f(a)|
dθ
(∗)
≤ | f(a)|
∫ 1
0
dθ = |f(a)|,
assuming that |f(z) ≤ |f(a)| in a neighborhood of ∆ (this is true for R small enough). There-
fore, the above inequalities are all equalities. Since ( ∗) is an equality and f is contunuous,
we conclude that |f(z)| = |f(a)| for all z ∈ ∂∆.
The same holds for any 0 < R′ ≤ R, so |f(z)| is constant in an open neighborhood of a. □
Exercise. Show that if f = u+iv is holomorphic on some open connected subset and u2+v2
is constant, then f is constant. (Apply ∂
∂x , ∂
∂y , and Cauchy–Riemann equations.)
3. Complex manifolds
If U ⊆ Cn is an open subset, consider the sheaf OU of C-algebras on U deﬁned by
OU(V ) = {f : V → C | f holomorphic}.
We check that this is indeed a sheaf:
(1) have restriction maps: if V1 ⊆ V2 and f is holomorphic on V2, then f is holomorphic
on V1,
(2) if V = ⋃Vi and ϕi : Vi → C are holomorphic functions such that ϕi|Vi∩Vj = ϕj|Vi∩Vj,
then there exists a unique ϕ: V → C such that ϕ|Vi = ϕi for all i; indeed, if ϕ is such
that ϕ|Vi is holomorphic for all i, ϕ is holomorphic.
Deﬁnition 3.1. A complex manifold of dimension n is a pair ( X, OX) where
(1) X is a topological space, assumed Hausdorﬀ and having a countable basis of open
subsets,
(2) OX ⊆ C X,C is a subsheaf of the sheaf of continuous C-valued functions on X,
such that X can be written as
X =
⋃
i
Ui, U i ⊆ X open
such that each ( Ui, OUi) ∼= (Vi, OVi) for some Vi ⊆ Cn is open with OVi is the sheaf of
holomorphic functions on Vi.
Remark 3.2. Suppose V1, V2 ⊆ Cn are open and f : (V1, OV1) → (V2, OV2) is an isomorphism,
i.e. a homeomorphism f : V1 → V2 which induces an isomorphism of sheaves: for all U ⊆ V2,
O(V2)
∼=→ O(f−1(V2)),
ϕ ↦→ ϕ ◦ f.
This forces f and f−1 to be holomorphic functions. The converse is also true.
Deﬁnition 3.3.
(1) If ( X, OX) is a complex manifold, the section of OX are the holomorphic functions
on X.


## Page 18

18 MIRCEA MUSTAT ¸ ˘A
(2) If ( X, OX) and ( Y, OY ) are complex manifolds, then a holomorphic map
(X, OX)
f
→ (Y, OY )
is a continuous map f : X → Y that induces a map of sheaves, i.e. for any V ⊆ Y
open and ϕ ∈ O Y (V ), we have that ϕ ◦ f ∈ O(f−1(V )).
Remark 3.4. If X ⊆ Cn and Y ⊆ Cm are open subsets, this coincides with the previous
deﬁnition.
Remark 3.5. If U ⊆ Cn, p ∈ U,
OCn,p = lim− →V∋p
OU(V ).
To check that this is a local ring, we note that we have a map
OU,p = lim− →V∋p
OU(V ) ↠ C
(V, ϕ) ↦→ ϕ(p)
whose kernel {(V, ϕ) | ϕ(p) = 0} = m is the unique maximal ideal. Indeed, if ( V, ϕ) ̸∈ m, we
may assume that ϕ(z) ̸= 0 for all z ∈ V , and hence 1
ϕ ∈ O (V ). Hence ( OU,p, m) is a local
ring.
Remark 3.6. All such local rings for manifolds of ﬁxed dimension are isomorphic. This is
very diﬀerent from the algebraic case.
Remark 3.7. One can deﬁne complex manifolds using atlases: X is a topological space
with suitable properties and X = ⋃
i
Ui is an open cover together with homeomorphisms
ϕi : Ui
∼=→ Vi ⊆ Cn, where Vi ⊆ Cn are open, such that for all i, j the map
ϕi(Ui ∩ Uj)
ϕj◦ϕ−1
i
→ ϕj(Ui ∩ Uj)
is biholomorphic.
We identify two such objects ( X, A), (X, A′) if A and A′ are compatible.
Remark 3.8. It is clear from the deﬁnition via atlases (Remark 3.7), using that holomorphic
maps Cm ⊇ U → Cn are smooth, that every complex manifold of dimension n has an
underlying real smooth manifold structure of dimension 2 n. To avoid confusion, we will
write XR for this real smooth manifold (if necessary). We have an inclusion of sheaves
OX ⊆ C∞
X,C.
Next, we will discuss:
• vector bundles in the smooth/holomorphic category,
• submanifolds,
• complex manifold associated to a smooth complex algebraic variety.


## Page 19

MATH 731: HODGE THEORY 19
3.1. Vector bundles. If M is a smooth real manifold, a real (or complex) vector bundle of
rank r on M is a smooth manifold E with a smooth map E → M such that for any x ∈ M,
π−1(x) has the structure of a vector space over R (respectively C)of dimension r such that
there is an open cover M = ⋃
i
Ui such that we have isomorphisms
π−1(Ui) Ui × Rr (resp. Ui × Cr)
Ui
∼=
(respectively, Ui × Cr), inducing linear maps on the ﬁbers.
Given such E, we get a sheaf E on M such that
E(U) = {s: U → E smooth | π ◦ s = 1U }.
This gives an equivalence of categories
{
real (complex) vector bundles
on M (of rank r)
}
↔
{ locally free sheaves (of rank r)
of C∞
M,R-modules (C∞
M,C-modules)
}
.
We will consider the corresponding notion in the category of complex manifolds. Forcomplex
vector bundles, we assume that E is a complex manifold, π is holomorphic.
These correspond to locally free sheaves of OM-modules. Note that associated to such E,
we will have: sheaves of smooth sections and sheaves of holomorphic sections.
Deﬁnition 3.9. Let X be a complex manifold of dimension n. A closed submanifold of
X of codimension r is a closed subset Y ⊆ X such that for all p ∈ Y , there is a chart
p ∈ U
ϕ
→∼=
V ⊆ Cn such that
ϕ(U ∩ Y ) = {z ∈ V | z1 = · · · = zr = 0}.
It is easy to see that by restricting such charts to Y , we get a holomorphic atlas on Y ,
making it a complex manifold of dimension n − r.
The universal property of submanifolds is: given a holomorphic g : Z → X such that g(Z) ⊆
Y , there is a unique holomorphic map g′ : Z → Y such that incl ◦ g′ = g.
Proposition 3.10. If U ⊆ Cn is open and f1, . . . , fr ∈ O(U) are such that
rank
(
∂fi
∂zj
(p)
)
= r ≤ n
for all p ∈ U, then
Y = {z ∈ U | f1(z) = f2(z) = · · · = fr(z) = 0}
is a closed submanifold of U of codimension r.


## Page 20

20 MIRCEA MUSTAT ¸ ˘A
Proof. Given p ∈ Y , we may assume that rank
(
∂fi
∂zj
(p)
)
1≤i,j≤n
̸= 0. Deﬁne
ϕ: U → Cn,
z ↦→ (f1(z), . . . , fr(z), zr+1, . . . , zn).
Then
det
(
∂ϕi
∂zj
(p)
)
̸= 0
and we apply the Inverse Function Theorem 2.12 to see that ϕ is biholomorphic in some
neighborhood of p. In the neighborhood, ϕ is the desired chart. □
Basic properties of holomorphic functions we discussed extend to this setting. We recall a
few of them for completeness. Let X be a complex manifold.
(1) If f ∈ O (X) is such that f |U = 0 for some U ⊆ X open, and X is connected, then
f = 0.
(2) (Maximum modulus principle) If f ∈ O (X) is such that |f | has a local max, X is
connected, then f is constant.
Corollary 3.11. If X is a compact connected complex manifold, then Γ(X, OX) = C.
Proof. Since X is compact, for any f ∈ O (X), |f | has a maximum. Then the maximum
modulus principle implies that f is constant. □
3.2. The complex manifold associated to a smooth complex algebraic variety. Let
X be a smooth complex algebraic variety of pure dimension n. Choose an aﬃne open subset
U ⊆ X and let U ↪→ CN be a closed immersion, r = N − n. Since U and CN are smooth, can
cover CN by open subsets Vi (in the Zariski topology) such that if Vi ∩ U ̸= then Vi ∩ U ↪→ Vi
is cut out by r equations f1, . . . , fr ∈ O(Vi) with
rank
(
∂fi
∂zj
(p)
)
= r
for all p ∈ Vi ∩ U.
Applying Proposition 3.10, each Vi ∩ U ↪→ Vi is a closed complex submanifold of codimen-
sion r.
Exercise. Check that the resulting transition maps are holomorphic, using the fact that
rational maps are holomorphic.
Exercise. Show that if f : X → Y is a morphism between smooth complex algebraic vari-
eties, then the induced map Xan → Y an is holomorphic.
We now discuss an application.
Theorem 3.12. If X is a connected complex algebraic variety, then Xan is connected.
We ﬁrst prove this theorem when X is a smooth connected projective curve over C.


## Page 21

MATH 731: HODGE THEORY 21
Proof when X is a smooth, projective curve. We ﬁrst prove this when X is a smooth con-
nected projective curve over C. We know that Xan is a 1-dimensional complex manifold,
which is compact since X is complete (by Theorem 1.8).
Suppose that Xan = U ∪ V is a disjoint union with U, V open in Xan and nonempty. Take
P ∈ U. If n ≫ 0 ( n ≥ 2 · genus(X)), OX(nP ) is globally generated. Then there exists
s ∈ Γ(X, OX(nP )) which does not vanish at P . Then
nP ∼ Q1 + · · · + Qn for Qi ̸= P
so there exists ϕ ∈ C(X)∗ such that div( ϕ) = ( Q1 + · · · + Qn) − nP , so ϕ gives a regular
function X\{P } → C. Note that it is holomorphic. By restricting to V , we get a holomorphic
map V
g=ϕ|V
→ C. Since V is a compact complext manifold, g is constant by Corollary 3.11. In
particular, ϕ takes the same value inﬁnitely many times, soϕ is constant, and hence ÷ϕ = 0.
This is a contradiction. □
To reduce the general case to dim X = 1, we use the following result.
Proposition 3.13. Let X be an algebraic variety over k = k. For any x1, x2 ∈ X, there is
an irreducible curve C ⊆ X such that x1, x2 ∈ C.
Proof. We may assume that n = dim X ≥ 2.
(1) By Chow’s lemma, there is a surjective morphism π : ˜X → X where ˜X is irreducible
and quasi-projective. If ˜x1, ˜x2 lie above x1, x2, it is enough to ﬁnd a curve ˜C on ˜X
through ˜x1, ˜x2 and take C = π(C). We may hence assume X is quasi-projective.
(2) Choose a locally closed immersion X ↪ → PN. It is enough to prove the statement
for X. We may hence assume that X is projective.
Consider the blow up of X at {x1, x2}:
Y = Bl{x1,x2}X Ei = p−1(xi)
X
p
where dim Ei = n − 1.
The variety Y is projective since X is, so we may choose an embedding Y ↪ → PN. Cut Y
with n − 1 general hyperplane H1, . . . , Hn−1. Since dim Ei = n − 1,
Ei ∩ H1 ∩ · · · ∩ Hn−1 ̸= ∅ for i = 1, 2.
If Z = Y ∩ H1 ∩ · · · ∩ Hn−1, the curve C = p(Z) satisﬁes the requirements. Using Bertini’s
Theorem: a general hyperplane section of an irreducible projective variety of dimension ≥ 2
is irreducible, and hence Z is irreducible.
We need to assume that dim( Z ∩ Ei) = 0 for i = 1 , 2. This is okay since the His are
general. □
We can now ﬁnish the proof of Theorem 3.12.


## Page 22

22 MIRCEA MUSTAT ¸ ˘A
Proof of Theorem 3.12. We just have to reduce to the smooth, projective curve case from
the general case.
First, we may assume that X is irreducible (since by hypothesis we can go from any irre-
ducible component to any other one via points of intersection).
For an irreducible algebraic variety X over k = k, for any x, y ∈ X, there is an irreducible
curve C such that x, y ∈ C by Proposition 3.13. We may hence assume that X is an
irreducible curve.
If ˜X → X is the normalization, it is enough to show that ˜Xan is connected. We may hence
assume that X is smooth.
Finally, let X ⊆ X where X is a smooth, projective, connected curve. We showed last time
that X
an
is connected.
We now use that if M is smooth real manifold of dimension ≥ 2, p ∈ M, and M is connected,
then M \ {p} is also connected.
Indeed, if M \ {p} = U ∪ V is a disjoint union of open non-empty sets, then p ∈ U ∩ V
because M is connected. Choose a neighborhood W of p such that W is isomorphic to a ball.
Then W \ {p} is disconnected. This is a contradiction, since it is clearly path-connected. □
3.3. More examples of complex manifolds. Suppose X is a complex manifold and G is
a group acting on X via holomorphic maps. Suppose
(1) for all x ∈ X, there exists an open neighborhood U ∋ x such that U ∩ gU ̸= ∅ implies
g = e (this is sometimes called a properly discontinuous action),
(2) for all x, y ∈ X such that x, y are not in the same orbit, there exist open neighbor-
hoods U ∋ x, V ∋ y such that gU ∩ V = ∅ for all g.
Note that (1) implies that the quotient map π : X → X/G is a covering space. Moreover,
since the transition maps are holomorphic, there is a unique complex manifold structure on
X/G such that π is holomorphic. Condition (2) implies that X/G is Hausdorﬀ.
Example 3.14 (Complex tori). Let V be an n-dimensional complex vector space and Λ ⊆ V
be a lattice (i.e. a free abelian group of rank 2 n such that Λ ⊗Z R ∼= V ). The natural action
of Λ by translations satisﬁes (1) and (2) above, and hence
V
π
→ Z = V /Λ
gives a complex manifold Z. Note that
V /Λ ∼= R2n/Z2n ∼= (S1)2n,
and hence topologically, Z is a 2 n-dimensional torus.
When n = 1, the resulting Z is an analytic construction ofelliptic curves, which are algebraic.
We will see that for n ≥ 2, most of these do not come from algebraic varieties. However,
they are still K¨ ahler manifold.
Example 3.15 (Hopf surface). Consider the action of Z on C2 \{(0, 0)}, where the generator
γ of Z acts by (z1, z2) ↦→ (2z1, 2z2).


## Page 23

MATH 731: HODGE THEORY 23
This clearly satisﬁes conditions (1) and (2), so we get a complex manifold structure on the
quotient.
We have a diﬀeomorphism:
C2 \ {(0, 0)}
∼=→ S3 × R
(z1, z2) ↦→
(
1√
|z1|2 + |z2|2
(z1, z2), log
√
|z1|2 + |z2|2
)
under which the action of γ translates to
(u, t) ↦→ (u, t + log 2).
Therefore, the Hopf surface is topologically
C2 \ {(0, 0)}/Z ∼= S3 × S1.
We will later see these manifolds are not even K¨ ahler, and hence do not come from algebraic
surfaces.
3.4. Orientation. If V is a 1-dimensional real vector space, an orientation on V is a choice
of element in V /R∗
>0. Note that an orientation of V is the same as an orientation of V∗.
If V is an n-dimensional vector space, an orientation on V is an orientation on Λ nV .
If X is a smooth real manifold and E is a real vector bundle on X, an orientation on E
is a compatible system of orientations on E(x) for all x ∈ X, i.e. locally have trivializations
π−1(U) ∼= U × Rr where π : E → X, preserving the orietations on the ﬁbers.
Note that an orientation on E corresponds to an orientation on E∗.
Deﬁnition 3.16. An orientation on a smooth real manifold X is an orientation on the
tangent bundle T X (or equivalently on the cotangent bundle T∗X).
Giving an orientation is equivalent to giving a system of charts such that for all transition
maps
f = (f1, . . . , fn): U → Rn, det ∂fi
∂xj
> 0.
Note that if X is a complex manifold and we consider the smooth manifold structure, we
saw that if we take a system of holomorphic charts, then for the transition maps f =
(f1, . . . , fn): U → Cn where U ⊆ Cn,
det(real Jacobian) =
⏐⏐⏐⏐⏐det ∂fi
∂zj
⏐⏐⏐⏐⏐
2
> 0.
Therefore, we have a canonical orientation on X.
By convention: given chart f : U → Cn, the orrientation on U corresponds to the orientation
on Cn given by the top form dx1 ∧ dy1 ∧ · · · ∧ dxn ∧ dyn.


## Page 24

24 MIRCEA MUSTAT ¸ ˘A
3.5. The analytic space associated to an algebraic variety. We ﬁrst discuss the local
model. For U ⊆ Cn open in the classical topology, f1, . . . , fr ∈ O(U), consider
Z = {u ∈ U | f1(u) = · · · = fr(u) = 0}.
Consider on Z the sheaf given by
OZ(V ) = {f : V → C | locally f extends to a holomorphic function on an open subset in Cn}.
If Z
j
↪→ U is the inclusion, we get a map
OU ↠ j∗OZ
and the kernel is IZ/U given by
Γ(V, IZ/U) = {f : V → C | f |V∩Z = 0}.
Note that ( Z, OZ) is a locally ringed space.
Deﬁnition 3.17. A (reduced) analytic space is a locally ringed space ( X, OX) such that
(1) X is a Hausdorﬀ topological space with a countable basis for the topology,
(2) there is an open cover X = ⋃
i
Wi such that each (Wi, OWi) is isomorphic as a locally
ringed space to a local model as above.
The sections of OX are called holomorphic functions on X.
Deﬁnition 3.18. A holomorphic map between analytic spaces ( X, OX) and ( Y, OY ) is a
continuous map f : X → Y such that for any V ⊆ Y open and ϕ ∈ O Y (V ), we have
ϕ ◦ f ∈ O X(ϕ−1(V )).
Examples 3.19.
(1) Every complex manifold is canonically an analytic space.
(2) If X is a separated algebraic variety, we have a sheaf OX an on Xan that makes it an
analytic space. We do it locally. Choose aﬃne open subsets covering X; each such
open subspace covering U has a closed immersion U ↪→ CN (cut out by ﬁnitely many
polynomials), so we have a sheaf OU an on U an making it an analytic space. It is easy
to check that these sheaves are compatible on intersections, so we get a sheaf OX an
on Xan.
We get in this way a functor
{complex algebraic varieties} → { analytic spaces}.
However, in this class, we deal with smooth varieties, and hence we only have to work with
complex manifolds.
3.6. Comparison results. Let X be a complex algebraic variety. As we saw above, it has
an associated analytic space Xan.
We have a morphism of locally ringed spaces:
(ϕ, ϕ#): (Xan, OX an) → (X, OX)


## Page 25

MATH 731: HODGE THEORY 25
deﬁned by ϕ(x) = x and
ϕ# : OX → ϕ∗OX an
OX(U) → O X an(U)
f ↦→ f
(since every regular function on U is holomorphic). The corresponding ring homomorphism
OX,x → O X an,x is a local homomorphism.
Given an OX-module F, let
F an = ϕ∗(F) = ϕ−1(F) ⊗ϕ−1(OX) OX an,
which is an OX an-module.
In particular, for every x ∈ X, we have a canonical isomorphism
(F an)x ∼= Fx ⊗OX,x OX an,x.
We will see later that OX an,x is a Noetherian ring and the morphism OX,x → O X an,x is ﬂat.
In particular, this will imply that the functor F ↦→ F an is exact.
Note that we have canonical maps:
• HomOX(F , G) → HomOXan(F an, Gan),
• H i(X, F) → H i(Xan, F an),
• more generally, Exti
OX(F , G) → Exti
OX(F an, Gan).
Theorem 3.20 (GAGA, part 1). If X is a complete variety, then the functor F ↦→ F an is
fully faithful on coherent sheaves. Moreover, for all F , G coherent, the map
Exti
OX(F , G) → Exti
OX(F an, Gan)
is an isomorphism.
The theorem is due to Serre when X is projective and due to Grothendieck when X is
complete. There is also a relative version for proper morphisms. We will prove this theorem
only when X is projective.
The category which is the target of this functor (i.e. which F an belongs to) still have to be
deﬁned.
Deﬁnition 3.21. In general, if ( X, OX) is a locally ringed space, an OX-module, F is
locally ﬁnitely generated if for any x ∈ X, there is an open neighborhood U ∋ x and
s1, . . . , sn ∈ F (U) such that
s1,y, . . . , sn,y ∈ F y
generate Fy over OX,y for all y ∈ U.
Deﬁnition 3.22. An OX-module F is coherent if
• it is locally ﬁnitely generated,
• for every open subset U ⊆ X, s1, . . . , sr ∈ F (U), the kernel of the induced map
ker(O⊕r
U → F )
is locally ﬁnitely generated.


## Page 26

26 MIRCEA MUSTAT ¸ ˘A
Exercise. Check that on algebraic varieties, this coincides with the deﬁnition in Hartshorne
[Har77].
Theorem 3.23 (Oka). If X is an analytic space, then OX is coherent. (In particular, also
locally free OX-modules of ﬁnite rank are coherent)
If X is an algebraic variety over C, then any coherent sheaf on F on X has a ﬁnite presen-
tation, so F an is coherent.
Theorem 3.24 (GAGA, part 2). If X is complete, the functor
{coherent OX-modules} → { coherent OX an-modules}
F ↦→ F an
is an equivalence of categories.
Remark 3.25. In particular, in this case we have an equivalence of categories
{locally free OX-modules} → { locally free OX an-modules}.
To show that F is locally free if F an is, use the fact that OX,x → O X an,x is faithfully ﬂat.
Remark 3.26.
(1) In general, ( OX)an = OX an.
(2) If X is a complex algebraic variety and E
π
→ X is an algebraic vector bundle with
sheaf of sections E, the holomorphic vector bundle Ean πan
→ Xan has the sheaf of
sections Ean.
(3) Applying the theorem for coherent ideal sheaves, in the setting of the theorem, every
closed analytic subspace of Xan is equal to Y an for some closed subvariety Y ⊆ X.
(When X = PN, this was known as Chow’s Theorem.)
(4) Using (3) and the graph, any morphism f : Xan → Y an comes from a morphism
X → Y . Therefore, the functor
{complete algebraic varieties} → { compact analytic spaces }
X ↦→ Xan.
3.7. The ring OCn,0.
Deﬁnition 3.27. An element f ∈ CJz1, . . . , znK is convergent if there is an R such that
f =
∑
α∈Nn
aαzα
converges uniformly and absolutely for |zi| < R for all i. We write
C{z1, . . . , zn} = {f ∈ CJz1, . . . , znK | f is convergent} ⊆ CJz1, . . . , znK.
It is easy to check that f = ∑aαzα is convergent if and only if there exists R > 0 such that
{|aα|R|α}α is bounded. This is also equivalent to
lim sup
|α|→∞
|aα|1/|α| < ∞
(by the Cauchy-Hadamard Theorem).


## Page 27

MATH 731: HODGE THEORY 27
We have a map
OCn,0 → CJz1, . . . , znK
f ↦→
∑
α∈Nn
aαzα where aα = 1
α!
∂|α|f
∂z α (0).
Here OCn,0 is the ring of germs of holomorphic functions at 0. Recall that if f is holomorphic
at 0, then
f(z) =
∑
α∈Nn
1
α!
∂|α|f
∂z α (0)zα
converges absolutely and uniformly in a neighborhood of 0. By deﬁnition, the image of the
above map is hence
C{z1, . . . , zn}
and it is clear it is injective. Moreover, it is clearly a ring homomorphism.
Conclusion. If p ∈ M where M is a complex manifold, then
OM,p ∼= C{z1, . . . , zn}
where n = dim X.
The next goal is to show thatC{z1, . . . , zn} is Noetherian. The idea is to proceed by induction
and the key ingredient is the Weierstrass Preparation Theorem.
Deﬁnition 3.28. A Weierstrass polynomial with respect to zn is an element of C{z1, . . . , zn}
of the form
zd
n + a1(z1, . . . , zn−1)zd−1
n + · · · + ad(z1, . . . , zn−1)
such that a0(0) = 0 for 1 ≤ i ≤ d.
Theorem 3.29 (Weierstrass Preparataion Theorem) . Given f ∈ C{z1, . . . , zn} such that
f(0, . . . ,0, zn) ̸= 0, there exist unique g, h ∈ C{z1, . . . , zn} such that h(0) ̸= 0, g is a Weier-
strass polynomial, and
f = g · h.
Remark 3.30.
(1) If n = 1 and f ∈ C{z}, f ̸= 0, then
f = zdh
where h(0) ̸= 0. Weierstrass Preparation Theorem 3.29 is a generalization of this
statement to more variables.
(2) Note that (1) implies that (still for n = 1) if f ∈ O (U), the zeroes of f do not
accumulate in U.
(3) The condition that f(0, . . . ,0, zn) ̸= 0 can always be achieved (if f ̸= 0) by a linear
change of variables.
Recall (a special case of) the Residue Theorem. Suppose f ∈ O(U \ {a1, . . . , ar}) and there
is a disc ∆ ⊆ U such that ai ∈ ∆.


## Page 28

28 MIRCEA MUSTAT ¸ ˘A
a1
a2
ar
∆ = open disc
Then
1
2πi
∫
∂∆
ϕ(z)dz =
r∑
i=1
Resai(ϕi)
In fact, we will only need this when ϕ is meromorphic at ai with pole of order ≤ 1. Using
d(ϕ(z)dz) = 0 and Stokes’ Theorem, we can reduce the computation of the integral to the
case r = 1 by cutting out small discs around a1, . . . , ar.
a1
a2
ar
∆ = open disc
In this case, we may write ϕ = ψ
z−a and then Res a(ϕ) = ψ(a). Then
1
2πi
∫
|w−a|=r
ψ(w)
w − a dw = ψ(a)
by Cauchy’s formula 2.1.
In our case, we will take f ∈ O(U), ∆ ⊆ U, and consider
1
2πi
∫
∂∆
zj f′(z)
f(z) dz
where f has no zeroes on ∂∆. Suppose a is a zero of f and write f = (z − a)mh, h(a) ̸= 0.
Then
zj f′(z)
f(z) = zj
( m
z − a + h′
h
)


## Page 29

MATH 731: HODGE THEORY 29
which implies that
Resazj f′(z)
f(z) = maj.
Overall, the conclusion is that:
(1) 1
2πi
∫
∂∆
zj f′(z)
f(z) dz = λj
1 + · · · + λj
m
if λ1, . . . , λm are the roots of f in ∆, listed with multiplicity.
Proof of Weierstrass Preparation Theorem 3.29. Let z′ = (z1, . . . , zn−1) and write
fz′(zn) = f(z′, zn)
where f is a holomorphic function on Cn ⊇ U ∋ 0. Let ϵn > 0 be such that
f(0, . . . ,0, zn) ̸= 0 for 0 < |zn| ≤ ϵn.
Choose ϵ′ > 0 such that if z′ satisﬁes that if |zi| < ϵ′ for 1 ≤ i ≤ n − 1 and |zn| = ϵn, then
f(z′, zn) ̸= 0, and
{z | | zi| < ϵ′ for i ≤ n − 1, |zn| < ϵ n} ⊆ U.
Otherwise, one can choose zi → 0 such that f(z′, zn) = 0 and continuity of f will contradict
the way we chose ϵn.
Given z′ such that |zi| < ϵ′ for i ≤ n − 1, let
λ1(z′), . . . , λm(z′)
be the zeroes of fz′ in
{zn | | zn| < ϵ n},
listed with multiplicities. By equation (1),
m∑
i=1
λi(z′)j = 1
2πi
∫
|w|=ϵn
wj ·
∂f
∂zn
(z′, w)
f(z′, w) dw.
Note that the right hand side is a holomorphic function as a function of z′. For j = 0, the
left hand side is an integer, and hence constant. This shows that
m = ordznf(0, . . . ,0, zn)
by taking z′ = 0.
If σ1(z′), . . . , σm(z′) are the symmetric functions of λ1(z′), . . . , λm(z′), then each σi is holo-
morphic for |zj| < ϵ′, j ≤ n − 1 and σi(0) = 0 for 1 ≤ i ≤ m. Let
g = zm
n − σ1(z′)zm−1
n + · · · + (−1)mσm(z′)
which is a Weierstrass polynomial.
It is clear that the function f
g is well-deﬁned and holomorphic in
{z | | zj| < ϵ′ for j ≤ n − 1, |zn| < ϵ n} \ {g = 0}.
For every z′, f(z′, −)
g(z′, −) extends to a holomorphic function of zn for |zn| < ϵ n.


## Page 30

30 MIRCEA MUSTAT ¸ ˘A
Exercise. Check that therefore h = f
g is in fact holomorphic in a neighborhood of 0 and
h(0) ̸= 0.
This proves existence.
Uniqueness is straightforward. If f = g′ · h′ as in the theorem and g′ = zd′
n + · · ·, we see that
f(0, . . . ,0, zn) = zd′
n · h(0, . . . ,0, zn) which implies that d′ = m. For every z′, f(z′, −) has
d roots in |zn| < ϵ n, so g′(z′, −) vanishes on these with the right multiplicities. For degree
reasons, this implies that g′ = g. □
Corollary 3.31. For any n, C{z1, . . . , zn} is Noetherian.
Proof. We proceed by induction on n ≥ 0. When n = 0, this ring is a ﬁeld, which is
Noetherian. Suppose I ⊆ C{z1, . . . , zn}, I ̸= 0 is an ideal. Let ( fλ)λ∈Λ be a set of generators
for I. Fix λ0 ∈ Λ such that fλ0 ̸= 0. Do a linear change of variables to assume that
fλ0(0, . . . ,0, zn) ̸= 0.
For λ ̸= λ0, if fλ(0, . . . ,0, zn) = 0, replace fλ by fλ + fλ0. We may hence assume that
fλ(0, . . . ,0, zn) ̸= 0 for all λ.
Now, by Weierstrass Preparation Theorem 3.29, we may write for each λ
fλ = (invertible element) · (element of C{z1, . . . , zn−1}[zn]).
This shows that I is generated (as an ideal) by
I ∩ C{z1, . . . , zn−1}[zn]
which is ﬁnitely generated by inductive hypothesis and Hilbert’s basis theorem (if R is
Noetherian, R[x] is also Notherian). □
Remark 3.32. The same proof shows that CJz1, . . . , znK is Noetherian. However, it is easier
to see that it is the completion of C{z1, . . . , zn} (as shown in the proof of Proposition 3.33),
and hence Noetherian.
Proposition 3.33. If X is a smooth algebraic variety, then the ring homomorphism
OX,x → O X an,x
is (faithfully) ﬂat for every x ∈ X.
Proof. Step 1. Suppose X = An. Let R = C{z1, . . . , zn} ⊇ m = {f | f(0) = 0}. It is easy
to check that m = (z1, . . . , zn). Moreover,
R/mN ∼= C[z1, . . . , zn]/(z1, . . . , zn)N .
Therefore,
ˆR = lim← −R/mN ∼= lim← −C[z1, . . . , zn]/(z1, . . . , zn)N ∼= CJz1, . . . , znK.
We have the following commuting square:


## Page 31

MATH 731: HODGE THEORY 31
C[z1, . . . , zn](z1,...,zn) R
ˆC[z1, . . . , zn](z1,...,zn) ˆR
∼=
Recall that if ( S, n) is a local Noetherian ring, the map S → ˆS is (faithfully) ﬂat. Since
the vertical maps are faithfully ﬂat (as R is Noetherian by 3.31), the top horizontal map is
faithfully ﬂat.
(Since ˆR is a regular ring of dimension n, R is a regular ring of dimension n.)
Step 2. Prove the following fact.
Exercise. If X ⊆ Y are smooth algebraic varieties where X is deﬁned by the coherent
ideal I and we consider Xan ⊆ Y an, the ideal of OY an vanishing on Xan is Ian. (Hint: reduce
to the case ( x1, . . . , xr = 0) = X ⊆ Cn = Y .)
In general, if X is a smooth algebraic variety, X ⊆ CN deﬁned by the ideal I, then the
exercise shows that
OCN ,x/IO CN ,x = OX,x OX an,x = O(CN)an,x/IO(CN)an,x
OCN ,x O(CN)an,x
ϕ
ψ
Since we have shown that ψ is ﬂat, this shows that ϕ is also ﬂat. Because this is a local
statement, it was enough to consider the case X ⊆ CN. □
The exercise in the proof of Proposition 3.33 has another consequence. If i: X ↪→ Y is a
closed immersion of smooth algebraic varieties and F is a sheaf on X, then the canonical
map
(i∗(F))an → (ian)∗(F an)
is an isomorphism.
Exercise. Show that we have such a morphism which gives an isomorphism on stalks. (Hint:
use the other consequence of the exercise)
We can ﬁnally prove a part of GAGA, part 1, 3.20.
Theorem 3.34. If X is a smooth projective complex algebraic variety. Then:
(1) the functor F ↦→ F an is exact,
(2) if F , G are coherent on X, we have an isomorphism
Exti
OX(F , G)
∼=→ Exti
OXan(F an, Gan)


## Page 32

32 MIRCEA MUSTAT ¸ ˘A
Assume that:
H i((Pn)an, O(Pn)an) =
{
C, i = 0,
0, i > 0.
We will see this later (cf. section 9.3) via Hodge theory when we will compute H∗((Pn)an, C).
Proof of Theorem 3.34. We have a closed immersion X ↪→ Pn. We ﬁrst treat the case F =
OX. To show that
H i(X, G) → H i(Xan, Gan),
by pushing forward to PN, we may assume that X = Pn.
Next, suppose G = OPn(m) and argue by induction on n. The case n = 0 is trivial. The key
exact sequence to use is
0 OPn(−1) OPn OPn−1 0
tensored with O(m). Since we know the assertion for OPn−1(m), then 5-Lemma implies that
the assertion holds for OPn(m) if and only if it holds for OPn(m − 1). Since we assume we
know this for m = 0, we know it for all m.
Now, work with general G. We argue by decreasing induction on i that to show that
H i(X, G) → H i(Xan, Gan)
is an isomorphism. For i ≫ 0, both are 0, so the assertion is true. For the induction step,
given G have a short exact sequence
0 G′ E G 0
where E is a direct sum of O(m), so we know the assertion for E. The long exact sequence
in cohomology then gives
H i(X, G′) H i(X, E) H i(X, G) H i+1(X, G′) H i+1(X, E)
H i(Xan, (G′)an) H i(Xan, Ean) H i(Xan, Gan) H i+1(Xan, (G′)an) H i+1(Xan, Ean)
β ∼= α ∼=
By the 5-Lemma, α is surjective for every G. Hence β is surjective as well (applying this
to G′ instead of G), which implies by the 5-Lemma that α is injective. This shows that α is
an isomorphism, as required.
Finally, we know that for every X smooth projective, any F, G where F locally free,
H i(X, G ⊗ F∨) ∼= Exti
OX(F , G) → Exti
OX(F an, Gan)
is an isomorphism. For general F, use increasing induction using
0 F′ E F 0


## Page 33

MATH 731: HODGE THEORY 33
for E locally free. The long exact sequence of Ext together with the 5 lemma implies the
result for F in the same way as above. □
4. Dolbeaux cohomology
4.1. The tangent bundle of a complex manifold.
4.1.1. The complexiﬁcation of a real vector space. Let VR be a ﬁnite-dimensional vector space
over R. To give a complex vector space structure on VR is equivalent to giving a linear map
J : VR → VR such that J2 = −Id (where J is multiplication by i).
Given such J, we write V for the corresponding C-vector space. This is called a complexiﬁ-
cation of V . We write
VC = V ⊗R C
for the extension of scalars. Then J induces
JC : VC → VC
v ⊗ λ ↦→ J(v) ⊗ λ.
Then J2
C = −Id and we have a decomposition
VC = V′ ⊕ V′′
where
V′ = {v ∈ VC | JC(v) = iv},
V′′ = {v ∈ VC | JC(v) = −iv}
are C-subspaces of VC.
Denote by u ↦→ u the conjugate-linear map
VC → VC
v ⊗ λ ↦→ v ⊗ λ.
We have an embedding
VR
j
↪→ VC
v ↦→ v ⊗ 1
such that VR = Fix(u ↦→ u).
We claim that the composition
V
j
↪→ VC
pr1
→ V′ is a complex isomorphism ,
V
j
↪→ VC
pr2
→ V′′ is a conjugate-linear isomorphism .
If v ∈ V , write v ⊗ 1 = v′ + v′′ for v′ ∈ V′, v′′ ∈ V′′. Then
Jv ⊗ 1 = iv′ − iv′′.


## Page 34

34 MIRCEA MUSTAT ¸ ˘A
Hence
v′ = 1
2(v − iJC(v)),
v′′ = 1
2(v + iJC(v)).
This implies that v′′ = v′.
Exercise. Check that v ↦→ v′ is C-linear and v ↦→ v′′ is conjugate-linear.
By the above formulas, the two maps are injective. Hence they are bijective by dimension
considerations. This proves the above claim. Moreover, we note that
V′′ = V′.
Let us now describe the decomposition VC = V′ ⊕ V′′ in terms of bases. Suppose x1, . . . , xn
give a basis of V over C. This implies that if yj = J(xj), then x1, . . . , xn, y1, . . . , yn give a
basis of VR. Consider these in VC via j : V ↪ → VC. Let ej be the V′-component of xj:
ej = 1
2(xj − iyj),
ej = 1
2(xj + iyj).
Then e1, . . . , en is a basis of V′ and e1, . . . ,en of V′′.
Consider now U = HomR(V, R). This has a complex structure given by
(λϕ)(v) = ϕ(λv) for λ ∈ C.
By the above, we have a decomposition UC = U′ ⊕ U′′. On the other hand
(VC)∗ = HomC(V ⊗R C, C) ∼= HomR(V, C) ∼= U ⊗ C
are isomorphisms of complex vector spaces.
Exercise. Check that via these isomorphisms ( JV,C)∗ corresponds to JU,C.
This implies that U′ = (V′)∗ and U′′ = (V′′)∗.
In the above description of VC = V′ ⊕ V′′ using bases, we see that x∗
1, . . . , x∗
n, y∗
1, . . . , y∗
n is a
basis of U = HomR(V, R). Moreover, it is a simplex exercise to check that y∗
j = −JU,C(x∗
j).
The bases are then
basis of U’: x∗
j + iy∗
j 1 ≤ j ≤ n,
basis of U: x∗
j − iy∗
j 1 ≤ j ≤ n.
The decomposition UC = U′ ⊕ U′′ induces a decomposition
( p⋀
U
)
C
=
p⋀
(UC) =
p⋀
(U′ ⊕ U′′) =
⨁
i+j=p


i⋀
U′ ⊗
j⋀
U′′

 .


## Page 35

MATH 731: HODGE THEORY 35
The conjugation on UC, which maps U′ to U′′ and U′′ to U′, induces a conjugation on
(⋀p U
)
C
which maps
i⋀
U′ ⊗
j⋀
U′′ to
j⋀
U′ ⊗
i⋀
U′′.
4.1.2. The complexiﬁcation of real line bundles. This globalizes as follows. Suppose M is a
smooth real manifold and E is a smooth real vector bundle on M.
Giving a complex structure on E is equivalent to givign a morphism of vector bundles
J : E → E such that J2 = −Id.
In this case, the previous discussion globalizes to a decomposition
EC = E ⊗R C = E′ ⊕ E′′
and we have an isomorphism of complex vector bundles E → E′ and a complex conjugate-
linear isomorphism E → E′′. We also have a conjugation operator on EC mapping E′ to E′′.
The dual E∗ also has a complex structure. We get a corresponding decomposition of(⋀p E∗)
C etc.
4.1.3. The tangent bundle.
Deﬁnition 4.1. Let M be a smooth real manifold. An almost complex structure on M is
a complex structure on the tangent bundle T M, i.e. a morphism J : TM → TM of vector
bundles such that J2 = −Id.
Proposition 4.2. If M is a complex manifold, then M carries a canonical almost complex
structure. Moreover, if the corresponding decomposition is
TMC = T1,0M ⊕ T0,1M
then T1,0M is a holomorphic vector bundle.
Proof. It is enough to treat the case of open subsets of Cn and then show that biholomorphic
maps preserve this structure.
If U ⊆ Cn is an open subset with complex coordinates z1, . . . , zn and zj = xj + iyj, then T U
is trivialized by
∂
∂x1
, . . . , ∂
∂xn
, ∂
∂y1
, . . . , ∂
∂yn
.
Deﬁne a complex structure by
J
(
∂
∂xj
)
= ∂
∂yj
, J
(
∂
∂yj
)
= − ∂
∂xj
.
We have a decomposition T UC = T1,0U ⊕ T0,1U where
T1,0U is trivialized by ∂
∂x1
, . . . , ∂
∂xn
,
T0,1U is trivialized by ∂
∂y1
, . . . , ∂
∂yn
.


## Page 36

36 MIRCEA MUSTAT ¸ ˘A
The key point is that we showed that if f : U → V is holomorphic, then the canonical map
TUC → f∗TVC
maps
T1,0U to f∗T1,0V,
T0,1U to f∗T0,1V.
In particular, if f is biholomorphic, the isomorphism between T UC and f∗TVC preserves the
decomposition. Hence any biholomorphic map repsects the two compelx structure. Here,
we use the following fact: if ϕ: V → W is an R-linear isomorphism between complex vector
spaces such that ϕ ⊗ 1: VC → WC mapsto V′ to W′ and V′′ to W′′, then ϕ is a C-linear
isomorphism. Indeed, we have
V W
V′ W′
ϕ
∼= ∼=
ϕ⊗1
and since the map V′ → W′ is C-linear, so is ϕ. This proves the ﬁrst statement.
The second follows, since we saw that if f : V → W is a holomorphic map between open
subsets V ⊆ Cn, W ⊆ Cm, then f∗T1,0W → T1,0V is given by the matrix
(
∂fi
∂zj
)
i,j
. In
particular, the transition maps of T 1,0M are holomorphic. □
4.2. The Dolbeault complex. Last time, we saw that if M is a complex manifold, then
TM has a canonical complex structure such that
TMC ∼= T1,0M ⊕ T0,1M
where T1,0M is a holomorphic vector bundle.
Deﬁnition 4.3. The bundle T 1,0 is the holomorphic tangent bundle of M.
Remark 4.4.
(1) As in the case of the tangent bundle to a smooth manifold, T 1,0M can be described
as the derivations on the local rings OM,x for x ∈ M.
(2) If X is a smooth algebraic variety and M = Xan, then
T1,0M ∼= (T X)an.
If f : M → M′ is a holomorphic map, then we have
TMC f∗TM′
C
T1,0M f∗T1,0M′
Dually, we have a decomposition
T∗MC = A1,0
M ⊕ A0,1
M ,


## Page 37

MATH 731: HODGE THEORY 37
where Ai,j
M is the dual of T i,jM. Moreover, we also have a corresponding decomposition for
p⋀
(T∗MC).
Let Am
M be the sheaf of real smooth m-forms on M. Moreover, let Am
M,C = Am
M ⊗R C. We
have a decomposition
Am
M,C =
⨁
p+q=m
Ap,q
M
where Ap,q
M is the sheaf of ( p, q)-forms on M. Note that
Ap,q
M = Aq,p
M .
Note that Ap,0
M is the sheaf of smooth sections of a holomorphic vector bundle. We have a
subsheaf Ωp ⊆ A p,0
M of holomorphic sections of a holomorphic vector bundle.
For example,
Ω1 = sheaf of holomorphic sections of ( T 1,0M)∗.
Locally, in a chart with coordinates z1, . . . , zn,
Ap,q = free C∞
M,C-module, with basis dzI ∧ dzJ for |I| = p, |J| = q,
where for I given by i1 < . . . < i p we write
dzI = dzi1 ∧ · · · ∧ dzip, d zI = dzi1 ∧ · · · dzip.
Recall that we have a de Rham diﬀerential d: Am
M → A m+1
M . Given p, q, consider
Ap+1,q
M,C
Ap,q
M Ap+q
M,C Ap+q+1
M,C
Ap,q+1
M,C
∂
∂
d
proj
proj
Proposition 4.5. We have that d = ∂ + ∂.
Proof. Let us compute ∂ and ∂ locally. Consider a chart with coordinates z1, . . . , zn. Consider
ω = f dz I ∩ dzJ for |I| = p, |J| = q.
Then
dω = d f∧ dzI ∧ dzJ


## Page 38

38 MIRCEA MUSTAT ¸ ˘A
where
d f=
n∑
j=1
∂f
∂xj
dxj +
n∑
j=1
∂f
∂yj
dyj
=
n∑
j=1
∂f
∂zj
dzj
  
∂f
+
n∑
j=1
∂f
∂zj
dzj
  
∂f
.
This shows that ∂ω = ∂f ∧ dzI ∧ dzJ and ∂ω = ∂f ∧ dzI ∧ dzJ. This shows that dω =
∂ω + ∂ω. □
Corollary 4.6. We have that ∂2 = 0, ∂
2
= 0, and ∂∂ + ∂∂ = 0.
Proof. Use the fact that d2 = 0 and look in the corresponding graded pieces. □
Corollary 4.7. The maps ∂ and ∂ are derivations, i.e.
∂(ω1 ∧ ω2) = ∂ω1 ∧ ω2 + (−1)deg ω1ω1 ∧ ∂ω2
and similarly for ∂.
Proof. Use that d is a derivation and look in the corresponding graded pieces. □
For every p, we have the following complex:
0 Ap,0
M Ap,1
M · · · Ap,n
M 0∂ ∂ ∂
where n is the dimension of M as a complex manifold. 3
Deﬁnition 4.8. The global sections Γ( M, Ap,•
M ) form the pth Dolbeault complex of M. The
(p, q) Dolbeault cohomology is
H p,q(M) = H q(Γ(M, Ap,•
M )).
Remark 4.9. Note that
ker(Ap,0 ∂
→ A p,1) = Ωp
M ,
i.e. the sheaf of holomorphic of sections of the the sheaf of ( p, 0) forms. Indeed, locally,
ω = ∑
I
fIdzI is in the kernel if and only if ∂fI
∂zj
= 0 for all j and I, which means that fI is
holomorphic for all I.
More generally, suppose E is a holomorphic vector bundle with sheaf of smooth sections E.
We claim that we can deﬁne a canonical
∂E : Ap,q
M ⊗ E → A p,q+1
M ⊗ E
where the tensor product is over C∞
M,C such that ∂
2
E = 0 and ∂E is a derivation.
3Note that Ap,q
M = 0 whenever p or q is bigger than n.


## Page 39

MATH 731: HODGE THEORY 39
We prove this claim now. We ﬁrst work on a chart U such that E|U has a trivialization by
holomorphic sections s1, . . . , sr. Let ω be a section of Ap,q
M ⊗ E and write it as
ω =
r∑
i=1
ωisi.
Deﬁne
∂E(ω) =
r∑
i=1
∂(ωi)si.
This is independent of trivialization. Indeed,
∂(f ωi) = f ∂ωi
if f is holomorphic (so ∂f = 0). Therefore, these local maps ∂E glue to give ∂E on M. It is
clear from the local description that ∂
2
E = 0 and ∂E is a derivation.
Altogether, this gives a twisted Dolbeault complex:
0 Ap,0
M ⊗ E Ap,1
M ⊗ E · · · Ap,n
M ⊗ E 0.
∂E ∂E ∂E
Deﬁnition 4.10. The (p, q) Dolbeault cohomology of E is
H p,q(M; E) = H q(Γ(M, Ap,•
M ⊗ E)).
There are two things to do:
• A p,q
M is acyclic: Hq(Ap,•
M ) = 0 for q ≥ 1,
• can use this complex to compute H q(M, Ωp
M).
Theorem 2.5 generalizes to functions of several variables.
Proposition 4.11 (∂-lemma). If ω is a (p, q) form on U ⊆ M such that ∂ω = 0, q ≥ 1,
then locally, we can ﬁnd β ∈ A p,q−1
M such that ∂β = ω. (Then Ap,•
M is acyclic.)
Proof. We work locally, so we may assume that we have a chart with coordinates z1, . . . , zn.
Step 1. Reduce to the case p = 0. Write ω = ∑
I,J
dI,J dzI ∧ dzj and assume that ∂ω = 0. For
every I, consider
ωI =
∑
J
fI,J dzj.
Since ∂ω = 0, ∂ωI = 0 for all I. If we know the p = 0 case, then locally ωI = ∂βI for some
βI which are (0, q − 1) forms. If we take β = ∑
I
(−1)pdzI ∧ βI, then ∂β = ω.
Step 2. Assume p = 0. Working locally, in a chart with coordinates z1, . . . , zn, we may
write
ω =
∑
|J|=q
fJ dzJ .
Let k be the largest index so that dzk shows up in some dzJ with non-zero coeﬃcient. We
proceed by increasing induction on k.


## Page 40

40 MIRCEA MUSTAT ¸ ˘A
First, suppose ω ̸= 0 and the smallest k is q. Then
ω = f dz1 ∧ · · · ∧ dzq.
Note that ∂ω = 0 if and only if ∂f
∂zi
= 0 for i > q , i.e. f is holomorphic in the variables
zq+1, . . . , zn. By Theorem 2.5 (the one variable ∂-lemma), locally there is a function g which
is smooth and holomorphic with respect to the variables zq+1, . . . , zn, and
∂g
∂z1
= f.
Then
∂(gdz2 ∧ · · · ∧ zq) = ω.
For the induction step, write ω = ω1 + ω2 ∧ dzk where ω1 is a (0, q)-form and ω2 is a (0, q −1)-
for such that ω1 and ω2 only involve dz1, . . . , dzk−1. Since ∂ω = 0, the coeﬃcients of ω1, ω2
are holomorphic in z1, . . . , zk+1. Write
ω2 =
∑
|J|=q−1
aJ dzJ .
Applying Theorem 2.5, we can ﬁnd locally smooth functions bJ, holomorphic in zk+1, . . . , zn
such that
∂bJ
∂zk
= aJ .
Then
∂

 ∑
|J|=q−1
bJ dzJ


  
β′
=
∑
|J|=q−1
(−1)q−1aJ dzJ ∧ dzk + (terms involving only dz1, . . . , dzk−1).
Therefore,
ω − (−1)q−1∂(β′)
only involves dz1, . . . , dzk−1. By inductive hypothesis, this must be equal to ∂(γ) for some
γ, and hence
ω = ∂(γ + (−1)qβ′).
This completes the proof. □
Exercise. Repeat the whole argument when M is a smooth manifold to show that if ω is a
p-form for p ≥ 1 which is closed ( dω = 0), then ω is locally exact.
Corollary 4.12. For every p ≥ 0, we have an exact complex of sheaves on M:
0 Ωp
M Ap,0 Ap,1 · · · Ap,n 0.∂ ∂ ∂
More generally, if E is any holomorphic vector bundles, with sheaf of smooth sections E and
sheaf of holomorphic sections Ehol, then we have an exact complex
0 Ωp
M ⊗OM Ehol Ap,0 ⊗C∞
M,C E Ap,1 ⊗C∞
M,C E · · ·
∂E


## Page 41

MATH 731: HODGE THEORY 41
Exactness follows since locally the complex is isomorphic to a direct sum of r = rk E copies
of the Dolbeault complex.
In the case of smooth manifolds, we have similar exact complexes. We have the de Rham
complex:
0 R A0
M · · · An
M 0.d d
4.3. Soft sheaves on paracompact spaces. Let X be a topological space and F be a
sheaf of abelian groups on X. If Z is any subset of X and i: Z ↪→ X is the inclusion map,
then we deﬁne
F(Z) = Γ(Z, F) = Γ(Z, i−1F).
to be the set of sections s: Z → ∐
x∈Z
Fx such that s(x) ∈ F x for all x ∈ Z and for all x ∈ Z,
there is an open neighborhood of x in X and t ∈ F (U) such that
s(y) = ty for all y ∈ U ∩ Z.
Remark 4.13. If Z′ ⊆ Z, we have natural restriction maps F(Z) → F (Z′) which are
functorial.
Proposition 4.14. If F is as above and Z1, . . . , Zr are closed subsets of X, we have an
exact sequence:
0 F
(
⋃
i
Zi
)
∏
i
F(Zi) ∏
i,j
F(Zi ∩ Zj)
induced by restriction maps.
Proof. Suppose (si)1≤i≤r are sections
si : Zi →
∐
x∈Zi
Fx
such that si(x) ∈ F x which are compatible, i.e. si(x) = sj(x) for all x ∈ Zi ∩ Zj. We want
to show there is a unique s: ⋃
i
Zi → ∐
x∈⋃ Zi
Fx such that s(x) ∈ F x for all x, and s|Zi = si.
Fix x ∈ X. We may replace X be an open neighborhood of x. Since Zi’s are closed, we
may assume that x ∈ Z1 ∩ · · · ∩ Zr by making this open neighborhood smaller if necessary.
Moreover, we may assume that for all i, there exists ti ∈ F (X) such that ( ti)y = si(y) for
all y ∈ Zi. In particular,
(t1)x = · · · = (tr)x.
Further replacing X, we may assume t1 = · · · = tr = t. Clearly, ( t)y = s(y) for all y. □
Deﬁnition 4.15. A topological space X is paracompactif
• X is Hausdorﬀ,
• every open cover admits a reﬁnement which is locally ﬁnite.
We suppose throughout this section that X is paracompact.


## Page 42

42 MIRCEA MUSTAT ¸ ˘A
Examples 4.16.
(1) Topological manifolds are paracompact.
(2) CW complexes are paracompact.
Remark 4.17. If Z is closed in X and X is paracompact, then Z is paracompact.
Remark 4.18. If X = ⋃
i∈I
Ui is a locally ﬁnite open cover and X is paracompact, then there
is an open cover X = ⋃
i
Vi such that Vi ⊆ Ui.
Example 4.19. If A, B ⊆ X are closed, A ∩ B = ∅, there exist U, V open such that A ⊆ U,
B ⊆ V , U ∩ V = ∅. (In other words, X is a normal space).
Deﬁnition 4.20. A sheaf F of abelian groups on X is soft if for any Z ⊆ X closed, the
restriction map F(X) → F (Z) is surjective.
Compare this to the deﬁnition of ﬂasque sheaves. A sheaf F is ﬂasque if for any U ⊆ X
open, the map F(X) → F (U) is surjective.
Fact 4.21. Flasque sheaves are acyclic, i.e. their higher cohomology vanishes. Therefore,
one can compute cohomology via ﬂasque resolutions.
We will see next time that if X is paracompact, then the same holds for soft sheaves.
Moreover, we will see that there is a large supply of soft sheaves on complex manifolds.
There are some supplementary notes on the course website
http://www-personal.umich.edu/~mmustata/731-2019.html
covering
• soft sheaves,
• comparison between singular cohomology and sheaf cohomology with constant coef-
ﬁcients.
Proposition 4.22. Let F be a sheaf of abelian groups on X. If Z ⊆ X is closed, for any
section s ∈ F (Z), there exists U ⊇ Z open and t ∈ F (U) such that t|Z = s.
Proof. See the notes on soft sheaves on the course website (Lemma 2.3). □
Corollary 4.23. If F is ﬂasque, then F is soft.
Proposition 4.24. If
0 F′ F F′′ 0
ϕ ψ
is exact and F′ is soft, then
0 F′(X) F(X) F′′(X) 0
is exact.


## Page 43

MATH 731: HODGE THEORY 43
Proof. We only need to show that if s ∈ F′′(X), there exists ˜s ∈ F (X) such that ψ(˜s) = s.
Since ψ is surjective, there is an open cover X = ⋃
i
Ui, ˜si ∈ F (Ui) such that ψ(˜si) = s|Ui.
By paracompactness of X, after passing to some reﬁnement, we may assume this is a locally
ﬁnite cover. Hence there is an open cover X = ⋃
i
Vi such that Vi ⊆ Ui.
For J ⊆ I, ZJ = ⋃
i∈J
Vi is closed in X by local ﬁniteness.
Consider pairs ( J, t) with J ⊆ I and t ∈ F (ZJ) such that ψ(t) = s|ZJ. We order the pairs
by declaring ( J, t) ≤ (J′, t′) if J ⊆ J′ and t′|ZJ = t. By Zorn’s Lemma, we may choose a
maximal (J, t).
If I = J, we are done. Otherwise, there exists i ∈ I \ J, and we will produce a contradiction
with maximality of J. We have t ∈ F (ZJ) and ˜si|Vi ∈ F (Vi). Note that
ψ(t|ZJ∩Vi) = ψ(˜si|ZJ∩Vi)
and hence
t|zJ∩Vi − ˜si|ZJ∩Vi = ϕ(w)
for some w ∈ F′(ZJ ∩ Vi). Since F′ is soft, there exists ˜w ∈ F′(X) such that ˜w|ZJ∩Vi = w.
Replace
˜si|Ui by ˜si|Ui + ϕ( ˜w|Ui)
to assume that t|ZJ∩Vi = ˜si|ZJ∩Vi.
By Proposition 4.14, there exists t′ ∈ F (ZJ∪{i}) such that t′|ZJ = t and t′|Vi = ˜si|Vi. Then
ψ(t′) = s|ZJ∪{i}, contradicting maximality of the pair ( J, t). □
Corollary 4.25. If 0 F′ F F′′ 0 is exact, and F′ and F are
soft, then F′′ is soft.
Proof. Consider Z ⊆ X closed. Then Z is paracompact and F′|Z is soft. By Proposition 4.24,
the diagram
0 F′(X) F(X) F′′(X) 0
0 F′(Z) F(Z) F′′(Z) 0
has exact rows, and hence F′′(X) → F′′(Z) is surjective. □
We ﬁnally show that we can compute cohomology using soft sheaves.
Theorem 4.26.
(1) If E is a soft sheaf on X, H i(X, E) = 0 for all i > 0.
(2) If F has a resolution
0 F E0 E1 · · ·


## Page 44

44 MIRCEA MUSTAT ¸ ˘A
with all E i soft, then
H i(X, F) = Hi(Γ(X, E•)).
Proof. Part (2) follows from part (1) by general reasons. For (1), we argue by induction on
i. Consider the short exact sequence
0 E I G 0
with I ﬂasque. In particular, I is soft by Corollary 4.23. Then, by Corollary 4.25, G is also
soft. The long exact sequence in cohomology then shows that:
• Γ(X, I) → Γ(X, G)  
surjective by Prop. 4.24
→ H1(X, E) → H1(X, I)  
=0
, so H1(X, E) = 0,
• H i+1(X, E) = H i(X, G) = 0 for i ≥ 1 by inductive hypothesis.
This completes the proof. □
Exercise. Suppose f : (X, OX) → (Y, OY ) is a morphism of ringed spaces with X, Y para-
compact. Let F be a sheaf on Y and G be a sheaf on X so that we have a morphism
f∗F → G . This induces maps H i(Y, F) H i(X, f∗F) H i(X, G).
Show that if F → E•, G → M• are soft resolutions and we have induced morphisms
f∗F f∗E•
G M•
then we have a commutative diagram
H i(Y, F) Hi(Γ(Y, E•))
H i(X, G) Hi(Γ(X, M•))
∼=
∼=
Proposition 4.27. If M is a smooth real manifold, then any C∞
M -module is soft.
Proof. Let F be a C∞
M-module and Z ⊆ X be a closed subset. Consider s ∈ F (Z). We want
to extend it to a section on X.
By Proposition 4.22, there is an open subset U ⊇ Z and a section ˜s ∈ F (U) such that
˜s|Z = s.
Considering Z ⊆ U, there is an open subset U1 such that
Z ⊆ U1 ⊆ U1 ⊆ U
and an open subset U2 such that
U1 ⊆ U2 ⊆ U2 ⊆ U.


## Page 45

MATH 731: HODGE THEORY 45
Then smooth version of Urysohn’s Lemma say that there exists a smooth function ϕ such
that {
ϕ = 1 on U1,
ϕ = 0 on X \ U2.
Consider ϕ|U · ˜s which is 0 on U \ U2. Then there exists a section s′ ∈ F (X) such that
s′|X\U2 = 0 and s′|U = ϕ|U ˜s|U since ϕ = 0 on X \ U2. Note that
s′|U1 = ˜s|U1
since ϕ = 1 on U1. Hence s′|Z = s. □
Applications.
(1) If M is a smooth manifold of dimension n, we have a resolution of R given by
0 R A0
M A1
M · · · An
M 0,d d d
so we recover the de Rham Theorem:
H p(X, R) ∼= H p
dR(X).
This gives a simple interpretation of the cup product on cohomology (which is messy
to deﬁne otherwise) via ∧ of diﬀerential forms.
These are also isomorphic to singular cohomology. This is proven in the notes on
the course website.
Fact 4.28. Since M is paracompact and locally contractible,
H p(M, R)  
sing. cohomology
∼= H p(M, R).
(2) If M is a complex manifold of dimension n, for all p, we have an exact complex
0 Ωp
M Ap,0
M Ap,1
M · · · Ap,n
M 0,∂ ∂ ∂
which shows that
H p,q(M) = Hq(Γ(M, Ap,•
M )) ∼= H q(M, Ωp
M)
(where the ﬁrst equality is the deﬁnition of Dolbeaux cohomology).
More generally, if E is a holomorphic vector bundle with sheaf of holomorphic
sections E, the sheaf of sections isC∞
M ⊗OM E = Esm. By taking (∗)⊗C∞
M Esm = (∗)⊗OM E,
we get a complex
0 Ωp
M ⊗OM E Ap,0
E Ap,1
E · · · Ap,n
M,E 0.
∂E ∂E
Then
H p,q(M, E) = Hq(Γ(M, Ap,•
M,E)) ∼= H q(M, Ωp
M ⊗ E)
(where the ﬁrst equality is the deﬁnition of Dolbeaux cohomology).
5. Hodge theory of compact, oriented, Riemannian manifolds
We are now done with introductory material to the class and we start Hodge theory. During
the next few lectures, we discuss Hodge theory for Riemannian manifolds.


## Page 46

46 MIRCEA MUSTAT ¸ ˘A
5.1. Linear algebra background: the ∗ operator. Let V be a ﬁnite-dimensional vector
space over R.
Deﬁnition 5.1. A scalar product on V is a symmetric bilinear form ⟨·, ·⟩ on V × V valued
in R which is positive deﬁnite, i.e. ⟨v, v⟩ > 0 for all v ̸= 0.
Given a scalar product on V , we get an isomorphism
V
∼=→ V∗
v ↦→ ϕv = ⟨v, −⟩.
We put a scalar product on V∗ such that
⟨ϕv, ϕw⟩ = ⟨v, w⟩ for all v, w.
Example 5.2. If e1, . . . , en is an orthonormal basis of V (i.e. ⟨ei, ej⟩ = δi,j for all i, j) and
e∗
1, . . . , e∗
n is the dual basis on V∗, then ϕei = e∗
i and hence e∗
1, . . . , e∗
n is an orthonormal basis
for V∗.
Exercise. Given a scalar product ⟨·, ·⟩ on V , we have an induced scalar product on each
p⋀V such that
⟨v1 ∧ · · · ∧ vp, w1 ∧ · · · ∧ wp⟩ = det(⟨vi, wj⟩).
(Hint: use this as the deﬁnition and show that ife1, . . . , en is an orhonormal basis, then we get
an orthonormal basis for
p⋀V given by {eI = ei1∧· · ·∧eip | I = {i1 < . . . < i p} ⊆ { 1, . . . , n}}.)
Suppose now that, in addition, that on V we also have an orientation (i.e. an orientation on
the 1-dimensional top exterior power of V ).
In this case, we get a canonical volume element vol ∈
n⋀V for n = dim V by choosing an
orthonormal basis e1, . . . , en such that e1 ∧ · · · ∧ en is positive and letting
vol = e1 ∧ · · · ∧ en.
This is independent on the choice of basis. If e′
1, . . . , e′
n is another such basis and we write
e′
i =
∑
ajai,jej
then for A = (ai,j) we have A · At = In, so det( A)2 = 1. Hence det( A) = ±1 and we have
e′
1 ∧ · · · ∧ e′
n = (det A)e1 ∧ · · · en
so det A = 1 since e′
1 ∧ · · · ∧ e′
n and e1 ∧ · · · ∧ en are both positive.
We now deﬁne the ∗ operator for ( V, ⟨·, ·⟩, orientation) where n = dim V .
Proposition 5.3. For every p, 0 ≤ p ≤ n, there is a unique isomorphism
p⋀
V
∗
→
n−p⋀
V
such that
v ∧ (∗w) = ⟨v, w⟩vol in
n⋀
V
for all v, w ∈
p⋀V .


## Page 47

MATH 731: HODGE THEORY 47
Proof. Recall that there is a canonical nondegenerate bilinear map
(2)
p⋀
V ×
n−p⋀
V →
n⋀
V ∼= R.
given by ∧. Given w ∈ ⋀p V , we may consider the map
⟨−, w⟩vol:
p⋀
V →
n⋀
V ∼= R.
Using the pairing (2), there is an element ∗w ∈
n−p⋀ V such that
⟨−, w⟩vol = − ∧ ∗w.
We get a linear map ∗:
p⋀V →
n−p⋀ V . It is clear this is injective: if ∗w = 0, then for all v,
⟨v, w⟩ = 0, so w = 0 since ⟨−, −⟩ is non-degenerate.
By dimension considerations, ∗ is an isomorphism. □
We now describe ∗ via an orthonormal basis. Recall that
eJ ∧ (∗eJ) = ⟨eJ , eI⟩vol.
This shows that, by taking I = J,
∗eI = ϵ(I, I) · eI where I = {1, . . . , n} \ I
where ϵ(I, I) is the signature of the permutation ( I, I). In other words,
eI ∧ eI = ϵ(I, I)e1 ∧ · · · ∧ en.
Properties of ∗:
(1) ∗(vol) = 1,
(2) ∗∗:
p⋀V →
p⋀V is equal to ( −1)p(n−p) because
(a1 ∧ · · · ∧ ap) ∧ (b1 ∧ . . . ∧ bn−p) = (−1)p(n−p)(b1 ∧ · · · ∧ bn−p) ∧ (a1 ∧ · · · ∧ ap).
5.1.1. The global situation. Let M be a smooth manifold and E be a smooth real vector
bundle on M of rank n. Write E for the sheaf of sections.
Deﬁnition 5.4. A metric (or scalar product) on E is a smoothly varying family of scalar
products on the ﬁbers of E. Concretely, for all p ∈ M, we have a scalar product ⟨·, ·⟩ on Ep
such that for sections s, t ∈ E (U), the map
U ∋ p ↦→ ⟨s(p), t(p)⟩ ∈ R
is a smooth function. (Note that it is enough to check this for s1, . . . , sn which trivialize E
over open subsets.)
Example 5.5. If E = M × Rn, then the standard scalar product on Rn gives a scalar
product on each ﬁber, which is a matrix on E.
In particular, we always have such metrics locally on anyE locally on M. By using partitions
of unity, get metrics on E. Hence on every E, we have such a metric.


## Page 48

48 MIRCEA MUSTAT ¸ ˘A
If, in addition, we have an orientation of E (i.e. a compatible system of orientations of all
ﬁbers), we get an element vol ∈ Γ
(
M,
n⋀E
)
which is everywhere nonzero, belonging to the
(positive) orientation.
We get a global ∗ operator
∗:
p⋀
E →
n−p⋀
E
globalizing the one on each ﬁber.
5.1.2. The tangent bundle.
Deﬁnition 5.6. A Riemannian metric on M is a metric on T M.
A Riemannian metrec induces a metric on T ∗M and on
p⋀T∗M.
If M is oriented, i.e. we have an orientation on T M (or equivalently on T∗M), we can apply
the previous considerations.
In particular, we have an n-form (where n is the dimension of M) dV called the volume
element which is everywhere nonzero and positively oriented.
We get ∗: Ap
M
∼=→ A p−1
M such that ω ∧ (∗η) = ⟨ω, η⟩dV .
From now on, let M be a compact manifold with orientation and a Riemannian structure.
Compactness allows us to deﬁne a scalar product on Ap(M) by
⟨ ⟨ω, η⟩ ⟩=
∫
M
⟨ω, η⟩ dV.
It is clearly bilinear, symmetric and positive-deﬁnite: if ω ̸= 0, then ⟨ ⟨ω, ω⟩ ⟩> 0.
One caveat is that Ap(M) is not ﬁnite-dimensional. Actually, it is not even complete with
respect to the metric induced by ⟨ ⟨·, ·⟩ ⟩.
Deﬁnition 5.7. Let d∗ : Ap
M → A p−1
M be given by
d∗ = (−1)n(p−1)+1 ∗ d ∗
= (−1)p ∗−1 d ∗
Proposition 5.8. For every p, d∗ : Ap+1(M) → A p(M) is the formal adjoint of d: Ap(M) →
Ap+1(M) with respect to J·, ·K. Explicitly,
⟨ ⟨dω, η⟩ ⟩= ⟨ ⟨ω, d∗ω⟩ ⟩
for all η ∈ A p+1(M), ω ∈ A p(M).
This is only a formal adjoint because these are not really Hilbert spaces (they are not
complete).
Remark 5.9. Such a formal adjoint is unique if it exists: if d
∗
is another such operator,
then
⟨ ⟨ω, d∗η⟩ ⟩= ⟨ ⟨ω, d
∗
η⟩ ⟩,
then for ω = d∗η − d
∗
η we have ⟨ ⟨ω, ω⟩ ⟩= 0, so ω = 0.


## Page 49

MATH 731: HODGE THEORY 49
Proof. We compute ⟨ ⟨ω, d∗η⟩ ⟩using the deﬁnition:
⟨ ⟨ω, d∗η⟩ ⟩=
∫
M
⟨ω, (−1)p+1 ∗−1 d ∗ η⟩ dV
= (−1)p+1
∫
M
ω ∧ d ∗ η  
(−1)p(d(ω∧∗η)−dω∧(∗η))
= −
∫
M
d(ω ∧ ∗η)
  
=0 by Stokes’ Theorem
+
∫
M
dω ∧ ∗η
=
∫
M
⟨dω, η⟩dV
= ⟨ ⟨dω, η⟩ ⟩,
where we have used that d is a derivation. □
We deﬁne the Laplace–Beltrami operator:
∆ = dd∗ + d∗d: Ap(M) → A p(M).
Proposition 5.10. The operator ∆ is formally self-adjoint.
Proof. We have that
⟨ ⟨∆ω, η⟩ ⟩= ⟨ ⟨dd∗ω + d∗dω, η⟩ ⟩
= ⟨ ⟨d∗ω, d∗η⟩ ⟩+ ⟨ ⟨dω, dη⟩ ⟩ by Proposition 5.8.
By symmetry, this is also equal to ⟨ ⟨ω, ∆η⟩ ⟩. □
Deﬁnition 5.11. A form ω ∈ A p(M) is harmonic if ∆ω = 0.
Proposition 5.12. A form ω is harmonic if and only if dω = 0 and d∗ω = 0.
Proof. The ‘if’ implication is clear from the deﬁnition of ∆. For the ‘only if’ implication,
we use the formula ⟨ ⟨∆ω, η⟩ ⟩= ⟨ ⟨d∗ω, d∗η⟩ ⟩+ ⟨ ⟨dω, dη⟩ ⟩from the proof of Proposition 5.10 for
η = ω such that dω = 0 to conclude that
0 = ∥d∗ω∥2 + ∥dω∥2,
so dω = 0 and d∗ω = 0. □
The goal is to prove that every de Rham cohomology class is represented by a unique har-
monic representative. This is the famous Hodge Theorem 5.21. We start with the following
lemma.
Lemma 5.13. For a given de Rham cohomology class, a representative ω is harmonic if and
only if ∥ω∥ is minimal.
Proof. Given a p-form ω such that dω = 0, consider ω + dη for all ( p − 1)-forms η. Then
(3) ∥ω + dη∥2 = ∥ω∥2 + ∥dη∥2 + 2 ⟨ ⟨ω, dη⟩ ⟩  
⟨⟨d∗ω,η⟩⟩
.


## Page 50

50 MIRCEA MUSTAT ¸ ˘A
Since dω = 0, ω is harmonic if and only if d∗ω = 0. If this holds, then
∥ω + dη∥2 ≥ ∥ω∥2
for all η by formula (3).
Conversely, if ∥ω∥2 is minimal among all ∥ω + dη∥2, then
d
dt ∥ω + tdη∥2|t=0 = 0.
According to formula (3) derivative is equal to 2 ⟨ ⟨ω, dη⟩ ⟩. For η = d∗ω, we get that
0 = ⟨ ⟨ω, dd∗ω⟩ ⟩= ⟨ ⟨d∗ω, d∗ω⟩ ⟩,
so d∗ω = 0. □
Note that if ω and ω′ are harmonic in the same cohomology class, then ∥ω∥2 = ∥ω′∥2. If we
write ω = ω′ + dη, then ∥dη∥2 = 0 by formula (3), so ω = ω′. This shows uniqueness.
Proving existence will be much more diﬃcult. The problem is that the space Ap(M) is
not only inﬁnite-dimensional but also not complete. Therefore, there is no abstract way to
conclude that the desired minimum exists.
Proposition 5.14. The operators ∗ and ∆ commute: ∗∆ = ∆∗.
Corollary 5.15. The form ω is harmonic if and only if ∗ω is harmonic.
Proof of Proposition 5.14. Computing on p-forms:
∗∆ = ∗(dd∗ + d∗d)
= (−1)n(p−1)+1 ∗ d ∗ d ∗ +(−1)p+1d ∗ d
and
∆∗ = (dd∗ + d∗d)∗
= (−1)n(n−p−1)+1d ∗ d ∗∗
(−1)p(n−p)
+(−1)n(n−p)+1 ∗ d ∗ d ∗
= (−1)p+1d ∗ d + (−1)n(p−1)+1 ∗ d ∗ d ∗,
which agrees with ∗∆ above. □
Note that if n is even (for example, M is a complex manifold), then the sign becomes simply
d∗ = − ∗ d ∗, which is easier to keep track of.
We have a formally self-adjoint operator
∆: Ap(M) → A p(M).
If we have a self-adjoint linear map T : V → V , where V is a ﬁnite-dimensional vector space
with a scalar product ⟨·, ·⟩, then ker( T ) is perpendical to im( T ), because for T u = 0, we
have
⟨u, T v⟩ = ⟨T u, v⟩ = 0.


## Page 51

MATH 731: HODGE THEORY 51
Moreover, these have complementary dimension and hence ⟨·, ·⟩ gives an isomorphism
V = ker(T )
⊥
⊕ im(T ).
The same holds if T is an operator on a Hilbert space.
However, the spaces Ap(M) are not Hilbert spaces. We hence have to do more work in other
to prove such a statement for T = ∆, V = Ap(M).
5.2. Diﬀerential operators. Let M be a smooth manifold and C∞
M be the sheaf of real-
valued smooth functions on M. Consider
DM ⊆ E ndR(C∞
M)
generated as a sheaf of rings by C∞
M (acting by homotheties) and DerR(C∞
M). Note that this
is a sheaf of non-commutative rings.
If U ⊆ M is a chart with coordinates x1, . . . , xn, then Der(C∞
M) is generated over C∞
M by
∂1, . . . , ∂n, where ∂i = ∂
∂xi
.
Hence DU is free over C∞
M (both as a left and as a right modulo), with basis given by
∂∗ = ∂α1
1 . . . ∂αn
n for α = (α1, . . . , αn).
Let FkDM ⊆ D M for k ≥ 0 be the subsheaf of locally generated (in charts as above) by ∂α
with |α| = α1 + · · ·+ αn ≤ k. We call these diﬀerential operators of order ≤ k. For example:
• F 0DM = C∞
M,
• F 1DM = C∞
M + DerR(C∞
M).
They satisfy the following obvious properties.
(1) We see that
FkDM · FℓDM ⊆ F k+ℓDM
using [∂k, g] = ∂g
∂xk
. This implies that
grF DM =
⨁
k≥0
FkDM /Fk−1DM
has an induced graded ring structure.
(2) We have that [FkDM , FℓDM] ⊆ F k+ℓ−1DM, so grF DX is a sheaf of commutative rings.
Note that
grF DM = C∞
M ⊕ TM ⊕ · · · ,
where we write TM for the sheaf of sections of the tangent bundle T M and identify it with
DerR(C∞
M).
By the universal property of the symmetric algebra, we get a morphism of sheaves of graded
commutative C∞
M-algebras:
SymC∞
M
(TM) → grF DM .


## Page 52

52 MIRCEA MUSTAT ¸ ˘A
Using the local description of DX in a chart, we see that this is an isomorphism. Given an
operator, P ∈ Γ(M, DX) of order k (i.e. order ≤ k but not ≤ k − 1), the symbol of P is the
corresponding section
σk(P ) ∈ Γ(M, Symk(TM)).
More generally, suppose E, F are smooth (real) vector bundles on M, with corresponding
sheaves E, F. Then
Diﬀ k(E, F) =



P ∈ E nd(E, F)
⏐⏐⏐⏐⏐⏐⏐⏐
locally on open subsets U ⊆ X
such that E| U ∼= O⊕r
U , F|U ∼= O⊕s
U
P is given by ( Pi,j) with each
Pi,j a diﬀerential operator of order ≤ k



.
Example 5.16. The map d: Ap
M → A p+1
M is a diﬀerential operator of order 1.
If P is a diﬀerential operator of order ≤ k, we want to deﬁne σk(P ), as above. Locally on an
open subset U ⊆ X such that E| U ∼= O⊕r
U , F |U ∼= O⊕s
U , if P is given by ( Pi,j)i,j, we consider
(σk(Pi,j))i,j where
σk(Pi,j) ∈ Γ(U, Sym(TM)).
These glue together to give
σk(P ) ∈ Γ(M, Sym(TM) ⊗ Hom(E, F)).
Given x ∈ M, we get a map
T∗
x M → HomR(E(x), F(x))
which is a homogeneous polynomial of degree k.
Deﬁnition 5.17. A diﬀerential operator P ∈ Diﬀ k(E, F ), with rank( E) = rank( F ), is
elliptic if for all x ∈ M and any non-zero v ∈ T∗
x M, σk(P )x(v) is an isomorphism.
If P = ∑
|α|≤k
aα(x)∂α, then
σk(P ) =
∑
|α|=k
aα(x)yα.
Therefore, P is elliptic if and only if for all ( y1, . . . , yn) ̸= 0 and all x,
∑
|α|=k
aα(x)yα ̸= 0.
Example 5.18 (Main example). The Laplace-Beltrami operator ∆, where
∆ = d∗d + dd∗ d∗ = ± ∗ d ∗ .
Recall that ∗ has order 0 and d has order 1, so ∆ is a diﬀerential operator of order ≤ 2.
Goals.
• Compute ∆ on Rn with the usual metric and orientation.
• Compute σ2(∆) in general and show that ∆ is elliptic.


## Page 53

MATH 731: HODGE THEORY 53
Recall that if M is a smooth manifold, X is a vector ﬁeld, and ω is a p-form, iXω is the
contraction of ω with respect to X given by: if X1, . . . , Xp−1 are vector ﬁelds, then
(iXω)(X1, . . . , Xp−1) = ω(X, X1, . . . , Xp−1).
For example, iX(d f) = X(f).
Exercise. The contraction along X, iX, behaves well with respect to ∧:
(4) iX(α ∧ β) = iX(α) ∧ β + (−1)deg αα ∧ iX(β).
We write down iX explicitly in local coordinates. If ξ1, . . . , ξn trivialize T M on U and
ξ∗
1, . . . , ξ∗
n is the dual basis of T∗M, we set
ξ∗
I = ξ∗
i1 ∧ · · · ∧ ξ∗
ip for I : i1 < · · · < i p.
Then
iξj(ξ∗
I ) =
{
0 if j ̸∈ I
(−1)k−1ξ∗
I\{j} if j = ik
Lemma 5.19. Let M be an oriented Riemannian manifold and ξ1, . . . , ξn be an orthonormal
positively oriented local basis for T M. Then for all I with |I| = p,
∗(ξ∗
j ∧ ∗ξ∗
I ) = (−1)n(p−1)iξj(ξ∗
I ).
Proof. We ﬁrst make sure that this equality is correct when we ignore the signs. For j ̸∈ I,
both sides are clearly 0. Otherwise, if j ∈ I, the left hand side is
± ∗ (ξ∗
j ∧ ±ξ∗
I ) = ± ∗ ξ∗
I∪{j} = ±ξ∗
I\{j}.
Checking that the signs agree is left as an exercise. □
We now compute σ2(∆) in general and ∆ if M = Rn with standard metric and orientation.
Consider a p-form ω which may be written in the local coordinates as ω =
∑
|I|=p
fIξ∗
I . Then
d∗ω = (−1)n(p−1)+1 ∗ d ∗ (ω)
= (−1)n(p−1)+1 ∗ d

 ∑
|I|=p
fI ∗ ξ∗
I


= (−1)n(p−1)+1 ∗
∑
|I|=p
n∑
k=1
ξk(fI)(ξ∗
k ∧ ∗ξ∗
I )
  
Term A
+ (−1)n(p−1)+1 ∗
∑
|I|=p
fId(∗ξ∗
I )
  
Term B
.
Term B is
• = 0 in Rn with ξi = ∂
∂xi
,
• in general, can be ignored in the computation of σ2(∆).


## Page 54

54 MIRCEA MUSTAT ¸ ˘A
We are hence left with computing Term A. We have that
Term A = (−1)n(p−1)+1
∑
|I|=p
n∑
k=1
ξk(fI) ∗(ξ∗
k ∧ ∗ξ∗
I )  
(−1)n(p−1)iξk ξ∗
I
= −
∑
I
∑
k
ξk(fI)iξk(ξ∗
I ).
So far, we have shown that
d∗ω = −
∑
I
∑
k
ξk(fI)iξk(ξ∗
I ) + (linear operator in ω)
and the linear operator in ω is 0 if U = Rn with the standard metric and basis. Moreover,
dω =
∑
|I|=p
∑
j
ξj(fI)ξ∗
j ∧ ξ∗
I .
Putting these together, we see that
dd∗ = −
∑
I
∑
j,k
ξjξk(fI)ξ∗
j ∧ iξk(ξ∗
I ) + (operator of order ≤ 1 in ω)  
=0 in Rn
,
d∗d = −
∑
I
∑
j,k
ξkξj(fI)iξk(ξ∗
j ∧ ξ∗
I ) + (operator of order ≤ 1 in ω)  
=0 in Rn
.
and hence
∆ω = (dd∗+d∗d)ω = −
∑
I
∑
j,k
ξkξj(fI)(ξ∗
j ∧iξk(ξ∗
I )+iξk(ξ∗
j ∧ξ∗
I ))+(operator of order ≤ 1 in ω)  
=0 in Rn
where we use the fact that [ ξk, ξj] is an operator of order ≤ 1. Using the formula (4) for
iX(α ∧ β), we see that
∆ω = −
∑
I
∑
j,k
ξkξj(fI)iξk(ξ∗
j ) ∧ ξ∗
I −
∑
k
ξ2
k(fI)ξ∗
I + (operator of order ≤ 1 in ω)  
=0 in Rn
.
Conclusion.
(1) If M = Rn, we get the formula
∆

∑
I
fIdxI

 = −
∑
I


n∑
k=1
∂2f
∂x2
k

 dxI
which is the standard Laplace operator in Rn.
(2) In general, σ2(∆) ignores the operators of order ≤ 1, so we get the expression
σ2(∆)x


n∑
k=1
vkξ∗
k(x)

 = −


n∑
k=1
v2
k

 · Id
so
σ2(∆)x(v) = −∥v∥2 · Id
which is an isomorphism if v ̸= 0. In particular, ∆ is an elliptic operator.


## Page 55

MATH 731: HODGE THEORY 55
Suppose P ∈ Diﬀ k(E, F) where M is compact and oriented. If we have a metric on E and a
volume element dV , we can deﬁne a scalar product on E(M) by
⟨ ⟨s, t⟩ ⟩=
∫
M
⟨s, t⟩ dV.
Given P ∈ Diﬀ k(E, F) such that both E, F carry metrics, there is a formal adjoint
P∗ ∈ Diﬀ k(F , E)
such that
⟨ ⟨P s, t⟩ ⟩= ⟨ ⟨s, P∗r⟩ ⟩ for all s ∈ E (M), t ∈ F (M).
Moreover, for all x ∈ M, v ∈ T∗
X(M),
σk(P∗)x(v) = (σk(P )x(v))∗
where the right hand side is the adjoint with respect to the scalar product on the ﬁbers.
In particular, if rank( E) = rank(F ), then P is elliptic if and only if P∗ is elliptic.
Theorem 5.20 (Fundamental theorem). Suppose M is compact and oriented, and E, F are
smooth vector bundles of the same rank, with metrics, and we have a volume element dV .
For an elliptic diﬀerential operator P ∈ Diﬀ k(E, F ), we have
(1) dim R ker(P ) < ∞ (so codimR im(P ) < ∞),
(2) E(M) = ker(P )
⊥
⊕ im(P∗).
In particular, if P is self-adjoint, then
E(M) = ker(P ) ⊕ im(P ).
Note that ker( P ) ⊥ im(P∗) by adjointness. The assertion in the theorem is that E(M) is a
direct sum of the two.
The subtle issue is that E(M) and F(M) are not complete with respect to⟨ ⟨·, ·⟩ ⟩, so we cannot
apply the usual theory of Hilbert spaces. We have ﬁrst to enlarge the spaces to suitable spaces
of distributions. The hard part is then showing that, given an elliptic operator P∗ and a
section s of E with coeﬃcients in a distribution, if P∗s is smooth, then s is smooth.
What does this say about ∆? Since ∆ is elliptic and self-adjoint, Theorem 5.20 implies that
(5) Ap(M) = ker(∆)
⊥
⊕ im(∆).
We already know that the kernel is the space of harmonic forms:
ker(∆) = Hp(M, R) = {ω ∈ A p(M) | ∆ω = 0}.
We need to compute the image. We have that
(6) ∆( Ap(M)) ⊆ d(Ap−1(M)) + d∗(Ap+1(M))
because ∆ = dd∗ + d∗d. Note that
(1) d(Ap−1(M)) ⊥ d∗(Ap+1(M)), because
⟨ ⟨dω, d∗η⟩ ⟩= ⟨ ⟨d2ω, η⟩ ⟩= 0,


## Page 56

56 MIRCEA MUSTAT ¸ ˘A
(2) Hp(M, R) is orthogonal to
d(Ap−1) + d∗(Ap+1(M)),
because for harmonic ω, dω = 0 and d∗ω = 0, so
⟨ ⟨ω, dη⟩ ⟩= ⟨ ⟨d∗ω, η⟩ ⟩= 0
and similarly ⟨ ⟨ω, d∗θ⟩ ⟩= 0.
The orthogonal decomposition (5) together with the inclusion (6) shows that
∆(Ap(M)) = d(Ap−1(M))
⊥
⊕ d∗(Ap+1(M)).
What is the kernel ker(d: Ap(M) → A p+1(M))? It contains Hp(M, R) and d(Ap−1(M)). We
claim that
ker(d: Ap(M) → A p+1(M)) = Hp(M, R)
⊥
⊕ d(Ap−1(M)).
For this, it is enough to show that ifd∗η ∈ ker(d), then d∗η = 0 (using the decomposition (5)).
This is clear since dd∗η = 0 implies that
⟨ ⟨d∗η, d∗η⟩ ⟩= ⟨ ⟨η, dd∗η⟩ ⟩= 0,
so d∗η = 0.
Finally, we deduce from this discussion the fundamental theorem of Hodge theory.
Corollary 5.21 (Hodge theorem). Suppose M is a compact oriented Riemannian manifold.
We have a canonical isomorphism
H p
dR(M, R) ∼= Hp(M, R).
Corollary 5.22. We have that dimR H p
dR(M, R) < ∞.
Proof. This follows from part (1) of Theorem 5.20. □
One can also prove this theorem using triangulation of manifolds. This is, however, not
much easier than the method we employed.
Elementary application. Let M be a compact, orientable manifold. We then have a
Poincar´ e duality. Put a metric on M and choose an orientation. Then ∗ gives an isomorphism
Hp(M, R) ∼= Hn−p(M, R).
depending on the choice of metric.
Here is a better statement: the pairing
H p
dR(M, R) × H n−p
dR (M, R) → R
(ω, η) ↦→
∫
M
ω ∧ η
is non-degenerate. To see this, it is enough to show that for everyp and every α ∈ H p
dR(M, R),
there is a β ∈ H n−p
dR (M, R) such that
∫
α ∧ β ̸= 0.


## Page 57

MATH 731: HODGE THEORY 57
For this, choose a metric, and choose ω ∈ H p(M, R) such that [ ω] = α. Then take β = [∗ω]
where ∗ω is also harmonic to obtain∫
M
ω ∧ ∗ω =
∫
M
⟨ω, ω⟩ dV = ⟨ ⟨ω, ω⟩ ⟩> 0
if ω ̸= 0. This implies the non-degeneracy of the Poincar´ e duality.
6. Hodge theory of complex manifolds
We now discuss Hodge theory for complex manifolds.
6.1. Linear algebra background. Let V be a ﬁnite-dimensional complex vector space.
Then VC = V ⊗R C = V′ ⊕ V′′ with each V′, V′′ isomorphic to V .
Deﬁnition 6.1. A Hermitian form on V is a bilinear map
V × V
h
→ C
such that h(v, w) = h(w, v).
Given such h, we write it as h = S + iA where S, A: V × V → R are bilinear over R and S
is symmetric, A is skew-symmetric. Note that
S(iv, w) + iA(iv, w) = i(S(v, w) + iA(v, w))
so
S(iv, w) = −A(v, w),
A(iv, w) = S(v, w).
It is easy to see that, giving a Hermitian form h on V is equivalent to giving a symmetric
bilinear form S : VR × VR → R such that S(iv, iw) = S(v, w) for all v, w. In this case,
A is deﬁned by A(v, w) = −S(iv, w). It is also equivalent to giving a skew-symmetric
bilinear form A: VR → VR → R such that A(iv, iw) = A(v, w). In this case, S is given by
S(v, w) = A(iv, w).
Deﬁnition 6.2. The Hermitian form h is a Hermitian metric such that h(v, v) > 0 for all
v ∈ V non-zero.
In this case, S = Sh given a scalar product on VR. This can be uniquely extended to a
Hermitian form Sh on VC. This is again a metric:
Sh(v + iw, v + iw) = Sh(v, v) + Sh(w, w) + i(Sh(w, v) − Sh(v, w)) = Sh(v, v) + Sh(w, w) > 0
if v + iw ̸= 0.
Lemma 6.3. The canonical isomorphism V ∼= V′ given by
V V′
V ⊗R C
∼=
proj


## Page 58

58 MIRCEA MUSTAT ¸ ˘A
is compatible with the Hermitian forms (up to a constant scalar factor).
Proof. Recall that if J : V → V is multiplication by i, then
V → V′
v ↦→ 1
2(v − iJv).
We then have
Sh
(1
2(v − iJv), 1
2(w − iJw)
)
= 1
4

(Sh(v, w) + Sh(Jv, Jw )  
Sh(v,w)
) − i(Sh(Jv, w) − Sh(v, Jw)  
−Sh(Jv,w )
)


= 1
2(Sh(v, w) − iSh(Jv, w))
= 1
2 h(v, w)
This is what we wanted to prove. □
Remark 6.4.
(1) If h: V × V → C is a Hermitian metric, we get an isomorphism V ∼= V∗ given by
v ↦→ hv = h(−, v).
Also, h: V × V → C, which gives a Hermitian metric on V . Combining these, we get
a Hermitian metric h∗ on V∗ such that
h∗(hv, hw) = h(v, w).
(2) Given a Hermitian metric h on V , we get Hermitian metric on all
p⋀V given by
⟨v1 ∧ · · · ∧ vp, w1 ∧ · · · ∧ wp⟩ = det(h(vi, wj)).
Given a Hermitian metric h on V , consider the Hermitian metric Sh on VC and use it to put
a Hermitian metric on all
p⋀(VC)∗.
Exercise. This is the same as using the scalar product Sh on V to get a scalar product on
p⋀V∗ and then extending this by linearity to a Hermitian linear form on (
p⋀V∗)C ∼=
p⋀(V∗
C).
Lemma 6.5. The decomopsition
p⋀
V∗
C ∼=
⨁
i+j=p


i⋀
(V′)∗ ⊕
j⋀
(V′′)∗


is orthogonal with respect to the Hermitian metric.


## Page 59

MATH 731: HODGE THEORY 59
Proof. To show this, it is enough to check that the decompositionVC = V′ ⊕V′′ is orthogonal
with respect to Sh. But:
Sh
(1
2(v − iJv), 1
2(w + iJw)
)
= 1
4
(
(Sh(v, w) + Sh(Jv, Jw )) + i(Sh(v, Jw) + Sh(Jv, w))
)
= 0
as required. □
Suppose (V, h) is as above. We have a scalar product Sh on V . Since V is a complex vector
space, we have a canonical orientation on V . Let n = dimC V . We get a canonical volume
element dV ∈
2n⋀V∗ ⊆
2n⋀V∗
C.
We hence have the Hodge operator
∗:
p⋀
V∗ ∼=→
2n−p⋀
V∗
which is an isomorphism of R-vector spaces. We extend scalars to C to get
∗:
p⋀
V∗
C
∼=→
2n−p⋀
V∗
C
We have the following analog of Proposition 5.3 which deﬁned ∗.
Lemma 6.6. For every ω, η ∈ ⋀p V∗
C , we have
ω ∧ ∗η = ⟨ω, η⟩dV.
Exercise. Check this, using the fact that we know this if ω, η ∈
p⋀V∗.
We write
p,q⋀V∗
C for
p⋀V′∗ ⊗
q⋀V′′∗.
Corollary 6.7. The map ∗ maps
p,q⋀V∗
C to
n−q,n−p⋀ V∗
C .
Recall that if w :
•⋀V∗
C →
•⋀V∗
C is the de Rham operator acting by muliplication with (−1)m
on
m⋀V∗C, then
∗∗ = w.
Note that ∗ is deﬁned by scalar extension from R, so it is a real operator, i.e. ∗ω = ∗ω.
6.2. Globalization. Let M be an n-dimensional complex manifold. We can always choose
on M a Hermitian metric. The key point is that a real positive function times a Hermitian
metric is still a Hermitian metric, and a ﬁnite sum of Hermitian metrics is still a Hermitian
metric, so we can construct such metrics locally and glue using partitions of unity.
Fix such a metric h. Then S = Re( h) is a Riemannian metric on M with the standard
orientation and we get a volume element dV which is a real ( n, n)-form on M. The ∗
operator
∗: Ap,q
M
∼= An−q,n−p
M


## Page 60

60 MIRCEA MUSTAT ¸ ˘A
is the unique map satisfying
⟨ω, η⟩dV = ω ∧ ∗η
(as in Lemma 6.6). Note that S also induces Hermitian metrics on all Am
M,C such that the
(p, q)-components are orthogonal.
From now on, suppose M is compact. We get Hermitian metrics on each Ap,q(M) by
⟨ ⟨ω, η⟩ ⟩=
∫
M
⟨ω, η⟩ dV =
∫
M
ω ∧ ∗η.
Note that ⟨ ⟨ω, ω⟩ ⟩> 0 unless ω = 0.
It is easy to say that the induced Hermitian metric on Am
M,C(M) = Am
M(M) ⊗R C is the one
induced by extending to complexiﬁcations of the one we associated before to the Riemannian
structure.
6.3. The operators ∂∗ and ∂
∗
. We have operators
∂ : Ap,q
M → A p+1,q
M
∂ : Ap,q → A p,q+1
M
such that d = ∂ + ∂. Recall that d∗ = − ∗ d ∗.
Deﬁnition 6.8. Deﬁne
∂∗ = − ∗ ∂ ∗: Ap+1,q
M → A p,q
M ,
∂
∗
= − ∗ ∂ ∗: Ap,q+1
M → A p,q
M .
Clearly, d∗ = ∂∗ + ∂
∗
.
Proposition 6.9. The partial (∂, ∂∗) and (∂, ∂
∗
) are formal adjoint pairs.
Proof. Let u ∈ A p,q(M), v ∈ A p+1,q(M). Then
⟨ ⟨u, ∂∗v⟩ ⟩=
∫
M
u ∧ ∗∂∗v
= −
∫
M
u ∧ ∗ ∗ ∂ ∗ v
= (−1)p+q+1
∫
M
u ∧ ∂ ∗ v  
(−1)p+q(∂(u∧∗v)−∂u∧∗v)
as ∗ ∗ = (−1)p+q
= −
∫
M
∂(u ∧ ∗v)  
=d(u∧∂v)
as ∂(··· )=0
+
∫
M
∂u ∧ ∗v
= 0 + ⟨ ⟨∂, v⟩ ⟩
where the ﬁrst term is 0 by Stokes theorem. The proof of the second adjointness is similar. □
Deﬁnition 6.10. Let ∆′ = ∂∂∗ + ∂∗∂, ∆′′ = ∂∂
∗
+ ∂
∗
∂.


## Page 61

MATH 731: HODGE THEORY 61
By Proposition 6.9, both ∆′ and ∆′′ are formally self-adjoint.
Deﬁnition 6.11. A form ω is
• ∂-harmonic if ∆′ω = 0,
• ∂-harmonic if ∆′′ω = 0.
We write
H(p,q)
∆′ (M) = {∂-harmonic (p, q)-forms}
H(p,q)
∆′′ (M) = {∂-harmonic (p, q)-forms}
As in the case of usual harmonic forms, one shows the following simple properties.
• A form ω is ∂-harmonic if and only if ∂ω = 0 and ∂∗ω = 0,
• A form ω is ∂-harmonic if and only if ∂ω = 0 and ∂
∗
ω = 0,
• We have that ∂∗ω = − ∗ ∂ ∗ ω = − ∗ ∂ ∗ ω = ∂
∗
ω, so ∆′ω = ∆′′ω, and hence
H p,q
∆′ (M)
∼=→ H q,p
∆′′(M)
ω ↦→ ω,
• Both ∆′ and ∆′′ commute with ∗: ∗∆′ = ∆′′∗, ∗∆′′ = ∆′∗. We check the ﬁrst equality
on (p, q)-forms:
∗(∂∂∗ + ∂∗∂) = − ∗ (∂ ∗ ∂ ∗ + ∗ ∂ ∗ ∂)
= − ∗ ∂ ∗ ∂ ∗ +(−1)p+q+1∂ ∗ ∂
and
∆′′∗ = (∂∂
∗
+ ∂
∗
∂)∗
= −(∂ ∗ ∂ ∗ + ∗ ∂ ∗ ∂)∗
= (−1)p+q+1∂ ∗ ∂ − ∗∂ ∗ ∂∗,
so the two agree. Altogether, we get isomorphisms
Hp,q
∆′ (M) Hn−q,n−p
∆′′ (M) Hn−p,n−q
∆′ (M).∗
∼=
conj
∼=
The same computation we have done for ∆ implies that
σ2(∆′)x(v) = −1
2 ∥v∥2 · Id = σ2(∆′′)x(v).
Hence, like ∆, the operators ∆ ′ and ∆′′ are elliptic operators. We may hence apply the
Fundamental Theorem of Elliptic Operators 5.20 to ∆′ and ∆′′.
Part (1) implies that
Hp,q
∆′ (M), Hp,q
∆′′(M)
are both ﬁnite-dimensional over C. Part (2) for ∆′′ gives an orthogonal decomposition
Ap,q(M) = Hp,q
∆′′(M)
⊥
⊕ Im(∆′′ : Ap,q(M) → A p,q(M))
= Hp,q
∆′′(M)
⊥
⊕ ∂(Ap,q−1(M))
⊥
⊕ ∂
∗
(Ap,q+1(M)).


## Page 62

62 MIRCEA MUSTAT ¸ ˘A
Moreover,
ker(∂ : Ap,q(M) → A p,q+1(M)) = Hp,q
∆′′(M)
⊥
⊕ ∂(Ap,q−1(M)).
The conclusion is that the Dolbeaux cohomology group
H p,q(M) = Hq(Ap,•(M), ∂) ∼= H q(M, Ωp)
is isomorphic to
Hp,q
∆′′(M).
Here is an application of the above theory. We have a pairing
H q(X, Ωp) × H n−p(X, Ωn−p) → C
([α], [β]) ↦→
∫
M
α ∧ β
where α is a (p, q)-form such that ∂α = 0, β is an (n − p, n − q)-form such that ∂β = 0. We
claim that this is a non-degenerate pairing. To check this, put a metric h on M. Given a
non-zero element in H q(X, Ωp), choose a ∂-harmonic representative α. If β = ∗α is harmonic
(so ∂β = 0), and ∫
M
α ∧ β = ⟨ ⟨α, α⟩ ⟩> 0.
7. K¨ahler manifolds
7.1. Linear algebra background:K¨ ahler metrics.Let V be a ﬁnite-dimensional vector
space over C. We write J for multiplication by i. We have a decomposition VC = V′ ⊕ V′′.
Giving a Hermitian form h on V is equivalent to giving a bilinear alternating form A: VR ×
VR → R such that
A(u, v) = A(Ju, Jv ) for all u, v.
Indeed, given h, we may deﬁne A = Im(h), and given A, we may deﬁne S(u, v) = A(Ju, v)
and h = S + iA.
Given A ∈
2⋀V∗
R, let ˜A ∈
2⋀V∗
C be the corresponding alternating bilinear form on VC. By
deﬁnition, ˜A is real.
We claim that
A(Ju, Jv ) = (u, v) if and only if ˜A is a (1 , 1)-form.
Indeed, ˜A is a (1,1) form if and only if ˜A(V′ × V′) = 0, ˜A(V′′ × V′′) = 0. Since ˜A(u, v) =
˜A(u, v), it is enough to check that ˜A(V′ × V′) = 0.
Recall that V′ = {u − iJu | u ∈ V }. We have that
˜A(u − iJu, v − iJv) = (A(u, v) − A(Ju, Jv )) − i(A(Ju, v) + A(u, Jv)).
From this, the ‘only if’ implication is clear and the ‘if’ implication follows since A takes real
values.


## Page 63

MATH 731: HODGE THEORY 63
Deﬁnition 7.1. The fundamental form of the Hermitian metric h is the real (1 , 1) form
ωh = − ˜A.
We now describe the fundamental form in a basis. Let x1, . . . , xn be a basis of V over C.
Let yj = Jx j so that
x1, . . . , xn, y1, . . . , yn
is a basis of VR.
Then a basis of V′ is e1, . . . , en and a basis of V′′ is e1, . . . ,en for
ej = 1
2(xj − iyj).
Given a Hermitian form h, we let hi,j = h(xi, xj) so that for v = ∑viei, w = ∑wjej,
h(v, w) =
∑
hi,jviwj.
Write ωh as ∑
j<k
λjke∗
j ∧ ek
∗
for some λjk. We compute it
λjk = ωh(ej, ek)
= −1
4
˜A(xj − iyj, xk + iyk)
= −1
4

(A(xj, xk) + A(yj, yk)  
A(xj ,xk)
) + i(A(xj, xk)  
−S(xk,xj)
− A(yj, xk)  
S(xj ,xk)
)


= −1
42 · (A(xj, xk) − iS(xj, xk))
= i
2(S(xj, xk) + iA(xj, xk))
= i
2 hj,k.
Therefore,
ωh = i
2
∑
j<k
hj,ke∗
j ∧ ek
∗.
Conclusions.
(1) This implies that h is a metric if and only if −iωh(v, v) > 0 for all v ̸= 0.
Hence: giving a Hermitian metric on V is equivalent to giving a real (1 , 1) form ω
with iω(v, v) > 0 for all v.
(2) Suppose x1, . . . , xn is an orthonormal basis of V . Then hj,k = δjk, so
ωh = i
2
n∑
k=1
e∗
kej
∗.


## Page 64

64 MIRCEA MUSTAT ¸ ˘A
Recall that S gives a top form dV . If x1, y1, . . . , xn, yn is a positive orthonormal basis
for S,
dV = x∗
1 ∧ y∗
1 ∧ · · · ∧ x∗
n ∧ y∗
n.
On the other hand, the formula above gives
ωn
h =
( i
2
)n
n! e∗
1 ∧ e1
∗ ∧ · · · ∧ e∗
n ∧ en
∗
Moreover,
e∗
j ∧ ej
∗ = (x∗
j + iy∗
j ) ∧ (x∗
j − iy∗
j ) = −2ix∗
j ∧ y∗
j .
The conclusion is that
ωn
h = n! · dV.
Deﬁnition 7.2. Let M be a complex manifold. A Hermitian metric h on M is K¨ ahlerif
the (real (1 , 1) form) ω = ωh is closed, i.e. dω = 0.
Example 7.3 (Trivial example). The manifold Cn with the standard metric is K¨ ahler. With
respect to the standard basis which is orthonormal for h,
ωh = i
2
n∑
j=1
dzj ∧ dzj
This is clearly closed.
Remark 7.4. The existence of a K¨ ahler metric is aglobal property. The issue is that we
cannot glue such metrics using partitions of unity any more. Why? If h is a K¨ ahler metric
with form ω and f is a smooth everywhere positive function, then f · h is a metric and
ωf h = f · ωh. However,
d(f ωh) = d f∧ ωh  
not necessarily 0
+ f dωh  
=0
.
Example 7.5 (Important example: the Fubini–Study metric on Pn). Let z0, . . . , zn be ho-
mogeneous coordinates on Pn and Uj = (zj ̸= 0). Let
ωj = i
2 ∂∂ log


n∑
k=0
⏐⏐⏐⏐⏐
zk
zj
⏐⏐⏐⏐⏐
2
 ∈ A1,1(Uj).
These glue to a global (1 , 1) form. Indeed, on Uj ∩ Uℓ:
∑ ⏐⏐⏐⏐⏐
zk
zj
⏐⏐⏐⏐⏐
2
=
(∑ ⏐⏐⏐⏐
zk
zℓ
⏐⏐⏐⏐
2)
·
⏐⏐⏐⏐⏐
zℓ
zj
⏐⏐⏐⏐⏐
2
so
log

∑
⏐⏐⏐⏐⏐
zk
zj
⏐⏐⏐⏐⏐
2
 = log
(∑ ⏐⏐⏐⏐
zk
zℓ
⏐⏐⏐⏐
2)
+ log
⏐⏐⏐⏐⏐
zℓ
zj
⏐⏐⏐⏐⏐
2
.
It is enough to note that ∂∂ log |wj|2 = 0 if w1, . . . , wn are coordinates on Cn. This is true
because |wj|2 = wjwj, so
log |wj|2 = log wj + log wj,
so
∂∂ log |wj|2 = 0 on Cn\(wj = 0).


## Page 65

MATH 731: HODGE THEORY 65
We have hence shown that
ωj = i
2 ∂∂ log


n∑
k=0
⏐⏐⏐⏐⏐
zk
zj
⏐⏐⏐⏐⏐
2

glue to
ω ∈ A1,1(Pn).
Since ∂2 = 0, ∂
2
= 0, ∂∂ + ∂∂ = 0, we see that ∂ω = ∂ω = 0, and since d = ∂ + ∂, dω = 0.
Therefore, ω is closed.
We ﬁnally need to check that ω deﬁnes a Hermitian metric. Note that
ωj = − i
2 ∂∂ log


n∑
k=0
⏐⏐⏐⏐⏐
zk
zj
⏐⏐⏐⏐⏐
2
 = i
2 ∂∂ log


n∑
k=0
⏐⏐⏐⏐⏐
zk
zj
⏐⏐⏐⏐⏐
2
 .
Let us check that iω(v, v) > 0 if v ̸= 0. Work on Uj ∼= Cn, zk
zj
= wk (and reorder coordinates
to assume that j = 0). Then
ωj = i
2 ∂∂ log

1 +
n∑
k=1
|wk|2

 .
Note that
∂ log(1 +
∑
|wk|2) =
n∑
k=1
wkdwk
1 +
n∑
ℓ=1
|ωℓ|2
and
∂
∂wj
(
wk
1 + ∑
ℓ |wℓ|2
)
= δjk
1 + ∑|wℓ|2 − wkwj
(1 + ∑|wj|2)2
which shows that
ωj = i
2

∑
k
dwk ∧ dwk
1 + ∑
ℓ |wℓ|2 −
∑
k,j
wkwjdwj ∧ dwk
(1 + ∑|wℓ|2)2

 .
Write
ajk = (1 +
∑
ℓ
|wℓ|2)δjk − wkwj.
We need to show that if v ̸= 0, then v · (ajk)vt > 0. Writing ( ·, ·) for the standard Hermitian
metric on Cn, we see that
v · (ajk)vt = (1 + (w, w))(v, v) −
∑
j,k
vjwkwjvk
  
(v,w)(w,v)
= (v, v)  
>0
+ ((w, w) · (v, v) − |(v, w)|2)  
≥0 by Cauchy–Schwartz inequality
> 0.
Therefore, ω is a K¨ ahler metric onPn.


## Page 66

66 MIRCEA MUSTAT ¸ ˘A
Remark 7.6. If h is a Hermitian metric on M and M′ ↪→ M is a submanifold, then the
restriction h′ of h to TM′ is a Hermitian metric on M′, and ωh′ = ωh|M′. In particular, if h
is K¨ ahler,h′ is also K¨ ahler.
Upshot. If X is a smooth quasi-projective complex algebraic variety, we have a locally
closed immersion X ↪→ PN such that Xan is a submanifold of ( PN)an. By restriction of the
Fubini–Study metric to Xan, Xan has K¨ ahelr metrics.
Example 7.7 (Complex tori). Let M = V /Λ where V is an n-dimensional complex vector
space and Λ ⊆ V is a lattice (i.e. V ∼= Cn and Λ ∼= Z2n ⊆ Cn).
If h is the standard Hermitian metric on Cn, with the form ω = i
2
n∑
k=1
zk ∧ zk, and γλ : V → V
is the translation by some λ ∈ Λ, then
γ∗
λ(ω) = ω.
Then h induces a metric on the quotient M, which is again K¨ ahler.
Note that we will later see that for Λ general, M is not algebraic . This hence gives an
example of K¨ ahler manifolds which are not algebraic.
The next goal is to show that K¨ ahler metrics are not far from the standard one. Suppose
p ∈ M. Choose coordinates z1, . . . , zn in a chart around P such that zi(P ) = 0 for all i.
Suppose h is a Hermitian metric on M, with fundamental form
ω = i
2
∑
j,k
hj,kdzj ∧ dzk.
We will say that ω osculates to order 2 to the standard metric at P (in these coordinates) if
hj,k(0) = δjk,
∂hj,k
∂zℓ
(0) = 0,
∂hj,k
∂zℓ
(0) = 0.
Proposition 7.8. Given a Hermitian metric h with fundamental form ω, h is K¨ ahler if and
only if for all p ∈ M, there is a chart as above such that ω osculates to order 2 with the
standard metric.
Proof. Write ω = i
2
∑
j,k
hj,kdzj ∧ dzk. Then
dω = i
2
∑
j,k,ℓ
∂hj,k
∂zℓ
dzℓ ∧ dzj ∧ dzk − i
2
∑
j,k,ℓ
∂hj,k
∂zℓ
dzj ∧ dzℓ ∧ dzk.
It is clear that if ∂hjk
∂zℓ
(p) = 0 = ∂hj,k
∂zℓ
(0), this implies that dω(p) = 0. If this holds at every p,
ω is closed.


## Page 67

MATH 731: HODGE THEORY 67
Conversely, suppose dω = 0. It is easy to see that there is a linear change of variables such
that hj,k(0) = δjk. We will assume that this holds. Let
ajkℓ = ∂hj,k
∂zℓ
(p), a ′
jkℓ = ∂hjk
∂zℓ
(p).
If dω(p) = 0, we must have
(7) ajkℓ = aℓkj, a ′
jkℓ = a′
jℓk.
Moreover, since ω is real, we have that hjk = hkj, so
∂hj,k
∂zℓ
= ∂hkj
∂zℓ
,
which shows that
(8) ajkℓ = a′
kjℓ.
Now, do the change of variables
wj = zj + 1
2
n∑
k,ℓ=1
akjℓzkzℓ.
We want to compare ω with i
2
n∑
j=1
dwj ∧ dwj.
We have that
dwj = dzj + 1
2
n∑
k,ℓ=1
akjℓ(zkdzℓ + zℓdzk)
= dzj +
n∑
k,ℓ=1
akjℓzkdzℓ by equation (7)
dwj = dzj +
n∑
k,ℓ=1
a′
jkℓzkdzℓ by equation (8).
Therefore,
i
2
n∑
j=1
dwj ∧ dwj = i
2
n∑
j=1
dzj ∧ dzj
+ i
2
∑
k,ℓ,j
a′
jkℓ
=
∂hj,ℓ
∂zk
(p)
zkdzj ∧ dzℓ + i
2
∑
k,ℓ,j
akjℓ
∂hℓj
∂zk
(p)zkdzℓ ∧ dzj
+ terms vanishis at p with order ≥ 2.
Therefore, ω = i
2
n∑
j=1
dwj ∧ dwj + terms vanishis at p with order ≥ 2. □


## Page 68

68 MIRCEA MUSTAT ¸ ˘A
7.2. Operators on K¨ ahler manifolds. We have ∗, d, ∂, ∂ and the adjoints d∗, ∂∗, ∂
∗
.
Given the K¨ ahler metrich, with fundamental form ω, the Lefschetz operator is
L = ω ∧ −: Ap,q
M → A p+1,q+1
M .
We also deﬁne Λ = ∗−1L∗: Ap,q
M → A p−1,q−1
M .
Note that since ω is a real form, L is a real operator (i.e. it commutes with conjugation).
Since ∗ is a real operator, Λ is a real operator.
Lemma 7.9. The operator Λ is the adjoint of L, i.e.
⟨Lα, β⟩ = ⟨α, Λβ⟩
for every (p, q)-form α and (p + 1, q + 1)-form β.
Proof. Recall that α ∧ ∗β = ⟨α, β⟩dV . Then
⟨α, Λβ⟩dV = α ∧ ∗(∗−1L∗)β
= α ∧ ω ∧ ∗β
= (α ∧ ω) ∧ ∗β
= Lα ∧ ∗β
= ⟨Lα, β⟩dV.
□
Theorem 7.10 (K¨ ahler Identities). We have:
(1) [ ∂
∗
, L] = i∂,
(2) [ ∂∗, L] = i∂,
(3) [Λ , ∂] = i∂∗,
(4) [Λ , ∂] = −i∂
∗
.
Proof. We only need to prove (1). The other ones follow from the formulas:
[P, Q]∗ = [Q∗, P∗], (λP )∗ = λP∗.
We prove (1). Suppose ﬁrst that we deal with a (rescaling by 2) of the standard metric on
Cn, i.e.
ω = i
n∑
j=1
dzj ∧ dzj.
A similar computation to that for d∗ gives the expression
∂
∗

∑
I,J
fI,J dzI ∧ dzJ

 = −
∑
I,J
k
∂fI,J
∂zk
· i ∂
∂zk
(dzI ∧ dzJ).
Writing η = ∑
I,J
fI,J dzI ∧ dzJ, we have that
[∂
∗
, L]η = ∂
∗
(ω ∧ η) − ω ∧ ∂
∗
η.


## Page 69

MATH 731: HODGE THEORY 69
Hence
∂
∗
η = −i
∑
I,J
k,j
∂fI,J
∂zk
i ∂
∂zk
(dzj ∧ dzj ∧ dzI ∧ dzJ)
+ i
∑
I,J
j,k
∂fI,J
∂zk
dzj ∧ dzj ∧ i ∂
∂zk
(dzI ∧ dzJ).
Since i ∂
∂zk
is a derivation, this gives
∂
∗
η = −i
∑
I,J
k,j
∂fI,J
∂zk
i ∂
∂zk
(dzj ∧ dzj)
  
−δjk dzj
∧dzI ∧ dzJ)
= i
∑
I,J
k
∂fI,J
∂zk
dzk ∧ dzI ∧ dzJ
= i∂η.
This gives the result for the standard metric. In the general case, to check that [ ∂
∗
, L] = i∂
at p ∈ M, choose a chart where ω osculates to order 2 with the standard metric (Proposi-
tion 7.8), i.e.
ω = i
∑
j,k
hj,kdzj ∧ dzk
and
hj,k(P ) = δjk,
∂hj,k
∂zℓ
(P ) = 0,
∂hj,k
∂zℓ
(P ) = 0.
Since both ∂
∗
and ∂ are diﬀerential operators of order 1, the diﬀerence with respect to
the computation for the standard metric will only involve the derivatives ∂hj,k
∂zℓ
(P ), ∂hj,k
∂zℓ
(P ).
These vanish, which gives the result. □
Corollary 7.11. If (M, h) is a K¨ ahler manifold, then∆′ = ∆′′ = 1
2∆.
Proof. We compute:
∆′′ = ∂∂
∗
+ ∂
∗
∂
= i(∂(∂Λ − Λ∂)) + i(∂Λ − Λ∂)∂
= i∂∂Λ − iΛ∂∂ + i(∂Λ∂ − ∂Λ∂).
Note that i∂∂ is a real operator, since i∂∂ = −i∂∂ = i∂∂. Moreover, L, Λ are both real
operators and so is i(∂Λ∂ − ∂Λ∂). Overall, this shows that ∆ ′′ is a real operator. Since we
know that ∆′′ = ∆′, this shows that ∆′ = ∆′′.


## Page 70

70 MIRCEA MUSTAT ¸ ˘A
Let us now compute ∆:
∆ = dd∗ + d∗d
= (∂ + ∂)(∂∗ + ∂
∗
) + (∂∗ + ∂
∗
)(∂ + ∂)
= (∂∂∗ + ∂∗∂) + (∂∂
∗
+ ∂
∗
∂) + (∂∂
∗
+ ∂∂∗ + ∂∗∂ + ∂
∗
∂).
We now show that ∂∂
∗
+ ∂
∗
∂ = 0. Indeed,
∂∂
∗
+ ∂
∗
∂ = i∂(∂Λ − Λ∂) + i(∂Λ − Λ∂)∂ = −i∂Λ∂ + i∂Λ∂ = 0.
Then the above computation shows that
∆ = ∆′ + ∆′′ + (∂∂
∗
+ ∂
∗
∂) + (∂∂
∗
+ ∂
∗
∂) = ∆′ + ∆′′.
Using ∆′ = ∆′′, this completes the proof. □
7.3. Consequence: the Hodge decomposition. We ﬁnally talk about the consequences.
Recall that we have
Hm(M, C) = space of complex m-harmonic forms on M
= Hm(M) ⊗R C
= null(∆M).
Since ∆ = 2∆ ′ = (2∆′′), the decomposition of Am(M) ⊗R C into ( p, q)-parts, induces a
decomposition
Hm(M, C) =
⨁
p+q=m
Hp,q(M)
which are harmonic ( p, q)-forms.
We saw (Hodge Theorem 5.21) that the inclusion of Hm(M) into closed real m-forms induces
an isomorphism
Hm(M) ∼= H m
dR(M, R).
Tensoring with C, this gives
Hm(M, C) ∼= H m
dR(M, C).
If H p,q(M) is the image of Hp,q(M), then we get the Hodge decomposition
H m
dR(M, C) =
⨁
p+q=m
H p,q.
Recall that Hp,q
∆′ = Hq,p
∆′′. Since ∆′ = ∆′′, this shows that
H p,q = H q,p.
We also know that Hp,q
∆′′(M) ∼= H q(M, Ωp), so
H p,q ∼= H q(M, Ωp).
Deﬁnition 7.12. The Betti numbers of M are bm = dimC H m(M, C).
The Hodge numbers of M are hp,q = dimC H q(M, Ωp).


## Page 71

MATH 731: HODGE THEORY 71
Numerically, the above assertions imply that
bm =
∑
p+q=m
hp,q
and the Hodge symmetry:
hp,q = hq,p.
In particular, bm(M) is even for all m odd.
Therefore, computing these numbers for a manifold might show that it is not K¨ ahler.
Example 7.13. Recall the Hopf surface
M = C2 \ {(0, 0)}
(z1, z2) ∼ (2z1, 2z2)
from Example 3.15. We checked that M is diﬀeomorphic to S3 × S1 and K¨ unneth formula
then shows that b3(M) = 1, so M is not K¨ ahler.
7.4. Independence of metric. The next goal is to show that the decompositionH m(M, C) =⨁
p+q=m
H p,q is independent of the choice of metric.
Deﬁnition 7.14. The Bott–Chern cohomology of M is
H p,q
BC(M) = {(p, q)-forms u | ∂u = 0, ∂u = 0}
∂∂Ap−1,q−1(M) .
Note that ∂∂v = d(∂v), so we have a canonical map
H p,q
BC(M) → H p+q
dR (M, C).
Theorem 7.15. This map gives an isomorphism of H p,q
BC(M) and H p,q(M).
Lemma 7.16 (∂∂-Lemma). Let M be a K¨ ahler manifold andu be a global form on M such
that ∂u = 0 and ∂u = 0. Then the following are equivalent:
(1) u ∈ im(d),
(2) u ∈ im(∂),
(3) u ∈ im(∂),
(4) u ∈ im(∂∂).
Proof. Note that ∂∂v = d(∂v) and ∂∂ = −∂∂, so clearly (4) implies (1), (2), (3).
It suﬃces to prove that (1), (2), (3) imply (4). First, write u = ∂v for some v. By Hodge
Theorem 5.21 for ∂, we may write
v = v1 + ∂v2 + ∂
∗
v3
for some v1 harmonic and some v2, v3. Then
(9) u = ∂∂v2 + ∂∂
∗
v3.


## Page 72

72 MIRCEA MUSTAT ¸ ˘A
By Corollary 7.11, ∆ = ∆′ + ∆′′ so ∂∂
∗
= −∂
∗
∂. Hence ∂u = 0, equation (9) implies that
0 = ∂∂ ∂v2  
=−∂
2
∂v2=0
+∂∂ ∂
∗
v3 = ∂∂ ∂
∗
v3.
Hence ∂∂
∗
∂v3 = 0. If ∂∂
∗
η = 0,
0 = ⟨ ⟨∂∂
∗
η, η⟩ ⟩= ⟨ ⟨∂
∗
η, ∂
∗
η⟩ ⟩
so ∂
∗
η = 0. This shows that ∂
∗
∂v3 = 0, so
u = ∂∂v2.
If u ∈ im(∂), apply the previous argument for u to shows that u ∈ im(∂∂).
Finally, if u = d(w) = ∂w + ∂w, we see that ∂u = 0 implies that ∂∂w = 0 and ∂∂w = 0. By
the (3) implies (4) implication for ∂w, we see that ∂w ∈ im(∂∂). Similarly, ∂u = 0 implies
that ∂w ∈ im(∂∂), so u ∈ im(∂∂). □
Recall that H p,q
BC(M), which was deﬁned as
{global (p, q)-forms u | ∂u = 0, ∂u = 0}
∂∂Ap−1,q−1(M) .
We hence have a map
ϕ: H p,q
BC → H p+q
DR (M, C)
u ↦→ [u].
Recall that
H p,q(M) = {α ∈ H p+q
dR (M, C) | α = [η], η is a harmonic ( p, q)-form}.
We check that H p,q
BC lands in this piece of de Rham cohomology. Since ∂u = 0, the Hodge
Theorem 5.21 for ∂ implies that
u = v + ∂w
for some harmonic ( p, q)-form v. Then 0 = ∂u = ∂∂w and ∂∂w = 0, so the ∂∂-Lemma 7.16
for ∂w shows that ∂w ∈ im(d), so [ u] = [v] in H p+q
dR (M, C).
This shows that im( ϕ) ⊆ H p,q(M). Moreover, since a harmonic ( p, q)-form satisﬁes ∂η = 0,
∂η = 0, ϕ is surjective by Hodge Theorem 5.21.
Finally,ϕ is injective by the implication (1) implies (4) in ∂∂-Lemma 7.16.
Corollary 7.17. The map ϕ induces an isomorphism H p,q
BC(M) ∼= H p,q(M).
Corollary 7.18.
(1) If α ∈ H p,q(M), β ∈ H p′,q′
(M), α ∪ β ∈ H p+p′,q+q′
(M).
(2) If f : M′ → M is a holomorphic map of complex manifolds of K¨ ahler type, the pullback
maps on cohomology
f∗ : H m
dR(M, C) → H m
dR(M′, C)
map each H p,q(M) to H p,q(M′).


## Page 73

MATH 731: HODGE THEORY 73
Proof. For (1), Corollary 7.17 allows us to write
• α = [u] for a ( p, q)-form u such that ∂u = 0, ∂u = 0,
• β = [v] for a ( p′, q′)-form v such that ∂v = 0, ∂v = 0.
We then have that
∂(u ∧ v) = ∂u ∧ v ± u ∧ ∂v = 0,
∂(u ∧ v) = 0,
and α ∪ β = [u ∧ v] ∈ H p+p′,q+q′
(M) by Corollary 7.17.
In (2), for α ∈ H p,q(M), use Corollary 7.17 to write α = [ u] for a ( p, q)-form u such that
∂u = 0, ∂u = 0. Then
f∗α = [f∗u]
and
∂(f∗u) = f∗(∂u) = 0,
∂(f∗u) = 0.
Using Corollary 7.17, this shows that f∗α ∈ H p,q(M′). □
We prove one more consequence which will be useful later, when we discuss applications to
the Kodaira Vanishing Theorem.
Corollary 7.19. Suppose M is a compact manifold of K¨ ahler type. Consider he map C →
OM. The induced morphisms in cohomology
H q(M, C) → H q(M, OM)
are surjective.
Proof. Compute the maps in cohomology using soft resolutions (cf. Theorem 4.26). We have
C (A•
M ⊗R C, d),
OM (A0,•
M , ∂).
proj
For every α ∈ H q(M, OM), there is a harmonic (0, q)-form u such that α = [u]. In particular,
du = 0 implies that α ∈ im(H q(M, C) → H q(M, OM)). □
7.5. Hard Lefschetz Theorem.


## Page 74

74 MIRCEA MUSTAT ¸ ˘A
7.5.1. Lefschetz decomposition for diﬀerential forms. Let M be a compact K¨ ahler manifold
and ω be the fundamental form of the K¨ ahler metric. We have two operators (that play a
role in the K¨ ahler Identities 7.10):
L: A•
M,C → A•+2
M,C real and takes ( p, q)-forms to ( p + 1, q + 1)-forms,
η ↦→ ω ∧ η,
Λ: A•
M,C → A•−2
M,C Λ = ∗−1L ∗ is the adjoint of L.
Proposition 7.20. We have [L, Λ] = H where Ak
M,C
H
→ A k
M,C is (k − n)Id and n = dim M.
Remarks 7.21. Both L and Λ are linear operators and we only need to check this point-
wise, so it is enough to check it when we have a complex vector space V with a Hermitian
metric h and ω = −Im(h).
Moreover, these are real operators, so it will be enough to consider their eﬀect on
m⋀V∗. The
ideas is to
(1) check this for dim C V = 1,
(2) show that if V = V′ ⊥
⊕ V′′ and if we know the assertion for V′, V′′, then we get it
for V .
We remark that L, Λ, H give the generators of the Lie algebra of SL 2. We might discuss this
later in the class.
The next three classes were typed by David Schwein.
Proof of Proposition 7.20. Both L and Λ are linear operators and to check this we need only
check it pointwise, that is, on a vector space V with Hermitian metric h and ω = −Im(h).
Moreover, since these operators are real, it is enough to consider their eﬀect on
m⋀V∗. We
induct on n = dim V (= dim X).
When n = 1, take x ∈ V such that h(x, x) = 1, so that x and y = Jx is a basis for the
vector space VR. Let x′, y′ be the dual basis of Hom R(V, R) over R. The volume element is
x′ ∧ y′ = ω. The ∗ operator thus acts as
1 ↦→ ω ω ↦→ 1 x′ ↦→ y′ y′ ↦→ −x′
while Λ : ω ↦→ 1. Hence [ L, Λ] := LΛ − ΛL acts as follows:
on A0 by 1 ↦→ 1,
on A1 by x′, y′ ↦→ 0,
on A2 by ω ↦→ ω.
For the induction step, consider an orthogonal decomposition V = V1 ⊕ V2 with respect to h:
k⋀
V∗ =
⨁
k1+k2=k
( k1⋀
V∗
1 ⊗
k2⋀
V∗
2
)
.


## Page 75

MATH 731: HODGE THEORY 75
Hence the volume element in
2n⋀V∗ is the tensor product of volume elements in
n1⋀V∗
1
and
n2⋀V∗
2 , where ni = dim Vi. Thus the ∗ operator acts as
k1⋀
V∗
1 ⊗
k2⋀
V∗
2 →
2n1−k1⋀
V∗
1 ⊗
2n2−k2⋀
V∗
2
η1 ⊗ η2 ↦→ (−1)k2(2n1−k1) ∗1 (η1) ⊗ ∗2(η2).
Writing ω = ω1 + ω2, we see that
L(η1 ⊗ η2) = L1(η1) ⊗ η2 + η1 ⊗ L2(η2).
The formula for ∗(η1 ⊗ η2) now shows that
Λ(η1 ⊗ η2) = Λ1(η1) ⊗ η2 + η1 ⊗ Λ2(η2).
Hence
[L, Λ](η1 ⊗ η2) = L(Λ1η1 ⊗ η2 + η1 ⊗ Λ2η2) − Λ(L1η1 ⊗ η2 + η1 ⊗ L2η2)
= L1Λ1η1 ⊗ η2 + Λ1η1 ⊗ L2η2 + L1η2 ⊗ Λ2η2 + η1 ⊗ L2Λ2η2
− Λ1L1η1 ⊗ η2 − L1η1 ⊗ Λ2η2 − Λ1η1 ⊗ L2η2 − η1Λ2L2η2
= [L1, Λ1]η1 ⊗ η2 + η1 ⊗ [L2, Λ2]η2.
By induction, this quantity is
(k1 − n1)η1 ⊗ η2 + (k2 − n2)η1 ⊗ η2 = (k − n)η1 ⊗ η2. □
Corollary 7.22. We have that [Lr, Λ] = r(k − n + r − 1)Lr−1 on Ak
M,C.
Proof. We induct on r ≥ 1. Proposition 7.20 is the base case r = 1. For the induction step,
write
[Lr, Λ] = LrΛ − ΛLr = L(Lr−1 − ΛLr−1) + (LΛ − ΛL)Lr−1 = L[Lr−1, Λ] + [L, Λ]Lr−1.
By the inductive hypothesis, this expression equals
(r − 1)(k − n + r − 2)Lr−1 + (k + 2(r − 1) − n)Lr−1
Simplifying this gives the result. □
Proposition 7.23. Let n = dim M and 0 ≤ k ≤ n. The map Ln−k : Ak
M,C → A 2n−k
M,C is an
isomorphism. It induces an isomorphism Ap,q
M → A p+n−k,q+n−k
M,C (where p + q = k).
Proof. Evidently Ln−k is a morphism of vector bundles of the same rank. (To see this for
the bottom map, check that
(n
p
)(n
q
)
=
( n
p+n−k
)( n
q+n−k
)
.) Hence it suﬃces to prove injectivity
on ﬁbers; in particular, the statement on k-forms implies the statement on ( p, q)-forms.
To prove it, induct on k ≥ 0. The case k = 0 follows from our earlier calculation that
ωn = n!vol. For the induction step, ﬁx k ≥ 1. We will show by induction on 0 ≤ r ≤ n − k
that if Lrα = 0 for a k-form α then α = 0. The case r = 0 is trivial. For the induction step,
suppose Lrα = 0. Then by Corollary 7.22 above,
LrΛα = [Lr, Λ]α = r(k − n + r − 1)Lr−1α.
So Lr−1(LΛα − r(k − n + r − 1)α) = 0 and the induction hypothesis implies that
LΛα − r(k − n + r − 1)α = 0.


## Page 76

76 MIRCEA MUSTAT ¸ ˘A
Returning to the induction on k, our assumptions on r imply that k − n + r − 1 < 0, so that
α = Lβ for a (k−2)-form β. Hence Ln−kα = 0 and Ln−k+1β = 0. By the induction hypothesis
on k, the operator Ln−(k−2) is injective on ( k − 2)-forms. So β = 0 and thus α = 0. □
We will now use this operator to decompose the space of diﬀerential forms, as in the title.
Deﬁnition 7.24. Let 0 ≤ k ≤ n = dim M. A k-form α is primitive if Ln−k+1α = 0. Write
Prim(Ak
M,C) for the space of primitive k-forms.
Since L is real, the form α is primitive if and only ifα is primitive. Since L has bidegree (1, 1),
the form α is primitive if and only if all of its ( p, q)-components are primitive. Evidently Li
is injective on Ak−2i since by the proposition, Ln−(k−2i) is injective and n − k + 2i ≥ i.
Proposition 7.25 (Lefschetz Decomposition for Forms). There is a decomposition
Ak
M,C =
⨁
i≥0
Li Prim(Ak−2i
M,C ), (0 ≤ k ≤ n).
Proof. We induct on k. When k = 0, the decomposition is clear: all 0-forms are primitive.
For the induction step, given a k-form α, the form α − Lβ is primitive for some ( k − 2)-
form β if and only if Ln−k+1(α − Lβ) = 0, or equivalently, Ln−k+1α = Ln−k+2β. Since β
is a ( k − 2)-form, Proposition 7.23 implies that there is a unique (k − 2)-form β with this
property, that is, such that α = α0 + Lβ with α0 primitive. To conclude, use the induction
hypothesis for β. □
There is a similar decomposition when k ≥ n, an easy corollary of the decomposition of the
proposition:
Ak
M,C =
⨁
i≥0
Li+k−n(Prim A2n−k−2i
M,C ).
Note that Li+k−n is injective on A2n−k−2i
M,C since i + k − n ≤ n − (2n − k − 2i).
7.5.2. Lefschetz Decomposition for Cohomology Classes.
Lemma 7.26. A k-form α is primitive if and only if Λα = 0.
Proof. Note that L is injective on A<n
M,C. Hence Λ = ∗−1L∗ is injective on A<n
M,C, so we may
assume k ≤ n without loss of generality. Our earlier computation of [ Lr, Λ] shows that
Ln−k+1Λα = ΛLn−k+1α.
Since Ln−k+1α is a (2n − k + 2)-form and Λ is injective on A>n, the righthand side vanishes
if and only if α is primitive. Moreover, since Λ α is a (k − 2)-form and Ln−k+2 is injective on
(k − 2)-forms, the lefthand side is zero if and only if Λ α = 0. □
Consequently, if k ≤ n and α = Liβ with β a primitive (k − 2i)-form then
Λα = ΛLiβ = LiΛβ − [Li, Λ]β = i(k − 2i − n + i − 1)Li−1β.
Hence
Λ(Liβ) = i(n − k + i + 1)Li−1β.


## Page 77

MATH 731: HODGE THEORY 77
This equation shows how Λ acts on the Lefschetz decomposition. For example, if α is a
k-form with k ≤ n then Λα is primitive if and only if α = α0 + Lα1 with α0 and α1 primitive,
and in this case, Λ α = (n − k + 2)α1.
Lemma 7.27. We have that [∆, L] = 0.
Proof. Recall that ∆ = 2∆ ′′, ∆′′ = ¯∂ ¯∂∗ + ¯∂∗ ¯∂, and [ ¯∂∗, L] = i∂, and that if d ω = 0 then
∂ω = 0 and ¯∂ω = 0. In this case
[¯∂, L]η = ¯∂(ω ∧ η) − ω ∧ ¯∂η = ¯∂ω ∧ η = 0.
So
[∆′′, L] = (¯∂ ¯∂∗ + ¯∂∗ ¯∂)L − L(¯∂ ¯∂∗ + ¯∂∗ ¯∂) = ¯∂[¯∂∗, L] + [¯∂∗, L]¯∂,
using that ¯∂L = L¯∂. Hence [∆′′, L] = ¯∂i∂ + i∂ ¯∂ = 0 and [∆ , L] = 0. □
Consequently, if α is harmonic then Lα is harmonic, and conversely, if k ≤ n and i ≤ n − k
then whenever Liα is harmonic, so is α. Hence for k ≤ n, the isomorphism Ln−k : Ak
M,C
∼
− →
A2n−k
M,C induces an isomorphism
Hk
M,C
∼
− → H2n−k
M,C
between spaces of harmonic forms.
Theorem 7.28 (Hard Lefschetz). For k ≤ n, the map
[ω]k ∪ (−) : Hk
dR(M, C) → H2n−k
dR (M, C)
is an isomorphism.
The fact that the spaces are isomorphic follows from Poincar´ e duality as well, but Hard
Lefschetz is a much more useful statement. For example, it implies for k ≤ n − 2 that
bk(M) ≤ bk+2(M). This statement has consequences in combinatorics: one can show a
sequence of numbers to be unimodal by realizing it as the Betti numbers of a K¨ ahler manifold.
Deﬁnition 7.29. For k ≤ n, a cohomology class α ∈ Hk
dR(M, C) is primitive if [ω]n−k+1∪α =
0.
If we choose a harmonic k-form η such that α = [η] then
[ω]n−k+1 ∪ α = [Ln−k+1η].
Hence α is primitive if and only if η is primitive.
Lemma 7.30. For k ≤ n and α a k-form with Lefschetz decomposition α = ∑Liαi (where
αi is primitive), then α is harmonic if and only if all αi are harmonic.
Proof. It is clear that if each αi is harmonic then so is α; we prove the converse by induction
on k, the base case k = 0 being trivial. We saw that [∆ , L] = 0, so that [∆ , Λ] = 0. Since α
is harmonic, ∆ α = 0 and therefore Λ α is harmonic. We saw earlier that
Λα =
∑
i≥1
i(n − k + i + 1)Li−1αi.
Induction now shows that αi is harmonic for all i ≥ 1; so Liαi is harmonic for all i ≥ 1, and
α0 is harmonic. □


## Page 78

78 MIRCEA MUSTAT ¸ ˘A
Theorem 7.31 (Lefschetz for Cohomology). For k ≤ n there is a decomposition
Hk
dR(M, C) =
⨁
i≥0
LiHk−2i
prim(M, C)
where L := [ ω] ∪ (−) and Hj
prim(M, C) ⊆ Hj
dR(M, C) is the set of primitive cohomology
classes.
Since ω is a real (1, 1)-form, the Lefschetz decomposition is compatible with the real structure
and the decomposition into ( p, q)-subspaces.
7.6. The Hodge-Riemann bilinear relations. The primitive part of H k(M) is the piece
not accounted for by lower degree cohomology:
dim H k
prim(M) = bk(M) − bk−2(M).
In this section, we investigate the sign of some natural bilinear pairings on cohomology. More
speciﬁcally, let (M, h) be a compact complex manifold of dimension n with K¨ ahler structure
and fundamental form ω. Given two k-form α and β, we can consider∫
M
ωn−k ∧ α ∧ β;
this deﬁnes a pairing on the space of k-forms. Our goal is to understand the positivity
properties of this pairing.
Deﬁnition 7.32. For k ≤ n and α, β ∈ Γ(M, Ak
M,C) deﬁne
Hk(α, β) = ik
∫
M
ωn−k ∧ α ∧ β.
We make several observations about this pairing.
(1) The pairing H k is clearly bilinear in α and Hermitian because
Hk(β, α) = ik
∫
ωn−k ∧ β ∧ α = (−i)k
∫
ωn−k ∧ α ∧ β = Hk(α, β).
(2) The pairing H k induces a bilinear form on Hk
dR(M, C), denoted also by Hk: if d α = 0,
dβ = 0, and one of α or β is exact then∫
M
ωn−k ∧ α ∧ β = 0,
by Stokes’s Theorem and the fact that d ω = 0.
(3) The Lefschetz decomposition of H k
dR(M, C) is orthogonal with respect to this decom-
position: if α = Liγ and β = Ljδ with γ and δ primitive harmonic representatives
then
Hk(α, β) = 0
because
ωn−k ∧ Liγ ∧ Ljδ = Ln−k+i+jγ ∧ δ,
so that Ln−(k−2i)+1γ = 0 by primitivity of γ.


## Page 79

MATH 731: HODGE THEORY 79
(4) The map Lj : Hk−2j
prim (M, C) → Hk
dR(M, C) is an isometry up to a sign:
Hk(Ljα, Ljβ) = ik
∫
M
ωn−k+2j ∧ α ∧ β, Hk−2j(α, β) = ik−2j
∫
M
ωn−k+2j ∧ α ∧ β.
Therefore, to understand the sign of all H k on H k(M, C) it is enough to understand
them on the primitive cohomology.
(5) The Hodge decomposition H k
dR(M, C) = ⨁
p+q=k
Hp,q(M) is orthgonal with respect
to H k: for α a ( p, q)-form and β a ( p′, q′)-form, to have a nonzero integral we need
ωn−k ∧ α ∧ β to have type ( n, n), meaning that p = p′ and q = q′.
Theorem 7.33 (Hodge-Riemann Bilinear Relations) . For k ≤ n and (p, q) with p + q = k,
the Hermitian form
(−1)k(k−1)/2ip−q−kHk
is positive-deﬁnite on Hp,q
prim(M).
The key ingredient of the proof is a formula for ∗α when α is primitive.
Proposition 7.34. Let α be a primitive (p, q)-form with k = p + q. Then
∗Ljα = (−1)k(k+1)/2ip−q j!
(n − k − j)! Ln−k−jα, j ≤ n − k.
In particular, ∗α = ( −1)k(k+1)/2ip−qLn−kα. We will return to the proof of the proposition
after using it to prove the theorem.
Proof of Hodge–Riemann Bilinear Relations 7.33. Let 0 ̸= α be a primitive (p, q)-form. Then
(−1)k(k−1)/2
(n − k)! ip−q
∫
M
ωn−k ∧ α ∧ α = (−1)k
∫
M
(∗α) ∧ α =
∫
M
α ∧ (∗α)
=
∫
M
⟨α, α⟩ dvol = ⟨ ⟨α, α⟩ ⟩> 0. □
Proof of Proposition 7.34. This is only a sketch since the proof is similar to earlier ones. Like
before, we reduce it to a problem of linear algebra. Consider a complex vector space V of
dimension n with a Hermitian metric. From here, the proof proceeds by induction on n. For
the base case n = 1, one checks by hand the four cases ( j, k) = (0, 0), (0, 1), (1, 0), (1, 1). For
the inductive step, suppose V = V1 ⊕ V2 with dim V2 = 1 and x, y as before. (That is, x is
a basis for V with h(x, x) = 1 and y := Jx, so that {x, y} is a basis for VC.) Then
( k⋀
V∗
)
C
=
( k⋀
V∗
1
)
C
⊕
(k−1⋀
V∗
1 ⊗R
⋀
V∗
2
)
C
⊕
(k−2⋀
V∗
1 ⊗R
2⋀
V∗
2
)
C
.
Consider an element
α = αk + α′
k−1 ⊗ x′ + α′′
k−1 ⊗ y′ + αk−2 ⊗ ω
where {x′, y′} is the basis of V∗
C dual to the basis {x, y}. Applying Λ yields
Λα = Λ1αk + Λ1α′
k−1 ⊗ x′ + Λ1α′′
k−1 ⊗ y′ + Λ1αk−2 ⊗ ω + αk−2.


## Page 80

80 MIRCEA MUSTAT ¸ ˘A
The form α is primitive if and only if Λ α = 0, and by setting the terms of each degree equal
to zero, we see that this condition is equivalent to the simultaneous vanishing of Λ 1α′
k−1 and
Λ1α′′
k−1, that is, the primitivity of α′
k−1 and α′′
k−1. Now compute ∗Ljα using induction. □
Remark 7.35. For other geometric objects and cohomology theory, one hopes to have
the same elements of the “K¨ ahler package” as in the classical case we have studied so far:
Poincar´ e duality, Hard Lefschetz, and the Hodge-Riemann bilinear relations. For exam-
ple, intersection cohomology (for projective singular algebraic varieties) also satisﬁes these
conditions.
Typing by AH continues.
Theorem 7.36 (Hodge Index Theorem). If dim M = n = 2m and the form on H n(M, R)
(α, β)
Q
↦→
∫
M
α ∧ β
has signature
n∑
p,q=0
(−1)php,q.
Note that the signature is a topological invariant, so this alternating sum of the Hodge
numbers is a topological invariant.
Note also that we are considering H n(M, R), the cohomology with real coeﬃcients. To use
the Lefschetz and Hodge decompositions, we will have to tensor with C and note that spaces
such as H m,m and H p,q + H q,p descend to R.
Proof. We consider the Hodge and Lefschetz decomposition:
H n(M, R) =
⨁
j≥0
LjH m−j,m−j
prim (M)R ⊕
⨁
p>q
p+q=2m
⨁
j≥0
Lj
(
H p−j,q−j
prim (M) ⊕ H q,p
prim(M)
)
R
.
If α ∈ H m−j,m−j
prim (M, R), then by the Hodge–Riemann Relations 7.33:
(−1)m−j
∫
M
ωn−j ∧ α ∧ α > 0.
If α ∈ H p−j,q−j
prim (M, C), then by the Hodge–Riemann Relations:
(−1)m−jip−q
  
(−1)q−j
∫
M
ωn−jα ∧ α > 0, where p + q = 2m.
If β ∈ H q−j,p−j
prim (M, C), then by the Hodge–Riemann Relations 7.33:
(−1)p−j
  
(−1)q−j
∫
M
ωn−j ∧ β ∧ β , where p + q = 2m.


## Page 81

MATH 731: HODGE THEORY 81
Note that α + β ∈ (H p,q
prim + H q,p
prim)R if and only if α + β = β + α, i.e. β = α. Hence
(−1)q−j
∫
M
(α + β) ∧ (α + β)  
α∧α+β∧β+α∧α+β∧β
∧ωn−j = (−1)q−j
∫
α ∧ α ∧ ωn−j + (−1)q−jβ ∧ β ∧ ωn−j
> 0
if α ̸= 0. The ﬁrst equality above follows since ωn−j ∧ α ∧ α and ωn−j ∧ β ∧ β are not
(n, n)-forms, so their integrals are 0.
Therefore, we see that the signature of Q is
signature(Q) =
∑
j≥0
(−1)m−jhm−j,m−j
prim + 2
∑
p+q=n
p>q
∑
j≥0
(−1)q−jhp−j,q−j
prim
=
∑
p+q=n
∑
j≥0
(−1)q−jhp−j,q−j
prim
=
∑
p+q=n
∑
j≥0
(−1)q−j(hp−j,q−j − hp−j−1,q−j−1)
=
∑
a+b=n−(even,≥0)
(−1)bha,b +
∑
a+b=n−2−(even,≥0)
(−1)bha,b
=
∑
a+b=even
(−1)bha,b ha,b = hn−a,n−b
Finally:
∑
a+b=odd
(−1)bha,b = 0
since ha,b = hb,a and (−1)a = −(−1)b if a + b is odd. □
Example 7.37. Suppose n = 2. The signature of
H2(M, R) × H2(M, R) → R
(α, β) ↦→
∫
M
α ∧ β
is
∑
a+b even
(−1)bha,b = h0,0

=1
+h0,2 + −h1,1 + h2,0 + h2,2

=1
= 2 + 2h2,0 − h1,1.
One can check that on
(
H2,0(M) ⊕ H0,2(M)
)
R, the form (α, β) ↦→
∫
α∧β is positive-deﬁnitive
by the computation in the proof of the Hodge Index Theorem 7.36.
Conclusion. The signature of the intersection form on H1,1(M)R is (1, h1,1 − 1).
Hartshorne: part from ample line bundle –¿ everything else contributes to the negative part.


## Page 82

82 MIRCEA MUSTAT ¸ ˘A
8. Chern classes of line bundles
Let M be a complex manifold (more generally, an analytic space). We have the sheaf OM
of holomorphic functions on M. Let
O∗
M = sheaf of invertible holomorphic functions on M, a group under multiplication .
We have a map
OM → O∗
M
f ↦→ exp(f)
of sheaves of abelian groups. Locally on C∗, we have a holomorphic inverse of exp, so the
map OM → O×
M is surjective.
What is its kernel? If U ⊆ M is open and connected, then f ∈ O(U) is such that exp(f) = 1
if and only if f = 2πik for some k ∈ Z.
We have a short exact sequence:
0 Z OM O×
M 0
n 2πin
f exp(f).
The long exact sequence in cohomology gives:
H1(M, Z) H1(M, OM) H1(M, O×
M) H2(M, Z) H2(M, OM).
This is an interesting sequence because H1(M, Z) is topological, H1(M, OM) is coherent
cohomology, and H1(M, O×
M) is the Picard group of M.
Indeed, by deﬁnition,
Pic(M) =
({holomorphic line bundles }
∼ , ⊗
)
so we have an isomorphism
Pic(M) ∼= ˇH1(M, O∗
M).
On every topological space, for every sheaf of abelian groups F, there is a canonical isomor-
phism
H1(M, F) ∼= ˇH1(M, F).
(This is an exercise in [Har77].)
We write
c1 : Pic(M) → H2(M, Z)
L ↦→ c1(L)
and call c1(L) the Chern class of L.


## Page 83

MATH 731: HODGE THEORY 83
Exercise. Check functoriality of Chern classes: if f : M′ → M is holomorphic and L ∈
Pic(M), then
c1(f∗L) = f∗(c1(L)).
Next , we will check that given L, if we choose a metric on L, we get a closed, real 1-1 form ω
on X such that
c1(L) = [ω].
Moreover, if X is algebraic, L is ample, then ω is positive.
Let M be a complex manifold and L be a line bundle on M. Consider a cover M = ⋃
j
Uj
such that we have an isomorphism
ϕj : L|Uj
∼=→ O Uj
Γ(Uj, L) ∋ σj ←[ 1
and gjk ∈ O(Uj ∩ UK)∗ is such that ϕk ◦ ϕ−1
j is multiplication by gjk.
To give a global section of L is to give fj ∈ O(Uj) such that fk = fjgjk. Note also that
σj = σk · gjk on Uj ∩ Uk for all j, k.
Recall that a Hermitian metric on L is a smoothly varying family of functions on the ﬁbers
of L. Given cover as above, consider the smooth function hj = h(σj, σj): Uj → R>0. This
satisﬁes
hj = |gjk|2hk.
Conversely, a family of such functions with this compatibility property induces a Hermitian
metric on L.
Suppose h is a metric on L and we are given a cover as above. On each Uj, consider
ωj = 1
2πi ∂∂ log hj.
This is a smooth (1 , 1)-form on Uj. Note that on Uj ∩ Uk:
log hj = log |gjk|2 + log hk.
Since gjk are holomorphic:
∂∂ log |gjk|2 = ∂∂(log gjk + log gjk) = 0.
This shows that ωj glue together to a global (1 , 1) form ω on M. We sometimes write ωh for
this form to indicate the Hermitian metric h it corresponds to.
Note that:
(1) since ωj = ∂∂(· · ·), dωj = 0, so ω is closed,
(2) since i∂∂ is a real operator and hj are real functions, ω is a real form,
(3) hence: ω is K¨ ahler (the fundamental form of a K¨ ahler metric) if and only if−iω(v, v) >
0 for all v ̸= 0.
Proposition 8.1. Given a Hermitian metric h on L with corresponding form ωh, the image
of c1(L) in H2(M, R) is [ωh].


## Page 84

84 MIRCEA MUSTAT ¸ ˘A
Proof. Since M is a smooth manifold, there is an open cover M = ⋃
j
Uj such that all
intersections Uj0 ∩ · · · ∩Ujk are contractible. Moreover, we can choose this as ﬁne as needed,
so we may assume
L|Uj
∼= OUj for all j.
As in the deﬁnition of c1(L), we consider the short exact sequence
0 Z OM O×
M 0
n 2πin
f exp(f).
Then [ L] ∈ Pic(M) corresponds to ( gjk) ∈ H1(M, O×
M). Since all Uj are contractible,
H p(Uj, Z) = 0 for all p > 0. Hence
gjk = exp( ˜gjk)
for some holomorphic ˜gjk on Uj ∩ Uk. Then
Z ∋ njkl = 1
2πi (˜gkℓ − ˜gjℓ + ˜gjk) on Ujkℓ,
so
njkℓ ∈ ˇH2(U , Z).
We need to understand the isomorphism
ˇH2(U , R) ∼= H2
dR(M).
Consider the double complex C•,• where
C p,q =
⨁
i0<···<iq
Γ(Ui0 ∩ · · · ∩ Uiq; Aq
M).
If we ﬁx ( i0, . . . , iq), the corresponding de Rham complex of Ui0 ∩ · · · Uiq is acyclic, with
cohomology in degree 0 equal to
Γ(Ui0 ∩ · · · ∩ Uiq , R).
We get an isomorphism
ˇH p(U , R) ∼= H p(Tot(C•,•)).
Similarly, if we ﬁx p, we get the Cech complex with respect to U for Ap. Since Ap is soft,
this is again acyclic, with cohomology in degree 0 equal to
Γ(M, Ap).
We get an isomorphism:
H p
dR(M) ∼= H p(Tot(C•,•)).
Consider


## Page 85

MATH 731: HODGE THEORY 85
⨁
j
Γ(Uj, A0) ⨁
j
Γ(Uj, A1) ⨁
j
Γ(Uj, A2)
⨁
j<k
Γ(Uj ∩ Uk, A0) ⨁
j<k
Γ(Uj ∩ Uk, A1) ⨁
j<k
Γ(Uj ∩ Uk, A2)
For ωj = 1
2πi ∂∂ log hj, we may write ωj = dβj for
βj = 1
2πi ∂ log hj.
We write these elements in the corresponding places of the above diagram
(∗) (βj) (ωj)
(∗) (βk|Uk∩Uj , −βj|Uk∩Uj) (∗)
We have that
βk − βj = 1
2πi ∂(log hk − log hj)
= − 1
2πi ∂( ˜gjk + ˜gjk)
= − 1
2πi ∂ ˜gjk
= ∂ 1
2πi ˜gjk
= d
( 1
2πi ˜gjk
)
.
Therefore, [ω] ∈ H2
dR(M) maps in ˇH2(U , R) to
1
2πi (˜gkℓ − ˜gjℓ + ˜gjk) = njkℓ = njkℓ.
This completes the proof. □
Recall that on Pn, we have the Fubini–Study metric (Example 7.5) with corresponding form
ωF S given in homogeneous coordinates z0, . . . , zn, on Uj = (zj ̸= 0) by
ωF S|Uj = i
2π ∂∂ log
n∑
k=0
⏐⏐⏐⏐⏐
zk
zj
⏐⏐⏐⏐⏐
2
.


## Page 86

86 MIRCEA MUSTAT ¸ ˘A
We claim that there is a metric h on O(1) such that ωh = ωF S. Indeed, this is okay if
hj =


n∑
k=0
⏐⏐⏐⏐⏐
zk
zj
⏐⏐⏐⏐⏐
2

−1
.
Since gjk = zj
zk
, we have that
hj = |gjk|2hk.
Therefore, this choice of hj deﬁnes a metric h on O(1) whose form ωh gives the Fubini–Study
form ωF S.
Remarks 8.2.
(1) If f : M′ → M is holomorphic and L is a line bundle on M with Hermitian metric h,
we get a Hermitian metric h′ on L′ = f∗L such that
ωh′ = f∗ωh.
(2) If X is a smooth projective variety with ample line bundle L, there is an N > 0
and X
i
↪→ Pm such that LN ∼= i∗O(1). Then the metric we had on OPm(1) induces
a metric on LN such that the corresponding form is K¨ ahler. By replacing (hj) with
(h1/N
j ), we get a metric on L with positive (1 , 1)-form.
The upshot is that we can apply Hard Lefschetz Theorem 7.28 or Lefschetz decomposition
for c1(L) when L is an ample line bundle on a smooth projective algebraic variety.
Theorem 8.3 (Kodaira’s Embedding Theorem). If X is a compact K¨ ahler manifold whose
fundamental class is the Chern class of a line bundle L ∈ Pic(M), then X is algebraic and L
is ample.
Remark 8.4 (Lefschetz Theorem on (1 , 1)-classes). Let M be a complex manifold. Recall
the exponential sequence:
0 Z OM O×
M 0
exp(2πi−)
whose long exact sequence in cohomology gives the Chern class map
c1 : Pic M ∼= H1(M, O∗
M) → H2(M, Z).
If M is compact and K¨ ahler andL ∈ Pic M, the image of c1(L) in H2(M, C) lies in H1,1(M).
Conversely, if α ∈ H2(M, Z) whose image in H2(M, C) lies in H1,1, then there exists L ∈
Pic(M) such that α = c1(L).
Indeed, it is enough to show that the image of α in H2(M, OM) is 0. However,
image of α H2(M, C)
0 H2(M, OM) = H0,2(M)
projection with respect to
Hodge decomposition
induced by C→OM


## Page 87

MATH 731: HODGE THEORY 87
Example 8.5 (Hodge Decomposition for tori). Let V be a complex vector space of dimension
n and L ⊆ V be a lattice, i.e. L ∼= Z2n and L ⊗Z R ∼= V . Then
M = V /L is a compact K¨ ahler manifold of dimensionn.
Let π : V → M be the projection map. This is a covering space by a simply connected space,
so
π1(M) ∼= L.
Hence
H1(M, Z) ∼= π1(M)ab ∼= L,
and
H1(M, Z) ∼= L∗ = HomZ(L, Z).
We have a canonical map
∗⋀
H1(M, Z) → H∗(M, Z)
given by the cup product. This is an isomorphism by K¨ uneth since sinceM is homeomorphic
to (S1)n.
Now,
H1(M, R) = HomZ(L, Z) ⊗ R = HomR(V, R) = V∗
R
and hence
H1(M, C) = V∗
R ⊗R C = V∗ ⊕ V∗.
The group action on M allows us to trivialize the tangent bundle:
TM = T0M ⊗R C∞
M = V ⊗R C∞
M .
For the cotangent bundle:
Am
M ∼=
m⋀
V∗ ⊗R C∞
M
Ap,q
M
∼=
p⋀
V∗ ⊗R
q⋀
V∗ ⊗C C∞
M,C.
Choosing an isomorphism V ∼= Cn and the standard metric on Cn which is translation
invariant, we get a metric on M.
Let us see the Hodge decomposition for H1. Clearly, V∗ ⊆ H1,0 ⊆ Γ(M, A1,0
M ). Since the
sheaf of holomorphic forms is also trivial,
dim H1,0 = dim H0(M, ΩM) = dimC V∗.
This shows that
H1,0 = V∗,
and
H0,1 = V∗.
This also implies that the Hodge decomposition for H m(M, Z) has
H p,q =
p⋀
V∗ ⊗
q⋀
V∗.
Indeed, the ⊇ inclusion follows from the Hodge decomposition for H1, and since we know
where each of these pieces lies, we must have equality.


## Page 88

88 MIRCEA MUSTAT ¸ ˘A
Remark 8.6. If L is general and n ≥ 2, then M is not algebraic.
We present a sketch of the proof for n = 2. Let z1, z2 be coordinates on C2 and ω be the
form on M induced by dz1 ∧ dz2. This is a holomorphic 2-form.
If C is a smooth algebraic curve and f : C → M is a non-constant holomorphic map, then
f∗(ω) = 0 since dim C = 1.
Equivalently, considering [C] ∈ H2(C, Z), we have that
f∗([C]) ∈ H2(M, Z)
The the assertion that f∗(ω) = 0 is equivalent to
[ω] ∩ f∗([C]) = 0.
(Here, we can think of [ ω] as a homology class via Poincar´ e duality).
General fact. If M is algebraic, then f∗([C]) ̸= 0.4
If we write it in terms of the basis of H2(M, Z) = ⋀2 L and if L is described by a matrix(
a1 a2 a3 a4
b1 b2 b3 b4
)
(where the lattice L is generated by the columns of this matrix), using
the fact that
[ω] ∩ (generators of H2(M, Z) ∼=
2⋀
L)
is given by the 2×2 minors of the matrix, there is an non-trivial relalation with C-coeﬃcients
between these 6 minors. Indeed, f∗([C]) ̸= 0 and [ ω] ∪ f∗([C]) = 0 is such a relation.
However, for a1, · · · , an, b1, . . . , bn general in C, these 6 minors are linearly independent.
Therefore, M is not algebraic.
9. Algebraic cycles and some cohomology computations
A detailed exposition of this topic together with complete proofs is on the course website:
http://www-personal.umich.edu/~mmustata/SingularCohomology.pdf
9.1. Two theorems in algebraic topology. Recall that a map π : M1 → M2 islocally
trivial with ﬁber F if there is an open cover M2 = ⋃
i
Ui such that
π−1(Ui) Ui × F
Ui
homeomorphism
In our setup, the cover will always be ﬁnite.
4We will soon discuss such statements in more generality, so we restrict ourselves to this statement for
now.


## Page 89

MATH 731: HODGE THEORY 89
Theorem 9.1 (Leray–Hirsch). Suppose π : X → Y is locally trivial with ﬁber F . Suppose
all H i(F, Z) are free, ﬁnite-generated, and we have α1, . . . , αn ∈ H∗(X, Z) such that for all
y ∈ Y , their restriction to H∗(π−1(y), Z) is a basis, we have an isomorphism
H∗(Y ) × Zn → H∗(X),
(β, (m1, . . . , mn)) ↦→ π∗(β) ∪ (m1α1 + · · · + mn ∪ αn).
Proof. If X = Y × F , this follows from K¨ unneth. If we have a ﬁnite trivial cover, we argue
by induction on the number of sets in the cover, using Mayer–Vietoris.
We do not prove this in more generality. □
Next, suppose E → X is oriented, real vector bundle of rank r. Write Ex = π−1(x).
The choice of orientation is equivalent to a choice of a compatible system of generators for
each H r(Ex, E \ {0}, Z) ∼= Z.


## Page 90

90 MIRCEA MUSTAT ¸ ˘A
Theorem 9.2.
(1) There is a unique cohomology class ηE ∈ H r(E, E \ X, Z) (where X ↪ → E is the
0-section) such that for all x ∈ X, the restriction of ηE to H r(Ex, Ex \ {0}, Z) is the
chosen orientation.
(2) For every closed subset W ⊆ X, we have an isomorphism
H j−r(X, X \ W, Z)
∼=→ H j(E, E \ W, Z),
β ↦→ π∗(β) ∪ ηE.
Proof. First, treat the case E = M × Rn using K¨ unneth. Then, proceed by induction on the
number of elements in a trivial cover of E using Mayer–Vietoris.
We do not prove this in more generality. □
Deﬁnition 9.3. The unique cohomology class ηE in the theorem is the Thom class of E.
The isomorphism in part (2) of the theorem is the Thom isomorphism.
Suppose Y is a smooth real manifold of dimension n and X is a smooth real closed subman-
ifold of dimension m. Suppose X and Y are both oriented. Since
det(NX/Y ) = det(TY )|X ⊗ det(TX)−1,
NX/Y is oriented of rank n − m.
Theorem 9.4 (Tubular Neighborhood Theorem) . There is an open neighborhood of X in
Y and a retraction r : U → X such that
X U X
X NX/Y X,
=
r
≃ =
π
i.e. NX/Y is homeomorphic to U.
Let r = n − m. For W ⊆ X closed, we have that
H j(X, X \ W, Z) ∼= H j+r(NX/Y , NX/Y \ W, Z) Theorem 9.2 (2)
∼= H j+r(U, U\W, Z) Theorem 9.4
∼= H j+r(Y, Y \ W, Z) excision .
In particular, for W = X, we get an isomorphism
H j(X, Z) ∼= H j+r(Y, Y \X, Z).
Then the long exact sequence in cohomology becomes
H p−1(Y \ X, Z) → H p−r(X, Z) → H p(Y, Z) → H p(Y \ X, Z).
The map
H p−r(X, Z) → H p(Y, Z)
is denoted by i∗ if i: X ↪→ Y is the inclusion and called the Gysin homomorphism.


## Page 91

MATH 731: HODGE THEORY 91
Recall that if X is compact, oriented, smooth manifold of dimensionn, there is a fundamental
class µx ∈ Hn(X, Z) and the map
H p(X, Z) → Hn−p(X, Z)
α ↦→ α ∪ µx
is an isomorphism. This is the strongest statement of Poincar´ e duality.
If f : X → Y is a smooth map between compact oriented smooth manifolds and n = dim Y ,
m = dim X, r = n − m, we have:
H p(X, Z) H p+r(Y, Z)
Hm−p(X, Z) Hn−p−r(Y, Z)
f∗
∼=PD ∼=PD
f∗
The map on cohomology is also called the Gysin map.
Fact 9.5. If f is the inclusion of a closed submanifold, this agreed with the previous deﬁnition
of the Gysin map.
9.2. Special features for algebraic varieties. Before moving on to the computations of
cohomology groups, we make a few general statements about the special features for algebraic
varieties.
(1) If X is a complete complex algebraic variety of dimension n, Xan has a triangular-
ization with simplices of dimension at most 2 n. Moreover, if Y ⊆ X is a closed
subvariety, we can ﬁnd a compatible triangulizations for Xan and Y an.
(2) (Nagata’s Theorem) If W is any complex algebraic variety, there is an open immersion
W ↪→ X to a complete algebraic variety X.
Using (1), one can show that all H p(W, Z), Hp(W, Z) are ﬁnitely-generated.
Given any complete irreducible algebraic variety X, of dimension n, we have a fundamental
class µX ∈ H2n(X, Z).
• If X is smooth, this is clear.
• In general, use resolution of singularities to construct π : Y → X which is proper,
birational, with Y smooth, and take µX = π∗µY .
We claim that this does not depend on π. If we had π : Y → X and π′ : Y′ → X,
we may construct some ˜Y mapping to both Y and Y′ (the Hiranaka hat) and show
that µY and µY′ are both pushforwards of µ ˜Y .
It is hence enough to show that if W → Y is proper, birational, with W , Y smooth
and complete, then f∗µW = µY . Since H2n(Y ) = ZµY , where n = dim Y , we certainly
know that f∗µW = d · µY for some d ∈ Z. We just need to show that d = 1.
To check this, tensor with R and use de Rham cohomology. We have that
H2n(Y, R) ∼= H2n
dR(Y )∗
µY ↦→
(
[ω] ↦→
∫
Y
ω
)
.


## Page 92

92 MIRCEA MUSTAT ¸ ˘A
To check that f∗µW = µY , modulo these identiﬁcation, it is enough to check that if
ω is a 2 n-form on Y , then
∫
Y
ω =
∫
W
f∗(ω).
This is clear since f is a diﬀeomorphism outside a measure 0 subset.
One can argue similarly to show that: if f : W → X, with W , X are smooth, complete with
f surjective and generically ﬁnite, then
f∗µW = deg(f) · µX.
Exercise. Use the projection formula 5 to show that
f∗f∗α = deg(f) · α
on H∗(X).
In particular, f∗ is injective with Q-coeﬃcients, and f∗ is injective with Z-coeﬃcients if f is
birationals.
Here is a more general result.
Fact 9.6. If f : X → Y is a surjective holomorphic map of compact complex manifolds, with
X K¨ ahler,
f∗ : H i(Y, Q) → H i(X, Q)
is injective.
A proof of this is given in the notes on singular cohomology on the website.
Remark 9.7. If X is a smooth, complete variety, and Y ⊆ X is an irreducible closed
subvariety with
i: Y ↪ → X
with dim X = n, dim Y = m, r = n − m, then
i∗µY ∈ H2m(X, Z)
PD
∼= H2r(Y, Z).
This is the cohomology class of Y , denoted [ Y ].
We can extend this to cycles. If
α =
r∑
i=1
niYi
and codim(Yi) = r, then we deﬁne
[α] =
∑
ni[Yi] ∈ H2r(X, Z).
5The projection formula is f∗(f ∗(α) ∪β) =α ∪f∗(β)


## Page 93

MATH 731: HODGE THEORY 93
Example 9.8. Suppose X is a smooth complete variety and D is a smooth divisor on X.
Then
[D] = c1(OX(D)).
This is true even if D is just a prime divisor.
More generally, suppose X is a smooth complete variety and D1, . . . , Dr are smooth divisors,
intersecting transversely. For Y = D1 ∩ · · · ∩ Dr, induction on r shows that
[Y ] = c1(O(D1)) ∪ · · · ∪ c1(O(Dr)).
As a special case, take r = n = dim X. Under the isomorphism H2n(X) ∼= Z,
c1(O(D1)) ∪ · · · ∪ c1(O(Dn)) = #Y.
Example 9.9. If X = Pn, h = c1(O(1)),
hr = [Lr]
where Lr ⊆ Pn is a linear subspace of codimension r.
In particular, hn = 1 via H2n(Pn, Z) ∼= Z.
Exercise. Let X be a smooth, complete complex algebraic variety. Let Y ⊆ X be a smooth
irreducible closed subvariety of codimension r. Let j : Y ↪ → X. We then have maps
H p(X) H p(Y )
H p+2r(X)
j∗
j∗
Show that
(1) j∗j∗α = α ∪ [Y ] for all α ∈ H∗(X),
(2) j∗j∗β = β ∪ j∗[Y ] for all β ∈ H∗(Y ).
Hint. For (1), use the description of j∗ via Poincar´ e duality and the projection formula. For
(2), use the description of j∗ via the Thom isomorphism.
Remark 9.10. If f : Y → X is a holomorphic map of compact K¨ ahler manifolds, we deﬁned
f∗ : H p(Y ) → H p+2r(X)
where r = dim X − dim Y via Poincar´ e duality. Using the behavior of Poincar´ e duality with
respect to the Hodge composition, after tensoring with C, we get that
f∗(H i,j(Y )) ⊆ H i+r,j+r.
In particular, if X is a smooth complete algebraic variety and Y ⊆ X is an irreducible closed
subvariety of codimension r, then
[Y ] ∈ H2r(X)
and the image of [ Y ] in H2r(X, C) lies in H r,r(X).
Indeed, if ˜Y → Y is a resolution of singularities and m = dim Y , then
µ ˜Y ∈ H2n( ˜Y )
PD
∼= H0( ˜Y )


## Page 94

94 MIRCEA MUSTAT ¸ ˘A
is of type (0,0).
Deﬁnition 9.11. If X is a smooth projective complex algebraic variety, the set of Hodge
classes is deﬁned as
Hdgp(X) = {α ∈ H2p(X, Q) | the image of α in H2p(X, C) lies in H p,p}.
Let Zp(X)Q be the Q-vector space with basis given by codimension p irreducible subvarieties.
By Remark 9.10, we have a linear map
Z p(X)Q → Hdgp(X)
∑
niYi ↦→
∑
i
ni[Yi].
Conjecture (Hodge Conjecture). This is a surjective map.
Remark 9.12. The Hodge Conjecture 9.2 holds for p = 1, even with Z-coeﬃcients. Indeed,
we showed that if α ∈ H2(X, Z) has image in H1,1, then α = c1(L) for some L ∈ Pic(X). If
L = O(D) with D = ∑niDi, α = ∑ni[Di].
Remark 9.13. However, the Hodge Conjecture 9.2 is not true in general with Z-coeﬃcients.
Atiyah–Hirzebruch constructed a counterexample using a torsion class. Later, Kollar gave a
non-torsion example.
As a parenthesis, we mention the following result.
Theorem 9.14 (Lefschetz Hyperplane Theorem) . Let X be a smooth projective complex
algebraic variety and D ⊆ X be a smooth divisor such that L = O(D) is ample. If j : D ↪→ X
is the inclusion, then
j∗ : H p(X, Z) = H p(D, Z)
is an isomorphism for p ≤ n − 2 and injective for p ≤ n − 1, where n = dim X.
Sketch of proof. Recall that j∗j∗α = [D] ∪ α = c1(L) ∪ α. Hard Lefschetz 7.28 implies that
this is injective on H p(X, Q) for p < n . Hence j∗ is also injective on H p(X, Q) for p ≤ n − 1.
Proving the isomorphism for p ≤ n − 2 is harder. The key ingredient of the proof (due
to Andreotti-Frankel) is the following result: If Y is an aﬃne complex algebraic variety of
dimension n, Y has the homotopy type of a CW complex of dimension ≤ n. The proof uses
Morse theory. In particular, for p > n :
Hp(Y, Z) = 0,
H p(Y, Z) = 0.
In our setting, L is ample, so X \ D is aﬃne, hence this result applies. The long exact
sequence in cohomology gives:
H p−1(X \ D, Z) H p−2(D, Z) H p(X, Z) H p(X \ D, Z),
j∗


## Page 95

MATH 731: HODGE THEORY 95
so j∗ : H p−2(D) → H p(X) is an isomorphism if p − 1 > n and surjective if p > n . Hence
j∗H2n−p(X) → H2n−p(D)
is an isomorphism if p ≥ n + 2, i.e. 2n − p ≤ n − 2, and injective if p ≥ n + 1. □
9.3. Some cohomology computations.
Example 9.15 (The projective space Pn). We show that
H i(Pn, Z) ∼=
{
Z if 0 ≤ i ≤ 2n and i is even,
0 otherwise .
We use induction on n. The case n = 0 is trivial. For the inductive step, consider Pn−1 ∼=
H ⊆ Pn such that
Pn \ H ∼= Cn
is contractible. The long exact sequence for i > 0 gives
0 H i−1(Pn \ H) H i−2(Pn−1) H i(Pn) H i(Pn \ H) = 0.
Hence for i ≥ 2, we have that H i(Pn) ∼= H i−2(Pn−1). Moreover, H1(Pn) = 0 and H0(Pn) =
H0(Pn \ H) ∼= Z.
Clearly, the Hodge decomposition is such that
H2k(Pn, C) = H k,k(Pn)
(by Hodge symmetry). In particular,
H q((Pn)an, Oan
Pn) = 0
for q > 0. (Recall that we assumed this when proving GAGA 3.34. We ﬁnally arrived at a
proof.)
In fact, we have that
H∗(Pn, Z) ∼= Z[h]/(hn+1)
where h = c1(O(Q)). Why? We note that
H2n(Pn, Z)
∼=→ H0(Pn, Z),
hn ↦→ 1,
since we have n hyperplanes intersecting transversely in 1 point. Since H2k(Pn, Z) ∼= Z we
have that hk ∈ H2k(Pn, Z) is nonzero. For every α ∈ H2k(Pn, Z), we can write α = u · hk for
some u ∈ Q, whence
α ∪ hn−k ↦→ deg(αuhn−k) ∈ Z
uhn ↦→ u
and α ∪ hn−k = uhn, showing that u ∈ Z.
We may summarize the example as follows:


## Page 96

96 MIRCEA MUSTAT ¸ ˘A
H∗(Pn, Z) Z[x]/(xn+1)
c1(O(q))i xi
∼=
By the Leray–Hirsch Theorem 9.1, if E is a rank r + 1 vector bundle on any X and
π : P(E) → X
is the associated map, then
H∗(X) ⊗Z Z[x]/(xr+1)
∼=→ H∗(P(E))
αxi ↦→ π∗(α) ∪ c1(O(1))i.
In particular,
H p,q(P(E)) ∼=
r⨁
i=0
H p−i,q−i(X).
Remark 9.16. The isomorphism H∗(X) ⊗Z Z[x]/(xr+1)
∼=→ H∗(P(E)) is a group isomor-
phism, not a ring isomorphism, In general, c1(O(1))r+1 ̸= 0. By looking at its coeﬃcients
in H∗(X), we get Chern classes of ci(E).
Exercise. Suppose X is compact. Show that for 0 ≤ i ≤ r:
π∗(π∗(α) ∪ c1(O(1))i) =
{
0 if i < r
α if i = r.
We now compute the cohomology of the blow-up.
Proposition 9.17. Let X be a smooth projective complex variety and Y ⊆ X be a smooth
closed subvariety of codimension r. Let:
˜X X
E Y
ι
ϕ
be the blow-up along Y , where E is the exceptional divisor. Then, for all p,
H p( ˜X, Z) ∼= H p(X, Z) ⊕
r−1⨁
i=1
H p−2i(Y, Z)
π∗α0 + ι∗
r−1∑
i=1
c1(OE(1))i−1 ←[ (α0, . . . , αr−1).
Sketch of proof. We have long exact sequences (suppressing the coeﬃcient ring, Z, from
notation):


## Page 97

MATH 731: HODGE THEORY 97
H p−1(X \ Y ) H p−2r(Y ) H p(X) H p(X \ Y )
H p−1(X \ Y ) H p−2(E) H p( ˜X) H p( ˜X \ E)
= ϕp π∗ ∼= π∗
We know that E is a projective bundle over Y of rank r and hence
H p−2(E) ∼=
r⨁
i=1
H p−2i(Y ).
Note that the map ϕp is not given explicitly. One can, however, show the following.
Exercise. We have that ϕ∗ ◦ ϕp = IdHp−2r(Y ). Equivalently, using the previous exercise, the
projection onto the last component of ϕp is the identity on H p−2r(Y ).
The the conclusion follows by a diagram chase. (Check this! For example, for surjectivity,
one sees that any class in H p( ˜X) is a sum of a class in H p(X) and H p−2(E), and the result
follows from the exericse.) □
10. Pure Hodge structures
We now discuss an abstract (linear algebra) setting which Hodge theory ﬁts into.
Deﬁnition 10.1. A pure (integral) Hodge structure of weight m is given by:
(1) a ﬁnitely-generated free abelian group H (also written HZ),
(2) a decomposition HC = H ⊗Z C = ⨁
p+q=m
H p,q such that H p,q = H q,p for any p, q.
There are some variants of this deﬁnition. A rational or real pure Hodge structure starts
with a ﬁnite-dimensional vector space over Q or over R, respectively.
Example 10.2 (Main example). If X is a compact K¨ ahler manifold, thenH i(X, Z)/(torsion)
is endowed with a canonical pure Hodge structure of weight i.
Example 10.3 (Tate Hodge structure). We deﬁne the Tate Hodge structures are:
• Z(1) = (2πi)Z ⊆ C, pure of type ( −1, −1), (weight −2),
• Z(1) = 1
2πi Z ⊆ C, pure of type (1 , 1), (weight 2).
Proposition 10.4. Giving a pure Hodge structure of weight m is equivalent to giving a free
ﬁnitely-generated abelian group H together with a ﬁnite, decreasing ﬁltration (F pHC)p∈Z on
HC such that F p ⊕ F
m+1−p
= HC.
While this seems to make things more complicated, it is actually much more convenient
to work with. This will become apparent when we discuss the Hodge–de Rham spectral
sequence (the ﬁltration will be given algebraically while the Hodge decomposition is only
given analytically) and the behavior of Hodge structures in families.


## Page 98

98 MIRCEA MUSTAT ¸ ˘A
Proof. Suppose we have a decomposition HC = ⨁
p+q=m H p,q as in the deﬁnition of a Hodge
structure. Then we deﬁne
F pHC =
⨁
i+j=p
i≥p
H i,j.
This is clearly a decreasing, ﬁnite ﬁltration. Note also that
F
m+1−p
=
⨁
i+j=m
i≥m+1−p
H i,j =
⨁
i+j=m
j≤p−1
H j,i
and hence the condition F p ⊕ F
m+1−p
= HC also holds. A similar computation shows that
H p,q = F p ∩ F
q
,
which motivates the proof of the converse.
Suppose F•H is a ﬁnite, decreasing ﬁltration on H which satisﬁes F p ⊕F
m+1−p
= HC. Deﬁne
H p,q = F p ∩ F
q
.
• Suppose ∑
p+q=m
αp,q = 0 for αp,q ∈ H p,q. If not all αp,q are 0, choose minimal p such
that αp,q ̸= 0. Then
αp,q = −
∑
p′>p
αp′,q′ ∈ F p+1 ∩ F
q
= 0
by the assumption that F p ⊕ F
m+1−p
= HC.
• Let us show that every 0 ̸= u ∈ H lies in ∑
p+q=m
H p,q. Suppose u ∈ F p. We argue
by decreasing induction on p. (If p ≫ 0, u = 0, so there is nothing to prove.) We
know that F p+1 ⊕ F
m−p
= HC, so u = v1 + v2 for v1 ∈ F p+1 and v2 ∈ F
m−p
. By the
inductive hypothesis, v1 ∈ ∑H p′,q′
. Moreover,
v2 = u − v1 ∈ Fp ∩ F m−p,
so v2 ∈ H p,q ⊆ ∑
p′+q′=m H p′,q′
. Hence
u ∈
∑
p′,q′
H p′,q′
.
In fact, we see that F p ⊆ ⨁
p′+q′=m
p′≥p
H p′,q′
and the reserve inclusion is clear. Hence we recover
the equality
F p =
⨁
p′≥p
H p′,q′
which shows that these are inverse constructions. □
Deﬁnition 10.5. If A and B are pure Hodge structures of weights m and m + 2r, then a
morphism of pure Hodge structures of type (r, r) is a morphism of abelian groups f : A → B
such that
fC(Ap,q) ⊆ Bp+r,q+r for all p, q


## Page 99

MATH 731: HODGE THEORY 99
or, equivalently, using Proposition 10.4,
f(F pA) ⊆ F p+rB for all p.
If r = 0, we simply call f a morphism of pure Hodge structures .
Example 10.6. If f : X → Y is a morphism of compact K¨ ahler manifolds, then
f∗ : H i(Y, Z)/(torsion) → H i(X, Z)/(torsion)
is a morphism of Hodge structures for all i.
Operations with pure Hodge structures.
(1) We have ﬁnite direct sums of pure Hodge structures of the same weight.
(2) We have kernels and cokernels. If f : A → B is a morphism between Hodge structures
of weights m and m + 2r, then
ker(f) ⊗Z C =
⨁
p+q=m
ker(Ap+q → Ap+r,q+r),
so ker(f) is a pure Hodge structure of weight m.
Similarly, coker(f)/torsion is a pure Hodge structure of weight m + 2r:
coker(f) ⊗Z C = coker(Ap,q → Bp+r,q+r).
These satisfy the usual universal properties.
One can then check that the category of pure Hodge structures of weight m is an
abelian category.
(3) If A and B are Hodge structures of weights m and n, then AZ ⊗Z BZ is a ﬁnitely-
generated free abelian group, and
AC ⊗C BC =

 ⨁
p+qm
Ap,q

 ⊗

 ⨁
p′+q′=n
Bp′,q′

 ,
and hence A ⊗ B is a pure Hodge structure of weight m + n:
(A ⊗ B)p,q =
⨁
i+i′=p
j+j′=q
Ai,j ⊗ Bi′,j′
.
In particular, the category of pure Hodge structures of weight m does not have a
monoidal structure, while the category of pure Hodge structures does have one. How-
ever, this latter category does not have direct sums so it is not an abelian category.
Example 10.7. Recall the Tate Hodge structure Z(1) = (2 πi)Z of type ( −1, −1)
(weight −2). Then
Z(m) = (2πi)mZ
is a Hodge structure of type ( −m, −m) (weight −2m), and
Z(i) ⊗ Z(j) = Z(i + j).
In general, if A is a pure Hodge structure of weight m, then
A(i) = A ⊗ Z(i)
is a pure Hodge structure of weight m − 2i.


## Page 100

100 MIRCEA MUSTAT ¸ ˘A
Example 10.8. If X is a compact K¨ ahler manifold, then
H i(X, Z)/(torsion) ⊗ H j(X, Z)/(torsion) → H i+j(X, Z)/(torsion)
is a morphism of pure Hodge structures of weight i + j.
(4) The dual of a pure Hodge structure A of weight m is
A∗ = HomZ(A, Z)
with the grading
HomC(AC, C) =
⨁
p+q=m
Hom(Ap,q, C)  
(A∗)−p,−q
,
which is a pure Hodge structure of weight −m.
Example 10.9. We have that Z(−m) = Z(m)∗.
Example 10.10. Let X be a compact K¨ ahler manifold. Then
Hi(X, Z)/(torsion) ∼= (H i(X, Z)/(torsion))∗
by the Universal Coeﬃcients Theorem, so Hi(X, Z)/(torsion) carries a pure Hodge
structure of weight −i.
Let X be a compact K¨ ahler manifold of dimensionn.
(1) We have that:
H2n(X, Z) → Z(−n)
ω ↦→ (2πi)−n
where ω is the element such that ω ∪ µX = 1 ∈ H0(X, Z).
(2) We have that
(H k(X, Z)/torsion)∗ ∼=→ (H2n−k(X, Z)/(torsion))(n)
via Poincar´ e duality.
(3) Similarly,
H k(X, Z)/torsion
PD
→ (H2n−k(X, Z)/torsion)(−n)
is an isomorphism of pure Hodge structures.
(4) Consider the Gysin maps. Let f : X → Y be a holomorphic map of compact K¨ ahler
manifolds of dimensions n and m, respectively. For d = m − n, we get the Gysin
map:
H p(X, Z)/(torsion)
f∗
→ (H p+2d(Y, Z)/(torsion))(d)
10.1. Polarized Hodge structures. Suppose A is a pure Hodge structure of weight m.
Deﬁnition 10.11. A polarization on A is given by a bilinear form
AZ × AZ
Q
→ Z
which is:
• symmetric if m is even,


## Page 101

MATH 731: HODGE THEORY 101
• skew-symmetric if m is odd,
(equivalently, (u, v) ↦→ imQ(u, v) is a Hermitian form) such that, after tensoring with C,
(1) Q(Ap,q, Ap′,q′
) = 0 unless p = q′, q = p′,
(2) the Hermitian form
(u, v) ↦→ ip−q(−1)
m(m−1)
2 Q(u, v)
is positive deﬁnite on Ap,q.
The last condition should remind the reader of the Hodge–Riemann bilinear relations 7.33.
In particular, Q is non-degenerate, so it induces an isomorphism A(m)
∼=→ A∗.
Example 10.12 (Main example). Let X be a smooth projective variety and L ∈ Pic(X) be
ample. For k ≤ n = dim X, we deﬁne the primitive cohomology
P H
k
(X, Z) = {α ∈ H k(X, Z)/(torsion) | c1(L)n−k+1 ∪ α = 0 mod (torsion) }
Here H stands for killing the torsion. 6 This is a polarized Hodge structure of weight k by
the Hodge–Riemann bilinear relations 7.33.
Moreover, we get a polarization of H
k
(X, Z) by using the Lefschetz decomposition 7.28:
H
k
(X, Z) =
⨁
i≥0
P H
k−2i
(X, Z)(−i).
The advantage of a polarized pure Hodge structures is the following semisimplicity result.
Proposition 10.13. If V is a polarized pure rational Hodge structure of weight m and
W ⊆ V is a pure sub Hodge structure of V , the restriction of Q (a polarization on V ) to W
gives a polarization of W , and there is a polarized pure sub Hodge structure W′ such that
V ∼= W ⊕ W′.
Proof. Take W′ = W⊥ with respect to Q. □
11. Algebraic de Rham cohomology
We next discuss algebraic de Rham cohomology. It will related to Hodge cohomology via a
spectral sequence, so we start with a review of spectral sequences.
11.1. Introduction to spectral sequences. Let C be an abelian category and A• be a
complex. Suppose ( F pA•)p∈Z is a decreasing ﬁltration such that
(1) there is an m such that F mA• = A•,
(2) for all i, there is a p such that F pAi = 0.
6In fact, we already dealt with primitive cohomology with C-coeﬃcients; the only novelty here is to deal
with the torsion.


## Page 102

102 MIRCEA MUSTAT ¸ ˘A
We get an induced ﬁltration on H∗(A•) by
F pH i(A•) = im(H i(F pA•) → H i(A•)).
The goal is to compute the graded pieces of this ﬁltration:
F pH i(A•)
F p+1H i(A•) .
This is done by the spectral sequence associated to this ﬁltered complex:
(Ep,q
r , dp,q
r )r≥1
where dr : Ep,q
r → Ep+r,q−r+1
r such that d2
r = 0, together with isomorphisms:
Ep,q
r+1 ∼= ker(dp,q)/ im(dp−r,q+r−1
r ).
(In other words, for ﬁxed r we have a page of the spectral sequence Ep,q
r and its cohomology
with respect to the maps dp,q
r is the next page of the spectral sequence, Ep,q
r+1.)
Example 11.1. We have that
Ep,q
1 = H p+q(F pA•/F p+1A•)
for all p, q with
dp,q
1 : H p+q(F pA•/F p+1A•) → H p+q+1(F p+1A•/F p+2A•)
with the boundary homomorphisms corresponds to the exact sequence of complexes
0 F p+1A•/F p+1A• F pA•/F p+2A• F pA•/F p+1A• 0.
Theorem 11.2 (Main result). We have Ep,q
1 ⇒ H∗(A•), meaning:
(1) for all p, q, Ep,q
r stabilizes for r ≫ 0 to Ep,q
∞ ,
(2) there is a canonical isomorphism F pH p+q(A•)/F p+1H p+q(A•) ∼= Ep,q
∞ .
11.1.1. Hypercohomology. Let C, D be two abelian categories and assume that C has enough
injectives. Let T : C → D be a left exact functor.
If A• is a complex in C, bounded to the left, there is a complex I•, consisting of injective
objects, bounded to the left, and a morphism of complexes A• → I•, which is a quasi-
isomorphism. Deﬁne
RqT (A•) = Hq(T (I•)) ∈ Ob(D).
This can be made functorial.
Suppose now we have a ﬁltration (F pA•)p∈Z on A• as before. One can construct A• → I•, as
before, such that we have a decreasing ﬁltration F pI• of I• with each F pI m/F pI m+1 (hence
also F pT m) injective, and for all p:
F pA• → F pI• is a quasi-isomorphism ,
F pA•/F p+qA• → F pI•/F p+1I• is a quasi-isomorphism .
Applying T to I•, we get a ﬁltration on T (I•) by setting
F pT (I•) = (T (F pI•) ↪→ T (I•)).


## Page 103

MATH 731: HODGE THEORY 103
Hence we get a spectral sequence with
Ep,q
1 = H p+q(T (F pI•)/T (F p+1I•)  
T (FpI•/Fp+1I•)
) = Rp+qT (F pA•/F p+1A•)
and
Ep,q
1 ⇒ Rp+qT (A•).
Example 11.3 (Key example). Consider A• with the na¨ ıve ﬁltration7, i.e.
F pA• =
p−1
0 →
p
Ap →
p+1
Ap+1 → · · · .
Then
F pA•/F p+1A• = Ap[−p].
This gives the ﬁrst hypercohomology spectral sequence:
Ep,q
1 = RqT (Ap) ⇒ Rp+qT (A•).
Remark 11.4. We used the notation C•[m] to mean that ( C•[m])i = C i+m.
11.2. De Rham cohomology. Let k = k be a ﬁeld and X be a smooth algebraic variety
over k. We have the de Rham complex:
0 OX ΩX · · · Ωn
X 0d d d
where n = dim X. Note that Ω p
X is coherent for all i, but d is not OX-linear. Here,
Ωi
X =
i⋀ΩX.
Deﬁnition 11.5. The de Rham cohomology of X is
H i
dR(X) = Hi(X, Ω•
X) = RiΓ(X, Ω•
X).
Theorem 11.6 (Grothendieck). If X is a complete smooth variety over C, there is a canon-
ical isomorphism
H i
dR(X) ∼= H i(Xan, C).
Remark 11.7. This result also holds if X is not complete (this is a result due to Deligne,
which has a diﬀerent proof).
Proof of Theorem 11.6. Consider the corresponding analytic de Rham complex
0 OX an ΩX an · · · Ωn
X an 0d d d
obtain via the analytiﬁcation functor from Ω•
X.
The key fact is that this is acyclic with 0-cohomology equal to CX an.
Indeed, recall that we have a double complex ( A•,•
X an, ∂, ∂) and the ∂∂-Lemma 7.16 implies
that
(Ap,•
X an, ∂) is an acyclic complex with 0-cohomology Ω p
X an.
7The na¨ ıveﬁltration is sometimes also called the stupid ﬁltration


## Page 104

104 MIRCEA MUSTAT ¸ ˘A
Therefore, the inclusion
Ω•
X an ↪→ Tot(A•,•
X an)
is a quasi-isomorphism, and
Tot(A•,•
X an) = de Rham complex on Xan of smooth C-forms.
It is acyclic with 0-cohomology CX an.
Therefore,
Hi(Xan, Ω•
X an) ∼= H i(X, CX an) = H i(Xan, C).
Hence it is enough to show that the canonical map
Hi(X, Ω•
X) → Hi(Xan, Ω•
X an)
is an isomorphism. GAGA 3.34 would imply this result if the map d was OX-linear (i.e. if it
was a map of coherent sheaves). We just need a small argument to deal with this technical
issue.
The hypercohomology spectral sequence for Ω•
X gives
Ep,q
1 = H q(X, Ωp
X) ⇒ H p+q
dR (X).
We also have a corresponding spectral sequence for Ω •
X an:
˜Ep,q
1 = H q(Xan, Ωp
X an) ⇒ Hp,q(X, Ω•
X an).
Functoriality of the hypercohomology spectral sequence then gives a morphism of spectral
sequences
Ep,q
r → ˜Ep,q
r .
This is an isomorphism for r = 1 by GAGA 3.34, which implies that it is an isomorphism
for all r. By convergence of the spectral sequences, we see that for all p, q
F pHp+q(X, Ω•
X)/F p+1Hp+q(X, Ω•
X)
∼=→ F pHp+q(Xan, Ω•
X an)/F p+1Hp+q(Xan, Ω•
X an).
Since these are ﬁnite ﬁltrations, the induced map
Hi(X, Ω•
X) → Hi(Xan, Ω•
X an)
is an isomorphism. □
Remark 11.8. To prove the more general statement, we ﬁrst embed the variety in a complete
variety. One then shows that the log-de Rham complex gives a resolution of the constant
sheaf. Then one shows that the log-de Rham complex gives an isomorphism as above.
11.3. Hodge-to-de Rham spectral sequence. Suppose k is an algebraically closed ﬁeld
and X is a smooth projective variety over k. We have the algebraic de Rham complex Ω •
X
on X. Then na¨ ıve ﬁltrationon Ω•
X gives the Hodge-to-de Rham spectral sequence:
Ep,q
1 = H q(X, Ωp
X) ⇒ Hp+q(X, Ω•
X).
Theorem 11.9. If char(k) = 0, the spectral sequence collapses on its ﬁrst page.


## Page 105

MATH 731: HODGE THEORY 105
Proof. It is enough to show this when k = C. Theorem 11.6 gave an isomorphism
Hm(X, Ω•
X) ∼= H m(Xan, C).
We want to show that dp,q
r = 0 for all p, q and all r ≥ 1. In general, Ep,q
r+1 is a subquotient
of Ep,q
r and Ep,q
r+1 for all p, q if and only if dp,q
r = 0 for all p, q. Hence the spectral sequence
collapses on the ﬁrst page if and only if
dim F pHn/F p+1Hn = dim Ep,n−p
1
for all p. This is equivalent to:
dim Hn(X, Ω•
X) =
∑
p+q=n
dim Ep,q
1  
hp,q(X)
.
Since dim Hn(X, Ω•
X) = dim H n(Xan, C), this follows from the Hodge decomposition. □
Remark 11.10. The na¨ ıve ﬁltration on Ω•
X gives a ﬁltration on H∗(X, Ω•
X) which via the
identiﬁcation H∗(X, Ω•
X) ∼= H∗(Xan, C) is the Hodge ﬁltration.
Step 1. It is enough to prove the corresponding statement for Ω •
X an. One checks this by
similar argument to the proof of Theorem 11.6.
Step 2. We saw that the inclusion Ω•
X an ↪→ A•
X an,C is a quasi-isomorphism. Moreover,
F pΩ•
X an ↪→ F pA•
X an,C =
⨁
i+j=•
i≥p
Ai,j
is a quasi-isomorphism again, by the ∂∂-Lemma 7.16. Since these are soft sheaves, we have
that
F pH∗(Xan, Ω•
X an) = Im(H•Γ(F pA•
X an,C) → H•Γ(A•
X an,C)).
Choose a K¨ ahler metric onXan so that we have harmonic forms. We have:
HmΓ(F pA•
X an,C) HmΓ(A•
X an,C)
⨁
i+j=m
i≥p
Hi,j(Xan)
natural map isom. onto Fp(··· )
by the Hodge decomposition
Hence it is enough to show that the natural map in the diagonal is an isomorphism.
We argue by decreasing induction on p. We write
Cp = Γ(F pA•
X an,C).
We have a short exact sequence
0 Cp+1 Cp Cp/Cp+1 = Γ(Xan, Ap,•
X an) 0.
The long exact sequence gives


## Page 106

106 MIRCEA MUSTAT ¸ ˘A
(∗) Hm(Cp+1) H(Cp) HmΓ(Xan, Ap,•
X an) Hm+1(Cp+1)
0 ⨁
i+j=m
i≥p
Hi,j ⨁
i+j=m
i≥p+1
Hi,j Hp,m−p 0
δ δ
ϕp+1 ϕp ∼= Hodge decomposition
Note that δ = 0, since we can lift a harmonic representation by a harmonic form, which is
both ∂ and ∂ closed.
Hence we have a morphism of short exact sequences. Since ϕp+1 is an isomorphism by the
inductive hypothesis, ϕp is also an isomorphism. This completes the proof of the assertion.
Remark 11.11. One can ask whether the degeneration of the Hodge-to-de Rham spectral
sequence also holds in characteristic p > 0. It turns out it is false.
However, Deligne and Illusie give an algebraic proof in characteristic 0 by reducing modulop.
Alas, this degeneracy of the spectral sequence does not imply the Hodge decomposition,
i.e. that H m(X, C) = F p ⊕ F
m+1−p
. The Hodge symmetry does not follow from this either.
12. Introduction to V ariations of Hodge structures
The motivation for this topic comes from the following result in diﬀerential topology.
Theorem 12.1 (Ehresman). If π : X → B is a smooth map between smooth (real) manifolds
which is proper and submersive, then for all b0 ∈ B, there is an open neighborhood U of b0
and a diﬀeomorphism π−1(U) ∼= U × Xb0 over U.
Proof. Consider
X0 = Xb0 X
{b0} B
π
Let n = dim X, m = dim B. Since π is a submersion, X0 ↪→ X is a submanifold of dimension
n − m.
The Tubular Neighborhood Theorem implies that there is an open neighborhood W of X0
and a retraction r : W → X0 of the inclusion X0 ↪→ W .
Deﬁne ϕ: W → B × X0 by
ϕ(x) = (π(x), r(x)).
If p ∈ X0, ker(dπ)p = TpX0 and (dr)p|TpX0 = Id.
Hence dϕp is an isomorphism, showing that ϕ is a local diﬀeomorphism at every point of X0.
Moreover, ϕ|X0 is injective and X0 is compact since π is proper.
Therefore, there is an open neighborhood W′ of X0 such that ϕ is injective and locally a
diﬀeomorphism on W′. Hence ϕ is an open embedding on W′.


## Page 107

MATH 731: HODGE THEORY 107
Hence there is an open neighborhood U′ of b0 such that π−1(U′) ⊆ ϕ(W′).
Replacing B by U′ an W′ by W′ ∩ π−1(U′), we may assume that ϕ is surjective. Take
U = B \ π(X \ W′). Note that π(X \ W′) is closed because π is proper. Hence U is an open
neighborhood of b0 such that ϕ gives a diﬀeomorphism π−1(U) ∼= U × Xb0. □
Corollary 12.2. Let f : X → B be a smooth projective morphism of complex algebraic
varieties. If B is connected, then maps B ∋ t ↦→ hp,q(Xt) are constant.
Proof. By Ehresman’s Theorem 12.1, we immediately see that the maps B ∋ t ↦→ bi(Xt) are
locally constant, hence constant, since B is connected.
Note that if B′ → B is a resolution of singularities, we may replace f by f′ where
X′ B′
X B
f′
f
and thus we may assume that B (and hence also X) is smooth.
Each ﬁber is smooth and projective, so the Hodge decomposition shows that
bi(Xt) =
∑
p+q=i
hp,q(Xt).
We will apply the Semicontinuity Theorem to Ωp
X/B. These are locally free OX-modules and
f is ﬂat, so they are ﬂat over B. Therefore, the functions
t ↦→ hp,q(Xt)
is upper-semicontinuous (can only go up under specialization). Since the sums of hp,q for
p + q constant are constant, each of these functions is constant. □
Remark 12.3. We get more by using Grauert’s Theorem. If B is reduced, since all
hq(Xt, Ωp
Xt) are constant, all Rqf∗Ωp
X/B are locally free and commute with base change.
In particular, for all t ∈ B, the canonical map
(Rqf∗Ωp
X/B)(t) → H q(Xt, Ωp
Xt)
is an isomorphism.
Deﬁnition 12.4. Let X be a topological space and F be a sheaf of abelian groups on X.
Then F is locally constant if for all x ∈ X, there is an open neighborhood U of x such that
F |U ∼= AU for some abelian group A.
In particular, note that A ∼= Fx for all x.
Deﬁnition 12.5. A sheaf F of vector spaces (over Q, R, or C) which is locally constant
with ﬁnite-dimensional stalks over a ﬁeld is a local system.
Corollary 12.6. Let f : X → B be a smooth map between smooth real manifolds. If f is a
proper submersion, then R∗f∗Ax is locally constant for all abelian groups A.


## Page 108

108 MIRCEA MUSTAT ¸ ˘A
Proof. For x ∈ B, let U ∋ x be an open neighborhood such that π−1(U) ∼= U × F over U (as
in the conclusion of Ehresman’s Theorem 12.1.) Then Rkf∗Ax|U is isomorphic to the sheaf
associated to the presheaf V ↦→ H k(V × F, A).
By taking V to be a basis of contracting open neighborhoods of x, we see that
Rkf∗Ax|U ∼= H k(F, A)U .
This completes the proof. □
12.1. Overview of Riemann–Hilbert correspondence. Let X be a complex manifold
and E be a locally free sheaf on X.
Deﬁnition 12.7. A connection ∇ on E is a C-linear map ∇: E → ΩX ⊗ E which satisﬁes
the Leibnitz rule:
∇(f s) = f ∇(s) + d f⊗ s
if f is a local section of OX and s is a local section of E.
Given any connection ∇, we get induced C-linear maps
∇: Ωp
X ⊗ E → Ωp+1
X ⊗ E
by
∇(η ⊗ s) = η ∧ ∇(s) + dη ⊗ s.
Deﬁnition 12.8. A connected ∇ is ﬂat (or integrable) if ∇ ◦ ∇ = 0 as a map E → Ω2
X ⊗ E.
Equivalently, ∇ ◦ ∇ = 0 as a map Ω p ⊗ E → Ωp+2 ⊗ E for all p.
The sheaf of ﬂat sections of ∇ is E∇ = ker(∇: E → Ω1 ⊗ E).
Hence, given such a vector bundle with ﬂat connection ( E, ∇), we get the de Rham complex
DRx(E, ∇):
0 E ΩX ⊗ E · · · Ωdim X
X ⊗ E 0.∇ ∇ ∇
Example 12.9 (Basic example). If E = OX and we take d: OX → O X as the ﬂat connection,
the corresponding de Rham complex is the holomorphic de Rham complex of X.
More generally, suppose L is a local system of C-vector spaces on X. Take E = L ⊗C OX
which is locally free and
E ΩX ⊗ E
L ⊗ OX L ⊗ ΩX
= =
1⊗d
deﬁnes a ﬂat connection on E.
Then corresponding de Rham complex is
0 L ⊗ OX L ⊗ ΩX · · · L ⊗ Ωdim X
X 0.
This is quasi-isomorphic to L.
Note that L = E∇ = ker(∇: E → Ω1 ⊗ E).


## Page 109

MATH 731: HODGE THEORY 109
Theorem 12.10 (The Riemann–Hilbert correspondence) . There is an equivalence of cate-
gories {
local systems of
C-vector spaces
}
↔
{ vector bundles withintegrable connection
}
with inverse given by (E, ∇) → E∇.
Idea of proof. To show that E∇ is a local system, we need to show that for all x ∈ M and
u ∈ E(x), locally there is a unique ﬂat section s of E such that s(x) = u.
This is a local statement, so we may assume that we have section e1, . . . , er which trivialize
E and coordinates x1, . . . , xn on X. Then
∇: E → Ω ⊗ E ,
ej ↦→
n∑
i=1
r∑
k=1
Γk
ij dxi ⊗ ek.
where Γk
ij are some functions, called Chrstoﬀel coeﬃcients.
For a section s =
r∑
j=1
sjej,
∇(s) =
r∑
j=1
sj
n∑
i=1
r∑
k=1
Γk
ij dxi ⊗ ek +
r∑
k=1
n∑
i=1
∂sk
∂xi
dxi ⊗ ek.
Then s is ﬂat if and only if
∂sk
∂xi
= −
r∑
j=1
Γk
ijsj
for all i, k.
The key point is that ∇ is integrable if and only if this system of linear PDEs is integrable.
In this case, we get (local) existence and uniqueness given an initial condition. □
The next two classes were typed by David Schwein.
Let π : X → B be a smooth projective morphism of smooth complex varieties. We saw that
Rkπ∗C is a local system with stalks at b given by
(Rkπ∗C)b ∼= Hk(Xb, C).
By the Riemann–Hilbert correspondence 12.10, this local system corresponds to an analytic
vector bundle with integrable connection, called the Gauss–Manin connection.
Our ﬁrst goal is to describe the vector bundle supporting the Gauss–Manin connection. This
requires a relative version of the de Rham complex. On X we have Ω•
X, but also Ω•
X/B (with
Ωp
X/B := ⋀p ΩX/B). Neither complex is OX-linear, but the complex Ω •
X/B is π−1OB-linear,
that is, each Ω p
X/B is a π−1OB-module. Let
Hk := Rkπ∗(Ω•
X/B),


## Page 110

110 MIRCEA MUSTAT ¸ ˘A
an OB-module. The naive ﬁltration F•Ω•
X/B induces a ﬁltration on Hk:
F pHk = Im(Rkπ∗F pΩ•
X/B → Rkπ∗Ω•
X/B).
This ﬁltration gives rise to a spectral sequence
Ep,q
1 = Rqπ∗Ωp
X/B =⇒ H p+q.
We know that each Ep,q
1 is locally free and there is a canonical base-change isomorphism
(Ep,q
1 )(b) ≃ Hq(Xb, Ωp
Xb). (Recall that (Ω X/B)(b) ≃ ΩXb; this is a consequence of a general
compatibility between sheaves of diﬀerentials and pullbacks.) We know that for every b ∈ B,
the Hodge-to-de-Rham spectral sequence degenerates on the ﬁrst page (cf. Theorem 11.9);
hence for every b ∈ B, the spectral sequence ( E•)(b) degenerates at level one. Hence the
original spectral sequence degenerates on the ﬁrst page, and the graded pieces are
F pHk/F p+1Hk ≃ Rk−pπ∗Ωp
X/B.
We deduce that each F pHk is a subbundle of Hk. Moreover, for every b ∈ B,
F pHk
(b) = F pHk(Ω•
Xb) ≃ F pHk(Xb, C).
Remark 12.11. We can run similar arguments for Rkπ∗Ω•
X an/Ban. Since Ω•
X an/Ban = (Ω•
X/B)an
there is a canonical map
(Hk)an → Rkπ∗Ω•
X an/Ban
and this maps turns out to be an isomorphism. Using the spectral sequence associated to
the second naive ﬁltration, which degenerates on the ﬁrst page, to prove that this is an
isomorphism it is enough to show that for all p and q, the map
(Rqπ∗Ωp
X/B)an → Rqπ∗Ωp
X an/Ban
is an isomorphism. This is a consequence of a general fact due to Deligne, relative GAGA
Theorem, but in our setting, we can see it by taking ﬁbers at each b and using the isomor-
phism
Hp(Xb, ΩXb) → Hp(Xan
b , Ωan
Xb)
from usual GAGA Theorem 3.34.
Note now that we have a canonical morphismCX → Ω•
X an/Ban, which gives rise to a morphism
Rkπ∗CX → Rkπ∗(Ω•
X an/Ban), and then a morphism
(Rkπ∗CX) ⊗C OBan → Rkπ∗(Ω•
X an/Ban).
This morphism is an isomorphism because it is an isomorphism on ﬁbers. To conclude, the
analytic vector bundle associated to R kπ∗CX is (Hk)an.
12.2. The Gauss–Manin Connection. As we will see, the connection on ( Hk)an comes
from a connection ∇ : Hk → ΩB ⊗ Hk on Hk. Its main property is the following.
Theorem 12.12 (Griﬃths Transversality). We have:
∇(F pHk) ⊆ ΩB ⊗ F p−1Hk.


## Page 111

MATH 731: HODGE THEORY 111
Therefore ∇ induces a map ∇ : F pHk/F p+1Hk → ΩB ⊗ F p−1Hk/F pHk. Although ∇ is not
OX-linear, ∇ is OB-linear because
∇(f s) = f ∇(s) + df ⊗ s,
so that ∇(f ¯s) = f ∇(¯s). Our goal is to describe ∇ at the level of ﬁbers. For b ∈ B, we have
a map
∇b : Hq(Xb, Ωp
Xb) → T∗
b B ⊗ Hq+1(Xb, Ωp−1
Xb ), q = k − p.
Theorem 12.13 (Griﬃths). For every b ∈ B and u ∈ TbB, the map Hq(Xb, Ωp
Xb) →
Hq+1(Xb, Ωp−1
Xb ) induced by ∇b and u is the cup product with the Kodaira–Spencer class of u,
a certain element of H1(X, TX).
That is, cupping with the Kodaira–Spencer class gives a map H q(Ωp
Xb) → Hq+1(Ωp
Xb ⊗ TXb),
and we then compose this map with the contraction map H q+1(Ωp
Xb ⊗ TXb) → Hq+1(Ωp−q
Xb ).
Recall that there is a short exact sequence
0 → TXb → TX|Xb → NXb/X(= TbB ⊗ OXb) → 0
The long exact sequence in cohomology yields a map
TbB = H0(NXb/X) → H1(Xb, TXb),
called the Kodaira–Spencer map. The signiﬁcance of the map comes from deformation theory:
for Y a smooth projective variety, the space H1(Y, TY ) parameterizes order-one deformations
of Y , that is, Cartesian diagrams
Y Y
Spec C Spec C[ε]
ﬂat
(Here ε2 = 1.) Given π : X → B and u ∈ TbB, we get a deformation
˜Xb X
Spec C[ε] B
π
u
The image of u under the Kodaira–Spencer map corresponds to ˜Xb.
12.3. Algebraic Description of the Gauss–Manin Connection (Katz–Oda). Let
π : X → B be as in the previous section. Recall the short exact sequence
0 → π∗ΩB → ΩX → ΩX/B → 0.
Consider Ω•
X with the ﬁltration
GiΩp
X = Im(π∗Ωi
B ⊗ Ωp−i
X → Ωp
X).
Evidently this ﬁltration is compatible with the de Rham diﬀerential. Its graded pieces are
GiΩp
X/Gi+1Ωp
X ≃ π∗Ωi
B ⊗ Ωp−i
X/B.


## Page 112

112 MIRCEA MUSTAT ¸ ˘A
The ﬁltration ( GiΩ•
X)i≥0 induces a spectral sequence with respect to π∗:
Ep,q
1 = Rp+qπ∗(GpΩ•
X/Gp+1Ω•
X  
π∗Ωp
B⊗Ω•−p
X/B
) = Rqπ∗(π∗Ωp
B ⊗ Ω•
X/B) = Ωp
B ⊗ Rqπ∗Ω•
X/B.
In particular, we have a map E0,q
1 → E1,q
1 , that is, H q → ΩB ⊗ Hq. This is the Gauss–Manin
connection.
Let’s see how this description implies Griﬃths Transversality 12.12. We need to understand
d0,q
1 : it is the boundary map in the long exact sequence associated to the short exact sequence
0 → G1Ω•
X/G2Ω•
X → Ω•
X/G2Ω•
X → Ω•
X/G1Ω•
X → 0,
that is, the sequence
0 → π∗(ΩB) ⊗ Ω•−1
X → Ω•
X/G2Ω•
X → Ω•
X/B → 0.
So d0,q
1 is the connection
Rqπ∗Ω•
X/B → Rq+1π∗(π∗ΩB ⊗ Ω•−1
X/B) = ΩB ⊗ Rqπ∗Ω•
X/B.
Consider now the naive ﬁltration
0 → π∗ΩB ⊗ F p−1Ω•
X → F p(Ω•
X/G2Ω•
X) → F p(Ω•
X/B) → 0.
From the resulting morphism of short exact sequences we get a commutative diagram
Rqπ∗F pΩ•
X/B ΩB ⊗ Rqπ∗F p−1Ω•
X/B
Rqπ∗Ω•
X/B ΩB ⊗ Rqπ∗Ω•
X/B.∇
12.4. General Deﬁnition of Variation of Hodge Structures.
Deﬁnition 12.14. An (analytic) variation of (rational) Hodge structures on a complex
manifold B is given by the following data.
(1) A vector bundle with integrable connection ( E, ∇).
(2) ( Q-structure) A local system LQ of Q-vector spaces together with an isomorphism
(LQ) ⊗Q C ≃ E∇.
(3) (Hodge ﬁltration) A ﬁnite decreasing ﬁltration F•E on E by subbundles that satisfy
Griﬃths Transversality 12.12,
∇(F pE) ⊆ Ω ⊗ F p−1E,
and such that for all b ∈ B, the ﬁltration ( F pE(b)) gives a Hodge structure on Lb.
The variations of Hodge structure that come from smooth morphisms are called geometric.
These are usually the easiest ones to work with.


## Page 113

MATH 731: HODGE THEORY 113
12.5. Period Maps. Let π : X → B be as before. Fix b ∈ B. To understand the behavior
near b, choose a contractible open neighborhood U ∋ b such that π−1(U) ≃ U × Xb over U.
Given any b ∈ U, we have canonical isomorphisms
Hk(π−1(U), C)
Hk(Xb, C) Hk(Xb0, C).
restr restr
∼=
Fix p. For every b ∈ U, we get a linear subspace F pHk(Xb, C) ⊆ Hk(Xb, C) ≃ Hk(Xb0, C).
In this way, we get a period map
P k,p : U → G(r, V )
where G is a Grassmannian (parameterizing subspaces), V = Hk(Xb0, C), and r = ∑hp′,q′
,
the sum taken over those p′ and q′ with p′ + q′ = k and p′ ≥ p.
Proposition 12.15. The map P k,p is holomorphic.
Proof. We have a subbundle F pHk|U ⊆ H k|U = V ⊗ OU. This deﬁnes a holomorphic map
U → G(r, V ) which is precisely P k,p. □
To globalize the period map, one must take the quotient of the image in G(r, V ) by a certain
discrete group arising from monodromy. The resulting map is extremely useful in studying
and constructing moduli spaces.
Our ﬁnal goal is to relate d P k,p : TbB → T[W ]G to the Gauss-Manin connection.
Let [W ] ∈ G(r, V ) =: G. We can think of the tangent space at [ W ] as the collection of free
C[ε]-modules W ⊆ V ⊗C C[ε] of rank r and with free cokernel such that W/εW = W . Given
such W , for each w ∈ W there is w + ε ˜w ∈ W . Deﬁning ϕ : W → V /W by w ↦→ ˜w mod W
gives an isomorphism
T[W ]G ≃ HomC(W, V /W).
Explicitly, choose a basis e1, . . . , en for V and suppose we are in the chart ofG with subspaces
generated by vectors of the form ei + ∑n
j=r+1 ai,jej. The coeﬃcients ai,j are independent
from each other and give an isomorphism of this chart to aﬃne space with coordinates Ai,j.
Suppose that
W =
⣨
ei +
n∑
j=r+1
ai,jej
⏐⏐⏐ i
⟩
,
so that a tangent vector has the form
u =
∑
i,j
bi,j
∂
∂Ai,j
⏐⏐⏐⏐
[W ]
.
The corresponding map W → V /W maps ei +
n∑
j=r+1
ai,jej to ∑bi,jej.


## Page 114

114 MIRCEA MUSTAT ¸ ˘A
Consider now the sheaf of sections T → V ⊗ OG of the universal subbundle. Given [ W ] ∈ G,
consider the trivial vector bundle V ⊗ OG with the connection 1 ⊗ d. On our chart, T is
generated by the sections
n∑
j=r+1
ei + Ai,jej.
Then
(1 ⊗ d)(si) =
n∑
j=r+1
dAi,j ⊗ ej.
Letting u ∈ T[W ]G corresond to ϕ ∈ Hom(W, V /W), this calculation implies that
∇u(si) = ϕ(si([W ]))
where the bar stands for the image in V /W. Using this, we see the following: given the
period map P k,p : U → G associated to π : X → B, for every b ∈ U and every u ∈ TbU, if
[W ] = P k,p(b) then d P k,p
b (u) = (∇|FpHk)b,u : W → V /W.
References
[GH94] Phillip Griﬃths and Joseph Harris, Principles of algebraic geometry , Wiley Classics Library, John
Wiley & Sons, Inc., New York, 1994, Reprint of the 1978 original, doi:10.1002/9781118032527,
https://doi.org/10.1002/9781118032527. MR 1288523
[Har77] Robin Hartshorne, Algebraic geometry, Springer-Verlag, New York-Heidelberg, 1977, Graduate
Texts in Mathematics, No. 52. MR 0463157
[Mum99] David Mumford, The red book of varieties and schemes , expanded ed., Lecture Notes in Mathe-
matics, vol. 1358, Springer-Verlag, Berlin, 1999, Includes the Michigan lectures (1974) on curves
and their Jacobians, With contributions by Enrico Arbarello, doi:10.1007/b62130, https:
//doi.org/10.1007/b62130. MR 1748380
[Voi07] Claire Voisin, Hodge theory and complex algebraic geometry. I , english ed., Cambridge Studies in
Advanced Mathematics, vol. 76, Cambridge University Press, Cambridge, 2007, Translated from
the French by Leila Schneps. MR 2451566
