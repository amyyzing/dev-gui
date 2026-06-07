# Moving Frames

Source title: LECTURE 11: THE METHOD OF MOVING FRAMES

Converted from: `28.pdf`


## Page 1

LECTURE 11: THE METHOD OF MOVING FRAMES
In Riemannian geometry, one frequently encounters with heavy computations
(especially for those problems related to curvatures). There are three different meth-
ods to do these calculations: the invariant method via global vector fields and tensor
fields, the local method via carefully chosen coordinate charts (under the help of Ein-
stein summation convention), and E. Cartan’s method of moving frames via calculus
of differential forms. Today we will give a brief introduction to the method of mov-
ing frames where the use of differential forms is emphasized [when compared with tensor
fields, differential forms have the advantage that they can be pulled-back via smooth maps, and
we have the powerful tool of exterior derivative] .
1. Cartan’s method of moving frames
¶ The connection 1-forms for a linear connection in a local frame.
Let M be a smooth manifold and ∇ a linear connection on M. We can regard
∇ (acting on vector fields) as a linear map
∇ : Γ∞(T M) → Γ∞(T M ⊗ T ∗M).
So if {e1, · · · , em} is a local frame [i.e. for each p ∈ U, e1(p), · · · , em(p) form a basis of
TpM] of T M defined on an open set U ⊂ M, then one can find a set of one forms
{θj
i }1≤i,j≤m defined on U so that ∇Xei = θj
i (X)ej for all X ∈ Γ∞(T M), i.e.
(1) ∇ei = ej ⊗ θj
i .
These θj
i ’s are known as connection 1-forms of ∇ with respect to the local frame
{ei}, which are only locally defined.
Moreover, if we choose another local frame {˜e1, · · · , ˜em} on eU, and ˜ei = f j
i ej on
U ∩ eU, then ej = ( f −1)i
j˜ek (where f −1 is the inverse of the matrix f = ( f j
i )) and
thus
˜el ⊗ ˜θl
i = ∇˜ei = ∇(f j
i ej) = f j
i ∇ej + ej ⊗ d fj
i
= f j
i ek ⊗ θk
j + (f −1)l
j˜el ⊗ d fj
i
= ˜el ⊗ (f −1)l
kθk
j f j
i + (f −1)l
jd fj
i ,
so we end up with
˜θl
i = (f −1)l
kθk
j f j
i + (f −1)l
jd fj
i ,
on U ∩eU, which can be written in brief as
(2) ˜θ = f −1θf + f −1d f,
1


## Page 2

2 LECTURE 11: THE METHOD OF MOVING FRAMES
where ˜θ and θ are understood as m × m matrices whose entries are 1-forms, while
f and f −1 are invertible m × m matrices1 whose entries are functions (and thus one
can not exchange their positions in the product above).
To develop Riemannian geometry via differential forms only, let’s first derive
the dual formula for covariant derivative of differential forms via these connection
1-forms. We denote by {ω1, · · · , ωm} the local dual co-frame[i.e. ωi(ej) = δi
j for all i, j]
of T ∗M defined on U to the given local frame {e1, · · · , em}. Then we have
(∇Xωi)(ej) = X(ωi(ej)) − ωi(∇Xej) = −ωi(θk
j (X)ek) = −θi
j(X).
It follows that the linear connection ∇ acting on one forms, viewed as a map
∇ : Γ∞(T ∗M) → Γ∞(T ∗M ⊗ T ∗M),
can be expressed in terms of the co-frame and the connection 1-forms as
(3) ∇ωi = −ωj ⊗ θi
j.
¶ The connection 1-forms: torsion freeness and metric compatibility.
Now suppose the linear connection ∇ is torsion free. Then
dωi(X, Y ) = X(ωi(Y )) − Y (ωi(X)) − ωi([X, Y ])
= X(ωi(Y )) − Y (ωi(X)) − ωi(∇XY − ∇Y X)
= (∇Xωi)(Y ) − (∇Y ωi)(X)
= −ωj(Y )θi
j(X) + ωj(X)θi
j(Y ).
So the torsion free condition for a linear connection can be written, in terms of the
dual co-frame and the connection 1-forms, as
(4) dωi = ωj ⊗ θi
j − θi
j ⊗ ωj = ωj ∧ θi
j.
which can be written in brief as dω = −θ ∧ ω.
Next suppose there is a Riemannian metric g on M, and the connection ∇ is
metric compatible. To encode the information of the metric into our consideration,
it is reasonable to choose an ::::::::::::orthonormal:::::::frame {e1, · · · , em} instead of a general
frame. Then
0 = ⟨∇ei, ej⟩ + ⟨ei, ∇ej⟩ = ⟨ek ⊗ θk
i , ej⟩ + ⟨ei, ek ⊗ θk
j ⟩ = θj
i + θj
i .
So the metric compatibility of ∇ becomes: for any orthonormal frame, the connec-
tion 1-forms satisfy
(5) θj
i + θj
i = 0,
i.e. the matrix of connection 1-forms is anti-symmetric.
1So one may regard f as a map from U ∩eU to the general linear group GL(m). If we are in the
setting of Riemannian manifold and we are only using local orthonormal frames, then the group
encountered is O(m) instead. The method of moving frame works in a more general setting, and
there is always such a Lie group behind the theory that plays an important role.


