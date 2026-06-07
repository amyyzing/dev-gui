# Principal Fitted Components for Dimension Reduction in Regression

Converted from: `Statistics\Dimension Reduction Regression.pdf`


## Page 1

arXiv:0906.3953v1  [stat.ME]  22 Jun 2009
Statistical Science
2008, Vol. 23, No. 4, 485–501
DOI:
10.1214/08-STS275
c⃝ Institute of Mathematical Statistics , 2008
Principal Fitted Components for
Dimension Reduction in Regression
R. Dennis Cook and Liliana Forzani
Abstract. We provide a remedy for two concerns that have dogged
the use of principal components in regression: (i) principa l components
are computed from the predictors alone and do not make appare nt
use of the response, and (ii) principal components are not in variant
or equivariant under full rank linear transformation of the predictors.
The development begins with principal ﬁtted components [Co ok, R.
D. (2007). Fisher lecture: Dimension reduction in regressi on (with dis-
cussion). Statist. Sci. 22 1–26] and uses normal models for the inverse
regression of the predictors on the response to gain reducti ve infor-
mation for the forward regression of interest. This approac h includes
methodology for testing hypotheses about the number of comp onents
and about conditional independencies among the predictors .
Key words and phrases: Central subspace, dimension reduction, in-
verse regression, principal components.
1. INTRODUCTION
Principal components have a long history of use
as a dimension reduction method in regression, and
today are widely represented in the applied sciences.
The basic idea is to replace the predictor vector
X ∈ Rp with a few of the principal components ˆvT
j X,
j = 1, . . . , p, prior to regression with response Y ∈
R1, where ˆvj is the eigenvector of the sample co-
variance matrix ˆΣ of X corresponding to its jth
largest eigenvalue. The leading components, those
corresponding to the larger eigenvalues, are typically
chosen. Collinearity is the main and often the only
R. Dennis Cook is Professor, School of Statistics,
University of Minnesota, 313 Ford Hall, 224 Church
Street SE, Minneapolis, Minnesota 55455, USA e-mail:
dennis@stat.umn.edu. Liliana Forzani is Professor,
Facultad de Ingenier ´ ıa Qu´ ımica, Universidad Nacional
del Litoral and Instituto de Matem´ atica Aplicada del
Litoral, CONICET, G¨ uemes 3450, (3000) Santa Fe,
Argentina e-mail:
liliana.forzani@gmail.com.
This is an electronic reprint of the original article
published by the
Institute of Mathematical Statistics in
Statistical Science, 2008, Vol. 23, No. 4, 485–501 . This
reprint diﬀers from the original in pagination and
typographic detail.
motivation for the use of principal components in
regression, but our results show no necessary link
between the presence of collinearity and the eﬀec-
tiveness of principal component reduction.
Although collinearity is perhaps the primary his-
torical reason for interest in principal components,
they have been widely used in recent years for di-
mension reduction in regressions where the sample
size n is less than p. This motivation is prevalent
in the genomics literature (see, e.g., Bura and Pfeif-
fer,
2003, and Li and Li, 2004) and is an impor-
tant ingredient in the method of supervised prin-
cipal components by Bair et al. (
2006). Principal
components can also be useful regardless of the pres-
ence of collinearity or the relationship between n
and p, depending on the goals of the analysis. For
instance, it is often desirable to have an informative
low-dimensional graphical representation of the data
to facilitate model building and aid understanding
(Cook,
1998). If p ≤ 2 we can use computer graphics
to view the data in full. If p = 3 and the response
is categorical we can use a three-dimensional plot of
the predictors with points marked according to the
value of the response to view the full data. However,
if p > 3 or p = 3 and the response is continuous we
cannot view the data in full and dimension reduction
may be useful.
1


## Page 2

2 R. D. COOK AND L. FORZANI
Two general concerns have dogged the use of prin-
cipal components. The ﬁrst is that principal compo-
nents are computed from the marginal distribution
of X and there is no reason in principle why the
leading principal components should carry the es-
sential information about Y (Cox,
1968). The sec-
ond is that principal components are not invariant
or equivariant under full rank linear transformations
of X, leading to problems in practice when the pre-
dictors are in diﬀerent scales or have diﬀerent vari-
ances. Some authors standardize the predictors so
ˆΣ is a correlation matrix prior to computing the
components.
In this article we propose a model-based approach
to principal component reduction that can be adapt-
ed to a speciﬁc response Y and that is equivariant
under full rank linear transformations of X. Our re-
sults build on Cook’s (
2007) formulation, which uses
model-based inverse regression of X on Y to gain re-
ductive information for the forward regression of Y
on X. In Section 2 we introduce the models: Cook’s
models are reviewed in Section 2.1 and our extension
is described in Section 2.2. We address estimation in
Section 3 and relationships with other methods in
Section 4. Inference is considered in Sections 5 and
6, and Section 7 contains illustrations of the pro-
posed methodology. We regard the developments to
this point as perhaps the most useful in practice.
Nevertheless, in Section
8 we discuss model varia-
tions that may also be useful. Proofs can be found
in the
Appendices.
2. MODELS
We assume that the data consist of n independent
observations on ( X, Y ). Let Xy denote a random
vector distributed as X|(Y = y), and assume that
Xy is normally distributed with mean µy and con-
stant variance ∆ > 0. Let ¯µ = E(X) and let SΓ =
span{µy − ¯µ|y ∈ SY }, where SY denotes the sample
space of Y and Γ ∈ Rp×d denotes a semi-orthogonal
matrix whose columns form a basis for the
d-dimensional subspace SΓ. Then we can write
Xy = ¯µ + Γνy + ε,(1)
where ε is independent of Y and normally distributed
with mean 0 and covariance matrix ∆, and νy =
ΓT (µy − ¯µ) ∈ Rd; we assume that var( νY ) > 0. This
model represents the fact that the translated condi-
tional means µy − ¯µ fall in the d-dimensional sub-
space SΓ. In full generality, a reduction T : Rp →
Rq, q ≤ p, is suﬃcient if Y |X ∼ Y |T (X), or equiv-
alently if Y ⊥ ⊥X|T (X), since X can then be re-
placed by T (X) without loss of information on the
regression. Under model (
1) the speciﬁc reduction
R(X) = ΓT ∆−1X is suﬃcient (Cook, 2007) and the
goal is to estimate the dimension reduction subspace
∆−1SΓ = {∆−1z : z ∈ SΓ}, since Γ is not generally
identiﬁed. Then R(X) = ηT X is a suﬃcient reduc-
tion for any matrix η ∈ Rp×d whose columns form a
basis for ∆−1SΓ. The parameter space for ∆−1SΓ
and SΓ is the d-dimensional Grassmann manifold
G(d,p) in Rp. The manifold G(d,p) has analytic dimen-
sion d(p − d) (Chikuse, 2003, page 9), which is the
number of reals needed to specify uniquely a sin-
gle subspace in G(d,p). This count will be used later
when determining degrees of freedom.
Let Sd(A, B) denote the span of A−1/2 times the
ﬁrst d eigenvectors of A−1/2BA−1/2, where A and
B are symmetric matrices and, as used in this arti-
cle, A will always be a nonsingular covariance ma-
trix. Beginning with B we apply the transforma-
tion A−1/2 before computing the ﬁrst d eigenvectors.
Multiplying these eigenvectors by A−1/2 then con-
verts them to vectors that span the desired subspace
in the original scale. The subspace Sd(A, B) can also
be described as the span of the ﬁrst d eigenvectors
of B relative to A. This notation is intended as a
convenient way of describing estimators of ∆−1SΓ
under various conditions.
2.1 PC and Isotonic PFC Models
Cook (
2007) developed estimation methods for two
special cases of model ( 1). In the ﬁrst, νy is unknown
for all y ∈ SY but the errors are isotonic; that is,
∆ = σ2Ip. This is called the PC model since the
maximum likelihood estimator (MLE) of ∆−1SΓ =
SΓ is Sd(Ip, ˆΣ), the span of the ﬁrst d eigenvectors
of ˆΣ. Thus R(X) is estimated by the ﬁrst d principal
components. This relatively simple result arises be-
cause of the nature ∆. Since the errors are isotonic,
the contours of ∆ are circular. When the signal Γνy
is added the contours of Σ = Γ var(νY )ΓT + σ2Ip be-
come p-dimensional ellipses with their longest d axes
spanning SΓ.
In the second version of model (
1), the coordi-
nate vectors are modeled as νy = β{fy − E(fY )},
where fy ∈ Rr is a known vector-valued function
of y with linearly independent elements and β ∈
Rd×r, d ≤ min(r, p), is an unrestricted rank d ma-
trix. Under this model for νy each coordinate Xyj ,


## Page 3

