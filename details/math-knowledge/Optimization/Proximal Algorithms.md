# Foundations and Trends R⃝ in Optimization Vol. 1, No. 3 (2013) 123–231

Converted from: `Optimization\Proximal Algorithms.pdf`


## Page 1

Foundations and Trends R⃝ in Optimization
Vol. 1, No. 3 (2013) 123–231
c⃝ 2013 N. Parikh and S. Boyd
DOI: xxx
Proximal Algorithms
Neal Parikh
Department of Computer Science
Stanford University
npparikh@cs.stanford.edu
Stephen Boyd
Department of Electrical Engineering
Stanford University
boyd@stanford.edu


## Page 2

Contents
1 Introduction 123
1.1 Deﬁnition . . . . . . . . . . . . . . . . . . . . . . . . . . 124
1.2 Interpretations . . . . . . . . . . . . . . . . . . . . . . . . 124
1.3 Proximal algorithms . . . . . . . . . . . . . . . . . . . . . 126
1.4 What this paper is about . . . . . . . . . . . . . . . . . . 127
1.5 Related work . . . . . . . . . . . . . . . . . . . . . . . . . 128
1.6 Outline . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
2 Properties 129
2.1 Separable sum . . . . . . . . . . . . . . . . . . . . . . . . 129
2.2 Basic operations . . . . . . . . . . . . . . . . . . . . . . . 130
2.3 Fixed points . . . . . . . . . . . . . . . . . . . . . . . . . 130
2.4 Proximal average . . . . . . . . . . . . . . . . . . . . . . 133
2.5 Moreau decomposition . . . . . . . . . . . . . . . . . . . 133
3 Interpretations 135
3.1 Moreau-Yosida regularization . . . . . . . . . . . . . . . . 135
3.2 Resolvent of subdiﬀerential operator . . . . . . . . . . . . 137
3.3 Modiﬁed gradient step . . . . . . . . . . . . . . . . . . . 138
3.4 Trust region problem . . . . . . . . . . . . . . . . . . . . 139
3.5 Notes and references . . . . . . . . . . . . . . . . . . . . 140
ii


## Page 3

iii
4 Proximal Algorithms 142
4.1 Proximal minimization . . . . . . . . . . . . . . . . . . . . 142
4.2 Proximal gradient method . . . . . . . . . . . . . . . . . . 148
4.3 Accelerated proximal gradient method . . . . . . . . . . . 152
4.4 Alternating direction method of multipliers . . . . . . . . . 153
4.5 Notes and references . . . . . . . . . . . . . . . . . . . . 159
5 Parallel and Distributed Algorithms 161
5.1 Problem structure . . . . . . . . . . . . . . . . . . . . . . 161
5.2 Consensus . . . . . . . . . . . . . . . . . . . . . . . . . . 163
5.3 Exchange . . . . . . . . . . . . . . . . . . . . . . . . . . . 167
5.4 Allocation . . . . . . . . . . . . . . . . . . . . . . . . . . 170
5.5 Notes and references . . . . . . . . . . . . . . . . . . . . 171
6 Evaluating Proximal Operators 172
6.1 Generic methods . . . . . . . . . . . . . . . . . . . . . . . 173
6.2 Polyhedra . . . . . . . . . . . . . . . . . . . . . . . . . . 179
6.3 Cones . . . . . . . . . . . . . . . . . . . . . . . . . . . . 183
6.4 Pointwise maximum and supremum . . . . . . . . . . . . . 185
6.5 Norms and norm balls . . . . . . . . . . . . . . . . . . . . 187
6.6 Sublevel set and epigraph . . . . . . . . . . . . . . . . . . 190
6.7 Matrix functions . . . . . . . . . . . . . . . . . . . . . . . 191
6.8 Notes and references . . . . . . . . . . . . . . . . . . . . 194
7 Examples and Applications 196
7.1 Lasso . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 196
7.2 Matrix decomposition . . . . . . . . . . . . . . . . . . . . 200
7.3 Multi-period portfolio optimization . . . . . . . . . . . . . 204
7.4 Stochastic optimization . . . . . . . . . . . . . . . . . . . 209
7.5 Robust and risk-averse optimization . . . . . . . . . . . . 210
7.6 Stochastic control . . . . . . . . . . . . . . . . . . . . . . 211
8 Conclusions 216


## Page 4

Abstract
This monograph is about a class of optimization algorithms c alled prox-
imal algorithms. Much like Newton’s method is a standard tool for solv-
ing unconstrained smooth optimization problems of modest s ize, proxi-
mal algorithms can be viewed as an analogous tool for nonsmoo th, con-
strained, large-scale, or distributed versions of these pro blems. They are
very generally applicable, but are especially well-suited t o problems of
substantial recent interest involving large or high-dimens ional datasets.
Proximal methods sit at a higher level of abstraction than cl assical al-
gorithms like Newton’s method: the base operation is evalua ting the
proximal operator of a function, which itself involves solving a small
convex optimization problem. These subproblems, which gen eralize the
problem of projecting a point onto a convex set, often admit c losed-
form solutions or can be solved very quickly with standard or simple
specialized methods. Here, we discuss the many diﬀerent int erpreta-
tions of proximal operators and algorithms, describe their connections
to many other topics in optimization and applied mathematic s, survey
some popular algorithms, and provide a large number of examp les of
proximal operators that commonly arise in practice.


## Page 5

1
Introduction
This monograph is about a class of algorithms, called proximal algo-
rithms, for solving convex optimization problems. Much like Newto n’s
method is a standard tool for solving unconstrained smooth m inimiza-
tion problems of modest size, proximal algorithms can be vie wed as an
analogous tool for nonsmooth, constrained, large-scale, or distributed
versions of these problems. They are very generally applica ble, but
they turn out to be especially well-suited to problems of rece nt and
widespread interest involving large or high-dimensional da tasets.
Proximal methods sit at a higher level of abstraction than cl assical
optimization algorithms like Newton’s method. In the latte r, the base
operations are low-level, consisting of linear algebra oper ations and the
computation of gradients and Hessians. In proximal algorit hms, the
base operation is evaluating the proximal operator of a function, which
involves solving a small convex optimization problem. Thes e subprob-
lems can be solved with standard methods, but they often admi t closed-
form solutions or can be solved very quickly with simple spec ialized
methods. We will also see that proximal operators and proxim al algo-
rithms have a number of interesting interpretations and are connected
to many diﬀerent topics in optimization and applied mathema tics.
123


## Page 6

124 Introduction
1.1 Deﬁnition
Let f : Rn → R ∪ { +∞} be a closed proper convex function, which
means that its epigraph
epif = { (x,t ) ∈ Rn × R |f (x) ≤ t}
is a nonempty closed convex set. The eﬀective domain of f is
domf = {x ∈ Rn |f (x)< +∞} ,
i.e., the set of points for which f takes on ﬁnite values.
The proximal operator proxf : Rn → Rn of f is deﬁned by
proxf (v) = argmin
x
(
f (x) + (1/ 2)∥x − v∥2
2
)
, (1.1)
where ∥ · ∥ 2 is the usual Euclidean norm. The function minimized on
the righthand side is strongly convex and not everywhere inﬁ nite, so it
has a unique minimizer for every v ∈ Rn (even when domf ⊊ Rn).
We will often encounter the proximal operator of the scaled f unction
λf , where λ> 0, which can be expressed as
proxλf (v) = argmin
x
(
f (x) + (1/ 2λ )∥x − v∥2
2
)
. (1.2)
This is also called the proximal operator of f with parameter λ . (To
keep notation light, we write (1 / 2λ ) rather than (1 / (2λ )).)
Throughout this monograph, when we refer to the proximal ope r-
ator of a function, the function will be assumed to be closed p roper
convex, and it may take on the extended value + ∞ .
1.2 Interpretations
Figure 1.1 depicts what a proximal operator does. The thin bl ack lines
are level curves of a convex function f ; the thicker black line indicates
the boundary of its domain. Evaluating proxf at the blue points moves
them to the corresponding red points. The three points in the domain
of the function stay in the domain and move towards the minimu m of
the function, while the other two move to the boundary of the d omain
and towards the minimum of the function. The parameter λ controls


## Page 7

1.2. Interpretations 125
Figure 1.1: Evaluating a proximal operator at various points.
the extent to which the proximal operator maps points toward s the
minimum of f , with larger values of λ associated with mapped points
near the minimum, and smaller values giving a smaller moveme nt to-
wards the minimum. It may be useful to keep this ﬁgure in mind w hen
reading about the subsequent interpretations.
We now brieﬂy describe some basic interpretations of (1.1) t hat we
will revisit in more detail later. The deﬁnition indicates t hat proxf (v)
is a point that compromises between minimizing f and being near to
v. For this reason, proxf (v) is sometimes called a proximal point of v
with respect to f . In proxλf , the parameter λ can be interpreted as a
relative weight or trade-oﬀ parameter between these terms.
When f is the indicator function
IC(x) =



0 x ∈ C
+∞ x ̸∈ C ,


## Page 8

126 Introduction
where C is a closed nonempty convex set, the proximal operator of f
reduces to Euclidean projection onto C, which we denote
ΠC(v) = argmin
x∈C
∥x − v∥2. (1.3)
Proximal operators can thus be viewed as generalized projec tions, and
this perspective suggests various properties that we expec t proximal
operators to obey.
The proximal operator of f can also be interpreted as a kind of
gradient step for the function f . In particular, we have (under some
assumptions described later) that
proxλf (v) ≈ v − λ ∇ f (v)
whenλ is small and f is diﬀerentiable. This suggests a close connection
between proximal operators and gradient methods, and also h ints that
the proximal operator may be useful in optimization. It also suggests
that λ will play a role similar to a step size in a gradient method.
Finally, the ﬁxed points of the proximal operator of f are pre-
cisely the minimizers of f (we will show this in §2.3). In other words,
proxλf (x⋆ ) = x⋆ if and only if x⋆ minimizes f . This implies a close
connection between proximal operators and ﬁxed point theor y, and
suggests that proximal algorithms can be interpreted as sol ving opti-
mization problems by ﬁnding ﬁxed points of appropriate oper ators.
1.3 Proximal algorithms
A proximal algorithm is an algorithm for solving a convex optimization
problem that uses the proximal operators of the objective te rms. For
example, the proximal minimization algorithm , discussed in more detail
in §4.1, minimizes a convex function f by repeatedly applying proxf
to some initial point x0. The interpretations of proxf above suggest
several potential perspectives on this algorithm, such as a n approximate
gradient method or a ﬁxed point iteration. In Chapters 4 and 5 we will
encounter less trivial and far more useful proximal algorit hms.
Proximal algorithms are most useful when all the relevant pr oximal
operators can be evaluated suﬃciently quickly. In Chapter 6 , we discuss
how to evaluate proximal operators and provide many example s.


## Page 9

1.4. What this paper is about 127
There are many reasons to study proximal algorithms. First, they
work under extremely general conditions, including cases w here the
functions are nonsmooth and extended real-valued (so they co ntain im-
plicit constraints). Second, they can be fast, since there c an be simple
proximal operators for functions that are otherwise challe nging to han-
dle in an optimization problem. Third, they are amenable to d istributed
optimization, so they can be used to solve very large scale pr oblems.
Finally, they are often conceptually and mathematically si mple, so they
are easy to understand, derive, and implement for a particul ar problem.
Indeed, many proximal algorithms can be interpreted as gene ralizations
of other well-known and widely used algorithms, like the proj ected gra-
dient method, so they are a natural addition to the basic opti mization
toolbox for anyone who uses convex optimization.
1.4 What this paper is about
We aim to provide a readable reference on proximal operators and prox-
imal algorithms for a wide audience. There are several novel aspects.
First, we discuss a large number of diﬀerent perspectives on prox-
imal operators, some of which have not previously appeared i n the
literature, and many of which have not been collected in one p lace.
These include interpretations based on projection operato rs, smooth-
ing and regularization, resolvent operators, and diﬀerent ial equations.
Second, we place strong emphasis on practical use, so we prov ide many
examples of proximal operators that are eﬃcient to evaluate . Third, we
have a more detailed discussion of distributed optimizatio n algorithms
than most previous references on proximal operators.
To keep the treatment accessible, we have omitted a few more a d-
vanced topics, such as the connection to monotone operator t heory.
We also include source code for all examples, as well as a libr ary of
implementations of proximal operators, at
http://www.stanford.edu/~boyd/papers/prox_algs.html
We provide links to other libraries of proximal operators, s uch as those
by Becker et al. and Vaiter, in the documentation for our own l ibrary.


## Page 10

128 Introduction
1.5 Related work
We emphasize that proximal operators are not new and that the re
have been other surveys written on various aspects of this to pic over
the years. Lemaire [121] surveys the literature on the proxi mal point
algorithm up to 1989. Iusem [108] reviews the proximal point method
and its connection to augmented Lagrangians. An excellent r ecent ref-
erence by Combettes and Pesquet [61] discusses proximal ope rators and
proximal algorithms in the context of signal processing pro blems. The
lecture notes for Vandenberghe’s EE 236C course [194] cover s proximal
algorithms in detail. Finally, the recent monograph by Boyd et al. [32] is
about a particular algorithm (ADMM), but also discusses con nections
to proximal operators. We will discuss more of the history of proximal
operators in the sequel.
1.6 Outline
In Chapter 2, we give some basic properties of proximal opera tors.
In Chapter 3, we discuss a variety of interpretations of prox imal op-
erators. Chapter 4 covers some core proximal algorithms for solving
convex optimization problems. In Chapter 5, we discuss how t o use
these algorithms to solve problems in a parallel or distribu ted fashion.
Chapter 6 presents a large number of examples of diﬀerent pro jection
and proximal operators that can be evaluated eﬃciently. In C hapter 7,
we illustrate these ideas with some examples and applicatio ns.


## Page 11

2
Properties
We begin by discussing the main properties of proximal opera tors.
These are used to, for example, establish convergence of a pr oximal
algorithm or to derive a method for evaluating the proximal o pera-
tor of a given function. All of these properties are well-know n in the
literature; see, e.g., [61, 193, 10].
2.1 Separable sum
If f is separable across two variables, so f (x,y ) = ϕ (x) +ψ (y), then
proxf (v,w ) = ( proxϕ (v), proxψ (w)). (2.1)
Thus, evaluating the proximal operator of a separable funct ion reduces
to evaluating the proximal operators for each of the separab le parts,
which can be done independently.
If f is fully separable, meaning that f (x) = ∑n
i=1fi(xi), then
(proxf (v))i = proxfi(vi).
In other words, this case reduces to evaluating proximal ope rators of
scalar functions. We will see in Chapter 5 that the separable s um prop-
erty is the key to deriving parallel versions of proximal alg orithms.
129


## Page 12

130 Properties
2.2 Basic operations
This section can be referred to as needed; these properties w ill not play
a central role in the rest of the paper.
Postcomposition. If f (x) = αϕ (x) +b, with α> 0, then
proxλf (v) = proxαλϕ (v).
Precomposition. If f (x) = ϕ (αx +b), with α ̸= 0, then
proxλf (v) = 1
α
(
proxα 2λϕ (αv +b) − b
)
. (2.2)
If f (x) = ϕ (Qx), where Q is orthogonal (QQT =QTQ =I), then
proxλf (v) = QT proxλϕ (Qv).
There are other specialized results about evaluating proxf via proxϕ ,
where f (x) = ϕ (Ax) for some matrix A. Several of these are useful in
image and signal processing; see, e.g., [60, 165, 166, 21].
Aﬃne addition. If f (x) = ϕ (x) +aTx +b, then
proxλf (v) = proxλϕ (v − λa ).
Regularization. If f (x) = ϕ (x) + (ρ/ 2)∥x − a∥2
2, then
proxλf (v) = prox˜λϕ
(
(˜λ/λ )v + (ρ ˜λ )a
)
,
where ˜λ =λ/ (1 +λρ ).
2.3 Fixed points
The point x⋆ minimizes f if and only if
x⋆ = proxf (x⋆ ),
i.e., if x⋆ is a ﬁxed point of proxf . (We can consider λ = 1 without loss
of generality, since x⋆ minimizesf if and only if it minimizes λf .) This
fundamental property gives a link between proximal operato rs and ﬁxed
point theory; e.g., many proximal algorithms for optimization can be
interpreted as methods for ﬁnding ﬁxed points of appropriat e operators.
This viewpoint is often useful in the analysis of these metho ds.


## Page 13

2.3. Fixed points 131
Proof. We can show directly that ifx⋆ minimizesf , then proxf (x⋆ ) =
x⋆ . We assume for convenience thatf is subdiﬀerentiable on its domain,
though the result is true in general.
If x⋆ minimizes f , i.e., f (x) ≥ f (x⋆ ) for any x, then
f (x) + (1/ 2)∥x − x⋆ ∥2
2 ≥ f (x⋆ ) = f (x⋆ ) + (1/ 2)∥x⋆ − x⋆ ∥2
2
for anyx, so x⋆ minimizes the function f (x)+ (1/ 2)∥x− x⋆ ∥2
2. It follows
that x⋆ = proxf (x⋆ ).
To show the converse, we use the subdiﬀerential characteriz ation of
the minimum of a convex function [169]. The point ˜ x minimizes
f (x) + (1/ 2)∥x − v∥2
2
(so ˜x = proxf (v)) if and only if
0 ∈ ∂f (˜x) + (˜x − v),
where the sum is of a set and a point. Here, ∂f (x) ⊂ Rn is the subdif-
ferential of f at x, deﬁned by
∂f (x) = {y |f (z) ≥ f (x) +yT (z − x) for all z ∈ domf }. (2.3)
Taking ˜x =v =x⋆ , it follows that 0 ∈ ∂f (x⋆ ), so x⋆ minimizes f . □
Fixed point algorithms. Since minimizers of f are ﬁxed points of
proxf , we can minimize f by ﬁnding a ﬁxed point of its proximal
operator. If proxf were a contraction, i.e., Lipschitz continuous with
constant less than 1, repeatedly applying proxf would ﬁnd a (here,
unique) ﬁxed point. It turns out that while proxf need not be a con-
traction (unless f is strongly convex), it does have a diﬀerent property,
ﬁrm nonexpansiveness , suﬃcient for ﬁxed point iteration:
∥proxf (x) − proxf (y)∥2
2 ≤ (x − y)T (proxf (x) − proxf (y))
for all x, y ∈ Rn.
Firmly nonexpansive operators are special cases of nonexpansive
operators (those that are Lipschitz continuous with constant 1). Iter -
ation of a general nonexpansive operator need not converge t o a ﬁxed
point: consider operators like − I or rotations. However, it turns out


## Page 14

132 Properties
that if N is nonexpansive, then the operator T = (1 − α )I +αN , where
α ∈ (0, 1), has the same ﬁxed points as N and simple iteration of T
will converge to a ﬁxed point of T (and thus of N ), i.e., the sequence
xk+1 := (1 − α )xk +αN (xk)
will converge to a ﬁxed point of N . Put diﬀerently, damped iteration of
a nonexpansive operator will converge to one of its ﬁxed poin ts.
Operators in the form (1 − α )I +αN , where N is nonexpansive
and α ∈ (0, 1), are called α -averaged operators. Firmly nonexpansive
operators are averaged: indeed, they are precisely the (1 / 2)-averaged
operators. In summary, both contractions and ﬁrm nonexpans ions are
subsets of the class of averaged operators, which in turn are a subset
of all nonexpansive operators.
A veraged operators are useful because they satisfy some pro perties
that are desirable in devising ﬁxed point methods, and becau se they are
a common parent of contractions and ﬁrm nonexpansions. For e xam-
ple, the class of averaged operators is closed under composi tion, unlike
that of ﬁrm nonexpansions, i.e., the composition of ﬁrmly nonexpan-
sive operators need not be ﬁrmly nonexpansive but is always a veraged.
In addition, as mentioned above, simple iteration of an aver aged oper-
ator will converge to a ﬁxed point if one exists, a result know n as the
Krasnoselskii-Mann theorem. Explicitly, suppose T is averaged and has
a ﬁxed point. Deﬁne the iteration
xk+1 :=T (xk)
with arbitrary x0. Then ∥T (xk) − xk∥ → 0 as k → ∞ andxk converges
to a ﬁxed point of T [10, §5.2]; also see, e.g., [133, 40, 15, 97, 59].
This immediately suggests the simplest proximal method,
xk+1 := proxλf (xk),
which is called proximal minimization or the proximal point algorithm .
We discuss it in detail in §4.1; for example, it converges und er the
mildest possible assumption, which is simply that a minimiz er exists.


## Page 15

2.4. Proximal average 133
2.4 Proximal average
Let f1, . . . , fm be closed proper convex functions. Then we have that
1
m
m∑
i=1
proxfi = proxg,
where g is a function called the proximal average of f1, . . . , fm. In
other words, the average of the proximal operators of a set of functions
is itself the proximal operator of some function, and this fu nction is
called the proximal average. This operator is fundamental a nd often
appears in parallel proximal algorithms, which we discuss i n Chapter 5.
For example, such algorithms typically involve a step that e valuates the
proximal operator of a number of functions independently in parallel
and then averages the results.
The proximal average has a number of interesting properties . For
example, the minimizers of g are the minimizers of the sum of the
Moreau envelopes (see §3.1) of the fi. See [12] for more discussion.
2.5 Moreau decomposition
The following relation always holds:
v = proxf (v) + proxf ∗ (v), (2.4)
where
f ∗ (y) = sup
x
(
yTx − f (x)
)
is the convex conjugate off . This property, known as Moreau decompo-
sition, is the main relationship between proximal operators and du ality.
The Moreau decomposition can be viewed as a generalization o f
orthogonal decomposition induced by a subspace. If L is a subspace,
then its orthogonal complement is
L⊥ = {y |yTx = 0 for all x ∈ L},
and we have that, for any v,
v = ΠL(v) + ΠL⊥ (v).
This follows from Moreau decomposition since ( IL)∗ =IL⊥ .


## Page 16

134 Properties
Similarly, whenf is the indicator function of the closed convex cone
K, we have that
v = ΠK(v) + ΠK◦ (v),
where
K◦ = {y |yTx ≤ 0 for all x ∈ K}
is the polar cone of K, which is the negative of the dual cone
K∗ = {y |yTx ≥ 0 for all x ∈ K}.
Moreau decomposition gives a simple way to obtain the proxim al
operator of a function f in terms of the proximal operator of f ∗ . For
example, if f = ∥ · ∥ is a general norm, then f ∗ =IB, where
B = {x | ∥x∥∗ ≤ 1}
is the unit ball for the dual norm ∥ · ∥∗ , deﬁned by
∥z∥∗ = sup{zTx | ∥x∥ ≤ 1}.
By Moreau decomposition, this implies that
v = proxf (v) + ΠB(v).
In other words, we can easily evaluate proxf if we know how to project
onto B (and vice versa). This example is discussed in detail in §6.5 .


## Page 17

3
Interpretations
Here we collect a variety of interpretations of proximal ope rators and
discuss them in detail. They are useful for developing intui tion about
proximal operators and for giving interpretations of proxi mal algo-
rithms. For example, we have seen that proximal operators ca n be
viewed as a generalization of projections, and we will see th at some
proximal algorithms are generalizations of projection alg orithms.
3.1 Moreau-Yosida regularization
The inﬁmal convolution of closed proper convex functions f and g on
Rn, denoted f □g, is deﬁned as
(f □g)(v) = infx (f (x) +g(v − x)),
with dom(f □g) = domf + domg.
The main example relevant here is the following. Given λ> 0, the
Moreau envelope or Moreau-Yosida regularizationMλf of the function
λf is deﬁned as Mλf =λf □(1/ 2)∥ · ∥2
2, i.e.,
Mλf (v) = infx
(
f (x) + (1/ 2λ )∥x − v∥2
2
)
. (3.1)
This is also referred to as the Moreau envelope of f with parameter λ .
135


## Page 18

136 Interpretations
The Moreau envelope Mf is essentially a smoothed or regularized
form of f : It has domain Rn, even when f does not, and it is continu-
ously diﬀerentiable, even when f is not. In addition, the sets of mini-
mizers of f and Mf are the same. The problems of minimizing f and
Mf are thus equivalent, and the latter is always a smooth optimi zation
problem (with the caveat that Mf may be diﬃcult to evaluate). Indeed,
some algorithms for minimizing f are better interpreted as algorithms
for minimizing Mf , as we will see.
To see why Mf is a smoothed form of f , consider that
(f □g)∗ =f ∗ +g∗,
i.e., that inﬁmal convolution is dual to addition [169, §16]. Bec ause
M ∗∗
f =Mf and (1/ 2)∥ · ∥2
2 is self-dual, it follows that
Mf = (f ∗ + (1/ 2)∥ · ∥2
2)∗.
In general, the conjugate ϕ ∗ of a closed proper convex function ϕ is
smooth when ϕ is strongly convex. This suggests that the Moreau en-
velope Mf can be interpreted as obtaining a smooth approximation
to a function by taking its conjugate, adding regularizatio n, and then
taking the conjugate again. With no regularization, this wo uld simply
give the original function; with the quadratic regularizat ion, it gives
a smooth approximation. For example, applying this techniq ue to |x|
gives the Huber function
ϕ huber(x) =



