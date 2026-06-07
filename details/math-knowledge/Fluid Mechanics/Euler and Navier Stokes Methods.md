# A class of embedded discontinuous Galerkin methods for computational fluid dynamics

Converted from: `Fluid Mechanics\Euler and Navier Stokes Methods.pdf`


## Page 1

Journal of Computational Physics 302 (2015) 674–692
Contents lists available at ScienceDirect
Journal of Computational Physics
www.elsevier.com/locate/jcp
A class of embedded discontinuous Galerkin methods
for computational ﬂuid dynamics
N.C. Nguyena,∗,1, J. Perairea,1, B. Cockburnb
a Department of Aeronautics and Astronautics, Massachusetts Institute of Technology, Cambridge, MA 02139, USA
b School of Mathematics, University of Minnesota, Minneapolis, MN 55455, USA
a r t i c l e i n f o a b s t r a c t
Article history:
Received 24 August 2014
Received in revised form 9 June 2015
Accepted 12 September 2015
Available online 25 September 2015
Keywords:
Finite element methods
Discontinuous Galerkin methods
Hybrid/mixed methods
Euler equations
Navier–Stokes equations
Computational ﬂuid dynamics
We present a class of embedded discontinuous Galerkin (EDG) methods for numerically
solving the Euler equations and the Navier–Stokes equations. The essential ingredients are
a local Galerkin projection of the underlying governing equations at the element level
onto spaces of polynomials of degree k to parametrize the numerical solution in terms
of the approximate trace, a judicious choice of the numerical ﬂux to provide stability and
consistency, and a global jump condition that weakly enforces the single-valuedness of the
numerical ﬂux to arrive at a global formulation in terms of the numerical trace. The EDG
methods are thus obtained from the hybridizable discontinuous Galerkin (HDG) method by
requiring the approximate trace to belong to smaller approximation spaces than the one in
the HDG method. In the EDG methods, the numerical trace is taken to be continuous on a
suitable collection of faces, thus resulting in an even smaller number of globally coupled
degrees of freedom than in the HDG method. On the other hand, the EDG methods are no
longer locally conservative. In the framework of convection–diffusion problems, this lack
of local conservativity is reﬂected in the fact that the EDG methods do not provide the
optimal convergence of the approximate gradient or the superconvergence for the scalar
variable for diffusion-dominated problems as the HDG method does. However, since the
HDG method does not display these properties in the convection-dominated regime, the
EDG method becomes a reasonable alternative since it produces smaller algebraic systems
than the HDG method. In fact, the resulting stiffness matrix has a similar sparsity pattern
as that of the statically condensed continuous Galerkin (CG) method. The main advantage
of the EDG methods is that they are generally more stable and robust than the CG method
for solving convection-dominated problems. Numerical results are presented to illustrate
the performance of the EDG methods. They conﬁrm that, even though the EDG methods are
not locally conservative, they are a viable alternative to the HDG method in the convection-
dominated regime.
© 2015 Elsevier Inc. All rights reserved.
1. Introduction
Discontinuous Galerkin (DG) methods [3–5,19–23,28,29,31,34,35,38–41,57–59,61,64] have emerged as a competitive al-
ternative for solving nonlinear hyperbolic systems of conservation laws because they possess some important advantages
* Corresponding author.
E-mail addresses:cuongng@mit.edu (N.C. Nguyen), peraire@mit.edu (J. Peraire), cockburn@math.umn.edu (B. Cockburn).
1 This work was supported by AFOSR Grant No. FA9550-11-1-0141, AFOSR Grant No. FA9550-12-0357, and the Singapore-MIT Alliance for Research and
Technology Centre.
http://dx.doi.org/10.1016/j.jcp.2015.09.024
0021-9991/© 2015 Elsevier Inc. All rights reserved.


## Page 2

N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692 675
over classical ﬁnite differences and ﬁnite volume methods. In particular, they can easily handle complicated geometries,
have low dissipation, are locally conservative, high-order accurate, highly parallelizable, and more robust than continuous
Galerkin (CG) methods for convection-dominated problems. However, in spite of these advantages, DG methods have not
yet made a more signiﬁcant impact for practical applications. This is largely due to the main criticism that DG methods are
computationally expensive since they have too many global degrees of freedom. Indeed, the high computational cost and
memory storage are a major impediment to the widespread application of DG methods for real-world problems. Therefore, it
would be highly desirable to develop new DG methods that have all the advantages of DG methods and are computationally
competitive with continuous Galerkin (CG) methods and ﬁnite volume methods.
In the spirit of making DG methods more competitive, researchers have developed more eﬃcient DG methods such
as the multiscale discontinuous Galerkin (MDG) method [37,7] and the embedded discontinuous Galerkin (EDG) method
[32,14]. The MDG method was originally introduced in the framework of convection–diffusion problems [37], whereas the
EDG in the framework of linear shells [32] and linear diffusion [14]. These two methods, which can give rise to identical
schemes, are devised to solve for a globally continuous approximation of the solution (the numerical trace of the scalar
variable for the MDG, and the numerical trace of the approximate displacement for the EDG) on the element boundaries.
Ab r i e f comparison of the ideas upon which these methods are deﬁned is given in [32].
The EDG methods are constructed by using a suitable modiﬁcation of an associated method called a hybridizable dis-
continuous Galerkin (HDG) method. The modiﬁcation is applied to the variational formulation deﬁning the system of
globally-coupled degrees of freedom and consists in reducing its size by simply using a strict subspace to deﬁne it. The
HDG method was introduced in [14] in the framework of diffusion problems. It was analyzed in [11,16,18,24,25] where it is
shown that it has many common features with the Raviart–Thomas (RT) mixed method [60] and the Brezzi–Douglas–Marini
(BDM) mixed method [6]. In particular, in [16], it was proven that the HDG method using simplexes and polynomials of
degree k ≥ 0i n all the unknowns, provides approximations to the scalar variable and the ﬂux which converge with the
optimal order k +1i n the L2-norm for any k ≥ 0, and that the element-by-element averages of the scalar variable super-
converges with order k +2f o r k ≥ 1; a local postprocessing scheme can then be used to obtain a new approximation to
the scalar variable converging with order k +2f o r k ≥ 1. The EDG method constructed from this HDG method by using
continuous approximate traces for the scalar variable was analyzed in [17]. Therein, it was shown that, although this results
in a smaller system for the globally-coupled degrees of freedom, it also produces the loss of the local conservativity of the
method. As a direct consequence, although the approximation for the scalar variable still converged with order k +1f o r any
k ≥ 0, the approximation for the ﬂux converges with the suboptimal order of k. Hence, the above-mentioned postprocessing
converges only with order k +1f o r k ≥ 1. Numerical experiments indicated that the EDG method was in fact less eﬃcient
than its associated HDG method.
This disappointing result precluded further study of EDG methods associated to HDG methods with similar optimal con-
vergence and superconvergence properties. This is the case for HDG methods for linear convection–diffusion problems [51,
12,8,9] and nonlinear convection–diffusion problems [12,52,65] in the diffusion-dominated regime, for HDG methods for the
Stokes system of incompressible ﬂow[13,15,47,53,26], for HDG methods for the incompressible Navier–Stokes equations [49,
50,54] in the diffusion-dominated regime, and for HDG methods for linear elasticity [26,27]. In particular, a unique feature
of the HDG method for incompressible ﬂuid ﬂow is that the approximate velocity, pressure and velocity gradient converge
with the optimal order k +1i n the L2-norm for diffusion-dominated ﬂows for any k ≥ 0. Moreover, the element-by-element
averages of the velocity superconverge and, a local postprocessing scheme proposed in [15,49] can be used to obtain a new
approximate velocity which converges with order k +2f o r k ≥ 1.
On the other hand, it is reasonable to believe that, in the convection-dominated regime, all the above-mentioned HDG
methods must behave like the classic DG methods in the pure convection limit. As a consequence, the optimality of the con-
vergence, for example, to the gradient of the scalar variable, in the case of convection–diffusion problems is lost along with
the above-mentioned superconvergence property. Numerical evidence of this fact is provided in [12]. It is then reasonable
to expect that in this situation, the EDG methods might prove to be more eﬃcient than the original HDG method. In other
words, the EDG method [55] constructed from the HDG method for the compressible Euler and Navier–Stokes equations
[44–46,56] in the convection-dominated regime, might be more eﬃcient than the HDG method.
In this paper, we extend our previous work [55] to develop a class of EDG methods. The EDG methods are obtained
from the HDG method by requiring the approximate trace to belong to smaller spaces than the one in the HDG method.
In the EDG methods, the numerical trace is taken to be continuous on a suitable collection of faces, thus resulting in an
even smaller number of globally coupled degrees of freedom than in the HDG method. Indeed, the original EDG method
[55] produces a global matrix system that has the same sparsity pattern as that of the statically condensed continuous
Galerkin (CG) method. As one instance of the class of EDG methods developed in this paper, the interior embedded DG
(IEDG) method has slightly less globally coupled unknowns than the EDG method. Furthermore, the IEDG method enforces
the boundary conditions more accurately than the EDG method. Numerical results presented herein conﬁrm that the IEDG
method outperforms the EDG method and thus establishes itself as a viable alternative to the HDG method.
The paper is organized as follows. In Section 2, we introduce the notation used throughout the paper and compare var-
ious DG methods in terms of the number of degrees of freedom and the number of nonzeros in their Jacobian matrix. We
then introduce the class of EDG methods for the Euler equations in Section 3 and extend it to the compressible Navier–
Stokes equations in Section 4. In Sections 3 and 4, we present numerical results to demonstrate the performance of the EDG
methods. Finally, in Section 5, we end the paper with some concluding remarks.


## Page 3