## Page 3

LECTURE 11: THE METHOD OF MOVING FRAMES 3
¶ Cartan’s formulation of Riemannian geometry.
It turns out that one can develop Riemannian geometry starting with local
frames and connection 1-forms (i.e. via the differential 1-forms ωi, θi
j) instead of the
Riemannian metric g and its Levi-Civita connection[since one can recover the Riemannian
metric g from the local orthonormal co-frame {ωi}, and then recover the Levi-Civita connection
∇ from its connection 1-forms θj
i ]. We start with a simple lemma:
Lemma 1.1. Suppose ω1, · · · , ωs ∈Λ1V ∗ (s ≤ m=dim V ) are linearly independent.
(1) If η1, · · · , ηs ∈ Λ1V ∗ and P ηi ∧ ωi = 0 , then there exist uniquely determined
real numbers Ai
j (1 ≤ i, j ≤ s) with Ai
j = Aj
i such that ηi = Ai
jωj.
(2) If s = m, and a collection of linear 1-forms θi
j ∈ Λ1V ∗ (1 ≤ i, j ≤ m) satisfy
ωj ∧ θi
j = 0 and θi
j + θj
i = 0,
then θi
j = 0.
Proof. (1) Obviously ηi ∈ span{ω1, · · · , ωs}. Write ηi = Ai
jωj. Then
X
ηi ∧ ωi =
X
i<j
(Ai
j − Aj
i)ωi ∧ ωj
and the conclusion follows.
(2) Write θi
j = ai
jkωk. Then the two conditions becomes
ai
jk − ai
kj = 0 and ai
jk + aj
ik = 0.
Thus
ai
jk = ai
kj = −ak
ij = −ak
ji = aj
ki = aj
ik = −ai
jk
and the conclusion follows. □
Now we state :::the::::::::::::::fundamental:::::::::theorem::of:::::::::::::Riemannian:::::::::::geometry [i.e. the existence
and uniqueness of Levi-Civita connection] in the language of connection 1-forms:
Theorem 1.2 (E. Cartan). Let ω1, · · · , ωm ∈ Ω1(U) be a collection of 1-forms on
an open set U ⊂ M that are linearly independent at each point. Then there exists a
unique collection of 1-forms, θi
j ∈ Ω1(U) (1 ≤ i, j ≤ m), so that
dωi = ωj ∧ θi
j and θi
j + θj
i = 0.
[These equations are known as Cartan’s structural equations . ]
Proof. Uniqueness follows from Lemma 1.1 (2). For the existence, one just start
with the Riemannian metric g = P ωi ⊗ ωi (so that the dual frame {ei} of {ωi} is an
orthonormal basis for each point in U) and take θi
j to be the connection 1-forms for the
Levi-Civita connection of this metric. □
Remark. How to get from local to global? To glue, one need the connection 1-forms
to satisfy the change of frame formula (2) for any orthogonal transformation f.


## Page 4