PRINCIPAL FITTED COMPONENTS 3
j = 1, . . . , p, of Xy follows a linear model with pre-
dictor vector fy. Consequently, we are able to use
inverse response plots (Cook, 1998, Chapter 10) of
Xyj versus y, j = 1, . . . , p, to gain information about
suitable choices for fy, which is an ability that is not
generally available in the forward regression of Y
on X. For example, Bura and Cook ( 2001), Figure
1b, present a scatterplot matrix of the ﬁve variables
in a regression with four predictors. The inverse re-
sponse plots can all be ﬁtted reasonably with log( y),
indicating that in their example fy = log(y) may be
adequate. In some regressions there may be a nat-
ural choice for fy. Suppose for instance that Y is
categorical, taking values in one of h categories Ck,
k = 1, . . . , h. We can then set r = h − 1 and spec-
ify the kth element of fy to be J(y ∈ Ck), where J
is the indicator function. When Y is continuous we
can consider fy’s that contain a reasonably ﬂexible
set of basis functions, like polynomial terms in Y ,
which may be useful when it is impractical to apply
graphical methods to all of the predictors. Another
option consists of “slicing” the observed values of Y
into h bins (categories) Ck, k = 1, . . . , h, and then
specifying the kth coordinate of fy as for the case of
a categorical Y . This has the eﬀect of approximat-
ing each conditional mean E( Xyj ) as a step function
of y with h steps,
E(Xyj ) ≈ ¯µj +
h−1∑
k=1
γT
j bk{J(y ∈ Ck) − Pr(Y ∈ Ck)},
where γT
j is the jth row of Γ and bk is the kth
column of β. Piecewise polynomials could also be
used.
Models with νy = β{fy − E(fY )} are called princi-
pal ﬁtted component (PFC) models. When the errors
are isotonic the MLE of SΓ is Sd(Ip, ˆΣﬁt), where ˆΣﬁt
is the sample covariance matrix of the ﬁtted vectors
from the multivariate linear regression of Xy on fy,
including an intercept. In more detail, let X denote
the n × p matrix with rows ( Xy − ¯X)T and let F de-
note the n × r matrix with rows ( fy − ¯f)T . Then the
n × p matrix of ﬁtted vectors from the regression of
Xy on fy is ˆX = PFX and ˆΣﬁt = XT PFX/n, where
PF denotes the linear operator that projects onto
the subspace spanned by the columns of F. Under
this isotonic PFC model the MLE of R(X) consists
of the ﬁrst d principal ﬁtted components, with eigen-
vectors computed from ˆΣﬁt instead of ˆΣ = XT X/n.
The covariance matrix of the residual vectors from
the ﬁt of Xy on fy can be represented as ˆΣres =
ˆΣ− ˆΣﬁt = XT QFX/n, where QF = In − PF. This ma-
trix plays no direct role in the isotonic PFC model,
since we have speciﬁed ∆ = σ2Ip. However, ˆΣres will
play a role in the extensions that follow.
2.2 The PFC Model
Principal ﬁtted components are an adaptation of
principal components to a particular response Y .
However, the isotonic error structure ∆ = σ2Ip is
restrictive and does not address the invariance issue.
In this article we extend principal ﬁtted components
to allow for a general error structure. Our speciﬁc
goal is to develop maximum likelihood estimation
of ∆−1SΓ and related inference methods under the
following PFC model,
Xy = ¯µ + Γβ{fy − E(fY )}+ ε = µ + Γβfy + ε,(2)
where µ = ¯µ − ΓβE(fY ) and var( ε) = ∆ > 0. This
approach will then provide a solution to the two
long-standing issues that have plagued the applica-
tion of principal components. Assuming that ˆΣres >
0, we will show that the MLE of the suﬃcient re-
duction R(X) can be computed straightforwardly as
the ﬁrst d principal components based on the stan-
dardized predictor vector ˆΣres−1/2X. We found this
result to be surprising since it does not depend ex-
plicitly on the MLE of ∆, which is a necessary in-
gredient for the MLE of ∆−1SΓ.
In Section
3 we give the MLE of ∆ and ﬁve equiv-
alent forms for the MLE of ∆−1SΓ under model
(2). Relationships with some other methods are dis-
cussed in Section 4. We turn to inference in Sec-
tions 5 and 6, presenting ways of inferring about d
and about the active predictors. In Section 8 we dis-
cuss versions of model ( 2) in which ∆ is structured,
providing modeling possibilities between the PFC
models with ∆ = σ2Ip and ∆ > 0.
2.3 Identifying ∆−1SΓ as the Central Subspace
In this section we provide a connection between
the model-based dimension reduction considered in
this article and the theory of model-free suﬃcient
dimension reduction.
In the model-based approach, suﬃcient reductions
R(X) can in principle be determined from the model
itself. For example, in the case of model (
1) we saw
previously that R(X) = ΓT ∆−1X is a suﬃcient re-
duction. In model-free dimension reduction there is
no speciﬁc law to guide the choice of a reduction.
However, progress is still possible by restricting at-
tention to the class of linear reductions. A linear


## Page 4

4 R. D. COOK AND L. FORZANI
reduction always exists since R(X) = X is trivially
suﬃcient. If R(X) = ηT X is a k-dimensional suﬃ-
cient reduction, then so is R(X) = (ηA)T X for any
k × k full rank matrix A. Consequently, only the
subspace span( η) spanned by the columns of η can
be identiﬁed —span( η) is called a dimension reduc-
tion subspace.
If span(η) is a dimension reduction subspace then
so is span( η, η1) for any matrix p × k1 matrix η1.
As a result there may be many linear suﬃcient re-
ductions in a particular regression and we seek the
one with the smallest dimension. If span( η1) and
span(η2) are both dimension reduction subspaces,
then under mild conditions (Cook,
1998) so is
span(η1) ∩ span(η2). Consequently, the inferential
target in model-free suﬃcient dimension reduction
is often taken to be the central subspace SY |X, de-
ﬁned as the intersection of all dimension reduction
subspaces (Cook,
1994, 1998).
The following theorem enables us to conclude that
under model ( 2) ∆−1SΓ = SY |X; that is, the infer-
ential targets for model-free and model-based reduc-
tions coincide in the context of model (
2). The ﬁrst
part was given by Cook ( 2007), Proposition 6, but
here we establish minimality as well.
Theorem 2.1. Let R(X) = ΓT ∆−1X, and
let T (X) be any suﬃcient reduction. Then, under
model ( 2), R is a suﬃcient reduction and R is a
function of T .
3. ESTIMATION UNDER PFC MODEL ( 2)
3.1 Maximum Likelihood Estimators
First we derive the MLE for the parameters of
model ( 2) and then show how to linearly transform
the predictors to yield a suﬃcient reduction. Our
derivation requires that ˆΣ > 0, ˆΣres > 0 and d ≤
min(r, p). The full parameter space ( µ, SΓ, β, ∆) for
model (
2) has analytic dimension p + d(p − d) +dr +
p(p + 1)/2. We hold d ﬁxed while maximizing over
the other parameters, and then consider inference
for d in Section
5.
The full log likelihood is
Ld(µ, SΓ, β, ∆)
= − np
2 log(2π) − (n/2) log|∆|
− (1/2)
∑
y
(Xy − µ − Γβ(fy − ¯f )T )
·∆−1(Xy − µ − Γβ(fy − ¯f )),
where we have used the centered fy’s without loss
of generality. For ﬁxed ∆ and Γ, this log likeli-
hood is maximized over µ and β by the arguments
ˆµ = ¯X and ˜β = ΓT PΓ(∆−1) ˆB, where PΓ(∆−1) =
Γ(ΓT ∆−1Γ)−1 ·ΓT ∆−1 is the projection onto SΓ
in the ∆−1 inner product and ˆB = XT F(FT F)−1 is
the coeﬃcient matrix from the multivariate linear
regression of Xy on fy. From the form of ˜β we see
that the MLE of Γβ will be the projection of ˆB onto
ˆSΓ in the ˆ∆−1 inner product. To ﬁnd ˆSΓ and ˆ∆ we
substitute ˆµ and ˜β into the log likelihood to obtain
the partially maximized form
Ld(SΓ, ∆)
= − np
2 log(2π) − (n/2) log|∆|
(3)
− (n/2) trace{∆−1/2 ˆΣ∆−1/2
− P∆−1/2Γ∆−1/2 ˆΣﬁt∆−1/2}.
Holding ∆ ﬁxed, this is maximized by choosing
P∆−1/2Γ to project onto the space spanned by the
ﬁrst d eigenvectors of ∆−1/2 ˆΣﬁt∆−1/2. This leads to
the ﬁnal partially maximized log likelihood (Cook,
2007, Section 7.2)
Ld(∆) = − np
2 log(2π) − n
2 log |∆|
(4)
− n
2 tr(∆−1 ˆΣres) − n
2
p∑
i=d+1
λi(∆−1 ˆΣﬁt),
where λi(A) indicates the ith eigenvalue of the ma-
trix A. The MLE ˆ∆ of ∆ is then obtained by max-
imizing (4). The MLEs of the remaining parameters
are ˆµ = ¯X, ˆSΓ = ˆ∆Sd(ˆ∆, ˆΣﬁt), and ˆβ = ( ˆΓT ˆ∆−1 ˆΓ)−1 ·
ˆΓ−T ˆ∆−1 ˆB, where ˆΓ is any orthonormal basis for
ˆSΓ. It follows that the suﬃcient reduction is of the
form ˆR(X) = ( ˆvT
1 ˆ∆−1/2X, . . . ,ˆvT
d ˆ∆−1/2X)T , where
ˆvj is the jth eigenvector of ˆ∆−1/2 ˆΣﬁtˆ∆−1/2. The
following theorem shows how to construct ˆ∆.
Theorem 3.1. Let ˆV and ˆΛ= diag(ˆλ1, . . . ,ˆλp)
be the matrices of the ordered eigenvectors and eigen-
values of ˆΣ−1/2
res ˆΣﬁt ˆΣ−1/2
res , and assume that the nonzero
ˆλi’s are distinct. Then, the maximum of Ld(∆) (
4)
over ∆ > 0 is attained at ˆ∆ = ˆΣres + ˆΣ1/2
res ˆV ˆK ˆVT ˆΣ1/2
res ,
where ˆK = diag(0, . . . ,0, ˆλd+1, . . . ,ˆλp). The maximum
value of the log likelihood is
Ld = − np
2 − np
2 log(2π)
(5)


## Page 5