676 N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692
2. Preliminaries
Throughout this paper we shall denote scalar variables by italic letters with no boldface (a, A, b, B, etc.), vector vari-
ables by italic boldface lowercase letters (a, b, etc.), and second-order tensor variables by italic boldface uppercase letters
(A, B, etc.). The identity tensor shall be denoted by I. The components of a and A shall be denoted as ai and Aij , re-
spectively. The symbols, ·, ×, ⊗, shall denote the usual scalar product, vector product, and tensor product, respectively. We
shall use boldface roman uppercase letters (A, B, etc.) to denote matrices with entries (Aij , Bij , etc.) and boldface roman
lowercase letters (a, b, etc.) to denote column vectors with elements (ai, bi, etc.). We shall also denote sets and spaces by
calligraphic letters (A, B, etc.). In this paper, the tensor product notation and matrix product notation are interchanged, that
is, a · b = aT b, a ⊗ b = abT , A · b = Ab and A · B = AB.
2.1. Finite element mesh
Let /Omega1be a physical domain in Rd with Lipschitz boundary ∂/Omega1in Rd−1. We denote by Th a collection of disjoint
elements (triangles and tetrahedra) that partition /Omega1. We also denote by ∂Th the set {∂K : K ∈ Th}, that is, the collection
of the boundaries of all elements in Th. We shall denote by n the outward unit normal of ∂K. For an element K of the
collection Th, F = ∂K ∩ ∂/Omega1is the boundary face if the (d − 1)-Lebesgue measure of F is nonzero. For two elements K+ and
K− of the collection Th, F = ∂K+ ∩ ∂K− is the interior face between K+ and K− if the (d − 1)-Lebesgue measure of F is
nonzero. Let EI
h and E∂
h denote the set of interior and boundary faces, respectively. We denote by Eh the union of EI
h and
E∂
h . Note that by deﬁnition ∂Th and Eh are different. More precisely, an interior face is counted twice in ∂Th but once in Eh
and a boundary face is counted once in both ∂Th and Eh.
2.2. Approximation spaces
Let Pk(D) denote the set of polynomials of degree at most k on a domain D. We introduce discontinuous ﬁnite element
spaces
Uk
h ={ a ∈ (L2(Th))m : a|K ∈ (Pk(K))m ∀K ∈ Th},
Qk
h ={ A ∈ (L2(Th))m×d : A|K ∈ (Pk(K))m×d ∀K ∈ Th}, (1)
for a = (ai), 1 ≤ i ≤ m, and A = (Aij ), 1 ≤ i ≤ m, 1 ≤ j ≤ d. Here L2(D) is the space of square integrable functions on D. We
further introduce traced ﬁnite element spaces
ˆM
k
h ={ μ ∈ (L2(Eh))m : μ|F ∈ (Pk(F))m ∀F ∈ Eh},
˜M
k
h ={ μ ∈ (C0(Eh))m : μ|F ∈ (Pk(F))m ∀F ∈ Eh}, (2)
for μ = (μi), 1 ≤ i ≤ m, where C0(D) is the space of continuous functions on D. Note that ˆM
k
h consists of functions which
are discontinuous over Eh, whereas ˜M
k
h consists of functions which are continuous over Eh. Finally, we denote by Mk
h a
ﬁnite element approximation subspace that satisﬁes ˜M
k
h ⊂ Mk
h ⊂ ˆM
k
h. In particular, we deﬁne
Mk
h ={ μ ∈ (L2(Eh))m : μ|F ∈ (Pk(F))m ∀F ∈ Eh, and μ|EE
h
∈ (C0(EE
h ))m}, (3)
where EE
h is a connected subset of Eh.
Let us consider two important choices of Mk
h. The ﬁrst choice is EE
h =∅ which implies Mk
h = ˆM
k
h. This choice cor-
responds to the hybridizable discontinuous Galerkin (HDG) method [14]. The second choice is EE
h = Eh which implies
Mk
h = ˜M
k
h and thus enforces the continuity of the approximate trace on all faces. This choice corresponds to the em-
bedded discontinuous Galerkin (EDG) method introduced in [55]. Hence, the main difference between the HDG method
and the EDG method lies in the deﬁnition of the approximation space for the approximate trace. This subtle difference
is responsible for potentially important differences between the two methods in terms of eﬃciency and accuracy. As we
discussed in the Introduction, the HDG method has been shown to be more accurate and eﬃcient than the EDG method
for diffusion problems, even though the EDG method has a smaller system of globally-coupled degrees of freedom than
the HDG method, see [17], and we expect this advantage to hold in diffusion-dominated regimes, see [12]. However, in
convection-dominated regimes this is no longer true, as we shall see by comparing the performance of the EDG to that of
the HDG method proposed in [44,45,56].
Another interesting choice of the approximation space Mk
h is obtained by setting EE
h = EI
h, which implies ˜M
k
h ⊂ Mk
h ⊂
ˆM
k
h, where the inclusions are strict. The resulting approximation space consists of functions which are discontinuous over
the union of the boundary faces E∂
h and continuous over the union of the interior faces EI
h. The resulting method has a
characteristic of the HDG method on the boundary faces and a characteristic of the EDG method on interior faces. Because
the approximate trace is taken to be continuous only on the interior faces, we shall name this new method interior embedded


## Page 4

N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692 677
Table 1
Values of the coeﬃcient αDOF as a function of the number of spatial dimensions, the approximating polynomial order and the
numerical discretization algorithm. This coeﬃcient can be used in expression (4) to determine the total number of degrees of
freedom in the problem.
Degree
2D 3D
k =1 k =2 k =3 k =4 k =5 k =1 k =2 k =3 k =4 k =5
DG 6 12 20 30 42 24 60 120 210 336
HDG 6 9 12 15 18 36 72 120 180 252
EDG 1 4 7 10 13 1 8 27 58 101
IEDG <1 <4 <7 <10 <13 <1 <8 <27 <58 <101
DG (IEDG) method to distinguish it from the EDG method for which the trace is continuous on all faces, which, abusing
the notation, we shall refer to simply as the EDG method. Thanks to the use of face-by-face local polynomial spaces on the
domain boundary in the IEDG method, the degrees of freedom of the approximate trace on the boundary faces can be locally
eliminated to yield a global matrix system involving the degrees of freedom of the numerical trace on the interior faces.
As a result, the globally coupled unknowns of the IEDG method are even less than those of the EDG method. Furthermore,
the IEDG method enforces boundary conditions more accurately than the EDG method. Hence, the IEDG method is more
eﬃcient and accurate than the EDG method.
We still need to introduce inner products associated with our ﬁnite element spaces. For functions a and b in L2(D), we
denote (a, b)D =
∫
D ab if D is a domain in Rd and ⟨a, b⟩D =
∫
D ab if D is a domain in Rd−1. Likewise, for functions a and
b in (L2(D))m, we denote (a, b)D =
∫
D a · b if D is a domain in Rd and ⟨a, b⟩D =
∫
D a · b if D is a domain in Rd−1. For
functions A and B in (L2(D))m×d, we denote (A, B)D =
∫
D tr(AT B) if D is a domain in Rd and ⟨A, B⟩D =
∫
D tr(AT B) if D
is a domain in Rd−1, where tr is the trace operator of a square matrix. We ﬁnally introduce the following volume inner
products
(a, b)Th =
∑
K∈Th
(a, b)K ,( a, b)Th =
∑
K∈Th
(a, b)K ,( A, B)Th =
∑
K∈Th
(A, B)K ,
and boundary inner products
⟨a, b⟩∂Th =
∑
K∈Th
⟨a, b⟩∂K , ⟨a, b⟩∂Th =
∑
K∈Th
⟨a, b⟩∂K , ⟨A, B⟩∂Th =
∑
K∈Th
⟨A, B⟩∂K .
These notations and deﬁnitions are necessary for the remainder of this paper.
2.3. Cost comparison with other DG methods
To put the EDG and IEDG methods in perspective, we compare them to the HDG method [44–46,56] and other DG
methods such as the LDG method [28], the CDG method [57] or the method of Bassi and Rebay [4]. We consider triangular
and tetrahedral discretizations and polynomial approximations of order k = 1, ...,  5 and calculate the number of globally
coupled degrees of freedom as well as the number of non-zero elements in the Jacobian matrix. For implicit iterative solvers,
the number of non-zero elements in the Jacobian matrix provides a good indication of the computational cost. We consider
large meshes so that, if N p is the number of vertices, the number of triangles in 2D is approximately 2N p and the number
of tetrahedra in 3D is 6N p. Even though for general 3D meshes, the ratio of tetrahedra to vertices can be unbounded, the
above assumptions are reasonable for well shaped meshes and consistent with those presented in [36].
For a system of conservation laws involving Nc components (for the Euler and laminar the Navier–Stokes equations
Nc =4i n 2D and Nc =5i n 3D), the total number of degrees of freedom is given by
DOF = N p NcαDOF , (4)
where the coeﬃcient αDOF is given in Table 1. The total number of non-zero entries in the Jacobian matrix is given by
NNZ = N p N2
c αNNZ . (5)
The coeﬃcient αNNZ is given in Table 2. The detailed calculation of αDOF and αNNZ can be found in [36]. We note that the
coeﬃcients αDOF and αNNZ for the IEDG method cannot be determined precisely because they depend on the number of
the interior faces and the number of the boundary faces. For very large meshes in which the number of interior faces is
much larger than the number of boundary faces, the coeﬃcients for the IEDG method will be close to those for the EDG
method. For small meshes in which the number of interior faces is about the number of boundary faces, the coeﬃcients for
the IEDG method will be signiﬁcantly less than those for the EDG method. The IEDG method always has smaller numbers
of degrees of freedom and non-zero entries than the EDG method.
In all cases, we observe a dramatic reduction in computational cost when the EDG and IEDG methods are considered.
We also note that the total number of degrees of freedom in HDG and EDG methods scales like k in 2D and k2 in 3D. This
compares very favorably to a scaling of k2 and k3 in 2D and 3D, respectively, for the DG method. If we look at the number


## Page 5