4 LECTURE 11: THE METHOD OF MOVING FRAMES
¶ The curvature 2-form.
We start with any linear connection on a smooth manifold M. Suppose we are
given a local co-frame {ωi} and the corresponding connection 1-forms θi
j. We may
express the curvature using differential forms (in terms of the connection 1-forms)
as follows. By definition
R(X, Y )ei = ∇X∇Y ei − ∇Y ∇Xei − ∇[X,Y ]ei
= ∇X(θj
i (Y )ej) − ∇Y (θj
i (X)ej) − θj
i ([X, Y ])ej
= X(θj
i (Y ))ej +θj
i (Y )θk
j (X)ek −Y(θj
i (X))ej −θj
i (X)θk
j (Y )ek −θj
i ([X, Y ])ej
=( dθj
i )(X, Y )ej + θj
k ∧ θk
i (X, Y )ej.
As a consequence, if we denote R(ek, el)ei = Rkli
jej, then we get
(6) dθj
i + θj
k ∧ θk
i = R j
kli ωk ⊗ ωl = 1
2 R j
kli ωk ∧ ωl.
We shall denote
Ωj
i = 1
2 R j
kli ωk ∧ ωl,
and call it the curvature 2-form, which can be expressed in terms of θj
i ’s as
(7) Ω j
i = dθj
i + θj
k ∧ θk
i .
The formula can be taken as definition of curvature (for given connection 1-forms)
and is usually written in brief as
Ω = dθ + θ ∧ θ,
where Ω is regarded as an m × m matrix whose entries are 2-forms.
Unlike the connection 1-forms, given a linear connection, the curvature 2-form
is independent of the choice of co-frame and thus is globally defined. To see this,
we use the frame transformation formula for connection 1-forms above to get
eΩ = d˜θ + ˜θ ∧ ˜θ =(d f−1) ∧ θf + f −1(dθ)f − f −1θ ∧ d f+ (d f−1) ∧ d f
+ f −1θ ∧ θf + f −1θ ∧ d f+ f −1d f∧ f −1θf + f −1d f∧ f −1d f.
In view of the fact d f−1 = −f −1(d f)f −1, we get
eΩ = f −1(dθ + θ ∧ θ)f = f −1Ωf,
which is equivalent to say Ω is independent of the choice of frames.
Now suppose ( M, g) is a Riemannian manifold. Then we may start with or-
thonormal co-frame {ωi}, and we have Cartan’s structural equations, which implies
Ωj
i = −Ωi
j.
We may also express the curvature 2-form Ω j
i using Rijkl := Rm(ei, ej, ek, el) as
Ωi
j = 1
2 R i
klj ωk ∧ ωl = −1
2 Rklji ωk ∧ ωl = 1
2 Rijkl ωk ∧ ωl.


## Page 5

LECTURE 11: THE METHOD OF MOVING FRAMES 5
Remark. More generally, one can develop the theory of linear connections on vector
bundles (or principal bundles) via moving frames, as follows. Let E be a rank r
vector bundle over M, and {e1, · · · , er} a local frame of E. Then one can either
define a linear connection
∇ : Γ∞(E) → Γ∞(E ⊗ T ∗M)
via axioms that we mentioned earlier, or via connection 1-forms θj
i (1 ≤ i, j ≤ r)
that are locally defined such that
∇ei = ej ⊗ θj
i .
As we calculated above, the matrix θ transform under change of basis as
˜θ = f −1θf + f −1d f.
One can further define the curvature 2-form to be
Ω = dθ + θ ∧ θ.
2. Applications to Riemannian geometry
¶ Calculating curvatures.
As the first application, we use moving frames to calculate the curvature of
a Riemannian manifold ( M, g). Let {e1, · · · , em} be a local orthonormal frame of
(M, g). By definition the sectional curvature of the plane spanned by {ei, ej} is
K(ei, ej) = Rm(ei, ej, ei, ej) = Rijij = Ωj
i(ej, ei).
Theorem 2.1. (M, g) has constant sectional curvature c at p ∈ M if and only if
for any local orthonormal frame {ei}, at p we have
(8) Ω i
j = cωi ∧ ωj.
Proof. Suppose (8) holds at p for any orthonormal frame. Let Π p be any two di-
mensional plane in TpM. Choose an orthonormal basis {e1, e2} of Π p, extend it to
an orthonormal frame and denote by ω1, · · · , ωm the dual co-frame. Then
K(Πp) = K(e1, e2) = cΩ2
1(e2, e1) = cω2 ∧ ω1(e2, e1) = c.
Conversely suppose (M, g) has constant sectional curvature c at p, then with respect
to any orthonormal frame,
Rijkl = c
2 g ∧○g(ei, ej, ek, el) = c(δikδjl − δjkδil)
at p and thus the conclusion follows. □
Example. Consider the upper half space Hm with the hyperbolic metric
ghyperbolic = 1
(xm)2 (dx1 ⊗ dx1 + · · · + dxm ⊗ dxm).