PRINCIPAL FITTED COMPONENTS 5
− n
2 log |ˆΣres| −n
2
p∑
i=d+1
log(1 + ˆλi).
In this theorem, ˆλi = 0 for i = r + 1, . . . , p. Conse-
quently, if r = d then ˆ∆ = ˆΣres, and the last term
of Ld does not appear. The maximum value of the
log likelihood can also be expressed in terms of the
squared sample canonical correlations r2
j , j = 1, . . . ,
min(p, r), between X and fy:
Corollary 3.2.
Ld = − np
2 − np
2 log(2π)
− n
2 log |ˆΣres|+ n
2
min(p,r)∑
i=d+1
log(1 − r2
i ).
The following corollary conﬁrms the invariance of
ˆR under full rank linear transformations of X.
Corollary 3.3. If A ∈ Rp×p has full rank, then
ˆR(X) = ˆR(AX).
The next corollary gives ﬁve equivalent forms for
the MLE of ∆−1SΓ.
Corollary 3.4. The following are equivalent
expressions for the MLE of ∆−1SΓ under model ( 2):
Sd(ˆ∆, ˆΣ) = Sd( ˆΣres, ˆΣ) = Sd(ˆ∆, ˆΣﬁt) = Sd( ˆΣres,
ˆΣﬁt) = Sd( ˆΣ, ˆΣﬁt).
The ﬁrst and second forms— Sd(ˆ∆, ˆΣ) = Sd ×
( ˆΣres, ˆΣ)—indicate that the suﬃcient reduction un-
der model ( 2) can be computed as the principal
components based on the linearly transformed pre-
dictors ˆ∆−1/2X or ˆΣ−1/2
res X, as mentioned in the
Introduction. The remaining forms indicate that a
suﬃcient reduction can be computed also as the
principal ﬁtted components for A−1/2X, where A is
ˆ∆, ˆΣres or ˆΣ. Although ˆ∆ and ˆΣres make explicit
use of the response and ˆΣ does not, the response still
enters when using ˆΣ because we regress Σ−1/2Xy on
fy to obtain the principal ﬁtted components. Any of
these ﬁve form can be used in practice since they
each give the same estimated subspace, but we tend
to use Sd( ˆΣres, ˆΣﬁt) for no compelling reason.
3.2 Robustness
In this section we consider the robustness of Sd( ˆΣ,
ˆΣﬁt) as an estimator ∆−1SΓ under nonnormality of
the errors and misspeciﬁcation of the model for νy.
Speciﬁcally, we still assume that model (
1) holds,
but now with possibly nonnormal errors that are in-
dependent of Y and have ﬁnite moments. The ﬁtted
model has mean function as given in (
2), but we no
longer assume that νy = β{fy − E(fY )}. This then
allows for misspeciﬁcation of fy. Let ρ be the d × r
matrix of correlations between the elements of νY
and fY . Then, with this understanding:
Theorem 3.5. Sd( ˆΣ, ˆΣﬁt) is a √ n consistent
estimator of ∆−1SΓ if and only if ρ has rank d.
This result indicates that we may still expect Sd( ˆΣ,
ˆΣﬁt) to be a reasonable estimator when fy is mis-
speciﬁed, provided that it is suﬃciently correlated
with νy. It also places the present methodology on
an equal footing with other √
n consistent methods
that do not explicitly assume normality at the out-
set.
While √
n consistency does not necessarily guar-
antee good performance in practice, our experiences
with simulations suggest that it is not diﬃcult to
choose an adequate fy. To illustrate we generated
n = 200 observations from model (
1) with d = 1, Y ∼
U (0, 4), νy = exp(y), p = 20, Γ = (1, . . . ,1)T /
√
20
and ∆ = Ip. This choice for ∆ involves no loss of
generality because of the invariance property in Corol-
lary
3.3. Each data set was ﬁtted with d = 1, fy =
(y, y2, . . . , yk)T for k = 1, . . . ,6 and with fy = exp(y).
At the suggestion of a referee, we also included the
lasso regression of Y on X (Tibshirani,
1996) con-
structed by using the R library “relaxo” (Meinshausen,
2006), which selects the tuning parameter by cross
validation. For each choice of fy we computed with
d = 1 the angle between Sd( ˆΣ, ˆΣﬁt) and ∆−1SΓ. We
also computed the angle between the lasso coeﬃ-
cient vector and ∆−1SΓ. Figure
1 shows boxplots
of the angles for 100 replications. For reference, the
expected angle between ∆−1SΓ and a randomly cho-
sen vector in R20 is about 80 degrees. The quadratic
fy shows considerable improvement over the linear
case, and the results for the 3rd through 6th degree
are indistinguishable from those for the model used
to generate the data.
The lasso performance was better than PFC with
fy = y, but not otherwise. However, the performance
of the lasso may improve in sparse regressions with
relatively few active predictors. To address this pos-
sibility, we repeated the simulations of Figure
1 after
setting elements of Γ to zero and renormalizing to
length 1. The performance of all PFC estimators was
essentially the same as those shown in Figure 1. The


## Page 6

6 R. D. COOK AND L. FORZANI
Fig. 1. Boxplots of the angle between each of eight estima-
tors and ∆−1SΓ. The ﬁrst boxplot is for the lasso. Boxplots
2–8 are for the PFC estimators Sd( ˆΣ, ˆΣﬁt) under various
choices for fy: boxplots 2–7 are labeled according to the last
term in fy = (y, y2, . . . , yk)T , k = 1, . . . ,6. The last boxplot is
for fy = exp(y).
lasso did improve, but was still noticeably less accu-
rate than PFC with fy = (y, y2, . . . , yk)T and k ≥ 2.
For example, with only ﬁve active predictors, the
median lasso angle was about 41 degrees. Section
7.2
contains additional discussion of the lasso.
4. RELATIONSHIPS WITH OTHER
METHODS
4.1 Sliced Inverse Regression
Cook (2007) proved that when Y is categorical
and fy is an indicator vector for the Y categories,
the SIR estimator (Li, 1991) of the central subspace
is Sd( ˆΣ, ˆΣﬁt). Theorem 2.1 and Corollary 3.4 then
imply that, under model ( 2) with Y categorical, the
SIR estimator is the MLE of ∆−1SΓ. This and The-
orem 3.5 help explain many of the empirical ﬁnd-
ings on the operating characteristics of SIR. If Y is
categorical and model ( 2) is accurate, SIR will in-
herit optimality properties from general likelihood
theory. If Y is continuous and slicing is used then
SIR will provide a √
n consistent estimator when ρ,
the matrix of correlations between the elements of
νY and the vector fY of slice indicators, has rank d.
However, in practice SIRs step functions may pro-
vide only a rough approximation to E( Xy) and, as a
consequence, can leave useful intra slice information
behind. While this information might be recovered
by intra slice ﬁtting (Cook and Ni,
2006), we expect
that PFC modeling is not as prone to such informa-
tion loss.
4.2 Partial and Ordinary Least Squares
To develop connections between PFC, partial least
squares (PLS) and ordinary least squares (OLS),
consider regressing Y on X in two steps, assum-
ing that d = 1. First we reduce X linearly to GT X
using some methodology that produces G ∈ Rp×q,
q ≤ p. The second step consists of using OLS to ﬁt
the regression of Y on GT X. Letting ˆβG denote the
resulting vector of coeﬃcient for X, we have
ˆβG = PG(ˆΣ)
ˆβols = G(GT ˆΣG)−1GT XT Y/n,
where Y is the n × 1 vector of centered responses
and ˆβols is the vector of coeﬃcients from the OLS
ﬁt of Y on X. This estimator, which is the projection
of ˆβols onto span( G) in the ˆΣ inner product, does
not require computation of ˆΣ−1 if q < p and thus
may be useful when n < p, depending on the size of
q.
Clearly, if G = Ip then ˆβG = ˆβols. Consider next
constructing G from PFC using fy = y. In that case
span(G) = S1( ˆΣ, ˆΣﬁt) = span( ˆβols), and consequently
using PFC with fy = y to construct G produces the
OLS estimator. The simulations shown in the box-
plot of Figure
1 with fy = y then correspond to OLS.
Let C = cov(X, Y ) and ˆC = XT Y/n. Setting G =
( ˆC, ˆΣ ˆC, . . . ,ˆΣq−1 ˆC) yields the PLS estimator with
q factors (Helland, 1990). PLS works best when C
can be expressed as a linear combination of q eigen-
vectors of Σ with unique eigenvalues (Helland and
Almøy, 1994), and then span( G) is an estimator of
the span of those eigenvectors. From these results it
can be seen that using the isotonic PFC subspace
G = S1(Ip, ˆΣﬁt) with fy = y produces a ˆβG that is
equal to the PLS estimator with q = 1. Connections
between PLS and PFC are less clear when q > 1.
4.3 Seeded Reductions
As mentioned in the
Introduction, there has been
recent interest in principal components as a reduc-
tive method for regressions in which n < p. Isotonic
PFC applies directly when n < p , as do the meth-
ods with a structured ∆ discussed in Section
8. The
PFC estimator with unstructured ∆ > 0 is not di-
rectly applicable to n < p regressions, but it does
provide a seed for recently methodology that is ap-
plicable. Cook, Li and Chiaromonte (
2007) devel-
oped methodology for estimating the central sub-
space SY |X in n < p regressions when there is a pop-
ulation seed matrix φ ∈ Rp×d such that span( φ) =
ΣSY |X. It follows from Corollary
3.4 that, in the


## Page 7