x2 |x| ≤ 1
2|x| − 1 |x|> 1.
This perspective is very related to recent work by Nesterov [ 150]; for
more on this connection, see [19].
The proximal operator and Moreau envelope of f share many rela-
tionships. For example, proxf returns the (unique) point that actually
achieves the inﬁmum that deﬁnes Mf , i.e.,
Mf (x) = f (proxf (x)) + (1/ 2)∥x − proxf (x)∥2
2.
In addition, the gradient of the Moreau envelope is given by
∇ Mλf (x) = (1/λ )(x − proxλf (x)). (3.2)


## Page 19

3.2. Resolvent of subdiﬀerential operator 137
We can rewrite this as
proxλf (x) = x − λ ∇ Mλf (x), (3.3)
which shows that proxλf can be viewed as a gradient step, with step
size λ , for minimizing Mλf (which has the same minimizers as f ).
Combining this with the Moreau decomposition (2.4) gives a f ormula
relating the proximal operator, Moreau envelope, and the co njugate:
proxf (x) = ∇ Mf ∗ (x).
It is possible to consider inﬁmal convolution and the Moreau enve-
lope for nonconvex functions, in which case some, but not all , of the
properties given above hold; see, e.g., [161]. We limit the discussion
here to the case when the functions are convex.
3.2 Resolvent of subdiﬀerential operator
We can view the subdiﬀerential operator ∂f , deﬁned in (2.3), of a
closed proper convex function f as a point-to-set mapping or a relation
on Rn, i.e.,∂f takes each point x ∈ domf to the set ∂f (x). Any point
y ∈ ∂f (x) is called a subgradient of f at x. When f is diﬀerentiable,
we have ∂f (x) = {∇ f (x)} for all x; we refer to the (point-to-point)
mapping ∇ f from x ∈ domf to ∇ f (x) as the gradient mapping .
The proximal operator proxλf and the subdiﬀerential operator ∂f
are related as follows:
proxλf = (I +λ∂f )− 1. (3.4)
The (point-to-point) mapping ( I +λ∂f )− 1 is called the resolvent of
the operator ∂f with parameter λ> 0, so the proximal operator is the
resolvent of the subdiﬀerential operator.
The resolvent formula (3.4) must be interpreted carefully. All the
operators on the righthand side (scalar multiplication, su m, and in-
verse) are operations on relations, so ( I +λ∂f )− 1 is a relation. It turns
out, however, that this relation has domain Rn, is single-valued, and
so is a function, even though ∂f is not.


## Page 20

138 Interpretations
Proof of (3.4). As before, we assume for convenience that f is sub-
diﬀerentiable on its domain. By deﬁnition, if z ∈ (I +λ∂f )− 1(x), then
x ∈ (I +λ∂f )(z) = z +λ∂f (z).
This can be expressed as
0 ∈ ∂f (z) + (1/λ )(z − x),
which can in turn be rewritten as
0 ∈ ∂z
(
f (z) + (1/ 2λ )∥z − x∥2
2
)
,
where the subdiﬀerential is with respect to z.
As in §2.3, this is the necessary and suﬃcient condition for z to
minimize the strongly convex function within the parenthes es above:
z = argmin
u
(
f (u) + (1/ 2λ )∥u − x∥2
2
)
.
This shows that z ∈ (I +λ∂f )− 1(x) if and only if z = proxλf (x) and,
in particular, that ( I +λ∂f )− 1 is single-valued. □
3.3 Modiﬁed gradient step
There are several ways of interpreting the proximal operato r as a gra-
dient step for minimizing f or a function related to f . For instance, we
have already seen in (3.3) that
proxλf (x) = x − λ ∇ Mλf (x),
i.e., proxλf is a gradient step for minimizing the Moreau envelope of
f with step size λ . Here we discuss other similar interpretations.
Iff is twice diﬀerentiable at x, with ∇ 2f (x) ≻ 0 ( i.e., with ∇ 2f (x)
positive deﬁnite), then, as λ → 0,
proxλf (x) = (I +λ ∇ f )− 1(x) = x − λ ∇ f (x) +o(λ ).
In other words, for small λ , proxλf (x) converges to a gradient step in
f with step length λ . So the proximal operator can be interpreted (for
small λ ) as an approximation of a gradient step for minimizing f .


## Page 21

3.4. Trust region problem 139
We now consider proximal operators of approximations to f and
examine their relation to gradient (or other) steps for mini mizingf . If
f is diﬀerentiable, its ﬁrst-order approximation near v is
ˆf (1)
v (x) = f (v) + ∇ f (v)T (x − v),
and if it is twice diﬀerentiable, its second-order approxima tion is
ˆf (2)
v (x) = f (v) + ∇ f (v)T (x − v) + (1/ 2)(x − v)T ∇ 2f (v)(x − v).
The proximal operator of the ﬁrst-order approximation is
prox ˆf (1)
v
(v) = v − λ ∇ f (v),
which is a standard gradient step with step length λ . The proximal
operator of the second-order approximation is
prox ˆf (2)
v
(v) = v − (∇ 2f (v) + (1/λ )I)− 1∇ f (v).
The step on the righthand side is very familiar: it is a Tikhon ov-
regularized Newton update, also known as a Levenberg-Marquardt up-
date [124, 134] or a modiﬁed Hessian Newton update [153]. Thus, gra-
dient and Levenberg-Marquardt steps can be viewed as proxima l oper-
ators of ﬁrst and second-order approximations of f .
3.4 Trust region problem
A trust region problem has the form
minimize f (x)
subject to ∥x − v∥2 ≤ ρ, (3.5)
with variable x ∈ Rn, where ρ > 0 is the radius of the trust region.
These problems typically arise when f is an approximation to or sur-
rogate for some true objective ϕ that is only accurate near some point
v; for example, f may be a second-order approximation to ϕ atv. The
solution to the problem then gives a search direction in some larger
iterative procedure for minimizing ϕ .
The proximal problem
minimize f (x) + (1/ 2λ )∥x − v∥2
2 (3.6)


## Page 22

140 Interpretations
involves the same two functions of x, f (x) and ∥x − v∥2, but the trust
region constraint on distance from v appears as a (squared) penalty.
Roughly speaking, the two problems have the same solutions f or
appropriate choices of the parameters ρ and λ . More precisely, every
solution of the proximal problem (3.6) is also a solution of th e trust
region problem (3.5) for some choice of ρ . Conversely, every solution of
the trust region problem (3.5) is either an unconstrained mi nimizer of
f or a solution of the proximal problem (3.6) for some choice of λ .
To see this, we examine the optimality conditions for (3.5) a nd (3.6).
For the proximal problem (3.6), the optimality condition is simply
0 ∈ ∂f (xpr) + (1/λ )(xpr − v). (3.7)
For the trust region problem (3.5), assuming there is no mini mizer of
f within the ball {x | ∥x − v∥2 ≤ ρ } , the optimality conditions are
0 ∈ ∂f (xtr) +µ xtr − v
∥xtr − v∥2
, ∥xtr − v∥2 =ρ, (3.8)
for some µ> 0.
We immediately see that a solution of the trust region proble mxtr
satisﬁes (3.7) when λ = ρ/µ . Conversely, a solution of the proximal
problem xpr satisﬁes (3.8) with ρ = ∥xpr − v∥2 and µ =ρ/λ .
3.5 Notes and references
Proximal operators took their current name and form in the 19 60s in
seminal work by Moreau [142, 143]. His initial focus was on in terpreting
proximal operators as generalized projections and on Morea u decom-
position. Moreau also coined the term ‘inﬁmal convolution’ , while the
more recent term ‘epi-addition’ is from the variational anal ysis litera-
ture [175]. The idea of the Moreau envelope (sometimes calle d Moreau-
Yosida regularization) traces back to Moreau and to Yosida’s work in
functional analysis [200]; see [122, 123] for some more rece nt work. The
interpretation of a Moreau envelope as providing a regulari zed form of
f originated with Attouch [3]. There has also been work on gene ralizing
the idea of Moreau envelopes and proximal operators to non-qu adratic
penalties; see, e.g., [11, 49, 19].


## Page 23

3.5. Notes and references 141
The relationship between proximal operators and resolvent s was
perhaps ﬁrst discussed in Rockafellar’s [174] fundamental p aper on the
proximal point algorithm. The key property of the subdiﬀere ntial being
used is that it is a monotone operator, so the resolvent interpretation is
typically used in monotone operator theory. Monotone opera tor theory
originated in functional analysis; see, e.g., the classical work of Brézis
[37], Browder [39, 38, 40, 41], Minty [139, 140], Kachurovsk ii [111, 112],
and Rockafellar [171, 170], as well as Eckstein’s thesis [78 ] and the re-
cent monograph by Bauschke and Combettes [10]. Rockafellar ’s papers
from the 1970s contain many of the main results on the role of m ono-
tone operators in optimization. This work continues to this day; see
the bibliography in [10] for a thorough list of references.
The interpretation of the gradient method as a proximal meth od
with the ﬁrst-order approximation is well-known; see, e.g., [162]. The
other interpretations in §3.3 appear to be new.


## Page 24

4
Proximal Algorithms
We describe some important algorithms for solving convex op timiza-
tion problems that rely on the use of proximal operators. The se algo-
rithms are very diﬀerent from most methods in that the interf ace to
the objective or constraint terms is via proximal operators , not their
subgradients or derivatives.
There is a wide literature on applying various proximal algo rithms
to particular problems or problem domains, such as nuclear n orm prob-
lems [183], max norm problems [119], sparse inverse covariance selection
[178], MAP inference in undirected graphical models [168], loss min-
imization in machine learning [32, 73, 110, 4], optimal cont rol [155],
energy management [116], and signal processing [61].
4.1 Proximal minimization
The proximal minimization algorithm , also called proximal iteration or
the proximal point algorithm , is
xk+1 := proxλf (xk), (4.1)
where f : Rn → R ∪ { +∞} is a closed proper convex function, k is
the iteration counter, and xk denotes the kth iterate of the algorithm.
142


## Page 25

4.1. Proximal minimization 143
If f has a minimum, then xk converges to the set of minimizers of f
andf (xk) converges to its optimal value [10]. A variation on the prox i-
mal minimization algorithm uses parameter values that chan ge in each
iteration; we simply replace the constant value λ with λ k in the iter-
ation. Convergence is guaranteed provided λ k > 0 and ∑∞
k=1λ k = ∞ .
Another variation allows the minimizations required in eva luating the
proximal operator to be carried out with error, provided the errors in
the minimizations satisfy certain conditions (such as bein g summable).
This basic proximal method has not found many applications. Each
iteration requires us to minimize the function f plus a quadratic, so the
proximal algorithm would be useful in a situation where it is hard to
minimize the function f (our goal), but easy (or at least easier) to mini-
mizef plus a quadratic. We will see one important application, ite rative
reﬁnement for solving linear equations, in §4.1.2 (althoug h iterative re-
ﬁnement was not originally derived from proximal minimizat ion). A re-
lated application, mentioned below, is in solving ill-condi tioned smooth
minimization problems using an iterative solver.
4.1.1 Interpretations
The proximal minimization algorithm can be interpreted man y ways.
One simple perspective is that it is the standard gradient me thod
applied to the Moreau envelope Mf rather than f (see (3.3)). An-
other is that it is simple iteration for ﬁnding a ﬁxed point of proxλf ,
which works because proxλf is ﬁrmly nonexpansive (see §2.3). We now
present additional interpretations that require some more discussion.
Disappearing Tikhonov regularization. Another simple interpreta-
tion is as quadratic (Tikhonov) regularization that ‘goes a way’ in the
limit. In each step we solve the regularized problem
minimize f (x) + (1/ 2λ )∥x − xk∥2
2.
The second term can be interpreted as quadratic (Tikhonov) r egulariza-
tion centered at the previous iterate xk; in other words, it is a damping
term that encourages xk+1 not to be very far from xk.


## Page 26

144 Proximal Algorithms
Suppose that f is smooth and that we use an iterative method to
solve this subproblem, such as a gradient or conjugate gradi ent method.
For such methods, this (sub)problem becomes easier as more q uadratic
regularization is added, i.e., the smaller λ is. Here, ‘easier’ can mean
fewer iterations, faster convergence, or higher reliabili ty. (One method
for choosing λ k is to take it small enough to make the subproblem easy
enough to solve in, say, ten iterations of some method.)
As the proximal algorithm converges, xk+1 gets close to xk, so the
eﬀect of the quadratic regularization goes to zero, in the se nse that
the quadratic regularization contributes a term to the grad ient that
decreases to zero as the algorithm proceeds.
In this case, we can think of the proximal minimization metho d as
a principled way to introduce quadratic regularization int o a smooth
minimization problem in order to improve convergence of som e iterative
method in such a way that the ﬁnal result obtained is not aﬀect ed by the
regularization. This is done by shifting the ‘center’ of the regularization
to the previous iterate.
Gradient ﬂow. Proximal minimization can be interpreted as a dis-
cretized method for solving a diﬀerential equation whose eq uilibrium
points are the minimizers of a diﬀerentiable convex functio n f . The
diﬀerential equation
d
dtx(t) = −∇ f (x(t)), (4.2)
with variable x : R+ → Rn, is called the gradient ﬂow for f . (Here
R+ denotes the nonnegative reals {t ∈ R | t ≥ 0} .) The equilibrium
points of the gradient ﬂow are the zeros of ∇ f , which are exactly the
minimizers of f .
We can think of the gradient ﬂow as a continuous-time analog of
the gradient method for minimizing f . The gradient ﬂow solves the
problem of minimizing f in the sense that for every trajectory x of
the gradient ﬂow, we have f (x(t)) → p⋆ , where p⋆ is the minimum
of f . To minimize f , then, we start from any initial vector x(0) and
(numerically) trace its trajectory as t → ∞ .
The idea of the gradient ﬂow can be generalized to cases where f


## Page 27

4.1. Proximal minimization 145
is not diﬀerentiable via the subgradient diﬀerential inclusion
d
dtx(t) ∈ − ∂f (x(t)).
For simplicity, our discussion will stick to the diﬀerentia ble case.
With a small abuse of notation, let xk be the approximation of
x(kh), where h> 0 is a small step size. We compute xk by discretizing
the diﬀerential equation (4.2), i.e., by numerical integration.
The simplest discretization of (4.2) is
xk+1 − xk
h = −∇ f (xk), (4.3)
known as the forward Euler discretization . Here, the derivative of x at
time t = kh is replaced by the divided diﬀerence looking forward in
time over the interval [ kh, (k + 1)h], i.e.,
x((k + 1)h) − x(kh)
(k + 1)h − kh .
To obtain an algorithm, we solve (4.3) for the next iterate xk+1, giving
the iteration
xk+1 :=xk − h∇ f (xk).
This is the standard gradient descent iteration with step si ze h. Thus,
the gradient descent method can be interpreted as the forwar d Euler
method for numerical integration applied to the gradient ﬂo w.
The backward Euler method uses the discretization
xk+1 − xk
h = −∇ f (xk+1),
where we replace the derivative at time t = (k + 1)h by the divided
diﬀerence looking backward over the interval [kh, (k+1)h]. This method
is known to have better approximation properties than forwa rd Euler,
especially for diﬀerential equations that converge, as the gradient ﬂow
does. Its main disadvantage is that it cannot be rewritten as an iteration
that gives xk+1 explicitly in terms of xk. For this reason, it is called an
implicit method , in contrast to explicit methods like forward Euler.
To ﬁnd xk+1, we solve the equation
xk+1 +h∇ f (xk+1) = xk,


## Page 28

146 Proximal Algorithms
which, by (3.4), is equivalent to
xk+1 = proxhf (xk).
Thus, the proximal minimization method is the backward Eule r method
for numerical integration applied to the gradient ﬂow diﬀer ential equa-
tion. The parameter λ in the standard proximal minimization method
corresponds to the time step used in the discretization.
This interpretation suggests that the method should work, g iven
enough assumptions on ∇ f and perhaps assuming that λ is small. In
fact, we know more from the other analyses; in particular, we know that
the proximal method works, exactly, for any positive λ , even when the
function f is not diﬀerentiable or ﬁnite.
In this section, we saw that gradient steps (in optimization ) corre-
spond to forward Euler steps (in solving the gradient ﬂow diﬀ erential
equation) and backward Euler steps correspond to proximal s teps. In
the sequel, we often refer to gradient steps as forward steps and proxi-
mal steps as backward steps.
4.1.2 Iterative reﬁnement
We now discuss a special case of the proximal minimization alg orithm
that is well-known in numerical linear algebra and is based on the idea
of asymptotically disappearing Tikhonov regularization.
Consider the problem of minimizing the quadratic function
f (x) = (1/ 2)xTAx − bTx,
where A ∈ Sn
+ (the set of symmetric positive semideﬁnite n × n ma-
trices). This problem is, of course, equivalent to solving t he system of
linear equations Ax =b, and when A is nonsingular, the unique solu-
tion is x = A− 1b. This problem arises in many applications, ranging
from least squares ﬁtting to the numerical solution of ellip tic PDEs.
The proximal operator for f at xk can be expressed analytically:
proxλf (xk) = argmin
x
(
(1/ 2)xTAx − bTx + (1/ 2λ )∥x − xk∥2
2
)
= ( A + (1/λ )I)− 1(b + (1/λ )xk).


## Page 29

4.1. Proximal minimization 147
The proximal minimization method is then
xk+1 := (A + (1/λ )I)− 1(b + (1/λ )xk),
which can be rewritten as
xk+1 :=xk + (A +ǫI )− 1(b − Axk), (4.4)
where ǫ = 1/λ . We know that this converges to a solution of Ax = b
(provided one exists) as long as λ > 0 (which is the same as ǫ > 0).
The algorithm (4.4) is a standard algorithm, called iterative reﬁnement,
for solving Ax = b using only the regularized inverse ( A +ǫI )− 1 [96,
141, 137]. The second term on the righthand side of (4.4) is ca lled the
correction or reﬁnement to the approximate solution xk.
Iterative reﬁnement is useful in the following situation. S uppose
that A is singular or has very high condition number. In this case, w e
cannot solveAx =b by computing a Cholesky factorization of A, either
because the factorization does not exist or because it canno t be com-
puted stably. However, the Cholesky factorization of the re gularized
matrix A +ǫI always exists (because this matrix is positive deﬁnite)
and can be stably computed (assuming its condition number is not
huge). Iterative reﬁnement is an iterative method for solvi ng Ax = b
using the Cholesky factorization of A +ǫI .
Iterative reﬁnement is usually described as follows. Since A− 1 need
not exist (and if it exists, it may be huge), we prefer to appro ximately
solveAx =b using ˆA− 1 = (A +ǫI )− 1 instead. If ǫ is small, so A ≈ ˆA,
our ﬁrst guess would be x1 = ˆA− 1b, which has residual r1 =b − Ax1.
We then compute a correction term δ 1 so that x2 =x1 +δ 1 is a better
approximation than x1. The perfect correction would be δ 1 = A− 1r1,
which is obtained by solving A(x1 +δ 1) = b forδ 1. Since we cannot use
A− 1, we instead set δ 1 = ˆA− 1r1 and let x2 =x1 +δ 1.
These two steps are repeated for as many iterations as needed ,
which in practice is typically just a few. Since this method i s a special
case of proximal minimization, we can conclude that iterati ve reﬁne-
ment always works (asymptotically), even when ǫ is large.


## Page 30

148 Proximal Algorithms
4.2 Proximal gradient method
Consider the problem
minimize f (x) +g(x), (4.5)
where f : Rn → R and g : Rn → R ∪ { +∞} are closed proper convex
andf is diﬀerentiable. (Since g can be extended-valued, it can be used
to encode constraints on the variable x.) In this form, we split the
objective into two terms, one of which is diﬀerentiable. Thi s splitting
is not unique, so diﬀerent splittings lead to diﬀerent imple mentations
of the proximal gradient method for the same original proble m.
The proximal gradient method is
xk+1 := proxλ kg(xk − λ k∇ f (xk)), (4.6)
where λ k > 0 is a step size.
When ∇ f is Lipschitz continuous with constant L, this method can
be shown to converge with rate O(1/k ) when a ﬁxed step size λ k =λ ∈
(0, 1/L ] is used. (As discussed in [61], the method will actually con verge
for step sizes smaller than 2 /L , not just 1 /L , though for step sizes
larger than 1/L , the method is no longer a ‘majorization-minimization
method’ as discussed in the next section.) If L is not known, the step
sizes λ k can be found by a line search [18, §2.4.3]; that is, their valu es
are chosen in each step.
Many types of line search work, but one simple one due to Beck
and Teboulle [18] is the following.
given xk, λ k− 1, and parameter β ∈ (0, 1).
Let λ := λ k− 1.
repeat
1. Let z := proxλg (xk − λ ∇ f (xk)).
2. break if f (z) ≤ ˆfλ (z, x k).
3. Update λ := βλ .
return λ k := λ , xk+1 := z.
The function ˆfλ is easy to evaluate; its deﬁnition is given in (4.7) and
discussed further below. A typical value for the line search parameter
β is 1/ 2.


## Page 31

4.2. Proximal gradient method 149
Special cases. The proximal gradient method reduces to other well-
known algorithms in various special cases. When g = IC, proxλg is
projection onto C, in which case (4.6) reduces to the projected gradient
method [26]. When f = 0, then it reduces to proximal minimization,
and when g = 0, it reduces to the standard gradient descent method.
4.2.1 Interpretations
The ﬁrst two interpretations given below are due to Beck and
Teboulle [18]; we have repeated their discussion here for co mplete-
ness. In the context of image processing problems, the major ization-
minimization interpretation appeared in some even earlier papers by
Figueiredo et al. [85, 83]. We also mention that in some speci al
cases, additional interpretations are possible; for examp le, applying the
method to the lasso can be interpreted as a kind of EM algorith m [84].
Majorization-minimization. We ﬁrst interpret the proximal gradient
method as an example of a majorization-minimization algorithm , a
large class of algorithms that includes the gradient method , Newton’s
method, and the EM algorithm as special cases; see, e.g., [106].
A majorization-minimization algorithm for minimizing a fun ction
ϕ : Rn → R consists of the iteration
xk+1 := argmin
x
ˆϕ (x,x k),
where ˆϕ (·,x k) is a convex upper bound to ϕ that is tight at xk, i.e.,
ˆϕ (x,x k) ≥ ϕ (x) and ˆϕ (x,x ) = ϕ (x) for all x. The reason for the name
should be clear: such algorithms involve iteratively major izing (upper
bounding) the objective and then minimizing the majorizati on.
For an upper bound of f , consider the function ˆfλ given by
ˆfλ (x,y ) = f (y) + ∇ f (y)T (x − y) + (1/ 2λ )∥x − y∥2
2, (4.7)
withλ> 0. For ﬁxedy, this function is convex, satisﬁes ˆfλ (x,x ) = f (x),
and is an upper bound on f when λ ∈ (0, 1/L ], where L is a Lipschitz
constant of ∇ f . The algorithm
xk+1 := argmin
x
ˆfλ (x,x k)


## Page 32

150 Proximal Algorithms
is thus a majorization-minimization algorithm; in fact, a li ttle algebra
shows that this algorithm is precisely the standard gradien t method for
minimizing f . Intuitively, we replace f with its ﬁrst-order approxima-
tion regularized by a trust region penalty (see §3.4).
It then follows that the function qλ given by
qλ (x,y ) = ˆfλ (x,y ) +g(x) (4.8)
is similarly a surrogate for f +g (with ﬁxed y) when λ ∈ (0, 1/L ]. The
majorization-minimization algorithm
xk+1 := argmin
x
qλ (x,x k)
can be shown to be equivalent to the proximal gradient iterat ion (4.6).
Another way to express the problem of minimizing qλ (x,x k) is as
minimize (1 / 2)∥x − (xk − λ ∇ f (xk))∥2
2 +λg (x).
This formulation shows that the solution xk+1 can be interpreted as
trading oﬀ minimizing g and being close to the standard gradient step
xk − λ ∇ f (xk), with the trade-oﬀ determined by the parameter λ .
Fixed point iteration. The proximal gradient algorithm can also be
interpreted as a ﬁxed point iteration. A point x⋆ is a solution of (4.5),
i.e., minimizes f +g, if and only if
0 ∈ ∇ f (x⋆ ) +∂g (x⋆ ).
For anyλ> 0, this optimality condition holds if and only if the follow-
ing equivalent statements hold:
0 ∈ λ ∇ f (x⋆ ) +λ∂g (x⋆ )
0 ∈ λ ∇ f (x⋆ ) − x⋆ +x⋆ +λ∂g (x⋆ )
(I +λ∂g )(x⋆ ) ∋ (I − λ ∇ f )(x⋆ )
x⋆ = ( I +λ∂g )− 1(I − λ ∇ f )(x⋆ )
x⋆ = proxλg (x⋆ − λ ∇ f (x⋆ )).
The last two expressions hold with equality and not just cont ainment
because the proximal operator is single-valued, as mentione d in §3.2.