678 N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692
Table 2
Values of the coeﬃcient αNNZ as a function of the number of spatial dimensions, the approximating polynomial order and the
numerical discretization algorithm. This coeﬃcient can be used in expression (5) to determine the total number of degrees of
freedom in the problem.
Degree
2D 3D
k =1 k =2 k =3 k =4 k =5 k =1 k =2 k =3 k =4 k =5
DG 72 288 800 1800 3528 480 3000 12000 36750 94080
HDG 60 135 240 375 540 756 3024 8400 18900 37044
EDG 7 46 115 214 343 15 230 1311 4410 11183
IEDG
<7 <46 <115 <214 <343 <15 <230 <1311 <4410 <11183
of non-zero entries in the matrix, the scaling of the EDG and HDG methods is like k2 in 2D and k4 in 3D, whereas for the
DG method, the scaling is like k4 in 2D and k6 in 3D.
3. The Euler equations
3.1. Governing equations
We consider the steady-state Euler equations of gas dynamics written in nondimensional conservation form as
∇· F(u) = f , in /Omega1, (6)
where u = (ui), 1 ≤ i ≤ m = d + 2, is a vector of conserved dimensionless quantities (namely, density, momentum and
energy), F(u) is the inviscid ﬂux (a m × d matrix-valued function), and f is a source term. The Euler equations (6) must be
supplemented with appropriate boundary conditions at the inﬂow and outﬂow boundaries and at the solid wall. We shall
discuss these boundary conditions later.
3.2. The EDG methods
3.2.1. Weak formulation
We consider the governing equations (6) on any element K ∈ Th, multiply them with some test functions w, and inte-
grate the resulting equations by parts to obtain
− (F(u),∇ w)K + ⟨F(ˆu) · n, w⟩∂K = ( f , w)K , (7)
where ˆu is the trace of the solution and n is the outward normal unit vector to ∂K.
Following [44,45,56] we introduce the so-called local problem: For any approximation ˆuh to the trace of the solution ˆu
on ∂K we ﬁnd uh ∈ Uk
h such that it satisﬁes
− (F(uh),∇ w)K + ⟨F(ˆuh) · n + S(ˆuh)(uh − ˆuh), w⟩∂K = ( f , w)K , ∀w ∈ (Pk(K))m. (8)
Here S is the so-called stabilization matrix which is added to render the local problem (8) well-deﬁned for any given value
of ˆuh in a suitable ﬁnite element space. The local problem deﬁnes uh as a function of ˆuh.
We still need to determine ˆuh. To this end, we require that ˆuh ∈ Mk
h satisﬁes
⟨F(ˆuh) · n + S(ˆuh)(uh − ˆuh),μ⟩∂Th\∂/Omega1+ ⟨b(uh,ˆuh),μ⟩∂/Omega1=0, ∀μ ∈ Mk
h. (9)
Here b(uh, ˆuh) is the boundary numerical ﬂux whose deﬁnition depends on the boundary conditions and will be given later.
Summing (8) over all elements and combining it with (9) we obtain that (uh, ˆuh) ∈ Uk
h × Mk
h satisﬁes
− (F(uh),∇ w)Th + ⟨F(ˆuh) · n + S(ˆuh)(uh − ˆuh), w⟩∂Th = ( f , w)Th , ∀w ∈ Uk
h, (10a)
⟨F(ˆuh) · n + S(ˆuh)(uh − ˆuh),μ⟩∂Th\∂/Omega1+ ⟨b(uh,ˆuh),μ⟩∂/Omega1=0, ∀μ ∈ Mk
h. (10b)
This is the weak formulation that deﬁnes a class of EDG methods for the Euler equations. In particular, the EDG method
is obtained by setting EE
h = Eh in (3), whereas the IEDG method is obtained by setting EE
h = EI
h. It remains to deﬁne the
boundary numerical ﬂux and the stabilization matrix.
3.2.2. Boundary conditions
At the inlet section or outlet section of the ﬂow, we deﬁne the boundary ﬂux as
b(uh,ˆuh) = A+
n (ˆuh)(uh − ˆuh) − A−
n (ˆuh)(u∞ − ˆuh), (11)
where u∞ is the freestream value, A±
n = (An ±| An|)/2 and An =[ ∂F(u)/∂u] · n.
At the solid surface with slip condition, we impose zero normal velocity and extrapolate the density, the tangential
velocity, and the energy. Hence, we set


## Page 6

N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692 679
b(uh,ˆuh) = g(uh) − ˆuh, (12)
where g(uh) is as follows
g1 = uh1,( g2,..., gm−1) = vh − (vh · n)n, gm = uhm. (13)
Here vh = (uh2/uh1, ...,  uhm−1/uh1) is the velocity component of uh. Note that since (vh − (vh · n)n) · n = 0w e have
ˆvh · n =0o n the solid wall, where ˆvh = (ˆuh2/ˆuh1, ...,  ˆuhm−1/ˆuh1) is the velocity component of ˆuh.
3.2.3. Stabilization matrix
There are several possible choices for the stabilization matrix including the Roe scheme [63] and Lax–Friedrichs
scheme [29]. For the Roe scheme, we have
S(ˆuh) = L(ˆuh)|/Lambda1(ˆuh)|R(ˆuh), (14)
where L, R, and /Lambda1are the matrices of the left and right eigenvectors, and eigenvalues of the Jacobian matrix
[∂F(ˆuh)/∂ˆuh]· n, respectively. The second choice is the local Lax–Friedrichs scheme
S = (|ˆvh · n|+ c(ˆuh))I, (15)
where c(ˆuh) is the local sound speed and I is the identity matrix. The third choice is the global Lax–Friedrichs scheme
S = τg
max I, (16)
where τg
max is the global maximum speed of the system. The choice of the stabilization matrix becomes less important as
k increases because the numerical dissipation, which is of the order of O(hk+1), decreases rapidly as k increases. The local
Lax–Friedrichs stabilization matrix (15) is used in all the numerical examples presented in this paper.
3.3. Implementation
Applying the Newton–Raphson method to linearize the nonlinear weak formulation (10), we obtain the following linear
weak formulation in terms of the Newton increment (δuh, δˆuh) ∈ Uk
h × Mk
h as
a(δuh, w) + b(δˆuh, w) = f (w), ∀w ∈ Uk
h, (17a)
c(δuh,μ) + d(δˆuh,μ) = g(μ), ∀μ ∈ Mk
h. (17b)
Here the forms are given by
a(v, w) =−
(
F′(uh)v,∇ w
)
Th
+ ⟨S(ˆuh)v, w⟩∂Th ,
b(η, w) =
⟨
(F′(ˆuh) · n + S′(ˆuh)(uh − ˆuh) − S(ˆuh))η, w
⟩
∂Th
,
c(v,μ) = ⟨S(ˆuh)v,μ⟩∂Th\∂/Omega1+
⟨
b′(uh,ˆuh)v,μ
⟩
∂/Omega1,
d(η,μ) =
⟨
(F′(ˆuh) · n + S′(ˆuh)(uh − ˆuh) − S(ˆuh))η,μ
⟩
∂Th\∂/Omega1+
⟨
b′′(uh,ˆuh)η,μ
⟩
∂/Omega1,
f (w) = ( f , w)Th + (F(uh),∇ w)Th − ⟨F(ˆuh) · n + S(ˆuh)(uh − ˆuh), w⟩∂Th ,
g(μ) =− ⟨F(ˆuh) · n + S(ˆuh)(uh − ˆuh),μ⟩∂Th\∂/Omega1− ⟨b(uh,ˆuh),μ⟩∂/Omega1, (18)
for all (v, η) and (w, μ) in Uk
h × Mk
h. Note that F′, S′, b′, and b′′ denote ∂F/∂uh, ∂S/∂ˆuh, ∂b/∂uh, and ∂b/∂ˆuh, respec-
tively.
The linear weak formulation gives rise to the following linear system
[
AB
CD
](
δu
δˆu
)
=
(
f
g
)
, (19)
where δu and δˆu are the vectors of degrees of freedom of δuh and δˆuh, respectively. It is important to note that the matrix
A has a block-diagonal structure due to the discontinuous nature of the approximation spaces. Therefore, it can be inverted
at the element level to yield a block-diagonal matrix (A)−1. We can thus eliminate δu to obtain a reduced system in terms
of δˆu as
K δˆu = r, (20)
where
K =− C(A)−1B + D, r = g − C(A)−1f. (21)
This is the global linear system to be solved at every Newton iteration. It is important to point out that the size and
connectivity of the Jacobian matrix K depends on the choice of the approximation space Mk
h. For both the HDG method
and the IEDG method, because the degrees of freedom on each boundary face are only connected to the degrees of freedom


## Page 7

680 N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692
on the other faces of the element containing that particular boundary face, we can further reduce the size of the linear
system (20) by locally eliminating the degrees of freedom of δˆuh on the boundary faces. However, this additional static
condensation cannot be applied to the EDG method because the degrees of freedom on boundary faces are connected to
those on several elements. We refer to Subsection 2.3 for estimates about the size and the number of non-zero entries in
the Jacobian matrix for the HDG, EDG and IEDG methods.
In practice, to form the global Jacobian matrix K, we do not need to explicitly compute the matrices A, B, C, and D.
Instead, we compute the elemental matrices and elemental vectors, and perform the standard ﬁnite element assembly to
form the system (20). In particular, the elemental matrix and vector on an element K ∈ Th are given by
KK =− CK (AK )−1BK + DK , rK = gK − CK (AK )−1fK , (22)
where
AK
ij =−
(
F′(uh)φj,∇φi
)
K +
⟨
S(ˆuh)φj,φi
⟩
∂K ,
BK
in =
⟨
(F′(ˆuh) · n + S′(ˆuh)(uh − ˆuh) − S(ˆuh))ζn,φi
⟩
∂K ,
CK
lj =
⟨
S(ˆuh)φj,ζl
⟩
∂K\∂/Omega1+
⟨
b′(uh,ˆuh)φj,ζl
⟩
∂K∩∂/Omega1,
DK
ln =
⟨
(F′(ˆuh) · n + S′(ˆuh)(uh − ˆuh) − S(ˆuh))ζn,ζl
⟩
∂K\∂/Omega1+
⟨
b′′(uh,ˆuh)ζn,ζl
⟩
∂K∩∂/Omega1,
fK
i = ( f ,φi)K +
(
F(uh),∇φi
)
K −
⟨
F(ˆuh) · n + S(ˆuh)(uh − ˆuh),φi
⟩
∂K ,
gK
l =−
⟨
F(ˆuh) · n + S(ˆuh)(uh − ˆuh),ζl
⟩
∂K\∂/Omega1−
⟨
b(uh,ˆuh),ζl
⟩
∂K∩∂/Omega1, (23)
for i, j =1, ...,  M and l, n =1, ...,  N. Here φj, j =1, ...,  M, are polynomial basis functions in the local space (Pk(K∗))m
and ζn, n =1, ...,  N, are polynomial basis functions in the local space (Pk(F∗))m×e, where e is the number of faces on one
element. Note here that K∗ is the master element and F∗ is the master face.
The elemental matrices and vectors are then assembled into the global Jacobian matrix and vector as
KI K (l),I K (n) := KI K (l),I K (n) + KK
ln, rI K (n) := rI K (n) + rK
n , l, n =1,..., N, (24)
where, for each K ∈ Th, I K is the element connectivity vector that contains the numberings of the degrees of freedom of
ˆuh on ∂K. Note that the element connectivity vectors I K for all K ∈ Th depend on the choice of the approximation space
Mk
h. Therefore, as regards the implementation, the only difference among the HDG method, the EDG method and the IEDG
method lies in the assembly of the elemental quantities into the global Jacobian matrix and vector.
Finally, we note that we use the same shape functions to represent both the numerical solution and the geometry. It
means that the space of polynomials of degree k on the master element K∗ is used to represent the shape of every element
K ∈ Th. The element and face integrals in (23) are transformed into the integrals on the master element and the master
face, respectively. The resulting integrals are then computed by using Gauss quadratures.
3.4. The unsteady case
We consider the extension of the EDG method to the unsteady Euler equations:
∂u
∂t +∇· F(u) = f , in /Omega1× (0, T], (25)
with the initial condition u(t =0) = u0 and appropriate boundary conditions. We denote by (un
h, ˆun
h) the numerical approx-
imations to (u(tn), ˆu(tn)) at time tn = n/Delta1tn, where /Delta1tn is a timestep size at level n.
Using the EDG method to discretize (25) in space and the backward Euler method to discretize the time derivative, we
obtain that (uh, ˆuh) ∈ Uk
h × Mk
h satisﬁes
( un
h
/Delta1tn , w
)
Th
−
(
F(un
h),∇ w
)
Th
+
⟨
F(ˆun
h) · n + S(ˆun
h)(un
h − ˆun
h), w
⟩
∂Th
=
(
f n +
un−1
h
/Delta1tn , w
)
Th
, (26a)
⟨
F(ˆun
h) · n + S(ˆun
h)(un
h − ˆun
h),μ
⟩
∂Th\∂/Omega1+
⟨
b(un
h,ˆun
h),μ
⟩
∂/Omega1=0, (26b)
for all (w, μ) ∈ Uk
h × Mk
h. Since this system is similar to the system (10) for the steady-state case, we apply the same
solution procedure described above to solve the problem (26) at every time step.
Higher-order time-stepping methods such as the backward difference formula schemes or the diagonally implicit Runge–
Kutta methods [1] can also be used to discretize the time derivative in a similar fashion. We refer to [45,48] for a detailed
discussion.