PRINCIPAL FITTED COMPONENTS 7
context of this article, SY |X = ∆−1SΓ =
Σ−1span(Σﬁt), where Σﬁt is the population version
of ˆΣﬁt. Let the columns of φﬁt be the eigenvectors of
Σﬁt corresponding to its d largest eigenvalues. Then
span(φﬁt) = ΣSY |X and φﬁt qualiﬁes as a popula-
tion seed matrix. The sample version of φﬁt is con-
structed in the same way using ˆΣﬁt. At this point the
methodology of Cook, Li and Chiaromonte ( 2007)
applies directly.
5. CHOICE OF d
The dimension d of the central subspace was so far
assumed to be speciﬁed. There are at least two ways
to choose d in practice. The ﬁrst is based on using
likelihood ratio statistics Λ w = 2(Lmin(r,p) − Lw) =
− n ∑min(p,r)
i=d+1 log(1 − r2
i ) to test the null hypothesis
d = w against the general alternative d > w. Under
the null hypothesis d = w, Λw has an asymptotic chi-
square distribution with ( r − w)(p − w) degrees of
freedom. This statistic is the same as the usual likeli-
hood ratio statistic for testing if the last min( p, r)− d
canonical correlations are 0 in two sets of jointly
normal random variables (see, e.g., Muirhead,
1982,
page 567). In the present application the conditional
random vector Xy is normal, but marginally X and
fY will typically be nonnormal. The likelihood ratio
test (LRT) is used sequentially, starting with w = 0
and estimating d as the ﬁrst hypothesized value that
is not rejected.
The second approach is to use an information cri-
terion like AIC or BIC. BIC is consistent for d while
AIC is minimax-rate optimal (Burnham and An-
derson,
2002). For w ∈ {0, . . . ,min(r, p)}, the dimen-
sion is selected that minimizes the information cri-
terion IC (w) = − 2 Lw + h(n)g(w), where Lw was
deﬁned in (
5), g(w) is the number of parameters
to be estimated as a function of w, in our case,
p(p + 3)/2 +rw + w(p − w) and h(n) is equal to log n
for BIC and 2 for AIC. These versions are simple
adaptations of the commonly occurring asymptotic
forms for other models.
Since the choice of d is essential to the proposed
methodology, we next discuss selected results from
a simulation study to demonstrate that reasonable
inference on d is possible. We ﬁrst generated Y ∼
N (0, σ2
y), and then with d = 2 generated Xy = Γβfy +
ε, where ε ∼ N (0, ∆), β = I2, fy = (y, |y|)T and Γ =
(Γ1, Γ2) ∈ Rp×2, with Γ1 = (1 , 1, − 1, − 1, 0, . . . ,
0)T /
√
4 and Γ2 = (1, 0, 1, 0, 1, 0, . . . ,0)T /
√
3. For each
p, ∆ was generated once as ∆ = AT A, where A is
a p × p matrix of independent standard normal ran-
dom variables. Let F (2), F (2, 3) and F (2, 3, 4) de-
note the fractions of simulation runs in which d was
estimated to be one of the integer arguments.
Using fy = (y, |y|, y3)T when ﬁtting with model
(2), Figures 2a–2d give the fraction F (2) of runs in
which the indicated procedure selected d = 2 versus
n for p = 5, four values of σy and the three methods
under consideration. The number of repetitions was
500. Here and in other ﬁgures the variation in the
results for adjacent sample sizes reﬂects simulation
error in addition to systematic trends. The relative
performance of the methods in Figure
2a depends
on the sample n and signal σy size, and all three
method improve as n and σy increase.
In Figure 3 σy = 2 and n = 200. For Figures 3a
and 3c, model ( 2) was ﬁtted with fy = (y, |y|, y3)T ,
while for the other two ﬁgures ﬁtting was done with
fy = (y, |y|, y3, . . . , y10)T . Figures
3a and 3b show, as
expected, that the chance of choosing the correct
value of d decreases with p for all procedures. Fig-
ures
3c and 3d show that, with increasing p, LRT
and AIC slightly overestimate d, while BIC under-
estimates d. In the case of AIC, we estimated nearly
a 100 percent chance that the estimated d is 2, 3 or
4 with 80 predictors, r = 10 and 200 observations. A
little overestimation seems tolerable in the context
of this article, since then ˆR will still estimate a suf-
ﬁcient reduction and we can always pursue further
reﬁnement based on the subsequent forward regres-
sions. With underestimation ˆR no longer estimates
a suﬃcient reduction. While we believe this to be a
useful practical result, it is possible that the devel-
opment of Bartlett-type corrections will reduce the
tendency to overestimate. Based on these and other
simulations we judged AIC to be the best overall
method for selecting d, although in the right situa-
tion either of the other methods may perform bet-
ter. For instance, comparing the results in Figures
3a with the results in Figure 2c, we can see that
for n = 200 and p = 5, the performance of BIC was
better than AIC. Nevertheless that is reversed after
p ∼ 10 where AIC consistently gave better results.
6. TESTING PREDICTORS
In this section we develop tests for hypotheses of
the form Y ⊥ ⊥X2|X1 where the predictor vector is
partitioned as X = (XT
1 , XT
2 )T with X1 ∈ Rp1 and
X2 ∈ Rp2, p = p1 + p2. Under this hypothesis, X2
furnishes no information about the response once


## Page 8

8 R. D. COOK AND L. FORZANI
(a) (b)
(c) (d)
Fig. 2. Inference about d: Fraction F (2) of replications in which d = 2 was chosen by the LRT, AIC and BIC versus the
sample size n for four values of σy. (a) σy = 0.5, (b) σy = 1, (c) σy = 2, (d) σy = 5.
X1 is known. The following lemma facilitates the
development of a likelihood ratio test statistic under
model (
2). In preparation, partition Γ = (ΓT
1 , ΓT
2 )T ,
Σ = (Σij), ∆ = (∆ij), ˆΣres = ( ˆΣij,res), Σ = (Σij),
and ∆−1 = (∆ij), i = 1, 2, j = 1, 2, to conform to
the partitioning of X. Let ∆−ii = (∆ii)−1. For a
square partitioned matrix A = (Aij), i, j = 1, 2, let
Aii·j = Aii − AijA−1
jj Aji.
Lemma 6.1. Assume model (
2). Then Y ⊥ ⊥X2|X1
if and only if Γ2 = − ∆−22∆21Γ1.
The log likelihood for the alternative of depen-
dence is as given in Theorem 3.1. The following the-
orem gives the maximum likelihood estimators un-
der the hypothesis Y ⊥ ⊥X2|X1.
Theorem 6.2. Assume that Γ2 = − ∆−22∆21Γ1
and that d ≤ τ1 = min(r, p1). Then, the MLE of ∆ is
given in blocks by ˆ∆11 = ˆΣ
1/2
11,res ˆV(Ip1 + ˆK) ˆVT ˆΣ
1/2
11,res,
with ˆK = diag(0, . . . ,0, ˆλd+1, . . . ,ˆλp1) and ˆV and ˆλ1,
. . . ,ˆλp1 the ordered eigenvectors and eigenvalues of
ˆΣ−1/2
11,res ˆΣ11,ﬁt ˆΣ−1/2
11,res; ˆ∆12 = ˆ∆11 ˆΣ−1
11 ˆΣ12 and ˆ∆22 =
ˆΣ22.1 + ˆΣ21 ˆΣ−1
11 ˆ∆11 ˆΣ−1
11 ˆΣ12. The MLE of the cen-
tral subspace is span{( ˆΣ−1/2
11,res ˆG1, 0)T }, with ˆG1 the
ﬁrst d eigenvectors of ˆΣ−1/2
11,res ˆΣ11,ﬁt ˆΣ−1/2
11,res. The max-
imum value of the log likelihood is
L1
d = − np
2 log(2π) − np
2 − n
2 log |ˆΣ11,res|
(6)
− n
2 log |ˆΣ22.1| −n
2
τ1∑
i=d+1
log(1 + ˆλi).
Under the hypothesis Y ⊥ ⊥X2|X1 the likelihood
ratio statistic Θ d = 2(Ld − L1
d) has an asymptotic
chi-squared distribution with dp2 degrees of free-
dom. By following Corollary
3.2 this test statistic


## Page 9

PRINCIPAL FITTED COMPONENTS 9
(a) (b)
(c) (d)
Fig. 3. Inference about d with varying p and two versions of fy used in ﬁtting for LRT, AIC and BIC. (a) r = 3, (b) r = 10,
(c) r = 3, (d) r = 10.
can be expressed also as
Θd = n log |ˆΣ22.1| −n log |ˆΣ22.1,res|
+ n
min(p,r)∑
i=d+1
log(1 − r2
i )
− n
min(p1,r)∑
i=d+1
log(1 − t2
i ),
where t1, . . . , tmin(p1,r) are the sample canonical cor-
relations between X1 and fy.
By using a working dimension w = min(r, p1) when
constructing the likelihood ratio statistic, we can
test predictors without ﬁrst inferring about d, in the
same way that we set w = min(r, p) when testing hy-
potheses about the structure of ∆. In that case, the
ﬁnal term of Θ d does not appear.
To study the proposed tests of Y ⊥ ⊥X2|X1, we
generated data from the model Xy = Γy + ε, where
ε ∼ N (0, ∆) and Y ∼ N (0, σ2
y); ∆ was generated as
in Section
5, and Γ = c(ΓT
1 , ΓT
2 )T ∈ R10 with Γ1 =
(1, . . . ,1)T ∈ R7, Γ2 = − ∆−22∆21Γ1, and c is a nor-
malizing constant. Predictor testing is best done af-
ter choice of d, so the ﬁtted model was (
2) with
d = r = 1 and fy = y. Partition X = (XT
1 , XT
2 )T with
dim(X1) = 7. Our general conclusion from this and
other simulations is that the actual and nominal lev-
els of the test are usefully close, except when the
sample size n or signal size σy is quite small. For
instance, the estimated levels of nominal 5 percent
tests based on 500 runs were 0 .18, 0 .08, 0 .06 and
0.05 for sample sizes 20, 40, 100 and 120. The test
tends to reject too frequently for weak signals or
small samples. We see that there is again a tendency
for likelihood methods to overestimate, in this case


## Page 10