## Page 33

4.2. Proximal gradient method 151
The ﬁnal statement says that x⋆ minimizes f +g if and only if it is a
ﬁxed point of the forward-backward operator
(I +λ∂g )− 1(I − λ ∇ f ).
The proximal gradient method repeatedly applies this opera tor to ob-
tain a ﬁxed point and thus a solution to the original problem. The
condition λ ∈ (0, 1/L ], where L is a Lipschitz constant of ∇ f , guaran-
tees that the forward-backward operator is averaged and thus that the
iteration converges to a ﬁxed point (when one exists).
Forward-backward integration of gradient ﬂow. The proximal gra-
dient algorithm can be interpreted using gradient ﬂows. Her e, the gra-
dient ﬂow system (4.2) takes the form
d
dtx(t) = −∇ f (x(t)) − ∇ g(x(t)),
assuming here that g is also diﬀerentiable.
To obtain a discretization of (4.2), we replace the derivati ve on
the lefthand side with the diﬀerence ( xk+1 − xk)/h . We also replace the
valuex(t) on the righthand side with either xk (giving the forward Euler
discretization) or xk+1 (giving the backward Euler discretization). It is
reasonable to use either xk or xk+1 on the righthand side since h is
supposed to be a small step size, so x(kh) and x((k + 1)h) should not
be too diﬀerent. Indeed, it is possible to use both xk and xk+1 on the
righthand side to replace diﬀerent occurrences of x(t). The resulting
discretizations lead to algorithms known as operator splitting methods .
For example, we can consider the discretization
xk+1 − xk
h = −∇ f (xk) − ∇ g(xk+1),
where we replace x(t) in the argument to f with the forward value xk,
and we replace x(t) in the argument to g with the backward valuexk+1.
Rearranging, this gives the update
xk+1 := (I +h∇ g)− 1(I − h∇ f )xk,
This is known as forward-backward splitting and is exactly the proxi-
mal gradient iteration (4.6) when λ =h. In other words, the proximal


## Page 34

152 Proximal Algorithms
gradient method can be interpreted as a method for numerical ly in-
tegrating the gradient ﬂow diﬀerential equation that uses a forward
Euler step for the diﬀerentiable part f and a backward Euler step for
the (possibly) nondiﬀerentiable part g.
4.3 Accelerated proximal gradient method
So-called ‘accelerated’ versions of the basic proximal grad ient algorithm
include an extrapolation step in the algorithm. One simple v ersion is
yk+1 := xk +ω k(xk − xk− 1)
xk+1 := proxλ kg(yk+1 − λ k∇ f (yk+1))
whereω k ∈ [0, 1) is an extrapolation parameter and λ k is the usual step
size. (We let ω 0 = 0, so the value x− 1 appearing in the ﬁrst extra step
doesn’t matter.) These parameters must be chosen in speciﬁc ways to
achieve the convergence acceleration. One simple choice [1 92] takes
ω k = k
k + 3.
It remains to choose the step sizes λ k. When ∇ f is Lipschitz contin-
uous with constant L, this method can be shown to converge in objec-
tive value with rate O(1/k 2) when a ﬁxed step size λ k =λ ∈ (0, 1/L ] is
used. If L is not known, the step sizes λ k can be found by a line search
[18]; that is, their values are chosen in each step.
Many types of line search work, but one simple one due to Beck
and Teboulle [18] is the following.
given yk, λ k− 1, and parameter β ∈ (0, 1).
Let λ := λ k− 1.
repeat
1. Let z := proxλg (yk − λ ∇ f (yk)).
2. break if f (z) ≤ ˆfλ (z, y k).
3. Update λ := βλ .
return λ k := λ , xk+1 := z.


## Page 35

4.4. Alternating direction method of multipliers 153
As before, the function ˆfλ is deﬁned in (4.7). The line search here
is the same as in the standard proximal gradient method, exce pt that
it uses the extrapolated value yk rather than xk.
Following Nesterov, this is called an accelerated or optimal ﬁrst-
order method because it has a worst-case convergence rate tha t is su-
perior to the standard method and that cannot be improved fur ther
[147, 148]. There are several versions of such methods, such as in Nes-
terov [151] and Tseng [188]; the software package TFOCS [22] is based
on and contains several implementations of such methods.
4.4 Alternating direction method of multipliers
Consider the problem
minimize f (x) +g(x)
where f, g : Rn → R ∪ { +∞} are closed proper convex functions.
(In this splitting, both f andg can be nonsmooth.) Then the alternat-
ing direction method of multipliers (ADMM), also known as Douglas-
Rachford splitting, is
xk+1 := proxλf (zk − uk)
zk+1 := proxλg (xk+1 +uk)
uk+1 := uk +xk+1 − zk+1,
where k is an iteration counter. This method converges under more or
less the most general possible conditions; see [32, §3.2] fo r details.
While xk and zk converge to each other, and to optimality, they
have slightly diﬀerent properties. For example, xk ∈ domf while
zk ∈ domg, so if g encodes constraints, the iterates zk satisfy the con-
straints, while the iterates xk satisfy the constraints only in the limit.
Ifg = ∥ · ∥1, then zk will be sparse because proxλg is soft thresholding
(see (6.9)), while xk will only be close to zk (close to sparse).
The advantage of ADMM is that the objective terms (which can
both include constraints, since they can take on inﬁnite val ues) are
handled completely separately, and indeed, the functions a re accessed
only through their proximal operators. ADMM is most useful w hen


## Page 36

154 Proximal Algorithms
the proximal operators of f and g can be eﬃciently evaluated but the
proximal operator for f +g is not easy to evaluate.
Special cases. Wheng is the indicator function of a closed convex set
C, its proximal operator proxλg reduces to projection onto C. In this
case, ADMM is a method for solving the generic convex constra ined
problem of minimizing f over C that only uses the proximal operator
of the objective and projection onto the constraint set. (We can reverse
the roles, with f the indicator function of C, and g a generic convex
function; this gives a slightly diﬀerent algorithm.)
As a further specialization, suppose that f is the indicator function
of a closed convex set C and g is the indicator function of a closed
convex set D. The problem of minimizing f + g is then equivalent
to the convex feasibility problem of ﬁnding a point x ∈ C ∩ D . Both
proximal operators reduce to projections, so the ADMM algor ithm for
this problem becomes
xk+1 := Π C(zk − uk)
zk+1 := Π D(xk+1 +uk)
uk+1 := uk +xk+1 − zk+1.
The parameter λ does not appear in this algorithm because both prox-
imal operators are projections. This algorithm is similar to , but not
the same as, Dykstra’s alternating projections method [77, 8]. (In [32],
we erroneously claimed that the two were equivalent; we than k Heinz
Bauschke for bringing this error to our attention and clarif ying the
point in [13].)
Like the classical method of alternating projections due to von Neu-
mann [196], this method requires one projection onto each se t in each
iteration. However, its convergence is usually much faster in practice.
4.4.1 Interpretations
Integral control of a dynamical system. The ﬁrst two steps in
ADMM can be viewed as a discrete-time dynamical system with st ate
z and input or control u, i.e., zk+1 is a function of xk and uk. The


## Page 37

4.4. Alternating direction method of multipliers 155
goal is to choose u to achieve x = z, so the residual xk+1 − zk+1 can
be viewed as an error signal. The u-update in ADMM shows that uk
is the running sum of the errors, which is the discrete-time an alogue
of the running integral of an error signal. Thus ADMM can be vi ewed
as a classical integral control method [86] for driving an error signal to
zero by feeding back the integral of the error to its input.
Augmented Lagrangians. One important interpretation relies on the
idea of an augmented Lagrangian. We ﬁrst write the problem of mini-
mizing f (x) +g(x) as
minimize f (x) +g(z)
subject to x − z = 0, (4.9)
which is called consensus form . Here, the variable has been split into
two variablesx andz, and we have added the consensus constraint that
they must agree. This is evidently equivalent to minimizing f +g.
The augmented Lagrangian associated with the problem (4.9) is
Lρ (x,z,y ) = f (x) +g(z) +yT (x − z) + (ρ/ 2)∥x − z∥2
2,
where ρ > 0 is a parameter and y ∈ Rn is a dual variable associated
with the consensus constraint. This is the usual Lagrangian augmented
with an additional quadratic penalty on the equality constr aint func-
tion. ADMM can then be expressed as
xk+1 := argmin
x
Lρ (x,z k,y k)
zk+1 := argmin
z
Lρ (xk+1,z,y k)
yk+1 := yk +ρ (xk+1 − zk+1).
In each of the x and z steps, Lρ is minimized over the variable, using
the most recent value of the other primal variable and the dua l variable.
The dual variable is the (scaled) running sum of the consensu s errors.
To see how the augmented Lagrangian form of ADMM reduces to


## Page 38

156 Proximal Algorithms
the proximal version, we start from
xk+1 := argmin
x
(
f (x) +ykTx + (ρ/ 2)∥x − zk∥2
2
)
zk+1 := argmin
z
(
g(z) − ykTz + (ρ/ 2)∥xk+1 − z∥2
2
)
yk+1 := yk +ρ (xk+1 − zk+1),
and then pull the linear terms into the quadratic ones to get
xk+1 := argmin
x
(
f (x) + (ρ/ 2)∥x − zk + (1/ρ )yk∥2
2
)
zk+1 := argmin
z
(
g(z) + (ρ/ 2)∥xk+1 − z − (1/ρ )yk∥2
2
)
yk+1 := yk +ρ (xk+1 − zk+1).
With uk = (1/ρ )yk and λ = 1/ρ , this is the proximal form of ADMM.
Flow interpretation. ADMM can also be interpreted as a method for
solving a particular system of ordinary diﬀerential equati ons. Assuming
for simplicity that f andg are diﬀerentiable, the optimality conditions
for (4.9) are
∇ f (x) +ν = 0, ∇ g(z) − ν = 0, x − z = 0, (4.10)
whereν ∈ Rn is a dual variable. Now consider the diﬀerential equation
d
dt
[
x(t)
z(t)
]
=
[
−∇ f (x(t)) − ρu (t) − ρr (t)
−∇ g(z(t)) +ρu (t) +ρr (t)
]
, d
dtu(t) = ρr (t), (4.11)
where r(t) = x(t) − z(t) is the primal (consensus) residual and ρ > 0.
The functions in the diﬀerential equation are the primal var iablesx and
z, and the dual variable u. This diﬀerential equation does not have a
standard name, but we will call it the saddle point ﬂow for the problem
(4.9), since it can be interpreted as a continuous analog of s ome saddle
point algorithms.
It is easy to see that the equilibrium points of the saddle poi nt ﬂow
(4.11) are the same as the optimality conditions (4.10) when ν =ρu . It
can also be shown that all trajectories of the saddle point ﬂo w converge
to an equilibrium point (assuming there exist x⋆ and ν ⋆ satisfying the


## Page 39

4.4. Alternating direction method of multipliers 157
optimality conditions). It follows that we can solve the pro blem (4.9) by
following any trajectory of the ﬂow (4.11) using numerical i ntegration.
Withxk,zk, and uk denoting our approximations of x(t),z(t), and
u(t) at t =kh, where h> 0 is the step length, we use the discretization
of (4.11) given by
xk+1 − xk
h = −∇ f (xk+1) − ρ (xk − zk +uk)
zk+1 − zk
h = −∇ g(zk+1) +ρ (xk+1 − zk +uk)
uk+1 − uk
h = ρ (xk+1 − zk+1).
As in forward-backward splitting, we make very speciﬁc choic es on the
righthand side as to whether each time argument t is replaced with kh
(forward) or (k + 1)h (backward) values. Choosing h =λ andρ = 1/λ ,
this discretization reduces directly to the proximal form o f ADMM.
Fixed point iteration. ADMM can be viewed as a ﬁxed point iteration
for ﬁnding a point x⋆ satisfying the optimality condition
0 ∈ ∂f (x⋆ ) +∂g (x⋆ ). (4.12)
Fixed points x,z,u of the ADMM iteration satisfy
x = proxλf (z − u), z = proxλg (x +u), u =u +x − z.
From the last equation we conclude x =z, so
x = proxλf (x − u), x = proxλg (x +u),
which can be written as
x = (I +λ∂f )− 1(x − u), x = (I +λ∂g )− 1(x +u).
This is the same as
x − u ∈ x +λ∂f (x), x +u ∈ x +λ∂g (x).
Adding these two equations shows that x satisﬁes the optimality con-
dition (4.12). Thus, any ﬁxed point of the ADMM iteration sat isﬁes
x =z, with x optimal. Convergence of the ADMM iteration to a ﬁxed
point can be established several ways; one way is to show that it is
equivalent to iteration of a ﬁrmly nonexpansive operator [7 8].


## Page 40

158 Proximal Algorithms
4.4.2 Linearized ADMM
A variation of ADMM can be useful for solving problems of the f orm
minimize f (x) +g(Ax),
where f : Rn → R ∪ {∞} and g : Rm → R ∪ {∞} are closed proper
convex and A ∈ Rm× n. The only diﬀerence from the form used in
standard ADMM is the presence of the matrix A in the second term.
This problem can be solved with standard ADMM by deﬁning
˜g(x) = g(Ax) and minimizing f (x) + ˜g(x). However, this approach
requires evaluation of the proximal operator of ˜ g, which is complicated
by the presence of A, even when the proximal operator of g is easy to
evaluate. (There are a few special cases where prox˜g is in fact simple to
evaluate; see §2.2.) The linearized ADMM algorithm solves the problem
above using only the proximal operators of f andg and multiplication
byA and AT ; in particular, g and A are handled separately.
Linearized ADMM has the form
xk+1 := proxµf (xk − (µ/λ )AT (Axk − zk +uk))
zk+1 := proxλg (Axk+1 +uk)
uk+1 := uk +Axk+1 − zk+1,
where the algorithm parameters λ andµ satisfy 0 <µ ≤ λ/ ∥A∥2
2. This
reduces to standard ADMM when A =I and µ =λ .
The reason for the name is the following. Consider the proble m
minimize f (x) +g(z)
subject to Ax − z = 0,
with variables x andz. The augmented Lagrangian for this problem is
Lρ (x,z,y ) = f (x) +g(z) +yT (Ax − z) + (ρ/ 2)∥Ax − z∥2
2,
where y ∈ Rm is a dual variable and ρ = 1/λ . In linearized ADMM,
we modify the usual x-update by replacing ( ρ/ 2)∥Ax − zk∥2
2 with
ρ (ATAxk − ATzk)Tx + (µ/ 2)∥x − xk∥2
2,
i.e., we linearize the quadratic term and add new quadratic regul ariza-
tion. The result can be expressed as a proximal operator as ab ove.


## Page 41

4.5. Notes and references 159
This algorithm is discussed in many papers; see, e.g., [205] or [157]
and references therein. In the image processing literature , it is known
as the split inexact Uzawa method [80, 205, 204, 104].
4.5 Notes and references
The initial work on the proximal minimization algorithm is d ue to
Martinet [135, 136]. Proximal minimization was extended to the general
proximal point algorithm for ﬁnding the zero of an arbitrary maximal
monotone operator by Rockafellar [174]; its convergence th eory has
been extended in much subsequent work, e.g., [130, 100, 82]. Proximal
minimization is closely related to multiplier methods [115 , 24, 25] and
the literature on augmented Lagrangians [172, 173, 78].
The general form of forward-backward splitting was perhaps ﬁ rst
discussed by Bruck [42]. Forward-backward splitting is an ex ample
of an operator splitting method , a term coined by Lions and Mercier
[129]. Important papers on forward-backward splitting incl ude those by
Passty [159], Lions and Mercier [129], Fukushima and Mine [8 8], Gabay
[90], Lemaire [120], Eckstein [78], Chen [54], Chen and Rock afellar [55],
Tseng [184, 185, 187], Combettes and Wajs [62], and Beck and T eboulle
[17, 18]. Relationships between proximal gradient, coordi nate descent,
and gradient methods are discussed in [26]. For particular p roblems,
such as the lasso, it is possible to prove additional stronge r results about
the performance of the proximal gradient method [102, 67, 58 , 35].
Accelerated proximal gradient methods trace their roots ba ck to
the literature on optimal ﬁrst-order methods . The ﬁrst of these was due
to Nesterov [148], and there has been a substantial literatu re on other
optimal-order algorithms since then, such as the papers by Ne sterov
[148, 149, 150, 151], Tseng [188], Beck and Teboulle [17, 18] , Becker et
al. [20, 22], Goldfarb and Scheinberg [95, 177], Güler [101] , O’Donoghue
and Candès [154], and many others. We note that the convergen ce the-
ory of accelerated proximal gradient methods is not based on operator
splitting, unlike the basic method. Finally, there are ways to accelerate
the basic proximal gradient method other than the method we s howed,
such as through the use of Barzilai-Borwein step sizes [6, 199 ] or with
other types of extrapolation steps [28].


## Page 42

160 Proximal Algorithms
ADMM is equivalent to an operator splitting method called
Douglas-Rachford splitting, which was introduced in the 1950s for the
numerical solution of partial diﬀerential equations [75]. It was ﬁrst in-
troduced in its modern form by Gabay and Mercier [91] and Glow inski
and Marrocco [94] in the 1970s. See Boyd et al. [32] for a recen t survey
of the algorithm and its applications, including a detailed bibliography
and many other references. See [197] for a recent paper on app lying
ADMM to solving semideﬁnite programming problems.
The idea of viewing optimization algorithms, or at least gra dient
methods, from the perspective of numerical methods for ordi nary dif-
ferential equations appears to originate in the 1950s [2]. T hese ideas
were also explored by Polyak [163] and Bruck [42] in the 1970s . The
interpretation of a proximal operator as a backward Euler st ep is well
known; see, e.g., Lemaire [121] and Eckstein [78] and references therein.
We also note that there are a number of less widely used proxim al
algorithms building on the basic methods discussed in this c hapter; see,
for example, [107, 89, 164, 117, 9, 186, 187, 30].
Finally, the basic ideas have been generalized in various wa ys:
1. Non-quadratic penalties . Some authors have studied generalized
proximal operators that use non-quadratic penalty terms, su ch as
entropic penalties [181] and Bregman divergences [36, 49, 7 9, 152].
These can be used in generalized forms of proximal algorithm s
like the ones discussed in this chapter. For example, the mir ror
descent algorithm can be viewed as such a method [147, 16].
2. Nonconvex optimization . Some have studied proximal operators
and algorithms in the nonconvex case [88, 113, 160].
3. Inﬁnite dimensions . Building on Rockafellar’s work, there is a
substantial literature studying the proximal point algori thm in
the monotone operator setting; this is closely connected to the
literature on set-valued mappings, ﬁxed point theory, nonex pan-
sive mappings, and variational inequalities [202, 37, 103, 175, 81,
44, 10]; the recent paper by Combettes [59] is worth highligh ting.


## Page 43

5
Parallel and Distributed Algorithms
In this chapter we describe a simple method to obtain paralle l and dis-
tributed proximal algorithms for solving convex optimizat ion problems.
The method is based on the ADMM algorithm described in §4.4, a nd
the key is to split the objective (and constraints) into two t erms, at
least one of which is separable. The separability of the term s gives us
the ability to evaluate the proximal operator in parallel. I t is also possi-
ble to construct parallel and distributed algorithms using the proximal
gradient or accelerated proximal gradient methods, but thi s approach
imposes diﬀerentiability conditions on part of the objecti ve.
5.1 Problem structure
Let [n] = { 1,...,n } . Given c ⊆ [n], let xc ∈ R|c| denote the subvector of
x ∈ Rn referenced by the indices in c. The collection P = {c1,...,c N } ,
whereci ⊆ [n], is a partition of [n] if ⋃ P = [n] and ci ∩ cj = ∅ fori ̸=j.
A function f : Rn → R is said to be P-separable if
f (x) = ∑N
i=1fi(xci),
where fi : R|ci| → R and xci is the subvector of x with indices in ci.
We refer to ci as the scope offi. In other words, f is a sum of terms fi,
161


## Page 44

162 Parallel and Distributed Algorithms
each of which depends only on part of x; if each ci = {i} , then f is fully
separable. Separability is of interest because if f is P-separable, then
(proxf (v))i = proxfi(vi), where vi ∈ R|ci|, i.e., the proximal operator
breaks intoN smaller operations that can be carried out independently
in parallel. This is immediate from the separable sum proper ty of §2.1.
Consider the problem
minimize f (x) +g(x), (5.1)
where x ∈ Rn and where f, g : Rn → R ∪ { +∞} are closed proper
convex. (In many cases of interest, g will be the indicator function
of a convex set.) We assume that f and g are P-separable and Q-
separable, respectively, where P = {c1,...,c N } and Q = {d1,...,d M }
are partitions of [ n]. Writing the problem explicitly in terms of the
subvectors in the partitions, the problem is
minimize ∑N
i=1fi(xci) + ∑M
j=1gj(xdj ), (5.2)
where fi : R|ci| → R ∪ { +∞} and gj : R|dj | → R ∪ { +∞} . By conven-
tion, we use i to index the f blocks and j to index the g blocks.
ADMM for the problem form (5.2) is the algorithm
xk+1
ci := proxλf i(zk
ci − uk
ci)
zk+1
dj := proxλg j (xk+1
dj +uk
dj )
uk+1 := uk +xk+1 − zk+1.
The ﬁrst step involves N updates carried out independently in parallel,
each of which involves evaluating the proximal operator of o ne of the
components fi of f , and the second step involves M updates carried
out independently in parallel, each involving the proximal operator
of a component gj of g. The ﬁnal step, of course, is always trivially
parallelizable. This can be visualized as in Figure 5.1, whi ch shows two
partitions of a set of variables. Here, the x-update splits into 3 parts
and the z-update splits into 2 parts.
If, for instance, P = Q, then the original problem has a separable
objective and is thus trivially parallelizable. On the othe r hand, over-
laps in the two partitions, as in Figure 5.1, will lead to comm unication


## Page 45

5.2. Consensus 163
Figure 5.1: Variables are black dots; the partitions P and Q are in orange and cyan.
between diﬀerent subsystems. For example, if g is not separable, then
the z-update will involve aggregating information across the N com-
ponents that can be handled independently in the x-update. This will
become more clear as we examine special cases.
5.2 Consensus
5.2.1 Global consensus
Consider the problem of minimizing an additive function, i.e., a sum
of terms that all share a common variable:
minimize f (x) = ∑N
i=1fi(x),
with variable x ∈ Rn. The problem is to minimize each of the ‘local’
objectivesfi, each of which depends on the same global variable x. We
aim to solve this problem in a way that allows each fi to be handled
in parallel by a separate processing element or subsystem.
We ﬁrst transform the problem into consensus form :
minimize ∑N
i=1fi(xi)
subject to x1 =x2 = · · · =xN, (5.3)
with variablesxi ∈ Rn,i = 1,...,N . In other words, we createN copies
of the original global variable x so that the objective is now separable,
but we add a consensus or consistency constraint that requires all these
‘local’ variables xi to agree. This can be visualized as in Figure 5.2,
which shows an example withn = 4 andN = 5; here, each local variable
xi is a column and the consistency constraints are drawn across rows.


## Page 46