## Page 8

N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692 681
3.5. Numerical examples
3.5.1. Ringleb ﬂow
We ﬁrst consider the Ringleb ﬂow to demonstrate the optimal accuracy of the EDG method. The Ringleb ﬂow is an exact
smooth solution of the Euler equations obtained using the hodograph method [10]. For any given (x, y), we ﬁrst obtain the
radial velocity V by solving the following nonlinear equation
(x − 0.5L2) + y2 = 1
4ρ2 V4 ,
where
c =
√
1 − V2
5 , ρ= c5, L = 1
c + 1
3c3 + 1
5c5 − 1
2 ln 1 + c
1 − c .
We then compute the exact solution as
ρ= c5, p = c7/γ, v1 = V cos(θ), v2 = V sin(θ),
where
ψ =
√
1
2V2 − (x − 0.5L)ρ,θ =arcsin(ψ V ).
Since the exact solution can be determined at any spatial point, we take the domain /Omega1to be (−2, −1) ×(1, 2). The boundary
condition is prescribed by setting the freestream value u∞ to the exact solution on the boundary of the domain. We consider
triangular meshes that are obtained by splitting a regular n × n Cartesian grid into 2n2 triangles. On these meshes, we use
polynomials of degree k to represent all the approximate variables with a nodal basis.
We present the L2 error and convergence rate of the numerical solution uh as a function of h and k in Table 3 for the
HDG method, Table 4for the EDG method, and in Table 5for the IEDG method. We observe that the approximate solution
converges with the optimal order k +1f o r all the methods. Although the EDG and IEDG methods have less globally coupled
degrees of freedom than the HDG method, they yield results as accurate as the HDG method. Furthermore, we note that the
coeﬃcients αDOF and αNNZ quickly approach those values in Tables 1 and 2, respectively, as the mesh size decreases.
3.5.2. Inviscid ﬂow past a channel with a smooth bump
This problem is a Benchmark case proposed in the recent Workshop on High-Order CFD Methods [66], which aims at
testing high-order methods for the computation of internal ﬂow with a high-order curved boundary representation. The
computational domain is bounded between x =− 1.5 and x =1.5, and between the bump and y =0.8. The bump is deﬁned
as y = 0.0625e−25x2
. The inﬂow Mach number is 0.5 at zero angle of attack. In this subsonic ﬂow problem, entropy is
constant in the ﬂow ﬁeld. The L2 norm of the entropy error is then used as the indicator of solution accuracy since the
analytical solution is unknown.
We consider quadrilateral meshes obtained by reﬁning the coarsest mesh (a 2 ×8 Cartesian grid) as shown in Fig. 1. On
these meshes, we use polynomials of degree k to represent all the approximate variables with a nodal basis. The entropy
error convergence is presented in Fig. 2. We see that all the three schemes converge optimally with order k +1. Both the
EDG and IEDG methods yield errors and convergence rates equally well as the HDG method.
We report in Table 6 and Table 7 the number of degrees of freedom and the number of nonzero entries of the global
linear system, and the CPU time to solve the system for each method. We clearly see that the IEDG method is more eﬃcient
than the HDG method and the EDG method because it requires less memory storage and computational time than the other
two methods. However, the comparison is not fair for the HDG method because the MATLAB sparse direct solver used for
solution of the linear system does not make use of the block structure of the HDG method. An implementation of a linear
solver that takes advantage of the block structure will certainly improve the performance of the HDG method, see [33].
Furthermore, we note that each method takes the same CPU time to assemble the linear system. The CPU time to assemble
the system is usually smaller than the CPU time to solve it [62].
3.5.3. Inviscid subsonic ﬂow past a NACA0012 airfoil
This example involves inviscid subsonic ﬂow over a NACA2012 airfoil at a free stream Mach number M∞ =0.5 and an
angle of attack α = 2 degrees. This problem is a Benchmark case proposed in the recent Workshop on High-Order CFD
Methods [66], which aims at testing high-order methods for the computation of external ﬂow with a high-order curved
boundary representation. The far ﬁeld boundary is placed at a distance of ten chords away from the airfoil. We refer to [66]
for a detailed description of this test case.
We consider two different meshes shown in Fig. 3. The coarse mesh consists of Ne =256 quadrilateral elements, while
the ﬁne mesh has Ne =1024 quadrilateral elements. We use polynomials of degree k =4t o represent both the numerical
solution and geometry on the coarse mesh, while using polynomials of degree k = 2t o represent both the numerical
solution and geometry on the ﬁne mesh. In addition, we also compute a reference solution on a very ﬁne mesh of 4096


## Page 9

682 N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692
Table 3
History of convergence of the HDG method for the Ringleb ﬂow.
Mesh
h =3/n
k =1 k =2 k =3 k =4
error order αDOF αNNZ error order αDOF αNNZ error order αDOF αNNZ error order αDOF αNNZ
3/2 4.35e −3 – 0.015 0 .103 3.24e −4 – 0.022 0 .231 2.35e −5– 0 .029 0 .411 2.08e −6– 0 .037 0 .643
3/41 . 1 0 e −3 1.98 0.073 0 .632 4.85e −5 2.74 0.110 1 .421 1.43e −64 . 0 4 0 .147 2 .527 7.90e −84 . 7 2 0 .184 3 .949
1/82 . 8 0 e −4 1.98 0.323 3 .012 6.92e −6 2.81 0.485 6 .777 8.63e −84 . 0 5 0 .646 12 .05 2.80e −94 . 8 2 0 .808 18 .82
3/16 7.06e −5 1.99 1.352 13 .06 9.37e −7 2.88 2.028 29 .39 5.18e −94 . 0 6 2 .703 52 .25 9.36e −11 4.90 3 .379 81 .63
3/32 1.77e −5 2.00 5.524 54 .32 1.22e −7 2.94 8.287 122 .2 3.83e −10 3.76 11 .05 217 .33 . 0 9 e −12 4.92 13 .81 339 .5
Table 4
History
 of convergence of the EDG method for the Ringleb ﬂow.
Mesh
h =3/n
k =1 k =2 k =3 k =4
error order αDOF αNNZ error order αDOF αNNZ error order αDOF αNNZ error order αDOF αNNZ
3/2 4.31e −3 – 0.008 0.038 3.52e −4 – 0.023 0 .199 2.47e −5 – 0.038 0 .478 2.32e −6 – 0.052 0 .875
3/41 . 0 8 e −3 2.00 0.023 0.126 5.99e −5 2.56 0.074 0 .736 1.50e −6 4.05 0.126 1 .801 9.21e −8 4.65 0.177 3 .321
3/8 2.76e −4 1.97 0.074 0.456 9.93e −6 2.59 0.265 2 .822 8.74e −8 4.10 0.456 6 .980 3.56e −9 4.69 0.647 12 .93
3/16 7.00e −5 1.98 0.265 1.735 1.51e −6 2.72 1.000 11 .05 5.14e −9 4.09 1.735 27 .48 1.60e −10 4.48 2.469 51 .01
3/32 1.75e −5 2.00 1.000 6.759 2.13e −7 2.83 3.880 43 .73 3.62e −10 3.83 6.759 109 .0 5.41e −12 4.89 9.369 202 .6
Table 5
History
 of convergence of the IEDG method for the Ringleb ﬂow.
Mesh
h =3/n
k =1 k =2 k =3 k =4
error order αDOF αNNZ error order αDOF αNNZ error order αDOF αNNZ error order αDOF αNNZ
3/2 4.44e −3 – 0.006 0.028 3.65e −4 – 0.014 0 .109 2.38e −5 – 0.021 0 .241 2.23e −6 – 0.028 0 .425
3/4 1.11e −3 2.00 0.021 0.117 6.13e −5 2.57 0.058 0 .565 1.42e −6 4.06 0.095 1 .329 1.04e −7 4.42 0.131 2 .409
3/8 2.83e −4 1.97 0.073 0.447 1.02e −5 2.60 0.234 2 .489 1.04e −7 3.78 0.396 6 .037 3.97e −9 4.71 0.557 11 .09
3/16 7.18e −5 1.98 0.264 1.725 1.54e −6 2.72 0.939 10 .39 5.94e −9 4.13 1.615 25 .59 1.45e −10 4.78 2.291 47 .32
3/32 1.80e −5 2.00 0.998 6.750 2.37e −7 2.70 3.760 42 .42 3.50e −10 4.08 6.522 105 .35 . 1 0 e −12 4.83 9.285 195 .2


## Page 10

