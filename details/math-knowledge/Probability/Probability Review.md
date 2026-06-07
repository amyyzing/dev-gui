# Probability Theory Review and Reference Arian Maleki (updated by Honglin Yuan and Tengyu Ma)

Converted from: `Probability\Probability Review.pdf`


## Page 1

Probability Theory Review and Reference
Arian Maleki (updated by Honglin Yuan and Tengyu Ma)
March 30, 2022
Contents
1 Elements of Probability 3
1.1 Deﬁnition of probability space . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1.2 Properties of probability . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1.3 Conditional probability and independence . . . . . . . . . . . . . . . . . . . 4
1.4 Law of total probability and Bayes’ theorem . . . . . . . . . . . . . . . . . . 4
2 Random Variables 5
2.1 Deﬁnition and examples . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
2.2 Cumulative distribution functions . . . . . . . . . . . . . . . . . . . . . . . . 6
2.3 Probability mass functions . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
2.4 Probability density functions . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
2.5 Expectation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
2.6 Variance . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
2.7 Some common distributions . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
3 Two Random Variables 11
3.1 Joint and marginal distributions . . . . . . . . . . . . . . . . . . . . . . . . . 11
3.2 Joint and marginal probability mass functions . . . . . . . . . . . . . . . . . 12
3.3 Joint and marginal probability density functions . . . . . . . . . . . . . . . . 13
3.4 Conditional distributions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 13
3.5 Bayes’ rule for random variables . . . . . . . . . . . . . . . . . . . . . . . . . 14
3.6 Independence of random variables . . . . . . . . . . . . . . . . . . . . . . . . 14
3.7 Expectation and covariance . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
4 Multiple Random Variables 16
4.1 Basic properties . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
4.2 Random vectors, expectation and covariance . . . . . . . . . . . . . . . . . . 17
4.3 The law of large numbers and Central limit theorem . . . . . . . . . . . . . . 19
1


## Page 2

5 The Multivariate Gaussian Distribution 20
5.1 Relationship to univariate Gaussians . . . . . . . . . . . . . . . . . . . . . . 21
5.2 The covariance matrix . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
5.3 The diagonal covariance matrix case . . . . . . . . . . . . . . . . . . . . . . 23
5.4 Isocontours . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
5.4.1 Shape of isocontours . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
5.4.2 Length of axes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
5.4.3 Non-diagonal case, higher dimensions . . . . . . . . . . . . . . . . . . 26
5.5 Linear transformation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
5.6 Closure properties . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
5.6.1 Sum of independent Gaussians is Gaussian . . . . . . . . . . . . . . . 27
5.6.2 Marginal of a joint Gaussian is Gaussian . . . . . . . . . . . . . . . . 28
5.6.3 Conditional of a joint Gaussian is Gaussian . . . . . . . . . . . . . . . 33
6 Other Resources 33
A Proof of Theorem 5.2 33
B Proof of Theorem 5.5 35
2


## Page 3

1 Elements of Probability
Probability theory is the study of uncertainty. Through this class, we will be relying on
concepts from probability theory for deriving machine learning algorithms. These notes
attempt to cover the basics of probability theory at a level appropriate for CS 229. The
mathematical theory of probability is very sophisticated, and delves into a branch of analysis
known as measure theory. In these notes, we provide a basic treatment of probability that
does not address these ﬁner details.
1.1 Deﬁnition of probability space
In order to deﬁne a probability on a set we need a few basic elements:
• Sample space Ω: The set of all the outcomes of a random experiment. Here, each
outcome ω∈ Ω can be thought of as a complete description of the state of the real
world at the end of the experiment.
• Event spaceF: A set whose elements A∈F (called events) are subsets of Ω (i.e.,
A⊆ Ω is a collection of possible outcomes of an experiment). 1.
• Probability measure: A function P :F→ R that satisﬁes the following properties,
– Non-negativity : P (A)≥ 0, for all A∈F
– Completeness : P (Ω) = 1
– Countable Additivity : If A1,A 2,... are disjoint events (i.e.,Ai∩Aj =∅ when-
everi̸=j), then
P (
∞⋃
i=1
Ai) =
∞∑
i=1
P (Ai)
These three properties are called the Axioms of Probability.
Example 1.1.: Consider the event of tossing a six-sided die. The sample space is Ω =
{1, 2, 3, 4, 5, 6}. We can deﬁne diﬀerent event spaces on this sample space. For example, the
simplest event space is the trivial event space F ={∅, Ω}. Another event space is the set
of all subsets of Ω. For the ﬁrst event space, the unique probability measure satisfying the
requirements above is given by P (∅) = 0,P (Ω) = 1. For the second event space, one valid
probability measure is to assign the probability of each set in the event space to be i
6 where
i is the number of elements of that set; for example, P ({1, 2, 3, 4}) = 4
6 andP ({1, 2, 3}) = 3
6.
1.2 Properties of probability
Proposition 1.2.: The following properties can be derived from the axioms of probability.
1F should satisfy three properties: (1) ∅∈F ; (2) A∈F =⇒ Ω\A∈F ; and (3) A1,A 2,... ∈F =⇒⋃
iAi∈F .
3


## Page 4

• If A⊆B then P (A)≤P (B).
• P (A∩B)≤ min(P (A),P (B)).
• P (Ac)≜P (Ω\A) = 1−P (A).
• P (A∪B)≤P (A) +P (B). This property is known as the union bound .
• If A1,...,A k are a set of disjoint events such that ⋃k
i=1Ai = Ω, then ∑k
i=1P (Ak) = 1.
This property is known as the Law of Total Probability .
1.3 Conditional probability and independence
Let B be an event with non-zero probability. The conditional probability of any event A
givenB is deﬁned as
P (A|B)≜ P (A∩B)
P (B)
In other words, P (A|B) is the probability measure of the event A after observing the occur-
rence of eventB. Two events are called independent if and only if P (A∩B) =P (A)P (B)
(or equivalently, P (A|B) = P (A)). Therefore, independence is equivalent to saying that
observing B does not have any eﬀect on the probability of A.
In general, for multiple events, A1,...,A k, we say that A1,...,A k are mutually indepen-
dent if for any subset S⊆{ 1, 2,...,k }, we have
P (
⋂
i∈S
Ai) =
∏
i∈S
P (Ai).
1.4 Law of total probability and Bayes’ theorem
In practice, it is often helpful to compute the marginal probabilities from the conditional
probabilities. The following Law of total probability expresses the total probability of an
outcome which can be realized via several distinct events:
Theorem 1.3.: [Law of total probability] Suppose A1,...,A n are disjoint events, and event
B satisﬁes B⊆ ⋃n
i=1Ai, then
P (B) =
n∑
i=1
P (Ai)P (B|Ai) (1)
Theorem 1.3 can be proved directly by applying the deﬁnition of the conditional probability.
Note that Theorem 1.3 holds for any event B if ⋃n
i=1Ai = Ω. As a common special case, for
any eventA, it is the case that
P (B) =P (A)P (B|A) +P (Ac)P (B|Ac). (2)
An important corollary of the law of total probability is the following Bayes’ theorem
4


## Page 5

Theorem 1.4.: [Bayes’ theorem] Suppose A1,...,A n are disjoint events, and event B sat-
isﬁes B⊂ ⋃n
i=1Ai. Then if P (B)> 0, it is the case that
P (Aj|B) = P (Aj)P (B|Aj)∑n
i=1P (Ai)P (B|Ai). (3)
A special case of the Bayes’ theorem is
P (A|B) = P (A)P (B|A)
P (B) = P (A)P (B|A)
P (A)P (B|A) +P (Ac)P (B|Ac). (4)
Bayes’ theorem is widely applied in various topics in statistics and machine learning. We
will revisit this theorem many times throughout the course of CS 229.
2 Random Variables
2.1 Deﬁnition and examples
Consider an experiment in which we ﬂip 10 coins, and we want to know the number of coins
that come up heads. Here, the elements of the sample space Ω are 10-length sequences
of heads and tails. For example, we might have w0 =⟨H,H,T,H,T,H,H,T,T,T ⟩∈ Ω.
However, in practice, we usually do not care about the probability of obtaining any particular
sequence of heads and tails. Instead we usually care about real-valued functions of outcomes,
such as the number of heads that appear among our 10 tosses, or the length of the longest run
of tails. These functions, under some technical conditions, are known as random variables.
More formally, a random variable X is a function X : Ω−→R.2 Typically, we will denote
random variables using upper case letters X(ω) or more simply X (where the dependence
on the random outcome ω is implied). We will denote the value that a random variable may
take on using lower case letters x.
In our experiment above, suppose that X(ω) is the number of heads which occur in the
sequence of tosses ω. Given that only 10 coins are tossed, X(ω) can take only a ﬁnite
number of values, so it is known as a discrete random variable. Here, the probability of
the set associated with a random variable X taking on some speciﬁc value k is
P (X =k) :=P ({ω :X(ω) =k}).
As an additional example, suppose that X(ω) is a random variable indicating the amount
of time it takes for a radioactive particle to decay. In this case, X(ω) takes on a inﬁnite
2Technically speaking, not every function is not acceptable as a random variable. From a measure-
theoretic perspective, random variables must be Borel-measurable functions. Intuitively, this restriction
ensures that given a random variable and its underlying outcome space, one can implicitly deﬁne the each of
the events of the event space as being sets of outcomes ω∈ Ω for which X(ω) satisﬁes some property (e.g.,
the event{ω :X(ω)≥ 3}).
5