## Page 6

6 LECTURE 11: THE METHOD OF MOVING FRAMES
With the orthonormal frame {ei = xm∂i} and its dual co-frame {ωi = 1
xm dxi},
ωj ∧ θi
j = dωi = − 1
(xm)2 dxm ∧ dxi = −ωm ∧ ωi.
Observe that for the given co-frame {ω1, · · · , ωm},
θi
j = 0, (i, j < m ) and θi
m = −θm
i = −ωi (i < m )
is a solution and thus has to be the unique solution. So we get, for i, j < m ,
Ωi
j = dθi
j + θi
k ∧ θk
j = θi
m ∧ θm
j = −ωi ∧ ωj
and for i < m
Ωi
m = dθi
m + θi
k ∧ θk
m = −dωi = −ωi ∧ ωm.
It follows from Theorem 2.1 that the hyperbolic space has constant curvature −1.
¶ Proving the Bianchi identities.
We may also prove the Bianchi identities via moving frame. For the first Bianchi
identity, we just take exterior derivative:
0 = d2ωi = dωj ∧ θi
j − ωj ∧ dθi
j = ωk ∧ θj
k ∧ θi
j − ωj ∧ (Ωi
j − θi
k ∧ θk
j )
= −ωj ∧ Ωi
j
= −1
2 R i
klj ωj ∧ ωk ∧ ωl,
= −1
2
X
j<k<l

R i
klj + R i
ljk + R i
jkl

ωj ∧ ωk ∧ ωl.
As a consequence, we get for distinct k, l, j’s,
R i
klj + R i
ljk + R i
jkl = 0.
If two or three of k, l, j’s are the same, then the first Bianchi identity trivial.
Similarly by taking exterior derivative of Ω = dθ + θ ∧ θ we get
(9) dΩ = dθ ∧ θ − θ ∧ dθ = Ω ∧ θ − θ ∧ Ω.
One can prove that in local frames, together with the first Bianchi identity, the
expression above is equivalent to the second Bianchi identity. In fact we can give a
very quick proof of the sectional curvature version of Schur’s theorem via (9):
Alternative proof of Theorem 1.2(2) in Lecture 10.
Suppose ( M, g) has sectional curvature K(Πp) = f(p) for some f ∈ C ∞(M). By
Theorem 2.1, Ω i
j = f(p)ωi ∧ ωj. So
d f∧ ωi ∧ ωj + f dωi ∧ ωj − f ωi ∧ dωj = dΩi
j = Ωi
k ∧ θk
j − θi
k ∧ Ωk
j
= −f ωi ∧ ωk ∧ θj
k − f θi
k ∧ ωk ∧ ωj
= −f ωi ∧ dωj + f dωi ∧ ωj.
It follows d f∧ ωi ∧ ωj = 0 for all i, j, and, since m ≥ 3, d f= 0, i.e. f is consant. □


## Page 7

LECTURE 11: THE METHOD OF MOVING FRAMES 7
¶ Reading: Geometry of Riemannian submanifolds via moving frame.
Let (M ,¯g) be a Riemannian manifold of dimension m, and ι : S ,→ M a smooth
submanifold of dimension s endowed with the submanifold metric g = ι∗¯g. For
simplicity make the following index convention:
• 1 ≤ A, B, · · · ≤ m,
• 1 ≤ i, j, · · · ≤ s,
• s + 1 ≤ α, β, · · · ≤ m
As usual we denote by N S the normal bundle of S in M.
We have three different ways to develop the Riemannian geometry of S. Here
we take the moving frame approach. So let’s start with a special local orthonormal
frame {¯e1, · · · , ¯em} of (M ,¯g) with the property that ¯ei = dι(ei) on S for 1 ≤ i ≤ s
and {e1, · · · , es} form a local orthonormal frame of S. Denote by {¯ω1, · · · , ¯ωm} the
dual co-frame of {¯e1, · · · , ¯em}. Then by definition,
(10) ι∗¯ωα = 0.
Let ¯θA
B the connection 1-forms of (M ,¯g) corresponding to the local frame {¯eA}. Then
Cartan’s structural equations of M reads
¯θA
B + ¯θB
A = 0 and d¯ωA = ¯ωB ∧ ¯θA
B.
It follows that as 1-forms on S, ωi := ι∗¯ωi and θi
j := ι∗¯θi
j satisfy (here we used (10))
θi
j + θj
i = 0 and dωi = ωj ∧ θi
j.
By uniqueness in Theorem 1.2, θi
j’s are the connection 1-forms on S associate with
the co-frame {ω1, · · · , ωm}. [This proves the remark on page 9 of Lecture 6.]
We may also study connection 1-forms with indices α’s. Using (10) twice we get
0 = dι∗¯ωα = ι∗¯ωA ∧ ι∗¯θα
A = ωi ∧ ι∗¯θα
i .
Thus by Lemma 1.1(1), there exist uniquely determined functions hα
ij such that
hα
ij = hα
ji and ι∗¯θα
i = hα
ijωj.
Definition 2.2. We call the map II : Γ ∞(T S) × Γ∞(T S) → Γ∞(N S) defined by
II(X, Y ) = hα
ijωi(X)ωj(Y )¯eα
the second fundamental form of (S, g) as a Riemannian submanifold of ( M ,¯g).
Note that the fact hα
ij = hα
ji implies II(X, Y ) = II(Y, X). We may write
II = hα
ijωi ⊗ ωj ⊗ ¯eα.
To see the formula above is independent of the choices of frames, let’s reveal the
true face of II( X, Y ) by expressing it in the invariant formulation. We will use ∇
and ∇ to denote the Levi-Civita connections for ( M ,¯g) and (S, g) respectively. For