N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692 683
Fig. 1. Inviscid ﬂow through a channel with a smooth bump: Initial mesh of 2 ×8 quadrilateral elements. Finer meshes are obtained by successively reﬁned
the initial mesh.
Fig. 2. Inviscid ﬂow through a channel with a smooth bump: Entropy error norm versus mesh size, shown for (a)k =2a n d( b )k =3.
Table 6
Inviscid ﬂow through a channel with a smooth bump: Computational cost of solving the global linear system for the HDG, EDG, and IEDG methods for
k =2.
Mesh
n × m
Degrees of freedom Number of non-zero entries CPU time in seconds
HDG EDG IEDG HDG EDG IEDG HDG EDG IEDG
2 ×8 264 276 180 14688 13328 7952 0.0059 0.0035 0.0017
4 ×16 1296 932 756 92736 50704 40528 0.0389 0.0124 0.0070
8 ×32 5664 3396 3060 442368 197648 177872 0.1376 0.0580 0.0545
16 ×64 23616 12932 12276 1915776 780304 741328 0.8954 0.2509 0.2359
64 ×128 96384 50436 49140 7959168 3100688 3023312 3.9691 1.2546 1.2512
Table 7
Inviscid
 ﬂow through a channel with a smooth bump: Computational cost of solving the global linear system for the HDG, EDG, and IEDG methods for
k =3.
Mesh
n × m
Degrees of freedom Number of non-zero entries CPU time in seconds
HDG EDG IEDG HDG EDG IEDG HDG EDG IEDG
2 ×8 352 444 268 26112 31344 16816 0.0120 0.0114 0.0089
4 ×16 1728 1524 1188 164864 120528 91920 0.0672 0.0341 0.0263
8 ×32 7552 5604 4948 786432 472464 415696 0.1967 0.1143 0.1089
16 ×64 31488 21444 20148 3405824 1870608 1757520 1.2723 0.6567 0.6460
64 ×128 128512 83844 81268 14149632 7443984 7218256 10.5586 4.1901 4.1459
quadrilateral elements using polynomials of degree k =4. We will use the reference solution to verify the accuracy of the
numerical solutions computed on the coarse mesh and the ﬁne mesh.
We show in Fig. 4 the Mach number contours for the numerical solutions computed using the IEDG method on the
coarse mesh and the ﬁne mesh. Note that the IEDG discretization on the coarse mesh with k = 4 has 6904 degrees of
freedom and 771040  nonzero entries in the Jacobian matrix, while the one on the ﬁne mesh with k =2 has 12088  degrees
of freedom and 729568  nonzero entries. While the Mach number contours resemble, it is veriﬁed that the k =4s o l u t i o n is
actually more accurate than the k =2s o l u t i o n since the former yields smaller errors in the lift and drag coeﬃcients than
the latter.
We report in Table 8the errors in the lift coeﬃcient and drag coeﬃcient for the HDG, EDG, and IEDG methods. It can be
seen that the discretizations on the coarse mesh with k =4p r o d u c e smaller errors than those on the ﬁne mesh with k =2.
This demonstrates the beneﬁt of using polynomials of high degree to approximate the solution and geometry. Furthermore,


## Page 11

684 N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692
Fig. 3. Inviscid subsonic ﬂow past a NACA0012 airfoil: (a) coarse mesh and (b) ﬁne mesh.
Fig. 4. Inviscid subsonic ﬂow past a NACA0012 airfoil: Mach number contours for the numerical solutions computed using the IEDG method on (a) the
coarse mesh with k =4a n d (b) the ﬁne mesh with k =2.
Table 8
Inviscid subsonic ﬂow past a NACA0012 airfoil: Errors in the lift coeﬃcient and drag coeﬃcient for the HDG, EDG, and IEDG solutions computed on the
coarse mesh with k =4a n d the ﬁne mesh with k =2.
Mesh
(Ne, k)
Error in lift coeﬃcient Error in drag coeﬃcient
HDG EDG IEDG HDG EDG IEDG
(256,4) 2.22 ×10−5 2.95 ×10−4 2.57 ×10−4 8.93 ×10−5 1.78 ×10−3 2.11 ×10−4
(1024,2) 6.59 ×10−5 3.80 ×10−4 3.25 ×10−4 1.53 ×10−4 2.30 ×10−3 3.07 ×10−4
we observe that the HDG method is more accurate than the EDG and IEDG methods, while the IEDG method is more
accurate than the EDG method.
Finally, we display in Fig. 5 the pressure coeﬃcient and skin friction coeﬃcient over the airfoil surface, which are ob-
tained from the y-momentum and x-momentum components of the numerical ﬂux F (ˆuh) · n + S(ˆuh)(uh − ˆuh), respectively.
The pressure coeﬃcient distributions are very close to the reference one except that there are some small overshoots near
the trailing edge due to a singularity at the trailing edge of the airfoil. Note that the exact value of the skin friction is zero
for the inviscid ﬂow. While both the HDG and IEDG methods have zero errors (up to machine tolerance) in the skin friction,
the EDG method has quite large errors in the skin friction especially near the trailing edge as shown in Fig. 5. These results
conﬁrm that the IEDG method outperforms the EDG method.


## Page 12

N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692 685
Fig. 5. Inviscid subsonic ﬂow past a NACA0012 airfoil: Pressure coeﬃcient (top) and skin friction coeﬃcient (bottom) for (a) the coarse mesh with k =4
and (b) the ﬁne mesh with k =2. Note that REF stands for the reference solution.
4. The Navier–Stokes equations
4.1. Governing equations
We consider the steady-state compressible Navier–Stokes equations in conservation form as
∇· (F(u) + G(u,∇ u)) = f , in /Omega1, (27)
where u = (ui), 1 ≤ i ≤ m = d + 2, is a vector of conserved dimensionless quantities (namely, density, momentum and
energy), F(u) are inviscid ﬂuxes of dimension m × d, G(u, ∇ u) are viscous ﬂuxes of dimension m × d, and f is a source
term. The nondimensional form of the Navier–Stokes equations as well as the deﬁnition of the inviscid and viscous ﬂuxes
can be found in [2]. The Navier–Stokes equations (27) are supplemented with appropriate boundary conditions which will
be discussed later.
4.2. The EDG methods
4.2.1. Formulation and implementation
We begin by considering the Navier–Stokes system (27) on any element K ∈ Th and rewrite it as
q −∇ u =0, in K,
∇· (F(u) + G(u, q)) = f , in K. (28)
Multiplying with some test functions (v, w) and integrating the resulting equations by part we obtain
(q, v)K + (u,∇· v)K − ⟨ˆu, v · n⟩∂K =0, (29a)
− (F(u) + G(u, q),∇ w)K + ⟨(F(ˆu) + G(ˆu, q)) · n, w⟩∂K = ( f , w)K , (29b)
where ˆu is the trace of the solution and n is the outward normal unit vector to ∂K.
We next introduce the local problem on any element K ∈ Th as: Find (qh, uh) ∈ Qk
h × Uk
h such that it satisﬁes


## Page 13

686 N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692
(
qh, v
)
K + (uh,∇· v)K − ⟨ˆuh, v · n⟩∂K =0, (30a)
−
(
F(uh) + G(uh, qh),∇ w
)
K +
⟨
(F(ˆuh) + G(ˆuh, qh)) · n + S(ˆuh)(uh − ˆuh), w
⟩
∂K = ( f , w)K , (30b)
for all (p, w) ∈ (Pk(K))m×d × (Pk(K))m. This local problem deﬁnes (qh, uh) locally as a function of ˆuh. To determine ˆuh ∈
Mk
h we require that
⟨
(F(ˆuh) + G(ˆuh, qh)) · n + S(ˆuh)(uh − ˆuh),μ
⟩
∂Th\∂/Omega1+
⟨
b(uh,ˆuh, qh),μ
⟩
∂/Omega1=0, ∀μ ∈ Mk
h. (31)
Here S(ˆuh) is the stabilization matrix and b(uh, ˆuh, qh) is the boundary numerical ﬂux. The system (30)–(31) completely
deﬁnes either the EDG method or the HDG method for the Navier–Stokes equations depending on the choice of the approx-
imation space Mk
h.
The implementation of the EDG method (or the HDG method) for the Navier–Stokes equations is similar to that of the
EDG method (or the HDG method) for the Euler equations (6). We compute the elemental matrices and elemental vectors,
and perform the standard ﬁnite element assembly to form the linear system at every Newton iteration. The elemental matrix
and vector on an element K ∈ Th are given by
KK =− CK (AK )−1BK + DK , rK = gK − CK (AK )−1fK , (32)
where
AK =
[
AKq q AKq u
AKu q AKu u
]
, BK =
[
BKq
BKu
]
, CK =[ CKq CKu ], fK =
[
fKq
fKu
]
, (33)
and
AKq q
ps =
(
ψ s,ψ p
)
K ,
AKq u
pj =
(
φj,∇· ψ p
)
K ,
AKu q
is =−
(
G′′(uh, qh)ψ s,∇φi
)
K +
⟨
(G′′(ˆuh, qh) · n)ψ s,φi
⟩
∂K ,
AKu u
ij =−
(
(F′(uh) + G′(uh, qh))φj,∇φi
)
K +
⟨
S(ˆuh)φj,φi
⟩
∂K ,
BKq
pn =−
⟨
ζn,ψ p · n
⟩
∂K ,
BKu
in =
⟨
((F′(ˆuh) + G′(ˆuh, qh)) · n + S′(ˆuh)(uh − ˆuh) − S(ˆuh))ζn,φi
⟩
∂K ,
CKq
ls =
⟨
(G′′(ˆuh, qh) · n)ψ s,ζl
⟩
∂K\∂/Omega1+
⟨
b′′′(uh,ˆuh, qh)ψ s,ζl
⟩
∂K∩∂/Omega1,
CKu
lj =
⟨
S(ˆuh)φj,ζl
⟩
∂K\∂/Omega1+
⟨
b′(uh,ˆuh, qh)φj,ζl
⟩
∂K∩∂/Omega1,
DK
ln =
⟨
((F′(ˆuh) + G′(ˆuh, qh)) · n + S′(ˆuh)(uh − ˆuh) − S(ˆuh))ζn,ζl
⟩
∂K\∂/Omega1+
⟨
b′′(uh,ˆuh, qh)ζn,ζl
⟩
∂K∩∂/Omega1,
fKq
i =−
(
qh,ψ i
)
K −
(
uh,∇· ψ i
)
K +
⟨ˆuh,ψ i · n
⟩
∂K ,
fKu
i = ( f ,φi)K +
(
F(uh) + G(uh, qh),∇φi
)
K −
⟨
(F(ˆuh) + G(ˆuh, qh)) · n + S(ˆuh)(uh − ˆuh),φi
⟩
∂K ,
gK
l =−
⟨
(F(ˆuh) + G(ˆuh, qh)) · n + S(ˆuh)(uh − ˆuh),ζl
⟩
∂K\∂/Omega1−
⟨
b(uh,ˆuh, qh),ζl
⟩
∂K∩∂/Omega1,
for i, j = 1, ...,  M, p, s = 1, ...,  P, and l, n = 1, ...,  N. Note that F′, S′, G′, G′′, b′, b′′ and b′′′ denote ∂F/∂uh, ∂S/∂ˆuh,
∂G/∂uh (or ∂G/∂ˆuh), ∂G/∂qh, ∂b/∂uh, ∂b/∂ˆuh, and ∂b/∂ˆqh, respectively. Here φj, j =1, ...,  M, are polynomial basis func-
tions in the local space (Pk(K∗))m, ψ p, p =1, ...,  P, are polynomial basis functions in the local space (Pk(K∗))m×d and ζn,
n =1, ...,  N, are polynomial basis functions in the local space (Pk(F∗))m×e, where we recall that K∗ is the master element
and F∗ is the master face.
Notice that the global Jacobian matrix for the Navier–Stokes equation also involves the degrees of freedom of ˆuh only
and has the same structure as that for the Euler equations. Extension to the unsteady case is straightforward by using
implicit time-stepping methods for temporal discretization as we already discussed in Subsection 3.4.
4.2.2. Wall boundary conditions
The inlet and outlet boundary conditions are imposed in the same manner as those of the Euler case. For the wall
boundary conditions, we extrapolate the density, equate the ﬂuid velocity to the wall velocity v = v w, and set either a
ﬁxed temperature T = T w (isothermal wall) or a ﬁxed heat ﬂux ∂T/∂n = qw (adiabatic wall). The strategy to impose these
conditions is described as follows. First, we set
b1 = uh1 − ˆuh1, (34)
which means that we extrapolate the density. We then set