## Page 6

number of possible values, so it is called a continuous random variable. We denote the
probability that X takes on a value between two real constants a and b (where a<b ) as
P (a≤X≤b) :=P ({ω :a≤X(ω)≤b}).
2.2 Cumulative distribution functions
In order to specify the probability measures used when dealing with random variables, it is
often convenient to specify alternative functions (CDFs, PDFs, and PMFs) from which the
probability measure governing an experiment immediately follows. In this section and the
next two sections, we describe each of these types of functions in turn.
A cumulative distribution function (CDF) is a functionFX : R→ [0, 1] which speciﬁes
a probability measure as,
FX(x)≜P (X≤x). (5)
By using this function one can calculate the probability of any event in F.3 Figure 1 shows
a sample CDF function. A CDF function satisﬁes the following properties.
• 0≤FX(x)≤ 1.
• limx→−∞FX(x) = 0.
• limx→∞FX(x) = 1.
• x≤y =⇒FX(x)≤FX(y).
Figure 1: A cumulative distribution function (CDF).
2.3 Probability mass functions
When a random variable X takes on a ﬁnite set of possible values (i.e., X is a discrete
random variable), a simpler way to represent the probability measure associated with a
3This is a remarkable fact and is actually a theorem that is proved in more advanced courses.
6


## Page 7

random variable is to directly specify the probability of each value that the random variable
can assume. In particular, a probability mass function (PMF) is a functionpX : Ω→ R
such that
pX(x)≜P (X =x).
In the case of discrete random variable, we use the notation Val (X) for the set of possible
values that the random variable X may assume. For example, if X(ω) is a random variable
indicating the number of heads out of ten tosses of coin, then Val (X) ={0, 1, 2,..., 10}.
A PMF function satisﬁes the following properties.
• 0≤pX(x)≤ 1.
• ∑
x∈Val (X)pX(x) = 1.
• ∑
x∈ApX(x) =P (X∈A).
2.4 Probability density functions
For some continuous random variables, the cumulative distribution function FX(x) is diﬀer-
entiable everywhere. In these cases, we deﬁne the Probability Density Function (PDF)
as the derivative of the CDF, i.e.,
fX(x)≜ dFX(x)
dx . (6)
Note here, that the PDF for a continuous random variable may not always exist (i.e., if
FX(x) is not diﬀerentiable everywhere).
According to the properties of diﬀerentiation, for very small ∆ x,
P (x≤X≤x + ∆x)≈fX(x)∆x. (7)
Both CDFs and PDFs (when they exist!) can be used for calculating the probabilities of
diﬀerent events. But it should be emphasized that the value of PDF at any given point x is
not the probability of that event, i.e., fX(x)̸=P (X =x). For example, fX(x) can take on
values larger than one (but the integral of fX(x) over any subset of R will be at most one).
A PDF function satisﬁes the following properties.
• fX(x)≥ 0 .
•
∫∞
−∞fX(x) = 1.
•
∫
x∈AfX(x)dx =P (X∈A).
7


## Page 8

2.5 Expectation
Suppose that X is a discrete random variable with PMF pX(x) and g : R−→ R is an
arbitrary function. In this case, g(X) can be considered a random variable, and we deﬁne
the expectation or expected value of g(X) as
E[g(X)]≜
∑
x∈Val (X)
g(x)pX(x).
If X is a continuous random variable with PDF fX(x), then the expected value of g(X) is
deﬁned as
E[g(X)]≜
∫ ∞
−∞
g(x)fX(x)dx.
Intuitively, the expectation of g(X) can be thought of as a “weighted average” of the values
that g(x) can taken on for diﬀerent values of x, where the weights are given by pX(x) or
fX(x). As a special case of the above, note that the expectation, E[X] of a random variable
itself is found by letting g(x) = x; this is also known as the mean of the random variable
X.
Expectation satisﬁes the following properties:
• E[a] =a for any constant a∈ R.
• E[af(X)] =aE[f(X)] for any constant a∈ R.
• E[f(X) +g(X)] = E[f(X)] +E[g(X)]. This property is known as the linearity of
expectation.
• For a discrete random variable X, E[1{X =k}] =P (X =k).
2.6 Variance
The variance of a random variable X is a measure of how concentrated the distribution of
a random variable X is around its mean. Formally, the variance of a random variable X is
deﬁned as
Var [X]≜E[(X−E(X))2]
Using the properties in the previous section, we can derive an alternate expression for the
variance:
E[(X−E[X])2] = E[X2− 2E[X]X +E[X]2]
= E[X2]− 2E[X]E[X] +E[X]2
= E[X2]−E[X]2,
8


## Page 9