10 R. D. COOK AND L. FORZANI
the active predictors. As with inference on d we do
not judge this to be a serious issue in the context of
this article.
7. ILLUSTRATIONS
We use two small examples in this section to il-
lustrate the proposed methodology. The ﬁrst is the
most thorough, while the second focuses on selected
aspects of the methodology.
7.1 Wheat Protein
We use Fearn’s (
1983) wheat protein data for this
illustration. The response is the protein content of
a sample of ground wheat, and the predictors are
− log(reﬂectance) of NIR radiation at p = 6 wave-
lengths. We chose this example because the predic-
tors are highly correlated, with pairwise sample cor-
relations ranging between 0 .9118 and 0 .9991. Prin-
cipal components are often considered in such re-
gressions to mitigate the variance inﬂation that can
be caused by collinearity.
Plots of each predictor versus Y (not shown) sug-
gest that E( X|Y = y) might be modeled adequately
as a quadratic function of y and thus fy = (y, y2)T ,
but for this illustration we decided to allow more
ﬂexibility and so set fy = (y, y2, y3)T . Fitting model
(
2) with this cubic fy resulted in AIC, BIC and LRT
all choosing d = 1, suggesting that only one linear
combination of the predictors ˆR1 is suﬃcient. The
plot in Figure 4a of Y versus ˆR1 shows a strong
linear relation. In contrast, there is no relationship
evident in the plot of Y versus the ﬁrst principal
component shown in Figure
4b. The ﬁrst four prin-
cipal components are needed to linearly reconstruct
ˆR1.
Application of the likelihood ratio test Θ d of Sec-
tion 6 with d = 1 to each predictor gave three small
p-values (3.8 × 10−11, 4.6 × 10−12, 2.5 × 10−5) for the
third, fourth and sixth wavelengths. The p-values
for the remaining three wavelengths were all greater
than 0 .33. Evidently, not all wavelengths are neces-
sary for estimating protein content. Predictor selec-
tion could be continued by using standard likelihood-
based methods, including backward elimination or
an information criterion.
The estimated PFC is ˆR1 = ˆηT X, where ˆη = (0.11,
0.11, − 0.84, 0.50, − 0.01, 0.12)T is normalized to have
length 1. Although the predictors with the three
largest absolute coeﬃcients are same as those found
to be signiﬁcant, such coeﬃcients are not generally
useful indicators of the importance of a predictor.
As in linear regression, the coeﬃcients depend on
the scales of the predictors. Multiplying the pre-
dictors by a diagonal matrix D−1 to give scaled
predictors D−1X results in new coeﬃcients Dˆη be-
cause, from Corollary
3.3, the reduction itself is in-
variant under full-rank linear transformations of X:
ˆR1 = ˆηT X = ˆηT DD−1X. If an informal comparison
of coeﬃcients is desirable, then it seems necessary to
at least standardize the predictor by choosing the di-
agonal elements of D to be the square roots of the
diagonal elements of ˆΣ, ˆΣres or ˆ∆. Use of ˆΣ seems
least desirable because it is aﬀected by the signal,
Σ = ∆ + Γβ var(fY )βT ΓT .
We found no clear indications in this example that
the errors deviate signiﬁcantly from normality. How-
ever, even if the errors in model (
2) are not normal
or fy is misspeciﬁed, we would still expect reasonable
estimates because of Theorem 3.5.
We can use these results to gain insights about
the types of regressions in which principal compo-
nents might be eﬀective and about why they appar-
ently fail in this example. Suppose that there are d
eigenvectors of ∆ that span SΓ to a good approx-
imation. This happens when ∆ = σ2Ip, as in the
PC model. Then ∆−1SΓ ≈ S Γ, R(X) ≈ ΓT X and
there is a d × d orthogonal matrix O so that the
columns of ΓO are approximately eigenvectors of
∆. It then follows that there are d eigenvectors of
Σ that approximately span SΓ. If the signal rep-
resented by β var(fY )βT is suﬃciently strong then
these should be the ﬁrst d eigenvectors of Σ with
relatively large eigenvalues. In short, if the signal
is suﬃciently strong and the eigenvectors of ∆ co-
operate, then Σ will exhibit collinearity in the di-
rection of Γ. The reverse implication does not nec-
essarily hold, however. As the present illustration
shows, collinearity in Σ does not necessarily imply
that it has d eigenvectors that span SΓ to a use-
ful approximation. Additionally, the correlations be-
tween the errors ε estimated from ˆ∆ range between
0.911 and 0 .9993, so the observed collinearity in ˆΣ is
coming largely from ˆ∆ and does not reﬂect a strong
signal.
7.2 Naphthalene
These data consist of 80 observations from an ex-
periment to study the eﬀects of three process vari-
ables in the vapor phase oxidation of naphthalene
(Franklin et al.,
1956). The response is the percent-
age conversion of naphthalene to naphthoquinone,


## Page 11

PRINCIPAL FITTED COMPONENTS 11
(a) (b)
Fig. 4. Wheat protein data: (a) Response versus the ﬁrst suﬃcient component; (b) Response versus the ﬁrst principal
component.
(a) (b)
Fig. 5. Naphthalene data: (a) Response versus the ﬁrst PFC componen t; (b) Response versus the lasso ﬁtted values.
and the three predictors are air to naphthalene ratio,
contact time and bed temperature. Although there
are only three predictors in this regression, dimen-
sion reduction may still be useful for visualization,
as discussed in the
Introduction.
Based on smoothed plots of the predictors versus
the response, we used fy = (y, y2)T to ﬁt the PFC
model. The three methods for selecting d discussed
in Section 5 all chose d = 1. Figure 5a gives a plot of
response versus the ﬁrst principal ﬁtted component
ˆR1. A plot of the response versus the ﬁrst principal
components failed to show any useful relationship,
as in the wheat protein data. We also included in
Figure
5b a plot of the response versus lasso ﬁtted
values. A plot of the response versus the PLS ﬁtted
values with q = 1 is quite similar to that shown in
Figure
5b.
The lasso and similar penalization methods are
designed to ﬁt a single linear combination of the
predictors while forcing some of the coeﬃcients to
0, and thereby provide predictor selection along with
the ﬁt. If d = 1 and the forward linear model is ac-
curate then the lasso should perform well. In the
wheat protein data the lasso ﬁtted values are essen-
tially the same as those from PFC shown in Fig-
ure
4. If d = 1 and the forward linear model is not
accurate, then PFC and the lasso can give quite dif-
ferent summaries of the data, as illustrated in Fig-
ure
5. Evidently the lasso favors projections of the
data that have linear mean functions, and tends to
neglect projections with nonlinear mean functions.
The are many examples in the literature where the
dimension of the central subspace was inferred to be
larger than 1 (see, e.g., Cook,
1998). As presently
designed, the lasso cannot respond to such regres-
sions since it ﬁts a single linear combination of the
predictors. Similar comments hold for partial least
squares and other methods that are constrained by
ﬁtting one linear combination of the predictors.


## Page 12

12 R. D. COOK AND L. FORZANI
As presently developed, penalization methods like
the lasso do not address the issues that drive suﬃ-
cient dimension reduction. Relatedly, suﬃcient di-
mension reduction methods are not designed for au-
tomated predictor selection per se. Nevertheless,
there is nothing in principle to prohibit using pe-
nalization methods within the context of suﬃcient
dimension reduction in an eﬀort to gain the best of
both worlds. One might proceed in the context of
this article by adding a penalty in ∆−1SΓ to the
partially maximized log likelihood (
3).
8. STRUCTURED ∆
We would expect the previous methodology to be
the most useful in practice. Nevertheless, models be-
tween the PFC model with ∆ = σ2Ip and the PFC
model with ∆ > 0 may be useful in some applica-
tions. In this section we consider models that al-
low, for example, ∆ to be a diagonal matrix. This
will result in a rescaling of the predictors prior to
component computation, although that scaling is
not the same as the common scaling by marginal
standard deviations to produce a correlation matrix.
The models discussed here may involve substantially
fewer parameters, perhaps resulting in notable eﬃ-
ciency gains when they are reasonable.
Following Anderson (
1969) and Rogers and
Young ( 1977), we consider modeling ∆ with a lin-
ear structure: ∆ = ∑m
i=1 δiGi, where m ≤ p(p+1)/2,
G1, . . . ,Gm are known real symmetric p × p lin-
early independent matrices and the elements of δ =
(δ1, . . . , δm)T are functionally independent. We re-
quire also that ∆−1 have the same linear structure
as ∆: ∆−1 = ∑m
i=1 siGi. To model a diagonal ∆ we
set Gi = eieT
i , where ei ∈ Rp contains a 1 in the ith
position and zeros elsewhere. This basic structure
can be modiﬁed straightforwardly to allow for a di-
agonal ∆ with sets of equal diagonal elements, and
for a nondiagonal ∆ with equal oﬀ-diagonal entries
and equal diagonal entries. In the latter case, there
are only two matrices G1 = Ip and G2 = eeT , where
e ∈ Rp has all elements equal to 1.
Estimation of the central subspace ∆−1SΓ with a
constrained ∆ follows that of Section
3 up to Theo-
rem 3.1. The change is that ∆ is now a function of
δ ∈ Rm. Thus Ld{∆(δ)}(4) is to be maximized over
δ. In contrast to the case with a general ∆, here were
unable to ﬁnd a closed-form solution to the maxi-
mization problem, but any of the standard nonlin-
ear optimization methods should be suﬃcient to ﬁnd
Fig. 6. Tests of a diagonal ∆: The x-axis represents sample
size and the y-axis represents the fraction P of time the null
hypothesis is not rejected.
arg maxδ L{∆(δ)} numerically. We have used an al-
gorithm (Appendix
B) to solve ∂L{∆(δ)}/∂δ = 0
iteratively. The starting point is the value that max-
imizes Ld when r = d since then the maximum can
be found explicitly. The resulting estimator of the
central subspace can be described as Sd(˜∆, ˆΣﬁt),
where ˜∆ is the MLE of the constrained ∆, but
Corollary
3.4 no longer holds.
A model with constrained ∆ can be tested against
(2) by using a likelihood ratio test: under the con-
strained model Ω d = 2{Ld − Ld(˜∆)} is distributed
asymptotically as a chi-squared random variable with
p(p + 1)/2 − m degrees of freedom. This test requires
that d be speciﬁed ﬁrst, but in practice it may be
useful to infer about ∆ prior to inference about d.
This can be accomplished with some loss of power
by overﬁtting the conditional mean and using the
statistic Ω min(r,p), which has the same asymptotic
null distribution as Ω d.
To conﬁrm our asymptotic calculations, we gener-
ated data from the simulation model Xy = Γy + ε,
with Y ∼ N (0, 1), Γ = (1, . . . ,1)T /√
p ∈ Rp and ε ∼
N (0, ∆), where ∆ is a diagonal matrix with en-
try ( i, i) equal to 10 i−1. For the ﬁtted model we
used the working dimension w = r, since inference
on ∆ will likely be made prior to inference on d, and
fy = (y, . . . , yr)T . Testing was done at the 5 percent
level and the number of repetitions was 500. Figure
6 gives graphs of the fraction of runs in which the
null hypothesis was not rejected versus sample size
for various values of r and p = 6. These and other
simulation results show that the test performs as ex-
pected when n is large relative to p. As indicated in