## Page 14

N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692 687
bi = v wi − ˆuhi/ˆuh1, 2 ≤ i ≤ m − 1, (35)
which means that we impose the no-slip condition at the solid wall. For the last component of b, we need to distinguish
between the isothermal wall and the adiabatic wall. For the isothermal wall, we set
bm = T w − T(ˆuh), (36)
where the approximate temperature T(ˆuh) is calculated based on ˆuh. For the adiabatic wall, we set
bm = qw − q(qh, uh,ˆuh), (37)
where q is the m-th component of the numerical ﬂux (F(ˆuh) + G(ˆuh, qh)) · n + S(ˆuh)(uh − ˆuh).
4.2.3. Stabilization matrix
To deﬁne the stabilization matrix for the Navier–Stokes equations, we add to the stabilization matrix in the EDG method
and the HDG method for the Euler equations a viscous stabilization as
S v = γ
Pr Re I. (38)
Here Re is the Reynolds number, Pr is the Prandtl number, and γ is the heat capacity ratio. For compressible viscous ﬂows
the Reynolds number is typically very large and hence the contribution of the viscous component may be neglectable.
However, the viscous stabilization may play an important role in cases where the Reynolds number is small.
4.3. Numerical examples
4.3.1. A linear convection–diffusion problem
The purpose of this example is to compare the proposed methods with the standard continuous Galerkin (CG) method.
For this purpose, we consider the following linear convection–diffusion problem
∇· (cu) −∇ 2u = f , in /Omega1,
u =0o n ∂/Omega1. (39)
Here /Omega1 = (0, 1) × (0, 1), c = (cx, c y), and the source term f is chosen to yield the following exact solution
u(x, y) = xy (1 − e(x−1)cx )(1 − e(y−1)c y )
(1 − e− cx )(1 − e− c y ) .
The solution develops boundary layers along the boundaries x =1 and y =1f o r large values of the velocity c. This example
serves to validate the performance of the proposed methods in the weakly convection-dominated regime. For this purpose
we consider c = (20, 20) in our numerical experiments.
We consider triangular meshes obtained by splitting a regular n × n Cartesian grid into a total of 2n2 triangles, giving
uniform element sizes of h =1/n. On these meshes, we consider solutions of polynomial degree k represented using a nodal
basis within each element, with the nodes uniformly distributed.
We present the error and order of convergence in L2-norm in Table 9 for the HDG, EDG, EDG0, IEDG, and CG methods.
Here EDG0 represents the EDG method which strongly imposes the Dirichlet boundary condition by setting the approximate
trace to zero on the domain boundary. For the HDG method the L2 error is computed using the postprocessed solution
which is obtained by locally postprocessing the HDG solution [52]. As expected, the postprocessed solution of the HDG
method converges with order k +2, which is one order higher than the other methods. It is interesting to see that how
the Dirichlet condition is enforced can affect the convergence rate of the EDG method especially for k = 1. In particular,
for k =1, strongly enforcing the Dirichlet condition yields optimal convergence rate of k +1, whereas weakly imposing it
results in suboptimal convergence of order k. However, both approaches yield optimal convergence rate of k +1f o r k >1.
Furthermore, we see that both the IEDG method and the CG method deliver optimal convergence of order k +1f o r the
numerical solution. However, the IEDG method yields smaller errors than the CG method, while both of them have the
same number of global degrees of freedom and the same number of nonzero entries in the matrix system. It is known that
the CG method for convection–diffusion problems produces overshoots when it does not have enough resolution to resolve
the boundary layer feature. To demonstrate this point, we show in Fig. 6 the numerical solution computed using the IEDG
method and the CG method computed for n =8 and k =2. We observe that the numerical solution of the CG method has
considerable oscillations near the top and right boundaries, whereas the numerical solution of the IEDG method is quite
smooth and clean. Indeed, as shown in Table 9, the IEDG solution has about 4 times smaller error than the CG solution
for n =8 and k =2. The results presented here illustrate that the IEDG method is more robust and accurate than the CG
method.


## Page 15

688 N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692
Table 9
Comparison of the methods in terms of the L2 error in the solution and order of convergence. The postprocessed solution is used to compute the error for
the HDG method. Note that EDG0 represents the EDG method which strongly imposes the boundary condition by setting the approximate trace to zero on
the domain boundary.
Degree
k
Mesh
h =1/n
HDG EDG EDG0 IEDG CG
error order error order error order error order error order
11 /8 8.18e−3 – 2.57e −2 – 2.79e −2 – 1.42e −2 – 4.45e −2–
1/16 1.74e −3 2.23 2.27e −2 0.18 9.48e −3 1.56 5.03e −3 1.50 1.26e −21 . 8 3
1/32 2.80e −4 2.63 1.72e −2 0.40 2.63e −3 1.85 1.75e −3 1.53 3.25e −31 . 9 5
1/64 3.92e −52 . 8 41 . 1 0 e −2 0.65 6.64e −4 1.99 5.36e −4 1.70 8.19e −41 . 9 9
1/128 5.16e −6 2.93 6.27e −3 0.81 1.66e −4 2.00 1.49e −4 1.84 2.05e −42 . 0 0
21 /8 1.52e−3 – 3.43e −3 – 4.28e −3 – 2.12e −3 – 7.97e −3–
1/16 1.60e −4 3.25 8.08e −4 2.08 7.12e −4 2.59 4.63e −4 2.19 1.29e −32 . 6 2
1/32 1.21e −5 3.73 1.21e −4 2.74 9.4e −5 2.92 7.63e −5 2.60 1.73e −42 . 9 0
1/64 8.02e −7 3.91 1.58e −5 2.93 1.18e −5 2.99 1.07e −5 2.83 2.20e −52 . 9 8
1/128 5.12e −8 3.97 2.09e −6 2.92 1.49e −6 2.99 1.42e −6 2.92 2.76e −63 . 0 0
31 /8 2.82e−4 – 7.89e −4 – 9.64e −4 – 5.28e −4 – 1.52e −3–
1/16 1.53e −5 4.20 1.06e −4 2.90 8.43e −5 3.52 5.62e −5 3.23 1.34e −43 . 5 0
1/32 5.81e −7 4.72 9.78e −6 3.44 5.51e −6 3.94 4.42e −6 3.67 9.02e −63 . 9 0
1/64 1.92e −8 4.92 7.25e −7 3.75 3.31e −7 4.06 2.95e −7 3.90 5.56e −74 . 0 2
1/128 6.08e −10 4.98 4.87e −8 3.90 1.98e −8 4.06 1.87e −8 3.98 3.39e −84 . 0 4
Fig. 6. Plots of the approximate solution computed using (a) the IEDG method and (b) the CG method for the mesh n =8a n d the polynomial degree k =2.
4.3.2. Viscous subsonic ﬂow past a NACA0012 airfoil
We consider the viscous analog of the inviscid case described in Subsection 3.5.3. The problem is now a viscous subsonic
ﬂow over a NACA2012 airfoil at a free stream Mach number M∞ =0.5, Reynolds number Re =5000, and an angle of attack
α = 2 degree. We construct a sequence of C meshes. Each C mesh has m × n quadrilateral elements, where m denotes
the number of divisions along the radial direction and n denotes the number of divisions along the airfoil surfaces and
wakes. Fig. 7 shows the coarsest C mesh of Ne = 4 ×16 (m =4, n =16) quadrilateral elements and the ﬁrst reﬁnement
(m =8, n =32) of the coarsest mesh. The second reﬁnement (m =16, n =64) is obtained by reﬁning the ﬁrst reﬁnement.
In addition, the third reﬁnement (m =32, n =128) is only used to obtain the reference solution using the HDG method
with polynomials of degree k =4.
We show in Fig. 8the Mach number of the numerical solutions computed using the IEDG method on the coarsest mesh
with k =4 and the ﬁrst reﬁnement with k =2. Note that the IEDG discretization on the coarse mesh with k =4 has 1656
degrees of freedom and 173536  nonzero entries in the Jacobian matrix, while the one on the ﬁne mesh with k = 2 has
3064 degrees of freedom and 180960  nonzero entries. While the Mach numbers look similar, it can be seen from Fig. 9that
the k =4s o l u t i o n is actually more accurate than the k =2s o l u t i o n since the former yields smaller errors in the pressure
coeﬃcient and skin friction coeﬃcient than the latter. Fig. 9 depicts the pressure coeﬃcient and skin friction coeﬃcient
over the airfoil surface, which are obtained from the y-momentum and x-momentum components of the numerical ﬂux
F(ˆuh, qh) · n + S(ˆuh)(uh − ˆuh), respectively. We see that the k = 4s o l u t i o n s computed on the coarsest mesh yield the
pressure coeﬃcient and skin friction coeﬃcient distributions very close to the reference ones, while the k = 2s o l u t i o n s
computed on the ﬁrst reﬁnement produce some small oscillations in the pressure coeﬃcient distribution near the leading
edge. These results clearly demonstrate the beneﬁt of using high-order discretizations.
Finally, we report in Table 10the errors in the lift coeﬃcient and drag coeﬃcient for the HDG, EDG, and IEDG methods
for polynomial degrees from 1 to 4. We observe that the errors decrease rapidly as the polynomial degree k increases, which