164 Parallel and Distributed Algorithms
Figure 5.2: Variables are black dots; the partitions P and Q are in orange and cyan.
The next step is to transform (5.3) into the canonical form (5 .1):
minimize ∑N
i=1fi(xi) +IC(x1,...,x N ), (5.4)
where C is the consensus set
C = { (x1,...,x N ) |x1 = · · · =xN }. (5.5)
In this formulation we have moved the consensus constraint i nto the
objective using an indicator function. In the notation of (5 .1),f is the
sum of the terms fi, while g is the indicator function of the consistency
constraint. The partitions are given by
P = { [n],n + [n], 2n + [n],..., (N − 1)n + [n]},
Q = {{ i,n +i, 2n +i,..., (N − 1)n +i} | i = 1,...,N }.
The ﬁrst partition is clear since f is additive. The consensus constraint
splits across its components; it can be written as a separate consensus
constraint for each component. Since the full optimization variable for
(5.4) is in RnN , it is easiest to view it as in Figure 5.2, in which case
it is easy to see that f is separable across columns while g is separable
across rows.
We now apply ADMM as above. Evaluating proxλg reduces to pro-
jecting onto the consensus set (5.5). This is simple: we repl ace each
zi with its average
z = (1/N ) ∑N
i=1zi. From this we conclude that∑N
i=1uk
i = 0, which allows for some simpliﬁcations of the general algo -


## Page 47

5.2. Consensus 165
rithm above, giving the following ﬁnal method:
xk+1
i := proxλf i(xk − uk
i )
uk+1
i := uk
i +xk+1
i −
xk+1.
(5.6)
In this proximal consensus algorithm , each of the N subsystems inde-
pendently carries out a dual update and evaluates its local p roximal
operator; in between these, all the local variables xk
i are averaged and
the result is given to each subsystem. (In distributed compu ting frame-
works like MPI, this can be implemented with an all-reduce operator.)
The method is very intuitive: The (scaled) dual variables ui, which
measure the deviation of xi from the average
x, are independently
updated to drive the variables into consensus, and quadrati c regular-
ization helps pull the variables toward their average value while still
attempting to minimize each local fi.
5.2.2 General consensus
Consider the problem
minimize f (x) = ∑N
i=1fi(xci),
where x ∈ Rn and ci ⊆ [n]. Here, the ci may overlap with each other,
so {c1,...,c N } is a cover rather than a partition of [ n]. In other words,
the objective f consists of a sum of terms, each of which depends on
some subset of components in the full global variable x. If each ci = [n],
then we recover the global consensus formulation.
We introduce a copy zi ∈ R|ci| for each xci and transform this into
the following problem:
minimize ∑N
i=1fi(zi)
subject to ( z1,...,z N ) ∈ C , (5.7)
where
C = { (z1,...,z N ) | (zi)k = (zj)k if k ∈ ci ∩ cj}.
Roughly speaking, thezi must agree on the components that are shared.
We can visualize this as in Figure 5.3, which is interpreted e xactly
like Figure 5.2 but with some dots (variables) missing. In th e diagram,


## Page 48

166 Parallel and Distributed Algorithms
Figure 5.3: Variables are black dots; the partitions P and Q are in orange and cyan.
for instance, c1 = { 2, 3, 4} , so f1 only depends on the last three compo-
nents of x ∈ Rn, and z1 ∈ R3. The consistency constraints represented
by C say that all the variables in the same row must agree.
This problem can also be visualized using a factor graph in wh ich
thefj are factor nodes, each individual variable component xi ∈ R is a
variable node, and an edge between xi and fj means that i is in scope
for fj. The example from Figure 5.3 is shown in factor graph form
in Figure 5.4. There is a consensus constraint among all the v ariables
attached to the same factor.
In the canonical form (5.1), this becomes
minimize ∑N
i=1fi(zi) +IC(z1,...,z N ). (5.8)
As before, f is the sum of the terms fi, while g is the indicator function
of the consensus constraint. and is separable across column s. We omit
the somewhat complicated explicit forms of P and Q, but as before, f
is separable across rows and g is separable across columns in Figure 5.3.
Applying ADMM and simplifying, we obtain the algorithm
xk+1
i := proxfi(
xk
i +uk
i )
uk+1
i := uk
i +xk+1
i −
xk+1
i .
(5.9)
Here,
(xk
i )j = 1
|Fi|
∑
i′ ∈ Fi
(xk
i′ )j,
where Fi = {j ∈ [N ] | i ∈ cj} . Though this is complicated to deﬁne
formally, it is intuitively just a ‘local’ averaging operat or:
xk
i ∈ R|ci| is


## Page 49

5.3. Exchange 167
f3
f2
f1
x1
x2
x3
x4
z3
z2
z1
Figure 5.4: Graph form consensus optimization. Local objective terms are on the
left; global variable components are on the right. Each edge in the bipartit e graph
is a consistency constraint, linking a local variable and a global variabl e component.
obtained by averaging each component only across the terms i n which
it is in scope. Following Figure 5.3, the variables in the sam e row are
averaged together. This modiﬁed averaging operator shows u p because
the consensus set we project onto is diﬀerent.
The structure of the algorithm is as before: We carry out loca l
computations in parallel to obtain uk+1
i andxk+1
i , and averaging takes
place in between. Since only local averaging needs to take pla ce, this
algorithm can be implemented in a completely decentralized f ashion.
5.3 Exchange
5.3.1 Global exchange
The exchange problem is the following:
minimize ∑N
i=1fi(xi)
subject to ∑N
i=1xi = 0, (5.10)
with variables xi ∈ Rn, i = 1,...,N .
The name ‘exchange’ comes from the following economics inte rpre-


## Page 50

168 Parallel and Distributed Algorithms
tation. The components of the vectors xi represent quantities of com-
modities that are exchanged among N agents. When (xi)j is positive,
it can be viewed as the amount of commodity j received by agent i
from the exchange. When ( xi)j is negative, its magnitude |(xi)j| can
be viewed as the amount of commodity j contributed by agent i to
the exchange. The equilibrium constraint that each commodity clears
is ∑N
i=1xi = 0, which means that the total amount of each commodity
contributed by agents balances the total amount taken by age nts. The
exchange problem seeks the commodity quantities that minim ize the
social cost, i.e., the total cost across the agents, subject to the market
clearing. An optimal dual variable associated with the clea ring con-
straint has a simple and natural interpretation as a set of eq uilibrium
prices for the commodities.
This can be rewritten in the canonical form (5.1) as
minimize ∑N
i=1fi(xi) +IC(x1,...,x N ),
where C is the equilibrium or clearing set
C = { (x1,...,x N ) ∈ RnN |x1 + · · · +xN = 0}. (5.11)
This problem can be visualized exactly as before, as shown in Fig-
ure 5.2. Here, f and g are separable across rows and columns, respec-
tively, and the deﬁnitions of P and Q are the same as before.
It remains to see how to project onto C. This turns out to be simple
de-meaning:
(ΠC(v1,...,v N ))i =vi −
v.
Applying ADMM and simplifying yields the following algorit hm:
xk+1
i := proxλf i(xk
i −
xk − uk)
uk+1 := uk +xk+1,
(5.12)
called the proximal exchange algorithm . The xi-updates can be carried
out independently in parallel as in the proximal consensus a lgorithm.
When the exchange problem is feasible, the variables xk
i converge to
optimal values, andλu k converges to a set of optimal commodity prices.
The proximal exchange algorithm has some interesting prope rties
and interpretations. First, each agent does not need to know anything


## Page 51

5.3. Exchange 169
about the other agents; she only needs to know the current ave rage
market imbalance xk and the current (scaled) price vector uk. Each
agent simply minimizes her own cost plus a quadratic regular ization
term that accounts for the current prices. This term is cente red at xk,
which are commodity quantities that would clear the market.
We note that the exchange and consensus problems can be viewe d
as duals. In particular, the constraint sets in the two probl ems are
subspaces that are orthogonal complements of each other. If
A =




I
.
.
.
I



 ,
then the consensus set is the range of A and the equilibrium set is the
null space of AT .
5.3.2 General form exchange
Consider a problem setup just as in the general form consensu s case,
except that the constraint set is deﬁned as
C =


 (z1,...,z N )
⏐
⏐
⏐
⏐
⏐
⏐
∑
i :k∈ ci
(zi)k = 0


 .
In other words, as before, each xi is associated with one of N agents,
and each of the n components corresponds to a diﬀerent good or com-
modity. Here, there is a distinct market or exchange for each commodity
j, so the equilibrium constraints only involve the participa ting agents.
If each cj = [N ], then we recover the global exchange formulation.
This can be visualized as Figure 5.3. The resulting algorith m is the
same as in the global exchange case, except that only compone nts that
participate in given exchanges need to participate in de-mea ning, and
the mean is only computed across the subset of agents that app ear in
the constraint.
This exchange problem arises in the problem of dynamic energ y ex-
change among ( e.g., ‘smart grid’) devices connected in a network [116].
Here, the commodities represent electrical energy at a spec iﬁc node in


## Page 52

170 Parallel and Distributed Algorithms
a network in a speciﬁc time period. The market clearing const raints
require that energy ﬂow must balance at each energy exchange node
in each time period. The agent objective terms include const raints on
generation and consumption as well as a cost function.
5.4 Allocation
The allocation problem is given by
minimize ∑N
i=1fi(xi)
subject to xi ≥ 0, i = 1,...,N,∑N
i=1xi =b,
(5.13)
with variables xi ∈ Rn, i = 1,...,N . This problem can be interpreted
much like the exchange problem. There are n types of resources, each of
which is to be allocated across N activities to minimize each activity
cost fi. There is a ﬁxed amount bj of each resource available, which
justiﬁes the nonnegativity and budget constraints.
As before, this can be written in the canonical form (5.1) as
minimize ∑N
i=1fi(xi) +IC(x1,...,x N ),
where C is the allocation set
C = { (x1,...,x N ) |xi ≥ 0, x 1 + · · · +xN =b}.
The separability of f and g, and the partitions of P and Q, are the
same as in the previous two examples.
The resulting algorithm is
xk+1
i := proxλf i(xk
i − zk − uk)
zk+1 := Π C(xk+1 +uk)
uk+1
i := uk
i +xk+1
i − zk+1.
(5.14)
Projecting onto C involvesn independent projections onto the proba-
bility simplex in RN , which can be done using the method in §6.2.5.
We could also consider a version of the allocation problem wi th an
inequality constraint ∑N
i=1xi ≤ b, which does not require that the full
budget of each resource be used. The discussion and algorith m above
would be the same but with a slightly diﬀerent projection ope rator.


## Page 53