## Page 13

PRINCIPAL FITTED COMPONENTS 13
Figure 6, our simulation results indicate that, with d
ﬁxed, the sample size needed to obtain good agree-
ment between the nominal and actual levels of the
test increases with r.
9. DISCUSSION
The methods proposed in this article provide likeli-
hood-based solutions to the two long-standing prob-
lems that have hounded principal components, es-
tablish a likelihood-based connection between prin-
cipal ﬁtted components and model-free suﬃcient di-
mension reduction and provide insights about the
types of regressions in which principal components
might be useful. When model (
2) is accurate, the
methodology will inherit optimality properties from
general likelihood theory, while otherwise providing
√
n consistent estimators under relatively weak con-
ditions. Additionally, there are no restrictions on the
nature of the response, which may be continuous,
categorical or even multivariate. Perhaps the main
limitations are that var( X|Y ) must be constant or
approximately so, and the methods are not designed
for discrete or categorical predictors. Investigations
into extensions that address these limitations are in
progress (Cook and Forzani,
2009).
APPENDIX A: PROOFS OF THE RESULTS
FROM SECTIONS 3 AND 6
Proof of Theorem 2.1. The condition Y |X ∼
Y |T holds if and only if X|(T, Y ) ∼ X|T . Thus, think-
ing of Y as the parameter and X as the data, T
can be regarded as a suﬃcient statistic for X|Y .
The conclusion will follow if we can show that R
is a minimal suﬃcient statistic for X|Y . Note that
in this treatment the actual unknown parameters
(µ, SΓ, β, ∆) play no essential role.
Let g(x|y) denote the conditional density of X|(Y =
y). To show that R is a minimal suﬃcient statistic
for X|Y it is suﬃcient to consider the log likelihood
ratio
log g(z|y)/g(x|y)
= − (1/2)zT ∆−1z + (1/2)xT ∆−1x
+ (z − x)T ∆−1µy.
If log g(z|y)/g(x|y) is to be a constant in y then we
must have log g(z|y)/g(x|y) = E{log g(z|Y )/g(x|Y )}
for all y. Equivalently, we must have ( z − x)T ∆−1 ·
(µy − µY ) = 0. Let Γ ∈ Rp×d be a basis for span( µy −
µY ). Then the condition can be expressed equiva-
lently as ( z − x)T Γβfy = 0, and the conclusion fol-
lows. □
Let S+
q denote the set of q × q positive deﬁnite
matrices.
Proof of Theorem
3.1. We use f as a generic
function whose deﬁnition changes and is given in
context. We will make a series of changes of variables
to rewrite the problem. Let U = ˆΣ1/2
res ∆−1 ˆΣ1/2
res so
that maximizing (
4) is equivalent to maximizing
f (U) = log |U| −tr(U)
(7)
−
p∑
i=d+1
λi(U ˆΣ−1/2
res ˆΣﬁt ˆΣ−1/2
res ).
Let τ = min(r, p) and use the singular value decom-
position to write ˆΣ−1/2
res ˆΣﬁt ˆΣ−1/2
res = ˆV ˆΛτ ˆVT where
ˆV ∈ Rp×p is an orthogonal matrix and ˆΛτ = diag(ˆλ1,
. . . ,ˆλτ , 0, . . . ,0), with ˆλ1 > ˆλ2 > · · ·> ˆλτ > 0. Calling
H = ˆVT U ˆV ∈ S+
p , (
7) becomes
f (H) = log |H| −tr(H) −
τ∑
i=d+1
λi(H ˆΛτ ).(8)
We now partition H as H = (Hij)i,j=1,2, with H11 ∈
S+
τ , H22 ∈ S+
p−τ [for p = τ we take H = H11 and go
directly to (
9)]. Consider the transformation S+
p to
the space S+
τ × S+
p−τ × Rτ ×(p−τ ) given by V11 = H11,
V22 = H22 − HT
12H−1
11 H12 and V12 = H−1
11 H12. This
transformation is one to one and onto (Eaton,
1983,
Proposition 5.8). As a function of V11, V22 and
V12, ( 8) can be written as
log |V11||V22| −tr(V11) − tr(V22)
− tr(VT
12V11V12) −
τ∑
i=d+1
λi(V11 ˜Λτ ),
where ˜Λτ = diag(ˆλ1, . . . ,ˆλτ ), and we have used the
fact that the nonzero eigenvalues of H ˆΛτ are the
same as those of H11 ˜Λτ . The term − tr(VT
12V11V12)
is the only one that depends on V12. Since V11
is positive deﬁnite, VT
12V11V12 is positive semideﬁ-
nite. Thus, the maximum occurs when V12 = 0. This
implies that H12 = 0, H11 = V11, H22 = V22, and
we next need to maximize
f (H11, H22)
= log |H11|+ log |H22|
− tr(H11) − tr(H22) −
τ∑
i=d+1
λi(H11 ˜Λτ ).


## Page 14

14 R. D. COOK AND L. FORZANI
This function is maximized over H22 at H22 = Ip−τ ,
then we need to maximize
f (H11) = log |H11| −tr(H11)
(9)
−
τ∑
i=d+1
λi(H11 ˜Λτ ).
Letting Z = ˜Λ1/2
τ H11 ˜Λ1/2
τ leads us to maximize
f (Z) = log |Z|−tr(Z ˜Λ−1
τ )− ∑τ
i=d+1 λi(Z). Since Z ∈
S+
τ , there exists an F = diag(f1, . . . , fτ ) with fi > 0
in decreasing order and an orthogonal matrix W in
Rτ ×τ such that Z = WT FW. As a function of W
and F, we can rewrite the function f as
f (F, W) = log |F| −tr(WT FW ˜Λ−1
τ ) −
τ∑
i=d+1
fi
= log |F| −tr(FW ˜Λ−1
τ WT ) −
τ∑
i=d+1
fi.
Now, using a lemma from Anderson (
1971), Theo-
rem A.4.7, minW tr(FW ˜Λ−1
τ WT ) = ∑τ
i=1 fiˆλ−1
i , and
if the diagonal element of F and ˜Λτ are distinct,
the minimum occur when ˆW = Iτ . Knowing this,
we can rewrite the problem one last time, as that of
maximizing in ( f1, . . . , fτ ), all greater than zero, the
function
f (f1, . . . , fτ )
(10)
=
τ∑
i=1
log fi −
τ∑
i=1
fiˆλ−1
i −
τ∑
i=d+1
fi.
Clearly the maximum will occur at fi = ˆλi for i =
1, . . . , dand for i = d+1, . . . , τ, fi = ˆλi/(ˆλi + 1). Since
ˆλi are positive and decreasing order, fi are positive
and decreasing in order. Since all the ˆλi are diﬀer-
ent, the fi are diﬀerent. Collecting all the results,
the value of ∆ that maximizes (
4) is
ˆ∆ = ˆΣ1/2
res ˆU−1 ˆΣ1/2
res = ˆΣ1/2
res ˆV ˆH−1 ˆVT ˆΣ1/2
res
= ˆΣ1/2
res ˆV
( ˜Λ1/2
τ ˆZ−1 ˜Λ1/2
τ 0τ ×(p−τ )
0(p−τ )×τ Ip−τ ×(p−τ )
)
ˆVT ˆΣ1/2
res ,
where ˜Λ1/2
τ ˆZ−1 ˜Λ1/2
τ = diag(Id, ˆλd+1 + 1, . . . ,ˆλτ + 1).
Now, to obtained the maximum value we replace
∆ by ˆ∆ in ( 4),
Ld(ˆ∆) = − np
2 log(2π) − n
2 log |ˆ∆|
(11)
− n
2 tr(ˆ∆−1 ˆΣres) − n
2
τ∑
i=d+1
λi(ˆ∆−1 ˆΣﬁt).
Since the trace and the eigenvalues are cyclic oper-
ations,
tr(ˆ∆−1 ˆΣres) = tr( ˆ∆−1/2 ˆΣresˆ∆−1/2)
= tr {ˆV(Ip + ˆK)−1 ˆVT }
(12)
= d +
τ∑
i=d+1
1/(1 + ˆλi) + (p − τ ),
τ∑
i=d+1
λi(ˆ∆−1 ˆΣﬁt) =
τ∑
i=d+1
λi{ˆV(I + ˆK)−1
·ˆVT ˆΣ−1/2
res ˆΣﬁt ˆΣ−1/2
res }
=
τ∑
i=d+1
ˆλi{ˆV(I + ˆK)−1 ˆVT ˆV ˆK ˆVT }(13)
=
τ∑
i=d+1
ˆλi{(I + ˆK)−1 ˆK}
=
τ∑
i=d+1
ˆλi
1 + ˆλi
.
Since ˆΣres > 0 we have
log |ˆ∆|= log |ˆΣ1/2
res ˆV(I + ˆK) ˆVT ˆΣ1/2
res |
(14)
= log |ˆΣres|+
τ∑
i=d+1
log(1 + ˆλi).
Plugging (12), (14) and ( 15) into ( 12) we obtain ( 5).
□
Proof of Corollary 3.2. The eigenvalues ˆλi
of ˆΣ−1/2
res ˆΣﬁt ˆΣ−1/2
res are the same as those of ˆΣ−1
res ˆΣﬁt.
These eigenvalues are related to the eigenvalues r2
i
of ˆΣ−1 ˆΣﬁt by 1 + ˆλi = (1 − r2
i )−1 (Cook, 2007, Ap-
pendix 7). Now the eigenvalues of ˆΣ−1 ˆΣﬁt are the
same as those of
ˆΣ−1/2 ˆΣﬁt ˆΣ−1/2 = ˆΣ−1/2(XT F/n)(FT F/n)−1
·(FT X/n) ˆΣ−1/2,
where XT F/n is the p × r matrix of sample corre-
lations between X and f and FT F/n is the sample
covariance matrix of f . □
Proof of Corollary 3.3. Recall from Theo-
rem 3.1 that ˆ∆ = ˆΣres + ˆΣ1/2
res ˆV ˆK ˆVT ˆΣ1/2
res , where ˆV
contains the eigenvectors of B = ˆΣ−1/2
res ˆΣﬁt ˆΣ−1/2
res .
The transformation X → AX transforms B → OBOT ,
where O = (A ˆΣresAT )−1/2A ˆΣ1/2
res is an orthogonal
matrix. Consequently, under the transformation ˆK