## Page 16

N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692 689
Fig. 7. Viscous subsonic ﬂow past a NACA0012 airfoil: (a) the coarsest grid of 4×16 elements and (b) its ﬁrst reﬁnement of 8×32 elements.
Fig. 8. Viscous subsonic ﬂow past a NACA0012 airfoil: The Mach number of the numerical solutions computed using the IEDG method on (a) the coarsest
mesh with k =4a n d (b) the ﬁrst reﬁnement with k =2.
Table 10
Viscous subsonic ﬂow past a NACA0012 airfoil: Errors in the lift coeﬃcient and drag coeﬃcient for the HDG, EDG, and IEDG solutions.
Degree
k
Mesh
m × n
Error in lift coeﬃcient Error in drag coeﬃcient
HDG EDG IEDG HDG EDG IEDG
14 ×16 2 .22 ×10−1 3.15 ×10−1 2.57 ×10−1 2.93 ×10−2 3.48 ×10−2 3.11 ×10−2
8 ×32 6 .59 ×10−2 8.94 ×10−2 6.65 ×10−2 8.03 ×10−3 9.68 ×10−3 8.47 ×10−2
16 ×64 1 .71 ×10−2 2.26 ×10−2 1.73 ×10−2 2.43 ×10−3 3.12 ×10−3 2.76 ×10−3
24 ×16 8 .54 ×10−2 9.05 ×10−2 8.67 ×10−2 8.01 ×10−3 8.70 ×10−3 8.32 ×10−3
8 ×32 1 .32 ×10−2 1.43 ×10−2 1.35 ×10−2 1.23 ×10−3 1.38 ×10−3 1.27 ×10−3
16 ×64 1 .90 ×10−3 1.95 ×10−3 1.87 ×10−3 1.64 ×10−4 2.20 ×10−4 1.98 ×10−4
34 ×16 1 .95 ×10−2 1.94 ×10−2 1.92 ×10−2 1.72 ×10−3 2.09 ×10−3 1.88 ×10−3
8 ×32 1 .32 ×10−3 1.56 ×10−3 1.39 ×10−3 1.21 ×10−4 1.52 ×10−4 1.35 ×10−4
16 ×64 9 .82 ×10−5 1.08 ×10−4 9.97 ×10−5 8.75 ×10−6 1.20 ×10−5 9.09 ×10−6
44 ×16 6 .84 ×10−3 7.38 ×10−3 6.79 ×10−3 6.37 ×10−4 6.98 ×10−4 6.52 ×10−4
8 ×32 2 .71 ×10−4 3.06 ×10−4 2.75 ×10−4 2.49 ×10−5 2.82 ×10−5 2.65 ×10−5
16 ×64 1 .13 ×10−5 1.35 ×10−5 1.21 ×10−5 9.71 ×10−7 1.20 ×10−6 1.05 ×10−6
illustrates again the beneﬁt of using polynomials of high degree to approximate the solution and geometry. Note that all the
methods converge optimally with order k +1f o r k =1, while they do not converge optimally for k >1d u e to singularity
near the trailing edge. The IEDG method is just as accurate as the HDG method, while having signiﬁcant less degrees of
freedom.


## Page 17

690 N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692
Fig. 9. Viscous subsonic ﬂow past a NACA0012 airfoil: Pressure coeﬃcient (top) and skin friction coeﬃcient (bottom) for (a) the coarsest mesh and k =4
and (b) the ﬁrst reﬁnement with k =2. Note that REF stands for the reference solution.
5. Conclusions
We have presented a class of embedded discontinuous Galerkin methods for numerically solving systems of conservation
laws arising in computational ﬂuid dynamics. Although the paper is focused on the Euler and Navier–Stokes equations, the
EDG method can be used to solve other systems of equations. The proposed EDG methods inherit many features of HDG
methods and thus possess unique advantages which distinguish themselves from other DG methods. The main advantage
of the EDG methods is that it gives rise to a matrix system which has the sparsity structure of the statically condensed CG
method, while requiring less memory storage and computation time than other DG methods.
In this paper, we studied two particular EDG methods: the original EDG method presented in our previous work [55] is
constructed by requiring the approximate trace to be continuous on all the faces, while the IEDG method is constructed by
enforcing the continuity of the approximate trace only on the interior faces. There are two advantages of the IEDG method
relative to the original EDG method. First, with the IEDG method, the boundary conditions are enforced more rigorously
and accurately because the local spaces for the approximate trace on the domain boundary are exactly the same as those in
the HDG method. Second, for the IEDG method, the degrees of freedom of the approximate trace on the domain boundary
can be locally condensed without changing the sparsity pattern of the Jacobian matrix. Numerical results presented herein
show that the accuracy of the IEDG method appears to be comparable to that of the HDG method for many test cases. This
feature makes the IEDG method computationally competitive with other ﬁnite element methods and ﬁnite volume methods.
Both the HDG and EDG methods have been used to solve RANS ﬂows, shock ﬂows, as well as unsteady ﬂows [44–46,55,
56]. Future work will focus on extending the IEDG method to simulate these ﬂows and developing effective Newton–Krylov
solvers for solving the algebraic systems arising from the IEDG discretization of nonlinear systems of conservation laws in
ﬂuid mechanics. We close the paper by noting that the EDG methods can be combined with the discontinuous Petrov–
Galerkin (DPG) method [30] to capture shocks more robustly. This line of research has been investigated in our recent work
[42,43], wherein the DPG method is used for solving the local problems of the HDG method. The resulting hybridized DPG
scheme enables shock capturing of the viscous Burgers equation. The EDG methods may also beneﬁt from the DPG method
just as the same way as the HDG method does. This is a subject worthy of further investigation.
References
[1] R. Alexander, Diagonally implicit Runge–Kutta methods for stiff ODEs, SIAM J. Numer. Anal. 14 (1977) 1006–1021.


## Page 18