5.5. Notes and references 171
5.5 Notes and references
Distributed optimization is a classic topic in optimizatio n with a huge
literature. Some classic and important modern references i nclude those
by Dantzig and Wolfe [66], Benders [23], Lasdon [118], Geoﬀr ion [93],
Tsitsiklis [189], Bertsekas and Tsitsklis [27], Censor and Zenios [50],
and Nedi` c and Ozdaglar [144, 145]. Exchange and allocation problems
are classical in the economics literature; see, e.g., [191, 190, 1]. See
the recent monograph by Boyd et al. [32] for additional discu ssion on
many of the topics discussed above, particularly focused on large-scale
applications in statistics and machine learning. We also me ntion that
the ‘divide-and-concur’ method for (nonconvex) constraint s atisfaction
problems can be derived as a special case of a message-passing version
of ADMM [72].


## Page 54

6
Evaluating Proximal Operators
We now discuss how to evaluate the proximal operator of a wide vari-
ety of functions. By deﬁnition, evaluating a proximal opera tor involves
solving a convex optimization problem, so the simplest appr oach is to
use a generic optimization algorithm, exploiting generic s tructure in the
problem like sparsity. In many cases there is a simpler or fas ter special-
ized method, or even an analytical solution, for the problem . We turn
to a variety of such examples after discussing the use of gene ric meth-
ods in more detail, but we emphasize that proximal methods ca n be
very useful even in cases when a closed form solution for the p roximal
operator is not available.
When f is the indicator function of a set C, the proximal operator
is projection onto C. Just as there is a close connection between a
function and its epigraph, there is often a close connection between
certain proximal operators and certain projection operato rs. For this
reason, we do not separate a discussion of projection operat ors; instead,
we try to group together operators that are conceptually rel ated.
It is also important to keep in mind that the examples discuss ed in
this chapter can be combined or extended in various ways by ap plying
the properties from Chapter 2; we will see that the Moreau dec omposi-
172


## Page 55

6.1. Generic methods 173
tion will be particularly useful. For another example, give n the product
set C = C1 × · · · × C k and the vector v = (v1,...,v k), partitioned con-
formably, we have that (Π C(v))i = Π Ci(vi), i.e., each component can
be projected in parallel. This follows from applying the sep arable sum
property from §2.1 to IC =IC1 + · · · +ICk . In many cases, we will also
see that there are several diﬀerent ways to derive the proxim al operator
of a particular function.
6.1 Generic methods
In general, the problem we wish to solve is
minimize f (x) + (1/ 2λ )∥x − v∥2
2
subject to x ∈ C , (6.1)
with variable x ∈ Rn, where C = domf (which may be all of Rn, in
which case the problem is unconstrained).
If the problem is unconstrained, so C = Rn, then the properties
of f determine which algorithms are applicable. For example, if f is
a generic nonsmooth function, then we can use a subgradient m ethod
to solve the problem. If f is smooth, we can use a gradient method,
Newton’s method, quasi-Newton methods like L-BFGS, and so on. If
the problem is constrained, we can use, for example, a projec ted sub-
gradient method if f is nonsmooth and a projected gradient method or
interior-point method if f is smooth. These and many other methods
are discussed in, e.g., Nocedal and Wright [153].
If (6.1) is representable in a canonical form, then we may tra ns-
form it into such a canonical form and then use an oﬀ-the-shelf i m-
plementation of a solver for such problems. For example, if ( 6.1) is
SDP-representable, then a parser-solver like CVX [98] could t ake a
high-level description of the problem, transform it to a cone program,
and solve it with a generic interior-point method-based cone s olver.
We now turn to some important special cases.
6.1.1 Quadratic functions
If f (x) = (1/ 2)xTAx +bTx +c, with A ∈ Sn
+, then
proxλf (v) = (I +λA )− 1(v − λb ).


## Page 56

174 Evaluating Proximal Operators
There are several important special cases of this result. Fo r example,
if f (x) = bTx +c, i.e., if f is aﬃne, then proxλf (v) = v − λb . If
f (x) = c, so f is a constant function, then proxλf (v) = v, so the
proximal operator is the identity. Finally, if f = (1/ 2)∥ · ∥2
2, then
proxλf (v) =
( 1
1 +λ
)
v,
sometimes called a shrinkage operator.
Evaluating the proximal operator of a quadratic involves, i n general,
solving a system of linear equations with coeﬃcient matrix I +λA :
(I +λA )x =v − λb.
There are a number of ways to carry this out much more quickly t han
in a naïve implementation, which would take O(n3) ﬂops for each eval-
uation. The most basic is to exploit structure in A. If A is, for instance,
tridiagonal, then the system can be solved in O(n) ﬂops. There are ad-
ditional techniques that apply when evaluating the proxima l operator
repeatedly for diﬀerent values of v (but with λ ﬁxed).
If the linear system is solved with a direct method, then we ca n
compute a factorization of the coeﬃcient matrix I +λA , cache this fac-
torization, and then re-use this factorization in each subse quent eval-
uation of proxf (which involves solving another linear system with
coeﬃcient matrix I +λA ). Depending on the structure of A, this can
lead to substantial savings, since computing the factoriza tion is typ-
ically more expensive than the subsequent back-solve. For ex ample,
when I +λA has no particular structure ( i.e., is treated as a dense
matrix), the factorization cost is O(n3) and the cost of a subsequent
solve is O(n2). This means that, after the ﬁrst evaluation of proxλf ,
we get a discount of a factor of n for subsequent evaluations.
If the system is solved with an iterative method, such as CG, t hen
we can warm start each evaluation at the previous solution. T his tech-
nique can also give substantial savings. See, e.g., [32, §4.2–§4.3] for
more discussion. Typically the number of iterations requir ed to solve
the linear system (to some given accuracy) drops to a small nu mber as
the overall proximal algorithm converges.
The comments above hold for the slightly more complex case of a
convex quadratic function restricted to an aﬃne set [32, §4. 2.5]. Here


## Page 57

6.1. Generic methods 175
too, evaluating the proximal operator reduces to solving a s et of linear
equations.
6.1.2 Smooth functions
As mentioned above, if f is a smooth function, we can use any num-
ber of standard methods to solve (6.1): a gradient method, a q uasi-
newton method like L-BFGS, conjugate gradient, and so on. Ind eed,
the quadratic regularization term will serve to help conver gence, and
because it only contributes entries to the diagonal of the He ssian, it
does not impact any structure in the Hessian of f .
Here, we describe two ways in which we can improve upon simply
using one of these standard methods. First, it is typically n ecessary
to repeatedly solve (6.1) ( i.e., evaluate proxf ) with diﬀerent values of
v. In this case, we can warm start the iterative method being us ed at
the solution of the problem for the previous value of v or at v itself.
This will often provide a very large speed improvement over s olving the
problem from scratch each time.
Second, we can exploit structure in the Hessian of f . This is directly
analogous to the discussion in the previous section. For exa mple, sup-
pose f is twice continuously diﬀerentiable and that we use Newton’ s
method to solve (6.1). The main eﬀort in carrying out Newton’ s method
is in solving the system Hx = − g each iteration, where H = ∇ 2f (x)
and g = ∇ f (x). The standard approach to solving this (symmetric,
positive deﬁnite) system would be to form the Cholesky facto rization
H =LLT and then solve the Newton system via x = − L− TL− 1g (for-
ward and back substitution). Computing the Cholesky factor ization
costs (1/ 3)n3 ﬂops, which dominates this computation. (We ignore the
cost of forming H and g here.)
Suppose H is the sum of a diagonal and a rank one matrix, i.e.,
H =D +zzT,
where D ∈ Rn× n is diagonal. By the matrix inversion lemma,
H − 1 =D− 1 − D− 1zzTD− 1
1 +zTD− 1z,
so the Newton system can be solved in O(n) rather than O(n3) ﬂops.


## Page 58

176 Evaluating Proximal Operators
This structure arises in the following manner. Suppose
f (x) = γ
( n∑
i=1
ψ i(xi) +b
)
+
n∑
i=1
ϕ i(xi).
For notational convenience, deﬁne z sozi =ψ i(xi) and deﬁne ϕ andψ
so (ϕ (x))i =ϕ i(xi) and (ψ (x))i =ψ i(xi). Then the gradient is
∇ f (x) = γ ′(y)∇ ψ (x) + ∇ ϕ (x),
and the Hessian is
∇ 2f (x) = γ ′′(y)∇ ψ (x)∇ ψ (x)T +γ ′(y) diag(˜z) + diag(∇ ϕ (x)),
where ˜zi =ψ ′′
i (xi) and y = 1Tz +b. It is clear from inspection that this
matrix is the sum of a diagonal and a rank one matrix.
For example, the ‘log-sum-exp’ function
f (x) = log
( n∑
i=1
expxi
)
follows this form with γ = log, ψ i = exp, b = 0, and ϕ i = 0, so the
expression for the Hessian simpliﬁes to
1
(1Tz)2
(
(1Tz) diag(z) − zzT
)
,
where, as above, zi = expxi. The geometric mean of a set of numbers
also takes this form.
More generally, if H is the sum of a diagonal n × n matrix and a
low rank matrix with rank p, we can solve the system in O(np2) ﬂops
using the method described in [33, §9.7.2]. This reference a lso discusses
exploiting other types of structure, such as bandedness or s parsity.
To summarize, the main point is that if f is smooth, then we can
evaluate proxf using a general algorithm like Newton’s method, and
we may be able to carry it out very quickly by exploiting struc ture
in the Hessian of f . In particular, using Newton’s method and the
technique above, we can evaluate the proximal operators of t he log-
sum-exp function or the geometric mean in O(n) ﬂops; this follows
because each iteration costs O(n) ﬂops and Newton’s method typically
takes at most 10-20 iterations to converge in practice.


## Page 59

6.1. Generic methods 177
6.1.3 Scalar function
The separable sum property (see §2.1) implies that evaluati ng the prox-
imal operator of a fully separable function reduces to evalu ating the
proximal operator of a scalar convex function f : R → R ∪ { +∞} . In
some cases, these can be analytically evaluated; in other wo rds, these
are functions for which we can analytically solve the optima lity condi-
tion λf ′(x) +x =v or λ∂f (x) +x ∋ v for x ∈ R.
For example, for f (x) = − logx, we have
proxλf (v) = v +
√
v2 + 4λ
2 . (6.2)
This example will come up in §6.7.5. For a nonsmooth example, if
f (x) = |x|, then we have that
proxλf (v) =







v − λ v ≥ λ
0 |v| ≤ λ
v +λ v ≤ − λ.
(6.3)
This operation is called soft thresholding and is discussed further in
§6.5.2, which discusses the proximal operator of the ℓ 1 norm (a fully
separable function).
Using Moreau decomposition, we can also evaluate the proxim al
operators of the conjugates of these functions.
6.1.4 General scalar function
Now we discuss generic methods for evaluating the proximal o perator
of a scalar function, which can then be applied elementwise t o compute
the proximal operator of any fully separable function.
Localization method. Suppose we only have a subgradient oracle for
f , i.e., suppose we can obtain a subgradient of f at any point in its
domain. We can evaluate proxλf eﬃciently using a localization method
(see [34, §4.1]) similar (but superior) to bisection.
We begin with the interval [l,u ] = domf (which can be ( −∞ , ∞ )).
If v is outside this interval, we return the interval endpoint cl osest to


## Page 60

178 Evaluating Proximal Operators
v. (In general, when v ̸∈ domf , proxλf (v) = Π domf (v).) Otherwise,
the algorithm repeats the following until u − l < ǫ, where ǫ > 0 is a
given tolerance:
1. In the ﬁrst iteration, let x = v; otherwise, let x = (l +u)/ 2.
Obtain h ∈ ∂f (x), so
g =h + (1/λ )(x − v) ∈ ∂ϕ (x),
where ϕ is the full proximal objective.
2. Update the localization interval via
[l,u ] := [l,u ] ∩



[x − λg,x ] g >0
[x,x − λg ] g <0.
The algorithm proceeds by obtaining a new upper and lower bou nd on
x⋆ each iteration. Since the interval is reduced by at least 50% each
iteration, it converges in at most ⌈ log2(L/ǫ )⌉ iterations, where 2 L is
the length of the localization interval [ l,u ] after the ﬁrst iteration.
We now show how the bounds are obtained when g >0; the other
case is similar. If g > 0, then ϕ (z) ≥ ϕ (x) + g(z − x) for all z, so
all z > xare suboptimal, i.e., x is an upper bound on x⋆ . The point
z = x − λg is a lower bound because each gz ∈ ∂ϕ (z) is nonpositive.
To see this, let hz ∈ ∂f (z). Because g >0 and λ > 0, we have z < x,
which implies that hz ≤ h because the subdiﬀerential is monotone. Let
gz =hz + (1/λ )(z − v) ∈ ∂ϕ (z).
Then
hz + (1/λ )(z − v) = hz + (1/λ ) (x − λ (h + (1/λ )(x − v)) − v),
and the righthand side is hz − h, which is nonpositive. Thus z is a lower
bound for x⋆ .
Guarded Newton method. If f is twice continuously diﬀerentiable,
we can use a guarded Newton method to ﬁnd x⋆ . The method starts
with the initial interval [l,u ] obtained after the ﬁrst iteration above, an


## Page 61

6.2. Polyhedra 179
initial value x = (l +u)/ 2, and a guard parameter value α ∈ [0, 1). The
algorithm is the same as the localization method above, exce pt that in
step 1, we ﬁnd the next query point via
x := Πα [l,u ](x − ϕ ′(x)/ϕ ′′(x)),
i.e., we project the (pure) Newton update x − ϕ ′(x)/ϕ ′′(x) onto the
intervalα [l,u ], whereα [l,u ] denotes the interval [l,u ] scaled by α about
its center:
α [l,u ] := [(u +l)/ 2 − α (u − l)/ 2, (u +l)/ 2 +α (u − l)/ 2].
If α = 0, the interval α [l,u ] consists only of the midpoint of the next
interval, so this algorithm reduces to the localization met hod above.
Typically, the Newton method will converge in fewer iterati ons than
the localization method, but each iteration will be more exp ensive due
to the more complex computation of the subsequent query poin t.
6.2 Polyhedra
Here, we consider the case of projection onto a polyhedron; t he same
discussion applies to evaluating the proximal operator of a convex
quadratic function restricted to a polyhedron. The polyhed ron is given
by a set of linear equalities and inequalities
C = {x ∈ Rn |Ax =b, Cx ≤ d},
where A ∈ Rm× n and C = Rp× n. The projection problem is
minimize (1 / 2)∥x − v∥2
2
subject to Ax =b, Cx ≤ d. (6.4)
This problem is a quadratic program; the speed with which thi s prob-
lem can be solved is determined by n,m, and p, as well as the structure
of A and C. To compute the proximal operator of a convex quadratic
function, restricted to C, we simply add the quadratic objective to the
one in the problem (6.4).
Here, we discuss some simple special cases, but note that the re
is a substantial literature on eﬃcient projections onto var ious kinds
of polyhedra. See, e.g., Bauschke [7, §3.3.6] or Barman et al. [5] for
applications with some more exotic examples.


## Page 62

180 Evaluating Proximal Operators
6.2.1 Solution via duality
Whenm andp are both much smaller than n, it is much more eﬃcient
to solve (6.4) via the dual. This corresponds to a case where w e want to
project a high-dimensional point onto a polyhedron describe d by just
a few equalities and inequalities.
The dual function of (6.4) is the concave quadratic
g(ν,η ) = − 1
2






[
A
C
] T [
ν
η
] 





2
2
+
([
A
C
]
v −
[
b
d
]) T [
ν
η
]
,
where ν ∈ Rm and η ∈ Rp are dual variables. The dual problem is
maximize g(ν,η )
subject to η ≥ 0.
This is a QP with m+p variables, as opposed to n variables. We recover
the solution of the problem (6.4) as
x⋆ =v − ATλ ⋆ − CTν ⋆, (6.5)
where ν ⋆ and η⋆ are optimal points for the dual problem.
Gram matrix caching. Under the assumption that n is large but m+p
is modest (say, under 1000 or so), we show how to reduce the sol ution
of the QP to one large computation that can be easily parallel ized. We
ﬁrst compute the Gram matrix GGT , where
G =
[
A
C
]
∈ R(m+p)× n,
and the vectorGv. These have dimensions (m+p)× (m+p) and (m+p),
respectively; in particular, they are small.
To compute the Gram matrix, we express it as the sum
GGT =
n∑
i=1
gigT
i ,
where gi = (ai,c i) ∈ Rm+p. In other words, we compute outer prod-
ucts of vectors in Rm+p independently in parallel, then compute an


## Page 63

6.2. Polyhedra 181
elementwise sum of all these matrices ( e.g., via an all-reduce operation
in a distributed implementation). This Gram matrix computa tion is
done only once. If the matrices involved are dense, this step requires
n(m +p)2 ﬂops; it is easily parallelized. If the matrices are sparse, the
cost is much less.
Each time we need to evaluate the projection, we ﬁrst evaluat e
Gv. When the matrices involved are dense, this costs n(m +p) ﬂops, a
savings by a factor ofm+p over the Gram matrix calculation; moreover,
this step, like the Gram matrix calculation, is easily solve d in a parallel
implementation via an all-reduce operation. We then solve th e dual
QP, expressed as
maximize ( ν,η )T (GGT )(ν,η ) + (Gv)T (ν,η )
subject to η ≥ 0.
This is a small QP, which can be quickly solved. Finally, reco nstructing
x⋆ fromλ ⋆ andν ⋆ via (6.5) requires n(m +p) ﬂops (when A andC are
dense); this step is trivially parallelizable.
This approach permits solving (6.4) for more or less arbitra rily large
n, as long as m +p is of modest size. In a serial implementation, the
cost is O(n), but this can be reduced by a factor k with k processors.
6.2.2 Aﬃne set
An aﬃne set is a special case of a polyhedron, for which there i s an
analytical expression for the projection. Let C = {x ∈ Rn | Ax = b} ,
where A ∈ Rm× n. Then
ΠC(v) = v − A† (Av − b),
where A† is the Moore-Penrose pseudoinverse of A [14, §4]. For exam-
ple, if m<n and A has full rank, then this specializes to
ΠC(v) = v − AT (AAT )− 1(Av − b).
As in the previous section, we can compute AAT (which is the Gram
matrix) once, and cache its factorization. After this initi al work, each
projection costs one multiplication by A and one by AT (and each of
these is easily parallelized).


## Page 64

182 Evaluating Proximal Operators
As a special case, projection onto the hyperplane C = {x |aTx =b}
is given by
ΠC(v) = v +
(
b − aTv
∥a∥2
2
)
a.
6.2.3 Halfspace
If C = {x |aTx ≤ b} is a halfspace, then
ΠC(v) = v − (aTv − b)+
∥a∥2
2
a,
where (u)+ = max {u, 0} . In other words, we ﬁrst check whether the
point is in the halfspace, and if not, we project onto the hype rplane
deﬁning the boundary of the halfspace.
6.2.4 Box
Projection onto a box or hyper-rectangle C = {x |l ≤ x ≤ u} also takes
a simple form:
(ΠC(v))k =







lk vk ≤ lk
vk lk ≤ vk ≤ uk
uk vk ≥ uk,
i.e., we threshold the values at the boundary of the box. Here, l andu
may be −∞ or +∞ , so the box need not be bounded. For example, for
C = Rn
+, we have
ΠC(v) = v+,
where the positive part operator is taken elementwise. In ot her words,
to project a vector v onto the nonnegative orthant, each negative com-
ponent of v is replaced with zero. This is a special case of projection
onto a box with l = 0 and u = ∞ .
6.2.5 Simplex
In other cases, there are simple iterative methods available . For exam-
ple, to project v ∈ RN onto the probability simplex
C = {z |z ≥ 0, 1Tz = 1},


## Page 65

6.3. Cones 183
it follows from the optimality conditions that
ΠC(v) = (v − ν 1)+
for some ν ∈ R. We carry out bisection on ν to ﬁnd the value for which
1T (v − ν 1)+ = 1, starting with the initial interval [max ivi − 1, maxivi].
The function 1T (v − ν 1)+ is piecewise linear, with breakpoints at the
valuesv1,...,v n, so once we have localizedν to be between two adjacent
values, we can immediately compute the optimal value ν ⋆ .
6.3 Cones
Let K be a proper cone with dual cone K∗ . The optimality conditions
of the problem
minimize ∥x − v∥2
2
subject to x ∈ K ,
with variable x, are given by
x ∈ K , v =x − λ, λ ∈ K ∗, λ Tx = 0,
where λ is the dual variable for the cone constraint. Thus, projecti ng
a point v onto K decomposes it into the diﬀerence of two orthogonal
vectors x and λ , such that x is nonnegative with respect to K and λ
is nonnegative with respect to K∗ . (This is an instance of the Moreau
decomposition; see §2.5.)
We can derive many useful properties from the conditions abo ve.
For example, if v ∈ K ∗ , then Π K(v) = 0. Next, we give several impor-
tant special cases in which explicit solutions are availabl e.
6.3.1 Nonnegative orthant
For the cone C = Rn
+, we have that
ΠC(v) = v+,
where the nonnegative part operator ( ·)+ is taken elementwise. Thus,
to project onto Rn
+, we simply replace each negative component of v
with zero. (This is projection onto a box with l = 0 and u = ∞ .)


## Page 66

184 Evaluating Proximal Operators
6.3.2 Second-order cone
The second-order cone C = { (x,t ) ∈ Rn+1 | ∥x∥2 ≤ t} is also known as
the quadratic cone or the Lorentz cone. Projection onto it is given by
ΠC(v,s ) =







0 ∥v∥2 ≤ − s
(v,s ) ∥v∥2 ≤ s
(1/ 2)(1 +s/ ∥v∥2)(v, ∥v∥2) ∥v∥2 ≥ | s|.
6.3.3 Positive semideﬁnite cone
For the cone C = Sn
+, we have that
ΠC(V ) =
n∑
i=1
(λ i)+uiuT
i , (6.6)
where ∑n
i=1λ iuiuT
i is the eigenvalue decomposition of V . In other
words, to project a symmetric matrix onto the positive semid eﬁnite
cone, we form its eigenvalue expansion and drop terms associ ated with
negative eigenvalues.
6.3.4 Exponential cone
The exponential cone Kexp ⊂ R3 is given by
Kexp = { (x,y,z ) |y >0, yex/y ≤ z} ∪ { (x,y,z ) |x ≤ 0, y = 0, z ≥ 0}.
Its dual cone is
K∗
exp = { (u,v,w ) |u< 0, − uev/u ≤ ew} ∪ { (0,v,w ) |v ≥ 0, w ≥ 0}.
We can compute the projection v = (r,s,t ) of v0 = (r0,s 0,t 0) ∈ R3
ontoKexp as follows:
1. If v0 ∈ Kexp, then v =v0.
2. If − v0 ∈ K∗
exp, then v = 0.
3. If r0< 0 and s0< 0, then v = (r0, (s0)+, (t0)+).


## Page 67

6.4. Pointwise maximum and supremum 185
4. Otherwise, v is the solution to
minimize (1 / 2)∥v − v0∥2
2
subject to ser/s =t, s> 0.
(The constraint s> 0 cannot be active at the optimal point; it is really
the domain of the constraint function.) This optimization p roblem can
be solved with a primal-dual Newton method in the following fa shion.
Let f (v) = (1 / 2)∥v − v0∥2
2 and let g(v) = ser/s − t. Then computing
the Newton step involves solving the system
[
∇ 2f (v) +λ ∇ 2g(v) ∇ g(v)
∇ g(v)T 0
] [
∆v
∆λ
]
= −
[
∇ f (v) +λ ∇ g(v)
g(v)
]
,
where λ ∈ R is a dual variable. This simpliﬁes to
[
I +λ ∇ 2g(v) ∇ g(v)
∇ g(v)T 0
] [
∆v
∆λ
]
= −
[
v − v0 +λ ∇ g(v)
ser/s − t
]
,
where
∇ g(v) =



er/s
er/s (1 − r/s )
− 1


 , ∇ 2g(v) = er/s



1/s − r/s 2 0
− r/s 2 r2/s 3 0
0 0 0


 .
When carrying out the backtracking line search, one should b acktrack
either if the usual backtracking condition holds or if s + ∆s <0; this
enforces the constraint s> 0.
6.4 Pointwise maximum and supremum
6.4.1 Max function
Let f (x) = maxixi. In epigraph form, we have the equivalent problem
minimize t + (1/ 2λ )∥x − v∥2
2
subject to xi ≤ t, i = 1,...,n,
with variables x1,...,x n ∈ R and t ∈ R. The Lagrangian is
L(x,t,µ ) = t + (1/ 2λ )∥x − v∥2
2 +µ T (x − t1),


## Page 68

186 Evaluating Proximal Operators
with dual variable µ , and the optimality conditions are
x⋆
i ≤ t⋆, µ ⋆
i ≥ 0, µ ⋆
i (x⋆
i − t⋆ ) = 0, (1/λ )(x⋆
i − vi)+µ ⋆
i = 0, 1Tµ ⋆ = 1.
Ifx⋆
i <t ⋆ , then the third condition implies that µ ⋆
i = 0, and if x⋆
i =t⋆ ,
the fourth implies that µ ⋆
i = (1/λ )(vi − t⋆ ). Because µ ⋆
i ≥ 0, this gives
µ ⋆
i = (1/λ )(vi − t⋆ )+.
Substituting for µ ⋆
i in the ﬁfth condition gives
n∑
i=1
(1/λ )(vi − t⋆ )+ = 1.
This equation can be solved for t⋆ by bisection using the initial interval
[minivi − (1/n ), maxivi]. This is the same equation that must be solved
to project a point on the probability simplex, and the commen ts there,
such as the fact that that t⋆ can be computed exactly in a ﬁnite number
of steps, hold here as well. Once we have t⋆ , we recover the solution to
the original problem via
x⋆
i = min{t⋆,v i}.
This follows by applying the third and fourth conditions.
Another approach is to note that the max function is the conju gate
of the indicator function of the probability simplex and to t hen use
Moreau decomposition. (This explains why the same type of eq uation
arises in both cases.)
6.4.2 Support function
If C is a convex set, then the support function of C is given by
SC(x) = sup
y∈ C
yTx.
The conjugate of the support function is the indicator funct ion of the
convex set, so ( SC)∗ =IC. By Moreau decomposition, it follows that
proxλS C (v) = v − λ ΠC(v/λ ).
The following example is due to Vandenberghe [193]. Let
f (x) = x[1] +x[2] + · · · +x[k],


## Page 69

6.5. Norms and norm balls 187
the sum of the k largest components of x. (It is well-known that f is a
convex function.) The main observation is that f can be expressed as
the support function of the convex set
C = {y | 0 ⪯y ⪯ 1, 1Ty =k}.
It follows from the result above that the proximal operator o f f can
be easily evaluated via projection onto C, which can in turn be carried
out using a method like the one described in §6.2.
6.5 Norms and norm balls
If f = ∥ · ∥ is a (general) norm on Rn, then f ∗ = IB, where B is the
unit ball for the dual norm. (This result also follows from §6 .4.2 via the
observation that the support function of a unit norm ball is p recisely
the dual norm.) By Moreau decomposition, it follows that
proxλf (v) = v − λ proxf ∗/λ (v/λ ) (6.7)
=v − λ ΠB(v/λ ). (6.8)
Thus, there is a close connection both between the proximal o perator
of a norm and its dual norm as well as between proximal operato rs of
norms and projection operators onto unit norm balls.
6.5.1 Euclidean norm
For example, let f = ∥ · ∥2, the Euclidean norm in Rn. It is intuitively
obvious that we can project onto the Euclidean unit ball B as follows:
ΠB(v) =



v/ ∥v∥2 ∥v∥2> 1
v ∥v∥2 ≤ 1.
In other words, if the point is outside the ball, we simply sca le it to
have unit Euclidean norm. It then follows that
proxλf (v) = (1 − λ/ ∥v∥2)+v =



(1 − λ/ ∥v∥2)v ∥v∥2 ≥ λ
0 ∥v∥2<λ.
This operator is sometimes called block soft thresholding .


## Page 70

188 Evaluating Proximal Operators
6.5.2 ℓ 1 and ℓ ∞ norms
Similarly, we know that the unit ball B of the ℓ ∞ norm is a box, so as
discussed in §6.2, it is very easy to project onto:
(ΠB(v))i =







1 vi> 1
vi |vi| ≤ 1
− 1 vi< − 1.
Since the ℓ ∞ norm is the dual norm of the ℓ 1 norm, this also tells us
how to evaluate the proximal operator of f = ∥ · ∥1, i.e., via
(proxλf (v))i =







vi − λ v i ≥ λ
0 |vi| ≤ λ
vi +λ v i ≤ − λ.
This is known as the (elementwise) soft thresholding operator and can
be expressed more compactly as
proxλf (v) = (v − λ )+ − (− v − λ )+. (6.9)
An alternate derivation was given in §6.1.3.
It is a little less straightforward to evaluate the proximal operator
of the ℓ ∞ norm or, equivalently, to project onto the ℓ 1 ball. If B is the
unitℓ 1 ball, then the projection onto B is given by the soft thresholding
operator above, except that λ is not given in advance: If ∥v∥1 ≤ 1, then
λ = 0, and otherwise, we need to compute λ as the solution of
n∑
i=1
(|vi| − λ )+ = 1.
Alternatively, the proximal operator of the ℓ ∞ norm can be evalu-
ated using a technique similar to the one in §6.4.1. In both ca ses, the
main computational work involves solving an equation simil ar to the
one above, often via bisection. Despite no closed form solut ion being
available, this can be carried out very quickly. Other algor ithms for
projecting onto the ℓ 1 ball are discussed in [76].


## Page 71

6.5. Norms and norm balls 189
6.5.3 Elastic net
These examples can also be combined or extended in various wa ys. For
example, elastic net regularization is the function
f (x) = ∥x∥1 + (γ/ 2)∥x∥2
2
whereγ > 0, i.e., a linear combination of an ℓ 1 penalty and a quadratic
penalty [207]. This function has a simple proximal operator :
proxλf (v) =
( 1
1 +λγ
)
proxλ ∥·∥1(v),
i.e., soft thresholding followed by multiplicative shrinkage.
6.5.4 Sum of norms
Another important case is sum-of-norms regularization. Let
f (x) =
∑
g∈G
∥xg∥2,
where G is a partition of [ n]. Then it is easy to see that
(proxλf (v))g =
(
1 − λ
∥vg∥2
)
+
vg
for all g ∈ G . This function is sometimes known as a ℓ 1/ℓ 2 norm or
as a group lasso penalty, and the corresponding proximal operator is
sometimes called block soft thresholding .
It can also be useful to consider cases in which the groups in G can
overlap, so G is a cover of [ n] rather than a partition. For instance,
when G is tree-structured, meaning that either two groups g, g ′ ∈ G are
disjoint or one is a subset of the other, the proximal operato r can still
be evaluated in linear time, as discussed in [109, 4].
6.5.5 Matrix norms
Finally, we mention that there are also eﬃcient and, in some c ases,
closed-form expressions for proximal operators of matrix no rms (and
projections onto their unit balls). These examples are best discussed in
the general setting of matrix functions covered in §6.7.


## Page 72

190 Evaluating Proximal Operators
6.6 Sublevel set and epigraph
In this section, we consider the problem of projecting onto a sublevel
set or the epigraph of a closed proper convex function. We sho w how
these projection operators are related to the proximal oper ator of f (or
a function closely related to f ).
6.6.1 Sublevel set
The t-sublevel set of f is
S = {x ∈ Rn |f (x) ≤ t},
which we assume is nonempty. We assume that v /∈ S, meaning that
f (v)>t , where v is the point to be projected; otherwise, the projection
is trivially Π S(v) = v. The projection onto S can be computed using
standard methods. Here, we show how to express the projectio n onto
S using the proximal operator of f .
The optimality conditions for the projection are
0 ∈ x − v +λ∂f (x), f (x) = t, λ> 0.
The ﬁrst condition says that Π S(v) = proxλf (v), where, by the second
and third conditions, λ> 0 satisﬁes
f (proxλf (v)) = t.
We can ﬁnd λ by bisection since the lefthand side is decreasing in λ . In
other words, we can project onto S by evaluating the proximal operator
off , but we ﬁrst need to ﬁnd the parameter λ of the proximal operator.
6.6.2 Epigraph
Other than using a general purpose solver to project onto the epigraph,
we have two characterizations of the projection. First, in g eneral,
Πepif (v,s ) = (x,f (x)),
where x is the unique solution of
v ∈ x + (f (x) − s)∂f (x).


## Page 73

6.7. Matrix functions 191
Depending on f , this inclusion may or may not be easy to solve.
A second characterization is that
Πepif (v,s ) = (x,t ),
where
x = proxg(v), t = max{f (x),s },
and g is given by g(v) = (f (v) − s)2
+.
6.7 Matrix functions
We discuss two types of matrix functions: entrywise functio ns and ma-
trix functions that can be viewed as vector functions of the e igenvalues
or singular values of the matrix. Both these cases use proxim al opera-
tors of corresponding vector functions as a building block, and together
they cover most matrix functions of interest.
6.7.1 Elementwise functions
The ﬁrst case is trivial. An entrywise matrix function treat s a matrix
A ∈ Rm× n as a vector in Rmn and then uses a corresponding vector
function; the proximal operator is then the same as that of th e vector
function. For example, the entrywise ℓ 1 norm of a matrix A is
∥A∥1 =
m∑
i=1
n∑
j=1
|aij|,
and its proximal operator is elementwise soft thresholding . The entry-
wise ℓ 2 norm (the Frobenius norm) is similarly easy to handle.
6.7.2 Orthogonally invariant functions
The second case is conceptually simple but requires introdu cing several
deﬁnitions; these results are based on those of Lewis [125, 1 26, 128],
with some results tracing back to Davis [68].
A function F : Rm× n → R is orthogonally invariant if
F (VXU ) = F (X)


## Page 74

192 Evaluating Proximal Operators
for all X ∈ Rm× n, U ∈ Rn× n, and V ∈ Rm× m, where U and V are
orthogonal matrices. This implies, for example, that
F (X) = F (diag(σ s(X))),
where the singular value map σ s : Rm× n → Rmin{m,n } is the function
that takes a matrix in Rm× n and returns a vector of its singular values
in nonincreasing order.
It turns out that F is orthogonally invariant if and only if F =f ◦σ s,
where f is absolutely symmetric , meaning that f (Qx) = f (x) for all
x ∈ Rp and any signed permutation matrix Q, i.e., a matrix in which
each row and each column has exactly one nonzero entry in {− 1, +1} .
Many properties of F can be derived from the corresponding properties
of f ; this is sometimes known as the transfer principle . For example,
F is convex if and only if f is convex. Moreover, the subdiﬀerential of
a convex orthogonally invariant function is given by
∂F (X) = {V diag(µ )U |µ ∈ ∂f (σ s(X))},
whereX =V diag(σ s(X))U is the singular value decomposition of X.
In other words, we compute a subgradient of f at the singular value
vector of X and then left and right multiply by V andU , respectively.
This implies that
proxλF (A) = V diag(proxλf (σ s(A)))U, (6.10)
i.e., we can evaluate the proximal operator of F by carrying out a
singular value decomposition ofA and evaluating the proximal operator
of the corresponding absolutely symmetric function f at σ s(A).
Very similar results hold for functions F : Sn → R of symmetric
matrices satisfying F (UXU T ) = F (X) for all X and all orthogonal U ;
such functions are called spectral functions. For instance, each spectral
function F can be represented as f ◦ σ , where f : Rn → R is a sym-
metric function and the spectral map σ takes a symmetric matrix and
returns a vector of its eigenvalues in nonincreasing order. We have that
proxλF (A) = U diag(proxλf (σ (A)))UT (6.11)
for any convex spectral function F , where A =U diag(σ (A))UT is the
eigendecomposition of A.


## Page 75

6.7. Matrix functions 193
A closely related issue is to consider projections onto spectral sets
in Sn, which have the form σ − 1(S) for any symmetric set S ⊆ Rn. If
F is a spectral function, then domF is a spectral set, and σ − 1(S) is
convex if and only if S is. Following (6.11), if S ⊆ Rn is a symmetric
convex set, then projection onto T =σ − 1(S) is given by
ΠT (A) = U diag(ΠS(σ (A)))UT. (6.12)
In other words, the eﬀort involves computing the eigendecom position
of the argument and projecting the spectrum onto S ⊆ Rn.
6.7.3 Matrix norms
Evaluating the proximal operator of orthogonally invarian t matrix
norms is now straightforward. For example, the Schatten p-norm of
A ∈ Rm× n is simply ∥σ s(A)∥p, the ℓp norm of its singular values. Spe-
cial cases include the trace norm or nuclear norm (p = 1), the Frobenius
norm (p = 2), and the spectral norm (p = ∞ ).
It is straightforward to evaluate the proximal operator of a Schatten
p-norm by building on the previous discussion. For example, if F is the
nuclear norm (the ℓ 1 norm of the singular values), then
proxλF (A) =
n∑
i=1
(σ i − λ )+uivT
i , (6.13)
whereA = ∑n
i=1σ iuivT
i is the singular value decomposition of A. This
operation is called singular value thresholding since we soft threshold
the singular values rather than the entries.
Another kind of orthogonally invariant norm is the Ky Fank-norm,
which is the sum of the k largest singular values of a matrix. We can
evaluate its proximal operator by combining (6.10) with §6. 4.2.
6.7.4 Projections onto spectral sets
It is easy to see that Sn
+ =σ − 1(Rn
+), which lets us extend results from
Rn
+ to Sn
+. Thus, we can project A ∈ Sn onto Sn
+ by projecting σ (A)
onto Rn
+; this is exactly (6.6), which we discussed previously.
As another example, we can project onto the convex spectral s et
T = {X ⪰ 0 | T rX = 1},


## Page 76

194 Evaluating Proximal Operators
where X ⪰ 0 means that X is positive semideﬁnite, via a projection
onto the probability simplex S, since T =σ − 1(S).
Finally, the unit ball B of the spectral norm is precisely σ − 1(B′),
where B′ is the unit ℓ ∞ ball in Rn. This gives that
ΠB(A) =
n∑
i=1
max{di, 1}uiuT
i , (6.14)
where A = ∑n
i=1diuiuT
i is the eigenvalue decomposition of A. Thus,
we can project a matrix onto B by thresholding its eigenvalues to have
(absolute) magnitude at most 1. (We can also relate results l ike (6.14)
to results like (6.13) via (6.8), as in the vector case.)
6.7.5 Log barrier
Consider the spectral function F (A) = − log detA. In this case, the
corresponding f is simply the usual log barrier function, given by
f (x) = −
n∑
i=1
logxi.
It is easy to see that this function is separable down to the co mponent
and that its proximal operator is given by
(proxλf (v))i =
vi +
√
v2
i + 4λ
2 (6.15)
for i = 1,...,n (see (6.2)). This implies that the proximal operator of
F can be evaluated by applying (6.15) to the spectrum of A.
6.8 Notes and references
Many, though not all, of the examples in this chapter are well -known
in the literature; see, e.g., Vandenberghe [193], Bauschke [7, §3.3],
Bauschke and Combettes [10, chapter 28], Combettes and Pesq uet [61],
Zarantonello [203], and Boyd and Vandenberghe [33].
Many of the results on norms, especially the ℓ 1 norm and variants,
come from the statistical and machine learning literature. See, for ex-
ample, references on the lasso [182], soft thresholding [74 ], group lasso


## Page 77

6.8. Notes and references 195
[201], sum-of-norms regularization [156], the CAP family of p enalties
[206], ℓ 1 trend ﬁltering [114], covariance selection [71], sparse re covery
[43], basis pursuit [56], Huber loss [105], singular value t hresholding
[45], and sparse graph selection [138].
There is a vast literature on projection operators and proxi mal op-
erators for more exotic sets and functions. For a few represe ntative
examples, see, e.g., [99, 167, 146, 180, 13]. We also highlight the pa-
per by Chiercia et al. [57], which explores the connection bet ween the
proximal operator of a function and the projection onto its e pigraph.
The material on orthogonally invariant matrix functions, s pectral
functions, and spectral sets is less widely known, though th e literature
on unitarily invariant matrix norms is classical and traces back at least
to von Neumann in the 1930s.
The results used on spectral sets and functions are closely r elated
to a general transfer principle : various properties of functions or sets
in Rn can be ‘transferred’ to corresponding properties of functi ons or
sets in Sn; see, e.g., [68, 63, 64, 65, 127, 179]. For general background
on this area, also see, e.g., [195, 87, 125, 126, 128, 69].


## Page 78

7
Examples and Applications
In this chapter we illustrate the main ideas we have discusse d with
some simple examples. Each example starts with a practical p roblem
expressed in its natural form. We then show how the problem ca n be
re-formulated in a canonical form amenable to one or more prox imal
algorithms, including, in some cases, parallel or distribu ted algorithms.
All the experiments were run on a machine with one (quad-core)
Intel Xeon E3-1270 3.4 GHz CPU and 16 GB RAM running Debian
Linux. The examples were run with MATLAB version 7.10.0.499 . The
source code for all the numerical examples is online at our we bsite.
7.1 Lasso
The lasso problem is
minimize (1 / 2)∥Ax − b∥2
2 +γ ∥x∥1
with variable x ∈ Rn, where A ∈ Rm× n, and γ > 0. The problem
can be interpreted as ﬁnding a sparse solution to a least squa res or
linear regression problem or, equivalently, as carrying ou t simultaneous
variable selection and model ﬁtting.
196


## Page 79

7.1. Lasso 197
7.1.1 Proximal gradient method
We refer here only to the basic version of the method, but ever ything
also applies to the accelerated version.
Consider the splitting
f (x) = (1/ 2)∥Ax − b∥2
2, g (x) = γ ∥x∥1, (7.1)
with gradient and proximal operator
∇ f (x) = AT (Ax − b), proxγg (x) = Sγ (x),
whereSλ is the soft-thresholding operator (6.9). Evaluating ∇ f (x) re-
quires one matrix-vector multiply by A and one by AT , plus a (negligi-
ble) vector addition. Evaluating the proximal operator of g is neglible.
Thus, each iteration of the proximal gradient method requir es one
matrix-vector multiply by A, one matrix-vector multiply by AT , and a
few vector operations. The proximal gradient method for thi s problem
is sometimes called ISTA (iterative shrinkage-thresholdin g algorithm),
while the accelerated version is known as FISTA (fast ISTA) [ 17].
There are ways to improve the speed of the basic algorithm in a
given implementation. For example, we can exploit parallel ism or dis-
tributed computation by using a parallel matrix-vector mult iplication;
see, e.g., [92, 70, 29]. (The vector operations are trivially paralle lizable.)
In special cases, we can improve eﬃciency further. If n ≪ m, we can
precompute the Gram matrix ATA ∈ Sn
+ and the vector ATb ∈ Rn.
The original problem is then equivalent to the (smaller) las so problem
minimize (1 / 2)∥ ˜Ax − ˜b∥2
2 +γ ∥x∥1,
where ˜A = (ATA)1/ 2 and ˜b =ATb. (The objectives in the two problems
diﬀer by a constant.) This problem is small and can be solved v ery
quickly: when n ≪ m, all the work is in computing the Gram matrix
ATA (and ATb), which is now done only once.
These computations are also parallelizable using an all-red uce
method, since each can be expressed as a sum over the rows of A:
ATA =
m∑
i=1
aiaT
i , A Tb =
m∑
i=1
aT
i b,


## Page 80

198 Examples and Applications
where aT
i are the rows of A. This also means, for example, that they
can be computed only keeping a single ai ∈ Rn in working memory at
a given time, so it is feasible to solve a lasso problem with ex tremely
large m on a single machine, as long as n is modest.
Another common situation in which a further eﬃciency improv e-
ment is possible is when the lasso problem is to be solved for m any
values of γ . For example, we might solve the problem for 50 values of
γ , log spaced on the interval [0 . 01γ max,γ max], where γ max = ∥ATb∥∞
is the critical value of γ above which the solution is x⋆ = 0.
A simple and eﬀective method in this case is to compute the so-
lutions in turn, starting with γ = γ max, and initializing the proximal
gradient algorithm from the value ofx⋆ found with the previous, slightly
larger, value of γ . This general technique of starting an iterative algo-
rithm from a solution of a nearby problem is called warm starting . The
same idea works for other cases, such as when we add or delete r ows
and columns of A, corresponding to observing new training examples
or measuring new features in a regression problem. Warm star ting can
thus permit the (accelerated) proximal gradient method to b e used in
an online or streaming setting.
7.1.2 ADMM
To apply ADMM, we use the same splitting (7.1). Since f is quadratic,
evaluating its proximal operator involves solving a linear system, as
discussed in §6.1.1. We can thus apply the previous tricks:
• If a direct method is used to solve the subproblem, we can use fac-
torization caching. This does mean, however, that the parameter
λ must be kept ﬁxed.
• If an iterative method is used, we can warm start the method at
the previous proximal gradient iterate. In addition, we can use
a loose stopping tolerance in the early iterations and tight en the
tolerance as we go along. This amounts to evaluating the prox imal
operator of f or g approximately. (This simple variation on the
basic method can be shown to work.)


## Page 81

7.1. Lasso 199
Table 7.1: Comparing algorithms for solving the lasso. The error columns give the
absolute and relative errors of the solutions x⋆ compared to the true solution found
by CVX.
Method Iterations Time (s) p⋆ Error (abs) Error (rel)
CVX 15 26.53 16.5822 — —
Proximal gradient 127 0.72 16.5835 0.09 0.01
Accelerated 23 0.15 16.6006 0.26 0.04
ADMM 20 0.07 16.6011 0.18 0.03
• Ifn ≪ m, we can precompute ATA andATb (possibly in parallel
fashion) to reduce the size of the problem.
7.1.3 Numerical examples
We consider a small, dense instance of the lasso problem wher e the
feature matrix A ∈ Rm× n has m = 500 examples and n = 2500 fea-
tures and is dense. We compare solving this problem with the proximal
gradient method, the accelerated proximal gradient method , ADMM,
and CVX ( i.e., transforming to a symmetric cone program and solving
with an interior-point method).
We generate the data as follows. We ﬁrst choose Aij ∼ N (0, 1) and
then normalize the columns to have unit ℓ 2 norm. A ‘true’ value xtrue ∈
Rn is generated with around 100 nonzero entries, each sampled f rom an
N (0, 1) distribution. The labels b are then computed as b =Axtrue +v,
where v ∼ N (0, 10− 3I), which corresponds to a signal-to-noise ratio
∥Axtrue∥2
2/ ∥v∥2
2 of around 200.
We solve the problem with regularization parameter γ = 0. 1γ max,
whereγ max = ∥ATb∥∞ is the critical value ofγ above which the solution
of the lasso problem is x = 0. We set the proximal parameter λ = 1
in all three proximal methods. We set the termination tolera nce to
ǫ = 10 − 4 for the relevant stopping criterion in each of the methods. A ll
variables were initialized to zero.
In ADMM, since A is fat ( m < n), we apply the matrix inversion
lemma to ( ATA + (1/λ )I)− 1 and instead factor the smaller matrix
I +λAA T , which is then cached for subsequent x-updates.


## Page 82

200 Examples and Applications
0 10 20 30 40 50 60 70
0
5
10
15
20
25
30
35
40


True
Proximal gradient
Accelerated
ADMM
Figure 7.1: Objective values versus iteration for three proximal met hods for a lasso
problem. The dashed line gives the true optimal value. The ADMM objec tive values
can be below the optimal value since the iterates are not feasible.
Table 7.1 gives the iterations required, total time, and ﬁna l error
for (accelerated) proximal gradient and ADMM. Figure 7.1 sh ows the
objective value versus iteration k. (The objective values in ADMM
can be below the optimal value since the iterates are not feas ible, i.e.,
xk ̸=zk.) We refer the reader to [32, 158] for additional examples.
7.2 Matrix decomposition
A generic matrix decomposition problem has the form
minimize ϕ 1(X1) +γ 2ϕ 2(X2) + · · · +γNϕ N (XN )
subject to X1 +X2 + · · · +XN =A, (7.2)
with variables X1,...,X N ∈ Rm× n, where A ∈ Rm× n is a given data
matrix and γi> 0 are trade-oﬀ parameters. The goal is to decompose a


## Page 83

7.2. Matrix decomposition 201
given matrixA into a sum of components Xi, each of which is ‘small’ or
‘simple’ in a sense described by the corresponding term ϕ i. Problems
of this type show up in a variety of applications and have attr acted
substantial recent interest; see, e.g., [46, 52, 51, 131, 53, 176, 132].
We catalogue here some possibilities for the objective term s, which
we also refer to as ‘penalties’:
• Squared Frobenius norm.ϕ (X) = ∥X∥2
F = ∑
i,j X 2
ij. This penalty
is a traditional least squares measure and encourages the en tries
in X to be small.
• Entrywise ℓ 1 norm. ϕ (X) = ∥X∥1 = ∑
i,j |Xij|. This norm en-
couragesX to be sparse (by serving as a convex surrogate for the
number of nonzero entries in X).
• Sum-column-norm.ϕ (X) = ∑
j ∥xj∥2, where xj is jth column of
X. This penalty encourages column sparsity in X, i.e., choosing
X with many zero columns. There is a corresponding row version .
These can be interpreted as group lasso regularization (see §6.5.4)
in which the groups are the rows or columns of the matrix.
• Elementwise constraints. In many cases, we want to constrain
some or all entries to lie in some set, i.e.,Xij ∈ C ij. For instance,
we may want to ﬁx certain entries of the matrix to known values .
This can be used to, e.g., requireX to be diagonal (if X is square)
or to follow some ﬁxed sparsity pattern. Another example is t he
box constraint Xij ∈ [lij,u ij]; a common special case is to require
Xij ≥ 0.
• Separable convex function. Several of the previous items are sim-
ply examples of fully separable convex functions
ϕ (X) =
m∑
i=1
n∑
j=1
ϕ ij(Xij),
where ϕ ij : R → R ∪ { +∞} is closed proper convex and may be
extended-valued (i.e., embed constraints). We could also consider
functions of subblocks of the matrix, as in the case of the sum -
column-norm and sum-row-norm.


## Page 84

202 Examples and Applications
• Semideﬁnite cone constraint. If X is a symmetric matrix, we may
constrain X ⪰ 0, so ϕ (X) = ISn
+(X).
• Nuclear norm . ϕ (X) = ∥X∥∗ encourages X to be low rank (by
serving as a convex surrogate for the nonconvex rank function).
It can be viewed as the ℓ 1 norm of the singular values.
Decomposition problems involving sparse and low rank matri ces
have been of particular interest; see, e.g., [52, 48]. For example, with
ϕ 1 = ∥ · ∥2
F, ϕ 2 = ∥ · ∥1, ϕ 3 = ∥ · ∥∗,
the problem (7.2) is to decompose a given matrix into a sum of a matrix
with small entries, a sparse matrix, and a low rank matrix. El iminating
X1 using X1 = A − (X2 +X3), the matrix decomposition problem is
equivalent to the unconstrained problem
minimize ∥A − (X2 +X3)∥2
F +γ 2∥X2∥1 +γ 3∥X3∥∗,
with variables X2 and X3. This matrix decomposition problem can be
viewed as ﬁnding a good least squares approximation of A as a sum
of a sparse ( X2) and a low rank ( X3) matrix. This problem is also
closely related to robust principal components analysis [46]. For more
discussion of the proximal operator of the nuclear norm, see , e.g., [47].
7.2.1 ADMM algorithm
We give a generic method to solve (7.2) based on exchange (see §5.3)
and ADMM. Consider the splitting
f (X) =
N∑
i=1
ϕ i(Xi), g (X) = IC(X),
where X = (X1,...,X N ) and
C = { (X1,...,X N ) |X1 + · · · +XN =A}.
The algorithm requires two types of operations: evaluating the proximal
operator of each ϕ i and projecting onto C. The latter set is similar to
the equilibrium set (5.11) and so has a simple projection ope rator:
ΠC(X1,...,X N ) = (X1,...,X N ) −
X + (1/N )A,


## Page 85

7.2. Matrix decomposition 203
Table 7.2: Comparing CVX and ADMM for solving a matrix decomposition proble m.
Method m n Iterations Time (s)
CVX 10 30 15 1.11
ADMM 10 30 45 0.02
CVX 20 50 17 2.54
ADMM 20 50 42 0.03
CVX 40 80 20 108.14
ADMM 40 80 36 0.07
ADMM 100 200 38 0.58
ADMM 500 1000 42 35.56
whereX is the entrywise average of X1,...,X N . This can be obtained
from the projection onto (5.11) (de-meaning) via (2.2): if D = z + C,
where C and D are closed convex sets, then Π D(v) = z + ΠC(v − z).
The ﬁnal algorithm looks as follows:
Xk+1
i := proxλϕ i(Xk
i − Xk + (1/N )A − Uk)
Uk+1 := Uk +Xk+1 − (1/N )A,
which is a minor variation on the exchange ADMM algorithm (5. 12).
Each iteration involves evaluating the proximal operator f or each ob-
jective term (independently in parallel), plus some very si mple entry-
wise matrix operations. Some of the proximal operators also involve
entrywise operations ( e.g., soft thresholding) while some may require
computing the singular value decomposition of the argument .
7.2.2 Numerical example
We consider the example problem described above for a few diﬀ erent
sizes of m and n. We generate the data as follows. We chose A =
L +S +V , where L is a rank 4 matrix, S is a sparse matrix, and
V is a dense noise matrix. The matrix L is generated as L = L1L2
with L1 ∈ Rm× 4 and L2 ∈ R4× n, where entries in both L1 and L2
were sampled independently from N (0, 1). The matrix S was generated
with density 0.05, with each nonzero entry sampled uniforml y from
{− 10, 10} . Each entry in V was sampled from N (0, 10− 3).


## Page 86

204 Examples and Applications
We set γ 2 = 0. 15γ max
2 and γ 3 = 0. 15γ max
3 , where γ max
2 is the entry-
wiseℓ ∞ norm ofA andγ max
3 is the spectral norm of A. These values are
the values above which the optimal values of X2 and X3, respectively,
are zero. We take proximal parameter λ = 1.
Table 7.2 gives a summary of the computation required to solv e the
diﬀerent problem instances. The larger instances were solv ed only with
ADMM, since CVX would take too long or fail. Some comments:
• The problem sizes are nontrivial; e.g., the 500 × 1000 instance has
1,500,000 variables and 500,000 equality constraints.
• In all the examples, the diﬀerences between the Xi found by
ADMM and CVX were on the order of 0.01, measured in Frobe-
nius norm. (The stopping tolerances could be tightened if ne eded;
we used a modest tolerance of 10 − 4, as in the previous example.)
• Though not relevant to simply solving the optimization prob lem,
the solutions did well in the small instances and perfectly i n the
larger instances at estimating the rank of L and support of S. For
example, the solution in the 40 × 80 example was perfect (rank 4
in L and X3 and 156 nonzero entries in S and X2).
• In ADMM, the ﬁnal values of X2 andX3 are actually sparse and
low rank, respectively, rather than only approximately so. By
contrast, it is necessary to threshold entries and singular values
of the X2 and X3 provided by CVX, respectively, after the fact.
• The cost of an ADMM iteration is eﬀectively the cost of comput -
ing the (full) SVD of an m × n matrix. In addition, the number
of iterations taken by ADMM does not necessarily increase in m
and n. Thus, one could solve even some huge problems with 50
SVDs, at least to modest precision.
7.3 Multi-period portfolio optimization
Let xt ∈ Rn denote the holdings of a portfolio of n assets at time pe-
riod t, with t = 1,...,T . The entry ( xt)i denotes the amount of asset
i held in period t, considered as a real number, with a negative value


## Page 87

7.3. Multi-period portfolio optimization 205
indicating a short position. (These numbers can represent n umbers of
shares, dollar value of shares, or fractions of a total portf olio.) The
initial portfolio x0 is given. The goal is to ﬁnd x1,...,x T to minimize
two costs: a risk-adjusted negative return and a transaction cost. We
may also include additional constraints, such as a long-only constraint
xt ≥ 0, requiring the ﬁnal position to be zero ( xT = 0), or a normal-
ization or ‘budget’ constraint 1Txt = 1, e.g., when xt represents the
portfolio fractions invested in each asset.
The multi-period portfolio optimization problem is
minimize ∑T
t=1ft(xt) + ∑T
t=1gt(xt − xt− 1), (7.3)
where ft is the risk-adjusted negative return in period t and gt is the
transaction cost function. (The transaction cost term gt(xt − xt− 1) rep-
resents the cost of moving the portfolio to xt from xt− 1.) We assume
thatft andgt are closed proper convex and that gt are fully separable,
i.e., the transaction cost in any period is the sum of the transact ion
costs for each asset. The variables in the multi-period portf olio problem
(7.3) are the sequence of positions x1,...,x T ; the data are x0 and the
functions ft and gt. We let X = [x1 · · ·xT ] ∈ Rn× T denote the matrix
that gives the portfolio sequence.
Inﬁnite values of the ft and gt impose constraints or limits on the
portfolio holdings and the trades, respectively. The stage cost typically
contains a quadratic risk term, a linear term that represent s negative
expected return, and constraints, such as a long-only constr aint.
Consider the splitting
f (X) =
T∑
t=1
ft(xt), g (X) =
T∑
t=1
gt(xt − xt− 1),
i.e., we put the stage costs in one term and the transaction costs i n
the other. The function f is separable across the columns of X and the
functiong is separable across the rows of X (since the functions gt are
fully separable by assumption).
Evaluating the proximal operator of f is done by solving (in paral-
lel) T single-period portfolio optimization problems
minimize ft(xt) + (1/ 2λ )∥xt − vt∥2
2,


## Page 88

206 Examples and Applications
for t = 1,...,T . (The proximal regularization term can be viewed as
an additional quadratic risk and expected return for each as set.)
The proximal operator of g can be found by solving n portfolio
sequence problems in parallel, one for each asset i:
minimize ∑T
t=1
(
gt,i (xt,i − xt− 1,i ) + (1/ 2λ )∥xt,i − vt,i ∥2
2
)
,
with T variables x1,i,...,x T,i . These problems can be interpreted as
optimizing the schedule of buying and selling asset i, trading oﬀ trans-
action cost incurred by the buying and selling with matching a desired
sequence of positions vt,i . These sequence problems can be solved eﬃ-
ciently, in order O(T ) operations, by any method that can exploit the
very speciﬁc structure that each variable xt,i appears in terms with
only its time neighbors xt+1,i and xt− 1,i ; see, e.g., [33, §C.2].
7.3.1 Numerical example
We consider an example with stage cost
ft(u) = − µ Tu+(γ/ 2)uT Σu+I(u ≥ 0)+I(1Txt = 1), t = 1,...,T − 1,
where the ﬁrst term is the negative return, the second is the r isk, and
the third is a long-only constraint. The initial holding is x0 = 0, and
we require that the ﬁnal position is zero, i.e., fT (u) = I(u = 0). The
transaction cost term is
gt(u) = κ T |u|3/ 2, t = 1,...,T.
where the absolute value and 3 / 2-power are taken elementwise and
κ > 0 is a vector of transaction cost coeﬃcients. For simplicity , the
stage cost and transaction cost functions do not depend on t (except
for the ﬁnal portfolio constraint).
We refer to the solution of the static allocation problem
minimize − µ Tx + (γ/ 2)xT Σx
subject to x ≥ 0, 1Tx = 1
asxstatic, the optimal portfolio in the absence of transaction costs. The
solution of the multiperiod portfolio problem will slowly b uild up a
portfolio (so as to avoid excessive transcation costs), hea ding toward


## Page 89

7.3. Multi-period portfolio optimization 207
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
0
0.1
0.2
0.3
0.4
0.5
0.6
0.7
0.8
0.9
Figure 7.2: Time series of ℓ 1 deviation from xstatic.
0 2 4 6 8 10 12 14 16
0
0.05
0.1
0.15
0.2
0.25
0.3
0.35
Figure 7.3: Time series of asset holdings.


## Page 90

208 Examples and Applications
0 5 10 15 20 25 30
−4.04
−4.02
−4
−3.98
−3.96
−3.94
−3.92
−3.9
−3.88
−3.86
Figure 7.4: Convergence to optimality in ﬁnance example.
the optimal static portfolio, and near the end will sell its h oldings over
several periods (again, to avoid excessive transaction cos ts).
The instance we consider has n = 20 assets and T = 15 periods,
for a total of 300 variables. The risk and return data are chos en ran-
domly, and κ is chosen uniformly at random from [0 , 20]n. We use a
risk aversion parameter of γ = 1 and use the ADMM parameter λ = 1.
Figure 7.2 shows ∥x⋆
t − xstatic∥1 versust. It shows that the portfolio
builds up over ﬁrst 4 or 5 periods, holds for around 5 periods w ithin
around 5% of xstatic, and then liquidates over the remaining 5 periods.
Figure 7.3 shows the optimal holdings x⋆
t versust. The solution invests
most in assets with high positive returns (accounting for po ssibly higher
risk levels) and does not invest in negative or low return ass ets. We see
that in some cases, it quickly builds up a position in a certai n asset and
then reduces the position over time; this happens because it wishes to
fully invest as soon as possible, and it chooses to enter posi tions that


## Page 91

7.4. Stochastic optimization 209
are relatively cheap to get into. It then reduces its positio ns in worse
assets over time as it builds up larger positions in better as sets.
This problem instance is very small and our implementation f ocused
on readability, so we do not report detailed timing informat ion; for ref-
erence, we show convergence to the optimal value in Figure 7. 4. This
problem instance, of course, could be easily solved on a sing le machine.
We refer the reader to O’Donoghue et al. [155] for a much more d e-
tailed discussion of using ADMM for problems of this type. Th ey also
include experiments with highly tuned implementations and on very
large problem instances. See Boyd et al. [31] for further dis cussion of
multi-period investment problems.
7.4 Stochastic optimization
The stochastic optimization problem has the form
minimize ∑K
k=1π kf (k)(x),
where π ∈ RK
+ is a probability distribution, i.e., 1Tπ = 1. The su-
perscript k can be interpreted as indexing a scenario, so f (k) is the
closed proper convex objective function for scenario k. Considering the
scenarios as a discrete random variable with distribution π , the prob-
lem is to minimize Ef (s)(x), i.e., to minimize the average objective
value, where the average is taken over the various scenarios that could
possibly occur.
This problem is simply that of minimizing an additive functi on.
Following §5.2, we solve this problem by putting it into cons ensus form:
We replace the variablex with new local variablesx(1),...,x (K), replace
the objective with the separable function
K∑
k=1
π kf (k)(x(k)),
and add a consensus constraint
x(1) = · · · =x(K).
We then apply the consensus ADMM method of §5.2. In each itera tion,
we evaluate the proximal operator of the objective for each s cenario


## Page 92

210 Examples and Applications
(independently in parallel), then average the local soluti ons x(k) for
each scenario together.
7.5 Robust and risk-averse optimization
In robust optimization , we have K scenarios as in stochastic optimiza-
tion, but instead of minimizing the expected value (average ) of the
objective, we minimize the maximum (‘worst-case’) objectiv e:
minimize max k=1,...,K f (k)(x),
with variable x ∈ Rn. This is also called a minimax problem .
A more general form of the problem is
minimize ϕ
(
f (1)(x),...,f (K)(x)
)
, (7.4)
whereϕ is a convex nondecreasing function. This form includes stoc has-
tic optimization (with ϕ (u) = π Tu) and robust optimization (with
ϕ (u) = maxkuk) as special cases. Another interesting case is
ϕ (u) = (1/η ) log (π 1 expηu 1 + · · · +π K expηuK),
which gives risk-averse optimization [198], where η > 0 is a risk aver-
sion parameter and the parameters π k are probabilities. The name can
be justiﬁed by the expansion of ϕ in the parameter η :
ϕ (u) = Eu +η var(u) +o(η ),
where var(u) is the variance of u (under the probabilities π k).
7.5.1 Method
We turn to solving the general form problem (7.4). We put the p roblem
in epigraph form, replicate the variable x and the epigraph variable t,
and add consensus constraints, giving
minimize ϕ (t(1),...,t (k))
subject to f (k)(x(k)) ≤ t(k), k = 1,...,K
x(1) = · · · =x(k).
This problem has (local) variables x(1),...,x (K) and t(1),...,t (K). We
split the problem into two objective terms: the ﬁrst is
ϕ (t(1),...,t (k)) +IC(x(1),...,x (K)),


## Page 93

7.6. Stochastic control 211
where C is the consensus set, and the second is
K∑
k=1
Iepif (k)(x(k),t (k)).
We refer to the ﬁrst term as f and the second as g, as usual, and will
use ADMM to solve the problem.
Evaluating the proximal operator of f splits into two parts that
can be carried out independently in parallel. The ﬁrst is eva luating
proxϕ and the second is evaluating Π C (i.e., averaging). Evaluating
proxϕ when ϕ is the max function (robust optimization) or log-sum-
exp function (risk-averse optimization) is discussed in §6. 4.1 and §6.1.2,
respectively. Evaluating the proximal operator of g splits into K parts
that can be evaluated independently in parallel, each of whi ch involves
projection onto epif (k) (see §6.6.2).
7.6 Stochastic control
In stochastic control, also known as optimization with reco urse, the
task is to make a sequence of decisions x0,...,x T ∈ Rn. In between
successive decisionsxt− 1 andxt, we observe a realization of a (discrete)
random variable ω t ∈ Ω; the ω t are independent random variables with
some known distribution on Ω. The decision xt can depend on the re-
alized values of ω 1,...,ω t but not on the future values ω t+1,...,ω T ;
the ﬁrst decision x0 is made without knowledge of any random out-
comes. The constraints that reﬂect that decisions are made b ased only
on what is known at the time are known as causality constraints or the
information pattern constraint.
A policyϕ 1,...,ϕ T gives the decisions as a function of the outcomes
on which they are allowed to depend:
xt =ϕ t(ω 1,...,ω t), ϕ t : Ωt− 1 → Rn.
(We can think of x0 =ϕ 0, where ϕ 0 is a function with no arguments,
i.e., a constant.) The policies ϕ t are the variables in the stochastic con-
trol problem; they can be (ﬁnitely) represented by giving th eir values
for all values of the random arguments. In other words, ϕ t is represented


## Page 94

212 Examples and Applications
by |Ω|t vectors in Rn. To specify the full policy, we must give
T∑
t=0
|Ω|t = |Ω|T +1 − 1
|Ω| − 1
vectors in Rn. (This is practical only for T small and |Ω| quite small,
say, when the number above is no more than a thousand.)
The objective to be minimized is
Eφ (x0,...,x T,ω 1,...,ω T ),
where φ : RnT +1 × ΩT is closed proper convex in its continuous ar-
guments x0,...,x T for each value of the argument ω 1,...,ω T . The
expectation is over ω 1,...,ω T ; it is a ﬁnite sum with |Ω|T terms, one
for each outcome sequence. The stochastic control problem i s to choose
the policy that minimizes the objective.
The set of all possible outcome sequences, and the policy, is often
shown as a T -depth |Ω|-ary tree. This is shown in Figure 7.5 for a
problem with possible outcomes Ω = {a,b } and T = 3 periods. Each
node is labeled with the outcomes observed up to that point in time.
The single vertex on the left corresponds to t = 0; the next two on
the right correspond to t = 1. Each vertex gives a partial sequence of
the outcomes; the leaves give a full sequence. A policy can be thought
of as assigning a decision vector to each vertex of the tree. A path
from the root to a leaf corresponds to a particular sequence o f realized
outcomes. The objective can be computed by summing the objec tive
value associated with each path, multiplied by its probabili ty.
7.6.1 Method
This problem can be expressed in consensus form by introduci ng a
sequence of decision variables x0,...,x T for each of the |Ω|T outcome
sequences. We then impose the causality constraint by requi ring that
decisions at time t with the same outcomes up to time t be equal.
This is shown in Figure 7.6. Each row is a particular outcome s e-
quence, so the objective (in blue) is separable across the ro ws of vari-
ables. The causality constraints (in orange) are consensus contraints:


## Page 95

7.6. Stochastic control 213
()
(b)
(a)
(b, b)
(b, a)
(a, b)
(a, a)
(b,b, b)
(b,b, a)
(b,a, b)
(b,a, a)
(a,b, b)
(a,b, a)
(a,a, b)
(a,a, a)
Figure 7.5: Tree of outcomes in stochastic control, with |Ω | = 2 possible outcomes
in T = 3 periods. A path from the root to a leaf corresponds to a full sequen ce of
outcomes.
Figure 7.6: Stochastic control problem in consensus form. Each row corre sponds to
an outcome sequence. The cyan boxes show the separable structure of t he objec-
tive. The orange boxes show the consensus constraints imposed by the causality
requirement.


## Page 96

214 Examples and Applications
variables within each group must be equal. Ignoring the caus ality con-
straints gives the prescient solution , which is the best sequence of de-
cisions if the full outcome sequence were known in advance.
Each iteration of ADMM has a natural interpretation and invo lves
two main operations, corresponding to evaluation of the two proximal
operators. Evaluating the proximal operator of the objecti ve involves
solving |Ω|T independent optimization problems, one for each possible
sequence of outcomes. Each of these subproblems ﬁnds someth ing a bit
like a prescient solution for a single outcome sequence ( i.e., a single row
in Figure 7.6), taking into account a regularization term th at prevents
the solution from deviating too much from the previous conse nsus value
(which does respect the causality constraints).
The second step involves a projection onto a consensus set, w hich
enforces the causality constraints by averaging together the components
of the prescient solutions where their corresponding outco me sequences
agree ( i.e., each column of Figure 7.6). In other words, this averaged
resultzk is a valid policy, so we consider the ADMM solution to be zk
rather than xk at termination. We note that the consensus constraints
for each orange group can be enforced independently in paral lel. Even-
tually, we obtain decisions for each possible outcome seque nce that are
consistent with the causality constraints.
7.6.2 Numerical example
We consider a problem with |Ω| = 2 equally probable outcomes over
T = 3 periods with a state in R50. There are 8 possible outcome se-
quences, as shown in Figure 7.5, and we have an associated var iable
xω ∈ Rn(T +1) for each of these outcomes. (We use ω to index the 8
outcome sequences.) Parts of these are constrained to be equ al via the
causality constraints. For example, the ﬁrst half of xaaa andxabb must
be the same: all the xω must agree on the ﬁrst n values and xaaa and
xabb must also agree on the second n values because they both corre-
spond to a scenario that that observes outcome a in the ﬁrst period.
The objective functions for each outcome sequence are piece wise
linear functions, with m = 5 components, plus the constraint that all


## Page 97

7.6. Stochastic control 215
0 5 10 15 20 25
−80
−70
−60
−50
−40
−30
−20
−10
Figure 7.7: In blue, this shows the objective value attained by the it erate zk in
ADMM (which satisﬁes the causality constraints). The higher dashed black line is
the optimal value of the full problem; the lower line is the optimal val ue attained
by the prescient solution.
components of every decision vector are in [ − 1, 1]:
φ ω (u) = max(Aω u +b) +I[− 1, 1](u),
where Aω ∈ Rm× 4n and the max is over the m rows of the argument.
Figure 7.7 shows the objective value attained by the ADMM ite rates
zk (which satisfy the causality constraints) progressing to t he optimal
value. The lower dashed line shows the (obviously superior) objective
value attained by the prescient solution. Though ADMM takes about
50 iterations to terminate, we can see that we are very close t o solving
the problem within 20 iterations.


## Page 98

8
Conclusions
We have discussed proximal operators and proximal algorith ms, and
illustrated their applicability to standard and distribut ed convex op-
timization in general and many applications of recent inter est in par-
ticular. Much like gradient descent and the conjugate gradi ent method
are standard tools of great use when optimizing smooth funct ions se-
rially, proximal algorithms should be viewed as an analogou s tool for
nonsmooth, constrained, and distributed versions of these problems.
Proximal methods sit at a higher level of abstraction than cl assical
optimization algorithms like Newton’s method. In such algo rithms, the
base operations are low-level, consisting of linear algebra operations
and the computation of gradients and Hessians. In proximal a lgorithms,
the base operations include solving small convex optimizat ion problems
(which in some cases can be done via a simple analytical formu la).
Despite proximal algorithms ﬁrst being developed nearly fo rty years
ago, they are surprisingly well-suited both to many modern op timiza-
tion problems, particularly those involving nonsmooth reg ularization
terms, and modern computing systems and distributed comput ing
frameworks. Many problems of substantial current interest in areas
like machine learning, high-dimensional statistics, stati stical signal pro-
216


## Page 99

217
cessing, compressed sensing, and others are often more natu ral to solve
using proximal algorithms rather than converting them to sy mmetric
cone programs and using interior-point methods. Proximal op erators
and proximal algorithms thus comprise an important set of to ols that
we believe should be familiar to everyone working in such ﬁel ds.


## Page 100

Acknowledgements
Neal Parikh was supported by a National Science Foundation G radu-
ate Research Fellowship under Grant No. DGE-0645962. This re search
was also supported by DARPA’s XDATA program under Grant No.
F A8750-12-2-0306.
We would like to thank Eric Chu, A. J. Friend, Thomas Lipp,
Brendan O’Donoghue, Jaehyun Park, Alexandre Passos, Ernes t Ryu,
and Madeleine Udell for many helpful comments and suggestio ns. We
are also very grateful to Heinz Bauschke, Amir Beck, Stephen Becker,
Dmitriy Drusvyatskiy, Mário Figueiredo, Trevor Hastie, Ad rian Lewis,
Percy Liang, Lester Mackey, Ben Recht, Marc Teboulle, and Ro b Tib-
shirani for reading earlier drafts and providing much usefu l feedback.
We thank Heinz Bauschke, Amir Beck, Dmitriy Drusvyatskiy, P ercy
Liang, and Marc Teboulle in particular for very thorough rea dings.
218


## Page 101

References
[1] K. Arrow and G. Debreu, “Existence of an equilibrium for a compet itive
economy,” Econometrica: Journal of the Econometric Society , vol. 22, no. 3,
pp. 265–290, 1954.
[2] K. Arrow, L. Hurwicz, and H. Uzawa, Studies in Linear and Nonlinear Pro-
gramming. Stanford University Press: Stanford, 1958.
[3] H. Attouch, “Convergence de fonctions convexes, de sous-diﬀéren tiels et semi-
groupes,” C.R Acad. Sci. Paris , vol. 284, pp. 539–542, 1977.
[4] F. Bach, R. Jenatton, J. Mairal, and G. Obozinski, “Optimization wit h
sparsity-inducing penalties,” Foundations and Trends in Machine Learning ,
vol. 4, no. 1, pp. 1–106, 2011.
[5] S. Barman, X. Liu, S. Draper, and B. Recht, “Decomposition methods for large
scale LP decoding,” in Allerton Conference on Communication, Control, and
Computing, pp. 253–260, IEEE, 2011.
[6] J. Barzilai and J. Borwein, “Two-point step size gradient methods, ” IMA
Journal of Numerical Analysis , vol. 8, no. 1, pp. 141–148, 1988.
[7] H. Bauschke, Projection Algorithms and Monotone Operators . PhD thesis,
Simon Fraser University, 1996.
[8] H. Bauschke and J. Borwein, “Dykstra’s alternating projection algor ithm for
two sets,” Journal of Approximation Theory , vol. 79, no. 3, pp. 418–443, 1994.
[9] H. Bauschke and J. Borwein, “On projection algorithms for solving con vex
feasibility problems,” SIAM Review , vol. 38, no. 3, pp. 367–426, 1996.
[10] H. Bauschke and P. Combettes, Convex Analysis and Monotone Operator The-
ory in Hilbert Spaces . Springer-Verlag, 2011.
[11] H. Bauschke, P. Combettes, and D. Noll, “Joint minimization with al ternat-
ing Bregman proximity operators,” Paciﬁc Journal on Mathematics , vol. 2,
pp. 401–424, 2006.
219


## Page 102

220 References
[12] H. Bauschke, R. Goebel, Y. Lucet, and X. Wang, “The proximal aver age: basic
theory,” SIAM Journal on Optimization , vol. 19, no. 2, pp. 766–785, 2008.
[13] H. Bauschke and V. Koch, “Projection methods: Swiss army knive s for solv-
ing feasibility and best approximation problems with halfspaces,” 2013. See
arXiv:1301.4506v1.
[14] H. Bauschke and S. Krug, “Reﬂection-projection method for convex feasibility
problems with an obtuse cone,” Journal of Optimization Theory and Applica-
tions, vol. 120, no. 3, pp. 503–531, 2004.
[15] H. Bauschke, S. Moﬀat, and X. Wang, “Firmly nonexpansive mappings and
maximally monotone operators: correspondence and duality,” Set-Valued and
Variational Analysis, pp. 1–23, 2012.
[16] A. Beck and M. Teboulle, “Mirror descent and nonlinear projected subgradient
methods for convex optimization,” Operations Research Letters, vol. 31, no. 3,
pp. 167–175, 2003.
[17] A. Beck and M. Teboulle, “A fast iterative shrinkage-thresholdin g algorithm
for linear inverse problems,” SIAM Journal on Imaging Sciences , vol. 2, no. 1,
pp. 183–202, 2009.
[18] A. Beck and M. Teboulle, “Gradient-based algorithms with applicati ons to
signal recovery problems,” in Convex Optimization in Signal Processing and
Communications, (D. Palomar and Y. Eldar, eds.), pp. 42–88, Cambribge
University Press, 2010.
[19] A. Beck and M. Teboulle, “Smoothing and ﬁrst order methods: A uni ﬁed
framework,” SIAM Journal on Optimization , vol. 22, no. 2, pp. 557–580, 2012.
[20] S. Becker, J. Bobin, and E. Candès, “NESTA: A fast and accurate ﬁrst -order
method for sparse recovery,” SIAM Journal on Imaging Sciences , vol. 4, no. 1,
pp. 1–39, 2011.
[21] S. Becker and M. Fadili, “A quasi-Newton proximal splitting met hod,” Ad-
vances in Neural Information Processing Systems , 2012.
[22] S. Becker, E. Candès, and M. Grant, “Templates for convex cone probl ems
with applications to sparse signal recovery,” Mathematical Programming Com-
putation, pp. 1–54, 2011.
[23] J. Benders, “Partitioning procedures for solving mixed-variab les programming
problems,” Numerische Mathematik , vol. 4, pp. 238–252, 1962.
[24] D. Bertsekas, “Multiplier methods: A survey,” Automatica, vol. 12, pp. 133–
145, 1976.
[25] D. Bertsekas, Constrained Optimization and Lagrange Multiplier Methods .
Academic Press, 1982.
[26] D. Bertsekas, Nonlinear Programming. Athena Scientiﬁc, second ed., 1999.
[27] D. Bertsekas and J. Tsitsiklis, Parallel and Distributed Computation: Numer-
ical Methods. Prentice Hall, 1989.
[28] J. Bioucas-Dias and M. Figueiredo, “A new TwIST: two-step iterativ e shrink-
age/thresholding algorithms for image restoration,” IEEE Transactions on
Image Processing, vol. 16, no. 12, pp. 2992–3004, 2007.


## Page 103

References 221
[29] L. Blackford, J. Choi, A. Cleary, E. D’Azevedo, J. Demmel, I. Dhi llon, J. Don-
garra, S. Hammarling, G. Henry, A. Petitet, K. Stanley, D. Walker, and
R. Whaley, ScaLAPACK user’s guide . SIAM: Philadelphia, 1997.
[30] J. Bonnans, J. Gilbert, C. Lemaréchal, and C. Sagastizábal, “A family of
variable metric proximal methods,” Mathematical Programming, vol. 68, no. 1,
pp. 15–47, 1995.
[31] S. Boyd, M. Mueller, B. O’Donoghue, and Y. Wang, “Performance bounds
and suboptimal policies for multi-period investment,” 2013. To appear i n
Foundations and Trends in Optimization .
[32] S. Boyd, N. Parikh, E. Chu, B. Peleato, and J. Eckstein, “Distri buted opti-
mization and statistical learning via the alternating direction meth od of multi-
pliers,” Foundations and Trends in Machine Learning , vol. 3, no. 1, pp. 1–122,
2011.
[33] S. Boyd and L. Vandenberghe, Convex Optimization . Cambridge University
Press, 2004.
[34] S. Boyd and L. Vandenberghe, “Localization and cutting-plane metho ds,”
2007. From Stanford EE 364b lecture notes.
[35] K. Bredies and D. Lorenz, “Linear convergence of iterative soft-th resholding,”
Journal of Fourier Analysis and Applications , vol. 14, no. 5-6, pp. 813–837,
2008.
[36] L. Bregman, “The relaxation method of ﬁnding the common point of convex
sets and its application to the solution of problems in convex programming, ”
USSR Computational Mathematics and Mathematical Physics , vol. 7, no. 3,
pp. 200–217, 1967.
[37] H. Brezis, Opérateurs Maximaux Monotones et Semi-Groupes de Contractions
dans les Espaces de Hilbert . North-Holland: Amsterdam, 1973.
[38] F. Browder, “Multi-valued monotone nonlinear mappings and duality m ap-
pings in Banach spaces,” Transactions of the American Mathematical Society ,
vol. 118, pp. 338–351, 1965.
[39] F. Browder, “Nonlinear monotone operators and convex sets in Banach
spaces,” Bull. Amer. Math. Soc , vol. 71, no. 5, pp. 780–785, 1965.
[40] F. Browder, “Convergence theorems for sequences of nonlinear oper ators in
Banach spaces,” Mathematische Zeitschrift , vol. 100, no. 3, pp. 201–225, 1967.
[41] F. Browder, “Nonlinear maximal monotone operators in Banach space,” Math-
ematische Annalen , vol. 175, no. 2, pp. 89–113, 1968.
[42] R. Bruck, “An iterative solution of a variational inequality for cert ain mono-
tone operator in a Hilbert space,” Bulletin of the American Mathematical
Society, vol. 81, no. 5, pp. 890–892, 1975.
[43] A. Bruckstein, D. Donoho, and M. Elad, “From sparse solutions of syste ms of
equations to sparse modeling of signals and images,” SIAM Review , vol. 51,
no. 1, pp. 34–81, 2009.
[44] R. Burachik and A. Iusem, Set-Valued Mappings and Enlargements of Mono-
tone Operators. Springer, 2008.


## Page 104

222 References
[45] J. Cai, E. Candès, and Z. Shen, “A singular value thresholding algorit hm for
matrix completion,” SIAM Journal on Optimization , vol. 20, no. 4, pp. 1956–
1982, 2010.
[46] E. Candès, X. Li, Y. Ma, and J. Wright, “Robust principal component an al-
ysis?,” 2009. See arXiv:0912.3599.
[47] E. Candès, C. Sing-Long, and J. Trzasko, “Unbiased risk estimates for singular
value thresholding and spectral estimators,” 2012. See arXiv:1210.4139.
[48] E. Candès and M. Soltanolkotabi, “Discussion of ‘latent variable graphic al
model selection via convex optimization’,” Annals of Statistics , pp. 1997–2004,
2012.
[49] Y. Censor and S. Zenios, “Proximal minimization algorithm with D-
functions,” Journal of Optimization Theory and Applications , vol. 73, no. 3,
pp. 451–464, 1992.
[50] Y. Censor and S. Zenios, Parallel Optimization: Theory, Algorithms, and Ap-
plications. Oxford University Press, 1997.
[51] V. Chandrasekaran, P. Parrilo, and A. Willsky, “Latent variable graphi cal
model selection via convex optimization,” Annals of Statistics (with discus-
sion), 2012.
[52] V. Chandrasekaran, S. Sanghavi, P. Parrilo, and A. Willsky, “Sparse an d low-
rank matrix decompositions,” in Allerton 2009 , pp. 962–967, IEEE, 2009.
[53] V. Chandrasekaran, S. Sanghavi, P. Parrilo, and A. Willsky, “Rank-sp arsity
incoherence for matrix decomposition,” SIAM Journal on Optimization ,
vol. 21, no. 2, pp. 572–596, 2011.
[54] G. Chen, Forward-backward splitting techniques: theory and applicati ons. PhD
thesis, University of Washington, 1994.
[55] G. Chen and R. Rockafellar, “Convergence rates in forward-backward s plit-
ting,” SIAM Journal on Optimization , vol. 7, no. 2, pp. 421–444, 1997.
[56] S. Chen, D. Donoho, and M. Saunders, “Atomic decomposition by basis pu r-
suit,” SIAM Review , vol. 43, no. 1, pp. 129–159, 2001.
[57] G. Chierchia, N. Pustelnik, J.-C. Pesquet, and B. Pesquet-P opescu, “Epi-
graphical projection and proximal tools for solving constrained convex op ti-
mization problems: Part i,” 2012. See arXiv:1210.5844.
[58] P. Combettes and J.-C. Pesquet, “Proximal thresholding algorith m for min-
imization over orthonormal bases,” SIAM Journal on Optimization , vol. 18,
no. 4, pp. 1351–1376, 2007.
[59] P. Combettes, “Solving monotone inclusions via compositions of nonex pansive
averaged operators,” Optimization, vol. 53, no. 5-6, 2004.
[60] P. Combettes and J.-C. Pesquet, “A Douglas-Rachford splitting app roach to
nonsmooth convex variational signal recovery,” IEEE Journal on Selected Top-
ics in Signal Processing , vol. 1, no. 4, pp. 564–574, 2007.
[61] P. Combettes and J.-C. Pesquet, “Proximal splitting methods in signal pro-
cessing,” Fixed-Point Algorithms for Inverse Problems in Science and Engi-
neering, pp. 185–212, 2011.


## Page 105

References 223
[62] P. Combettes and V. Wajs, “Signal recovery by proximal forward-bac kward
splitting,” Multiscale Modeling and Simulation , vol. 4, no. 4, pp. 1168–1200,
2006.
[63] A. Daniilidis, D. Drusvyatskiy, and A. Lewis, “Orthogonal invarian ce and
identiﬁability,” 2013. arXiv:1304.1198.
[64] A. Daniilidis, A. Lewis, J. Malick, and H. Sendov, “Prox-regul arity of spec-
tral functions and spectral sets,” Journal of Convex Analysis , vol. 15, no. 3,
pp. 547–560, 2008.
[65] A. Daniilidis, J. Malick, and H. Sendov, “Locally symmetric su bmanifolds lift
to spectral manifolds,” 2012. arXiv:1212.3936.
[66] G. Dantzig and P. Wolfe, “Decomposition principle for linear programs ,” Op-
erations Research, vol. 8, pp. 101–111, 1960.
[67] I. Daubechies, M. Defrise, and C. D. Mol, “An iterative threshol ding algorithm
for linear inverse problems with a sparsity constraint,” Communications on
Pure and Applied Mathematics , vol. 57, pp. 1413–1457, 2004.
[68] C. Davis, “All convex invariant functions of Hermitian matrices, ” Archiv der
Mathematik, vol. 8, no. 4, pp. 276–278, 1957.
[69] C. Deledalle, S. Vaiter, G. Peyré, J. Fadili, and C. Dossal, “Risk estimation
for matrix recovery with spectral regularization,” 2012. See arXiv:1205.1482.
[70] J. Demmel, M. Heath, and H. Van Der Vorst, Parallel numerical linear algebra.
Computer Science Division (EECS), University of California, 1993.
[71] A. Dempster, “Covariance selection,” Biometrics, vol. 28, no. 1, pp. 157–175,
1972.
[72] N. Derbinsky, J. Bento, V. Elser, and J. Yedidia, “An improved three-weight
message-passing algorithm,” arXiv:1305.1961, 2013.
[73] C. Do, Q. Le, and C. Foo, “Proximal regularization for online and batch
learning,” in International Conference on Machine Learning , pp. 257–264,
2009.
[74] D. Donoho, “De-noising by soft-thresholding,” IEEE Transactions on Infor-
mation Theory , vol. 41, pp. 613–627, 1995.
[75] J. Douglas and H. Rachford, “On the numerical solution of heat conduction
problems in two and three space variables,” Transactions of the American
Mathematical Society, vol. 82, pp. 421–439, 1956.
[76] J. Duchi, S. Shalev-Shwartz, Y. Singer, and T. Chandra, “Eﬃcient projections
onto the ℓ 1-ball for learning in high dimensions,” in Proceedings of the 25th
International Conference on Machine learning , pp. 272–279, 2008.
[77] R. Dykstra, “An algorithm for restricted least squares regression, ” Journal of
the American Statistical Association , vol. 78, no. 384, pp. 837–842, 1983.
[78] J. Eckstein, Splitting methods for monotone operators with applications to
parallel optimization . PhD thesis, MIT, 1989.
[79] J. Eckstein, “Nonlinear proximal point algorithms using Bregman fu nctions,
with applications to convex programming,” Mathematics of Operations Re-
search, pp. 202–226, 1993.


## Page 106

224 References
[80] E. Esser, X. Zhang, and T. Chan, “A general framework for a class of ﬁrst or der
primal-dual algorithms for convex optimization in imaging science,” SIAM
Journal on Imaging Sciences , vol. 3, no. 4, pp. 1015–1046, 2010.
[81] F. Facchinei and J. Pang, Finite-Dimensional Variational Inequalities and
Complementarity Problems . Springer-Verlag, 2003.
[82] M. Ferris, “Finite termination of the proximal point algorithm,” Mathematical
Programming, vol. 50, no. 1, pp. 359–366, 1991.
[83] M. Figueiredo, J. Bioucas-Dias, and R. Nowak, “Majorization–minimiz ation
algorithms for wavelet-based image restoration,” IEEE Transactions on Image
Processing, vol. 16, no. 12, pp. 2980–2991, 2007.
[84] M. Figueiredo and R. Nowak, “An EM algorithm for wavelet-based image
restoration,” IEEE Transactions on Image Processing , vol. 12, no. 8, pp. 906–
916, 2003.
[85] M. Figueiredo and R. Nowak, “A bound optimization approach to wavelet -
based image deconvolution,” in IEEE International Conference on Image Pro-
cessing, pp. II–782, IEEE, 2005.
[86] G. Franklin, J. Powell, and A. Emami-Naeini, Feedback Control of Dynamic
Systems. Vol. 3, Addison-Wesley: Reading, MA, 1994.
[87] S. Friedland, “Convex spectral functions,” Linear and Multilinear Algebra ,
vol. 9, no. 4, pp. 299–316, 1981.
[88] M. Fukushima and H. Mine, “A generalized proximal point algorithm f or
certain non-convex minimization problems,” International Journal of Systems
Science, vol. 12, no. 8, pp. 989–1000, 1981.
[89] M. Fukushima and L. Qi, “A globally and superlinearly convergent algor ithm
for nonsmooth convex minimization,” SIAM Journal on Optimization , vol. 6,
no. 4, pp. 1106–1120, 1996.
[90] D. Gabay, “Applications of the method of multipliers to variational inequal-
ities,” in Augmented Lagrangian Methods: Applications to the Solution of
Boundary-Value Problems, (M. Fortin and R. Glowinski, eds.), North-Holland:
Amsterdam, 1983.
[91] D. Gabay and B. Mercier, “A dual algorithm for the solution of nonlinear v ari-
ational problems via ﬁnite element approximations,” Computers and Mathe-
matics with Applications , vol. 2, pp. 17–40, 1976.
[92] K. Gallivan, R. Plemmons, and A. Sameh, “Parallel algorithms for dense linear
algebra computations,” SIAM Review , pp. 54–135, 1990.
[93] A. Geoﬀrion, “Generalized Benders decomposition,” Journal of Optimization
Theory and Applications , vol. 10, no. 4, pp. 237–260, 1972.
[94] R. Glowinski and A. Marrocco, “Sur l’approximation, par elements ﬁnis
d’ordre un, et la resolution, par penalisation-dualité, d’une classe de problems
de Dirichlet non lineares,” Revue Française d’Automatique, Informatique, et
Recherche Opérationelle, vol. 9, pp. 41–76, 1975.
[95] D. Goldfarb and K. Scheinberg, “Fast ﬁrst-order methods for composi te con-
vex optimization with line search,” preprint, 2011.


## Page 107

References 225
[96] G. Golub and J. Wilkinson, “Note on the iterative reﬁnement of least squares
solution,” Numerische Mathematik , vol. 9, no. 2, pp. 139–148, 1966.
[97] A. Granas and J. Dugundji, Fixed Point Theory . Springer, 2003.
[98] M. Grant, S. Boyd, and Y. Ye, “CVX: Matlab software for dis-
ciplined convex programming, ver. 1.1, build 630,” A vailable at
www.stanford.edu/~boyd/cvx/, Apr. 2008.
[99] S. Grotzinger and C. Witzgall, “Projections onto order simplexes, ” Applied
Mathematics and Optimization , vol. 12, no. 1, pp. 247–270, 1984.
[100] O. Güler, “On the convergence of the proximal point algorithm for conv ex
minimization,” SIAM Journal on Control and Optimization , vol. 29, p. 403,
1991.
[101] O. Güler, “New proximal point algorithms for convex minimization,” SIAM
Journal on Optimization , vol. 2, p. 649, 1992.
[102] E. Hale, W. Yin, and Y. Zhang, “Fixed-point continuation for ℓ 1-minimization:
Methodology and convergence,” SIAM Journal on Optimization , vol. 19, no. 3,
pp. 1107–1130, 2008.
[103] P. Harker and J. Pang, “Finite-dimensional variational inequality and nonlin-
ear complementarity problems: A survey of theory, algorithms and applic a-
tions,” Mathematical Programming, vol. 48, no. 1, pp. 161–220, 1990.
[104] B. He and X. Yuan, “On the O(1/n ) convergence rate of the Douglas-Rachford
alternating direction method,” SIAM Journal on Numerical Analysis , vol. 50,
no. 2, pp. 700–709, 2012.
[105] P. Huber, “Robust estimation of a location parameter,” Annals of Mathemat-
ical Statistics , vol. 35, no. 1, pp. 73–101, 1964.
[106] D. Hunter and K. Lange, “A tutorial on MM algorithms,” The American
Statistician, vol. 58, no. 1, pp. 30–37, 2004.
[107] S. Ibaraki, M. Fukushima, and T. Ibaraki, “Primal-dual proximal poin t algo-
rithm for linearly constrained convex programming problems,” Computational
Optimization and Applications , vol. 1, no. 2, pp. 207–226, 1992.
[108] A. Iusem, “Augmented Lagrangian methods and proximal point methods for
convex optimization,” Investigación Operativa, vol. 8, pp. 11–49, 1999.
[109] R. Jenatton, J. Mairal, G. Obozinski, and F. Bach, “Proximal method s for
hierarchical sparse coding,” 2010. See arXiv:1009.2139.
[110] R. Jenatton, J. Mairal, G. Obozinski, and F. Bach, “Proximal method s for
sparse hierarchical dictionary learning,” in International Conference on Ma-
chine Learning, 2010.
[111] R. Kachurovskii, “Monotone operators and convex functionals,” Uspekhi
Matematicheskikh Nauk , vol. 15, no. 4, pp. 213–215, 1960.
[112] R. Kachurovskii, “Non-linear monotone operators in Banach spaces,” Russian
Mathematical Surveys , vol. 23, no. 2, pp. 117–165, 1968.
[113] A. Kaplan and R. Tichatschke, “Proximal point methods and nonconvex op-
timization,” Journal of Global Optimization , vol. 13, no. 4, pp. 389–406, 1998.


## Page 108

226 References
[114] S.-J. Kim, K. Koh, S. Boyd, and D. Gorinevsky, “ ℓ 1 trend ﬁltering,” SIAM
Review, vol. 51, no. 2, pp. 339–360, 2009.
[115] B. Kort and D. Bertsekas, “Multiplier methods for convex programmi ng,” in
IEEE Conference on Decision and Control , 1973.
[116] M. Kraning, E. Chu, J. Lavaei, and S. Boyd, “Message passing for dynam ic
network energy management,” 2012. To appear.
[117] M. Kyono and M. Fukushima, “Nonlinear proximal decomposition metho d
for convex programming,” Journal of Optimization Theory and Applications ,
vol. 106, no. 2, pp. 357–372, 2000.
[118] L. Lasdon, Optimization Theory for Large Systems . MacMillan, 1970.
[119] J. Lee, B. Recht, R. Salakhutdinov, N. Srebro, and J. Tropp, “Prac tical large-
scale optimization for max-norm regularization,” Advances in Neural Infor-
mation Processing Systems , vol. 23, pp. 1297–1305, 2010.
[120] B. Lemaire, “Coupling optimization methods and variational convergen ce,”
Trends in Mathematical Optimization, International Series of Num erical
Mathematics, vol. 84, 1988.
[121] B. Lemaire, “The proximal algorithm,” International Series of Numerical
Mathematics, pp. 73–87, 1989.
[122] C. Lemaréchal and C. Sagastizábal, “Practical aspects of the Moreau-Yosid a
regularization I: theoretical properties,” 1994. INRIA Technical Report 2250.
[123] C. Lemaréchal and C. Sagastizábal, “Practical aspects of the Moreau–Yosida
regularization: Theoretical preliminaries,” SIAM Journal on Optimization ,
vol. 7, no. 2, pp. 367–385, 1997.
[124] K. Levenberg, “A method for the solution of certain problems in leas t squares,”
Quarterly of Applied Mathematics , vol. 2, pp. 164–168, 1944.
[125] A. Lewis, “The convex analysis of unitarily invariant matrix funct ions,” Jour-
nal of Convex Analysis , vol. 2, no. 1, pp. 173–183, 1995.
[126] A. Lewis, “Convex analysis on the Hermitian matrices,” SIAM Journal on
Optimization, vol. 6, no. 1, pp. 164–177, 1996.
[127] A. Lewis, “Derivatives of spectral functions,” Mathematics of Operations Re-
search, vol. 21, no. 3, pp. 576–588, 1996.
[128] A. Lewis and J. Malick, “Alternating projections on manifolds,” Mathematics
of Operations Research, vol. 33, no. 1, pp. 216–234, 2008.
[129] P. Lions and B. Mercier, “Splitting algorithms for the sum of two non linear
operators,” SIAM Journal on Numerical Analysis , vol. 16, pp. 964–979, 1979.
[130] F. Luque, “Asymptotic convergence analysis of the proximal point al gorithm,”
SIAM Journal on Control and Optimization , vol. 22, no. 2, pp. 277–293, 1984.
[131] S. Ma, L. Xue, and H. Zou, “Alternating direction methods for laten t variable
gaussian graphical model selection,” 2012. See arXiv:1206.1275.
[132] S. Ma, L. Xue, and H. Zou, “Alternating direction methods for laten t variable
Gaussian graphical model selection,” Neural Computation , pp. 1–27, 2013.


## Page 109

References 227
[133] W. Mann, “Mean value methods in iteration,” Proceedings of the American
Mathematical Society, vol. 4, no. 3, pp. 506–510, 1953.
[134] D. Marquardt, “An algorithm for least-squares estimation of nonlinear p aram-
eters,” Journal of the Society for Industrial and Applied Mathematics , vol. 11,
no. 2, pp. 431–441, 1963.
[135] B. Martinet, “Régularisation d’inéquations variationnelles par appr oximations
successives,” Revue Française de Informatique et Recherche Opérationelle ,
1970.
[136] B. Martinet, “Détermination approchée d’un point ﬁxe d’une appl ication
pseudo-contractante,” C.R. Acad. Sci. Paris , vol. 274A, pp. 163–165, 1972.
[137] J. Mattingley and S. Boyd, “CVXGEN: A code generator for embedded c onvex
optimization,” Optimization and Engineering , pp. 1–27, 2012.
[138] N. Meinshausen and P.Bühlmann, “High-dimensional graphs and variabl e se-
lection with the lasso,” Annals of Statistics , vol. 34, no. 3, pp. 1436–1462,
2006.
[139] G. Minty, “Monotone (nonlinear) operators in Hilbert space,” Duke Mathe-
matical Journal , vol. 29, no. 3, pp. 341–346, 1962.
[140] G. Minty, “On the monotonicity of the gradient of a convex function,” Paciﬁc
J. Math , vol. 14, no. 1, pp. 243–247, 1964.
[141] C. Moler, “Iterative reﬁnement in ﬂoating point,” Journal of the ACM
(JACM), vol. 14, no. 2, pp. 316–321, 1967.
[142] J.-J. Moreau, “Fonctions convexes duales et points proximaux dans u n espace
Hilbertien,” Reports of the Paris Academy of Sciences, Series A , vol. 255,
pp. 2897–2899, 1962.
[143] J.-J. Moreau, “Proximité et dualité dans un espace Hilbertien, ” Bull. Soc.
Math. France, vol. 93, no. 2, pp. 273–299, 1965.
[144] A. Nedić and A. Ozdaglar, “Distributed subgradient methods for mu lti-
agent optimization,” IEEE Transactions on Automatic Control , vol. 54, no. 1,
pp. 48–61, 2009.
[145] A. Nedić and A. Ozdaglar, “Cooperative distributed multi-agent opt imiza-
tion,” in Convex Optimization in Signal Processing and Communications ,
(D. Palomar and Y. Eldar, eds.), Cambridge University Press, 2010.
[146] A. Németh and S. Németh, “How to project onto an isotone projecti on cone,”
Linear Algebra and its Applications , vol. 433, no. 1, pp. 41–51, 2010.
[147] A. Nemirovsky and D. Yudin, Problem Complexity and Method Eﬃciency in
Optimization. Wiley, 1983.
[148] Y. Nesterov, “A method of solving a convex programming problem wit h con-
vergence rate O(1/k 2),” Soviet Mathematics Doklady , vol. 27, no. 2, pp. 372–
376, 1983.
[149] Y. Nesterov, Introductory Lectures on Convex Optimization: A Basic Course .
Springer, 2004.
[150] Y. Nesterov, “Smooth minimization of non-smooth functions,” Mathematical
Programming, vol. 103, no. 1, pp. 127–152, 2005.


## Page 110

228 References
[151] Y. Nesterov, “Gradient methods for minimizing composite objec tive function,”
CORE Discussion Paper, Catholic University of Louvain , vol. 76, p. 2007,
2007.
[152] J. Neto, O. Ferreira, A. Iusem, and R. Monteiro, “Dual convergence of the
proximal point method with Bregman distances for linear programming,” Op-
timization Methods and Software , pp. 1–23, 2007.
[153] J. Nocedal and S. Wright, Numerical Optimization . Springer-Verlag, 1999.
[154] B. O’Donoghue and E. Candès, “Adaptive restart for accelerated gradien t
schemes,” 2012. See arXiv:1204.3982.
[155] B. O’Donoghue, G. Stathopoulos, and S. Boyd, “A splitting method for op-
timal control,” 2012. To appear in IEEE Transactions on Control Systems
Technology.
[156] H. Ohlsson, L. Ljung, and S. Boyd, “Segmentation of ARX-models usi ng sum-
of-norms regularization,” Automatica, vol. 46, no. 6, pp. 1107–1111, 2010.
[157] H. Ouyang, N. He, and A. Gray, “Stochastic ADMM for nonsmooth optimi za-
tion,” 2012. See arXiv:1211.0632.
[158] N. Parikh and S. Boyd, “Block splitting for distributed optimi zation,” 2012.
Submitted.
[159] G. Passty, “Ergodic convergence to a zero of the sum of monotone operator s
in Hilbert space,” Journal of Mathematical Analysis and Applications , vol. 72,
no. 2, pp. 383–390, 1979.
[160] J. Penot, “Proximal mappings,” Journal of Approximation Theory , vol. 94,
no. 2, pp. 203–221, 1998.
[161] R. Poliquin and R. Rockafellar, “Prox-regular functions in variati onal anal-
ysis,” Transactions of the American Mathematical Society , vol. 348, no. 5,
pp. 1805–1838, 1996.
[162] B. Polyak, Introduction to Optimization . Optimization Software, Inc., 1987.
[163] B. Polyak, “Iterative methods using Lagrange multipliers for solvi ng extremal
problems with constraints of the equation type,” USSR Computational Math-
ematics and Mathematical Physics , vol. 10, no. 5, pp. 42–52, 1970.
[164] R. Polyak and M. Teboulle, “Nonlinear rescaling and proximal-like m ethods in
convex optimization,” Mathematical Programming, vol. 76, no. 2, pp. 265–284,
1997.
[165] N. Pustelnik, C. Chaux, and J.-C. Pesquet, “Parallel proximal al gorithm for
image restoration using hybrid regularization,” IEEE Transactions on Image
Processing, vol. 20, no. 9, pp. 2450–2462, 2011.
[166] N. Pustelnik, J.-C. Pesquet, and C. Chaux, “Relaxing tight fram e condition
in parallel proximal methods for signal restoration,” IEEE Transactions on
Signal Processing, vol. 60, no. 2, pp. 968–973, 2012.
[167] A. Quattoni, X. Carreras, M. Collins, and T. Darrell, “An eﬃcient p rojec-
tion for ℓ 1, ∞ regularization,” in Proceedings of the 26th Annual International
Conference on Machine Learning , pp. 857–864, 2009.


## Page 111

References 229
[168] P. Ravikumar, A. Agarwal, and M. Wainwright, “Message-passing for graph -
structured linear programs: Proximal methods and rounding schemes ,” Jour-
nal of Machine Learning Research , vol. 11, pp. 1043–1080, 2010.
[169] R. Rockafellar, Convex Analysis . Princeton University Press, 1970.
[170] R. Rockafellar, “On the maximal monotonicity of subdiﬀerential mapp ings,”
Paciﬁc J. Math. , vol. 33, no. 1, pp. 209–216, 1970.
[171] R. Rockafellar, “On the maximality of sums of nonlinear monotone operator s,”
Transactions of the American Mathematical Society , vol. 149, no. 1, pp. 75–88,
1970.
[172] R. Rockafellar, “A dual approach to solving nonlinear programming probl ems
by unconstrained optimization,” Mathematical Programming, vol. 5, no. 1,
pp. 354–373, 1973.
[173] R. Rockafellar, “Augmented Lagrangians and applications of the proximal
point algorithm in convex programming,” Mathematics of Operations Re-
search, vol. 1, pp. 97–116, 1976.
[174] R. Rockafellar, “Monotone operators and the proximal point algorithm,”
SIAM Journal on Control and Optimization , vol. 14, p. 877, 1976.
[175] R. Rockafellar and R. J.-B. Wets, Variational Analysis. Springer-Verlag, 1998.
[176] J. Saunderson, V. Chandrasekaran, P. Parrilo, and A. Willsky, “Diagonal and
low-rank matrix decompositions, correlation matrices, and ellipsoid ﬁ tting,”
2012. See arXiv:1204.1220.
[177] K. Scheinberg and D. Goldfarb, “Fast ﬁrst-order methods for compos ite con-
vex optimization with large steps,” 2012. A vailable online.
[178] K. Scheinberg, S. Ma, and D. Goldfarb, “Sparse inverse covariance s election
via alternating linearization methods,” in Advances in Neural Information
Processing Systems, 2010.
[179] H. Sendov, “The higher-order derivatives of spectral functions ,” Linear Alge-
bra and its Applications , vol. 424, no. 1, pp. 240–281, 2007.
[180] S. Sra, “Fast projections onto ℓ 1,q -norm balls for grouped feature selection,”
Machine Learning and Knowledge Discovery in Databases , pp. 305–317, 2011.
[181] M. Teboulle, “Entropic proximal mappings with applications to nonl inear pro-
gramming,” Mathematics of Operations Research , pp. 670–690, 1992.
[182] R. Tibshirani, “Regression shrinkage and selection via the lasso,” Journal of
the Royal Statistical Society, Series B , vol. 58, no. 1, pp. 267–288, 1996.
[183] K. Toh and S. Yun, “An accelerated proximal gradient algorithm for nucl ear
norm regularized least squares problems,” Preprint, 2009.
[184] P. Tseng, “Further applications of a splitting algorithm to decompos ition in
variational inequalities and convex programming,” Mathematical Program-
ming, vol. 48, no. 1, pp. 249–263, 1990.
[185] P. Tseng, “Applications of a splitting algorithm to decomposition in convex
programming and variational inequalities.,” SIAM Journal on Control and
Optimization, vol. 29, no. 1, pp. 119–138, 1991.


## Page 112

230 References
[186] P. Tseng, “Alternating projection-proximal methods for convex programming
and variational inequalities,” SIAM Journal on Optimization , vol. 7, pp. 951–
965, 1997.
[187] P. Tseng, “A modiﬁed forward-backward splitting method for maxim al mono-
tone mappings,” SIAM Journal on Control and Optimization , vol. 38, p. 431,
2000.
[188] P. Tseng, “On accelerated proximal gradient methods for convex-con cave op-
timization,” SIAM Journal on Optimization , 2008.
[189] J. Tsitsiklis, Problems in decentralized decision making and computation . PhD
thesis, Massachusetts Institute of Technology, 1984.
[190] H. Uzawa, “Market mechanisms and mathematical programming,” Economet-
rica: Journal of the Econometric Society , vol. 28, no. 4, pp. 872–881, 1960.
[191] H. Uzawa, “Walras’ tâtonnement in the theory of exchange,” The Review of
Economic Studies , vol. 27, no. 3, pp. 182–194, 1960.
[192] L. Vandenberghe, “Fast proximal gradient methods,” 2010. From
http://www.ee.ucla.edu/~vandenbe/236C/lectures/fgrad.pdf.
[193] L. Vandenberghe, “Lecture on proximal gradient method,” 2010. From
http://www.ee.ucla.edu/~vandenbe/shortcourses/dtu-10/lecture3.pdf.
[194] L. Vandenberghe, “Optimization methods for large-scale systems, ” 2010.
UCLA EE 236C lecture notes.
[195] J. von Neumann, “Some matrix inequalities and metrization of matrix s pace,”
Tomsk University Review , vol. 1, pp. 286–300, 1937.
[196] J. von Neumann, Functional Operators, Volume 2: The Geometry of Orthogo-
nal Spaces. Princeton University Press: Annals of Mathematics Studies, 1950.
Reprint of 1933 lecture notes.
[197] Z. Wen, D. Goldfarb, and W. Yin, “Alternating direction augmented La-
grangian methods for semideﬁnite programming,” Tech. Rep., Departmen t
of IEOR, Columbia University, 2009.
[198] P. Whittle, Risk-sensitive Optimal Control . Wiley, 1990.
[199] S. Wright, R. Nowak, and M. Figueiredo, “Sparse reconstruction by s epara-
ble approximation,” IEEE Transactions on Signal Processing , vol. 57, no. 7,
pp. 2479–2493, 2009.
[200] K. Yosida, Functional Analysis. Springer, 1968.
[201] M. Yuan and Y. Lin, “Model selection and estimation in regression wi th
grouped variables,” Journal of the Royal Statistical Society: Series B (Sta-
tistical Methodology), vol. 68, no. 1, pp. 49–67, 2006.
[202] E. Zarantonello, Solving functional equations by contractive averaging . Math-
ematics Research Center, United States Army, University of Wisc onsin, 1960.
[203] E. Zarantonello, “Projections on convex sets in Hilbert space and sp ectral the-
ory. I. Projections on convex sets,” in Contributions to Nonlinear Functional
Analysis (Proceedings of a Symposium held at the Mathematics Re search Cen-
ter, University of Wisconsin, Madison, Wis., 1971) , pp. 237–341, 1971.


## Page 113

References 231
[204] X. Zhang, M. Burger, X. Bresson, and S. Osher, “Bregmanized nonlocal reg-
ularization for deconvolution and sparse reconstruction,” SIAM Journal on
Imaging Sciences , vol. 3, no. 3, pp. 253–276, 2010.
[205] X. Zhang, M. Burger, and S. Osher, “A uniﬁed primal-dual algorithm fr ame-
work based on Bregman iteration,” Journal of Scientiﬁc Computing , vol. 46,
no. 1, pp. 20–46, 2011.
[206] P. Zhao, G. Rocha, and B. Yu, “The composite absolute penalties family
for grouped and hierarchical variable selection,” Annals of Statistics , vol. 37,
no. 6A, pp. 3468–3497, 2009.
[207] H. Zou and T. Hastie, “Regularization and variable selection via the el astic
net,” Journal of the Royal Statistical Society: Series B (Statistical Me thodol-
ogy), vol. 67, pp. 301–320, 2005.