## Page 15

PRINCIPAL FITTED COMPONENTS 15
is invariant, ˆV → O ˆV and ˆ∆ → Aˆ∆AT . The rest
of the proof follows similarly. □
To prove Corollary 3.4 we need a lemma.
Lemma A.1. Let ˜V = ˆΣ−1/2
res ˆVM1/2, where M =
(Ip + ˆK)−1, with ˆV and ˆK as in Theorem 3.1.
Then ˆ∆
1/2 ˜V are the normalized eigenvectors of
ˆ∆−1/2 ˆΣﬁt × ˆ∆−1/2.
Proof. From Theorem 3.1,
ˆ∆ = ˆΣres + ˆΣ1/2
res ˆV ˆK ˆVT ˆ
ˆΣ
1/2
res
= ˆΣres1/2 ˆV(Ip + ˆK) ˆVT ˆΣres1/2.
Then, ˆ∆−1 = ˆΣ−1/2
res ˆV(Ip + ˆK)−1 ˆVT ˆΣ−1/2
res
= ˆΣ−1/2
res ˆVM ˆVT ˆΣ−1/2
res . Using the fact that ˆV are
the eigenvectors of ˆΣ−1/2
res ˆΣﬁt ˆΣ−1/2
res we get
ˆ∆−1 ˆΣﬁt ˜V = ˆΣ−1/2
res ˆVM ˆVT ˆΣ−1/2
res ˆΣﬁt ˆΣ−1/2
res ˆVM1/2
= ˆΣ−1/2
res ˆVM∆τ M1/2 = ˜VM1/2∆τ M1/2
= ˜VM∆τ ,
where M∆τ = diag(ˆλ1, . . . ,ˆλd, ˆλd+1/(ˆλd+1 + 1), . . . ,
ˆλτ /(ˆλτ + 1), 0, . . . ,0). Therefore ˆ∆−1 ˆΣﬁt has eigen-
values ˆλ1, . . . ,ˆλd, ˆλd+1/(ˆλd+1 + 1), . . . ,ˆλτ /(ˆλτ + 1),
0, . . . ,0 with eigenvectors ˜V, and ˜VT ˆ∆ ˜V = Ip. □
Proof of Corollary
3.4. From the develop-
ment leading to Theorem 3.1, the MLE of
span(∆−1Γ) is Sd(ˆ∆, ˆΣﬁt), which establishes the
ﬁrst form. Now, from Lemma A.1, span of the ﬁrst d
columns of ˆ∆−1/2ˆ∆1/2 ˜V = ˜V is the MLE for
span(∆−1Γ). Since ˜V = ˆΣ−1/2
res ˆVM1/2 and M is di-
agonal full rank with the ﬁrst d elements equal 1, the
span of the ﬁrst d columns of ˜V is the same of the
ﬁrst d columns of ˆΣ−1/2
res ˆV where ˆV are the eigenvec-
tors of ˆΣ−1/2
res ˆΣﬁt ˆΣ−1/2
res . This prove the fourth form.
The proof of the ﬁfth form can be found in Cook
(
2007) and it follows from the fact that the eigen-
vectors of ˆΣ−1 ˆΣﬁt and ˆΣ−1
res ˆΣﬁt are identically, with
corresponding eigenvalues ˆλi and ˆλi/(1 − ˆλi). The
corollary follows now from the relation between the
eigenvectors of the product of the symmetric matri-
ces AB and the eigenvectors of A1/2BA1/2. The sec-
ond and the third forms follow from the fourth and
ﬁfth forms and from the fact that ˆΣ = ˆΣres + ˆΣﬁt.
□
Proof of Theorem
3.5. It is suﬃcient to con-
sider the limiting behavior of ˆΣ−1 ˆΣﬁt, because
Sd( ˆΣ, ˆΣﬁt) = ˆΣ−1/2spand( ˆΣ−1/2 ˆΣﬁt ˆΣ−1/2) =
spand( ˆΣ−1 ˆΣﬁt), where span d(A) indicates the span
of the ﬁrst d eigenvectors of A.
The following statements on large sample behav-
ior follow the general line that Li ( 1991), Section 5,
used in his demonstration of √ n consistency for SIR.
Since ˆΣ is the marginal sample covariance matrix
of X, its asymptotic behavior depends only on the
true model. It is know that under the stated assump-
tions ˆΣ is a √
n consistent estimator of Σ = ΓVΓT +
∆, where V = var(νY ) > 0. Consequently, ˆΣ−1 is
a √ n consistent estimator of Σ−1. Next, as given
in Section 2.1, ˆΣﬁt = (XT F/n)(FT F/n)−1(FT X/n)
which converges at √ n rate to Σﬁt = cov(X, f )cov(X, f )T ,
where we have assumed var( fY ) = Ir without loss of
generality. Using model (1) for X we have, cov(X, f ) =
ΓC, where C = cov(νY , fY ). Consequently, ˆΣ−1 ˆΣﬁt
converges at √ n rate to Σ−1Σﬁt = ( ΓVΓT +
∆)−1ΓCCT Γ−1, and the ﬁrst d eigenvectors of ˆΣ−1 ˆΣﬁt
converge at the √ n rate to corresponding eigenvec-
tors of Σ−1Σﬁt.
Using the form Σ−1 = ∆−1 − ∆−1Γ(V−1 + ΓT ·
∆−1Γ)−1ΓT ∆−1 and simplifying we ﬁnd Σ−1Σﬁt =
∆−1ΓKCCT ΓT , where K = (V−1 +ΓT ∆−1Γ)−1V−1
is a full rank d × d matrix. Clearly, span(Σ−1Σﬁt) ⊆
∆−1SΓ with equality if and only if the rank of ΓKC·
CT ΓT is equal to d. Since Γ has full column rank
and K is nonsingular, the rank of ΓKCCT ΓT is
equal to d if and only if the rank of CCT is equal
to d. The result follows since ρ = V−1/2C, recalling
that we have assumed var( fY ) = Ir. □
Proof of Lemma 6.1. Y ⊥ ⊥X2|X1 if and only
if Y ⊥ ⊥X|X1. Suppose that Y ⊥ ⊥X|X1. We know
that ΓT ∆−1X is the minimal suﬃcient reduction
and thus it should not depend on X2. Now,
ΓT ∆−1X = (ΓT
1 ∆11 + ΓT
2 ∆21)X1
(15)
+ (ΓT
1 ∆12 + ΓT
2 ∆22)X2
will not depend on X2 if and only if ΓT
1 ∆12 +ΓT
2 ∆22 =
0 equivalently Γ2 = − ∆−22∆21Γ1. The reciprocal
follows directly if we replace Γ2 by − ∆−22∆21Γ1
on equation (
15). □
Proof of Theorem 6.2. After maximizing the
log likelihood over ( µ, β), we need to maximize on Γ
and ∆−1 f (Γ, ∆−1) = log |∆−1| − tr(∆−1 ˆΣ) +
tr(∆−1PΓ(∆−1) ˆΣﬁt). From the hypotheses on Γ, we
have ΓT ∆−1 = (ΓT
1 ∆11.2, 0) where ∆11.2 = ∆11 −
∆12∆−22∆21. Then ΓT ∆−1Γ = ΓT
1 ∆11.2Γ1. For ﬁxed


## Page 16