## Page 8

8 LECTURE 11: THE METHOD OF MOVING FRAMES
X, Y ∈ Γ∞(T S), we denote X = dι(X) and Y = dι(Y ). Note that if X = X iei,
then X = X i¯ei. So on S we have
∇Y X − dι(∇Y X) = Y (X i)¯ei + X i¯θA
i (Y )¯eA − dι

Y (X i)ei − X iθj
i (Y )ej

= X i¯θα
i (Y )¯eα
= ωi(X)ι∗¯θα
i (Y )¯eα
= hα
ijωi(X)ωj(Y )¯eα.
In other words, for any vector field X, Y tangent to S, we have
II(X, Y ) = ∇Y X − dι(∇Y X).
In view of the fact ∇Y X is the tangential component of ∇Y X, we conclude that
II(X, Y ) is really the :::::::normal::::::::::::component of ∇Y X.
Example. According to the example on page 9-10 in Lecture 6, for the unit sphere
Sm viewed as a Riemannian submanifold of Rm+1, we have
II(X, Y ) = −⟨X, Y ⟩⃗ n.
The second fundamental form is closely related to the curvature 2-form of (S, g):
If we pull back Ω
i
j = d¯θi
j + ¯θi
A ∧ ¯θA
j to S and compare with Ωi
j = dθi
j + θi
k ∧ θk
j , we get
Ωi
j = ι∗Ω
i
j − ι∗¯θi
α ∧ ι∗¯θα
j = ι∗Ω
i
j +
X
α
ι∗¯θα
i ∧ ι∗¯θα
j = ι∗Ω
i
j +
X
α
hα
ikhα
jlωk ∧ ωl.
As a consequence,
Rijkl = Rijkl + (hα
ikhα
jl − hα
ilhα
jk),
which is known as Gauss equation.
Example. In the case S is a hypersurface in ( M, g), i.e. has co-dimension 1, then
one may pair the second fundamental form with ¯em and thus for each p ∈ S, regard
IIp as a symmetric quadratic form on TpS. With the help of the Riemannian metric,
one can convert this symmetric quadratic form into a symmetric operator on TpM,
which is known as the shape operator. The eigenvalues of the shape operator are
known as the principal curvatures of S at p. Its trace and the determinant are
known as the mean curvature and the Gauss curvature of S at p.
In particular, if S is a 2-dimensional surface isometrically embedded in R3, the
only sectional curvature is R1212 = h11h22 −h2
12, which is exactly the Gauss curvature
of S. As a consequence, we get Gauss Theorem Egregium: The Gauss curvature
[which is defined by the second fundamental form which is extrinsic] is in fact intrinsic [since
the sectional curvature depends only on the Riemannian metric and thus is intrinsic].
We say S is a totally geodesic submanifold if II = 0, i.e. hα
ij = 0 for all i, j, α.
From Gauss equation one gets [there is still an issue here that we will explain later]
Theorem 2.3. Let S be a totally geodesic 2-dimensional submanifold of M with
TpS = Πp. Then the sectional curvature K(Πp) of M is the Gauss curvature of S.