where the second equality follows from linearity of expectations and the fact that E[X] is
actually a constant with respect to the outer expectation.
We note the following properties of the variance.
• Var [a] = 0 for any constant a∈ R.
• Var [af(X)] =a2Var [f(X)] for any constant a∈ R.
Example 2.1.: Calculate the mean and the variance of the uniform random variable X
with PDF fX(x) = 1, ∀x∈ [0, 1], and 0 elsewhere. The expectation of X is
E[X] =
∫ ∞
−∞
xfX(x)dx =
∫ 1
0
xdx = 1
2.
The variance of X can be computed by ﬁrst computing the second moment of X:
E[X2] =
∫ ∞
−∞
x2fX(x)dx =
∫ 1
0
x2dx = 1
3.
Therefore
Var [X] =E[X2]−E[X]2 = 1
3− 1
4 = 1
12.
Example 2.2.: Suppose that g(x) = 1{x∈A} for some subset A⊆ Ω. What is E[g(X)]?
Discrete case:
E[g(X)] =
∑
x∈Val (X)
1{x∈A}PX(x)dx =
∑
x∈A
PX(x)dx =P (x∈A).
Continuous case:
E[g(X)] =
∫ ∞
−∞
1{x∈A}fX(x)dx =
∫
x∈A
fX(x)dx =P (x∈A).
2.7 Some common distributions
In this subsection, we review several common discrete and continuous distributions that are
commonly used throughout the CS 229 class.
Discrete random variables
• X∼Bernoulli(p) (where 0≤p≤ 1): one if a coin with heads probability p comes up
heads, zero otherwise.
p(x) =
{
p if p = 1
1−p if p = 0
9


## Page 10

• X∼Binomial(n,p ) (where 0≤p≤ 1): the number of heads in n independent ﬂips of
a coin with heads probability p.
p(x) =
(n
x
)
px(1−p)n−x
• X∼Geometric(p) (where p> 0): the number of ﬂips of a coin with heads probability
p until the ﬁrst heads.
p(x) =p(1−p)x−1
• X ∼ Poisson (λ) (where λ > 0): a probability distribution over the nonnegative
integers used for modeling the frequency of rare events.
p(x) =e−λλx
x!
Continuous random variables
• X∼Uniform (a,b ) (where a<b ): equal probability density to every value between a
and b on the real line.
f(x) =
{
1
b−a if a≤x≤b
0 otherwise
• X∼Exponential(λ) (whereλ> 0): decaying probability density over the nonnegative
reals.
f(x) =
{
λe−λx if x≥ 0
0 otherwise
• X∼Normal (µ,σ 2): also known as the Gaussian distribution
f(x) = 1√
2πσe− 1
2σ2 (x−µ)2
The shape of the PDFs and CDFs of some of these random variables are shown in Figure 2.
The following table is the summary of some of the properties of these distributions.
10


## Page 11

Figure 2: PDF and CDF of a couple of random variables.
Distribution PDF or PMF Mean Variance
Bernoulli(p)
{ p, if x = 1
1−p, if x = 0. p p(1−p)
Binomial(n,p )
(n
k
)
pk(1−p)n−k for 0≤k≤n np npq
Geometric(p) p(1−p)k−1 for k = 1, 2,... 1
p
1−p
p2
Poisson (λ) e−λλx/x! for k = 1, 2,... λ λ
Uniform (a,b ) 1
b−a ∀x∈ (a,b ) a+b
2
(b−a)2
12
Gaussian(µ,σ 2) 1
σ
√
2πe− (x−µ)2
2σ2 µ σ2
Exponential(λ) λe−λx x≥ 0,λ> 0 1
λ
1
λ2
3 Two Random Variables
Thus far, we have considered single random variables. In many situations, however, there
may be more than one quantity that we are interested in knowing during a random exper-
iment. For instance, in an experiment where we ﬂip a coin ten times, we may care about
both {
X(ω) = the number of heads that come up,
Y (ω) = the length of the longest run of consecutive heads.
In this section, we consider the setting of two random variables.
3.1 Joint and marginal distributions
Suppose that we have two random variables X and Y . One way to work with these two
random variables is to consider each of them separately. If we do that we will only needFX(x)
and FY (y). But if we want to know about the values that X and Y assume simultaneously
11


## Page 12

during outcomes of a random experiment, we require a more complicated structure known
as the joint cumulative distribution function of X and Y , deﬁned by
FXY (x,y ) =P (X≤x,Y ≤y)
It can be shown that by knowing the joint cumulative distribution function, the probability
of any event involving X and Y can be calculated.
The joint CDF FXY (x,y ) and the joint distribution functions FX(x) and FY (y) of each
variable separately are related by
FX(x) = lim
y→∞
FXY (x,y )dy
FY (y) = lim
x→∞
FXY (x,y )dx.
Here, we call FX(x) and FY (y) the marginal cumulative distribution functions of
FXY (x,y ). The joint CDF satisﬁes the following properties
• 0≤FXY (x,y )≤ 1.
• limx,y→∞FXY (x,y ) = 1.
• limx,y→−∞FXY (x,y ) = 0.
• FX(x) = limy→∞FXY (x,y ).
3.2 Joint and marginal probability mass functions
If X and Y are discrete random variables, then the joint probability mass function
pXY : R× R→ [0, 1] is deﬁned by
pXY (x,y ) =P (X =x,Y =y).
Here, 0≤PXY (x,y )≤ 1 for all x,y , and ∑
x∈Val (X)
∑
y∈Val (Y )PXY (x,y ) = 1.
How does the joint PMF over two variables relate to the probability mass function for each
variable separately? It turns out that
pX(x) =
∑
y
pXY (x,y ).
and similarly for pY (y). In this case, we refer to pX(x) as the marginal probability mass
function of X. In statistics, the process of forming the marginal distribution with respect
to one variable by summing out the other variable is often known as “marginalization.”
12


## Page 13

3.3 Joint and marginal probability density functions
Let X and Y be two continuous random variables with joint distribution function FXY . In
the case that FXY (x,y ) is everywhere diﬀerentiable in both x andy, then we can deﬁne the
joint probability density function,
fXY (x,y ) = ∂2FXY (x,y )
∂x∂y .
Like in the single-dimensional case, fXY (x,y )̸=P (X =x,Y =y), but rather
∫ ∫
x∈A
fXY (x,y )dxdy =P ((X,Y )∈A).
Note that the values of the probability density functionfXY (x,y ) are always nonnegative, but
they may be greater than 1. Nonetheless, it must be the case that
∫∞
−∞
∫∞
−∞fXY (x,y ) = 1.
Analagous to the discrete case, we deﬁne
fX(x) =
∫ ∞
−∞
fXY (x,y )dy,
as the marginal probability density function(or marginal density) ofX, and similarly
for fY (y).
3.4 Conditional distributions
Conditional distributions seek to answer the question, what is the probability distribution
over Y , when we know that X must take on a certain value x? In the discrete case, the
conditional probability mass function of Y givenX is simply
pY|X(y|x) = pXY (x,y )
pX(x) ,
assuming that pX(x)̸= 0.
In the continuous case, the situation is technically a little more complicated because the
probability that a continuous random variable X takes on a speciﬁc value x is equal to
zero4. Ignoring this technical point, we simply deﬁne, by analogy to the discrete case, the
4To get around this, a more reasonable way to calculate the conditional CDF is,
FY|X(y,x ) = lim
∆x→0
P (Y ≤y|x≤X≤x + ∆x).
It can be easily seen that if F (x,y ) is diﬀerentiable in both x,y then,
FY|X(y,x ) =
∫ y
−∞
fX,Y (x,α )
fX(x) dα
13


## Page 14

conditional probability density of Y givenX =x to be
fY|X(y|x) = fXY (x,y )
fX(x) ,
providedfX(x)̸= 0.
An important relationship of conditional distribution and marginal distribution is theLaw of
total expectation. This result can be viewed as an extension of the law of total probability
disucssed in Section 1.
Theorem 3.1.: Let X,Y be two random variables deﬁend on the same probability space,
then
E[X] =E[E[X|Y ]]. (8)
3.5 Bayes’ rule for random variables
We can derive the bayes’ rule for random variables as follows. It arises when trying to derive
expression for the conditional probability of one variable given another.
In the case of discrete random variables X and Y ,
PY|X(y|x) = PXY (x,y )
PX(x) = PX|Y (x|y)PY (y)∑
y′∈Val (Y )PX|Y (x|y′)PY (y′).
If the random variables X and Y are continuous,
fY|X(y|x) = fXY (x,y )
fX(x) = fX|Y (x|y)fY (y)∫∞
−∞fX|Y (x|y′)fY (y′)dy′.
3.6 Independence of random variables
Two random variablesX andY are independent ifFXY (x,y ) =FX(x)FY (y) for all values
of x and y. Equivalently,
• For discrete random variables,pXY (x,y ) =pX(x)pY (y) for allx∈Val (X),y∈Val (Y ).
• For discrete random variables, pY|X(y|x) = pY (y) whenever pX(x)̸= 0 for all y ∈
Val (Y ).
• For continuous random variables,fXY (x,y ) =fX(x)fY (y) for all x,y∈ R.
and therefore we deﬁne the conditional PDF of Y givenX =x in the following way,
fY|X(y|x) = fXY (x,y )
fX(x)
14


## Page 15

• For continuous random variables,fY|X(y|x) =fY (y) wheneverfX(x)̸= 0 for ally∈ R.
Informally, two random variablesX and Y are independent if “knowing” the value of one
variable will never have any eﬀect on the conditional probability distribution of the other
variable, that is, you know all the information about the pair ( X,Y ) by just knowing f(x)
and f(y). The following lemma formalizes this observation:
Lemma 3.2.: If X and Y are independent then for any subsets A,B⊆ R, we have,
P (X∈A,Y ∈B) =P (X∈A)P (Y∈B)
By using the above lemma one can prove that if X is independent of Y then any function
of X is independent of any function of Y .
3.7 Expectation and covariance
Suppose that we have two discrete random variables X,Y andg : R2−→R is a function of
these two random variables. Then the expected value of g is deﬁned in the following way,
E[g(X,Y )]≜
∑
x∈Val (X)
∑
y∈Val (Y )
g(x,y )pXY (x,y ).
For continuous random variablesX,Y , the analogous expression is
E[g(X,Y )] =
∫ ∞
−∞
∫ ∞
−∞
g(x,y )fXY (x,y )dxdy.
We can use the concept of expectation to study the relationship of two random variables
with each other. In particular, the covariance of two random variables X andY is deﬁned
as
Cov[X,Y ] ≜ E[(X−E[X])(Y−E[Y ])]
Using an argument similar to that for variance, we can rewrite this as,
Cov[X,Y ] = E[(X−E[X])(Y−E[Y ])]
= E[XY −XE [Y ]−YE [X] +E[X]E[Y ]]
= E[XY ]−E[X]E[Y ]−E[Y ]E[X] +E[X]E[Y ]]
= E[XY ]−E[X]E[Y ].
Here, the key step in showing the equality of the two forms of covariance is in the third
equality, where we use the fact thatE[X] andE[Y ] are actually constants which can be pulled
out of the expectation. When Cov[X,Y ] = 0, we say that X and Y are uncorrelated5.
5However, this is not the same thing as stating that X and Y are independent! For example, if X∼
Uniform (−1, 1) and Y =X2, then one can show that X andY are uncorrelated, even though they are not
independent.
15


## Page 16

We note the following properties of expectation and covariance.
• (Linearity of expectation) E[f(X,Y ) +g(X,Y )] =E[f(X,Y )] +E[g(X,Y )].
• Var [X +Y ] =Var [X] +Var [Y ] + 2Cov[X,Y ].
• If X and Y are independent, then Cov[X,Y ] = 0.
• If X and Y are independent, then E[f(X)g(Y )] =E[f(X)]E[g(Y )].
4 Multiple Random Variables
The notions and ideas introduced in the previous section can be generalized to more than
two random variables. In this section, for simplicity of presentation, we focus only on the
continuous case, but the generalization to discrete random variables works similarly.
4.1 Basic properties
Suppose that we have n continuous random variables, X1(ω),X 2(ω),...X n(ω). We can
deﬁne the joint distribution function ofX1,X 2,...,X n, the joint probability density
function of X1,X 2,...,X n, the marginal probability density function of X1, and the
conditional probability density function of X1 givenX2,...,X n, as
FX1,X2,...,Xn(x1,x 2,...x n) = P (X1≤x1,X 2≤x2,...,X n≤xn)
fX1,X2,...,Xn(x1,x 2,...x n) = ∂nFX1,X2,...,Xn(x1,x 2,...x n)
∂x1...∂x n
fX1(X1) =
∫ ∞
−∞
···
∫ ∞
−∞
fX1,X2,...,Xn(x1,x 2,...x n)dx2...dx n
fX1|X2,...,Xn(x1|x2,...x n) = fX1,X2,...,Xn(x1,x 2,...x n)
fX2,...,Xn(x1,x 2,...x n)
To calculate the probability of an event A⊆ Rn we have,
P ((x1,x 2,...x n)∈A) =
∫
(x1,x2,...xn)∈A
fX1,X2,...,Xn(x1,x 2,...x n)dx1dx2...dx n (9)
From the deﬁnition of conditional probabilities for multiple random variables, one can es-
tablish the following theorem of chain rule.
16


## Page 17

Theorem 4.1.: [Chain rule]
f(x1,x 2,...,x n) = f(xn|x1,x 2...,x n−1)f(x1,x 2...,x n−1)
= f(xn|x1,x 2...,x n−1)f(xn−1|x1,x 2...,x n−2)f(x1,x 2...,x n−2)
= ... = f(x1)
n∏
i=2
f(xi|x1,...,x i−1).
Particularly, we say that random variables X1,...,X n are independent if
f(x1,...,x n) =f(x1)f(x2)··· f(xn).
Here, the deﬁnition of mutual independence is simply the natural generalization of indepen-
dence of two random variables to multiple random variables.
Independent random variables arise often in machine learning algorithms where we assume
that the training examples belonging to the training set represent independent samples from
some unknown probability distribution. To make the signiﬁcance of independence clear,
consider a “bad” training set in which we ﬁrst sample a single training example ( x(1),y (1))
from the some unknown distribution, and then add m− 1 copies of the exact same training
example to the training set. In this case, we have (with some abuse of notation)
P ((x(1),y (1)),.... (x(m),y (m)))̸=
m∏
i=1
P (x(i),y (i)).
Despite the fact that the training set has size m, the examples are not independent! While
clearly the procedure described here is not a sensible method for building a training set for a
machine learning algorithm, it turns out that in practice, non-independence of samples does
come up often, and it has the eﬀect of reducing the “eﬀective size” of the training set.
4.2 Random vectors, expectation and covariance
Suppose that we have n random variables. When working with all these random variables
together, we will often ﬁnd it convenient to put them in a vector X = [X1 X2 ... Xn]T . We
call the resulting vector a random vector (more formally, a random vector is a mapping
from Ω to Rn). It should be clear that random vectors are simply an alternative notation for
dealing withn random variables, so the notions of joint PDF and CDF will apply to random
vectors as well.
Expectation. Consider an arbitrary function from g : Rn→ R. The expected value of
this function is deﬁned as
E[g(X)] =
∫
Rn
g(x1,x 2,...,x n)fX1,X2,...,Xn(x1,x 2,...x n)dx1dx2...dx n, (10)
17


## Page 18

where
∫
Rn is n consecutive integrations from−∞ to∞. If g is a function from Rn to Rm,
then the expected value of g is the element-wise expected values of the output vector, i.e., if
g is
g(x) =


g1(x)
g2(x)
...
gm(x)

,
Then,
E[g(X)] =


E[g1(X)]
E[g2(X)]
...
E[gm(X)]

.
Covariance. For a given random vector X : Ω→ Rn, its covariance matrix Σ is the
n×n square matrix whose entries are given by Σ ij =Cov[Xi,Xj].
From the deﬁnition of covariance, we have
Σ =


Cov[X1,X 1] ··· Cov[X1,Xn]
... ... ...
Cov[Xn,X 1] ··· Cov[Xn,Xn]


=


E[X2
1]−E[X1]E[X1] ··· E[X1Xn]−E[X1]E[Xn]
... ... ...
E[XnX1]−E[Xn]E[X1] ··· E[X2
n]−E[Xn]E[Xn]


=


E[X2
1] ··· E[X1Xn]
... ... ...
E[XnX1] ··· E[X2
n]

−


E[X1]E[X1] ··· E[X1]E[Xn]
... ... ...
E[Xn]E[X1] ··· E[Xn]E[Xn]


= E[XXT ]−E[X]E[X]T =... =E[(X−E[X])(X−E[X])T ].
where the matrix expectation is deﬁned in the obvious way.
As seen in the following proposition, the covariance matrix ofany random vector must always
be symmetric positive semideﬁnite:
Proposition 4.2.: Suppose that Σ is the covariance matrix corresponding to some random
vectorX. Then Σ is symmetric positive semideﬁnite.
Proof. The symmetry of Σ follows immediately from its deﬁnition. Next, for any vector
18


## Page 19

z∈ Rn, observe that
zT Σz =
n∑
i=1
n∑
j=1
(Σijzizj) (11)
=
n∑
i=1
n∑
j=1
(Cov[Xi,Xj]·zizj)
=
n∑
i=1
n∑
j=1
(E[(Xi−E[Xi])(Xj−E[Xj])]·zizj)
=E
[ n∑
i=1
n∑
j=1
(Xi−E[Xi])(Xj−E[Xj])·zizj
]
. (12)
Here, (11) follows from the formula for expanding a quadratic form (see section notes on
linear algebra), and (12) follows by linearity of expectations (see probability notes).
To complete the proof, observe that the quantity inside the brackets is of the form∑
i
∑
jxixjzizj =
(xTz)2≥ 0. Therefore, the quantity inside the expectation is always nonnegative, and hence
the expectation itself must be nonnegative. We conclude that zT Σz≥ 0.
4.3 The law of large numbers and Central limit theorem
A common scenario to generate a series of random variables is to repeat the same experiment
for a large number of times. An important probabilistic claim is that the average of the results
obtained from a large number of trials should converge to its expected value (mean). This
rule is called The law of large numbers (LLN) which we formally state as below
Theorem 4.3. :[Strong Law of Large Numbers] LetX1,X 2,..., be a series of independent and
identically distributed (usually abbreviated as i.i.d.) random variables for which E[|X1|]<∞.
Then
P
(
lim
n→∞
1
n
n∑
i=1
Xi =E[X1]
)
= 1. (13)
The convergence stated in Theorem 4.3 is also known as the almost surely convergence in
probabilistic literature, since the empirical average of sequence converges to the expected
value with probability 1.
A natural follow-up question to ask is howfast the empirical average converges to its expected
value. The central limit theorem (CLT) answers this question through a reﬁnement of
the law of the large numbers.
Theorem 4.4.: [Central Limit Theorem] Let X1,X 2,... be a series of iid random variables
19


## Page 20

with mean µ and variance σ2. Then the normalized partial sum
ξn≜ 1√n
n∑
i=1
(Xi−µ
σ
)
(14)
satisﬁes
lim
n→∞
P (ξn≤x) = Φ(x) (15)
for any x, where Φ is CDF of the standard normal distribution.
The convergence stated in (15) is also known as convergence in distribution in probabilistic
literature. THeorem 4.4 shows that irrespective of what distribution X follows, its normal-
ized partial sum (or average) is always a normal distribution! So when the number of samples
are large, we can approximate any distribution using a normal distribtution.
Note that both LLN and CLT can be extended to multi-dimensional random vectors, and
generalized to weaker assumptions. The proofs of both theorems are out of the scope of this
class.
5 The Multivariate Gaussian Distribution
One particularly important example of a probability distribution over random vectors X is
called the multivariate Gaussian or multivariate normal distribution. A random vector
X∈ Rd is said to have a multivariate normal (or Gaussian) distribution with mean µ∈ Rd
and covariance matrix Σ∈ Sd
++ (where Sd
++ refers to the space of symmetric positive deﬁnite
d×d matrices)
fX1,X2,...,Xd(x1,x 2,...,x d;µ, Σ) = 1
(2π)d/2|Σ|1/2 exp
(
−1
2(x−µ)T Σ−1(x−µ)
)
.
We write this asX∼N (µ, Σ). In this section, we describe multivariate Gaussians and some
of their basic properties.
Generally speaking, Gaussian random variables are extremely useful in machine learning and
statistics for two main reasons. First, they are extremely common when modeling “noise”
in statistical algorithms. Quite often, noise can be considered to be the accumulation of a
large number of small independent random perturbations aﬀecting the measurement process;
by the Central Limit Theorem, summations of independent random variables will tend to
“look Gaussian.” Second, Gaussian random variables are convenient for many analytical
manipulations, because many of the integrals involving Gaussian distributions that arise in
practice have simple closed form solutions. We will encounter this later in the course.
20


## Page 21

5.1 Relationship to univariate Gaussians
Recall that the density function of a univariate normal (or Gaussian) distribution is
given by
f(x;µ,σ 2) = 1√
2πσ exp
(
− 1
2σ2 (x−µ)2
)
.
Here, the argument of the exponential function,− 1
2σ2 (x−µ)2, is a quadratic function of the
variablex. Furthermore, the parabola points downwards, as the coeﬃcient of the quadratic
term is negative. The coeﬃcient in front, 1√
2πσ , is a constant that does not depend on x;
hence, we can think of it as simply a “normalization factor” used to ensure that
1√
2πσ
∫ ∞
−∞
exp
(
− 1
2σ2 (x−µ)2
)
= 1.
In the case of the multivariate Gaussian density, the argument of the exponential function,
− 1
2(x−µ)T Σ−1(x−µ), is a quadratic form in the vector variable x. Since Σ is positive
deﬁnite, and since the inverse of any positive deﬁnite matrix is also positive deﬁnite, then
for any non-zero vector z, zT Σ−1z >0. This implies that for any vector x̸=µ,
(x−µ)T Σ−1(x−µ)> 0
−1
2(x−µ)T Σ−1(x−µ)< 0.
Like in the univariate case, you can think of the argument of the exponential function as
being a downward opening quadratic bowl. The coeﬃcient in front (i.e., 1
(2π)d/2|Σ|1/2 ) has an
even more complicated form than in the univariate case. However, it still does not depend
on x, and hence it is again simply a normalization factor used to ensure that
1
(2π)d/2|Σ|1/2
∫ ∞
−∞
∫ ∞
−∞
···
∫ ∞
−∞
exp
(
−1
2(x−µ)T Σ−1(x−µ)
)
dx1dx2··· dxd = 1.
5.2 The covariance matrix
The following proposition gives an alternative way to characterize the covariance matrix of
a random vector X:
Proposition 5.1.: For any random vector X with mean µ and covariance matrix Σ,
Σ =E[(X−µ)(X−µ)T ] =E[XXT ]−µµT. (16)
21


## Page 22

0 1 2 3 4 5 6 7 8 9 10
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
−10
−5
0
5
10
−10
−5
0
5
10
0
0.005
0.01
0.015
0.02
Figure 3: The ﬁgure on the left shows a univariate Gaussian density for a single variable X.
The ﬁgure on the right shows a multivariate Gaussian density over two variablesX1 andX2.
Proof. We prove the ﬁrst of the two equalities in (16); the proof of the other equality is
similar.
Σ =


Cov[X1,X 1] ··· Cov[X1,Xd]
... ... ...
Cov[Xd,X 1] ··· Cov[Xd,Xd]


=


E[(X1−µ1)2] ··· E[(X1−µ1)(Xd−µd)]
... ... ...
E[(Xd−µd)(X1−µ1)] ··· E[(Xd−µd)2]


=E


(X1−µ1)2 ··· (X1−µ1)(Xd−µd)
... ... ...
(Xd−µd)(X1−µ1) ··· (Xd−µd)2

 (17)
=E




X1−µ1
...
Xd−µd


[
X1−µ1··· Xd−µd
]

 (18)
=E
[
(X−µ)(X−µ)T ]
.
Here, (17) follows from the fact that the expectation of a matrix is simply the matrix found
by taking the componentwise expectation of each entry. Also, (18) follows from the fact that
for any vector z∈ Rd,
zzT =


z1
z2
...
zd


[
z1 z2 ··· zd
]
=


z1z1 z1z2 ··· z1zd
z2z1 z2z2 ··· z2zd
... ... ... ...
zdz1 zdz2 ··· zdzd

.
22


## Page 23

In the deﬁnition of multivariate Gaussians, we required that the covariance matrix Σ be
symmetric positive deﬁnite (i.e., Σ ∈ Sd
++). Why does this restriction exist? First, Σ must
be symmetric positive semideﬁnite in order for it to be a valid covariance matrix. However,
in order for Σ−1 to exist (as required in the deﬁnition of the multivariate Gaussian density),
then Σ must be invertible and hence full rank. Since any full rank symmetric positive
semideﬁnite matrix is necessarily symmetric positive deﬁnite, it follows that Σ must be
symmetric positive deﬁnite.
5.3 The diagonal covariance matrix case
To get an intuition for what a multivariate Gaussian is, consider the simple case wheren = 2,
and where the covariance matrix Σ is diagonal, i.e.,
x =
[x1
x2
]
µ =
[µ1
µ2
]
Σ =
[σ2
1 0
0 σ2
2
]
In this case, the multivariate Gaussian density has the form,
f(x;µ, Σ) = 1
2π
⏐⏐⏐⏐
σ2
1 0
0 σ2
2
⏐⏐⏐⏐
1/2 exp
(
−1
2
[x1−µ1
x2−µ2
]T [σ2
1 0
0 σ2
2
]−1 [x1−µ1
x2−µ2
])
= 1
2π(σ2
1·σ2
2− 0· 0)1/2 exp
(
−1
2
[x1−µ1
x2−µ2
]T [ 1
σ2
1
0
0 1
σ2
2
] [x1−µ1
x2−µ2
])
,
where we have relied on the explicit formula for the determinant of a 2× 2 matrix6, and the
fact that the inverse of a diagonal matrix is simply found by taking the reciprocal of each
diagonal entry. Continuing,
f(x;µ, Σ) = 1
2πσ1σ2
exp
(
−1
2
[x1−µ1
x2−µ2
]T [ 1
σ2
1
(x1−µ1)
1
σ2
2
(x2−µ2)
])
= 1
2πσ1σ2
exp
(
− 1
2σ2
1
(x1−µ1)2− 1
2σ2
2
(x2−µ2)2
)
= 1√
2πσ1
exp
(
− 1
2σ2
1
(x1−µ1)2
)
· 1√
2πσ2
exp
(
− 1
2σ2
2
(x2−µ2)2
)
.
The last equation we recognize to simply be the product of two independent Gaussian den-
sities, one with mean µ1 and variance σ2
1, and the other with mean µ2 and variance σ2
2.
6Namely,
⏐⏐⏐⏐
a b
c d
⏐⏐⏐⏐ =ad−bc.
23


## Page 24

More generally, one can show that and-dimensional Gaussian with meanµ∈ Rd and diagonal
covariance matrix Σ = diag( σ2
1,σ 2
2,...,σ 2
d) is the same as a collection of d independent
Gaussian random variables with mean µi and variance σ2
i , respectively.
5.4 Isocontours
Another way to understand a multivariate Gaussian conceptually is to understand the shape
of its isocontours. For a function f : R2→ R, an isocontour is a set of the form
{
x∈ R2 :f(x) =c
}
.
for some c∈ R.7
5.4.1 Shape of isocontours
What do the isocontours of a multivariate Gaussian look like? As before, let’s consider the
case where d = 2, and Σ is diagonal, i.e.,
x =
[x1
x2
]
µ =
[µ1
µ2
]
Σ =
[σ2
1 0
0 σ2
2
]
As we showed in the last subsection,
p(x;µ, Σ) = 1
2πσ1σ2
exp
(
− 1
2σ2
1
(x1−µ1)2− 1
2σ2
2
(x2−µ2)2
)
. (19)
Now, let’s consider the level set consisting of all points wheref(x;µ, Σ) =c for some constant
c∈ R. In particular, consider the set of all x1,x 2∈ R such that
c = 1
2πσ1σ2
exp
(
− 1
2σ2
1
(x1−µ1)2− 1
2σ2
2
(x2−µ2)2
)
2πcσ1σ2 = exp
(
− 1
2σ2
1
(x1−µ1)2− 1
2σ2
2
(x2−µ2)2
)
log(2πcσ1σ2) =− 1
2σ2
1
(x1−µ1)2− 1
2σ2
2
(x2−µ2)2
log
( 1
2πcσ1σ2
)
= 1
2σ2
1
(x1−µ1)2 + 1
2σ2
2
(x2−µ2)2
1 = (x1−µ1)2
2σ2
1 log
(
1
2πcσ1σ2
)+ (x2−µ2)2
2σ2
2 log
(
1
2πcσ1σ2
).
7Isocontours are often also known as level curves. More generally, a level set of a functionf : Rd→ R,
is a set of the form
{
x∈ R2 :f(x) =c
}
for some c∈ R.
24


## Page 25

−6 −4 −2 0 2 4 6 8 10 12
−6
−4
−2
0
2
4
6
8
−4 −2 0 2 4 6 8 10
−4
−2
0
2
4
6
8
Figure 4:
The ﬁgure on the left shows a heatmap indicating values of the density function for an
axis-aligned multivariate Gaussian with mean µ =
[3
2
]
and diagonal covariance matrix Σ =
[25 0
0 9
]
. Notice that the Gaussian is centered at (3 , 2), and that the isocontours are all
elliptically shaped with major/minor axis lengths in a 5:3 ratio. The ﬁgure on the right
shows a heatmap indicating values of the density function for a non axis-aligned multivariate
Gaussian with mean µ =
[3
2
]
and covariance matrix Σ =
[10 5
5 5
]
. Here, the ellipses are
again centered at (3, 2), but now the major and minor axes have been rotated via a linear
transformation.
Deﬁning
r1 =
√
2σ2
1 log
( 1
2πcσ1σ2
)
r2 =
√
2σ2
2 log
( 1
2πcσ1σ2
)
,
it follows that
1 =
(x1−µ1
r1
)2
+
(x2−µ2
r2
)2
. (20)
Equation (20) should be familiar to you from high school analytic geometry: it is the equation
of an axis-aligned ellipse, with center (µ1,µ 2), where the x1 axis has length 2r1 and the
x2 axis has length 2r2!
5.4.2 Length of axes
To get a better understanding of how the shape of the level curves vary as a function of
the variances of the multivariate Gaussian distribution, suppose that we are interested in
25


## Page 26

the values of r1 and r2 at which c is equal to a fraction 1 /e of the peak height of Gaussian
density.
First, observe that maximum of Equation (19) occurs where x1 = µ1 and x2 = µ2. Substi-
tuting these values into Equation (19), we see that the peak height of the Gaussian density
is 1
2πσ1σ2
.
Second, we substitute c = 1
e
(
1
2πσ1σ2
)
into the equations for r1 and r2 to obtain
r1 =
√2σ2
1 log

 1
2πσ1σ2· 1
e
(
1
2πσ1σ2
)

 =σ1
√
2
r2 =
√2σ2
2 log

 1
2πσ1σ2· 1
e
(
1
2πσ1σ2
)

 =σ2
√
2.
From this, it follows that the axis length needed to reach a fraction 1/e of the peak height of
the Gaussian density in the ith dimension grows in proportion to the standard deviation σi.
Intuitively, this again makes sense: the smaller the variance of some random variable xi, the
more “tightly” peaked the Gaussian distribution in that dimension, and hence the smaller
the radius ri.
5.4.3 Non-diagonal case, higher dimensions
Clearly, the above derivations rely on the assumption that Σ is a diagonal matrix. However,
in the non-diagonal case, it turns out that the picture is not all that diﬀerent. Instead
of being an axis-aligned ellipse, the isocontours turn out to be simply rotated ellipses .
Furthermore, in the d-dimensional case, the level sets form geometrical structures known as
ellipsoids in Rd.
5.5 Linear transformation
In the last few subsections, we focused primarily on providing an intuition for how multi-
variate Gaussians with diagonal covariance matrices behaved. In particular, we found that
an d-dimensional multivariate Gaussian with diagonal covariance matrix could be viewed
simply as a collection of d independent Gaussian-distributed random variables with means
and variances µi and σ2
i , respectvely. In this section, we dig a little deeper and provide
a quantitative interpretation of multivariate Gaussians when the covariance matrix is not
diagonal.
The key result of this section is the following theorem (see proof in Appendix A).
Theorem 5.2.: Let X∼N (µ, Σ) for some µ∈ Rd and Σ∈ Sd
++. Then, there exists a
matrix B∈ Rd×d such that if we deﬁne Z =B−1(X−µ), then Z∼N (0,I ).
26


## Page 27

To understand the meaning of this theorem, note that ifZ∼N (0,I ), then using the analysis
from Section 5.4, Z can be thought of as a collection of d independent standard normal
random variables (i.e., Zi∼N (0, 1)). Furthermore, if Z =B−1(X−µ) then X =BZ +µ
follows from simple algebra.
Consequently, the theorem states that any random variable X with a multivariate Gaussian
distribution can be interpreted as the result of applying a linear transformation (X =BZ +µ)
to some collection of d independent standard normal random variables (Z).
5.6 Closure properties
A fancy feature of the multivariate Gaussian distribution is the following set of closure
properties:
• The sum of independent Gaussian random variables is Gaussian.
• The marginal of a joint Gaussian distribution is Gaussian.
• The conditional of a joint Gaussian distribution is Gaussian.
In this subsection, we’ll go through each of the closure properties, and we’ll either prove the
property or at least give some type of intuition as to why the property is true.
5.6.1 Sum of independent Gaussians is Gaussian
The formal statement of this rule is:
Theorem 5.3.: Suppose that y∼N (µ, Σ) and z∼N (µ′, Σ′) are independent Gaussian
distributed random variables, where µ,µ′∈ Rd and Σ, Σ′∈ Sd
++. Then, their sum is also
Gaussian:
y +z∼N (µ +µ′, Σ + Σ′).
Before we prove anything, here are some observations:
1. The ﬁrst thing to point out is that the importance of the independence assumption in
the above rule. To see why this matters, suppose that y∼N (µ, Σ) for some mean
vector µ and covariance matrix Σ, and suppose that z =−y. Clearly, z also has a
Gaussian distribution (in fact, z∼N (−µ, Σ), but y +z is identically zero!
2. The second thing to point out is a point of confusion for many students: if we add
together two Gaussian densities (“bumps” in multidimensional space), wouldn’t we get
back some bimodal (i.e., “two-humped” density)? Here, the thing to realize is that the
density of the random variable y +z in this rule is NOT found by simply adding the
densities of the individual random variables y and z. Rather, the density of y +z will
27


## Page 28

actually turn out to be a convolution of the densities for y and z.8 To show that the
convolution of two Gaussian densities gives a Gaussian density, however, is beyond the
scope of this class.
Instead, we will only show that the addition y +z has mean µ +µ′ and covariance Σ + Σ′.
For the mean, we have
E[yi +zi] =E[yi] +E[zi] =µi +µ′
i
from linearity of expectations. Therefore, the mean of y +z is simply µ +µ′. Also, the
(i,j )th entry of the covariance matrix is given by
E[(yi +zi)(yj +zj)]−E[yi +zi]E[yj +zj]
=E[yiyj +ziyj +yizj +zizj]− (E[yi] +E[zi])(E[yj] +E[zj])
=E[yiyj] +E[ziyj] +E[yizj] +E[zizj]−E[yi]E[yj]−E[zi]E[yj]−E[yi]E[zj]−E[zi][zj]
= (E[yiyj]−E[yi]E[yj]) + (E[zizj]−E[zi]E[zj])
+ (E[ziyj]−E[zi]E[yj]) + (E[yizj]−E[yi]E[zj]).
Using the fact that y and z are independent, we have E[ziyj] = E[zi]E[yj] and E[yizj] =
E[yi]E[zj]. Therefore, the last two terms drop out, and we are left with,
E[(yi +zi)(yj +zj)]−E[yi +zi]E[yj +zj]
= (E[yiyj]−E[yi]E[yj]) + (E[zizj]−E[zi]E[zj])
= Σij + Σ′
ij.
From this, we can conclude that the covariance matrix of y +z is simply Σ + Σ′.
5.6.2 Marginal of a joint Gaussian is Gaussian
The formal statement of this rule is:
Theorem 5.4.: Suppose that
[xA
xB
]
∼N
([µA
µB
]
,
[ΣAA ΣAB
ΣBA ΣBB
])
,
8For example, if y and z were univariate Gaussians (i.e., y ∼ N(µ,σ 2), z ∼ N(µ′,σ′2)), then the
convolution of their probability densities is given by
p(y +z;µ,µ′,σ 2,σ′2) =
∫ ∞
−∞
p(w;µ,σ 2)p(y +z−w;µ′,σ′2)dw
=
∫ ∞
−∞
1√
2πσ exp
(
− 1
2σ2 (w−µ)2
)
· 1√
2πσ′ exp
(
− 1
2σ′2 (y +z−w−µ′)2
)
dw
28


## Page 29

where xA∈ Rn, xB∈ Rd, and the dimensions of the mean vectors and covariance matrix
subblocks are chosen to match xA and xB. Then, the marginal densities,
p(xA) =
∫
xB∈Rd
p(xA,xB;µ, Σ)dxB
p(xB) =
∫
xA∈Rn
p(xA,xB;µ, Σ)dxA
are Gaussian:
xA∼N (µA, ΣAA)
xB∼N (µB, ΣBB).
To justify this rule, let’s just focus on the marginal distribution with respect to the variables
xA.9
First, note that computing the mean and covariance matrix for a marginal distribution is
easy: simply take the corresponding subblocks from the mean and covariance matrix of the
joint density. To make sure this is absolutely clear, let’s look at the covariance between xA,i
and xA,j (the ith component of xA and the jth component of xA). Note that xA,i and xA,j
are also the ith and jth components of
[xA
xB
]
(sincexA appears at the top of this vector). To ﬁnd their covariance, we need to simply look
at the (i,j )th element of the covariance matrix,
[ΣAA ΣAB
ΣBA ΣBB
]
.
The (i,j )th element is found in the Σ AA subblock, and in fact, is precisely Σ AA,ij. Using
this argument for all i,j ∈{ 1,...,m }, we see that the covariance matrix for xA is simply
ΣAA. A similar argument can be used to ﬁnd that the mean of xA is simply µA. Thus, the
above argument tells us that if we knew that the marginal distribution over xA is Gaussian,
then we could immediately write down a density function for xA in terms of the appropriate
submatrices of the mean and covariance matrices for the joint density!
The above argument, though simple, however, is somewhat unsatisfying: how can we actually
be sure that xA has a multivariate Gaussian distribution? The argument for this is slightly
long-winded, so rather than saving up the punchline, here’s our plan of attack up front:
9In general, for a random vector x which has a Gaussian distribution, we can always permute entries of
x so long as we permute the entries of the mean vector and the rows/columns of the covariance matrix in
the corresponding way. As a result, it suﬃces to look only at xA, and the result for xB follows immediately.
29


## Page 30

1. Write the integral form of the marginal density explicitly.
2. Rewrite the integral by partitioning the inverse covariance matrix.
3. Use a “completion-of-squares” argument to evaluate the integral over xB.
4. Argue that the resulting density is Gaussian.
Let’s see each of these steps in action.
The marginal density in integral form Suppose that we wanted to compute the density
function of xA directly. Then, we would need to compute the integral,
p(xA) =
∫
xB∈Rd
p(xA,xB;µ, Σ)dxB
= 1
(2π)
n+n
2
⏐⏐⏐⏐
ΣAA ΣAB
ΣBA ΣBB
⏐⏐⏐⏐
1/2
∫
xB∈Rd
exp
(
−1
2
[xA−µA
xB−µB
]T [ΣAA ΣAB
ΣBA ΣBB
]−1 [xA−µA
xB−µB
])
dxB.
Partitioning the inverse covariance matrix To make any sort of progress, we’ll need
to write the matrix product in the exponent in a slightly diﬀerent form. In particular, let us
deﬁne the matrix V∈ R(m+n)×(m+n) as10
V =
[VAA VAB
VBA VBB
]
= Σ−1.
It might be tempting to think that
V =
[VAA VAB
VBA VBB
]
=
[ΣAA ΣAB
ΣBA ΣBB
]−1
“=”
[Σ−1
AA Σ−1
AB
Σ−1
BA Σ−1
BB
]
However, the rightmost equality does not hold! We’ll return to this issue in a later step; for
now, though, it suﬃces to deﬁne V as above without worrying what actual contents of each
submatrix are.
Using this deﬁnition of V , the integral expands to
p(xA) = 1
Z
∫
xB∈Rd
exp
(
−
[1
2(xA−µA)TVAA(xA−µA) + 1
2(xA−µA)TVAB(xB−µB)
+ 1
2(xB−µB)TVBA(xA−µA) + 1
2(xB−µB)TVBB(xB−µB)
])
dxB,
where Z is some constant not depending on either xA or xB that we’ll choose to ignore for
the moment. If you haven’t worked with partitioned matrices before, then the expansion
10Sometimes, V is called the “precision” matrix.
30


## Page 31

above may seem a little magical to you. It is analogous to the idea that when deﬁning a
quadratic form based on some 2 × 2 matrix A, then
xTAx =
∑
i
∑
j
Aijxixj =x1A11x1 +x1A12x2 +x2A21x1 +x2A22x2.
Take some time to convince yourself that the matrix generalization above also holds.
Integrating out xB To evaluate the integral, we’ll somehow want to integrate out xB. In
general, however, Gaussian integrals are hard to compute by hand. Is there anything we can
do to save time? There are, in fact, a number of Gaussian integrals for which the answer is
already known. For example,
1
(2π)d/2|Σ|1/2
∫
Rd
exp
(
−1
2(x−µ)T Σ−1(x−µ)
)
= 1. (21)
The basic idea in this section, then, will be to transform the integral we had in the last
section into a form where we can apply (21) in order to perform the required integration
easily.
The key to this is a mathematical trick known as “completion of squares.” Consider the
quadratic function zTAz +bTz +c where A is a symmetric, nonsingular matrix. Then, one
can verify directly that
1
2zTAz +bTz +c = 1
2
(
z +A−1b
)T
A
(
z +A−1b
)
+c− 1
2bTA−1b.
This is the multivariate generalization of the “completion of squares” argument used in single
variable algebra:
1
2az2 +bz +c = 1
2a
(
z + b
a
)2
+c− b2
2a
To apply the completion of squares in our situation above, let
z =xB−µB
A =VBB
b =VBA(xA−µA)
c = 1
2(xA−µA)TVAA(xA−µA).
Then, it follows that the integral can be rewritten as
p(xA) = 1
Z
∫
xB∈Rd
exp
(
−
[
1
2
(
xB−µB +V−1
BBVBA(xA−µA)
)T
VBB
(
xB−µB +V−1
BBVBA(xA−µA)
)
+ 1
2(xA−µA)TVAA(xA−µA)− 1
2(xA−µA)TVABV−1
BBVBA(xA−µA)
])
dxB
31


## Page 32

We can factor out the terms not including xB to obtain,
p(xA) = exp
(
−1
2(xA−µA)TVAA(xA−µA) + 1
2(xA−µA)TVABV−1
BBVBA(xA−µA)
)
· 1
Z
∫
xB∈Rd
exp
(
−1
2
[
(
xB−µB +V−1
BBVBA(xA−µA)
)T
VBB
(
xB−µB +V−1
BBVBA(xA−µA)
)
])
dxB
At this point, we can now apply (21). We use this fact to get rid of the remaining integral
in our expression for p(xA):
p(xA) = 1
Z· (2π)d/2|VBB|−1/2· exp
(
−1
2(xA−µA)T (VAA−VABV−1
BBVBA)(xA−µA)
)
.
Arguing that resulting density is Gaussian At this point, we are almost done! Ig-
noring the normalization constant in front, we see that the density of xA is the exponential
of a quadratic form in xA. We can quickly recognize that our density is none other than a
Gaussian with mean vector µA and covariance matrix (VAA−VABV−1
BBVBA)−1. Although the
form of the covariance matrix may seem a bit complex, we have already achieved what we
set out to show in the ﬁrst place—namely, that xA has a marginal Gaussian distribution.
Using the logic before, we can conclude that this covariance matrix must somehow reduce
to ΣAA.
But, in case you are curious, it’s also possible to show that our derivation is consistent with
this earlier justiﬁcation. To do this, we use the following result for partitioned matrices:
[A B
C D
]−1
=
[ M−1 −M−1BD−1
−D−1CM−1 D−1 +D−1CM−1BD−1
]
.
whereM =A−BD−1C. This formula can be thought of as the multivariable generalization
of the explicit inverse for a 2 × 2 matrix,
[a b
c d
]−1
= 1
ad−bc
[ d −b
−c a
]
.
Using the formula, it follows that
[ΣAA ΣAB
ΣBA ΣBB
]
=
[VAA VAB
VBA VBB
]−1
=
[ (VAA−VABV−1
BBVBA)−1 −(VAA−VABV−1
BBVBA)−1VABV−1
BB
−V−1
BBVBA(VAA−VABV−1
BBVBA)−1 (VBB−VBAV−1
AAVAB)−1
]
We immediately see that (VAA−VABV−1
BBVBA)−1 = ΣAA, just as we expected!
32


## Page 33

5.6.3 Conditional of a joint Gaussian is Gaussian
The formal statement of this rule is:
Theorem 5.5.: Suppose that
[xA
xB
]
∼N
([µA
µB
]
,
[ΣAA ΣAB
ΣBA ΣBB
])
,
where xA∈ Rn, xB∈ Rd, and the dimensions of the mean vectors and covariance matrix
subblocks are chosen to match xA and xB. Then, the conditional densities
p(xA|xB) = p(xA,xB;µ, Σ)∫
xA∈Rnp(xA,xB;µ, Σ)dxA
p(xB|xA) = p(xA,xB;µ, Σ)∫
xB∈Rdp(xA,xB;µ, Σ)dxB
are also Gaussian:
xA|xB∼N
(
µA + ΣABΣ−1
BB(xB−µB), ΣAA− ΣABΣ−1
BBΣBA
)
xB|xA∼N
(
µB + ΣBAΣ−1
AA(xA−µA), ΣBB− ΣBAΣ−1
AAΣAB
)
.
The proof of Theorem 5.5 is similar to the marginal theorem above, which we defer to
Appendix B.
6 Other Resources
A good textbook on probablity at the level needed for CS229 is the book, A First Course
on Probability by Sheldon Ross.
A Proof of Theorem 5.2
The derivation of this theorem requires some advanced linear algebra and probability theory
and can be skipped for the purposes of this class. Our argument will consist of two parts.
First, we will show that the covariance matrix Σ can be factorized as Σ = BBT for some
invertible matrix B. Second, we will perform a “change-of-variable” from X to a diﬀerent
vector valued random variable Z using the relation Z =B−1(X−µ).
Step 1: Factorizing the covariance matrix. Recall the following two properties of
symmetric matrices from the notes on linear algebra 11:
11See section on “Eigenvalues and Eigenvectors of Symmetric Matrices.”
33


## Page 34

1. Any real symmetric matrix A∈ Rd×d can always be represented as A =UΛUT , where
U is a full rank orthogonal matrix containing of the eigenvectors of A as its columns,
and Λ is a diagonal matrix containing A’s eigenvalues.
2. If A is symmetric positive deﬁnite, all its eigenvalues are positive.
Since the covariance matrix Σ is positive deﬁnite, using the ﬁrst fact, we can write Σ =UΛUT
for some appropriately deﬁned matrices U and Λ. Using the second fact, we can deﬁne
Λ1/2∈ Rd×d to be the diagonal matrix whose entries are the square roots of the corresponding
entries from Λ. Since Λ = Λ 1/2(Λ1/2)T , we have
Σ =UΛUT =UΛ1/2(Λ1/2)TUT =UΛ1/2(UΛ1/2)T =BBT,
where B = UΛ1/2.12 In this case, then Σ −1 = B−TB−1, so we can rewrite the standard
formula for the density of a multivariate Gaussian as
p(x;µ, Σ) = 1
(2π)d/2|BBT|1/2 exp
(
−1
2(x−µ)TB−TB−1(x−µ)
)
. (22)
Step 2: Change of variables. Now, deﬁne the vector-valued random variable Z =
B−1(X−µ). A basic formula of probability theory, which we did not introduce in the section
notes on probability theory, is the “change-of-variables” formula for relating vector-valued
random variables:
Suppose that X =
[
X1··· Xd
]T
∈ Rd is a vector-valued random variable with
joint density function fX : Rd→ R. If Z =H(X)∈ Rd where H is a bijective,
diﬀerentiable function, then Z has joint density fZ : Rd→ R, where
fZ(z) =fX(x)·
⏐⏐⏐⏐⏐⏐⏐
det




∂x1
∂z1
··· ∂x1
∂zd
... ... ...
∂xd
∂z1
··· ∂xd
∂zd




⏐⏐⏐⏐⏐⏐⏐
.
Using the change-of-variable formula, one can show (after some algebra, which we’ll skip)
that the vector variable Z has the following joint density:
pZ(z) = 1
(2π)d/2 exp
(
−1
2zTz
)
. (23)
The claim follows immediately. □
12To show that B is invertible, it suﬃces to observe that U is an invertible matrix, and right-multiplying
U by a diagonal matrix (with no zero diagonal entries) will rescale its columns but will not change its rank.
34


## Page 35

B Proof of Theorem 5.5
As before, we’ll just examine the conditional distribution xB|xA, and the other result will
hold by symmetry. Our plan of attack will be as follows:
1. Write the form of the conditional density explicitly.
2. Rewrite the expression by partitioning the inverse covariance matrix.
3. Use a “completion-of-squares” argument.
4. Argue that the resulting density is Gaussian.
Let’s see each of these steps in action.
The conditional density written explicitly Suppose that we wanted to compute the
density function of xB givenxA directly. Then, we would need to compute
p(xB|xA) = p(xA,xB;µ, Σ)∫
xB∈Rnp(xA,xB;µ, Σ)dxB
= 1
Z′ exp
(
−1
2
[xA−µA
xB−µB
]T [ΣAA ΣAB
ΣBA ΣBB
]−1 [xA−µA
xB−µB
])
where Z′ is a normalization constant that we used to absorb factors not depending on xB.
Note that this time, we don’t even need to compute any integrals – the value of the integral
does not depend on xB, and hence the integral can be folded into the normalization constant
Z′.
Partitioning the inverse covariance matrix As before, we reparameterize our density
using the matrix V , to obtain
p(xB|xA) = 1
Z′ exp
(
−1
2
[xA−µA
xB−µB
]T [VAA VAB
VBA VBB
] [xA−µA
xB−µB
])
= 1
Z′ exp
(
−
[1
2(xA−µA)TVAA(xA−µA) + 1
2(xA−µA)TVAB(xB−µB)
+ 1
2(xB−µB)TVBA(xA−µA) + 1
2(xB−µB)TVBB(xB−µB)
])
.
Use a “completion of squares” argument Recall that
1
2zTAz +bTz +c = 1
2
(
z +A−1b
)T
A
(
z +A−1b
)
+c− 1
2bTA−1b
35


## Page 36

providedA is a symmetric, nonsingular matrix. As before, to apply the completion of squares
in our situation above, let
z =xB−µB
A =VBB
b =VBA(xA−µA)
c = 1
2(xA−µA)TVAA(xA−µA).
Then, it follows that the expression for p(xB|xA) can be rewritten as
p(xB|xA) = 1
Z′ exp
(
−
[
1
2
(
xB−µB +V−1
BBVBA(xA−µA)
)T
VBB
(
xB−µB +V−1
BBVBA(xA−µA)
)
+ 1
2(xA−µA)TVAA(xA−µA)− 1
2(xA−µA)TVABV−1
BBVBA(xA−µA)
])
Absorbing the portion of the exponent which does not depend on xB into the normalization
constant, we have
p(xB|xA) = 1
Z′′ exp
(
−1
2
(
xB−µB +V−1
BBVBA(xA−µA)
)T
VBB
(
xB−µB +V−1
BBVBA(xA−µA)
)
)
Arguing that resulting density is Gaussian Looking at the last form, p(xB|xA) has
the form of a Gaussian density with mean µB−V−1
BBVBA(xA−µA) and covariance matrix
V−1
BB. As before, recall our matrix identity,
[ΣAA ΣAB
ΣBA ΣBB
]
=
[ (VAA−VABV−1
BBVBA)−1 −(VAA−VABV−1
BBVBA)−1VABV−1
BB
−V−1
BBVBA(VAA−VABV−1
BBVBA)−1 (VBB−VBAV−1
AAVAB)−1
]
.
From this, it follows that
µB|A =µB−V−1
BBVBA(xA−µA) =µB + ΣBAΣ−1
AA(xA−µA).
Conversely, we can also apply our matrix identity to obtain:
[VAA VAB
VBA VBB
]
=
[ (ΣAA− ΣABΣ−1
BBΣBA)−1 −(ΣAA− ΣABΣ−1
BBΣBA)−1ΣABΣ−1
BB
−Σ−1
BBΣBA(ΣAA− ΣABΣ−1
BBΣBA)−1 (ΣBB− ΣBAΣ−1
AAΣAB)−1
]
,
from which it follows that
ΣB|A =V−1
BB = ΣBB− ΣBAΣ−1
AAΣAB.
36