16 R. D. COOK AND L. FORZANI
∆, the last term is maximized by choosing ( ∆11.2)1/2 ·
Γ1 to be a basis for the span the ﬁrst d eigenvectors
of ( ∆11.2)1/2 ˆΣ11,ﬁt(∆11.2)1/2, yielding another par-
tially maximized log likelihood
f (∆−1) = log |∆−1| −tr(∆−1 ˆΣ)
(16)
+
d∑
i=1
λi{(∆11.2)1/2 ˆΣ11,ﬁt(∆11.2)1/2}.
Let us take the one-to-one and onto transformation
deﬁned by L11 = ∆11 − ∆12∆−22∆21, L22 = ∆22
and L12 = ∆12∆−22. As a function of L11, L22, L12
we get
f (L11, L22, L12)
= log |L11|+ log |L22|
− tr(L22 ˆΣ22 + L22LT
12 ˆΣ12)
− tr{(L11 + L12L22LT
12) ˆΣ11
+ L12L22 ˆΣ21}
+
d∑
i=1
λi(L1/2
11 ˆΣ11,ﬁtL1/2
11 ).
Now, diﬀerentiating with respect to L12 in the last
expression, we get that
∂f
∂L12
= − 2 ˆΣ12L22 − 2 ˆΣ11L12L22 and
∂2f
∂L2
12
= − 2 ˆΣ11 ⊗ L22.
Therefore the maximum occurs when L12 = − ˆΣ
−1
11 ·
ˆΣ12. Replacing this in the last log likelihood func-
tion we next need to maximize
f (L11, L22) = log |L11|+ log |L22|
− tr(L22 ˆΣ22) − tr(L11 ˆΣ11)
+ tr( L22 ˆΣ12 ˆΣ−1
11 ˆΣ12)
+
d∑
i=1
λi(L1/2
11 ˆΣ11,ﬁtL1/2
11 ),
since for L12 = − ˆΣ−1
11 ˆΣ12, − 2 tr(L22LT
12 ˆΣ12) −
tr(L12L22LT
12 ˆΣ11) = tr( L22 ˆΣ12 ˆΣ−1
11 ˆΣ12). The max-
imum on L22 is at L22 = ˆΣ−1
22.1 so that we need to
maximize on L11
f (L11) = log |L11| −tr(L11 ˆΣ11)
+
d∑
i=1
λi(L1/2
11 ˆΣ11,ﬁtL1/2
11 ).
From Theorem
3.1 the MLE for L−1
11 is ˆΣ1/2
11,res ˆV(Id +
ˆK) ˆVT ˆΣ
1/2
11,res, where ˆK and ˆV are as deﬁned in The-
orem 6.2. Since L11 = ∆11 − ∆12∆−22∆21 = ∆−1
11 it
follows that ˆ∆11 = ˆΣ
1/2
11,res ˆV(Id + ˆK) ˆVT ˆΣ
1/2
11,res. The
MLE for ∆22 is ˆΣ−1
22.1 and for ∆12 is − ˆΣ−1
11 ˆΣ12 ˆΣ−1
22.1.
Consequently, ˆ∆12 = ˆ∆11 ˆΣ−1
11 ˆΣ12 and ˆ∆22 = ˆΣ22.1 +
ˆΣ21 ˆΣ−1
11 ˆ∆11 ˆΣ−1
11 ˆΣ12.
The MLE for the span of ∆−1Γ = (∆11.2Γ1, 0)T
is the span of ( ˆ∆−1/2
11 ˆΓ1, 0)T with ˆΓ1 the ﬁrst d
eigenvectors of ˆ∆−1/2
11 ˆΣ11,ﬁtˆ∆−1/2
11 . Using the logic
of Corollary 3.3 it can be proved that the MLE of
span(∆−1Γ) is in this case the span of ( ˆΣ−1/2
11,res ˆΓ1, 0)T ,
with ˆΓ1 the ﬁrst d eigenvectors of ˆΣ−1/2
11,res ˆΣ11,ﬁt ˆΣ−1/2
11,res.
The proof of ( 6) can be done essentially as the
proof of ( 5). □
APPENDIX B: ALGORITHM FOR ∆ WITH
LINEAR STRUCTURE
We will maximize ( 4) as a function f of S = ∆−1.
We ﬁrst ﬁnd the derivative with respect to S without
considering any structure. Because ˆΣﬁt is symmetric
we get
∂f (S)
∂S = S−1 − ˆΣres −
r∑
i=d+1
vi(S ˆΣﬁt)uT
i (S ˆΣﬁt) ˆΣﬁt,
where ui and vi indicate respectively the normal-
ized right and left eigenvectors corresponding to the
eigenvalue λi of S ˆΣﬁt. Now, ∂S/∂sh = Gh and
∂f (S)
∂sh
= tr( S−1Gh) − tr( ˆΣresGh)
(17)
−
r∑
i=d+1
tr{ˆΣﬁtui(S ˆΣﬁt)vT
i (S ˆΣﬁt)Gh}.
Denote by ¯ui the ith eigenvector of S1/2 ˆΣﬁtS1/2 =
∆−1/2 ˆΣﬁt∆−1/2 corresponding to the λi eigenvalue
(in decreasing order) normalized with unit norm.
Then ui = S1/2 ¯ui = D−1/2 ¯ui, vi = S−1/2 ¯ui = D1/2 ¯ui,
ˆΣﬁtui = λiD1/2 ¯ui and vT
i uj = 0 if i ̸= j and 1 oth-
erwise. We can rewrite (
17) as
∂f (S)
∂sh
= tr( ∆Gh) − tr( ˆΣresGh)
(18)
−
r∑
i=d+1
λi tr(∆1/2 ¯ui ¯uT
i ∆1/2Gh).
To ﬁnd the MLE we need to solve ∂f (S)/∂sh = 0
for h = 1, . . . , m. Using (
18) we can rewrite ∂f (S)/∂sh =


## Page 17

PRINCIPAL FITTED COMPONENTS 17
0 using the vec operator as
vec(Gh)T vec(∆)
= vec(Gh)T vec( ˆΣres) (19)
+ vec(Gh)T
r∑
i=d+1
λivec(∆1/2 ¯ui ¯uT
i ∆1/2)
for h = 1, . . . , m. Let ˜G = {vec(G1), . . . ,vec(Gm)}.
Since ∆ = ∑m
i=1 δiGi, vec( ∆) = ˜Gδ we can
rewrite (
19) for all h as
˜GT ˜Gδ = ˜GT
{
vec( ˆΣres)
(20)
+
r∑
i=d+1
λivec(∆1/2 ¯ui ¯uT
i ∆1/2)
}
.
Now, if r = d we get δ = ( ˜GT ˜G)−1 ˜GT vec( ˆΣres) and
∆−1 = (∑m
i=1 δiGi)−1. The algorithm will be:
1. Set δ0 = (δ0
1, . . . , δ0
m) = ( ˜GT ˜G)−1 ˜GT vec( ˆΣres).
2. Compute ∆0 = ∑m
i=1 δ0
i Gi and S0 = ∆−1
0 .
3. Compute until convergence, n = 1, 2, . . . ,
∆n = ( ˜GT ˜G)−1 ˜GT
·
[
vec( ˆΣres)
+
r∑
i=d+1
λSn−1
i vec{∆1/2
n−1 ¯uSn−1
i (¯uSn−1
i )T ∆1/2
n−1}
]
with Sn−1 = ∆−1
n−1 and λSn−1 and ¯uSn−1 denoting
respectively the eigenvalues and eigenvectors of
S1/2
n−1 ˆΣﬁtS1/2
n−1.
ACKNOWLEDGMENTS
The authors thank Prof. Eaton for his helpful dis-
cussions. Research for this article was supported in
part by NSF Grant DMS-07-04098.
REFERENCES
Anderson, T. W. (1969). Statistical inference for covariance
matrices with linear structure. In Multivariate Analysis
II (P. Krishnia, ed.) 55–66. Academic Press, New York.
MR0256509
Anderson, T. W. (1971). An Introduction to Multivariate
Statistical Analysis. Wiley, New York.
Bair, E., Hastie, T., P aul, D. and Tibshirani, R. (2006).
Prediction by supervised principal components. J. Amer.
Statist. Assoc. 101 119–137. MR2252436
Burnham, K. and Anderson, D. (2002). Model Selection
and Multimodel Inference. Wiley, New York. MR1919620
Bura, E. and Cook, R. D. (2001). Estimating the structural
dimension of regressions via parametric inverse regressio n.
J. Roy. Statist. Soc. Ser. B 63 393–410. MR1841422
Bura, E. and Pfeiffer, R. M. (2003). Graphical methods
for class prediction using dimension reduction techniques
on DNA microarray data. Bioinformatics 19 1252–1258.
Chikuse, Y. (2003). Statistics on Special Manifolds . Springer,
New York.
MR1960435
Cook, R. D. (1994). Using dimension-reduction subspaces
to identify important inputs in models of physical systems.
In Proceedings of the Section on Physical and Engineering
Sciences 18–25. Amer. Statist. Assoc., Alexandria, V A.
Cook, R. D. (1998). Regression Graphics. Wiley, New York.
MR1645673
Cook, R. D. (2007). Fisher lecture: Dimension reduction
in regression (with discussion). Statist. Sci. 22 1–26.
MR2408655
Cook, R. D. and Forzani, L. (2009). Likelihood-based suf-
ﬁcient dimension reduction. J. Amer. Statist. Assoc. To
appear.
Cook, R. D., Li, B. and Chiaromonte, F. (2007). Di-
mension reduction in regression without matrix inversion.
Biometrika 94 569–584.
MR2410009
Cook, R. D. and Ni, L. (2006). Using intraslice covariances
for improved estimation of the central subspace in regres-
sion. Biometrika 93 65–74.
MR2277740
Cox, D. R. (1968). Notes on some aspects of regression anal-
ysis. J. Roy. Statist. Soc. Ser. A 131 265–279.
Eaton, M. (1983). Multivariate Statistics . Wiley, New York.
MR0716321
Fearn, T. (1983). A misuse of ridge regression in the cali-
bration of a near infrared reﬂectance instrument. J. Appl.
Statist. 32 73–79.
Franklin N. L., Pinchbeck P. H. and Popper F. (1956). A
statistical approach to catalyst development, part 1: The
eﬀects of process variables on the vapor phase oxidation
of naphthalene. Transactions of the Institute of Chemical
Engineers 34 280–293.
Helland, I. S. (1990). Partial least squares regression and
statistical models. Scand. J. Statist. 17 97–114.
MR1085924
Helland, I. S. and Almøy, T. (1994). Comparison of pre-
diction methods when only a few components are relevant.
J. Amer. Statist. Assoc. 89 583–591.
MR1294085
Li, K. C. (1991). Sliced inverse regression for dimension re-
duction with discussion. J. Amer. Statist. Assoc. 86 316–
342. MR1137117
Li, L. and Li, H. (2004). Dimension reduction for microarrays
with application to censored survival data. Bioinformatics
20 3406–3412.
Meinshausen, N. (2006). relaxo: Relaxed
lasso. R package version 0.1-1. Available at
http://www.stat.berkeley.edu/˜nicolai. MR2409990
Muirhead, R. J. (1982). Aspects of Multivariate Statistical
Theory. Wiley, New York. MR0652932
Rogers, G. S. and Young, D. L. (1977). Explicit max-
imum likelihood estimators for certain patterned covari-
ance matrices. Comm. Statist. Theory Methods A6 121–
133.
MR0436430


## Page 18

18 R. D. COOK AND L. FORZANI
Tibshirani, R. (1996). Regression shrinkage and selection
via the lasso. J. Roy. Statist. Soc. Ser. B 58 267–288.
MR1379242