N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692 691
[2] D.A. Anderson, J.C. Tannehill, R.H. Pletcher, Computational Fluid Dynamics and Heat Transfer, Hemisphere Publishing, New York, 1984.
[3] D.N. Arnold, F. Brezzi, B. Cockburn, L.D. Marini, Uniﬁed analysis of discontinuous Galerkin methods for elliptic problems, SIAM J. Numer. Anal. 39 (5)
(2001) 1749–1779.
[4] F. Bassi, S. Rebay, A high-order accurate discontinuous ﬁnite element method for the numerical solution of the compressible Navier–Stokes equations,
J. Comput. Phys. 131 (2) (1997) 267–279.
[5] C. Baumann, J. Oden, A discontinuous hp ﬁnite element method for convection–diffusion problems, Comput. Methods Appl. Mech. Eng. 175 (1999)
311–341.
[6] F. Brezzi, J. Douglas Jr., L.D. Marini, Two families of mixed ﬁnite elements for second order elliptic problems, Numer. Math. 47 (1985) 217–235.
[7] A. Buffa, T.J.R. Hughes, G. Sangalli, Analysis of a multiscale discontinuous Galerkin method for convection–diffusion problems, SIAM J. Numer. Anal. 44
(2006) 1420–1440.
[8] Y. Chen, B. Cockburn, Analysis of variable-degree HDG methods for convection–diffusion equations. Part I: General nonconforming meshes, IMA J.
Numer. Anal. 32 (2012) 1267–1293.
[9] Y. Chen, B. Cockburn, Analysis of variable-degree HDG methods for convection–diffusion equations. Part II: Semimatching nonconforming meshes,
Math. Comput. 83 (2014) 87–111.
[10] G. Chiocchia, Exact solutions to transonic and supersonic ﬂows, Technical Report AR-211, AGARD, 1985.
[11] B. Cockburn, B. Dong, J. Guzmán, A superconvergent LDG-hybridizable Galerkin method for second-order elliptic problems, Math. Comput. 77 (2008)
1887–1916.
[12] B. Cockburn, B. Dong, J. Guzmán, M. Restelli, R. Sacco, A hybridizable discontinuous Galerkin method for steady-state convection–diffusion–reaction
problems, SIAM J. Sci. Comput. 31 (5) (2009) 3827–3846.
[13] B. Cockburn, J. Gopalakrishnan, The derivation of hybridizable discontinuous Galerkin methods for Stokes ﬂow, SIAM J. Numer. Anal. 47 (2009)
1092–1125.
[14] B. Cockburn, J. Gopalakrishnan, R. Lazarov, Uniﬁed hybridization of discontinuous Galerkin, mixed and continuous Galerkin methods for second order
elliptic problems, SIAM J. Numer. Anal. 47 (2009) 1319–1365.
[15] B. Cockburn, J. Gopalakrishnan, N.C. Nguyen, J. Peraire, F.-J. Sayas, Analysis of HDG methods for Stokes ﬂow, Math. Comput. 80 (2011) 723–760.
[16] B. Cockburn, J. Gopalakrishnan, F.-J. Sayas, A projection-based error analysis of HDG methods, Math. Comput. 79 (2010) 1351–1367.
[17] B. Cockburn, J. Guzmán, S.-C. Soon, H.K. Stolarski, An analysis of the embedded discontinuous Galerkin method for second-order elliptic problems,
SIAM J. Numer. Anal. 47 (2009) 2686–2707.
[18] B. Cockburn, J. Guzmán, H. Wang, Superconvergent discontinuous Galerkin methods for second-order elliptic problems, Math. Comput. 78 (2009) 1–24.
[19] B. Cockburn, G. Kanschat, D. Schötzau, C. Schwab, Local discontinuous Galerkin methods for the Stokes system, SIAM J. Numer. Anal. 40 (2002) 319–343.
[20] B. Cockburn, G. Kanschat, D. Schötzau, Local discontinuous Galerkin methods for the Oseen equations, Math. Comput. 73 (2004) 569–593.
[21] B. Cockburn, G. Kanschat, D. Schötzau, A locally conservative LDG method for the incompressible Navier–Stokes equations, Math. Comput. 74 (2005)
1067–1095.
[22] B. Cockburn, G. Kanschat, D. Schötzau, A note on discontinuous Galerkin divergence-free solutions of the Navier–Stokes equations, J. Sci. Comput. 31
(2007) 61–73.
[23] B. Cockburn, G. Kanschat, D. Schötzau, An equal-order DG method for the incompressible Navier–Stokes equations, J. Sci. Comput. 40 (2009) 141–187.
[24] B. Cockburn, W. Qiu, K. Shi, Conditions for superconvergence of HDG methods for second-order elliptic problems, Math. Comput. 81 (2012) 1327–1353.
[25] B. Cockburn, W. Qui, K. Shi, Conditions for superconvergence of HDG methods on curvilinear elements for second-order elliptic problems, SIAM J.
Numer. Anal. 50 (2012) 1417–1432.
[26] B. Cockburn, K. Shi, Conditions for superconvergence of HDG methods for Stokes ﬂow, Math. Comput. 82 (2013) 651–671.
[27] B. Cockburn, K. Shi, Superconvergent HDG methods for linear elasticity with weakly symmetric stresses, IMA J. Numer. Anal. 33 (2013) 747–770.
[28] B. Cockburn, C.W. Shu, The local discontinuous Galerkin method for convection–diffusion systems, SIAM J. Numer. Anal. 35 (1998) 2440–2463.
[29] B. Cockburn, C.-W. Shu, Runge–Kutta discontinuous Galerkin methods for convection-dominated problems, J. Sci. Comput. 16 (3) (2001) 173–261.
[30] L. Demkowicz, J. Gopalakrishnan, A class of discontinuous Petrov–Galerkin methods. Part I: The transport equation, Comput. Methods Appl. Mech. Eng.
199 (2010) 1558–1572.
[31] K.J. Fidkowski, T.A. Oliver, J. Lu, D.L. Darmofal, p-Multigrid solution of high-order discontinuous Galerkin discretizations of the compressible Navier–
Stokes equations, J. Comput. Phys. 207 (1) (2005) 92–113.
[32] S. Güzey, B. Cockburn, H. Stolarski, The embedded discontinuous Galerkin methods: application to linear shell problems, Int. J. Numer. Methods Eng.
70 (2007) 757–790.
[33] R.M. Kirby, S.J. Sherwin, B. Cockburn, To HDG or to CG: a comparative study, J. Sci. Comput. 51 (2012) 183–212.
[34] R. Hartmann, P. Houston, Adaptive discontinuous Galerkin ﬁnite element methods for the compressible Euler equations, J. Comput. Phys. 183 (2002)
508–532.
[35] J.S. Hesthaven, T. Warburton, Nodal high-order methods on unstructured grids, I. Time-domain solution of Maxwell’s equations, J. Comput. Phys. 181 (1)
(2002) 186–221.
[36] A. Huerta, A. Angeloski, X. Roca, J. Peraire, Eﬃciency of high-order elements for continuous and discontinuous Galerkin methods, Int. J. Numer. Methods
Eng. 96 (2013) 529–560.
[37] T. J.R.  Hughes, G. Scovazzi, P.B. Bochev, A. Buffa, A multiscale discontinuous Galerkin method with the computational structure of a continuous Galerkin
method, Comput. Methods Appl. Mech. Eng. 195 (2006) 2761–2787.
[38] C.M. Klaij, J.J.W. van der Vegt, H. van der Ven, Space–time discontinuous Galerkin method for the compressible Navier–Stokes equations, J. Comput.
Phys. 217 (2) (2006) 589–611.
[39] I. Lomtev, G.E. Karniadakis, A discontinuous Galerkin method for the Navier–Stokes equations, Int. J. Numer. Methods Fluids 29 (1999) 587–603.
[40] I. Lomtev, R.M. Kirby, G.E. Karniadakis, A discontinuous Galerkin ALE method for compressible viscous ﬂows in moving domains, J. Comput. Phys.
155 (1) (1999) 128–159.
[41] A. Montlaur, S. Fernández-Méndez, J. Peraire, A. Huerta, Discontinuous Galerkin methods for the Navier–Stokes equations using solenoidal approxima-
tions, Int. J. Numer. Methods Fluids 64 (2010) 549–564.
[42] D. Moro, N.C. Nguyen, J. Peraire, J. Gopalakrishnan, A hybridized discontinuous Petrov–Galerkin method for compressible ﬂows (AIAA Paper 2011-197),
in: Proceedings of the 49th AIAA Aerospace Sciences Meeting and Exhibit, Orlando, FL, January 2011.
[43] D. Moro, N.C. Nguyen, J. Peraire, A hybridized discontinuous Petrov–Galerkin scheme for scalar conservation laws, Int. J. Numer. Methods Eng. 91 (2012)
950–970.
[44] D. Moro, N.C. Nguyen, J. Peraire, Navier–Stokes solution using hybridizable discontinuous Galerkin methods (AIAA Paper 2011-3060), in: Proceedings
of the 20th AIAA Computational Fluid Dynamics Conference, Honolulu, HI, June 2011.
[45] N.C. Nguyen, J. Peraire, Hybridizable discontinuous Galerkin methods for partial differential equations in continuum mechanics, J. Comput. Phys. 231
(2012) 5955–5988.
[46] N.C. Nguyen, J. Peraire, An adaptive shock-capturing HDG method for compressible ﬂows (AIAA Paper 2011-3407), in: Proceedings of the 20th AIAA
Computational Fluid Dynamics Conference, Honolulu, HI, June 2011.


## Page 19

692 N.C. Nguyen et al. / Journal of Computational Physics 302 (2015) 674–692
[47] N.C. Nguyen, J. Peraire, B. Cockburn, A comparison of HDG methods for Stokes ﬂow, J. Sci. Comput. 45 (1–3) (2010) 215–237.
[48] N.C. Nguyen, J. Peraire, B. Cockburn, Implicit high-order hybridizable discontinuous Galerkin methods for acoustics and elastodynamics, J. Comput.
Phys. 230 (2011) 3695–3718.
[49] N.C. Nguyen, J. Peraire, B. Cockburn, An implicit high-order hybridizable discontinuous Galerkin method for the incompressible Navier–Stokes equations,
J. Comput. Phys. 230 (2011) 1147–1170.
[50] N.C. Nguyen, J. Peraire, B. Cockburn, Hybridizable discontinuous Galerkin methods, in: J.S. Hesthaven, E.M. Ronquist (Eds.), Spectral and High Order
Methods for Partial Differential Equations, in: Lect. Notes Comput. Sci. Eng., vol. 76, 2011, pp. 63–84.
[51] N.C. Nguyen, J. Peraire, B. Cockburn, An implicit high-order hybridizable discontinuous Galerkin method for linear convection–diffusion equations,
J. Comput. Phys. 228 (2009) 3232–3254.
[52] N.C. Nguyen, J. Peraire, B. Cockburn, An implicit high-order hybridizable discontinuous Galerkin method for nonlinear convection–diffusion equations,
J. Comput. Phys. 228 (2009) 8841–8855.
[53] N.C. Nguyen, J. Peraire, B. Cockburn, A hybridizable discontinuous Galerkin method for Stokes ﬂow, Comput. Methods Appl. Mech. Eng. 199 (2010)
582–597.
[54] N.C. Nguyen, J. Peraire, B. Cockburn, A hybridizable discontinuous Galerkin method for the incompressible Navier–Stokes equations (AIAA Paper
2010-362), in: Proceedings of the 48th AIAA Aerospace Sciences Meeting and Exhibit, Orlando, FL, January 2010.
[55] J. Peraire, N.C. Nguyen, B. Cockburn, An embedded discontinuous Galerkin method for the compressible Euler and Navier–Stokes equations (AIAA Paper
2011-3228), in: Proceedings of the 20th AIAA Computational Fluid Dynamics Conference, Honolulu, HI, 2011.
[56] J. Peraire, N.C. Nguyen, B. Cockburn, A hybridizable discontinuous Galerkin method for the compressible Euler and Navier–Stokes equations (AIAA Paper
2010-363), in: Proceedings of the 48th AIAA Aerospace Sciences Meeting and Exhibit, Orlando, FL, January 2010.
[57] J. Peraire, P.O. Persson, The compact discontinuous Galerkin (CDG) method for elliptic problems, SIAM J. Sci. Comput. 30 (4) (2008) 1806–1824.
[58] P. O.  Persson, J. Peraire, Newton-GMRES preconditioning for discontinuous Galerkin discretizations of the Navier–Stokes equations, SIAM J. Sci. Comput.
30 (6) (2008) 2709–2733.
[59] P. -O.  Persson, J. Bonet, J. Peraire, Discontinuous Galerkin solution of the Navier–Stokes equations on deformable domains, Comput. Methods Appl. Mech.
Eng. 198 (2009) 1585–1595.
[60] P. A.  Raviart, J.M. Thomas, A mixed ﬁnite element method for second order elliptic problems, in: I. Galligani, E. Magenes (Eds.), Mathematical Aspects
of Finite Element Method, in: Lect. Notes Math., vol. 606, Springer-Verlag, New York, 1977, pp. 292–315.
[61] W. H.  Reed, T.R. Hill, Triangular mesh methods for the neutron transport equation, Technical Report LA-UR-73-479, Los Alamos Scientiﬁc Laboratory,
1973.
[62] X. Roca, J. Peraire, N.C. Nguyen, Scalable parallelization of the hybridized discontinuous Galerkin method for compressible ﬂow (AIAA Paper
2013–2939), in: Proceedings of the 21th AIAA Computational Fluid Dynamics Conference, San Diego, CA, June 2013.
[63] P. L.  Roe, Approximate Riemann solvers, parameter vectors, and difference schemes, J. Comput. Phys. 43 (1981) 357–372.
[64] K. Shahbazi, P.F. Fischer, C.R. Ethier, A high-order discontinuous Galerkin method for the unsteady incompressible Navier–Stokes equations, J. Comput.
Phys. 222 (2007) 391–407.
[65] M.P .  Ueckermann, P.F.J. Lermusiaux, High order schemes for 2D unsteady biogeochemical ocean models, Ocean Dyn. 60 (2010) 1415–1445.
[66] Z.J. Wang, K. Fidkowski, R. Abgrall, F. Bassi, D. Caraeni, A. Cary, H. Deconinck, R. Hartmann, K. Hillewaert, H.T. Huynh, N. Kroll, G. May, P.-O. Persson,
B. van Leer, M. Visbal, High-order CFD methods: current status and perspective, Int. J. Numer. Methods Fluids 72 (2013) 811–845.
