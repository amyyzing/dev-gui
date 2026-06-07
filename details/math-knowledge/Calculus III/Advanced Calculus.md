# Advanced Calculus

Source title: Schaum's Outline of Advanced Calculus, Third Edition (Schaum's Outline Series)

Converted from: `14.pdf`


## Page 1

[No extractable text on this page]


## Page 2

SCHAUM’S
outlines
Advanced Calculus
Third Edition
Robert Wrede, Ph.D.
Professor Emeritus of Mathematics
San Jose State University
Murray R. Spiegel, Ph.D.
Former Professor and Chairman of Mathematics
Rensselaer Polytechnic Institute
Hartford Graduate Center
Schaum’s Outline Series
New York  Chicago  San Francisco  Lisbon
London  Madrid  Mexico City  Milan  New Delhi
San Juan  Seoul  Singapore  Sydney  Toronto


## Page 3

Copyright © 2010, 2002, 1963 by The McGraw-Hill Companies, Inc. All rights reserved. Except as permitted under the United States Copyright Act of 1976,
no part of this publication may be reproduced or distributed in any form or by any means, or stored in a database or retrieval system, without the prior written
permission of the publisher.
ISBN: 978-0-07-162367-4
MHID: 0-07-162367-1
The material in this eBook also appears in the print version of this title: ISBN: 978-0-07-162366-7,
MHID: 0-07-162366-3.
All trademarks are trademarks of their respective owners. Rather than put a trademark symbol after every occurrence of a trademarked name, we use names in
an editorial fashion only, and to the beneﬁ t of the trademark owner, with no intention of infringement of the trademark. Where such designations appear in this
book, they have been printed with initial caps.
McGraw-Hill eBooks are available at special quantity discounts to use as premiums and sales promotions, or for use in corporate training programs. To contact
a representative please e-mail us at bulksales@mcgraw-hill.com.
TERMS OF USE
This is a copyrighted work and The McGraw-Hill Companies, Inc. (“McGrawHill”) and its licensors reserve all rights in and to the work. Use of this work is
subject to these terms. Except as permitted under the Copyright Act of 1976 and the right to store and retrieve one copy of the work, you may not decompile,
disassemble, reverse engineer, reproduce, modify, create derivative works based upon, transmit, distribute, disseminate, sell, publish or sublicense the work or
any part of it without McGraw-Hill’s prior consent. You may use the work for your own noncommercial and personal use; any other use of the work is strictly
prohibited. Your right to use the work may be terminated if you fail to comply with these terms.
THE WORK IS PROVIDED “AS IS.” McGRAW-HILL AND ITS LICENSORS MAKE NO GUARANTEES OR WARRANTIES AS TO THE ACCURA-
CY , ADEQUACY OR COMPLETENESS OF OR RESULTS TO BE OBTAINED FROM USING THE WORK, INCLUDING ANY INFORMATION THAT
CAN BE ACCESSED THROUGH THE WORK VIA HYPERLINK OR OTHERWISE, AND EXPRESSLY DISCLAIM ANY WARRANTY , EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
McGraw-Hill and its licensors do not warrant or guarantee that the functions contained in the work will meet your requirements or that its operation will be
uninterrupted or error free. Neither McGraw-Hill nor its licensors shall be liable to you or anyone else for any inaccuracy, error or omission, regardless of cause,
in the work or for any damages resulting therefrom. McGraw-Hill has no responsibility for the content of any information accessed through the work. Under no
circumstances shall McGraw-Hill and/or its licensors be liable for any indirect, incidental, special, punitive, consequential or similar damages that result from the
use of or inability to use the work, even if any of them has been advised of the possibility of such damages. This limitation of liability shall apply to any claim or
cause whatsoever whether such claim or cause arises in contract, tort or otherwise.


## Page 4

iiiiii
Preface to the
Third Edition
The many problems and solutions provided by the late Professor Spiegel remain invaluable to students as
they seek to master the intricacies of the calculus and related fields of mathematics. These remain an integral
part of this manuscript. In this third edition, clarifications have been provided. In addition, the continuation
of the interrelationships and the significance of concepts, begun in the second edition, have been extended.


## Page 5

This page intentionally left blank


## Page 6

v
Preface to the
Second Edition
A key ingredient in learning mathematics is problem solving. This is the strength, and no doubt the reason
for the longevity of Professor Spiegel’s advanced calculus. His collection of solved and unsolved problems
remains a part of this second edition.
Advanced calculus is not a single theory. However, the various sub-theories, including vector analysis,
infinite series, and special functions, have in common a dependency on the fundamental notions of the cal-
culus. An important objective of this second edition has been to modernize terminology and concepts, so that
the interrelationships become clearer. For example, in keeping with present usage functions of a real variable
are automatically single valued; differentials are defined as linear functions, and the universal character of
vector notation and theory are given greater emphasis. Further explanations have been included and, on oc-
casion, the appropriate terminology to support them.
The order of chapters is modestly rearranged to provide what may be a more logical structure.
A brief introduction is provided for most chapters. Occasionally, a historical note is included; however,
for the most part the purpose of the introductions is to orient the reader to the content of the chapters.
I thank the staff of McGraw-Hill. Former editor, Glenn Mott, suggested that I take on the project. Peter
McCurdy guided me in the process. Barbara Gilson, Jennifer Chong, and Elizabeth Shannon made valuable
contributions to the finished product. Joanne Slike and Maureen Walker accomplished the very difficult task
of combining the old with the new and, in the process, corrected my errors. The reviewer, Glenn Ledder, was
especially helpful in the choice of material and with comments on various topics.
ROBERT C. WREDE


## Page 7

This page intentionally left blank


## Page 8

vii
Contents
Chapter 1 NUMBERS 1
Sets. Real Numbers. Decimal Representation of Real Numbers. Geometric
Representation of Real Numbers. Operations with Real Numbers. Inequal-
ities. Absolute Value of Real Numbers. Exponents and Roots. Logarithms.
Axiomatic Foundations of the Real Number System. Point Sets, Intervals.
Countability. Neighborhoods. Limit Points. Bounds. Bolzano-Weierstrass
Theorem. Algebraic and Transcendental Numbers. The Complex Number
System. Polar Form of Complex Numbers. Mathematical Induction.
Chapter 2 SEQUENCES 25
Definition of a Sequence. Limit of a Sequence. Theorems on Limits of Se-
quences. Infinity. Bounded, Monotonic Sequences. Least Upper Bound and
Greatest Lower Bound of a Sequence. Limit Superior, Limit Inferior. Nested
Intervals. Cauchy’s Convergence Criterion. Infinite Series.
Chapter 3 FUNCTIONS, LIMITS, AND CONTINUITY 43
Functions. Graph of a Function. Bounded Functions. Montonic Functions.
Inverse Functions, Principal Values. Maxima and Minima. Types of Func-
tions. Transcendental Functions. Limits of Functions. Right- and Left-
Hand Limits. Theorems on Limits. Infinity. Special Limits. Continuity.
Right- and Left-Hand Continuity. Continuity in an Interval. Theorems on
Continuity. Piecewise Continuity. Uniform Continuity.
Chapter 4 DERIVATIVES 71
The Concept and Definition of a Derivative. Right- and Left-Hand Deriva-
tives. Differentiability in an Interval. Piecewise Differentiability. Differen-
tials. The Differentiation of Composite Functions. Implicit Differentiation.
Rules for Differentiation. Derivatives of Elementary Functions. Higher-
Order Derivatives. Mean Value Theorems. L’Hospital’s Rules. Applica-
tions.
Chapter 5 INTEGRALS 97
Introduction of the Definite Integral. Measure Zero. Properties of Definite
Integrals. Mean Value Theorems for Integrals. Connecting Integral and Dif-
ferential Calculus. The Fundamental Theorem of the Calculus. Generaliza-
tion of the Limits of Integration. Change of Variable of Integration.
Integrals of Elementary Functions. Special Methods of Integration. Im-
proper Integrals. Numerical Methods for Evaluating Definite Integrals. Ap-
plications. Arc Length. Area. Volumes of Revolution.


## Page 9

viii Contents
Chapter 6 PARTIAL DERIVATIVES 125
Functions of Two or More Variables. Neighborhoods. Regions. Limits. Iter-
ated Limits. Continuity. Uniform Continuity. Partial Derivatives. Higher-
Order Partial Derivatives. Differentials. Theorems on Differentials.
Differentiation of Composite Functions. Euler’s Theorem on Homogeneous
Functions. Implicit Functions. Jacobians. Partial Derivatives Using Jacobi-
ans. Theorems on Jacobians. Transformations. Curvilinear Coordinates.
Mean Value Theorems.
Chapter 7 VECTORS 161
Vectors. Geometric Properties of Vectors. Algebraic Properties of Vectors.
Linear Independence and Linear Dependence of a Set of Vectors. Unit Vec-
tors. Rectangular (Orthogonal) Unit Vectors. Components of a Vector. Dot,
Scalar, or Inner Product. Cross or Vector Product. Triple Products. Axiom-
atic Approach To Vector Analysis. Vector Functions. Limits, Continuity,
and Derivatives of Vector Functions. Geometric Interpretation of a Vector
Derivative. Gradient, Divergence, and Curl. Formulas Involving ∇. Vector
Interpretation of Jacobians and Orthogonal Curvilinear Coordinates. Gra-
dient, Divergence, Curl, and Laplacian in Orthogonal Curvilinear Coordi-
nates. Special Curvilinear Coordinates.
Chapter 8 APPLICATIONS OF PARTIAL DERIVATIVES 195
Applications To Geometry. Directional Derivatives. Differentiation Under
the Integral Sign. Integration Under the Integral Sign. Maxima and Min-
ima. Method of Lagrange Multipliers for Maxima and Minima. Applica-
tions To Errors.
Chapter 9 MULTIPLE INTEGRALS 221
Double Integrals. Iterated Integrals. Triple Integrals. Transformations of
Multiple Integrals. The Differential Element of Area in Polar Coordinates,
Differential Elements of Area in Cylindrical and Spherical Coordinates.
Chapter 10  LINE INTEGRALS, SURFACE INTEGRALS, AND
INTEGRAL THEOREMS 243
Line Integrals. Evaluation of Line Integrals for Plane Curves. Properties of
Line Integrals Expressed for Plane Curves. Simple Closed Curves, Simply
and Multiply Connected Regions. Green’s Theorem in the Plane. Conditions
for a Line Integral To Be Independent of the Path. Surface Integrals. The
Divergence Theorem. Stokes’s Theorem.
Chapter 11 INFINITE SERIES 279
Definitions of Infinite Series and Their Convergence and Divergence. Fun-
damental Facts Concerning Infinite Series. Special Series. Tests for Conver-
gence and Divergence of Series of Constants. Theorems on Absolutely
Convergent Series. Infinite Sequences and Series of Functions, Uniform
Convergence. Special Tests for Uniform Convergence of Series. Theorems
on Uniformly Convergent Series. Power Series. Theorems on Power Series.
Operations with Power Series. Expansion of Functions in Power Series. Tay-
lor’s Theorem. Some Important Power Series. Special Topics. Taylor’s Theo-
rem (For Two Variables).


## Page 10

ix
Chapter 12 IMPROPER INTEGRALS 321
Definition of an Improper Integral. Improper Integrals of the First Kind
(Unbounded Intervals). Convergence or Divergence of Improper Integrals
of the First Kind. Special Improper Integers of the First Kind. Convergence
Tests for Improper Integrals of the First Kind. Improper Integrals of the
Second Kind. Cauchy Principal Value. Special Improper Integrals of the
Second Kind. Convergence Tests for Improper Integrals of the Second
Kind. Improper Integrals of the Third Kind. Improper Integrals Containing
a Parameter, Uniform Convergence. Special Tests for Uniform Convergence
of Integrals. Theorems on Uniformly Convergent Integrals. Evaluation of
Definite Integrals. Laplace Transforms. Linearity. Convergence. Applica-
tion. Improper Multiple Integrals.
Chapter 13 FOURIER SERIES 349
Periodic Functions. Fourier Series. Orthogonality Conditions for the Sine
and Cosine Functions. Dirichlet Conditions. Odd and Even Functions. Half
Range Fourier Sine or Cosine Series. Parseval’s Identity. Differentiation
and Integration of Fourier Series. Complex Notation for Fourier Series.
Boundary-Value Problems. Orthogonal Functions.
Chapter 14 FOURIER INTEGRALS 377
The Fourier Integral. Equivalent Forms of Fourier’s Integral Theorem.
Fourier Transforms.
Chapter 15 GAMMA AND BETA FUNCTIONS 389
The Gamma Function. Table of Values and Graph of the Gamma Func-
tion. The Beta Function. Dirichlet Integrals.
Chapter 16 FUNCTIONS OF A COMPLEX VARIABLE 405
Functions. Limits and Continuity. Derivatives. Cauchy-Riemann Equations.
Integrals. Cauchy’s Theorem. Cauchy’s Integral Formulas. Taylor’s Series.
Singular Points. Poles. Laurent’s Series. Branches and Branch Points. Resi-
dues. Residue Theorem. Evaluation of Definite Integrals.
 INDEX 437
Contents


## Page 11

This page intentionally left blank


## Page 12

1
Numbers
Mathematics has its own language, with numbers as the alphabet. The language is given structure with the
aid of connective symbols, rules of operation, and a rigorous mode of thought (logic). These concepts, which
previously were explored in elementary mathematics courses such as geometry, algebra, and calculus, are
reviewed in the following paragraphs.
Sets
Fundamental in mathematics is the concept of a set,class, or collection of objects having specified character-
istics. For example, we speak of the set of all university professors, the set of all letters A, B, C, D, . . . , Z of the
English alphabet, and so on. The individual objects of the set are called members or elements. Any part of a set
is called a subset of the given set, e.g., A, B, C is a subset of A, B, C, D, . . . , Z. The set consisting of no elements
is called the empty set or null set.
Real Numbers
The number system is foundational to the modern scientific and technological world. It is based on the sym-
bols 1, 2, 3, 4, 5, 6, 7, 8, 9, 0. Thus, it is called a base ten system. (There is the implication that there are other
systems. One of these, which is of major importance, is the base two system.) The symbols were introduced
by the Hindus, who had developed decimal representation and the arithmetic of positive numbers by 600
A.D.
In the eighth century, the House of Wisdom (library) had been established in Baghdad, and it was there that
the Hindu arithmetic and much of the mathematics of the Greeks were translated into Arabic. From there,
this arithmetic gradually spread to the later- developing western civilization.
The flexibility of the Hindu- Arabic number system lies in the multiple uses of the numbers. They may be
used to signify: (a) order—the runner finished fifth; (b) quantity—there are six apples in the barrel; (c)
construction— 2 and 3 may be used to form any of 23, 32, .23 or .32; (d) place—0 is used to establish place,
as is illustrated by 607, 0603, and .007.
Finally, note that the significance of the base ten terminology is enhanced by the following examples:
357 = 7(100) + 5(101) + 3(102)
.972 = 9/H500710 + 7/H5007102 ++ 2/H5007103
The collection of numbers created from the basic set is called the real number system. Significant subsets
of them are listed as follows. For the purposes of this text, it is assumed that the reader is familiar with these
numbers and the fundamental arithmetic operations.
1. Natural numbers 1, 2, 3, 4, . . . , also called positive integers, are used in counting members of a set.
The symbols varied with the times; e.g., the Romans used I, II, III, IV , . . . . The sum a + b and product
a · b or ab of any two natural numbers a and b is also a natural number. This is often expressed by
CHAPTER 1


## Page 13

CHAPTER 1  Numbers2
saying that the set of natural numbers is closed under the operations of addition and multiplication, or
satisfies the closure property with respect to these operations.
2. Negative integers and zero, denoted by –1, –2, –3, . . . , and 0, respectively, arose to permit solutions
of equations such as x + b = a, where a and b are any natural numbers. This leads to the operation of
subtraction, or inverse of addition, and we write x = a – b.
The set of positive and negative integers and zero is called the set of integers.
3. Rational numbers  or fractions such as
25,34 − , . . . arose to permit solutions of equations such as
bx = a for all integers a and b, where b /HS11005 0. This leads to the operation of division, or inverse of mul-
tiplication, and we write x = a/b or a ÷ b, where a is the numerator and b the denominator.
The set of integers is a subset of the rational numbers, since integers correspond to rational numbers
where b = 1.
4. Irrational numbers such as 2  and π are numbers which are not rational; i.e., they cannot be ex-
pressed as a/b (called the quotient of a and b), where a and b are integers and b /HS11005 0.
The set of rational and irrational numbers is called the set of real numbers.
Decimal Representation of Real Numbers
Any real number can be expressed in decimal form, e.g., 17/10 = 1.7, 9/100 = 0.09, 1/6 = 0.16666. . . . In the
case of a rational number, the decimal expansion either terminates or if it does not terminate, one or a group
of digits in the expansion will ultimately repeat, as, for example, in
1
7  = 0.142857 142857 142. . . . In the
case of an irrational number such as 2  = 1.41423 . . . or π = 3.14159 . . . no such repetition can occur. We
can always consider a decimal expansion as unending; e.g., 1.375 is the same as 1.37500000 . . . or
1.3749999 . . . To indicate recurring decimals we sometimes place dots over the repeating cycle of digits,
e.g., 1
7  = 0.1˙4˙ 2˙ 8˙ 5˙ 7˙, and 19
6  = 3.16˙ .
It is possible to design number systems with fewer or more digits; e.g., the binary system uses only two digits,
0 and 1 (see Problems 1.32 and 1.33).
Geometric Representation of Real Numbers
The geometric representation of real numbers as points on a line, called the real axis, as in Figure 1.1, is also
well known to the student. For each real number there corresponds one and only one point on the line, and,
conversely, there is a one-to-one (see Figure 1.1) correspondence between the set of real numbers and the
set of points on the line. Because of this we often use point and number interchangeably.
Figure 1.1
While this correlation of points and numbers is automatically assumed in the elementary study of math-
ematics, it is actually an axiom of the subject (the Cantor Dedekind axiom) and, in that sense, has deep
meaning.
The set of real numbers to the right of 0 is called the set of positive numbers, the set to the left of 0 is the
set of negative numbers, while 0 itself is neither positive nor negative.


## Page 14

CHAPTER 1  Numbers 3
(Both the horizontal position of the line and the placement of positive and negative numbers to the right
and left, respectively, are conventions.)
Between any two rational numbers (or irrational numbers) on the line there are infinitely many rational
(and irrational) numbers. This leads us to call the set of rational (or irrational) numbers an everywhere dense
set.
Operations with Real Numbers
If a, b, c belong to the set R of real numbers, then:
1. a + b and ab belong to R Closure law
2. a + b = b + a Commutative law of addition
3. a + (b + c) = (a + b) + c Associative law of addition
4. ab = ba Commutative law of multiplication
5. a(bc) = (ab)c Associative law of multiplication
6. a(b + c) = ab + ac Distributive law
7. a + 0 = 0 + a = a, 1 · a = a · 1 = a
0 is called the identity with respect to addition; 1 is called the identity with respect to multiplica-
tion.
8. For any a there is a number x in R such that x + a = 0.
x is called the inverse of a with respect to addition and is denoted by –a.
9. For any a /HS11005 0 there is a number x in R such that ax = 1.
x is called the inver
se of a with respect to multiplication and is denoted by a–1 or 1/a.
Convention: For convenience, operations called subtraction and division are defined by a – b = a + (–b)
and a
b  = ab–1, respectively.
These enable us to operate according to the usual rules of algebra. In general, any set, such as R, whose
members satisfy the preceding is called a field.
Inequalities
If a – b is a nonnegative number, we say that a is greater than or equal to b or b is less than or equal to a,
and write, respectively, a > b or b < a. If there is no possibility that a = b, we write a > b or b < a. Geo-
metrically, a > b if the point on the real axis corresponding to a lies to the right of the point corresponding
to b.
Properties of Inequalities
If a, b, and c are any given real numbers, then:
1. Either a > b, a = b or a < b Law of trichotomy
2. If a > b and b > c, then a > c Law of transitivity
3. If a > b, then a + c > b + c
4. If a > b and c > 0, then ac > bc


## Page 15

CHAPTER 1  Numbers4
5. If a > b and c < 0, then ac < bc
EXAMPLES. 3 < 5 or 5 > 3; – 2 < – 1 or – 1 > – 2; x <  3 means that x is a real number which may be 3 or
less than 3.
Absolute Value of Real Numbers
The absolute value of a real number a, denoted by ⏐a⏐, is defined as a if a > 0, – a if a < 0, and 0 if a = 0.
Properties of Absolute Value
1. ⏐ab⏐ = ⏐a⏐⏐ b⏐ or ⏐abc . . . m⏐ = ⏐a⏐⏐ b⏐⏐ c⏐ . . . ⏐m⏐
2. ⏐a + b⏐ < ⏐a⏐ + ⏐b⏐ or ⏐a + b + c + . . . + m⏐ < ⏐a⏐ + ⏐b⏐ + ⏐c⏐ + . . . ⏐m⏐
3. ⏐a – b⏐ > ⏐a⏐ – ⏐b⏐
EXAMPLES. ⏐ – 5⏐ = 5, ⏐ + 2⏐ = 2, ⏐ – 3
4
⏐ = 3
4
, ⏐ – 2 ⏐ = 2 , ⏐0⏐ = 0.
The distance between any two points (real numbers) a and b on the real axis is ⏐a – b⏐ = ⏐b – a⏐.
Exponents and Roots
The product a · a . . . a of a real number a by itself p times is denoted by a p, where p is called the exponent
and a is called the base. The following rules hold:
1. ap · aq = ap+q
2.
p
pq
q
a aa
−=
3. (a p)r = apr
4.
p p
p
aa
b b
⎛⎞ =⎜⎟⎝⎠
These and extensions to any real numbers are possible so long as division by zero is excluded. In particular,
by using 2, with p = q and p = 0, respectively, we are led to the definitions a0 = 1, a–q = 1/aq.
If ap = N, where p is a positive integer, we call a a pth root of N, written p N . There may be more than
one real pth root of N. For example, since 22 = 4 and (–2)2 = 4, there are two real square roots of 4—namely,
2 and –2. For square roots it is customary to define N  as positive; thus, 4 = 2 and then – 4 = –2.
If p and q are positive integers, we define ap / q =
q pa .
Logarithms
If ap = N, p is called the logarithm of N to the base a, written p = loga N. If a and N are positive and a /HS11005 1,
there is only one real value for p. The following rules hold:
1. log a MN = loga M + loga N
2. log log logaa a
M MNN =−
3. log a Mr = r loga M


## Page 16

CHAPTER 1  Numbers 5
In practice, two bases are used: base a = 10, and the natural base a = e = 2.71828. . . . The logarithmic sys-
tems associated with these bases are called common and natural, respectively. The common logarithm system
is signified by log N; i.e., the subscript 10 is not used. For natural logarithms, the usual notation is ln N.
Common logarithms (base 10) traditionally have been used for computation. Their application replaces
multiplication with addition and powers with multiplication. In the age of calculators and computers, this
process is outmoded; however, common logarithms remain useful in theory and application. For example,
the Richter scale used to measure the intensity of earthquakes is a logarithmic scale. Natural logarithms were
introduced to simplify formulas in calculus, and they remain effective for this purpose.
Axiomatic Foundations of the Real Number System
The number system can be built up logically, starting from a basic set of axioms or “self-evident” truths,
usually taken from experience, such as statements 1 through 9 on Page 3.
If we assume as given the natural numbers and the operations of addition and multiplication (although it
is possible to start even further back, with the concept of sets), we find that statements 1 through 6, with R
as the set of natural numbers, hold, while 7 through 9 do not hold.
Taking 7 and 8 as additional requirements, we introduce the numbers –1, –2, –3, . . . , and 0. Then, by
taking 9, we introduce the rational numbers.
Operations with these newly obtained numbers can be defined by adopting axioms 1 through 6, where R
is now the set of integers. These lead to proofs of statements such as (–2)(–3) = 6, –(–4) = 4, (0)(5) = 0, and
so on, which are usually taken for granted in elementary mathematics.
We can also introduce the concept of order or inequality for integers, and, from these inequalities, for
rational numbers. For example, if a, b, c, d are positive integers, we define a/b > c/d if and only if ad > bc,
with similar extensions to negative integers.
Once we have the set of rational numbers and the rules of inequality concerning them, we can order them
geometrically as points on the real axis, as already indicated. We can then show that there are points on the
line which do not represent rational numbers (such as
2 , π, etc.). These irrational numbers can be defined
in various ways, one of which uses the idea of Dedekind cuts (see Problem 1.34). From this we can show that
the usual rules of algebra apply to irrational numbers and that no further real numbers are possible.
Point Sets, Intervals
A set of points (real numbers) located on the real axis is called a one-dimensional point set.
The set of points x such that a < x < b is called a closed interval and is denoted by [a, b]. The set a <
x < b is called an open interval, denoted by (a, b). The sets a < x < b and a < x < b, denoted by (a, b] and
[a, b), respectively, are called half-open or half-closed intervals.
The symbol x, which can represent any number or point of a set, is called a variable. The given numbers
a or b are called constants.
Letters were introduced to construct algebraic formulas around 1600. Not long thereafter, the philosopher-
mathematician Rene Descartes suggested that the letters at the end of the alphabet be used to represent
variables and those at the beginning to represent constants. This was such a good idea that it remains the
custom.
EXAMPLE. The set of all x such that ⏐x⏐ < 4, i.e., –4 < x < 4, is represented by (–4, 4), an open interval.
The set x > a can also be represented by a < x < /H11009. Such a set is called an infinite or unbounded interval.
Similarly, –/H11009 < x < /H11009 represents all real numbers x.


## Page 17

CHAPTER 1  Numbers6
Countability
A set is called countable or denumerable if its elements can be placed in 1-1 correspondence with the natu-
ral numbers.
EXAMPLE. The even natural numbers 2, 4, 6, 8, . . . is a countable set because of the 1-1 correspondence
shown.
Given set 2 4 6 8 …
Natural numbers 1 2 3 4 …
bbbbbbbb
A set is infinite if it can be placed in 1-1 correspondence with a subset of itself. An infinite set which is
countable is called countable infinite.
The set of rational numbers is countable infinite, while the set of irrational numbers or all real numbers
is noncountably infinite (see Problems 1.17 through 1.20).
The number of elements in a set is called its cardinal number. A set which is countably infinite is assigned
the cardinal number ℵ 0 (the Hebrew letter aleph-null). The set of real numbers (or any sets which can be
placed into 1-1 correspondence with this set) is given the cardinal number C, called the cardinality of the
contimuum.
Neighborhoods
The set of all points x such that ⏐x – a⏐ < δ, where δ > 0, is called a δneighborhood of the point a. The set of all
pointsx such that 0 < ⏐x – a⏐ < δ, in which x = a is excluded, is called a deletedδ neighborhood of a or an open
ball of radius δ about a.
Limit Points
A limit point, point of accumulation, or cluster point of a set of numbers is a number l such that every deleted
δ neighborhood of l contains members of the set; that is, no matter how small the radius of a ball about l,
there are points of the set within it. In other words, for any δ > 0, however small, we can always find a mem-
ber x of the set which is not equal to l but which is such that ⏐x – l⏐ < δ. By considering smaller and smaller
values of δ, we see that there must be infinitely many such values of x.
A finite set cannot have a limit point. An infinite set may or may not have a limit point. Thus, the natural
numbers have no limit point, while the set of rational numbers has infinitely many limit points.
A set containing all its limit points is called a closed set. The set of rational numbers is not a closed set,
since, for example, the limit point
2  is not a member of the set (Problem 1.5). However, the set of all real
numbers x such that 0 < x <  1 is a closed set.
Bounds
If for all numbers x of a set there is a number M such that x < M, the set is bounded above and M is called
an upper bound. Similarly if x > m, the set is bounded below and m is called a lower bound. If for all x we
have m < x < M, the set is called bounded.
If M is a number such that no member of the set is greater than M but there is at least one member which
exceeds M – /H9280 for every /H9280 > 0, then M is called the least upper bound (l.u.b.) of the set. Similarly, if no mem-
ber of the set is smaller than m  + /H9280 for every /H9280 > 0, then m  is called the greatest lower bound (g.l.b.) of the
set.


## Page 18

CHAPTER 1  Numbers 7
Bolzano-Weierstrass Theorem
The Bolzano-Weierstrass theorem states that every bounded infinite set has at least one limit point. A proof
of this is given in Problem 2.23.
Algebraic and Transcendental Numbers
A number x which is a solution to the polynomial equation
 a 0xn + a1xn–1 + a2xn–2 + . . . + an–1x + an = 0 (1)
where a0 /HS11005 0, a1, a2, . . . , an are integers and n is a positive integer, called the degree of the equation, is called
an algebraic number. A number which cannot be expressed as a solution of any polynomial equation with
integer coefficients is called a transcendental number.
EXAMPLES. 2
3
 and 2 , which are solutions of 3x – 2 = 0 and x2 – 2 = 0, respectively, are algebraic
numbers.
The numbers π and e can be shown to be transcendental numbers. Mathematicians have yet to determine
whether some numbers such as eπ or e + π are algebraic or not.
The set of algebraic numbers is a countably infinite set (see Problem 1.23), but the set of transcendental
numbers is noncountably infinite.
The Complex Number System
Equations such as x2 + 1 = 0 have no solution within the real number system. Because these equations were
found to have a meaningful place in the mathematical structures being built, various mathematicians of the
late nineteenth and early twentieth centuries developed an extended system of numbers in which there were
solutions. The new system became known as the complex number system. It includes the real number system
as a subset.
We can consider a complex number as having the form a + bi, where a and b are real numbers called the
real and imaginary parts, and i =
1−  is called the imaginary unit. Two complex numbers a + bi and c + di
are equal if and only if a  = c  and b  = d . We can consider real numbers as a subset of the set of complex
numbers with b = 0. The complex number 0 + 0i corresponds to the real number 0.
The absolute value or modulus of a + bi is defined as ⏐a + bi⏐ = 22ab + . The complex conjugate of
a + bi is defined as a – bi. The complex conjugate of the complex number z is often indicated by z  or z*.
The set of complex numbers obeys rules 1 through 9 on Pages 3, and thus constitutes a field. In perform-
ing operations with complex numbers, we can operate as in the algebra of real numbers, replacing i 2 by –1
when it occurs. Inequalities for complex numbers are not defined.
From the point of view of an axiomatic foundation of complex numbers, it is desirable to treat a complex
number as an ordered pair (a, b) of real numbers a and b subject to certain operational rules which turn out to
be equivalent to the aforementioned rules. For example, we define (a, b) + (c, d) = (a + c, b + d), (a, b) (c, d) =
(ac – bd, ad + bc), m(a, b) = (ma, mb), and so on. We then find that (a, b) = a(1, 0) + b(0, 1) and we associate
this with a + bi, where i is the symbol for (0, 1).
Polar Form of Complex Numbers
If real scales are chosen on two mutually perpendicular axes X´OX and Y´ OY (the x and y axes), as in Figure
1.2, we can locate any point in the plane determined by these lines by the ordered pair of numbers (x, y) called


## Page 19

CHAPTER 1  Numbers8
rectangular coordinates of the point. Examples of the location of such points are indicated by P, Q, R, S, and
T in Figure 1.2.
Figure 1.2
 Figure 1.3
Since a complex number x + iy can be considered as an ordered pair (x, y), we can represent such numbers
by points in an xy plane called the complex plane or Argand diagram. Referring to Figure 1.3, we see that x = ρ
cos φ, y = ρ sin φ, where 22xyρ= +  = ⏐x + iy⏐ and φ, called the amplitude or argument, is the angle which
line OP makes with the positive x axis OX. It follows that
 z  = x + iy = ρ(cos φ + i sin φ) (2)
called the polar form of the complex number, where ρ and φ are called polar coordinates. It is sometimes
convenient to write cis φ instead of cos φ + i sin φ.
If z1 = x1 + iyi = ρ 1 (cos φ1 + i sin φ 1) and z2 = x2 + iy2 = ρ 2(cosφ2 + i sin φ 2) and by using the addition
formulas for sine and cosine, we can show that
 z 1z2 = ρ1ρ2{cos(φ1 + φ2) + i sin(φ1 + φ2)} (3)
11
12 12
22
{cos( ) sin( )}zp izp φφ φφ=− + −  (4)
 z n = {ρ(cos φ + i sin φ)}n = ρn(cos nφ + i sin nφ) (5)
where n is any real number. Equation (5) is sometimes called De Moivre’s theorem. We can use this to de-
termine roots of complex numbers. For example, if n is a positive integer,
1/ 1/
1/
{( c o s s i n ) }
22cos sin 0, 1, 2, 3, , 1
nn
n
zp i
kkpi k n nn
φφ
φπ φπ
=+
⎧⎫ ++⎛⎞ ⎛⎞=+ = … −⎨⎬ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠⎩⎭
 (6)
from which it follows that there are in general n  different values of z 1/n. In Chapter 11 we will show that
eiφ = cos φ + i sin φ where e = 2.71828. . . . This is called Euler’s formula.
Mathematical Induction
The principle of mathematical induction is an important property of the positive integers. It is especially
useful in proving statements involving all positive integers when it is known, for example, that the statements
are valid for n = 1, 2, 3 but it is suspected or conjectured that they hold for all positive integers. The method
of proof consists of the following steps:
1. Prove the statement for n = 1 (or some other positive integer).
2. Assume the statement is true for n = k, where k is any positive integer.
3. From the assumption in 2, prove that the statement must be true for n = k + 1. This is part of the proof
establishing the induction and may be difficult or impossible.


## Page 20

CHAPTER 1  Numbers 9
4. Since the statement is true for n = 1 (from Step 1) it must (from Step 3) be true for n = 1 + 1 = 2 and
from this for n = 2 + 1 = 3, and so on, and so must be true for all positive integers. (This assumption,
which provides the link for the truth of a statement for a finite number of cases to the truth of that state-
ment for the infinite set, is called the axiom of mathematical induction.)
SOLVED PROBLEMS
Operations with numbers
1.1. If x = 4, y = 15, z = –3, p = 2
3
, q = – 1
6
, and r = 3
4
, evaluate    (a)   x + (y + z),    (b)    (x + y) + z,
(c) p(qr),    (d)  (pq)r, (e) x(p + q).
(a) x + (y + z) = 4 + [15 + (– 3)] = 4 + 12 = 16
(b) (x + y) + z = (4 + 15) + (– 3) = 19 – 3 = 16
The fact that (a) and (b) are equal illustrates the associative law of addition.
(c) p(qr) = 2
3
 { (– 1
6
)( 3
4
)} = ( 2
3
)(– 3
24
) = ( 2
3
)(– 1
8
) = – 2
24
 = – 1
12
(d) (pq)r = { ( 2
3
)(– 1
6
)} ( 3
4
) = (– 2
18
)( 3
4
) = (– 1
9
)( 3
4
) = – 3
36
 = – 1
12
The fact that (c) and (d) are equal illustrates the associative law of multiplication.
(e) x(p + q) = 4( 2
3
 – 1
6
) = 4( 4
6
 – 1
6
) = 4( 3
6
) = 12
6
 = 2
Another method: x(p + q) = xp + xq = (4)( 2
3
) + (4)(– 1
6
) = 8
3
 – 4
6
 = 8
3
 – 2
3
 = 6
3
 = 2 using the dis-
tributive law.
1.2. Explain why we do not consider (a) 0
0
 and (b) 1
0
 as numbers.
(a) If we define a/b as that number (if it exists) such that bx = a, then 0/0 is that number x such that 0x = 0.
However, this is true for all numbers. Since there is no unique number which 0/0 can represent, we con-
sider it undefined.
(b) As in (a), if we define 1/0 as that number x (if it exists) such that 0x = 1, we conclude that there is no such
number.
Because of these facts we must look upon division by zero as meaningless.
1.3. Simplify
2
2
56 .
23
xx
xx
−+
−−
2
2
5 6 ( 3)( 2) 2
(3 ) (1 ) 123
xx x x x
xx xxx
−+ − − − == −+ +−−
 provided that the cancelled factor (x – 3) is not zero; i.e., x /HS11005 3. For
x = 3, the given fraction is undefined.
Rational and irrational numbers
1.4. Prove that the square of any odd integer is odd.
Any odd integer has the form 2m + 1. Since (2m + 1)2 = 4m2 + 4m + 1 is 1 more than the even integer 4m2
+ 4m = 2(2m2 + 2m), the result follows.


## Page 21

CHAPTER 1  Numbers10
1.5. Prove that there is no rational number whose square is 2.
Let p / q be a rational number whose square is 2, where we assume that p / q is in lowest terms; i.e., p and
q have no common integer factors except ± 1 (we sometimes call such integers relatively prime).
Then (p / q)2 = 2, p2 = 2q2 and p2 is even. From Problem 1.4, p is even, since if p were odd, p2 would be
odd. Thus, p = 2m.
Substituting p = 2m in p2 = 2q2 yields q2 = 2m2, so that q2 is even and q is even.
Thus, p and q have the common factor 2, contradicting the original assumption that they had no common
factors other than ±1. By virtue of this contradiction there can be no rational number whose square is 2.
1.6. Show how to find rational numbers whose squares can be arbitrarily close to 2.
We restrict ourselves to positive rational numbers. Since (1)2 = 1 and (2)2 = 4, we are led to choose rational
numbers between 1 and 2, e.g., 1.1, 1.2, 1.3, . . . , 1.9.
Since (1.4) 2 = 1.96 and (1.5) 2 = 2.25, we consider rational numbers between 1.4 and 1.5, e.g., 1.41,
1.42,. . , 1.49.
Continuing in this manner we can obtain closer and closer rational approximations; e.g., (1.414213562)2
is less than 2, while (1.414213563)2 is greater than 2.
1.7. Given the equation a 0xn + a1xn–1 + . . . + an = 0, where a0, a1, . . . an are integers and a0 and an /HS11005 0, show that
if the equation is to have a rational root p / q, then p must divide an and q must divide a0 exactly.
Since p / q is a root we have, on substituting in the given equation and multiplying by qn, the result is
 a 0pn + a1pn–1 q + a2pn–2q2 + . . . + an–1pqn–1 + anqn = 0 (1)
or dividing by p,
12
01
nnap ap q−− ++ . . . 1
1
n
n n
n
aqaq p
−
−+= −  (2)
Since the left side of Equation (2) is an integer, the right side must also be an integer. Then, since p and q are
relatively prime, p does not divide qn exactly and so must divide an.
In a similar manner, by transposing the first term of Equation (1) and dividing by q, we can show that q
must divide a0.
1.8. Prove that 23+  cannot be a rational number.
If x = 23+ , then x2 = 5 + 2 6 , x2 – 5 = 2 6 , and, squaring, x4 – 10x2 + 1 = 0. The only possible
rational roots of this equation are ± 1 by Problem 1.7, and these do not satisfy the equation. It follows that
23+ , which satisfies the equation, cannot be a rational number.
1.9. Prove that between any two rational numbers there is another rational number.
The set of rational numbers is closed under the operations of addition and division (nonzero denominator).
Therefore,
2
ab+  is rational. The next step is to guarantee that this value is between a and b. To this purpose,
assume a < b. (The proof would proceed similarly under the assumption b < a.) Then 2a < a + b; thus, a <
2
ab+  and a + b < 2b; therefore,
2
ab+  < b.
Inequalities
1.10. For what values of x is x + 3(2 – x) >  4 – x?
x + 3(2 – x) >  4 – x when x + 6 – 3x >  4 – x, 6 – 2x >  4 – x, 6 – 4 >  2x – x, and 2 > x; i.e. x <  2.


## Page 22

CHAPTER 1  Numbers 11
1.11. For what values of x is x 2 – 3x – 2 < 10 – 2x?
The required inequality holds when x2 – 3x – 2 – 10 + 2x < 0, x 2 – x – 12 < 0 or (x – 4)(x + 3) < 0. This
last inequality holds only in the following cases.
Case 1: x – 4 > 0 and x + 3 < 0; i.e., x > 4 and x < – 3. This is impossible, since x cannot be both greater than
4 and less than –3.
Case 2: x – 4 < 0 and x + 3 > 0; i.e., x < 4 and x > – 3. This is possible when – 3 < x < 4. Thus, the inequal-
ity holds for the set of all x such that – 3 < x < 4.
1.12. If a
>  0 and b >  0, prove that 1
2
 (a + b) > ab .
The statement is self-evident in the following cases: (1) a = b, and (2) either or both of a and b zero. For
both a and b positive and a /HS11005b. the proof is by contradiction.
Assume to the contrary of the supposition that 1
2
 (a + b) < ab , then 1
4
 (a2 + 2ab + b2) < ab.
That is, a2 – 2ab + b2 = (a – b)2 < 0. Since the left member of this equation is a square, it cannot be less
than zero, as is indicated. Having reached this contradiction, we may conclude that our assumption is incorrect
and that the original assertion is true.
1.13. If a1, a2, . . . ,an and b1, b2 . . . bn are any real numbers, prove Schwarz’s inequality:
(a1 b1 + a2b2 + . . . + anbn)2 <  (a2
1 + a2
2 + . . . + a2
n)(b2
1 + b2
2 + . . . + b2
2 n)
For all real numbers λ, we have
(a1λ + b1)2 + (a2 λ + b2)2 + . . . + (anλ + bn)2 >  0
Expanding and collecting terms yields
 A 2λ2 + 2Cλ + B2 >  0 (1)
where
 A 2 = a2
1 + a2
2 + . . . + a2
n. B2 = b2
1 + b2
2 + . . . + b2
n, C = a1b1 + a2b2 + . . . + anbn (2)
The left member of Equation (1) is a quadratic form in λ. Since it never is negative, its discriminant, 4C2
– 4A2B2, cannot be positive. Thus,
C2 – A2B2 ≤ 0  or  C 2 ≤ A2 B2
This is the inequality that was to be proved.
1.14. Prove that 111
248+++ . . .
1
1 1
2n−+< for all positive integers n > 1.
Let
111
248
nS =++ + . . .
1
1
2n−+
Then
11 1
24 8
nS =+ + . . .
1
11
22nn−++
Subtracting,
11 1
22 2
n nS =−


## Page 23

CHAPTER 1  Numbers12
Thus,
1
11 1 for all .2
n nSn −=− <
Exponents, roots, and logarithms
1.15. Evaluate each of the following:
(a)
48 4 8
481 4 2
14 14 2
33 3 1 133 933 3
+
+− −⋅ == = = =
(b)
62 6 2
91 0 5
55
(5 10 )(4 10 ) 5 4 10 10 : 2.5 10 25 10 5 10  or 0.00005881 0 1 0
−−
−− −⋅⋅ ⋅ ⋅ == ⋅ = ⋅ = ⋅⋅
(c) () () () ()
3327 27 3 22
2/3 83 8 2 3log . Then or 3
x
xx
−
== = = = −
(d) (log ab)(logb a) = u. Then log a b = x, logb a = y, assuming a, b > 0 and a, b /HS11005 1.
Then ax = b, by = a, and u = xy. Since (ax)y = axy = by = a, we have axy = a1 or xy = 1, the required value.
1.16. If M > 0, N > 0, and a > 0 but a /HS11005 1, prove that loga
M
N
 = loga M – loga N.
Let loga M = x, loga N = y. Then ax = M, ay = N and so
or log log log
x
xy
aa ay
Ma Max y M NNN a
−== = − = −
Countability
1.17. Prove that the set of all rational numbers between 0 and 1 inclusive is countable.
Write all fractions with denominator 2, then 3, . . . , considering equivalent fractions such as 1
2
, 2
4
,
3
6
, . . . no more than once. Then the 1-1 correspondence with the natural numbers can be accomplished as
follows:
31121 1 2
23344 5 5Rational numbers 0 1
Natural numbers 1 2 3 4 5 6 7 8 9
…
bbbbbbbb b
K
b b bbbb bb b
…
…
Thus, the set of all rational numbers between 0 and 1 inclusive is countable and has cardinal number ℵ 0
(see Page 6).
1.18. If A and B are two countable sets, prove that the set consisting of all elements from A or B (or both) is also
countable.
Since A is countable, there is a 1-1 correspondence between elements of A and the natural numbers so that
we can denote these elements by a1, a2, a3, . . .
Similarly, we can denote the elements of B by b1, b2, b3, . . .
Case 1: Suppose elements of A are all distinct from elements of B. Then the set consisting of elements from
A or B is countable, since we can establish the following 1-1 correspondence:
11 2233 or
Natural numbers 1 2 3 4 5 6
AB a b a b a b …
…
bbbbbbbbbbbb


## Page 24

CHAPTER 1  Numbers 13
Case 2: If some elements of A and B are the same, we count them only once, as in Problem 1.17. Then the
set of elements belonging to A or B (or both) is countable.
The set consisting of all elements which belong to A or B (or both) is often called the union of A and B,
denoted by A ∪ B or A + B.
The set consisting of all elements which are contained in both A and B is called the intersection of A and
B, denoted by A ∪B or AB. If A and B are countable, so is A ∪B.
The set consisting of all elements in A but not in B is written A – B. If we let [B be the set of elements
which are not in B, we can also write A – B = A B . If A and B are countable, so is A – B.
1.19. Prove that the set of all positive rational numbers is countable.
Consider all rational numbers x > 1. With each such rational number we can associate one and only one
rational number 1/x in (0, 1); i.e., there is a one-to-one correspondence between all rational numbers > 1 and
all rational numbers in (0, 1). Since these last are countable by Problem 1.17, it follows that the set of all ra-
tional numbers > 1 is also countable.
From Problem 1.18 it then follows that the set consisting of all positive rational numbers is countable, since
this is composed of the two countable sets of rationals between 0 and 1 and those greater than or equal to 1.
From this we can show that the set of all rational numbers is countable (see Problem 1.59).
1.20. Prove that the set of all real numbers in [0, 1] is noncountable.
Every real number in [0, 1] has a decimal expansion .a
1a2a3 . . . where a1, a2, . . . are any of the digits 0,
1, 2, . . . ,9.
We assume that numbers whose decimal expansions terminate such as 0.7324 are written 0.73240000 . . . and
that this is the same as 0.73239999 . . .
If all real numbers in [0, 1] are countable we can place them in 1-1 correspondence with the natural num-
bers as in the following list:
11 12 13 14
21 22 23 24
31 32 33 34
10 .
20 .
30 .
aaaa
aaaa
aaaa
↔…
↔…
↔…
MM
MM
We now form a number
0.b1b2b3b4 . . .
where b1 /HS11005a11, b2 /HS11005a22, b /HS11005a33, b4 /HS11005a44, . . . and where all b’s beyond some position are not all 9’s.
This number, which is in [0. 1], is different from all numbers in the preceding list and is thus not in the
list, contradicting the assumption that all numbers in [0, 1] were included.
Because of this contradiction, it follows that the real numbers in [0, 1] cannot be placed in 1-1 correspond-
ence with the natural numbers; i.e., the set of real numbers in [0, 1] is noncountable.
Limit points, bounds, Bolzano-Weierstrass theorem
1.21. (a) Prove that the infinite set of numbers 1, 1
2
, 1
3
, 1
4
, . . . is bounded. (b) Determine the least upper bound
(l.u.b.) and greatest lower bound (g.l.b.) of the set. (c) Prove that 0 is a limit point of the set. (d) Is the set a
closed set? (e) How does this set illustrate the Bolzano-Weierstrass theorem?
(a) Since all members of the set are less than 2 and greater than –1 (for example), the set is bounded; 2 is an
upper bound; –1 is a lower bound.
We can find smaller upper bounds (e.g., 3/2) and larger lower bounds (e.g., –1
2
).


## Page 25

CHAPTER 1  Numbers14
(b) Since no member of the set is greater than 1 and since there is at least one member of the set (namely, 1)
which exceeds 1 – ε for every positive number ε, we see that 1 is the l.u.b. of the set.
Since no member of the set is less than 0 and since there is at least one member of the set which is
less than 0 + ε for every positive ε (we can always choose for this purpose the number 1/n, where n is a
positive integer greater than 1/ε), we see that 0 is the g.l.b. of the set.
(c) Let x be any member of the set. Since we can always find a number x such that 0 < ⏐x⏐ < δ for any posi-
tive number δ (e.g., we can always pick x to be the number 1/n, where n is a positive integer greater than
1/δ), we see that 0 is a limit point of the set. To put this another way, we see that any deleted δ neighbor-
hood of 0 always includes members of the set, no matter how small we take δ > 0.
(d) The set is not a closed set, since the limit point 0 does not belong to the given set.
(e) Since the set is bounded and infinite, it must, by the Bolzano-Weierstrass theorem, have at least one limit
point. We have found this to be the case, so that the theorem is illustrated.
Algebraic numbers
1.22. Prove that 3 23+  is an algebraic number.
Let x = 3 23+ . Then x – 3  = 3 2 . Cubing both sides and simplifying, we find x3 + 9x – 2 = 3 3
(x2 + 1). Then, squaring both sides and simplifying, we find x6 – 9x4 – 4x3 + 27x2 + 36x – 23 = 0.
Since this is a polynomial equation with integral coefficients, it follows that 3 2  + 3 , which is a solu-
tion, is an algebraic number.
1.23. Prove that the set of all algebraic numbers is a countable set.
Algebraic numbers are solutions to polynomial equations of the form a 0xn +a, xn−1 + . . . + an = 0 where
a0, a1, . . . , an are integers.
Let P = ⏐a0⏐ + ⏐a 1⏐ + . . . + ⏐an ⏐+ n. For any given value of P there are only a finite number of possible
polynomial equations and thus only a finite number of possible algebraic numbers.
Write all algebraic numbers corresponding to P = 1, 2, 3, 4, . . . , avoiding repetitions. Thus, all algebraic
numbers can be placed into 1-1 correspondence with the natural numbers and so are countable.
Complex numbers
1.24. Perform the indicated operations:
(a) (4 – 2i) + (– 6 + 5i) = 4 – 2i – 6 + 5i = 4 – 6 + (–2 + 5)i = –2 + 3i
(b) (–7 + 3i) – (2 – 4i) = –7 + 3i – 2 + 4i = –9 + 7i
(c) (3 – 2i)(1 + 3i) = 3(1 + 3i) – 2i(1 + 3i) = 3 + 9i – 2i – 6i 2 = 3 + 9i – 2i + 6 = 9 + 7i
(d)
2
2
–5 5 5 5 4 3 ( 5 5 )(4 3 ) 20 15 20 15
43 43 43 1 6916 9
35 5 5( 7 ) 7 1
25 25 5 5
ii i i i i i i
ii i i
ii i
+− + + − + + − − + +=⋅ = =−− + +−
−+ − + −== = +
(e)
2 3 4 5 2 22 22
2
2
1( ) ( )( ) ( ) 1 1
11 1
11 1 1
11 22 2 1
ii i i i i ii i i i i i i
ii i
ii i i i iii i
+ + + + −+ + + −−++==++ +
−− +=⋅= = = ++− −
(f) 22 2 2| 3 4 | | 4 3 | ( 3 )( 4 ) ( 4 )( 3 ) ( 5 ) ( 5 ) 2 5ii−+ = + − + = =


## Page 26

CHAPTER 1  Numbers 15
(g) 2
22
2111 3 1 36 6 3 (0)1 3 1 3 10 10 519 19
ii i
ii ii
−+ − ⎛⎞− =−= = + − = ⎜⎟+− −− ⎝⎠
1.25. If z1 and z2 are two complex numbers, prove that ⏐z1z2⏐ = ⏐z 1⏐⏐z 2⏐.
11 1 2 2 2
12 1 1 2 2 12 12 12 21
2 2 22 22 22 22
12 12 12 21 1 2 1 2 1 2 21
22 22 22 22
11 22 1 22 1 1 2 2 1 2
Let , . Then
z( ) ( ) ( )
() ()
() () .
z x iy z x iy
zx i y x i yx x y y i x y x y
x x y y x y xy xx yy xy xy
xy xy xy xy x i y x i y z z
=+ =+
=+ + = − + +
=− + + = + + +
=+ + = + + = + + =
1.26. Solve x3 – 2x – 4 = 0.
The possible rational roots using Problem 1.7 are ±1, ±2, and ±4. By trial, we find x = 2 is a root. Then
the given equation can be written (x  – 2)(x 2 + 2x  + 2) = 0. The solutions to the quadratic equation
ax2 + bx + c  = 0 are
2 4
2
bb a cx a
−± −=  For a  = 1, b  = 2, and c  = 2, this gives 24 8
2x −± −==
24 2 2 1.22
i i−± − −± == − ±
The set of solutions is 2, –1 + i, –1 – i.
Polar form of complex numbers
1.27. Express in polar form (a) 3 + 3i, (b) –1 + 3i , (c) – 1, and (d) –2 – 2 3i . See Figure 1.4.
Figure 1.4
(a) Amplitude φ = 45º = π/4 radians. Modulus 22333 2ρ= + = .
Then 3 + 3i = ρ (cos φ + i sin φ) = 32  (cos π/4 + i sin π/4) = 32
cis π/4 = 32 eπι/4
.
(b) Amplitude φ = 120º = 2π/3 radians. Modulus
2(3 ) 4 2ρ 2=( − 1 ) + = = . Then –1 + 3 3 i = 2(cos 2π/3 +
i sin 2π/3) = 2 cis 2π/3 = 2e2πi/3.
(c) Amplitude φ = 180º = π radians. Modulus 2(0) 1.ρ 2=( − 1 ) + =
Then –1 = 1(cos π + i sin π) = cis π = eπi.
(d) Amplitude φ = 240º = 4π/3 radians. Modulus
22( 2 3 ) 4 .ρ 2=( − ) + − =  Then –2 –2 3  =
4(cos 4π/3 + isin 4π/3) = 4 cis 4 π/3 = 4e 4πi/3.
Figure 1.5


## Page 27

CHAPTER 1  Numbers16
1.28. Evaluate (a) (–1 + 3i)10 and (b) (–1 + i)1/3.
(a) By Problem 1.27(b) and De Moivre’s theorem.
(–1 + 3i)10 = [2(cos 2π/3 + i sin 2π/3)]10 = 210 (cos 20π/3 + i sin 20π/3)
 = 1024[cos(2π/3 + 6π) + i sin(2π/3 + 6π)] = 1024(cos 2π/3 + i sin 2π/3)
 = 1024 11 3 512 512 322 ii⎛⎞−+ = − +⎜⎟⎝⎠
(b) –1 + i = 2 (cos 135º + i sin 135º) = 2 [cos(135º + k · 360º) + i sin (135º + k · 360º)]. Then
1/3 1/3 135 360 135 360(1 ) (2 ) c o s s i n33
kkii ⎡⎤ °+ ⋅ ° °+ ⋅ °⎛⎞ ⎛⎞−+ = +⎜⎟ ⎜⎟⎢⎥ ⎝⎠ ⎝⎠⎣⎦
The results for k = 0, 1, 2 are
6 2 (cos 45º + i sin 45º).
6 2 (cos 165º + i sin 165º),
6 2 (cos 285º + i sin 285º)
The results for k = 3, 4, 5, 6, 7, . . . give repetitions of these. These complex roots are represented geo-
metrically in the complex plane by points P1, P2, P3 on the circle of Figure 1.5.
Mathematical induction
1.29. Prove that 1 2 + 22 + 33 + 42 + . . . + n2 = 1
6
n(n + 1)(2n + 1).
The statement is true for n = 1, since 12 = 1
6
 (1)(1 + 1) (2 · 1 + 1) = 1.
Assume the statement is true for n = k. Then
12 + 22 + 32 + . . . + k2 = 1
6
k(k + 1)(2k + 1)
Adding (k + 1)2 to both sides.
12 + 22 + 32 + . . . + k2 + (k + 1)2 = 1
6
k(k + 1)(2k + 1) + (k + 1)2 = (k + 1)[ 1
6
k(2k + 1) + k + 1]
 = 1
6
(k + 1)(2k2 + 7k + 6) = 1
6
(k + 1)(k + 2)(2k + 3)
which shows that the statement is true for n = k + 1 if it is true for n = k. But since it is true for n = 1, it follows
that it is true for n = 1 + 1 = 2 and for n = 2 + 1 = 3, . . . ; i.e., it is true for all positive integers n.
1.30. Prove that xn – yn has x – y as a factor for all positive integers n.
The statement is true for n = 1, since x1 – y1 = x – y.
Assume the statement is true for n = k; i.e., assume that xk – yk has x – y as a factor. Consider
xk +1 – yk +1 = xk + 1 – xky + xky – yk+ 1
 = xk (x – y) + y(xk – yk)
The first term on the right has x – y as a factor, and the second term on the right also has x – y as a factor because
of the previous assumption.
Thus, xk +1 – yk +1 has x – y as a factor if xk – yk does.


## Page 28

CHAPTER 1  Numbers 17
Then, since x1 – y1 has x – y as factor, it follows that x2 – y2 has x – y as a factor, x3 – y3 has x – y as a fac-
tor, etc.
1.31. Prove Bernoulli’s inequality (1 + x)n > 1 + nx for n = 2, 3, . . . if x > –1, x /HS11005 0.
The statement is true for n = 2, since (1 + x)2 = 1 + 2x + x2 > 1 + 2x.
Assume the statement is true for n = k; i.e., (1 + x)k > 1 + kx.
Multiply both sides by 1 + x (which is positive, since x > –1). Then we have
(1 + x)k + 1 > (1 + x)(1 + kx) = 1 + (k + 1) x + kx2 > 1 + (k + 1)x
Thus, the statement is true for n = k + 1 if it is true for n = k.
But since the statement is true for n = 2, it must be true for n = 2 + 1 = 3 . . . and is thus true for all integers
greater than or equal to 2.
Note that the result is not true for n  = 1. However, the modified result (1 + x)n >  1 + nx is true for
n = 1, 2, 3, . . .
Miscellaneous problems
1.32. Prove that every positive integer P can be expressed uniquely in the form P = a 02n + a12n – 1 + a22n –2 + . . . +
an where the a’s are 0’s or 1’s.
Dividing P by 2, we have P/2 = a02n –1 + a12n –2 + . . . + an –1 + an/2.
Then an is the remainder, 0 or 1, obtained when P is divided by 2 and is unique.
Let P1 be the integer part of P/2. Then P1 = a02n –1 + a12n–2 + . . . + an –1.
Dividing P1 by 2, we see that a n –1 is the remainder, 0 or 1, obtained when P 1 is divided by 2 and is
unique.
By continuing in this manner, all the a’s can be determined as 0’s or 1’s and are unique.
1.33. Express the number 23 in the form of Problem 1.32.
The determination of the coefficient can be arranged as follows:
 2) 23
 2) 11 Remainder 1
 2) 5 Remainder 1
 2) 2 Remainder 1
 2) 1 Remainder 0
 0 Remainder 1
The coefficients are 1 0 1 1 1. Check: 23 = 1 ·2
4 + 0 ·23 + 1 ·22 + 1 ·2 + 1.
The number 10111 is said to represent 23 in the scale of two or binary scale.
1.34. Dedekind defined a cut, section, or partition in the rational number system as a separation of all rational numbers
into two classes or sets called L (the left-hand class) and R (the right-hand class) having the following properties:
 I. The classes are non-empty (i.e. at least one number belongs to each class).
 II. Every rational number is in one class or the other.
 III. Every number in L is less than every number in R.
Prove each of the following statements:
(a) There cannot be a largest number in L and a smallest number in R.
(b) It is possible for L to have a largest number and for R to have no smallest number. What type of number
does the cut define in this case?


## Page 29

CHAPTER 1  Numbers18
(c) It is possible for L to have no largest number and for R to have a smallest number. What type of number
does the cut define in this case?
(d) It is possible for L to have no largest number and for R to have no smallest number. What type of number
does the cut define in this case?
(a) Let a be the largest rational number in L and b the smallest rational number in R. Then either a = b or
a < b.
We cannot have a = b, since, by definition of the cut, every number in L is less than every number in R.
We cannot have a < b, since, by Problem 1.9, 1
2
 (a + b) is a rational number which would be greater than
a (and so would have to be in R) but less than b (and so would have to be in L), and, by definition, a rational
number cannot belong to both L and R.
(b) As an indication of the possibility, let L contain the number 2
3
 and all rational numbers less than 2
3
, while
R, contains all rational numbers greater than 2
3
. In this case the cut defines the rational number 2
3
. A
similar argument replacing 2
3
 by any other rational number shows that in such case the cut defines a ra-
tional number.
(c) As an indication of the possibility, let L contain all rational numbers less than 2
3
, while R contains all
rational numbers greater than 2
3
. This cut also defines the rational number 2
3
. A similar argument shows
that this cut always defines a rational number.
(d) As an indication of the possibility, let L consist of all negative rational numbers and all positive rational
numbers whose squares are less than 2, while R consists of all positive numbers whose squares are greater
than 2. We can show that if a is any number of the L class, there is always a larger number of the L class,
while if b  is any number of the R  class, there is always a smaller number of the R  class (see Problem
1.106). A cut of this type defines an irrational number.
From (b), (c), and (d ), it follows that every cut in the rational number system, called a Dedekind cut,
defines either a rational or an irrational number. By use of Dedekind cuts we can define operations (addition,
multiplication, etc.) with irrational numbers.
SUPPLEMENTARY PROBLEMS
Operations with numbers
1.35. Given x = –3, y = 2, z = 5, a = 3
2
, and b = – 1
4
, evaluate:
(a) (2x – y)(3y + z)(5x – 2z)  (b)
22
21
xy z
ab
−
−
  (c)
22
22
3
22 1
ab a b
ab
+
+
  (d)
22
22
() ()
() ()
ax by ay bx
ay bx ax by
++ −
++ −
Ans. (a) 2200 (b) 32 (c) –51/41 (d) 1
1.36. Find the set of values of x for which the following equations are true. Justify all steps in each case.
(a) 4{(x – 2) + 3(2x – 1)} + 2 (2x + 1) = 12 (x + 2) – 2 (c) 2 87 22 1xx x x++ − + = +
(b) 11 1
82 4xx−=−−
 ( d)
2
13
525
x
xx
− =
−+
Ans. (a) 2 (b) 6, – 4 (c) – 1, 1 (d) 1
2−
1.37. Prove that 0() () () () () ()
xyz
zx xy xy yz yz zx++=−− −− − −
, giving restrictions if any.


## Page 30

CHAPTER 1  Numbers 19
Rational and irrational numbers
1.38. Find decimal expansions for (a) 3
7
and (b) 5 .
Ans. (a) 0.4˙2˙8˙ 5˙ 7˙1˙  (b) 2.2360679 . . .
1.39. Show that a fraction with denominator 17 and with numerator 1, 2, 3, . . . , 16 has 16 digits in the repeating
portion of its decimal expansion. Is there any relation between the orders of the digits in these expansions?
1.40. Prove that (a) 3  and (b) 3 2  are irrational numbers.
1.41. Prove that (a) 3 5  – 4 3  and (b) 2  + 3  + 5  are irrational numbers.
1.42. Determine a positive rational number whose square differs from 7 by less than .000001.
1.43. Prove that every rational number can be expressed as a repeating decimal.
1.44. Find the values of x for which (a) 2x
3 – 5x2 – 9x + 18 = 0, (b) 3x3 + 4x2 – 35x + 8 = 0, and (c) x4 – 21x2 +
4 = 0.
Ans. (a) 3, –2, 3/2 (b) 8/3, –2 ± 5  (c) 1
2
 (5 ± 17 ), 1
2
 (–5 ± 17 )
1.45. If a, b, c, and d are rational and m is not a perfect square, prove that a + b m  = c + d m  if and only if
a = c and b = d.
1.46. 13 5 1 2 5 2 1 5 1 4 3 7Prove that .1113 5
+ + −+− =
−+
Inequalities
1.47. Find the set of values of x for which each of the following inequalities holds:
(a) 13 5,2xx+>  (b) x(x + 2) <  24, (c) ⏐x + 2 ⏐< ⏐x – 5⏐, (d) 3
23 1
xx
xx
+>++
Ans. (a) 0 < x < 1
2
 (b) –6 < x <  4 (c) x < 3/2 (d) x > 3, –1 < x < – 1
3
, or x < – 2
1.48. Prove (a) ⏐x + y⏐ < ⏐x⏐ + ⏐y⏐, (b) ⏐x + y + z⏐ < ⏐x⏐ + ⏐y⏐ + ⏐z⏐, and (c) ⏐x⏐ – y⏐ > ⏐ x⏐ – ⏐y⏐.
1.49. Prove that for all real x, y, z, x2 + y2 + z2 > xy + yz + zx.
1.50. If a2 + b2 = 1 and c2 + d2 = 1, prove that ac + bd <  1.
1.51. If x > 0, prove that 1
1
11nn
nnxx
xx
+
++> + where n is any positive integer.


## Page 31

CHAPTER 1  Numbers20
1.52. Prove that for all real a /HS11005 0, ⏐a + 1/a⏐>  2.
1.53. Show that in Schwarz’s inequality (Problem 1.13) the equality holds if and only if a p = kbp, p = 1, 2,
3, . . . ,n, where k is any constant.
1.54. If a1, a2, a3 are positive, prove that 1
3
 (a1 + a2 + a3) > 3 123aaa .
Exponents, roots, and logarithms
1.55. Evaluate: (a) 4 log28 (b) 1/8
31log4 128
⎛⎞
⎜⎟⎝⎠
 (c) 5
(0.00004)(25,000)
(0.02) (0.125)
 (d) 3–2log35 (e)
4/31
8
⎛⎞−⎜⎟⎝⎠
– (–27)–2/3
Ans. (a) 64 (b) 7/4 (c) 50,000 (d) 1/25 (e) –7/144
1.56. Prove (a) log a MN = logaM + loga N and (b) loga Mr = r loga M indicating restrictions, if any.
1.57. Prove blogba = a giving restrictions, if any.
Countability
1.58. (a) Prove that there is a one-to-one correspondence between the points of the interval 0 < x <  1 and –5 <
x <  –3. (b) What is the cardinal number of the sets in (a)?
Ans. (b) C, the cardinal number of the continuum.
1.59. (a) Prove that the set of all rational numbers is countable. (b) What is the cardinal number of the set in (a)?
Ans. (b) ℵ 0
1.60. Prove that the set of (a) all real numbers and (b) all irrational numbers is noncountable.
1.61. The intersection of two sets A and B, denoted by A ∪B or AB, is the set consisting of all elements
belonging to both A and B. Prove that if A and B are countable, so is their intersection.
1.62. Prove that a countable sets of countable sets is countable.
1.63. Prove that the cardinal number of the set of points inside a square is equal to the cardinal number of the sets
of points on (a) one side and (b) all four sides. (c) What is the cardinal number in this case? (d) Does a
corresponding result hold for a cube?
Ans. (c) C
Limit points, bounds, Bolzano-Weierstrass theorem
1.64. Given the set of numbers 1, 1.1,.9, 1.01, .99, 1.001,.999, . . . , (a) is the set bounded? (b) Does the set have
an l.u.b. and a g.l.b.? If so, determine them. (c) Does the set have any limit points? If so, determine them.
(d) Is the set a closed set?
Ans. (a) Yes (b) l.u.b. = 1.1.g.l.b. = .9 (c) 1 (d) Yes


## Page 32

CHAPTER 1  Numbers 21
1.65. Given the set –.9,.9, –.99, .99, –.999, .999, answer the questions in Problem 1.64.
Ans. (a) Yes (b) l.u.b. = 1, g.l.b. = –1 (c) 1, –1 (d) No
1.66. Give an example of a set which has (a) three limit points and (b) no limit points.
1.67. (a) Prove that every point of the interval 0 < x < 1 is a limit point. (b) Are there limit points which do not
belong to the set in (a)? Justify your answer.
1.68. Let S be the set of all rational numbers in (0, 1) having denominator 2n, n = 1, 2, 3, . . . (a) Does S have any
limit points? (b) Is S closed?
1.69. (a) Give an example of a set which has limit points but which is not bounded. (b) Does this contradict the
Bolzano-Weierstrass theorem? Explain.
Algebraic and transcendental numbers
1.70. Prove that (a) 32 ,
32
−
+
(b) 235++  are algebraic numbers.
1.71. Prove that the set of transcendental numbers in (0, 1) is not countable.
1.72. Prove that every rational number is algebraic but every irrational number is not necessarily algebraic.
Complex numbers, polar form
1.73. Perform each of the indicated operations:
(a) 2(5 – 3i) – 3(–2 + i) + 5(i – 3)
(b) (3 – 2i) 3
(c) 51 0
34 43ii+−+
(d)
10
1
1
i
i
−⎛⎞
⎜⎟+⎝⎠
(e)
2
24
57
i
i
−
+
(f) 2
(1 )(2 3 )(4 2 )
(1 2 ) (1 )
iii
ii
++ −
+−
Ans. (a) 1 – 4i (b) – 9 – 46i (c) 11 2
55 i−  (d) –1 (e) 10
37
 (f) 16 2
55 i−
1.74. If z1 and z2 are complex numbers, prove (a) 11
22
zz
zz = and (b) 22
11zz = , giving any restrictions.
1.75. Prove (a) ⏐z1 + z2⏐ < ⏐z1⏐ + ⏐z2⏐, (b) ⏐z1 + z2 + z3⏐ < ⏐z1⏐ + ⏐z2 + z3⏐ and (c) ⏐z1 – z2⏐ > ⏐z1⏐ – ⏐z2⏐.


## Page 33

CHAPTER 1  Numbers22
1.76. Find all solutions of 2x 4 – 3x3 – 7x2 – 8x + 6 = 0.
Ans. 3, 1
2
, – 1 ± i
1.77. Let z1 and z2 be represented by points P1 and P2 in the Argand diagram. Construct lines OP1 and OP2, where
O is the origin. Show that z1 + z2 can be represented by the point P3, where OP3 is the diagonal of a
parallelogram having sides OP1 and OP2. This is called the parallelogram law of addition of complex
numbers. Because of this and other properties, complex numbers can be considered as vectors in two
dimensions.
1.78. Interpret geometrically the inequalities of Problem 1.75.
1.79. Express in polar form (a) 3 3  + 3i, (b) –2 – 2i, (c) 1 – 3 i, (d) 5, and (e) –5i.
Ans. (a) 6 cis π/6 (b) 2 2  cis 5π/4 (c) 2 cis 5π/3 (d) 5 cis 0 (e) 5 cis 3π/2
1.80. Evaluate (a) [2(cos 25º + i sin 25º)][5(cos 110º + i sin 110º)] and (b) 12 cis 16 .(3 cis 44 )(2 cis 62 )
o
oo
Ans. (a) –5 2  + 5 2 i (b) – 2i
1.81. Determine all the indicated roots and represent them graphically: (a) 1/3(4 2 4 2 ) , i+  (b) (–1)1/5,
(c) ( 3  – i) 1/3, and (d) i1/4.
Ans. (a) 2 cis 15º, 2 cis 135º, 2 cis 255º
 (b) cis 36º, cis 108º, cis 180º = –1, cis 252º, cis 324º
 (c) 3 2  cis 110º, 3 2  cis 230º, 3 2  cis 350º
 (d) cis 22.5º, cis 112.5º, cis 202.5º, cis 292.5º
1.82. Prove that –1 + 3 i is an algebraic number.
1.83. If z1 = ρ1 cis φ1 and z2 = ρ2 cis φ2, prove (a) z1z2 = ρ1 ρ2 cis(φ1 + φ2 ) and (b) z1/z2 = (ρ1/ρ2)cis (φ1 – φ2).
Interpret geometrically.
Mathematical induction
Prove each of the following.
1.84. 1 + 3 + 5 + . . . + (2n – 1) = n 2
1.85. 111
13 35 57++ +⋅⋅⋅
. . . 1
(2 1)(2 1) 2 1
n
nn n+= −+ +
1.86. a + (a + d) + (a + 2d) + . . . + [a + (n – 1)d] = 1
2
n[2a + (n – 1)d]
1.87. 111
123 234 345+++⋅⋅ ⋅⋅ ⋅⋅
. . . 1( 3 )
( 1)( 2) 4( 1)( 2)
nn
nn n n n
++= ++ ++


## Page 34

CHAPTER 1  Numbers 23
1.88. 2aa ra r++ + . . . 1 (1 ) ,11
n
n arar rr
− −+= ≠ −
1.89. 1 3 + 23 + 33 + . . . + n3 = 1
4
n2 (n + 1)2
1.90. 231(5) 2(5) 3(5)+++ . . .
1
1 5( 4 1 ) 5(5) 16
n
n nn
+
− +−+=
1.91. x2n – 1 + y2n – 1 is divisible by x + y for n = 1, 2, 3, . . .
1.92. (cos φ + i sin φ)n = cos nφ + i sin nφ. Can this be proved if n is a rational number?
1.93. 1
2 cos cos2xx++ + . . .
1
2
1
2
sin( )c o s , 0 ,2,4,2sin
nxnx xx ππ++= ≠ ± ±  . . .
1.94. sin sin 2xx++ . . .
11
22
1
2
cos cos( )sin , 0, 2 , 42sin
xn xnx xx ππ−++= ≠ ± ±  . . .
1.95. ( a + b)n = an + nC1an–1 b + nC2an–2b2 + . . . + nCn–1abn–1 + bn
where (1 ) (2 ) ( 1 ) ! .!! ( ) !
nr nn r
nn n n r nCC rr n r
−
−− − +== =−
KK Here p! = p(p – 1) . . . 1 and 0! is defined as
1. This is called the binomial theorem. The coefficients 01 2
(1 )1, , ,2!
nnn
nnCC n C −== =  . . . ,1nnC =  are
called the binomial coefficients. nCr is also written n
r
⎛⎞
⎜⎟⎝⎠
.
Miscellaneous problems
1.96. Express each of the following integers (scale of 10) in the scale of notation indicated: (a) 87 (two), (b) 64
(three) (c) 1736 (nine). Check each answer.
Ans. (a) 1010111 (b) 2101 (c) 2338
1.97. If a number is 144 in the scale of 5. what is the number in the scale of (a) 2 and (b) 8?
1.98. Prove that every rational number p/q between 0 and 1 can be expressed in the form
12
22 2
aap
q =+ + . . .
2
n
n
a+ + . . .
where the a’s can be determined uniquely as 0’s or 1’s and where the process may or may not terminate.
The representation 0.a1a2 . . . an . . . is then called the binary form of the rational number. (Hint: Multiply both
sides successively by 2 and consider remainders.)
1.99. Express 2
3
 in the scale of (a) 2, (b) 3, (c) 8, and (d) 10.
Ans. (a) 0.1010101 . . . (b) 0.2 or 0.2000. . . . (c) 0.5252. . . . (d) 0.6666 . . .


## Page 35

CHAPTER 1  Numbers24
1.100. A number in the scale of 2 is 11.01001. What is the number in the scale of 10.
Ans. 3.28125
1.101. In what scale of notation is 3 + 4 = 12?
Ans. 5
1.102. In the scale of 12, two additional symbols, t and e,  must be used to designate the “digits” 10 and 11,
respectively. Using these symbols, represent the integer 5110 (scale of 10) in the scale of 12.
Ans. 2e5t
1.103. Find a rational number whose decimal expansion is 1.636363 . . .
Ans. 18/11
1.104. A number in the scale of 10 consists of six digits. If the last digit is removed and placed before the first digit,
the new number is one-third as large. Find the original number.
Ans. 428571
1.105. Show that the rational numbers form a field (see Page 3).
1.106. Using as axioms the relations 1 through 9 on Page 3, prove that (a) (–3)(0) = 0, (b) (–2)(+3) = –6,
and (c) (–2) (–3) = 6.
1.107. (a) If x is a rational number whose square is less than 2, show that x + (2 – x2)/10 is a larger such number.
(b) If x is a rational number whose square is greater than 2, find in terms of x a smaller rational number
whose square is greater than 2.
1.108. Illustrate how you would use Dedekind cuts to define (a) 5  + 3 , (b) 3  – 2 , (c) ( 3 )( 2 ), and
(d) 2 / 3 .


## Page 36

25
Sequences
Definition of a Sequence
A sequence is a set of numbers u1, u2, u3, . . . in a definite order of arrangement (i.e., a correspondence with
the natural numbers or a subset thereof) and formed according to a definite rule. Each number in the sequence
is called a term; un is called the nth term. The sequence is called finite or infinite according as there are or
are not a finite number of terms. The sequence u1, u2, u3, . . . is is also designated briefly by {un}.
EXAMPLES. 1.      The set of numbers 2, 7, 12, 17, . . ., 32 is a finite sequence; the nth term is given by un =
2 + 5 (n – 1) = 5n – 3, n = 1, 2, . . ., 7.
                         2.      The set of numbers 1, 1/3, 1/5, 1/7, . . . is an infinite sequence with nth term un = 1/(2n – 1),
n = 1, 2, 3, . . . .
Unless otherwise specified, we shall consider infinite sequences only.
Limit of a Sequence
A number l is called the limit of an infinite sequence u1, u2, u3, . . . if for any positive number /H9280 we can find
a positive number N depending on /H9280 such that ⏐un – l⏐ < /H9280 for all integers n > N. In such case we write lim
n→∞
un = l.
EXAMPLE. If un = 3 + 1/n = (3n + 1)/n, the sequence is 4, 7/2, 10/3, . . . and we can show that lim
n→∞
un = 3.
If the limit of a sequence exists, the sequence is called convergent; otherwise, it is called divergent. A
sequence can converge to only one limit; i.e., if a limit exists, it is unique. See Problem 2.8.
A more intuitive but unrigorous way of expressing this concept of limit is to say that a sequence u 1, u2,
u3, . . . has a limit l if the successive terms get “closer and closer” to l. This is often used to provide a “guess”
as to the value of the limit, after which the definition is applied to see if the guess is really correct.
Theorems on Limits of Sequences
If lim
n→∞
an = A and lim
n→∞
bn = B, then
1. lim
n→∞
 (an + bn) = lim
n→∞
an + lim
n→∞
bn = A + B
2. lim
n→∞
 (an – bn) = lim
n→∞
an – lim
n→∞
bn = A – B
3. lim
n→∞
 (an · bn) = ( lim
n→∞
an)( lim
n→∞
bn) = AB
CHAPTER 2


## Page 37

CHAPTER 2  Sequences26
lim
4. lim if lim 0lim
nnn
nnn
nn n
aa A bBbb B
→∞
→∞ →∞
→∞
== = ≠
If 0 and 0, lim does not exist.
If 0 and 0, lim may or may not exist.
n
n
n
n
n
n
aBA b
aBA b
→∞
→∞
=≠
==
 5.   lim (lim ) , for any real number if exists.pp p p
nnnn
aa A p A
→∞ →∞
===
 6.
lim
lim , for any real number if  exists.
an
nna AA
n
pp p p p→∞
→∞
== =
Infinity
We write lim
n→∞
an = /H11009 if for each positive number M we can find a positive number N (depending on M) such
that
∞ →n
na  > M for all n > N. Similarly, we write lim
n→∞
an = –/H11009 if for each positive number M we can find a
positive number N such that an < –M for all n > N. It should be emphasized that /H11009 and –/H11009 are not numbers
and the sequences are not convergent. The terminology employed merely indicates that the sequences diverge
in a certain manner. That is, no matter how large a number in absolute value that one chooses, there is an n
such that the absolute value of a
n is greater than that quantity.
Bounded, Monotonic Sequences
If un < M for n = 1, 2, 3, . . ., where M is a constant (independent of n), we say that the sequence {u n} is
bounded above and M is called an upper bound. If un > m, the sequence is bounded below and m is called a
lower bound.
If m < un < M the sequence is called bounded. Often this is indicated by ⏐u n⏐ < P. Every convergent
sequence is bounded, but the converse is not necessarily true.
If un+1 > un the sequence is called monotonic increasing; if un+1 > un it is called strictly increasing. Simi-
larly, if un+1 < un the sequence is called monotonic decreasing, while if un+1 < un it is strictly decreasing.
EXAMPLES. 1.  The sequence 1, 1.1, 1.11, 1.111, . . . is bounded and monotonic increasing. It is also
strictly increasing.
 2.  The sequence 1, –1, 1, –1, 1, . . . is bounded but not monotonic increasing or decreasing.
 3.  The sequence –1, –1.5, –2, –2.5, –3, . . . is monotonic decreasing and not bounded. How-
ever, it is bounded above.
The following theorem is fundamental and is related to the Bolzano-Weierstrass theorem (Chapter 1, Page
7) which is proved in Problem 2.23.
Theorem Every bounded monotonic (increasing or decreasing) sequence has a limit.
Least Upper Bound and Greatest Lower Bound of a Sequence
A number M is called the least upper bound (l.u.b.) of the sequence {un} if un < M, n = 1, 2,3, . . . while at
least one term is greater than M – /H9280 for any /H9280 > 0.


## Page 38

CHAPTER 2  Sequences 27
A number m  is called the greatest lower bound (g.l.b.) of the sequence {u n} if u n > m , n = 1, 2,
3, . . . while at least one term is less than m  + /H9280 for any /H9280 > 0.
Compare with the definition of l.u.b. and g.l.b. for sets of numbers in general (see Page 6).
Limit Superior, Limit Inferior
A number l  is called the limit superior, greatest limit, or upper limit (lim sup or lim ) of the sequence {un}
if infinitely many terms of the sequence are greater than l  – /H9280 while only a finite number of terms are greater
than l + /H9280, where /H9280 is any positive number.
A number l is called the limit inferior, least limit, or lower limit (lim inf or lim) of the sequence { un} if
infinitely many terms of the sequence are less than l + /H9280 while only a finite number of terms are less than
l – /H9280, where /H9280 is any positive number.
These correspond to least and greatest limiting points of general sets of numbers.
If infinitely many terms of {un} exceed any positive number M, we define lim sup {un} = /H11009. If infinitely
many terms are less than – M, where M is any positive number, we define lim inf {un} = –/H11009.
If lim
n→∞
un = /H11009, we define lim sup {un} = lim inf {un} = /H11009.
If lim
n→∞
un = –/H11009, we define lim sup {un} = lim inf {un} = – /H11009.
Although every bounded sequence is not necessarily convergent, it always has a finite lim sup and lim
inf.
A sequence {un} converges if and only if lim sup un = lim inf un is finite.
Nested Intervals
Consider a set of intervals [an, bn], n = 1, 2, 3, . . . , where each interval is contained in the preceding one and
lim
n→∞
 (an – bn) = 0. Such intervals are called nested intervals.
We can prove that to every set of nested intervals there corresponds one and only one real number. This
can be used to establish the Bolzano-Weierstrass theorem of Chapter 1. (See Problems 2.22 and 2.23.)
Cauchy’s Convergence Criterion
Cauchy’s convergence criterion states that a sequence {un} converges if and only if for each /H9280 > 0 we can
find a number N such that ⏐u p – uq⏐ < /H9280 for all p,q > N. This criterion has the advantage that one need not
know the limit l in order to demonstrate convergence.
Infinite Series
Let u1, u2, u3, . . . be a given sequence. Form a new sequence S1, S2, S3, . . . where
S1 = u1, S2 = u1 + u2, S3 = u1 + u2 + u3, . . . , + Sn = u1 + u2 + u3 + . . . + un, . . .
where Sn, called the nth partial sum, is the sum of the first n terms of the sequence {un}.
The sequence S1, S2, S3, . . . is symbolized by
123uuu++ + . . .
1
n
n
u
∞
=
= ∑


## Page 39

CHAPTER 2  Sequences28
which is called an infinite series. If lim
n→∞
Sn = S exists, the series is called convergent and S is its sum; other-
wise, the series is called divergent.
Further discussion of infinite series and other topics related to sequences is given in Chapter 11.
SOLVED PROBLEMS
Sequences
2.1. Write the first five terms of each of the following sequences.
(a) 21
32
n
n
⎧⎫ −
⎨⎬ +⎩⎭
(b) 3
1( 1 ) n
n
⎧⎫−−
⎨⎬
⎩⎭
(c)
1(1 )
246 2
n
n
−⎧⎫ −
⎨⎬ ⋅⋅⎩⎭ LL
(d) 111
248
⎧ +++⎨⎩
 . . . 1
2n
⎫+ ⎬
⎭
(e)
121(1 )
(2 1)!
nn x
n
−−⎧⎫−
⎨⎬ −⎩⎭
(a) 13 5 7 9,, , ,5 8 11 14 17
(b) 333
222,0 , ,0 ,135
(c) 1 11 1 1 1,, , ,22 42 4 62 4 6 82 4 6 8 1 0
−−
⋅⋅ ⋅⋅ ⋅ ⋅⋅ ⋅ ⋅ ⋅
(d) 1 11 111 111 1 111 1 1,, , ,22 42 4 82 4 8 1 62 4 8 1 6 3 2++ ++ + + + + + +
(e)
35 79
,, ,,1! 3! 5! 7! 9!
xx x x x−−
Note that n! = 1 · 2 · 3 · 4 . . . n . Thus, 1! = 1, 3! = 1 · 2 · 3 = 6, 5! = 1 · 2 · 3 · 4 · 5 = 120, etc. We define
0! = 1.
2.2. Two students were asked to write an nth term for the sequence 1, 16, 81, 256, . . . and to write the 5th term
of the sequence. One student gave the nth term as un = n4. The other student, who did not recognize this
simple law of formation, wrote un = 10n3 – 35n2 + 50n – 24. Which student gave the correct 5th term?
If un = n4, then u1 = 14 = 1, u2 = 24 = 16, u3 = 34 = 81, and u4 = 44 = 256, which agrees with the first four
terms of the sequence. Hence, the first student gave the 5th term as u5 = 54 = 625.
If un = 10n3 – 35n2 + 50n – 24, then u1 = 1, u2 = 16, u3 = 81, and u4 = 256, which also agrees with the first
four terms given. Hence, the second student gave the 5th term as u5 = 601.


## Page 40

CHAPTER 2  Sequences 29
Both students were correct. Merely giving a finite number of terms of a sequence does not define a unique
nth term. In fact, an infinite number of nth terms is possible.
Limit of a sequence
2.3. A sequence has its nth term given by 31
45n
nu n
−= +
. (a) Write the 1st, 5th, 10th, 100th, 1000th, 10,000th and
100,000th, terms of the sequence in decimal form. Make a guess as to the limit of this sequence as n → /H11009.
(b) Using the definition of limit, verify that the guess in (a) is actually correct.
(a) n = 1 n = 5       n = 10 n = 100    n = 1000 n = 10,000  n = 100,000
.22222 . . . . 56000 . . .  .64444 . . .  .73827 . . .  .74881 . . .  .74988 . . .  .74998 . . .
A good guess is that the limit is .75000 . . . =
3
4
. Note that it is only for large enough values of n that a
        possible limit may become apparent.
(b) We must show that for any given /H9280 > 0 (no matter how small) there is a number N (depending on /H9280) such
that 3
4nu −  < /H9280 for all n > N.
or31 3 1 9 1 9Now when  4 5 4 4(4 5) 4(4 + 5)
4(4 + 5) 1 19 1 19,4 5 , 519 4 4 4
n
nn n
n nn
εε
εε ε
<⎡⎤ ⎡ ⎤−− −= <⎢⎥ ⎢ ⎥++⎣⎦ ⎣ ⎦
⎛⎞>+ > > − ⎜⎟⎝⎠
    Choosing N = 1
4
 (19/4/H9280 – 5),    we see that 3
4nu −  < /H9280 for all n > N,    so that lim
n→∞
 = 3
4
 and the proof is
        complete.
 Note that if /H9280 = .001 (for example), N = 1
4
(19000/4 – 5) = 1186 1
4
. This means that all terms of the
       sequence beyond the 1186th term differ from 3/4 in absolute value by less than .001.
2.4. Prove that lim
n→∞ p
c
n
 = 0 where c /HS11005 0 and p > 0 are constants (independent of n).
We must show that for any /H9280 > 0 there is a number N such that ⏐c/np – 0⏐ < /H9280 for all n > N.
Now p
c
n
 < /H9280 when p
c
n
 < /H9280; i.e., np >
c
ε
or n >
1/ pc
ε
⎛⎞
⎜⎟⎜⎟⎝⎠
. Choosing N =
1/ pc
ε
⎛⎞
⎜⎟⎜⎟⎝⎠
(depending on /H9280), we
see that ⏐c/np⏐ < /H9280 for all n > N, proving that lim
n→∞
 (c/np) = 0.
2.5. 1 2 10 2Prove that lim .353 1 0
n
nn→∞
+⋅ =+⋅
We must show that for any /H9280 > 0 there is a number N such that 1 2 10 2 for all .353 1 0
n
n nNε+⋅ −< >+⋅
12 1 0 2 7Now 35 3 10 3(5 3 10 )
n
nn ε+⋅ −−= <+⋅ +⋅
 when 7
3(5 + 3 10 )n ε <⋅
; i.e., when 3
7 (5 3 10 ) 1/ ,n ε+⋅ >
3 · 10n > 7/3/H9280 – 5, 10n > 1
8
 (7/3/H9280 – 5) or n > log 10 { 1
3
 (7/3/H9280 – 5)} = N, proving the existence of N and thus estab-
lishing the required result.
Note that the value of N is real only if 7/3/H9280 – 5 > 0; i.e., 0 < /H9280 < 7/15. If /H9280/H11084 7/15, we see that
1 2 10 2 for 0.353 1 0
n
n all nε+⋅ −< >+⋅
2.6. Explain exactly what is meant by the statements (a) lim
n→∞
 32n–1 = /H11009 and (b) lim
n→∞
 (1 – 2n) = –/H11009.
(a) If for each positive number M we can find a positive number N (depending on M) such that a n > M for all
n > N, then we write lim
n→∞
an = /H11009.
21In this case, 3 when (2 1) log 3 > log n Mn M− >− ; 1l o gi.e., 1 . 2 log 3
MnN ⎛⎞>+ =⎜⎟⎝⎠


## Page 41

CHAPTER 2  Sequences30
(b) If for each positive number M we can find a positive number N (depending on M) such that a n < –M for
all n > N, then we write lim
n→∞
 = –/H11009.
In this case, 1 – 2n < –M when 2n – 1 > M or n > 1
2
(M + 1) = N.
It should be emphasized that the use of the notations /H11009 and –/H11009 for limits does not in any way imply con-
vergence of the given sequences, since /H11009 and –/H11009 are not numbers. Instead, these are notations used to describe
that the sequences diverge in specific ways.
2.7. Prove that lim
n→∞
xn = 0 if ⏐x⏐ < 1.
Method 1: We can restrict ourselves to x /HS11005 0, since if x = 0, the result is clearly true. Given /H9280 > 0, we must
show that there exists N such that ⏐xn⏐ < /H9280 for n > N. Now ⏐xn⏐ = ⏐x⏐
n
 < /H9280 when n log10 ⏐x⏐ < log 10 /H9280. Divid-
ing by log10 ⏐x⏐, which is negative, yields 10
10
log ,lognN x
ε>=  proving the required result.
Method 2: Let ⏐x⏐ = 1/(1 + p ), where p  > 0. By Bernoulli’s inequality (Problem 1.31), we have ⏐ xn⏐ =
⏐x⏐
n
 = 1/(1 + p)n < 1/(1 + np) < /H9280 for all n > N. Thus, lim
n→∞
xn = 0.
Theorems on limits of sequences
2.8. Prove that if lim
n→∞
un exists, it must be unique.
We must show that if lim
n→∞
un = l1 and lim
n→∞
un = l2, then l1 = l2.
By hypothesis, given any /H9280 > 0 we can find N such that
12
11 when22 when ,nnu l nN u l nNεε−< > −< >
Then
11
12 1 2 1 2 22nn n nll luul lu ul εε ε−=−+−<− + −< + =
i.e., ⏐l1 – l2⏐ is less than any positive /H9280 (however small) and so must be zero. Thus, l1 = l2.
2.9. If lim
n→∞
an = A and lim
n→∞
bn = B, prove that lim
n→∞
 (an + bn) = A + B.
We must show that for any /H9280 > 0, we can find N > 0 such that ⏐(an + bn) – (A + B)⏐ < /H9280 for all n > N. From
absolute value property 2, Page 4, we have
 ⏐ (an + bn) – (A + B)⏐ = ⏐(a n – A) + (bn – B)⏐ < ⏐an – A⏐ + ⏐b n – B⏐ (1)
By hypothesis, given /H9280 > 0 we can find N1 and N2 such that
1
1 for all 2
naA n N ε−< >  (2)
2
1 for all 2
nbB n N ε−< >  (3)
Then from Equations (1), (2), and (3),
11( ) ( ) for all 22
nnab A B n Nεε ε+− +< + = >
where N is chosen as the larger of N1 and N2. Thus, the required result follows.
2.10. Prove that a convergent sequence is bounded.
Given lim
n→∞
an = A , we must show that there exists a positive number P  such that ⏐ an⏐ < P  for all n .
Now
nn naa A A a A A=− + <− +


## Page 42

CHAPTER 2  Sequences 31
But by hypothesis we can find N such that ⏐an – A⏐ < /H9280 for all n > N, i.e.,
⏐an⏐ < /H9280 + ⏐A⏐  for all n > N
It follows that ⏐ an⏐ < P  for all n  if we choose P  as the largest one of the numbers a 1, a2, . . ., a N,
/H9280 + ⏐A⏐.
2.11. If lim
n→∞
bn = B /HS11005 0, prove there exists a number N such that ⏐bn⏐ > 1
2
⏐B⏐ for all n > N.
Since B = B – bn + bn, we have:
 ⏐ B⏐ < ⏐B – bn⏐ + ⏐b n⏐  (1)
Now we can choose N so that ⏐B – bn⏐ = ⏐b n – B⏐ < 1
2
⏐B⏐ for all n > N, since lim
n→∞
bn = B by hypoth-
esis.
Hence, from Equation (l), ⏐B⏐ < 1
2
⏐B⏐ + ⏐b n⏐ or ⏐b n⏐ > 1
2
⏐B⏐ for all n > N.
2.12. If lim
n→∞
an = A and lim
n→∞
bn = B, prove that lim
n→∞
anbn = AB.
Using Problem 2.10, we have
() ()nn n n n n n na bA B a bBB aA a bBB aA−= − + − < − + −
(nPb B<− + ( )1 nBa A+−
 (1)
But since lim
n→∞
an = A and lim
n→∞
bn = B, given any /H9280 > 0 we can find N1 and N2 such that
12 for all for all 22 (| | 1)
nnb B nN a A nNPB
εε−< > −< >+
Hence, from Equation (l), ⏐anbn – AB⏐ < 1
2
/H9280 + 1
2
/H9280 = /H9280 for all n > N, where N is the larger of N1 and N2.
Thus, the result is proved.
2.13. 11If lim and lim 0, prove (a) lim , ( ) lim . n
nnnn n n
nn
a AaA bB bbB bB→∞ →∞ →∞ →∞
== ≠ = =
(a) We must show that for any given /H9280 > 0, we can find N such that
11 for all
n
nn
Bb nNbB B b ε−−= < >  (1)
By hypothesis, given any /H9280 > 0, we can find N1, such that ⏐bn – B⏐< 1
2
B2 /H9280 for all n > N1.
Also, since lim
n→∞
bn = B /HS11005 0, we can find N 2 such that ⏐ bn⏐ > 1
2
⏐B⏐ for all n  > N 2 (see Problem
2.11).
Then if N is the larger of N1 and N2, we can write Equation (1) as
21
11 2 for all 1
2
n
nn
BbB nNbB B b BB
ε
ε−−= < = >
⋅
and the proof is complete.
(b) From (a) and Problem 2.12, we have
11 1lim lim lim lim b
n
nnnn n n
nn n
a Aaa Abb B B→∞ →∞ →∞ →∞
⎛⎞=⋅ = ⋅= ⋅ =⎜⎟
⎝⎠
This can also be proved directly (see Problem 2.41).


## Page 43

CHAPTER 2  Sequences32
2.14. Evaluate each of the following, using theorems on limits.
(a)
2
22
35 3 5 / 3 03lim lim 500 55 2 6 5 2/ 6/nn
nn n
nn nn→∞ →∞
−− + == = +++− + −
(b)
33 2 2
22 2
(2 ) 2 1 1 / 2 /lim lim lim1 1( 1 ) ( 1 )( 1 1 / ) ( 1 1 / )nn n
nn n n n n n n
n nn n n n→∞ →∞ →∞
⎧⎫ ⎧ ⎫ ⎧ ⎫++ + + +−= =⎨⎬ ⎨ ⎬ ⎨ ⎬+ ++ + + +⎩⎭ ⎩ ⎭ ⎩ ⎭
100 1(1 0) (1 0)
++== +⋅ +
(c) ( )lim 1
n
nn
→∞
+− ()
1 1lim 1 lim 0
11nn
nnnn
nn nn→∞ →∞
++=+ − = =
++ ++
(d)
2
2
34 3 4 /lim lim21 2/ 1/nn
nn n
n nn→∞ →∞
+= =− −
Since the limits of the numerator and the denominator are 3 and 0, respectively, the limit does not exist.
Since
2234 33
21 2 2
nn nn
nn
+ >=−
can be made larger than any positive number M by choosing n > N, we can
write, if desired,
234lim .21n
nn
n→∞
+ =∞−
(e)
44 4
23 2 3 / 2 1 6lim lim27 3 7 / 3 1 8nn
nn
nn→∞ →∞
⎛⎞ ⎛ ⎞−− ⎛⎞== =⎜⎟ ⎜ ⎟ ⎜⎟++ ⎝⎠⎝⎠ ⎝ ⎠
(f)
52 2 5
73 4 7
2 4 2/ 4/ 0lim lim 033 10 3 1/ 10 /nn
nn n n
nn n n→∞ →∞
−− == =+− + −
(g) 1 2 10 10 2 2lim lim (Compare with Problem 2.5.)353 1 0 5 1 0 3
nn
nnnn
−
−→∞ →∞
+⋅ +==+⋅ ⋅ +
Bounded monotonic sequences
2.15. Prove that the sequence with nth 27
32
n
nu n
−= +
 (a) is monotonic increasing, (b) is bounded above, (c) is
bounded below, (d) is bounded, (e) has a limit.
(a) {u n} is monotonic increasing if un+1 > un, n = 1, 2, 3, . . . Now
2( 1) 7 2 7 2 - 5 2 7if and only if 3( 1) 2 3 2 2 5 3 2
nn n n
nn n n
+− − −>>++ + + +
or (2n – 5) (3n + 2) >  (2n – 7) (3n + 5), 6n2 – 11n – 10 >  6n2 – 11n – 35, i.e., –10>  –35, which is true. Thus,
by reversal of steps in the inequalities, we see that {un} is monotonic increasing. Actually, since –10 > –35, the
sequence is strictly increasing.
(b) By writing some terms of the sequence, we may guess that an upper bound is 2 (for example). To prove
this we must show that un <  2. If (2n – 7)/(3n + 2) <  2, then 2n – 7 <  6n + 4 or –4n < 11, which is true.
Reversal of steps proves that 2 is an upper bound.
(c) Since this particular sequence is monotonic increasing, the first term –1 is a lower bound; i.e., u n >  –1,
n = 1, 2, 3, . . . Any number less than – 1 is also a lower bound.
(d) Since the sequence has an upper and a lower bound, it is bounded. Thus, for example, we can write
⏐un⏐ <  2 for all n.
(e) Since every bounded monotonic (increasing or decreasing) sequence has a limit, the given sequence has
a limit. In fact, 27 2 7 / 2lim lim .32 3 2 / 3nn
nn
nn→∞ →∞
−− ==++


## Page 44

CHAPTER 2  Sequences 33
2.16. A sequence {u n} is defined by the recursion formula un+1 3 nu , u1 = 1. (a) Prove that lim
n→∞
un exists. (b)
Find the limit in (a).
(a) The terms of the sequence are u 1 = 1, u2 = 13u = 31/2, u3 = 23u = 31/2+1/4, . . . .
The nth term is given by un = 31/2+1/4+… +1/2n–1, as can be proved by mathematical induction (Chapter 1).
Clearly, un+1 > un. Then the sequence is monotonic increasing.
By Problem 1.14, un <  31 = 3, i.e., u n is bounded above. Hence, u n is bounded (since a lower bound is
zero).
Thus, a limit exists, since the sequence is bounded and monotonic increasing.
(b) Let x = required limit. Since 1lim lim 3 , we have 3 and 3.nnnn
uu x x x+→∞ →∞
== = (The other possibility,
x = 0, is excluded, since un >  1.)
Another method:
1 (1 1 / 2 )1/2 1/4 1/2 1 1/2 1lim 3 lim 3 3 lim 3 3
nnn
nn n
− −++ + −
→∞ →∞ →∞
== = =LL
2.17. Verify the validity of the entries in the following table.
 BOUNDED MONOTONIC MONOTONIC LIMIT
SEQUENCE  INCREASING DECREASING EXISTS
2, 1.9, 1.8, 1.7, . . . , 2 – (n – 1)/10 . . .  No No Yes No
1, –1, 1, –1, . . . ,(–1)n–1, . . .  Yes No No No
1
2 , – 1
3 , 1
4 , – 1
5 , . . . , (–1)n–1/(n + 1), . . .  Yes No No Yes (0)
.6, .66, .666, . . . , 2
3  (1 – 1/10n), . . . Yes Yes No Yes ( 2
3 )
–1, +2, –3, +4, –5, . . . , (–1)n n, . . .  No No No No
2.18. Prove that the sequence with the nth term 1nu ⎛= +⎜⎝
1
n
n
⎞
⎟⎠
is monotonic, increasing, and bounded, and thus a
limit exists. The limit is denoted by the symbol e.
Note: 1lim 1 , where 2.71828
n
n
een→∞
⎛⎞+= ≅⎜⎟⎝⎠
 . . . was introduced in the eighteenth century by Leonhart
Euler as the base for a system of logarithms in order to simplify certain differentiation and integration formu-
las.
By the binomial theorem, if n is a positive integer (see Problem 1.95),
22(1 ) (1 ) (2 )(1 ) 1 2! 3!
n nn nn nxn x x x −− −+= + + + + . . . (1 ) ( 1 )
!
nnn n n xn
−− ++ L
Letting x = 1/n,
2
11 ( 1 ) 111 2!
n
n nnun nn n
−⎛⎞=+ = + + +⎜⎟⎝⎠
. . . (1 ) ( 1 ) 1
! n
nn n n
n n
−− ++ L
11 11 211 1 1 12! 3! nn n
⎛⎞ ⎛⎞ ⎛⎞=++ − + − −⎜⎟ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠ ⎝⎠
 + . . . 11 211!nn n
⎛⎞ ⎛⎞+− −⎜⎟ ⎜⎟
⎝⎠ ⎝⎠
. . . 11 n
n
−⎛⎞−⎜⎟
⎝⎠
Since each term beyond the first two terms in the last expression is an increasing function of n, it follows that
the sequence un is a monotonic increasing sequence.
. . .
. . .


## Page 45

CHAPTER 2  Sequences34
It is also clear that
1111 1 2!
n
n
⎛⎞+< + + +⎜⎟⎝⎠
1
3!+ + . . . 2
11 111!2 2n+< + + + + . . .
1
1 3
2n−+<
by Problem 1.14.
Thus, un is bounded and monotonic increasing, and so has a limit which we denote by e. The value of e =
2.71828 . . .
2.19. Prove that 1lim 1 ,
x
x
ex→∞
⎛⎞+=⎜⎟⎝⎠
 where x → /H11009 in any manner whatsoever (i.e., not necessarily along the
positive integers, as in Problem 2.18).
1
11 1If largest integer < , then < < 1 and 1 + < 1 1 +1
n xn
nx n x n nx n
+
⎛⎞ ⎛⎞ ⎛⎞=+ + < +⎜⎟ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠⎝⎠
. Since
1
11 1lim 1 lim 1 111 1
nn
nn
enn n
+
→∞ →∞
⎛⎞ ⎛⎞ ⎛⎞+= + + =⎜⎟ ⎜⎟ ⎜⎟++ +⎝⎠ ⎝⎠ ⎝⎠
 and
1
11 1lim 1 lim 1 1
nn
nn
enn n
+
→∞ →∞
⎛⎞ ⎛⎞ ⎛⎞+= + + =⎜⎟ ⎜⎟ ⎜⎟
⎝⎠ ⎝⎠ ⎝⎠
,
1it follows that lim 1 .
x
x
ex→∞
⎛⎞+=⎜⎟⎝⎠
Least upper bound, greatest lower bound, limit superior, limit inferior
2.20. Find the (a) l.u.b., (b) g.l.b., (c) lim sup ( lim ), and (d) lim inf (lim) for the sequence 2, –2, 1, –1, 1, –1, 1,
–1, . . . .
(a) l.u.b. = 2, since all terms are less than equal to 2, while at least one term (the 1st) is greater than 2 – /H9280 for
any /H9280 > 0.
(b) g.l.b. = –2, since all terms are greater than or equal to –2, while at least one term (the 2nd) is less than
–2 + /H9280 for any /H9280 > 0.
(c) lim sup or lim  = 1, since infinitely many terms of the sequence are greater than 1 – /H9280 for any /H9280 > 0
(namely, all 1’s in the sequence), while only a finite number of terms are greater than 1 + /H9280 for any /H9280 > 0
(namely, the 1st term).
(d) lim inf or lim = –1, since infinitely many terms of the sequence are less than –1 + /H9280 for any /H9280 > 0 (namely,
all –1’s in the sequence), while only a finite number of terms are less than –1 – /H9280 for any /H9280 > 0 (namely,
the 2nd term).
2.21. Find the (a) l.u.b., (b) g.l.b., (c) lim sup ( lim ), and (d) lim inf (lim) for the sequences in Problem 2.17.
The results are shown in the following table.
SEQUENCE l.u.b. g.l.b. lim sup or lim lim inf or lim
2, 1.9, 1.8, 1.7, . . ., 2 – (n – 1)/10 . . .  2 none –/H11009 –/H11009
1, –1, 1, –1, . . . , (–1)n–1, . . .  1 –1 1 –1
1
2 , – 1
3 , 1
4  – 1
5 , . . ., (–1)n–1/(n + 1), . . . 1
2 – 1
3 0 0
.6, .66, .666, . . ., 2
3  (1 – 1/10n), . . . 2
3 6 2
3
2
3
–1, + 2, –3, +4, –5, . . ., (–1)n n, . . .  none none +/H11009 –/H11009


## Page 46

CHAPTER 2  Sequences 35
Nested intervals
2.22. Prove that to every set of nested intervals [a n, bn], n = 1, 2, 3, . . . there corresponds one and only one real
number.
By definition of nested intervals, an+ 1 > an, bn+1, < bn n = 1, 2, 3, . . . and lim
n→∞
 (an – bn) = 0.
Then a1 < an < bn < b1, and the sequences {a n} and {bn} are bounded and, respectively, monotonic
increasing and decreasing sequences and so converge to a and b.
To show that a = b and thus prove the required result, we note that
 b  – a = (b – bn) + (bn – an) + (an – a) (1)
 ⏐ b – a⏐ < ⏐b – bn⏐ + ⏐b n – an⏐ + ⏐a n – a⏐ (2)
Now, given any /H9280 > 0, we can find N such that for all n > N
 ⏐ b – bn⏐ < /H9280/3,⏐bn – a⏐ < /H9280/3, (3)
so that from Equation (2), ⏐b – a⏐ < /H9280. Since /H9280 is any positive number, we must have b – a = 0 or a = b.
2.23. Prove the Bolzano-Weierstrass theorem (see Page 7).
Suppose the given bounded infinite set is contained in the finite interval [a, b]. Divide this interval into
two equal intervals. Then at least one of these, denoted by [a 1, b1], contains infinitely many points. Dividing
[a1, b1] into two equal intervals, we obtain another interval—say, [a 2, b2]—containing infinitely many points.
Continuing this process, we obtain a set of intervals [a n, bn], n = 1, 2, 3, . . ., each interval contained in the
preceding one and such that
b1 – a1 = (b – a)/2, b2 – a2 = (b1 – a1)/2 = (b – a)/22, . . ., bn – an = (b – a)/2n
from which we see that lim
n→∞
 (bn – an) = 0.
This set of nested intervals, by Problem 2.22, corresponds to a real number which represents a limit point
and so proves the theorem.
Cauchy’s convergence criterion
2.24. Prove Cauchy’s convergence criterion as stated on Page 27.
Necessity. Suppose the sequence {u n} converges to l. Then, given any /H9280 > 0, we can find N such that
⏐up – l⏐ < /H9280/2 for all p > N and ⏐uq – l⏐ < /H9280/2 for all q > N
Then, for both p > N and q > N, we have
⏐up – uq⏐ = ⏐ (u p – l) + (l – uq) ⏐ < ⏐ up – l⏐ + ⏐l – u q⏐ < /H9280/2 + /H9280/2 = /H9280
Sufficiency. Suppose ⏐up – uq ⏐ < /H9280 for all p, q > N and any /H9280 > 0. Then all the numbers uN, uN + 1, . . . lie in
a finite interval; i.e., the set is bounded and infinite. Hence, by the Bolzano-Weierstrass theorem there is at
least one limit point—say, a.
If a is the only limit point, we have the desired proof and lim
n→∞
u n = a.
Suppose there are two distinct limit points—say, a and b—and suppose b > a (see Figure 2.1). By defini-
tion of limit points, we have
 ⏐ up – a⏐ < (b – a)/3 for infinitely many values of p (1)
 ⏐ uq – b⏐ < (b – a)/3 for infinitely many values of q (2)
 Figure 2.1


## Page 47

CHAPTER 2  Sequences36
Then, since b – a = (b – uq) + (uq – up) + (up – a), we have
 ⏐ b – a⏐ = b – a < ⏐b – uq⏐ + ⏐u p – uq⏐ + ⏐u p – a⏐ (3)
Using Equations (1) and (2) in (3), we see that ⏐u p – uq⏐ > (b – a)/3 for infinitely many values of p and
q, thus contradicting the hypothesis that ⏐up – uq⏐ < /H9280 for p,q > N and any /H9280 > 0. Hence, there is only one limit
point and the theorem is proved.
Infinite series
2.25. Prove that the infinite series (sometimes called the geometric series)
2aa ra r++ +  . . . 1
1
n
n
ar
∞
−
=
= ∑
(a) converges to a/(1 – r) if ⏐r⏐ < 1, and (b) diverges if ⏐r⏐ >  1.
Let Sn = a + ar + ar2 + . . . + arn–1
Then rSn = ar + ar2 + . . . + arn–1 + arn
Subtract                     (1 – r)Sn = a                                – arn
or                                        (1 )
1
n
n
ars r
−= −
(a) (1 )If 1, lim lim 11
n
nnn
ar arS rr→∞ →∞
−<= = −−
by Problem 2.7.
(b)  If ⏐r⏐ > 1, lim
n→∞
Sn does not exist (see Problem 2.44).
2.26. Prove that if a series converges, its nth term must necessarily approach zero.
Since Sn = u1 + u2 + . . . + un and Sn–1 = u1 + u2 + . . . + un–1, we have un = Sn – Sn–1.
If the series converges to S, then
11lim lim ( ) lim lim 0nn n n nnn nn
uS S S S S S −−→∞ →∞ →∞ →∞
= − = − =−=
2.27. Prove that the series 111111−+−+−+ . . . 1
1
(1 ) n
n
∞
−
=
=−∑  diverges.
Method 1: lim
n→∞
 (–1)n /HS11005 0; in fact, it doesn’t exist. Then by Problem 2.26, the series cannot converge; i.e.,
it diverges.
Method 2: The sequence of partial sums is 1, 1 – 1, 1 – 1 + 1, 1 – 1 + 1 – 1, . . .; i.e., 1, 0, 1, 0, 1, 0,
1, . . . Since this sequence has no limit, the series diverges.
Miscellaneous problems
2.28. If lim
n→∞
un = l, prove that 12lim .n
n
uu u ln→∞
+++ =L
12
12 1 212
Let . We must show that lim 0 if lim 0. Nown
nn nnn
pp p nn
ul n
nn n
υυ υυυ
υυ υ υ υ υυυ υ
→∞ →∞
++
+++=+ = =
+++ + + ++++ =+
L
LLL
so that
12 1212 p PP nn
nn n
υυ υ υυ υυυ υ +++++ ++ ++++ <+
L LL  (1)
. . .
. . .
. . . . . . . . .
. . . . . . . . .


## Page 48

CHAPTER 2  Sequences 37
Since lim
n→∞
νn = 0, we can choose P so that ⏐νn⏐ < /H9280/2 for n > P. Then
12 /2 /2 /2 ( ) /2
2
PP n nP
nn n
υυ υ εε ε ε ε++ ++ + ++ + −<= <L L  (2)
After choosing P, we can choose N so that for n > N > P,
12
2
P
n
υυ υ ε+++ <L
 (3)
Then, using Equations (2) and (3), (1) becomes
12 for22
n nNn
υυ υ εε ε+++ <+= >L
thus proving the required result.
2.29. Prove that 21 /lim(1 ) 1. n
n
nn
→∞
++ =
Let (1 + n + n2)1/n = 1 + un, where un /H11084 0. Now, by the binomial theorem,
22 3(1 ) (1 ) (2 )1( 1 ) 1 2! 3!
n n
nn n n n
nn nn nnn u n u u u u−− −++ = + = + + + + +L
Then 23 (1 ) ( 2 )1 + 1 or 0 <3!
n
nn nnn u−−+> + 3
nu
26( ) .(1 ) (2 )
nn
nn n
+< −−
Hence, 3lim 0nn
u
→∞
=  and
lim 0.nn
u
→∞
= Thus, 21 /lim(1 ) lim(1 ) 1.n
nnn
nn u
→∞ →∞
++ = + =
2.30. Prove that lim 0 !
n
n
a
n→∞
= for all constants a.
The result follows if we can prove that lim 0 !
n
n
a
n→∞
=  (see Problem 2.38). We can assume a /HS11005 0.
1
Let . Then .!
n
n
n
n
aa uu nu n −
==  If n is large enough—say, n > 2⏐a⏐—and if we call N = [2⏐a⏐ + 1],
i.e., the greatest integer <  2⏐a⏐ + 1, then
12
1
11,,22
NN
NN
uu
uu
++
+
<< . . .
1
1, 2
n
n
u
u −
<
Multiplying these inequalities yields 11
22 or .n
nN
N
nN nNu uuu
−−⎛⎞ ⎛⎞⎜⎟ ⎜⎟⎝⎠ ⎝⎠<<  Since 1lim 02
nN
n
−
→∞
⎛⎞ =⎜⎟⎝⎠
(using
Problem 2.7), it follows that lim
n→∞
un = 0.
SUPPLEMENTARY PROBLEMS
Sequences
2.31. Write the first four terms of each of the following sequences:
(a)
1
n
n
⎧⎫⎪⎪⎨⎬ +⎪⎪⎩⎭
 (d)
21(1 )
135 ( 2 1 )
nnx
n
−⎧⎫ −
⎨⎬⋅⋅ −⎩⎭ L. . .
(b)
1(1 )
!
n
n
+⎧⎫−
⎨⎬
⎩⎭
 (e) 22
cos nx
xn
⎧⎫
⎨⎬ +⎩⎭
(c)
1
5
(2 )
(2 1)
nx
n
−⎧⎫
⎨⎬ −⎩⎭
. . . . . .
. . .
. . .
. . .


## Page 49

CHAPTER 2  Sequences38
Ans.  (a) 1234,,,2345
  (d)
35 7
,, ,11 3 1 3 5 1 3 5 7
xx x x−−
⋅⋅ ⋅⋅ ⋅ ⋅
(b)
11 11,, ,1! 2! 3! 4!−−   (e) 22 2 2 2 2 2 2
cos cos 2 cos 3 cos 4,,,1234
xx x x
xx xx++ ++
 (c)
23
55 5 5
12 4 8,, ,13 5 7
xx x
2.32. Find a possible nth term for the sequences whose first 5 terms are indicated, and find the 6th term:
,13 5 7 9 2 3 4( ) , , , , , ( ) 1 ,0 ,1 ,0 ,1 , ( ) ,0 , ,0 ,5 8 11 14 17 3 4 5
(1 ) ( 2 1 ) 1 (1 ) ( 3 )1 (1 ).( ) ( ) ( )(3 2) 2 ( 5) 2
nn n
ab c
nnAns a b cnn
−− −
−− − − + − − ⋅++
KK K
2.33. The Fibonacci sequence is the sequence {un} where un+2 = un+1 + un and un and u1 = 1, u2 = 1. (a) Find the
first 6 terms of the sequence. (b) Show that the nth term is given by un = (an – bn)/  5 , where a = 1
2
 (1 +
5 ) and b = 1
2
 (1 – 5 ).
Ans. (a) 1, 1, 2, 3, 5, 8
Limits of sequences
2.34. Using the definition of limit, prove that
(a) 42 2lim 323n
n
n→∞
−− =+
(b) 1/lim 2 n
n
−
→∞
= 1 (c)
4
2
1lim
n
n
n→∞
+ =∞ (d) sinlim 0
n
N
n→∞
=
2.35. Find the least positive integer N such that ⏐(3n + 2)/(n – 1) – 3⏐ < /H9280 for all n > N if (a) /H9280 = .01,
(b) /H9280 = .001 and (c) /H9280 = .0001.
Ans. (a) 502     (b) 5002     (c) 50,002
2.36. Using the definition of li mit, prove that lim
n→∞
(2n – 1)/(3n + 4) cannot be 1
2
.
2.37. Prove that lim
n→∞
 (–1)nn does not exist.
2.38. Prove that if lim
n→∞
⏐un⏐ = 0, then lim
n→∞
un = 0. Is the converse true?
2.39. If lim
n→∞
un = l, prove that (a) lim
n→∞
 = cun = cl where c is any constant, (b) lim
n→∞
u2
n = l2, (c) lim
n→∞
up
n = lp
where p is a positive integer, and (d) lim
n→∞ nu  = l , l >  0.
2.40. Give a direct proof that lim
n→∞
an/bn = A/B if lim
n→∞
an = A and lim
n→∞
bn = B /HS11005 0.
2.41. Prove that (a) 1/lim 3 1,n
n→∞
= (b)
1/2
3lim 1 ,
n
n
⎛⎞
⎜⎟⎝⎠→∞
= and (c) 3
4lim 0.
n
n
⎛⎞
⎜⎟⎝⎠→∞
=
2.42. If r > 1, prove that lim
n→∞
rn = /H11009, carefully explaining the significance of this statement.
2.43. If ⏐r⏐ > 1, prove that lim
n→∞
rn does not exist.
 . . .  . . .  . . .(a)
(a) (b)
(b)
(c)
(c)


## Page 50

CHAPTER 2  Sequences 39
2.44. Evaluate each of the following, using theorems on limits:
 (a)
2
2
42 3lim 2n
nn
nn→∞
−−
+
(d)
2
12 1
41 0 31 0lim 31 0 2 1 0
nn
nnn −−→∞
⋅− ⋅
⋅+ ⋅
(b) 3
(3 )( 2)lim 84n
nn
n→∞
−+
−
(e) 2lim( )
n
nn n
→∞
+−
(c)
235 4lim 27n
nn
n→∞
−+
−
(f)
1/lim(2 3 )nn n
n→∞
+
Ans. (a) –3/2     (b) –1/2     (c) 3 /2 (d) –15 (e) 1/2 (f) 3
Bounded monotonic sequences
2.45. Prove that the sequence with nth term u n = un= n /(n + 1). (a) is monotonic decreasing, (b) is bounded
below, (c) is bounded above, and (d) has a limit.
2.46. 11 1 1If , prove that lim  exists and lies between 0 and 1.12 3
n nn
uu nn n n n →∞
=+ ++ +++ + + L
2.47. 1
1If 1, 1, prove that lim (1 5). 2
nn n
uuu u
→∞
=+ = = +
2.48. If un+1 = 1
2
 (un + p/un) where p > 0 and u1 > 0, prove that lim
n→∞
un = p . Show how this can be used to
determine 2 .
2.49. If un is monotonic increasing (or monotonic decreasing), prove that Sn/n, where Sn = u1 + u2 + . . . + un is also
monotonic increasing (or monotonic decreasing).
Least upper bound, greatest lower bound, limit superior, limit inferior
2.50. Find the l.u.b., g.l.b., lim sup ( lim ), and lim inf (lim) for each sequence:
(a) –1, 1
3
, – 1
5
, 1
7
, . . . , (–1)n/(2n – 1), . . .   (c) 1, –3, 5, –7, . . . , (–1) n–1 (2n – 1), . . .
(b) 2
3
, – 3
4
, 4
5
, – 5
6
, . . . , (–1)n+ 1 (n + 1)/(n + 2), . . .  (d) 1, 4, 1, 16, 1, 36, . . ., n 1 +(–1)n, . . .
Ans. (a) 1
3
, –1, 0,0     (b) 1, –1, 1, –1     (c) none, none, +/H11009, – /H11009     (d) none, 1, +/H11009, 1
2.51. Prove that a bounded sequence {u n} is convergent if and only if lim un = limun.
Infinite series
2.52. Find the sum of the series 2
3
1
.
n
n
∞
⎛⎞
⎜⎟⎝⎠=
∑
Ans. 2
. . .


## Page 51

CHAPTER 2  Sequences40
2.53. Evaluate 1
1
(1 ) / 5 .nn
n
∞
−
=
−∑
Ans. 1
6
2.54. 1111Prove that 12 23 34 45+++ +⋅⋅⋅⋅
 . . .
1
1 1.(1 )n nn
∞
=
== +∑ (
11 1Hint: (1 ) 1nn n n =−++
.)
2.55. Prove that multiplication of each term of an infinite series by a constant (not zero) does not affect the
convergence or divergence.
2.56. 11Prove that the series 1 + 23++  . . . 1
n++  . . . diverges. (
11Hint: Let 1 23
nS =+ + +  . . . 1
n+ . Then
prove that ⏐S2n – Sn⏐ > 1
2
, giving a contradiction with Cauchy’s convergence criterion.)
Miscellaneous problems
2.57. If an < un < bn for all n > N, and lim
n→∞
an = lim
n→∞
bn = l, prove that lim
n→∞
un = l.
2.58. If lim
n→∞
an = lim
n→∞
bn = 0, and θ is independent of n, prove that lim
n→∞
 (an cos nθ) + bn sin nθ) = 0. Is the
result true when θ depends on n?
2.59. Let un = 1
2
 {1 + (–1)n}, n = 1,2,3, . . . If Sn = u1 + u2 + . . . + un , prove that lim
n→∞
Sn/n = 1
2
.
2.60. Prove that (a) 1/lim n
n
n
→∞
 and (b) /lim ( ) pn
n
an
→∞
+  = 1 where a and p are constants.
2.61. If lim
n→∞
⏐un + 1/un⏐ = ⏐a⏐< 1, prove that lim
n→∞
un = 0.
2.62. If ⏐a⏐ < 1, prove that lim 0 pn
n
na
→∞
=  where the constant p > 0.
2.63. Prove that lim 2! 0.
n
n
n
n
=
2.64. Prove that lim
n→∞
n sin 1/n = 1. (Hint: Let the central angel θ of a circle be measured in radians.)
Geometrically illustrate that sin θ≤θ≤  tan θ, 0 ≤θ≤π .
Let θ = 1/n. Observe that since n is restricted to positive integers, the angle is restricted to the first quad-
rant.
2.65. If {u n} is the Fibonacci sequence (Problem 2.33), prove that lim
n→∞
un+1/un = 1
2
 (1 + 5 ).
2.66. Prove that the sequence u n = (1 + 1/n)n+1, n = 1, 2, 3, . . . is a monotonic decreasing sequence whose limit is
e. (Hint: Show that un/un–1 <  1.)


## Page 52

CHAPTER 2  Sequences 41
2.67. If an > bn for all n > N and lim
n→∞
an = A, lim
n→∞
bn = B, prove that A > B.
2.68. If ⏐un⏐ < ⏐υ n and lim
n→∞
υn = 0, prove that lim
n→∞
un = 0.
2.69. 11 1Prove that lim 1 23n n→∞
⎛ +++⎜⎝
. . . 1 0.n
⎞+= ⎟⎠
2.70. Prove that [a n, bn], where an = (1 + 1/n)n and bn = (1 + 1/n)n+1 is a set of nested intervals defining the number e.
2.71. Prove that every bounded monotonic (increasing or decreasing) sequence has a limit.
2.72. Let {u n} be a sequence such that un+2 = aun+ 1 + bun where a and b are constants. This is called a second-
order difference equation for un. (a) Assuming a solution of the form un = rn where r is a constant, prove that
r must satisfy the equation r2 – ar – b = 0. (b) Use (a) to show that a solution of the difference equation
(called a general solution) is un = Arn
1 + Brn
2, where A and B are arbitrary constants and r1 and r2 are the two
solutions of r2 – ar – b = 0 assumed different. (c) In case r1 = r2 in (b), show that a (general) solution is un =
(A + Bn)rn
1.
2.73. Solve the following difference equations subject to the given conditions: (a) u n+ 2 = un+ 1 + un, u1 = 1, u2 = 1
(compare Problem 2.34); (b) un + 2 = 2 un+ 1 + 3un,u 2 = 5; (c) un+2 = 4un+1, 4un, u1= 2, u2 = 8.
Ans. (a) Same as in Problem 2.34,     (b) un = 2(3)n–1 + (–1)n–1     (c) un = n · 2n


## Page 53

This page intentionally left blank


## Page 54

43
Functions, Limits,
and Continuity
The notions described in this chapter historically followed the introduction of differentiation and integration.
These concepts were established, developed, and applied in the 1700s on a strong mechanical basis but a
weak theoretical foundation. In the 1800s, the theoretical inadequacies were resolved with the mathematical
invention of limits. Precise definitions of derivatives and integrals were formulated. Many mathematicians,
including Bolzano, introduced rigorous proofs free of geometry. Elegant notation, such as the ε – δ form of
Weierstrass, became available. As a bonus, clear definitions of irrational numbers were made. Also, unex-
pected properties of infinite sets of real numbers were found by Cantor and other mathematicians.
This chapter sets forth the notion of the limit of a function, concepts that followed, and how these ideas
made possible the rigorization of analysis.
Functions
A function is composed of a domain set, a range set, and a rule of correspondence that assigns exactly one
element of the range to each element of the domain.
This definition of a function places no restrictions on the nature of the elements of the two sets. However,
in our early exploration of the calculus, these elements are real numbers. The rule of correspondence can take
various forms, but in advanced calculus it most often is an equation or a set of equations.
If the elements of the domain and range are represented by x and y, respectively, and f symbolizes the
function, then the rule of correspondence takes the form y = f(x).
The distinction between f and f (x) should be kept in mind. f denotes the function as defined in the first
paragraph. y and f(x) are different symbols for the range (or image) values corresponding to domain values
x. However, a common practice that provides an expediency in presentation is to read f(x) as “the image of
x with respect to the function f ” and then use it when referring to the function. (For example, it is simpler to
write sin x than “the sine function, the image value of which is sin x.”) This deviation from precise notation
appears in the text because of its value in exhibiting the ideas.
The domain variable x is called the independent variable. The variable y representing the corresponding
set of values in the range, is the dependent variable.
Note: There is nothing exclusive about the use of x , y, and f  to represent domain, range, and function.
Many other letters are employed.
There are many ways to relate the elements of two sets. (Not all of them correspond a unique range value
to a given domain value.) For example, given the equation y
2 = x, there are two choices of y for each positive
value of x. As another example, the pairs (a, b), (a, c), (a, d), and (a, e) can be formed, and again the corre-
spondence to a domain value is not unique. Because of such possibilities, some texts, especially older ones,
distinguish between multiple-valued and single-valued functions. This viewpoint is not consistent with our
definition or modern presentations. In order that there be no ambiquity, the calculus and its applications re-
quire a single image associated with each domain value. A multiple-valued rule of correspondence gives rise
to a collection of functions (i.e., single-valued). Thus, the rule y
2 = x is replaced by the pair of rules y = –x1/2
CHAPTER 3


## Page 55

CHAPTER 3  Functions, Limits, and Continuity44
and the functions they generate through the establishment of domains. (See the following section on graphs
for pictorial illustrations.)
EXAMPLES. 1.  If to each number in –1 < x <  1 we associate a number y given by x2, then the interval –1
< x <  1 is the domain. The rule y = x2 generates the range –1 < y <  1. The totality is a
function f.
   The functional image of x  is given by y = f(x) = x2. For example, f 1
3
⎛⎞−⎜⎟⎝⎠
 =
21
3
⎛⎞−⎜⎟⎝⎠
 = 1
9
is the image of – 1
3
 with respect to the function f.
 2.  The sequences of Chapter 2 may be interpreted as functions. For infinite sequences, con-
sider the domain as the set of positive integers. The rule is the definition of un, and the
range is generated by this rule. To illustrate, let un = 1
n
 with n = 1, 2, . . . . Then the range
contains the elements 1, 1
2
, 1
3
, 1
4
, . . . . If the function is denoted by f, then we may write
f(n) = 1
n
.
   As you read this chapter, reviewing Chapter 2 will be very useful.
 3.  With each time t after the year 1800 we can associate a value P for the population of the
United States. The correspondence between P and t defines a function—say, F—and we
can write P = F(t).
 4.  For the present, both the domain and the range of a function have been restricted to sets of
real numbers. Eventually this limitation will be removed. To get the flavor for greater gen-
erality, think of a map of the world on a globe with circles of latitude and longitude as co-
ordinate curves. Assume there is a rule that corresponds this domain to a range that is a
region of a plane endowed with a rectangular Cartesian coordinate system. (Thus, a flat
map usable for navigation and other purposes is created.) The points of the domain are ex-
pressed as pairs of numbers (θ, φ), and those of the range by pairs (x, y). These sets and a
rule of correspondence constitute a function whose independent and dependent variables
are not single real numbers; rather, they are pairs of real numbers.
Graph of a Function
A function f establishes a set of ordered pairs (x, y) of real numbers. The plot of these pairs [x, f(x)] in a co-
ordinate system is the graph of f. The result can be thought of as a pictorial representation of the function.
For example, the graphs of the functions described by y = x 2, –1 < x <  1, and y2 = x, 0 < x <  1, y >  0
appear in Figure 3.1.
Figure 3.1


## Page 56

CHAPTER 3  Functions, Limits, and Continuity 45
Bounded Functions
If there is a constant M such that f (x) < M for all x in an interval (or other set of numbers), we say that f is
bounded above in the interval (or the set) and call M an upper bound of the function.
If a constant m exists such that f(x) > m for all x in an interval, we say that f (x) is bounded below in the
interval and call m a lower bound.
If m < f(x) < M in an interval, we call f(x) bounded. Frequently, when we wish to indicate that a function
is bounded, we write ⏐f (x)⏐ < P.
EXAMPLES. 1. f(x) = 3 + x is bounded in – 1 < x <  1. An upper bound is 4 (or any number greater than
4). A lower bound is 2 (or any number less than 2).
 2.  f(x) = 1/x is not bounded in 0 < x < 4, since, by choosing x sufficiently close to zero, f(x)
can be made as large as we wish, so that there is no upper bound. However, a lower bound
is given by 1
4
 (or any number less than 1
4
).
If f(x) has an upper bound, it has a least upper bound (l.u.b.); if it has a lower bound, it has a greatest
lower bound (g.l.b.). (See Chapter 1 for these definitions.)
Monotonic Functions
A function is called monotonic increasing in an interval if for any two points x1 and x2 in the interval x1 < x2,
f(x1) < f(x2). If ( f(x1) < f(x2), the function is called strictly increasing.
Similarly, if f(x1) > f(x2) whenever x1 < x2, then f(x) is monotonic decreasing, while if f (x1) > f(x2), it is
strictly decreasing.
Inverse Functions, Principal Values
  Suppose y is the range variable of a function f with domain variable x. Furthermore,   let the correspondence be-
tween the domain and range values be one-to-one. Then a new function f–1,   called the inverse function of f,   can
be created by interchanging the domain and range of f. This information is contained in the form x = f –1(y).
As you work with the inverse function, it often is convenient to rename the domain variable as x and use
y to symbolize the images; then the notation is y = f –1(x). In particular, this allows graphical expression of
the inverse function with its domain on the horizontal axis.
Note: f –1 does not mean f to the negative one power. When used with functions, the notation f –1 always
designates the inverse function to f.
If the domain and range elements of f are not in one-to-one correspondence (this would mean that distinct
domain elements have the same image), then a collection of one-to-one functions may be created. Each of
them is called a branch. It is often convenient to choose one of these branches, called the principal branch,
and denote it as the inverse function f
–1. The range values of f that compose the principal branch, and hence
the domain of f –1, are called the principal values. (As will be seen in the section on elementary functions, it
is common practice to specify these principal values for that class of functions.)
EXAMPLE. Suppose f is generated by y = sin x and the domain is –/H11009< x < /H11009. Then there are an infinite
number of domain values that have the same image. (A finite portion of the graph is illustrated in Figure 3.2(a).
In Figure 3.2(b) the graph is rotated about a line at 45º so that the x axis rotates into the y axis. Then the vari-
ables are interchanged so that the x axis is once again the horizontal one. We see that the image of an x value is
not unique. Therefore, a set of principal values must be chosen to establish an inverse function. A choice of a
branch is accomplished by restricting the domain of the starting function, sin x. For example, choose –
2
π <
x < 2
π . Then there is a one-to-one correspondence between the elements of this domain and the images in


## Page 57

CHAPTER 3  Functions, Limits, and Continuity46
–1 < x <  1. Thus, f –1 may be defined with this interval as its domain. This idea is illustrated in Figure 3.2(c)
and (d). With the domain of f –1 represented on the horizontal axis and by the variable x, we write y = sin–1 x,
–1 < x <  1.
If x = – 1
2 , then the corresponding range value is y = – 6
π .
Note: In algebra, b–1 means 1
b  and the fact that bb –1 produces the identity element 1 is simply a rule of
algebra generalized from arithmetic. Use of a similar exponential notation for inverse functions is justified
in that corresponding algebraic characteristics are displayed by f –1 [f(x)] = x and f [f –1(x)] = x.
Figure 3.2
Maxima and Minima
The seventeenth-century development of the calculus was strongly motivated by questions concerning ex-
treme values of functions. Of most importance to the calculus and its applications were the notions of local
extrema, called the relative maximum and relative minimum.
If the graph of a function were compared to a path over hills and through valleys, the local extrema would
be the high and low points along the way. This intuitive view is given mathematical precision by the follow-
ing definition.


## Page 58

CHAPTER 3  Functions, Limits, and Continuity 47
Definition If there exists an open interval (a, b) containing c such that f (x) < f (c) for all x other than c in
the interval, then f (c) is a relative maximum of f. If f (x) > f (c) for all x in (a, b) other than c, then f (c) is a
relative minimum of f. (See Figure 3.3.)
Functions may have any number of relative extrema. On the other hand, they may have none, as in the
case of the strictly increasing and decreasing functions previously defined.
Definition If c is in the domain of f and for all x in the domain of the function f (x) < f(c); then f(c) is an
absolute maximum of the function f. If for all x in the domain f(x) > f(c), then f(c) is an absolute minimum
of f. (See Figure 3.3.)
Note: If defined on closed intervals, the strictly increasing and decreasing functions possess absolute
extrema.
Absolute extrema are not necessarily unique. For example, if the graph of a function is a horizontal line,
then every point is an absolute maximum and an absolute minimum.
Note: A point of inflection is also represented in Figure 3.3. There is an overlap with relative extrema in
representation of such points through derivatives that will be addressed in the problem set of Chapter 4.
Figure 3.3
Types of Functions
It is worth realizing that there is a fundamental pool of functions at the foundation of calculus and advanced
calculus. These are called elementary functions. Either they are generated from a real variable x by the fun-
damental operations of algebra, including powers and roots, or they have relatively simple geometric inter-
pretations. As the title “elementary functions” suggests, there is a more general category of functions (which,
in fact, are dependent on the elementary ones). Some of these will be explored later in this book. The elemen-
tary functions are described as follows.
1. Polynomial functions have the form
 f (x) = a0xn + a1xn–1 + . . . + an–1x + an (1)
where a0, . . ., an are constants and n is a positive integer called the degree of the polynomial if a0 /HS11005 0.
The fundamental theorem of algebra states that in the field of complex numbers every polynomial
equation has at least one root. As a consequence of this theorem, it can be proved that every nth-degree
polynomial has n  roots in the complex field. When complex numbers are admitted, the polynomial
theoretically may be expressed as the product of n linear factors; with our restriction to real numbers,
it is possible that 2k of the roots may be complex. In this case, the k factors generating them will be
quadratic. (The corresponding roots are in complex conjugate pairs.) The polynomial x
3 – 5x2 + 11x
– 15 = (x – 3) (x2 – 2x + 5) illustrates this thought.


## Page 59

CHAPTER 3  Functions, Limits, and Continuity48
2. Algebraic functions are functions y = f(x) satisfying an equation of the form
 p 0(x) yn + p1(x) yn–1 + . . . + pn–1(x) y + pn(x) = 0 (2)
where p0(x) , . . . , pn(x) are polynomials in x.
If the function can be expressed as the quotient of two polynomials, i.e., P(x)/Q(x) where P(x) and
Q(x) are polynomials, it is called a rational algebraic function; otherwise, it is an irrational algebraic
function.
3. Transcendental functions are functions which are not algebraic; i.e., they do not satisfy equations of
the form of Equation (2).
Note the analogy with real numbers, polynomials corresponding to integers, rational functions to
rational numbers, and so on.
Transcendental Functions
The following are sometimes called elementary transcendental functions.
1. Exponential function: f(x) = ax, a /HS11005 0, 1. For properties, see Page 4.
2. Logarithmic function: f(x) = loga x, a /HS11005 0, 1. This and the exponential function are inverse functions.
If a = e = 2.71828 . . . , called the natural base of logarithms, we write f (x) = loge x = In x, called the
natural logarithm of x. For properties, see Page 4.
3. Trigonometric functions (also called circular functions because of their geometric interpretation with
respect to the unit circle):
sin 1 1 1 cossin , cos , tan , csc ,sec ,cotcos sin cos tan sin
xxxx x x x x xxxx x== = = =
The variable x is generally expressed in radians (π radians = 180º). For real values of x, sin x and
cos x lie between –1 and 1 inclusive.
The following are some properties of these functions:
22 2 2sin cos 1 1 tan sce
sin( ) sin cos cos sin
cos( ) cos cos sin sin
tan tantan( ) 1t a nt a n
xx xx
xy x y x y
xy x y x y
xyxy xy
+= +=
±= ±
±= +
±±= +
221 cot csc
sin(– ) – sin
cos(– ) cos
tan(– ) – tan
xx
xx
xx
xx
+=
=
=
=
4. Inverse trigonometric functions. The following is a list of the inverse trigonometric functions and
their principal values:
 ( a) y = sin–1 x, (–π/2 < y < π/2) (d) y = csc–1 x = sin–1 1/x, (–π/2 < y < π/2)
 ( b) y = cos–1 x, (0 < y < π) (e) y = sec–1 x = cos–1 1/x, (0 < y < π)
 ( c) y = tan–1 x, (–π/2 < y < π/2) (f) y = cot–1 x = π/2 – tan–1 x, (0 < y < π)
5. Hyperbolic functions are defined in terms of exponential functions as follows. These functions may be
interpreted geometrically, much as the trigonometric functions but with respect to the unit hyperbola.
 ( a)
–
sinh 2
xxeex −=  ( d) –
12csch sinh –xxx x ee==
 ( b)
–
cosh 2
xxeex +=  ( e) –
12sec h cosh xxx x ee== +
 ( c)
–
–
sinhtanh cosh
xx
xx
xeex x ee
−== +  ( f)
–
–
coshcoth sinh –
xx
xx
xe ex x ee
+==


## Page 60

CHAPTER 3  Functions, Limits, and Continuity 49
The following are some properties of these functions:
cosh2 x – sinh2 x = 1  1 – tanh 2 x = sech2 x coth 2 x – 1 = csch2 x
sinh (x ± y) = sinh x cosh y ± cosh x sinh y sinh (–x) = –sinh x
cosh (x ± y) = cosh x cosh y ± sinh x sinh y cosh (–x) = cosh x
tanh tanhtanh( ) 1 tanh tanh
xyxy xy
±±= ±  tanh (–x) = –tanh x
6. Inverse hyperbolic functions. If x = sinh y, then y = sinh–1 x is the inverse hyperbolic sine of x. The
following list gives the principal values of the inverse hyperbolic functions in terms of natural loga-
rithms and the domains for which they are real.
 ( a) –1 2sinh 1n(x 1),  all xx x=+ +  ( d)
2
–1 11csch 1n , 0x| |
xxx x
⎛⎞ +⎜⎟=+ ≠⎜⎟⎝⎠
 ( b) –1 2cosh 1n(x+ 1), 1xx x=− >  ( e)
2
1 11sech ln ,0 1xxx x
−
⎛⎞ +−⎜⎟=< <⎜⎟⎝⎠
 ( c) –1 11tanh 1n , 21
xx x
+⎛⎞= ⎜⎟ −⎝⎠
⏐x⏐ < 1 ( f) –1 11coth 1n , 2– 1
xx x
+⎛⎞= ⎜⎟⎝⎠
⏐x⏐ > 1
Limits of Functions
Let f(x) be defined and single-valued for all values of x near x = x0 with the possible exception of x = x0 itself
(i.e., in a deleted δ neighborhood of x0). We say that the number l is the limit of f(x) as x approaches x0 and
write
0
lim
xx→
f(x) = l if for any positive number /H9280 (however small) we can find some positive number δ (usually
depending on /H9280) such that ⏐f(x) – l⏐ < /H9280 whenever 0 < ⏐x – x0⏐ < δ. In such a case we also say that f(x) ap-
proaches l as x approaches x0 and write f(x) → l as x → x0.
In words, this means that we can make f(x) arbitrarily close to l by choosing x sufficiently close to x0.
EXAMPLE. Let f(x)
2 if 2 .
0i f 2
xx
x
≠=
=
 Then as x gets closer to 2 (i.e., x approaches 2), f(x) gets closer to 4. We
thus suspect that
2
lim
x→
f(x) = 4. To prove this we must see whether the preceding definition of limit (with l = 4)
is satisfied. For this proof, see Problem 3.10.
Note that
2
lim
x→
f(x) = f(2); i.e., the limit of f(x) as x → 2 is not the same as the value of f (x) at x = 2, since
f(2) = 0 by definition. The limit would, in fact, be 4 even if f(x) were not defined at x = 2.
When the limit of a function exists, it is unique; i.e., it is the only one (see Problem 3.17).
Right- and Left-Hand Limits
In the definition of limit, no restriction was made as to how x should approach x0. It is sometimes found
convenient to restrict this approach. Considering x and x0 as points on the real axis where x0 is fixed and x is
moving, then x can approach x0 from the right or from the left. We indicate these respective approaches by
writing x → x0 + and x → x0–.
If
0
lim
xx→
 + f(x) = l1 and
0
lim
xx −→
f(x) = l2, we call l1 and l l2, respectively, the right- and left-hand limits of f
at x0 and denote them by f (x0 +) or f (x0 + 0) and f (x0 –) or f (x0 – 0). The /H9280,δ definitions of limit of f (x) as


## Page 61

CHAPTER 3  Functions, Limits, and Continuity50
x → x0 + or x → x0– are the same as those for x → x0 except for the fact that values of x are restricted to x >
x0 or x < x0, respectively.
We have
0
lim
xx→
f(x) = l if and only if
0
lim
xx→+
f(x) =
0
lim
xx −→
fs(x) = l.
Theorems on Limits
If
0
lim
xx→
f(x) = A and
0
lim
xx→
g(x) = B, then
1.
0
lim
xx→
 (f(x) + g(x)) =
0
lim
xx→
f(x) +
0
lim
xx→
g(x) = A + B
2.
0
lim
xx→
 (f(x) – g(x)) =
0
lim
xx→
f(x) –
0
lim
xx→
g(x) = A – B
3.
00 0
l i m (()() ) l i m () l i m ()
xx xx xx
fx g x fx g x A B
→→ →
⎛⎞ ⎛ ⎞==⎜⎟ ⎜ ⎟⎝⎠ ⎝ ⎠
4.
0
0
0
lim ( )()lim if 0() l i m ()
xx
xx
xx
fxfx A Bgx gx B
→
→
→
==≠
Similar results hold for right- and left-hand limits.
Infinity
It sometimes happens that as x → x0, f(x) increases or decreases without bound. In such case it is customary
to write
0
lim
xx→
f(x) = +/H11009 or
0
lim
xx→
f(x) = –/H11009, respectively. The symbols +/H11009 (also written /H11009) and –/H11009 are read
“plus infinity” (or “infinity”) and “minus infinity,” respectively, but it must be emphasized that they are not
numbers.
In precise language, we say that
0
lim
xx→
f(x) = /H11009 if for each positive number M  we can find a positive
number δ (depending on M in general) such that f(x) > M whenever 0 < ⏐x – x0⏐ < δ. Similarly, we say that
0
lim
xx→
f(x) = –/H11009 if for each positive number M we can find a positive number δ such that f(x) < – M whenever
0 < ⏐x – x0⏐ < δ. Analogous remarks apply in case x → x0 + or x → x0 –.
Frequently we wish to examine the behavior of a function as x increases or decreases without bound. In
such cases it is customary to write x → + /H11009 (or /H11009) or x→ –/H11009, respectively.
We say that lim
x→+∞
f(x) = l, or f (x) → l as x → + /H11009, if for any positive number /H9280 we can find a positive
number N (depending on /H9280 in general) such that ⏐f(x) – l⏐ < /H9280 whenever x > N. A similar definition can be for-
mulated for lim
x→−∞
f(x).
Special Limits
1.
0
sinlim 1
x
x
x→
=
0
1c o slim 0
x
x
x→
− =
2. 1lim 1
x
x
ex→∞
⎛⎞+=⎜⎟⎝⎠
1/
0
lim (1 ) x
x
xe
→+
+=


## Page 62

CHAPTER 3  Functions, Limits, and Continuity 51
3.
0
1lim 1
x
x
e
x→
− =
1
1lim 11nx
x
x→
− =
Continuity
Let f be defined for all values of x near x = x0 as well as at x = x0 (i.e., in a δ neighborhood of x0). The func-
tion f is called continuous at x = x0 if
0
lim
xx→
f(x) = f (x0). Note that this implies three conditions which must
be met in order that f(x) be continuous at x = x0:
1.
0
lim
xx→
f(x) = l must exist.
2. f(x0) must exist; i.e., f(x) is defined at x0.
3. l = f(x0).
In summary,
0
lim
xx→
f(x) is the value suggested for f at x = x0 by the behavior of f in arbitrarily small neigh-
borhoods of x 0. If, in fact, this limit is the actual value, f (x0), of the function at x 0, then f  is continuous
there.
Equivalently, if f is continuous at x0, we can write this in the suggestive form
0
lim
xx→
f(x) = f(
0
lim
xx→
x).
EXAMPLES. 1.  If
2 ,2()
0, 2
xxfx
x
⎧ ≠= ⎨ =⎩
 then from the example on Page 45
2
lim
x→
f(x) = 4. But f(2) = 0.
Hence,
2
lim
x→
f(x) /HS11005f(2) and the function is not continuous at x = 2.
 2. If f(x) = x2 for all x, then
2
lim
x→
f(x) = f(2) = 4 and f(x) is continuous at x = 2.
Points where f fails to be continuous are called discontinuities of f and f is said to be discontinuous at these
points.
In constructing a graph of a continuous function, the pencil need never leave the paper, while for a dis-
continuous function this is not true, since there is generally a jump taking place. This is, of course, merely a
characteristic property and not a definition of continuity or discontinuity.
Alternative to the preceding definition of continuity, we can define f as continuous at x  = x 0 if for any
/H9280 > 0 we can find δ > 0 such that ⏐f(x0) – f (x0)⏐ < /H9280 whenever ⏐x – x0⏐ < δ. Note that this is simply the
definition of limit with l = f(x0) and removal of the restriction that x /HS11005x0.
Right- and Left-Hand Continuity
If f is defined only for x > x0, the preceding definition does not apply. In such case we call f continuous (on
the right) at x = x0 if
0
lim
xx +→
f(x) = f(x0), i.e., if f(x0 +) = f(x0). Similarly, f is continuous (on the left) at x = x0
if
0
lim
xx −→
f(x) = f(x)0, i.e., f(x0 –) = f(x0). Definitions in terms of /H9280 and δ can be given.
Continuity in an Interval
A function f is said to be continuous in an interval if it is continuous at all points of the interval. In particular,
if f is defined in the closed interval a < x < b or [a, b], then f is continuous in the interval if and only if
0
lim
xx→
f(x) = f(x0) for a < x0 < b, lim
axx +→
f(x) = f(a), and lim
xb→−
f(x) = f(b).


## Page 63

CHAPTER 3  Functions, Limits, and Continuity52
Theorems on Continuity
Theorem 1 If f and g are continuous at x = x 0, so also are the functions whose image values satisfy the
relations () () , () – () , ()()fx g x fx g x fx g x+ , and ()
()
fx
gx , the last only if g(x0) /HS11005 0. Similar results hold for
continuity in an interval.
Theorem 2 Functions described as follows are continuous in every finite interval: (a) all polynomials; (b)
sin x and cos x; and (c) ax, a > 0.
Theorem 3 Let the function f be continuous at the domain value x = x 0. Also suppose that a function g,
represented by z = g(y), is continuous at y0, where y = f (x) (i.e., the range value of f corresponding to x0 is a
domain value of g). Then a new function, called a composite function, f(g), represented by z = g[f (x)], may
be created which is continuous at its domain point x = x0. (One says that a continuous function of a continu-
ous function is continuous.)
Theorem 4 If f(x) is continuous in a closed interval, it is bounded in the interval.
Theorem 5 If f(x) is continuous at x = x0 and f (x0) > 0 [or f (x0) < 0], there exists an interval about x = x 0
in which f(x) > 0 [or f(x) < 0].
Theorem 6 If a function f (x) is continuous in an interval and either strictly increasing or strictly decreasing,
the inverse function f–1(x) is single-valued, continuous, and either strictly increasing or strictly decreasing.
Theorem 7 If f(x) is continuous in [a, b] and if f (a) = A and f (b) = B, then corresponding to any number
C between A and B there exists at least one number c in [a, b] such that f (c) = C. This is sometimes called
the intermediate value theorem.
Theorem 8 If f(x) is continuous in [ a, b] and if f (a) and f (b) have opposite signs, there is at least one
number c for which f(c) = 0 where a < c < b. This is related to Theorem 7.
Theorem 9 If f(x) is continuous in a closed interval, then f (x) has a maximum value M for at least one
value of x in the interval and a minimum value m for at least one value of x in the interval. Furthermore, f(x)
assumes all values between m and M for one or more values of x in the interval.
Theorem 10 If f(x) is continuous in a closed interval and if M  and m  are, respectively, the least upper
bound (l.u.b.) and greatest lower bound (g.l.b.) of f(x), there exists at least one value of x in the interval for
which f(x) = M or f(x) = m. This is related to Theorem 9.
Piecewise Continuity
A function is called piecewise continuous in an interval a< x < b if the interval can be subdivided into a finite
number of intervals in each of which the function is continuous and has finite right- and left-hand limits. Such
a function has only a finite number of discontinuities. An example of a function which is piecewise continuous
in a
< x < b is shown graphically in Figure 3.4. This function has discontinuities at x1, x2, x3, and x4.
Figure 3.4


## Page 64

CHAPTER 3  Functions, Limits, and Continuity 53
Uniform Continuity
Let f be continuous in an interval. Then, by definition, at each point x0 of the interval and for any /H9280 > 0, we
can find δ > 0 (which will in general depend on both /H9280 and the particular point x0) such that ⏐f(x) – f(x0)⏐ <
/H9280 whenever ⏐x – x0⏐ < δ. If we can find δ for each /H9280 which holds for all points of the interval (i.e., if δ depends
only on /H9280 and not on x0), we say that f is uniformly continuous in the interval.
Alternatively, f is uniformly continuous in an interval if for any /H9280 > 0 we can find δ > 0 such that ⏐f(x1)
– f(x2)⏐ < /H9280 whenever ⏐x1 – x2⏐ < δ where x1 and x2 are any two points in the interval.
Theorem If f is continuous in a closed interval, it is uniformly continuous in the interval.
SOLVED PROBLEMS
Functions
3.1. Let f(x) = (x – 2) (8 – x) for 2 < x <  8. (a) Find f(6) and f(– 1). (b) What is the domain of definition of
f(x)? (c) Find f(1 – 2t) and give the domain of definition. (d) Find f[ f(3)], f[ f(5)]. (e) Graph f(x).
(a) f(6) = (6 – 2) (8 – 6) = 4 · 2 = 8
f(– 1) is not defined since f(x) is defined only for 2 < x <  8.
(b) The set of all x such that 2 < x <  8.
(c) f(1 – 2t) = {(1 – 2t) – 2} {8 – (1 – 2t)} = – (1 + 2t) (7 + 2t) where t is such that 2 <  1 – 2t <  8; i.e.,
– 7/2 < t <  – 1/2.
(d) f(3) = (3 – 2) (8 – 3) = 5, f [ f(3)] = f (5) = (5 – 2)(8 – 5) = 9.
f(5) = 9 so that f [ f(5)] = f(9) is not defined.
(e) The following table shows f(x) for various values of x.
 x 2 3 4 5 6 7 8 2.5 7.5
 f (x) 0 5 8 9 8 5 0 2.75 2.75
Plot points (2, 0), (3, 5), (4, 8), (5, 9), (6, 8), (7, 5), (8, 0),
(2.5, 2.75), (7.5, 2.75). These points are only a few of the infi-
nitely many points on the required graph shown in the adjoining
Figure 3.5. This set of points defines a curve which is part of a
parabola.
3.2. Let g(x) = (x – 2) (8 – x) for 2 < x < 8. (a) Discuss the difference between the graph of g(x) and that of f(x) in
Problem 3.1. (b) What are the l.u.b. and g.l.b. of g(x)? (c) Does g(x) attain its l.u.b. and g.l.b. for any value of
x in the domain of definition? (d) Answer parts (b) and (c) for the function f(x) of Problem 3.1.
(a) The graph of g(x) is the same as that in Problem 3.1 except that the two points (2, 0) and 8, 0) are missing,
since g(x) is not defined at x = 2 and x = 8.
(b) The l.u.b. of g(x) is 9. The g.l.b. of g(x) is 0.
(c) The l.u.b. of g(x) is attained for the value of x = 5. The g.l.b. of g(x) is not attained, since there is no value
of x in the domain of definition such that g(x) = 0.
(d) As in (b), the l.u.b. of f (x) is 9 and the g.l.b. of f (x) is 0. The l.u.b. of f (x) is attained for the value x = 5
and the g.l.b. of f(x) is attained at x = 2 and x = 8.
Note that a function, such as f (x), which is continuous in a closed interv al attains its l.u.b
. and g.l.b. at
some point of the interval. However, a function, such as g(x), which is not continuous in a closed interval need
not attain its l.u.b. and g.l.b. See Problem 3.34.
Figure 3.5


## Page 65

CHAPTER 3  Functions, Limits, and Continuity54
3.3. Let
1, if is a rational number    () 0, if is an irrational number
xfx x
⎧= ⎨
⎩
(a) Find f 2
3
⎛⎞
⎜⎟⎝⎠
, f(– 5), f (1.41423), f( 2 ). (b) Construct a graph of f (x) and explain why it is misleading by
itself.
(a) f 2
3
⎛⎞
⎜⎟⎝⎠
 = 1 since 2
3
 is a rational number
f(–5) = 1 since –5 is a rational number
f(1.41423) = 1 since 1.41423 is a rational number
f( 2 ) = 0 since 2  is an irrational number
(b) The graph is shown in Figure 3.6. Because the sets of both rational
numbers and irrational numbers are dense, the visual impression is
that there are two images corresponding to each domain value. In ac-
tuality, each domain value has only one corresponding range value.
3.4. Referring to Problem 3.1: (a) Draw the graph with axes interchanged,
thus illustrating the two possible choices available for definition of f
–1. (b) Solve for x in terms of y to
determine the equations describing the two branches, and then interchange the variables.
(a) The graph of y = f (x) is shown in Figure 3.5 of Problem 3.1(a). By interchanging the axes (and the vari-
ables), we obtain the graphical form of Figure 3.7. This figure illustrates that there are two values of y
corresponding to each value of x, and, hence, two branches. Either may be employed to define f –1.
(b) We have y = (x – 2)(8 – x) or x2 – 10x + 16 + y = 0. The solution of this quadratic equation is
x = 5 ± 9. y−
After interchanging variables
y = 5 ± 9. x−
In Figure 3.7, AP represents y  = 5 + 9 x− , and BP designates
y = 5 – 9 x− . Either branch may represent f –1.
Note: The point at which the two branches meet is called a branch
point.
3.5. (a) Prove that g(x) = 5 + 9 x−  is strictly decreasing in 0 < x <  9. (b) Is it monotonic decreasing in this
interval? (c) Does g(x) have a single-valued inverse?
(a) g(x) is strictly decreasing if g(x1) > g (x2) whenever x1 < x 2. If x 1 < x 2, the 9 – x 1 > 9 – x 2, 19 x−  >
29 x− , and 5 + 19 x−  > 5 + 29 x− , showing that g(x) is strictly decreasing.
(b) Yes, any strictly decreasing function is also monotonic decreasing, since if g(x1) > g(x2) it is also true that
g(x1) > g(x2). However, if g(x) is monotonic decreasing, it is not necessarily strictly decreasing.
(c) If y = 5 + 9 x− , then y – 5 = 9 x−  or, squaring, x = – 16 + 10y – y 2 = (y – 2) (8 – y) and x is a
single-valued function of y; i.e., the inverse function is single-valued.
In general, any strictly decreasing (or increasing) function has a single-valued inverse (see Theorem 6,
Page 52).
The results of this problem can be interpreted graphically using Figure 3.7.
Figure 3.7
Figure 3.6


## Page 66

CHAPTER 3  Functions, Limits, and Continuity 55
3.6. Construct graphs for the following functions:
(a) sin 1/ , 0() 0, 0
xx xfx x
>⎧= ⎨ =⎩
(b) f(x) = [x] = greatest integer < x
(a) The required graph is shown in Figure 3.8. Since ⏐x sin 1/x⏐ < ⏐x⏐, the graph is included between y =
x and y = – x. Note that f(x) = 0 when sin 1/x = 0 or1/x =, mπ,m = 1, 2, 3, 4, . . ., i.e., where x = 1/π, 1/2π,
1/3π, . . . The curve oscillates infinitely often between x = 1/π and x = 0.
(b) The required graph is shown in Figure 3.9. If 1 < x < 2, then [x ] = 1. Thus, [1.8] = 1, [ 2 ] = 1,
[1.99999] = 1. However, [2] = 2. Similarly, for 2 < x < 3, [x] = 2, etc. Thus, there are jumps at the integers.
The function is sometimes called the staircase function or step function.
3.7. (a) Construct the graph of f (x) = tan x. (b) Construct the graph of some of the infinite number of branches
available for a definition of tan–1 x. (c) Show graphically why the relationship of x to y is multivalued. (d)
Indicate possible principal values for tan–1 x. (e) Using your choice, evaluate tan–1(– 1).
 Figure 3.8  Figure 3.9
(a) The graph of f (x) = tan x appears in Figure 3.10.
 Figure 3.10  Figure 3.11
(b) The required graph is obtained by interchanging the x and y axes in the graph of (a). The result, with axes
oriented as usual, appears in Figure 3.11.
(c) In Figure 3.11, any vertical line meets the graph in infinitely many points. Thus, the relation of y to x is
multivalued and infinitely many branches are available for the purpose of defining tan–1 x.
(d) To define tan –1 x as a single-valued function, it is clear from the graph that we can do so only by restrict-
ing its value to any of the following: –π/2 < tan –1 x < π/2, π/2 < tan–1 x < 3π/2, etc. We agree to take the
first as defining the principal value.
Note that no matter which branch is used to define tan–1 x, the resulting function is strictly increasing.
(e) tan –1(–1) = –π/4 is the only value lying between –π/2 and π/2; i.e., it is the principal value according to
our choice in (d).


## Page 67

CHAPTER 3  Functions, Limits, and Continuity56
3.8. Show that 1() , 1 , 1
xfx x x
+=≠ − +
 describes an irrational algebraic function.
If 1
1
xy x
+= +
, then (1 ) 1xy x+− =  or, squaring, (x + 1)2y2 – 2(x + 1)y + 1 – x = 0, a polynomial equa-
tion in y whose coefficients are polynomials in x. Thus, f(x) is an algebraic function. However, it is not the
quotient of two polynomials, so that it is an irrational algebraic function.
3.9. If f(x) = cosh x = 1
2
 (ex + e–x), prove that we can choose, as the principal value of the inverse function,
cosh–1 x = ln(x + 2 1x − ), x >  1.
If y = 1
2
 (ex + e–x), e2x – 2yex + 1 = 0. Then, using the quadratic formula,
2
224 4 1.2
x yyey y±−== ± −
Thus, 2ln 1 .xy y ⎛⎞=± −⎜⎟⎝⎠
Since
2
22
22
1 11( 1 )
11
yyyy yy
yy yy
⎛⎞ +−⎜⎟−− = −− = ⎜⎟ +− +−⎝⎠
 we can also write x = ± ln(y + 2 1y − )
or cosh–1 y = ± ln(y + 2 1y − ).
Choosing the + sign as defining the principal value and replacing y by x , we have cosh –1 x = ln(x  +
2 1y − ). The choice x >  1 is made so that the inverse function is real.
Limits
3.10. If (a) f(x) = x2 and (b)
2 ,2() ,
0, 2
xxfx
x
⎧ ≠= ⎨ =⎩
 prove that
2
lim
x→
f (x) = 4.
(a) We must show that, given any /H9280 > 0, we can find δ > 0 (depending on /H9280 in general) such that ⏐x2 – 4⏐ < /H9280
when 0 < ⏐x – 2⏐ < δ.
Choose δ <  1 so that 0 < ⏐x – 2⏐ < 1 or 1 < x < 3, x /HS11005 2. Then ⏐x2 – 4⏐ = ⏐(x – 2)(x + 2)⏐ = ⏐x – 2⏐
⏐x + 2⏐ < δ⏐x + 2⏐ < 5δ.
Take δ as 1 or /H9280/5, whichever is smaller. Then we have ⏐x2 – 4⏐ < /H9280 whenever 0 < ⏐x – 2⏐ < δ, and the
required result is proved.
It is of interest to consider some numerical values. If, for example, we wish to make ⏐x 2 – 4⏐ < .05,
we can choose δ = /H9280/5 = .05/5 = .01. To see that this is actually the case, note that if 0 < ⏐x – 2⏐ < .01,
then 1.99 < x < 2.01 (x/HS11005 2), and so 3.9601 < x2 < 4.0401, – .0399 < x2 – 4 < .0401, and certainly ⏐x2 – 4⏐
< .05 (x2 /HS11005 4). The fact that these inequalities also happen to hold at x = 2 is merely coincidental.
If we wish to make ⏐x2 – 4⏐ < 6, we can choose δ = 1, and this will be satisfied.
(b) There is no difference between the proof for this case and the proof in ( a), since in both cases we exclude
x = 2.
3.11. Prove that
43 2
1
26 3lim 8.1x
xx x
x→
−+ + =−−
We must show that for any /H9280 > 0 we can find δ > 0 such that
43 226 3 (8 )1
xx x
x ε−+ + −− <−
 when 0 <
⏐x – 1⏐ < δ. Since x/HS11005 1, we can write
43 2 32
3226 3 ( 243 3 ) ( 1 ) 243 311
xx x xxx x xxxxx
−+ + −− − − == − − −−−
on cancelling the common factor x – 1 /HS11005 0.


## Page 68

CHAPTER 3  Functions, Limits, and Continuity 57
Then we must show that for any ε > 0, we can find δ > 0 such that ⏐2x 3 – 4x2 –3x + 5⏐ < /H9280 when 0 <
⏐x – 1⏐ < δ. Choosing δ <  1, we have 0 < x < 2, x /HS11005 1.
Now ⏐2x3 – 4x2 – 3x + 5⏐ = ⏐x – 1 ⏐⏐2x2 – 2x – 5⏐ < δ⏐2x2 – 2x – 5⏐ < δ(⏐2x2⏐ + ⏐2x⏐+ 5) < (8 + 4 + 5)
δ = 17δ. Taking δ as the smaller of 1 and /H9280/17, the required result follows.
3.12. Let
|3 | ,() 3
0, 3
x xxfx x
x
−⎧ ≠⎪= −⎨
⎪ =⎩
.
(a) Graph the function. (b) Find limxf  (x). (c) Find
3
lim
x→+
f(x). (d) Find
3
lim
x→
f(x).
(a) |3 | 3For 3, 1.33
|3 |( 3 )For 3, 1.33
xxx xx
xxx xx
−−>= = −−
−− −>= = −−
Then the graph, shown in Figure 3.12, consists of the
lines y = 1, x > 3; y = –1, x < 3; and the point (3, 0).
(b) As x → 3 from the right, f (x) → 1; i.e.,
3
lim
x→+
f(x) = 1,
as seems clear from the graph. To prove this we must
show that given any /H9280 > 0, we can find δ  > 0 such that
⏐f (x) – 1⏐ < /H9280 whenever 0 < x – 1 < δ.
Now, since x > 1, f(x) = 1 and so the proof consists in the
triviality that ⏐1 – 1⏐ < /H9280 whenever 0 < x – 1 < δ.
(c) As x → 3 from the left, f (x) → – 1; i.e.,
3
lim
x→−
f(x) = –1.
A proof can be formulated as in (b).
(d) Since
3
lim
x→+
f(x) /HS11005
3
lim
x→−
f(x), /HS11005
3
lim
x→−
f(x) does not exist.
3.13. Prove that
0
lim
x→
x sin 1/x = 0.
We must show that given any /H9280 > 0, we can find δ > 0 such that ⏐x sin 1/x – 0⏐ < /H9280 when 0 < ⏐x – 0⏐
< δ.
If 0 < ⏐x⏐ < δ, then ⏐x sin 1/x⏐= ⏐x⏐| sin 1/x| <  |x| < δ, since ⏐sin 1/x⏐ <  1 for all x /HS11005 0.
Making the choice δ = /H9280, we see that ⏐x sin 1/x⏐ < /H9280 when 0 < ⏐x⏐ < δ, completing the proof.
3.14. Evaluate 1/0
2lim .1 xx e−→+ +
As x → 0 + we suspect that 1/x increases indefinitely, e 1/x increases indefinitely, e–1/x approaches 0, and
1 + e–1/x approaches 1; thus, the required limit is 2.
To prove this conjecture we must show that, given /H9280 > 0, we can find δ > 0 such that
1/
2 2w h e n 01 x x
e εδ− −< <<
+
Now
1/
1/ 1/ 1/
2 222 2211 1
x
xx x
e
ee e
−
−−
−−−= =++ +
Since the function on the right is smaller than 1 for all x > 0, any δ  > 0 will work when e ≥ 1. If
1/
1/
1/
21 1 2 1 2 10 1, then when , 1, 1 ; or 0 .1 2 1n(2 / 1)
x
x
x
e eI n xexεε δεε ε ε
+ ⎛⎞<< < > > − > − << = ⎜⎟+− ⎝⎠
Figure 3.12


## Page 69

CHAPTER 3  Functions, Limits, and Continuity58
3.15. Explain exactly what is meant by the statement 41
1lim (1 )x x→
=∞−
 and prove the validity of this statement.
The statement means that for each positive number M, we can find a positive number δ (depending on M
in general) such that
4
1 4 when 0 | 1 |(– 1 ) xx δ>< − <
To prove this, note that 4
4
11 when 0 ( 1)(1 ) Mx o r Mx >< − <−
4
1 .
M
Choosing 41 Mδ= / , the required results follows.
3.16. Present a geometric proof that
0
sinlim 1.
θ
θ
θ→
=
Construct a circle with center at O and radius OA  = OD = 1, as in Figure 3.13. Choose point B on OA
extended and point C on OD so that lines BD and AC are perpendicular to OD.
It is geometrically evident that
Area of triangle OAC < Area of sector OAD < Area of triangle OBD
that is,
1
2
sin θ cos θ < 1
2
θ < 1
2
 tan θ
Dividing by 1
2
 sin θ,
1cos sin cos
θθ θθ<<
or sin 1cos cos
θθ θθ<<
As θ→  0, cos θ→  1, and it follows that
0
sinlim 1.
θ
θ
θ→
=
Figure 3.13
Theorems on limits
3.17. If
0
lim
xx→
f(x) exists, prove that it must be unique.
We must show that if
0
lim
xx→
f(x) = l1 and
0
lim
xx→
f(x) = l2, then l1 = l2.
By hypothesis, given any /H9280 > 0 we can find δ > 0 such that
⏐f (x) – l1⏐ < /H9280/2   when   0 < ⏐x – x0⏐ < δ
⏐f (x) – l2⏐ < /H9280/2   when   0 < ⏐x –x0⏐ < δ
0 < ⏐x – 1⏐ <


## Page 70

CHAPTER 3  Functions, Limits, and Continuity 59
Then by the absolute value property 2 on Page 4,
⏐l1 – l2⏐ = ⏐l 1 – f(x) + f(x) – l2⏐ < ⏐l1 – f(x)⏐+ ⏐f (x) – l2⏐< /H9280/2 + /H9280/2 = /H9280
i.e., ⏐l1 – l2⏐ is less than any positive number /H9280 (however small) and so must be zero. Thus, l1 = l2.
3.18. If
0
lim
xx→
g(x) = B /HS11005 0, prove that there exists δ > 0 such that
⏐g(x)⏐ > 1
2
⏐B⏐   for   0 < ⏐x – x0⏐ < δ
Since
0
lim
xx→
g(x) = B, we can find δ > 0 such that ⏐g(x) – B⏐ < 1
2
⏐B⏐ for 0 < ⏐x – x 0⏐ < δ.
Writing B = B – g(x) + g(x), we have
⏐B⏐ < ⏐B – g(x)⏐ + ⏐g(x)⏐ < 1
2
⏐ B⏐ +⏐ g(x)⏐
i.e., ⏐B⏐ < 1
2
⏐B⏐ +⏐g(x)⏐, from which ⏐g(x)⏐ > 1
2
⏐B⏐.
3.19. Given
0
lim
xx→
f(x) = A and
0
lim
xx→
g(x) = B, prove (a)
0
lim
xx→
 [f(x) + g(x)] = A + B, (b)
0
lim
xx→
f(x)g(x) = AB,
(c)
0
11lim if 0,()xx
Bgx B→
=≠  and (d)
0
()lim if 0.()xx
fx A Bgx B→
=≠
(a) We must show that for any /H9280 > 0 we can find δ > 0 such that
0[( ) ( ) ] ( ) w h e n 0fx g x A B x xεδ+− + < < − <
Using absolute value property 2, Page 4, we have
 ⏐ [f(x) + g(x)] – (A + B)⏐ = ⏐[f (x) – A] + [g(x) – B]⏐ < ⏐f (x) – A⏐ + ⏐g(x) – B⏐ (1)
By hypothesis, given /H9280 > 0 we can find δ1 > 0 and δ 2 > 0 such that
 ⏐ f(x) – A⏐ < /H9280/2   when   0 < ⏐x – x0⏐ < δ1 (2)
 ⏐ g(x) – B⏐ < /H9280/2   when   0 < ⏐x – x0⏐ < δ2 (3)
Then, from Equations (1), (2), and (3),
⏐[f (x) + g(x)] – (A + B)⏐ < /H9280/2 + /H9280/2 = /H9280   when   0 < ⏐x – x0⏐ < δ
where δ is chosen as the smaller of δ1 and δ2.
(b) We have
 ⏐ f(x)g(x) – AB⏐ = ⏐f (x)[g(x) – B] + B[f(x) – A]⏐ (4)
< ⏐f (x)⏐⏐g(x) –B⏐ + ⏐B⏐⏐f (x) – A⏐
< ⏐f (x)⏐⏐g(x) – B⏐ + (⏐B⏐ + 1)⏐f (x) – A⏐
Since
0
lim
xx→
f(x) = A, we can find δ1 such that ⏐f (x) – A⏐ < 1 for 0 < ⏐x – x0⏐ < δ1, i.e., A – 1 < f(x) < A
+ 1, so that f(x) is bounded, i.e., ⏐f (x)⏐ < P where P is a positive constant.
Since
0
lim
xx→
g(x) = B, given /H9280 > 0, we can find δ2 > 0 such that ⏐g(x) – B⏐ < /H9280/2 P for 0 < ⏐x – x0⏐ < δ2.
Since
0
lim
xx→
f(x) =A, given /H9280 > 0, we can find δ3 > 0 such that |( ) | 2(| | 1)fx A B
ε−< +
 for 0 < |x – x0| < δ2.
Using these in Equation (4), we have


## Page 71

CHAPTER 3  Functions, Limits, and Continuity60
|( ) ( ) | ( | |1 ) 22 (| | 1 )fx g x A B P B PB
εε ε−< ⋅ ++ ⋅ = +
for 0 < ⏐x – x0⏐ < δ, where δ is the smaller of δ1, δ1, δ2, δ3, and the proof is complete.
(c) We must show that for any /H9280 > 0 we can find δ > 0 such that
0
11 | ( )| when 0 | |() | | | () |
gx B xxgx B B gx εδ−−= < <− <  (5)
By hypothesis, given /H9280 > 0, we can find δ1 > 0 such that
⏐g(x) – B⏐ < 1
2
B2 /H9280   when   0 < ⏐x –x 0⏐ < δ1
By Problem 3.18, since
0
lim
x→
g(x) = B /HS11005 0, we can find δ2 > 0 such that
⏐g(x)⏐ > 1
2
⏐B⏐   when   0 < ⏐x – x0⏐ < δ2
Then, if δ is the smaller of δ1 and δ2, we can write
21
2
01
2
11 | ( )| whenever 0 | |( ) || | ( ) ||| ||
Bgx B xxgx B B gx B B
ε εδ−−= < = <− <⋅
and the required result is proved.
(d) From parts (b) and (c),
00 0 0
() 1 1 1lim lim ( ) lim ( ) lim() () ()xx xx xx xx
fx Afx fx Agx gx gx B B→→ → →
=⋅ =⋅= ⋅ =
This can also be proved directly (see Problem 3.69).
These results can also be proved in the cases x → x0+, x → x0 –, x → /H11009,x → –/H11009.
Note: In the proof of (a) we have used the results ⏐f(x) – A⏐ < /H9280/2 and ⏐g(x) – B⏐ < /H9280/2, so that the final result
would come out to be ⏐f(x) + g(x) – (A + B)⏐ < /H9280. Of course, the proof would be just as valid if we had used 2/H9280 (or
any other positive multiple of /H9280) in place of /H9280. A similar remark holds for the proofs of (b), (c), and (d).
3.20. Evaluate each of the following, using theorems on limits.
(a)
22
22 2 2
lim( 6 4) lim lim ( 6 ) lim 4
xx x x
xx x x
→→ → →
−+ = + − +
22 2 2 2
(lim )(lim ) (lim 6)(lim ) lim 4
(2)(2) ( 6)(2) 4 4
xx x x x
xx x
→→ → → →
=+ − +
=+ − + = −
In practice, the intermediate steps are omitted.
(b) 11
221
1
lim ( 3) lim (2 1)(3 ) ( 21 ) 2 ( 3 ) 3lim 423 2 lim ( 3 – 2)
xx
x
x
xxxx
xx xx
→− →−
→−
→−
+−+− ⋅ −== =−+− +
(c)
42 24
43
3
312231lim lim 1363 6
xx
xx xx
xx x
x x
→∞ →∞
−+−+ =
+− +−
4
3
–3 1lim 2 lim lim 212
13 63lim 6 lim lim
xx x
xx x
x
x x
→∞ →∞ →∞
→∞ →∞ →∞
++
== =−++


## Page 72

CHAPTER 3  Functions, Limits, and Continuity 61
by Problem 3.19.
(d)
00
42 42 42lim lim
42hh
hh h
hh h→→
+− +− ++=⋅
++
00
4– 4 1 1 1lim lim 22 4(4 2 4 2hh
h
hh h→→
+== = = +++ ++
(e)
00 0 – 0
sin sin sinlim lim lim lim 1 0 0.
xx x x
xx x xxxxx→+ →+ → →+
=⋅ =⋅ = ⋅ =
Note that in (c), (d), and (e) if we use the theorems on limits indiscriminately we obtain the so-called
indeterminate forms /H11009//H11009 and 0/0. To avoid such predicaments, note that in each case the form of the limit is
suitably modified. For other methods of evaluating limits, see Chapter 4.
Continuity
(Assume that values at which continuity is to be demonstrated are interior domain values unless otherwise
stated.)
3.21. Prove that f(x) = x2 is continuous at x = 2.
Method 1: By Problem 3.10,
2
lim
x→
f(x) = f(2) = 4 and so f(x) is continuous at x = 2.
Method 2: We must show that, given any /H9280 > 0, we can find δ > 0 (depending on /H9280) such that ⏐f(x) – f(2)⏐
= ⏐x2 – 4⏐ < /H9280 when ⏐x – 2⏐ < δ. The proof patterns are given in Problem 3.10.
3.22. (a) Prove that sin 1/ , 0() 5, 0
xx xfx x
≠⎧= ⎨ =⎩
 is not continuous at x = 0. (b) Can we redefine f(0) so that f(x)
is continuous at x = 0?
(a) From Problem 3.13,
0
lim
x→
f(x) = 0. But this limit is not equal to f(0) = 5, so f(x) is discontinuous at x = 0.
(b) By redefining f(x) so that f (0) = 0, the function becomes continuous. Because the function can be made
continuous at a point simply by redefining the function at the point, we call the point a removable discon-
tinuity.
3.23. Is the function
43 226 3() 1
xx xfx x
−+ += −
 continuous at x = 1?
f(1) does not exist, so f(x) is not continuous at x = 1. By redefining f(x) so that f(1) =
1
lim
x→
f(x) = –8 (see
Problem 3.11), it becomes continuous at x = 1; i.e., x = 1 is a removable discontinuity.
3.24. Prove that if f (x) and g(x) are continuous at x = x0, so also are (a) f(x), + g(x), (b) f(x)g(x), and
(c) 0
() if ( ) 0.()
fx fxgx ≠
These results follow at once from the proofs given in Problem 3.19 by taking A = f(x 0) and B = g(x0) and
rewriting 0 < ⏐x – x0⏐ < δ as ⏐x – x 0⏐ < δ, i.e., including x = x0.
3.25. Prove that f(x) = x is continuous at any point x = x0.
We must show that, given any /H9280 > 0, we can find δ  > 0 such that ⏐ f(x) – f (x0)⏐ = ⏐ x – x 0⏐ < /H9280 when
⏐x – x0⏐ < δ. By choosing δ = /H9280, the result follows at once.
3.26. Prove that f(x) = 2x3 + x is continuous at any point x = x0.


## Page 73

CHAPTER 3  Functions, Limits, and Continuity62
Since x is continuous at any point x = x0 (Problem 3.25), so also is x · x = x2, x2 · x = x3, 2x3, and, finally,
2x3 + x, using the theorem (Problem 3.24) that sums and products of continuous functions are continuous.
3.27. Prove that if () 5fx x =−  for 5 < x <  9, then f(x) is continuous in this interval.
If x0 is any point such that 5 < x0 < 9, then
0
lim
xx→
f(x) =
0
lim
xx→
5x −  = 0 5x −  = f (x0). Also,
59
l i m 50 ( 5 ) a n d l i m 52 ( 9 ) .
xx
xf x f
→+ →−
−== −= Thus the result follows.
Here we have used the result that
00
0lim ( ) lim ( ) ( )
xx xx
fx fx fx
→→
==  if f(x) is continuous at x0. An
/H9280,δ proof, directly from the definition, can also be employed.
3.28. For what values of x in the domain of definition is each of the following functions continuous?
(a) 2
1() 1fx x= −
(b) 1c o s() 3s i n
xfx x
+= +
(c)
4
1()
10 4
fx =
+
(d) f(x) = 10 –1/(x – 3)2
(e)
2–1( 3) ,10 3()
0, 3
x xfx
x
−⎧ ≠⎪= ⎨ =⎪⎩
(f) ||() xxfx x
−=
(g)
–| | ,0()
2, 0
xx xfx x
x
⎧ <⎪= ⎨
⎪ =⎩
(h) () c s c . sin
xfx x x x==
(i) f(x) = x csc x, f(0) = 1.
(a) All  except = 1(where the denominator is zero)xx ⋅±
(b) All x
(c) All x > –10
(d) All x /HS11005 3 (see Problem 3.55)
(e) All
3
, since lim ( ) (3)
x
xf x f
→
=
(f) If 0, ( ) 0. If 0, ( ) 2.xx xxxf x xf x xx
−+>= =<= =  At x = 0, f (x) is undefined. Then f (x) is con-
tinuous for all x except x = 0.
(g) As in (f ), f(x) is continuous for x < 0. Then, since
0– 0– 0–
–| |lim lim lim 2 2 (0)
xx x
xx x x fxx→→ →
+== = =
it follows that f(x) is continuous (from the left) at x = 0.
Thus, f(x) is continuous for all x <  0, i.e., everywhere in its domain of definition.
,


## Page 74

CHAPTER 3  Functions, Limits, and Continuity 63
(h) All  except 0, , 2 , 3 ,x πππ±± ±  . . .
(i) Since
00
lim csc lim 1 (0),sinxx
xxx fx→→
== =  we see that f (x) is continuous for all x except ±π , ±2π ,
±3π, . . . [compare (h)].
Uniform continuity
3.29. Prove that f(x) = x2 is uniformly continuous in 0 < x < 1.
Method 1: Using definition.
We must show that, given any /H9280 > 0, we can find δ > 0 such that ⏐x2 – x2
0⏐ < /H9280 when ⏐x – x0⏐ < δ, where
δ depends only on /H9280 and not on x0 where 0 < x0 < 1.
If x and x0 are any points in 0 < x < 1, then
⏐x2 – x2
0
⏐ = ⏐x + x 0⏐⏐x – x 0⏐ < 2⏐x – x 0⏐
Thus, if ⏐x – x0⏐ < δ, it follows that ⏐x2 – x2
0⏐ < 2δ. Choosing δ = /H9280/2, we see that ⏐x2 –x2
0
⏐< /H9280 when ⏐x –x0⏐
< δ, where δ depends only on /H9280 and not on x0 Hence, f(x) = x2 is uniformly continuous in 0 < x < 1.
This can be used to prove that f(x) = x2 is uniformly continuous in 0 < x <  1.
Method 2: The function f(x) = x2 is continuous in the closed interval 0 < x <  1. Hence, by the theorem on
Page 48, it is uniformly continuous in 0 < x <  1 and thus in 0 < x < 1.
3.30. Prove that f(x) = 1/x is not uniformly continuous in 0 < x < 1.
Method 1: Suppose f(x) is uniformly continuous in the given interval. Then, for any /H9280 > 0 we should be able
to find δ, say, between 0 and 1, such that ⏐f(x) – f(x0)⏐ < /H9280 when ⏐x – x0⏐ < δ for all x and x0 in the interval.
00
0
Let and . Then | .11 1
11 1 1However, (since 0 < < 1).
xx x x
xx
δδ εδδ δ δεε ε
εε εδδδ δ
== − = − = < ++ +
+−= − = >
Thus, we have a contradiction, and it follows that f(x) = 1/x cannot be uniformly continuous in 0 < x < 1.
Method 2: Let x0 and x0 + δ be any two points in (0, 1). Then,
00
00 0 0
11|() ( | ()fx fx xx x x
δδ δδ−+ = − = ++
can be made larger than any positive number by choosing x0 sufficiently close to 0. Hence, the function cannot
be uniformly continuous.
Miscellaneous problems
3.31. If y = f(x) is continuous at x = x0, and z = g(y) is continuous at y = y0 where y0 = f(x0), prove that z = g{f(x)}
is continuous at x = x0.
Let h(x) = g{f(x)}. Since, by hypothesis, f(x) and g(y) are continuous at x0 and y0, respectively, we have
00
0 0
0
00
lim ( ) (lim ) ( )
lim ( ) (lim ) ( ) { ( )}
xx xx
yy yy
fx f x fx
gy g y gy g f x
→→
→ →
==
== =
Then
00 0
00lim ( ) lim { ( )} {lim ( )} { ( )} ( )
xx xx xx
hx gfx g fx gfx hx
→→ →
=== =
which proves that h(x) = g{f(x)} is continuous at x = x0.
⏐x – x0⏐


## Page 75

CHAPTER 3  Functions, Limits, and Continuity64
3.32. Prove Theorem 8, Page 52.
Suppose that f(a) < 0 and f(b) > 0. Since f(x) is continuous, there must be an interval (a,a + h), h > 0, for
which f(x) < 0. The set of points (a, a + h) has an upper bound and so has a least upper bound, which we call
c. Then f(c) <  0. Now we cannot have f (c) < 0, because if f (c) were negative we would be able to find an
interval about c (including values greater than c) for which f (x) < 0; but since c is the least upper bound, this
is impossible, and so we must have f(c) = 0 as required.
If f(a) > 0 and f(b) < 0, a similar argument can be used.
3.33. (a) Given f(x) = 2x3 – 3x2 + 7x – 10, evaluate f(1) and f(2). (b) Prove that f(x) = 0 for some real number x
such that 1 < x < 2. (c) Show how to calculate the value of x in (b).
(a) f(1) = 2(1)3 – 3(1)2 + 7(1) – 10 = –4, f(2) = 2(2)3 – 3(2)2 + 7(2) – 10 = 8.
(b) If f(x) is continuous in a < x < b and if f (a) and f (b) have opposite signs, then there is a value of x be-
tween a and b such that f(x) = 0 (Problem 3.32).
To apply this theorem, we need only realize that the given polynomial is continuous in 1 < x <  2, since we have
already shown in (a) that f(1) < 0 and f(2) > 0. Thus, there exists a number c between 1 and 2 such that f(c) = 0.
(c) f(1.5) = 2(1.5) 3 – 3(1.5) 2 + 7(1.5) – 10 = 0.5. Then, applying the theorem of ( b) again, we see that
the required root lies between 1 and 1.5 and is “most likely” closer to 1.5 than to 1, since f (1.5) =
0.5 has a value closer to 0 than f (1) = –4 (this is not always a valid conclusion but is worth pursuing
in practice).
Thus, we consider x = 1.4. Since f(1.4) = 2(1.4)3 – 3(1.4)2 + 7(1.4) – 10 = –0.592, we conclude that there
is a root between 1.4 and 1.5 which is most likely closer to 1.5 than to 1.4.
Continuing in this manner, we find that the root is 1.46 to 2 decimal places.
3.34. Prove Theorem 10, Page 52.
Given any /H9280 > 0, we can find x such that M – f(x) < /H9280 by definition of the l.u.b. M.
Then 11 1 ,s ot h a t  –( ) ( )Mf x Mf x ε> −
 is not bounded and, hence, cannot be continuous in view of
Theorem 4, Page 52. However, if we suppose that f(x) /HS11005M, then, since M – f(x) is continuous, by hypothesis
we must have 1
()Mf x−
 also continuous. In view of this contradiction, we must have f (x) = M for at least
one value of x in the interval.
Similarly, we can show that there exists an x in the interval such that f(x) = m (Problem 3.93).
SUPPLEMENTARY PROBLEMS
Functions
3.35. Give the largest domain of definition for which each of the following rules of correspondence supports the
the construction of a function.
(a) (3 )(2 4)xx−+   (b) (x – 2)/(x 2 – 4) (c) sin 3x  (d) log 10(x3 – 3x2 – 4x + 12)
Ans. (a) –2 < x <  3 (b) all x /HS11005 ±2 (c) 2mπ/3< x <  (2m + 1)π/3, m = 0, ±1, ±2, . . . (d) x > 3, –2 < x < 2
3.36. If 31() , 2 , 2
xfx x x
+=≠ −
 find:


## Page 76

CHAPTER 3  Functions, Limits, and Continuity 65
(a) 5(1 ) 2( 0 ) 3( 5 )
6
ff f−− +  (b)
21
2f⎧⎫ ⎛⎞−⎨⎬ ⎜⎟⎝⎠⎩⎭
 (c) f(2x – 3) (d) f (x) + f(4/x), x /HS11005 0
(e) () ( 0 ) 0fh f hh
− ≠  (f) f({ f(x)}
Ans. (a) 61
81
(b) 1
25
 (c) 68 ,0 ,25
x xx
− ≠−
5 ,2
2 (d) 5 ,0 , 22 x ≠  (e) 7 ,0 , 224 hh ≠−
 (f) 10 1 ,5 , 25
x xx
+ ≠−+
3.37. If f(x) = 2x2, 0 < x <  2, find (a) the l.u.b. and (b) the g.l.b. of f(x). Determine whether f(x) attains its l.u.b.
and g.l.b.
Ans. (a) 8 (b) 0
3.38. Construct a graph for each of the following functions.
(a) f(x) = ⏐x⏐, – 3 < x <  3 (f) [] where [ ] = greatest integer <xx xxx
−
(b) () 2 , 2 2 xfx xx=− −<<  ( g) f(x) = cosh x
(c)
0, 0
1() ,02
1, 0
x
fx x
x
<⎧
⎪⎪= =⎨
⎪
⎪ >⎩
 ( h) sin() xfx x=
(d)
,2 0
() ,0 2
xx
fx xx
−− < <⎧⎪= ⎨ <<⎪⎩
 ( i) () ( 1)( 2)( 3)
xfx xx x= −− −
(e) f(x) = x2 sin 1/x, x /HS11005 0 (j)
2
2
sin() xfx x=
3.39. Construct graphs for (a) x2/a2 + y 2/b2 = 1, (b) x2/a2 – y2/b2 = 1, (c) y2 = 2px, and (d) y = 2ax – x2, where a, b,
and p are given constants. In which cases, when solved for y, is there exactly one value of y assigned to each
value of x, thus making possible definitions of functions f and enabling us to write y = f(x)? In which cases
must branches be defined?
3.40. ( a) From the graph of y = cos x, construct the graph obtained by interchanging the variables and from which
cos–1 x will result by choosing an appropriate branch. Indicate possible choices of a principal value of cos–1
x. Using this choice, find cos–1(1/2) – cos– 1(–1/2). Does the value of this depend on the choice? Explain.
3.41. Work parts (a) and (b) of Problem 3.40 for (a) y = sec –1 x and (b) y = cot–1 x.
3.42. Given the graph for y = f (x), show how to obtain the graph for y = f(ax + b), where a and b are given
constants. Illustrate the procedure by obtaining the graphs of (a) y = cos3x, (b) y = sin(5x + π/3), and
(c) y = tan(π/6 – 2x).
3.43. Construct graphs for (a) y = e –⏐x⏐ , (b) y = ln ⏐x⏐, and (c) y = e –⏐x⏐  sin x.


## Page 77

CHAPTER 3  Functions, Limits, and Continuity66
3.44. Using the conventional principal values on Pages 45 and 46, evaluate:
(a) sin –1 (– 3 /2) (f) sin –1 x + cos– 1 x, –1 < x <  1
(b) tan –1(1) – tan–1(–1) (g) sin –1 (cos 2x), 0 < x < π/2
(c) cot –1(1/ 3 ) – cot–1(–1/ 3 ) (h) sin –1 (cos 2x), π/2 < x <  3π/2
(d) cosh –1 2  ( i) tanh (csch–1 3x), x /HS11005 0
(e) e–coth–1 (25/7) ( j) cos(2 tan–1 x2)
Ans. (a) – π/3 (f) π/2
 (b) π/2 (g) π/2 – 2x
 (c) –π/3 (h) 2x – 3π/2
 (d) ln(1 + 2 ) (i)
2
||
91
x
xx +
 (e) 3
4
(j)
4
4
1
1
x
x
−
+
3.45. Evaluate (a) cos{π sinh(ln 2)} and (b) cosh  –1 {coth(ln 3)}.
Ans. (a) – 2 /2 (b) ln 2
3.46. (a) Prove that tan –1 x + cot–1 x = π/2 if the conventional principal values on Pages 45 and 46 are taken. (b) Is
tan–1 x + tan–1 (1/x) = π/2 also? Explain.
3.47. If f(x) = tan–1 x, prove that () () , 1
xyfx fy f xy
⎛⎞ ++= ⎜⎟ −⎝⎠
 discussing the case xy = 1.
3.48. Prove that tan –1 a – tan–1 b = cot–1 b – cot–1 a.
3.49. Prove the identities: (a) 1 – tanh 2 x = sech2 x, (b) sin 3x = 3 sin x – 4 sin3 x, (c) cos 3x = 4 cos3 x – 3 cos x,
(d) tanh 1
2
x = (sinh x)/(1 + cosh x), and (e) ln ⏐csc x – cot x⏐ = ln ⏐tan 1
2
x ⏐.
3.50. Find the relative and absolute maxima and minima of (a) f (x) = (sin x)/x, f(0) = 1 and (b) f(x) = (sin2 x)/x2,
f(0) = 1. Discuss the cases when f(0) is undefined or f(0) is defined but /HS11005 1.
Limits
3.51. Evaluate the following limits, first by using the definition and then by using theorems on limits.
(a)
3
lim
x→
 (x2 – 3x + 2) (d)
4
2lim 4x
x
x→
−
−
(b)
1
1lim 25x x→− −
(e)
4
0
(2 ) 16lim
h
h
h→
+−
(c)
2
2
4lim 2x
x
x→
−
−
(f)
1
lim 1x
x
x→ +


## Page 78

CHAPTER 3  Functions, Limits, and Continuity 67
Ans. (a) 2 (b) – 1
7
 (c) 4 (d) – 1
4
 (e) 32 (f) 1
2
3.52. Let
31 , 0
 () 0 , 0 .
25 , 0
xx
fx x
xx
−<⎧
⎪==⎨
⎪ +>⎩
(a) Construct a graph of f (x). Evaluate (b)
2
lim
x→
f(x), (c)
3
lim
x→−
f(x), (d)
0
lim
x→+
f(x), (e)
0
lim
x→−
f(x), and
(f)
0
lim
x→
f(x), justifying your answer in each case.
Ans. (b) 9 (c) –10 (d) 5 (e) –1 (f) does not exist
3.53. Evaluate (a)
0
() ( 0)lim
h
fh f
h→+
−+  and (b)
0
() ( 0)lim
h
fh f
h→−
−− , where f(x) is the function of Problem 3.52.
Ans. (a) 2 (b) 3
3.54. (a) If f(x) = x2 cos 1/x, evaluate
0
lim
x→
f(x), justifying your answer. (b) Does your answer to (a) still remain
the same if we consider f(x) = x2 cos 1/x, x /HS11005 0, f(0) = 2? Explain.
3.55. Prove that
3
lim
x→
 10–1/(x – 3)2 = 0, using the definition.
3.56. Let
1/
1/
11 0 1() , 0 , ( 0 ) . 221 0
x
xfx x f
−
−
+=≠ =−
 Evaluate (a)
0
lim
x→+
f(x), (b)
0
lim
x→−
f(x), and (c)
0
lim
x→
f(x),
justifying answers in all cases.
Ans. (a) 1
2
 (b) – 1 (c) does not exist.
3.57. Find (a)
0
||lim
x
x
x→+
 and (b)
0
||lim .
x
x
x
→−
Illustrate your answers graphically.
Ans. (a) 1 (b) –1
3.58. If f(x) is the function defined in Problem 3.56, does
0
lim
x→
f(⏐x⏐) exist? Explain.
3.59. Explain exactly what is meant when you write:
(a) 23
2lim
(3 )x
x
x→
− = −
−
–/H11009 (b)
0
lim
x→+
 (1 – e1/x) = –/H11009 (c) 25 2lim 32 3x
x
x→∞
+ =−
3.60. Prove that (a) lim
x→∞
 10–x = 0 and (b) coslim 0.
x
x
x π→−∞
=+
3.61. Explain why (a) lim
x→∞
 sin x does not exist and (b) lim
x→∞
e–x sin x does not exist.
3.62. If 3| | () , 75 | |
xxfx xx
+= −
 evaluate (a) lim
x→∞
f(x) (b) lim
x→−∞
f(x), (c)
0
lim
x→+
f(x), (d)
0
lim
x→−
f(x), and
(e)
0
lim
x→
f(x).
Ans. (a) 2 (b) 1
6  (c) 2 (d) 1
6
 (e) does not exist


## Page 79

CHAPTER 3  Functions, Limits, and Continuity68
3.63. If [x] = largest integer < x, evaluate (a)
2
lim
x→+
{x – [x]} and (b)
2
lim
x→−
{x – [x]}.
Ans. (a) 0 and (b) 1
3.64. If
0
lim
xx→
f(x) = A, prove that (a)
0
lim
xx→
{f(x)}2 = A2 and (b)
0
lim
xx→
33 () .fx A =  What generalizations of
these do you suspect are true? Can you prove them?
3.65. If
0
lim
xx→
f(x), = A and lim g(x), = B, prove that (a)
0
lim
xx→
 {f(x) – g(x)} = A – B and (b)
0
lim
xx→
 {af(x) +
bg(x)} = aA + bB, where a, b = any constants.
3.66. If the limits of f (x), g(x), and h(x) are A, B, and C respectively, prove that (a)
0
lim
xx→
 {f(x) + g(x) + h(x)} =
A + B + C and (b)
0
lim
xx→
f(x)g(x)h(x) = ABC. Generalize these results.
3.67. Evaluate each of the following using the theorems on limits.
(a)
2
21/2
21 2 3lim (3 2)(5 3) 53x
xx
xx xx→
⎧⎫ −− −⎨⎬ +− −+⎩⎭
(b) (3 1)(2 3)lim (5 3)(4 5)x
xx
xx→∞
−+
−+
(c) 32lim 11x
xx
xx→−∞
⎛⎞ −⎜⎟ −+⎝⎠
(d)
1
11 2lim 13 3 5x
x
xx x→
⎛⎞ −⎜⎟−+ +⎝⎠
Ans. (a) −8/21 (b) 3/10 (c) 1 (d) 1/32
3.68. Evaluate
3
0
82lim .
h
h
h→
+−  (Hint: Let 8 + h = x3.)
Ans. 1/12
3.69. If
0
lim
xx→
f(x) = A and
0
lim
xx→
g(x) = B /HS11005 0, prove directly that
0
()lim . ()xx
fx A
gx B→
=
3.70. Given
0
sin 3lim 1,
x
x
x→
=  evaluate:
(a)
0
sin 3lim
x
x
x→
 (e)
0
6s i n 2lim 23 s i n 4x
xx
xx→
−
+
(b)
0
1c o slim
x
x
x→
−  (f) 20
cos coslim
x
ax bx
x→
−
(c) 20
1c o slim
x
x
x→
−  (g) 20
1 2 cos cos 2lim
x
xx
x→
−+
(d)
3
lim
x→
(x – 3) csc πx  (h) 31
3s i n s i n3lim
x
xx
x
ππ
→
−
Ans. (a) 3 (b) 0 (c) 1
2
 (d) –1/π (e) 2
7  (f) 1
2
 (b2 – a2) (g) –1 (h) 4π 3


## Page 80

CHAPTER 3  Functions, Limits, and Continuity 69
3.71. If
0
1lim 1,
x
x
e
x→
− =  prove that (a)
0
lim
ax bx
x
ee bax
−−
→
− =− , (b)
0
lim ln , , 0
xx
x
ab a abxb→
− => , and
(c)
0
tanh lim .
x
ax ax→
=
3.72. Prove that
0
lim
xx→
f(x) = l if and only if
0
lim
xx
+
→
f(x) = l.
Continuity
In the following problems, assume the largest possible domain unless otherwise stated.
3.73. Prove that f(x) = x2 – 3x + 2 is continuous at x = 4.
3.74. Prove that f(x) = 1/x is continuous (a) at x = 2 and (b) in 1 < x <  3.
3.75. Investigate the continuity of each of the following functions at the indicated points:
(a) sin() ; 0 , ( 0 ) 0 ; 0xfx x f x x=≠ = =  (c)
3
2
8( ) ; 2, (2) 3; 24
xfx x f x x
−=≠ = =−
(b) f(x) = x – ⏐x⏐; x = 0 (d) sin , 0 1() ; 1ln 1 2
xxfx xx
π< <⎧==⎨ <<⎩
Ans. (a) discontinuous, (b) continuous, (c) continuous, (d) discontinuous
3.76. If [x] = greatest integer < x, investigate the continuity of f(x) = x – [x] in the interval (a) 1 < x < 2 and
(b) 1 < x <  2.
3.77. Prove that f(x) = x3 is continuous in every finite interval.
3.78. If f(x)/g(x) and g(x) are continuous at x = x0, prove that f(x) must be continuous at x = x0.
3.79. Prove that f(x) = (tan–1 x)/x, f(0) = 1 is continuous at x = 0.
3.80. Prove that a polynomial is continuous in every finite interval.
3.81. If f(x) and g(x) are polynomials, prove that f(x)/g(x) is continuous at each point x = x0 for which g (x0) /HS11005 0.
3.82. Give the points of discontinuity of each of the following functions.
(a) () (2 ) (4 )
xfx xx= −−
  (c) () ( 3 ) ( 6 ) ,3 6fx x x x=−− < <
(b) f(x) = x2 sin 1/x, x /HS11005 0, f(0) = 0 (d) 1() 12 s i nfx x= +
Ans. (a) x = 2, 4 (b) none (c) none (d) x = 7π/6 ± 2mπ, 11π/6 ± 2mπ, m = 0, 1, 2, . . .


## Page 81

CHAPTER 3  Functions, Limits, and Continuity70
Uniform continuity
3.83. Prove that f(x) = x3 is uniformly continuous in (a) 0 < x < 2 (b) 0 < x <  2 and (c) any finite interval.
3.84. Prove that f(x) = x2 is not uniformly continuous in 0 < x < /H11009.
3.85. If a is a constant, prove that f(x) = 1/x2 is (a) continuous in a < x < /H11009 if a>  0, (b) uniformly continuous in
a < x < /H11009 if a > 0, and (c) not uniformly continuous in 0 < x < 1.
3.86. If f(x) and g(x) are uniformly continuous in the same interval, prove that (a) f(x) ± g(x) and (b) f(x) g(x) are
uniformly continuous in the interval. State and prove an analogous theorem for f(x)/g(x).
Miscellaneous problems
3.87. Give an “/H9280,δ” proof of the theorem of Problem 3.31.
3.88. (a)  Prove that the equation tan x = x has a real positive root in each of the intervals π/2 < x < 3π/2, 3π/2 < x
< 5π/2, 5π/2 < x < 7π/2, . . .
(b) Illustrate the result in (a) graphically by constructing the graphs of y = tan x and y = x and locating their
points of intersection.
(c) Determine the value of the smallest positive root of tan x = x.
Ans. (c) 4.49 approximately
3.89. Prove that the only real solution of sin x = x is x = 0.
3.90. (a)  Prove that cos x cosh x + 1 = 0 has infinitely many real roots. (b) Prove that for large values of x, the
roots approximate those of cos x = 0.
3.91. Prove that
2
0
sin(1/ )lim 0.sinx
xx
x→
=
3.92. Suppose f(x) is continuous at x = x0 and assume f(x0) > 0. Prove that there exists an interval (x0 – h, x0 + h),
where h > 0, in which f(x) > 0. (See Theorem 5, page 52.) (Hint: Show that we can make ⏐f (x) – f(x0)⏐
< 1
2
f(x0). Then show that f(x) > f(x0) – ⏐f (x) – f(x0)⏐ > 1
2
f(x0) > 0.)
3.93. ( a) Prove Theorem 10, Page 52, for the greatest lower bound m (see Problem 3.34). (b) Prove Theorem 9,
Page 52, and explain its relationship to Theorem 10.


## Page 82

71
Derivatives
The Concept and Definition of a Derivative
Concepts that shape the course of mathematics are few and far between. The derivative, the fundamental
element of the differential calculus, is such a concept. That branch of mathematics called analysis, of which
advanced calculus is a part, is the end result. There were two problems that led to the discovery of the de-
rivative. The older one of defining and representing the tangent line to a curve at one of its points had con-
cerned early Greek philosophers. The other problem of representing the instantaneous velocity of an object
whose motion was not constant was much more a problem of the seventeenth century. At the end of that
century, these problems and their relationship were resolved. As is usually the case, many mathematicians
contributed, but it was Isaac Newton and Gottfried Wilhelm Leibniz who independently put together organ-
ized bodies of thought upon which others could build.
The tangent problem provides a visual interpretation of the derivative and can be brought to mind no mat-
ter what the complexity of a particular application. It leads to the definition of the derivative as the limit of
a difference quotient in the following way. (See Figure 4.1.)
Figure 4.1
Let P0 (x0) be a point on the graph of y = f (x). Let P(x) be a nearby point on this same graph of the func-
tion f. Then the line through these two points is called a secant line. Its slope, ms, is the difference quotient
0
0
() ( )
s
fx fx ym xx x
− Δ== −Δ
 (1)
where Δx and Δy are called the increments in x and y, respectively. Also this slope may be written
00() ( )
s
fx h fxm h
+−=  (2)
where h = x – x0 = Δx. See Figure 4.2.
CHAPTER 4


## Page 83

CHAPTER 4  Derivatives72
 Figure 4.2 Figure 4.3
We can imagine a sequence of lines formed as h → 0. It is the limiting line of this sequence that is the natu-
ral one to be the tangent line to the graph at P0.
To make this mode of reasoning precise, the limit (when it exists), is formed as follows:
00
0
() ( )( ) lim
h
fx h fxfx h→
+−′ =  (3a)
As indicated, this limit is given the name f ′(x0). It is called the derivative of the function f at its domain
value x0. If this limit can be formed at each point of a subdomain of the domain of f, then f is said to be dif-
ferentiable on that subdomain and a new function f ′ has been constructed.
This limit concept was not understood until the middle of the nineteenth century. A simple example il-
lustrates the conceptual problem that faced mathematicians from 1700 until that time. Let the graph of f be
the parabola y = x2; then a little algebraic manipulation yields
2
0
0
2 2s
xh hmx hh
+== +  (3b)
Newton, Leibniz, and their contemporaries simply let h = 0 and said that 2x0 was the slope of the tangent line
at P0. However, this raises the ghost of a 0
0  form in the middle term. True understanding of the calculus is in the
comprehension of how the introduction of something new (the derivative, i.e., the limit of a difference quotient)
resolves this dilemma.
Note 1: The creation of new functions from difference quotients is not limited to f ′. If, starting with f′,
the limit of the difference quotient exists, then f ″ may be constructed, and so on.
Note 2: Since the continuity of a function is such a strong property, one might think that differentiability
followed. This is not necessarily true, as is illustrated in Figure 4.3.
The following theorem puts the matter in proper perspective.
Theorem: If f is differentiable at a domain value, then it is continuous at that value.
As indicated, the converse of this theorem is not true.
Right- and Left-Hand Derivatives
The status of the derivative at endpoints of the domain of f, and in other special circumstances, is clarified
by the following definitions.


## Page 84

CHAPTER 4  Derivatives 73
The right-hand derivative of f(x) at x = x0 is defined as
00
0 0
() ( )( ) lim
h
fx h fxfx h
+ →+
+−′ =  (5)
if this limit exists. Note that in this case h(= Δx) is restricted only to positive values as it approaches zero.
Similarly, the left-hand derivative of f(x) at x = x0 is defined as
00
0 0
() ( )() l i m
h
fx h fxfx h
− →−
+−′ =  (6)
if this limit exists. In this case h is restricted to negative values as it approaches zero.
A function f has a derivative at x = x0 if and only if f ′+(x0) = f ′–(x0).
Differentiability in an Interval
If a function has a derivative at all points of an interval, it is said to be differentiable in the interval. In par-
ticular, if f is defined in the closed interval a < x < b—i.e. [a, b]—then f is differentiable in the interval if
and only if f ′(x0) exists for each x0 such that a < x0 < b and if both f ′+(a) and f ′– (b) exist.
If a function has a continuous derivative, it is sometimes called continuously differentiable.
Piecewise Differentiability
A function is called piecewise differentiable or piecewise smooth in an interval a< x < b if f′(x) is piecewise
continuous. An example of a piecewise continuous function is shown graphically on Page 47.
An equation for the tangent line to the curve y = f(x) at the point where x = x0 is given by
 y  – f(x0) = f ′(x0)(x – x0) (7)
The fact that a function can be continuous at a point and yet not be differentiable there is shown graphi-
cally in Figure 4.3. In this case there are two tangent lines at P, represented by PM and PN. PN. The slopes
of these tangent lines are f ′–(x0) and f ′+ (x0), respectively.
Differentials
Let Δx = dx be an increment given to x. Then
 Δ y = f (x + Δx) – f (x) (8)
is called the increment in y = f (x). If f (x) is continuous and has a continuous first derivative in an interval,
then
 Δ y = f ′(x)Δx + /H9280Δx = f′(x)dx + dx (9)
where /H9280→ 0 as Δx → 0. The expression
 d y = f ′(x)dx (10)
is called the differential of y or f (x) or the principal part of Δy. Note that Δy /HS11005dy, in general. However, if
Δx = dx is small, then dy is a close approximation of Δy  (see Problem 4.11). The quantities dx (called the
differ
ential of x) and dy need not be small.
Because of the definitions given by Equations (8) and (10), we often write
00
() ( )( ) lim lim
xx
dy f x x f x yfxdx x xΔ→ Δ→
+Δ − Δ′== =ΔΔ
 (11)


## Page 85

CHAPTER 4  Derivatives74
It is emphasized that dx and dy are not the limits of Δx and Δy as Δ x →  0, since these limits are zero, whereas
dx and dy are not necessarily zero. Instead, given dx, we determine dy from Equation (10); i.e., dy is a de-
pendent variable determined from the independent variable dx for a given x.
Geometrically, dy is represented in Figure 4.1, for the particular value x = x 0 by the line segment SR,
whereas Δy is represented by QR.
The geometric interpretation of the derivative as the slope of the tangent line to a curve at one of its points
is fundamental to its application. Also of importance is its use as representative of instantaneous velocity in
the construction of physical models. In particular, this physical viewpoint may be used to introduce the notion
of differentials.
Newton’s second and first laws of motion imply that the path of an object is determined by the forces
acting on it and that, if those forces suddenly disappear, the object takes on the tangential direction of the
path at the point of release. Thus, the nature of the path in a small neighborhood of the point of release be-
comes of interest. With this thought in mind, consider the following idea.
Suppose the graph of a function f is represented by y = f(x). Let x = x
0 be a domain value at which f′ exists
(i.e., the function is differentiable at that value). Construct a new linear function
dy = f ′(x0) dx
with dx as the (independent) domain variable and dy the range variable generated by this rule. This linear
function has the graphical interpretation illustrated in Figure 4.4.
Figure 4.4
That is, a coordinate system may be constructed with its origin at P 0 and the dx- and dy-axes parallel to
the x- and y-axes, respectively. In this system our linear equation is the equation of the tangent line to the
graph at P0. It is representative of the path in a small neighborhood of the point, and if the path is that of an
object, the linear equation represents its new path when all forces are released.
dx and dy are called differentials of x and y, respectively. Because the preceding linear equation is valid
at every point in the domain of f at which the function has a derivative, the subscript may be dropped and we
can write
dy = f ′(x)dx
The following important observations should be made.
00
() ( )( ) lim lim ,
xx
dy f x x f x yfxdx x xΔ→ Δ→
+Δ − Δ′== =ΔΔ
thus dy
dx is not the same thing as .y
x
Δ
Δ
On the other hand, dy and Δy are related. In particular,
0
lim ( )
x
y fxxΔ→
Δ ′=Δ means that for any /H9280 > 0 there
exists δ > 0 such that yd y
xd xεε Δ−< − <Δ  whenever ⏐Δx⏐ < δ. Now dx is an independent variable and the
axes of x and dx are parallel; therefore, dx may be chosen equal to Δx. With this choice,
–εΔx < Δy – dy < εΔx


## Page 86

CHAPTER 4  Derivatives 75
or
dy – εΔx < Δy < dy + εΔx
From this relation we see that dy is an approximation to Δy in small neighborhoods of x, dy is called the
principal part of Δy.
The representation of f′ by dy
dx  has an algebraic suggestiveness that is very appealing and appears in much
of what follows. In fact, this notation was introduced by Leibniz (without the justification provided by knowl-
edge of the limit idea) and was the primary reason his approach to the calculus, rather than Newton’s, was
followed.
The Differentiation of Composite Functions
Many functions are a composition of simpler ones. For example, if f and g have the rules of correspondence u
= x3 and y = sin u, respectively, then y = sin x3 is the rule for a composite function F = g(f). The domain of F
is that subset of the domain of F whose corresponding range values are in the domain of g. The rule of com-
posite function differentiation is called the chain rule and is represented by [ ( ) ( ) ( )].dy dy du Fx g u f xdx du dx
′′ ′==
In the example,
3
32(sin ) cos (3 )dy d x xx d xdx dx≡=
The importance of the chain rule cannot be too greatly stressed. Its proper application is essential in the
differentiation of functions, and it plays a fundamental role in changing the variable of integration, as well
as in changing variables in mathematical models involving differential equations.
Implicit Differentiation
The rule of correspondence for a function may not be explicit. For example, the rule y = f (x) is implicit to
the equation x2 + 4xy 5 + 7xy + 8 = 0. Furthermore, there is no reason to believe that this equation can be
solved for y in terms of x. However, assuming a common domain (described by the independent variable x),
the left-hand member of the equation can be construed as a composition of functions and differentiated ac-
cordingly. (The rules for differentiation are listed here for your review.)
In this example, differentiation with respect to x yields
5424 5 7 0 dy dyxy x y y x dx dx
⎛⎞ ⎛ ⎞++ + + =⎜⎟ ⎜ ⎟⎝⎠ ⎝ ⎠
Observe that this equation can be solved for dy
dx  as a function of x and y (but not of x alone).
Rules for Differentiation
If f, g, and h are differentiable functions, the following differentiation rules are valid.
1. {() () } () () () ()dd dfx g x fx g x f x gxdx dx dx
′′+= + =+  (Addition rule)
2. {() () } () () () ()dd dfx g x fx g x f x gxdx dx dx
′′−= − =−
3. { ( )} ( ) ( ) where  is any constantdd Cf x C f x C f x Cdx dx
′==


## Page 87

CHAPTER 4  Derivatives76
4. {()() } () () () () () () () ()dd dfx g x fx g x g x fx fx gx g xf xdx dx dx
′′=+= +  (Product rule)
5. 22
() () () ()() () () () () if ( ) 0() [() ] [() ]
ddg x fx fx g xdf x g x f x f x g xdx dx gxdx g x gx gx
− ′′⎧⎫ −== ≠⎨⎬
⎩⎭
 (Quotient rule)
6. If y = f(u) where u = g(x), then
() {() } ()dy dy du du fu fg xgxdx du dx dx
′′ ′=⋅= =  (12)
Similarly, if y = f(u) where u = g(v) and v = h(x), then
dy dy du d
dx du d dx
υ
υ=⋅⋅   (13)
The results (12) and (13) are often called chain rules for differentiation of composite functions.
These rules probably are the most misused (or perhaps unused) rules in the application of the calculus.
7. If y = f (x) and x = f –1(y), then dy/dx and dx/dy are related by
1
/
dy
dx dx dy=  (14)
8. If x = f (t) and y = g(t), then
/( )
/( )
dy dy dt g t
dx dx dt f t
′== ′  (15)
Similar rules can be formulated for differentials. For example,
d{f (x) + g(x)} = df(x) + dg(x) = f ′(x)dx + g′(x)dx = {f′(x) + g′(x)}dx
d{f (x)g(x)} = f (x)dg(x) + df (x) = {f (x)g′(x) + g(x)f ′(x)}dx
Derivatives of Elementary Functions
In the following we assume that u is a differentiable function of x; if u = x, du/dx = 1. The inverse functions
are defined according to the principal values given in Chapter 3.
1. () 0d Cdx = 16. 1
2
1cot
1
dd uudx dxu
− =−
+
2. 1nndd uun udx dx
−= 17. 1
2
if 11sec if < 11
udd uu udx dxuu
− +>⎧=+ ⎨−−⎩−
3. sin cosdd uuudx dx= 18. 1
2
if 11csc if 11
udd u u udx dxuu
− −>⎧=+ ⎨+< −⎩−
4. cos sindd uuudx dx=− 19. sinh coshdd uuudx dx=
5. 2tan secdd uuudx dx= 20. cosh sinhdd uuudx dx=
6. 2cot cscdd uuudx dx=− 21. 2tanh secdd uuh udx dx=
7. sec sec tandd uuu udx dx= 22. 2coth cschdd uuudx dx=−


## Page 88

CHAPTER 4  Derivatives 77
8. csc csc cotdd uuu udx dx=− 23. sech sech tanhdd uuu udx dx=−
9. loglog 0, 1 a
a
edd uua adx u dx => ≠ 24. csch csch cothdd uuu udx dx=−
10. 1log lne
dd d u uudx dx u dx== 25. 1
2
1sinh
1
dd uudx dxu
− =
+
11. lnuudd uaaadx dx= 26. 1
2
1cosh
1
dd uudx dxu
− =
−
12. uudd ueedx dx = 27. 1
2
1tanh , | | 1
1
dd uuudx dxu
− =<
−
13. 1
2
1sin
1
dd uudx dxu
− =
−
28. 1
2
1coth , | | 1
1
dd uuudx dxu
− =>
−
14. 1
2
1cos
1
dd uudx dxu
− =−
−
29. 1
2
1sech
1
dd uudx dxuu
− =
−
15. 1
2
1tan
1
dd uudx dxu
− =
+
30. 1
2
1csch
1
dd uudx dxuu
− =−
+
Higher-Order Derivatives
If f (x) is differentiable in an interval, its derivative is given by f ′(x),y′ or dy/dx, where y = f(x). If f ′(x) is also
differentiable in the interval, its derivative is denoted by f ″(x), y″ or
2
2 .dd y d y
dx dx dx
⎛⎞ =⎜⎟⎝⎠
 Similarly, the nth de-
rivative of f(x), if it exists, is denoted by () ()() , o r ,
n
nn
n
dyfx y
dx
 where n is called the order of the derivative.
Thus, derivatives of the first, second, third, . . . orders are given by f′(x),f ″(x), f ′′′(x), . . . .
Computation of higher-order derivatives follows by repeated application of the differentiation rules given
here.
Mean Value Theorems
These theorems are fundamental to the rigorous establishment of numerous theorems and formulas. (See
Figure 4.5.)
Figure 4.5
1. Rolle’s theorem. If f (x) is continuous in [a, b] and differentiable in (a,b) and if f(a) = f(b) = 0, then
there exists a point ξ in (a, b) such that f ′(ξ) = 0.


## Page 89

CHAPTER 4  Derivatives78
Rolle’s theorem is employed in the proof of the mean value theorem. It then becomes a special case
of that theorem.
2. The mean value theorem. If f (x) is continuous in [a,b] and differentiable in (a,b), then there exists
a point ξ in (a, b) such that
() () ()fb fa fabba ξξ− ′=< <−  (16)
Rolle’s theorem is the special case of this where f(a) = f (b) = 0.
The result (16) can be written in various alternative forms; for example, if x and x 0 are in (a , b),
then
 f (x) = f(x0) + f ′(ξ)(x – x0) ξ between x0 and x (17)
We can also write result (16) with b = a + h, in which case ξ = a + θh, where 0 < θ < 1.
The mean value theorem is also called the law of the mean.
3. Cauchy’s generalized mean value theorem. If f (x) and g(x) are continuous in [a, b] and differen-
tiable in (a, b), then there exists a point ξ in (a, b) such that
() () ()
() () ()
fb fa f abgb ga g
ξ ξξ
′− =< <′−  (18)
where we assume g(a) /HS11005g(b) and f ′(x),g′(x) are not simultaneously zero. Note that the special case
g(x) = x yields (16).
L’Hospital’s Rules
If
0
lim
xx→
f(x) = A and
0
lim
xx→
g(x) = B, where A and B are either both zero or both infinite,
0
()lim ()xx
fx
gx→
 is often
called an indeterminate of the form 0/0 or /H11009//H11009, respectively, although such terminology is somewhat mis-
leading since there is usually nothing indeterminate involved. The following theorems, called L’Hospital’s
rules, facilitate evaluation of such limits.
1. If f (x) and g(x) are differentiable in the interval (a, b) except possibly at a point x
0 in this interval, and
if g′(x)/HS11005 0 for x/HS11005x0, then
00
() ()lim lim() ()xx xx
fx f x
gx g x→→
′= ′  (19)
 whenever the limit on the right can be found. In case f ′(x) and g′(x) satisfy the same conditions as f(x)
and g(x) given above, the process can be repeated.
2. If
0
lim
xx→
f (x) = /H11009 and
0
lim
xx→
g(x) = /H11009, the result (19) is also valid.
These can be extended to cases where x → /H11009 or –/H11009, and to cases where x0 = a or x 0 = b in which only
one-sided limits, such as x → a+ or x → b–, are involved.
Limits represented by the indeterminate forms 0 · /H11009,/H110090, 00, 1/H11009, and /H11009 – /H11009 can be evaluated on replacing
them by equivalent limits for which the aforementioned rules are applicable (see Problem 4.29).


## Page 90

CHAPTER 4  Derivatives 79
Applications
Relative Extrema and Points of Inflection
See Chapter 3, where relative extrema and points of inflection are described and a diagram is presented. In
this chapter such points are characterized by the variation of the tangent line and then by the derivative, which
represents the slope of that line.
Assume that f has a derivative at each point of an open interval and that P
1 is a point of the graph of f as-
sociated with this interval. Let a varying tangent line to the graph move from left to right through P1. If the
point is a relative minimum, then the tangent line rotates counterclockwise. The slope is negative to the left
of P
1 and positive to the right. At P1 the slope is zero. At a relative maximum a similar analysis can be made
except that the rotation is clockwise and the slope varies from positive to negative. Because f″ designates the
change of f ′, we can state the following theorem. (See Figure 4.6.)
Figure 4.6
Theorem Assume that x1 is a number in an open set of the domain of f at which f ′ is continuous and f ″ is
defined. If f ′(x1) = 0 and f ″(x1) /HS11005 0, then f(x1) is a relative extreme of f. Specifically:
(a) If f ″(x1) > 0, then f (x1) is a relative minimum.
(b) If f ″(x1) < 0, then f (x1) is a relative maximum.
(The domain value x1 is called a critical value.)
This theorem may be generalized in the following way. Assume existence and continuity of derivatives as
needed and suppose that f ′(x1) = f ″(x1) = . . . f (2p–1) (x1) = 0 and f (2p) (x1) /HS11005 0 (p a positive integer). Then:
(a) f has a relative minimum at x1 if f (2p) (x1) > 0.
(b) f has a relative maximum at x1 if f (2p) (x1) < 0.
(Notice that the order of differentiation in each succeeding case is two greater. The nature of the intermediate
possibilities is suggested in the next paragraph.)
It is possible that the slope of the tangent line to the graph of f is positive to the left of P
1, zero at the point,
and again positive to the right. Then P1 is called a point of inflection. In the simplest case this point of inflec-
tion is characterized by f ′(x1) = 0, f ″(x1) = 0, and f ′′′ (x1) /HS11005 0.
Particle Motion
The fundamental theories of modern physics are relativity, electromagnetism, and quantum mechanics. Yet
Newtonian physics must be studied because it is basic to many of the concepts in these other theories, and
because it is most easily applied to many of the circumstances found in everyday life. The simplest aspect of
Newtonian mechanics is called kinematics, or the geometry of motion. In this model of reality, objects are
idealized as points and their paths are represented by curves. In the simplest (one-dimensional) case, the
curve is a straight line, and it is the speeding up and slowing down of the object that is of importance. The
calculus applies to the study in the following way.
If x represents the distance of a particle from the origin and t signifies time, then x = f (t) designates the
position of a particle at time t. Instantaneous velocity (or speed in the one-dimensional case) is represented


## Page 91

CHAPTER 4  Derivatives80
by
0
()lim
t
dx f t t
dt tΔ→
+Δ= Δ  (the limiting case of the formula change in change in distance
change in time  in time for speed
when the motion is constant). Furthermore, the instantaneous change in velocity is called acceleration and
represented by
2
2
dx
dt
.
Path, velocity, and acceleration of a particle will be represented in three dimensions in Chapter 7, on vec-
tors.
Newton’s Method
It is difficult or impossible to solve algebraic equations of higher degree than two. In fact, it has been proved
that there are no general formulas representing the roots of algebraic equations of degree five and higher in
terms of radicals. However, the graph y = f(x) of an algebraic equation f(x) = 0 crosses the x axis at each single-
valued real root. Thus, by trial and error, consecutive integers can be found between which a root lies. Newton’s
method is a systematic way of using tangents to obtain a better approximation of a specific real root. The pro-
cedure is as follows. (See Figure 4.7.)
Figure 4.7
Suppose that f has as many derivatives as required. Let r be a real root of f (x) = 0; i.e., f(r) = 0. Let x0 be
a value of x near r—for example, the integer preceding or following r. Let f ′(x0) be the slope of the graph of
y = f (x) at P0[x0, f (x0)]. Let Q1(x1, 0) be the x-axis intercept of the tangent line at P0; then
0
0
0
0– ( ) ()–
fx fxxx =′
where the two representations of the slope of the tangent line have been equated. The solution of this relation
for x
1 is
0
10
0
()– ()
fxxx fx= ′
Starting with the tangent line to the graph at P1[x1, f(x1)] and repeating the process, we get
011
21 0
10 1
()() ()–– –() () ()
fxfx fxxx x fx fx fx== ′′ ′
and, in general,
0
0
()– ()
n
k
n
kk
fxxx fx=
= ′∑
Under appropriate circumstances, the approximation xn to the root r can be made as good as desired.
Note: Success with Newton’s method depends on the shape of the function’s graph in the neighborhood
of the root. There are various cases which have not been explored here.


## Page 92

CHAPTER 4  Derivatives 81
SOLVED PROBLEMS
Derivatives
4.1. (a) Let 3() , 3 .3–
xfx x x
+=≠  Evaluate f ′(2) from the definition.
00 0 0
(2 ) – (2) 1 5 1 6 6(2) lim lim – 5 lim lim 61– 1– 1–hh h h
fh f h hf hh h h h h→→ → →
⎛⎞++′= = = ⋅ = =⎜⎟⎝⎠
Note: By using rules of differentiation we find
22 2
(3 – ) (3 ) – (3 ) (3 – ) (3 – ) (1) – (3 ) (–1) 6()
(3 – ) (3 – ) (3 – )
ddxx xx xxdx dxfx
xx x
++ +′= = =
at all points x where the derivative exists. Putting x = 2, we find f′(2) = 6. Although such rules are often useful,
one must be careful not to apply them indiscriminately (see Problem 4.5).
(b) Let f(x) = 21x − . Evaluate f ′(5) from the definition.
00
00 0
92 – 3(5 ) – (5)(5) lim lim
92 – 3 92 3 92 – 9 2 1lim lim lim 392 3 ( 92 3 92 3
hh
hh h
hfh ff hh
hh h
h hh h h
→→
→→ →
++′= =
++ + +=⋅ = ==
++ ++ ++
By using rules of differentiation we find 1/2 –1/21( ) (2 – 1) (2 – 1) (2 – 1)2
ddfx x x xdx dx′= = =
–1/ 2(2 – 1) .x  Then 1/2 1(5) 9 . 3f −′ ==
4.2. (a) Show directly from definition that the derivative of f (x) = x3 is 3x2.
(b) Show from definition that 1).
2
d xdx x
=
(a) 33
32 2 2 3 2 2
() – ( ) 1 [( ) – ]
1 [3 3 ] – ] 33
fx h fx xh xhh
xx h x h h x xx h hh
+ =+
= +++ = + +
Then
2
0
() – ( )() l i m 3
h
fx h fxfx xh→
+′= =f ( f (f ′(
(b)
00
–() – ( )lim lim
hh
xh xfx h f x
hh→→
++ =f ( f (
The result follows by multiplying numerator and denominator by xh x+−  and then letting h →  0.
4.3. If f (x) has a derivative at x = x0, prove that f(x) must be continuous at x = x0.
00
00
() – ( )() – ( ) ,0fx h f xfx h f x h hh
++= ⋅ ≠ f ( f (
Then
00
00 000 0
() – ( )lim ( ) – ( ) lim lim ( ) 0 0
hh h
fx h fxfx h fx h f xh→→ →
++= ⋅ = ′ ⋅ =


## Page 93

CHAPTER 4  Derivatives82
since f ′(x0) exists by hypothesis. Thus,
0
lim
h→
f (x0 + h) – f (x0) = 0   or
0
lim
h→
f (x0 + h) = f (x0)
showing that f(x) is continuous at x = x0.
4.4. Let sin 1/ , 0() .0, 0
xx xfx x
≠⎧= ⎨ =⎩
(a) Is f(x) continuous at x = 0? (b) Does f(x) have a derivative at x = 0?
(a) By Problem 3.22(b), f (x) is continuous at x = 0.
(b)
00 0 0
(0 ) – (0) ( ) – (0) sin 1/ – 0 1(0) lim lim lim lim sin
hh h h
fh f f h f h hf hh h h→→ → →
+′= = = =
which does not exist.
This example shows that even though a function is continuous at a point, it need not have a derivative at
the point; i.e., the converse of the theorem in Problem 4.3 is not necessarily true.
It is possible to construct a function which is continuous at every point of an interval but has a derivative no-
where.
4.5. Let
2 sin 1/ , 0() .
0, 0
xx xfx
x
⎧ ≠⎪= ⎨ =⎪⎩
(a) Is f(x) differentiable at x = 0? (b) Is f ′(x) continuous at x = 0?
(a)
2
00 0
() – ( 0 ) s i n 1 / – 0 1(0) lim lim lim sin 0
hh h
fh f h hfh hhh→→ →
′= = = =
by Problem 3.13. Then f(x) has a derivative (is differentiable) at x = 0 and its value is 0.
(b) From elementary calculus differentiation rules, if x /HS11005 0,
22 2
2
2
11 1( ) sin sin sin ( )
11 1 1 1cos – sin (2 ) – cos 2 sin
dd dfx x x xdx x dx x x dx
xx xxx x x x
⎛ ⎞ ⎛⎞ ⎛⎞′ ==+ ⎜ ⎟ ⎜⎟ ⎜⎟⎝ ⎠ ⎝⎠ ⎝⎠
⎛⎞ ⎛ ⎞ ⎛ ⎞=+ = +⎜⎟ ⎜ ⎟ ⎜ ⎟⎝⎠ ⎝ ⎠ ⎝ ⎠
Since
00
11lim ( ) lim – cos 2 sin
xx
fx xxx→→
⎛⎞′= + ⎜⎟⎝⎠
 does not exist (because
0
lim
x →
 cos 1/x does not exist). f ′(x)
cannot be continuous at x = 0 in spite of the fact that f ′(0) exists.
This shows that we cannot calculate f ′(0) in this case by simply calculating f′(x) and and putting x = 0,
as is frequently supposed in elementary calculus. It is only when the derivative of a function is continuous at
a point that this procedure gives the right answer. This happens to be true for most functions arising in elemen-
tary calculus.
4.6. Present an “/H9280,δ” definition of the derivative of f(x) at x = x
0.
f(x) has a derivative f′(x0) at x = x0 if, given any /H9280 > 0, we can find δ > 0 such that
00
0
() – ( ) –() w h e n 0fx h fx fx hh εδ+ ′< < <


## Page 94

CHAPTER 4  Derivatives 83
Right- and left-hand derivatives
4.7. Let f (x) = ⏐x⏐. (a) Calculate the right-hand derivatives of f (x) at x = 0. (b) Calculate the left-hand derivative
of f (x) at x = 0. (c) Does f (x) have a derivative at x = 0? (d) Illustrate the conclusions in (a), (b), and (c)
from a graph.
(a) f ′+ 00 0
–0() – ( 0 )(0) lim lim lim 1
hh h
hfh f h
hh h→+ →+ →+
== = =
since ⏐h⏐ = –h for h > 0.
(b) f ′− 0– 0– 0–
–0() – ( 0 ) –(0) lim lim lim –1
hh h
hfh f h
hh h→→ →
== = =
since ⏐h⏐ = –h for h < 0.
(c) No. The derivative at 0 does not exist if the right- and left-
hand derivatives are unequal.
(d) The required graph is shown in Figure 4.8. Note that the
slopes of the lines y  = x  and y  = –x  are 1 and –1, respec-
tively, representing the right- and left-hand derivatives at
x = 0. However, the derivative at x = 0 does not exist.
4.8. Prove that f(x) = x2 is differentiable in 0 < x <  1.
Let x0 be any value such that 0 < x0 < 1. Then
22
00 0 0
0 0000 0
() – ( ) () –( ) lim lim lim (2 ) 2
hh h
fx h fx x h xfx x h xhh→→ →
++′= = = + =
At the endpoint x = 0,
f ′+
2
00 0
(0 ) – (0) – 0(0) lim lim lim 0
hh h
fh f h hhh→+ →+ →+
+== = =
At the end point x = 1,
f ′−
2
0– 0– 0–
(1 ) – (1) (1 ) – 1(1) lim lim lim (2 ) 2
hh h
fh f h hhh→→ →
++== = + =
Then f(x) is differentiable in 0 < x <  1. We may write f′(x) = 2x for any x in this interval. It is customary
to write f ′+ (0) = f ′(0) and f′−(1) = f ′(1) in this case.
4.9. Find an equation for the tangent line to y = x 2 at the point where (a) x = 1/3 and (b) x = 1.
(a) From Problem 4.8. f ′(x0) = 2x0 so that f ′(1/3) = 2/3. Then the equation of the tangent line is
00 0
12 1 2 1( ) ( )( ) or ( ). i.e., y = 93 3 3 9yf x f xxx y x x−= − − = − −
(b) As in part (a), y – f(1) = f ′(1)(x – 1) or y – 1 = 2(x – 1), i.e., y = 2x – 1.
Figure 4.8


## Page 95

CHAPTER 4  Derivatives84
Differentials
4.10. If y = f(x) = x3 – 6x, find (a) Δy, (b) dy, and (c) Δy – dy.
(a) Δy = f (x + Δx) – f (x)  = {(x + Δx)3 –6(x + Δx)} – {x3 – 6x}
= x3 + 3x2 Δx + 3x(Δx) 2 + (Δx)3 – 6x – 6Δx – x3 + 6x
= (3x2 – 6) Δx + 3x(Δx) 2 + (Δx)3
(b) dy = principal part of Δy = (3x2 – 6)Δx = (3x2 – 6)dx, since by definition Δx = dx.
Note that f ′(x) = 3x2 – 6 and dy = (3x2 – 6)dx, i.e.; dy/dx = 3x2 – 6. It must be emphasized that dy and dx
are not necessarily small.
(c) From (a) and (b), Δy – dy = 3x(Δx) 2 + (Δx)3 = /H9280Δx, where /H9280 = 3xΔx + (Δx)2.
Note that /H9280→ 0 as Δx → 0; i.e., – 0yd y
x
Δ →Δ
 as Δx → 0. Hence, Δy – dy is an infinitesimal of higher
order than Δx (see Problem 4.83).
In case Δx is small, dy and Δy are approximately equal.
4.11. Evaluate 3 25  approximately by use of differentials.
If Δx is small, Δy = f (x + Δx) – f (x) = f ′(x)Δx approximately.
Let f(x) = 3 x . Then 2/333 1
3xxx x x −+Δ − ≈ Δ  (where ≈ denotes approximately equal to).
If x = 27 and Δx = –2, we have
2/3333 127 2 27 (27) ( 2), i.e., 25 3 2 / 273
−−− ≈ − − ≈ −
Then 3 25 ≈ 3 – 2/27 or 2.926.
It is interesting to observe that (2.926)3 = 25.05, so the approximation is fairly good.
Differentiation rules: differentiation of elementary functions
4.12. Prove the formula {() () } () () () () ,dd dfxg x fx g x g x fxdx dx dx=+ , assuming f and g are differentiable.
By definition,
0
0
00
() () – ( ) ( ){() () } l i m
() { () – ( ) } ( ) { () – ( ) }lim
() – ( ) () – ( )lim ( ) lim ( )
() () () ()
x
x
xx
df x x g x x f x g xfxg xdx x
f x x g x x gx gx f x x f x
x
gx x gx f x x f xfx x g xxx
ddfx g x g x fxdx dx
Δ→
Δ→
Δ→ Δ→
+Δ +Δ= Δ
+Δ +Δ + +Δ= Δ
⎧⎫ ⎧ ⎫+Δ +Δ=+ Δ +⎨⎬ ⎨ ⎬ ΔΔ⎩⎭ ⎩ ⎭
=+
Another method:
Let u = f (x), υ = g(x). Then Δu = f (x + Δx) – f (x) and Δυ  = g(x + Δx) – g(x); i.e., f (x + Δx) = u + Δu,
g(x + Δx) = υ + Δυ. Thus,
00
0
() ( )lim lim
lim
xx
x
du u u u u uuvdx x x
uu d d uuu xx x d x d x
υυυ υ υ υ
υυ υυ υ
Δ→ Δ→
Δ→
+Δ +Δ − Δ + Δ +Δ Δ== ΔΔ
ΔΔ Δ⎛⎞=+ + Δ = +⎜⎟ ΔΔ Δ⎝⎠
where it is noted that Δυ → 0 as Δx → 0, since υ is supposed differentiable and thus continuous.


## Page 96

CHAPTER 4  Derivatives 85
4.13. If y = f(u) where u = g(x), prove that .dy dy du
dx du dx= , assuming that f and g are differentiable.
Let x be given an increment Δx /HS11005 0. Then, as a consequence, u and y take on increments Δu and Δy, re-
spectively, where
 Δ y = f(u + Δu) – f (u),   Δu = g(x + Δx) – g(x) (1)
Note that as Δx → 0, Δy → 0 and Δu → 0.
If Δu /HS11005 0, let us write yd y
ud u
Δ∈= −Δ
 so that /H9280→ 0 as Δu → 0 and
dyyu uduΔ= Δ+ ∈ Δ  (2)
If Δu = 0 for values of Δx, then Equation (1) shows that Δy = 0 for these values of Δx. For such cases, we
define /H9280 = 0.
It follows that in both cases. Δu /HS11005 0 or Δu = 0, Equation (2) holds. Dividing Equation (2) by Δx/HS11005 0 and
taking the limit as Δx → 0, we have
00 00 0
lim lim . lim lim lim
xx xx x
dy y dy u u dy u u
dx x du x x du x xΔ→ Δ→ Δ→ Δ→ Δ→
ΔΔ Δ Δ Δ ⎛⎞== + ∈ = + ∈ . ⎜⎟ΔΔ Δ Δ Δ ⎝⎠  (3)
0dy du
du dx=+ ⋅
du dy
dx du ⋅
du
dx
4.14. Given (sin ) cos and (cos ) sin ,dd xx x xdx dx== −  derive the following formulas:
(a) 2(tan ) secd xxdx =    (b) 1
2
1(sin )
1
d xdx x
− =
−
(a) 2
2
22
cos (sin ) sinsin(tan ) cos cos
(cos )(cos ) (sin )( sin ) 1
cos cos
ddxx xdd x dx dxxdx dx x x
xx x x xxx
−⎛⎞== ⎜⎟⎝⎠
−−== =
(b) If y = sin–1 x, then x = sin y. Taking the derivative with respect to x,
22
11 11 cos or cos 1s i n 1
dy dyy dx dx y yx
== = =
−−
We have supposed here that the principal value –π/2 <  sin–1 x < π/2 is chosen so that cos y is positive,
thus accounting for our writing cos y = 21s i n y−  rather than cos y = ± 21s i n y− .
4.15. Derive the formula log(log ) ( 0, 1), a
a
edd u ua adx u dx => ≠  where u is a differentiable function of x.
Consider y = f(u) = logau. By definition,
00
/
00
log ( ) log() ( )lim lim
11lim log lim log 1
aa
uu
uu
aauu
uu udy f u u f u
du u u
uu u
uu u u
Δ→ Δ→
Δ
Δ→ Δ→
+Δ −+Δ −== ΔΔ
+Δ Δ⎛⎞ ⎛ ⎞== + ⎜⎟ ⎜ ⎟Δ ⎝⎠ ⎝ ⎠
Since the logarithm is a continuous function, this can be written


## Page 97

CHAPTER 4  Derivatives86
/
0
11log lim 1 log
uu
aa u
u euu u
Δ
Δ→
⎧⎫ Δ⎪⎪ ⎛⎞+=⎨⎬ ⎜⎟⎝⎠⎪⎪⎩⎭
by Problem 2.19, with x = u/Δu.
Then by Problem 4.13, log(log ) . a
a
edd u udx u dx=
4.16. Calculate dy/dx if (a) xy3 – 3x2 = xy + 5 and (b) exy + y ln x = cos 2x.
(a) Differentiate with respect to x, considering y as a function of x. (We sometimes say that y is an implicit
function of x, since we cannot solve explicitly for y in terms of x.) Then
22 2 3( ) (3 ) ( ) (5) or ( )(3 ') ( )(1) 6 ( )( ') ( )(1) 0ddd dxy x xy x y y y x x y ydx dx dx dx−= + + − = + + y′y′
where y′ = dy/dx. Solving,
y′ = (6x – y3 + y)/(3xy2 – x)
(b) ( ) ( In) (cos2 ). ( ' ) (In ) ' 2sin 2 .xy xydd d yeu x e x y y x y xdx dx dx x+= + + + = − y′xy′
Solving,
y′ 2
2s i n 2
In
xy
xy
x x xye y
xe x x
++=− +
4.17. If y = cosh(x2 – 3x + 1), find (a) dy/dx and (b) d2y/dx2.
(a) Let y = cosh u, where u = x2 – 3x + 1. Then dy/dx = sinh u, du/dx = 2x – 3, and
2. (sinh )(2 3) (2 3)sinh( 3 1)dy dy du ux x x xdx du dx== − = − − +
(b)
222
22 sinh sinh coshd y d dy d du d u du uu udx dx dx dx dxdx dx
⎛⎞ ⎛ ⎞ ⎛⎞== = +⎜⎟ ⎜ ⎟ ⎜⎟⎝⎠ ⎝ ⎠ ⎝⎠
 = (sinh u)(2) + (cosh u)(2x – 3)2 = 2 sinh(x2 – 3x + 1) + (2x – 3)2 cosh(x2 – 3x + 1)
4.18. If x2y + y3 = 2, find (a) y′ and (b) y″ at the point (1, 1).
(a) Differentiating with respect to x, x2y′ + 2xy + 3y2y′ = 0 and
y′ 22
21 at (1,1)23
xy
xx y
−== − +
(b) y″
22
22 22 2
2 ( 3 )(2 ' 2 ) (2 )(2 6 ')(' )
3( 3 )
d d xy x y xy y xy x yyydx dx xy xy
−+ + − +⎛⎞== = − ⎜⎟ ++⎝⎠
y′ xy′ yy′
Substituting x = 1, y = 1, and y′ = –1
2
, we find y″ = – 3
8
.
Mean value theorems
4.19. Prove Rolle’s theorem.
Case 1: f(x) ≡ 0 in [a, b]. Then f ′(x) = 0 for all x in (a,b).
Case 2: f(x) ≡/  0 in [a, b]. Since f (x) is continuous, there are points at which f (x) attains its maximum and
minimum values, denoted by M and m, respectively (see Problem 3.34).
Since f(x) ≡/  0, at least one of the values M, m is not zero. Suppose, for example, M ≡/  0 and that f (ξ) =
M (see Figure 4.9). For this case, f(ξ + h) < f (ξ).


## Page 98

CHAPTER 4  Derivatives 87
Figure 4.9
() ( )If 0, then 0 andfh fh h
ξξ+−>≤
0
() ( )lim 0
h
fh f
h
ξξ
→+
+− ≤  (1)
() ( )If 0, then 0 andfh fh h
ξξ+−<>
0
() ( )lim 0
h
fh f
h
ξξ
→−
+− >  (2)
But, by hypothesis, f(x) has a derivative at all points in ( a, b). Then the right-hand derivative ( 1) must
be equal to the left-hand derivative ( 2). This can happen only if they are both equal to zero, in which case
f ′(ξ) = 0 as required.
A similar argument can be used in case M = 0 and m /HS11005 0.
4.20. Prove the mean value theorem.
Define () ()() () () ( ) . fb faFx f x fa x a ba
−=−− − −Then f(a) = 0 and f(b) = 0.
Also, if f (x) satisfies the conditions on continuity and differentiability specified in Rolle’s theorem, then
F(x) satisfies them also.
Then, applying Rolle’s theorem to the function F(x), we obtain
F′(ξ) = f ′ () ()( ) 0, orfb fa abbaξξ −−= < < − f ′(ξ) () () ,fb fa abba ξ−=< <−
4.21. Verify the mean value theorem for f (x) = 2x2 – 7x + 10, a = 2, b = 5.
f(2) = 4, f(5) = 25, f ′(ξ) = 4ξ – 7. Then the mean value theorem states that 4ξ – 7 = (25 – 4)/(5 – 2) or ξ =
3.5. Since 2 < ξ < 5, the theorem is verified.
4.22. If f ′(x) = 0 at all points of the interval (a,b), prove that f(x) must be a constant in the interval.
Let x1 < x2 be any two different points in (a, b). By the mean value theorem for x1 < ξ < x2,
2
1
22
() ( )fx fx
xx
− =−
f ′(ξ) = 0
Thus f(x1) = f (x2) = constant. From this it follows that if two functions have the same derivative at all points
of (a, b), the functions can differ only by a constant.
4.23. If f ′(x) > 0 at all points of the interval (a,b), prove that f(x) is strictly increasing.
Let x1 < x2 be any two different points in (a, b). By the mean value theorem for x1 < ξ < x2,


## Page 99

CHAPTER 4  Derivatives88
21
21
() () () 0fx fx fxx ξ− ′=>−
Then f (x2) > f (x1) for x2 > x1, and so f (x) is strictly increasing.
4.24. (a) 11
22Pr ove that tan tan if .11
ba baba a bba
−−−− <−< <++
(b) 134 1Show that tan .42 5 346
ππ −+< < +
(a) Let f(x) = tan–1x. Since f ′(x) = 1/(1 + x2) and f ′(ξ) = 1/(1 + ξ 2 ), we have by the mean value theorem
11
2
tan tan 1
1
ba abba ξξ
−− − =< <− +
Since ξ > a, 1/(1 + ξ2) < 1/(1 + a2). Since ξ < b, 1/(1 + ξ2) > 1/(1 + b2). Then
11
22
1t a n t a n 1
11
ba
baba
−− −<< −++
and the required result follows on multiplying by b – a.
(b) Let b = 4/3 and a = 1 in the result of (a). Then, since tan+ 1 = π/4, we have
11 134 1 34 1tan tan 1 or tan2 5 3 6 42 5 346
ππ−− −<− < + << +
4.25. Prove Cauchy’s generalized mean value theorem.
Consider G(x) = f(x) – f(a) – α{g(x) – g(a)}, where α is a constant. Then G(x) satisfies the conditions of
Rolle’s theorem, provided f(x) and g(x) satisfy the continuity and differentiability conditions of Rolle’s theo-
rem and if G(a) = G(b) = 0. Both latter conditions are satisfied if the constant α= () ()
() ()
fb fa
gb ga
−
−
.
Applying Rolle’s theorem, G′(ξ) = 0 for a < ξ < b, we have
() () ()() () 0 o r ,() () ()
ff b f afa g abgg b g a
ξξξ ξξ
′ −′′ −= = < < ′ −
as required.
L’Hospital’s rule
4.26. Prove L’Hospital’s rule for the case of the “indeterminate forms” (a) 0/0 and (b) /H11009//H11009.
(a) We shall suppose that f (x) and g(x) are differentiable in a < x < b and f(x0) = 0, g(x0) = 0, where a < x0 < b.
By Cauchy’s generalized mean value theorem (Problem 4.25),
0
0
0
() ( )() ()
() () ( ) ()
fx fxfx f xxgx gx gx g
ξ ξξ
′−== < < ′−
Then
00 0
() () ()lim lim lim() () ()xx xx xx
fx f f x Lgx g g x
ξ
ξ→+ →+ →+
′′=== ′′
since as x → x0+, ξ→x 0+.
Modification of this procedure can be used to establish the result if x→ x0 –, x → x0, x → /H11009, or x →  –/H11009.
(b) We suppose that f(x) and g(x) are differentiable in a < x < b, and
0
lim
xx→+
f (x) = /H11009,
0
lim
xx→+
g(x) = /H11009 where
a < x0 < b.


## Page 100

CHAPTER 4  Derivatives 89
Assume x1 is such that a < x0 < x < x1 < b. By Cauchy’s generalized mean value theorem,
1
1
1
() ( ) ()
() ( ) ()
fx fx f xxgx gx g
ξ ξξ
′− =< <′−
Hence,
11
11
() ( ) 1 ( ) / () () ()
() ( ) () 1 ( ) / () ()
fx fx fx fxfx f
gx gx gx gx gx g
ξ
ξ
′−− =⋅ = ′−−
from which we see that
()
()
fx
gx = ()
()
f
g
ξ
ξ
′
′
1
1
1( ) / ( )
1( ) / ( )
gx gx
fx fx
−⋅ −
 (1)
Let us now suppose that
0
()lim ()xx
fx Lgx→+
′ =′  and write Equation (1) as
11
11
1( ) / ( ) 1( ) / ( )() ()
() () 1 ( ) /() 1 ( ) /()
gx gx gx gxfx f LLg x gx fx fx fx fx
ξ′ −−⎛⎞ ⎛⎞⎛⎞=− +⎜⎟ ⎜⎟⎜⎟ ′ −−⎝⎠ ⎝⎠ ⎝⎠
 (2)
We can choose x1 so close to x0 that ⏐f ′(ξ)/g′(ξ) – L⏐ < /H9280. Keeping x1 fixed, we see that
0
1
1
1( ) / ( )lim 11( ) / ( )xx
gx gx
fx fx→+
−⎛⎞ =⎜⎟−⎝⎠
 since l
0
lim
xx→+
f (x)1 = /H11009 and
0
lim
xx→+
g(x) = /H11009
Then taking the limit as x → x0+ on both sides of (2), we see that, as required,
00
() ()lim lim() ()xx xx
fx f x Lgx g x→+ →+
′== ′
Appropriate modifications of this procedure establish the result if x → x0 –, x → x0, x → /H11009, or x→ –/H11009.
4.27. Evaluate (a)
2
0
1lim
x
x
e
x→
− and (b) 21
1c o slim 21x
x
xx
π
→
+
−+
.
All of these have the “indeterminate form” 0/0.
(a)
22
00
12lim lim 2 1
xx
xx
ee
x→→
− ==
(b)
22
211 1
1 cos sin coslim lim lim22 2 221xx x
xx x
xxx
ππ π π π π
→→ →
+− − + == = −−+
Note: Here L’Hospital’s rule is applied twice, since the first application again yields the “indeterminate
form” 0/0 and the conditions for L’Hospital’s rule are satisfied once more.
4.28. Evaluate (a)
2
2
35lim
56 3x
xx
xx→∞
−+
−−
 and (b) 2lim x
x
xe −
→∞
.
All of these have or can be arranged to have the “indeterminate form” /H11009//H11009.
(a)
2
2
35 6 1 6 3lim lim lim10 6 10 556 3xx x
xx x
xxx→∞ →∞ →∞
−+ − == = +−−
(b)
2
2 22lim lim lim lim 0x
xxxxx x x
xxxe eee
−
→∞ →∞ →∞ →∞
== = =
4.29. Evaluate
0
lim
x→+
x2 ln x.
2
2
300 00
In 1/lim In lim lim lim 0 212 /2xx x x
xx xxx = /x x→+ →+ →+→+
−== −
The given limit has the “indeterminate form” 0 · /H11009. In the second step the form is altered so as to give the
indeterminate form /H11009//H11009, and L’Hospital’s rule is then applied.


## Page 101

CHAPTER 4  Derivatives90
4.30. Find
2
1/
0
lim (cos ) x
x
x
→
.
Since
0
lim
x→
 cos x = 1 and
0
lim
x→
1/x2 = /H11009, the limit takes the “indeterminate form” 1/H11009.
Let F(x) = (cos x)1/x2. Then ln F(x) = (ln cos x)/x2, to which L’Hospital’s rule can be applied. We have
200 0 0
In cos ( sin )/(cos ) sin cos 1lim lim lim lim .2 2 cos 2 sin 2 cos 2xx x x
xx x x x
xx x x x xx→→ → →
−− −== = = −−+
Thus,
0
1lim ln ( ) . 2x
Fx
→
=−  But since the logarithm is a continuous function,
00
lim ln ( ) ln(lim ( )).
xx
Fx Fx
→→
=
Then
21/ 1/2
00 0
1ln(lim ( )) or lim ( ) lim (cos )2
x
xx x
Fx Fx x e −
→→ →
=− = =
4.31. If F(x) = (e3x – 5x)1/x, find (a)
0
lim
x→
F(x) and (b)
0
lim
x→
F(x).
The respective indeterminate forms in (a) and (b) are /H110090 and 1/H11009.
Let G(x) = ln
3(( 5 )() .
xIn e xFx x
−= ln  Then lim
x→∞
G(x) and
0
lim
x→
G(x) assume the indeterminate forms
/H11009//H11009 and 0/0, respectively, and L’Hospital’s rule applies. We have
(a)
33 3 3
33 300
In( 5 ) 3 5 9 27lim lim lim lim 353 5 9
xx x x
xx xxx x x
ex e e e
x ex e e→→ ∞ → → ∞
−− === = −−
ln
Then, as in Problem 4.30, lim
x→∞
 (e3x – 5x)1/x = e3.
(b)
33
300
In ( 5 ) 3 5lim lim 5
xx
xxx
ex e
x ex→→
−− == −
ln –2
4.32. Suppose the equation of motion of a particle is x = sin(c 1t + c2), where c1 and c2 are constants (simple
harmonic motion). (a) Show that the acceleration of the particle is proportional to its distance from the
origin. (b) If c1 = 1, c2 = π, and t ≥ 0, determine the velocity and acceleration at the endpoints and at the
midpoint of the motion.
(a)
2
22
11 2 11 2 1 2cos( ), sin( )dx d xc c tc c c tc c xdt dt+= + = −
This relation demonstrates the proportionality of acceleration and distance.
(b) The motion starts at 0 and moves to –1. Then it oscillates between this value and 1. The absolute value of
the velocity is zero at the endpoints, and that of the acceleration is maximum there. The particle coasts
through the origin (zero acceleration), while the absolute value of the velocity is maximum there.
4.33. Use Newton’s method to determine
3  to three decimal points of accuracy.
3  is a solution of x 2 – 3 = 0, which lies between 1 and 2. Consider f (x) = x2 – 3, then f ′(x) = 2x. The
graph of f crosses the x axis between 1 and 2. Let x 0 = 2. Then f (x0) = 1 and f ′(x0) = 1.75. According to the
Newton formula, 0
10
0
() 2 .25 1.75.()
fxxx fx=− = − = ′
Then 1
21
1
() 1.732.()
fxxx fx=− = ′  To verify the three-decimal-point accuracy, note that (1.732)2 = 2.9998
and (1.7333)2 = 3.0033.


## Page 102

CHAPTER 4  Derivatives 91
Miscellaneous problems
4.34. If x = g(t) and y = f (t) are twice differentiable, find (a) dy/dx and (b) d2y/dx2.
(a) Letting primes denote derivatives with respect to t, we have
/( ) () 0/( )
dy dy dt f t if g tdx dx dt g t
′ ′== ≠ ′
(b)
[] []
2
2
23
() ()
() ()()
() / ()
1( ) ( ) ( ) ( ) ( ) ( ) ( ) ( ) () 0() () ()
nn
df t df t
dt g t dt g tdy d d y d f t
dx dx dx g t dx dt g tdx
g t f t ft gt gt f t ft gt if g tgt gt gt
′′⎛⎞⎛⎞
⎜⎟⎜⎟′′′⎛⎞ ⎛ ⎞ ⎝⎠⎝⎠== =⎜⎟ ⎜⎟ ′′⎝⎠ ⎝⎠
⎧⎫ ′′ ′ ′ ′ ′ ′ ′−−⎪⎪ ′==≠ ⎨⎬′ ′′⎪⎪⎩⎭
4.35. Let
1/ 2 ,0() .
0, 0
xexfx
x
−⎧ ≠= ⎨ ≠⎩
 Prove that (a) f ′(0) = 0 and (b) f″(0) = 0.
(a)
221/ 1/
00 0
() ( 0 ) 0'(0) lim lim lim
hh
hh h
fh f e ef hh h
−−
+→ + → + → +
−−== =
If h = 1/u, using L’Hospital’s rule this limit equals
22 2
lim lim / lim 1/2 0uu u
uu u
ue u e ue−
→∞ →∞ →∞
== =
Similarly, replacing h → 0+ by h → 0– and u → /H11009 by u→ – /H11009, we find f′–(0) = 0. Thus, f′+(0) = f ′–(0) = 0,
and so f ′(0) = 0.
(b)
22
2
1/ 3 1/ 4
00 0
() ( 0 ) 2 0 2 2(0) lim lim lim lim 0
hh
uhh h u
fh f e h e uf hh h e
−− −
+ →+ →+ →+ → ∞
′′ −⋅ −′′ == = = =
by successive applications of L’Hospital’s rule.
Similarly, f ″–(0) = 0 and so f ″(0) = 0.
In general, f (n)(0) = 0 for n = 1,2,3, . . .
4.36. Find the length of the longest ladder which can be carried around the
corner of a corridor whose dimensions are indicated in Figure 4.10, if
it is assumed that the ladder is carried parallel to the floor.
The length of the longest ladder is the same as the shortest
straight-line segment AB (Figure 4.10), which touches both outer walls
and the corner formed by the inner walls.
As seen from Figure 4.10, the length of the ladder AB is L = a sec
θ + b csc θ.
L is a minimum when dL/dθ = a sec θ tan θ – b csc θ cot θ = 0;
i.e., asin3 θ = b cos 3 θ or tanθ = 3 /ba . Then
2/3 2/3
1/3sec ab
a
θ += &2/3a
and
2/3 2/3
1/3cos ab
b
θ += so that L = a secθ + b cscθ = (a2/3 + b2/3)3/2.
Although it is geometrically evident that this gives the minimum length, we can prove this analytically by
showing that d 2L/dθ 2 for θ = tan–1 3 /ba  is positive (see Problem 4.78).
Figure 4.10


## Page 103

CHAPTER 4  Derivatives92
SUPPLEMENTARY PROBLEMS
Derivatives
4.37. Use the definition to compute the derivatives of each of the following functions at the indicated point: (a) (3x
– 4)/(2x +3), x = 1, (b) x3 – 3x2 + 2x – 5, x = 2, (c) ,x x = 4, and (d) 3 64 ,x − x = 2.
Ans.  (a) 17/25, (b) 2, (c) 1
4
, (d) 1
2
4.38. Show from definition that (a) 43 4d xxdx = and (b) 2
36 ,33 (3 )
dx xdx x x
+ =≠− −
.
4.39. Let f(x) =
3 sin1/ , 0
0, 0
xx x
x
⎧ ≠
⎨ =⎩
 Prove that (a) f(x) is continuous at x = 0. (b) f (x) has a derivative at x = 0,
and (c) f ′(x) is continuous at x = 0.
4.40. Let f(x) =
21/ ,0 .
0, 0
xxe x
x
−⎧ ≠⎪⎨ =⎪⎩
 Determine whether f(x) (a) is is continuous at x = 0, and (b) has a derivative at
x = 0.
Ans. (a) Yes (b) Yes, 0
4.41. Give an alternative proof of the theorem in Problem 4.3, using “/H9280,δ” definitions.
4.42. If f (x) = ex, show that f ′(x0) = ex0 depends on the result
0
lim( 1) / 1.h
h
eh
→
−=
4.43. Use the results
00
lim(sin ) / 1. lim(1 cos ) / 0
hh
hh hh
→→
=− =  to prove that if f(x) = sin x, f ′(x0) = cosx0.
Right-and left-hand derivatives
4.44. Let f(x) = x⏐x⏐. (a) Calculate the right-hand derivative of f (x) at x = 0. (b) Calculate the left-hand derivative
of f (x) at x = 0. (c) Does f (x) have a derivative at x = 0? (d) Illustrate the conclusions in (a), (b), and (c) from
a graph.
Ans. (a) 0 (b) 0 (c) Yes, 0
4.45. Discuss the (a) continuity and (b) differentiability of f (x) = xp sin 1/x, f (0) = 0, where p is any positive
number. What happens in case p is any real number?
4.46. Let f(x) = 2
23 , 0 2
.3, 2 4
xx
xx
−< <⎧⎪⎨ −< <⎪⎩
 Discuss the (a) continuity and (b) differentiability of f(x) in 0 < x <  4.
4.47. Prove that the derivative of f (x) at x = x0 exists if and only if f ′+ (x0) = f ′– (x0).
4.48. (a) Prove that f (x) = x3 – x2 + + 5x – 6 is differentiable in a < x < b, where a and b are any constants.
(b) Find equations for the tangent lines to the curve y = x3 – x2 + 5x – 6 at x = 0 and x = 1. Illustrate by
means of a graph. (c) Determine the point of intersection of the tangent lines in (b). (d) Find f ′(x),f ″(x),
f ′′′(x), f (IV)(x), . . .


## Page 104

CHAPTER 4  Derivatives 93
Ans. (b) y = 5x – 6, y = 6x – 7 (c) (1, – 1) (d) 3x2 – 2x + 5, 6x – 2, 6, 0, 0, 0, . . .
4.49. If f (x) = x2⏐x⏐, discuss the existence of successive derivatives of f (x) at x = 0.
Differentials
4.50. If y = f(x) = x + 1/x, find (a) Δy, (b) dy, (c) Δy – dy, (d) (Δy – dy)/Δx, and (e) dy/dx.
Ans. (a)
()
xx xx x
ΔΔ− +Δ
 (b) 2
11 x
x
⎛⎞−Δ⎜⎟⎝⎠
 (c)
2
2
()
()
x
xx x
Δ
+Δ
 (d) 2 ()
x
xx x
Δ
+Δ
 (e) 2
11 x−
Note: Δx = dx.
4.51. If f (x) = x2 + 3x, find (a) Δy, (b) dy, (c) Δy/Δx, (d) dy/ dx, and (e) (Δy – dy)/Δx, if x = 1 and Δx = .01.
Ans. (a) .0501, (b) .05, (c) 5.01, (d) 5, (e) .01
4.52. Using differentials, compute approximate values for each of the following: (a) sin 31º, (b) ln(1.12), (c) 5 36 .
Ans. (a) 0.515, (b) 0.12, (c) 2.0125
4.53. If y = sin x, evaluate (a) Δy and (b) dy. (c) Prove that (Δy – dy)/Δx → 0 as Δx → 0.
Differentiation rules and elementary functions
4.54. Prove the following:
(a) {}() () () ()dd dfx g x fx g xdx dx dx+= +
(b) {}() () () ( )dd dfx g x fx g xdx dx dx−= −
(c)
[]
2
() () () () () ,( ) 0 .() ()
df x g x f x f x g x gxdx g x gx
′′⎧⎫ −=≠⎨⎬
⎩⎭
2
4.55. Evaluate (a) atlnd
dx xx x x32 25−+(){} = 1 and (b) sid
dx nn( / .2 36 0xx+{} =π at
Ans. (a) 3ln4 (b) 3 32
4.56. Derive these formulas: (a) ln , 0, 1; csc csc cot ;uudd u d d uaaa a a u uudx dx dx dx=> ≠ = −  and
(c) 2tanh sec hdd uuudx dx=  where u is a differentiable function of x.
4.57. Compute (a) 1tan ,d xdx
− (b) 1csc ,d xdx
− (c) 1sinh ,d xdx
− and (d) 1coth ,d xdx
−  paying attention to the
use of principal values.
4.58. If y = xx, compute dy/dx. (Hint: Take logarithms before differentiating.)
Ans. xx(1 + ln x)


## Page 105

CHAPTER 4  Derivatives94
4.59. If y = {ln(3x + 2)}sin–1(2x+.5), find dy/dx at x = 0.
Ans. /621n 1n 2 (1n 2)41n 2 3
ππ⎛⎞ +⎜⎟⎝⎠
4.60. If y = f(u), where u = g(υ) and υ = h(x), prove that dy dy du dv
dx du dv dx=⋅ ⋅  assuming f, g, and h are differentiable.
4.61. Calculate (a) dy/dx and (b) d2 y/dx2 if xy – ln y = 1.
Ans. (a) y2/(1 – xy) (b) (3y3 – 2xy4)/(1 – xy)3, provided xy /HS11005 1
4.62. If y = tan x, prove that y′′′ = 2(1 + y2)(1 + 3y2).
4.63. If x = sec t and y = tan t, evaluate (a) dy/dx, (b) d2y/dx2, and (c) d3y/dx3, at t = π/4.
Ans. (a) 2 (b) –1 (c) 32
4.64. Prove that
322
22 ,dy dx d x
dydx dy
⎛⎞=− ⎜⎟⎝⎠
 stating precise conditions under which it holds.
4.65. Establish formulas (a) 7 and (b) 18 on Pages 73 and 78.
Mean value theorems
4.66. Let f(x) = 1 – (x – 1)2/3, 0 < x <  2. (a) Construct the graph of f (x). (b) Explain why Rolle’s theorem is not
applicable to this functions; i.e., there is no value ξ for which f ′(ξ) = 0, 0 < ξ < 2.
4.67. Verify Rolle’s theorem for f (x) = x2(1 – x)2, 0 < x <  1.
4.68. Prove that between any two real roots of e x sinx = 1 there is at least one real root of ex cos x = –1. (Hint:
Apply Rolle’s theorem to the function e–x – sin x.)
4.69. (a) If 0 < a < b, prove that (1 – a/b) < ln b/a < (b/a – 1). (b) Use the result of (a) to show that 11 ln 1.265< .
4.70. Prove that (π/6 + 3/ 1 5) < sin–1. 6 < (π/6 + 1/8) by using the mean value theorem.
4.71. Show that the function F(x) in Problem 4.20 represents the difference in ordinates of curve ACB  and line AB
at any point x in (a, b).
4.72. (a) If f ′(x) <  0 at all points of (a, b), prove that f(x) is monotonic decreasing in (a, b). (b) Under what
conditions is f (x) strictly decreasing in (a, b)?
4.73. (a) Prove that (sin x)/x is strictly decreasing in (0, π/2). (b) Prove that 0 <  sin x <  2x/π for 0 < x < π/2.
4.74. (a) Prove that sin sin cot ,cos cos
ba
ab ξ− =−
 where ξ is between a and b. (b) By placing a = 0 and b = x in (a),
show that ξ = x/2. Does the result hold if x < 0?


## Page 106

CHAPTER 4  Derivatives 95
L’Hospital’s Rule
4.75. Evaluate each of the following limits.
(a) 30
sinlim
x
xx
x→
−  (i)
0
lim (1/ csc )
x
xx
→
−
(b)
2
0
21lim cos3 2 cos2 cos
xe x
x
e
xx x→
−+
−+
 (j) sin
0
lim x
x
x
→
(c) 2
1
lim ( 1) tan / 2
x
xx π
→
−  (k) 22lim(1/ cot )
x
xx
→∞
−
(d) 32lim x
x
xe −
→∞
 (l)
11
0
tan sinlim (1 cos )x
xx
xx
−−
→
−
−
(e) 3
0
lim ln
x
xx
→+
 (m) 3lim 1n 3x
xx x→∞
⎛⎞ +
⎜⎟ −⎝⎠
(f)
0
lim (3 2 ) /xx
x
x
→
−  (n)
21/
0
sinlim
x
x
x
x→
⎛⎞
⎜⎟⎝⎠
(g) 2lim(1 3/ ) x
x
x
→∞
−  (o) 21 /lim( ) xx x
x
xe e
→∞
++
(h) 1/3lim(1 2 ) x
x
x
→∞
+  (p) 1/ln
0
lim (sin ) x
x
x
→+
Ans. (a) 1
6
 (b) –1 (c) –4/π (d) 0 (e) 0 (f) ln 3/2 (g) e–6 (h) 1 (i) 0 (j) 1 (k) 2
3
 (l) 1
3
 (m) 6 (n) e–1/6 (o) e2 (p) e
Miscellaneous problems
4.76. Prove that 1
1l n ( 1 ) 1i f 0 1 .1 sin
xx xx x−
−+ << < <+
4.77. If Δf (x) = f(x + Δx) – f (x), (a) prove that Δ{Δf (x)} = Δ2f (x) = f (x + 2Δx) – 2f (x + Δx) + f (x); (b) derive an
expression for Δnf(x) where n is any positive integer; and (c) show that ()
0
()lim ( )()
n
n
nx
fx fxxΔ→
Δ =Δ
 if this limit
exists.
4.78. Complete the analytic proof mentioned at the end of Problem 4.36.
4.79. Find the relative maximum and minima of f (x) = x2, x > 0.
Ans. f(x) has a relative minimum when x = e–1.
4.80. A train moves according to the rule x = 5t 3 + 30t, where t and x are measured in hours and miles,
respectively. (a) What is the acceleration after 1 minute? (b) What is the speed after 2 hours?
4.81. A stone thrown vertically upward has the law of motion x = –16t 2 + 96t. (Assume that the stone is at ground
level at t = 0, that t is measured in seconds, and that x is measured in feet.) (a) What is the height of the stone
at t = 2 seconds? (b) To what height does the stone rise? (c) What is the initial velocity, and what is the
maximum speed attained?
4.82. A particle travels with constant velocities υ 1 and υ2 in mediums I and II, respectively (see Figure 4.11). Show that
in order to go from point P to point Q in the least time, it must follow path PAQ where A is such that
(sin θ1)/(sinθ2) = υ1/υ2


## Page 107

CHAPTER 4  Derivatives96
Note: This is Snell’s law, a fundamental law of optics first discovered experimentally and then derived
mathematically.
4.83. A variable α is called an infinitesimal if it has zero as a limit. Given two
infinitesimals α and β, we say that α is an infinitesimal of higher order (or
the same order) if lim α/β = 0 (or lim α/β = l /HS11005 0). Prove that as x→ 0, (a)
sin22x and (1 – cos3x) are infinitesimals of the same order, and (b) (x3 –
sin3 x) is an infinitesimal of higher order than {x – ln(1 + x) – 1 + cos x}.
4.84. Why can we not use L’Hospital’s rule to prove that
2
0
sin1/lim 0sinx
xx
x→
=
(see Problem 3.91)?
4.85. Can we use L’Hospital’s rule to evaluate the limit of the sequence u n = n3e–n2, n = 1, 2, 3, . . . ? Explain.
4.86. (1) Determine decimal approximations with at least three places of accuracy for each of the following
irrational numbers: (a) 2 , (b) 5 , and (c) 71/3.
(2) The cubic equation x 3 – 3x2 + x – 4 = 0 has a root between 3 and 4. Use Newton’s method to determine it
to at least three places of accuracy.
4.87. Using successive applications of Newton’s method, obtain the positive root of (a) x 3 – 2x2 – 2x – 7 = 0 and
(b) 5 sin x = 4x to three decimal places.
Ans. (a) 3.268 (b) 1.131
4.88. If D denotes the operator d/dx so that Dy ≡ dy/dx while Dky ≡ dky/dxk, prove Leibniz’s formula
Dn(uυ) = (Dnu)υ + nC1(Dn–1u)(Dυ) + nC2(Dn–2u) (D2 υ) + . . . + nCr (Dn–ru)Dr υ + . . . + uDnυ
where nCr = ()
h
r  are the binomial coefficients (see Problem 1.95).
4.89. Prove that
n
n
d
dx
 (x2 sin x) = {x2 – n(n – 1)} sin(x + nπ/2) – 2nxcos(x + nπ/2).
4.90. If f ′(x0) = f ″(x0) = . . . = f (2n) (x0) = 0 but f (2n+1) (x0) /HS11005 0, discuss the behavior of f(x) in the neighborhood of
x = x0. The point x0 in such case is often called a point of inflection. This is a generalization of the previously
discussed case corresponding to n = 1.
4.91. Let f(x) be twice differentiable in (a, b) and suppose that f ′(a) = f′(b) = 0. Prove that there exists at least one
point ξ in (a, b) such that ⏐f ″(ξ)⏐ < 2
4
()ba−
 {f (b) – f (a)}. Give a physical interpretation involving the
velocity and acceleration of a particle.
Figure 4.11


## Page 108

97
Integrals
Introduction of the Definite Integral
The geometric problems that motivated the development of the integral calculus (determination of lengths,
areas, and volumes) arose in the ancient civilizations of northern Africa. Where solutions were found, they
related to concrete problems such as the measurement of a quantity of grain. Greek philosophers took a more
abstract approach. In fact, Eudoxus (around 400
B.C.) and Archimedes (250 B.C.) formulated ideas of integra-
tion as we know it today.
Integral calculus developed independently and without an obvious connection to differential calculus. The
calculus became a “whole” in the last part of the seventeenth century when Isaac Barrow, Isaac Newton, and
Gottfried Wilhelm Leibniz (with help from others) discovered that the integral of a function could be found
by asking what was differentiated to obtain that function.
The following introduction of integration is the usual one. It displays the concept geometrically and then
defines the integral in the nineteenth-century language of limits. This form of definition establishes the basis
for a wide variety of applications.
Consider the area of the region bound by y = f(x), the x axis, and the joining vertical segments (ordinates)
x = a and x = b. (See Figure 5.1.)
Figure 5.1
Subdivide the interval a < x < b into n subintervals by means of the points x1, x2, . . . , xn–1, chosen arbi-
trarily. In each of the new intervals (a,x1), (x1, x2), . . . , (xn–1, b) choose points ξ1, ξ2, . . . , ξn arbitrarily. Form
the sum
11 2 2 1 33 2 1() ( ) () ( ) () ( ) () ( ) nnfx a fx x fx x fb xξξ ξ ξ −−+ − + − ++ − L. . .  (1)
By writing x0 = a, xn = b, and xk – xk–1 = Δxk, this can be written
CHAPTER 5


## Page 109

CHAPTER 5  Integrals98
1
11
() ( ) ()
nn
kk k k k
kk
fx x f xξξ −
==
−= Δ∑∑  (2)
Geometrically, this sum represents the total area of all rectangles in Figure 5.1.
We now let the number of subdivisions n increase in such a way that each Δxk → 0. If, as a result, the sum
(1) or (2) approaches a limit which does not depend on the mode of subdivision, we denote this limit by
1
( ) lim ( )
nb
kka n k
fx d x f x ξ
→∞ =
=Δ ∑∫  (3)
This is called the definite integral of f(x) between a and b. In this symbol, f(x) dx is called the integrand and
[a, b] is called the range of integration. We call a and b the limits of integration, a being the lower limit of
integration and b the upper limit.
The limit (3) exists whenever f (x) is continuous (or piecewise continuous) in a < x < b (see Problem
5.31). When this limit exists we say that f is Riemann integrable or simply integrable in [a,b].
The definition of the definite integral as the limit of a sum was established by Cauchy around 1825. It was
named for Georg Friedrich Bernhard Riemann because he made extensive use of it in this 1850 exposition
of integration.
Geometrically, the value of this definite integral represents the area bounded by the curve y = f (x), the x
axis, and the ordinates at x = a and x = b only if f(x) >  0. If f(x) is sometimes positive and sometimes nega-
tive, the definite integral represents the algebraic sum of the areas above and below the x axis, treating areas
above the x axis as positive and areas below the x axis as negative.
Measure Zero
A set of points on the x axis is said to have measure zero if the sum of the lengths of intervals enclosing all
the points can be made arbitrarily small (less than any given positive number ε). We can show (see Problem
5.6) that any countable set of points on the real axis has measure zero. In particular, the set of rational num-
bers which is countable (see Problems 1.17 and 1.59), has measure zero.
An important theorem in the theory of Riemann integration is the following:
Theorem. If f (x) is bounded in [a, b], then a necessary and sufficient condition for the existence of ∫
b
a f (x)
dx is that the set of discontinuities of f (x) have measure zero.
Properties of Definite Integrals
If f (x) and g(x) are integrable in [a, b], then
1. {() () } () ()
bb b
aa a
f x g x dx f x dx g x dx±= ±∫∫ ∫
2. ()
b
a
Af x dx∫ ()
b
a
Af x d x= ∫ where  is any constantA
3. () () ()
bc b
aa c
fxd x fxd x fxd x=+∫∫∫ provided f (x) is integrable in [a, c] and [c, b]
4. () ()
ba
ab
fx d x fx d x=−∫∫
5. () 0
a
a
fx d x =∫
6. If in a < x < b, m < f (x) < M where m and M are constants, then () ( ) ( – )
b
a
mb a f x d x Mb a−≤ ≤ ∫
7. If in a < x < b, f (x) < g(x), then () ()
bb
aa
f x dx g x dx≤∫∫
8. () | () |
bb
aa
fx d x fx d x≤∫∫ if ab<


## Page 110

CHAPTER 5  Integrals 99
Mean Value Theorems for Integrals
As in differential calculus, the mean value theorems listed here are existence theorems. The first one gener-
alizes the idea of finding an arithmetic mean (i.e., an average value of a given set of values) to a continuous
function over an interval. The second mean value theorem is an extension of the first one, which defines a
weighted average of a continuous function.
By analogy, consider determining the arithmetic mean (i.e., average value) of temperatures at noon for a
given week. This question is resolved by recording the seven temperatures, adding them, and dividing by 7.
To generalize from the notion of arithmetic mean and ask for the average temperature for the week is much
more complicated because the spectrum of temperatures is now continuous. However, it is reasonable to
believe that there exists a time at which the average temperature takes place. The manner in which the inte-
gral can be employed to resolve the question is suggested by the following example.
Let f be continuous on the closed interval a
< x < b. Assume the function is represented by the corre-
spondence y = f (x), with f (x) > 0. Insert points of equal subdivision, a = x0, x1, . . . , xn = b. Then all Δ xk = xk
– xk–1 are equal and each can be designated by Δ x. Observe that b – a = n Δ x. Let ξk be the midpoint of the
interval Δxk and f (ξk) the value of f there. Then the average of these functional values is
11
1
() () [() () 1 ()–
n
nn
kk
k
ff ff x fnb a b a
ξξ ξξ ξξ
=
++ ++ Δ== Δ − ∑
LL. . . . . .
This sum specifies the average value of the n functions at the midpoints of the intervals. However, we may
abstract the last member of the string of equalities (dropping the special conditions) and define
1
11lim ( ) ( )
n b
kk an k
ff x dxba baξξ
→∞ =
Δ=−− ∑ ∫
as the average value of f on [a, b].
Of course, the question of for what value x = ξ the average is attained is not answered; in fact, in general,
only existence, not the value, can be demonstrated. To see that there is a point x = ξ such that f(ξ) represents
the average value of f on [a , b], recall that a continuous function on a closed interval has maximum and
minimum values M and m, respectively. (Think of the integral as representing the area under the curve; see
Figure 5.2.) Thus,
() ( ) ()
b
a
mb a f x d x Mb a−≤ ≤ −∫
or
1 ()
b
a
mf x d x Mba≤≤ − ∫
Figure 5.2


## Page 111

CHAPTER 5  Integrals100
Since f is a continuous function on a closed interval, there exists a point x = ξ in (a, b) intermediate to m
and M such that
1() ()
b
a
ff x dxbaξ= − ∫
While this example is not a rigorous proof of the first mean value theorem, it motivates it and provides an
interpretation. (See Chapter 3, Theorem 10.)
First Mean Value Theorem If f (x) is continuous in [a, b], there is a point ξ in (a, b) such that
() ( )()
b
a
f x dx b a f ξ=−∫  (4)
Generalized First Mean Value Theorem If f(x) and g (x) are continuous in [ a, b], and g (x) does not
change sign in the interval, then there is a point ξ in (a, b) such that
()() () ()
bb
aa
f x g x dx f g x dxξ =∫∫  (5)
This reduces to Equation (4) if g(x) = 1.
Connecting Integral and Differential Calculus
In the late seventeenth century the key relationship between the derivative and the integral was established.
The connection which is embodied in the fundamental theorem of calculus was responsible for the creation
of a whole new branch of mathematics called analysis.
Definition Any function F such that F´(x) = f(x) is called an antiderivative, primitive, or indefinite integral
of f.
The antiderivative of a function is not unique. This is clear from the observation that for any constant c
(F(x) + c)´ = F´(x) = f (x)
The following theorem is an even stronger statement.
Theorem Any two primitives (i.e., antiderivatives) F and G of f differ at most by a constant; i.e., F(x) –
G(x) = C.
(See the problem set for the proof of this theorem.)
EXAMPLE. If F´(x) = x2, then
3
2() 3
xFx xd x c== +∫  is an indefinite integral (antiderivative or primitive)
of x2.
The indefinite integral (which is a function) may be expressed as a definite integral by writing
() ( )
x
c
f x dx f t dt=∫∫
The functional character is expressed through the upper limit of the definite integral which appears on the
right-hand side of the equation.
This notation also emphasizes that the definite integral of a given function depends only on the limits of
integration, and thus any symbol may be used as the variable of integration. For this reason, that variable is
often called a dummy variable. The indefinite integral notation on the left depends on continuity of f on a
domain that is not described. One can visualize the definite integral on the right by thinking of the dummy
variable t as ranging over a subinterval [c, x]. (There is nothing unique about the letter t; any other convenient
letter may represent the dummy variable.)


## Page 112

CHAPTER 5  Integrals 101
The previous terminology and explanation set the stage for the fundamental theorem. It is stated in two
parts. Part 1 states that the antiderivative of f is a new function, the integrand of which is the derivative of
that function. Part 2 demonstrates how that primitive function (antiderivative) enables us to evaluate definite
integrals.
The Fundamental Theorem of the Calculus
Part 1. Let f be integrable on a closed interval [a, b]. Let c satisfy the condition a < c < b, and define a
new function
() ( ) i f
x
c
F x f t dt a x b=≤ ≤∫
Then the derivative F´(x) exists at each point x in the open interval (a,b), where f is continuous and F´(x)
= f(x). (See Problem 5.10 for proof of this theorem.)
Part 2. As in Part 1, assume that f is integrable on the closed interval [ a, b] and continuous in the open
interval (a, b). Let F be any antiderivative so that F´(x) = f(x) for each x in (a, b). If a < c < b, then for any x
in (a, b)
() ( ) ( )
x
c
ftd t Fx Fc=−∫
If the open interval on which f is continuous includes a and b, then we may write
( ) ( ) ( ). (See Problem 5.11)
b
a
fxd x F b F a=−∫
This is the usual form in which the theorem is used.
EXAMPLE. To evaluate
2 2
1
xd x∫  we observe that
3
2() , () 3
xFx x F x c′ == + , and
32 2
1
2
3xd x c ⎛⎞=+⎜⎟
⎝⎠∫ −
317 .33 c⎛⎞ +=⎜⎟
⎝⎠
 Since c subtracts out of this evaluation, it is convenient to exclude it and simply write
3321 .33−
Generalization of the Limits of Integration
The upper and lower limits of integration may be variables. For example:
cos2cos 22
sin
sin
(cos sin ) / 22
x
x
x
x
ttd t x x⎡⎤== −⎢⎥⎣⎦∫
In general, if F´(x) = f (x), then
()
()
( ) [ ( )] [ ( )]
x
ux
f t dt F x F u x
υ
υ==∫
Change of Variable of Integration
If a determination of ∫ f(x) dx is not immediately obvious in terms of elementary functions, useful results
may be obtained by changing the variable from x to t according to the transformation x = g(t). [This change


## Page 113

CHAPTER 5  Integrals102
of integrand that follows is suggested by the differential relation dx = g´(t) dt.] The fundamental theorem
enabling us to do this is summarized in the statement
() {( ) } ( )f x dx f g t g t dt ′=∫∫  (6)
where, after obtaining the indefinite integral on the right, we replace t by its value in terms of x; i.e., t = g–1
(x). This result is analogous to the chain rule for differentiation (see Page 76).
The corresponding theorem for definite integrals is
() {( ) } ( )
b
a
f x dx f g t g t dt
β
α
′=∫∫  (7)
where g(α) = a and g(β) = b; i.e., α = g –1 (a), β = g–1(b). This result is certainly valid if f(x) is continuous in
[a, b] and if g(t) is continuous and has a continuous derivative in α < t < β.
Integrals of Elementary Functions
The following results can be demonstrated by differentiating both sides to produce an identity. In each case,
an arbitrary constant c (which has been omitted here) should be added.
1.
1
–11
n
n uud u n n
+
=≠ +∫  18.  coth ln | sinh |ud u u=∫
2. 1n | |du uu =∫ 1n  19.  1sech tan (sinh )ud u u−=∫
3. sin cosud u u=−∫  20.  1csch coth (cosh )ud u u−=−∫
4. cos sinud u u=∫  21.  2sech tanhud u u=∫
5. tan 1n | sec |
1n | cos |
ud u u
u
=
=−
∫ 1n
1n
 22.  2csc cothh u du u=−∫
6. cot 1n | sin |ud u u=∫ 1n  23.  sech tanh sechu u du u =−∫
7. sec ln | sec tan |
ln | tan ( / 2 / 4) |
ud u u u
u π
=+
=+
∫  24.  csch coth cschu u du u =−∫
8. csc ln | csc cot |
ln | tan / 2 |
ud u u u
u
=−
=
∫  25.  11
22
sin or cosdu u u
aasu
−−=−
−∫
9. 2sec tanud u u=∫  26.  22
22
ln | |du uu a
ua
=+ ±
±∫
10. 2csc cotud u u=−∫  27.  11
22
11tan or cotdu u u
aa aaua
−−=−
+∫
11. sec tan secu u du u =∫  28. 22
1 1n2
du u a
au aua
−= +−∫
12. csc cot cscu u du u =−∫  29.
22 2 2
1 lndu u
aua u a a u
=
±+ ±∫
13. 0, 1In
u
u aad u a a a=> ≠∫  30 11
22
11cos or secdu a u
au a auu a
−−=
−∫


## Page 114

CHAPTER 5  Integrals 103
14. uued u e=∫  31.
22 2 2
2
22
2
In | |2
uua d u ua
a uu a
±= ±
±+ ±
∫
15. sinh coshud u u=∫  32.
2
22 22 1 sin22
ua uau d u au a
−−= − +∫
16. cosh sinhud u u=∫  33.  22
(s i n c o s )sin
au
au e a bu b bueb u d u ab
−= +∫
17. tanh ln coshud u u=∫  34.  22
(c o s s i n )cos
au
au e a bu b bueb u d u ab
+= +∫
Special Methods of Integration
1. Integration by Parts Let u and υ be differentiable functions. According to the product rule for dif-
ferentials,
()du u d d uυυ υ=+
Upon taking the antiderivative of both sides of the equation, we obtain
uu d d uυυ υ=+∫∫
This is the formula for integration by parts when written in the form
o r () () ()() ()()dv uv du f x g x dx f x g x f x g x dxυυ ′′=− = −∫∫∫ ∫
where u = f(x) and υ = g(x). The corresponding result for definite integrals over the interval [a, b] is certainly
valid if f(x) and g(x) are continuous and have continuous derivatives in [a, b]. See Problems 5.17 to 5.19.
2. Partial Fractions  Any rational function ()
()
Px
Qx  where P(x) and Q(x) are polynomials, with the degree
of P(x) less than that of Q (x), can be written as the sum of rational functions having the form
2,() ( ) rr
AA x B
ax b ax bx c
+
++ +
 where r = 1, 2, 3, . . . , which can always be integrated in terms of elementary
functions.
EXAMPLE 1.
33 2
32
43 ( 25 )(4 3)(2 5) (2 5) (2 5)
xA B C D
xxxx x x
− =+ + +−+−− + +
EXAMPLE 2.
2
22 22 2
52
1( 2 4) ( 1) ( 2 4) 2 4
xx A x B C x D E
xxx x xx xx
−+ + +=+ + −++ − ++ ++
The constants, A, B, C, etc., can be found by clearing of fractions and equating coefficients of like powers
of x on both sides of the equation or by using special methods (see Problem 5.20).
3. Rational Functions of sin x and cos x These can always be integrated in terms of elementary func-
tions by the substitution tan x/2 = u (see Problem 5.21).


## Page 115

CHAPTER 5  Integrals104
4. Special Devices  Depending on the particular form of the integrand, special devices are often em-
ployed (see Problems 5.22 and 5.23).
Improper Integrals
If the range of integration [a, b] is not finite or if f(x) is not defined or not bounded at one or more points of
[a, b], then the integral of f(x) over this range is called an improper integral. By use of appropriate limiting
operations, we may define the integrals in such cases.
EXAMPLE 1
11
2200 0
lim lim tan lim tan / 211
M M
MM M
dx dx xMxx π
∞ −−
→∞ →∞ →∞
== = =++∫∫
EXAMPLE 2
111
0 00 0
lim lim 2 lim (2 2 ) 2dx dx x
xx ∈∈→ + ∈→ + ∈→ +∈
== = − ∈ =∫∫
EXAMPLE 3
111
0 000
lim lim ln lim ( ln )dx dx xxx ∈∈→ + ∈→ + ∈→ +∈
== = − ∈∫∫
Since this limit does not exist, we say that the integral diverges (i.e., does not converge).
For further examples, see Problems 5.29 and 5.74 through 5.76. For further discussion of improper integrals,
see Chapter 12.
Numerical Methods for Evaluating Definite Integrals
Numerical methods for evaluating definite integrals are available in case the integrals cannot be evaluated
exactly. The following special numerical methods are based on subdividing the interval [a, b] into n equal
parts of length Δx = (b – a)/n. For simplicity we denote f (a + kΔx) = f (x
k) by yk, where k = 0, 1, 2, . . . , n.
The symbol ≈ means “approximately equal.” In general, the approximation improves as n increases.
1. Rectangular Rule
012 1 123() { }o r { }
b
nna
f x d x x yyy y x yyy y −≈Δ + + + + Δ + + + +∫ LL . . .. . .  (8)
The geometric interpretation is evident from Figure 5.1. When left endpoint function values y0, y1, . . ., yn–1 are
used, the rule is called the left-hand rule. Similarly, when right endpoint evaluations are employed, it is called the
right-hand rule.
2. Trapezoidal Rule
012 1() { 2 2 2 }2
b
nna
xf x dx y y y y y −
Δ≈+ + + + +∫ L. . .  (9)
This is obtained by taking the mean of the approximations in Equation (8). Geometrically, this replaces
the curve y = f(x) by a set of approximating line segments.


## Page 116

CHAPTER 5  Integrals 105
3. Simpson’s Rule
012345 2 1() { 4 2 4 2 4 2 4 }3
b
nn na
xf x d x yyyyyy y y y −−
Δ≈+ + + + + + + + +∫ L. . .  (10)
This formula is obtained by approximating the graph of y = g(x) by a set of parabolic arcs of the form y
= ax2 + bx + c. The correlation of two observations lead to Equation (10). First,
22[] [ 2 6 ]3
h
h
hax bx c dx ah c
−
++ = +∫
The second observation is related to the fact that the vertical parabolas employed here are determined by
three nonlinear points. In particular, consider (–h, y0), (0, y1), (h, y2), then y0 = a(–h)2 + b(–h) + c, y1 = c, y2
= ah2 + bh + c. Consequently, y 0 + 4y1 + y2 = 2ah2 + 6c. Thus, this combination of ordinate values (corre-
sponding to equally spaced domain values) yields the area bounded by the parabola, vertical segments, and
the x axis. Now these ordinates may be interpreted as those of the function f whose integral is to be ap-
proximated. Then, as illustrated in Figure 5.3:
11 0 1 2 3 4 5 2 1
1
[4 ] [ 4 2 4 2 4 24 ]33
n
kk k nn n
k
hx yy y y y y y y y yy y−+ −−
=
Δ++ = ++++++ + + +∑ L. . .
The Simpson rule is likely to give a better approximation than the others for smooth curves.
Applications
The use of the integral as a limit of a sum enables us to solve many physical and geometrical problems such
as determination of areas, volumes, arc lengths, moments of intertia, and centroids.
Figure 5.3
Arc Length
As you walk a twisting mountain trail, it is possible to determine the distance covered by using a pedometer.
To create a geometric model of this event, it is necessary to describe the trail and a method of measuring
distance along it. The trail might be referred to as a path, but in more exacting geometric terminology the
word curve is appropriate. That segment to be measured is an arc of the curve. The arc is subject to the fol-
lowing restrictions:
1. It does not intersect itself (i.e., it is a simple arc).


## Page 117

CHAPTER 5  Integrals106
2. There is a tangent line at each point.
3. The tangent line varies continuously over the arc.
These conditions are satisfied with a parametric representation x = f(t), y = g(t), z = h(t), a < t < b, where
the functions f, g, and h have continuous derivatives that do not simultaneously vanish at any point. This arc
is in Euclidean three-dimensional space and is discussed in Chapter 10. In this introduction to curves and
their arc length, we let z = 0, thereby restricting the discussion to the plane.
A careful examination of your walk would reveal movement on a sequence of straight segments, each
changed in direction from the previous one. This suggests that the length of the arc of a curve is obtained as
the limit of a sequence of lengths of polygonal approximations. (The polygonal approximations are charac-
terized by the number of divisions n → /H11009 and no subdivision is bound from zero. (See Figure 5.4.)
Figure 5.4
Geometrically, the measurement of the kth segment of the arc 0 < t < s is accomplished by employing
the Pythagorean theorem; thus, the measure is defined by
22 1/ 2
1
lim {( ) ( ) }
n
kkn k
xy
→∞ =
Δ+ Δ∑
or, equivalently,
1/22
1
lim 1 ( )
n
k
kn k k
y xx→∞ =
⎧⎫ ⎛⎞Δ⎪⎪+Δ⎨⎬ ⎜⎟Δ⎝⎠⎪⎪⎩⎭
∑
where Δxk = xk – xk–1 and Δyk = yk – yk–1.
Thus, the length of the arc of a curve in rectangular Cartesian coordinates is
1/222
22 1 / 2{ [ () ] [ () ]}
b
a
dx dyLf t g t d t d tdt dt
⎧⎫⎪⎪⎛⎞⎛⎞′′=+ = + ⎨⎬⎜⎟⎜⎟⎝⎠⎝⎠⎪⎪⎩⎭
∫∫
(This form may be generalized to any number of dimensions.)
Upon changing the variable of integration from t to x we obtain the planar form
1/22
()
()
1
fb
fa
dyL dx
⎧⎫⎪⎪ ⎡⎤=+ ⎨⎬ ⎢⎥⎣⎦⎪⎪⎩⎭
∫
(This form is appropriate only in the plane.)
The generic differential formula ds2 = dx2 + dy2 is useful, in that various representations algebraically arise
from it. For example,
ds
dt
expresses instantaneous speed.


## Page 118

CHAPTER 5  Integrals 107
Area
Area was a motivating concept in introducing the integral. Since many applications of the integral are geo-
metrically interpretable in the context of area, an extended formula is listed and illustrated here.
Let f and g be continuous functions whose graphs intersect at the graphical points corresponding to x = a
and x = b, a < b. If g(x) ε f(x) ε f(x) on [a, b], then the area bounded by f(x) and g(x) is
{() () }
b
a
Ag x f x d x=−∫
If the functions intersect in (a, b), then the integral yields an algebraic sum. For example, if g(x) = sin x
and f(x) = 0 then
22
0 0
sin cos 0xd x x
ππ
==∫
Volumes of Revolution
Disk Method Assume that f is continuous on a closed interval a < x < b and that f(x) ε 0. Then the solid
realized through the revolution of a plane region R [bound by f(x), the x axis, and x = a and x = b] about the
x axis has the volume
2[( ) ]
b
a
Vf x d xπ =∫
This method of generating a volume is called the disk method because the cross sections of revolution are
circular disks. See Figure 5.5(a).
Figure 5.5
EXAMPLE. A solid cone is generated by revolving the graph of y = kx, k > 0, and 0 < x < b about the x axis.
Its volume is
33 33
22
00 33
bb kx kbVk x d xππ π== =∫
Shell Method Suppose f is a continuous function on [a, b], a ε 0, satisfying the condition f(x) ε 0. Let R
be a plane region bounded by f(x), x = a, x = b, and the x axis. The volume obtained by orbiting R about the
y axis is
2( )
b
a
Vx f x d xπ =∫


## Page 119

CHAPTER 5  Integrals108
This method of generating a volume is called the shell method because of the cylindrical nature of the
vertical lines of revolution. See Figure 5.5(b).
EXAMPLE. If the region bounded by y = kx, 0 < x < b, and x = b (with the same conditions as in the previ-
ous example) is orbited about the y axis, the volume obtained is
33
0 0
2( ) 2 2 33
b bxbVx k x d x k kππ π== =∫
By comparing this example with that in the section on the disk method, it is clear that for the same plane
region the disk method and the shell method produce different solids and, hence, different volumes.
Moment of Inertia Moment of inertia is an important physical concept that can be studied through its
idealized geometric form. This form is abstracted in the following way from the physical notions of kinetic
energy K = 1/2 mυ 2 and angular velocity υ = ωr ( m represents mass and υ signifies linear velocity). Upon
substituting for υ,
22 2 211 ()22Km r m rωω==
When this form is compared to the original representation of kinetic energy, it is reasonable to identify
mr2 as rotational mass. It is this quantity, l = mr2, that we call the moment of inertia.
Then in a purely geometric sense, we denote a plane region R described through continuous functions f
and g on [a, b], where a > 0 and f (x) and g(x) intersect at a and b only. For simplicity, assume g(x) ε f(x) >
0. Then
2 [() () ]
b
a
lx g x f x d x=−∫
By idealizing the plane region R as a volume with uniform density one, the expression [f (x) – g(x)] dx
stands in for mass and r2 has the coordinate representation x2. See Problem 5.25(b) for more details.
SOLVED PROBLEMS
Definition of a definite integral
5.1. If f(x) is continuous in [a, b], prove that
1
()lim ( )
n b
an k
ba k ba fa f x d xnn→∞ =
−− ⎛⎞ +=⎜⎟⎝⎠∑ ∫ .
Since f(x) is continuous, the limit exists independent of the mode of subdivision (see Problem 5.31).
Choose the subdivision of [a, b] into n equal parts of equal length Δx = (b – a)/n see Figure 5.1. Let ξ k = a +
k(b – a)/n, k = 1, 2, . . ., n. Then
11
()lim ( ) lim ( )
nn b
kk ann kk
ba k bafx f a f x d x nnξ
→∞ →∞==
−− ⎛⎞Δ= + =⎜⎟
⎝⎠
∑∑ ∫
5.2. Express
1
1lim
n
n k
kfnn→∞ =
⎛⎞
⎜⎟⎝⎠∑  as a definite integral.
Let a = 0, b = 1 in Problem 5.1. Then
1
01
1lim ( )
n
n k
kff x d xnn→∞ =
⎛⎞ =⎜⎟
⎝⎠
∑ ∫


## Page 120

CHAPTER 5  Integrals 109
5.3. (a) Express
1 2
0
x∫ dx as a limit of a sum, and use the result to evaluate the given definite integral. (b) Interpret
the result geometrically.
(a) If f(x) = x2, then f(k/n) = (k/n)2 = k2/n2. Thus, by Problem 5.2,
2 1 2
2 01
1lim
n
n k
k xd xn n→∞ =
=∑ ∫
This can be written, using Problem 1.29,
22 2 2 2 21 2
22 2 30
3
11 2 1 2lim lim
(1 ) ( 21 )lim 6
(1 1 / )(2 1 / ) 1lim 63
nn
n
n
nnxd x n nn n n
nn n
n
nn
→∞ →∞
→∞
→∞
⎛⎞ +++=+ + + =⎜⎟
⎝⎠
++=
++==
∫
LL. . . . . .
which is the required limit.
Note: By using the fundamental theorem of the calculus, we observe that ∫
1
0 x2 dx = (x3/3)⏐
1
0 = 13/3 – 03/3
= 1/3.
(b) The area bounded by the curve y = x 2, the x axis, and the line x = 1 is equal to 1
3
.
5.4. Evaluate 11 1 .lim 12n nn n n→∞
⎧⎫ ++ +⎨⎬ ++ +⎩⎭
L. . .
The required limit can be written
1 1
001
11 1 1 1 1lim lim ln |1 + | ln 21 1 / 1 2 / 1/ 1/ 1
n
n n k
dx xnn n n n nk n x→∞ →∞ =
⎧⎫ ++ + = = = =⎨⎬ ++ + + +⎩⎭ ∑ ∫L. . .
using Problem 5.2 and the fundamental theorem of the calculus.
5.5. Prove that 12 ( 1 ) 1 c os .lim sin sin sin
n
tt n t t
nn n n t→∞
⎧⎫ −−++ + =⎨⎬
⎩⎭
L. . .
Let a = 0, b = t, f(x) = sin x in Problem 1. Then
0
1lim sin sin 1 cos
n t
n k=1
kt xd x tnn→∞
== −∑ ∫
and so
11 c o slim sin
n-1
n k=1
kt t
nn t→∞
−=∑
using the fact that sinlim 0.
n
t
n→∞
=
Measure zero
5.6. Prove that a countable point set has measure zero.
Let the point set be denoted by x 1, x2, x3, x4, . . . and suppose that intervals of lengths less than ε/2, ε/4,
ε/8, ε/16, . . . , respectively, enclose the points, where ε is any positive number. Then the sum of the lengths of
the intervals is less than ε/2 + ε/4 + ε/8 + . . . = ε [let a = ε/2 and r = 1/2 in Problem 2.25(a)], showing that the
set has measure zero.


## Page 121

CHAPTER 5  Integrals110
Properties of definite integrals
5.7. Prove that () | () | i f .
bb
aa
fxd x fx d x a b<<∫∫
By absolute value property 2, on Page 4,
11 1
() |() | |() |
nn n
kk kk k k
kk k
fx fx f xξξ ξ
== =
Δ< Δ = Δ∑∑ ∑
Taking the limit as n → /H11009 and each Δxk → 0, we have the required result.
5.8. Prove that
2
220
sinlim 0.
n
nx dxxn
π
→∞
=+∫
22 2
22 22 2 200 0
sin sin 2nx nx dxdx dxxn xn n n
ππ π π<< =++∫∫∫
Then
2
220
sinlim 0,
n
nx dxxn
π
→∞
=+∫  and so the required result follows.
Mean value theorems for integrals
5.9. Given the right triangle pictured in Figure 5.6: (a) Find the average value of h. (b) At what point does this
average value occur? (c) Determine the average value of f(x) = sin–1 x, 0 < x < 1
2
. (Use integration by
parts.) (d) Determine the average value of f(x) = cos2 x, 0 < x < 2
π .
Figure 5.6
(a) h(x) = H
B
x. According to the mean value theorem for integrals, the average value of the function h on
the interval [0, B] is
0
1
2
B HHAx d xBB== ∫
(b) The point ξ, at which the average value of h occurs, may be obtained by equating f (ξ) with that average
value, i.e., . Thus, .22
HH B
B ξξ==
Fundamental theorem of the calculus
5.10. If F(x) = ()
x
a
ftd t∫  where f(x) is continuous in [a, b], prove that F´(x) = f (x).
Fx h Fx
hh ft d t ft d t
h f
a
x
a
xh() ( ) () ()
(
+− =− {}
=
∫ ∫
+1
1 ttd t f x x h
x
xh
)( ) =+
+
∫ ξξ between and
by the first mean value theorem for integrals (Page 99).


## Page 122

CHAPTER 5  Integrals 111
Then if x is any point interior to [a, b],
00
() ( )( ) lim lim ( ) ( )
hh
Fx h FxFx f fxh ξ
→→
+−′ == =
since f is continuous.
If x = a  or x  = b , we use right-or left-hand limits, respectively, and the result holds in these cases as
well.
5.11. Prove the fundamental theorem of the calculus, Part 2 (Page 101).
By Problem 5.10, if F(x) is any function whose derivative is f(x), we can write
() ( )
x
a
Fx ftd t c=+∫
where c is any constant (see the last line of Problem 4.22).
Since F(a) = c, it follows that ( ) () ( )o r () ( ) ( )
bb
aa
Fx ftd t Fa ftd t Fb Fa=+ = −∫∫
5.12. If f(x) is continuous in [a, b], prove that () ( )
b
a
Fx ftd t= ∫  is continuous in [a, b].
If x is any point interior to [a, b], then, as in Problem 5.10,
00
lim ( ) ( ) lim ( ) 0
hh
Fx h Fx h f ξ
→→
+− = =
and F(x) is continuous.
If x = a  and x  = b , we use right- and left-hand limits, respectively, to show that F(x) is continuous at
x = a and x = b.
Another Method: By Problems 5.10 and 4.3, it follows that F´(x) exists, and so F(x) must be continuous.
Change of variables and special methods of integration
5.13. Prove the result in Equation (7), Page 102, for changing the variable of integration.
Let () () a n d ( ) {( ) } ( )
xx
aa
F x f x dx G t f g t g t dt ′==∫∫ , where x = g(t)
Then dF = f(x)dx, dG = f {g(t)} g´(t)dt.
Since dx = g´(t) dt, it follows that f(x)dx = f{g(t)} g´(t)dt so that dF(x) = dG(t), from which F(x) = G(t) + c.
Now, when x = a, t = α or F(a) = G(α) + c. But F(a) = G(α) = 0, so that c = 0. Hence, F(x) = G(t). Since
x = b when t = β, we hav
e
() {( ) } ( )
b
a
f x dx f g t g t dt
β
α
′=∫∫
as required.
5.14. Evaluate:
(a) ∫(x + 2) sin (x2 + 4x – 6) dx  (c)
1
1 (2 ) ( 3)
dx
xx− +−∫  (e)
121/ 2
0 4
sin
1
xx dx
x
−
−∫
(b) cot(ln )x dxx∫  (d) ∫ 2–x tanh 21–x dx (f)
2 1
xd x
xx ++∫
(a) Method 1: Let x2 + 4x – 6 = u. Then (2x + 4) dx = du, (x + 2) dx = 1
2
du, and the integral becomes
211 1sin cos cos( 4 6)22 2 ud u u c x x c=− + =− + − +∫ .


## Page 123

CHAPTER 5  Integrals112
Method 2:
22 2
2
1( 2 ) s i n (4 _ 6 ) s i n (4 6 ) (4 6 )2
1 cos( 4 6)2
x xxd x xxd xx
xx c
++ = + − + −
=− + − +
∫∫
(b) Let ln x = u. Then (dx)/x = du and the integral becomes ∫ cot u du = ln ⏐sinu⏐ + c = ln ⏐sin(ln x)⏐ + c.
(c) Method 1:
22 2( 2)(3 ) 66 ( ) 125/4 2
dx dx dx dx
xx xx x x x
== =
+− +− + − ⎛⎞−−⎜⎟⎝⎠
∫∫ ∫ ∫ .
Letting x – 1
2
 = u, this becomes 11
2
21sin sin5/2 525/4
du u xcc
u
−− −⎛⎞=+ = + ⎜⎟
⎝⎠−
∫
Then
1
1 11 1 1 1
1 1
21 1 3sin sin sin sin .2 sin .655 5( 2)(3 )
dx x
xx
−− − − −
− −
−⎛⎞ ⎛ ⎞ ⎛ ⎞== − − = +⎜⎟ ⎜ ⎟ ⎜ ⎟
⎝⎠ ⎝ ⎠ ⎝ ⎠+−
∫
Method 2: Let x – 1
2
 = u as in Method 1. Now, when x = –1, u = – 3
2
, and when x = 1, u = 1
2
. Thus,
by Formula 25, Page 102,
1/2
11 1 / 2 1
11 3 / 222
3/2
sin 5/2( 2)(3 ) 25/4125/4 2
dx dx du u
xx ux
−
−− −
−
== =
+− −⎛⎞−−⎜⎟
⎝⎠
∫∫ ∫
 = sin1 .2 + sin–1 .6
(d) Let 2 1–x = u. Then –21–x(ln 2)dx = du and 2–x dx = – ,2l n2
du  so that the integral becomes
111 tanh ln cosh 22l n2 2l n2
xud u c−=− +− ∫
(e) Let sin –1 x2 = u.
22 4
12Then 2
1( ) 1
xd xdu x dx
xx
==
−−
 and the integral becomes
21 2 2111 (sin )244ud u u c x c −=+ = +∫
Thus,
212 2 1/ 21/ 2 12 2 1
0 4 0
sin 1 1 1 .(sin ) sin4 4 2 1441
xx dx x
x
π−
−− ⎛⎞== ⎜⎟
⎝⎠−
∫
(f)
22 2 2
121 1 1 21 1
22211 1 1
xdx x x dxdx dx
xx xx xx xx
+− +==−
++ ++ ++ ++∫∫ ∫
1/222
2
11 (1 ) (1 )22 13
24
dxxx d xx
x
−
=+ + + + −
⎛⎞ ++⎜⎟
⎝⎠
∫∫
2
2 11 1 31l n22 2 4xx x x c ⎛⎞=+ + − + +++ + ⎜⎟
⎝⎠
5.15. Show that
2
23 / 21
1.
6(2 4 )
dx
xx =−+∫
Write the integral as
2
23 / 21
.
[( 1) 3]
dx
x −+∫  Let x – 1 = 3  tan u, dx = 3  sec2 u du. When x = 1, u =
tan–1 0 = 0; when x = 2, u = tan–1 1/ 3  = π/6. Then the integral becomes


## Page 124

CHAPTER 5  Integrals 113
/622/6 /6 /6
23 / 2 23 / 200 0
0
3s e c 3s e c 1 1 1cos sin33 6[3 3tan ] [3sec ]
ud u ud u ud u u
uu
π
ππ π
== = =
+∫∫ ∫
5.16. Determine
2
3
.
(ln )
e
e
dx
xx∫
Let ln x = y, (dx)/x = dy. When x = e, y = 1; when x = e2, y = 2. Then the integral becomes
22 2
31 1
3
28
dy y
y
−
==−∫
5.17. Find ∫xn ln x dx if (a) n /HS11005 –1 and if (b) n = –1.
(a) Use integration by parts, letting u = ln x, dυ = xn dx, so that du = (dx)/x, υ = xn+1/(n + 1). Then
11
11
2
.ln ln11
ln1 (1 )
nn
n
nn
xx d xxx d x u d u d u x nn x
xx xcn n
υυυ
++
++
== −= − ++
=− ++ +
∫∫ ∫ ∫
(b) 12 1ln ln (ln ) (ln ) . 2x x dx x d x x c− == +∫∫
5.18. Find
21
3.
x
dx
+
∫
Let 21x +  = y, 2x + 1 = y2. Then dx = y dy and the integral becomes ∫ 3y · y dy.
Integrate by parts, letting u = y, dυ = 3y dy; then du = dy, ν = 3y/(ln 3), and we have
2
.3 3 .3 3.3 ln 3 ln 3 ln 3 (ln 3)
yy yy
y yyy dy u d u du dy cυυυ== −= − = − +∫∫ ∫ ∫
5.19. Find
1
0
ln ( 3) .xx d x +∫
Let u = ln(x + 3), dυ = x dx. Then du =
2
, .
32
dx x
x υ=+
 Hence, on integrating by parts,
22 2
22
11 9ln ( 3) ln ( 3) ln ( 3) 322 3 22 3
1ln ( 3) 3 9 ln ( 3)22 2
x x dx xx x dx x x x dxxx
xx xx x c
⎛⎞+= + − = + − − + ⎜⎟++ ⎝⎠
⎧⎫=+ − − + + + ⎨⎬
⎩⎭
∫∫ ∫
Then
1
0
59ln ( 3) 4 ln 4 ln 342xx d x += − +∫
5.20. Determine 6 .(3 ) ( 25 )
x dxxx
−
−+∫
Use the method of partial fractions. Let 6 .
(3 ) ( 25 ) 3 25
xA B
xx x x
− =+−+ − +
Method 1: To determine the constants A and B, multiply both sides by (x – 3)(2x + 5) to obtain
 6 – x = A(2x + 5) + B(x – 3) or 6 – x = 5A – 3B + (2A + B)x (1)
Since this is an identity, 5A – 3B = 6, 2A + B = –1 and A = 3/11, B = –17/11. Then
6 3 /11 17 /11 3 17ln | 3 | ln | 2 5 |(3 ) ( 25 ) 3 25 1 1 2 2
x dx dx dx x x cxx x x
−− =+ = − − + +−+ − +∫∫ ∫
Method 2: Substitute suitable values for x in the identity (1). For example, letting x = 3 and x = –5/2 in (1),
we find at once A = 3/11, B = –17/11.


## Page 125

CHAPTER 5  Integrals114
5.21. Evaluate
53 c o s
dx
x+∫  by using the substitution tan x/2 = u.
From Figure 5.7 we see that
22
1,sin / 2 cos / 2
11
uxx
uu
==
++
Figure 5.7
Then
2
22
2
1cos cos / 2 sin / 2 1
uxx x u
−=−= +
Also
22
2
12sec / 2 or 2 cos / 22 1
dudu x dx dx x du u== = +
Thus, the integral becomes
11
2
11 1tan / 2 tan tan / 2 .22 24
du uc x cu
−− ⎛⎞=+ = + ⎜⎟+ ⎝⎠∫
5.22. Evaluate 20
sin .1c o s
xx dxx
π
+∫
Let x = π – y. Then
22 2 200 00
sin ( )sin sin sin
1c o s 1c o s 1c o s 1c o s
xx y y y yyId x d y d yd yxy y y
ππ ππ π π−== = −++ + +∫∫ ∫∫
12
20 0
(cos ) tan (cos ) / 21c o s
dy Iy I Iy
ππ
ππ π −=− − =− =− = −+∫
i.e., I = π2/2 – I or I = π2/4.
5.23. Prove that
/2
0
sin .
4sin cos
x dx
xx
π π=
+∫
Letting x = π/2 – y, we have
/2 /2 /2
00 0
cossin cos
sin cos cos sin cos sin
yxxId x d y d x
xx y y x x
ππ π
== =
+++∫∫ ∫
Then
/2 /2
00
/2 /2
00
sin cos
sin cos cos sin
sin cos
2sin cos
xxI I dx dx
xx x x
xx dx
xx
ππ
ππ π
+= +
++
+== =
+
∫∫
∫∫
from which 2I = π/2 and I = π/4.
The same method can be used to prove that for all real values of m,
/2
0
sin
4sin cos
m
mm
x dxxx
π π=+∫
(see Problem 5.89).
Note: This problem and Problem 5.22 show that some definite integrals can be evaluated without first
finding the corresponding indefinite integrals.


## Page 126

CHAPTER 5  Integrals 115
Numerical methods for evaluating definite integrals
5.24. Evaluate
1
20 1
dx
x+∫  approximately, using (a) the trapezodial rule, and (b) Simpson’s rule, where the interval
[0, 1] is divided into n = 4 equal parts.
Let f(x) = 1/(1 + x 2). Using the notation on Page 104, we find Δx = (b – a)/n = (1 – 0)/4 = 0.25. Then,
keeping four decimal places, we have y 0 = f (0) = 1.0000, y 1 = f (0.25) = 0.9412, y 2 = f (0.50) = 0.8000, y 3 =
f(0.75) = 0.6400, and y4 = f(1) = 0.50000.
(a) The trapezoidal rule gives
0123 4
0.25{ 2 2 2 } { 1.0000 2(0.9412) 2(0.8000) 2(0.6400) 0.500}22
0.7828.
x yyyy yΔ + + + + = ++++
=
(b) Simpson’s rule gives
0123 4
0.25{ 4 2 4 } { 1.0000 4(0.9412) 2(0.8000) 4(0.6400) 0.500}32
0.7854.
x yyyy yΔ + + + + = ++++
=
The true value is π/4 ≈ 0.7854.
Applications (area, arc length, volume, moment of inertia)
5.25. Find (a) the area and (b) the moment of inertia about the y axis of the region in the xy plane bounded by y =
4 – x2 and the x axis.
(a) Subdivide the region into rectangles as in Figure 5.1. A typical rectangle is shown in Figure 5.8. Then
1
2
1
2 2
2
Required area lim ( )
lim (4 )
32(4 ) 3
n
kkn k
n
kkn k
fx
x
xd x
ξ
ξ
→∞ =
→∞ =
−
=Δ
=− Δ
=− =
∑
∑
∫
(b) Assuming unit density, the moment of inertia about the y axis of the typical rectangle shown in Figure 5.8
is ξ
2
k f (ξk) Δxk. Then
Figure 5.8
22 2
11
2 22
2
Required moment of inertia lim ( ) lim (4 )
128(4 ) 15
nn
kkk k k knn kk
fx x
xx d x
ξξ ξ ξ
→∞ →∞==
−
=Δ = − Δ
=− =
∑∑
∫


## Page 127

CHAPTER 5  Integrals116
5.26. Find the length of arc of the parabola y = x 2 from x = 0 to x = 1.
11 22
00
12 22
00
2
22
0
Required arc length 1 ( / ) 1 (2 )
114 1 2
11 1 1 11 ln( 1 ) 5 ln(2 5)22 2 2 4
dy dx dx x dx
xd x u d u
uu u u
=+ =+
=+ = +
⎧⎫=+ + + + = + +⎨⎬⎩⎭
∫∫
∫∫
5.27. (a) (Disk method.) Find the volume generated by revolving the region of Problem 5.25 about the x axis.
222 2
21
Required volume lim (4 ) 512 /15.
n
kkn k
yx x d xππ π
−→∞ =
=Δ = − =∑ ∫
(b) (Disk method.) Find the volume of the frustrum of a paraboloid obtained by revolving () ,fx k x=
0 < a < x < b about the x axis.
22()2
b
a
kV kxdx b a ππ== −∫
(c) (Shell method.) Find the volume obtained by orbiting the region of (b) about the y axis. Compare this
volume with that obtained in (b).
3
0
2( ) 2 / 3
b
V x kx dx kbππ== ∫
The solids generated by the two regions are different, as are the volumes.
Miscellaneous problems
5.28 If f(x) and g(x) are continuous in [a, b], prove Schwarz’s inequality for integrals:
f x g x dx f x dx g x dx
a
b
a
b
a
b
()() {() } {() }∫∫ ∫() <
2 22
We have
22 2 2{() () } {() } 2 ()() { () } 0
bb b b
aa a a
f x g x dx f x dx f x g x dx g x dxλλ λ+= + + >∫∫ ∫ ∫
for all real values of λ. Hence, using Equation (1) in Problem 1.13 with
22 2 2 {() } , {() } , ()()
bb b
aa a
A g x dx B f x dx C f x g x dx== =∫∫ ∫
we find C2 < A2B2, which gives the required result.
5.29. Prove that 40
.lim 84
M
M
dx
x
π
→∞
=+∫
We have x4 + 4 = x4 + 4x2 + 4 – 4x2 = (x2 + 2)2 – (2x)2 = (x2 + 2 + 2x)(x2 + 2 – 2x). According to the method
of partial fractions, assume
42 2
1
42 22 2
Ax B Cx D
xx x x x
++=+
++ +− +
Then 1 = (A + C)x3 + (B – 2A + 2C + D)x2 + (2A – 2B + 2C + 2D)x + 2B + 2D, so that A + C = 0, B – 2A
+ 2C + D = 0, 2A – 2B + 2C + 2D = 0, 2B + 2D = 1. Solving simultaneously, 11 1 1 .,, ,84 8 4ABC D== = − =
Thus,
42 2
22 22
21 21
12 1 2
8842 2 2 2
11 1 11 1
88 88( 1 )1 ( 1 )1 (1 )1 (1 )1
11 11ln( 2 2) tan ( 1) ln( 2 2) tan ( 1)16 8 16 8
dx x xdx dx
xx x x x
xd x xd xdx dx
xx xx
xx x xx x C −−
+−=−
++ + − +
+−=+ −+
++ ++ −+ −+
=+ + + + −− + + − +
∫∫ ∫
∫∫ ∫∫


## Page 128

CHAPTER 5  Integrals 117
Then
2
11
420
12 2 1 1lim lim ln tan ( 1) tan ( 1)16 8 8 842 2
M
MM
dx M M MMxM M
π−−
→∞ →∞
⎧⎫ ⎛⎞ ++⎪⎪=+ + + − =⎨⎬ ⎜⎟+− +⎪⎪ ⎝⎠⎩⎭∫
We denote this limit by 40
,4
dx
x
∞
+∫  called an improper integral of the first kind. Such integrals are considered
further in Chapter 12. See also Problem 5.74.
5.30. Evaluate
3
0
40
sin
.lim
x
x
td t
x→
∫
The conditions of L’Hospital’s rule are satisfied, so that the required limit is
33
32 30
3200 0 043
sin (sin )sin 3 cos 1lim lim lim lim 441 2() ( 4)
x
xx x x
dd td t xxx xdx dx
dd xxxxdx dx
→→ → →
== = =
∫
5.31. Prove that if f (x) is continuous in [a, b], then ()
b
a
fx d x∫ exists.
Let
1
() ,
n
kk
k
fxσξ
=
=Δ∑  using the notation of Page 99. Since f(x) is continuous, we can find numbers Mk and
mk, representing the l.u.b. and g.l.b. of f(x) in the interval [xk–1, xk], i.e., such that mk < f(x) < Mk. We then have
11
() ()
nn
kk k k k
kk
mb a s m x M x S M b a σ
==
−< = Δ< < Δ = < −∑∑  (1)
where m and M are the g.l.b. and l.u.b. of f(x) in [a, b]. The sums s and S are sometimes called the lower and
upper sums, respectively.
Now choose a second mode of subdivision of [a, b] and consider the corresponding lower and upper sums
denoted by s´ and S´ respectively. We have must
 s ´ < S and S´ ε s (2)
To prove this we choose a third mode of subdivision obtained by using the division points of both the first and
second modes of subdivision and consider the corresponding lower and upper sums, denoted by t and T, re-
spectively. By Problem 5.84, we have
 s
< t < T < S´ and s´ < t < T < S (3)
which proves (2).
From (2) it is also clear that as the number of subdivisions is increased, the upper sums are monotonic
decreasing and the lower sums are monotonic increasing. Since, according to Equation (1), these sums are also
bounded, it follows that they have limiting values, which we shall call
s  and S, respectively. By By Problem
5.85, s < S. In order to prove that the integral exists, we must show that s  = S.
Since f(x) is continuous in the closed interval [a,b], it is uniformly continuous. Then, given any ε > 0, we
can take each Δxk so small that Mk – mk < ε/(b – a). It follows that
11
()
nn
kk k k
kk
Ss M m x x ba==
∈−= − Δ < Δ = ∈ −∑∑
ε ε<  (4)
Now S – s = (S – S) + (S – s ) + ( s  – s) and it follows that each term in parentheses is positive and so is less
than ε, by Equation (4). In particular, since S – s  is a definite number, it must be zero; i.e., S = s . Thus, the
limits of the upper and lower sums are equal and the proof is complete.


## Page 129

CHAPTER 5  Integrals118
SUPPLEMENTARY PROBLEMS
Definition of a definite integral
5.32. (a) Express
1 3
0
Express xd x∫  as a limit of a sum. (b) Use the result of (a) to evaluate the given definite
integral. (c) Interpret the result geometrically.
Ans. (b) 1
4
5.33. Using the definition, evaluate (a)
2
0
(3 1) ,xd x+∫  and (b)
6 2
3
(4 ) .xx d x−∫
Ans. (a) 8 (b) 9
5.34. Prove that 22 2 2 2 2
.lim 412n
nn n
nn n n
π
→∞
⎧⎫ ++ + =⎨⎬ ++ +⎩⎭
L. . .
5.35. Prove that 1
123 1lim if 11
ppp p
pn
n ppn +→∞
⎧⎫ +++ + => −⎨⎬ +⎩⎭
L. . .
5.36. Using the definition, prove that .
b xb a
a
ed x e e=−∫
5.37. Work Problem 5.5 directly, using Problem 1.94.
5.38. Prove that
22 2 2 2 2
11 1lim ln(1 2).
12n nn n n→∞
⎧⎫⎪⎪ ++ + = +⎨⎬
++ +⎪⎪⎩⎭
L. . .
5.38. Prove that
1
22 2
1
tanlim if 0.
n
n k
nx xxnk x
−
→∞ =
=≠+∑
Properties of definite integrals
5.40. Prove (a) Property 2 and (b) Property 3, on Page 102.
5.41. If f(x) is integrable in (a, c) and (c, b), prove that () () () .
bc b
aa c
fx d x fx d x fx d x=+∫∫∫
5.42. If f(x) and g(x) are integrable in [a, b] and f(x) < g(x), prove that () () .
bb
aa
f x dx g x dx<∫∫
5.43. Prove that 1 – cos x ε x2/π for 0 < x < π/2.
5.44. Prove that
1
0
cos ln 2 for all .1
nx dx nx <+∫
5.45. Prove that
3
21
sin .
121
xex dx ex
π−
<+∫


## Page 130

CHAPTER 5  Integrals 119
Mean value theorems for integrals
5.46. Prove result (5), Page 100. [Hint: If m < f(x) < M, then mg(x) < f(x)g(x) < Mg(x). Now integrate and
divide by () .
b
a
gxd x∫  Then apply Theorem 9, from Chapter 3.]
5.47. Prove that there exist values ξ 1 and ξ2 in 0 < x <  1 such that
1
2220
1
sin 2 sin41( 1 )
x dxx
ππ πξπξ==++∫
(Hint: Apply the first mean value theorem.)
5.48. (a) Prove that there is a value ξ in 0 < x < π such that
0
xe
π −
∫ cos x dx = sin ξ. (b) Suppose a wedge in the
shape of a right triangle is idealized by the region bounded by the x axis, f(x) = x, and x = L. Let the weight
distribution for the wedge be defined by W(x) = x2 + 1. Use the generalized mean value theorem to show that
the point at which the weighted value occurs is
2
2
32 .
4 3
LL
L
+
+
Change of variables and special methods of integration
5.49. Evaluate:
(a)
32s i n 3 cosxxe xd x∫  (b)
11
20
tan .
1
t dtt
−
+∫ (c)
3
1 24
dx
xx−∫ (d)
2csch .u du
u∫
Ans. (a)
3sin1
3
xec +  (b) 2 /3 2π  (c) /3π  (d) 2 coth uc−+ (e) 1 ln 34
5.50. Show that (a)
1
23 / 20
3
12(3 2 )
dx
xx =+−∫  and (b)
2
22
1
1
xdx cxxx
−=+
−∫
5.51. Prove that (a) 22 22 2 2211 ln | |22u a du u u a a u u a±= ± ± + ±∫  and
(b) 22 22 2 111 sin / , 0.22au d u u au a u a c a −−= − + + >∫
5.52. Find
2 25
xd x
xx ++∫
Ans. 22 25 l n |1 25 | .xx x xx c++ − + + ++ +
5.53. Establish the validity of the method of integration by parts.
5.54. Evaluate (a)
0
cos3xx d x
π
∫  and (b) 32 xxe d x−
∫
Ans. (a) 2/9− (b) 23 21 (4 6 6 3)3
xex x x c−−+ + + +


## Page 131

CHAPTER 5  Integrals120
5.55. Show that (a)
1 21
0
11 1tan ln 212 6 6xx d x π− =− +∫ and (b)
2 2
2
57 33 3 5 271l n44 8 23 3
xx d x
−
⎛⎞ +++ = + + ⎜⎟⎜⎟ −⎝⎠∫
5.56. (a) If u = f(x) and υ = g(x) have continuous nth derivatives, prove that
() ( 1 ) ( 2 ) ( 3 ) ()(1 )nn n n n nud x u u u ud xυυ υ υ υ −− − ′′ ′=− + − − −∫∫ L. . . , called generalized integration by parts.
(b) What simplifications occur if u(n) = 0? Discuss. (c) Use (a) to evaluate 4
0
sin .xx d x
π
∫
Ans. (c) 42 12 48ππ −+
5.57. Show that
1
220
2
8(1 ) ( 1 )
xd x
xx
π−=++∫  [Hint: Use partial fractions; i.e., assume
22 2 21(1 ) ( 1 ) (1 ) 1
xA B C x D
xxx x x
+=+ + ++++ +
 and find A, B, C, D.]
5.58. Prove that
0 2
, 1.cos 1
dx
x
π π αα α
=>− −∫
Numerical methods for evaluating definite integrals
5.59. Evaluate
1
0 1
dx
x+∫  approximately, using (a) the trapezoidal rule and (b) Simpson’s rule, taking n = 4.
Compare with the exact value, ln 2 = 0.6931.
5.60. Using (a) the trapezoidal rule and (b) Simpson’s rule, evaluate
/2 2
0
sin xd x
π
∫ by obtaining the values of
sin2 x at x = 0º, 10º, . . ., 90º and compare with the exact value π/4.
5.61. Prove (a) the rectangular rule and (b) the trapezoidal rule, i.e., Equations (8) and (9), Page 104.
5.62. Prove Simpson’s rule.
5.63. Evaluate the following to three decimal places using numerical integration:
(a)
2
21 1
dx
x+∫  (b)
1 2
0
cosh xd x∫
Ans. (a) 0.322 (b) 1.105
Applications
5.64. Find (a) the area and (b) the moment of inertia about the y axis of the region in the xy plane bounded by y =
sin x, 0 < x < π, and the x axis, assuming unit density.
Ans. (a) 2 (b) π2 – 4
5.65. Find the moment of inertia about the x axis of the region bounded by y = x2 and y = x, if the density is
proportional to the distance from the x axis.
Ans. 1
8 M, where M = mass of the region


## Page 132

CHAPTER 5  Integrals 121
5.66. (a) Show that the arc length of the catenary y = cosh x from x = 0 to x = ln 2 is 3
4
. (b) Show that the length
of arc of 3/2 3/2343,2 5 i s 2 2 1 1. 27yx x=< <−
5.67. Show that the length of one arc of the cycloid x = a(θ – sin θ), y = a(1 – cos θ), (0 < τ <  2π) is 8a.
5.68. Prove that the area bounded by the ellipse x 2/a2 + y2/b2 = 1 is πab.
5.69. (a) (Disk method.) Find the volume of the region obtained by revolving the curve y = sin x, 0 < x < π,
about the x axis.
Ans. (a) π2/2
(b) (Disk method.) Show that the volume of the frustrum of a paraboloid obtained by revolving f(x) = kx , 0 <
a < x < b about the x axis is 22() .2
b
a
kkx dx b aππ= −∫  (c) Determine the volume obtained by rotating the
region bound by f(x) = 3, g(x) = 5 – x2 on – 2 < x < 2 . (d) (Shell method.) A spherical bead of radius a has
a circular cylindrical hole of radius b, b < a, through the center. Find the volume of the remaining solid by the
shell method. (e) (Shell method.) Find the volume of a solid whose outer boundary is a torus [i.e., the solid is
generated by orbiting a circle (x – a)2 – y2 = b2 about the y axis (a > b)].
5.70. Prove that the centroid of the region bounded by y = 22 ,ax −  –a < x < a, and the x axis is located at
(0, 4a/3π).
5.71. (a) If ρ = f (φ) is the equation of a curve in polar coordinates, show that the area bounded by this curve and
the lines φ = θ and φ = φ2 is
1
21
2
ø
ø
døρ∫ φ. (b) Find the area bounded by one loop of the lemniscateρ2 = a2 cos 2φ.
Ans. (b) a2
5.72. (a) Prove that the arc length of the curve in Problem 5.71(a) is
2
1
22 (/ ).
ø
ø
dd ø d øρρ +∫ φ.φ  (b) Find the length
of arc of the cardioid ρ = a(1 – cos φ).
Ans. (b) 8a
Miscellaneous problems
5.73. Establish the mean value theorem for derivatives from the first mean value theorem for integrals. [Hint: Let
f(x) = F´(x) in (4), Page 100.]
5.74. Prove that (a)
4
00
lim 4,
4
dx
x
−∈
∈→ +
=
−∫  (b)
3
30
lim 6, dx
x∈∈→ +
=∫  (c)
1
0 20
lim 21
dx
x
π−∈
∈→ +
=
−∫ , and give a geometric
interpretation of the results.
(These limits, denoted usually by
4
0
,
4
dx
x−∫
3
30
dx
x∫ , and
1
0 21
dx
x−∫ , respectively, are called improper
integrals of the second kind (see Problem 5.29), since the integrands are not bounded in the range of integra-
tion. For further discussion of improper integrals, see Chapter 12.)


## Page 133

CHAPTER 5  Integrals122
5.75. Prove that (a) 5
0
lim 4! 24 ,
M x
M
xed x−
→∞
==∫  and (b)
2
10
.lim 2(2 )
dx
xx
π−∈
∈→ +
=
−∫
5.76. Evaluate (a) 30
,
1
dx
x
∞
+∫ (b)
/2
4/30
sin 2 .
(sin )
x dxx
π
∫ , and (c)
0 2
.
1
dx
xx
∞
++∫
Ans. (a) 2
33
π  (b) 3 (c) does not exist
5.77. Evaluate
/22s i n
/2
// 4 .lim 1 cos 2
t
x
x
ex e e dt
x
π
π
ππ
→
−+
+
∫
Ans. e/2π
5.78. Prove: (a)
3
2
23 5 3 2(1 ) 3 2 3 2
x
x
d t t dt x x x x xdx ++ = + − + −∫ and
(b)
2
24 2cos 2 cos cos .
x
x
d td t x x xdx =−∫
5.79. Prove that (a)
0
1s i n 4xd x
π
+=∫ and (b)
/2
0
2l n ( 2 1 ) .sin cos
dx
xx
π
=++∫
5.80. Explain the fallacy
11
2211
,11
dx dyII xy−−
== −= −++∫∫  using the transformation x = 1/y. Hence, I = 0. But
I = tan–1(1) – tan–1(–1) = π/4 – (–π/4) = π/2. Thus, π/2 = 0.
5.81. Prove that
1/2 1
0 2
cos 1 1 .tan421
x dx
x
π −<
+∫
5.82. Evaluate 3/2
12 2 1 .lim
n
nn n
n→∞
⎧⎫ ++ + + + −⎪⎪⎨⎬
⎪⎪⎩⎭
LL
2.( 2 2 1 )3Ans −
5.83. 1 if is irrationalProve that ( ) is not Riemann integrable in [0, 1].0 if is rational
xfx x
⎧= ⎨
⎩
[Hint: In Equation (2), Page 98, let ξ k, k = 1, 2, 3, . . ., n  be first rational and then irrational points of
subdivision and examine the lower and upper sums of Problem 5.31.]
5.84. Prove the result (3) of Problem 5.31. (Hint: First consider the effect of only one additional point of
subdivision.)
5.85. In Problem 5.31, prove that s < S. (Hint: Assume the contrary and obtain a contradiction.)
5.86. If f(x) is sectionally continuous in [a, b], prove that ()
b
a
fx d x∫ exists. (Hint: Enclose each point of
discontinuity in an interval, noting that the sum of the lengths of such intervals can be made arbitrarily
small. Then consider the difference between the upper and lower sums.)
5.87.
2
0
20 1
If ( ) 3 1 , find ( ) .
61 1 2
xx
fx x fx d x
xx
<<⎧
⎪==⎨
⎪ −< <⎩
∫  Interpret the result graphically.
Ans. 9


## Page 134

CHAPTER 5  Integrals 123
5.88. Evaluate
3
0
1[] 2xx d x⎧⎫ −+⎨⎬⎩⎭∫  where [x] denotes the greatest integer less than or equal to x. Interpret the
result graphically.
Ans. 3
5.89. (a) Prove that
/2
0
sin
4sin cos
m
mm
x dxxx
π π=+∫  for all real values of m.
(b) Prove that
2
40
.1t a n
dx
x
π
π =+∫
5.90. Prove that
/2
0
sin exists.x dxx
π
∫
5.91. Show that
10.5
0
tan 0.4872 approximately.x dxx
−
=∫
5.92. Show that
2
20
.1c o s 22
xdx
x
π π=+∫


## Page 135

This page intentionally left blank


## Page 136

125
Partial Derivatives
Functions of Two or More Variables
The definition of a function was given in Chapter 3 (page 43). For us, the distinction for functions of two
or more variables is that the domain is a set of n -tuples of numbers. The range remains one- dimensional
and is referred to an interval of numbers. If n = 2, the domain is pictured as a two- dimensional region. The
region is referred to a rectangular Cartesian coordinate system described through number pairs (x , y), and
the range variable is usually denoted by z . The domain variables are independent, while the range variable
is dependent.
We use the notation f (x, y), F(x, y), etc., to denote the value of the function at (x, y) and write z = f (x, y),
z = F(x, y), etc. We also sometimes use the notation z = z(x, y), although it should be understood that in this
case z is used in two senses, namely, as a function and as a variable.
EXAMPLE. If f (x, y) = x2 + 2y3, then f (3, – 1) = (3)2 + 2(–1)3 = 7.
The concept is easily extended. Thus, w = F(x, y, z) denotes the value of a function at (x, y, z) (a point in
three-dimensional space), etc.
EXAMPLE. If 221( ) ,zx y=− +  the domain for which z is real consists of the set of points (x, y) such that
x2 + y2 <  1, i.e., the set of points inside and on a circle in the xy plane having center at (0, 0) and radius 1.
A three- dimensional rectangular Cartesian coordinate system is obtained by constructing three mutually
perpendicular axes (the x, y, and z axes) intersecting in a point (designated by 0 and called the origin). This
is a natural extension of the rectangular system x, y in the plane. A point in the three- dimensional Cartesian
system is represented by the triple of coordinates (x, y, z). The collection of points P(x, y, z), represented by
the implicit equation F(x, y, z) = 0, is a surface. The term surface is used in a very broad sense and requires
refinement according to the context in which it is to be used. For example, x 2 + y2 + z2 = r2 is the algebraic
representation of a surface in the large. This form might be employed in topology to indicate the property of
being closed rather than open. In analysis, which is the subject of this outline of advanced calculus, the con-
cern is with portions of a surface—that is, points and their neighborhoods. These may be obtained from
implicit representations by imposing restrictions. For example,
z = /H20857r2 − (x/H335262 + y2)/H33526with 1x2 + y21 < r
signifies an open upper hemisphere. Problems in surface theory employ partial derivatives and relate to a
point of a surface, the collection of points about it, the tangent plane at the point, and the properties of con-
tinuity and differentiability binding this structure. These concepts will be discussed in the following pages.
For functions of more than two variables such geometric interpretation fails, although the terminology is
still employed. For example, (x, y, z, w) is a point in four-dimensional space, and w = f (x, y, z) [or F(x, y, z,
w) = 0] represents a hypersurface in four dimensions; thus, x
2 + y2 + z2 + w2 = a2 represents a hypersphere in
four dimensions with radius a > 0 and center at (0, 0, 0, 0). 22 2 2() ,wa x y z=− + + x2 + y2 + z2 < a2 de-
scribes a function generated from the hypersphere.
CHAPTER 6


## Page 137

CHAPTER 6  Partial Derivatives126
Neighborhoods
The set of all points (x, y) such that ⏐x – x0⏐ < δ, ⏐y – y0⏐ < δ where δ > 0 is called a rectangular δ neighbor-
hood of (x0, y0); the set 0 < ⏐x – x 0⏐ < δ, 0 < ⏐y – y 0⏐ < δ, which excludes (x 0, y0), is called a rectangular
deleted δ neighborhood of (x0, y0). Similar remarks can be made for made for other neighborhoods; e.g., (x
– x0)2 + (y – y 0)2 < δ2 is a circular δ neighborhood of (x0, y0). The term open ball is used to designate this
circular neighborhood. This terminology is appropriate for generalization
to more dimensions. Whether neighborhoods are viewed as circular or
square is immaterial, since the descriptions are interchangeable. Simply
notice that given an open ball (circular neighborhood) of radius δ there is a
centered square whose side is of length less than
2 δ that is interior to the
open ball, and, conversely, for a square of side δ there is an interior centered
circle of radius less than δ/2. (See Figure 6.1.)
A point (x 0, y0) is called a limit point, accumulation point, or cluster
point of a point set S  if every deleted δ  neighborhood of (x 0, y0) contains
points of S. As in the case of one-dimensional point sets, every bounded infinite set has at least one limit
point (the Bolzano- Weierstrass theorem; see Chapter 1). A set containing all its limit points is called a
closed set.
Regions
A point P belonging to a point set S is called an interior point of S if there exists a deleted δ neighborhood of
P all of whose points belong to S. A point P not belonging to S is called an exterior point of S if there exists a
deleted δ neighborhood of P all of whose points do not belong to S. A point P is called a boundary point of S
if every deleted δ neighborhood of P contains points belonging to S and also points not belonging to S.
If any two points of a set S can be joined by a path consisting of
a finite number of broken line segments all of whose points belong
to S, then S  is called a connected set. A region is a connected set
which consists of interior points or interior and boundary points. A
closed region is a region containing all its boundary points. An open
region consists only of interior points. The complement of a set S in
the xy plane is the set of all points in the plane not belonging to S.
(See Figure 6.2.)
Examples of some regions are shown graphically in Figure 6.3(a),
(b), and (c) . The rectangular region of Figure 6.1(a), including the
boundary, represents the sets of points a
< x < b, c < y < d which
is a natural extension of the closed interval a < x < b for one dimen-
sion. The set a < x < b, c < y < d corresponds to the boundary being excluded.
Figure 6.3
Figure 6.1
Figure 6.2


## Page 138

CHAPTER 6  Partial Derivatives 127
In the regions of Figure 6.3(a) and (b), any simple closed curve (one which does not intersect itself any-
where) lying inside the region can be shrunk to a point which also lies in the region. Such regions are called
simply connected regions. In Figure 6.3(c), however, a simple closed curve ABCD surrounding one of the
“holes” in the region cannot be shrunk to a point without leaving the region. Such regions are called multiply
connected regions.
Limits
Let f (x, y) be defined in a deleted δ neighborhood of (x 0, y0) [i.e., f (x, y) may be undefined at (x0, y0)]. We
say that l is the limit of f(x,y) as x approaches x0 and y approaches y0 [or (x, y) approaches (x0, y0)] and write
0
0
lim
xx
yy
→
→
f (x, y) = l [or
00(,) ( , )
lim
xy x y→
f (x, y) = l] if for any positive number δ we can find some positive number
δ [depending on δ and (x 0, y0), in general] such that ⏐f (x, y) – l⏐ < δ whenever 0 < ⏐x – x 0⏐ < δ and 0 <
⏐y – y0⏐ < δ.
If desired, we can use the deleted circular neighborhood open ball 0 < (x – x0)2 + (y – y0)2 < δ2 instead of
the deleted rectangular neighborhood.
EXAMPLE. Let 3i f  ( , ) ( 1 , 2 )(, ) :0i f  ( , ) ( 1 , 2 )
xy x yfxy xy
≠⎧= ⎨ =⎩
 As x → 1 and y → 2 [or (x, y) → (1, 2)], f (x, y) gets
closer to 3(1)(2) = 6 and we suspect that
1
2
lim
x
x
→
→
f (x, y) = 6. To prove this, we must show that the preceding defi-
nition of limit, with l = 6, is satisfied. Such a proof can be supplied by a method similar to that of Problem 6.4.
Note that
1
2
lim
x
x
→
→
f (x, y) /HS11005f (1, 2) since f (1, 2) = 0. The limit would, in fact, be 6 even if f (x, y) were not
defined at (1, 2). Thus, the existence of the limit of f (x, y) as (x, y) → ( x0, y0) is in no way dependent on the
existence of a value of f (x, y) at (x0, y0).
Note that in order for
00(,) ( , )
lim
xy x y→
f (x, y) to exist, it must have the same value regardless of the approach of
(x, y) to (x0, y0). It follows that if two different approaches give different values, the limit cannot exist (see
Problem 6.7). This implies, as in the case of functions of one variable, that if a limit exists it is unique.
The concept of one-sided limits for functions of one variable is easily extended to functions of more than
one variable.
EXAMPLE 1. 11
00
11
lim tan ( / ) / 2, lim tan ( / ) / 2.
xx
yy
yx yxππ−−
→+ →−
→→
== −
EXAMPLE 2. 1
0
1
lim tan ( / )
x
y
yx−
→
→
 does not exist, as is clear from the fact that the two different approaches of
Example 1 give different results.
In general, the theorems on limits, concepts of infinity, etc., for functions of one variable (see Page 25)
apply as well, with appropriate modifications, to functions of two or more variables.
Iterated Limits
The iterated limits lim lim ( , ) lim lim ( ,
xx yy yy xx
fxy fx
→→ → →{}
00 0 0
and y y){}  [also denoted by
0
lim
xx→ 0
lim
yy→
f (x, y) and
0
lim
yy→ 0
lim
xx→
f (x, y), respectively] are not necessarily equal. Although they must be equal if
0
0
lim
xx
yy
→
→
f (x, y) is to exist, their
equality does not guarantee the existence of this last limit.


## Page 139

CHAPTER 6  Partial Derivatives128
EXAMPLE. If (, ) , xyxy xy
−= +
 then
00 0 00 0
lim lim lim (1) 1 and lim lim lim( 1) 1.
xy y yx y
xy xy
xy xy→→ → →→ →
⎛⎞ ⎛⎞ −− == = − = −⎜⎟ ⎜⎟ ++⎝⎠ ⎝⎠
Thus, the iterated limits are not equal and so
0
0
lim
x
y
→
→
f (x, y) cannot exist.
Continuity
Let f (x, y) be defined in a δ neighborhood of (x0, y0) [i.e., f(x, y) must be defined at (x0, y0) as well as near it].
We say that f(x, y) is continuous at (x0, y0) if for any positive number δ we can find some positive number δ
[depending on δ and (x0, y0) in general] such that ⏐f (x, y) – f(x0, y0)⏐ < δ whenever ⏐x – x0⏐ < δ and ⏐y – y0⏐
< δ, or, alternatively, (x – x0)2 + (y – y0)2 < δ2.
Note that three conditions must be satisfied in order for f(x, y) to be continuous at (x0, y0):
1.
00(, ) ( , )
lim
xy x y→
f (x, y) = l; i.e., the limit exists as (x, y) → (x 0, y0).
2. f (x0, y0) must exist; i.e., f (x, y) is defined at (x0, y0).
3. l = f (x0, y0).
If desired, we can write this in the suggestive form
0
0
lim
xx
yy
→
→
f (x, y) = f (
0
lim
xx→
x,
0
lim
yy→
y).
EXAMPLE. If 3( , ) ( 1 , 2 )f (, ) ,0( , ) ( 1 , 2 )
xy x yfxy xy
≠⎧= ⎨ =⎩
 then
(,) ( 1 , 2 )
lim ( , ) 6 (1, 2).
xy
fxy f
→
=≠ Hence, f (x, y) is not
continuous at (1, 2). If we redefine the function so that f (x, y) = 6 for (x, y) = (1, 2), then the function is contin-
uous at (1, 2).
If a function is not continuous at a point (x 0, y0), it is said to be discontinuous at (x 0, y0), which is then
called a point of discontinuity. If, as in the preceding example, it is possible to redefine the value of a function
at a point of discontinuity so that the new function is continuous, we say that the point is a removable dis-
continuity of the old function. A function is said to be continuous in a region ℜ of the xy plane if it is con-
tinuous at every point of ℜ.
Many of the theorems on continuity for functions of a single variable can, with suitable modification, be
extended to functions of two more variables.
Uniform Continuity
In the definition of continuity of f(x, y) at (x0, y0), δ depends on δ and also (x0, y0) in general. If in a region ℜ
we can find a δ which depends only on δ but not on any particular point (x0, y0) in ℜ  (i.e., the same δ will work
for all points in ℜ ), then f (x, y) is said to be uniformly continuous in ℜ . As in the case of functions of one
variable, it can be proved that a function which is continuous in a closed and bounded region is uniformly
continuous in the region.
Partial Derivatives
The ordinary derivative of a function of several variables with respect to one of the independent varia-
bles, keeping all other independent variables constant, is called the partial derivative of the function
with respect to the variable. Partial derivatives of f (x, y) with respect to x and y  are denoted by
or , ( , ), and or , ( , ), ,xx yy
y x
ff ff f xy f f xyxx y y
⎡⎤ ⎡⎤∂∂ ∂ ∂⎢⎥ ⎢⎥∂∂ ∂⎢⎥ ⎣⎦⎣⎦ x∂  respectively, the latter notations being used when
needed to emphasize which variables are held constant.


## Page 140

CHAPTER 6  Partial Derivatives 129
By definition,
00
( , )( , ) ( , )( , )lim , lim
xy
f fx xy fxy f fxy y fxy
xx yyΔ→ Δ→
∂+ Δ − ∂ + Δ −==∂Δ ∂Δ  (1)
when these limits exist. The derivatives evaluated at the particular point (x 0, y0) are often indicated by
00 00
00 0 0
(, ) (, )
(, ) a n d (, ) ,xx
xy xy
ff fxy fxyxy
∂∂ ==∂∂  respectively.
EXAMPLE. If f (x, y) = 2x3 + 3xy2, then fx = ∂f/∂x = 6x2 + 3y2 and fy = ∂f/∂y = 6xy. Also, f (1, 2) = 6(1)2 + 3(2)2
= 18, fy(1, 2) = 6(1)(2) = 12.
If a function f has continuous partial derivatives ∂f/∂x, ∂f/∂y in a region, then f must be continuous in the
region. However, the existence of these partial derivatives alone is not enough to guarantee the continuity of f
(see Problem 6.9).
Higher-Order Partial Derivatives
If f (x, y) has partial derivatives at each point (x, y) in a region, then ∂f/∂x and ∂f/∂y are themselves functions
of x and y, which may also have partial derivatives. These second derivatives are denoted by are denoted by
22 2 2
22 ,, ,xx yy yx xy
ff ff f f f f ff f fxx yy xy x y yx y xxy
⎛⎞ ⎛⎞∂∂ ∂ ∂∂ ∂ ∂∂ ∂ ∂∂ ∂⎛⎞ ⎛⎞== == = = = = ⎜⎟ ⎜⎟⎜⎟ ⎜⎟∂∂ ∂∂ ∂∂ ∂ ∂ ∂∂ ∂ ∂∂∂⎝⎠ ⎝⎠⎝⎠ ⎝⎠
 (2)
If fxy and fyx are continuous, then fxy = fyx and the order of differentiation is immaterial; otherwise they may
not be equal (see Problems 6.13 and 6.41).
EXAMPLE. If f (x, y) = 2x3 + 3xy2 (see preceding example), then fxx = 12x, fyy = 6x, and fxy = 6y = fyx. In such
case fxx(1, 2) = 12, fyy (1, 2) = 6, and fxy(1, 2) = fyx(1, 2) = 12.
In a similar manner, higher order derivatives are defined. For example,
3
2 yxx
f fxy
∂ =∂∂  is the derivative of f
taken once with respect to y and twice with respect to x.
Differentials
(The section on differentials in Chapter 4 should be read before beginning this one.)
Let Δx = dx and Δy = dy be increments given to x and y, respectively. Then
 Δ z = f (x + Δx, y + Δy) – f (x, y) = Δf (3)
is called the increment in z = f (x, y). If f (x, y) has continuous first partial derivatives in a region, then
12 1 2
ff z zzx y x y d x d y d x d y fxy x yεε ε ε∂∂ ∂ ∂Δ = Δ + Δ+ Δ+ Δ= + + + = Δ∂∂ ∂ ∂/H9280/H9280 /H9280/H9280  (4)
where /H92801 and /H92802 approach zero as Δx and Δy approach zero (see Problem 6.14). The expression
orzz ffdz dx dy df dx dyxy xy
∂∂ ∂∂=+ =+∂∂ ∂∂  (5)
is called the total differential or simply the differential of z or f, or the principal part of Δz or Δf. Note that
Δz /HS11005dz in general. However, if Δx = dx and Δy = dy are “small,” then dz is a close approximation of Δz (see
Problem 6.15). The quantities dx and dy—called differentials of x and y, respectively—need not be small.
The form dz = f
x(x0, y0)dx + fy(x0, y0)dy signifies a linear function with the independent variables dx and
dy and the dependent range variable dz. In the one-variable case, the corresponding linear function represents
the tangent line to the underlying curve. In this case, the underlying entity is a surface and the linear function
generates the tangent plane at P
0. In a small enough neighborhood, this tangent plane is an approximation of
the surface (i.e., the linear representation of the surface at P0). If y is held constant, then we obtain the curve


## Page 141

CHAPTER 6  Partial Derivatives130
of intersection of the surface and the coordinate plane y = y0. The differential form reduces to dz = fx(x0, y0)
dx (i.e., the one- variable case). A similar statement follows when x is held constant. (See Figure 6.4.)
Figure 6.4
If f is such that Δf (or Δz) can be expressed in the form of Equation (4) where /H92801 and /H92802 approach zero as
Δx and Δy approach zero, we call f differentiable at (x, y). The mere existence of fx and fy does not in itself
guarantee differentiability; however, continuity of fx and f y does (although this condition happens to be
slightly stronger than necessary). In case fx and fy are continuous in a region ℜ, we say that f is continuously
differentiable in ℜ.
Theorems on Differentials
In the following, we assume that all functions have continuous first partial derivatives in a region ℜ; i.e., the
functions are continuously differentiable in ℜ.
1. If z = f (x1, x2, . . . , xn), then
12
12
n
n
ff fdf dx dx dxxx x
∂∂ ∂=+ + +∂∂ ∂ L. . .  (6)
regardless of whether the variables x1, x2, . . ., xn are independent or dependent on other variables (see
Problem 6.20). This is a generalization of result in Equation (5). In Euqtion (6) we often use z in place
of f.
2. If f (x1, x2, . . ., xn) = c, a constant, then df = 0. Note that in this case x1, x2, . . ., xn cannot all be inde-
pendent variables.
3. The expression P(x, y)dx + Q(x, y)dy, or, briefly, P dx + Q dy, is the differential of f (x, y) if and only
if .PQ
yx
∂∂ =∂∂  In such case, P dx + Q dy is called an exact differential.
Note: Observe that PQ
yx
∂∂ =∂∂  implies that
22
.ff
yx xy
∂∂ =∂∂ ∂∂
4. The expression P(x, y, z) dx + Q(x, y, z)dy + R(x, y, z)dz, or, briefly, P dx + Q dy + R dz, is the differ-
ential of f (x, y, z) if and only if ,,.PQ QR RP
yx zy xz
∂∂ ∂∂ ∂∂== =∂∂ ∂∂ ∂∂  In such case, P dx + Q dy + R dz is
called an exact differential.
Proofs of Theorems 3 and 4 are best supplied by methods of later chapters (see Problems 10.13 and 10.30).


## Page 142

CHAPTER 6  Partial Derivatives 131
Differentiation of Composite Functions
Let z = f(x, y) where x = g(r, s), y = h(r, s) so that z is a function of r and s. Then
,zz xz y zz xz y
rx ry r sx sy s
∂∂ ∂∂ ∂ ∂∂ ∂∂ ∂=+ =+∂∂ ∂∂ ∂ ∂∂ ∂∂ ∂  (7)
In general, if u = F(x1, . . . , xn) where x1 = f1(r1, . . ., rp), . . ., xn = fn (r1, . . . , rp), then
12
12
1, 2, ,
kk k n k
xxuu u u u kprx rx r x r
∂∂∂∂ ∂ ∂ ∂=+ + + =∂∂ ∂∂ ∂ ∂ ∂ LK. . . . . .  (8)
If, in particular, x1, x2, . . . , xn depend on only one variable s, then
12
12
n
n
dxdx dxdu u u u
ds x ds x ds x ds
∂∂ ∂=+ + +∂∂ ∂ L. . .  (9)
These results, often called chain rules, are useful in transforming derivatives from one set of variables to
another.
Higher derivatives are obtained by repeated application of the chain rules.
Euler’s Theorem on Homogeneous Functions
A function represented by F(x1, x2, . . ., x2, . . . , xn) is called homogeneous of degree p if, for all values of the
parameter λ and some constant p, we have the identity
 F (λx1, λx2, . . . , λxn) = λp F(x1, x2, . . . , xn) (10)
EXAMPLE. F(x, y) = x4 + 2xy3 – 5y4 is homogeneous of degree 4, since
F(λx, λy) = (λx)4 + 2(λx)(λy)3 – 5(λy)4 = λ4(x4 + 2xy3 – 5y4) = λ4F(x, y)
Euler’s theorem on homogeneous functions states that if F(x1, x2, . . . , x n) is homogeneous of degree p,
then (see Problem 6.25)
12
12
n
n
FF Fxx x p Fxx x
∂∂ ∂++ +=∂∂ ∂ L. . .  (11)
Implicit Functions
In general, an equation such as F(x, y, z) = 0 defines one variable—say, z—as a function of the other two
variables x and y. Then z is sometimes called an implicit function of x and y, as distinguished from an explicit
function f, where z = f (x, y), which is such that F[x, y, f (x, y)] ≡ 0.
Differentiation of implicit functions requires considerable discipline in interpreting the independent and
dependent character of the variables and in distinguishing the intent of one’s notation. For example, suppose
that in the implicit equation F[x, y, f (x, z)] = 0, the independent variables are x and y and that z = f (x, y). In
order to find and ,ff
xy
∂∂
∂∂  we initially write the following [observe that F(x, t, z) is zero for all domain pairs
(x, y); i.e., it is a constant]:
0 = dF = Fx dx + Fy dy + Fz dz
and then compute the partial derivatives Fx, Fy, Fz as though y, y, z constituted an independent set of variables.
At this stage we invoke the dependence of z on x and y to obtain the differential form .ffdz dx dyxy
∂∂=+∂∂
Upon substitution and some algebra (see Problem 6.30), the following results are obtained:


## Page 143

CHAPTER 6  Partial Derivatives132
,
yx
zz
FFff
xF yF
∂∂ =− =−∂∂
EXAMPLE. If 0 = F(x, y, z) = x2z + yz2 + 2xy2 – z3 and z = f (x, y), then Fx = 2xz + 2y2, Fy = z2 + 4xy.
Fz = x2 + 2yz – 3z2. Then
22
22 2 2
(2 2 ) ( 4 ),23 23
fx z y f z x y
xy xy z z xy z x
∂+ ∂ +=− =−∂∂ +− +−
Observe that f need not be known to obtain these results. If that information is available, then (at least
theoretically) the partial derivatives may be expressed through the independent variables x and y.
Jacobians
If F(u, υ) and G(u, υ) are differentiable in a region, the Jacobian determinant, or the Jacobian, of F and G
with respect to u and υ is the second-order functional determinant defined by
(, )
(, )
u
u
FF
FFFG u
GGGGu
u
υ
υ
υ
υ
υ
∂∂
∂ ∂∂==∂∂∂
∂∂
 (12)
Similarly, the third-order determinant
(, , )
(, , )
uw
uw
uw
FFF
FGH GGGuw HHH
υ
υ
υ
υ
∂ =∂
is called the Jacobian of F, G, and H with respect to u, υ, and w. Extensions easily made.
Partial Derivatives Using Jacobians
Jacobians often prove useful in obtaining partial derivatives of implicit functions. Thus, for example, given
the simultaneous equations
F(x, y, u, υ) = 0,   G(x, y, u, υ) = 0
we may, in general, consider u and υ as functions of x and y. In this case, we have (see Problem 6.31)
(, ) (, ) (, ) (, )
(, ) (, ) (, ) (, ),, ,(, ) (, ) (, ) (, )
(, ) (, ) (, ) (, )
FG FG FG FG
uu xyu x u y
FG FG FG FGxyx y
u uuu
υυυυ
υ υυυ
∂ ∂∂∂
∂∂∂ ∂ ∂ ∂∂∂=− =− =− =−∂ ∂∂∂∂∂∂ ∂
∂ ∂∂∂
The ideas are easily extended. Thus, if we consider the simultaneous equations
F(u, υ, w, x, y) = 0,   G(u, υ, w, x, y) y) = 0,   H(u, υ, w, x, y) = 0
we may, for example, consider u, υ, and w as functions of x and y. In this case,
(, , ) (, , )
(, , ) (, , ),(, , ) (, , )
(, , ) (, , )
FGH FGH
uw xw uy
FGH FGHxy
uw uw
υυ
υυ
∂∂
∂∂ ∂∂=− =−∂∂∂∂
∂∂
with similar results for the remaining partial derivatives (see Problem 6.33).


## Page 144

CHAPTER 6  Partial Derivatives 133
Theorems on Jacobians
In the following we assume that all functions are continuously differentiable.
1. A necessary and sufficient condition that the equations F(u, υ, x, y, z) = 0 and G(u, υ, x, y, z) = 0 can
be solved for u and υ (for example) is that (, )
(, )
FG
u υ
∂
∂  is not identically zero in a region ℜ.
Similar results are valid for m equations in n variables, where m < n.
2. If x and y are functions of u and υ while u and υ are functions of and s, then (see Problem 6.43)
(, ) (, ) (, )
(, ) (, ) (, )
xy xy u
rs u rs
υ
υ
∂∂ ∂ =∂∂ ∂  (13)
This is an example of a chain rule for Jacobians. These ideas are capable of generalization (see Prob-
lems 6.107 and 6.109, for example).
3. If u = f(x, y) and υ = g(x, y), then a necessary and sufficient condition that a functional relation of the
form φ(u, υ) = 0 exists between u and υ is that (, )
(, )
u
xy
υ ∂
∂  be identically zero Similar results. hold for n
functions of n variables.
Further discussion of Jacobians appears in Chapter 7, where vector interpretations are employed.
Transformations
The set of equations
(, )
(, )
xF u
yF u
υ
υ
=⎧
⎨ =⎩
 (14)
defines, in general, a transformation or mapping which establishes a correspondence between points in the
uυ and xy planes. If to each point in the uυ plane there corresponds one and only one the xy plane, and con-
versely, we speak of a one-to-one transformation or mapping. This will be so if F and G are continuously
differentiable, with Jacobian not identically zero in a region. In such case (which we assume unless otherwise
stated), Equations (14) are said to define a continuously differentiable transformation or mapping.
The words transformation  and mapping describe the same mathematical concept in different ways. A
transformation correlates one coordinate representation of a region of space with another. A mapping views
this correspondence as a correlation of two distinct regions.
Under the transformation (14) a closed region ℜ of the xy plane is, in general, mapped into a closed region
ℜ′ of the uυ plane. Then if ΔA
xy and ΔAuυ denote, respectively, the areas of these regions, we can show that
(, )lim (, )
xy
u
A xy
Auυ υ
Δ ∂=Δ∂  (15)
where lim denotes the limit as ΔAxy (or ΔAuυ) approaches zero. The Jacobian on the right of Equation (15) is
often called the Jacobian of the transformation (14).
If we solve transformation (14) for u and υ in terms of x and y, we obtain the transformation u = f (x, y), υ =
g(x, y), often called the inverse transformation corresponding to (14). The Jacobians (, ) (, )and(, ) (, )
ux y
xy u
υ
υ
∂∂
∂∂  of
these transformations are reciprocals of each other (see Problem 6.43). Hence, if one Jacobian is different from
zero in a region, the inverse exists and is not zero.
These ideas can be extended to transformations in three or higher dimensions. We deal further with these
topics in Chapter 7, where use is made of the simplicity of vector notation and interpretation.


## Page 145

CHAPTER 6  Partial Derivatives134
Curvilinear Coordinates
Rectangular Cartesian coordinates in the Euclidean plane or in three- dimensional space were mentioned at
the beginning of this chapter. Other coordinate systems, the coordinate curves of which are generated from
families that are not necessarily linear, are useful. These are called curvilinear coordinates.
EXAMPLE 1. Polar coordinates ρ, Φ are related to rectangular Cartesian coordinates through the transforma-
tion x =ρ  cos Φ and y =ρ  sin Φ. The curves Φ=Φ 0 are radical lines, while ρ=r 0 are concentric circles.
Among the convenient representations yielded by these coordinates are circles with the center at the origin. A
weakness is that representations may not be defined at the origin.
EXAMPLE 2. Spherical coordinates r, Θ, Φ 0 for Euclidean three- dimensional space are generated from rect-
angular Cartesian coordinates by the transformation equations x = r sin Θ cos Φ, y = r sin Θ sin Φ, and z = r cos
Φ. Again, certain problems lend themselves to spherical coordinates, and also uniqueness of representation can
be a problem at the origin. The coordinate surfaces r = r
0, Θ=Θ 0, and Φ=Φ 0 are spheres, planes, and cones,
respectively. The coordinate curves are the intersections of these surfaces, i.e., circles, circles, and lines.
For curvilinear coordinates in higher dimensional spaces, see Chapter 7.
Mean Value Theorem
If f (x, y) is continuous in a closed region and if the first partial derivatives exist in the open region (i.e., ex-
cluding boundary points). then
 f (x0 + h, y0 + k) – f (x0, y0) = hfx (x0 + θh, y0 + θk) + kfy(x0 + θh, y0 + θk)   0 < θ < 1 (16)
This is sometimes written in a form in which h = Δx = x – x0 and k = Δy = y – y0.
SOLVED PROBLEMS
Functions and graphs
6.1. 32 12 ( , ) ( ,)If ( , ) 2 3 , find: (a) , ; ( ) , 0.fxy k fxyfxy x x y y f c kxy k
⎛⎞ +−=− + ≠⎜⎟⎝⎠
(a) f (–2,3) = (–2)3 – 2(–2)(3) + 3(3)2 = –8 + 12 + 27 = 31
(b)
23
32
12 1 1 2 2 1 4 1 2,2 3f xy x x y y x y xy
⎛⎞ ⎛ ⎞ ⎛ ⎞⎛⎞ ⎛⎞=− + = − +⎜⎟ ⎜ ⎟ ⎜ ⎟⎜⎟ ⎜⎟⎝⎠ ⎝⎠⎝⎠ ⎝ ⎠ ⎝ ⎠
(c)
32 3 2
32 2 2 2
2
(, ) (, ) 1 {[ 2 ( ) 3( ) ] [ 2 3 ]}
1 (22363 23 )
1 (2 6 3 ) 2 6 3.
fxy k fxy x x yk yk x x y ykk
x xy kx y ky k x xy yk
kx ky k x y kk
+− =− + + + − − +
=− − + + + − + −
=− = + = −+ +
–
6.2. Give the domain of definition for which each of the following functions is defined and real, and indicate this
domain graphically.
(a) f (x, y) = ln{(16 – x2 – y2)(x2 + y2 – 4)}
The function is defined and real for all points (x, y) such that
(16 – x2 – y2)(x2 + y2 – 4) > 0,   i.e., 4 < x 2 + y2 < 16


## Page 146

CHAPTER 6  Partial Derivatives 135
which is the required domain of definition. This point set consists of all points interior to the circle of radius
4 with center at the origin and exterior to the circle of radius 2 with center at the origin, as in Figure 6.5.
The corresponding region, shown shaded in
Figure 6.5, is an open region.
(b)
(, ) 6 ( 2 3)fxy x y =− +
The function is defined and real for all
points (x, y) such that 2 x + 3y <  6, which is
the required domain of definition.
The corresponding (unbounded) region
of the xy plane is shown shaded in Figure 6.6.
6.3. Sketch and name the surface in three-dimensional space represented
by each of the following. What are the traces on the coordinate
planes?
(a) 2x + 4y + 3z = 12.
Trace on xy plane (z = 0) is the straight line x + 2y = 6, z = 0.
Trace on yz plane (x = 0) is the straight line 4y + 3z = 12, x = 0.
Trace on xz plane (y = 0) is the straight line 2x + 3z = 12, y = 0.
These are represented by AB, BC, and AC in Figure 6.7.
The surface is a plane intersecting the x,y, and z axes in the points
A(6, 0, 0), B(0, 3, 0), and C(0, 0, 4). The lengths
6, 3,OA OB==  and
4OC = are called the x, y, and z intercepts, respectively.
(b)
22 2
22 2 1xyz
abc+−=
Trace on xy plane (z = 0) is the ellipse
22
22 1, 0.xy zab += =
Trace on yz plane (x = 0) is the hyperbola
22
22 1, 0.yz xbc −= =
Trace on xz plane (y = 0) is the hyperbola
22
22 1, 0.xz yac −= =
Trace on any plane z = p parallel to the xy plane is the ellipse
22
22 2 22 2 1
(1 / ) (1 / )
xy
ap c bp c +=++
.
As ⏐p⏐ increases from zero, the elliptic cross section increases in size.
The surface is a hyperboloid of one sheet (see Figure 6.8).
Figure 6.8
Figure 6.5
Figure 6.6
Figure 6.7


## Page 147

CHAPTER 6  Partial Derivatives136
Limits and continuity
6.4. Prove that 2
1
2
lim ( 2 ) 5.
x
y
xy
→
→
+=
Method 1, using definition of limit.
We must show that, given any δ > 0, we can find δ > 0 such that ⏐x2 + 2y – 5⏐ < δ when 0 < ⏐x – 1⏐ < δ,
0 < ⏐y – 2⏐ < δ.
If 0 < ⏐x – 1⏐ < δ and 0 <⏐y – 2⏐ < δ, then 1 – δ x < 1 + < δ and 2 – δ < y < 2 + δ, excluding x = 1,
y = 2.
Thus, 1 – 2δ + δ 2 < x2 < 1 + 2δ + δ 2 and 4 – 2δ < 2y < 4 + 2δ. Adding
5 – 4δ + δ 2 < x2 + 2y < 5 + 4δ + δ 2 or -48 + δ 2 < x2 + 2y – 5 < 4δ + δ 2
Now, if δ <  1, it certainly follows that –5δ < x2 + 2y – 5 < 5δ; i.e., ⏐x2 + 2y – 5⏐ < 5δ whenever 0 < ⏐x – 1⏐
< δ, 0 < ⏐y – 2⏐ < δ. Then, choosing 5δ = /H9280, i.e., δ = /H9280/5 (or δ = 1, whichever is smaller), it follows that ⏐x2 + 2y – 5⏐
< /H9280 when 0 < ⏐x – 1⏐ < δ, 0 < ⏐y – 2⏐ < δ; i.e.,
1
2
lim
x
y
→
→
 (x2 + 2y) = 5.
Method 2, using theorems on limits.
22
11 1
22 2
lim( 2 ) lim lim 2 1 4 5
xx x
xx x
xy x y
→→ →
→→ →
+= + = + =
6.5. Prove that f (x, y) = x2 + 2y is continuous at (1, 2).
By Problem 6.4,
1
2
lim
x
y
→
→
f (x, y) = 5. Also, f (1, 2) = 12 + 2(2) = 5.
Then
1
2
lim
x
y
→
→
f (x, y) = f (1, 2) and the function is continuous at (1, 2).
Alternatively, we can show, in much the same manner as in the first method of Problem 6.4, that given
any δ > 0 we can find δ > 0 such that ⏐f (x, y) – f (1, 2)⏐ < δ when ⏐x – 1⏐ < δ, ⏐y – 2⏐ < δ.
6.6. Determine whether
2 2, (, ) ( 1 , 2 )(, )
0, ( , ) (1, 2)
xy x yfxy
xy
+≠=
=
(a) has a limit as x → 1 and y → 2, and (b) is
continuous at (1, 2).
(a) By Problem 6.4, it follows that
1
2
lim ( , ) 5,
x
x
fxy
→
→
=  since the limit has nothing to do with the value at (1, 2).
(b) Since
1
2
lim ( , ) 5
x
x
fxy
→
→
=  and f (1, 2) = 0, it follows that
1
2
lim ( , ) (1, 2).
x
y
fxy f
→
→
≠  Hence, the function is
discontinuous at (1, 2).
6.7. Investigate the continuity of ()
22
22 (, ) ( 0 , 0 )(, ) .a t0 , 0.
0( , ) ( 0 , 0 )
xy xyfxy xy
xy
⎧ − ≠⎪= +⎨
⎪ =⎩
Let x → 0 and y → 0 in such a way that y = mx (a line in the xy plane). Then, along this line,
22 2 2 2 2 2 2
22 2 2 2 2 2 200 0
0
(1 ) 1lim lim lim (1 ) 1xx x
y
xy xm x x m m
xy xm x x m m→→ →
→
−− − −===++ + +
Since the limit of the function depends on the manner of approach to (0, 0) (i.e., the slope m of the line),
the function cannot be continuous at (0, 0).
Another method:
22 2 22
22 2 2200 0 00 0
0
Since lim lim lim 1 and lim lim 1 are not equal, lim ( , )
xx x xx x
y
xy y xy fxyxy x xy→→ → →→ →
→
⎧⎫ ⎧⎫ −− == = −⎨⎬ ⎨⎬ ++⎩⎭ ⎩⎭
 cannot exist.
Hence, f (x, y) cannot be continuous at (0, 0).


## Page 148

CHAPTER 6  Partial Derivatives 137
Partial derivatives
6.8. If f (x, y) = 2x2 – xy + y2, find (a) ∂ f/ ∂ x and (b) ∂ f/ ∂ y at (x0, y0) directly from the definition.
(a)
00
00 0 0
00 0
(,)
22 2 2
0 0 00 00 00
0
2
00
00 0 000
(, ) ( , )( , ) lim
[2( ) ( ) ] [2 ]lim
42lim lim(4 2 ) 4
x h
xy
h
hh
fx hy fx yf fxyxh
xh xh yy xx yy
h
hx h hy xh y x yh
→
→
→→
+−∂ ==∂
+−+ += − +=
+−== + − = −
(b)
00
00 00
00 0
(,)
22 2 2
00 0 0 00 00
0
2
00
00 0000
(, ) (, )( , ) lim
[ 2 () () ] [ 2 ]lim
2lim lim( 2 ) 2
y k
xy
k
kk
fx y k fx yf fxyyk
xx yk yk xx yy
k
kx ky k xy k xyk
→
→
→→
+−∂ ==∂
−+ + + − − +=
−+ +== − + + = − +
Since the limits exist for all points (x0, y0), we can write fx(x, y) = fx = 4x – y, fy (x, y) = fy = –x + 2y, which
are themselves functions of x and y.
Note that formally fx(x0, y0) is obtained from f (x, y) by differentiating with respect to x, keeping y constant
and then putting x = x0, y = y0. Similarly, fy(x0, y0) is obtained by differentiating f with respect to y, keeping x
constant. This procedure, while often lucrative in practice, need not always yield correct results (see Problem
6.9). It will work if the partial derivatives are continuous.
6.9.
22/( ) ( , ) (0, 0)Let ( , ) .
0o therwise
xy x y x yfxy ⎧ +≠= ⎨
⎩
 Prove that (a) both fx(0, 0) and fy(0, 0) exist but that (b)
f (x, y) is discontinuous at (0, 0).
(a)
00
00
(, 0 ) ( 0 , 0 ) 0(0, 0) lim lim 0
(0, 0) (0, 0) 0(0, 0) lim lim 0
x hh
x kk
fh ff hh
fff kk
→→
→→
−== =
−== =
(b) Let (x, y) → (0, 0) along the line y = mx in the xy plane. Then
2
22 2 200
0
lim ( , ) lim 1xx
y
mx mfxy xm x m→→
→
== ++
so that the limit depends on m and, hence, on the approach; therefore, it does not exist. Hence, f ( x, y) is
not continuous at (0, 0).
Note that unlike the situation for functions of one variable, the existence of the first partial derivatives at
a point does not imply continuity at the point.
Note also that if
22 3 2
22 2 22 2(, ) ( 0 , 0 ) , ,() ()
xy
yx y xx yxy f fxy xy
−−≠= = ++
 and fx(0, 0), fy(0, 0) cannot be com-
puted from them by merely letting x = 0 and y = 0. See the remark at the end of Problem 4.5(b).
6.10. If φ(x, y) = x3y +
2xye , find (a) φx, (b) φy φxx, (d) φyy, (e) φxy, and (f)φyx.
(a)
22 232 2 2 2() 3 3 xy xy xy
x xy e xy e y xy yexx
φφ ∂∂== + = +⋅ = +∂∂
(b)
22 233 3() 22 xy xy xy
y xy e x e x y x x y eyy
φφ ∂∂== + = +⋅= +∂∂
(c)
22 2
2
22 2 2 4
2 (3 ) 6 ( ) 6xy xy xy
xx xy y e x y y e y x y yexx xx
φφφ ∂∂ ∂ ∂ ⎛⎞== = + =+ ⋅ =+⎜⎟∂∂ ∂∂ ⎝⎠


## Page 149

CHAPTER 6  Partial Derivatives138
(d)
22 2
22 2 2
2
3
2
22
(2 ) 0 2 ( ) ( 2 )
22 2 2
xy xy xy
yy
xy xy xy xy
x xy e xy e e xyyy yy
xy e xy e x x y e x e
φφ ∂∂ ∂ ∂== + = + ⋅ +∂∂ ∂∂
=⋅ ⋅+⋅ = +
(e)
22 2
22
2
22 2 2
23
(3 ) 3 2 2
32 2
xy xy xy
xy
xy xy
xy y e x y e x y e yyx y x y
xx y e y e
φφφ ∂∂ ∂ ∂ ⎛⎞== = + = + ⋅ ⋅ + ⋅⎜⎟∂∂ ∂ ∂ ∂ ⎝⎠
=+ +
(f)
22 2
22
2
32 2
23
(2 ) 3 2 2
32 2
xy xy xy
yx
xy xy
xx y e x y e x y e yxy x y x
xx y e y e
φφφ ⎛⎞∂∂ ∂ ∂== = + = + ⋅ ⋅ + ⋅⎜⎟∂∂ ∂ ∂ ∂ ⎝⎠
=+ +
Note that φxy = φyx in this case. This is because the second partial derivatives exist and are continuous for
all (x, y) in a region ℜ. When this is not true, we may have φ xy /HS11005φyx (see Problem 6.41, for example).
6.11. Show that U(x, y, z) = (x2 + y2 + z2)–1/2 satisfies Laplace’s partial differential equation
222
222 0.UUU
xyz
∂∂∂ ++=∂∂∂
We assume here that (x, y, z) /HS11005 (0, 0, 0). Then
2 2 23 / 2 2 2 23 / 2
2
2 2 23 / 2 2 2 25 / 2 2 2 23 / 2
2
22 2 2 2 2 2
2 2 25 / 2 2 2 25 / 2 2 2 25 / 2
1 () 2 ( )2
3[( ) ] () [ ( ) 2 ] ( ) ( 1 ) 2
3( ) 2
() ( ) ( )
U xyz x x x yzx
U x xyz x x yz x xyzxx
xx y z x y z
xy z x y z x y z
−−
−− −
∂ =− + + ⋅ =− + +∂
∂∂ = − + + = − − + +⋅ + + +⋅ −∂∂
++ −−=− = ++ ++ ++
Similarly,
22 2 2 22 2 2
22 2 2 5 / 2 22 2 2 5 / 2
22 ,() ()
Uy x z Uz x y
yx y z xx y z
∂− − ∂− −==∂+ + ∂+ +
Adding,
222
222 0UUU
xyz
∂∂∂ ++=∂∂∂
6.12.
2
21If tan , find at (1, 1).yzzx xx y
− ∂= ∂∂
23
22
22 2 2 2
11
1( / )
zy x xxxyy x xyx x y x y
∂∂ ⎛⎞=⋅ =⋅ ⋅ =⎜⎟∂∂ ++ +⎝⎠
23 2 2 2 3
22 22 2 2
( )(3 ) ( )(2 ) 2 3 1 2 1 at (1, 1)() 2
zz x x y x x x
xy x y x xy xy
⎛⎞⎛⎞∂∂ ∂ ∂ + − ⋅ − ⋅== = = =⎜⎟⎜⎟∂∂ ∂ ∂ ∂ ++⎝⎠ ⎝⎠
The result can be written zxy (1, 1) = 1.
Note: In this calculation we are using the fact that zxy is continuous at (1, 1) (see the remark at the end of
Problem 6.9).
6.13. If f (x, y) is defined in a region ℜ and if f xy and fyx exist and are continuous at a point of ℜ, prove that f xy = fyx
at this point.
Let (x0, y0) be the point of ℜ. Consider
G = f (x0 + h, y0 + k) – f (x0, y0 + k) – f (x0 – h, y0) + f (x0, y0)


## Page 150

CHAPTER 6  Partial Derivatives 139
Define
 φ (x, y) = f (x + h, y) – f (x, y) (1)
 ψ (x, y) = f (x, y + k) – f (x, y) (2)
Then
 G  = φ (x0, y0 + k) – φ (x0, y0) (3)
G = ψ (x 0 + h, y0) – ψ(x 0, y0) (4)
Applying the mean value theorem for functions of one variable (see Page 78) to Equations (3) and (4),
we have
 G  = kφy (x0, y0 + θ 1 k) = k{fy (x0 + h, y0 + θ1–k) – fy (x0, y0 + θ1k)} 0 < θ1 < 1 (5)
 G  = hψ x(x0, + θ2h, y0) = h{fx(x0 + θ2h, y0 + k) – fx(x0 + θ2h, y0)} 0 < θ2 < 1 (6)
Applying the mean value theorem again to Equations (5) and (6), we have
G = hk fyx (x0 + θ3h, y0 + θ1k)   0 < θ1 < 1, 0 < θ3 < 1 (7)
G = hk fxy (x0 + θ2h, y0 + θ4k)   0 < θ2 < 1, 0 < θ4 < 1 (8)
From Equations (7) and (8) we have
fyx(x0 + θ3h, y0 + θ1k) = fxy(x0 + θ2h, y0 + θ4k) (9)
Letting h → 0 and k → 0 in (9) we have, since f xy and fyx are assumed continuous at (x0, y0),
fyx(x0, y0) = fxy(d0, y0)
as required. For an example where this fails to hold, see Problem 6.41.
Differentials
6.14. Let f (x, y) have continuous first partial derivatives in a region ℜ of the xy plane. Prove that
Δf = f (x + Δx, y + Δy) – f (x, y) = fxΔx + fy Δy + δ1 Δx + δ2Δy
where /H92801 and /H92802 approach zero as Δx and Δy approach zero.
Applying the mean value theorem for functions of one variable (see Page 78), we have
Δf = {f (x + Δx, y + Δy) – f (x, y + Δy)} + {f (x, y + Δy) – f (x, y)} (1)
= Δxfx(x + θ1 Δx, y + Δy) + Δf y(x, y + θ2 Δy)   0 < θ1 < 1, 0 < θ2 < 1
Since, by hypothesis, fx and fy are continuous, it follows that
fx(x + θ1 Δx, y + Δy) = fx (x, y) + δ1,   f y(x, y + θ2Δy) = fy(x, y) + δ2
where δ1 → 0, δ 2 → 0 as Δx → 0 and Δy → 0.
Thus, Δf = fxΔx + fyΔy + δ1Δx + δ2Δy as required.
Defining Δx = dx, Δy = dy, we have Δf = f xdx + fy dy + δ1 dx + δ2dy.
We call df = fxdx + fy dy the differential of f (or z) or the principal part of Δf (or Δz).
6.15. If z = f (x, y), = x2y – 3y, find (a) Δz and (b) dz. (c) Determine Δz and dz if x = 4, y = 3, Δx = – 0.01, and Δy =
0.02. (d) How might you determine f (5.12, 6.85) without direct computation?


## Page 151

CHAPTER 6  Partial Derivatives140
Solution:
(a)
22
22 2
() ()
(, ) ( , )
[( ) ( ) 3( )] { 3 }
2( 3 ) ( ) 2 ( )
AB
zf x x y f x y
xx yy yy x yy
x yx x y xy xxy x y
Δ= + Δ −
=+ Δ + Δ −+ Δ − −
=Δ + − Δ + Δ+ Δ Δ + Δ Δ1 44444444 42 4444444443 1 4444444444444 42 444444444444 44 3= 2xy Δx + (x2 – 3) Δy + (Δx)2 y + 2x Δx Δy + (Δx)2 Δy144424443 1444442444443
The sum (A) is the principal part of Δz and is the differential of z, i.e., dz. Thus,
(b) dz = 2xy Δx + (x2 – 3) Δy = 2xy dx + (x2 – 3) dy
Another method: 22( 3 )zzdz dx dy xy dx x dyxy
∂∂=+ = + −∂∂
(c) Δz = f (x + Δx, y + Δy) – f (x, y) = f (4 – 0.01, 3 + 0.02) – f (4, 3)
  = {(3.99) 2 (3.02) – 3(3.02)} – {(4)2(3) – 3(3)} = 0.018702
 dz = 2xy dx + (x 2 – 3) dy = 2(4)(3)(–0.01) + (43 – 3)(0.02) = 0.02
Note that in this case Δz and dz are approximately equal: because Δx = dx and Δy = dy are sufficiently
small.
(d) We must find f (x + Δx, y + Δy) when x + Δx = 5.12 and y = Δy = 6.85. We can accomplish this by choos-
ing x = 5, Δx = 0.12, y = 7, δy = – 0.15. Since Δx and Δy are small, we use the fact that f (x + Δx, y + Δy)
= f (x, y) + Δz is approximately equal to f (x, y) + dz, i.e., z + dz.
Now
 z  = f (x, y) = f (5, 7) = (5)2(7) – 3(7) = 154
dz = 2xy dx + (x2 – 3) dy = 2 (5) (7) (0.12) + (52 – 3) (–0.15) = 5.1.
Then the required value is 154 + 5.1 = 159.1 approximately. The value obtained by direct computation is
159.01864.
6.16. (a) Let U = x2ey/x. Find dU. (b) Show that (3x2y – 2y2) dx + (x3 – 4xy + 6y2) dy can be written as an exact
differential of a function φ(x, y) and find this function.
(a) Method 1:
2/ / 2/
2
12,yx yx yxUy Uxe x e xexy xx
∂∂ ⎛⎞ ⎛ ⎞=− + = ⎜⎟ ⎜ ⎟∂∂ ⎝⎠ ⎝ ⎠
Then
// /(2 )yx yx yxUUdU dx dy xe ye dx xe dyxy
∂∂=+ = − +∂∂
Method 2:
2/ / 2 2 / /
2/ / / / /
2
() ( ) ( / ) 2
2( 2 )
yx yx yx yx
yx yx yx yx yx
d U xde e dx xe dy x x e d x
xd y yd xx e xe dx xe ye dx xe dy
x
=+ = +
−⎛⎞=+ = − +⎜⎟⎝⎠
(b) Method 1:
22 3 2Suppose that (3 2 ) ( 4 6 ) .x y yd x x x y yd yd d x d y xy
φφφ ∂∂−+ − += = + ∂∂
Then
2232xy yx
φ ∂=−∂  (1)
xy
φ ∂=∂ x32 46xy y−+  (2)


## Page 152

CHAPTER 6  Partial Derivatives 141
From Equation (1), integrating with respect to x keeping y constant, we have
φ = x3y = 2xy2 + f (y)
where f (y) is the “constant” of integration. Substituting this into Equation (2) yields
x3 – 4xy + F′(y) = x3 – 4xy + 6y2
from which F′(y) = 6y2, i.e., f (y) = 2y3 + c.
Hence, the required function is φ = x3y – 2xy2 + 2y3 + c, where c is an arbitrary constant.
Note that by Theorem 3, Page 130, the existence of such a function is guaranteed, since if P = 3x2y – 2y2
and Q = x3 – 4xy + 6y 2, then ∂ P/ ∂ y = 3x2 – 4y = ∂ Q/ ∂ x identically. If ∂ P/ ∂ y /HS11005∂ Q/ ∂ x, this function
would not exist and the given expression would not be an exact differential.
Method 2:
22 3 2 2 3 2 2
32 3 3 2 3
32 3
( 3 2) ( 4 6) ( 3 )( 2 4 )6
( ) ( 2 ) ( 2) ( 2 2)
(22)
x y yd x x x y yd y x y d x x d y y d x x y d y y d y
dxy d x y d y dxy x y y
dxy x y y c
−+ − += + −++
=− += − +
=− + +
Then the required function is x3y – 2xy2 + 2y3 + c.
This method, called the grouping method, is based on our ability to recognize exact differential combinations
and is less than Method 1. Naturally, before attempting to apply any method, we should determine whether the given
expression is an exact differential by using Theorem 3, Page 130. See Theorem 4, Page 130.
Differentiation of composite functions
6.17. Let z = f (x, y) and x = φ(t), y = ψ(t) where f, φ, ψ are assumed differentiable. Prove
dz z dx z y
dt x dt y dt
∂∂ ∂=+∂∂
Using the results of Problem 6.14, we have
1200
lim lim
tt
dz z z x z y x y z dx z dy
dt t x t y t t t x dt y dt εε
Δ→ Δ→
⎧⎫Δ∂ Δ ∂ Δ Δ Δ ∂ ∂== + + += + ⎨⎬Δ∂ Δ ∂ Δ Δ Δ ∂ ∂⎩⎭
since, as Δ t → 0, we have 10, 0, 0, , . xd x yd yxy td t t d tε ΔΔΔ→ Δ → → → → ΔΔ
6.18. If z =
2xye , x = t cos t, y = t sin t, compute dz/dt at t = π/2.
222( )( sin cos ) (2 )( cos sin )xy xydz z dx z dy y e t t t xye t t tdt x dt y dt
∂∂=+= − + + +∂∂
23
/2
At / 2, 0, / 2. Then ( / 4)( / 2) (0)(1) / 8.
t
dztx y dt π
ππ π π π
=
== = = − + = −
Another method: Substitute x and y to obtain z = et3sin2t cost and then differentiate.
6.19. If z = f (x, y) where x = φ(u, υ) and y = ψ(u, υ), prove the following:
() zz xz ya ux uy u
∂∂ ∂∂ ∂=+∂∂ ∂∂ ∂ () zz xz yb xyυυυ
∂∂ ∂∂ ∂=+∂∂ ∂∂ ∂
(a) From Problem 6.14, assuming the differentiability of f, φ, ψ, we have
1200
lim lim
uu
z z z x z y x y zx zy
uux u y u u u x u y u εε
Δ→ Δ→
⎧⎫∂ Δ ∂Δ ∂Δ Δ Δ ∂∂ ∂∂== + + += + ⎨⎬∂Δ ∂ Δ ∂ Δ Δ Δ ∂ ∂ ∂ ∂⎩⎭
(b) The result is proved as in (a) by replacing Δu by Δυ and letting Δυ → 0.


## Page 153

CHAPTER 6  Partial Derivatives142
6.20. Prove that zzdz dx dyxy
∂∂=+∂∂
 even if x and y are dependent variables.
Suppose x and y depend on three variables u, υ, w, for example. Then
dx = xu du + xυ dυ + xwdw (1)
dy = yudu + yυ dυ + yw dw (2)
Thus,
zxdx + zydy = (zxxu + z yyu) du + (zx xυ + zyyυ) dυ + (zx xw + zyyw) dw = zudu + zυdυ + zw = dz
using obvious generalizations from Problem 6.19.
6.21. If T = x3 – xy + y3, x = ρ cos φ, and y = ρ sin φ, find (a) ∂ T/ ∂ ρ, ∂ T/ ∂ ρ and (b) ∂ T/∂φ.
22
22
(3 )(cos ) (3 )(sin )
(3 )( sin ) (3 )( cos )
TT xT y xy yxxy
TT xT y xy y xxy
φφρρρ
ρφ ρ φφφφ
∂∂ ∂∂ ∂=+= − + −∂∂ ∂∂ ∂
∂∂ ∂∂ ∂=+= − − + −∂∂ ∂∂ ∂
This may also be worked by direct substitution of x and y in T.
6.22. If U = z sin y/x where x = 3r2 + 2s, y = 4r – 2s3, and z = 2r2 – 3s2, find (a) ∂U/∂r and (b) ∂U/∂s.
(a)
2
2
1cos (6 ) cos (4) sin (4 )
64 cos cos 4 sin
UU xU yU z
r x ry rz r
yy y yzr z rxx x xx
ryz y z y y rxx x xx
∂∂ ∂ ∂ ∂ ∂ ∂=++∂ ∂ ∂∂ ∂∂ ∂
⎧⎫ ⎧ ⎫⎛⎞ ⎛ ⎞ ⎛⎞ ⎛ ⎞ ⎛ ⎞=− + +⎨⎬ ⎨ ⎬⎜⎟ ⎜ ⎟ ⎜⎟ ⎜ ⎟ ⎜ ⎟⎝⎠ ⎝ ⎠ ⎝⎠ ⎝ ⎠ ⎝ ⎠⎩⎭ ⎩ ⎭
=− + +
(b)
2
2
2
2
1cos (2) cos ( 6 ) sin ( 6 )
26 cos cos 6 sin
UU xU yU z
s x sy sz s
yy y yzz s s xx x xx
yz y s z y y sxx x xx
∂∂ ∂ ∂ ∂ ∂ ∂=++∂ ∂ ∂∂ ∂∂ ∂
⎧⎫ ⎧ ⎫⎛⎞ ⎛ ⎞ ⎛⎞ ⎛ ⎞ ⎛ ⎞=− + − + −⎨⎬ ⎨ ⎬⎜⎟ ⎜ ⎟ ⎜⎟ ⎜ ⎟ ⎜ ⎟
⎝⎠ ⎝ ⎠ ⎝⎠ ⎝ ⎠ ⎝ ⎠⎩⎭ ⎩ ⎭
=− − −
6.23.
22 22
2
1If cos , sin , shown that .VVV Vxy xyρφ ρ φ ρφ ρ
⎛⎞ ⎛⎞ ⎛⎞∂∂∂ ∂⎛⎞== + = +⎜⎟ ⎜⎟ ⎜⎟⎜⎟∂∂∂ ∂⎝⎠ ⎝⎠ ⎝⎠ ⎝⎠
Using the subscript notation for partial derivatives, we have
 V ρ = Vxxρ + Vyyρ = Vx cosφ + Vy sin φ (1)
 V φ = Vxxφ + Vyyφ = Vx(– ρ sin φ) + Vy (ρ cos φ) (2)
Dividing both sides of Equation (2) by ρ, we have
1 Vφ
ρ = – sin cosxyVV φφ+  (3)
Then from Equations (1) and (3), we have
22 2 2 2 2
2
1 (c o s s i n ) ( s i n c o s )xy x y x yVV V V V V V Vρφ φφ φ φρ+= + + − + = +


## Page 154

CHAPTER 6  Partial Derivatives 143
6.24. Show that z = f (x2 y), where f is differentiable, satisfies x(∂z/∂x) = 2y (∂z/∂y).
Let x2y = u. Then z = f (u). Thus,
2() 2 , ()zz u z z ufu x y fu xxu x y u y
∂∂ ∂ ∂ ∂ ∂′′== ⋅ = = ⋅∂∂ ∂ ∂ ∂ ∂
Then
22( ) 2 , 2 ( ) 2 and so 2zz z zxf u x y yf u x y x yxy x y
∂∂ ∂ ∂′′=⋅ =⋅ =∂∂ ∂ ∂
Another method: We have
22 2 2() () () ( 2 ) .d z fx y d x y fx y x y d x xd y′′== +
Also,
zzdz dx dyxy
∂∂=+∂∂
Then
23 22( ) . ( )zz x y fx y x fx yxy
∂∂ ′′==∂∂
2Elimination of ( ) yieldsfx y′ 2.zzxy xy
∂∂ =∂∂
6.25. If for all values of the parameter λ and for some constant p, F (λx, λy) = λp F (x, y) identically, where F is
assumed differentiable, prove that x(∂F/∂x) + y (∂ F/∂y) = pF.
Let λx = u, λy = υ. Then
 F (u, υ) = λp F(x, y) (1)
The derivative with respect to λ of the left side of Equation (1) is
FF uF d F F xyuu
υ
λλ υ λ υ
∂∂ ∂∂ ∂ ∂=+= +∂∂ ∂∂ ∂∂ ∂
The derivative with respect to λ of the right side of Equation (1) is p λp–1 F. Then
1pFFxy p Fu λυ
−∂∂ +=∂∂  (2)
Letting λ = 1 in Equation (2), so that u = x, υ = y, we have x(∂F/∂x) + y(∂F/∂y) = pF.
6.26. If F(x, y) = x4y2 sin–1 y/x, show that x(∂F/∂x) + y(∂F/∂y) = 6 F.
Since F(λx, λy) = (λx) 4 (λy)2 sin–1 λy/λx = λ 6x4y2 sin–1 y/x = λ6 F(x, y), the result follows from Problem
6.25 with p = 6. It can, of course, also be shown by direct differentiation.
6.27. Prove that Y = f (x + at) + g(x – at) satisfies ∂2 Y/∂t2 = a2 (∂2 Y/∂x2), where f and g are assumed to be at least
twice differentiable and a is any constant.
Let , so that ( ) ( ). Then if ( ) / , ( ) / ,u x at x at Y f u g f u df du g dg dυυ υ υ ′′=+ =− = + ≡ ≡
() () , () ()YY uY YY uYaf u ag f u gtu t t xx x x
υυ υυυυ
∂ ∂∂ ∂∂ ∂ ∂∂ ∂∂′′ ′ ′=+ = − =+ = +∂∂ ∂ ∂ ∂ ∂∂ ∂∂ ∂


## Page 155

CHAPTER 6  Partial Derivatives144
By further differentiation, using the notation f ″(u) ≡ d2 f/du2, g″(υ) ≡ d2g/dυ2, we have
2
2
22
{( ) ( ) } ( ) {( ) ( ) } ()
() ()
tt tYY YYu af u ag a af u ag atu t t ut
af u a g
υ υυυυ
υ
∂∂ ∂∂∂ ∂ ∂ ∂ ′′ ′′== + = − + − −∂∂ ∂ ∂ ∂ ∂ ∂∂
′′ ′′=+
 (1)
2
2 {( ) ( ) } {( ) ) ( ) } ( ) ( )xx xYY YYu fu g fu g f u gxu x x ux
υ υυ υυυ
∂∂ ∂∂∂ ∂ ∂ ∂ ′′ ′′ ′ ′′ ′== + = + + + = +∂∂ ∂ ∂ ∂ ∂ ∂∂  (2)
Then from Equations (1) and (2), ∂2 Y/∂t2 = a2 (∂2Y/∂x2).
6.28. If x = 2r – s and y = r + 2s, find
2U
yx
∂
∂∂
 in terms of derivatives with respect to r and s.
Solving x = 2r – s, y = r + 2s for r and s: r = (2x + y)/5, s = (2y – x)/5.
Then ∂r/∂x = 2/5, ∂s/∂x = – 1/5, ∂r/∂y = 1/5, ∂s/∂y = 2/5. Hence, we have
21
55
UU rU s U U
xr x s x r s
∂∂ ∂ ∂ ∂ ∂ ∂=+= −∂∂ ∂ ∂ ∂ ∂ ∂
2
22 22
22
222
22
21 21
55 55
21 1 2 1 2
55 5 5 5 5
1 23 225
UU U U r U U s
y x y x r r sy s r sy
UU UU
rs srrs
UUU
rsrs
∂∂ ∂ ∂ ∂∂ ∂ ∂ ∂∂ ∂⎛ ⎞ ⎛⎞ ⎛⎞= =−+−⎜ ⎟ ⎜⎟ ⎜⎟∂ ∂ ∂∂ ∂ ∂ ∂∂ ∂ ∂ ∂∂⎝ ⎠ ⎝⎠ ⎝⎠
⎛⎞ ⎛⎞∂∂ ∂∂ ⎛⎞ ⎛⎞=− + −⎜⎟ ⎜⎟ ⎜⎟ ⎜⎟∂∂ ∂∂∂∂ ⎝⎠ ⎝⎠⎝⎠ ⎝⎠
⎛⎞ ∂∂∂=+ − ⎜⎟ ∂∂∂∂⎝⎠
assuming U has continuous second partial derivatives.
Implicit functions and jacobians
6.29. If U = x3 y, find dU/dt if
x5 + y = t and  (1)
x2 + y3 = t2 (2)
Equations (1) and (2) define x and y as (implicit) functions of t. Then differentiating with respect to t, we
have
 5 x4 (dx/dt) + dy/t = 1 (3)
 2 x (dx/dt) + 3y2(dy/dt) = 2t (4)
Solving Equations (3) and (4) simultaneously for dx/dt and dy/dt,
4
2 24
42 4244
22
11 5 1
23 2 23 2 10 2,15 2 15 251 51
23 23
x
ty x tdx y t dy x t x
dt dtxy x xy xxx
xy xy
−−== = = −−
Then
24
23
42 42
3 2 10 2(3 ) ( ) .15 2 15 2
dU U dx U dy y t x t xxy xdt x dt y dt xy x xy x
⎛⎞ ⎛ ⎞∂∂ − −=+= +⎜⎟ ⎜ ⎟∂∂ −−⎝⎠ ⎝ ⎠


## Page 156

CHAPTER 6  Partial Derivatives 145
6.30. If F(x, y, z) = 0 defines z as an implicit function of x and y in a region ℜ of the xy plane, prove that (a) ∂z/∂x
= –Fx/Fz and (b) ∂z/∂y = –Fy/Fz, where Fz /HS11005 0.
Since z is a function of x and y, .zzdz dx dyxy
∂∂=+∂∂
Then 0.FFF F F z F F zdF dx dy dz dx dyxyz x z x y z y
⎛⎞∂∂∂ ∂ ∂ ∂ ∂ ∂ ∂ ⎛⎞=++= + + + = ⎜⎟⎜⎟∂∂∂ ∂ ∂ ∂ ∂ ∂ ∂ ⎝⎠ ⎝⎠
Since x and y are independent, we have
0FF z
xz x
∂∂ ∂+=∂∂ ∂  (1)
0FF z
yz y
∂∂ ∂+=∂∂ ∂  (2)
from which the required results are obtained. If desired, equations (1) and (2) can be written directly.
6.31. If F(x, y, u, υ) = 0 and G(x, y, u, υ) = 0, find (a) ∂u/∂x, (b) ∂u/∂y, (c) ∂υ/∂ x, and (d) ∂υ/∂y.
The two equations in general define the dependent variables u and υ as (implicit) functions of the inde-
pendent variables x and y. Using the subscript notation, we have
dF = Fxdx + Fy dy + Fu du + Fυdυ = 0 (1)
dG = Gxdx + Gydy + Gudu + Gυ dυ = 0 (2)
Also, since u and υ are functions of x and y,
 du = u xdx + uy dy (3)
dυ = υ xdx + υydy (4)
Substituting Equations (3) and (4) in (1) and (2) yields
dF = (Fx + Fu ux + Fυυx)dx + (Fy + Fu uy + Fυυy)dy = 0 (5)
dG = (Gx + Guux + Gυυx)dx + (Gy + Guuy + Gυυy)dy = 0 (6)
Since x and y are independent, the coefficients of dx and dy in Equations (5) and (6) are zero. Hence, we
obtain
ux x
ux x
Fu F
Gu G
υ
υ
υ
υ
+= −⎧⎪⎨ += −⎪⎩
x
x
F
G  (7)
uy y
uy y
Fu F
Gu G
υ
υ
υ
υ
+= −⎧⎪⎨ += −⎪⎩
y
y
F
G  (8)
Solving Equations (7) and (8) gives
(a)
(, )
(,)
(, )
(, )
x
x
x
u
u
FF FG
GGu xu FGFFx
uGG
υ
υ
υ
υ
υ
υ
− ∂
−∂ ∂== − ∂∂
∂
–
– (b)
()
()
()
()
,
,
,
,
ux
ux
x
u
u
FGFF
uxGG
FF F Gx
GG u
υ
υ
υυ
υ
∂−
∂−∂== = − ∂∂
∂
–
–
(c)
(, )
(, )
(, )
(, )
y
y
y
u
u
FF FG
GGu yu FGFFy
uGG
υ
υ
υ
υ
υ
υ
− ∂
−∂ ∂== = − ∂∂
∂
–
–
(d)
(, )
(, )
(, )
(, )
uy
uy
y
u
u
FF FG
GG uy
FGFFy
uGG
υ
υ
υυ
υ
− ∂
−∂ ∂== = − ∂∂
∂
–
–


## Page 157

CHAPTER 6  Partial Derivatives146
The functional determinant (, ) ,, denoted by or ,(, ) ,
u
u
FF FG FG JGG uu
υ
υ υυ
∂ ⎛⎞
⎜⎟∂ ⎝⎠
 is the Jacobian of F  and G
with respect to u and υ and is supposed /HS11005 0.
Note that it is possible to devise mnemonic rules for writing at once the required partial derivatives in
terms of Jacobians (see also Problem 6.33).
6.32. If u2 – υ = 3x + y and u – 2υ 2 = x – 2y, find (a) ∂u/∂x, (b) ∂υ/∂x, (c) ∂u/∂y, and (d) ∂υ/∂y.
Method 1: Differentiate the given equations with respect to x, considering u and υ as functions of x and y.
Then
23 uu xx
υ∂∂ −=∂∂  (1)
41xx
υυ υ∂∂ −=∂∂  (2)
Solving, 11 2 2 3,.18 18
uu
xu x u
υυ
υυ
∂− ∂ −==∂− ∂ −
Differentiating with respect to y, we have
21 uu yy
υ∂∂ −=∂∂  (3)
4u
yy
υυ∂∂ −= −∂∂ 2 (4)
Solving, 24 4 1 ,.18 18
uu
yu yu
υυ
υυ
∂− − ∂ − −==∂− ∂−
We have, of course, assumed that 1 – 8uυ /HS11005 0.
Method 2: The given equations are F = u 2 – υ – 3x – y = 0, G = u – 2υ 2 – x + 2y = 0. Then, by Problem
6.31,
31(, )
11 214(,)
(, ) 2 1 18
(, ) 14
x
x
u
u
FFFG
GGu x
FG F F uxu
u GG
υ
υ
υ
υ
υυυ
υ
υ υ
−−∂
∂− −−∂=− =− =− =∂−∂−
∂ −
provided 1 – 8uυ /HS11005 0. Similarly, the other partial derivatives are obtained.
6.33. If F(u, υ, w, x, y) = 0, G (u, υ, w, x, y) = 0, and H(u, υ, w, x, y) = 0, find (a) ,
xy
υ ∂
∂
(b) ,
w
x
υ
∂
∂
(c) .
y
w
u
∂
∂
From three equations in five variables, we can (theoretically at least) determine three variables in terms
of the remaining two. Thus, three variables are dependent and two are independent. If we were asked to deter-
mine ∂υ/∂y, we would know that υ is a dependent variable and y is an independent variable, but would not
know the remaining independent variable. However, the particular notation
xy
υ ∂
∂
 serves to indicate that we
are to obtain ∂υ/∂y, keeping x constant; i.e., x is the other independent variable.
(a) Differentiating the given equations with respect to y, keeping x constant, gives
Fuuy + Fυυy + Fw wy + Fy = 0 (1)
Guuy + Gυυy + Gwwy + Gy = Gy = 0 (2)
Huuy + Hυ υy + Hw wy + Hy = 0 (3)


## Page 158

CHAPTER 6  Partial Derivatives 147
Solving simultaneously for υy, we have
(, , )
(, , )
(, , )
(, , )
uyw
uyw
uyw
y
uwx
uw
uw
FFF
GGG FGH
HHH uyw
FGHFFFy
uwGGG
HHH
υ
υ
υ
υυ
υ
∂
∂ ∂== − = − ∂∂
∂
Equations (1), (2), and (3) can also be obtained by using differentials as in Problem 6.31.
The Jacobian method is very suggestive for writing results immediately, as seen in this problem and
Problem 6.31. Thus, observe that in calculating
xy
υ ∂
∂
 the result is the negative of the quotient of two Jacobi-
ans, the numerator containing the independent variable y and the denominator containing the dependent vari-
able υ in the same relative positions. Using this scheme, we have
()
(, , ) (, , )
(,,) (, , )()(, , ) (, , )
(,,) ( ,,)
wy
FGH FGH
xw yu uxbc FGH FGHu
xyu wx
υ υ
υ
υ
∂ ∂
∂∂ ∂ ∂=− =−∂∂∂∂
∂∂
6.34.
22
3
23 .
3If 0, prove that (3 )
zz xzx z y xy zx
∂+−− = = −∂∂ −
Differentiating with respect to x, keeping y constant, and remembering that z is the dependent variable
depending on the independent variables x and y, we find
230 zzzx z xx
∂∂ −− =∂∂
and
23
zz
x zx
∂ =∂ −
 (1)
Differentiating with respect to y, keeping x constant, we find
231 0zzzx yy
∂∂ −− =∂∂
and
23
zz
x zx
∂ =∂ −
 (2)
Differentiating Equation (2) with respect to x and using Equation (1), we have
22 2
22 22 23
16 / ( 3 )13 61(3 ) (3 ) (3 )
zz z xzz xzxy xzx zx zx
⎡⎤−−∂− ∂ −⎛⎞ ⎣⎦=− = = −⎜⎟∂∂ ∂−− − ⎝⎠
–
The result can also be obtained by differentiating Equation (1) with respect to y and using Equation (2).
6.35. Let u = f (x, y) and υ = g(x, y), where f and g are continuously differentiable in some region ℜ. Prove that a
necessary and sufficient condition that there exists a functional relation between u and υ of the form φ(u, υ)
= 0 is the vanishing of the Jacobian; i.e., (, ) 0(,)
u
xy
υ ∂=∂
identically.


## Page 159

CHAPTER 6  Partial Derivatives148
Necessity. We have to prove that if the functional relation φ(u, υ) = 0 exists, then the Jacobian (, ) 0(,)
u
xy
υ ∂=∂identically. To do this, we note that
 dφ = φudu + φυdυ = φu(uxdx + uy dy) + φυ(υxdx + υydy)
 = (φu ux + φυ υx)dx + (φuuy + φυυy)dy = 0
Then
φuux + φυυx = 0 (1)
φuuy + φυυy = 0 (2)
Now φu and φυ cannot be identically zero, since if they were, there would be no functional relation, con-
trary to hypothesis. Hence, it follows from Equations (1) and (2) that (, ) 0(,)
xx
yy
u u
u xy
υ υ
υ
∂==∂
 identically.
Sufficiency. We have to prove that if the Jacobian (, ) 0(,)
u
xy
υ ∂=∂
 identically, then there exists a functional
relation between u and υ; i.e., φ(u, υ) = 0.
Let us first suppose that both ux = 0 and u y = 0. In this case the Jacobian is identically zero and u is a
constant c1, so that the trival functional relation u = c1 is obtained.
Let us now assume that we do not have both ux = 0 and uy = 0; for definiteness, assume ux /HS11005 0. We may
then, according to Theorem 1, Page 133, solve for x in the equation u = f(x, y) to obtain x = F(u, y), from which
it follows that
u = f {F(u, y),y} (1)
υ = g {F(u, y), y} (2)
From these we have, respectively,
 du = uxdx + uydy = ux(Fudu + Fydy) + uydy = uxFu du + (ux Fy + uy) dy (3)
dυ = υ xdx + υy dy = υx(Fudu + Fy dy) + υy dy = υx Fu du + (υx Fy + υy) dy (4)
From Equation (3), uxFu = 1 and uxFy + uy = 0 or (5) Fy = –uy/ux. Using this, Equation (4) becomes
d F du u u dy F du uu
xu x y x y xu
xy y
υυ υ υ υ υυ=+ − (){ + } =+ −/
x x
xu dy
⎛
⎝
⎜
⎞
⎠
⎟ . (6)
But by hypothesis (, ) 0(,)
xy
xy yx
xy
uuu uuxy
υ υυυυ
∂ = =−=∂
 identically, so that Equation (6) becomes dφ
= υxFudu. This means essentially that, referring to Equation (2),∂υ/∂y = 0, which means that υ is not depend-
ent on y but depends only on u; i.e., υ is a function of u, which is the same as saying that the functional relation
φ (u, υ) = 0 exists.
6.36. (a) 11 (, )If and tan tan , find .1( , )
xy uux yxy x yw
υυ −−+∂== +−∂
(b) Are u and υ functionally related? If so, find
the relationship.
(a)
22
22
22
11
(1 ) (1 )(, ) 0i f1(,) 11
11
xy
xy
yx
uu xy xyu xyxy
xy
υ
υυ
++
−−∂ == = ≠∂
++
(b) By Problem 6.35, since the Jacobian is identically zero in a region, there must be a functional relationship
between u and υ. This is seen to be tan υ = u; i.e., φ(u, υ) = u – tan υ = 0. We can show this directly by
solving for x (say) in one of the equations and then substituting in the other. Thus, for example, from υ =
tan–1 x + tan–1 y, we find tan–1 x = υ – tan–1 y and so


## Page 160

CHAPTER 6  Partial Derivatives 149
1
1
1
tan tan(tan ) tantan( tan ) 1t a n1 tan tan(tan )
yyxy yy
υυυ υυ
−
−
−
−−=− = = ++
Then substituting this in u = (x + y)/(1 – xy) and simplifying, we find u = tan υ.
6.37. (a) If x = u – υ + w, y = u2 – υ2 – w2 and z = u3 + υ, evaluate the Jacobian (,,)
(, , )
xyz
uwυ
∂
∂
, and (b) explain the
significance of the nonvanishing of this Jacobian.
(a) 22
2
11 1
(,,) 22 2 6 2 6 2(, , ) 31 0
uw
uw
uw
xxx
xyz yyy u w w u u u wuw zzz u
υ
υ
υ
υυυ
−
∂ == − − = + + +∂
(b) The given equations can be solved simultaneously for u, υ, w in terms of x, y, z in a region ℜ if the Jaco-
bian is not zero in ℜ.
Transformations, curvilinear coordinates
6.38. A region ℜ in the xy plane is bounded by x + y = 6, x – y = 2, and y = 0. (a) Determine the region ℜ′ in the
uυ plane into which ℜ is mapped under the transformation x = u + υ, y = u – υ. (b) Compute (,) .(, )
xy
u υ
∂
∂
 (c)
Compare the result of (b) with the ratio of the areas of ℜ and ℜ′.
(a) The region ℜ shown shaded in Figure 6.9 (a) is a triangle bounded by the lines x + y = 6, x – y = 2, and y
= 0, which for distinguishing purposes are shown dotted, dashed, and heavy, respectively.
Figure 6.9
Under the given transformation, the line x + y = 6 is transformed into (u + υ) + (u – υ) = 6; i.e., 2u = 6 or
u = 3, which is a line (shown dotted) in the uυ plane of Figure 6.9(b).
Similarly, x – y = 2 becomes (u + υ) – (u – υ) = 2 or υ = 1, which is a line (shown dashed) in the uυ plane.
In like manner, y = 0 becomes u – υ = 0 or u = υ, which is a line shown heavy in the uυ plane. Then the required
region is bounded by u = 3, υ = 1, and u = υ, and is shown shaded in Figure 6.9(b).
(b)
() () 11(,) 211(, ) () ()
xx uuxy uu u
yyu uuuu
υυυ
υ υυυυ
∂∂ ∂ ∂ ++∂ ∂∂ ∂ ∂== = =∂∂ ∂ ∂ −∂ −−∂∂ ∂ ∂
(c) The area of triangular region ℜ is 4, whereas the area of triangular region ℜ′ is 2. Hence, the ratio is 4/2
= 2, agreeing with the value of the Jacobian in (b). Since the Jacobian is constant in this case, the areas of
any regions ℜ in the xy plane are twice the areas of corresponding mapped regions ℜ′ in the uυ plane.


## Page 161

CHAPTER 6  Partial Derivatives150
6.39. A region ℜ in the xy plane is bounded by x 2 + y2 = a2, x2 + y2 = b2, x = 0, and y = 0, where 0 < a < b.
(a) Determine the region ℜ′ into which ℜ is mapped under the transformation x = ρ cos φ, y = ρ sin φ, where
ρ > 0, 0 < φ < 2π. (b) Discuss what happens when a = 0. (c) compute (,) .(,)
xy
ρφ
∂
∂
 (d) compute (,) .(,)xy
ρφ∂
∂
(a) The region ℜ [shaded in Figure 6.10(a)] is bounded by x = 0 (dotted), y = 0 (dotted and dashed), x 2 + y2
= a2 (dashed), and x2 + y2 = b2 (heavy).
Figure 6.10
Under the given transformation, x2 + y2 = a2 and x2 + y2 = b2 become ρ2 = a2 and ρ2 = b2 or ρ = a and ρ = b,
respectively. Also, x = 0, a < y < b becomes φ = π/2, a < ρ < b; y = 0, a < x < b becomes φ = 0, a < ρ < b.
The required region ℜ′ is shown shaded in Figure 6.10(b).
Another method: Using the fact that ρ is the distance from the origin O of the xy plane and φ is the angle
measured from the positive x axis, it is clear that the required region is given by a < ρ < b, 0 < φ < π/2, as
indicated in Figure 6.10(b).
(b) If a = 0, the region ℜ becomes one-fourth of a circular region of radius b (bounded by three sides), while
ℜ′ remains a rectangle. The reason for this is that the point x = 0, y = 0 is mapped into ρ = 0, φ = an in-
determinate and the transformation is not one to one at this point, which is sometimes called a singular
point.
(c)
22
(c o s ) (c o s ) cos sin(,)
sin cos(,) (s i n) (s i n)
(cos sin )
xy
ρφ ρφ φρφρφ
φρ φρφ ρφ ρφρφ
ρφ φ ρ
∂∂
−∂∂∂ == ∂∂∂
∂∂
=+ =
(d) From Problem 6.43(b) we have, letting u = ρ, υ = φ, (,) ( ,) 1(,) ( ,)
xy
xy
ρφ
ρφ
∂∂ =∂∂
so that, thing (c), (,) 1
(,)xy
ρφ
ρ
∂ =∂
This can also be obtained by direct differentiation.
Note that from the Jacobians of these transformations it is clear why ρ = 0 (i.e., x = 0, y = 0) is a singular
point.
Mean value theorem
6.40. Prove the mean value theorem for functions of two variables.
Let f (t) = f (x0 + ht, y0 + kt). By the mean value theorem for functions of one variable,
 F (1) = F(0) = F′(θ) 0 < θ < 1 (1)


## Page 162

CHAPTER 6  Partial Derivatives 151
If x = x0 + ht, y = y0 + kt, then F(t) = f (x, y), so that by Problem 6.17,
F′(t) = fx (dx/dt) + fy(dy/dt) = hfx + kfy and F′(θ) = hfx(x0 + θh, y0 + θk) + kfy(x0 + θh, y0 + θk)
where 0 < θ < 1. Thus, (1) becomes
 f (x0 + h, y0 + k) – f (x0, y0) = hfx(x0 + θh, y0 + θk) + kfy(x0 + θh, y0 + θk) (2)
where 0 < θ < 1 as required.
Note that Equation (2), which is analogous to Equation (1) of Problem 6.14, where h = Δx, has the advan-
tage of being more symmetric (and also more useful), since only a single number θ is involved.
Miscellaneous problems
6.41.
22
22 (,) ( 0 , 0 )Let ( , ) .
0( , ) ( 0,0)
xyxy x yfx y xy
xy
⎧ ⎛⎞ − ≠⎪ ⎜⎟= +⎨ ⎝⎠
⎪ =⎩
Compute (a) fx(0, 0), (b) fy(0, 0), (c) fxx(0, 0) (d) fyy(0, 0), (e) fxy(0, 0), and (f) fyx(0, 0).
(a)
00
(, 0 ) ( 0 , 0 ) 0lim lim 0
hh
fh f
hh→→
− ==
(b)
0
(0, ) (0,0) 0lim lim 0
ho k
fk f
kk→→
− ==
If (x, y) /HS11005 (0, 0),
22 2 22
22 22 2 22
22 2 22
22 22 2 22
4(,) ()
4(,) ()
x
x
xy x y xyfx y x y x y yx xy xy xy
xy x y xyfx y x y x y xy xy xy xy
⎧⎫ ⎛⎞ ⎛ ⎞ ⎛⎞∂− −⎪⎪== + ⎨⎬ ⎜⎟ ⎜ ⎟ ⎜⎟∂ −+ +⎪⎪ ⎝⎠ ⎝ ⎠ ⎝⎠⎩⎭
⎧⎫ ⎛⎞ ⎛ ⎞ ⎛⎞∂− − −⎪⎪== + ⎨⎬ ⎜⎟ ⎜ ⎟ ⎜⎟∂ −+ +⎪⎪ ⎝⎠ ⎝ ⎠ ⎝⎠⎩⎭
Then
(c)
00
(, 0 ) ( 0 , 0 ) 0lim lim 0xx
hh
fh f
hh→→
− ==
(d)
00
(0, ) (0,0) 0lim lim 0
yy
kk
fkf
kk→→
− ==
(e)
00
(0, ) (0,0)lim lim 1xx
kk
fkf k
kk→→
− −== −
(f)
00
(, 0 ) ( 0 , 0 )lim lim 1
yy
hh
fh f h
hh→→
− ==
  Note that f xy /HS11005fyx at (0, 0). See Problem 6.13.
6.42. Show that under the transformation x = ρ cos φ, y = ρ sin φ the equation
22
22 0VV
xy
∂∂ +=
∂∂
 become
22
22 2
11 0.VV V
ρφρρ φ
∂∂ ∂ ++ =∂∂∂
We have
VV V
xxx
ρφ
ρφ
∂∂ ∂∂ ∂=+∂∂ ∂∂ ∂  (1)
VV V
yyy
ρφ
ρφ
∂∂ ∂∂ ∂=+∂∂ ∂∂ ∂  (2)


## Page 163

CHAPTER 6  Partial Derivatives152
Differentiate x = ρ cos φ, y = ρ sin φ with respect to x, remembering that ρ and φ are functions of x and y
1 =− sin cos . 0 cos sinxx x x
φρ φ ρρφ φ ρ φ φ∂∂ ∂ ∂+= +∂∂ ∂ ∂
Solving simultaneously,
sincos ,xx
ρφ φ φ ρ
∂∂ == −∂∂  (3)
Similarly, differentiate with respect to y. Then
0 = − sin cos , 1 cos sinyy y y
φρ φ ρρφ φ ρ φ φ∂∂ ∂ ∂+= +∂∂ ∂ ∂
Solving simultaneously,
cossin ,yy
ρφ φ φ ρ
∂∂ ==∂∂  (4)
Then, from Equations (1) and (2),
sincosVV V
x
φφ ρρ φ
∂∂ ∂=−∂∂ ∂  (5)
cossinVV V
y
φφ ρρ φ
∂∂ ∂=+∂∂ ∂  (6)
Hence,
2
2
22
22
sin sincos cos
sin sincos (cos )
VV V V
xx xx xxx
VV VV
xx
VV V
ρφ
ρφ
φρ φφφφρρ ρ φ φρ ρ φ
φφφφ φρ ρ φρρ
∂∂ ∂ ∂ ∂ ∂ ∂ ∂ ∂⎛⎞ ⎛⎞ ⎛⎞== + ⎜⎟ ⎜⎟ ⎜⎟∂∂ ∂ ∂∂ ∂∂∂∂ ⎝⎠ ⎝⎠ ⎝⎠
⎛⎞ ⎛⎞∂ ∂ ∂∂ ∂ ∂ ∂∂=− +−⎜⎟ ⎜⎟∂∂ ∂ ∂ ∂∂ ∂ ∂⎝⎠ ⎝⎠
⎛⎞ ∂∂∂=+ −⎜⎟ ∂∂ ∂∂⎝⎠
2 cossin cosVV V φφφ ρρ φ ρ φ
∂∂ ∂+− + − − ∂∂ ∂ ∂
2
2
sin sin Vφφ
ρρ φ
⎛⎞ ⎛⎞∂ −⎜⎟ ⎜⎟∂ ⎝⎠⎝⎠
which simplifies to
22 2 2 2 2
2
22 2 22
2sin cos 2sin cos sin sincosVV V V V V
x
φφ φφ φ φφ φρ ρ φ ρ ρρρ ρ φ
∂∂ ∂ ∂ ∂ ∂=+ − + + ∂∂ ∂ ∂∂∂ ∂  (7)
Similarly,
22 2 2 2 2
2
22 2 22
2sin cos 2sin cos cos cossinVV V V V V
y
φφ φφ φ φφ φρ ρ φ ρ ρρρ ρ φ
∂∂ ∂ ∂ ∂∂=− + ++ ∂∂ ∂ ∂∂∂ ∂  (8)
Adding Equations (7) and (8), we find, as required,
222 2
22 2 2 2
11 0.VVV V V
xy ρρρρ φ
∂∂∂ ∂ ∂+=+ + = ∂∂∂∂ ∂
6.43. (a) If x = f (u, υ) and y = g(u, υ), where u = φ (r, s) and υ = ψ (r, s), prove that (,) (,) (,) .(,) (, ) (,)
xy xy u
rs u rs
υ
υ
∂∂ ∂ =∂∂ ∂
(b) Prove that (,) (,) 1(, ) (, )
xy u
ux y
υ
υ
∂∂ =∂∂
, (,)provided 0,(, )
xy
u υ
∂ ≠∂
and interpret geometrically.


## Page 164

CHAPTER 6  Partial Derivatives 153
(a) (,)
(,)
(,)(,)
(, )(,)
rs u r ru s s
rs u r ru s s
ur s
ur s
xx x ux x uxxy
yy y uy y uyrs
xx u u xy uwyy ur s
υυ
υυ
υ
υ
υυ
υυ
υ
υυ υ
++∂ == ++∂
∂∂== ∂∂
using a theorem on multiplication of determinants (see Problem 6.108). We have assumed here, of course, the
existence of the partial derivatives involved.
(b) Place r = x, s = y in the result of (a). Then (,) (,) (,) 1.(, ) (, ) (, )
xy u xy
ux y x y
υ
υ
∂∂ ∂ ==∂∂ ∂
The equations x = f ( u, υ), y = g(u, υ) define a transformation between points (x, y) in the xy plane and
points (u, υ) in the uv plane. The inverse transformation is given by u = φ (x, y), υ = ψ (x, y). The result obtained
states that the Jacobians of these transformations are reciprocals of each other.
6.44. Show that F(xy, z – 2x) = 0 satisfies, under suitable conditions, the equation x(∂z/∂x) – y(∂z/∂y) = 2x. What
are these conditions?
Let u = xy, υ = z – 2x. Then F(u, υ) = 0 and
dF = Fudu + Fυdυ = Fu(xd y + y dx) + Fυ(dz – 2 dx) = 0 (1)
Taking z as dependent variable and x and y as independent variables, we have dz = z x dx + zy dy. Then
substituting in Equation (1), we find
(yFu + Fυzx – 2) dx + (xFu + Fυzy) dy = 0
Hence, since x and y are independent, we have
yFu + Fυzx – 2 = 0 (2)
xFu + Fυzy = 0 (3)
Solve for Fu in Equation (3) and substitute in (2). Then we obtain the required result xzx – yzy = 2x upon divid-
ing by Fυ (supposed not equal to zero).
The result will certainly be valid if we assume that F(u, υ) is continuously differentiable and that Fυ /HS11005 0.
SUPPLEMENTARY PROBLEMS
Functions and graphs
6.45. If 2(, ) , 1
xyfxy xy
+= −
find (a) (1 3),f − (b) (2 , 3) (2, 3) ,fh f
h
+−  and (c) (, ) .fx y x y+
Ans. (a) 1
4−  (b) 11
5(3 5)h +
 (c) 22
22
1
xy x y
xy x y
++
−−
6.46. If g(x, y, z) = x2 – yz + 3xy, find (a) g(1, –2, 2), (b) g(x + 1, y – 1, z2), and (c) g(xy, xz, x + y).
Ans. (a) –1 (b) x2 – x – 2 – yz2 + z2 + 3xy + 3y (c) x2y2 – x2z – xyz + 3x2yz
6.47. Give the domain of definition for which each of the following functional rules is defined and real, and indicate this
domain graphically: (a) 22
1(, ) ,1fxy xy= +−
(b) (, ) l n ( ) ,fxy x y =+  and (c) 1 2(, ) s i n . xyfxy xy
− ⎛⎞ −= ⎜⎟ +⎝⎠
Ans. (a) 22 1xy +≠  (b) 0xy+>  (c) 2 1xy
xy
− <+


## Page 165

CHAPTER 6  Partial Derivatives154
6.48. (a) What is the domain of definition for which f (x, y, z) = 22 2
1
1
xyz
xy z
++−
++−
 is defined and real?
(b) Indicate this domain graphically.
Ans. (a) x + y + z <  1, x2 + y2 + z2 < 1 and x + y + z >  1, x2 + y2 + z2 > 1
6.49. Sketch and name the surface in three-dimensional space represented by each of the following.
(a) 3x + 2z = 12 (d) x 2 + z2 = y2 (g) x2 + y2 = 2y
(b) 4z = x2 + y2 (e) x2 + y2 + z2 = 16 (h) z = x + y
(c) z = x2 – 4y2 (f) x2 – 4y2 – 4z2 = 36 (i) y 2 = 4z
   (j) x2 + y2 + z2 – 4x + 6y + 2z – 2 = 0
Ans. (a) plane (b) paraboloid of revolution (c) hyperbolic paraboloid (d) right circular cone (e) sphere
(f) hyperboloid of two sheets (g) right circular cylinder (h) plane (i) arabolic cylinder (j) sphere, center at
(2, –3, –1) and radius 4.
6.50. Construct a graph of the region bounded by x 2 + y2 = a2 and x2 + z2 = a2, where a is a constant.
6.51. Describe graphically the set of points (x , y, z) such that (a) x2 + y2 + z2 = 1, x2 + y2 = z2 and (b) x2 + y2 < z < x + y.
6.52. The level curves for a function z  = f (x, y) are curves in the xy plane defined by f (x, y) = c, where c is
any constant. They provide a way of representing the function graphically. Similarly, the level surfaces
of w = f (x, y, z) are the surfaces in a rectangular (xyz) coordinate system defined by f (x, y, z) = c, where
c is any constant. Describe and graph the level curves and surfaces for each of the following functions:
(a) f (x, y) = ln (x
2 + y2 – 1), (b) f (x, y) = 4xy, (c) f (x, y) = tan–1 y/(x + 1), (d) f (x, y) = x2/3 + y2/3, (e) f (x, y, z)
= x2 + 4y2 + 16z2 and (f) sin(x + z)/(1 – y).
Limits and continuity
6.53. Prove that
4
1
() l i m ( 3 2) 1 4
x
y
ax y
→
→−
−=  and
(,) ( 2 , 1 )
() l i m
xy
b
→
 (xy – 3x + 4) = 0 by using the definition.
6.54. If lim f (x, y) = A and lim g(x, y) = B, where lim denotes limit as (x, y) → (x 0, y0), prove that (a) lim {f (x, y) +
g(x, y)} = A + B and (b) lim {f (x, y) g(x, y)} = AB.
6.55. Under what conditions is the limit of the quotient of two functions equal to the quotient of their limits?
Prove your answer.
6.56. Evaluate each of the following limits where they exist:
(a)
1
2
3lim 42x
y
xy
xy→
→
−+
+−
(c) 2
4
lim sin
x
y
yx xπ
→
→
(e)
() 2121/
0
1
lim
yx
x
y
e
−−
→
→
(g)
0
1
1lim
1x
y
xy
xy→+
→−
+−
−−
(b)
0
0
32lim 23x
y
xy
xy→
→
−
−
(d)
22
220
0
sin( )lim
x
y
xx y
xy+→
→
+ (f) 220
0
2lim
x
y
xy
xy→
→
−
+
(h)
1
12
1
sin ( 2)lim tan (3 6)x
y
xy
xy
−
−→
→
−
−
Ans. (a) 4 (b) does not exist (c) 82  (d) 0 (e) 0 (f) does not exist (g) 0 (h) 1
3


## Page 166

CHAPTER 6  Partial Derivatives 155
6.57. Formulate a definition of limit for functions of (a) 3 and (b) n variables.
6.58. Does 43lim 252
xy z
xyz
+−
−+
 as (x, y, z) → (0, 0, 0) exist? Justify your answer.
6.59. Investigate the continuity of each of the following functions at the indicated points: (a) x2 + y2, (x0, y0);
(b)
35
x
xy+
, (0, 0); and (c) 22
22
1() s i nxy xy+ +
 if (x, y) /HS11005 (0, 0), 0 if (x,y) = (0, 0), (0, 0).
Ans. (a) continuous (b) discontinuous (c) continuous
6.60. Using the definition, prove that f (x, y) = xy + 6x is continuous continuous at (a) (1, 2) and (b) (x0, y0).
6.61. Prove that the function in Problem 6.60 is uniformly continuous in the square region defined by 0 < x <  1,
0 < y <  1.
Partial derivatives
6.62. If f (x, y) = ,xy
xy
−
+
 find (a) ∂f/∂x and (b) ∂f/∂y at (2, –1) from the definition and verify your answer by
differentiation rules.
Ans. (a) –2 (b) –4
6.63. If f (x, y) =
2() / ( )
0
xx y x y⎧ −+
⎨
⎩
.for ( , ) (0,0)xy =
.for ( , ) (0,0)xy ≠  find (a) (0,0) ,xf and (b) (0,0)yf .
Ans. (a) 1 (b) 0
6.64. Investigate
() (),0 , 0
lim ( , )xxy
fx y
→
for the function in the preceding problem and explain why this limit (if it
exists) is or is not equal to fx(0, 0).
6.65. If f (x, y) = (x – y) sin (3x + 2y), compute (a) fx, (b) fy, (c) fxx, (d) fyy, and (e) fyx at (0, π/3).
Ans. (a) 1 ()2 π+ 3  (b) 1 (2 )6 π− 3 3  (c) 3 (2 )2 π3 −  (d) 2 (i 3 3)3 +  (e) 1 (2 1)2 π3 +
6.66. (a) Prove by direct differentiation that z = xy tan(y/x) satisfies the equation x(∂z/∂x) + y(∂z/∂y) = 2z if (x, y)
/HS11005 (0, 0). (b) Discuss part (a) for all other points (x, y), assuming z = 0 at (0, 0).
6.67. Verify that fxy = fyx for the functions (a) (2x – y)/(x + y), (b) x tan xy, and (c) cosh (y + cos x), indicating
possible exceptional points, and investigate these points.
6.68. Show that z = ln{(x – a)2 + (y – b)2} satisfies ∂2z/∂x2 + ∂2z/∂y2 = 0 except at (a, b).
6.69. Show that z = x cos (y/x) + tan(y/x) satisfies x2zxx + 2xyzxy + y2zyy = 0 except at points for which x = 0.


## Page 167

CHAPTER 6  Partial Derivatives156
6.70. Show that if w = ,
n
xyz
xyz
⎛⎞ −+
⎜⎟ +−⎝⎠
 then:
(a) 0wwwxyzxyz
∂∂∂++=∂∂∂
(b)
222 2 2 2
222
222 222www w w wxyz x y x z y z xy xz yzxyz
∂∂∂ ∂ ∂ ∂+++ + + ∂∂ ∂∂ ∂∂∂∂∂
 = 0
Indicate possible exceptional points.
Differentials
6.71. If z = x3 – xy + 3y2, compute (a) Δz and (b) dz, where x = 5, y = 4, Δx = –0.2, Δy = 0.1. Explain why Δz and
dz are approximately equal. (c) Find Δz and dz if x = 5, y = 4, Δx = –2, Δy = 1.
Ans. (a) –11.658 (b) –12.3 (c) Δz = –66, dz = –123
6.72. Compute 235 (3.8) 2(2.1)+  approximately, using differentials.
Ans.  2.01
6.73. Find dF and dG if (a) F(x, y) = x3y – 4xy2 + 8y3, (b) G(x, y, z) = 8xy2z3 – 3x2yz, and (c) F(x, y) = xy2 ln(y/x).
Ans. (a) (3x 2y – 4y2) dx + (x3 – 8xy + 24y2) dy
 (b) (8y 2z3 – 6xyz) dx + (16xyz3 – 3x2z) dy + (24xy2z2 – 3x2y) dz
 (c) {y 2 ln(y/x) – y2} dx + {2xy ln (y/x) + xy} dy
6.74. Prove that (a) d(UV) = Ud V  + Vd U, (b) d(U/V) = (V dU – U dV)/V2, (c) d(ln U) = (dU)/U, and (d) d(tan–1 V)
= (dV)/(1 + υ2), where U and V are differentiable functions of two or more variables.
6.75. Determine whether each of the following is an exact differential of a function and, if so, find the function:
(a) (2xy 2 + 3y cos 3x) dx + (2x2y + sin 3x) dy
(b) (6xy – y 2) dx + (2xey – x2) dy
(c) (z 3 – 3y) dx + (12y2 –3x) dy + 3xz2 dz
Ans. (a) x2y2 + y sin 3x + c (b) not exact (c) xz2 + 4y3 – 3xy + c
Differentiation of composite functions
6.76. (a) If U(x, y, z) = 2x2 – yz + xz2, x = 2 sin t, y = t2 – t + 1, and z = 3e–1, find dU/dt at t = 0. (b) If H(x, y) =
sin(3x – y), x3 + 2y = 2t3, and x – y2 = t2 + 3t, find dH/dt.
Ans. (a) 24 (b)
22 2 2
2
36 12 9 6 6 18
62
ty t x t xt
xy
⎛⎞ ++ − + +
⎜⎟ +⎝⎠
cos (3x – y)
6.77. If F(x, y) = (2x + y)/(y – 2x), x = 2u – 3υ, and y = u + 2υ, find (a) ∂F/∂u, (b) ∂F/∂υ, (c) ∂ 2F/∂ u2, (d) ∂2F/∂υ2,
and (e) ∂2F/∂u ∂υ, where u = 2, υ = 1.
Ans. (a) 7 (b) –14 (c) 21 (d) 112 (e) –49


## Page 168

CHAPTER 6  Partial Derivatives 157
6.78. If U = x2F(y/x), show that, under suitable restrictions on F, x(∂U/∂x) + y(∂U/∂y) = 2U.
6.79. If x = u cos α – υ sin α and y = u sin α + υ cos α, where α is a constant, show that (∂V/∂x) 2 + (∂V/∂y)2 =
(∂V/∂u)2 + (∂V/∂υ)2.
6.80. Show that if x  = ρ cos φ, y = ρ sin φ, the equation ,uu
xy y x
υυ∂∂ ∂ ∂== −∂∂ ∂ ∂
 becomes 11 ,uu υυ
ρρ φρ ρ φ
∂∂ ∂ ∂== −∂∂ ∂ ∂
.
6.81. Use Problem 6.80 to show that under the transformation x = ρ cos φ, y = ρ sin φ, the equation
22
22 0uu
xy
∂∂ ==∂∂ becomes
22
22 2
11 0uu u
ρρρρ φ
∂∂ ∂=+ − =∂∂∂
.
Implicit functions and jacobians
6.82. If F(x, y) = 0, prove that dy/dx = –Fx/Fy.
6.83. Find (a) dy/dx and  (b) d2y/dx2 if x3 + y3 – 3xy = 0.
Ans. (a) (y – x2)/(y2 – x) (b) –2xy/(y2 – x)3
6.84. If xu2 + υ = y3, 2yu – xv3 = 4x, find (a) u
x
∂
∂
 and (b)
y
υ ∂
∂
.
Ans. (a)
32 2
22
34
62
xu
xu y
υυ
υ
−+
−+
 (b)
23
22
23
3
xu y
xu yυ
+
+
6.85. If u = f (x, y) and υ = g(x, y) are differentiable, prove that 1.ux x
xu x
υ
υ
∂∂ ∂ ∂ +=∂∂ ∂∂
 Explain clearly which
variables are considered independent in each partial derivative.
6.86. If f (x, y, r, s) = 0, g(x, y, r, s) = 0, prove that 0,yr ys
rx sx
∂∂ ∂∂ +=∂∂ ∂∂
 explaining which variables are
independent. What notation could you use to indicate the independent variables considered?
6.87. If F(x, y) = 0, show that
222
23
2x xy x yxy y yx
y
FF FF F FFdy
dx F
−+=− .
6.88. Evaluate 2(, ) (, ) 3(, )
FG if F u u uu υυυ
∂ =−∂
 and 23(, ) 2 .Gu uυυ υ=+
Ans. 24u2 υ + 16uv2 – 3υ3
6.89. If F = x + 3y2 – z3, G = 2x2yz, and H = 2z2 – xy, evaluate (, , )
(,,)
FGH
xyz
∂
∂
 at (1, –1, 0).
Ans. 10
6.90. If u = sin–1 x + sin–1 y and 2211 ,xy yxυ= − + −  determine whether there is a functional relationship
between u and υ, and, if so, find it.


## Page 169

CHAPTER 6  Partial Derivatives158
6.91. If F = xy + yz + zx, G = x2 + y2 + z2, and H = x + y + z, determine whether there is a functional relationship
connecting F,  G, and H, and, if so, find it.
Ans. H2 – G – 2F = 0
6.92. (a) If x = f (u, υ, w), y = g(u, υ, w), and z = h(u, υ, w), prove that (,,) (,, )
(,,) (,, )
xyz u w
xz x y w
υ
υ
∂∂ =∂∂
 1 provided
(,,) 0.(, , )
xyz
uwυ
∂ ≠∂
 (b) Give an interpretation of the result of (a) in terms of transformations.
6.93. If f (x, y, z) = 0 and g(x, y, z) = 0, show that (,) (,) (,)
(, ) (, ) (, )
dx dy dz
fg fg fg
yz zx xy
==∂∂∂
∂∂∂
giving conditions under which
the result is valid.
6.94. If x + y2 = u, y + z2 = υ, z + x2 = w, find (a) ,x
u
∂
∂
 (b)
2
2 ,x
u
∂
∂
 (c)
2 x
u υ
∂
∂∂
, assuming that the equations define x,
y, and z as twice differentiable functions of u, υ, and w.
Ans. (a) 1
18 xyz+
(b)
22 2
3
16 8 32
(1 8 )
xy y z xz
xyz
−−
+
 (c)
22 2
3
16 8 32
(1 8 )
yz x z xy
xyz
−−
+
6.95. State and prove a theorem similar to that in Problem 6.35, for the case where u = f (x, y, z), υ = g(x, y, z),
w = h(x, y, z).
Transformations, curvilinear coordinates
6.96. Given the transformation x  = 2u + υ, y = u – 3υ, (a) sketch the region ℜ′ of the uv plane into which the region
ℜ  of the xy plane bounded by x = 0, x = 1, y = 0, y = 1 is mapped under the transformation; (b) compute
(, )
(, )
xy
u υ
∂
∂
; and (c) compare the result of (b) with the ratios of the areas of ℜ and ℜ′.
Ans. (b) –7
6.97. (a) Prove that under a linear transformation x = a 1u + a2υ, y = b1u + b2υ(a1b2 – a2b1 /HS11005 0) lines and circles in
the xy plane are mapped, respectively, into lines and circles in the uv plane. (b) Compute the Jacobian J of
the transformation and discuss the significance of J = 0.
6.98. Given x = cos u cosh υ, y = sin u sinh υ, (a) show that, in general, the coordinate curves u = a and υ = b in
the uv plane are mapped into hyperbolas and ellipses, respectively, in the xy plane; (b) compute (,)
(, )
xy
u υ
∂
∂
;
(c) compute (, )
(,)
u
xy
υ ∂
∂
.
Ans. (b) sin2 u cosh2 υ + cos2 u sinh2 υ (c) (sin2 u cosh2 υ + cos2 u sinh2 υ)–1
6.99. Given the transformation x = 2u + 3υ – w, y = 2υ + w, z = 2u – 2υ + w, (a) sketch the region ℜ′ of the uvw
space into which the region ℜ of the xyz space bounded by x = 0, x = 8, y = 0, y = 4, z = 0, z = 6 is mapped;
(b) compute (,,)
(, , )
xyz
uwυ
∂
∂
; (c) compare the result of (b) with the ratios of the volumes of ℜ and ℜ′.
Ans. (b) 1
6.100. Given the spherical coordinate transformation x = r sin θ cos φ, y = r sin θ sin φ, z = r cos θ, where r δ 0. 0
< θ < π, 0 < φ < 2π, describe the coordinate surfaces (a) r = a, (b) θ = b, and (c) φ = c, where a, b, c are
any constants.
Ans. (a) spheres (b) cones (c) planes


## Page 170

CHAPTER 6  Partial Derivatives 159
6.101. (a) Verify that for the spherical coordinate transformation of Problem 6.100, 2(,,)
(, , )
xyzJr r θφ
∂==∂
 sin θ.
(b) Discuss the case where J = 0.
Miscellaneous problems
6.102. If F(P,  V,  T) = 0, prove that (a)
vp T
PT P
TV V
∂∂ ∂ =−∂∂ ∂
 (b)
vp T
PT V
TV P
∂∂∂ =−∂∂ ∂ 1.
These results are useful in thermodynamics, where P, V, and T correspond to pressure, volume, and tem-
perature of a physical system.
6.103. Show that F(x/y, z/y) = 0 satisfies x(∂z/∂x) + y(∂z/∂y) = z.
6.104. Show that F(x + y – z, x2 + y2) = 0 satisfies x(∂z/∂y) – y(∂z/∂x) = x – y.
6.105. If x = f (u, υ) and y = g(u, υ), prove that 1( x,y)where = . (u, )
y JxJ u
υ
υ
∂∂ ∂=−∂∂ ∂
6.106. If x = f (u, υ), y = g(u, υ), z = h(u, υ) and F(x, y, z) = 0, prove that (, ) (, ) (, ) 0(, ) (, ) (, )
yz zx xydx dy dzuuuυυυ
∂∂∂ ++=∂∂∂
6.107. If x = φ(u, υ, w), y = ψ(u, υ, w), u = f (r, s), υ = g(r, s), and w = h(r, s), prove that
( ,) ( ,) ( ,) ( ,) ( , ) ( ,) (,)
(, ) (, ) (, ) ( , ) (, ) ( , ) (, )
xy xy u xy w xy wu
rs u rs w rs wu rs
υυ
υυ
∂∂ ∂∂∂ ∂∂=+ = + +∂∂ ∂∂ ∂∂ ∂
6.108. (a) Prove that .,a b e f ae bg af bh
c d g h ce dg cf dh
++= ++
 thus establishing the rule for the product of two second-
order determinants referred to in Problem 6.43. (b) Generalize the result of (a) to determinants of 3, 4 . . .
6.109. If x, y, and z are functions of u, υ, and w, while u, υ, and w are functions of r, s, and t, prove that
(, , ) (, , ) (, , )
(, ,) (, , ) (, ,)
xyz xyz u w
rst u w rst
υ
υ
∂∂ ∂ =⋅∂∂ ∂
.
6.110. Given the equation F j(x1, . . . , xm, y1, . . ., yn) = 0 where j = 1, 2, . . . , n, prove that, under suitable conditions
on Fj, 12 12
12 12
( ,,,,, ( ,,,
( ,,,,, ( ,,,
rn nr
ss n n
FF F F FF Fy
x y yxy y yy
∂∂∂ =∂∂ ∂
KK K
KK K
K
K
K
K
K
K
6.111. (a) If F(x, y) is homogeneous of degree 2, prove that
22 2
22
22 22 .FF Fxx y yF xyxy
∂∂ ∂ ++ = ∂∂∂∂
(b) Illustrate by using the special case F(x, y) = x 2 ln (y/x).
Note that the result can be written in operator form, using Dx ≡∂ /∂x and Dy ≡∂ /∂y, as (x Dx + y Dy)2
F = 2F. [Hint: Different Differentiate both sides of Problem 6.25, Equation (1), twice with respect to λ.]
6.112. Generalize the result of Problem 6.11 as follows. If F(x 1, x2, . . . , xn) is homogeneous of degree p, then for
any positive integer r, if Dxj ≡∂ /∂xj, (x1Dx1 + x2Dx 2 + . . . + xnDxn)r F = p(p – 1) . . . (p – r + 1)F.
6.113. (a) Let x and y be determined from u and υ according to x + iy = (u + iv)3. Prove that under this
transformation the equation
22 2 2
22 2 20 is transformed into 0xy u
φφ φφ
υ
∂∂ ∂∂+= + =∂∂ ∂∂
.
(b) Is the result in (a) true if x + iy = F(u + iv)? Prove your statements.


## Page 171

This page intentionally left blank


## Page 172

161
Vectors
Vectors
The foundational ideas for vector analysis were formed independently in the nineteenth century by William
Rowan Hamilton and Herman Grassmann. We are indebted to the physicist John Willard Gibbs, who formu-
lated the classical presentation of the Hamilton viewpoint in his Yale lectures, and his student E. B. Wilson,
who considered the mathematical material presented in class worthy of organizing as a book (published in
1901). Hamilton was searching for a mathematical language appropriate to a comprehensive exposition of
the physical knowledge of the day. His geometric presentation emphasizing magnitude and direction and
compact notation for the entities of the calculus was refined in the following years to the benefit of express-
ing Newtonian mechanics, electromagnetic theory, and so on. Grassmann developed an algebraic and more
philosophic mathematical structure which was not appreciated until it was needed for Riemanian (non-
Euclidean) geometry and the special and general theories of relativity.
Our introduction to vectors is geometric. We conceive of a vector as a
directed line segment
PQ
→
 from one point P,  called the initial point, to
another point Q, called the terminal point. We denote vectors by boldfaced
letters or letters with an arrow over them. Thus, PQ
→
 is denoted by A or A
r
,
as in Figure 7.1. The magnitude or length of the vector is then denoted by
⏐ PQ
→
⏐, PQ , ⏐A ⏐ or ⏐ A
r
⏐.
Vectors are defined to satisfy the geometric properties discussed in the
next section.
Geometric Properties of Vectors
1. Two vectors A and B are equal if they have the same magnitude and direction regardless of their initial
points. Thus, A = B in Figure 7.1.
In other words, a vector is geometrically represented by any one of a class of commonly directed
line segments of equal magnitude. Since any one of the class of line segments may be chosen to rep-
resent it, the vector is said to be free. In certain circumstances (tangent
vectors, forces bound to a point), the initial point is fixed; then the
vector is bound. Unless specifically stated, the vectors in this discus-
sion are free vectors.
2. A vector having direction opposite to that of vector A but with the
same magnitude is denoted by –A (see Figure 7.2).
3. The sum or resultant of vectors A and B of Figure 7.3(a) is a vector
CHAPTER 7
Figure 7.1
Figure 7.2


## Page 173

CHAPTER 7  Vectors162
C formed by placing the initial point of B on the terminal point of A and joining the initial point of A
to the terminal point of B [see Figure 7.3(b)]. The sum C is written C = A + B. The definition here is
equivalent to the parallelogram law for vector addition, as indicated in Figure 7.3(c).
Figure 7.3
Extensions to sums of more than two vectors are immediate. For example, Figure 7.4 shows how to
obtain the sum or resultant E of the vectors A, B, C, and D.
Figure 7.4
4. The difference of vectors A and B, represented by A – B, is that vector C which added to B gives A.
Equivalently, A – B may be defined as A + (–B). If A = B, then A – B is defined as the null or zero
vector and is represented by the symbol 0. This has a magnitude of zero, but its direction is not de-
fined.
The expression of vector equations and related concepts is facilitated by the use of real numbers and
functions. In this context, these are called scalars. This special designation arises from application
where the scalars represent objects that do not have direction, such as mass, length, and temperature.
5. Multiplication of a vector A by a scalar m produces a vector mA with magnitude ⏐m⏐ times the mag-
nitude of A and direction the same as or opposite to that of A according as m is positive or negative. If
m = 0, mA = 0, the null vector.
Algebraic Properties of Vectors
The following algebraic properties are consequences of the geometric definition of a vector. (See Problems
7.1 and 7.2.)
If A, B, and C are vectors, and m and n are scalars, then
1. A + B = B + A Commutative law for addition
2. A + (B + C) = (A + B) + C Associative law for addition
3. m(nA) = (mn)A = n(mA) Associative law for multiplication
4. (m + n)A = mA + nA Distributive law
5. m(A + B) = mA + mB Distributive law


## Page 174

CHAPTER 7  Vectors 163
Note that in these laws only multiplication of a vector by one or more scalars is defined. On Pages 164
and 165 we define products of vectors.
Linear Independence and Linear Dependence of a Set of Vectors
That a set of vectors A1, A2, . . . ,Ap is linearly independent means that a1A1 + a2A2 + . . . apAp = 0 if and only
if a1 = a2 = . . . = ap = 0 (i.e., the algebraic sum is zero if and only if all the coefficients are zero). The set of
vectors is linearly dependent when it is not linearly independent.
Unit Vectors
Unit vectors are vectors having unit length. If A is any vector with magnitude A = ⏐A⏐ > 0, then A/⏐A⏐ is
a unit vector. If a is a unit vector with the same direction and sense as A, then a = A/⏐A⏐.
Rectangular (Orthogonal) Unit Vectors
The rectangular unit vectors i, j, and k are unit vectors having the direction of the positive x,y, and z axes of
a rectangular coordinate system (see Figure 7.5). The triple i, j , k is said to be a basis of the collection of
vectors. We use right-handed rectangular coordinate systems unless otherwise specified. Such systems derive
their name from the fact that a right-threaded screw rotated through 90º from Ox to Oy will advance in the
positive z direction. In general, three vectors A, B, and C which have coincident initial points and are not
coplanar are said to form a right-handed system or dextral system if a right-threaded screw rotated through
an angle less than 180º from A to B will advance in the direction C (see Figure 7.6).
Components of a Vector
Any vector A in three dimensions can be represented with initial point at the origin O of a rectangular coor-
dinate system (see Figure 7.7). Let (A
1, A2, A3) be the rectangular coordinates of the terminal point of vector
A with initial point at O . The vectors A1i, A2 j, and A 3k are called the rectangular component vectors, or
simply component vectors, of A in the x, y, and z directions, respectively. A1, A2, and A3 are called the rect-
angular components, or simply components, of A in the x, y, and z directions, respectively.
The vectors of the set {i, j, k} are perpendicular to one another, and they are unit vectors. The words orthogo-
nal and normal, respectively, are used to describe these characteristics; hence, the set is what is called an ortho-
normal basis.
Figure 7.5
 Figure 7.6


## Page 175

CHAPTER 7  Vectors164
Figure 7.7
It is easily shown to be linearly independent. In an n-dimensional space, any set of n linearly independent
vectors is a basis. The further characteristic of a basis is that any vector of the space can be expressed through
it. It is the basis representation that provides the link between the geometric and the algebraic expressions of
vectors and vector concepts.
The sum or resultant of A
1i, A2 j, and A3k is the vector A, so that we can write
 A  = A1i + A2 j + A3k (1)
The magnitude of A is
A = A 222
123AAA=+ +  (2)
In particular, the position vector or radius vector r from O to the point (x, y, z is written
 r  = xi + yj + zk (3)
and has magnitude r= r 222 .xyz=+ +
A theory of vectors would be of limited use without a process of multiplication. In fact, two binary pro-
cesses, designated as dot product and cross product, were created to meet the geometric and physical needs
to which vectors were applied.
The first of them, the dot product, was generated from consideration of the angle between two vectors.
Dot, Scalar, or Inner Product
The dot or scalar product of two vectors A and B, denoted by A · B (read: A dot B) is defined as the product
of the magnitudes of A and B and the cosine of the angle between them. In symbols,
 A  · B = AB cos θ,   0 < θ < π (4)
Assuming that neither A nor B is the zero vector, an immediate consequence of the definition is that A ·
B = 0 if and only if A and B are perpendicular. Note that A · B is a scalar and not a vector.
The following laws are valid:
1. A · B = B · A Commutative law for dot products
2. A · (B + C) = A · B + A · C Distributive Law
3. m(A · B) = (mA) · B = A · (mB) = (A · B)m, where m is a scalar
4. i · i = j · j = k · k = 1, i · j = j · k = k · i = 0
5. If A = A1i + A2 j + A3k and B = B1i + B2 j + B3k, then A · B = A1B1 + A2B2 + A3B3


## Page 176

CHAPTER 7  Vectors 165
The equivalence of this component form the dot product with the geometric definition 4 following from
the law of cosines. (See Figure 7.8).
Figure 7.8
In particular,
⏐C⏐ 2 = ⏐A⏐ 2 + ⏐B⏐ 2 – 2⏐A⏐⏐B⏐ cos θ
Since C = B – A, its components are B1 – A1, B2 – A2, B3 – A3 and the square of its magnitude is
⏐B⏐ 2 + ⏐A⏐ 2 – 2(A1B1 + A2B2 + A3B3
When this representation for ⏐C2⏐ is placed in the original equation and cancellations are made, we obtain
A1B1 + A2B2 + A3B3 = ⏐A⏐⏐B⏐ cos θ.
The second form of vector multiplication—that is, the cross product—emerged from Hamilton’s theory
of quaternions (1844). Algebraically, the cross product is an example of a noncommutative operation. Geo-
metrically, it generates a vector perpendicular to the initial pair of vectors, and its physical value is illustrated
in electromagnetic theory, where it aids in the representation of a magnetic field perpendicular to the direc-
tion of an electric current.
Cross or Vector Product
The cross or vector product of A and B is a vector C = A × B (read: A cross B). The magnitude of A × B is
defined as the product of the magnitudes of A and B and the sine of the angle between them. The direction
of the vector C = A × B is perpendicular to the plane of A and B, and such that A, B, and C form a right-
handed system. In symbols,
 A  × B = AB sin θu, 0 < θ < π (5)
where u is a unit vector indicating the direction of A × B. If A = B or if A is parallel to B, then sin θ = 0 and
A × B = 0.
The following laws are valid:
1. A × B = –B × A (Commutative law for cross products fails)
2. A × (B + C) = A × B + A × C Distributive Law
3. m(A × B) = (mA) × B = A × (mB) = (A × B)m, where m is a scalar
Also, the following consequences of the definition are important:
4. i × i = j × j = k × k = 0, i × j = k, j × k = i, k × i = j
5. If A = A1i + A2 j + A3k and B = B1i + B1i + B2j + B3k, then
123
123
ij k
AB = AAA
BBB
×


## Page 177

CHAPTER 7  Vectors166
The equivalence of this component representation (5) and the
geometric definition may be seen as follows. Choose a coodinate
system such that the direction of the x-axis is that of A and the xy
plane is the plane of the vectors A and B. (See Figure 7.9.) Then
A × B
11 2
12
ij k
=0 0 k
0
AA B
BB
== A B sine θ k
Since this choice of coordinate system places no restrictions on
the vectors A  and B , the result is general and thus establishes the
equivalence.
6. ⏐A × B⏐ = the area of a parallelogram with sides A and B.
7. If A × B = 0 and neither A nor B is a null vector, then A and B
are parallel.
Triple Products
Dot and cross multiplication of three vectors, A, B, and C may produce meaningful products of the form
(A · B)C, A · (B × C), and A × (B × C). The following laws are valid:
1. (A · B)C /HS11005A(B · C) in general
2. A · (B × C) = B · (C × A) = C · (A × B) = volume of a parallelepiped having A, B, and C as edges, or
the negative of this volume according as A, B, and C do or do not form a right-handed handed system.
If A = A1i + A2 j + A3k, B = B1i + B2 j + B3k and C = C1i + C2 j + C3k, then
A · (B × C)
123
123
123
=
AAA
BBB
CCC
 (6)
3. A × (B × C) /HS11005 (A × B) × C (Associative law for cross products fails)
4. A × (B × C) = (A · C)B – (A · B)C
 ( A × B) × C = (A · C)B – (B · C)A
The product A · (B × C) is called the scalar triple product or box product and may be denoted by [ABC].
The product A × (B × C) is called the vector triple product.
In A · (B × C) parentheses are sometimes omitted and we write A · B × C. However, parentheses must be
used in A × (B × C) (see Problem 7.29). Note that A · (B × C) = (A × B) · C. This is often expressed by stat-
ing that in a scalar triple product the dot and the cross can be interchanged without af
fecting the result (see
Problem 7.26).
Axiomatic Approach to Vector Analysis
From the preceding remarks it is seen that a vector r = xi + yj + zk is determined when its three components
(x, y, z) relative to some coordinate system are known. In adopting an axiomatic approach, it is thus quite
natural for us to make the following assumptions.
Definition A three-dimensional vector is an ordered triplet of real numbers with the following properties.
If A = (A1, A2, A3) and B = (B1, B2, B3), then
Figure 7.9


## Page 178

CHAPTER 7  Vectors 167
1. A = B if and only if A1 = B1, A2 = B2, A3 = B3
2. A + B = (A1 + B1, A2 + B2, A3 + B3)
3. A – B = (A1 – B1, A2 – B2, A3 – B3)
4. 0 = (0, 0, 0)
5. mA = m(A1, A2, A3) = (mA1, mA2, mA3)
In addition, two forms of multiplication are established.
6. A · B = A1B1 + A2B2 + A3B3
7. Length or magnitude of 222
123A= A A A AAA=⋅ = + +
8. A × B=  (A2B3 – A3 B2, A3B1 – A1B3, A1B3, A1B2 – A2B1)
Unit vectors are defined to be (1, 0, 0), (0, 1, 0), (0, 0, 1) and then designated by i, j, k, respectively, thereby
identifying the components axiomatically introduced with the geometric orthonormal basis elements.
If one wishes, this axiomatic formulation (which provides a component representation for vectors) can be
used to reestablish the fundamental laws previously introduced geometrically; however, the primary reason
for introducing this approach was to formalize a component representation of the vectors. It is that concept
that will be used in the remainder of this chapter.
Note 1 One of the advantages of component representation of vectors is the easy extension of the ideas
to all dimensions. In an n-dimensional space, the component representation is
A(A1, A2, . . . , An)
An exception is the cross product which is specifically
restricted to three-dimensional space. There are generaliza-
tions of the cross product to higher dimensional spaces, but
there is no direct extension.)
Note 2 The geometric interpretation of a vector en-
dows it with an absolute meaning at any point of space.
The component representation (as an ordered triple of
numbers) in Euclidean three space is not unique; rather,
it is attached to the coordinate system employed. This
follows because the components are geometrically inter-
preted as the projections of the arrow representation on
the coordinate directions. Therefore, the projections on
the axes of a second coordinate system (rotated, for ex-
ample) from the first one will be different. (See Figure
7.10.) Therefore, for theories where groups of coordinate
systems play a role, a more adequate component defini-
tion of a vector is as a collection of ordered triples of
numbers, each one identified with a coordinate system of
the group, and any two related by a coordinate transfor-
mation. This viewpoint is indispensable in Newtonian
mechanics, electromagnetic theory, special relativity, and
so on.
Vector Functions
If corresponding to each value of a scalar u we associate a vector A, then A is called a function of u denoted
by A(u). In three dimensions we can write A(u) = A
1(u)i + A2(u)j + A3(u)k.
Figure 7.10


## Page 179

CHAPTER 7  Vectors168
The function concept is easily extended. Thus, if to each point (x,y, z) there corresponds a vector A, then
A is a function of (x, y, z), indicated by A(x, y, z) = A1(x, y, z)i + A2(x, y, z)j, + A3(x, y, z)k.
We sometimes say that a vector function A defines a vector field since it associates a vector with each
point of a region. Similarly, φ(x, y, z) defines a scalar field since it associates a scalar with each point of a
region.
Limits, Continuity, and Derivatives of Vector Functions
Limits, continuity, and derivatives of vector functions follow rules similar to those for scalar functions al-
ready considered. The following statements show the analogy which exists.
1. The vector function represented by A(u) is said to be continuous at u 0 if, given any positive number δ,
we can find some positive number δ such that ⏐ A(u) – A (u0)⏐ < δ  whenever ⏐ u – u 0⏐ < δ . This is
equivalent to the statement
0
lim
uu→
A(u) = A(u0).
2. The derivative of A(u) is defined as
0
AA ( + ) – A ( )lim
u
du u u
du uΔ→
Δ= Δ
provided this limit exists. In case A(u) = A1(u)i + A2 A2(u)j + A3(u)k; then
1A dAd
du du= i 2+ dA
du j 3+ dA
du k
Higher derivatives such as d2A/du2, etc., can be similarly defined.
3. If A(x, y, z) = A1(x, y, z)i + A2(x, y, z)j + A3(x, y, z)k; then
dA AAA=++ dx dy dzxyz
∂∂∂
∂∂∂
A A A
is the differential of A.
4. Derivatives of products obey rules similar to those for scalar functions. However, when cross products
are involved, the order is important. Some examples are
(a) A(A ) = A .dd d
du du du
φφφ +A AAA
(b) BA(A B) = A Byy y
∂∂ ∂ ⋅⋅ + ⋅∂∂ ∂A A AB BB
(c) BA(A B) = A Bzz z
∂∂ ∂ ×× + ×∂∂ ⋅ ∂A A A BB B  (maintain the order of A and B)
Geometric Interpretation of a Vector Derivative
If r is the vector joining the origin O of a coordinate system and the point (x, y, z), then specification of the
vector function r(u) defines x, y, and z as functions of u (r is called a position vector). As u changes, the
terminal point of r describes a space curve (see Figure 7.11) having parametric equations x = x(u), y = y(u),
z = z(u). If the parameter u is the are length s measured from some fixed point on the curve, then recall from
the discussion of arc length that ds2 = dr · dr. Thus,
rd
ds =dr T (7)


## Page 180

CHAPTER 7  Vectors 169
Figure 7.11
is a unit vector in the direction of the tangent to the curve and is called the unit tangent vector. If u is the time
t, then
rd
dt = vdr  (8)
is the velocity with which the terminal point of r describes the curve. We have
rrv=d d ds ds
dt ds dt dt υ== TTv = dr dr  (9)
from which we see that the magnitude of v is υ = ds/dt. Similarly,
2
2
rd
dt = ar  (10)
is the acceleration with which the terminal point of r describes the curve. These concepts have important
applications in mechanics and differential geometry.
A primary objective of vector calculus is to express concepts in an intuitive and compact form. Success
is nowhere more apparent than in applications involving the partial differentiation of scalar and vector fields.
[Illustrations of such fields include implicit surface representation Φ{x, y, z(x, y) = 0, the electromagnetic
potential function Φ (x, y, z), and the electromagnetic vector field F(x, y, z).] To give mathematics the capabil-
ity of addressing theories involving such functions, William Rowan Hamilton and others of the nineteenth
century introduced derivative concepts called gradient, divergence, and curl, and then developed an analytic
structure around them.
An intuitive understanding of these entities begins with examination of the differential of a scalar field, i.e.,
dd x d y d zxd y z
∂Φ ∂Φ ∂ΦΦ= + +∂∂
Now suppose the function Φ is constant on a surface S and that C; x = f1(t), y = f2(t), z = f3(t) is a curve on
S. At any point of this curve, r ++dd x d x d z
dt dt dt dt= ij k  lies in the tangent plane to the surface. Since this state-
ment is true for every surface curve through a given point, the differential dr spans the tangent plane. Thus,
the triple ,,xyz
∂Φ ∂Φ ∂Φ
∂∂∂  represents a vector perpendicular to S. With this special geometric characteristic in
mind we define
x
∂Φ∇Φ = ∂ i y
∂Φ+ ∂ j z
∂Φ+ ∂ k
to be the gradient of the scalar field Φ.
Furthermore, we give the symbol ∇ a special significance by naming it del.
EXAMPLE 1. f Φ(x, y, z) = 0 is an implicitly defined surface, then, because the function always has the value
zero for points on it, the condition of constancy is satisfied and ∇φ is normal to the surface at any of its points.


## Page 181

CHAPTER 7  Vectors170
This allows us to form an equation for the tangent plane to the surface at any one of its points. See Problem
7.36.
EXAMPLE 2. For certain purposes, surfaces on which Φ is constant are called level surfaces. In meteorology,
surfaces of equal temperature or of equal atmospheric pressure fall into this category. From the previous devel-
opment, opment, we see that ∇Φ is perpendicular to the level surface at any one of its points and, hence, has the
direction of maximum change at that point.
The introduction of the vector operator ∇ and the interaction of it with the multiplicative properties of dot
and cross come to mind. Indeed, this line of thought does lead to new concepts called divergence and curl.
A summary follows.
Gradient, Divergence, and Curl
Consider the vector operator ∇ (del) defined by
xy z
∂∂ ∂∇≡ + +∂∂ ∂ijk  (11)
Then if φ(x, y, z) and A(x, y, z) have continuous first partial derivatives in a region (a condition which is in
many cases stronger than necessary), we can define the following.
1. Gradient. The gradient of φ is defined by
grad
++
xy z x y z
xyz
φφ φφφ φ
φφφ
⎛⎞ ∂∂ ∂ ∂ ∂ ∂=∇ = + + = + +⎜⎟∂∂ ∂ ∂ ∂ ∂⎝⎠
∂∂∂= ∂∂∂
ij k ijk
ij k
 (12)
2. Divergence. The divergence of A is defined by
12 3
312
div ( + + )
++
AA Axy z
AAA
xyz
⎛⎞ ∂∂ ∂=∇⋅ = + + ⋅⎜⎟∂∂ ∂⎝⎠
∂∂∂= ∂∂∂
AA ijk i j k
 (13)
3. Curl. The curl of A is defined by
12 3curl ( + + )AA Axy z
⎛⎞ ∂∂ ∂=∇× = + + ×⎜⎟∂∂ ∂⎝⎠
AA i j k i j k
123
xyz
AAA
∂∂∂= ∂∂∂
ij k
1223 12
–yz xyxz
AAAA AA
∂∂ ∂∂∂∂
∂∂ ∂∂=+ ∂∂ijk
33 21 2 1–+ –+ –AA AA A A
yz zx xy
∂∂ ∂∂ ∂ ∂⎛⎞ ⎛⎞ ⎛⎞= ⎜⎟ ⎜⎟ ⎜⎟∂∂ ∂∂ ∂∂ ⎝⎠⎝⎠ ⎝⎠
ij k
Note that in the expansion of the determinant, the operators ∂/∂x, ∂/∂y, ∂/∂z must precede A1, A2, A3. In
other words, ∇ is a vector operator, not a vector. When employing it, the laws of vector algebra either do not


## Page 182

CHAPTER 7  Vectors 171
apply or at the very least must be validated. In particular, ∇ × A is a new vector obtained by the specified
partial differentiation on A, while A × ∇ is an operator waiting to act upon a vector or a scalar.
Formulas Involving ∇
If the partial derivatives of A, B, U, and V are assumed to exist, then
1. ∇(U + V) = ∇U + ∇V or grad (U + V) = grad u + grad V
2. ∇ · (A + B) = ∇ · A + ∇ · B or div (A + B) + div A + div B
3. ∇ × (A + B) = ∇ × A + ∇ × B or curl (A + B) = curl A + curl B
4. ∇ · (UA) = (∇U) · A + U(∇ · A)
5. ∇ × (UA) = (∇U) × A + U(∇ × A)
6. ∇ · (A × B) = B · (∇ × A) – A · (∇ × B)
7. ∇ × (A × B) = (B · ∇)A – B(∇ · A) – (A · ∇)B + A(∇ · B)
8. ∇(A · B) = (B · ∇)A + (A · ∇)B + B × (∇ × A) + A × (∇ × B)
9.
222
2
222
222
2
222
.( ) is called the of U.
and is called the .
UUUU U Laplacianxyz
Lapacian operatorxyz
∂∂∂∇∇ ≡ ∇ ≡ + + ∂∂∂
∂∂∂∇≡ + +∂∂∂
10. ∇ × (∇U) = 0. The curl of the gradient of U is zero.
11. ∇ · (∇ × A) = 0. The divergence of the curl of A is zero.
12. ∇ × (∇ × A) = ∇(∇ · A) – ∇ 2A
Vector Interpretation of Jacobians and Orthogonal Curvilinear Coordinates
The transformation equations
 x  = f (u1, u2, u3),   y = g(u 1, u2, u3),   z = h(u 1, u2, u3) (15)
(where we assume that f, g, h are continuous, have continuous partial derivatives, and have a single-valued
inverse) establish a one-to-one correspondence between points in an xyz and u1 u2u3 rectangular coordinate
system. In vector notation, the transformation (15) can be written
 r  = xi + yj + zk = f (u1, u2, u3)i + g(u1, u2, u3)j + h(u1, u2, u3)k (16)
A point P in Figure 7.12 can then be defined not only by rec-
tangular coordinates (x, y, z) but by coordinates (u1, u2, u3) as
well. We call (u1, u2, u3) the curvilinear coordinates of the point.
If u2 and u 3 are constant, then as u1 varies, r  describes a
curve which we call the u1 coordinate curve. Similarly, we de-
fine the u2 and u3 coordinate curves through P.
From Equation (16), we have
123
12 3
=dd ud ud uuu u
∂∂∂ ++∂∂ ∂
rrrr  (17)
The collection of vectors ∂r
∂u1
, ∂r
∂u2
, ∂r
∂u3
 is a basis for the vec-
tor structure associated with the curvilinear system. If the cur-
 Figure 7.12


## Page 183

CHAPTER 7  Vectors172
vilinear system is orthogonal, then so is this set; however, in general, the vectors are not unit vectors. he
differential form for are length may be written
ds2 = g11(du1)2 + g22(du2)2 + g33(du3)2
where
g11 = ∂r
∂u1
. ∂r
∂u1
, g22 = ∂r
∂u2
. ∂r
∂u2
, g33 = ∂r
∂u3
. ∂r
∂u3
The vector ∂r/∂u1 is tangent to the u1 coordinate curve at P. If e1 is a unit vector at P in this direction, we
can write ∂r/∂u1 = h1e1 where h1 = ⏐∂r/∂u1⏐. Similarly, we can write ∂r/∂u2 = h2e2 and ∂r/∂u3 = h3e3, where
h2 = ⏐∂r/∂u2⏐ and h3 = ⏐∂r/∂u3⏐, respectively. Then Equation (17) can be written
 d r = h1 du1e1 + h2 du2 e2 + h3 du3 e3 (18)
The quantities h1, h2, h3 are sometimes called scale factors.
If e1, e2, e3 are mutually perpendicular at any point P, the curvilinear coordinates are called orthogonal.
Since the basis elements are unit vectors as well as orthogonal, this is an orthonormal basis. In such case the
element of arc length ds is given by
 ds 2 = dr · dr = h2
1 du2
1 + h2
2 du2
2 + h2
3 du2
3 (19)
and corresponds to the square of the length of the diagonal in the preceding parallelepiped.
Also, in the case of othogonal coordinates referred to the orthonormal basis e 1, e2, e3, the volume of the
parallelepiped is given by
 dV = ⏐g jk⏐ du1 du2 du3 = ⏐(h1 du1 e1) · (h2 du2 e2) × (h3 du3 e3)⏐ = h1h2h3 du1 du2 du3 (20)
which can be written as
123 123
12 3 1 2 3
(,,). (, , )
xyzdV du du du du du duuu u u u u
∂∂ ∂ ∂=× =∂∂ ∂ ∂
rr r  (21)
where ∂(x, y, z)/∂(u1, u2, u3) is the Jacobian of the transformation.
It is clear that when the Jacobian vanishes there is no parallelepiped and this explains geometrically the
significance of the vanishing of a Jacobian as treated in Chapter 6.
Note: The further significance of the Jacobian vanishing is that the transformation degenerates at the
point.
Gradient Divergence, Curl, and Laplacian in Orthogonal Curvilinear Coordinates
If Φ is a scalar function and A = A 1 e1 + A2 e2 + A3e3 a vector function of orthogonal curvilinear coordinates
u1, u2, u3, we have the following results.
1. 123
11 2 2 33
11 1grad hu hu hu
∂Φ ∂Φ ∂Φ∇Φ = Φ = + + ∂∂ ∂eee
2. ∇⋅ A div= A 23 1 3 1 2 1 2 3
123 1 2 3
1 (, ) ( ) ( )hh A h h A h h Ahhh u u u
⎡⎤∂∂ ∂=+ + ⎢⎥∂∂ ∂⎣⎦
3. ∇× A curl= A
11 2 2 33
123 1 2 3
11 2 2 33
eee
1
hh h
hhh u u u
hA hA hA
∂∂∂= ∂∂∂
e e e
4. 2 23 31 12
1 2 3111 222 333
1Laplacian of hh hh hh
hhh u h u u h u u h u
⎡⎤ ⎛⎞⎛⎞ ⎛⎞∂∂ Φ ∂∂ Φ ∂∂ Φ∇Φ= Φ= + +⎢⎥ ⎜⎟⎜⎟ ⎜⎟∂∂ ∂∂ ∂∂⎢⎥ ⎝⎠ ⎝⎠ ⎝⎠⎣⎦


## Page 184

CHAPTER 7  Vectors 173
These reduce to the usual expressions in rectangular coordinates if we replace (u 1, u2, u3) by (x, y, z), in
which case e1, e2, and e3 are replaced by i, j, and k and h1 = h2 = h3 = 1.
Special Curvilinear Coordinates
Cylindrical Coordinates (r, f,z ) See Figure 7.13.
Transformation equations:
x = ρ cos φ, y = ρ sin φ, z = z
where ρ >  0, 0 < φ < 2π, –/H11009 < z < /H11009.
Scale factors: h1 = 1, h2 = ρ, h3 = 1
Element of arc length: ds2 = dρ2 + ρ2 ρ2 dφ2 + dz2
Jacobian: (,,)
(,,)
xyz
z ρρφ
∂ =∂
Element of volume: dV = ρ d ρ d φ dz
Laplacian:
22
2
222
11 UU UU zρρρ ρ ρφ
⎛⎞∂∂ ∂ ∂∇= + + + ⎜⎟∂∂ ∂∂⎝⎠
22 2
22 2 2
11UU U U
zρρρρ φ
∂∂ ∂ ∂=+ + ++ ∂∂∂ ∂
Note that corresponding results can be obtained for polar coordinates in the plane by omitting z depend-
ence. In such case, for example, ds2 = d ρ2 + ρ2 dφ2, while the element of volume is replaced by the element
of area, dA = ρ d ρ d φ.
Spherical Coordinates (r, q, f) See Figure 7.14.
Transformation equations:
x = r sin θ cos φ, y = r sin θ sin φ, z = r cos θ
where r >  0, 0 < θ < π, 0 < φ < 2π.
Scale factors: h1 = 1, h2 = r, h3 = r sin θ
Element of arc length: ds2 = dr2 + r2 d θ 2 + r2 sin2 θ dφ2
Jacobian: 2(,,) sin(, , )
xyz rr θθφ
∂ =∂
Element of volume: dV = r2 sin θ dr dθ d φ
Laplacian: 22
2
1 UUr rrr
∂∂⎛⎞∇= ⎜⎟∂∂⎝⎠
2
22 2 2
11 sin
sin sin
UU
rr θθθθθ φ
∂∂ ∂⎛⎞++ ⎜⎟∂∂ ∂⎝⎠
Other types of coordinate systems are possible.
Figure 7.13
Figure 7.14


## Page 185

CHAPTER 7  Vectors174
SOLVED PROBLEMS
Vector algebra
7.1. Show that addition of vectors is commutative, i.e., A + B = B + A.
See Figure 7.15.
OP + PQ = OQ or A + B = C
and
OR + RQ = OQ or B + A = C
Then A + B = B + A.
7.2. Show that the addition of vectors is associative, i.e., A + (B + C) =
(A + B) + C. See Figure 7.16.
OP + PQ = OQ = (A + B) and PQ + QR = PR = (B + C)
Since
OP + PR = OR = D, i.e., A + (B + C) = D
OQ + QR = OR = D, i.e., (A + B) + C = D
we hav
e A + (B + C) = (A + B) + C.
Extensions of the results of Problems 7.1 and 7.2 show that the
order of addition of any number of vectors is immaterial.
7.3. An automobile travels 3 miles due north, then 5 miles northeast as
shown in Figure 7.17. Represent these displacements graphically
and determine the resultant displacement (a) graphically and (b)
analytically.
Vector OP or A represents displacement of 3 miles due north.
Vector PQ or B represents displacement of 5 miles northeast.
Vector OQ or C represents the resultant displacement or sum of
vectors A and B, i.e., C = A + B. This is the triangle law of vector
addition.
The resultant vector OQ can also be obtained by constructing
the diagonal of the parallelogram O P Q R having vectors OP = A
and OR (equal to vector PQ or B) as sides. This is the parallelogram
law of vector addition.
(a) Graphical Determination of Resultant. Lay off the 1-mile unit
on vector OQ to find the magnitude 7.4 miles (approximately).
Angle EOQ = 61.5º, using a protractor. Then vector OQ has magnitude 7.4 miles and direction 61.5º north
of east.
(b) Analytical Determination of Resultant. From triangle OPQ, denoting the magnitudes of A, B, C by A, B,
C, we have by the law of cosines
C
2 = A2 + B2 – 2 AB cos OPQ = 32 + 52 – 2(3)(5) cos 135º = 34 + 15 2  = 55.21
Figure 7.15
Figure 7.16
Figure 7.17


## Page 186

CHAPTER 7  Vectors 175
and C = 7.43 (approximately).
By the law of sines, .sin sin
AC
OQP OPQ=∠∠
 Then
sin 3(0.707)sin 0.2855 and 16 357.43
AO P QOPQ OQPC
∠ ′∠= = = ∠= o
Thus, vector OQ has magnitude 7.43 miles and direction (45º + 16º35´) = 61º35′ north of east.
7.4. Prove that if a and b are noncollinear, then xa + yb = 0 implies x = y = 0. Is the set {a, b} linearly
independent or linearly dependent?
Suppose x /HS11005 0. Then xa + yb = 0 implies xa = – yb or a = – (y/x)b; i.e., a and b must be parallel to the
same line (collinear), contrary to hypothesis. Thus, x = 0; then yb = 0, from which y = 0. The set is linearly
independent.
7.5. Prove that x1a + y1b = x2a + y2b, where a and b are noncollinear, then x1 = x2 and y1 = y2.
x1a + y1b = x2a + y2b can be written
x1a + y1b – (x2a + y2b) = 0 or (x1 – x2)a + (y1 – y2)b = 0
Hence, by Problem 7.4, x1 – x2 = 0, y1 – y2 = 0, or x1 = x2, y1 = y2.
Extensions are possible (see Problem 7.49).
7.6. Prove that the diagonals of a parallelogram bisect each other.
Let ABCD be the given parallelogram with diagonals intersecting
at P, as shown in Figure 7.18.
Since BD + a = b, BD = b – a. Then BP = x(b – a).
Since AC = a + b, AP = y(a + b).
But AB = AP + PB = AP – BP; i.e., a  = y (a + b ) – x (b – a )
= (x + y)a + (y – x)b.
Since a and b are noncollinear, we have, by Problem 7.5, x + y = 1
and y – x = 0; i.e., x = y = 1/2 and P is the midpoint of both diagonals.
7.7. Pro
ve that the line joining the midpoints of two sides of a triangle is
parallel to the third side and has half
its length.
From Figure 7.19, AC + CB = AB or b + a = c.
Let DE = d be the line joining the midpoints of sides AC and CB.
Then d = DC + CE = 11b+ a22
11=( b + a ) =c22
.
Thus, d is parallel to c and has half its length.
7.8. Prove that the magnitude A of the vector A = A 1i + A2 j + A3k is A
222
123 .AAA=+ +  See Figure 7.20.
By the Pythagorean theorem,
22 2
() () ()OP OQ QP=+
4 4 4
where ()OP
4
 denotes the magnitude of vector OP, etc. Similarly,
22 2
()()() .OQ OR RQ=+
4 4 4
Figure 7.18
Figure 7.19
Figure 7.20


## Page 187

CHAPTER 7  Vectors176
Then
22 22 2222 222
123 123( ) ( ) ( ) ( ) or , i.e.. .O P O R R Q Q P AAAA A AAA=++ = + + = + +
4 4 4 4
7.9. Determine the vector having initial point P(x 1, y1, z1) and
terminal point Q(x2, y2, z2) and find its magnitude. See Figure
7.21.
The position vector of P is r1 = x1i + y1j + z1k.
The position vector of Q is r2 = x2i + y2 j + z2k.
r1 = PQ = r2 or
PQ = r2 – r1 = (x2i + y2 j + z2k) – (x1i + y1j + z1k)
 = (x2 – x1)i + (y2 – y1)j + (z2 – z1)k
Magnitude of PQ = PQ
22 2
21 21 2 1() () ( ) .xx yy zz=− + − + −
Note that this is the distance between points P and Q.
The dot or scalar product
7.10. Prove that the projection of A on B is equal to A · b, where b, where b is
a unit vector in the direction of B.
Through the initial and terminal points of A pass planes perpendicu-
lar to B at G and H, respectively, as in Figure 7.22; then
Projection of A on B = GH EF=  = A cos θ = A · b
7.11. Prove A · (B + C) = A · B + A · C. See Figure 7.23.
Let a be a unit vector in the direction of A; then
Projection of (B + C) on A = projection of B on A + projection of C on A
(B + C) · a = B · a + C · a
Multiplying by A.
(B + C) · Aa = B · Aa + C · Aa
and
(B + C) · A = B · A + C · A
Then by the commutative law for dot products.
A · (B + C) = A · B + A · C
and the distributi
ve law is valid.
7.12. Prove that (A + B) · (C + D) = A · C + A · D + B · C + B · D.
By Problem 7.11, (A + B) · (C + D) = A · (C + (C + D) + B · (C + D) = A · C + A · D + B · C + B · D.
The ordinary laws of algebra are valid for dot products where the operations are defined.
Figure 7.21
Figure 7.22
Figure 7.23


## Page 188

CHAPTER 7  Vectors 177
7.13. Evaluate each of the following.
(a) i · i = ⏐i⏐⏐ i⏐ cos 0º = (1)(1)(1) = 1
(b) i · k = ⏐i⏐⏐ k⏐ cos 90º = (1)(1)(0) = 0
(c) k · j = ⏐k⏐⏐ j⏐ cos 90º = (1)(1)(0) = 0
(d) j · (2i – 3j + k) = 2j · i – 3j · j + j · k = 0 – 3 + 0 = –3
(e) (2i – j) · (3i + k) = 2i · (3i + k) – j · (3i + k) = 6i · i + 2i · k – 3j · i – j · k = 6 + 0 – 0 – 0 = 6
7.14. If A = A1i + A2 j + A3k and B = B1 i + B2 j + B3k, prove that A · B = A1B1 + A2B2 + A3B3.
 A  · B = (A1i + A2 j + A3k) · (B1i + B2 j + B3k)
 = A1i · (B1i + B2 j + B3k) + A2 j · (B1i + B2 j + B3k) + A3k · (B1i + B2 j + B3k)
 = A1B1i · i + A1B2i · j + A1B3i · k + A2B1 j · i + A2B2 j · j + A2B3 j · k
 + A3B1k · i + A3B2k · j + A3B3k · k
 = A1B1 + A2B2 + A3B3
since i · j = k · k = 1 and all other dot products are zero.
7.15. If A = A1i + A2 j + A3k. show that 222
123AA .A AAA=⋅ = + +
A · A = (A)(A) cos 0 = A2. Then A = ⋅AA .
Also, A · A = (A1i + A2 j + A3k) · (A1i + A2 j + A3k)
 = (A 1)(A1) + (A2)(A2) + (A3)(A3) = A2
1 + A2
2
 + A2
3
By Problem 7.14, taking B = A.
Then 222
123 .A AAA=⋅ = + +AA A2
1
 + A2
2
 + A2
3
 is the magnitude of A. Sometimes A · A is written A2.
The cross or vector product
7.16. Prove A × B = –B × A.
A × B = C has magnitude AB sin θ and direction such that A, B, and C form a right-handed system. See
Figure 7.24(a).
B × A = D has magnitude BA sin θ and direction such that B, A, and D form a right-handed system. See
Figure 7.24(b).
Then D has the same magnitude as C but is opposite in direction; i.e., C = –D or A × B = –B × A.
The commutative law for cross products is not valid.
Figure 7.24


## Page 189

CHAPTER 7  Vectors178
7.17. Prove that A × (B + C) = A × B + A × C for the case where A is perpendicular to B and also to C.
Since A is perpendicular to B,A × B is a vector
perpendicular to the plane of A  and B  and having
magnitude AB sin 90º = AB or magnitude of AB.
This is equivalent to multiplying vector B by A and
rotating the resultant vector through 90º to the posi-
tion shown in Figure 7.25.
Similarly, A × C is the vector obtained by mul-
tiplying C by A  and rotating the resultant vector
through 90º to the position shown.
In like manner, A  × (B  + C ) is the vector ob-
tained by multiplying B  + C  by A  and rotating the
resultant vector through 90º to the position shown.
Since A × (B + C) is the diagonal of the paral-
lelogram with A  × B  and A  × C  as sides, we have
A × (B + C) = A × B + A × C.
7.18. Pro v
e that A × (B + C) = A × B + A × C in the general case where A, B, and C are noncoplanar. See Figure 7.26.
Resolve B into two component vectors, one perpendicular to A and
the other parallel to A, and denote them by B⊥  and B|| respectively. Then
B = B⊥  + B||.
If θ is the angle between A and B, then B⊥  = B sin θ. Thus, the mag-
nitude of A × B⊥  is AB sin θ, the same as the magnitude of A × B. Also,
the direction of A × B⊥  is the same as the direction of A × B. Hence, A
× B⊥  = A × B.
Similarly, if C is resolved into two component vectors C || and C⊥ ,
parallel and perpendicular, respectively, to A, then A × C⊥  = A × C.
Also, since B + C = B ⊥  + B|| + C⊥  + C|| = (B⊥  + C⊥ ) + (B|| + C||), it
follows that
A × (B⊥  + C⊥ ) = A × (B + C)
Now B⊥  and C⊥  are vectors perpendicular to A, and so by Problem 7.17,
A × (B⊥  + C⊥ ) = A × B⊥  + A × C⊥
Then
A × (B + C) = A × B + A × C
and the distributive law holds. Multiplying by –1, using Problem 7.16, this becomes (B + C) × A = B × A + C
× A. Note that the order of factors in cross products is important. The usual laws of algebra apply only if proper
order is maintained.
7.19. (a) If A = A
1i + A2 j + A3k and B = B1i + B2 j + B3k, prove that A × B = 123
123
AAA
BBB
×=
ij k
AB .
Figure 7.25
Figure 7.26


## Page 190

CHAPTER 7  Vectors 179
AB i j k i j k
ii
×= + + × + +
=× +
() ()
(
AA A BB B
AB B
12 3 12 3
11 2 jjk j ijk k ijk 1++ × + ++ × + +BA B B BAB B B32 1 2 33 2 3)( ) ( )
==× +× × + × + × +AB AB AB AB AB A11 1 2 212 3 1 2ii ij + ik j i j j 2 2
33 3
23 32
B
AB AB AB
AB AB
3
12 3
jk
+ ki kj k k
×
×+ ×+ ×
=−() iij k
ij k
+− +− =() ()AB AB AB AB A A A
BBB
31 13 12 21 1 2 3
12 3 3
(b) Use the determinant representation to prove the result of Problem 7.18.
7.20. If A = 3i – j + 2k and B = 2i + 3j – k, find A × B.
AB
ijk
3
2
ij k×= −
−
= −
− − − + −12
31
12
31
32
21
31
23
i=− +57 j jk+ 11
7.21. Prove that the area of a parallelogram with sides A and B is
⏐A × B⏐. See Figure 7.27.
Area of parallelogram = h⏐B⏐
AB
AB
=
=×
sin
θ
Note that the area of the triangle with sides A and B  =
1/2 ⏐A × B⏐.
7.22. Find the area of the triangle with vertices at P(2, 3, 5), Q(4, 2, –1), and R(3, 6, 4).
PQ = (4 – 2)i + (2 – 3)j + (–1 – 5)k = 2i – j – 6k
PR = (3 – 2)i + (6 – 3)j + (4 – 5)k = i + 3j – k
Area of triangle PQ PR i=× = −1
2
1
2 2 (
j − k (i jk×+ −63))
= 1 1
2 216
13 1
1
2 19 4 7
1
2 19 4
22
ijk
ij k−−
−
=− +
=+ − +() ( ) ( 7 7 1
2 426
2) =
Triple products
7.23. Show that A · (B × C) is in absolute value equal to the volume of a parallelepiped with sides A, B, and C.
See Figure 7.28.
Figure 7.27


## Page 191

CHAPTER 7  Vectors180
Figure 7.28
Let n be a unit normal to parallelogram I, having the direction of B × C, and let h be the height of the
terminal point of A above the parallelogram I.
V olume of a parallelepiped = (height h)(area of parallelogram I)
= (A · n)(⏐B × C⏐)
= A · {⏐B × C⏐n} = A · (B × C)
If A, B and C do not form a right-handed system, A · n < 0 and the volume = ⏐A · (B × C)⏐.
7.24. If A = A1i + A2 j + A3k, B = B1i + B2 j + B3k, C = C1i + C2 j + C3k show that
A · (B × C)
123
123
123
AAA
BBB
CCC
=
A · (B × C)
[]
123
123
123 2 3 3 2 3 1 1 3 1 2 2 1
ij k
A
(i j k ) ( ) i( ) j( ) k
BBB
CCC
AAA B C B C B C B C B C B C
=⋅
=+ + ⋅ − + − + −
i
A
j k
123
12 3 3 2 23 1 1 3 31 2 2 1 1 2 3
123
() ( ) ()
AAA
AB C B C AB C B C AB C B C B B B
CCC
=− +− +− = ⋅
7.25. Find the volume of a parallelepiped with sides A = 3i – j, B = j + 2k, C = i + 5j + 4k.
By Problems 7.23 and 7.24, volume of parallelepiped |= A · (B × C)
31 0
|  | 0 1 2 |
154
−
= | 20 | 20.= −=
7.26. Prove that A · (B × C) = (A × B) · C, i.e., the dot and cross can be interchanged.
By Problem 7.24: A · (B × C)
123
123
123
,
AAA
BBB
CCC
=  (A × B) · C = C · (A × B)
123
123
123
CCC
AAA
BBB
=
Since the two determinants are equal, the required result follows.
7.27. Let r1 = x1 i + y1j + z1k, r2 = x2i + y2 j + z2k and r3 = x3i + y3 j + z3k be the position vectors of points P1(x1, y1,
z1), P2(x2, yx, z2), and P3(x3, y3, z3). Find an equation for the plane passing through P1, P2, and P3. See Figure
7.29.
We assume that P1, P2, and P3 do not lie in the same straight line; hence, they determine a plane.
Let r = xi + yj + zk denote the position vectors of any point P(x, y, z) in the plane. Consider vectors P1P2
= r2 – r1, P1P3 = r3 – r1 and P1P = r – r1 which all lie in the plane. Then
P1P · P1P2 × P1P3 = 0
uur
uuruur


## Page 192

CHAPTER 7  Vectors 181
Figure 7.29
or
(r – r1) · (r2 – r1) × (r3 – r1) = 0
In terms of rectangular coordinates this becomes
[(x – x1)i + (y – y1)j + (z – z1)k] · [(x2 – x1)i + (y2 – y1)j + (z2 – z1) k]
× [(x3 – x1)i + (y3 – y1)j + (z3 – z1)k] = 0
or, using Problem 7.24,
11 1
21 21 2 1
31 31 3 1
0
xx yy zz
xx yy zz
xx yy zz
−−−
−−− =
−−−
7.28. Find an equation for the plane passing through the points P 1(3, 1, –2), P2(–1, 2, 4), P3(2, –1, 1).
The positions vectors of P1, P2, P3 and any point P(x, y, z) on the plane are respectively
r1 = 3i + j – 2k, r2 = –i + 2j + 4k, r3 = 2i – j + k, r = xi + jj + zk
Then PP1 = r – r1, P2P1 = r2 – r1, P3P1 = r3 – r1, all lie in the required plane and so the required equation
is (r – r1) · (r2 – r1) × (r3 – r1) = 0, i.e.,
{(x – 3)i + (y – 1)j + (z + 2)k} · {– 4i + j + 6k} × {–i – 2j + 3k} = 0
{(x – 3)i + (y – 1)j + (z + 2)k} · {15 i + 6j + 9k} = 0
15(x – 3) + 6(y – 1) + 9(z + 2) = 0   or   5x – 2y + 3z = 11
Another method: By Problem 7.27, the required equation is
31 2
13 21 42 0 o r 5 2 3 1 1
23 1 1 12
xy z
xyz
−− +
−− − + = + + =
−− − +
7.29 (1) If A = i + j, B = 2i – 3j + k, and C = 4j – 3k, find (a) (A × B) × C, (b) A × (B × C).
(a) A × B
ij k
110
23 1
==
−
i – j – 5k. Then (A × B) × C
ijk
115
04 3
=− − =
−
i j k
23i + 3j + 4k.
(b) B × C
ijk
23 1
04 3
=− =
−
5i + 6j + 8k. Then A × (B × C)
ij k
110
568
= =
i j k
8i – 8j + k.
It can be proved that, in general, (A × B) × C /HS11005A × (B × C).


## Page 193

CHAPTER 7  Vectors182
7.29 (2) A × (B × C) = B (A, C) – C (A, B). Use the same vectors as in Problem 7.29 (1). (Note: sometimes
remembered with the phrase “back to cab.”)
Derivatives
7.30. If r = (t3 + 2t)i – 3e–2tj + 2 sin 5tk, find (a) r ,d
dt
dr  (b) r ,d
dt
dr  (c)
2
2
r ,d
dt
r  and (d)
2
2
rd
dt
r  at t = 0, and give a possible
physical significance.
(a) 32 2 2r ( 2 )i ( 3 )j (2sin 5 )k (3 2)i 6 j 10cos5 k
At = 0, r / 2i 6j 10k
ttdd d d tt e t t e tdt dt dt dt
td d t
−−=+ + − + = + ++
=++i
i i
j
j j
k
k k
dr
(b) From ( ), |a dr 22 2/ | (2) (6) (10) 140 2 35 at 0.dt t=+ + == =
(c)
2
22 2
2
22
r {(3 2)i 6 j 10 cos5 k} 6 i 12 j 50 sin 5 k
At = 0, r / 12j.
ttdr d d d te t t e tdt dt dtdt
td d t
−−⎛⎞==+ + + = − −⎜⎟⎝⎠
=−
r
r
i j k i j k
j.
dr
(d) From (c), ⏐d2r/dt2⏐ = 12 at t = 0.
If t represents time, these represent, respectively, the velocity, magnitude of the velocity, acceleration, and
magnitude of the acceleration at t = 0 of a particle moving along the space curve x = t 3 + 2t, y = –3e–2t, z = 2
sin 5t.
7.31. Prove that ()d
du ⋅=AB A dd
du du⋅+⋅BA B where A and B are differentiable functions of u.
Method 1:
0
() ( )() l i m
u
d
du uΔ→
+Δ ⋅ +Δ − ⋅⋅= Δ
AA BB A BAB
0
0
lim
lim A A
u
u
u
dd
uu u d u d u
Δ→
Δ→
⋅Δ + Δ ⋅ + Δ ⋅Δ= Δ
ΔΔ Δ⎛⎞= ⋅+⋅ +⋅ Δ = ⋅+⋅⎜⎟ ΔΔ Δ⎝⎠
AB A B AB
BA A BABB B
Method 2:
Let A = A1i + A2j + A3k, B + B1i + B2 j + B3k. Then
11 2 2 33
3312 1 2
12 3 123
() ( )dd AB AB ABdu du
dB dAdB dB dA dAAA A BBBdu du du du du du
dd
du du
Α⋅Β = + +
⎛⎞ ⎛ ⎞=+ +++ +⎜⎟ ⎜ ⎟⎝⎠ ⎝ ⎠
ΒΑ=Α ⋅ + ⋅ Β
A
A A
B
B B
7.32. If φ(x, y, z) = x2yz and A = 3x2yi + yz2j – xzk, find A
2
223i j k , f i n d ( Ax y yz xz yz φ∂=+ − ∂∂
A) at the point
(1, –2, –1).
22 2 4 2 2 2 3 3 2
42 22 3 32 3 42 222 3
2
42 222 3 4 2 2 3
( )(3 i ) = 3
() = ( 3 ) 3 3 2
() = ( 3 i 3 2 ) 6 6 2
If 1, 2, 1, this becomes 12 12
xy z xy y z x z yz xyz xy z
yz xyz xyz y xyz xy zzz
yx y z x y z y x y z x zyz z
xy z
φ
φ
φ
=+ − + −
∂∂ +− = + −∂∂
∂∂ +− = + −∂∂ ∂
== − = − − −
Aj k x i j k
Ax i j k x i jk
Ax jk x i j k
ij 2.+ k


## Page 194

CHAPTER 7  Vectors 183
7.33. If A = x2 sin yi + z2 cos yj – xy2k, find dA.
Method 1:
∂
∂ =− ∂
∂ −− ∂
x xy y y xy z y x y22 22 2sin , cos sin ,ik i j k ∂ =
= ∂
∂ + ∂
∂ + ∂
∂
=
z zy
d x dx y dy z dz
xy
2
2
cos
(s i n
j
iik i j k j−+ − − +y d x x y zyx y d yz y22 2 22)( c o s s i n )( c o s ) )
( sin cos ) ( cos sin
dz
x y dx x y dy z y dz z y d=+ +−22 22 i y y y dx xy dy)( )jk−+ 2 2
A A A
A A A A
Method 2:
 d A = d(x2 sin y)i + d(z2 cos y)j – d(xy2)k
 = (2x sin y dx + x2 cos y dy)i + (2z cos y dz – z2 sin y dy)j – (y2 dx + 2xy dy)k
Gradient, divergence, and curl
7.34. If φ = x2yz3 and A = xzi – y2j + 2x2yk, find (a) ∇φ, (b) ∇ · A, (c) ∇ × A, (d) div (φA), (e) curl (φA).
(a) ∇= ∂
∂ + ∂
∂ + ∂
∂
⎛
⎝⎜
⎞
⎠
⎟ = ∂
∂ + ∂
∂ + ∂
∂ =
φφ φφφij k ijkxy z xy z
∂ ∂
∂ + ∂
∂ + ∂
∂
=
x xy z x xy z z xy z
xyz
() () ()23 23 23
32
ij k
i +++xz xy z23 2 2 3jk
(b) ∇⋅ = ∂
∂ + ∂
∂ + ∂
∂
⎛
⎝⎜
⎞
⎠⎟⋅−+
= ∂
∂
Ai j k i j kxy z xz y x y() 22 2
x xxz y y z xy z y() ( ) ( )+ ∂
∂ −+ ∂
∂ =−22 22
(c) ∇× = ∂
∂ + ∂
∂ + ∂
∂
⎛
⎝⎜
⎞
⎠
⎟ ×− +
=
Ai j k i j k
ij
xy z xz y x y()
22 2
kk
∂∂ ∂∂ ∂∂
−
= ∂
∂ − ∂
∂ −⎛
///
() ( )
xyz
xz y x y
x xy z y
22
22
2
2⎝ ⎝⎜ ⎞
⎠⎟ + ∂
∂ − ∂
∂
⎛
⎝⎜ ⎞
⎠⎟ + ∂
∂ −− ∂ij z xz x xy x y() ( ) ( ) 2 22
∂ ∂
⎛
⎝⎜
⎞
⎠⎟
=+ −
y xz
xx x y
()
()
k
ij242
(d) div AA ) ij k() ( ( )φφ =∇⋅ =∇⋅ − +
=
xy z xyz xyz34 2 3 3 4 2 3 2
∂ ∂
∂ + ∂
∂ −+ ∂
∂
=
x xy z y xyz z xyz
xy z
() ( ) ( )34 2 3 3 4 2 3
2
2
3 442 2 34 2 236−+ xyz xyz
(e)
34 2 3 3 4 2 3
34 2 3 3 4 2 3
4 3 232 3 3 323 33 34
curl ( ) ( ) ( 2 )
// /
2
(4 3 ) (4 8 ) (2 )
xy z xyz xyz
xy z
xy z xyz xyz
xy z xyz xy z xyz x yz xz
φφ =∇× =∇× − +
=∂ ∂ ∂ ∂ ∂ ∂
−
=− +− − +
AA ij k
ij k
ij k


## Page 195

CHAPTER 7  Vectors184
7.35. Prove ∇ · (φA) = (∇φ) · A + φ (∇ · A).
12 3
123
312
123
12 3
12 3
() ( )
=() ( ) ()
(+ )
(+ )
=( ) ( )
AA A
AAAxyz
AAAAAAxyz x y z
AA Axyz
AA Axyz
φφ φ φ
φφφ
φφφ φ
φφφ
φ
φφ
∇⋅ =∇⋅ + +
∂∂∂ ++∂∂∂
∂∂∂⎛⎞∂∂∂=+++ + + ⎜⎟∂∂∂ ∂ ∂ ∂ ⎝⎠
⎛⎞∂∂∂=+ + ⋅ +⎜⎟∂∂∂⎝⎠
⎛⎞∂∂∂++ + ⋅ +⎜⎟∂∂∂⎝⎠
∇⋅+ ∇ ⋅
Ai j k
ijk i jk
ij ki jk
AA
7.36. Express a formula for the tangent plane to the surface φ(x, y, z) = 0 at one of its points P0(x0, y0, z0).
(∇φ) 0 · (r – r0) = 0
7.37. Find a unit normal to the surface 2x 2 + 4yz – 5z2 = –10 at the point P(3, –1, 2).
By Problem 7.36, a vector normal to the surface is
∇(2x 2 + 4yz – 5z2) = 4xi + 4zj + (4y – 10z)k = 12i + 8j – 24k at (3, –1, 2)
Them a unit normal to the surface at P is
22 2
12 8 24 3 2 6
7(12) (8) ( 24)
+− +− =
++ −
ij k ij k
Another unit normal to the surface at P is
326 .7
+−− ij k
7.38. If φ = 2x2y – xz3, find (a) ∇φ and (b) ∇ 2 φ.
(a) ()xyz xy z x xz∇= ∂
∂ + ∂
∂ + ∂
∂ =− +−φ φφφij k i j 42 3 322 kk
(b) 23 2 2Laplacian of (4 ) (2 ) ( 3 ) 4 6xy z x xz y xzxy zφφ φ ∂∂ ∂∇= = ∇ ⋅ ∇ = − + + − = −∂∂ ∂
Another method:
222 2 2 2
22 3 2 3 2 3
222 2 2 2(2 ) (2 ) (2 )
46
xy x z xy x z xy x zxyz x y z
yx z
φφφφ ∂∂∂ ∂ ∂ ∂∇= + + = − + − + −∂∂∂∂ ∂ ∂
=−


## Page 196

CHAPTER 7  Vectors 185
7.39. Prove div curl A = 0.
div curl AA
ij k
=∇ ⋅∇ × =∇ ⋅∂∂ ∂∂ ∂∂
=∇⋅
() /// xyz
AAA123
∂ ∂
∂ − ∂
∂
⎛
⎝⎜
⎞
⎠⎟ + ∂
∂ − ∂
∂
⎛
⎝⎜
⎞
⎠⎟ + ∂
∂
A
y
A
z
A
z
A
x
A32 13 2 ij x x
A
y
x
A
y
A
z
− ∂
∂
⎛
⎝⎜
⎞
⎠⎟
⎡
⎣
⎢
= ∂
∂
∂
∂ − ∂
∂
⎛
⎝⎜
⎞
⎠⎟ +
1
32
k
∂ ∂
∂
∂
∂ − ∂
∂
⎛
⎝⎜
⎞
⎠⎟ + ∂
∂
∂
∂ − ∂
∂
⎛
⎝⎜
=
y
A
z
A
xz
A
x
A
y
13 21
∂ ∂
∂∂ − ∂
∂∂ + ∂
∂∂ − ∂
∂∂ + ∂
∂
2
3
2
2
2
1
2
3
2
2A
xy
A
xz
A
yz
A
yx
A
z ∂ ∂− ∂
∂∂
=
x
A
zy
2
1
0
assuming that A has continuous second partial derivatives so that the order of differentiation is immaterial.
Jacobians and curvilinear coordinates
7.40. Find ds2 in (a) cylindrical and (b) spherical coordinates and determine the scale factors.
(a) Method 1:
x = ρ cos φ, y = ρ sin φ, = z
dx = – ρ sin φdφ + cos φdφρ,   dy = ρ cos φdφ + sin φdρ,   dz = dz
Then
22 2 2 2 2 2
22 2 22 2 2 2 22
12 3
(s i n c o s )( c o s s i n )( )
() ( ) ( ) () ( ) ( )
ds dx dy dz d d d d dz
d d d z hd hd dd z
ρφ φ φ ρ ρ φ φ φ ρ
ρρ φ ρ φ
=++= − + + + +
=+ += + +
and h1 = hρ = 1, h2 = hφ = ρ, h3 = hz = 1 are the scale factors.
Method 2: The position vector is r = ρ cos φi + ρ sin φj + zk. Then
dd d z dz
d
r rr r
ij
= ∂
∂ + ∂
∂ + ∂
∂
=+ + −
ρ ρ φ φ
φφ ρ ρ(cos sin ) ( s sin cos )
(cos sin ) sin
φρ φ φ
φρ ρ φφ
ij k
i+(
++
=−
dd z
dd φφρ ρ φφdd d z++ cos ) jk
Thus, ds2 = dr · dr = (cos φdρ – ρ sin φdφ) 2 + (sin φdρ + ρ cos φdφ) 2 + (dz)2
 = (d ρ)2 + ρ2 (d φ)2 + (dz)2
(b) x = r sin θ cos φ, y = r sin θ sin φ, z = r cos θ
Then
dx = –r sin θ sin φdφ + r cos θ cos φdθ + sin θ cos φdr
 dy = r sin θ cos φdφ + r cos θ sin φdθ + sin θ sin φdr
 dz = –r sin θdφ + cos θdr
and
(ds)2 = (dx)2 + (dy)2 + (dz)2 = (dr)2 + r2 (dθ)2 + r2 sin2 θ (dφ)2
The scale factors are h1 = hr = 1, h2 = hθ = r, h3 = hφ = r sin θ.


## Page 197

CHAPTER 7  Vectors186
7.41. Find the volume element dV in (a) cylindrical and (b) spherical coordinates and sketch.
The volume element in orthogonal curvilinear coordinates u1, u2, u3 is
dV = h1h2h3 du1du2du3
123
(, , )
(, , )
xyz
uuu
∂= ∂
du1du2du3
(a) In cylindrical coordinates, u 1 = ρ, u2 = φ, u3 = z, h1 = 1, h2 = ρ, h3 = 1 [see Problem 7.40(a)]. Then
dV = (1)(ρ)(1)dρdφdz = ρdρdφdz
This can also be observed directly from Figure 7.30(a).
(b) In spherical coordinates, u 1 = r, u2 = θ, u3 = φ, h1 = 1, h2 = r, h3 = r sin θ [see Problem 7.40(b)]. Then
dV = (1)(r) (r sin θ) drdθdφ = r2 sin θdrdθd φ
This can also be observed directly from Figure 7.30(b).
Figure 7.30
7.42. Express in cylindrical coordinates: (a) grad Φ, (b) div A, and (c) ∇ 2 Φ.
Let u1 = ρ, u2 = φ, u3 = z, h1 = 1, h2 = ρ, h3 = 1 [see Problem 7.40(a) and (b).] Then
(a) 1grad 1 ρ
∂ΦΦ=∇ Φ= ∂ e1
1
ρφ
∂Φ+ ∂ e2
1
1 z
∂Φ+ ∂ e3
ρ
∂Φ= ∂ e1
1
ρφ
∂Φ+ ∂ e2
z
∂Φ+ ∂ e3
where e1, e2, e3 are the unit vectors in the directions of increasing ρ, φ, z, respectively.
(b) div A =∇⋅ A 12 3
1 (( )(1) ) ((1)(1) ) ((1)( ) )(1)( )(1) AA A zρρρρ φ
⎡⎤∂∂ ∂=+ + ⎢⎥∂∂ ∂⎣⎦
32
1
1 () AAA zρρρ φ
∂∂⎡⎤∂=+ +⎢⎥∂∂ ∂⎣⎦
where A = A1e1 + A2e2 + A3e3.
(c) 2
22
22 2
1 ( )(1) (1)(1) (1)( )
(1)( )(1) (1) ( ) (1)
11
zz
z
ρφ ρ
ρρ ρ φ ρ φ
ρρρ ρ ρφ
⎡⎤ ⎛⎞ ⎛ ⎞∂∂ ∂ ∂ Φ ∂ ∂ Φ ⎛⎞∇ Φ= + +⎢⎥ ⎜⎟ ⎜ ⎟ ⎜⎟∂∂ ∂ ∂ ∂∂ ⎝⎠⎝⎠ ⎝ ⎠⎣⎦
⎛⎞∂∂ Φ ∂ Φ ∂ Φ=+ + ⎜⎟∂∂ ∂∂⎝⎠


## Page 198

CHAPTER 7  Vectors 187
Miscellaneous problems
7.43. Prove that grad f (r) = ()fr
r
′ r, where r = 222xyz++  and f ′(r) = df is df/dr is assumed to exist.
g r a d () () () () ()
() () ()
() ()=( ) ( ) ( ) ( )
fr fr fr fr fr xyz
rrrfr fr frxyz
xyz f r f rfr fr fr x y zrrr r r
∂∂∂=∇ = + + ∂∂∂
∂∂∂′′′=++ ∂∂∂
′′′′′ ++ = + + =
ij k
ijk
ij k i j k r
Another method: In orthogonal curvilinear coordinates u 1, u2, u3, we have
123
11 2 2 33
11 1
hu hu hu
∂Φ ∂Φ ∂Φ∇Φ = + + ∂∂ ∂eee  (1)
If, in particular, we use spherical coordinates, we have u1 = r, u2 = θ, u3 = φ. Then letting Φ = f (r), a func-
tion of r alone, the last two terms on the right of Equation (1) are zero. Hence, on observing that e 1 = r/r and
h1, = 1, we have, the result
1( ) ( )() 1
fr f rfr rr r
′∂∇= = ∂
r r  (2)
7.44. (a) Find the Laplacian of φ = f (r). (b) Prove that φ = 1/r is a solution of Laplace’s equation ∇2 φ = 0.
(a) By Problem 7.43,
()() frfr rφ ′∇= ∇ = r
By Problem 7.35, assuming that f(r) has continuous second partial derivatives, we have
2
2
3
()Laplacian of ( )
() () 1 () ()+( ) +( 3 )
() () 3 () 2 () ()
fr
r
fr fr d fr fr
rr r d r r r
rf r f r f r rf r f r rrr
φφ φ ′⎧⎫=∇ =∇⋅ ∇ =∇⋅ ⎨⎬⎩⎭
′′ ′ ′⎧⎫ ⎧⎫=∇ ⋅ ∇ ⋅ = ⋅⎨⎬ ⎨⎬⎩⎭ ⎩⎭
′′ ′ ′+ ′′ ′=+ = +
r
rr r r
Another method: In spherical coordinates, we have
2
22
22 2 2 2
11 1 sinsin sin
UU UUr rrrr r
θθθθθ φ
∂∂ ∂ ∂ ∂⎛⎞ ⎛ ⎞∇= + +⎜⎟ ⎜ ⎟∂∂ ∂ ∂ ∂⎝⎠ ⎝ ⎠
If U = f(r), the last two terms on the right are zero and we find
22
2
12() ( () ) () ()dfr rf r f r f rdr rr
′′ ′ ′∇= = +
(b) From the result in (a), we have
2
2
23 3
11 2 1 2 2 0dd
rr r d r rdr r r
⎛⎞ ⎛⎞ ⎛⎞∇= + = − =⎜⎟ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠ ⎝⎠
showing that 1/r is a solution of Laplace’s equation.


## Page 199

CHAPTER 7  Vectors188
7.45. A particle moves along a space curve r = r(t), where t is the time measured from some initial time. If
υ = ⏐dr/dt⏐ = ds/dt is the magnitude of the velocity of the particle (s is the arc length along the space curve
measured from the initial position), prove that the acceleration a of the particle is given by
2dv v
dt ρ=+aT N
where T and N are unit tangent and normal vectors to the space curve and
1/212 2 222 2 2
22 2 2
dd x d y d z
ds ds ds dsρ
−− ⎧⎫⎛⎞ ⎛⎞ ⎛⎞⎪⎪== + + ⎨⎬⎜⎟ ⎜⎟ ⎜⎟
⎝⎠ ⎝⎠ ⎝⎠⎪⎪⎩⎭
r
The velocity of the particle is given by v = υT. Then the acceleration is given by
2()d d dv d d d ds d d
dt dt dt dt dt ds dt dt ds
υυυυ υ υ= = = +=+ =+vT T TaT TT T  (1)
Since T has a unit magnitude, we have T · T = 1. Then, differentiating with respect to s,
0, 2 0 or 0dd d d
ds ds ds ds⋅+⋅ = ⋅= ⋅=TT T TTT T T
from which it follows that dT/ds is perpendicular to T. Denoting by N the unit vector in the direction of dT/
ds, and called the principal normal to the space curve, we have
d
ds κ =T N  (2)
where k is the magnitude of dT/ds. Now, since T = d/r/ds [see Equation (7), Page 168], we have dT/ds = d2r/
ds2. Hence,
κ == ⎛
⎝⎜
⎞
⎠⎟ + ⎛
⎝⎜
⎞
⎠⎟ +d
ds
dx
ds
dy
ds
d z
ds
2
2
2
2
2 2
2
2 2
2
r ⎛ ⎛
⎝⎜
⎧
⎨⎪
⎩⎪
Defining ρ = 1/k, Equation (2) becomes dT/ds = N/ρ. Thus, from Equation (1) we have, as required,
2d
dt
υυ
ρ=+aT N
The components dυ/dt and υ2/ρ in the direction of T and N are called the tangential and normal compo-
nents of the acceleration, the latter being sometimes called the centripetal acceleration. The quantities ρ and
k are, respectively, the radius of curvature and curvature of the space curve.
SUPPLEMENTARY PROBLEMS
Vector algebra
7.46. Given any two vectors A and B, illustrate geometrically the equality 4A + 3(B – A) = A + 3B.
7.47. A man travels 25 miles northeast, 15 miles due east, and 10 miles due south. By using an appropriate scale,
determine graphically (a) how far and (b) in what direction he is from his starting position. Is it possible to
determine the answer analytically?
Ans. 33.6 miles, 13.2º north of east
7.48. If A and B are any two nonzero vectors which do not have the same direction, prove that mA + nB is a
vector lying in the plane determined by A and B.


## Page 200

CHAPTER 7  Vectors 189
7.49. If A, B, and C are non-coplanar vectors (vectors which do not all lie in the same plane) and x1A + y1B + z1
C = x2 A + y2B + z2C, prove that, necessarily, x1 = x2, y1 = y2, z1 = z2.
7.50. Let ABCD be any quadrilateral and points P, Q, R, and S the midpoints of successive sides. Prove that (a) PQRS is
a parallelogram and (b) the perimeter of PQRS is equal to the sum of the lengths of the diagonals of ABCD.
7.51. Prove that the medians of a triangle intersect at a point which is a trisection point of each median.
7.52. Find a unit vector in the direction of the resultant of vectors A = 2i – j + k, B = i + j + 2k, C = 3i – 2j + 4k.
Ans. (6i – 2j + 7k)/ 89
The dot or scalar product
7.53. Evaluate ⏐(A + B) · (A – B)⏐ if A = 2i – 3j + 5k and B = 3i + j – 2k.
Ans. 24
7.54. Verify the consistency of the law of cosines for a triangle. [Hint: Take the sides of A, B, C where C = A – B.
Then use C · C = (A – B) · (A – B).]
7.55. Find a so that 2i – 3j + 5k and 3i + aj – 2k are perpendicular.
Ans. a = –4/3
7.56. If A = 2i + j + k, B = i – 2j + 2k and C = 3i – 4j + 2k, find the projection of A + C in the direction of B.
Ans
. 17/3
7.57. A triangle has vertices at A(2, 3, 1), B (–1, 1, 2), and C(1, –2, 3). Find (a) the length of the median drawn
from B to side AC and (b) the acute angle which this median makes with side BC.
Ans. (a) 1 262
 (b) cos–1 91 /14
7.58. Prove that the diagonals of a rhombus are perpendicular to each other.
7.59. Prove that the vector (AB + BA)/(A + B) represents the bisector of the angle between A and B.
The cross or vector product
7.60. If A = 2i – j + k and B = i + 2j – 3k, find ⏐(2A + B) × (A – 2B)⏐.
Ans. 5 3
7.61. Find a unit vector perpendicular to the plane of the vectors A = 3i – 2j + 4k and B = i + j – 2k.
Ans. ±(2j + k)/ 5


## Page 201

CHAPTER 7  Vectors190
7.62. If A × B = A × C, does B = C necessarily?
7.63. Find the area of the triangle with vertices (2, –3, 1), (1, –1, 2), (–1, 2, 3).
Ans. 1 32
7.64 Find the shortest distance from the point (3, 2, 1) to the plane determine by (1, 1, 0), (3, –1, 1), (–1, 0, 2).
Ans. 2
Triple products
7.65. If A = 2i + j – 3k, B = i – 2j + k, C = –i + j – 4, find (a) A · (B × C), (b) C · (A × B), (c) A × (B × C), and
(d) (A × B) × C.
Ans. (a) 20 (b) 20 (c) 8i – 19j – k (d) 25i – 15j – 10k
7.66. Prove that (a) A · (B × C) = B · (C × A) = C · (A × B) and (b) A × (B × C) = B (A · C) – C(A · B).
7.67. Find an equation for the plane passing through (2, –1, –2), (–1, 2, –3), (4, 1, 0).
Ans. 2x + y – 3z = 9
7.68. Find the v
olume of the tetrahedron with vertices at (2, 1, 1), (1, –1, 2), (0, 1, –1), (1, –2, 1).
Ans. 4
3
7.69. Prove that (A × B) · (C × D) + (B × C) · (A × D) + (C × A) · (B × D) = 0.
Derivatives
7.70 A particle moves along the space curve r = e –t cos ti + e–t sin tj + e–t k. Find the magnitude of the (a) the
velocity and (b) the acceleration at any time t.
Ans. (a) 13e−  (b) 15e−
7.71. Prove that d
du A d
du
d
du()AB BA B×= × + ×  where A and B are differentiable functions of u.
7.72. Find a unit vector tangent to the space curve x = t, y = t2 z = t3 at the point where t = 1.
Ans. (i + 2j + 3k)/ 14
7.73. If r = acos ωt + b sin ωt, where a and b are any constant noncollinear vectors and ω is a constant scalar.
prove that (a) d
drr r=  = (a b)×ω and (b) .d r r2 +=ω
2
2 0dt
7.74. If A = x2i – yj + xzk, B = yi + xj – xyzk, and C = i – yj + x3 zk, find (a)
2
xy
∂
∂∂ (A + B) and
(b) d[ A · (B × C)] at the point (1, –1, 2).
Ans. (a) –4i + 8j (b) 8 dx


## Page 202

CHAPTER 7  Vectors 191
7.75. If R ij + k,f i n d BR2=− ∂
∂ × ∂
∂xy yz z xy
22 2
2
2
2
22 xy  at the point (2, 1, 2).−
.16 5Ans
Gradient, divergence, and curl
7.76. If U, V, A, B have continuous partial derivatives, prove that (a) ∇(U + V) = ∇ U + ∇ V, (b) ∇ · (A + B)
= ∇ · A + ∇ · B and (c) ∇ × (A + B) = ∇ × A + ∇ × B.
7.77. If φ = xy + yz + zx and A = x2 yi + y2 zj + z2 xk, find (a) A · ∇φ, (b) φ∇ · A, and (c) (∇φ) × A at the point
(3, –1, 2).
Ans. (a) 25, (b) 2, (c) 56i – 30j + 47k
7.78. Show that ∇ × (r 2r) = 0 where r = xi + yj + zk and r = ⏐r⏐.
7.79. Prove that (a) ∇ × (UA) = (∇U) × A + U(∇ × A) and (b) ∇ · (A × B) = B · (∇ × A) – A · (∇ × B).
7.80. Prove that curl grad u = 0, stating appropriate conditions on U.
7.81. Find a unit normal to the surface x 2 y – 2xz + 2y2z4 = 10 at the point (2, 1, –1).
Ans. ±(3i + 4j – 6k) 61
7.82. If A = 3xz2i – yzj + (x + 2z)k, find curl A.
Ans. –6xi + (6z – 1)k
7.83. (a) Prove that ∇ × (∇ × A) = – ∇ 2 A + ∇(∇ · A). (b) Verify the result in (a) if A is given as in problem 7.82.
Jacobians and curvilinear coordinates
7.84.
12 , 3 1 2 3
(, , ) r r rProve that .(, )
xy z
uuu u u u
∂∂ ∂ ∂ =⋅×∂∂ ∂ ∂
7.85. Express (a) grad Φ, (b) div A, and (c) ∇ 2 Φ in spherical coordinates.
Ans. (a) 12 3
11ee e sinrr r θθ φ
∂Φ ∂Φ ∂Φ++∂∂ ∂
  (b)
3
2
122
11 1 ( ) (sin ) wheresin sin
ArA Arr rr
θθθ θ φ
∂∂ ∂ ++∂∂ ∂
 A 11 2 2 33=e e eAA A++
  (c)
2
2
22 2 2 2
11 1() s i n
sin sin
cr rrrr r
θ θθθθθ φ
∂∂ Φ ∂ Φ ∂ Φ⎛⎞ ⎛ ⎞ ++⎜⎟ ⎜ ⎟∂∂ ∂ ∂ ∂⎝⎠ ⎝ ⎠


## Page 203

CHAPTER 7  Vectors192
7.86. The transformation from rectangular to parabolic cylindrical coordinates is defined by the equations x = 1/2
(u2 – υ2), y = u υ, z = z. (a) Prove that the system is orthogonal. (b) Find ds2 and the scale factors. (c) Find
the Jacobian of the transformation and the volume element.
Ans. (b) ds 2 = (u2 + υ2)du2 + (u)2 + υ2)d υ2 + dz2, h1 = h2 = 2u υ 2+ , h3 = 1
  (c) u2 + υ2, (u2 + υ2) du dυ dz
7.87. Write (a) ∇ 2 Φ and (b) div A in parabolic cylindrical coordinates.
Ans. (a)
22 2
2
22 2 2 2
1
uu z υυ
⎛⎞∂Φ ∂Φ ∂Φ∇Φ= + +⎜⎟+∂∂ ∂⎝⎠
 (b) div A
322 22
1222
1=( ) ( )
A
uA uAuzu υυ υυ
∂∂∂⎧⎫ ++ + +⎨⎬∂∂ ∂+ ⎩⎭
7.88. Prove that for orthogonal curvilinear coordinates,
312
11 2 2 33
eee
hu hu hu
∂Φ ∂Φ ∂Φ∇Φ = + + ∂∂ ∂
(Hint: Let ∇Φ  = a1e1 + a2e2 + a3e3 and use the fact that d Φ = ∇Φ  · d r must be the same in both rectangular
and curvilinear coordinates.)
7.89. Give a vector interpretation to the theorem in Problem 6.35.
Miscellaneous problems
7.90. If A is a differentiable function of u and ⏐A(u)⏐ = 1, prove that dA/du is perpendicular to A.
7.91. Prove formulas 6, 7, and 8 on Page 171.
7.92. If ρ and φ are polar coordinates and A, B, n are any constants, prove that U = ρn (A cos nφ + B sin n φ)
satisfies Laplace’s equation.
7.93.
3
2
2
2 cos 3sin cosIf , find .VV
r
θθ φ+=∇
2
4
6sin cos (4 5sin ).Ans
r
θφ θ −
7.94. Find the most general function of (a) the cylindrical coordinate ρ, (b) the spherical coordinate r, and (c) the
spherical coordinate θ which satisfies Laplace’s equation.
Ans. (a) A + B ln ρ (b) A + B/r (c) A + B ln(cscθ – cotθ) where A and B are any constants
7.95. Let T and N denote, respectively, the unit tangent vector and unit principal normal vector to a space curve r
= r(u), where r(u) is assumed differentiable. Define a vector B = T = T × N called the unit binormal vector
to the space curve. Prove that
d
ds
d
ds
d
ds
T N, B N, N BT== − = −κτ τ κ


## Page 204

CHAPTER 7  Vectors 193
These are called the Frenet-Serret formulas and are of fundamental importance in differential geometry. In
these formulas k is called the curvature, τ is called the torsion; and the reciprocals of these, ρ = 1/k and σ =
1/τ, are called the radius of curvature and radius of torsion, respectively.
7.96. (a) Prove that the radius of curvature at any point of the plane curve y = f (x), z = 0 where f(x) is
differentiable, is given by
23 / 2(1 ) y
yρ ′+= ′′
(b) Find the radius of curvature at the point (π/2, 1, 0) of the curve y = sin x, z = 0.
Ans. (b) 22
7.97. Prove that the acceleration of a particle along a space curve is given respectively in (a) cylindrical and (b)
spherical coordinates by
(ρ¨  – ρφ˙ 2
)eρ + (ρφ¨  + 2ρ˙ φ˙ )eφ + ¨ zez
(¨ r – rθ˙ 2
 – rφ˙ 2
r
2sin ) (θ+e rθ¨ + 2r˙θ¨ – rφ˙ 2
sin θ cos θ)eθ + (2r˙φ˙  sin θ + 2rθ˙ φ˙ cos θ + rφ¨ sin θ )eφ
where dots denote time derivatives and eρ, eφ, ez, er, eθ, eφ are unit vectors in the directions of increasing ρ, φ,
z, r, θ, φ, respectively.
7.98. Let E and H be two vectors assumed to have continuous partial derivatives (of second order at least) with
respect to position and time. Suppose further that E and H satisfy the equations
∇⋅ ∇⋅ ∇× − ∂
∂ ∇× ∂
∂E =0 , H =0 , E = H , H = E ,11
ct ct
 (1)
prove that E and H satisfy the equation
2
2
22
1= ct
ψψ ∂∇ ∂
 (2)
where ψ is a generic meaning and, in particular, can represent any component of E or H.
[The vectors E and H are called electric and magnetic field vectors in electromagnetic theory. Equations
(1) are a special case of Maxwell’s equations. The result (2) led Maxwell to the conclusion that light was an
electromagnetic phenomena. The constant c is the velocity of light.]
7.99. Use the relations in Problem 7.98 to show that
221{( ) }2 EH ct
∂ ++ ∇ ⋅∂ (E × H) =0
7.100. Let A1, A2, A3 be the components of vector A in an xyz rectangular coordinate system with unit vectors i1, i2,
i3 (the usual i, j, k vectors), and A′1, A′2, A′3 the components of A in an x′y′z′ rectangular coordinate system
which has the same origin as the xyz system but is rotated with respect to it and has the unit vectors i′1, i′2, i′3.
Prove that the following relations (often called invariance relations) must hold:
An = l1nA′1 + l2nA′2 + l3nA′3 n = 1, 2, 3
where i′m · in = lmn.


## Page 205

CHAPTER 7  Vectors194
7.101. If A is the vector of Problem 7.100, prove that the divergence of A (∇ · A) is an invariant (often called a
scalar invariant); i.e., prove that
3312 12 AAAA AA
xyzxyz
′′′ ∂∂∂∂ ∂∂++=++′′′∂∂∂∂∂∂
The results of this and the preceding problem express an obvious requirement that physical quantities must not
depend on coordinate systems in which they are observed. Such ideas when generalized lead to an important
subject called tensor analysis, which is basic to the theory of relativity.
7.102. Prove that (a) A · B, (b) A × B, and (c) ∇ × A are invariant under the transformation of Problem 7.100.
7.103. If u
1, u2, u3 are orthogonal curvilinear coordinates, prove that
(a) 123
12 3
(, , )
(, , )
uuu uu uxyz
∂ =∇ ⋅∇ ×∇∂
(b) u
∂
∂ ⋅
1
r ∂ ∂
∂ × ∂
∂
⎛
⎝
⎜
⎞
⎠
⎟ ∇⋅ ∇× ∇ =rr
uu uu u
23
12 3 1()
and give the significance of these in terms of Jacobians.
7.104. Use the axiomatic approach to vectors to prove relation 8 on Page 167.
7.105. A set of n vectors A
1, A2, . . ., An is called linearly dependent if there exists a set of scalars c1, c2, . . ., cn not
all zero such that c1A1 + c2A2 + . . . + cnAn = 0 identically; otherwise, the set is called linearly independent.
(a) Prove that the vectors A1 = 2i – 3j + 5k, A2 = i + j – 2k, A3 = 3i – 7j + 12k are linearly dependent. (b)
Prove that any four three-dimensional vectors are linearly dependent. (c) Prove that a necessary and
sufficient condition that the vectors A1 = a1i + b1j + c1k, A2 = a2i + b2 j + c2k, and A3 = a3i + b3 j + c3k be
linearly independent is that A1 · A2 × A3 /HS11005 0. Give a geometrical interpretation of this.
7.106. A complex number can be defined as an ordered pair (a, b) of real numbers a and b subject to certain rules of
operation for addition and multiplication. (a) What are these rules? (b) How can the rules in (a) be used to
define subtraction and division? (c) Explain why complex numbers can be considered as two-dimensional
vectors. (d) Describe similarities and differences between various operations involving complex numbers
and the vectors considered in this chapter.


## Page 206

195
Applications of Partial
Derivatives
Applications to Geometry
The theoretical study of curves and surfaces began more than two thousand years ago when Greek philoso-
pher-mathematicians explored the properties of conic sections, helixes, spirals, and surfaces of revolution
generated from them. While applications were not on their minds, many practical consequences evolved.
These included representation of the elliptical paths of planets about the sun, employment of the focal prop-
erties of paraboloids, and use of the special properties of helixes to construct the double helical model of
DNA.
The analytic tool for studying functions of more than one variable is the partial derivative. Surfaces are
a geometric starting point, since they are represented by functions of two independent variables. Vector forms
of many of these concepts were introduced in Chapter 7. In this chapter, corresponding coordinate equations
are exhibited.
Figure 8.1
1. Tangent Plane to a Surface Let F(x, y, z) = 0 be the equation of a surface S such as that shown in Figure
8.1. Assume that F, and all other functions in this chapter are continuously differentiable unless otherwise
indicated. Suppose we wish to find the equation of a tangent plane to S at the point P(x 0, y0, z0). A vector
normal to S at this point is N 0 = ∇F⏐ P, the subscript P indicating that the gradient is to be evaluated at the
point P(x0, y0, z0).
CHAPTER 8


## Page 207

CHAPTER 8  Applications of Partial Derivatives196
If r0 and r are tangent, the vectors drawn, respectively, from O to P(x0, y0, z0) and Q(x, y, z) on the tangent
plane, the equation of the plane is
 ( r – r0) · N0 = (r – r0) · ∇F⏐ P = 0 (1)
since r – r0 is perpendicular to N0.
In rectangular form this is
00 0() () ( ) 0
PP P
FFF xx yy zzxyz
∂∂∂ −+ −+ −=∂∂∂
(2)
In case the equation of the surface is given in orthogonal curvilinear coordinates in the form F(u1, u2, u3)
= 0, the equation of the tangent plane can be obtained using the result on Page 172 for the gradient in these
coordinates. See Problem 8.4.
2. Normal Line to a Surface. Suppose we require equations for the normal line to the surface S at P(x 0,
y0, z0), i.e., the line perpendicular to the tangent plane of the surface at P. If we now let r be the vector drawn
from O in Figure 8.1 to any point (x, y, z) on the normal N0, we see that r – r 0 is collinear with N0, and so
the required condition is
 ( r – r0 × N0 = (r – r0) × × ∇F⏐ P = 0 (3)
By expressing the cross product in the determinant form
00 0
|||xP yP zP
ij k
xx yy zz
FFF
−−−
we find that
00 0
PP P
xx yy zz
FF F
xz y
−−− ==∂∂ ∂
∂∂ ∂
 (4)
Setting each of these ratios equal to a parameter (such as t or u ) and solving for x , y, and z  yields the
parametric equations of the normal line.
The equations for the normal line can also be written when the equation of the surface is expressed in
orthogonal curvilinear coordinates. [See Problem 8.1(b).]
3. Tangent Line to a Curve Let the parametric equations of curve C of Figure 8.2 be x = f (u), y = g(u),
z = h(u), where we shall suppose, unless otherwise indicated, that f,g, and h are continuously differentiable.
We wish to find equations for the tangent line to C at the point P(x
0, y0, z0) where u = u0.
Fig. 8.2
Fx|P Fy|P Fz|P


## Page 208

CHAPTER 8  Applications of Partial Derivatives 197
If R = f (u)i + g(u)j + h(u)k, then a vector tangent to C at the point P is given by 0 .
P
d
du= RT  If r0 and r
denote the vectors drawn respectively from O to P(x0, y0, z0) and Q(x, y, z) on the tangent line, then r – r0 is
collinear with T0. Thus,
P
d
du00 0() () 0−×= −× = Rrr T rr  (5)
In rectangular form this becomes
xx yy zz
fu g u h u
00 0
000() () ()
−−− ==′′′  (6)
The parametric form is obtained by setting each ratio equal to u.
If the curve C is given as the intersection of two surfaces with equations F (x, y, z) = 0 and G(x, y, z) = 0,
observe that ∇F × ∇G has the direction of the line of intersection of the tangent planes; therefore, the cor-
responding equations of the tangent line are
yz xyzx
zxyz xyPPP
xx yy zz
FF FFFF
GGGG GG
000−−− ==  (7)
Note that the determinants in Equation (7) are Jacobians. A similar result can be found when the surfaces are
given in terms of orthogonal curvilinear coordinates.
4. Normal Plane to a Curve Suppose we wish to find an equation for the normal plane to curve C at P(x
0,
y0, z0) in Figure 8.2 (i.e., the plane perpendicular to the tangent line to C at this point). Letting r be the vector
from O to any point (x, y, z) on this plane, it follows that r – r 0 is perpendicular to T 0. Then the required
equation is
P
d
du00 0() .() . 0−= − = Rrr T rr  (8)
When the curve has parametric equations x = f (u), y = g(u), z = h(u) this becomes
 f ′(u0)(x – x0) + g′ (u0)(y – y0) + h′(u0)(z – z0) = 0 (9)
Furthermore, when the curve is the intersection of the implicitly defined surfaces
F(x, y, z) = 0 and G(x, y, z) = 0
then
yz xyzx
zxyz xyP
FF FFFFxx yy zzGGGG GG00 0
PP
() () ( ) 0−+ −+ −=  (10)
5. Envelopes Solutions of differential equations in two variables are geometrically represented by one-
parameter families of curves. Sometimes such a family characterizes a curve called an envelope.
For example, the family of all lines (see Problem 8.9) one unit from the origin may be represented by x
sin α – y cos α – 1 = 0, where α is a parameter. The envelope of this family is the circle x 2 + y2 = 1.
If φ(x, y, z) = 0, is a one-parameter family of curves in the xy plane, there may be a curve E which is tan-
gent at each point to some member of the family and such that each member of the family is tangent to E. If
E exists, its equation can be found by solving simultaneously the equations
 φ (x, y, α) = 0, φ( α (x, y, α) = 0 (11)
and E is called the envelope of the family.
The result can be extended to determine the envelope of a one-parameter family of surfaces φ(x, y, z, α).
This envelope can be found from
 φ (x, y, z, α) = 0, φ α (x , y, z, α) = 0 (12)
Extensions to two- (or more) parameter families can be made.


## Page 209

CHAPTER 8  Applications of Partial Derivatives198
Directional Derivatives
Suppose F(x, y, z) is defined at a point (x,y, z) on a given space curve C. Let F(x + Δx,y + Δy, z + Δz) be the
value of the function at a neighboring point on C and let Δs denote the length of arc of the curve between
those points. Then
ss
FF x x y y z z F x y z
ss00
(, , ) ( , , )lim lim
Δ→ Δ→
Δ+ Δ + Δ + Δ −=ΔΔ
 (13)
if it exists, is called the directional derivative of F at the point (x, y, z) along the curve C and is given by
dF
ds
F
x
dx
ds
F
y
dy
ds
F
z
dz
ds= ∂
∂ + ∂
∂ + ∂
∂  (14)
In vector form this can be written
dF
ds
F
x i F
y j F
z k dx
ds i dy
ds j dz= ∂
∂ + ∂
∂ + ∂
∂
⎛
⎝⎜
⎞
⎠
⎟ ++.
ds k F dr
ds FT⎛
⎝⎜ ⎞
⎠⎟ == ΔΔ..  (15)
from which it follows that the directional derivative is given by the component of ∇F in the direction of the
tangent to C.
Thus, the maximum value of the directional derivative is given by ⏐∇F⏐and these maxima occur in direc-
tions normal to the surfaces F(x, y, z) = c is (where c is any constant), which are sometimes called equipo-
tential surfaces or level surfaces.
Differentiation Under the Integral Sign
Let
u
u
fx d x a b
2
1
() ( , )φα α α=≤ ≤∫  (16)
where u1 and u2 may depend on the parameter α. Then
u
u
du dudf d x fu fudd d
1
2
21
21(,) (,)φ αααα α α
∂=+ − ∂∫  (17)
for a < α < b, if f(x, α) and ∂f /∂α are continuous in both x and α in some region of the xα plane including
u1 < x < u2, a < α < b and if u1 and u2 are continuous and have continuous derivatives for a < α < b.
In case u1 and u2 are constants, the last two terms of Equation (17) are zero.
The result (17), called Leibniz’s rule, is often useful in evaluating definite integrals (see Problems 8.15
and 8.29).
Integration Under the Integral Sign
If φ(α) is defined by Equation (16) and f (x, α) is continuous in x and α in a region including u 1 < x < u2, a
< x < b, then if u1 and u2 are constants,
uubb b
aa u u a
df x d x d f x d d x
22
11
() ( ,) ( ,)φα α α α α α
⎧⎫ ⎧⎫⎪⎪ ⎪⎪== ⎨⎬ ⎨⎬
⎪⎪ ⎪⎪ ⎩⎭⎩⎭
∫∫ ∫ ∫ ∫  (18)
The result is known as interchange of the order of integration or integration under the integral sign. (See
Problem 8.18.)
. . .∇ F ∇ F T


## Page 210

CHAPTER 8  Applications of Partial Derivatives 199
Maxima and Minima
In Chapter 4 we briefly examined relative extrema for functions of one variable. The general idea was that
for points of the graph of y = g(x) that were locally highest or lowest, the condition g´(x) = 0 was necessary.
Such points P0(x0) were called critical points. [See Figure 8.5(a and b).] The condition g´(x) = 0 was useful
in searching for relative maxima and minima, but it was not decisive. [See Figure 8.3(c).]
Figure 8.3
                        Figure 8.4
To determine the exact nature of the function at a critical point, P0, g″(x0) ) had to be examined.
                                                       > 0                       counterclockwise rotation (relative minimum)
                                             g″(x0) < 0       implied     a clockwise rotation (relative maximum)
                                                       = 0                        need for further investigation
This section describes the n  ecessary and sufficient conditions for relative extrema of functions of two
variables. Geometrically, we think of surfaces S represented by z = f (x, y). If at a point P 0(x0, y0) then fx(x,
y0) = 0, means that the curve of intersection of S and the plane y = y 0 has a tangent parallel to the x axis.
Similarly, fy(x0, y0) = 0 indicates that the curve of intersection of S and the cross section x = x0 has a tangent
parallel the y axis. (See Problem 8.20.)
Thus,
fx(x, y0) = 0, fy(x0, y) = 0
are necessary conditions for a relative extrema of z = f (x, y) at P0; however, they are not sufficient because
there are directions associated with a rotation through 360º that have not been examined. Of course, no dif-
ferentiation between relative maxima and relative minima has been made. (See Figure 8.4.)
A very special form fxy – fx fy, invariant under plane rotation and capable of characterizing the roots of a
quadratic equation Ax 2 + 2Bx + C  = 0, allows us to form sufficient conditions for relative extrema. (See
Problem 8.21.)
A point (x0, y0) is called a relative maximum point or relative minimum point of f(x, y) respectively accord-
ing as f (x0 + h, y0 + k) < f (x0, y0) or f (x0 + h, y0 + k) > f (x0, y0) for all h and k such that 0 < ⏐h⏐ < δ, 0 < ⏐k⏐
< δ where δ is a sufficiently small positive number.
A necessary condition that a differentiable function f (x, y) have a relative maximum or minimum is
ff
xy 0, 0∂∂ ==∂∂
 (19)
If (x0, y0) is a point (called a critical point) satisfying Equations (19) and if Δ is defined by
xy
ff f
xyxy
00
222 2
22
(,)
⎧⎫⎛⎞ ⎛⎞ ⎛ ⎞∂∂ ∂⎪⎪Δ= −⎜⎟ ⎜⎟ ⎜ ⎟⎨⎬⎜⎟ ⎜⎟ ⎜ ⎟ ∂∂∂∂⎪⎪⎝⎠ ⎝⎠ ⎝ ⎠⎩⎭
 (20)
then


## Page 211

CHAPTER 8  Applications of Partial Derivatives200
1. (x 0, y0) is a relative maximum point if Δ > 0 and
xy x y
ff
xy
00 0 0
22
22
(, ) (,)
0o r 0
⎛⎞∂∂ ⎜⎟<< ⎜⎟∂∂ ⎝⎠
.
2. (x 0, y0) is a relative minimum point of Δ > 0 and
xy xy
ff
xy
00 00
22
22
(, ) (, )
0o r 0
⎛⎞∂∂ ⎜⎟>> ⎜⎟∂∂ ⎝⎠
.
3. (x 0, y0) is neither a relative maximum nor a relative minimum point if Δ < 0. If Δ < 0, < 0, (x 0, y0) is
sometimes called a saddle point.
4. No information is obtained if Δ = 0 (in such case further investigation is necessary).
Method of Lagrange Multipliers for Maxima and Minima
A method for obtaining the relative maximum or minimum values of a function F(x, y, z) subject to a con-
straint condition φ(x, y, z) = 0, consists of the formation of the auxiliary function
 G (x, y, z) ≡ F(x, y, z) + λφ(x, y, z) (21)
subject to the conditions
GGG
xyz 0, 0, 0∂∂∂===∂∂∂
 (22)
which are necessary conditions for a relative maximum or minimum. The parameter λ, which is independent
of x, y, z, is called a Lagrange multiplier.
The conditions in Equation (22) are equivalent to ∇G = 0, and, hence, 0 = ∇F + λ∇φ .
Geometrically, this means that ∇ F and ∇φ are parallel. This fact gives rise to the method of Lagrange
multipliers in the following way.
Let the maximum value of F on φ(x, y, z) = 0 be A and suppose it occurs at P0(x0, y0, z0). (A similar argu-
ment can be made for a minimum value of F.) Now consider a family of surfaces F(x, y, z) = C.
The member F(x, y, z) = A passes through P0, while those surface F(x, y, z) = B with B < A do not. (This
choice of a surface, i.e., f(x, y, z) = A, geometrically imposes the condition φ(x, y, z) = 0 on F.) Since at P 0
the condition 0 = ∇F + λ∇φ  tells us that the gradients of F(x, y, z) = A and φ(x, y, z) are parallel, we know
that the surfaces have a common tangent plane at a point that is maximum for F. Thus, ∇G = 0 is a necessary
condition for a relative maximum of F at P0. Of course, the condition is not sufficient. The critical point so
determined may not be unique and it may not produce a relative extremum.
The method can be generalized. If we wish to find the relative maximum or minimum values of a function
F(x1, x2, x3, . . ., xn) subject to the constraint conditions φ(x1, . . ., xn) = 0, φ2(x1, . . ., xn) = 0, . . ., φ k(x1, . . .,
xn) = 0, we form the we form the auxiliary function
 G (x1, x2, . . ., xn) ≡ F + λ1φ1 + λ2φ2 + . . . + λkφk (23)
subject to the (necessary) conditions
n
GG G
xx x12
0, 0, ..........., 0∂∂ ∂== ≡∂∂ ∂
 (24)
where λ1, λ2, . . ., λk, which are independent of x 1, x2, . . ., xn, are the Lagrange multipliers.
Applications to Errors
The theory of differentials can be applied to obtain errors in a function of x, y, z, etc., when the errors in x,
y, z, etc., are known. See Problem 8.28.


## Page 212

CHAPTER 8  Applications of Partial Derivatives 201
SOLVED PROBLEMS
Tangent Plane And Normal Line To A Surface
8.1. Find equations for the (a) tangent plane and (b) normal line to the surface x 2yz + 3y2 = 2xz2 – 8z at the point
(1, 2, –1).
(a) The equation of the surface is F = x 2yz + 3y2 – 2xz2 + 8z = 0. A normal line to the surface at (1, 2, –1) is
N0 = ∇F⏐ (1, 2, –1) = (2xyz – 2z2)i + (x2z + 6y)j + (xy – 4xz + 8)k⏐(1, 2, –1)
                                                                  = –6i + 11j + 14k
Referring to Figure 8.1:
The vector from O to any point (x, y, z) on the tangent plane is r = xi + yj + zk.
The vector from O to the point (1, 2, –1) on the tangent plane is r0 = i + 2j – k.
The vector r – r 0 = (x – 1)i + (y – 2)j + (z + 1)k lies in the tangent plane and is thus perpendicular
to N0.
Then the required equation is
(r – r0) · N0 = 0     i.e.,     {(x – 1)i + (y – 2)j + (z + 1)k} · {–6i + 11j + 14k} = 0
–6(x – 1) + 11(y – 2) + 14(z + 1) = 0 or 6x – 11y – 14z + 2 = 0
(b) Let r = xi + yj + zk be the vector from O to any point (x,y, z) of the normal N0. The vector from O to the
point (1, 2, –1) on the normal is r0 = 2i + 2j – k. The vector r – r0 = (x – 1)i + (y – 2)j + (z + 1)k is col-
linear with N0. Then
rr N i e x y x00() 0 . . 1 2 1 0
61 11 4
−× = − − + =
−
ij k
which is equivalent to the equations
11(x – 1) = –6(y – 2), 14(y – 2) = 11(z + 1), 14(x – 1) = –6(z + 1)
These can be written as
xyz 121
61 11 4
−−+==−
often called the standard form for the equations of a line. By setting each of these ratios equal to the parameter
t, we have
x = 1 – 6t, y = 2 + 11t, z = 14t – 1
called the parametric equations for the line.
8.2. In what point does the normal line of Problem 8.1(b) meet the plane x + 3y – 2z = 10?
Substituting the parametric equations of Problem 8.1(b), we have
1 – 6t + 3(2 + 11t) – 2(14t – 1) = 10 or t = –1
Then x = 1 – 6t = 7, y = 2 + 11t = –9, z = 14t – 1 = –15 and the required point is (7, – 9, –15).
8.3. Show that the surface x 2 – 2yz + y3 = 4 is perpendicular to any member of the family of surfaces x2 + 1 =
(2 – 4a)y2 + az2 at the point of intersection (1, –1, 2).
i.e.,


## Page 213

CHAPTER 8  Applications of Partial Derivatives202
Let the equations of the two surfaces be written in the form
F = x2 – 2yz + y3 – 4 = 0 and G = x2 + 1 – (2 – 4a)y2 – az2 = 0
Then
∇F = 2xi + (3y 2 – 2z)j – 2yk,   ∇G = 2xi – 2(2 – 4a)yj – 2azk
Thus, the normals to the two surfaces at (1, –1, 2) are given by
N1 = 2i – j + 2k, N2 = 2i + 2(2 – 4a)j – 4ak
Since N1 · N2 = (2)(2) – 2(2 – 4a) – (2)(4a) ≡ 0, it it follows that N 1 and N2 are perpendicular for all a,
and so the required result follows.
8.4. The equation of a surface is given in spherical coordinates by F(r, θ, φ) = 0, where we suppose that F is
continuously differentiable. (a) Find an equation for the tangent plane to the surface at the point (r0, θ0, φ0).
(b) Find an equation for the tangent plane to the surface r = 4 cos θ at the point (2 2, π /4, 3π /4). (c) Find
a set of equations for the normal line to the surface in ( ) at the indicated point.
(a) The gradient of Φ in orthogonal curvilinear coordinates is
hu hu hu
hu hu hu
123
11 2 2 33
12 3
11 2 2 33
11 1
11 1where , ,
∂Φ ∂Φ ∂Φ∇Φ = + + ∂∂ ∂
∂∂ ∂== =∂∂ ∂
eee
rr reee
(see Pages 170 and 172).
In spherical coordinates u1 = r, u2 = θ, u3 = φ, h1 = 1, h2 = r, h3 = r sin θ and r = xi + yj + zk = r sin θ cos
φi + r sin θ sin φj + r cos θk.
Then
1
2
3
sin cos sin sin cos
cos cos cos sin sin
sin cos
θθ θ θ θ
θφ θ φ θ
φφ
=++⎧
⎪ =+−⎨
⎪ =− +⎩
ei j k
ei j k
ei j
 (1)
and
FF FF rr r12 3
11ee e sinθθ φ
∂∂ ∂∇= + +∂∂ ∂
 (2)
As on Page 196, the required equation is (r – r0) · ∇F⏐ P = 0.
Now, substituting Equations (1) and (2), we have
PP P
PP
FF F
rr r
FF
rr
0
00 00
00 0
00
0
cos1sin sin cos sin sin
1cos sin
φθφ θφ θθ φ
θθ θ
⎧⎫∂∂ ∂⎪⎪++ +⎨⎬∂∂ ∂⎪⎪⎩⎭
⎧⎫∂∂+−⎨⎬∂∂⎩⎭
j
k
Denoting the expressions in braces by A,B, C, respectively, so that ∇ F⏐p = Ai + Bj + Ck, we see that the
required equation is A(x – x0) + B(y – y0) + C(z – z0) = 0. This can be written in spherical coordinates by using
the transformation equations for x, y, and z in these coordinates.
(b) We have F = r – 4 cos θ = 0. Then ∂F/∂r = 1, ∂F/∂θ = 4 sin θ, ∂F/∂φ = 0.
sin cosφφ +ij
P
P
FFs i n r| θ
⎧∂⎪∇= ⎨ ∂⎪⎩ P P
FFn rr
0
00 00
00 0
sin1cos cos cos sin
φθφ θφ θθ φ
⎫∂∂ ⎪+− ⎬∂∂ ⎪
⎭
i
0sinθ


## Page 214

CHAPTER 8  Applications of Partial Derivatives 203
Since r0 = 2 2 , θ0 = π/4, φ0 = 3π/4, we have from (a), ∇ F⏐p = Ai + Bj + Ck = –i + j.
From the transformation equations, the given point has rectangular coordinates (– 2 , 2 , 2), and so
r – r0 = (x + 2 )i + (y – 2 )j + (z – 2)k.
The required equation of the plane is thus –(x + 2 ) + (y – 2 ) = 0 or y – x = 2 2 . In spherical coor-
dinates this becomes r sin θ sinφ – r sin θ cos φ = 2 2 .
In rectangular coordinates the equation r = 4 cos θ becomes x 2 + y2 + (z – 2)2) = 4 and the tangent plane
can be determined from this as in Problem 8.1. In other cases, however, it may not be so easy to obtain the
equation in rectangular form, and in such cases the method of part (a) is simpler to use.
(c) The equations of the normal line can be represented by
xy 22
11
+− =−
 = z = 2
Tangent Line and Normal Plane to a Curve
8.5. Find equations for (a) the tangent line and (b) the normal plane to the curve x = t – cos t, y = 3 + sin 2t, z =
1 + cos 3t at the point where t = 1/2π.
(a) The vector from origin O (see Figure 8.2) to any point of curve C is R = (t – cos t)i + (3 + sin 2t)j + (1 +
cos 3t)k. Then a vector tangent to C at the point where t = 1
2 π is
t
t
d ti t tdt01 / 2
1/2
(1 sin ) 2 cos2 3sin 3 | 2 2 3 π
π
=
=
== + + − = − +RTj k i j k
The vector from O to the point where t = 1/2π is r0 = 1/2πi + 3j + k.
The vector from O to any point (x, y, z) on the tangent line is r = xi + yj + zk.
Then r – r0 = (x – 1
2 π)i + y – 3)j + (z – 1) k is collinear with T0, so that the required equation is
ie x y z 1
00 2( ) , . ., 3 1 0
22 3
π−×= − − − =
−
ij k
rr T 0
and the required equations are
x yz1
2 31
22 3
π − −−== −
 or, in parametric form, xt y t 1
22, 3 2 ,π=+ = −
zt 31=+ .
(b) Let r = xi + yj + zk be the vector from O to any point (x, y, z) of the normal plane. The vector from O to
the point where t = 1
2 π is r0 = 1
2 πi + 3j + k. The vector r – r0 = (x – 1
2 π)i + (y – 3)j + (z – 1)k lies in the
normal plane and, hence, is perpendicular to T0. Then the required equation is ( r – r 0) · T 0 = 0 or 2
(x – 1
2 π) – 2(y – 3) + 3(z – 1) = 0.
8.6. Find equations for (a) the tangent line and (b) the normal plane to the curve 3x 2y + y2z = –2, 2xz – x2y = 3 at
the point (1, –1, 1).
(a) The equations of the surfaces intersecting in the curve are
F = 3x2y + y2z + 2 = 0, G = 2xz – x2y – 3 = 0
The normals to each surface at the point P(1, –1, 1) are, respectively,
N1 = ∇ F⏐P = 6xy i + (3x2 + 2yz)j + y2k = –6 + j + k
                                                     N2 = ∇ G⏐P = (2z – 2xy)i – x2j + 2xk = 4i – j + 2k
Then a tangent vector to the curve at P is
T0 = N1 × N2 = (–6i + j + k) × (4 – j + 2k) = 3i + 16j + 2k
i.e.,


## Page 215

CHAPTER 8  Applications of Partial Derivatives204
Thus, as in Problem 8.5(a), the tangent line is given by
(r – r0) × T0 = 0 or {(x – 1)i + (y + 1)j + (z – 1)k} × {3i + 16j + 2k} = 0
i.e.,
xyz xt y t z t111 or 1 3 , 16 1, 2 131 62
−+−== = + = − = +
(b) As in Problem 8.5(b), the normal plane is given by
(r – r0) · T0 = 0 or {(x – 1)i + (y + 1)j + (z – 1)k} · {3i + 16j + 2k} = 0
i.e.,
3(x – 1) + 16(y + 1) + 2(z – 1) = 0 or 3x + 16y + 2z = –11
The results in (a) and (b) can also be obtained by using Equations (7) and (10), respectively, from Page
197.
8.7. Establish equation (10), from Page 197.
Suppose the curve is defined by the intersection of two surfaces whose equations are F(x, y, z) = 0, G(x,
y, z) = 0, where we assume F and G to be continuously differentiable.
The normals to each surface at point P are given, respectively, by N1 = ∇ F ⏐P and N2 = ∇ G⏐P. Then a
tangent vector to the curve at P is T0 = N1 × N2 = ∇ F⏐P. × ∇G ⏐P. Thus, the equation of the normal plane is
(r – r0) · T0 = 0. Now
PP x y zx y z P
yz xyxx
xyz
xxyz xyPPP
xyz P
FG F i F j F k G i G j G k
FF FFFFFFF GGGG GG
GGG
0 || { ( ) ( ) } |= ∇ × ∇ = + +×++
== + +
T
ij k
ij k
and so the required equation is
yz xyzx
P
zxyz xyPPP
FF FFFFrr F o r xx yy z zGGGG GG00 0 0() . | 0 ( ) ( ) () 0−∇ = − + − + − =
Envelopes
8.8. Prove that the envelope of the family φ(x, y, α) = 0, if it exists, can be obtained by solving simultaneously
the equations φ = 0 and φα  = 0.
Assume parametric equations of the envelope to be x = f (α), y = g (α). Then φ(f (α), g(α), α) = 0 identi-
cally, so, upon differentiating with respect to α  (assuming that φ , f, and g  have continuous derivatives), we
have
 φ x f ′ (α) + φy g′(α) + φα  = 0 (1)
The slope of any member of the family φ(x, y, α) = 0 at (x, y) is given by φx dx + φy dy = 0 or x
y
dy
dx .φ
φ=−
The slope of the envelope at (x , y) is dy dy d g
dx dx d f
/( )
/( )
αα
αα
′== ′ . Then at any point where the envelope and a
member of the family are tangent, we must have
x
xy
y
g fgf
() o r () () 0()
φ α φα φ αφα
′ ′′−= + =′  (2)
Comparing Equations (2) with (1), we see that φα  = 0, and the required result follows.


## Page 216

CHAPTER 8  Applications of Partial Derivatives 205
8.9. (a) Find the envelope of the family x sin α + y cos α = 1. (b) Illustrate the results geometrically.
(a) By Problem 8.8 the envelope, if it exists, is obtained by solving simultaneously the equations φ (x, y, α)
= x sin α + y cosα – 1 = 0 and φ α  (x, y, α) = x cos α – y cos α = 0. From these equations we find x = sin
α, y = cos α or x 2 + y2 = 1.
(b) The given family is a family of straight lines, some members of which are indicated in Figure 8.5. The
envelope is the circle x2 + y2 = 1.
Fig. 8.5
8.10. Find the envelope of the family of surfaces z = 2 αx – a 2y.
By a generalization of Problem 8.8, the required envelope, if it exists, is obtained by solving simultane-
ously the equations
φ = 2 αx – α 2 y – z = 0 (1)
and
 φ α  = 2x – 2αy = 0 (2)
From Equation (2), α = x/y. Then substitution in Equation (1) yields x2 = yz, the required envelope.
8.11. Find the envelope of the two-parameter family of surfaces z = αx + βy – αβ.
The envelope of the family F(x, y, z, α,β) = 0, if it exists, is obtained by eliminating α and β between the
equations F = 0, Fα  = 0, Fβ = 0 (see Problem 8.43). Now
F = z – αx – βy + αβ  = 0, Fα  = – x + β = 0, Fβ = – y + α = 0
Then β = x, α = y, and we have z = xy.
Directional derivatives
8.12. Find the directional derivative of F = x 2yz3 along the curve x = e–u, y = 2 sinu + 1, z = u – cos u at the point P
where u = 0.
The point P corresponding to u = 0 is (1, 1, –1). Then
∇ F = 2xyz3i + x2z3j + 3x2yz2k = – 2i – j + 3k at P
A tangent vector to the curve is
u
u
dr d eu u u kdu du
eu u a t P
{( 2 s i n 1 ) ( c o s ) }
2 cos (1 sin ) 2
−
−
=+ + + −
=− + + + =− + +
ij
ij k i j k
and the unit tangent vector in this direction is
0
2
6
−+ += ij kT


## Page 217

CHAPTER 8  Applications of Partial Derivatives206
Then
F 0
23 1Directional derivative =   . ( 2 3 ). 6266
⎛⎞−+ +∇= − − + = =⎜⎟⎝⎠
ij kTi j k
Since this is positive, F is increasing in this direction.
8.13. Prove that the greatest rate of change of F, i.e., the maximum directional derivative, takes place in the
direction of, and has the magnitude of, the vector ∇ F.
dF d Fds ds .=∇ r  is the projection of ∇ F in the direction d
ds
r . This projection is a maximum when ∇ F and
dr/ds have the same direction. Then the maximum value of dF/ds takes place in the direction of ∇ F, and the
magnitude is ⏐∇ F⏐.
8.14. (a) Find the directional derivative of U = 2x 3y – 3y2z at P (1, 2, –1) in a direction toward Q(3, –1, 5). (b) In
what direction from P is the directional derivative a maximum? (c) What is the magnitude of the maximum
directional derivative?
(a) ∇ U = 6x2yi + (2x3 – 6yz)j – 3y2k = 12i + 14j – 12k at P.
The vector from P to Q = (3 – 1)i + (–1 –2)j + [5 – (–1)]k = 2i – 3j + 6k
The unit vector from P to
22 2
236 236Q = T= 7(2) ( 3) (6)
−+ −+ =
+− +
ijk ijk
Then
Directional derivative at 23 6 9 0P = (12 14 12 ). 77
−+⎛⎞+− = −⎜⎟⎝⎠
ij kijk
        i.e., U is decreasing in this direction.
(b) From Problem 8.13, the directional derivative is a maximum in the direction 12i + 14j – 12k.
(c) From Problem 8.13, the value of the maximum directional derivative is |12 14 12 |+− =ijk
144 196 144 22++= .
Differentiation under the integral sign
8.15. Prove Leibnitz’s rule for differentiating under the integral sign.
u
u
uu
uu
uu u u
uu u u
fx d x
fx d x fx d x
fx d x fx fx d x fx d x
fx f
2
1
22
11
12 2 2
11 1 1
()
()
() ( )
(( )
() () ( ) ()
(( ) ( ) ( )
Let ( ) ( , ) . Then
() ( ) ( , ) ( , )
(, ) (, ) (, ) (, )
[( , )
α
α
αα α
αα α
αα α α α
αα α α α
φα α
φ φ αα φ α αα α
αα αα αα α
αα
+Δ
+Δ
+Δ
+Δ
=
Δ = +Δ − = +Δ −
=+ Δ + + Δ + + Δ −
=+ Δ −
∫
∫∫
∫∫ ∫ ∫
uu u
uu u
xd x f x d x f x d x
22 1
12 1
( ) () ()
() () ()
(, ) ] (, ) (, )
αα α α α
αα α
αα α α α
+Δ +Δ
++ Δ −+ Δ∫∫ ∫
By the mean value theorem for integrals, we have
uu
uu
fx fx d x fx d x
2 2
1 1
() ()
() ()
[( , ) – ( , ) ] ( ,)
αα
αα
αα α α ξ+Δ =Δ∫∫  (1)
u
u
f x dx f u u
1
1
()
11 1()
(, ) ( , ) [ ( ) – ( ) ]
αα
α
αα ξ αα αα α
+Δ
+Δ = +Δ +Δ∫  (2)


## Page 218

CHAPTER 8  Applications of Partial Derivatives 207
u
u
f x dx f u u
2
2
()
21 1()
(, ) ( , ) [ ( ) – ( ) ]
αα
α
αα ξ αα αα α
+Δ
+Δ = +Δ +Δ∫  (3)
where ξ is between α + Δα, ξ1 is between u1 (α) and u 1(α + Δα) and ξ 2 is between u2 (α) and u 2(α + Δα ).
Then
u
u
uufx d x f f
2
1
() 21
21()
( , ) ( ,) – ( ,)
α
αα
φ ξξ α α ξ α αφα α
ΔΔΔ = + +Δ +ΔΔΔ Δ∫
Taking the limit as Δα → 0, making use of the fact that the functions are assumed to have continuous deriva-
tives, we obtain
u
u
uud fx d x f fd
2
1
() 21
21()
( , ) ( ,) – ( ,)
α
αα
φ ξξ α α ξ α αφα α
ΔΔ= + +Δ +ΔΔΔ∫
8.16. If x dxx
2
sin( , find ( ) where 0.
α
α
αφα φ α α)= ′ ≠∫
By Leibniz’s rule,
a
xdddxax d d
xd x
x
2
2
2
2
2
2
32
32 3 2
sin sin ( ) sin ( )(( ) – ( )
2s i n s i ncos –
sin 2 sin sin 3 sin – 2sin––
α
α
α
α
α
αα α α αφα α ααα αα
ααα αα
αα α α α
αα α α
∂⋅ ⋅⎛⎞′) = +⎜⎟∂ ⎝⎠
=+
=+ =
∫
∫
8.17. dx
x 20
If 1 –c o s –1
π π αα α
=⋅ >∫ , dx
x 20
find
( 2–c o s )
π
⋅∫ (See Problem 5.58.)
By Leibniz’s rule, if dx
x
2– 1 / 2
0
( ) ( – 1) , then(– c o s )
π
φα παα==∫
dx
x
2– 3 / 2
23 / 20
1–() – ( – 1 ) 2(– c o s ) 2 (– 1 )
π παφα πα αα α
== =∫
Thus, dx
x 23 / 20
–
(– c o s ) (– 1 )
π πα
α α
=∫ , from which dx
x 20
2
( 2–c o s ) 33
π π=⋅∫
Integration under the integral sign
8.18. Prove the result (18), on Page 198, for integration under the integral sign.
Consider:
u
u
f x dx dx
2
1
() ( , )
α
α
ψα α⎧⎫= ⎨⎬⎩⎭∫∫ (2)
By Leibniz’s rule,
uu
uu
f x dx dx f x dx
22
11
() ( , ) ( , ) ()
α
α
ψα α α φ αα
∂ ⎧⎫′= = =⎨⎬∂ ⎩⎭∫∫ ∫
Then, by integration,
dc() ()
α
α
ψα φα α=+∫ (2)


## Page 219

CHAPTER 8  Applications of Partial Derivatives208
Since ψ(a) = 0 from Equation (1), we have c = 0 in (2). Thus from Equation (1) and (2) with c = 0, we
find
uu
uu
f x dx dx f x dx dx
22
11
(, ) (, )
αα
αα
αα⎧⎫ ⎧ ⎫ =⎨⎬ ⎨ ⎬⎩⎭ ⎩ ⎭∫∫ ∫∫
Putting α = b, the required result follows.
8.19. bbbx dx a bax aa
2
20
–1–c o sProve that ln ln if , 1.–c o s –1
π
π
⎛⎞ +⎛⎞ ⎜⎟=>⎜⎟ ⎜⎟⎝⎠ +⎝⎠
∫
From Problem 5.58, dx
x 20
1.–c o s –1
π π αα α
=⋅ >∫
Integrating the left side with respect to α from a to b yields
bb
a a
dx b xdx x dx dxxa x00 0
–c o sIn ( – cos ) In–c o s –c o s
ππ π
αα
⎧⎫ ⎛ ⎞=⎨⎬ ⎜⎟⎩⎭ ⎝ ⎠∫∫ ∫ ∫
Integrating the right side with respect to α to b yields
b
a
bbd a
aa
2
2
220
+– 1ln ( + – 1) ln
–1 + –1
π πα πα π
α
⎛⎞
⎜⎟== ⎜⎟⎝⎠
∫
and the required result follows.
Maxima and minima
8.20. Prove that a necessary condition for f (x, y) to have a relative extremum (maximum or minimum) at (x0, y0) is
that fx(x0, y0) = 0, fy (x0, y0) = 0.
If f(x0, y0) is to be an extreme value for f(x, y), then it must be an extreme value for both f(x, y0) and f (x0,
y). But a necessary condition that these have extreme values at xx = 0 and y = y0, respectively, is fx (x0, y0) = 0,
fy(x0, y0) = 0 (using results for functions of one variable).
8.21. Let f be continuous and have continuous partial derivatives of order two, at least, in a region R with the
critical point P0(x0, y0) an interior point. Determine the sufficient conditions for relative extrema at P0.
In the case of one variable, sufficient conditions for a relative extrema were formulated through the second
derivative [if positive then a relative minimum, if negative then a relative maximum, if zero a possible point of
inflection but more investigation is necessary]. In the case of z = f (x, y) that is before us we can expect the
second partial derivatives to supply information. (See Figure 8.6.)
Fig. 8.6


## Page 220

CHAPTER 8  Applications of Partial Derivatives 209
First observe that solutions of the quadratic equation BB A CAt Bt C t A
2
2 –2 4 – 420 a r e 2
±++ = = .
Further observe that the nature of these solutions is determined by B2 – AC. If the quantity is positive, the
solutions are real and distinct; if negative, they are complex conjugate; and if zero, the two solutions are coin-
cident.
The expression B2 – AC also has the property of invariance with respect to plane rotations
xx y
yx y
cos sin
cos sin
θθ
θθ
=−
=−
It has been discovered that with the identifications A = f xx, B = fxy, C = fyy, we have the partial derivative
form f 2
xy – fxxfyy that characterizes relative extrema.
The demonstration of invariance of this form can be found in analytic geometric books. However, if you
would like to put the problem in the context of the second partial derivative, observe that
xx x x y
yx y x y
xyff f f f xx
xyff f f f xy
cos sin
–s i n c o s
θθ
θθ
∂∂=+ = +∂∂
∂∂=+= +∂∂
Then, using the chain rule to compute the second partial derivatives and proceeding by straightforward
but tedious calculation, we show that.
xy xx yy x y xx yyff ff f f22 == −
The following equivalences are a consequence of this invariant form (independently of direction in the
tangent plane at P0):
xy xx yy xx yyff f f f2 0 and 0=< >  (1)
xy xx yy xx yyff f f f2 0 and 0=< <  (2)
The key relation is (1) because in order that this equivalence hold, both terms f x fy must have the same
sign. We can look to the one-variable case (make the same argument for each coordinate direction) and con-
clude that there is a relative minimum at P 0 if both partial derivatives are positive and a relative maximum if
both are negative. We can make this argument for any pair of coordinate directions because of the invariance
under rotation that was established.
If relation (2) holds, then the point is called a saddle point. If the quadratic form is zero, no information
results.
Observe that this situation is analogous to the one-variable extreme value theory in which the nature of f
at x, and with f ′(x) = 0, is undecided if f″(x) = 0.
8.22. Find the relative maxima and minima of f (x, y) = x
3 + y3 – 3x – 12y + 20.
fx = 3x2 – 3 = 0 when x = ±1, f y = 3y2 – 12 = 0 when y = ±2. Then critical points are P(1, 2), Q(–1, 2),
R(1, –2), S(–1, –2).
fxx = 6x, fyy = 0. Then Δ = fxx fyy – f 2
xy = 36xy.
At P(1, 2), Δ > 0 and fxx (or fyy) > 0; hence P is a relative minimum point.
At Q(–1, 2), Δ < 0 and Q is neither a relative maximum or minimum point.
At R(1, –2), Δ < 0 and R is neither a relative maximum or minimum point.
At S(–1, –2), Δ > 0 and fxx (or fyy) < 0 so S is a relative maximum point.
Thus, the relative minimum value of f(x, y) occurring at P is 2, while the relative maximum value occur-
ring at S is 38. Points Q and R are saddle points.
8.23. A rectangular box, open at the top, is to have a volume of 32 cubic feet. What must be the dimensions so that
the total surface is a minimum?


## Page 221

CHAPTER 8  Applications of Partial Derivatives210
If x, y, and z are the edges (see Fig. 8.7), then
 V olume of box = V = xyz = 32 (1)
 Surface area of box = S = xy + 2yz + 2xz (2)
or, since z = 32/xy from Equation (1),
Sx y xy
64 64=+ +
Fig. 8.7
S yx x2
64–0 w h e n∂ ==∂
2xy 64=  (3)
S xy y2
64–0∂ ==∂
when 2xy 64=  (4)
Dividing Equations (3) and (4), we find y = x so that x3 = 64 or x = y = 4 and z = 2.
xx yy xy xxxy S S S
xy x
2
33 3
128 128 128For = 4, – – 1 0 and s 0.⎛⎞⎛⎞=Δ = = > = >⎜⎟⎜⎟ ⎜⎟⎝⎠ ⎝⎠
 Hence, it follows that the
dimensions 4 feet × 4 feet × 2 feet give the minimum surface.
Lagrange multipliers for maxima and minima
8.24. Consider F(x, y, z) subject to the constraint condition G(x, y, z) = 0. Prove that a necessary condition that
F(x, y, z) have an extreme value is that FxGy – FyGx = 0.
     Since G(x ,       y ,       z) = 0,      we can consider z as a function of x and y—say,      z = f (x ,       y). A necessary condition that
F[x, y, f (x, y)] have an extreme value is that the partial derivatives with respect to x and y be zero. This gives
Fx + Fzzx = 0 (1)
Fy + FzZy = 0 (2)
Since G(x, y, z) = 0, we also have
 G x + Gxzx = 0 (3)
 G y + Gzzy = 0 (4)
From Equations (1) and (3) we have
 F xGx – FxGx = 0 (5)
and from Equations (2) and (4) we have
 F yGz – FzGy = 0 (6)
Then from Equations (5) and (6) we find FxGy – FyGx = 0.
These results hold only if Fz /HS11005 0, Gz /HS11005 0.
8.25. Referring to Problem 8.24, show that the stated condition is equivalent to the conditions φ x = 0, φy = 0 where
φ = F + λG and λ is a constant.
If φx = 0, Fx + λGx = 0. If φ y = 0, Fy + λGy = 0. Elimination of λ between these equations yields F xGy –
Fy Gx = 0.


## Page 222

CHAPTER 8  Applications of Partial Derivatives 211
The multiplier λ is the Lagrange multiplier. If desired, we can consider equivalently φ = λF + G where
φx = 0, φy = 0.
8.26. Find the shortest distance from the origin to the hyperbola x2 + 8xy + 7y2 = 225, z = 0.
We must find the minimum value of x2 + y2 (the square of the distance from the origin to any point in the
xy plane) subject to the constraint x2 + 8xy + 7y2 = 225.
According to the method of Lagrange multipliers, we consider φ = x 2 + 8xy + 7y 2 – 225 + λ (x2 + y 2).
Then
 φ x = 2x + 8y + 2λx = 0   or   (λ + 1) x + 4y = 0 (1)
 φ y = 8x + 14y + 2λy = 0   or   4x + (λ + 7)y = 0 (2)
From Equations (1) and (2), since (x, y) /HS11005 (0, 0), we must have
214 0, i.e., 8 – 9 or = 1, –947
λ λλ λλ
+ =+ =+
Case 1: λ = 1. From Equation (1) or (2), x = –2y, and substitution in x2 + 8xy + 7y2 = 225 yields –5y2 = 225,
for which no real solution exists.
Case 2: λ = –9. From Equation (1) or (2), y = 2x, and substitution in x2 + 8xy + 7y2 = 225 yields 45x2 = 225.
Then x2 = 5, y2 = 4x2 = 20 and so x2 + y2 = 25. Thus, the required shortest distance is 25  = 5.
8.27. (a) Find the maximum and minimum values of x 2 + y2 + z2 subject to the constraint conditions x2/4 + y2/5 +
z2/25 = 1 and z = x + y. (b) Give a geometric interpretation of the result in (a).
(a) We must find the extrema of F  = x 2 + y 2 + z 2 subject to the constraint conditions xx22
1 45φ= + +
z xyz
2
2–1 0 a n d – 025 φ== + = . In this case we use two Lagrange multipliers λ 1, λ2 and consider
the function
xyzGF x y z xyz
222
222
11 2 2 1 2–1 ( – )45 2 5λφ λφ λ λ ⎛⎞=+ + = + + + + + + + ⎜⎟⎜⎟⎝⎠
Taking the partial derivatives of G with respect to x,y, z and setting them equal to zero, we find
xy x
xyzGx Gy Gz111
22 2
222 0, 2 0, 2 – 0252 5
λλλ λλ λ=+ += =+ += =+ =  (1)
Solving these equations for x, y, z, we find
xy z 22 2
11 1
–2 –5 25,,4 2 10 2 50
λλ λ
λλ λ== =++ +
 (2)
From the second constraint condition, x + y – z = 0, we obtain, on division by λ2, assumed different from
zero (this is justified, since otherwise we would have x = 0, y = 0, z = 0, which would not satisfy the first con-
straint condition), the result
11 1
25 2 5 04 2 10 2 50λλ λ ++=++ +
Multiplying both sides by 2(λ1 + 4)(λ1 + 5)(λ1 + 5)(λ1 + 25) and simplifying yields
17λ2
1 + 245λ1 + 750 = 0 or (λ1 + 10)(17λ1 + 75) = 0
from which λ1 = –10 or –75/17.


## Page 223

CHAPTER 8  Applications of Partial Derivatives212
Case 1: λ1 = –10.
From (2), x = 1
3 λ2, y = 1
2 λ2, z = 5/6λ2. Substituting in the first constraint condition, x2/4 + y2 /5 + z2/25
= 1, yields λ2
2 = 180/19 or λ2 = ±6 5/1 9 . This gives the two critical points
() ()2 5/19 , 3 5/19 , 5 5/19 , –2 5/19 , –3 5/19 , –5 5/19
The value of x2 + y2 + z2 corresponding to these critical points is (20 + 45 + 125)/19 = 10.
Case 2: λ1 = –75/17.
From (2), x = 34/7 λ2, y = –17/4λ2, z = 17/28λ2. Substituting in the first constraint condition, x2/4 + y2/5
+ z2/25 = 1, yields λ2 = ±140/(17 646 ) which give the critical points
() ()40 / 646 , – 35 646 , 5 / 646 , –40 / 646 , – 35 646 , – 5 / 646
The value of x2 + y2 + z2 corresponding to these is (1600 + 1225 + 25)/646 = 75/17.
Thus, the required maximum value is 10 and the minimum value is 75/17.
(b) Since x2 + y2 + z2 represents the square of the distance of (x, y, z) from the origin (0, 0, 0), the problem is
equivalent to determining the largest and smallest distances from the origin to the curve of intersection of
the ellipsoid x2/4 + y2/5 + z2/25 = 1 and the plane z = x + y. Since this curve is an ellipse, we have the
interpretation that 10  and 75 /17  are the lengths of the semimajor and semiminor axes of this el-
lipse.
The fact that the maximum and minimum values happen to be given by –λ1 in both Case 1 and Case 2 is
more than a coincidence. It follows, in fact, on multiplying Equations (1) by x,y, and z in succession and add-
ing, for we then obtain
xy zxx y y z z
22 2
22 2 11 1
22 2
2222 2 – 025 2 5
λλ λ λλ λ++ + + + + + =
i.e.,
xy zxyz x y z
22 2
222
12 (– ) 045 2 5λλ⎛⎞+++ + + + + = ⎜⎟⎜⎟⎝⎠
Then, using the constraint conditions, we find x2 + y2 + z2 = –λ1.
For a generalization of this problem, see Problem 8.76.
Applications to errors
8.28. The period T of a simple pendulum of length l is given by T = 2 lg/ . Find (a) the error and (b) the percent
error made in computing T by using l = 2 m and g = 9.75 m/ sec2, if the true values are l = 19.5m and g =
9.81 m/sec2.
(a) T = 2πl1/2g– 1/2. Then
dT g l dl l g dg dl dg
glg
–1/ 2 –1/ 2 1/ 2 –3/ 2
3
11 1(2 ( ) (2 )(– ) –22
πππ π=+ =  (1)
Error in g = Δg = dg = + 0.06; error in l = Δl = dl = – 0.5
The error in T is actually ΔT, which is in this case approximately equal to dT. Thus, we have from Equa-
tion (1),
Td T
Tl g T
3
2Error in (–0.05) – ( 0.06) – 0.0444 sec (approx.)
(9.75)(2)(9.75)
2The value of for 2, 9.75 is 2 2.846 sec (approx.)9.75
π π
π
== + =
== = =


## Page 224

CHAPTER 8  Applications of Partial Derivatives 213
(b) Percent error (or relative error) in dTT T
–0.0444 –1.56%.2.846== =
Another method: Since ln T = ln 2π + 1
2
 ln l – 1
2
 ln g,
dT dl dg
Tlg
1 1 1 –0.05 1 0.06– – –1.56%2 2 2 2 2 9.75
+⎛⎞ ⎛⎞== = ⎜⎟ ⎜⎟⎝⎠ ⎝⎠
 (2)
as before. Note that Equation (2) can be written
Percent error in T = 1
2
 Percent error in l – 1
2
 Percent error in g
Miscellaneous problems
8.29. x dxx
1
0
–1Evaluate . In∫
In order to evaluate this integral, we resort to the following device. Define
x dxx
1
0
–1() 0In
α
φα α=>∫
Then by Leibniz’s rule
xx x dx dx dxxx
11 1
00 0
–1 I n 1() In In 1
αα
φα αα
⎛⎞∂′= = = =⎜⎟⎜⎟∂+ ⎝⎠∫∫ ∫
Integrating with respect to α, φ(α) = ln(α + 1) + c. But since φ(0) = 0, c = 0, and so φ(α) = ln(α + 1).
Then the value of the required integral is φ(1) = ln 2.
The applicability of Leibniz’s rule can be justified here, since if we define F(x,α) = (x α  – 1)/lnx, 0 < x <
1, F(0, α) = 0, F(1, α) = α, then F(x, α) is continuous in both x and α for 0 < x <  1 and all finite α > 0.
8.30. Find constants a and b for which F a b x ax bx 2
0
(, ) { s i n – ( ) }
π
=+∫
2
} dx is a minimum.
The necessary conditions for a minimum are ∂F/∂a = 0. Performing these differentiations, we obtain
F xa x b xd x x xa x b x d xaa
F xa x b xd x x xa x b x d xbb
22 2 2
00
22 2
00
{sin – ( )} – 2 {sin – ( )} 0
{sin – ( )} – 2 {sin – ( )} 0
ππ
ππ
∂∂ =+ = + =∂∂
∂∂ =+ = + =∂∂
∫∫
∫∫
From these we find
xd x b xd x x x d x
xd x b xd x x x d x
43 2
00 0
32
00 0
sin
sin
ππ π
ππ π
α
α
⎧ +=⎪⎪⎨
⎪ +=⎪⎩
∫∫ ∫
∫∫ ∫
or
ab
ab
54
2
43
–454
43
ππ π
ππ π
⎧ +=⎪⎪⎨
⎪ +=⎪⎩
Solving for a and b, we find
ab 35 42
20 320 240 12– – 0.40065. – 1.24798ππ ππ=≈ =≈


## Page 225

CHAPTER 8  Applications of Partial Derivatives214
We can show that for these values, F(a,b) is indeed a minimum using the sufficiency conditions on Page
200.
The polynomial ax2 + bx is said to be a least square approximation of sin x over the interval (0, π). The
ideas involved here are of importance in many branches of mathematics and their applications.
SUPPLEMENTARY PROBLEMS
Tangent plane and normal line to a surface
8.31. Find the equations of (a) the tangent plane and (b) the normal line to the surface x 2 + y2 = 4z at (2, –4, 5).
Ans. (a) xy z–2 – = 5 (b) xyz–2 4 –5
1– 2 – 1
+==
8.32. If z = f (x, y), prove that the equations for the tangent plane and normal line at point P(x0, y0, z0) are given,
respectively, by (a) xyzz f p xx f p yy00 0–( – ) ( – )=+  and (b) xx yy zz
fx p fx p
00 0–––
–1== .
8.33. Prove that the acute angle γ between the z axis and the normal line to the surface F(x, y, z) = 0 at any point is
given by xy zFF F F22 2
2sec / .γ= +
8.34. The equation of a surface is given in cylindrical coordinates by F(ρ, φ, z) = 0, where F is continuously
differentiable. Prove that the equations of (a) the tangent plane and (b) the normal line at the point P(ρ0, φ0,
z0) are given, respectively, by Ax x By y Cz z00 0(– ) (– ) (– ) 0++=  and xx yy zz
AB C
00 0––– ==
where x0 = ρ0 cos φ0, y0 = ρ0 sin φ0 and AF p F p 00
1cos – sin ,ρφ φφ ρ= BF p F p 00
1sin cos ,ρφ φφ ρ=+
and zC F= p.
8.35. Use Problem 8.34 to find the equation of the tangent plane to the surface πz = ρφ at the point where ρ = 2,
φ = π/2, z = 1. To check your answer, work the problem using rectangular coordinates.
Ans. 2x – πy + 2πz = 0
Tangent line and normal plane to a curve
8.36. Find the equations of (a) the tangent line and (b) the normal plane to the space curve x = 6 sin t, y = 4 cos 3t.
z = 2 sin 5t at the point where t = π/4.
Ans. (a) xyz–3 2 2 2 2
3– 6 – 5
++==  (b) xyz3– 6– 5 2 62 =
8.37. The surfaces x + y + z = 3 and x2 – y2 + 2z2 = 2 intersect in a space curve. Find the equations of (a) the
tangent line and (b) the normal plane to this space curve at the point (1, 1, 1).
Ans. (a) xyz–1 –1 –1
–3 1 2==  (b) xy z3– – 2 0 =
p p
p p  fx   fx


## Page 226

CHAPTER 8  Applications of Partial Derivatives 215
Envelopes
8.38. Find the envelope of each of the following families of curves in the xy plane: (a) ya x 2– α = and
(b) xy22
1.1–αα +=  In each case construct a graph.
Ans. (a) xy2 4=  (b) xy xy 1, – 1+= ± = ±
8.39. Find the envelope of a family of lines having the property that the length intercepted between the x and y
axes is a constant a.
Ans. x2/3 + y2/3 = a2/3
8.40. Find the envelope of the family of circles having centers on the parabola y = x 2 and passing through its
vertex. [Hint: Let (α, α 2) be any point on the parabola.]
Ans. x2 = –y3/(2y + 1)
8.41. Find the envelope of the normals (called an evolute) to the parabola y = x2 and construct a graph.
Ans. 8(y – 1)3 = 27x2
8.42. Find the envelope of the following families of surfaces: (a) α(x – y) – α 2z = 1 and (b) (x – α) 2 + y2 = 2αz.
Ans. (a) 4z = (x – y)2, (b) y2 = z2 + 2xz
8.43. Prove that the envelope of the two-parameter family of surfaces F(x, y, z, α, β) = 0, if it exists, is obtained by
eliminating α and β in the equations F = 0, F α  = 0, and Fβ = 0.
8.44. Find the envelope of the two-parameter families (a) z = αx + βy – α 2 – β2 and (b) x cos α + y cos β + z cos γ
= a where cos2 α + cos 2 β + cos2 γ = 1 and a is a constant.
Ans. (a) 4z = x2 + y2 (b) x2 + y2 + z2 = a2
Directional derivatives
8.45. (a) Find the directional derivative of U = 2xy – z 2 at (2, –1, 1) in a direction toward (3, 1, –1). (b) In what
direction is the directional derivative a maximum? (c) What is the value of this maximum?
Ans. (a) 10/3 (b) – 2i + 4j – 2k (c) 2 6
8.46. The temperature at any point (x, y) in the xy plane is given by T = 100xy/(x2 + y2). (a) Find the directional
derivative at the point (2, 1) in a direction making an angle of 60º with the positive x axis. (b) In what
direction from (2, 1) would the derivative be a maximum? (c) What is the value of this maximum?
Ans. (a) 12 3  – 6 (b) in a direction making an angle of π – tan–1 2 with the positive xaxis. or in the direc-
tion –i + 2j (c) 12 5
8.47. Prove that if F(ρ, φ, z) is continuously differentiable, the maximum directional derivative of F at any point is
given by FF F
z
22 2
2
1
ρφ ρ
⎛⎞ ⎛⎞∂∂ ∂ ⎛⎞++ ⋅⎜⎟ ⎜⎟ ⎜⎟∂∂ ∂ ⎝⎠⎝⎠ ⎝⎠
1
2


## Page 227

CHAPTER 8  Applications of Partial Derivatives216
Differentiation under the integral sign
8.48. dxd x d
1/ 2If ( ) cos , find
α
α
φφα α α= ∫
Ans. xx d x
1/ 22 2
2
11 1sin – cos – cos
2
α
α
αα αα α∫
8.49. (a) If xd FFd x d
2
–1
0
() t a n , f i n d
α
α αα= ∫  by Leibniz’s rule. (b) Check the result in (a) by direct
integration.
Ans. (a) –1 212t a n – I n ( 1 )2αα α +
8.50. Given pxd x p p
1
0
1 ,– 11=> +∫ , prove that ()
()
m
pm
m
mxx d x
p
1
10
–1 !(In )
1
+=
+∫
8.51. xd x
2
0
1+ 1–Prove that In (1 cos ) In , 1.2
π ααπ α
⎛⎞
⎜⎟+= <⎜⎟⎝⎠
∫
8.52. xd x
2
2
0
In , 1Prove that In (1 – 2 cos ) Discuss the case 1.0, 1
π πα ααα αα
⎧ <⎪+= ⋅ =⎨ >⎪⎩∫
8.53. dx
x 30
59Show that .2048(5 – 3cos )
π π=∫
Integration under the integral sign
8.54.
1
0
Verify that ∫
⎧⎨⎩
2
1∫ xd x22(– )α ⎫⎬
⎭
dx
2
1
α = ∫
⎧⎨⎩
1
0∫ xd x22(– )α
2
1
α = ∫
⎫
⎬
⎭
dx
8.55. Starting with the result xd x
2
0
(– s i n ) 2 ,
π
απ α=∫  prove that for all constants a and b, x) dx = 2πα, prove
that for all constants a and b,
bx ax d x b a
2 22 2 2
0
{( – sin ) – ( – sin ) } 2 ( – )
π
π =∫
8.56. Use the result dx
x
2
0 2
2 ,1sin –1
π π αα α
=>+∫  to prove that x dxx
2
0
53 s i n 9In 2 In54 s i n 8
π
π⎛⎞ + ⎛⎞=⎜⎟ ⎜⎟+ ⎝⎠⎝⎠∫
8.57. (a) dx
x
–1/2
0 2
cosUse the result ,1c o s 1–
π α
α α
=+∫ 0 < α < 1 to show that for 0 < a < 1, 0 < b < 1,
bxxd x a bax
/2 –1 2 –1 2
0
1 cos 1sec In {(cos ) – (cos ) }1 cos 2
π ⎛⎞ + =⎜⎟ +⎝⎠∫
(b) xx d x
2/2
0
15Show that sec In (1 cos ) . 27 2
π π+=∫
Maxima and minima, lagrange multipliers
8.58. Find the maxima and minima of F(x, y, z) = xy2 z) = xy2z3 subject to the conditions x + y + z = 6, x > 0, y > 0,
z > 0.
Ans. maximum value = 108 at x = 1, y = 2, z = 3


## Page 228

CHAPTER 8  Applications of Partial Derivatives 217
8.59. What is the volume of the largest rectangular parallelepiped which can be inscribed in the ellipsoid x 2/9 +
y2/16 + z2/36 = 1?
Ans. 64 3
8.60. (a) Find the maximum and minimum values of x 2 + y2 subject to the condition 3x2 + 4xy + 6y2 = 140. (b)
Give a geometrical interpretation of the results in (a).
Ans. maximum value = 70, minimum value = 20
8.61. Solve Problem 8.23 using Lagrange multipliers.
8.62. Prove that in any triangle ABC there is a point P such that PA
2
 + PB
2
 + PC
2
 is a minimum and that P is
the intersection of the medians.
8.63. (a) Prove that the maximum and minimum values of f (x, y) = x2 + xy + y2 in the unit square 0 < x <  1, 0 <
y <  1 are 3 and 0, respectively. (b) Can the result of (a) be obtained by setting the partial derivatives of f(x,
y) with respect to x and y equal to zero. Explain.
8.64. Find the extreme values of z on the surface 2x 2 + 3y2 + z2 – 12xy + 4xz = 35.
Ans. maximum = 5, minimum = –5
8.65. Establish the method of Lagrange multipliers in the case where we wish to find the extreme values of F(x, y,
z) subject to the two constraint conditions G(x, y, z) = 0, H(x, y, z) = 0.
8.66. Prove that the shortest distance from the origin to the curve of intersection of the surfaces xyz = a and y = bx,
where a > 0, b > 0, is ab b23( 1 ) / 2+ .
8.67. Find the volume of the ellipsoid 11x 2 + 9y2 + 15z2 – 4xy + 10yz – 20xz = 80.
Ans. 64π 2 /3
Applications to errors
8.68. The diameter of a right circular cylinder is measured as 6.0 ± 0.03 inches, while its height is measured as 4.0
± 0.02 inches. What is the largest possible (a) error and (b) percent error made in computing the volume?
Ans. (a) 1.70 in3 (b) 1.5 percent
8.69. The sides of a triangle are measured to be 12.0 and 15.0 feet, and the included angle is 60.0º. If the lengths
can be measured to within 1 percent accuracy, while the angle can be measured to within 2 percent accuracy,
find the maximum error and percent error in determining the (a) area and (b) the opposite side of the
triangle.
Ans. (a) 2.501 ft
2, 3.21 percent (b) 0.287 ft, 2.08 percent


## Page 229

CHAPTER 8  Applications of Partial Derivatives218
Miscellaneous problems
8.70. If ρ and φ are cylindrical coordinates, a and b are any positive constants, and n is a positive integer, prove
that the surface ρn sin nφ = a and ρn cos nφ = b are mutually perpendicular along their curves of intersection.
8.71. Find an equation for (a) the tangent plane and (b) the normal line to the surface 8rθφ = π 2 at the point where
r = 1, θ = π/4, φ = π/2, (r, θ, φ) being spherical coordinates.
Ans. (a) xyz 22 24– ( 4 ) ( 4– ) –ππ π π π++ = 2 (b) xy z
22
–2 / 2 –2 / 2
–4 4– 4ππ ππ
==
+
8.72. (a) Prove that the shortest distance from the point (a, b, c) to the plane Ax + By + Cz + D = 0 is
Aa Bb Cc D
ABC222
++ +
++
(b) Find the shortest distance from (1, 2, –3) to the plane 2x – 3y + 6z = 20.
Ans. (b) 6
8.73. The potential V due to a charge distribution is given in spherical coordinates (r, θ, φ) by
pV r2
cosθ=
where p is a constant. Prove that the maximum directional derivative at any point is
p
r
22
3
sin 4 cosθθ+
8.74. Prove that
mnxx m dxxn
1
0
–1 lnln 1
⎛⎞ += ⎜⎟ +⎝⎠∫  if m > 0, n > 0. Can you extend the result to the case m > – 1, n > –1?
8.75. (a) If b2 – 4ac < 0 and a > 0, c > 0, prove that the area of the ellipse ax2 + bxy + cy2 = 1 is 2π/ ac b 24. −
(Hint: Find the maximum and minimum values of x2 + y2 subject to the constraint ax2 + bxy + cy2 = 1.)
8.76. Prove that the maximum and minimum distances from the origin to the curve of intersection defined by x 2/a2
+ y2/b2 + z2/c2 = 1 and Ax + By + Cz = 0 can be obtained by solving for d the equation
Aa Bb Cc
ad bd cd
22 22 22
22 2222 0
––– ++=
8.77. Prove that the last equation in the preceding problem always has two real solutions d 2
1 and d2
2
 for any real
nonzero constants a, b, c and any real constants A, B, C (not all zero). Discuss the geometrical significance
of this.
8.78. (a)
M
M
dx M MI xM
–1
22 2 3 2 2 20
1Prove that tan() 2 2 ( ) ααα α α== + ++∫ .
(b) MM
dx
x
x
22 20
Find lim I . This can be denoted by .() α→∞ +∫
(c)
MM
MM
dd x d d x
dd xx22 2 22 200
Is lim lim ?() ()αα αα→∞ →∞
=++∫∫


## Page 230

CHAPTER 8  Applications of Partial Derivatives 219
8.79. Find the point on the paraboloid z = x 2 + y2 which is closest to the point (3, –6, 4).
Ans. (1, –2, 5)
8.80. Investigate the maxima and minima of f(x, y) = (x2 – 2x + 4y2 – 8y)2.
Ans. Minimum value = 0
8.81. ( a) xd x
xx
/2
220
cos InProve that – .cos sin 2( 1) 1
π απ α
α αα=+ ++∫
(b) xd xa xx
2/2
20
c o s 3 5–8l n2Use ( ) to Prove that .50(2cos sin )
π π+=+∫
8.82. ( a) Find sufficient conditions for a relative maximum or minimum of w = f (x, y, z).
(b) Examine w = x2 + y2 + z2 – 6xy + 8xz – 10yz for maxima and minima.
[Hint: For (a) use the fact that the quadratic form Aα2 + Bβ 2 + Cγ2 + 2Dαβ + 2Eαγ + 2Fβγ > 0 (i.e., is positive
definite) if ADFADAD B E DB FEC
0, 0. 0>> >


## Page 231

This page intentionally left blank


## Page 232

221
Multiple Integrals
Much of the procedure for double and triple integrals may be thought of as a reversal of partial differentiation
and otherwise is analogous to that for single integrals. However, one complexity that must be addressed re-
lates to the domain of definition. With single integrals, the functions of one variable were defined on intervals
of real numbers. Thus, the integrals only depended on the properties of the functions. The integrands of
double and triple integrals are functions of two and three variables, respectively, and as such are defined on
two- and three-dimensional regions. These regions have a flexibility in shape not possible in the single-
variable cases. For example, with functions of two variables, and the corresponding double integrals, rectan-
gular regions a
< x < b, c < y < d are common. However, in many problems the domains are regions
bounded above and below by segments of plane curves. In the case of functions of three variables, and the
corresponding triple integrals other than the regions a
< x < b, c < y < d, e < z < f, there are those bounded
above and below by portions of surfaces. In very special cases, double and triple integrals can be directly
evaluated. However, the systematic technique of iterated integration is the usual procedure. It is here that the
reversal of partial differentiation comes into play.
Figure 9.1
Definitions of double and triple integrals are given as follows. Also, the method of iterated integration is
described.
Double Integrals
Let F(x, y) be defined in a closed region ℜ of the xy plane (see Figure 9.1). Subdivide ℜ into n subregions
Δℜ k of area ΔAk, k = 1, 2, . . . , n. Let (ξk, ηk) be some point of ΔAk. Form the sum
n
kk k
k
FA
1
(, )ξη
=
Δ∑  (1)
Consider
n
kk kn k
FA
1
lim ( , ) ξη
→∞ =
Δ∑  (2)
CHAPTER 9


## Page 233

CHAPTER 9  Multiple Integrals222
where the limit is taken so that the number n of subdivisions increases without limit and such that the largest
linear dimension of each ΔAk approaches zero. See Figure 9.2(a). If this limit exists, it is denoted by
Fxy d A(, )
ℜ∫∫  (3)
and is called the double integral of F(x, y) over the region ℜ.
It can be proved that the limit does exist if F(x, y) is continuous (or sectionally continuous) in ℜ.
The double integral has a great variety of interpretations with any individual one dependent on the form
of the integrand. For example, if F(x, y) = ρ(x, y) represents the variable density of a flat iron plate, then the
double integral ∫A ρ dA of this function over a same-shaped plane region A is the mass of the plate. In Figure
9.2(b) we assume that F(x, y) is a height function [established by a portion of a surface z = F(x, y)] for a
cylindrically shaped object. In this case the double integral represents a volume.
Figure 9.2
Iterated Integrals
If ℜ is such that any lines parallel to the y axis meet the boundary of ℜ in, at most, two points (as is true in
Figure 9.1), then we can write the equations of the curves ACB  and ADB bounding ℜ as y = f 1(x) and y =
f2(x), respectively, where f1(x) and f2(x) are single-valued and continuous in a < x < b. In this case we can
evaluate the double integral (3) by choosing the regions Δℜ k as rectangles formed by constructing a grid of
lines parallel to the x and y axes and ΔAk as the corresponding areas. Then Equation (3) can be written
bf x
xa y f x
bf x
xa y f x
F x y dx dy F x y dy dx
Fxy d y d x
2
1
2
1
()
()
()
()
(, ) (, )
(, )
ℜ
==
==
=
⎧⎫= ⎨⎬⎩⎭
∫∫ ∫ ∫
∫∫
 (4)
where the integral in braces is to be evaluated first (keeping x constant) and finally integrating with respect
to x from a to b. The result (4) indicates how a double integral can be evaluated by expressing it in terms of
two single integrals called iterated integrals.


## Page 234

CHAPTER 9  Multiple Integrals 223
The process of iterated integration is visually illustrated in Figure 9.3(a) and (b) and further illustrated as
follows.
Figure 9.3
The general idea, as demonstrated with respect to a given three-space region, is to establish a plane sec-
tion, integrate to determine its area, and then add up all the plane sections through an integration with respect
to the remaining variable. For example, choose a value of x (say, x = x/H11032). The intersection of the plane x = x/H11032
with the solid establishes the plane section. In it, z = F(x /H11032, y) is the height function, and if y = f 1(x) and y =
f2(x) for all z) are the bounding cylindrical surfaces of the solid, then the width is f 2(x/H11032) – f1(x/H11032), i.e., y2 – y1.
Thus, the area of the section is
y
y
AF x y d y
2
1
(,)′= ∫ . Now establish slabs Aj Δ xj, where, for each interval Δ xj =
xj – xj–r, there is an intermediate value x/H11032j. Then sum these to get an approximation to the target volume. Add-
ing the slabs and taking the limit yields
n by
jjx ayj
V A x F x y dx dx
2
11
lim ( , )
→∝ =
⎛⎞=Δ = ⎜⎟⎝⎠∑ ∫∫
In some cases the order of integration is dictated by the geometry. For example, if ℜ is such that any lines
parallel to the x axis meet the boundary of ℜ in, at most, two points (as in Figure 9.1), then the equations of
curves CAD and CBD can be written x = g1(y) and x = g2(y), respectively, and we find, similarly,
dg y
yc xg y
F x y dx dy F x y dx dy
2
1
()
()
(, ) (, )
==
ℜ
=∫∫ ∫ ∫  (5)
dg y
yc xg y
Fxy d x d y
2
1
()
()
(, )
==
⎧⎫= ⎨⎬⎩⎭∫∫
If the double integral exists, Equations (4) and (5) yield the same value. (See, however, Problem 9.21.) In
writing a double integral, either of the forms (4) or (5), whichever is appropriate, may be used. We call one
form an interchange of the order of integration with respect to the other form.
In case ℜ is not of the type shown in Figure 9.3, it can generally be subdivided into regions ℜ
1, ℜ 2, . . . ,
which are of this type. Then the double integral over ℜ is found by taking the sum of the double integrals
over ℜ
1, ℜ 2, . . . .


## Page 235

CHAPTER 9  Multiple Integrals224
Triple Integrals
These results are easily generalized to closed regions in three dimensions. For example, consider a function
F(x, y, z) defined in a closed three-dimensional region ℜ. Subdivide the region into n subregions of volume
ΔVk, k = 1, 2, . . . , n. Letting (ξk, ηk, ζk) be some point in each subregion, we form
n
kkk kx k
FV
1
lim ( , , ) ξηξ
→∞ =
Δ∑  (6)
where the number n of subdivisions approaches infinity in such a way that the largest linear dimension of
each subregion approaches zero. If this limit exists, we denote it by
Fxyz d V(, , )
ℜ
∫∫∫  (7)
called the triple integral of F(x, y, z) over ℜ. The limit does exist if F(x, y, z) is continuous (or piecemeal
continuous) in ℜ.
If we construct a grid consisting of planes parallel to the xy,yz, and xz planes, the region ℜ is subdivided
into subregions which are rectangular parallelepipeds. In such case we can express the triple integral over ℜ
given by (7) as an iterated integral of the form
xYbg a f x y bg x f
xa ygx z f x y xa ygx z f x y
F x y z dx dy dz F x y z dz dy dx
22 22 ( , )
11 11
() (, ) ()
() (,) () (,)
(, , ) (, , )
== = == =
⎡⎤ ⎧⎫= ⎨⎬⎢⎥ ⎩⎭⎣⎦∫∫ ∫ ∫∫ ∫  (8)
(where the innermost integral is to be evaluated first) or the sum of such integrals. The integration can also
be performed in any other order to give an equivalent result.
The interated triple integral is a sequence of integrations, first from surface portion to surface portion, then
from curve segment to curve segment, and finally from point to point. (See Figure 9.4.)
Extensions to higher dimensions are also possible.
Figure 9.4


## Page 236

CHAPTER 9  Multiple Integrals 225
Transformations of Multiple Integrals
In evaluating a multiple integral over a region ℜ, it is often convenient to use coordinates other than rectan-
gular, such as the curvilinear coordinates considered in Chapters 6 and 7.
If we let (u, υ) be curvilinear coordinates of points in a plane, there will be a set of transformation equa-
tions x = f (u, υ), y = g(u, υ) mapping points (x, y) of the xy plane into points (u, υ) of the uυ plane.
In such case the region ℜ of the xy plane is mapped into a region ℜ´ of the uν plane. We then have
xyFxy d x d y G u d u d u
(, )(, ) (, ) (, )υυ υ
∂= ∂∫∫ ∫∫  (9)
where G(u, υ), ≡ F{f (u, υ), g(u, υ)} and
xx
xy u
yyu
u
(, )
(, )
υ
υ
υ
∂∂
∂ ∂∂≡ ∂∂∂
∂∂
 (10)
is the Jacobian of x and y with respect to u and υ (see Chapter 6).
Similarly, if (u,υ, w) are curvilinear coordinates in three dimensions, there will be a set of transformation
equations x = f (u, υ, w), y = g(u, υ, w), z = h(u, υ, w) and we can write
(, , )(, , ) (, , ) (, , )
xyzF x y z dx dy dz G u w du dv dw uw
ℜℜ
υ υ
∂= ∂∫∫∫ ∫∫∫  (11)
where G(u, υ, w) ≡ F{(f (u, υ, w), g(u, υ, w), h(u, υ, w)} and
xxx
uw
xyz y y y
uw u w
zzz
uw
(, , )
(, , )
υ
υυ
υ
∂∂∂
∂∂ ∂
∂∂ ∂ ∂ ≡∂∂ ∂ ∂
∂∂∂
∂∂ ∂
 (12)
is the Jacobian of x, y, and z with respect to u, υ, and w.
The results (9) and (11) correspond to change of variables for double and triple integrals. Generalizations
to higher dimensions are easily made.
The Differential Element of Area in Polar Coordinates, Differential Elements of
Area in Cylindral and Spherical Coordinates
Of special interest is the differential element of area dA for polar coordinates in the plane, and the differential
elements of volume dV for cylindrical and spherical coordinates in three-space. With these in hand, the dou-
ble and triple integrals as expressed in these systems are seen to take the following forms. (See Figure 9.5.)
The transformation equations relating cylindrical coordinates to rectangular Cartesian ones appear in
Chapter 7, in particular,
x = ρ cos φ, y = ρ sin φ, z = z
The coordinate surfaces are circular cylinders, planes, and planes. (See Figure 9.5.)
At any point of the space (other than the origin), the set of vectors z
rrr,,ρφ
⎧⎫∂∂∂
⎨⎬∂∂∂⎩⎭
 constitutes an orthogo-
nal basis.


## Page 237

CHAPTER 9  Multiple Integrals226
Figure 9.5
In the cylindrical case, r = ρ cos φi + ρ sin φj + zk and the set is
z
rr r cos i sin j, sin i cos j,φφ ρ φ ρ φρρ
∂∂ ∂=+ = − + =∂∂ ∂
∂r ∂r ∂rj, k
Therefore, z
rr r .ρρφ
∂∂ ∂⋅×=∂∂ ∂
∂r ∂r ∂r
That the geometric interpretation of dd d zz
rr r ρφρφ
∂∂ ∂⋅×∂∂ ∂
∂r ∂r ∂r  is an infinitesimal rectangular parallelepiped
suggests that the differential element of volume in cylindrical coordinates is
dV d d dzρρφ=
Thus, for an integrable but otherwise arbitrary function F(ρ, φ, z) of cylindrical coordinates, the iterated
triple integral takes the form
zg zf z
zg z f z
Fz d d d z
22 2
11 1
() (,)
() (,)
(,,)
φ
φ
ρφ ρ ρ φ∫∫ ∫
The differential element of area for polar coordinates in the plane results by suppressing the z coordinate.
It is
dA d d rr ρφρφ
∂∂=×∂∂
∂r ∂r
and the iterated form of the double integral is
Fd d
2 2
11
()
()
(,)
ρ φρ
ρφ ρ
ρφρ ρ φ∫∫
The transformation equations relating spherical and rectangular Cartesian coordinates are
x = r sin θ cos φ, y = r sin θ sin φ, z = r cos θ
In this case the coordinate surfaces are spheres, cones, and planes. (See Figure 9.5.)
Following the same pattern as with cylindrical coordinates we discover that
dV = r2 sin θ dr d θ d φ
and the iterated triple integral of F(r, θ, φ) has the spherical representation


## Page 238

CHAPTER 9  Multiple Integrals 227
rr
rr
Fr r d rd d
22 2
11 1
() ( ,) 2
() ( ,)
(, , ) s i n
θφ φ θ
θφ φ θ
θφ θ θ φ∫∫ ∫
Of course, the order of these integrations may be adapted to the geometry.
The coordinate surfaces in spherical coordinates are spheres, cones, and planes. If r is held constant—say,
r = a—then we obtain the differential element of surface area
dA = a2 sin θ dθ dφ
The first octant surface area of a sphere of radius a is
a d da da d a
/2 /2 /2 /222 2 22
000 0 0
sin ( cos ) 2
πππ π π πθθφ θ φ φ=− = =∫∫ ∫ ∫
Thus, the surface area of the sphere is 4πa2.
SOLVED PROBLEMS
Double integrals
9.1. (a) Sketch the region ℜ in the xy plane bounded by y = x 2, x = 2, y = 1. (b) Give a physical interpretation to
22() .x y dx dy
ℜ
+∫∫  (c) Evaluate the double integral in (b).
(a) The required region ℜ is shown shaded in Figure 9.6.
(b) Since x2 + y2 is the square of the distance from any point (x, y) to (0, 0), we can consider the double inte-
gral as representing the polar moment of inertia (i.e., moment of intertia with respect to the origin) of the
region ℜ (assuming unit density).
Figure 9.6
 Figure 9.7
We can also consider the double integral as representing the mass of the region ℜ, assuming a density
varying as x2 + y2.
(c) Method 1: The double integral can be expressed as the iterated integral
x
xx
xy x y x y
yx y dy dx x y dy dx x y
2
22 222 2 22 22 2
11 1 1 1 1
() () 3== = = = =
⎧⎫⎪⎪+= + = + ⎨⎬⎪⎪⎩⎭∫∫ ∫ ∫ ∫
x
xdx x x dx
62 42
1
1 1006
3 3 105=
⎛⎞=+ − − =⎜⎟⎝⎠∫


## Page 239

CHAPTER 9  Multiple Integrals228
The integration with respect to y (keeping x constant) from y = 1 to y = x 2 corresponds formally to sum-
ming in a vertical column (see Figure 9.6). The subsequent integration with respect to x from x = 1 to x = 2
corresponds to addition of contributions from all such vertical columns between x = 1 and x = 2.
Method 2: The double integral can also be expressed as the iterated integral
xyyx y y x y y
xx y dx dy x y dx dy xy dy
342 4 2 4 222 22 2
11 1
() () 3 === = = =
⎧⎫+= + = + ⎨⎬⎩⎭∫∫ ∫ ∫ ∫
x
xxx d x
62 42
1
1 1006
3 3 105=
⎛⎞=+ − − =⎜⎟⎝⎠∫
In this case the vertical column of region ℜ in Figure 9.6 is replaced by a horizontal column, as in Figure
9.7. Then the integration with respect to x (keeping y constant) from x = y  to x = 2 corresponds to summing
in this horizontal column. Subsequent integration with respect to y from y = 1 to y = 4 corresponds to addition
of contributions for all such horizontal columns between y = 1 and y = 4.
9.2. Find the volume of the region bounded by the elliptic paraboloid z = 4 – x 2 – 1
4
y2 and the plane z = 0.
Because of the symmetry of the elliptic paraboloid, the result can be obtained by multiplying the first
octant volume by 4.
Letting z = 0 yields 4x2 + y2 = 16. The limits of integration are determined from this equation. The required
volume is
x
x yx y dy dx y x y dx
2
2 24322 4 222 2
00 0 0
1144 4 4 1644 3
−
− ⎛⎞⎛⎞ −− = − − = Π⎜⎟⎜⎟⎝⎠ ⎝⎠∫∫ ∫
Hint: Use trigonometric substitutions to complete the integrations.
9.3. The geometric model of a material body is a plane region R bounded by y = x 2 and y = x22 −  on the
interval 0 < x <  1, and with a density function ρ = xy. (a) Draw the graph of the region. (b) Find the mass
of the body. (c) Find the coordinates of the center of mass.
(a) See Figure 9.8.
Figure 9.8
(b)
x
bf x
af x x
yM d yd x y x d yd x xd x
xxxxx x d x
2
2
2
2 21
2212 1
00
12461 24
0 0
2
17 (2 )22 8 12 24
ρ
−
− ⎡⎤== = ⎢⎥⎣⎦
⎡⎤=− − = − − = ⎢⎥⎣⎦
∫∫ ∫∫ ∫
∫
(c) The coordinates of the center of mass are defined to be
bf x bf x
af x af x
x x dy dx y y dy dxMM
22
11
() ()
() ()
11 andρρ== ∫∫ ∫∫


## Page 240

CHAPTER 9  Multiple Integrals 229
where
bf x
af x
Md y dx
2
1
()
()
ρ= ∫∫
Thus,
x
xx
x x
x
x
yM x x xy dy dx x dx x x x dx
xx x
My yx dy dx
2
2
2 2
2
2212 1 122 2 4
00 0
135 7
0
12 5
0
1[2 ]22
11 1 1 7
3 10 14 3 10 14 105
13 2 4120 15
−
−
−
⎡⎤== = − −⎢⎥⎣⎦
⎡⎤=− − = − − =⎢⎥⎣⎦
== − +
∫∫ ∫ ∫
∫∫
9.4. Find the volume of the region common to the intersecting cylinders x 2 + y2 = a2 and x2 + z2 = a2.
Required volume = 8 times volume of region shown in Figure 9.9
()
ax
ax
a
xy
a
xy
a
x
zdy dx
a x dy dx
aax d x
22
22
00
22
00
3
22
0
8
8
168 3
−
−
==
==
=
=
== −
=− =
∫∫
∫∫
∫
z dy dx
As an aid in setting up this integral, note that z dy dx corresponds to the volume of a column such as shown
darkly shaded in Figure 9.9. Keeping x constant and integrating with respect to y from y = 0 to y = ax22−
corresponds to adding the volumes of all such columns in a slab parallel to the yz plane, thus giving the volume
of this slab. Finally, integrating with respect to x from x = 0 to x = a corresponds to adding the volumes of all
such slabs in the region, thus giving the required volume.
9.5. Find the volume of the region bounded by z = x + y, z  = 6, x = 0, y = 0, z = 0.
Figure 9.9
 Figure 9.10
Required volume = volume of region shown in Figure 9.10
()
x
xy
x
x y
x
x y dy dx
xy y d x
xd x
66
00
66 2
0 0
6 2
0
{6 ( )}
1(6 ) 2
1 63 62
−
==
−
= =
=
=− +
=− −
=− =
∫∫
∫
∫


## Page 241

CHAPTER 9  Multiple Integrals230
In this case the volume of a typical column (shown darkly shaded) corresponds to {6 – (x + y)}dy dx. The
limits of integration are then obtained by integrating over the region ℜ of Figure 9.10. Keeping x constant and
integrating with respect to y from y = 0 to y = 6 – x (obtained from z = 6 and z = x + y) corresponds to summing
all columns in a slab parallel to the yz plane. Finally, integrating with respect to x from x = 0 to x = 6 corre-
sponds to adding the volumes of all such slabs and gives the required volume.
Transformation of double integrals
9.6. Justify Equation (9), Page 225, for changing variables in a double integral.
In rectangular coordinates, the double integral of F(x, y) over the region ℜ  (shaded in Figure 9.11) is
Fxy d x d y(( ,) .
ℜ
∫∫  We can also evaluate this double integral by considering a grid formed by a family of u
and υ curvilinear coordinate curves constructed on the region ℜ, as shown in Figure 9.11.
Figure 9.11
Let P be any point with coordinates (x, y) or (u, υ), where x = f (u, υ) and y = g(u, υ). Then the vector r
from O to p is given by r = xi + yj = f(u, υ)i + g(u, υ)j. The tangent vectors to the coordinate curves u = c1 and
υ = c2, where c1 and c2 are constants, are ∂r/∂υ  and ∂r/∂u, respectively. Then the area of region Δℜ of Figure
9.11 is given approximately by r uu
r .υυ
∂∂ ×Δ Δ∂∂
∂r ∂r
But
xy
rx y x yuu
xyuu u u
xy
ij k
r( , )0k k (, )
0
υυ
υυ
υυ
∂∂
∂∂ ∂∂ ∂∂∂×= = = ∂∂∂∂ ∂ ∂ ∂
∂∂ ∂∂
∂∂
∂r∂r
i kj
k k
so that
rx yuuuu
r( , )
(, )υυυυ
∂∂ ∂×Δ Δ = Δ Δ∂∂ ∂
∂r ∂r
The double integral is the limit of the sum
xyFfu g u uu
(,){( ,) ,( ,) } (, )υυ υ υ
∂ ΔΔ∂∑
taken over the entire region ℜ. An investigation reveals that this limit is
xyFfu g u d u du
(,){( ,) ,( ,) } (, )ℜ
υυ υ υ
∂= ∂∫∫


## Page 242

CHAPTER 9  Multiple Integrals 231
where ℜ /H11032 is the region in the uυ plane into which the region ℜ is mapped under the transformation x = f(u, υ),
y = g(u, υ).
Another method of justifying this method of change of variables makes use of line integrals and Green’s
theorem in the plane (see Problem 10.32).
9.7. If u = x2 – y2 and υ = 2xy, find ∂(u, υ) in terms of u and υ.
xy
xy
uu xyu xyyxxy
2222(, ) 4( )22(,)
υ
υυ
−∂ == = +∂
From the identity (x2 + y2)2 = (x2 – y2)2 + (2xy)2, we have
xy u xy u22 222 2 2 22() a n d υυ+= + + = +
Then, by Problem 6.43,
xy
uu x y xy u
22 22
(,) 1 1 1
(, ) (, ) / (, ) 4( ) 4υυ υ
∂ == =∂∂ ∂ + +
Another method: Solve the given equations for x and y in terms of u and υ and find the Jacobian directly.
9.8. Find the polar moment of inertia of the region in the xy plane bounded by x 2 – y2 = 1, x2 – y2 = 9, xy = 2, xy =
4, assuming unit density.
Under the transformation x 2 – y 2 = u, 2xy = υ, the required region ℜ in the xy plane, shaded in Figure
9.12(a), is mapped into region ℜ /H11032 of the uυ plane, shaded in Figure 9.12(b). Then:
u
xyx y dx dy x y du d u
du dud u d
u
22 22
9822
1422
(,)Required polar moment of inertia ( ) ( ) (, )
1 844
ℜ
υ
ℜ
υυ
υυυ
υ
′ℜ
==
′
∂=+ = + ∂
=+ = =
+
∫∫ ∫∫
∫∫ ∫ ∫
where we have used the results of Problem 9.7.
Figure 9.12
Note that the limits of integration for the region ℜ /H11032 can be constructed directly from the region ℜ in the
xy plane without actually constructing the region ℜ /H11032. In such case we use a grid, as in Problem 9.6. The coor-
dinates (u, υ) are curvilinear coordinates, in this case called hyperbolic coordinates.


## Page 243

CHAPTER 9  Multiple Integrals232
9.9 Evaluate x y dx dy22 ,
ℜ
+∫∫  where ℜ is the region in the xy plane bounded by x 2 + y2 = 4 and x2 + y2 = 9.
The presence of x2 + y2 suggests the use of polar coordinates (ρ, φ), where x = ρ cos φ, y = ρ sin φ (see
Problem 6.39). Under this transformation the region ℜ [Figure 9.13( a)] is mapped into the region ℜ /H11032 [Figure
9.13(b)].
Figure 9.13
Since xy(, ) ,(,) ρρφ
∂ =∂
 it follows that
xyx y dx dy x y d d d d22 22 (,)
(,) ρφ ρ ρ φρφ′′ℜℜ ℜ
∂+= + = ⋅ ∂∫∫ ∫∫ ∫∫
dd d d
323 2 232
202 0 0
19 38
33 3
ππ π
φρ φ φ
ρπρρ φ φ φ
== = =
== = =∫∫ ∫ ∫
We can also write the integration limits for ℜ /H11032 immediately on observing the region ℜ, since for fixed φ.
ρ varies from ρ = 2 to ρ = 3 within the sector shown dashed in Figure 9.13(a). An integration with respect to
φ from φ = 0 to φ = 2π then gives the contribution from all sectors. Geometrically, ρ dρ dφ represents the area
dA, as shown in Figure 9.13(a).
9.10. Find the area of the region in the xy plane bounded by the lemniscate ρ 2 = a2 cos 2φ.
Here the curve is given directly in polar coordinates (ρ, φ). By assigning various to φ and finding correspond-
ing values of ρ, we obtain the graph shown in Figure 9.14. The required area (making use of symmetry) is
a
a
dd d
ad a a
cos 23/4 c o s2 /4
00 0
0
/4 /422 2
00
44 2
2 cos2 sin 2
φ
πφ π
φρ φ
ρ
π π
φφ
ρρρφ φ
φφ φ
== =
=
==
=
== =
∫∫ ∫
∫


## Page 244

CHAPTER 9  Multiple Integrals 233
Figure 9.14
 Figure 9.15
Triple integrals
9.11. (a) Sketch the three-dimensional region ℜ bounded by x + y + z = a (a > 0), x = 0, y = 0, z = 0. (b) Give a
physical interpretation to
xyz d x d y d z222()
ℜ
++∫∫∫
(c) Evaluate the triple integral in (b).
(a) The required region ℜ is shown in Figure 9.15.
(b) Since x2 + y2 + z2 is the square of the distance from any point (x, y, z) to (0, 0, 0), we can consider the
triple integral as representing the polar moment of inertia (i.e., moment of inertia with respect to the ori-
gin) of the region ℜ (assuming unit density).
We can also consider the triple integral as representing the mass of the region if the density varies as
x2 + y2 + z2.
(c) The triple integral can be expressed as the iterated integral
aa x a x y
xy z
axy
aa x
xy
z
aa x
xy
ax
a
x
y
xyz d z d y d x
zx z y z dy dx
axyxax x y ax y y d y d x
x y ax y y axyxax y d x
xaxxax
222
00 0
3
22
00
0
3
22 2 3
00
22 3 4 4
2
0
0
22
22
()
3
()() () 3
() ( )() 23 4 1 2
()() 2
−− −
== =
−−
−
==
=
−
==
−
=
=
++
=+ +
⎧⎫ −−=− − + − − +⎨⎬
⎩⎭
−− −=− − + − −
−=− − +
∫∫∫
∫∫
∫∫
∫
a
a
ax ax ax dx
xax ax a dx
444
0
22 4 5
0
() () ()
34 1 2
() ()
26 2 0
⎧⎫ −−− −+⎨⎬
⎩⎭
⎧⎫ −−=+ =⎨⎬
⎩⎭
∫
∫
The integration with respect to z (keeping x and y constant) from z = 0 to z = a – x – y corresponds to
summing the polar moments of inertia (or masses) corresponding to each cube in a vertical column. The sub-
sequent integration with respect to y from y = 0 to y = a – x (keeping x constant) corresponds to addition of
contributions from all vertical columns contained in a slab parallel to the yz plane. Finally, integration with
respect to x from x = 0 to x = a adds up contributions from all slabs parallel to the yz plane.
Although this integration has been accomplished in the order z, y, x, any other order is is clearly possible
and the final answer should be the same.


## Page 245

CHAPTER 9  Multiple Integrals234
9.12. Find (a) the volume and (b) the centroid of the region ℜ bounded by the parabolic cylinder z = 4 – x 2 and the
planes x = 0, y = 6, z = 0, assuming the density to be a constant σ.
The region ℜ is shown in Figure 9.16.
Figure 9.16
(a)
x
xyz
xy
yx
x
dy dz
dz dy dx
xd y d x
xy d x
xd x
2264
000
26 2
00
2 26
00
2 2
0
Required volume = dx
(4 )
(4 )
(2 6 ) 32
−
===
==
==
=
=
=−
=−
=− =
∫∫∫
∫∫∫
∫∫
∫
∫
(b) Total mass
x
xyz
dz dy dx
2264
000
32σσ
−
===
==∫∫∫  by (a), since σ is constant. Then
xd zd yd xyzx
yd zd yd xxzy
zd zd ydxyz
2
2
264 - x
x=0 y=0 z=0
264 - x
x=0 y=0 z=0
Total moment about plane 24 3
Total mass Total mass 32 4
Total moment about plane 96 3Total mass Total mass 32
Total moment about plane
Total mass
σ
σ
σ σ
σ
σ
== = =
== = =
==
∫∫∫
∫∫∫
x
2264 - x
x=0 y=0 z=0 256 /5 8
Total mass 32 5
σ
σ==∫∫∫
Thus, the centroid has coordinates (3/4, 3, 8/5).
Note that the value for y  could have been predicted because of symmetry.
Transformation of triple integrals
9.13. Justify Equation (11), Page 225, for changing variables in a triple integral.
By analogy with Problem 9.6, we construct a grid of curvilinear coordinate surfaces which subdivide the
region ℜ into subregions, a typical one of which is Δℜ (see Figure 9.17).


## Page 246

CHAPTER 9  Multiple Integrals 235
Figure 9.17
The vector r from the origin O to point P is
r = xi + yj + zk = f (u, υ, w)i + g(u, υ, w)j + h(u, υ, w)k
assuming that the transformation equations are x = f (u, υ, w), y = g(u, υ, w), and z = h (u, υ, w).
Tangent vectors to the coordinate curves corresponding to the intersection of pairs of coordinate surfaces
are given by ∂r/∂u, ∂r/∂υ, ∂r/∂w. Then the volume of the region Δℜ of Figure 9.17 is given approximately by
xyzuw uwuw u w
rr r ( , , )
(, , )υυυυ
∂∂ ∂ ∂⋅ × ΔΔ Δ = ΔΔ Δ∂∂ ∂ ∂
∂r∂r∂r
The triple integral of F(x, y, z) over the region is the limit of the sum
xyzFfu w g u wh u w u wuw
(,,){( , , ) ,( ,, ) ,( ,, ) } (, , )υυυ υ υ
∂ ΔΔΔ∂∑
An investigation reveals that this limit is
xyzF f uw g uw h uw d u d d w uw
(,,){( ,, ) ,( ,, ) ,( ,, ) } (, , )υυυ υ υ
∂
∂∫∫∫
where ℜ /H11032 is the region in the uυw space into which the region ℜ is mapped under the transformation.
Another method for justifying this change of variables in triple integrals makes use of Stokes’s theorem
(see Problem 10.84).
9.14. What is the mass of a circular cylindrical body represented by the region 0 < ρ < c, 0 < φ <  2π, 0 < z <
h, and with the density function μ = z sin2 φ?
hc
Mz d d d z
2 2
00 0
sin
π
φρ ρ φ π==∫∫ ∫
9.15. Use spherical coordinates to calculate the volume of a sphere of radius a.
a
V a dr d d a
/2 /2 23
00 0
48s in 3
ππ
θθ φπ== ∫∫ ∫
9.16. Express F x y z dx dy dz(, , )
′ℜ
∫∫∫  in (a) cylindrical and (b) spherical coordinates.
(a) The transformation equations in cylindrical coordinates are x = ρ cos φ, y = ρ sin φ, z = z.
As in Problem 6.39, ∂(x, y, z)/∂(ρ, φ, z) = ρ. Then, by Problem 9.13, the triple integral becomes
Gz d d d z(,,)ρφ ρ ρ φ
′ℜ
∫∫∫
where ℜ /H11032 is the region in the ρ, φ, z space corresponding to ℜ and where G(ρ, φ, z ≡ F(ρ cos φ, ρ sin φ, z).


## Page 247

CHAPTER 9  Multiple Integrals236
(b) The transformation equations in spherical coordinates are x = r sin θ cos φ, y = r sin θ sin φ, z = r cos θ.
By Problem 6.101, ∂(x, y, z)/∂(r, θ, φ) = r2 sin θ. Then, by Problem 9.13, the triple integral becomes
Hr r d rd d2(, , ) s i nθφ θ θ φ
′ℜ
∫∫∫
where ℜ /H11032 is the region in the r, θ, φ space corresponding to ℜ, and where H(r, θ, φ) ≡ F(r sin θ cos φ,
r sin θ sin φ, r cos θ).
9.17. Find the volume of the region above the xy plane bounded by the paraboloid z = x2 + y2 and the cylinder x2 + y2 = a2.
The volume is most easily found by using cylindrical coordinates. In these coordinates the equations for
the paraboloid and cylinder are, respectively, z = ρ2 and ρ = a. Then
Required volume = 4 times volume shown in Figure 9.18
a
z
a
a
hi
dz d d
dd
da
2/2
00 0
/2 3
00
4/2 4
0
0
=4
4
4 42
πρ
φρ
π
φρ
π
ρρ φ
ρρ φ
ρπ φ
== =
==
=
=
=
==
∫∫∫
∫∫
∫
Figure 9.18
The integration with respect to z (keeping ρ and φ constant) from z = 0 to z = ρ2 corresponds to summing
the cubical volumes (indicated by dV) in a vertical column extending from the xy plane to the paraboloid. The
subsequent integration with respect to ρ (keeping φ constant) from ρ = 0 to ρ = a corresponds to addition of
volumes of all columns in the wedge-shaped region. Finally, integration with respect to φ corresponds to add-
ing volumes of all such wedge-shaped regions.
The integration can also be performed in other orders to yield the same result.
We can also set up the integral by determining the region ℜ
/H11032 in ρ, φ, z space into which ℜ is mapped by
the cylindrical coordinate transformation.
9.18. (a) Find the moment of inertia about the z axis of the region in Problem 9.17, assuming that the density is
the constant σ. (b) Find the radius of gyration.
(a) The moment of inertia about the z axis is
a
z z
I
2
0
/2 2
00
4
πρ
φρ
ρ
==
= ∫∫∫ dz d dσρ ρ φ
a
a add d
66/2 /25
00 0
0
44 63
ππ
φρ φ
ρ
ρπ σσρ ρ φ σ φ
== =
=
== = ∫∫ ∫


## Page 248

CHAPTER 9  Multiple Integrals 237
The result can be expressed in terms of the mass M of the region, since, by Problem 9.17,
Ma 4volume desnity so 2
π σ=×= z
aa MIM aa
66
2
4
22that 33 3
πσ π
π== ⋅ =
Note that in setting up the integral for Iz we can think of σρ  dz dρ dφ dz dρ dφ as being the mass of the
cubical volume element, ρ2σρ  dz dρ dφ as the moment of inertia of this mass with respect to the z axis, and
2ρ
′ℜ
∫∫∫ dz d dσρ ρ φ  as the total moment of inertia about the z axis. The limits of integration are determined
as in Problem 9.17.
(b) The radius of gyration is the value K such that MK 2 = 2
3 Ma2; i.e., K2 = 2
3 a2 or K = a 2/3 .
The physical significance of K is that if all the mass M were concentrated in a thin cylindrical shell of
radius K, then the moment of inertia of this shell about the axis of the cylinder would be Iz.
9.19. (a) Find the volume of the region bounded above by the sphere x 2 + y2 + z2 = a2 and below by the cone z2
sin2 α = (x 2 + y2) cos2 α, where α is a constant such that 0 < α < π. (b) From the result in (a), find the
volume of a sphere of radius a.
In spherical coordinates the equation of the sphere is r = a and that of the cone is θ = α. This can be seen
directly or by using the transformation equations x = r sin θ cos φ, y = r sin θ sin φ, z = r cos θ. For example,
z2 sin2 α = (x 2 + y2) cos 2 α becomes, on using these equations, r 2 cos2 θ sin2 α = (r 2 sin2 θ cos2 φ + r2 sin2 θ
sin2 φ) cos2 α, i.e., r 2 cos2 θ sin2 α = r 2 sin2 θ cos2 α, from which tan θ = ± tan α and so θ = α or θ = π – α. It
is sufficient to consider one of these—say, θ = α.
Figure 9.19
(a) Required volume = 4 times volume (shaded) in Figure 9.19
r
r
rd r d d
r dd
a dd
a d
a
2/2 2
00 0
3/2
00
0
3 /2
00
3 /2
00
3
=4 s i n
4s i n 3
4 sin3
4 cos3
2 (1 cos )3
παρ
φθ
α
πα
φθ
πα
φθ
π α
θφ
θθ φ
θθ φ
θθφ
θφ
π α
== =
==
=
==
==
=
=
=−
=−
∫∫∫
∫∫
∫∫
∫


## Page 249

CHAPTER 9  Multiple Integrals238
The integration with respect to r (keeping θ and φ constant) from r = 0 to r = a corresponds to summing
the volumes of all cubical elements (such as indicated by dV) in a column extending from r = 0 to r = a. The
subsequent integration with respect to θ (keeping φ constant) from θ = 0 to θ = π/4 corresponds to summing
the volumes of all columns in the wedge-shaped region. Finally, integration with respect to φ corresponds to
adding volumes of all such wedge-shaped regions.
(b) Letting α = π, the volume of the sphere thus obtained is
a a
3
324 (1 cos )33
π ππ−=
9.20. (a) Find the centroid of the region in Problem 9.19. (b) Use the result in (a) to find the centroid of a
hemisphere.
(a) The centroid (
x , y , z ) is, due to symmetry, given by x  = y  = 0 and
zd Vxyz
dV
Total moment about plane
Total mass
σ
σ
== ∫∫∫
∫∫∫
Since z = r cos θ and σ is constant, the numerator is
a
r
r
a
rr r d r dd dd
ad d
sin aad
2 4/2 /2 2
00 0 00
0
/24
00
24 2/24
0
0
4 cos sin 4 sin cos4
sin cos
sin
24
παρ πα
φθ φθ
πα
φθ
π
φ
θ
σθ θ θ φ σ θ θ θ φ
σθ θ θ φ
θπ σ ασφ
== = ==
=
==
=
=
⋅=
=
==
∫∫∫ ∫∫
∫∫
∫
The denominator, obtained by multiplying the result of Problem 9.19(a) by σ, is 2
3 πσa 3 (1 – cos α ).
Then
a
za
a
42
3
1 sin 34 (1 cos ).2 8(1 cos )3
πσ α
α
πσ α
== +
−
(b) Letting α = π/2, z  = 3
8
a.
Miscellaneous problems
9.21. Prove that (a) xy dy dx
xy
11
300
1
2()
⎧⎫ − =⎨⎬ +⎩⎭∫∫ and (b) xy dx dy
xy
11
300
1 ,2()
⎧⎫ − =−⎨⎬ +⎩⎭∫∫
(a)
y
xy x xydy dx dy dxxy xy
x dy dxxy xy
x dxxyxy
dx
xxy
11 11
3300 00
11
3200
1
1
20
0
1
1
20
0
2( )
() ()
21
() ()
1
()
11
12()
=
⎧⎫ ⎧ ⎫ −− +=⎨⎬ ⎨ ⎬++⎩⎭ ⎩ ⎭
⎧⎫ ⎛⎞⎪⎪=− ⎨⎬ ⎜⎟ ++⎪⎪ ⎝⎠⎩⎭
⎛⎞ −=− ⎜⎟ ++⎝⎠
−=− = ++
∫∫ ∫∫
∫∫
∫
∫
⎛
⎜⎝
dy
⎛
⎜⎝


## Page 250

CHAPTER 9  Multiple Integrals 239
(b) This follows at once on formally interchanging x and y in (a) to obtain
xy xydx dy dx dyxy xy
11
33 00
1, 2() ()ℜ
⎧⎫−− =−⎨⎬++ ⎩⎭∫∫ ∫ ∫  and then multiplying both sides by –1.
This example shows that interchange in order of integration may not always produce equal results. A suf-
ficient condition under which the order may be interchanged is that the double integral over the corresponding
region exists. In this case xy dx dyxy 3 ,()ℜ
−
+∫∫  where ℜ is the region 0 < x <  1, 0 < y <  1, fails to exist be-
cause of the discontinuity of the integrand at the origin. The integral is actually an improper double integral
(see Chapter 12).
9.22. Prove that F u du dt x u F u d u
txx
() ( ) ()
000 ∫∫∫{} =−
Let I x F u du dt J x x u F u du
txz
() () , () ( ) ()= {} =−∫ ∫000 ∫ ∫
∫∫′ = ′ =
.
() () , () ()
Then
I x Fud u J x Fud u
zz
00
using Leibniz’s rule, Page 198. Thus, I/H11032(x) = J/H11032(x), and so I(x) = J(x) = c, where c is a constant. Since I(0) =
J(0) = 0, c = 0, and so I(x) = J(x).
The result is sometimes written in the form
xx x
F x dx x u F u du2
00 0
() ( ) () =−∫∫ ∫
The result can be generalized to give (see Problem 9.58)
xx x xnnF x dx x u F u dun
1
00 0 0
1() ( ) ()(1 ) !
−=− −∫∫ ∫ ∫LL
SUPPLEMENTARY PROBLEMS
Double integrals
9.23. (a) Sketch the region ℜ in the xy plane bounded by y 2 = 2x and y = x. (b) Find the area of ℜ. (c) Find the
polar moment of inertia of ℜ, assuming constant density σ.
Ans. (b) 2
3
 (c) 48σ/35 = 72M/35, where M is the mass of ℜ
9.24. Find the centroid of the region in problem 9.23.
Ans. xy 4 ,15==
9.25. Given
y
yx
x y dx dy
34
01
()
−
==
+∫∫ , (a) sketch the region and give a possible physical interpretation of the double
integral, (b) interchange the order of integration, and (c) evaluate the double integral.
Ans. (b)
x
xy
x y dy dx
224
11
()
−
==
+∫∫  (c) 241/60
9.26. Show that
x
xy x
2
1==∫∫ sin x
y2
π
xy x
dx
42
2==
+ ∫∫ sin x
y2
π dyd x 3
4( 2) .π
π
+=
9.27. Find the volume of the tetrahedron bounded by x/a + y/b + z/c = 1 and the coordinate planes.
Ans. abc/6
9.28. Find the volume of the region bounded by z = x 3 + y2, z = 0, x = –a, x = –a, y = –a, y = a.
Ans. 8a4/3


## Page 251

CHAPTER 9  Multiple Integrals240
9.29. Find (a) the moment of inertia about the z axis and (b) the centroid of the region in Problem 9.28, assuming
a constant density σ.
Ans. (a) aM a M62112 14 ,w h e r e m a s s45 15σ= =  (b) xy z a 270, 15== =
Transformation of double integrals
9.30. Evaluate x y dx dy22 ,
ℜ
+∫∫  where ℜ is the region x 2 + y2 < a2.
Ans. 2
3
πa3
9.31. If ℜ is the region of Problem 9.30, evaluate xyed x d y
22() .−+
ℜ
∫∫
Ans. ae
2
(l )π −−
9.32. By using the transformation x + y = u, y = uυ, show that
x yxy
xy
eed y d x
11 /( )
00
1
2
− +
==
−=∫∫ .
9.33. Find the area of the region bounded by xy = 4, xy = 8, xy 3 = 5, xy3 = 15. (Hint: Let xy = u, xy3 = υ.)
Ans. 2 ln 3
9.34. Show that the volume generated by revolving the region in the first quadrant bounded by the parabolas y 2 = x,
y2 = 8x, x2 = y, x2 = 8y about the x axis is 279π/2. (Hint: Let y2 = ux, x2 = υy.)
9.35. Find the area of the region in the first quadrant bounded by y = x 3, y = 4x3, x = y3, x = 4y3.
Ans. 1
8
9.36. Let ℜ be the region bounded by x + y = 1, x = 0, y = 0. Show that xy dx dyxy
sin1cos .2ℜ
⎛⎞ − =⎜⎟ +⎝⎠∫∫  (Hint: Let
x – y = u, x + y = υ.)
Triple integrals
9.37. (a) Evaluate
xyz x y
xyz dz dy dx22
112
00
.
=== +∫∫∫ (b) Give a physical interpretation to the integral in (a).
Ans. (a) 3
8
9.38. Find (a) the volume and (b) the centroid of the region in the first octant bounded by x/a + y/b + z/c = 1,
where a, b, c are positive.
Ans. (a) abc/6 (b) x  = a/4, y  = b/4, z  = c/4
9.39. Find (a) the moment of inertia and (b) the radius of gyration about the z axis of the region in Problem 9.38.
Ans. (a) M(a2 + b2)/10 (b) ab( 2 + 2)/10
9.40. Find the mass of the region corresponding to x2 + y2 + z2 <  4, x ε 0, y ε 0, z ε 0, if the density is equal to
xyz.
Ans. 4/3
9.41. Find the volume of the region bounded by z = x2 + y2 and z = 2x.
Ans. π/2


## Page 252

CHAPTER 9  Multiple Integrals 241
Transformation of triple integrals
9.42. Find the volume of the region bounded by z = 4 – x 2 – y2 and the xy plane.
Ans. 8π
9.43. Find the centroid of the region in Problem 9.42, assuming constant density σ.
Ans. xy z 40, 3== =
9.44. (a) Evaluate xyz d x d y d z222 ,
ℜ
++∫∫∫ ∫  where ℜ is the region bounded by the plane z = 3 and the cone
z = zx y 22 .=+  (b) Give a physical interpretation of the integral in (a). (Hint: Perform the integration in
cylindrical coordinates in the order ρ, z, φ.)
Ans. 27π(2 2  – 1)/2
9.45. Show that the volume of the region bonded by the cone zx y 22=+  and the paraboloid z = x2 + y2 is π/6.
9.46. Find the moment of inertia of a right circular cylinder of radius a and height b, about its axis if the density is
proportional to the distance from the axis.
Ans. 3
5
Ma2
9.47. (a) Evaluate dx dy dz
xyz222 3 2 ,()ℜ ++∫∫∫  where ℜ is the region bounded by the spheres x 2 + y2 + z2 = a2 and
x2 + y2 + z2 = b2 where a > b > 0. (b) Give a physical interpretation of the integral in (a).
Ans. (a) 4π ln(a/b)
9.48. (a) Find the volume of the region bounded above by the sphere r = 2a cos θ and below by the cone φ = α,
where 0 < α < π/2. (b) Discuss the case α = + π/2.
Ans. 4
3
πa3(1 – cos4 α)
9.49. Find the centroid of a hemispherical shell having outer radius a and inner radius b if the density (a) is
constant and (b) varies as the square of the distance from the base. Discuss the case a = b.
Ans. Taking the z axis as the axis of symmetry: (a) x  = y  = 0, z  = 3
8
(a4 – b 4)/(a3 – b 3)
(b) x  = y  = 0, z  = 5
8
(a6 – b6)/(a5 – b5)
Miscellaneous problems
9.50. Find the mass of a right circular cylinder of radius a and height b if the density varies as the square of the
distance from a point on the circumference of the base.
Ans. 1
6
πa2 bk(9a2 + 2b2), where k = constant of proportionality
9.51. Find (a) the volume and (b) the centroid of the region bounded above by the sphere x 2 + y2 + z2 = a2 and
below by the plane z = b where a > b > 0, assuming constant density.
Ans. (a) 1
3
π(2a3 – 3a2b + b3) (b) x  = y  = 0, z  = 3
4
(a + b)2/(2a + b)
9.52. A sphere of radius a has a cylindrical hole of radius b bored from it, the axis of the cylinder coinciding with
a diameter of the sphere. Show that the volume of the sphere which remains is 4
3
π[a3 – (a2 – b2)3/2].


## Page 253

CHAPTER 9  Multiple Integrals242
9.53. A simple closed curve in a plane is revolved about an axis in the plane which does not intersect the curve.
Prove that the volume generated is equal to the area bounded by the curve multiplied by the distance traveled
by the centroid of the area (Pappus’s theorem).
9.54. Use Problem 9.53 to find the volume generated by revolving the circle x 2 + (y – b)2 = a2, b > a > 0 about the
x axis.
Ans. 2π2 a2b
9.55. Find the volume of the region bounded by the hyperbolic cylinders xy = 1, xy = 9, xz = 4, xz = 36, yz = 25,
yz = 49. (Hint: Let xy = u, xz = υ, yz = w.)
Ans. 64
9.56 Evaluate x a y b z c dx dy dz22 22 221( / / / )
ℜ
−+ +∫∫∫  where ℜ is the region interior to the ellipsoid x 2/a2 +
y2/b2 + z2 /c2 = 1. (Hint: Let x = au, y = bυ, z = cw. Then use spherical coordinates.)
Ans.
1
4 π2 abc
9.57. If ℜ is the region x 2 + xy + y2 <  1, prove that xx y yed x d y e
e
22() 2 (1 ) .
3
π−+ +
ℜ
=−∫∫  (Hint: Let x = u cos α – υ
sin α, y = u sin α + υ cos α and choose α so as to eliminate the xy term in the integrand. Then let u = aρ cos
φ, υ = bρ sin φ where a and b are appropriately chosen.)
9.58. Prove that
xx x xnnF x dx x u F u du nn
1
00 0 0
1( ) ( ) ( ) for 1,2,3,... (see problem 9.22).(1 ) !
−=− = −∫∫ ∫ ∫L. . . 1, 2, 3, . . . (see problem 9.22).


## Page 254

243
CHAPTER 10
Line Integrals,
Surface Integrals, and
Integral Theorems
Construction of mathematical models of physical phenomena requires functional domains of greater com-
plexity than the previously employed line segments and plane regions. This section makes progress in meet-
ing that need by enriching integral theory with the introduction of segments of curves and portions of surfaces
as domains. Thus, single integrals as functions defined on curve segments take on new meaning and are then
called line integrals. Stokes’s theorem exhibits a striking relation between the line integral of a function on
a closed curve and the double integral of the surface portion that is enclosed. The divergence theorem relates
the triple integral of a function on a three-dimensional region of space to its double integral on the bounding
surface. The elegant language of vectors best describes these concepts; therefore, it would be useful to reread
the introduction to Chapter 7, where the importance of vectors is emphasized. (The integral theorems also
are expressed in coordinate form.)
Line Integrals
The objective of this section is to geometrically view the domain of a vector or scalar function as a segment
of a curve. Since the curve is defined on an interval of real numbers, it is possible to refer the function to this
primitive domain, but to do so would suppress much geometric insight.
A curve C in three-dimensional space may be represented by parametric equations:
 x  = f1(t), y = f2(t), z = f3(t), a < t < b (1)
or in vector notation:
 x  = r(t) (2)
where
r(t) = xi + yj + zk
(see Figure 10.1).


## Page 255

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems244
Figure 10.1
For this discussion it is assumed that r is continuously differentiable. While (as we are doing) it is con-
venient to refer the Euclidean space to a rectangular Cartesian coordinate system, it is not necessary. (For
example, cylindrical and spherical coordinates sometimes are more useful.) In fact, one of the objectives of
the vector language is to free us from any particular frame of reference. Then, a vector A[x(t), y(t, z(t)] or a
scalar Θ is pictured on the domain C, which, according to the parametric representation, is referred to the
real number interval a
< t < b.
The integral
C∫ A · dr (3)
of a vector field A defined on a curve segment C is called a line integral. The integrand has the representa-
tion
A1 dx + A2 dy + A3 dz
obtained by expanding the dot product.
The scalar and vector integrals
n
kkk kC n k
td t t
1
( ) lim ( , , ) ξηζ
→∞ =
Θ= Θ Δ ∑∫  (4)
n
kkkC n k
td t
1
( ) lim ( , , ) ξηζ
→∞ =
= ∑∫ AAA A ktΔ  (5)
can be interpreted as line integrals; however, they do not play a major role [except for the fact that the scalar
integral (3) takes the form (4)].
The following three basic ways are used to evaluate the line integral (3):
1. The parametric equations are used to express the integrand through the parameter t. Then
t
Ct
d dtdt1
r2
⋅= ⋅∫∫Ad r Adr A dr
2. If the curve C is a plane curve (for example, in the xy plane) and has one of the representations y = f (x)
or x = g (y), then the two integrals that arise are evaluated with respect to x or y , whichever is more
convenient.
3. If the integrand is a perfect differential, then it may be evaluated through knowledge of the endpoints
(that is, without reference to any particular joining curve). (See the section on independence of path on
Page 246; also see Page 251.)
These techniques are further illustrated for plane curves in the next section and for three-space in the prob-
lems.


## Page 256

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 245
Evaluation of Line Integrals for Plane Curves
If the equation of a curve C in the plane z = 0 is given as y = f(x), the line integral (2) is evaluated by placing
y = f (x), dy = f´(x) dx in the integrand to obtain the definite integral
a
a
P xfx d x Q xfx f x d x
2
1
{, () } {, () } () ′+∫  (6)
which is then evaluated in the usual manner.
Similarly, if C is given as x = g,(y), then dx = g/H11032 (y)dy and the line integral becomes
b
b
P g yy g y d y Q g yy d y
2
1
{() , } () {() , }′ +∫  (7)
If C is given in parametric form x = φ(t), y = ψ(t), the line integral becomes
t
t
P t t t dt Q t t t dt
2
1
{ () , () } () { () , () } , ()φψ φ φψ ψ ′′ +∫  (8)
where t1 and t2 denote the values of t corresponding to points A and B, respectively.
Combinations of these methods may be used in the evaluation. If the integrand A · dr is a perfect differ-
ential dΘ, then
cd
Ca b
dd c d a b
(, )
(, )
r( , ) ( , )⋅= Θ = Θ − Θ∫∫A dr  (9)
Similar methods are used for evaluating line integrals along space curves.
Properties of Line Integrals Expressed for Plane Curves
Line integrals have properties which are analogous to those of ordinary integrals. For example:
1.
CC C
Px yd x Qx yd y Px yd x Qx yd y(, ) (, ) (, ) (, )+= +∫∫ ∫
2.
ab ab
ab ab
P dx Q dy P dx q dy
22 1 1
11 2 2
(, ) (, )
(, ) (, )
+= − +∫∫
Thus, reversal of the path of integration changes the sign of the line integral.
3.
ab
ab
22
11
(, )
(, )∫
ab ab
ab ab
Pd x Qd y Pd x Qd y Pd x Qd y
33 22
11 33
(, ) (, )
(, ) (, )
+= + + + ∫∫
where (a3, b3) is another point on C.
Similar properties hold for line integrals in space.
Simple Closed Curves, Simply and Multiply Connected Regions
A simple closed curve is a closed curve which does not intersect itself anywhere. Mathematically, a curve in the
xy plane is defined by the parametric equations x = φ(t), y = ψ (t) where φ and ψ  are single-valued and continuous
in an interval t1 < t < t2. If φ(t1) = φ(t2) and ψ(t1) = ψ(t2), the curve is said to be closed. If φ(u) = φ(υ) and ψ(u) =
ψ (υ) only when u = υ (except in the special case where u = t1 and υ = t2), the curve is closed and does not intersect
itself, and so is a simple closed curve. We shall also as-
sume, unless otherwise stated, that φ and ψ are piecewise
differentiable in t1 < t < t2.
If a plane region has the property that any closed
curve in it can be continuously shrunk to a point with-
out leaving the region, then the region is called simple
connected; otherwise, it is called multiply connected
(see Figure 10.2 and Page 127).
Multiple connectedSimple closed curve
Positive
orientation
Figure 10.2


## Page 257

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems246
As the parameter t varies from t 1 to t 2, the plane curve is described in a certain sense or direction. For
curves in the xy plane, we arbitrarily describe this direction as positive or negative according as a person
traversing the curve in this direction with his head pointing in the positive z direction has the region enclosed
by the curve always toward his left or right, respectively. If we look down upon a simple closed curve in the
xy plane, this amounts to saying that traversal of the curve in the counterclockwise direction is taken as
positive, while traversal in the clockwise direction is taken as negative.
Green’s Theorem in the Plane
This theorem is needed to prove Stokes’s theorem (Page 251). Then it becomes a special case of that
theorem.
Let P, Q, ∂P/∂y, ∂Q/∂x be single-valued and continuous in a simple connected region ℜ bounded by a
simple closed curve C. Then
C
QPP dx Q dy dx dyxyℜ
⎛⎞∂∂+= − ⎜⎟∂∂⎝⎠∫∫ ∫ÑC∫/H17034  (10)
where
C∫/H17034 is used to emphasize that C is closed and that it is described in the positive direction.
This theorem is also true for regions bounded by two or more closed curves (i.e., multiply connected re-
gions). See Problem 10.10.
Conditions for a Line Integral to Be Independent of the Path
The line integral of a vector field A is independent of path if its value is the same regardless of the (allowable)
path from initial to terminal point. (Thus, the integral is evaluated from knowledge of the coordinates of these
two points.)
For example, the integral of the vector field A = yi + xj is independent of path since
xy
CC x y
dy d x x d y d x y x y x y
22
11
22 1 1()⋅= + = = −∫∫ ∫Ar
Thus, the value of the integral is obtained without reference to the curve joining P1 and P2.
This notion of the independence of path of line integrals of certain vector fields, important to theory and
application, is characterized by the following three theorems.
Theorem 1 A necessary and sufficient condition that
C
d⋅∫ Ar  be independent of path is that there exists
a scalar function Θ such that A = ∇Θ.
Theorem 2 A necessary and sufficient condition that the line integral
C
d⋅∫ Ar  be independent of path is
that ∇ × A = 0.
Theorem 3 If ∇  × A = 0, then the line integral of A over an allowable closed path is 0; i.e.,
C∫/H17034A · dr = 0.
If C is a plane curve, then Theorem 3 follows immediately from Green’s theorem, since in the plane case
∇ × A reduces to
AA
yx
12∂∂ =∂∂
EXAMPLE. Newton’s second law for forces is dm
dt
() ,= vF  where m is the mass of an object and v is its
velocity.
When F has the representation F = –∇Θ, it is said to be conservative. The previous theorems tell us that the
integrals of conservative fields of force are independent of path. Furthermore, showing that ∇ × F = 0 is the
preferred way of showing that F is conservative, since it involves differentiation, while demonstrating that
Θ exists such that F = –∇Θ requires integration.


## Page 258

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 247
Surface Integrals
Our previous double integrals have been related to a very special surface, the plane. Now we consider other
surfaces. yet, the approach is quite similar. Surfaces can be viewed intrinsically, i.e., as non-Euclidean spaces:
however, we do not do that. Rather, the surface is thought of as embedded in a three-dimensional Euclidean
space and expressed through a two-parameter vector representation:
x = r(υ1, υ2)
While the purpose of the vector representation is to be general (that is, interpretable through any allow-
able three-space coordinate system), it is convenient to initially think in terms of rectangular Cartesian co-
ordinates: therefore, assume
r = xi + yj + zk
and that there is a parametric representation
 x  = r(υ1, υ2), y = r(υ1, υ2), z = r(υ1, υ2) (11)
The functions are assumed to be continuously differentiable.
The parameter curves υ 2 = const and υ 1 const establish a coordinate system on the surface (just as
y = const and x = const form such a system in the plane). The key to establishing the surface integral of a
function is the differential element of surface area. (For the plane, that element is dA = dx, dy.)
At any point P of the surface
dd d 12
12
υυυυ
∂∂=+∂∂
rrx
spans the tangent plane to the surface. In particular, the directions of the coordinate curves υ2 = const and υ1
= const are designated by dd d d11 2 2
12
,andυυυυ
∂∂= ∂∂
rrxx  respectively (see Figure 10.3).
The cross product
dx d dd12 1 2
12
υυυυ
∂∂=×∂∂
rrxx
is normal to the tangent plane at P, and its magnitude
12υυ
∂∂ ×∂∂
rr  is the area of a differential coordinate
parallelogram.
Figure 10.3
(This is the usual geometric interpreation of the cross product abstracted to the differential level.) This
strongly suggests the following definition:
Definition The differential element of surface area is
dS d d12
12
υυυυ
∂∂=×∂∂
rr  (12)
For a function Θ(υ 1, υ2) that is everywhere integrable on S,


## Page 259

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems248
SS
dS d d12 1 2
12
(, )υυ υ υ υυ
∂∂Θ=Θ × ∂∂∫∫ ∫∫
rr  (13)
is the surface integral of the function Θ.
In general, the surface integral must be referred to three-space coordinates to be evaluated. If the surface
has the Cartesian representation z = f (x, y) and the identifications
υ1 = x, υ2 = y, z = f (υ, υ2)
are made, then
zz
xy1
+υυ
∂∂ ∂ ∂== +∂∂ ∂ ∂ 2
rr ik , jk
and
zz
xx22υυ
∂∂ ∂ ∂×= − −∂∂ ∂ ∂
rr kji
Therefore,
zz
xy
1/222
12
1υυ
⎡⎤ ⎛⎞∂∂ ∂ ∂ ⎛⎞×= + + ⎢⎥ ⎜⎟⎜⎟∂∂ ∂ ∂ ⎝⎠⎢⎥ ⎝⎠⎣⎦
rr
Thus, the surface integral of Θ has the special representation
S
zzS x y z dx dyxy
1/222
(,,)1
⎡⎤ ⎛⎞∂∂⎛⎞=Θ + + ⎢⎥ ⎜⎟⎜⎟∂∂⎝⎠⎢⎥ ⎝⎠⎣⎦
∫∫  (14)
If the surface is given in the implicit form F(x, y, z) = 0, then the gradient may be employed to obtain
another representation. To establish it, recall that, at any surface point P,  the gradient ∇F is perpendicular
(normal) to the tangent plane (and, hence, to S).
Therefore, the following equality of the unit vectors holds (up to sign):
F
xyF 12|| υυ
∇ ⎛⎞∂∂ ∂ ∂=± × ×⎜⎟∂∂ ∂ ∂∇ ⎝⎠
rr r r  (15)
[A conclusion of the theory of implicit functions is that from F(x, y, z) = 0 (and under appropriate condi-
tions) there can be produced an explicit representation z = f(x, y) of a portion of the surface. This is an exist-
ence statement. The theorem does not say that this representation can be explicitly produced.] With this fact
in hand, we again let υ1 = x, υ2 = y, z = f (υ1, υ2). Then
∇F = F xi + fyj + Fzk
Taking the dot product of both sides of Equation (15), K yields
zF
F
12
1
||
υυ
=±∇ ∂∂ ×∂∂
rr
The ambiguity of sign can be eliminated by taking the absolute value of both sides of the equation.
Then
xyz
zz
FFFF
FF
222 1 / 2
12
[ ( )( )( ) ]||
|| ||υυ
++∂∂ ∇×= =∂∂
rr
and the surface integral of Θ takes the form
xyz
zS
FFF dx dyF
222 1 / 2[ ( )( )( ) ]
||
++
∫∫  (16)
The formulas (14) and (16) also can be introduced in the following nonvectorial manner.


## Page 260

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 249
Let S be a two-sided surface having projection ℜ on the xy plane, as in Figure 10.4. Assume that an equa-
tion for S is z = f (x, y), where f is single-valued and continuous for all x and y in ℜ. Divide ℜ into n subre-
gions of area ΔA p, p = 1, 2, . . . , n, and erect a vertical column on each of these subregions to intersect S in
an area ΔSp.
Figure 10.4
Let φ(x, y, z) be single-valued and continuous at all points of S. Form the sum
n
ppp p
p
S
1
(, , )φξ η ζ
=
Δ∑  (17)
where (ξp, ηp, ζp) is some point of ΔS p. If the limit of this sum as n → /H11009 in such a way that each ΔSp → 0
exists, the resulting limit is called the surface integral of φ(x, y, z) over S and is designated by
S
xyz d S(, , )φ∫∫  (18)
Since ΔSp = ⎜sec γp⎜Δ Ap approximately, where γp is the angle between the normal line to S and the positive
z axis, the limit of the sum (17) can be written
xyz d A(, , ) | s e c |
ℜ
φγ∫∫  (19)
The quantity ⎜sec γ⎜ is given by
p
zz
xy
22
1|s e c | 1||γ ⎛⎞∂∂⎛⎞== + + ⎜⎟⎜⎟⋅∂ ∂ ⎝⎠ ⎝⎠nk
 (20)
Then, assuming that z = f(x, y) has continuous (or sectionally continuous) derivatives in ℜ, (19) can be writ-
ten in rectangular form as
zzxyz d x d yxy
22
(, , ) 1
ℜ
φ ⎛⎞∂∂⎛⎞++ ⎜⎟⎜⎟∂∂⎝⎠ ⎝⎠∫∫  (21)
In case the equation for S is given as F(x, y, z) = 0, (21) can also be written
xyz
z
FFF
xyz d x d yF
222() () ()
(, , ) ||ℜ
φ
++
∫∫  (22)
The results (21) or (22) can be used to evaluate (18).
In the preceding we have assumed that S is such that any line parallel to the z axis intersects S in only one
point. In case S is not of this type, we can usually subdivide S into surfaces S1, S2, . . . which are of this type.
Then the surface integral over S is defined as the sum of the surface integrals over S1, S2, . . . .


## Page 261

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems250
The results stated hold when S  is projected onto a region ℜ  on the xy plane. In some cases it is better
to project S onto the yz or xz planes. For such cases, (18) can be evaluated by appropriately modifying (21)
and (22).
The Divergence Theorem
The divergence theorem establishes equality between a triple integral (volume integral) of a function over a
region of three-dimensional space and the double integral of the function over the surface that bounds that
region. This relation is very important in the expression of physical theory. (See Figure 10.5.)
Divergence (or Gauss) Theorem
Let A be a vector field that is continuously differentiable on a closed-space region V bounded by a smooth
surface S. Then
VS
dV dS∇⋅ = ⋅∫∫∫ ∫∫AA n  (23)
where n is an outwardly drawn normal.
If n is expressed through direction cosines, i.e., n = i cos α + j cos β + k cos γ, then Equation (23) may
be written
Figure 10.5
S
AAA dVxyz
312 ∂∂∂⎛⎞ ++ =⎜⎟∂∂∂⎝⎠∫∫∫ ∫∫(A1 cos α + A2 cos β + A3 cos γ) dS (24)
The rectangular Cartesian component form of Equation (23) is
VS
AAA dV A dy dz A dz dx A dx dyxyz
312
123()∂∂∂⎛⎞ ++ = + +⎜⎟∂∂∂⎝⎠∫∫∫ ∫∫  (25)
EXAMPLE. If B is the magnetic field vector, then one of Maxwell’s equations of electromagnetic theory is
∇ · B = 0. When this equation is substituted into the left member of Equation (23), the right member tells us
that the magnetic flux through a closed surface containing a magnetic field is zero. A simple interpretation of
this fact results by thinking of a magnet enclosed in a ball. All magnetic lines of force that flow out of the ball
must return (so that the total flux is zero). Thus, the lines of force flow from one pole to the other, and there is
no dispersion.


## Page 262

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 251
Stokes’s Theorem
Stokes’s theorem establishes the equality of the double integral of a vector field over a portion of a surface and
the line integral of the field over a simple closed curve bounding the surface portion. (See Figure 10.6.)
Suppose a closed curve C bounds a smooth surface portion S. If the component functions of x = r(υ1, υ2)
have continuous mixed partial derivatives, then for a vector field A with continuous partial derivatives on S
C
S
dd S⋅= ⋅ ∇ ×∫∫ ∫Ar n AÑC∫/H17034  (26)
where n = cos αi + cos βj + cos γk with α, β, and γ represeting the angles made by the outward normal n
and i, j, and k, respectively.
Then the component form of Equation (26) is
C
S
AA AA A AA dx A dy A dz dSyz zx xy
33 21 2 1
123( ) cos cos cosαβγ⎡⎤∂∂ ∂∂ ∂ ∂⎛⎞ ⎛⎞⎛⎞++ = − +− + − ⎢⎥⎜⎟ ⎜⎟⎜⎟∂∂ ∂∂ ∂∂ ⎝⎠⎝⎠ ⎝⎠⎣⎦∫∫ ∫ÑC∫/H17034  (27)
If ∇ × A = 0, Stokes’s theorem tells us that
C
d 0.⋅=∫ ArÑC∫/H17034  This is Theorem 3 on Page 233.
Figure 10.6
SOLVED PROBLEMS
Line integrals
10.1. Evaluate x y dx y x dy
(1, 2) 22
(0, 1)
() ()−+ +∫  along (a) a straight line from (0, 1) to (1, 2), (b) a straight lines
from (0, 1) to (1, 1) and then from (1, 1) to (1, 2), and (c) the parabola x = t, y = t2 + 1.
(a) An equation for the line joining (0, 1) and (1, 2) in the xy plane is y = x + 1. Then dy = dx and the line
integral equals
x
x x dx x x dx x x dx
11 22 2
00
{( 1 ) } { ( 1 )} ( 2 2 ) 5 / 3
=
−+ + + + = + =∫∫
(b) Along the straight line from (0, 1) to (1, 1), y = 1, dy = 0 and the line integral equals
x
xd x x xd x
11 22
00
(1 ) ( 1 ) ( 0 ) (1 ) 2 / 3
=
−+ + = −= −∫∫
Along the straight line from (1, 1) to (1, 2), x = 1, dx = 0 and the line integral equals
yt
y y dy y dy
22 22
1
(1 )(0) ( 1) ( 1) 10 / 3
=
− + += +=∫∫
Then the required value = –2/3 + 10/3 = 8.3.
(c) Since t = 0 at (0, 1) and t = 1 at (1, 2), the line integral equals
t
t t dt t t t dt t t t t dt
11 22 22 5 2 2
00
{ ( 1) {( 1) }2 (2 4 2 2 1) 2
=
−+ + ++ = + + + − =∫∫


## Page 263

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems252
10.2. If A = (3x2 – 6yz)i + (2y + 3xz)j + (1 – 4xyz2)k, evaluate
C
d from (0,1,1) to (1,1,1)⋅∫ Ar  along the
following paths C:
(a) x = t, y = t2, z = t3
(b) The straight lines from (0, 0, 0) to (0, 0, 1), then to (0, 1, 1), and then to (1, 1, 1)
(c) The straight line joining (0, 0, 0) and (1, 1, 1)
CC
C
d x yz y xz xyz dx dy dz
x yz dx y xz dy xyz dz
22
22
{(3 6 ) (2 3 )} (1 4 ) } ( )
{(3 6 ) (2 3 ) (1 4 )
⋅= − + + + − ⋅ + +
=− + + + −
∫∫
∫
Ar i j k i j k
(a) If x = t, y = t2, z = t3, points (0, 0, 0) and (1, 1, 1) correspond to t = 0 and t = 1, respectively. Then
Ct
t
d t ttd t t t td t t tt d t
t t dt t t dt t t dt
1 22 3 2 3 2 2 3 2 3
0
1 25 35 2 1 1
0
{3 6( )( )} {2 3( )( )} ( ) { 1 4( )( )( ) } ( )
{3 6 } ( 4 6 )} (3 12 ) 2
=
=
⋅= − + + + −
=− + + + −=
∫∫
∫
Ar
Another method: Along C, A = (3t2 – 6t5) i + (2t2 + 3t4)j + (1 – 4t9)k and r = xi + yj + zk = ti + t 2j + t3k,
dr = (i + 2tj + 3t2k)dt. Then
C
d t td t t td t t t d t
1 25 35 2 1 1
0
( 3 6) ( 4 6) ( 3 1 2 ) 2⋅= − + + + − =∫∫Ar
(b) Along the straight line from (0, 0, 0) to (0, 1, 1), x = 0, y = 0, dx = 0, dy = 0, while z varies from 0 to 1.
Then the integral over this part of the path is
z z
zz z dz d z
1 12 2
0 0
{3(0) 6(0)( )}0 {2(0) 3(0)( )0 { 1 4(0)(0)( )} 1
= =
−+ + + − = =∫∫
Along the straight line from (0, 0, 1) to (0, 1, 1), x = 0, z = 1, dx = 0, dz = 0, while y varies from 0 to 1.
Then the integral over this part of the path is
y y
y y dy y y dy
1 12 2
0 0
{3(0) 6( )(1)}0 {2 3(0)(1)} { 1 4(0)( )(1) }0 2 1
= =
−+ + + − = =∫∫
Along the straight line from (0, 1, 1), to (1, 1, 1), v = 1, z = 1, dy = 0, dz = 0, while x varies from 0 to 1.
Then the integral over this part of the path is
x x
xd x x x x d x
1 122 2
0 0
{3 6(1)(1)} {2(1) 3 (1)}0 {1 4 (1)(1) }0 (3 6) 5
= =
−+ + + − = − = −∫∫
Adding,
C
dx 115 3⋅= + − = −∫ A
(c) The straight line joining (0, 0, 0) and (1, 1, 1) is given in parametric form by x = t, y = t, z = t. Then
Ct
d t td t t td t td t
1 22 2 4
0
(3 6 ) (2 3 ) (1 4 ) 6 / 5
=
⋅= − + + + − =∫∫Ar
10.3. Find the work done in moving a particle once around an ellipse C
in the xy plane, if the ellipse has its center at the origin with
semimajor and semiminor axes 4 and 3, respectively, as indicated
in Figure 10.7, and if the force field is given by
F = (3x – 4y + 2z)i + (4x + 2y – 3z
2)j + (2xz – 4y2 + z3)k
In the plane z  = 0, F  = (3x  – 4y )i + (4x  + 2y )j – 4y 2k, and
dr = dxi + dyj, so that the work done is
CC
C
d x y x y y dx dy
xy d x xy d y
2{(3 4 ) (4 2 ) 4 } ( )
( 3 4) ( 4 2)
⋅= − + + − ⋅ +
=−+ +
∫∫
∫
Fr i j k i jÑ
Ñ
C∫/H17034
C∫/H17034
Figure 10.7


## Page 264

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 253
Choose the parametric equations of the ellipse as x = 4 cos t, y = 3 sin t, where t varies from 0 to 2π (see
Figure 10.7). Then the line integral equals
t
t
tt t d t tt t d t
tt d t t t
2
0
2 22
00
{3(4 cos ) 4(3sin )}{ 4sin } {4(4 cos ) 2(3sin )}{3cos }
(48 30sin cos ) (48 15sin ) 96
π
π π
π
=
=
−− ++
=− = − =
∫
∫ (48 − 30 sin t cos t)dt = (48t – 15 sin2 t)
In traversing C we have chosen the counterclockwise direction indicated in Figure 10.7. We call this the
positive direction or say that C has been traversed in the positive sense. If C were traversed in the clockwise
(negative) direction, the value of the integral would be –96π.
10.4. Evaluate
C
yd s∫  along the curve C given by y = x2  from x = 3 to x = 24.
C
ds dx dy y dx x dx
y ds x x dx x dx x
22 2
24
24 24 3/2
23
3
Since 1 ( ) 1 1/ , we have
42 1 1/ 2 1 ( 1) 156 3
′= + =+ =+
=+ = + = + =∫∫ ∫
Green’s theorem in the plane
10.5. Prove Green’s theorem in the plane if C is a closed curve which has the property that any straight line
parallel to the coordinate axes cuts C in, at most, two points.
Let the equations of the curves AEB and AFB (see Figure 10.8) be y = Y1(x) and y = Y2(x), respectively. If
ℜ is the region bounded by C, we have
bY x
xa yYx
Yxbb
xa ayYx
ba
ab C
PPdx dy dy dxyy
Px y d x PxY PxY d x
P x Y dx P x Y dx Pdx
2
1
2
1
()
()
()
21()
12
(, ) [ (, ) (, ) ]
(, ) (, )
ℜ
==
= =
⎡⎤∂∂ = ⎢⎥∂∂ ⎣⎦
== −
=− − = −
∫∫ ∫ ∫
∫∫
∫∫ ∫ ÑC∫/H17034
Then
C
PPdx dx dy yℜ
∂=− ∂∫∫ ∫ÑC∫/H17034 (1)
Figure 10.8
Similarly, let the equations of curves EAF and EBF be x = X1 (y) and x = X2(y), respectively. Then
fy f
yc xxy c
cf
fc C
QQdx dy dx dy Q X y Q X y dyxx
Q X y dy Q X y dy Q dy
2
1
()
21()
12
[( ,) ( , ) ]
(,) (,)
χ
ℜ
==
∂∂ ⎡⎤== − ⎢⎥∂∂ ⎣⎦
=+ =
∫∫ ∫ ∫ ∫
∫∫ ∫ ÑC∫/H17034


## Page 265

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems254
Then
C
QQd y d xd y xℜ
∂= ∂∫∫ ∫ÑC∫/H17034 (2)
Adding Equations (1) and (2),
C
QPP dx Q dy dx dyxyℜ
⎛⎞∂∂+= − ⎜⎟∂∂⎝⎠∫∫ ∫ÑC∫/H17034
10.6. Verify Green’s theorem in the plane for
C
xy x dx x y dy22(2 ) ( )−+ +∫ÑC∫/H17034
where C is the closed curve of the region bounded by y = x2 and y2 = x.
The plane curve y = x2 and y2 = x intersect at (0, 0) and (1, 1). The positive direction in traversing C is as
shown in Figure 10.9.
Along y = x2, the line integral equals
x
x x x d xxx d x xx x d x
11 22 2 2 2 3 2 5
00
{ ( 2 ) () } { () } () ( 2 2) 7 / 6
=
−+ + = + + =∫∫
Along y2 = x, the line integral equals
y
yy y d y yy d y y y y d y
00 22 2 2 2 2 4 5 2
11
{(2)( ) ( ) ( ) } ( ) { } (4 2 2 ) 17 /15
=
−+ + = − + = −∫∫
Then the required line integral = 7/6 – 17/15 = 1/30.
QP dx dy x y xy x dx dyxy x y
22() ( 2 )
ℜℜ
⎛⎞ ⎧ ⎫∂∂ ∂ ∂−= + − − ⎨⎬⎜⎟∂∂ ∂ ∂⎝⎠ ⎩ ⎭∫∫ ∫∫
x
xy x
x dx dy x dy dx2
1
0
(1 2 ) (1 2 )
ℜ
==
=− = −∫∫ ∫ ∫
x
x yx
yx y d x
2
1
0
(2 )
= =
=−∫
xx x x d x
1 1/2 3/2 2 3
0
(2 2 ) 1 / 3 0=− − + =∫
Hence, Green’s theorem is verified.
Figure 10.9
10.7. Extend the proof of Green’s theorem in the plane given in Problem 10.5 to the curves C for which lines
parallel to the coordinate axes may cut C in more than two points.
Consider a closed curve C such as is shown in Figure 10.10, in which lines parallel to the axes may meet
C in more than two points. By constructing line ST, the region is divided into two regions ℜ 1 and ℜ 2, which
are of the type considered in Problem 10.5 and for which Green’s theorem applies, i.e.,
STUS
QPP dx Q dy dx dyxy ,
1ℜ
⎛⎞∂∂+= − ⎜⎟∂∂⎝⎠∫∫ ∫  (1)


## Page 266

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 255
SVTS
QPP dx Q dy dx dyxy
1ℜ
⎛⎞∂∂+= − ⎜⎟∂∂⎝⎠∫∫ ∫  (2)
Figure 10.10
Adding the left-hand sides of Equations (1) and (2), and omitting the integrand P dx + Q dy in each case,
we have
STUS SVTS ST TUS SVT TS TUS SVT TUSVT
+ = +++ =+=∫∫ ∫ ∫ ∫ ∫ ∫ ∫∫
using the fact that
ST TS
.=−∫∫
Adding the right-hand sides of Equations (1) and (2), omitting the integrand,
12ℜℜ ℜ
+=∫∫ ∫∫ ∫∫, where ℜ con-
sists of regions ℜ 1 and ℜ 2.
Then
TUSVT
QPP dx Q dy dx dyxyℜ
⎛⎞∂∂+= − ⎜⎟∂∂⎝⎠∫∫ ∫ , and the theorem is proved.
A region ℜ such as is considered here and in Problem 10.5, for which any closed lying in ℜ can be con-
tinuously shrunk to a point without leaving ℜ , is called a simply connected region . A region which is not
simply connected is called multiply connected. We have shown here that Green’s theorem in the plane applies
to simply connected regions bounded by closed curves. In Problem 10.10 the theorem is extended to multiply
connected regions.
For more complicated simply connected regions, it may be necessary to construct more lines, such as ST,
to establish the theorem.
10.8. Show that the area bounded by a simple closed curve C is given by
C
xd y yd x1 .2 −∫ÑC∫/H17034
In Green’s theorem, put P = –y,Q = x. Then
C
x dy y dx x y dx dy dx dy Axy() ( ) 2 2
ℜℜ
⎛⎞∂∂−= − − = = ⎜⎟∂∂⎝⎠∫∫ ∫ ∫ ∫ÑC∫/H17034
where A is the required area.
C
A x dy y dx1Thus, .2=− ∫ÑC∫/H17034
10.9. Find the area of the ellipse x = a cos θ, y = b sin θ.
C
xd y yd x a b d b a d
ab d ab d ab
2
0
22 22
00
11Area ( cos )( cos ) ( sin )( sin )22
11 (cos sin )22
π
ππ
θθ θ θ θ θ
θθ θ θ π
=− = − −
=+ = =
∫∫
∫∫
ÑC∫/H17034 (a cos θ)(b cos θ)dθ – (b sin θ)(–a sin θ)dθ


## Page 267

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems256
10.10. Show that Green’s theorem in the plane is also valid for a multiply connected region ℜ such as is shown in
Figure 10.11.
The shaded region ℜ, shown in Figure 10.11, is multiply connected, since not every closed curve lying in
ℜ can be shrunk to a point without leaving ℜ, as is observed by considering a curve surrounding DEFGD, for
example. The boundary of ℜ , which consists of the exterior boundary AHJKLA and the interior boundary
DEFGD, is to be traversed in the positive direction, so that a person traveling in this direction always has the
region on his left. It is seen that the positive directions are those indicated Figure 10.11.
In order to establish the theorem, construct a line such as AD, called a crosscut, connecting the exterior
and interior boundaries. The region bounded by ADEFGDALKJHA is simply connected, and so Green’s theo-
rem is valid. Then
H
E
G F
ℜDA
O
y
L
K
J
Figure 10.11
ADEFGDALKJHA
QPP dx Q dy dx dyxyℜ
⎛⎞∂∂+= − ⎜⎟∂∂⎝⎠∫∫ ∫ÑC∫/H17034
But the integral on the left, leaving out the integrand, is equal to
AD DEFGD DA ALKJHA DEFGD ALKJHA
++ + =+∫∫∫∫ ∫ ∫
since
AD DA
.=−∫∫  Thus, if C1 is the curve ALKJHA, C2 is the curve DEFGD, and C is the boundary of ℜ
consisting of C1 and C2 (traversed in the positive directions), then
CCC12
+=∫∫∫  and so
C
QPP dx Q dy dx dyxyℜ
⎛⎞∂∂+= − ⎜⎟∂∂⎝⎠∫∫ ∫ÑC∫/H17034
Independence of the path
10.11. Let P(x, y) and Q(x, y) be continuous and have continuous first partial derivatives at each point of a simply
connected region ℜ. Prove that a necessary and sufficient condition that
C
Pd x Qd y 0+=∫ÑC∫/H17034  around every
closed path C in ℜ is that ∂P/∂y = ∂Q/∂x identically in ℜ.
Sufficiency. Suppose ∂P/∂y = ∂Q/∂x. Then, by Green’s theorem,
C
QPP dx Q dy dx dyxy 0
ℜ
⎛⎞∂∂+= − = ⎜⎟∂∂⎝⎠∫∫ ∫ÑC∫/H17034
where ℜ is the region bounded by C.
Necessity. Suppose
C
Pd x Qd y 0+=∫ÑC∫/H17034  around every closed path C in ℜ and that ∂P/∂y /HS11005∂Q/∂x at some
point of ℜ. In particular, suppose ∂P/∂y – ∂Q/∂x > 0 at the point (x 0, y0).
By hypothesis, ∂P/∂y and ∂Q are continuous in ℜ, so that there must be some region τ containing (x0, y0)
as an interior point for which ∂P/∂y – ∂Q/∂x > 0. If Γ is the boundary of τ, then by Green’s theorem,
QPP dx Q dy dx dyxy 0
τ
Γ
⎛⎞∂∂+= − > ⎜⎟∂∂⎝⎠∫∫ ∫ÑC∫/H17034


## Page 268

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 257
contradicting the hypothesis that QPdx Q dy dx dyxy 0
τ
⎛⎞∂∂+= − > ⎜⎟∂∂⎝⎠∫∫C∫/H9003
/H17034P  for all closed curves in in ℜ.
Thus, ∂Q/∂x – ∂P/∂y cannot be positive.
Similarly, we can show that ∂Q/∂x – ∂P/∂y cannot be negative, and it follows that it must be identically
zero; i.e., ∂P/∂y = ∂Q/∂x identically in ℜ.
10.12 Let P and Q be defined as in Problem 10.11. Prove that a necessary and sufficient condition that
B
A
Pd x Qd y+∫ be independent of the path in ℜ joining points A and B is that ∂P/∂y = ∂ Q/∂x identically in ℜ .
Figure 10.12
Sufficiency. If ∂P/∂y = ∂Q/∂x, then by Problem 10.11,
ADBEA
Pd x Qd y 0+=∫
(See Figure 10.12.) From this, omitting for brevity the integrand P dx + Q dy, we have
CC
ADB BEA ADB BEA AEB
12
0, and so+= = − = =∫∫ ∫ ∫∫ ∫∫
i.e., the integral is independent of the path.
Necessity. If the integral is independent of the path, then for all paths C1 and C2 in ℜ we have
CC
ADB AEB
12
ADBEA
,a nd = 0==∫∫ ∫∫ ∫
From this it follows that the line integral around any closed path in ℜ is zero, and, hence, by Problem 10.11
that ∂P/∂y = ∂Q/∂x.
10.13. Let P and Q be as in Problem 10.11. (a) Prove that a necessary and sufficient condition that P dx + Q dy be
an exact differential of a function /H9272(x,y) is that ∂P/∂y = ∂Q/∂x. (b) Show that in such case
BB
AA
P dx Q dy d B A () ()φφ φ+= =−∫∫  where A and B are any two points.
(a) Necessity. If P dx + Q dy = d φ = dx dyxy ,φφ∂∂ +∂∂
 an exact differential, then
∂φ/∂x = P (1)
∂φ/∂y = 0 (2)
Thus, by differentiating Equations (1) and (2) with respect to y and x, respectively, ∂P/∂y = ∂Q/∂x, since we
are assuming continuity of the partial derivatives.
Sufficiency. By Problem 10.12, if ∂P/∂y = ∂Q/∂x, then Pd x Qd y+∫ is independent of the path joining two
points. In particular, let the two points be (a, b) and (x, y) and define
xy
ab
xy P d x Q d y
(, )
(, )
(, )φ= + ∫
Then
xx y x y
ab ab
x x y x y P dx Q dy P dx Q dy
(, ) ( , )
(, ) (, )
(, ) ( , )φφ
+Δ
+Δ − = + − +∫∫
xx y
xy
Pd x Qd y
(, )
(, )
+Δ
=+∫


## Page 269

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems258
Since the last integral is independent of the path joining (x, y) and (x + Δx, y), we can choose the path to be a
straight line joining these points (see Figure 10.13) so that dy = 0. Then, by the mean value theorem for inte-
grals,
xx y
xy
xx y x y Pd x P x x yxx
(, )
(, )
(, ) ( , ) 1 (, ) 0 1φφ θθ
+Δ+Δ − == + Δ < <ΔΔ ∫
Taking the limit as Δx → 0, we have ∂φ/∂x = P.
Similarly, we can show that ∂φ/∂y = Q.
Thus, it follows that P dx Q dy dx dy dxy .φφ φ∂∂+= + = ∂∂
Figure 10.13
(b) Let A = (x1, y1) and B = (x2, y2). From (a),
xy
ab
xy P d x Q d y
(, )
(, )
(, ) .φ= + ∫
Then, omitting the integrand P dx + Q dy, we have
B x yx yx y
Ax y a b a b
xy xy B A
22 22 1 1
11
(, ) (, ) ( , )
22 1 1(, ) ( , ) ( , )
(, ) (, ) ( ) ()φφ φ φ==−= − = −∫ ∫∫∫
10.14. (a) Prove that xy y dx x y xy dy
(3,4) 23 2 2
(1, 2)
(6 ) (6 3 )−+ −∫ dy is independent of the path joining (1, 2) and
(3, 4). (b) Evaluate the integral in (a).
(a) P = 6xy2 – y3, Q = 6x2 y – 3xy2. Then ∂P/∂y = 12xy – 3y2 = ∂Q/∂x and, by Problem 10.12, the line in-
tegral is independent of the path.
(b) Method 1: Since the line integral is independent of the path, choose any path joining (1, 2) and (3, 4),
for example, that consisting of lines from (1, 2) to (3, 2) (along which y = 2, dy = 0) and then (3, 2) to
(3, 4) (along which x = 3, dx = 0). Then the required integral equals
xy
xd x y y d y
34 2
12
(24 8) (54 9 ) 80 156 236
==
−+ − = + =∫∫
 Method 2: Since PQ
yx ,∂∂ =∂∂
 we must have
xy x yy
2263φ ∂=−∂
 (1)
xy x yy
2263φ ∂=−∂
(2)
From Equation (1), φ = 3x 2y2 – xy3 + f (y). From Equation (2), φ = 3x 2y2 – xy3 + g(x). The only way in
which these two expressions for φ are equal is if f (y) = g(x) = c, a constant. Hence, φ = 3x2y2 – xy3 + c. Then,
by Problem 10.13.


## Page 270

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 259
xy y dx x y xy dy d x y xy c
xy x y c
(3.4) (3.4)23 2 2 2 2 3
(1.2) (1.2)
(3,4)22 3
(1,2)
(6 ) (6 3 ) (3 )
3 236
−+ − = − +
=− + =
∫∫
Note that in this evaluation the arbitrary constant c can be omitted. See also Problem 6.16.
We could also have noted by inspection that
xy y dx x y xy dy xy dx x y dy y dx xy dy
dx y d x y dx y x y
23 2 2 2 2 3 2
22 3 22 3
(6 ) (6 3 ) (6 6 ) ( 3 )
(3 ) ( ) (3 )
− + −=+ − +
=− = −
from which it is clear that φ = 3x2y2 – xy3 + c.
10.15. Evaluate xy x x y2 cos 2 +
C∫/H17034(
xxx y ed x x x y ed y22sin ) ( sin 2 )−+ − around the hypocycloid x2/3 +
y2/3 = a2/3.
P = x2y cos x + 2xy sin x – y2ex, Q = x2 sin x – 2 yex
Then ∂P/∂y = x2 cos x + 2x sin x – 2yex = ∂Q/∂x, so that, by Problem 10.11, the line integral around any
closed path—in particular, x 2/3 + y2/3 = a2/3—is zero.
Surface integrals
10.16. If γ is the angle between the normal line to any point (x, y, z) of a surface S and the positive z axis, prove that
xyz
xy
z
FFF
zz F
222
22|sec | 1 ||γ
++
=+ +=
according as the equation for S is z = f (x, y) or F(x, y, z) = 0.
If the equation for S is F(x, y, z) = 0, a normal to S at (x, y, z) is ∇F = Fxi + Fyj + Fzk. Then
zx y zF F F FFF 222K| | | k | c o s o r c o sγγ∇⋅ = ∇ = + +
from which
xyz
z
FFF
F
222
|sec | as required.||γ
++
=  as required.
In case the equation is z = f (x, y), we can write F(x, y) = 0, from which F x = –zx, Fy – zy, Fz = 1 and we
find xyzz22|sec | 1 .γ= + +
10.17. Evaluate
S
Uxyzd S(,,)∫∫ , where S is the surface of the paraboloid z = 2 – (x2 + y2) above the xy plane
and U(x, y, z) is equal to (a) 1, (b) x2 + y2, y2, and (c) 3z. Give a physical interpretation in each case. (See
Figure 10.14.)
The required integral is equal to
xyU x y z z z dx dy22(,,)1 .
ℜ
++∫∫  (1)
where ℜ is the projection of S on the xy plane given
by x2 + y2 = 2, z = 0.
Since zx = –2x, zy = –2y, (1) can be written
U x y z x y dx dy 22(,,)1 4 4
ℜ
++∫∫  (2)
(a) If U(x, y, z) = 1, (2) becomes
x y dx dy2214 4
ℜ
++∫∫
Figure 10.14


## Page 271

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems260
To evaluate this, transform to polar coordinates (ρ, φ). Then the integral becomes
d
22 2
00
14
π
φρ
ρρ
==
+∫∫ dd
2
2 23 / 2
0
0
11 3(1 4 )12 3
π
φ
ρ
πρφ ρ φ
=
=
=+ =∫
Physically, this could represent the surface area of S or the mass of S assuming unit density.
(b) If U(x, y, z) = x2 + y2, (2) becomes x y x y dx dy22 2 2() 1 4 4
ℜ
++ +∫∫  or, in polar coordinates,
dd
22 32
00
14914 30
π
φρ
πρρ ρ φ
==
+=∫∫
where the integration with respect to ρ is accomplished by the substitution u214 . ρ+=
Physically, this could represent the moment of inertia of S about the z axis assuming unit density, or the
mass of S assuming a density = x2 + y2.
(c) If U(x, y, z) = 3z, (2) becomes
z x yd x d y x y x yd x d y22 2 2 22314 4 3 { 2 ( ) } 14 4
ℜℜ
++ = − + ++∫∫ ∫∫
or, in polar coordinates,
dd
22 22
00
1113( 2 )1 4 10
π
φρ
πρρ ρ ρ φ
==
−+ =∫∫
Physically, this could represent the mass of S assuming a density = 3z, or three times the first moment of
S about the xy plane.
10.18. Find the surface area of a hemisphere of radius a cut off by a cylinder having this radius as diameter.
Equations for the hemisphere and cylinder (see Figure 10.15) are given, respectively, by x2 + y2 + z2 = a2
(or z axy222 )−−  and (x – a/2)2 + y2 = a2/4 (or x2 + y2 = ax).
Since
xy
xyzz
axy axy222 222
and−−==
−− −−
we have
xy
az z dx dy dx dy
axy
22
222
Required surface area 2 1 2
ℜℜ
=+ + =
−−∫∫ ∫∫
Two methods of evaluation are possible.
Figure 10.15


## Page 272

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 261
Method 1: Using polar coordinates.
Since x2 + y2 = ax in polar coordinates is ρ = a cos φ, the integral becomes
aa a dd a a d
a
cos/2 c o s /2 22
00 0 22 0
22
φπφ π
φρ φ ρ
ρρφ ρ φ
ρ
== = =
=− −
−∫∫ ∫
ad a
/222
0
2( 1 s i n ) ( 2 )
π
φφ π=− = −∫
Method 2: The integral is equal to
ax x
aa x x a
xy x
y
ay dx dy a dx
axy a x x
2
2
1
00 0222 2
0
22 sin
−
− −
== =
=
=
−− −∫∫ ∫
a xad xax
1
0
2s i n −= +∫
Letting x = a tan2 θ, this integral becomes
44 1
2
1
2
22 2 2
0
4
0
4
ad a θθ θ θ θ θ ππ
tan sec tan | //
= ⎧⎨⎩
−∫ ttan
tan | (sec )
/
/
2
0
4
22
0
4221
θθ
θθ θ θ
π
π
d
ad=− −
∫
0 0
4
2
0
4224 2
π
ππθ θπ
/
//( t a n ) | ( )
∫
=− − = −aa
⎧⎨⎩
⎧⎨⎩
⎧⎨⎩
⎧⎨⎩
⎧⎨⎩
/H9258/H9258/H9258/H9258 /H9258/H9258 /H9258/H9258
/H9258/H9258/H9258/H9258
/H9258/H9258
Note that these integrals are actually improper and should be treated by appropriate limiting procedures
(see Problem 5.74 and Chapter 12).
10.19. Find the centroid of the surface in Problem 10.17.
S
S
zdS z x y dx dy
xy
zdS x y dx dy
22
22
14 4
By symmetry, 0 and z
14 4
ℜ
ℜ
++
== = =
++
∫∫ ∫∫
∫∫ ∫∫
The numerator and denominator can be obtained from the results of Problems 10.17(c) and 10.17(a),
respectively, and we thus have z 37 /10 111 .13 /3 130
π
π==
10.20. Evalute ∫∫S A · n dS, where A = xyi – x2j + (x + z)k, S is that portion of the plane 2x + 2y + z = 6 included in
the first octant, and n is a unit normal to S. (See Figure 10.16.)
Sx y zA normal to is (2 2 6)∇++ − =  2i + 2j + k, and so
n
22 2 3221
==
++
2i + 2j + k 2i + 2j + k
Then
A · n = {xyi – x2j + (x + z)k}· 2i + 2j + k
3
⎛
⎜⎝
⎞
⎟⎠
xy x x z
xy x x x y
xy x x y
2
2
2
22()
3
22( 6 2 2 )
3
22 2 6
3
−+ +=
−+ + − −=
−− − +=
Figure 10.16


## Page 273

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems262
The required surface integral is, therefore,
xy
S
x
xy
x
x
xy x x y xy x x ydS z z dx dy
xy x x y dx dy
xy x x y dy dx
xy x y xy y y dx
22
22
2
222
33 2
00
33 22 2
0 0
22 2 6 22 2 6 133
22 2 6 1223
(2 2 2 6)
(2 6 ) 2 7 / 4
ℜ
ℜ
−
==
−
=
⎛⎞ ⎛⎞−− − + −− − + =+ +⎜⎟ ⎜⎟
⎝⎠ ⎝⎠
⎛⎞ −− − +=+ +⎜⎟
⎝⎠
=− − − +
=− − − + =
∫∫ ∫∫
∫∫
∫∫
∫
10.21. In dealing with surface integrals we have restricted ourselves to surface which are two-sided. Give an
example of a surface which is not two-sided.
A
AD
BC
B
P
Q
n
n
C
D
Figure 10.17
Take a strip of paper such as ABCD, as shown in Figure 10.17. Twist the strip so that points A and B fall
on D and C, respectively, as in the figure. If n is the positive normal at point P of the surface, we find that as
n moves around the surface, it reverses its original direction when it reaches P again. If we tried to color only
one side of the surface, we would find the whole thing colored. This surface, called a Möbius strip, is an
example of a one-sided surface. This is sometimes called a nonorientable surface. A two-sided surface is
orientable.
The divergence theorem
10.22. Prove the divergence theorem. (See Figure 10.18.)
Figure 10.18
Let S be a closed surface which is such that any line parallel to the coordinate axes cuts S in, at most, two
points. Assume the equations of the lower and upper portions S1 and S2 to be z = f1(x, y) and z = f2(x, y) respec-
tively. Denote the projection of the surface on the xy plane by ℜ. Consider


## Page 274

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 263
fx y
zfx y
VV
f
zf
AA AdV dz dy dx dz dy dxzz z
A x y z dy dx A x y f A x y f dy dx
2
1
2
1
(,)33 3
(,)
33 2 3 1(,,) [ (,, ) (,, ) ]
ℜ
ℜℜ
=
=
∂∂ ∂⎡⎤== ⎢⎥∂∂ ∂⎣⎦
== −
∫∫∫ ∫∫∫ ∫∫ ∫
∫∫ ∫∫
For the upper portion S2, dy dx = cos γ2 dS2 = k · n2 dS2 since the normal n2 to S2 makes an acute angle γ2
with k.
For the lower portion S1, dy dx = – cos γ1 dS1 = –k · n1 dS1 since the normal n1 to S1 makes an obtuse angle
γ1 with k.
Then
S
A x y f dy dx
2
32(,, )
ℜ
=∫∫ ∫∫A3k · n2 dS2
S
A x y f dy dx
1
31(,, )
ℜ
=−∫∫ ∫∫A3k · n1 dS1
and
SS
S
A x y f dy dx A x y f dy dx A dS A dS
Ad S
21
32 31 3 2 2 3 1 1
3
(,, ) (,, ) kn kn
kn
ℜℜ
−= ⋅ + ⋅
=⋅
∫∫ ∫∫ ∫∫ ∫∫
∫∫
A3k · n2dS2
A3k · n dS
A3k · n1dS1
so that
VS
A dVz
3∂ =∂∫∫∫ ∫∫ A3k · n dS (1)
Similarly, by projecting S on the other coordinate planes,
VS
A dV Ax
1∂ =∂∫∫∫ ∫∫ A3i · n dS (2)
VS
A dVy
2∂ =∂∫∫∫ ∫∫ A3 j · n dS (3)
Adding Equations (1), (2), and (3),
VS
AAA dVxyz
312 ∂∂∂⎛⎞ ++ =⎜⎟∂∂∂⎝⎠∫∫∫ ∫∫(A1i + A2j + A3k) n dS
or
VS
dV dSAA n∇⋅ = ⋅∫∫∫ ∫∫A dV A · n dS
The theorem can be extended to surfaces which are such that lines parallel to the coordinate axes meet
them in more than two points. To establish this extension, subdivide the region bounded by S into subregions
whose surfaces do satisfy this condition. The procedure is analogous to that used in Green’s theorem for the
plane.
10.23. Verify the divergence theorem for A = (2x – z)i + x
2yj – xz2k taken over the region bounded by x = 0, x = 1, y
= 0, y = 1, z = 0, z = 1.
We first evaluate
S
⋅∫∫An dS, where S is the surface of the cube in Figure 10.19.
Face DEFG: n = i, x = 1. Then
DEFG
dS z z dy dz
zd y d z
11 2
00
11
00
An { ( 2 ) i j k }i
(2 ) 3/2
⋅= − + − ⋅
=− =
∫∫ ∫ ∫
∫∫
A · n dS i j k i


## Page 275

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems264
Face ABCO: n = –i, x = 0. Then
ABCO
dS z dy dz
zd yd z
11
00
11
00
An ( i )(i )
1/2
⋅= − ⋅ −
==
∫∫ ∫ ∫
∫∫
A · n i i
Face ABEF: n = j, y = 1. Then
ABEF
dS z x xz dx dz x dx dz
11 1122 2
00 00
An { ( 2 ) i j k }j 1 / 3⋅= − + − ⋅ = =∫ ∫ ∫∫ ∫∫A · n i j k j
Face OGDC: n = –j, y = 0. Then
OGDC
dS x z xz dx dz
11 2
00
An { ( 2 ) i k } ( j ) 0⋅= − − ⋅ − =∫∫ ∫ ∫A · n i jk
Figure 10.19
Face BCDE: n = k, z = 1. Then
BCDE
dS x x x dx dy x dx dy
11 112
00 00
An { ( 2 1 ) i y j k }k 1 / 2⋅= − + − ⋅ = − −∫ ∫ ∫∫ ∫∫A · n i yj k k
Face AFGO: n = – k, z = 0. Then
AFGO
dS x x dx dy
11 2
00
An { 2i y j } (k ) 0⋅= − ⋅ − =∫∫ ∫ ∫A · n i yj k
Adding,
S
dS 311 1 1 1An 0 0 . S i n c e223 2 6⋅= + + + − + =∫∫A · n
V
dV x xz dx dy dz
111 2
000
11A( 2 2 ) 6∇⋅ = + − =∫∫∫ ∫ ∫ ∫A
the divergence theorem is verified in this case.
10.24. Evaluate
S
ds,⋅∫∫An  where S is a closed surface.
By the divergence theorem,
SV
dS dVrn r⋅= ∇ ⋅∫∫ ∫∫∫ rr · n
V
VV
xyz d Vxyz
xyz dV dV Vxyz
ij k ( i j k )
ij k 3 3
⎛⎞∂∂∂=+ + ⋅ + +⎜⎟∂∂∂⎝⎠
⎛⎞∂∂∂=+ + = =⎜⎟∂∂∂⎝⎠
∫∫∫
∫∫∫ ∫∫∫
i
i
j
j
k
k
yjxi zk
where V is the volume enclosed by S.


## Page 276

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 265
10.25. Evaluate
S
xz dy dz x y z dz dx xy y z dx dy22 3 2() ( 2) ,+− ++∫∫  where S is the entire surface of the
hemispherical region bounded by za x y z222 and 0=− − =  (a) by the divergence theorem (Green’s
theorem in space) and (b) directly.
(a) Since dy dz = dS cos α, dz dx = dS dS cos β, and dx dy = dS cos γ, the integral can be written
S
xz2{c o s∫∫ xy z x y yz23 2( ) cos (2 ) cosαβ+− ++
S
dS}γ= ∫∫A · n dS
where A = xz2i + (x2y – z3) j + (2xy + y2z)k and n = cos αi + cos βj + cos γk, the outward drawn unit normal.
Then, by the divergence theorem the integral equals
VV V
A dV xz x y z xy y z dV x y z dVxy z
22 3 2 2 2 2() ( ) ( 2 ) ( )⎧⎫∂∂ ∂∇⋅ = + − + + = + +⎨⎬∂∂ ∂⎩⎭∫∫∫ ∫∫∫ ∫∫∫A
where V is the region bounded by the hemisphere and the xy plane.
By use of spherical coordinates, as in Problem 9.19, this integral is equal to
r
rr
/2 /2 22
00 0
4
ππα
φθ== =
⋅∫∫∫ sinθ adr d d
52
5
πθφ =
(b) If S 1 is the convex surface of the hemispherical region and S2 is the base (z = 0), then
aa y aa x
ya z ya z
S
aa x
xa x
S
aa x
xa z
y
S
xz dy dz z a y z dz dy z a y z dz dx
x y z dy dx x a y z z dz dx
xa x z z d z d x
xy y z dx dy xy y a y z dy dx
22 22
1
22
1
22
1
2 2 222 2 222
00
23 2 2 2 2 3
0
22 2 2 3
0
22 2 2 2
() { }
{}
(2 ) {2 }
−−
=− = =− =
−
=− =
−
=− =
=−
=− − − − − −
−= − − −
−− − − −
−= + − −
∫ ∫ ∫∫ ∫∫
∫∫ ∫ ∫
∫∫
∫∫
aa x
xa a x
SS
aa x
xa y a x
SS
xz dy dz x y z dz dx
xy y z dx dy xy y dx dy xy dy dx
22
22
22
22
22
22
22 3
22
0, ( ) 0,
(2 ) {2 (0)} 2 0
−
=− −
−
=− =− −
=− =
−= − = =
∫∫
∫∫ ∫∫
∫∫ ∫∫ ∫ ∫
By addition of the preceding, we obtain
aa y aa x
yx xz
aa x
xy
z a y z dz dy x a x z dz dx
y a x y dy dx
22 22
22
22 2 2 22 2 2
00 00
22 2 2
00
44
4
−−
== ==
−
==
−− + −−
+− −
∫∫ ∫∫
∫∫
Since by symmetry all these integrals are equal, the result, on using polar coordinates, is
aa x a
xy
ay a x y dy dx a d d
22 5/222 2 2 2 2 2 2
00 0 0
212 12 sin 5
π
φρ
πρφ ρ ρ ρ φ
−
== = =
−− = − =∫∫ ∫∫
Stokes’s theorem
10.26. Prove Stokes’s theorem.
Let S be a surface which is such that its projections on the xy, yz, and xz planes are are regions bounded
by simple closed curves, as indicated in Figure 10.20. Assume S to have representation z = f (x, y) or x  =
g(y, z) or y = h(x, z), where f, g, and h are single-valued, continuous, and differentiable functions. We must
show that


## Page 277

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems266
SS
dS A A A dS 123(A ) n [( i j k ) ] n∇× ⋅ = ∇× + + ⋅∫∫ ∫∫A n i j k n
c
dAr=⋅∫C
A · dr
where C is the boundary of S.
S
Ad S
AAA xyz z y
A
1
11
1
1
Consider first [ ( i)] n .
ij k
Since ( i) = j k,
00
∇× ⋅
∂∂∂∂∂∇× = −∂∂∂ ∂ ∂
∫∫
j k
kj
i
i n
i
Figure 10.20
[( ) ]∇× ⋅ = ∂
∂ ⋅⎛
⎝⎜Ad S A
z
1
1in n j − ∂
∂ ⋅ ⎞
⎠
⎟
A
y dS
1 nk  (1)
If z = f (x, y) is taken as the equation of S, then the position vector to any point of S is r = xi + yj + zk = xi +
yj + f (x, y)k so that
y
r∂
∂
r  = j + z
y
∂
∂
k = j + f
y
∂
∂
k. But
y
r∂
∂
r  is a vector tangent to S and thus perpendicular to n,
so that
n r nj⋅∂
∂ =⋅y nk or nj+ ∂
∂ ⋅= ⋅z
y 0 k− ∂
∂ ⋅z
y n=
Substitute in Equation (1) to obtain
∂
∂ ⋅⎛
⎝
⎜
A
z
1 nj − ∂
∂ ⋅ ⎞
⎠
⎟ = ∂
∂
∂
∂ ⋅− ∂
∂
A
y dS A
z
z
y
A
11 1nk nk y y dSnk⋅⎛
⎝
⎜
⎞
⎠
⎟
or
[( ) ]∇× ⋅ =− ∂
∂ + ∂
∂
∂
∂
⎛
⎝
⎜
⎞
⎠
⎟ ⋅Ad S A
z
A
y
z
y dS
1
11in n k  (2)
Now on S, A1 (x, y, z) = A1 [x, y, f (x, y)] = F(x, y); hence, AA zF
yz y y
11∂∂ ∂∂+=∂∂ ∂ ∂
 and Equation (2) becomes
[( ) ]∇× ⋅ =− ∂
∂ ⋅= − ∂
∂Ad S F
y dS F
y dx dy1in n k


## Page 278

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 267
Then
[( ) ]∇× ⋅ = − ∂
∂∫∫ ∫∫Ad S F
y dx dy
S
1in
ℜ
where ℜ  is the projection of S  on the xy plane. By Green’s theorem for the plane, the last integral equals
r
Fd x∫ÑC∫/H9003
/H17034 where Γ is the boundary of ℜ. Since at each point (x, y) of Γ the value of F is the same as the value
of A1 at each point (x, y, z) of C, and since dx is the same for both curves, we must have
c
Fd x A d x 1= ∫ÑC∫/H17034
C∫/H9003
/H17034
or
[(∇× ⋅ =∫∫ ∫Ad S A d x
S
c11i)] n
C∫/H17034
Similarly, by projections on the other coordinate planes,
[( , [(∇× ⋅ = ∇× ⋅ =∫∫∫ ∫ ∫A dSA d y A d SA
S
c
S
3j)] nk ) ] n 3 3dz
c∫2 2C∫/H17034
C∫/H17034
Thus, by addition,
(∇× ⋅ = ⋅∫∫ ∫ A) n rdS A d
S
cC∫/H17034
The theorem is also valid for surfaces S which may not satisfy these imposed restrictions. Assume that S
can be subdivided into surfaces S1, S2, . . . Sk with boundaries C1, C2, . . . , Ck, which do satisfy the restrictions.
Then Stokes’s theorem holds for each such surface. Adding these surface integrals, the total surface integral
over S is obtained. Adding the corresponding line integrals over C1, C2 . . . , Ck, the line integral over C is ob-
tained.
10.27. Verify Stokes’s theorem for A = 3y i – xzj + yz2k, where S is the surface of the paraboloid 2z = x2 + y2
bounded by z = 2 and C is its boundary. See Figure 10.21.
The boundary C of S is a circle with equations x2 + y2 = 4, z = 2 and parametric equations x = 2 cos t, y =
2 sin t, z = 2, where 0 < t < 2π. Then
Figure 10.21
Ar⋅= − +
=−
∫ ∫d y dx xz dy yz dz
tt
CC
3
32 2
2
(s i n ) ( s i n ) d dt t t dt
tt
−
=+
∫ ( cos )( )( )
(s i n c o s
22 2
12 8
2
0
22
cos
π
) )dt =∫ 20
0
2
π
π
C∫/H17034
C∫/H17034


## Page 279

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems268
Also,
∇× ∂
∂
∂
∂
∂
∂
−
=− +A=
ij k
+ ikxy z
yx z y z
zx z
3
3
2
2() ( )
and
= ∇n (xxy z
xy z
xy
xy
22
22 22
2
2 1
+−
∇+ − = +−
++
)
|( ) | .ij k
Then
() ( ) | ()∇× ⋅ = ∇⋅ ⋅ ⋅ =+ + +∫∫An n nk |dS A dx dy xz x z d22 3
ℜ
xxd y
x xy x xy
S ℜ
22
∫∫∫∫
= +⎛
⎝⎜
⎞
⎠⎟ ++ + +
⎧
⎨⎪
⎩⎪
⎫22 2
2
22
3⎬ ⎬⎪
⎭⎪∫∫
ℜ
dx dy
In polar coordinates this becomes
dd
22 42 2 2
00
{( cos )( /2) cos /2 3} 20
π
φρ
ρφ ρ ρ φ ρ ρ ρ φ π
==
++ + =∫∫
10.28. Prove that a necessary and sufficient condition that
C∫ÑC∫/H17034A · dr = 0 for every closed curve C is that ∇ × A = 0
identically.
Sufficiency. Suppose ∇ × A = 0. Then, by Stokes’s theorem,
Ar A n⋅= ∇ × ⋅ =∫∫∫ dd S
S
C
() 0
C∫/H17034
Necessity. Suppose
C∫ÑC∫/H17034A · dr= 0 around every closed path C, and assume ∇ × A /HS110050 at some point P. Then,
assuming ∇ × A is continuous, there will be a region with P as an interior point, where ∇ × A /HS110050. Let S be a
surface contained in this region whose normal n at each point has the same direction as ∇ × A; i.e., ∇ × A =
αn where α is a positive constant. Let C be the boundary of S. Then, by Stokes’s theorem,
Ar A n n n⋅ = ∇ × ⋅= ⋅>∫∫∫∫ ∫dd S d S
S
C
S
() α 0
C∫/H17034
which contradicts the hypothesis that
C∫ÑC∫/H17034A · dr = 0 and shows that ∇ × A = 0.
It follows that ∇ × A = 0 is also a necessary and sufficient condition for a line integral
P
P
d
2
1
⋅∫ Ar  to be
independent of the path joining points P1 and P2.
10.29. Prove that a necessary and sufficient condition that ∇ × A = 0 is that A = ∇φ.
Sufficiency. If A = ∇φ, then ∇ × A = ∇ × ∇φ = 0 by Problem 7.80.
Necessity. If ∇ × A = 0, then by Problem 10.28,
C∫ÑC∫/H17034A · dr = 0 around every closed path and
P
P
d
2
1
⋅∫ Ar  is
independent of the path joining two points, which we take as (a, b, c) and (x, y, z). Let us define
φ(,,)
(,,)
(,,)
xyz A dr A dx A dy A dz
abc
xyz
=⋅ = + +∫ 123((,,)
(,,)
abc
xyz
∫
Then
xx y z
xyz
x x y z x y z A dx A dy A dz
(, , )
123(,,)
( ,,) (,,)φφ
+Δ
+Δ − = + +∫
Since the last integral is independent of the path joining (x, y, z) and (x + Δx, y, z), we can choose the path
to be a straight line joining these points so that dy and dz are zero. Then
xx y z
xyz
xx y z x y z Ad x A x x y zxx
(, , )
11(,,)
( ,,) (,,) 1 (, , ) 0 1φφ θθ
+Δ+Δ − == + Δ < <ΔΔ ∫


## Page 280

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 269
where we have applied the law of the mean for integrals.
Taking the limit of both sides as Δx → 0 gives ∂φ/∂x = A 1.
Similarly, we can show that ∂φ/∂y = A2, ∂φ/∂z = A3. Thus,
Ai jk = ij k =.=+ + ∂
∂ + ∂
∂ + ∂
∂ ∇AA A xyz
12 3
φφφ φ
10.30. (a) Prove that a necessary and sufficient condition that A 1 dx + A2 dy + A3 dz = dφ, an exact differential, is
that ∇ × A = 0 where A = A 1i + A2j + A3k. (b) Show that in such case,
xyz xyz
xyz xyz
Ad x Ad y Ad z d x y z x y z
222 222
111 111
(,,) (,,)
123 2 2 21 1 1(,,) (,,)
(,,) (,,)φφ φ++= = −∫∫
(a) Necessity. A dx A dy A dz d dx dy dz xyz
123If , thenφφφφ ∂∂∂++= = + + ∂∂∂
Ax
1
φ ∂=∂
 (1)
Ay
2
φ ∂=∂
 (2)
Az
3
φ ∂=∂
 (3)
Then, by differentiating, and assuming continuity of the partial derivatives, we have
AAAA A A
yx zy zx
3312 2 1 ,, ∂∂∂∂ ∂ ∂===∂∂ ∂∂ ∂∂
which is precisely the condition ∇ × A = 0.
Another method: If A1 dx + A2 dy + A3 dz = dφ, then
Ai jk = ij k ==+ + ∂
∂ + ∂
∂ + ∂
∂ ∇AA A xyz
12 3
φφφ φ.
from which ∇ × A = ∇ × ∇φ = 0.
Sufficiency. If ∇ × A = 0, then by Problem 10.29, A = ∇φ and
Ad x Ad y Ad z d r d r d x d y d z d xyz
123 A φφφφφ ∂∂∂++= ⋅ = ∇ ⋅ = + + = ∂∂∂
(b) From (a),
xyz
abc
x y z A dx A dy A dz
(,,)
123(,,)
(,,)φ= + + ∫
Then, omitting the integrand A1 dx + A2 dy + A3 dz, we have
=∫(,,)
(,,)
xyz
xyz
111
222
−∫(,,)
(,,)
abc
xyz222
− ∫ ∫ = φ
(,,)
(,,)
abc
xyz111
∫ ∫ −φ(,,)xyz222 − ∫ ∫φ(,,)xyz111
10.31. (a) Prove that F = (2xz 3 + 6y)i + (6x – 2yz)j + (3x2z2 – y2) k is a conservative force field. (b) Evaluate
C∫ÑC∫ F ·
dr where C is any path from (1, –1, 1) to (2, 1, –1). (c) Give a physical interpretation of the results.
(a) A force field F is conservative if the line integral
C∫ÑC∫ F · dr is independent of the path C joining any two
points. A necessary and sufficient condition that F be conservative is that ∇ × F = 0.
Since here F =
ij k
∇× ∂
∂
∂
∂
∂
∂
+−
xy z
xz y x yz x z26 6 2 332 2 − −
=
y2
0, F is conservative


## Page 281

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems270
(b) Method 1: By Problem 10.30, F · dr = (2xz3 + 6y)dx + (6x – 2yz)dy + (3x2z2 – y2)dz is an exact differ-
ential dφ, where φ is such that
xz yx
326φ ∂=+∂
 (1)
xy zy 62φ ∂=−∂
 (2)
xz yz
22 23φ ∂=−∂
 (3)
From these we obtain, respectively,
φ = x2z3 + 6xy + f1(y, z)
φ = 6xy – y2z + f2(x, z)
φ = x2y2 – y2z + f3 (x, y)
These are consistent if f1(y, z) = – y2z + c, f2(x, z) = x2z3 + c, and f3 (x, y) = 6xy + c, in which case φ = x2z3
+ 6xy – y2z + c. Thus, by Problem 10.30,
dx z x y y z c
(2,1, 1) 23 2 ( 2 , 1 , 1 )
(1, 1,1)(1, 1,1)
Fr 6 | 1 5
− −
−−
⋅= + − + =∫
Alternatively, we may notice by inspection that
F · dr = (2xz3 dx + 3x2z2 dz) + (6yd x + 6xd y) – (2yz dy + y2 dz)
 = d(x2z3) + d(6xy) – d(y2z) = d(x2z3 + 6xy – y2z + c) from which φ is determined.
Method 2: Since the integral is independent of the path, we can choose any path to evaluate it; in particular,
we can choose the path consisting of straight lines from (1, –1, 1) to (2, –1, 1), then to (2, 1, 1) and then to
(2, 1, –1). The result is
xyz
x dx y dy z dz
21 1 2
111
(2 6) (12 2 ) (12 1) 15
−
===
−+ − + − =∫∫∫
where the first integral is obtained from the line integral by placing y = –1, z = 1, dy = 0, dz = 0; the second
integral, by placing x = 2, z = 1, dx = 0, dz = 0; and the third integral, by placing x = 2, y = 1, dx = 0, dy = 0.
(c) Physically, ∫
C F · dr represents the work done in moving an object from (1, –1, 1) to (2, 1, –1) along C. In
a conservative force field, the work done is independent of the path C joining these points.
Miscellaneous problems
10.32. (a) If x = f (u, υ), y = g(u, υ) defines a transformation which maps a region ℜ of the xy plane into a region ℜ/H11032
of the uυ plane, prove that
xydx dy du du
(,)
(, )ℜℜ
υυ′
∂= ∂∫∫ ∫∫
(b) Interpret geometrically the result in (a).
(a) If C (assumed to be a simple closed curve) is the boundary of ℜ, then by Problem 10.8,
C
dx dy x dy y dx1
2ℜ
=−∫∫ ∫ ÑC∫/H17034  (1)
Under the given transformation, the integral on the right of Equation (1) becomes
C
yyxd u du
1
2 υυ′
∂∂⎛⎞ +⎜⎟∂∂⎝⎠∫ÑC∫/H17034
C
yx y x y xy du d x y du x y duu u
1
2υυυυ υ′
∂∂ ∂ ∂ ∂ ∂⎛⎞ ⎛ ⎞ ⎛ ⎞−+ = −+ −⎜⎟ ⎜ ⎟ ⎜ ⎟∂∂ ∂ ∂ ∂ ∂⎝⎠ ⎝ ⎠ ⎝ ⎠ ∫  (2)


## Page 282

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 271
where C/H11032 is the mapping of C in the uυ plane (we suppose the mapping to be such that C/H11032 is a simple closed
curve also).
By Green’s theorem, if ℜ /H11032 is the region in the u υ plane bounded by C /H11032, the right side of Equation (2)
equals
yx y x x y x yxy x y d u d d u duu u u u
xy du du
1
2
(,)
(, )
ℜ ℜ
ℜ
υυυυ υ υ υ
υυ
′ ′
′
∂∂ ∂ ∂∂ ∂ ∂ ∂ ∂ ∂⎛⎞ ⎛ ⎞ −− − = −⎜⎟ ⎜ ⎟∂∂ ∂ ∂ ∂ ∂ ∂ ∂ ∂ ∂⎝⎠ ⎝ ⎠
∂= ∂
∫∫ ∫∫
∫∫
where we have inserted absolute value signs so as to ensure that the result is nonnegative, as is ∫∫ℜ dx dy.
In general, we can show (see Problem 10.83) that
xyF x y dx dy F f u g u du du
(,)(, ) {(, ) , (, ) } (, )ℜℜ
υυ υ υ′
∂= ∂∫∫ ∫∫  (3)
(b) xydx dy du du
(,)and (, )ℜℜ
υυ′
∂
∂∫∫ ∫∫ represent the area of region R, the first expressed in rectangular co-
ordinates, the second in curvilinear coordinates. See Page 225, and the introduction of the differential
element of surface area for an alternative to (a).
10.33. Let yx
xy22 .−+= +
ijF  (a) Calculate ∇ × F. (b) Evaluate
C∫/H17034F · dr around any closed path and explain the results.
(a) ∇× ∂
∂
∂
∂
∂
∂
−
++
=F =
ij k
in any regionxy z
y
xy
x
xy22 22 0
0 eexcluding ( , )00 .
(b)
C∫/H17034
yd x xd yd xy22 .−=⋅= +∫F r ÑC∫/H17034F · dr  Let x = ρ cos φ, y = ρ sin φ, where (ρ, φ) are polar coordinates. Then
sin cos , cos sindx d d dy d dρφ φ ρ φ ρ φ φ ρφ=− + = +
and so
y dx x dy ydd xxy22 are tanφ−= ⎛⎞== ⎜⎟+ ⎝⎠
For a closed curve ABCDA [see Figure 10.22 (a)] surrounding the origin, φ = 0 at A and φ = 2π after a
complete circuit back to A. In this case the line integral equals ∫2π
0 dφ = 2π.
Figure 10.22


## Page 283

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems272
For a closed curve PQRSP [see Figure 10.22(b)] not surrounding the origin, φ = φ 0 at P and φ = φ 0 after
a complete circuit back to P. In this case the line integral equals d
φ
φ
φ
0
0
=0 .∫
Since F = Pi + Qj, ∇ × F = 0 is equivalent to ∂P/∂y = ∂Q/∂x, the results would seem to contradict those
of Problem 10.11. However, no contradiction exists, since yxPQ
xy xy22 22 and−==
++
 do not have con-
tinuous derivatives throughout any region including (0, 0), and this was assumed in Problem 10.11.
10.34. If div A denotes the divergence of a vector field A at a point P, show that
div A
A n
=
⋅
ΔΔ→
Δ
∫∫
lim
V
S
dS
V0
n
where ΔV is the volume enclosed by the surface ΔS and the limit is obtained by shrinking ΔV to the point P.
By the divergence theorem,
div AA n
ΔΔ
∫∫∫ ∫∫ =⋅
VS
dV dS
By the mean value theorem for integrals, the left side can be written
div A div AdV V
VΔ
∫∫∫ =Δ
where div A is some value intermediate between the maximum and minimum of div A throughout ΔV. Then
div A
An
=
⋅
Δ
Δ
∫∫ dS
V
S
Taking the limit as ΔV →  0 such that P is always interior to ΔV, div A approaches the value div A at point
P: hence,
S
V
dS
V0
An
div A lim Δ
Δ→
⋅
= Δ
∫∫
This result can be taken as a starting point for defining the divergence of A, and from it all the properties
may be derived, including proof of the divergence theorem. We can also use this to extend the concept of di-
vergence to coordinate systems other than rectangular (see Page 170).
Physically,
S
dS VAn /
Δ
⎛⎞ ⋅Δ⎜⎟
⎝⎠∫∫∫  represents the flux or net outflow per unit volume of the vector A from
the surface ΔS. If div A is positive in the neighborhood of a point P, it means that the outflow from P is posi-
tive, and we call P a source. Similarly, if div A is negative in the neighborhood of P, the outflow is really an
inflow, and P is called a sink. If in a region there are no sources or sinks, then div A = 0, and we call A a sole-
noidal vector field.
SUPPLEMENTARY PROBLEMS
Line Integrals
10.35. Evaluate x y dx y x dy
(4,2)
(1,1)
()()++ −∫  along (a) the parabola y2 = x, (b) a straight line, (c) straight lines from
(1, 1) to (1, 2) and then to (4, 2), and (d) the curve x = 2t2 + t + 1, y = t2 + 1.
Ans. (a) 34/3 (b) 11 (c) 14 (d) 32/3


## Page 284

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 273
10.36. Evaluate
C∫/H17034( x y dx y x dy24 ) ( 5 3 6 )−+ + + −  around a triangle in the xy plane with vertices at (0, 0), (3, 0),
(3, 2) traversed in a counterclockwise direction.
Ans. 12
10.37. Evaluate the line integral in Problem 10.36 around a circle of radius 4 with center at (0, 0).
Ans. 64π
10.38. (a) If F = (x2 – y2)i + 2xyj, evaluate C∫ F · dr along the curve C in the xy plane given by y = x2 – x from
the point (1, 0) to (2, 2). (b) Interpret physically the result obtained.
Ans. (a) 124/15
10.39. Evaluate
C
xy d s(2 ) ,+∫  where C is the curve in the xy plane given by x2 + y2 = 25 and s is the are length
parameter, from the point (3, 4) to (4, 3) along the shortest path.
Ans. 15
10.40. If F = (3x – 2y)i + (y + 2z)j – x2k, evaluate
C∫ F · dr from (0, 0, 0) to (1, 1, 1), where C is a path consisting
of (a) the curve x = t, y = t2, z = t3, (b) a straight line joining these points, (c) the straight lines from (0, 0, 0)
to (0, 1, 0), then to (0, 1, 1) and then to (1, 1, 1), and (d) the curve x = z2, z = y2.
Ans. (a) 23/15 (b) 5/3 (c) 0 (d) 13/15
10.41. If T is the unit tangent vector to a curve C (plane or space curve) and F is a given force field, prove that
under appropriate conditions
C∫ F · dr =
C∫ F · T ds, where s is the arc length parameter. Interpret the result
physically and geometrically.
Green’s theorem in the plane, independence of the path
10.42. Verify Green’s theorem in the plane for
C∫/H17034xx y d x y x y d y23 2() ( 2 )−+ − , where C is a square with vertices
at (0, 0), (2, 0), (2, 2), (0, 2) and counterclockwise orientation.
Ans. Common value = 8
10.43. Evaluate the line integrals of (a) Problem 10.36 and (b) Problem 10.37 by Green’s theorem.
10.44. (a) Let C be any simple closed curve bounding a region having area A. Prove that if a1, a2, a3, b1, b2, b3 are
constants,
C∫/H17034a x a y a dx b x b y b dy b a A123 123 1 2() ( ) ( )++ + ++ = −  (b) Under what conditions will the line
integral around any path C be zero?
Ans. (b) a2 = b1
10.45. Find the area bounded by the hypocycloid x2/3 + y2/3 = a2/3. (Hint: Parametric equations are x = a cos3 t,
y = a sin3 t, 0 < t <  2π.)
Ans. 3πa2/8
10.46. If x = ρ cos φ, y = ρ sin φ, prove that x dy y dx d 211 and interpret.22 ρφ−=∫∫ÑC∫/H17034x
10.47. Verify Green’s theorem in the plane for
C∫/H17034xx y d x x y d y32 2() , −+  where C is the boundary of the region
enclosed by the circles x2 + y2 = 4 and x2 + y2 = 16.
Ans. Common value = 120π


## Page 285

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems274
10.48. (a) Prove that xy y dx x xy dy
(2,1) 42 3
(1,0)
(2 3) ( _ 4 )−+ +∫ –  is independent of the path joining (1, 0) and (2, 1).
(b) Evaluate the integral in (a).
Ans. (b) 5
10.49. Evaluate
C
xy y x dx y32(2 cos ) (1 2−+ −∫ xx y d y22sin 3 )+ along the parabola 2x = πy2 from (0, 0) to
(π/2, 1).
Ans. π2/4
10.50. Evaluate the line integral in Problem 10.49 around a parallelogram with vertices at (0, 0), (3, 0), (5, 2), (2, 2).
Ans. 0
10.51. (a) Prove that G  = (2x2 + xy – 2y2) dx + (3x2 + 2xy)dy is not an exact differential. (b) Prove that ey/x G/x is an exact
differential of φ and find φ. (c) Find a solution of the differential equation (2x2 + xy – 2y2) dx + (3x2 + 2xy)dy = 0.
Ans. (b) φ = ey/x (x2 + 2xy) + c (c) x2 + 2xy + ce–y/x = 0
Surface integrals
10.52. (a) Evaluate
S
xy d S22() , +∫∫  where S is the surface of the cone z2 = 3(x2 + y2) bounded by z = 0 and z = 3.
(b) Interpret physically the result in (a).
Ans. (a) 9π
10.53. Determine the surface area of the plane 2x + y + 2z = 16 cut off by (a) x = 0, y = 0, x = 2, y = 3 and
(b) x = 0, y = 0, and x2 + y2 = 64.
Ans. (a) 9 (b) 24π
10.54. Find the surface area of the paraboloid 2z = x 2 + y2 which is outside the cone zx y 22 .=+
Ans. 2 1)3 π( 5 5 −
10.55. Find the area of the surface of the cone z 2 = 3(x2 + y2) cut out by the paraboloid z = x2 + yy 2.
Ans. 6π
10.56. Find the surface area of the region common to the intersecting cylinders x 2 + y2 = a2 and x2 + z2 = a2.
Ans. 16a2
10.57. (a) Obtain the surface area of the sphere x 2 + y2 + z2 = a2 contained within the cone z tan xy22α= + ,
0 < α < π/2. (b) Use the result in (a) to find the surface area of a hemisphere. (c) Explain why formally
placing α = π in the result of (a) yields the total surface area of a sphere.
Ans. (a) 2πa2(1 – cos α) (b) 2πa 2 (consider the limit as α→π /2)
10.58. Determine the moment of inertia of the surface of a sphere of radius a about a point on the surface. Assume
a constant density σ.
Ans. 2Ma2, where mass M = 4πa2 σ


## Page 286

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 275
10.59. (a) Find the centroid of the surface of the sphere x 2 + y2 + z2 = a2 contained within the cone z tan
xy22α= + , 0 < α < π/2. (b) From the result in (a) obtain the centroid of the surface of a hemisphere.
Ans. (a) 1/2a(1 + cos α) (b) a/2
The divergence theorem
10.60. Verify the divergence theorem for A = (2xy + z)i + y 2j – (x + 3y)k taken over the region bounded by 2x + 2y
+ z = 6, x = 0, y = 0, z = 0.
Ans. common value = 27
10.61. Evaluate
S
nd SF.⋅∫∫  where F = (z2 – x)i – xyj + 3zk and S is the surface of the region bounded by z = 4 – y2,
x = 0, x = 3 and the xy plane.
Ans. 16
10.62. Evaluate
S
nd SA.⋅∫∫  where A = (2x + 3z)i – (xz + y)j + (y2 + 2z)k and S is the surface of the sphere having
center at (3, –1, 2) and radius 3.
Ans. 108π
10.63. Determine the value of
S
x dy dz y dz dx z dx dy ,++∫∫  where S is the surface of the region bounded by the
cylinder x2 + y2 = 9 and the planes z = 0 and z = 3, (a) by using the divergence theorem and (b) directly.
Ans. 81π
10.64. Evaluate
S
xz dy dz y dz dx yz dx dy24, −+∫∫  where S is the surface of the cube bounded by x = 0, y = 0,
z = 0, x = 1, y = 1, z = 1, (a) directly and (b) By Green’s theorem in space (divergence theorem).
Ans. 3/2
10.65. Prove that
S
(∇×∫∫ A) · n dS for any closed surface S.
10.66. Prove that
S
∫∫n dS = 0. where n is the outward drawn normal to any closed surface S. (Hint: Let A = Θc,
where c is an arbitrary vector constant.) Express the divergence theorem in this special case. Use the
arbitrary property of c.
10.67. If n is the unit outward drawn normal to any closed surface S bounding the region V, prove that
V
dV Sdiv n =∫∫∫ n
Stokes’s theorem
10.68. Verify Stokes’s theorem for A = 2yi + 3xj – z 2k, where S is the upper half surface of the sphere x2 + y2 + z2 =
9 and C is its boundary.
Ans. Common value = 9π


## Page 287

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems276
10.69. Verify Stokes’s theorem for A = (y + z)i – xzj + y 2k, where S is the surface of the region in the first octant
bounded by 2x + z = 6 and y = 2 which is not included in the (a) xy plane, (b) plane y = 2, and (c) plane 2x +
z = 6 and C is the corresponding boundary.
Ans. The common value is (a) –6, (b) –9, and (c) –18.
10.70. Evaluate
S
(∇×∫∫ A) · n dS. where A = (x – z)i + (x3 + yz)j – 3xy2k and S is the surface of the cone
z = 2 – xy22+  above the xy plane.
Ans. 12π
10.71. If V is a region bounded by a closed surface S and B = ∇ × A, prove that
S
∫∫B · n dS = 0
10.72. (a) Prove that F = (2xy + 3)i + (x 2 – 4z)j – 4yk is a conservative force field. (b) Find φ such that F = ∇φ.
(c) Evaluate
C∫ F · dr, where C is any path from (3, –1, 2) to (2, 1, –1).
Ans. (b) φ = x2y – 4yz + 3x + constant (c) 6
10.73. Let C be any path joining any point on the sphere x2 + y2 + z2 = a2 to any point on the sphere x2 + y2 + z2 =
b2. Show that if F = 5r3r, where r = xi + yj + zk, then
C∫ F · dr = b5 – a5.
10.74. In Problem 10.73 evaluate
C∫ F · dr is F = f (r)r, where f (r) is assumed to be continuous.
Ans.
b
a
rf r d r()∫
10.75. Determine whether there is a function φ such that F = ∇φ, where (a) F = (xz – y)i + (x 2y + z3)j + (3xz2 – xy)
k, and (b) F = 2xe–yi + (cos z – x2 e–y)j – y sin zk. If so, find it.
Ans. (a) φ does not exist (b) φ = x2e–y + y cos z + constant
10.76. Solve the differential equation (z 3 – 4xy) dx + (6y – 2x2) dy + (3xz2 + 1) dz = 0.
Ans. xz3 – 2x2y + 3y2 + z = constant
Miscellaneous problems
10.77. Prove that a necessary and sufficient condition that
C∫/H17034
UUdy dxxy
∂∂ −∂∂
 be zero around every simple closed
path C in a region ℜ (where U is continuous and has continuous partial derivatives of order two, at least) is
that UU
xy
22
22 0.∂∂ +=
∂∂
10.78. Verify Green’s theorem for a multiply connected region containing two “holes” (see Problem 10.10).
10.79. If P dx + Q dy is not an exact differential but μ(P dx + Q dy) is an exact differential where μ is some
function of x and y, then μ is called an integrating factor. (a) Prove that if F and G are functions of x alone
then (Fy + G) dx + dy has an integrating factor μ which is a function of x alone, and find μ. What must be
assumed about F and G? (b) Use (a) to find solutions of the differential equation xy´ = 2x + 3y.
Ans. (a) μ = e∫F(x)dx (b) y = cx3 – x, where c is any constant


## Page 288

CHAPTER 10  Line Integrals, Surface Integrals, and Integral Theorems 277
10.80. Find the surface area of the sphere x 2 + y2 + (z – a)2 = a2 contained within the paraboloid z = x2 + y2.
Ans. 2πa
10.81. If f (r) is a continuously differentiable function of rx y z 222 .=+ +  prove that
fr d S fr
r dV
VS
() ()nr = ′
∫∫∫ ∫∫
10.82. Prove that
S
(φ∇×∫∫ n)dS = 0, where φ is any continuously differentiable scalar function of position and n is
a unit outward drawn normal to a closed surface S. (See Problem 10.66.)
10.83. Establish Equation (3). Problem 10.32, by using Green’s theorem in the plane. [Hint: Let the closed region ℜ
in the xy plane have boundary C and suppose that under the transformation x = f(u, υ), y = g(u, υ), these are
transformed into ℜ´ and C´ in the uυ plane, respectively.] First prove that
C
Fxyd x d y Qxyd y(,) (,)
ℜ
=∫∫ ∫
where Qy F x y/( , ) .∂∂ =  Then show that, apart from sign, this last integral is equal to
C
ggQfu g u d u d u[( ,) ,( ,) ] .υυ υ υ
∂∂ +∂∂∫  Finally, use Green’s theorem to transform this into
xyFfu g u d u d u
(,)[( ,) ,( ,) ] . (, )ℜ
υυ υ υ′
∂
∂∫∫
10.84. If x = f (u, υ, w), y = g(u, υ, w), z = h(u, υ, w) defines a transformation which maps a region ℜ of xyz space
into a region ℜ´ of uυw space, prove, using Stokes’s theorem, that
xyzF x y z dxdydz G u w dud dw uw
(,,)(,,) (,, ) (, , )ℜℜ
υυ υ′
∂= ∂∫∫∫ ∫∫∫
where G(u, υ, w) ≡ F[ f (u, υ, w), g(u, υ, w), h(u, υ, w)]. State sufficient conditions under which the result is
valid. See Problem 10.83. Alternatively, employ the differential element of volume dV du d dwuw υυ
∂∂ ∂=⋅×∂∂ ∂
rr r
(recall the geometric meaning).
10.85. (a) Show that, in general, the equation r = r(u, υ) geometrically represents a surface. (b) Discuss the
geometric significance of u = c1, υ = c2, where c1 and c2 are constants. (c) Prove that the element of arc
length on this surface is given by
ds2 = Ed u2 + 2F du dυ + Gd υ2
where E uu F u= ∂
∂ ⋅∂
∂ = ∂
∂ ⋅∂
∂
rr rr ,, υ
and G = ∂
∂ ⋅∂
∂
rr .υυ
10.86. (a) Referring to Problem 10.85, show that the element of surface area is given by dS = EG F 2− du dυ. (b)
Deduce from (a) that the area of a surface r = r(u, υ) is
S
EG F dud2 .υ −∫∫  [Hint: Use the fact that
uu u
rr rr r r
υυυ
∂∂ ∂∂ ∂ ∂ ⎛⎞ ⎛ ⎞ ⎛ ⎞×= × ⋅ × ⎜⎟ ⎜ ⎟ ⎜ ⎟∂∂ ∂∂ ∂ ∂ ⎝⎠ ⎝ ⎠ ⎝ ⎠
 and then use the identity (A × B) · (C × D) = (A · C)(B · D) –
(A · D)(B · C).]
10.87. (a) Prove that r = a sin u cos υi + a sin u sin υj + a cos u, 0 < u < π, 0 < υ < 2π represents a sphere of
radius a. (b) Use Problem 10.86 to show that the surface area of this sphere is 4πa2.
10.88. Use the result of Problem 10.34 to obtain div A in (a) cylindrical and (b) spherical coordinates.
See Page 173.


## Page 289

This page intentionally left blank


## Page 290

279
CHAPTER 11
Infinite Series
The early developers of the calculus, including Newton and Leibniz, were well aware of the importance of
infinite series. The values of many functions such as sine and cosine were geometrically obtainable only in
special cases. Infinite series provided a way of developing extensive tables of values for them.
This chapter begins with a statement of what is meant by infinite series, then the question of when these
sums can be assigned values is addressed. Much information can be obtained by exploring infinite sums of
constant terms; however, the eventual objective in analysis is to introduce series that depend on variables.
This presents the possibility of representing functions by series. Afterward, the question of how continuity,
differentiability, and integrability play a role can be examined.
The question of dividing a line segment into infinitesimal parts has stimulated the imaginations of phi-
losophers for a very long time. In a corruption of a paradox introduced by Zeno of Elea (in the fifth century
B.C.) a dimensionless frog sits on the end of a one-dimensional log of unit length. The frog jumps halfway,
and then halfway and halfway ad infinitum. The question is whether the frog ever reaches the other end.
Mathematically, an unending sum,
11
24++ . . . 1
2n++ . . .
is suggested. Common sense tells us that the sum must approach 1 even though that value is never attained.
We can form sequences of partial sums
12
11 1,,22 4SS== +  . . . 11, 24nS =++ . . . 1
2n+ Sn+1 . . .
and then examine the limit. This returns us to Chapter 2 and the modern manner of thinking about the in-
finitesimal.
In this chapter, consideration of such sums launches us on the road to the theory of infinite series.
Definitions of Infinite Series and Their Convergence and Divergence
Definition The sum
12
1
n
n
Su u u
∞
=
== + +∑ . . . nu++ . . . (1)
is an infinite series. Its value, if one exists, is the limit of the sequence of partial sums {Sn}
lim nn
SS
→∞
=  (2)
If there is a unique value, the series is said to converge to that sum S. If there is not a unique sum, the
series is said to diverge.
Sometimes the character of a series is obvious. For example, the series
1
1
2n
n
∞
=
∑  generated by the frog on the
log surely converges, while
1n
n
∞
=
∑  is divergent. On the other hand, the variable series 1 – x + x2 – x3 + x4 – x5 + . . .
raises questions.


## Page 291

CHAPTER 11  Infinite Series280
This series may be obtained by carrying out the division 1 .1 x−  If –1 < x < 1, the sum S n yields an ap-
proximation to 1
1 x−  and Equation (2) is the exact value. The indecision arises for x = –1. Some very great
mathematicians, including Leonhard Euler, thought that S should be equal to 1 ,2  as is obtained by substitut-
ing – 1 into 1 .1 x−  The problem with this conclusion arises with examination of 1 – 1 + 1 – 1 + 1 – 1 + . . . and
observation that appropriate associations can produce values of 1 or 0. Imposition of the condition of unique-
ness for convergence puts this series in the category of divergent and eliminates such possibility of ambigu-
ity in other cases.
Fundamental Facts Concerning Infinite Series
1. If Σun converges, then lim
n→∞
un = 0 (see Problem 2.26). The converse, however, is not necessarily true;
i.e., if lim
n→∞
un = 0, Σun may or may not converge. It follows that if the nth term of a series does not ap-
proach zero, the series is divergent.
2. Multiplication of each term of a series by a constant different from zero does not affect the convergence
or divergence.
3. Removal (or addition) of a finite number of terms from (or to) a series does not affect the convergence
or divergence.
Special Series
1. Geometric series 12
1
n
n
ar a ar ar
∞
−
=
=+ + +∑ . . .  ,  where a  and r  are constants, converges to
if 11
aSr r=< −  and diverges if r >  1. The sum of the first n  terms is (1 )
1
n
n
arS r
−= −  (see
Problem 2.25).
2. The p series
1
1111
123pp p p
n n
∞
=
=+ ++∑ . . . ,where p is a constant, converges for p > 1 and diverges for
p <  1. The series with p = 1 is called the harmonic series.
Tests for Convergence and Divergence of Series of Constants
More often than not, exact values of infinite series cannot be obtained. Thus, the search turns toward informa-
tion about the series. In particular, its convergence or divergence comes into question. The following tests
aid in discovering this information.
1. The comparison test for series of nonnegative terms.
(a) Convergence. Let υn >  0 for all n > N and suppose that Συ n converges. Then if 0 < un < υn for all
n > N, Σun also converges. Note that n > N means from some term onward. Often, N = 1.
EXAMPLE. Since 11
21 2nn ≤
+
 and 1
2n∑  converges, 1
1
2n +∑  also converges.


## Page 292

CHAPTER 11  Infinite Series 281
(b) Divergence. Let υn >  0 for all n > N and suppose that Συ n diverges. Then if un > υn for all n > N, Σun
also diverges.
EXAMPLE. Since 11
ln nn>  and
2
1
n n
∞
=
∑  diverges,
2
1
lnn n
∞
=
∑  also diverges.
2. The limit-comparison or quotient test for series of nonnegative terms.
(a) If un >  0 and υ n >  0 and if lim n
n n
u
υ→∞
 = A /HS11005 0 or /H11009, then Σun and Συ n either both converge or both di-
verge.
(b) If A = 0 in (a) and Συ n converges, then Σun converges.
(c) If A = /H11009 in (a) and Συn diverges, then Σun diverges.
This test is related to the comparison test and is often a very useful alternative to it. In particular, taking
υn = 1 /np, we have the following theorems from known facts about the p series.
Theorem 1 Let lim
n→∞
np un = A. Then
(i) Σun conyerges if p > 1 and A is finite.
(ii) Σun diverges if p <  1 and A /HS11005 0 (A may be infinite).
EXAMPLES 1. 342
n
n −∑  converges since 2
3
1lim .442n
nn
n→∞
⋅=
−
 2. In
1
n
n +∑  diverges since 1/2
1/2
Inlim .
(1 )n
nn
n→∞
⋅= ∞
+
3. Integral test for series of non-negative terms.
If f (x) is positive, continuous, and monotonic decreasing for x > N and is such that f (n) = un, n =
N, N + 1, N + 2, . . . , then Σun converges or diverges according as () l i m ()
M
MNn
fxd x fxd x
∞
→∞
=∫∫  con-
verges or diverges. In particular, we may have N = 1, as is often true in practice.
This theorem borrows from Chapter 12, since the integral has an unbounded upper limit. (It is an
improper integral. The convergence or divergence of these integrals is defined in much the same way
as for infinite series.)
EXAMPLE: 2
1
1
n n
∞
=
∑  converges since 21
1lim lim 1
M
MM
dx
Mx→∞ →∞
⎛⎞=− ⎜⎟⎝⎠∫  exists.
4. Alternating series test. An alternating series is one whose successive terms are alternately positive
and negative.
An alternating series converges if the following two conditions are satisfied (see Problem 11.15).
(a) ⏐un + 1⏐ < ⏐un⏐ for n > N. (Since a fixed number of terms does not affect the convergence or divergence
of a series, N may be any positive integer. Frequently it is chosen to be 1.)
(b) lim lim
n n n nuu
→∞ →∞
== ()00or
EXAMPLE. For the series 11111 2345−+−+−= LL
1
1
(1 ) ,
n
n n
∞ −
=
−
∑  we have
1(1 ) ,
n
nu n
−−= 1 ,nu n=
1
1 .1nu n+ = +
 Then for n >  1, ⏐un + 1⏐ < ⏐un⏐. Also lim
n→∞
⏐un⏐ = 0. Hence, the series converges.
Theorem 2 The numerical error made in stopping at any particular term of a convergent alternating series
which satisfies conditions (a) and (b) is less than the absolute value of the next term.
EXAMPLE. If we stop at the fourth term of the series 11111 2345−+−+− . . . , the error made is less than
1
5
 = 0.2.


## Page 293

CHAPTER 11  Infinite Series282
5. Absolute and conditional convergence. The series Σun is called absolutely convergent if Σ⏐un⏐ con-
verges. If Σun converges but Σ⏐un⏐ diverges, then Σu n is called conditionally convergent.
Theorem 3 If Σ⏐u n⏐ converges, then Σu n converges. In words, an absolutely convergent series is conver-
gent (see Problem 11.17).
EXAMPLE 1. 222222
111111
123456
+−−++− . . . is absolutely convergent and thus convergent, since the
series of absolute values 2222
1111
1234
++++ . . . converges.
EXAMPLE 2. 1111 234−+−+ . . . converges, but 1111 234++++ . . . diverges. Thus, 1111 234−+−+ . . .
is conditionally convergent.
Any of the tests used for series with nonnegative terms can be used to test for absolute convergence. Also,
tests that compare successive terms are common. Tests 6, 8, and 9 are of this type.
6. Ratio test. Let 1lim . n
n n
u
Lu
−
→∞
=  Then the series Σun
(a) converges (absolutely) if L < 1.
(b) diverges if L > 1.
If L = 1 the test fails.
7. The nth root test. Let lim .n nn
uL
→∞
=  Then the series Σun
(a) converges (absolutely) if L < 1
(b) diverges if L > 1.
If L = 1 the test fails.
8. Raabe’s test. Let 1lim 1 . n
n n
unL u→∞
⎛⎞ +−=⎜⎟⎜⎟⎝⎠
 Then the series Σun
(a) converges (absolutely) if L > 1.
(b) diverges or converges conditionally if L < 1.
If L = 1 the test fails.
This test is often used when the ratio tests fails.
9. Gauss’s test. 2
1If 1 ,nn
n
uc L
un n
+ =− + q  where ⏐cn⏐ < P for all n > N the sequence cn is bounded, then the
series Σun
(a) converges (absolutely) if L > 1.
(b) diverges or converges conditionally if L
<  1.
This test is often used when Raabe’s test fails.
Theorems on Absolutely Convergent Series
Theorem 4 (Rearrangement of terms.) The terms of an absolutely convergent series can be rearranged in any
order, and all such rearranged series will converge to the same sum. However, if the terms of a conditionally
convergent series are suitably rearranged, the resulting series may diverge or converge to any desired sum (see
Problem 11.80).
Theorem 5 (Sums, differences, and products.) The sum, difference, and product of two absolutely conver-
gent series is absolutely convergent. The operations can be performed as for finite series.


## Page 294

CHAPTER 11  Infinite Series 283
Infinite Sequences and Series of Functions, Uniform Convergence
We opened this chapter with the thought that functions could be expressed in series form. Such representation
is illustrated by
33 2 1
1sin ( 1)3! 5! (2 )!
n
nxx xxx n
−
−=− + − + + − + −LLL L
where
32 1
1
12
1
sin lim . with S , , ( 1)3! (2 1)!
n k
k
nnn k
xxxS x S x S k
−
−
→∞ =
== = − = − −∑KL
Observe that until this section the sequences and series depended on one element, n. Now there is variation
with respect to x as well. This complexity requires the introduction of a new concept called uniform conver-
gence, which, in turn, is fundamental in exploring the continuity, differentiation, and integrability of series.
Let {u
n(x)}, n = 1, 2, 3, . . . be a sequence of functions defined in [a, b]. The sequence is said to converge to
F(x), or to have the limit F (x) in [a, b], if for each /H9280 > 0 and each x  in [a, b] we can find N  > 0 such that
⏐un(x) – F(x)⏐ < /H9280 for all n > N. In such case we write lim
n→∞
un(x) = F(x). The number N may depend on x as
well as /H9280. If it depends only on /H9280 and not on x, the sequence is said to converge to F(x) uniformly in [a, b] or to
be uniformly convergent in [a, b].
The infinite series of functions
123() () () ()n
n
ux ux u x u x
∞
=+++∑ . . . (3)
is said to be convergent in [a,b] if the sequence of partial sums {Sn(x)}, n = 1, 2, 3, . . . , where Sn(x) = u1(x)
+ u2(x) + . . . + un(x), is convergent in [a,b]. In such case we write lim
n→∞
Sn(x) = S(x) and call S(x) the sum of
the series.
It follows that Σu n(x) converges to S(x) in [a, b] if for each /H9280 > 0 and each x in [a,b] we can find N > 0
such that ⏐Sn(x) – S(x)⏐ < /H9280 for all n > N. If N depends only on /H9280 and not on x, the series is called uniformly
convergent in [a, b].
Since S(x) – Sn(x) = Rn(x), the remainder after n terms, we can equivalently say that Σu n(x) is uniformly
convergent in [a, b] if for each /H9280 > 0 we can find N depending on /H9280 but not on x such that ⏐Rn(x)⏐ < /H9280 for all
n > N and all x in [a, b].
These definitions can be modified to include other intervals besides a< x < b, such as a < x < b, and so on.
The domain of convergence (absolute or uniform) of a series is the set of values of x for which the series
of functions converges (absolutely or uniformly).
EXAMPLE 1. Suppose un = xn/n and – 1/2 < x <  1. Now think of the constant function F(x) = 0 on this in-
terval. For any /H9280 > 0 and any x in the interval, there is N such that for all n > N⏐un – F(x)⏐ < /H9280, i.e., ⏐xn/n⏐ < /H9280.
Since the limit does not depend on x, the sequence is uniformly convergent.
EXAMPLE 2. If un = xn and 0 < x <  1, the sequence is not uniformly convergent because [think of the func-
tion F(x) = 0, 0 < x < 1, F(1) = 1]
0 whennnxx εε−< <
thus
n ln x < ln ε
On the interval 0 < x < 1, and for 0 < /H9280 < 1, both members of the inequality are negative; therefore,
ln .lnn x
ε>  Since ln ln 1 ln ln (/ ) ,ln ln 1 ln (1/ )xn n xx
εε ε −== − ln
 it follows that we must choose N such that
ln 1/
ln 1/nN x
ε>>
From this expression we see that /H9280→ 0, then ln 1ln ε → /H11009, and also as x→ 1 from the left 1ln x → 0
from the right; thus, in either case, N must increase without bound. This dependency on both /H9280 and x dem-
onstrates that the sequence is not uniformly convergent. For a pictorial view of this example, see Figure 11.1.


## Page 295

CHAPTER 11  Infinite Series284
Figure 11.1
Special Tests for Uniform Convergence of Series
1. Weierstrass M test. If a sequence of positive constants M1, M2, M3, . . . can be found such that in some
interval
(a) ⏐un(x)⏐ < Mn n = 1, 2, 3, . . .
(b) ΣMn converges
then Σun(x) is uniformly and absolutely convergent in the interval.
EXAMPLE. 2
1
cos
n
nx
n
∞
=
∑  is uniformly and absolutely convergent in [0, 2π] since 22 2
cos 1 1 andnx
nn n
≤ ∑
converges.
This test supplies a sufficient but not a necessary condition for uniform convergence, i.e., a series
may be uniformly convergent even when the test cannot be made to apply.
Because of this test, we may be led to believe that uniformly convergent series must be absolutely
convergent, and conversely. However, the two properties are independent; i.e., a series can be uniformly
convergent without being absolutely convergent, and conversely. See Problems 11.30 and 11.127.
2. Dirichlet’s test. Suppose that
(a) the sequence {a n} is a monotonic decreasing sequence of positive constants having limit zero.
(b) there exists a constant P such that for a < x < b⏐u1(x) + u2(x) + . . . + un(x)⏐ < P,   for all n > N.
Then the series 11au 22() ()xa u x++ . . .
1
nn
n
au
∞
=
= ∑ (x) is uniformly convergent in a < x < b.
Theorems on Uniformly Convergent Series
If an infinite series of functions is uniformly convergent, it has many of the properties possessed by sums of
finite series of functions, as indicated in the following theorems.
Theorem 6 If {u
n(x)}, n = 1, 2, 3, . . . are continuous in [a,b] and if Σun(x) converges uniformly to the sum
S(x) in [a, b], then S(x) is continuous in [a, b].
Briefly, this states that a uniformly convergent series of continuous functions is a continuous function.
This result is often used to demonstrate that a given series is not uniformly convergent by showing that the
sum function S(x) is discontinuous at some point (see Problem 11.30).


## Page 296

CHAPTER 11  Infinite Series 285
In particular, if x0 is in [a, b], then the theorem states that
00
0
11 1
lim ( ) lim ( ) ( )nn nxx xxnn n
ux ux ux
∞∞ ∞
→→ == =
==∑∑ ∑
where we use right- or left-hand limits in case x0 is an endpoint of [a, b].
Theorem 7 If {u n(x)}, n = 1, 2, 3, . . . are continuous in [a,b] and if Σun(x) converges uniformly to the sum
S(x) in [a, b], then
1
() ()
bb
naa n
S x dx u x dx
∞
=
= ∑∫∫  (4)
or
11
() ()
bb
nnaa nn
ux d x ux d x
∞∞
==
⎧⎫⎪⎪ =⎨⎬
⎪⎪⎩⎭
∑∑∫∫  (5)
Briefly, a uniformly convergent series of continuous functions can be integrated term by term.
Theorem 8 If {u n(x)}, n = 1, 2, 3, . . . are continuous and have continuous derivatives in [a,b] and if Σun(x)
converges to S(x) while Σu/H11032n(x) is uniformly convergent in [a, b], then in [a, b]
1
() () n
n
Sx ux
∞
′
=
′= ∑  (6)
or
11
() ()nn
nn
dd ux uxdx dx
∞∞
==
⎧⎫⎪⎪ =⎨⎬
⎪⎪⎩⎭
∑∑  (7)
This shows conditions under which a series can be differentiated term by term.
Theorems similar to these can be formulated for sequences. For example, if { un(x)}, n = 1, 2, 3, . . . is
uniformly convergent in [a, b], then
lim ( ) lim ( )
bb
nnnn aa
u x dx u x dx
→∞ →∞
=∫∫  (8)
which is the analog of Theorem 7.
Power Series
A series having the form
2
01 2aa x a x++ + . . .
0
n
n
n
ax
∞
=
= ∑  (9)
where a0, a1, a2, . . . are constants, is called a power series in x. It is often convenient to abbreviate the series
(9) as Σanxn.
In general, a power series converges for ⏐x⏐ < R and diverges for ⏐x⏐ > R, where the constant R is called
the radius of convergence of the series. For ⏐x⏐ = R, the series may or may not converge.
The interval ⏐x⏐ < R or – R < x < R, with possible inclusion of endpoints, is called the interval of conver-
gence of the series. Although the ratio test is often successful in obtaining this interval, it may fail, and in
such cases, other tests may be used (see Problem 11.22).
The two special cases R = 0 and R = /H11009 can arise. In the first case the series converges only for x = 0; in
the second case it converges for all x, sometimes written –/H11009 < x < /H11009 (see Problem 11.25). When we speak of
a convergent power series, we shall assume, unless otherwise indicated, that R > 0.
Similar remarks hold for a power series of the form (9), where x is replaced by (x – a).


## Page 297

CHAPTER 11  Infinite Series286
Theorems on Power Series
Theorem 9 A power series converges uniformly and absolutely in any interval which lies entirely within
its interval of convergence.
Theorem 10 A power series can be differentiated or integrated term by term over any interval lying entirely
within the interval of convergence. Also, the sum of a convergent power series is continuous in any interval
lying entirely within its interval of convergence.
This follows at once from Theorem 9 and the theorem on uniformly convergent series on Pages 284 and
285. The results can be extended to include endpoints of the interval of convergence by the following theo-
rems.
Theorem 11 Abel’s theorem. When a power series converges up to and including an endpoint of its interval
of convergence, the interval of uniform convergence also extends so far as to include this endpoint. See
Problem 11.42.
Theorem 12 Abel’s limit theorem. If
0
n
n
n
ax
∞
=
∑  converges at x = x0, which may be an interior point or an
endpoint of the interval of convergence, then
0
00 00 0
lim limnn n
nn nxx xx nn n
ax ax ax
∞∞ ∞
→→ == =
⎧⎫⎪⎪ ⎧⎫==⎨⎬ ⎨ ⎬ ⎩⎭⎪⎪⎩⎭
∑∑ ∑  (10)
If x0 is an endpoint, we must use x → x0 + or x → x0 – in Equation (10) according as x0 is a left- or a right-
hand endpoint.
This follows at once from Theorem 11 and Theorem 6 on the continuity of sums of uniformly convergent
series.
Operations With Power Series
In the following theorems we assume that all power series are convergent in some interval.
Theorem 13 Two power series can be added or subtracted term by term for each value of x common to
their intervals of convergence.
Theorem 14 Two power series, for example,
00
andnn
nn
nn
ax bx
∞∞
==
∑∑ , can be multiplied to obtain
0
n
n
n
cx
∞
=
∑
where
01 1 2 2nn n nca ba b a b −−=+ + +  . . . 0nab+  (11)
the result being valid for each x within the common interval of convergence.
Theorem 15 If the power series
0
n
n
n
ax
∞
=
∑  is divided by the power series Σbnxn where b0 /HS11005 0, the quotient
can be written as a power series which converges for sufficiently small values of x.
Theorem 16 If
0
,n
n
n
ya x
∞
=
= ∑  then by substituting
0
,n
n
n
xb y
∞
=
= ∑  we can obtain the coefficients bn in terms
of an. This process is often called reversion of series.
Expansion of Functions in Power Series
This section gets at the heart of the use of infinite series in analysis. Functions are represented through them.
Certain forms bear the names of mathematicians of the eighteenth and early nineteenth centuries who did so
much to develop these ideas.


## Page 298

CHAPTER 11  Infinite Series 287
A simple way (and one often used to gain information in mathematics) to explore series representation of
functions is to assume such a representation exists and then discover the details. Of course, whatever is found
must be confirmed in a rigorous manner. Therefore, assume
2
01 2() ( ) ( )fx A A x c A x c=+ − + − + . . . () n
nAx c+− + . . .
Notice that the coefficients An can be identified with derivatives of f. In particular,
01 2
1() , () , () , 2!Af c Af c A f c== ′ = ′ ′ . . . , ()1
!
n
nAf n= () ,c . . .
This suggests that a series representation of f is
21() () () ( ) ( ) 2!fx fc f c x c f x c=+ ′− + ′ ′ − + . . . ()1
!
nfn+ () ( ) ncx c − . . .
A first step in formalizing series representation of a function f, for which the first n derivatives exist, is
accomplished by introducing Taylor polynomials of the function.
01
2
2
() () () () () ( ) ,
1() () () ( ) () ( ), 2!
P x fc Px fc f c x c
P x f c f c xc fc xc
== + ′ −
=+ ′− + ′ ′−
()1() () () ( ) !
n
nPx f c fcx c f n=+ ′− + LL () ( ) ncx c −  (12)
Taylor’s Theorem
Let f and its derivatives f′,f ″, . . . , f(n) exist and be continuous in a closed interval a ≤ x ≤ b and suppose that
f (n + 1) exists in the open interval a < x < b. Then for c in [a, b],
f (x) = Pn(x) + Rn(x)
where the remainder Rn(x) may be represented in any of the three following ways.
For each n there exists ξ such that
(1 ) 11( ) ( )( ) (Lagrange form)(1 ) !
nn
nRx f x c n ξ++=− +
 (13)
(ξ is between c and x.)
(The theorem with this remainder is a mean value theorem. Also, it is called Taylor’s formula.)
For each n there exists ξ such that
(1 )1( ) ( )( ) ( ) (Cauchy form)!
nn
nRx f x x cn ξξ+=− −  (14)
(1 )1( ) ( ) ( ) (Integral form)!
x nn
n c
Rx x t f t d tn
+=− ∫  (15)
If all the derivatives of f exist, then the following form, without remainder, may be explored:
()
0
1() () ( )!
nn
n
fx f c x c n
∞
=
=−∑  (16)
This infinite series is called a Taylor series, although when c = 0, it can also be referred to as a MacLaurin
series or expansion.
We might be tempted to believe that if all derivatives of f(x) exist at x = c, the expansion shown here would be
valid. This, however, is not necessarily the case, for although one can then formally obtain the series on the right
of the expansion, the resulting series may not converge to f(x). For an example of this see Problem 11.108.


## Page 299

CHAPTER 11  Infinite Series288
Precise conditions under which the series converges to f (x) are best obtained by means of the theory of
functions of a complex variable. (See Chapter 16.)
The determination of values of functions at desired arguments is conveniently approached through Taylor
polynomials.
EXAMPLE. The value of sin x may be determined geometrically for 0, ,π
6
 and an infinite number of other
arguments. To obtain values for other real number arguments, a Taylor series may be expanded about any of
these points. For example, let c = 0 and evaluate several derivatives there; i.e., f(0) = sin 0 = 0, f ′(0) = cos 0 = 1,
f ″(0) = – sin 0 = 0, f″′(0) = –cos 0 = –1, flv(0) = sin 0 = 0, f v(0) = cos 0 = 1.
Thus, the MacLaurin expansion to five terms is
3511sin 0 0 0 3! 51xx x x=+−− +− + . . .
Since the fourth term is 0, the Taylor polynomials P3 and P4 are equal, i.e.,
3
34() () 3!
xPx p x x== −
and the Lagrange remainder is
5
4
1() c o s5!Rx x ξ =
Suppose an approximation of the value of sin .3 is required. Then
3
4
1(.3) .3 (.3) .2945.6P =− ≈
The accuracy of this approximation can be determined from examination of the remainder. In particular
(remember ⏐cos ξ⏐ ≤ 1),
5
4 5
1 1 243cos (.3) .0000215! 120 10
R ξ=≤ <
Thus, the approximation P4(.3) for sin .3 is correct to four decimal places.
Additional insight into the process of approximation of functional values results by constructing a graph
of P4(x) and comparing it to y = sin x. (See Figure 11.2.)
3
4 () 6
xPx x =−
Figure 11.2
The roots of the equation are 0, ± 6 . Examination of the first and second derivatives reveals a relative
maximum at x = 2  and a relative minimum at x = 2− . The graph is a local approximation of the sin curve.
The reader can show that P6(x) produces an even better approximation.
(For an example of series approximation of an integral, see the example that follows.)


## Page 300

CHAPTER 11  Infinite Series 289
Some Important Power Series
The following series, convergent to the given function in the indicated intervals, are frequently employed
in practice:
1. sin x
357
3! 5! 7!
xxxx=− + − + . . .
21
1(1 ) (2 1)!
n
n x
n
−
−−+ −
. . . x−∞< <∞
2. cos x
246
1 2! 4! 6!
xxx=− + − + . . .
22
1(1 ) (2 2)!
n
n x
n
−
−−+ −
. . . x−∞< <∞
3. xe
23
1 2! 3!
xxx=+ + + + . . .
1
(1 ) !
nx
n
−
++ −
. . . x−∞< <∞
4. ln 1 + x
234
234
xxxx=− + − + . . . 1(1 )
n
n x
n
−−+ . . . –11 x<≤
5.
3571+1 ln21 3 57
x xxxxx =+ + + +−
. . .
21
21
nx
n
−
++ −
. . . –11 x<<
6. 1tan x−
357
357
xxxx=− + − + . . .
21
1(1 ) 21
n
n x
n
−
−−+ −
. . . –11 x≤≤
7. (1 ) px+ 2(1 )1 2!
Pppx x −=+ + + . . . (1 ) ( 1 )
!
nPp p n xn
−− +++ KK . . .
This is the binomial series.
(a) If p is a positive integer or zero, the series terminates.
(b) If p > 0 but is not an integer, the series converges (absolutely) for – 1 < x <  1.
(c) If –1 < p < 0, the series converges for –1 < x <  1.
(d) If p <  –1, the series converges for – 1 < x < 1.
For all p, the series certainly converges if –1 < x < 1.
EXAMPLE. Taylor’s theorem applied to the series for e x enables us to estimate the value of the integral
21
0
.xed x∫ Substituting x2 for x, we obtain
2 46811 10
00
1 2! 3! 4! 5!
x xxx eed x x x d x
ξ⎛⎞=+ + + + +⎜⎟⎜⎟⎝⎠∫∫
where
468
4
111() 1 2! 3! 4!px x x x x=+ + + +
and
10
4 () , 0 5!
eRx x x
ξ
ξ=< <
Then
1
40
11 1 1( ) 1 1.46183 5(2!) 7(3!) 9(4!)Px d x =+ + + + ≈∫
1011 1 10
400 0
( ) .00215! 5! 11.5
ex eR x dx x dx e dx
ξ
≤≤ = <∫∫ ∫
Thus, the maximum error is less than .0021 and the value of the integral is accurate to two decimal places.


## Page 301

CHAPTER 11  Infinite Series290
Special Topics
1. Functions defined by series are often useful in applications and frequently arise as solutions of dif-
ferential equations. For example, the function defined by
4
2
0
2() 1 2(2 2) 2 .4(2 2)(2 4)2!
(1 ) ( / 2 )
!( )!
p
p p
np n
n
xxJx pp pp
x
nn p
∞ +
=
⎧⎫⎪⎪=− + −⎨⎬ ++ +⎪⎪⎩⎭
−= +∑
LL
 (16)
is a solution of Bessel’s differential equation x2y/H11033 + xy/H11032 + (x2 – p2)y = 0 and is thus called a Bessel func-
tion of order p. See Problems 11.46 and 11.110 through 11.113.
Similarly, the hypergeometric function
2(1 ) (1 )(, ; ; ) 1 11 2 ( 1 )
aB a a bbFabcx x xcc c
⋅+ +=+ + +⋅⋅ ⋅ +
b . . . (17)
is a solution of Gauss’s differential equation x(1 – x)y/H11033 + {c – (a + b + 1)x}y/H11032 – aby = 0.
These functions have many important properties.
2. Infinite series of complex terms, in particular, power series of the form
0
,w h e r e= +n
n
n
az z x i y
∞
=
∑
and an may be complex and can be handled in a manner similar to real series.
Such power series converge for ⏐z⏐ < R; i.e., interior to a circle of convergence x2 + y2 = R2, where R
is the radius of convergence (if the series converges only for z = 0, we say that the radius of convergence
R is zero; if it converges for all z, we say that the radius of convergence is infinite). On the boundary of
this circle, i.e., ⏐z⏐ = R, the series may or may not converge, depending on the particular z.
Note that for y = 0 the circle of convergence reduces to the interval of convergence for real power
series. Greater insight into the behavior of power series is obtained by use of the theory of functions
of a complex variable (see Chapter 16).
3. Infinite series of functions of two (or more) variables, such as
0
(, )n
n
ux y
∞
=
∑ , can be treated in a manner
analogous to series in one variable. In particular, we can discuss power series in x and y having the form
a00 + (a10x + a01y) + (a20x2 + a11xy + a02y2) + . . .
using double subscripts for the constants. As for one variable, we can expand suitable functions of x
and y in such power series. In particular, the Taylor theroem may be extended as follows.
Taylor’s Theorem (For Two Variables)
Let f be a function of two variables x and y. If all partial derivatives of order n are continuous in a closed
region and if all the (n + 1) partial derivatives exist in the open region, then
2
0 0 00 00 00
00
1( , ) ( ,) ( ,) ( ,)2!
1 (, )!
n
n
fx hy k fx y h k fx y h k fx y xy xy
hk f x y Rnxy
⎛⎞ ⎛⎞∂∂ ∂∂++ = + + + + + ⎜⎟ ⎜⎟∂∂ ∂∂⎝⎠ ⎝⎠
⎛⎞ ∂∂++ +⎜⎟ ∂∂⎝⎠
 . . .
 (18)
where
1
00
1 (, ) , 0 1(1 ) !
n
nRh k f x h y knx y θθ θ
+
⎛⎞ ∂∂=+ + + < <⎜⎟+∂ ∂ ⎝⎠


## Page 302

CHAPTER 11  Infinite Series 291
and where the meaning of the operator notation is as follows:
2
22
,
2
xy
xx xy yy
hk f h f k fxy
h k h f hkf k fxy
⎛⎞ ∂∂+= +⎜⎟ ∂∂⎝⎠
⎛⎞ ∂∂+= + +⎜⎟ ∂∂⎝⎠
and we formally expand
n
hk xy
⎛⎞ ∂∂+⎜⎟ ∂∂⎝⎠
 by the binomial theorem.
Note: In alternate notation h = Δx = x – x0, k = Δy = y – y0.
If Rn → 0 as n → /H11009 then an unending continuation of terms produces the Taylor series for f(x,y).
Multivariable Taylor series have a similar pattern.
4. Double series. Consider the array of numbers (or functions)
11 12 13
21 22 23
31 32 33
uuu
uuu
uuu
⎛⎞
⎜⎟
⎜⎟
⎜⎟
⎜⎟⎜⎟⎝⎠
K
K
K
MMM
L
L
L
M M M
Let
11
mn
mn pq
pq
Su
==
= ∑∑  be the sum of the numbers in the first m rows and first n columns of this array.
If there exists a number S such that lim , mnm
n
SS
→∞
→∞
=  we say that the double series
11
pq
pq
u
∞∞
==
∑∑ converges
to the sum S; otherwise, it diverges.
Definitions and theorems for double series are very similar to those for series already considered.
5. Infinite products. Let Pn = (1 + u1)(1 + u1)(1 + u2)(1 + u3) . . . (1 + un) denoted by
1
(1 ),
n
k
k
u
=
+∏  where
we suppose that uk /HS11005 –1, k = 1, 2, 3, . . . . If there exists a number P/HS11005 0 such that limn→/H11009Pn = P, we
say that the infinite product 123((1 )(1 )(1 )uuu+++  . . .
1
(1 ), k
k
u
∞
=
=+∏  or, briefly, Π(1 + uk), converges
to P; otherwise, it diverges.
If Π(1 + ⏐u k⏐) converges, we call the infinite product Π(1 + u k) absolutely convergent. It can be
shown that an absolutely convergent infinite product converges and that factors can in such cases be
rearranged without affecting the result.
Theorems about infinite products can (by taking logarithms) often be made to depend on theorems
for infinite series. Thus, for example, we have the following theorem.
Theorem A necessary and sufficient condition that Π (1 + u k) converge absolutely is that Σ uk converge
absolutely.
6. Summability. Let S 1, S2, S3, . . . be the partial sums of a divergent series Σun. If the sequence
12312
1,, 23
SSSSSS +++  . . . (formed by taking arithmetic means of the first n terms of S1, S2, S3, . . .)
converges to S, we say that the series Σun is summable in the Césaro sense, or C-1summable to S (see
Problem 11.51).
If Σun converges to S, the Césaro method also yields the result S. For this reason, the Césaro method
is said to be a regular method of summability.
In case the Césaro limit does not exist, we can apply the same technique to the sequence
12312
1,, , 33
SSSSSS +++  . . .  If the C-1 limit for this sequence exists and equals S, we say that Σu k
converges to S in the C-2 sense. The process can be continued indefinitely.


## Page 303

CHAPTER 11  Infinite Series292
SOLVED PROBLEMS
Convergence And Divergence Of Series Of Constants
11.1. (a) Prove that 111
13 35 57+++⋅⋅⋅
. . .
1
1
(2 1) (2 1)n nn
∞
=
= −+∑  converges and (b) find its sum.
11 1 1
(2 1) (2 1) 2 2 1 2 1nu nn n n
⎛⎞== − ⎜⎟−+ − + ⎝⎠
Then
12nSuu=++ . . . 11 1 11 1
21 3 23 5nu ⎛⎞ ⎛⎞+= − + − +⎜⎟ ⎜⎟⎝⎠ ⎝⎠
. . . 11 1
22 1 2 1nn
⎛⎞+− ⎜⎟ −+⎝⎠
11 1 1 1 1
2 13355
⎛= −+−+−⎜⎝
. . . 11 1 1 121 21 2 21nn n
⎞⎛ ⎞+− = − ⎟⎜ ⎟−+ + ⎠⎝ ⎠
Since 11 1lim lim 1 ,22 1 2nnn
S n→∞ →∞
⎛⎞=− = ⎜⎟ +⎝⎠
 the series converges and its sum is 1/2.
The series is sometimes called a telescoping series, since the terms of Sn, other than the first and last,
cancel out in pairs.
11.2. (a) Prove that
23
22 2
33 3
⎛⎞ ⎛⎞++ +⎜⎟ ⎜⎟⎝⎠ ⎝⎠
 . . .
1
2
3
n
n
∞
=
⎛⎞= ⎜⎟
⎝⎠
∑ converges and (b) find its sum.
This is a geometric series; therefore, the partial sums are of the form (1 ) .1
n
n
arS r
−= −
 Since ⏐ r⏐ < 1
22lim and in particular with and , we obtain 2.13 3nn
aSS r a Sr→∞
== = = =−
11.3. Prove that the series 1234
2345++++  . . .
1 1n
n
n
∞
=
= +∑ diverges.
lim lim 1. 1nnn
nu n→∞ →∞
== +
 Hence, by Problem 2.26, the series is divergent.
11.4. Show that the series whose nth term is 1nun n=+ − diverges although lim
x→∞
un = 0.
It is a fact that lim
x→∞
un = 0 follows from Problem 2.14(c).
Now Sn = u1 + u2 + . . . + un = ( 2  – 1 ) + ( 3  – 2 ) + . . . + ( (1 ) 1 1 .nn n+− = +−
The Sn increases without bound and the series diverges.
This problem shows that lim
x→∞
 = 0 is a necessary but not sufficient condition for the convergence of Σun.
See also Problem 11.6.
Comparison test and quotient test
11.5. If 0 < un < υn, n = 1, 2, 3, . . . and if Συ n converges, prove that Σun also converges (i.e., establish the
comparison test for convergence).
Let Sn = u1 + u2 + . . . + un, Tn = υ1 + υ2 + . . . + υn.
Since Συ n converges, limn→/H11009Tn exists and equals T, say. Also, since υn >  0, Tn < T.
Then Sn = u1 + u2 + . . . + un < υ1 + υ2 + . . . + υn < T or 0 < Sn < T.
Thus Sn is a bounded monotonic increasing sequence and must have a limit (see Chapter 2); i.e., Σun
converges.


## Page 304

CHAPTER 11  Infinite Series 293
11.6. Using the comparison test, prove that 111 23+++  . . .
1
1
n n
∞
=
= ∑ diverges.
We have
11 2
11111
23442
111111111
456788882
≥
+≥+=
+++≥+++=
11 1
891 0++ +  . . . 1111
15 16 16 16+≥+++  . . . 11(8 terms) =16 2+
and soon. Thus, to any desired number of terms.
11 11111 23 4567
⎛⎞ ⎛ ⎞++++ + ++⎜⎟ ⎜ ⎟⎝⎠ ⎝ ⎠
 . . . 111
222≥+++  . . .
Since the right-hand side can be made larger than any positive number by choosing enough terms, the given
series diverges.
By methods analogous to that used here, we can show that
1
1 ,p
n n
∞
=
∑  where p is a constant, diverges if p
<  1 and converges if p > 1. This can also be shown in other ways [see Problem 11.13(a)].
11.7. Test for convergence or divergence 3
1
ln .
21n
n
n
∞
= −∑
33 33 2
11 I n 1Since In and , we have .
2n 1 2 1
nnnn
nn n n
<≤ ≤ =
−−
Then the given series converges, since 2
1
1
n n
∞
=
∑  converges.
11.8. Let un and υn be positive. If lim n
n n
u
υ→∞
 = constant A /HS11005 0, prove that Σun converges or diverges according as
Συ n converges or diverges.
By hypothesis, given /H9280 > 0, we can choose an integer N such that for all .n
n
u An Nευ −< >  Then for
n = N + 1, N + 2, . . .
ƒo r ( ) ( )n
nn n
n
u AA u Aε ε ευ ευυ−< − < − < +  (1)
Summing from N + 1 to /H11009 (more precisely, from N + 1 to M and then letting M→ /H11009),
11 1
() ()nn n
NN N
Au Aευ ευ
∞∞ ∞
++ +
−≤ ≤ +∑∑ ∑  (2)
There is no loss in generality in assuming A – /H9280 > 0. Then from the right-hand inequality of Equation (2),
Σun converges when Συn does. From the left-hand inequality of Equation (2),Σun diverges when Συn does. For
the cases A = 0 or A = /H11009, see Problem 11.66.
11.9. Test for convergence: (a)
2
3
1
43 ,
2n
nn
nn
∞
=
−+
+∑  (b) 3
1
,
21n
nn
n
∞
=
+
−∑  and (c) 2
1
ln .
3n
n
n
∞
= +∑
(a) For large n,
2
3
43
2
nn
nn
−+
+
 is approximately
2
3
44 .n
nn
=  Taking
2
3
43
2
n
nnu
nn
−+=
+
 and 4 ,n nυ=  we have
lim 1. n
n n
u
υ→∞
==


## Page 305

CHAPTER 11  Infinite Series294
Since Συ n = 4Σ1/n diverges, Σu n also diverges, by Problem 11.8.
Note that the purpose of considering the behavior of un for large n is to obtain an appropriate comparison
series υn. In this case we could just as well have taken υn = 1/n.
Another method:
2
3
43lim 4.
2n
nnn
nn→∞
⎛⎞ −+ =⎜⎟⎜⎟ +⎝⎠
 Then by Theorem 1, Page 281, the series converges.
(b) For large 3,
21
n
nnnu
n
+=
−
 is approximately 32
1
22
n
n
nn
υ= = .
Since lim 1 n
n n
u
υ→∞
=  and 2
11
2n
n
υ=∑∑  converges (p series with p = 2), the given series converges.
Another method: 2
3
1lim .221n
nnn
n→∞
⎛⎞ + =⎜⎟⎜⎟ −⎝⎠
 Then by Theorem 1, Page 281, the series converges.
(c) 3/2 3/2
22
In In Inlim lim lim 0
3nn n
nn nnn
nn n→∞ →∞ →∞
⎛⎞ ⎛⎞≤= =⎜⎟ ⎜⎟⎜⎟ + ⎝⎠⎝⎠
l l l  (by L’Hospital’s rule or otherwise). Then by
Theorem 1 with p = 3/2. the series converges.
Note that the method of Problem 11.6(a) yields 22
ln 1
3
nn
nnn
<=
+
, but nothing can be deduced, since
Σ1/n diverges.
11.10. Examine for convergence: (a)
2
1
n
n
e
∞
−
=
∑  and (b) 3
1
1sin .
n n
∞
=
⎛⎞
⎜⎟⎝⎠∑
(a)
22lim 0 n
n
ne −
→∞
=  (by L’Hospital’s rule or otherwise). Then by Theorem 1 with p = 2, the series con-
verges.
(b) For large n, sin(1/n) is approximately 1/n. This leads to consideration of
3
33 1s i n ( 1 /lim sin lim 11/nn
nn nn→∞ →∞
⎛⎞ ⎧ ⎫== ⎨⎬⎜⎟⎝⎠ ⎩⎭
from which we deduce, by Theorem 1 with p = 3, that the given series converges.
Integral test
11.11. Establish the integral test (see Page 281).
We perform the proof taking N = 1. Modifications are easily made if N > 1.
From the monotonicity of f(x), we have
1 ( 1 )( )( ) 1 , 2 , 3 ,nnuf n f x f n un+ =+ ≤ ≤ = = . . .
Integrating from x = n to x = n + 1, using Property 7, Page 98,
1
1 () 1 , 2 , 3
n
nn n
uf x d x u n
+
+ ≤≤ =∫ . . .
Summing from n = 1 to M – 1,
23uu ++ . . .
121
()
M
Muf x d x u u+≤ ≤ + +∫
. . .
1Mu −  (1)
If f(x) is strictly decreasing, the equality signs in Equation (1) can be omitted.


## Page 306

CHAPTER 11  Infinite Series 295
If
1
lim ( )
M
M
fxd x
→∞ ∫  exists and is equal to S, we see from the left-hand inequality in Equation (1) that
u2 + u3 + . . . + uM is monotonic increasing and bounded above by S, so that Σun converges.
If
1
lim ( )
M
M
fxd x
→∞ ∫  is unbounded, we see from right-hand inequality in Equation (1) that σun di-
verges.
Thus, the proof is complete.
11.12. Illustrate geometrically the proof in Problem 11.11.
Geometrically, u2 + u3 + . . . + uM is the total area of the rectangles shown shaded in Figure 11.3, while
u1 + u2 + . . . + uM – 1 is the total area of the rectangles which are shaded and nonshaded.
The area under the curve y = f(x) from x = 1 to x = M is intermediate in value between the two areas given
above, thus illustrating the result (1) of Problem 11.11.
Figure 11.3
11.13. Test for convergence:
(a)
1
1 , constantp p
n
∞
=∑
(b) 2
1 1
n
n
∞
+∑
(c)
2
1
Innn
∞
∑ l
(d)
2
1
nne
∞
−
∑
(a) Consider
11
11
111
MppMM p
p
dx x Mxd x ppx
−−
−== = −−∫∫ , where 1.p ≠
If
1 11, lim ,1
p
M
Mp p
−
→∞
−<= ∞−
 so that integral, and thus the series, diverges.
If
1 111, lim ,11
p
M
Mp pp
−
→∞
−>= −−
 so that the integral, and thus the series, converges.
If
11
1, In and lim In ,
MM
p M
dx dxpM Mxx →∞
== = = ∞∫∫ l l  so that the integral, and thus the series, di-
verges. Thus, the series converges if p > 1 and diverges if p <  1.


## Page 307

CHAPTER 11  Infinite Series296
(b) 22
2 11
11 1lim lim In ( 1) lim In ( 1)22 21
M M
MM M
xd x xM
x→∞ →∞ →∞
⎧⎫=+ = + − = ∞⎨⎬+ ⎩⎭∫ l l  and the series diverges.
(c) {}21
lim lim In (In ) lim In(In ) In(In 2)In
M M
MM M
dx xMxx→∞ →∞ →∞
== − = ∞∫ l l l l l ll  and the series diverges.
(d)
2 221 1
1 1
11 1 1lim lim lim22 2 2
MM xx M
MM M
xe dx e e e e−− − − −
→∞ →∞ →∞
⎧⎫=− = − = ⎨⎬⎩⎭∫  and the series converges.
Note that when the series converges, the value of the corresponding integral is not (in general) the same
as the sum of the series. However, the approximate sum of a series can often be obtained quite accurately by
using integrals. See Problem 11.74.
11.14. Prove that 2
1
11Prove that .42 4 1n n
ππ ∞
=
<< +
+∑
From Problem 11.11 it follows that
1
22 2 121
11lim lim lim
11 1
MM M
MM M nn
dx
nx n
−
→∞ →∞ →∞==
<<
++ +∑∑ ∫
i.e., 22
21
11 ,411nn nn
π∞∞
==
<<
++∑∑  from which 2
1
1
4 1n n
π ∞
=
<
+∑  as required.
Since 2
2
1 ,41n n
π∞
=
<
+∑  we obtain, on adding 1
2
 to each side, 2
1
11 .241n n
π∞
=
<+
+∑
The required result is therefore proved.
Alternating series
11.15. Given the alternating series a 1 – a2 + a3 – a4 + . . . , where 0 < an + 1 < an and where limn→ /H11009an = 0, prove
that (a) the series converges and (b) the error made in stopping at any term is not greater than the absolute
value of the next term.
(a) The sum of the series to 2M terms is
S
2M = (a1 – a2) + (a3 – (a4) + . . . + (a2M–1 – a2M)
= a1 – (a2 – a3) – (a4 – a5) – . . . – (a2M – 2 – a2M – 1) – a2M
Since the quantities in parentheses are nonnegative, we have
S2M >  0,   S 2 < S4 < S6 < S8 < . . . < S2M < a1
Therefore, {S2M} is a bounded monotonic increasing sequence and thus has limit S.
Also, S2M + 1 = S2M + a2M + 1. Since limM→ /H11009S2M = S and lim M → /H11009a2M + 1 = 0 (for, by hypothesis, lim M→ /H11009
an = 0), it follows that limM→ /H11009S2M+ 1 = limM → /H11009S2M + limM→ /H11009a2M + 1 = S + 0 = S.
Thus, the partial sums of the series approach the limit S and the series converges.
(b) The error made in stopping after 2M terms is
(a2M+ 1 – a2M+ 2) + (a2M+ 3 – a2M + 4) + . . . = a2M+ 1 – (a2M + 2 – a2M + 3) – . . .
and is thus nonnegative and less than or equal to a2M+ 1, the first term which is omitted.
Similarly, the error made in stopping after 2M + 1 terms is
–a2M+ 2 + (a2M+ 3 – a2M+ 4) + . . . = –(a2M+ 2 – a2M+ 3) – (a2M+ 4 – a2M+ 5) – . . .
which is nonpositive and greater than –a2M+ 2.


## Page 308

CHAPTER 11  Infinite Series 297
11.16. (a) Prove that the series
1
1
(1 ) .21
n
n n
∞ +
=
−
−∑  converges. (b) Find the maximum error made in approximating the
sum by the first eight terms and the first nine terms of the series. (c)How many terms of the series are needed
in order to obtain an error which does not exceed .001 in absolute value?
(a) The series is 11111 3579−+−+− . . .  . If
1(1 ) ,21
n
nu n
+−= −
 then 11
1 ,21nn n nau a u n ++== = = −
1 .21n +
 Since 11
21 21nn ≤+−
 and since 1lim 0,21n n→∞ −
 it follows by Problem 11.5(a) that the series
converges.
(b) Use the results of Problem 11.15(b). Then the first eight terms give 1 1 1 1 1111 35791 11 31 5−+−+− + − ,
and the error is positive and does not exceed 1
17
.
Similarly, the first nine terms are 1 1 1 1 11111 35791 11 31 51 7−+−+− + − +  and the error is negative and
greater than or equal to – 1
19
; i.e., the error does not exceed 1
19
 in absolute value.
(c) The absolute value of the error made in stopping after M terms is less than 1/(2M + 1). To obtain the
desired accuracy, we must have 1/(2M + 1) <  .001, form which M >  499.5. Thus, at least 500 terms are
needed.
Absolute and conditional convergence
11.17. Prove that an absolutely convergent series is convergent.
Given that Σ⏐u n⏐ converges, we must show that Σun converges.
Let SM = u1 + u2 + . . . + uM and TM = ⏐u1⏐ + ⏐u 2⏐ + . . . + ⏐uM⏐. Then
SM + TM = (u1 + ⏐u1⏐) + (u2 + ⏐u2⏐) + . . . + (uM + ⏐uM⏐)
<  2⏐u1⏐ + 2⏐u 2⏐ + . . . + 2⏐uM⏐
Since Σ⏐u n⏐ converges and since un + ⏐un⏐ >  0, for n = 1, 2, 3, . . . , it follows that SM + TM is a bounded
monotonic increasing sequence, and so lim
M→∞
 (SM + TM) exists.
Also, since lim
M→∞
TM exists (since the series is absolutely convergent by hypothesis),
lim lim ( ) lim ( ) limMM M M M MMMM M M
SS T T S TT
→∞ →∞ →∞ →∞
=+ − =+ −
must also exist, and the result is proved.
11.18. Investigate the convergence of the series 3/2 3/2 3/2
sin 1 sin 2 sin 3
123
−+− . . . .
Since each term is, in absolute value, less than or equal to the corresponding term of the series
3/2 3/2 3/2
111
123
+++ . . .  . which converges, it follows that the given series is absolutely convergent and,
hence, convergent by Problem 11.17.
11.19. Examine for convergence and absolute convergence:
(a)
1
2
1
(1 )
1
n
n n
∞ −
=
−
+∑


## Page 309

CHAPTER 11  Infinite Series298
(b)
1
2
2
(1 )
In
n
n nn
∞ −
=
−
∑
(c)
1
2
1
(1 ) 2nn
n n
∞ −
=
−
∑
(a) The series of absolute values is
2
2
1 1n
n
n
∞
= +∑ , which is divergent by Problem 11.13(b). Hence, the given
series is not absolutely convergent
However, if 2 1
nn
nau
n
==
+
 and 11 2
1 ,
(1 )1
nn
nau
n
++
+==
++
 then an+1 < an for all n >  1, and
also 2lim lim 0.
1
nnn
na
n→∞ →∞
==
+
 Hence, by Problem 11.15 the series converges.
Since the series converges but is not absolutely convergent, it is conditionally convergent.
(b) The series of absolute values is 2
2
1 .
Inn nn
∞
=
∑ l
By the integral test, this series converges or diverges according as 22
lim
In
M
M
dx
xx→∞ ∫ l
 exists or does not
exist.
If 22
11ln , .lnln
dx duux c cuxxxu
== = − + = − +∫∫
Hence, 22
11 1lim lim In 2 In In 2In
M
MM
dx
Mxx→∞ →∞
⎛⎞=− = ⎜⎟⎝⎠∫ l l l l
, and the integral exists. Thus, the series con-
verges.
Then
1
2
2
(1 )
In
n
n nn
∞ −
=
−
∑ l
 converges absolutely and thus converges.
Another method: Since 22
11
(1 ) l n (1 ) l nnn n n
≤
++
 and 2
1lim 0,
lnn nn→∞
=  it follows by Problem
11.15(a), that the given alternating series converges. To examine its absolute convergence, we must proceed as
before.
(c) Since
lim 0 nn
u
→∞
≠  where
1
2
(1 ) 2 ,
nn
nu
n
−−=  the given series cannot be convergent. To show that
lim 0,nn
u
→∞
≠  it suffices to show that 2
2lim lim 0.nnn
nu
n→∞ →∞
=≠  This can be accomplished by L’Hospital’s
rule or other methods [see Problem 11.21(b)].
Ratio test
11.20. Establish the ratio test for convergence.
Consider first the series u 1 + u 2 + u 3 + . . .  where each term is nonnegative. We must prove that if
1lim 1,n
n n
u
Lu
+
→∞
<  then necessarily Σun converges.
By hypothesis, we can choose an integer N so large that for all n > N, (un+ 1/un) < r  where L  < r  < 1.
Then
1
2
21
3
32
NN
NN N
NN N
ur u
ur ur u
ur ur u
+
++
++
<
<<
<<
and so on. By addition,
uN + 1 + uN + 2 + . . . < uN(r + r2 + r3 + . . .)
and so the given series converges by the comparison test, since 0 < r < 1.


## Page 310

CHAPTER 11  Infinite Series 299
In case the series has terms with mixed signs, we consider ⏐u1⏐ + ⏐u 2⏐⏐ u3⏐ + . . . . By the preceding
proof and Problem 11.17, it follows that if 1lim 1,n
n n
u
Lu
+
→∞
=<  then Σun converges (absolutely).
Similarly, we can prove that if 1lim 1n
n n
u
Lu
+
→∞
=>  the series Σun diverges, while if 1lim 1n
n n
u
Lu
+
→∞
==
the ratio test fails [see Problem 11.21(c)].
11.21. Investigate the convergence of
(a)
24
1
n
n
ne
∞
−
=
∑
(b)
1
2
1
(1 ) 2nn
n n
∞ −
=
−
∑
(c)
1
2
1
(1 )
1
n
n
n
n
∞ −
=
−
+∑
(a) Here un = e–n2
. Then
22
22
4( 1 ) 4 ( 2 1 )1
44
44
21 21
(1 ) (1 )lim lim lim
11lim lim lim 1 0
nn nn
nnnn nn
nn
nn n
u ne ne
u ne ne
nn eenn
−+ + ++
−−→∞ →∞ →∞
−− −−
→∞ →∞ →∞
++ −==
++⎛⎞ ⎛⎞== = ⋅⎜⎟ ⎜⎟⎝⎠ ⎝⎠
= 0
Since 0 < 1, the series converges.
(b)
1
2
(1 ) 2Here . Then
nn
nu
n
−−=
12 21
21 2
(1 ) 2 2lim lim lim 2
( 1) ( 1) 2 ( 1)
nnn
nnnn nn
u nn
u nn
++
−→∞ →∞ →∞
−=⋅ = =
+− +
Since s > 1, the series diverges. Compare Problem 11.19(c).
(c)
1
2
(1 )Here . Then
1
n
n
nu
n
−−=
+
221
21 2
( 1) ( 1) 1 ( 1) ( 1)lim lim lim 1
(1 )1 ( 1 ) ( 22 )
nn
nnnn nn
u nn n n
u nn n n
+
−→∞ →∞ →∞
−+ + ++=⋅ = =
++ − + +
and the ratio test fails. By using other tests [see Problem 11.19(a)], the series is seen to be convergent.
Miscellaneous tests
11.22. Test for convergence 1 + 2r + r 2 + 2r3 + r4 + 2r5 + . . . where (a) r = 2/3, (b) r = –2/3, (c) r = 4/3.
Here the ratio test is inapplicable, since 1 12o r 2
n
n
u
rru
+ = , depending on whether n is odd or even.
However, using the nth root test, we have
2 2 if is odd
if is even
n nn
n n
nn
rr n
u
rr n
⎧ =⎪= ⎨
⎪ =⎩


## Page 311

CHAPTER 11  Infinite Series300
Then 1/lim (since lim 2 1). nn nnn
ur
→∞ →∞
==
Thus, if ⏐r⏐ < 1 the series converges, and if ⏐r⏐ > 1 the series diverges.
Hence, the series converges for cases (a) and (b), and diverges in case (c).
11.23. Test for convergence
22 22
11 41 4 7 1 4 7 ( 3 2 ) .33 63 6 9 3 6 9 ( 3 )
n
n
⎛⎞ ⎛ ⎞ ⎛ ⎞⋅⋅ ⋅ ⋅ ⋅ −⎛⎞ ++ + + +⎜⎟ ⎜ ⎟ ⎜ ⎟⎜⎟ ⋅⋅ ⋅ ⋅ ⋅⎝⎠ ⎝⎠ ⎝ ⎠ ⎝ ⎠
LLL L
K K
L
K
The ratio test fails, since
2
1 31lim lim 1.33
n
nn n
u n
un
+
→∞ →∞
⎛⎞ +== ⎜⎟ +⎝⎠
 However, by Raabe’s test,
2
1 31 4lim 1 lim 1 133 3
n
nn n
u nnn un
+
→∞ →∞
⎧⎫⎛⎞ ⎛⎞ +⎪⎪−= − = >⎜⎟ ⎨⎬ ⎜⎟⎜⎟ +⎝⎠⎪⎪⎝⎠ ⎩⎭
and so the series converges.
11.24. Test for convergence
2
1
2
⎛⎞ +⎜⎟⎝⎠
2
13
24
⎛⎞ ⋅ +⎜⎟ ⋅⎝⎠
2
135
24t
⋅⋅⎛⎞ +⎜⎟
⎝⎠
+L
K
2135 ( 2 1 )
246 ( 2 )
n
n
⎛⎞ ⋅⋅ −⎜⎟⎜⎟ ⋅⋅⎝⎠
L
L
K
K .+ LK
The ratio test fails, since
2
1 21lim lim 1.22
n
nn n
u n
un
+
→∞ →∞
⎛⎞ +== ⎜⎟ +⎝⎠
 Also, Raabe’s test fails since
2
1 21lim 1 lim 1 122
n
nn n
u nnn un
+
→∞ →∞
⎧⎫⎛⎞ ⎛⎞ +⎪⎪−= − =⎜⎟ ⎨⎬ ⎜⎟⎜⎟ +⎝⎠⎪⎪⎝⎠ ⎩⎭
However, using long division,
2
1
22
21 1 5 4 / 111 w here22 48 4
n n
n
n
u cnn cPun n nnn n
+ ⎛⎞ +−== − + = − + <⎜⎟ + ++⎝⎠
so that the series diverges by Gauss’s test.
Series of functions
11.25. For what values of x do the following series converge?
(a)
1
1 3
n
n
n
x
n
∞ −
= ⋅∑
(b)
12 1
1
(1 )
(2 1)!
nn
n
x
n
∞ −−
=
−
−∑
(c)
1
!( ) n
n
nx a
∞
=
−∑
(d)
1
(1 )
2( 3 1 )
n
n
n
nx
n
∞
=
−
−∑
(a)
1
.
3
n
n n
xu
n
−
=
⋅
 Assuming x /HS11005 0 (if x = 0 the series converges), we have
1
11
3lim lim lim 3( 1 ) 3(1 ) 3
nnn
nnnn nn
u xxn n xun nx
+
+−→∞ →∞ →∞
⋅=⋅ = = ++⋅
Then the series converges if 1, and diverges if 1. If 1. i.e., 3,33 3
xx x x<> = = ±  the test fails.


## Page 312

CHAPTER 11  Infinite Series 301
If x = 3 the series becomes
11
11 1 ,33nn nn
∞∞
==
=∑∑  which diverges.
If x = –3 the series becomes
11
11
(1 ) 1 (1 ) ,33
nn
nn nn
∞∞ −−
==
−− =∑∑  which converges.
Then the interval of convergence is – 3 < x < 3. The series diverges outside this interval.
Note that the series converges absolutely for –3 < x < 3. At x = –3 the series converges conditionally.
(b) Proceed as in (a) with
12 1(1 ) .(2 1)!
nn
n
xu n
−−−= −  Then
211 2
12 1
2
2
(1 ) ( 2 1 ) ! ( 2 1 ) !lim lim lim(2 1)! (2 1)!(1 )
(2 1)!lim lim 0(2 1) (2 ) (2 1)! (2 1) (2 )
nnn
nnnn nn
nn
u xn n xun nx
nx xnn n nn
++
−−→∞ →∞ →∞
→∞ →∞
−− −=⋅ = ++ −
−== = +− +
Then the series converges (absolutely) for all x, i.e., the interval of (absolute) convergence is –/H11009 < x < /H11009.
(c)
11 (1 ) ! ( )! ( ) , lim lim lim ( 1) .
!( )
nnn
n nnn nn
u nx aun x a n x au nx a
++
→∞ →∞ →∞
+−=− = = + −
−
This limit is infinite if x /HS11005a. Then the series converges only for x = a.
(d)
1
1 1
(1 ) (1 ) (1 ),.
2( 3 1 ) 2 ( 3 2 )
nn
nn nn
nx n xuu
nn
+
+ +
−+ −==
−+
 Then
1 1( 1 )( 3 1 )( 1 ) 1lim lim 2( 3 2 ) 2 2
n
nn n
u xnn x x
un n
+
→∞ →∞
−+− − −== =+
Thus, the series converges for ⏐x – 1⏐ < 2 and diverges for ⏐x – 1⏐ > 2.
The test fails for ⏐x – 1⏐ = 2; i.e., x – 1 = ±2 or x = 3 and x = –1.
For x = 3 the series becomes
1
,31n
n
n
∞
= −∑  which diverges, since the nth term does not approach zero.
For x = –1 the series becomes
1
(1 ) ,31
n
n
n
n
∞
=
−
−∑  which also diverges, since the nthe term does not approach
zero.
Then the series converges only for ⏐x – 1⏐ < 2; i.e., –2 < x – 1 < 2 or – 1 < x < 3.
11.26. For what values of x does (a)
1
12
21 1
n
n
x
nx
∞
=
⎛⎞ +
⎜⎟−− ⎝⎠∑  and (b)
1
1 converge?() ( 1 )n xn xn
∞
= ++ −∑
(a) 12 .21 1
n
n
xu nx
⎛⎞ += ⎜⎟−− ⎝⎠
 Then 1 21 2 2lim lim if 1, 2.21 1 1
n
nn n
u nx x xun x x
+
→∞ →∞
−+ +== ≠ −+− −
Then the series converges if 2 1,1
x
x
+ <−
 it diverges if 2 1,1
x
x
+ >−
 and the test fails if 2 1, i.e.,1
x
x
+ =−1=. 2x −
If x = 1, the series diverges.
If x = –2, the series converges.
If x – 1
2
, the series is
1
(1 )
21
n
n n
∞
=
−
−∑ , which converges.
Thus, the series converges for 21 1,12
x xx
+ <= −−
, 1and 2, i.e., for . 2xx=− ≤−


## Page 313

CHAPTER 11  Infinite Series302
(b) The ratio test fails, since 1lim 1, n
n n
u
u
+
→∞
=  where 1 .() ( 1 )nu xn xn= ++ −
 However, noting that
11 1
() ( 1 ) 1xn xn xn xn =−++ − + − +
we see that if x /HS11005 0, –1, –2, . . . , –n,
12
11 1 1 1 1
11 2 1
11
nnSuu u x x x x xn xn
xx n
⎛⎞ ⎛ ⎞ ⎛ ⎞=+++ = − + − ++ − ⎜⎟ ⎜ ⎟ ⎜ ⎟++ + + − +⎝⎠ ⎝ ⎠ ⎝ ⎠
=− +
LLL L
and lim
n→∞
Sn = 1/x, provided x /HS11005 0, –1, –2, –3, . . . .
Then the series converges for all x except x = 0, –1, –2, –3, . . . , and its sum is 1/x.
Uniform convergence
11.27. Find the domain of convergence of (1 – x) + x(1 – x) + x 2(1 – x) + . . . .
Method 1:
2Sum of first terms ( ) (1 ) (1 ) (1 )nnS x x x x x x =− + − + − + . . . 1 (1 )nxx −+−
221
1 n
xxx x
x
=− + − + +
=−
. . . 1nnxx −+−
If ⏐x⏐ < 1, lim
n→∞
Sn(x) = limn→ /H11009(1 – xn) = 1.
If ⏐x⏐ > 1. lim
n→∞
Sn(x) does not exist.
If x = 1, Sn(x) = 0 and lim
n→∞
Sn(x) = 0.
If x = –1, Sn(x) = 1 – (–1)n and lim
n→∞
Sn(x) does not exist.
Thus, the series converges for ⏐x⏐ < 1 and x = 1, i.e., for –1 < x <  1.
Method 2, using the ratio test: The series converges if x = 1. If 11a n d ( 1 ) , t h e nn
nxu x x −≠= −
1lim lim .n
n nn
u
xu
+
→∞ →∞
=
Thus, the series converges if ⏐x⏐ < 1 and diverges if ⏐x⏐ > 1. The test fails if ⏐x⏐ = 1. If x = 1, the series
converges; if x = –1, the series diverges. Then the series converges for –1 < x <  1.
11.28. Investigate the uniform convergence of the series of Problem 11.27 in the interval (a) – 1
2
 < x < 1
2
,
(b) – 1
2 < x < 1
2
, (c) –.99 < x <  .99, (d) –1 < x < 1, and (e) 0 < x < 2.
(a) By Problem 11.27, 11() 1 , () l i m () 1 i f ; 22
n
nn n
Sx x S x Sx x
→∞
=− = = − < <  thus, the series converges in
this interval. We have
Remainder after n terms = Rn(x) = S(x) = Sn(x) = 1 – (1 – xn) = xn
The series is uniformly convergent in the interval if given any /H9280 > 0 we can find N dependent on /H9280,but not
on x, such that ⏐Rn(x)⏐ < /H9280 for all n > N. Now
ln( ) when ln ln or ln
nn
nRx x x n x n x
εεε==< < >
since division by ln ⏐x⏐ (which is negative, since ⏐x⏐ < 1
2
) reverses the sense of the inequality.


## Page 314

CHAPTER 11  Infinite Series 303
But if 1 1 ln ln,l n l n ,a n d .122 l n ln 2
xx n N x
εε⎛⎞<< > > = ⎜⎟ ⎛⎞⎝⎠ ⎜⎟⎝⎠
 Thus, since N is independent of x, the
series is uniformly convergent in the interval.
(b) In this case 1 1 ln lnln ln , and ,122 l n ln 2
xx n N x
εε⎛⎞≤⋅ ≤ > ≥ = ⎜⎟ ⎛⎞⎝⎠ ⎜⎟⎝⎠
 so that the series is also uniformly
convergent in 11 .22 x−≤≤
(c) Reasoning similarly, with 1
2
 replaced by .99, shows that the series is uniformly convergent in –.99 <
x <  .99.
(d) The arguments used here break down in this case, since ln
ln x
ε  can be made larger than any positive
number by choosing ⏐ x⏐ sufficiently close to 1. Thus, no N exists and it follows that the series is not
uniformly convergent in –1 < x < 1.
(e) Since the series does not even converge at all points in this interval, it cannot converge uniformly in the
interval.
11.29. Discuss the continuity of the sum function () l i m () nn
Sx S x
→∞
=  of Problem 11.27 for the interval 0 < x <  1.
If 0 1, ( ) lim ( ) lim (1 ) 1.
If 1, ( ) 0 and S( ) = 0.
n
nnn
n
xS x S x x
xS x x
→∞ →∞
≤< = = − =
==
Thus, 10 1() 01
if xSx if x
≤<⎧= ⎨ =⎩
 and S(x) is discontinuous at x = 1 but continuous at all other points in
0 < x < 1.
In Problem 11.34 it is shown that if a series is uniformly convergent in an interval, the sum function S(x)
must be continuous in the interval. It follows that if the sum function is not continuous in an interval, the series
cannot be uniformly convergent. This fact is often used to demonstrate the nonuniform convergence of a series
(or sequence).
11.30. Investigate the uniform convergence of
22 2
2
22 2 2 .
1( 1 ) ( 1 ) n
xx xx
xx x
++ + + +
++ +
LLL L
Suppose x /HS11005 0. Then the series is a geometric series with ratio 1/(1 + x2) whose sum is (see Problem 2.25).
2
2
2() 1
11 / ( 1 )
xSx x
x
== +
−+
If x = 0, the sum of the first n terms is Sn(0) = 0; hence, S(0) = lim
n→∞
Sn(0) = 0.
Since
0
lim ( ) 1 (0), ( )
x
Sx S Sx
→
=≠  is discontinuous at x = 0. Then, by Problem 11.34, the series cannot be
uniformly convergent in any interval which includes x = 0, although it is (absolutely) convergent in any interval.
However, it is uniformly convergent in any interval which excludes x = 0.
This can also be shown directly (see Problem 11.93).
Weierstrass M test
11.31. Prove the Weierstrass M test; i.e., if ⏐un(x)⏐ < Mn, n = 1, 2, 3, . . . , where Mn are positive constants such
that ΣMn converges, then Σun(x) is uniformly (and absolutely) convergent.
The remainder of the series Σun(x) after n terms is Rn(x) = un + 1(x) + un+ 2 x) + . . . . Now


## Page 315

CHAPTER 11  Infinite Series304
⏐Rn(x)⏐ = ⏐u n+ 1(x) + un+ 2(x) + . . . ⏐ < ⏐un+ 1(x)⏐ + ⏐u n+ 2(x)⏐ + . . . < Mn+ 1 + Mn+ 2 + . . .
But Mn+ 1 + Mn+ 2 + . . . can be made less than /H9280 by choosing n > N, since ΣMn converges. Since N is clearly
independent of x, we have ⏐Rn(x)⏐ < /H9280 for n > N, and the series is uniformly convergent. The absolute conver-
gence follows at once from the comparison test.
11.32. Test for uniform convergence: (a) 4
1
cos ,
n
nx
n
∞
=
∑  (b) 3/2
1
,
n
n
x
n
∞
=
∑  (c)
1
sin ,
n
n
x
n
∞
=
∑  and (d) 22
1
1 ,
n nx
∞
= +∑
(a) 44
cos 1 .n
nx M
nn
≤=  Then, since ΣMn converges (p series with p = 4 > 1), the series is uniformly (and
absolutely) convergent for all x by the M test.
(b) By the ratio test, the series converges in the interval –1 < x <  1; i.e., ⏐x⏐ <  1.
For all x in this interval, 3/2 3/2 3/2
1 .
nn xx
nn n
=≤  Choosing 3/2
1 ,nM
n
=  we see that ΣMn converges. Thus,
the given series converges uniformly for –1 < x <  1 by the M test.
(c) 4
sin 1 .nx
nn
≤  However, ΣMn where 1
nM n=  does not converge. The M test cannot be used in this case
and we cannot conclude anything about the uniform convergence by this test (see, however, Problem
11.125).
(d) 22 2 2
11 1 , and converges.
nx n n
≤
+ ∑  Then, by the M test, the given series converges uniformly for
all x.
11.33. If a power series Σa nxn converges for x = x0, Prove that it converges. (a) absolutely in the interval ⏐x⏐ <
⏐x0⏐ and (b) uniformly in the interval ⏐x⏐ < ⏐x 1⏐, where ⏐x 1⏐ < ⏐x 0⏐.
(a) Since Σanxn
0 converges, 0lim 0 n
nn
ax
→∞
= , and so we can make 0 1n
nax <  by choosing n large enough; i.e.,
⏐an⏐ <
0
1 for > .n nan N
x
<  Then
11 1 0
n
nn
nn n
NN N
xax a x
x
∞∞ ∞
++ +
=<∑∑ ∑  (1)
Since the last series in Equation (1) converges for ⏐x⏐ < ⏐x0⏐, it follows by the comparison test that the
first series converges; i.e., the given series is absolutely convergent.
(b) Let 1
0
.
n
n n
xM
x
=  Then ΣMn converges, since ⏐x1⏐ < ⏐x 0⏐. As in (a), ⏐a nxn⏐ < M n for ⏐x⏐ < ⏐x1⏐, so
that by the Weierstrass M test, Σanxn is uniformly convergent.
It follows that a power series is uniformly convergent in any interval within its interval of convergence.
Theorems on uniform convergence
11.34. Prove Theorem 6, Page 284.
We must show that S(x) is continuous in [a, b].
Now S(x) = Sn(x) + Rn(x), so that S(x + h) = Sn(x + h) + Rn(x + h) and thus,
S(x + h) – S(x) = Sn(x) + h) – Sn(x) + Rn(x + h) – Rn(x) (1)
where we choose h so that both x and x + h lie in [a, b] (if x = b, for example, this will require h < 0).


## Page 316

CHAPTER 11  Infinite Series 305
Since Sn(x) is a sum of a finite number of continuous functions, it must also be continuous. Then, given
/H9280 > 0, we can find δ so that
⏐Sn(x + h) – Sn(x)⏐ < /H9280/3 whenever ⏐h⏐ < δ (2)
Since the series, by hypothesis, is uniformly convergent, we can choose N so that
() / 3nRx ε <  and ⏐ () / 3nRx h ε+<  for n > N (3)
Then from Equations (1), (2), and (3),
⏐S(x + h) – S(x)⏐ < ⏐Sn(x) + h) – Sn(x)⏐ + ⏐R n(x + h)⏐ + ⏐R n(x)⏐ < /H9280
for ⏐h⏐ < δ, and so the continuity is established.
11.35. Prove Theorem 7, Page 285.
If a function is continuous in [a, b], its integral exists. Then, since S(x), Sn(x) and Rn(x) are continuous,
() () ()
ab b
nnaa a
S x S x dx R x dx +∫∫ ∫
To prove the theorem we must show that
() () ()
bb b
nnaa a
S x dx S x dx R x dx−=∫∫ ∫
can be made arbitrarily small by choosing n large enough. This, however, follows at once, since by the uniform
convergence of the series we can make ⏐Rn(x)⏐ < /H9280/ (b – a) for n > N independent of x in [a,b], and so
() ()
bb b
nnaa a
R x dx R x dx dx ba
ε ε≤< = −∫∫∫
This is equivalent to the statements
() l i m ()
bb
nnaa
S x dx S x dx
→∞
=∫∫    o r    lim ( ) lim ( )
n na
b
n na
b
Sx d x Sx d x
→∞ →∞
= ⎧⎨⎩
⎫⎬
⎭
∫∫
11.36. Prove Theorem 8, Page 285.
Let
1
() () . n
n
gx u x
∞
′
=
= ∑  Since, by hypothesis, this series converges uniformly in [ a, b], we can integrate
term by term (by Problem 11.35) to obtain
11
11
() () { () () }
() () () ()
xx
nn naa nn
nn
nn
g x dx u x dx u x u a
ux ua S x S a
∞∞
′
==
∞∞
==
== −
=−= −
∑∑∫∫
∑∑
because, by hypothesis,
1
()n
n
ux
∞
=
∑  converges to S(x) in [a, b].
Differentiating both sides of
0
() () ()
x
gx d x Sx Sa=−∫  then shows that g(x) = S ′(x), which proves the
theorem.
11.37. Let Sn(x) = nxe–nx2, n = 1, 2, 3, . . . , 0 < x <  1. (a) Determine whether
11
00
lim ( ) lim ( ) .nnnn
Sx d x Sx d x
→∞ →∞
=∫∫(b) Explain the result in (a).
(a)
2211 1
000
11() ( 1 ) .22
nx nx n
nS x dx nxe dx e e−− −== − = −∫∫  Then
1
0
11lim ( ) lim (1 ) 22
n
nnn
S x dx e−
→∞ →∞
=− =∫


## Page 317

CHAPTER 11  Infinite Series306
2
( ) lim ( ) lim 0. whether 0 or < 1. Then.nx
nnn
S x S x nxe x x−
→∞ →∞
== = = ≤
1
0
() 0Sx d x =∫
It follows that
11
00
lim ( ) lim ( )nnnn
Sx d x Sx d x
→∞ →∞
≠∫∫ ; i.e., the limit cannot be taken under the integral sign.
(b) The reason for the result in (a) is that although the sequence Sn(x) converges to 0. it does not converge
uniformly to 0. To show this, observe that the function
2nxnxe−  has a maximum at 1/ 2xn=  (by the
usual rules of elementary calculus), the value of this maximum being 1/21 .2 ne −  Hence, as n → /H11009,
Sn(x) cannot be made arbitrarily small for all x and so cannot converge uniformly to 0.
11.38. Let 3
1
sin() .
n
nxfx
n
∞
=
= ∑  Prove that 40 1
1() 2 .
(2 1)n
fxd x
n
π ∞
=
=
−∑∫
We have 33
sin 1 .nx
nn
≤  Then, by the Weierstrass M test, the series is uniformly convergent for all x, in
particular 0 < x < π, and can be integrated term by term. Thus,
3300 011
44 4 4 4
11
sin sin()
1c o s 1 1 1 122
135 ( 2 1 )
nn
nn
nx nxf x dx dx dx
nn
n
nn
ππ π
π
∞∞
==
∞∞
==
⎛⎞
⎜⎟= ⎜⎟⎝⎠
− ⎛⎞== + + + = ⎜⎟ −⎝⎠
∑∑∫∫ ∫
∑∑ LL
Power series
11.39. Prove that both the power series
0
n
n
n
ax
∞
=
∑  and the corresponding series of derivatives 1
0
n
n
n
na x
∞
−
=
∑  have
the same radius of convergence.
Let R > 0 be the radius of convergence of Σanxn. Let 0 < ⏐x 0⏐ < R. Then, as in Problem 11.33, we can
choose N as that ⏐
0
1 for .n nan N
x
<>
Thus, the terms of the series Σ⏐na nxn – 1⏐ = Σn⏐an⏐⏐ x⏐n –1 can for n > N be made less than corresponding
terms of the series
1
0
,
n
n
xn
x
−
∑  which converges, by the ratio test, for ⏐x⏐ < ⏐x 0⏐ < R.
Hence, Σnanxn –1 converges absolutely for all points x0 (no matter how close ⏐x0⏐ is to R).
If, however, ⏐x⏐ > R, lim
n→∞
anxn /HS11005 0 and thus lim
n→∞
nanxn –1 /HS11005 0, so that Σnanxn– 1 does not converge.
Thus, R is the radius of convergence of Σnanxn –1.
Note that the series of derivatives may or may not converge for values of x such that ⏐x⏐ = R.
11.40. Illustrate Problem 11.39 by using the series 2
1
.
3
n
n
n
x
n
∞
= ⋅∑
12 21
21 2
3lim lim lim 3(1 ) 3 3 (1 )
nn
nnnn nn
u xxn n n xu nx n
++
+→∞ →∞ →∞
⋅=⋅ = =
+⋅ +
so that the series converges for ⏐x⏐ < 3. At x = ±3 the series also converges, so that the interval of convergence
is –3 < x <  3.


## Page 318

CHAPTER 11  Infinite Series 307
The series of derivatives is
11
2
11 33
nn
nn
nx x
nnnn
∞∞ −−
==
= ⋅⋅∑∑
By Problem 11.25(a), this has the interval of convergence –3 < x < 3.
The two series have the same radius of convergence, i.e., R = 3, although they do not have the same inter-
val of convergence.
Note that the result of Problem 11.39 can also be proved by the ratio test if this test is applicable. The
proof given there, however, applies even when the test is not applicable, as in the series in Problem 11.22.
11.41. Prove that in any interval within its interval of convergence, a power series (a) represents a continuous
function, say, f(x); (b) can be integrated term by term to yield the integral of f(x); and (c) can be
differentiated term by term to yield the derivative of f(x).
We consider the power series Σanxn, although analogous results hold for Σan(x – a)n.
(a) This follows from Problem 11.33 and 11.34, and the fact that each term anxn of the series is continu-
ous.
(b) This follows from Problems 11.33 and 11.35, and the fact that each term anxn of the series is continuous
and thus integrable.
(c) From Problem 11.39, the series of derivatives of a power series always converges within the interval of
convergence of the original power series and therefore is uniformly convergent within this interval. Thus,
the required result follows from Problems 11.33 and 11.36.
If a power series converges at one (or both) endpoints of the interval of convergence, it is possible to es-
tablish (a) and (b) to include the endpoint (or endpoints). See Problem 11.42.
11.42. Prove Abel’s theorem that if a power series converges at an endpoint of its interval of convergence, then the
interval of uniform convergence includes this endpoint.
For simplicity in the proof, we assume the power series to be
0
k
k
k
ax
∞
=
∑  with the endpoint of its interval
of convergence at x = 1, so that the series surely converges for 0 < x <  1. Then we must show that the series
converges uniformly in this interval.
Let
Rn(x) = anxn + an + 1xn + 1 + an + 2 xn + 2 + . . . , Rn = an + aa n + 2 + . . .
To prove the required result we must show that given any /H9280 > 0, we can find N such that ⏐Rn all n > N, where
N is independent of the particular x in 0 < x <  1.
Now
12
11 2 2 3
12 1
12
2
12 3
() ( ) ( ) ( )
() ( )
{( 1 ) ( ) }
nn n
nn n n n n n
nn n n n
nn n
n
nn n n
Rx R R x R R x R R x
Rx R x x R x x
xR xR R x R x
++
++ + + +
++ +
++
++ +
=− + − + − +
=+ − + − +
=− − + + +
L
L
L
K
K
K)
Hence, for 0 < x < 1,
 ⏐ Rn(x)⏐ < ⏐Rn⏐ + (1 – x) (⏐R n+ 1⏐ + ⏐R n+2⏐x + ⏐R n ⏐Rn+3⏐ x2 + . . .) (1)
Since Σak converges by hypothesis, it follows that given /H9280 > 0, we can choose N such that ⏐Rk⏐ < /H9280/2 for
all k > n. Then for n > N we have, from Equation (1),
2|( ) | ( 1 ) 22 2 2nRx x x x ∈∈ ∈ ∈ ⎛≤+− + + + ⎜⎝
 . . .
22
∈∈⎞ =+= ∈⎟⎠
 (2)
since (1 – x) (1 + x + x2 + x3 + . . .) = 1 (if 0 < x < 1).
Also, for x = 1, ⏐Rn (x)⏐ = ⏐R n⏐ < /H9280 for n > N.


## Page 319

CHAPTER 11  Infinite Series308
Thus, ⏐Rn(x)⏐ < /H9280 for all n > N, where N is independent of the value of x in 0 < x <  1, and the required
result follows.
Extensions to other power series are easily made.
11.43. Prove Abel’s limit theorem (see Page 286).
As in Problem 11.42, assume the power series to be
1
,k
k
k
ax
∞
=
∑  convergent for 0 < x <  1.
Then we must show that
1 00
lim .k
kkx kk
ax a
∞∞
→− ==
=∑∑
This follows at once from Problem 11.42, which shows that Σakxk is uniformly convergent for 0 < x <  1,
and from Problem 11.34, which shows that Σak xk is continuous at x = 1.
Extensions to other power series are easily made.
11.44. (a) Prove that
357
1tan 357
xxxxx− =− + − + . . . where the series is uniformly convergent in –1 < x <  1.
(b) Prove that 11114 357
π =− + − + . . .
(a) By Problem 2.25, with r = – x2 and a = 1, we have
246
2
1 1
1
xxx
x
=− + − +
+
. . . 11 x−< <  (1)
Integrating from 0 to x, where – 1 < x < 1, yields
357
1
20
tan 3571
x dx x x xxx
x
−== − + − +
+∫ . . .  (2)
using Problems 11.33 and 11.35.
Since the series on the right of Equation ( 2) converges for x = ± 1, it follows by Problem 11.42 that the
series is uniformly convergent in – 1 < x <  1 and represents tan–1 x in this interval
(b) By Problem 11.43 and (a), we have
357
1
1– 1
111lim tan lim or 13 5 7 4 357xx
xxxxx π−
→→ −
⎛⎞=− + − + = − + − +⎜⎟⎜⎟⎝⎠
LLL L
11.45. Evaluate
21
20
1 xe dx
x
−−
∫  to three-decimal-place accuracy.
We have
2345
1, .2! 3! 4! 5!
u uuuueu u++ + + + + − ∞ << ∞ LL
Then, if
2 4681 0
22,1 , .2! 3! 3! 5!
x xxxxux e x x−=− = − + − + = + −∞< <∞ LL
Thus,
2 2468
2
1 1. 2! 3! 4! 5!
xex x x x
x
−− =− + − + − LL
Since the series converges for all x and so, in particular, converges uniformly for 0 < x <  1, we can in-
tegrate term by term to obtain
2 135791
20
0
1
3 2 !5 3 !7 4 !9 5 !
xex x x xdx x
x
−− =− + − + −⋅⋅⋅⋅∫ L
11111 3 2 !5 3 !7 4 !9 5 !
1 0.16666 0.03333 0.00595 0.00092 0.862
=− + − + −⋅⋅⋅⋅
=− + − + − =
L
L
K
K
K
Note that the error made in adding the first four terms of the alternating series is less than the fifth term,
i.e., less than 0.001 (see Problem 11.15).


## Page 320

CHAPTER 11  Infinite Series 309
Miscellaneous problems
11.46. Prove that y = Jp (x) defined by Equation (16), Page 287, satisfies Bessel’s differential equation:
x2y · + xy/H11032 + (x2 – p2) y = 0.
The series for Jp (x) converges for all x [see Problem 11.10 (a)]. Since a power series can be differentiated
term by term within its interval of convergence, we have for all x,
2
2
0
21
2
0
22
2
0
(1 )
2! ( ) !
(1 ) ( 2)
2! ( ) !
(1 ) ( 2) ( 2 1 )
2! ( ) !
np n
pn
n
np n
pn
n
np n
pn
n
xy
nn p
pn xy
nn p
pn pn xy
nn p
∞ +
+
=
∞ +−
+
=
∞ +−
+
=
−=
+
−+′=
+
−+ + −′′ =
+
∑
∑
∑
Then,
22 2 2
22
22
00
2
2
0
2
2
0
(1 ) (1 )()
2! ( ) ! 2! ( ) !
(1 ) ( 2)
2! ( ) !
(1 ) ( 2) ( 2 1 )
2! ( ) !
np n n p n
pn pn
nn
np n
pn
n
np n
pn
n
xp xxp y
nn p nn p
pn xxy
nn p
pn pn xy
nn p
∞∞ ++ +
++
==
∞ +
+
=
∞ +
+
=
−−−= −
++
−+′=
+
−+ + −′′ =
+
∑∑
∑
∑
Adding,
22
22 2
2
0
22
2
0
22 2
22
00
2
22
(1 )()
2! ( ) !
(1 )[ ( 2) ( 2) ( 2 1 ) ]
2! ( ) !
(1 ) (1 )[ 4( ) ]
2! ( ) ! 2! ( ) !
(1 ) 4
2( 1 ) ! (
np n
pn
n
np n
pn
n
np n n pn
pn pn
nn
np n
pn
xxy x y x p y
nn p
pp np n p n x
nn p
xn n p x
nn p nn p
x
n
∞ ++
+
=
∞ +
+
=
∞∞ ++ +
++
==
+
+−
−′′ + ′ + − =
+
−− + ++ + + −+
+
−− +=+
++
−=
−
∑
∑
∑∑
2
2
11
22
22
11
(1 ) 4
1) ! 2 (1 ) ! ( 1 ) !
(1 ) 4 (1 ) 4–
2( 1 ) ! ( 1 ) ! 2( 1 ) ! ( 1 ) !
0
np n
pn
nn
np n np n
pn pn
nn
x
np n n p
xx
nn p nn p
∞∞ +
+
==
∞∞ ++
++
==
−+
−+ − + −
−−=+
−+ − −+ −
=
∑∑
∑∑
11.47. Test for convergence the complex power series
1
31
1
.
3
n
n
n
z
n
∞ −
−
= ⋅∑
Since
31 31
31 3
3lim lim lim ,3(1 ) 3 3 (1 )
nn n
nnnn nn
u zz nn zu nz n
−+
−→∞ →∞ →∞
⋅=⋅ = =
+⋅ +
 the series converges for
3
z
 < 1, i.e., ⏐z⏐ < 3, and diverges for ⏐z⏐ > 3.


## Page 321

CHAPTER 11  Infinite Series310
For ⏐z⏐ = 3, the series of absolute values is
1
31 3
11
1 ,
3
n
n
nn
z
nn
−∞∞
−
==
=
⋅∑∑  so that the series is absolutely con-
vergent and thus convergent for ⏐z⏐ = 3.
Thus, the series converges within and on the circle ⏐z⏐ = 3.
11.48. Assuming the power series for e x holds for complex numbers, show that eix = cos x + i sin x.
Letting
23
2in 1 2! 3!
zzzi x e z== + + + + . . . , we have
22 33
1 2! 3!
cos sin
ix ix ixei x
xi x
=+ + + +
=+
 . . .
24
1 2! 4!
xx⎛=− + −⎜⎜⎝
 . . .
35
3! 5!
xxix⎞⎛+− + −⎟⎜⎟⎜⎠⎝
 . . . x⎞
⎟⎟⎠
Similarly, e– ix = cos x – i sin x. The results are called Euler’s identities.
11.49. Prove that 111lim 1 234n→∞
⎛ ++++⎜⎝
. . . 1 In nn
⎞+− ⎟⎠
exists.
Letting f (x) = 1/x in Equation (1), Problem 11.11, we find
111
234+++  . . . 11 1 1ln 1 234MM+≤ ≤ + + + +  . . . 1
1M+ −
from which, on replacing M by n, we have
11 1 11 234n ≤+ + + +  . . . 1 In 1nn+− ≤
Thus, the sequence 1111 234nS =+ + + + . . . 1 ln nn+− is bounded by 0 and 1.
Consider 1
11 ln .1nn
nSS nn+
+⎛⎞−= − ⎜⎟+ ⎝⎠
 By integrating the inequality 11 1
1nx n ≤≤+
 with respect
to x from n to n + 1, we have
1 1 1 111 1ln or ln 011 1
nn
nn n n n nn
++⎛⎞ ⎛⎞≤≤ − ≤ −≤⎜⎟ ⎜⎟++ +⎝⎠ ⎝⎠
i.e., Sn + 1 – Sn <  0, so that Sn is monotonic decreasing.
Since Sn is bounded and monotonic decreasing, it has a limit. This limit, denoted by γ, is equal to
0.577215 . . . and is called Euler’s constant. It is not yet known whether γ is rational or not.
11.50. Prove that the infinite product
1
(1 ), k
k
u
∞
=
+∏  converges
1
k
k
u
∞
=
∑  converges.
According to the Taylor series for ex (Page 289), 1 + x < ex for x > 0, so that
12
1
(1 ) (1 ) (1 )
n
nk
k
Pu u u
=
=+ = + +∏  . . . 12(1 ) . uu
nue e+≤  . . . 12nuu uee ++=
 . . . nu
Since u1 + u2 + . . . converges, it follows that Pn is a bounded monotonic increasing sequence and so has
a limit, thus proving the required result.
11.51. Prove that the series 1 – 1 + 1 – 1 + 1 – 1 + . . . is C – 1 summable to 1/2.
The sequence of partial sums is 1, 0, 1, 0, 1, 0, . . .
Then 12312
1
10 1 101 21, , ,22 2 3 3 3
SSSSSS +++ ++ +== = = = . . . .


## Page 322

CHAPTER 11  Infinite Series 311
Continuing in this manner, we obtain the sequence 121311 .,,,,,23252
. . .  , the n th term being
1/ 2 if is even 1. Thus, lim/(2 1) if is odd 2nn n
nTT nn n →∞
⎧==⎨ −⎩
 and the required result follows.
11.52. (a) If f (n + 1) (x) is continuous in [a, b] prove that for c in [a, b], () () () ( )fx fc f c x c=+ ′ − +
21 () ( )2! fcxc′′ − + . . . ()1
!
nfn+ (1 )1() ( ) ( 1 ) ( ) . !
xnn n
c
cxc x f t d t n
+−+ − ∫  (b) Obtain the Lagrange
and Cauchy forms of the remainder in Taylor’s formula. (See Page 290.)
The proof of (a) is made using mathematical induction. (See Chapter 1.) The result holds for n  = 0,
since
() () ( ) () () ()
x
c
fx fc f td t fc fx fc=+ ′=+− ∫
We make the induction assumption that it holds for n = k and then use integration by parts with
1() and ( )!
k
kxtdd t u f tkυ +−==
Then
1()
(1 ) !
kxt
kυ
+−=− +
 and 2 ()kdu f t dt +=
Thus,
11
(1 ) 1(2 )
11
1( 2 )
1( ) 1() ( ) () ( )! ( 1)! ( 1)!
() 1 () ( )(1 ) ! (1 ) !
kkx xkk x k k
cC C
kk x kk
C
fx tx t f t dt x t f t dtkk k
fx t xt f t d tkk
++
++ +
++
++
−−= − + − ++
−=− + −++
∫∫
∫
C
X
Having demonstrated that the result holds for k + 1, we conclude that it holds for all positive integers.
To obtain the Lagrange form of the remainder Rn, consider the form
21() () () ( ) () ( ) 2!
nf x f c f cxc fcxc=+ ′ − + − +  . . . ()!
nK xcn+−
This is the Taylor polynomial 1 ( ) plus ( ) .!
n
n
KPx x c n− −  Also, it could be looked upon as Pn except that in
the last term, f (n) (c) is replaced by a number K such that for fixed c and x the representation of f(x) is exact.
Now define a new function
1
()
1
() ()() () ( ) () !!
n jn
j
j
xt K xttf tf x f t jn
−
=
−−Φ= − + +∑
The function Φ satisfies the hypothesis of Rolle’s Theorem in that Φ(c) = Φ(x) = 0, the function is con-
tinuous on the interval bound by c and x, and Φ′  exists at each point of the interval. Therefore, there exists ξ
in the interval such that Φ′ (ξ) = 0. We proceed to compute Φ′ and set it equal to zero.
11 11
(1 ) ( )
11
() () ()() () () ()! ( 1)! ( 1)!
nn jj n
jj
jj
xt xt K xttf t f t f t jj n
−− −−
+
==
−− −Φ′ = ′ + − −−−∑∑
This reduces to
()
11()( ) () ()( 1)! ( 1)!
n
nnft Ktx t x tnn
−−Φ ′ =− −− −−
According to hypothesis, for each n there is ξn such that
Φ (ξ n) = 0


## Page 323

CHAPTER 11  Infinite Series312
Thus,
K = f (n)(ξn)
and the Lagrange remainder is
1
() () ()!n
n
nnfRx c n
ξ
−
=−
f (n)(ξn)
or, equivalently,
(1 ) 1
1
1 () ( )(1 ) !
nn
nnRf x c n ξ++
+=− +
The Cauchy form of the remainder follows immediately by applying the mean value theorem for integrals.
(See Page 287.)
11.53. Extend Taylor’s theorem to functions of two variables x and y.
Define F(t) = f (x0 + ht, y0 + kt); then, applying Taylor’s theorem for one variable (about t = 0),
21( ) (0) (0) (0) 2!Ft F F F t=+ ′ + ′ ′+  . . . () ( 1 ) 111 (0) ( ) ,!( 1 )!
nn n nFt F tnn θ+++ + + 0 < θ < t
Now let t = 1
00
1(1) ( , ) (0) (0) (0) 2!Ff x h y k FF F=++ = + ′ + ′ ′ + . . . () ( 1 )11 (0) ( )!( 1 ) !
nnFFnn θ+++ +
When the derivatives F′ (t), . . . , F(n) (t), F(n + 1) (θ) are computed and substituted into the previous expres-
sion, the two-variable version of Taylor’s formula results. (See Page 290, where this form and notational details
can be found.)
11.54. Expand x2 + 3y – 2 in powers of x – 1 and y + 2. Use Taylor’s formula. with h = x – x0, k = y – y0, where x0 =
1 and y0 = – 2.
x2 + 3y – 2 = –10 – 4(x – 1) + 4(y + 2) – 2 (x – 1)2 + 2(x – 1)(y + 2) + (x – 1)2(y + 2) (Check this algebraically.)
11.55. Prove that ln 2 , 0 1, 0, 0.22 ( 2 )
xy xy xyxy θθ
++ −=< > >++ −
 (Hint: Use Taylor’s formula with the linear
term as the remainder.)
11.56. Expand f (x, y) = sin xy in powers of x – 1 and y –
2
π  to second-degree terms.
2
2211( 1 ) ( 1 )82 2 2xx y y ππ ππ ⎛⎞ ⎛⎞−− − − − − − ⎜⎟ ⎜⎟⎝⎠ ⎝⎠
SUPPLEMENTARY PROBLEMS
Convergence And Divergence Of Series Of Constants
11.57. (a) Prove that the series 11 1
37 71 1 1 1 1 5++ +⋅⋅ ⋅
. . .
1
1
(4 1) (4 3)n nn
∞
=
= −+∑ converges and (b) find its
sum.
Ans. (b) 1/12


## Page 324

CHAPTER 11  Infinite Series 313
11.58. Prove that the convergence or divergence of a series is not affected by (a) multiplying each term by the same
nonzero constant and (b) removing (or adding) a finite number of terms.
11.59. If Σun and Συ n converge to A and B, respectively, prove that Σ (un + υn) converges to A + B.
11.60. Prove that the series
23
33 3
22 2
⎛⎞ ⎛⎞+++⎜⎟ ⎜⎟⎝⎠ ⎝⎠
. . . 3
2
n
⎛⎞= ⎜⎟⎝⎠∑ diverges.
11.61. Find the fallacy: Let S = 1 – 1 + 1 – 1 + 1 – 1 +  . . . . Then S = 1 1 – (1 – 1) – (1 – 1) – . . . = 1 and S = (1 – 1)
+ (1 – 1) + (1 – 1) + . . . = 0. Hence, 1 = 0.
Comparison test and quotient test
11.62. Test for convergence: (a) 2
1
1 ,
1n n
∞
= +∑  (b) 2
1
,
43n
n
n
∞
= −∑  (c)
1
2 ,
(1 ) 3n
n
nn
∞
=
+
++∑  (d)
1
3 ,
5
n
n
n n
∞
= ⋅∑
(e)
1
1 ,53n n
∞
= −∑  and (f) 4/3
1
21 .
(3 2)n
n
nn
∞
=
−
+∑
Ans. (a) convergence (b) divergence (c) divergence (d) convergence (e) divergence (f) convergence
11.63. Investigate the convergence of (a)
2
23 / 2
1
45 2
(1 )n
nn
nn
∞
=
+−
+∑  and (b) 23
1
In .
10n
nn
nn
∞
=
−
+∑
l
Ans. (a) convergence (b) divergence
11.64. Establish the comparison test for divergence (see Page 280).
11.65. Use the comparison test to prove that (a)
1
1
p
n n
∞
=
≤∑  converges if p > 1 and diverges if p <  1,
(b)
1
1
tan
n
n
n
∞ −
=
∑  diverges, and (c)
2
1 2n
n
n
∞
=
∑  converges.
11.66. Establish the results (b) and (c) of the quotient test, Page 280.
11.67. Test for convergence: (a)
2
2
1
(ln ) ,
n
n
n
∞
=
∑  (b) 13
1
tan (1/ ),
n
nn
∞
−
=
∑  (c)
1
3s i n ,
(1 ) n
n
n
ne
∞
−
=
+
+∑  and
(d) 2
1
sin (1/ ).
n
nn
∞
=
∑
Ans. (a) convergence (b) divergence (c) divergence (d) divergence
11.68. If Σun converges, where un >  0 for n > N, and if lim
n→∞
nun exists, prove that lim
n→∞
nun = 0.
11.69. (a) Test for convergence 11 /
1
1 .n
n n
∞
+
=
∑  (b) Does your answer to (a) contradict the statement about the p series
made on Page 266 that Σ1/np converges for p > 1?
Ans. (a) divergence


## Page 325

CHAPTER 11  Infinite Series314
Integral test
11.70. Test for convergence: (a)
2
3
1
,
21n
n
n
∞
= −∑  (b) 3
2
1 ,
(In )n nn
∞
=
∑ l
 (c)
1 2n
n
n
∞
=
∑ , (d)
1
,
n
n
e
n
∞ −
=
∑  (e)
2
ln ,
n
n
n
∞
=
∑  and
(f)
ln(ln )
10
2 .ln
n
n nn
∞
=
∑
Ans. (a) divergence (b) convergence (c) convergence (d) convergence (e) divergence (f) divergence
11.71. Prove that
2
1 ,
(ln ) p
n nn
∞
=
∑  where p is a constant, (a) converges if p > 1 and  (b) diverges if p <  1.
11.72. Prove that 3
1
91 5 .84 n n
∞
=
<<∑
11.73. Investigate the convergence of
1tan
2
1
.
1
n
n
e
n
−∞
= +∑
Ans. convergence
11.74. (a) Prove that 3/221 12333n +≤ + + +  . . . 3/2 1/222 .33nn n+≤ + − (b) Use (a) to estimate the
value of 123+++  . . . 100,+ giving the maximum error. (c) Show how the accuracy in (b) can be
improved by estimating, for example, 10 11+ + . . . 100+ and adding on the value of
12++  . . . 9+  computed to some desired degree of accuracy.
Ans. (b) 671.5 ± 4.5
Alternating series
11.75. Test for convergence: (a)
1
1
(1 ) ,2
n
n n
∞ +
=
−
∑  (b) 2
1
(1 ) ,
22
n
n nn
∞
=
−
++∑  (c)
1
1
(1 ) ,31
n
n
n
n
∞ +
=
−
−∑  (d) 1
1
1(1 ) s i n ,n
n n
∞
−
=
−∑
and (e)
2
(1 ) .ln
n
n
n
n
∞
=
−
∑
Ans. (a) convergence, (b) convergence, (c) divergence, (d) convergence, (e) divergence
11.76. (a) What is the largest absolute error made in approximating the sum of the series
1
(1 )
2( 1 )
n
n
n n
∞
=
−
+∑  by the sum
of the first five terms? (b) What is the least number of terms which must be taken in order that three-
decimal-place accuracy will result?
Ans. (a) 1/192 (b) eight terms
11.77. (a) Prove that 333
111
123
S +++  . . .
333
41 1 1
3 123
⎛=+ + −⎜⎝
 . . . .⎞
⎟⎠
(b) How many terms of the series on the
right are needed in order to calculate S to six-decimal-place accuracy?
Ans. (b) at least 100 terms


## Page 326

CHAPTER 11  Infinite Series 315
Absolute and conditional convergence
11.78. Test for absolute or conditional convergence:
(a)
1
2
1
(1 )
1
n
n n
∞ −
=
−
+∑  (c)
2
(1 )
ln
n
n nn
∞
=
−
∑  (e)
1
(1 ) 1 sin21
n
n n n
∞
=
−
−∑
(b)
1
2
1
(1 )
1
n
n
n
n
∞ −
=
−
+∑  (d)
3
24 / 3
1
(1 )
(1 )
n
n
n
n
∞
=
−
+∑  (f)
13
1
(1 )
21
n
n
n
n
∞ −
=
−
−∑
Ans. (a) absolute convergence, (b) conditional convergence, (c) conditional convergence, (d) divergence,
(e) absolute convergence, (f) absolute convergence
11.79. Prove that 22
1
cos
n
na
xn
π∞
= +∑  converges absolutely for all real x and a.
11.80. If 1111 234−+++  . . . converges to S, prove that the rearranged series 11111 3257+−++ 11 1
491 1−++
1
6−+  . . . 3 .2 S= Explain. (Hint: Take 1
2
 of the first series and write it as 11110 0246++ −+ ++  . . .;
then add term by term to the first series. Note that S = ln 2, as shown in Problem 11.100.)
11.81. Prove that the terms of an absolutely convergent series can always be rearranged without altering the sum.
Ratio test
11.82. Test for convergence: (a)
1
(1 )
(1 )
n
n
n
n
ne
∞
=
−
+∑  (b)
1
10 ,(2 1)!
n
n
n
n
∞
= +∑  (c) 3
1
3 ,
n
n n
∞
=
∑  (d)
3
2
1
(1 ) 2 ,
3
nn
n
n
∞
=
−
∑  and
(e) 2
1
(5 1 ) .
1
n
n n
∞
=
−
+∑
Ans. (a) convergence (absolute) (b) convergence (c) divergence (d) convergence (absolute) (e) divergence
11.83. Show that the ratio test cannot be used to establish the conditional convergence of a series.
11.84. Prove that (a)
1
!
n
n
n
n
∞
=
∑  converges and (b) !lim 0.nn
n
n→∞
=
Miscellaneous tests
11.85. Establish the validity of the nth root test on Page 282.
11.86. Apply the nth root test to work Problems 11.82(a), (c), (d), and (e).
11.87. Prove that
23456
12 1 2 1 2
33 3 3 3 3
⎛⎞ ⎛⎞ ⎛⎞ ⎛⎞ ⎛⎞++++++⎜⎟ ⎜⎟ ⎜⎟ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠ ⎝⎠ ⎝⎠ ⎝⎠
 . . . converges.
11.88. Test for convergence: (a) 11 41 4 7
33 63 6 9
⋅⋅ ⋅++ +⋅⋅ ⋅
 . . . and (b) 22 5 2 5 8
9 9 12 9 12 15
⋅⋅ ⋅++ +⋅⋅ ⋅
 . . . .
Ans. (a) divergence (b) convergence


## Page 327

CHAPTER 11  Infinite Series316
11.89. If a, b, and d are positive numbers and b > a, prove that () () ( 2 )
()() ( 2 )
aa a d a a d a d
bb b d b b d b d
++ +++ + ++ +
 . . .
converges if b – a > d, and diverges if b – a < d.
Series of functions
11.90. Find the domain of convergence of the series (a) 3
1
,
n
n
x
n
∞
=
∑  (b)
1
(1 ) ( 1 ) ,
2( 3 1 )
nn
n
n
x
n
∞
=
−−
−∑  (c) 2
1
1 ,
(1 ) n
n nx
∞
= +∑
(d) 2
1
1 ,1
n
n
xn x
∞
=
⎛⎞ −
⎜⎟ +⎝⎠∑  and (e) 2
1 1
nx
n
e
nn
∞
= −+∑
Ans. (a) – 1 < x <  1 (b) – 1 < x <  3 (c) all x /HS11005 0 (d) x > 0 (e) x<  0
11.91. Prove that
1
135 ( 2 1 )
246 ( 2 )
n
n
n xn
∞
=
⋅⋅ −
⋅⋅∑
L
L
K
K  converges for –1 < x < 1.
Uniform convergence
11.92. By use of the definition, investigate the uniform convergence of the series
1 [1 ( 1) ] [1 ]n
x
nx n x
∞
= +− +∑
[Hint: Resolve the nth term into partial fractions and show that the nth partial sum is 1() 1 . 1
nSx nx=− + ]
Ans. Not uniformly convergent in any interval which includes x = 0; uniformly convergent in any other
interval.
11.93. Work Problem 11.30 directly by first obtaining S n(x).
11.94. Investigate by any method the convergence and uniform convergence of the series (a)
1
,3
n
n
x∞
=
⎛⎞
⎜⎟⎝⎠∑
(b)
2
1
sin ,21n
nx
n
∞
= −∑  and (c)
1
,0 .
(1 ) n
n
x x
x
∞
=
≥
+∑
Ans. (a) convergence for ⏐x⏐ < 3; uniform convergence for ⏐x⏐ < r < 3 (b) uniform convergence for all
x (c) convergence for x >  0; not uniform convergence for x >  0, but uniform convergence for x > r > 0
11.95. If 3
1
sin()
n
nxFx
n
∞
=
= ∑ , prove that (a) F(x) is continuous for all x, (b)
0
lim ( ) 0,
x
Fx
→
=  and
(c) 2
1
cos()
n
nxFx
n
∞
=
′= ∑ , is continuous everywhere.
11.96. Prove that
0
cos2 cos 4 cos6
13 35 57
xx xπ ⎛ ++⎜ ⋅⋅ ⋅⎝∫  . . . 0.dx⎞ =⎟⎠
11.97. Prove that
1
sin() sinhn
nxFx nπ
∞
=
= ∑  has derivatives of all orders for any real x.
11.98. Examine the sequence 2
1() , 1 , 2 , 3 ,
1
n nux n
x
==
+
 . . . , for uniform convergence.


## Page 328

CHAPTER 11  Infinite Series 317
11.99. Prove that
1 1
0
lim 1 .
(1 / ) nn
dx e
xn
−
→∞
=−
+∫
Power series
11.100. (a) Prove that In
234
(1 ) 34
xxxxx x+= − + − +  . . . (b) Prove that In 11121 234=− + − +  . . . . (Hint: Use
the fact that 231 11 xx xx =− + − ++
 . . . and integrate.)
11.101. Prove that
35 7
1 11 31 3 5sin 23 245 2467
xx xxx− ⋅⋅ ⋅=+ + + + ⋅⋅ ⋅
 . . . , 11 .x−≤ ≤
11.102. Evaluate (a)
21/2
0
xed x−
∫  and (b)
1
0
1c o s x dxx
−
∫  to three decimal places, justifying all steps.
Ans. (a) 0.461 (b) 0.486
11.103. Evaluate (a) sin 40º, (b) cos 65º, and (c) tan 12º correctly to three decimal places.
Ans. (a) 0.643 (b) 0.423 (c) 0.213
11.104. Verify the expansions 4, 5, and 6 on Page 289.
11.105. By multiplying the series for sin x and cos x, verify that 2 sin x cos x = sin 2x.
11.106. Show that
24 6
cos 43 11 2! 4! 6!
x xx xee ⎛=− + − +⎜⎜⎝
 . . . ,. x⎞ −∞< <∞⎟⎟⎠
11.107. Obtain the expansions
(a) 1tanh x−
357
357
xxxx=+ + + + . . . 11 x−< <
(b)
35 7
2 11 31 3 5ln( 1) 23 245 246 7
xx xxx x ⋅⋅ ⋅++ = − + − + + ⋅⋅ ⋅
. . . 11 x−< <
11.108. Let
21/ 0() .
00
xexfx
x
−⎧⎪ ≠= ⎨ =⎪⎩
 Prove that the formal Taylor series about x = 0 corresponding to f(x) exists but
that it does not converge to the given function for any x/HS11005 0.
11.109. Prove that
(a) 23ln (1 ) 1 1 11112 2 3
x xx xx
+ ⎛⎞⎛ ⎞=− + + + + −⎜⎟⎜ ⎟+ ⎝⎠⎝ ⎠
 . . . for 1 1 x−< <
(b)
34
22 12 1 12{ln(1 + ) } 1 123 2 34
xxxx ⎛⎞ ⎛ ⎞=− + + + + −⎜⎟ ⎜ ⎟⎝⎠ ⎝ ⎠
 . . . for 1 1 x−< ≤
Miscellaneous problems
11.110. Prove that the series for J p(x) converges (a) for all x and (b) absolutely and uniformly in any finite interval.


## Page 329

CHAPTER 11  Infinite Series318
11.111. Prove that (a) 01{( ) } ( ) ,d Jx Jxdx =−  (b) 1{( ) } ( ) ,pp
pp
d xJ x xJ xdx −=  and
(c) 11
2() () () .pp p
pJx J x Jx x+− =−
11.112. Assuming that the result of Problem 11.111(c) holds for p = 0, – 1, –2, . . . , prove that (a) J –1(x) = –J1(x),
(b) J–2(x) = J2(x), and (c) J–n(x) = (–1)n Jn(x), n = 1, 2, 3, . . . .
11.113. Prove that 1/2 ( 1/ )xt t
p
e
∞
−
=− ∞
= ∑ Jp(x)tp (Hint: Write the left side as ext/2 e–x/2t, expand, and use Problem
11.112.)
11.114. Prove that 2
1
(1 )
(2 )
n
n
nz
nn
∞
=
+
+∑  is absolutely and uniformly convergent at all points within and on the circle ⏐z⏐ = 1.
11.115. (a) If
11
nn
nn
nn
ax bx
∞∞
==
=∑∑  for all x in the common interval of convergence ⏐x⏐ < R where R > 0, prove
that an = bn for n = 0, 1, 2, . . . (b) Use (a) to show that the Taylor expansion of a function exists and the
expansion is unique.
11.116. Suppose that lim .n nuL =  Prove that Σun converges or diverges according as L < 1 or L > 1. If L = 1, the
test fails.
11.117. Prove that the radius of convergence of the series Σa nxn can be determined by the following limits, when
they exist, and give examples: (a)
1
lim , n
n n
a
a→∞ +
 (b) 1lim ,
n n na→∞
 and (c) 1lim .
n n na→∞
11.118. Use Problem 11.117 to find the radius of convergence of the series in Problem 11.22.
11.119. (a) Prove that a necessary and sufficient condition that the series Σu n converge is that, given any /H9280 > 0, we
can find N > 0 depending on /H9280 such that ⏐Sp – Sq⏐ < /H9280 whenever p > N and q > N, where Sk = u1 + u2 + . . . +
uk. (b) Use (a) to prove that the series
1 (1 ) 3 n
n
n
n
∞
= +∑  converges. (c) How could you use (a) to prove that the
series
1
1
n n
∞
=
∑  diverges? (Hint: Use the Cauchy convergence criterion, Page 27.)
11.120. Prove that the hypergeometric series (Page 276) (a) is absolutely convergent for ⏐x⏐ < 1, (b) is divergent
for ⏐x⏐ > 1, (c) is absolutely divergent for ⏐x⏐ = 1 if a + b – c < 0, and (d) satisfies the differential equation
x (1 – x) y/H11033 + {c – (a + b + 1)x}y/H11032 – aby = 0.
11.121. If F(a, b; c; x) is the hypergeometric function defined by the series on Page 290, prove that (a) F(–p, 1; 1; –x) =
(1 + x)p, (b) xF (1, 1; 2; – x) = In(1 + x), and (c) 21113,;; ( s i n ) / .222Fx x x −⎛⎞ =⎜⎟⎝⎠
11.122. Find the sum of the series
35
() 13 135
xxSx x =+ + + ⋅⋅ ⋅
. . . . (Hint: Show that S′(x) – 1 + xS(x) and solve.)
Ans.
22/2 /2
0
xxxee d x −
∫


## Page 330

CHAPTER 11  Infinite Series 319
11.123. Prove that 11 11 13 135 1357++ + +⋅⋅ ⋅⋅ ⋅ ⋅
 . . .
234
11 1 11– 23 2 2 !5 2 3 !7 2 4 !9
e ⎛=− + + −⎜⎜ ⋅ ⋅⋅ ⋅⋅ ⋅⋅⎝
 . . . ⎞
⎟
⎟
⎠
.
11.124. Establish Dirichlet’s test on Page 284.
11.125. Prove that
1
sin
n
nx
n
∞
=
∑  is uniformly convergent in any interval which does not include 0, ±π, ±2π, . . . (Hint:
use the Dirichlet test, Page 284, and Problem 1.94.)
11.126. Establish the results on Page 289 concerning the binomial series. (Hint: Examine the Lagrange and Cauchy
forms of the remainder in Taylor’s theorem.)
11.127. Prove that
1
2
1
(1 ) n
n nx
∞ −
=
−
+∑  converges uniformly for all x, but not absolutely.
11.128. Prove that 11 11 47 1 0−+− +  . . . 1 ln 2333
π=+ .
11.129. If x = yey, prove that
11
1
(1 ) for 1/e < 1/ .!
nn
n
n
nyx x en
∞ −−
=
−=− ≤∑
11.130. Prove that the equation e –λ = λ – 1 has only one real root and show that it is given by
11
1
(1 )1 !
nn n
n
ne
nλ
∞ −− −
=
−=+ ∑
11.131. Let
32
32
11 2! 3!1x
BxBxx Bx
e
=+ + + +
−
. . . . (a) Show that the numbers Bn, called the Bernoulli numbers,
satisfy the recursion formula (B + 1)n – Bn = 0 where Bk is formally replaced by Bk after expanding.
(b) Using (a) or otherwise, determine B1 . . . , B6.
Ans. (b) 12 3 4 5 6
11 1 1, , 0, , 0,2 6 30 42BB B B B B=− = = =− = =
11.132. (a) Prove that coth 1 .221x
xx x
e
⎛⎞=− ⎜⎟− ⎝⎠
 (b) Use Problem 11.127 and (a) to show that B2k+1 = 0 if k
= 1, 2, 3, . . .
11.133. Derive the series expansions:
(a)
31coth 34 5
xxx x=+− +  . . .
2
2 (2 )
(2 )!
n
nBx
nx++  . . .
(b)
31coth 34 5
xxx x=+− +  . . .
2
2 (2 )(1 ) (2 )!
n
n nBx
nx−+  . . .
(c)
35 2tan 31 5
xxxx=+ + +  . . .
21 21
1 22(2 1) (2 )(1 ) (2 )!
nn
n nBx
n
−−
− −−+  . . .
(d) 317csc 6 360
xxx x=++ +  . . .
21 21
1 22(2 1)(1 ) (2 )!
nn
n nBx
n
−−
− −−+  . . .
[Hint: For (a) use Problem 11.132; for (b) replace x by ix in (a); for (c) use tan x = cot x – 2 cot 2x; for (d) use
csc x = cot x + tan x/2.]


## Page 331

CHAPTER 11  Infinite Series320
11.134. Prove that 3
1
11
n n
∞
=
⎛⎞+⎜⎟⎝⎠∏  converges.
11.135. Use the definition to prove that
1
11
n n
∞
=
⎛⎞+⎜⎟
⎝⎠
∏  diverges.
11.136. (a) Prove that
1
(1 ), n
n
u
∞
=
−∏  where 0 < un < 1, converges if and only if Σun converges.
11.137. (a)Prove that 2
2
11
n n
∞
=
⎛⎞−⎜⎟
⎝⎠
∏  converges to 1
2
. (b) Evaluate the infinite product in (a) to two decimal places
and compare with the true value.
11.138. Prove that the series 1 + 0 – 1 + 1 + 0 – 1 + 1 + 0 – 1 +  . . . is the C – 1 summable to zero.
11.139. Prove that the Cesaro method of summability is regular. (Hint: See Page 291.)
11.140. Prove that the series 1 + 2x + 3x 2 + 4x3 + . . . + nxn–1 + . . . converges to 1/(1 – x)2 for ⏐x⏐ < 1.
11.141. A series
0n
a
∞
=
∑  is called Abel summable to S if
1 0
lim n
nx n
Sa X
∞
→− =
= ∑  exists. Prove that
(a)
0
(1 ) ( 1 )n
n
n
∞
=
−+∑  (n + 1) is Abel summable to 1
4
(b) 0
(1 ) ( 1 ) ( 2 )
2
n
n
nn∞
=
−+ +
∑
 is Abel summable to 1
8
11.142. Prove that the double series
22
00
1 ,() p
mn mn
∞∞
== +∑∑  where p is a constant, converges or diverges according as
p > 1 or p <  1, respectively.
11.143. (a) Prove that 234
112 ! 3 !xu
x
e duux xxx
−∞
=− + − +∫  . . .
1
1
(1 ) ( 1 ) ! (1 ) ! .
nx u
n
nn x
ne nd uxu
−− ∞
+
−− +− ∫
(b) Use (a) to prove that 234
112 ! 3 !~
xu
x
e duux xxx
−∞
−+−+∫  . . . .


## Page 332

321
Improper Integrals
Definition of an Improper Integral
The functions that generate the Riemann integrals of Chapter 5 are continuous on closed intervals. Thus, the
functions are bounded and the intervals are finite. Integrals of functions with these characteristics are called
proper integrals. When one or more of these restrictions are relaxed, the integrals are said to be improper.
Categories of improper integrals are established as follows.
The integral
()
b
a
fxd x∫  is called an improper integral if
1. a = – /H11009 or b = /H11009 or both; i.e., one or both integration limits is infinite.
2. f (x) is unbounded at one or more points of a < x < b. Such points are called singularities of f (x).
Integrals corresponding to (1) and (2) are called improper integrals of the first and second kinds, respec-
tively. Integrals with both conditions (1) and (2) are called improper integrals of the third kind
EXAMPLE 1. 2
0
sin xd x
∞
∫  is an improper integral of the first kind.
EXAMPLE 2.
4
0 3
dx
x −∫  is an improper integral of the second kind.
EXAMPLE 3.
0
xe dx
x
−∞
∫  is an improper integral of the third kind.
EXAMPLE 4.
1
0
sin x dxx∫  is a proper integral, since
0
sinlim 1.
x
x
x→+
=
Improper Integrals of the First Kind (Unbounded Intervals)
If f is integrable on the appropriate domains, then the indefinite integrals () a n d ()
xa
ax
ftd t ftd t∫∫  (with vari-
able upper and lower limits, respectively) are functions. Through them we define three forms of the improper
integral of the first kind.
Definition
(a) If f is integrable on a ,  then ( ) lim ( ) .
x
aa x
xf x dx f t dt
∞
→∞
<< ∞ =∫∫
(b) If f is integrable on –/H11009 < x, then ( ) lim ( ) .
aa
xx
a fx d x ftd t
−∞ →−∞
<= ∫∫
(c) If f is integrable on –/H11009 < x < /H11009, then
() () ()
lim ( ) lim ( )
x
xxx
fxd x fxd x fxd x
ftd t ftd t
α
α
α
α
∞∞
−∞ −∞
→−∞ →∞
=+
=+
∫∫∫
∫∫
CHAPTER 12


## Page 333

CHAPTER 12  Improper Integrals322
In (c) it is important to observe that
lim  ( ) lim ( )
x
xxx
ftd t ftd t
α
α→−∞ →∞
+∫∫
and
lim ( ) ( )
x
xx
ftd t ftd t
α
α−→∞
⎡⎤ +⎢⎥⎣⎦∫∫
are not necessarily equal.
This can be illustrated with f (x) = xex2
. The first expression is not defined, since neither of the improper
integrals (i.e., limits) is defined, while the second form yields the value 0.
EXAMPLE. The function
2(/ 2 )1()
2
xFx e
π
−=  is called the normal density function and has numerous appli-
cations in probability and statistics. In particular (see the bell-shaped curve in Figure 12.1),
∞
−∞∫
21 :122
xed x
π
−=
(See Problem 12.31 for the trick of making this evaluation.)
Perhaps at some point in your academic career you were “graded on the curve.” The infinite region under
the curve with the limiting area of 1 corresponds to the assurance of getting a grade. C’s are assigned to those
whose grades fall in a designated central section, and so on. (Of course, this grading procedure is not valid
for a small number of students, but as the number increases it takes on statistical meaning.)
In this chapter we formulate tests for convergence or divergence of improper integrals. It will be found
that such tests and proofs of theorems bear close analogy to convergence and divergence tests and corre-
sponding theorems for infinite series (see Chapter 11).
Figure 12.1
Convergence or Divergence of Improper Integrals of the First Kind
Let f (x) be bounded and integrable in every finite interval a < x < b. Then we define
() l i m  ()
b
aa b
fxd x fxd x
∞
→∞
=∫∫  (1)
where b is a variable on the positive real numbers.
The integral on the left is called convergent or divergent according as the limit on the right does or does
not exist. Note that ()
a
fxd x
∞
∫  bears close analogy to the infinite series
1
,n
n
u
∞
=
∑  where u n = f (n), while
()
b
a
fxd x∫  corresponds to the partial sums of such infinite series. We often write M  in place of b in Equa-
tion (1).


## Page 334

CHAPTER 12  Improper Integrals 323
Similarly, we define
() l i m ()
bb
aa
fxd x fxd x
−∞ →−∞
=∫∫  (2)
where a is a variable on the negative real numbers. And we call the integral on the left convergent or divergent
according as the limit on the right does or does not exist.
EXAMPLE 1. 22 211
1lim lim 1 1 so that  converges to 1.
b
tbb
dx dx dx
bxx x
∝∞
→∞ →∞
⎛⎞== − = ⎜⎟⎝⎠∫∫ ∫
EXAMPLE 2. cos lim cos lim(sin sin ). Since this limit does not exit, cos
au a
aaa
xd x xd x u a xd x
−∞ −∞→∞ →∞
== −∫∫ ∫is divergent.
In like manner, we define
0
0
() () ()
x
x
fxd x fxd x fxd x
∞∞
−∞ −∞
=+∫∫∫  (3)
where x0 is a real number, and we call the integral convergent or divergent according as the integrals on the
right converge or not, as in definitions (1) and (2). [See the previous remarks in part (c) of the definition of
improper integrals of the first kind.]
Special Improper Integrals of the First Kind
1. Geometric or exponential integral 1 ,tx
a
ed x
∞ −
∫  where t is a constant, converges if t > 0 and diverges
if t <  0. Note the analogy with the geometric series if r = e–t so that e–tx = rx.
2. The p integral of the first kind ,pa
dx
x
∞
∫  where p is a constant and a > 0, converges if p > 1 and diverges
if p <  1. Compare with the p series.
Convergence Tests for Improper Integrals of the First Kind
The following tests are given for cases where an integration limit is /H11009. Similar tests exist where an integration
limit is –/H11009 (a change of variable x = – y then makes the integration limit /H11009). Unless otherwise specified, we
assume that f (x) is continuous and thus integrable in every finite interval a < x < b.
1. Comparison test for integrals with nonnegative integrands.
(a) Convergence. Let g(x) >  0 for all x > a, and suppose that ()
a
gxd x
∞
∫  converges. Then if 0 < f (x) <
g(x) for all x > a, ()
a
fxd x
∞
∫  also converges.
EXAMPLE. x0
11 d xSince  and  converges,  also converges.
1e 1
xx
xx a
ee d x
ee
∞∞−−≤=
++ ∫∫ ex
dx
(b) Divergence. Let g(x) >  0 for all x > a, and suppose that
a
∞
∫ g(x) dx diverges. Then if f(x) < g(x) for all
x > a,
a
∞
∫ f (x) dx also diverges.
EXAMPLE.
22
11 d xSince for 2 and  diverges (  integral with  = 1),  also diverges.ln ln x
dxxp pxx x
∞∞
>> ∫∫
2. Quotient test for integrals with nonnegative integrands.
(a) ()If ( ) and ( ) 0, and if lim 0 or , then ( ) and() ax
fxfx g x A fxd xgx
∞
→∞
≥≥ = ≠ ∞ ∫ ()
a
gxd x
∞
∫ either both
converge or both diverge.
(b) If 0Ai n= (a) and ( ) converges, then ( ) converges.
aa
g x dx f x dx
∞∞
∫∫
(c) If inA =∞ (a) and ( ) diverges, then ( ) diverges.
aa
g x dx f x dx
∞∞
∫∫


## Page 335

CHAPTER 12  Improper Integrals324
This test is related to the comparison test and is often a very useful alternative to it. In particular, taking
g(x) = 1/xp, we have, from known facts about the p integral, the following theorem.
Theorem 1 Let lim ( ) . Thenp
x
xfx A
→∞
=
(i) ( )  converges if  > 1 and  is finite
a
fxd x p A
∞
∫ .
(ii) ( )  diverges if  < 1 and 0 (  may be infinite).
a
f x dx p A A
∞
≠∫
EXAMPLE 1.
22
2
440
1 converges since lim . .442 5 42 5x
xd x xxxx
∞
→∞
=++∫
EXAMPLE 2.
0 42 42
 diverges since lim . 1.
11 x
xd x xx
xx xx
∞
→∞
=
++ ++∫
A similar test can be devised using g(x) = e–tx.
3. Series test for integrals with nonnegative integrands. ()
a
fx d x
∞
∫  converges or diverges according as
Σun where un = f (n), converges or diverges.
4. Absolute and conditional convergence. ( )  is called if | ( ) |
aa
f x dx absolutely convergent f x dx
∞∞
∫∫  con-
verges. If
a
( )  converges but | ( ) |  diverges, then ( )  is called
aa
fxd x fx d x fxd x
∞∞ ∞
∫∫ ∫ conditionally con-
vergent.
Theorem 2
a
If | ( )  converges, then ( )
a
fxd x fxd x
∞∞
∫∫  converges. In words, an absolutely convergent inte-
gral converges.
EXAMPLE 1. 2
cos
1a
x dxx
∞
+∫  is absolutely convergent and thus convergent, since
22 200 0
cos and  converges.11 1
xd x d xdxxx x
∞∞ ∞
≤++ +∫∫ ∫
EXAMPLE 2.
0 0
sin sinconverges (see Problem 12.11), but xxdx dxxx
∞ ∞
∫∫  does not converge (see Prob-
lem 12.12). Thus,
0
sin x dxx
∞
∫ dx is conditionally convergent.
Any of the tests used for integrals with nonnegative integrands can be used to test for absolute conver-
gence.
Improper Integrals of the Second Kind
If f (x) becomes unbounded only at the endpoint x = a of the interval a < x < b, then we define
0
() l i m ()
bb
aa
fxd x fxd x
+∈∈→ +
=∫∫  (4)
and define it to be an improper integral of the second kind. If the limit on the right of Equation (4) exists, we
call the integral on the left convergent; otherwise, it is divergent.
Similarly, if f(x) becomes unbounded only at the endpoint x = b of the interval a< x < b, then we extend
the category of improper integrals of the second kind.
0
() l i m ()
bb e
aa
fxd x fxd x
−
∈→ +
=∫∫  (5)
Note: Be alert to the word unbounded. This is distinct from undefined. For example,
11
0
sin sinlim
a
xxdx dxxx ∈∈→
=∫∫
is a proper integral, since
0
sinlim 1
x
x
x→
=  and, hence, is bounded as x→  0 even though the function is undefined
at x = 0. In such case the integral on the left of Equation (5) is called convergent or divergent according as
the limit on the right exists or does not exist.


## Page 336

CHAPTER 12  Improper Integrals 325
Finally, the category of improper integrals of the second kind also includes the case where f (x) becomes
unbounded only at an interior point x = x0 of the interval a < x < b; then we define
01
0212 00
( ) lim ( ) lim ( )
bx b
aa x
fxd x fx d x fx d x
−∈
+∈∈→ + ∈→ +
=+∫∫ ∫  (6)
The integral on the left of Equation (6) converges or diverges according as the limits on the right exist or
do not exist.
Extensions of these definitions can be made in case f(x) becomes unbounded at two or more points of the
interval a < x < b.
Cauchy Principal Value
It may happen that the limits on the right of Equation (6) do not exist when /H92801 and /H92802 aproach zero indepen-
dently. In such case it is possible that by choosing /H92801 = /H92802 = /H9280 in (6), i.e., writing
fx d x fxd x fxd x
a
b
x
b
a
x
() l i m () ()=+ {∈→ + +∈
−∈
∫∫ ∫0 0
0
} } (7)
the limit does exist. If the limit on the right of Equation (7) does exist, we call this limiting value the Cauchy
principal value of the integral on the left. See Problem 12.14.
EXAMPLE. The natural logarithm (i.e., base e) may be defined as follows:
ln , 0
x
t
dtxx t=< < ∞∫
Since 1()fx x=  is unbounded as x → 0, this is an improper integral of the second kind (see Figure 12.2).
Also,
0
dt
t
∞
∫ is an integral of the third kind, since the interval to the right is unbounded.
Now
1
00
lim lim [ln1 ln ]  as 0;dt
t∈∈→ ∈→
=− ∈ → − ∞ ∈ →∫  therefore, this improper integral of the second kind is
divergent. Also,
1
lim lim [ln ln
x
t xx
dt dt xtt
∞
→∞ →∞
== −∫∫ 1];→∞  this integral (which is of the first kind) also
diverges.
Figure 12.2
Special Improper Integrals of the Second Kind
1.
()
b
pa
dx
xa−∫  converges if p < 1 and diverges if p ≥  1.
2.  converes if  < 1 and diverges if   1.()
b
pa
dx ppbx ≥−∫
These can be called p integrals of the second kind. Note that when p <  0 the integrals are proper.


## Page 337

CHAPTER 12  Improper Integrals326
Convergence Tests for Improper Integrals of the Second Kind
The following tests are given for the case where f (x) is unbounded only at x = a in the interval a < x < b.
Similar tests are available if f(x) is unbounded at x = b or at x = x0 where a < x0 < b.
1. Comparison test for integrals with nonnegative integrands.
(a) Convergence. Let g (x) ε 0 for a  < x < b, and suppose that ()
b
a
gxd x∫  converges. Then if
0 ( ) ( ) for , ( )  also converges.
b
a
fx g x a x b fxd x<< < < ∫
EXAMPLE.
4
11 for 1.
11
x
xx
<>
−−
 Then since
5
1 1
dx
x −∫  converges (p integral with a = 1, p = 1
2
),
5
1 4 1
dx
x −∫  also converges.
(b) Divergence. Let g (x) >  0 for a  < x < b, and suppose that ()
b
a
gxd x∫  diverges. Then if
( ) ( ) for , ( )  also diverges.
b
a
fx g x a x b fx d x>< > ∫
EXAMPLE. 44
ln 1  for 3.(3 ) (3 )
x xxx >>−−
 Then since 43 (3 )
b dx
x −∫  diverges (p integral with a = 3, p = 4),
43
ln
(3 )
b x dxx −∫ also diverges.
2. Quotient test for integrals with nonnegative integrands.
(a) If f (x) >  0 and g(x ) >  0 for a < x < b, and if ()lim 0 or ,()xa
fx Agx→
=≠ ∞  then ()
b
a
fxd x∫  and
()
b
a
gxd x∫  either both converge or both diverge.
(b) If 0 in A =  (a), and
b
a
( )  converges, then ( )  converges.
b
a
g x dx f x dx∫∫
(c) If  in A =∞  (a),
b
a
and ( )  diverges, then ( )  diverges.
b
a
g x dx f x dx∫∫
This test is related to the comparison test and is a very useful alternative to it. In particular, taking g(x) =
1/ (x – a)p we have, from known facts about the p integral, the following theorems.
Theorem 3. Let lim
xa→+
 (x – a)p f (x) = A. Then
(i) ( )  converges if 1 and  is finite
b
a
fx d x p A <∫ .
(ii) ( )  diverges if 1 and 0 (A may be infinite).
b
a
fx d x p A >≠∫
If f (x) becomes unbounded only at the upper limit, these conditions are replaced by those in Theorem 4.
Theorem 4. Let lim
xb→−
 (b – x)p f (x) = B. Then
(i) ( )  converges of 1 and  is finite
b
a
fx d x p B<∫ .
(ii) ( )  diverges if 1 and 0 (  may be infinite).
b
a
f x dx p B B >≠∫
EXAMPLE 1.
5 1/2
41 / 2 41 4 11
11 1 converges, since lim ( 1) . lim .2(1 ) 11 xx
dx xx xxx →+ →+
−−= = −−−∫
EXAMPLE 2.
3
0 22 3
11 .. diverges, since lim (3 )
10(3 ) 1 (3 ) 1x
dx x
xx xx→−
−=
−+ −+∫
3. Absolute and conditional convergence.
b
a
( )  is called   if | ( ) |
b
a
f x dx absolute convergent f x dx∫∫ con-
verges. If ( )  converges but | ( ) |  diverges, then ( )
bb b
aa a
fxd x fx d x fxd x∫∫ ∫  is called conditionally conver-
gent.


## Page 338

CHAPTER 12  Improper Integrals 327
Theorem 5. If | ( ) |
b
a
fx d x∫  converges, then ()
b
a
fxd x∫  converges. In words, an absolutely convergent
integral converges.
EXAMPLE.
4
33 3
sin 1 1 and  converges  integral with , , 3
xd x pa p
xx x
π
π
π
ππ π
⎛⎞<= =⎜⎟−− − ⎝⎠∫  it follows
that
4
3
sin x dx
x
π
π π −∫ converges and thus
4
3
sin x dx
x
π
π π −∫  converges (absolutely).
Any of the tests used for integrals with nonnegative integrands can be used to test for absolute conver-
gence.
Improper Integrals of the Third Kind
Improper integrals of the third kind can be expressed in terms of improper integrals of the first and second
kinds, and, hence, the question of their convergence or divergence is answered by using results already es-
tablished.
Improper Integrals Containing a Parameter, Uniform Convergence
Let
() ( ,)
a
fx d xφα α
∞
= ∫  (8)
This integral is analogous to an infinite series of functions. In seeking conditions under which we may
differentiate or integrate φ(α) with respect to α, it is convenient to introduce the concept of convergence for
integrals by analogy with infinite series.
We shall suppose that the integral (8) converges for α
1 < α < α 2, or, briefly, [α1, α 2].
Definition. The integral (8) is said to be uniformly convergent in [α 1, α 2] if for each /H9280 > 0 we can find a
number N depending on /H9280 but not on α, such that
12( ) ( , ) for all  and all  in [ , ]
u
a
fx d x u Nφα α α α α−< ∈>∫
This can be restated by noting that () ( , ) ( ,) ,
u
au
fx d x fx d xφα α α
∞
−=∫∫  which is analogous in an infinite
series to the absolute value of the remainder after N terms.
This definition and the properties of uniform convergence to be developed are formulated in terms of improper
integrals of the first kind. However, analogous results can be given for improper integrals of the second and third
kinds.
Special Tests for Uniform Convergence of Integrals
1. Weierstrass M test. If we can find a function M(x) ε 0 such that
(a) |f (x, α)| < M(x) α 1 < α < α 2, x > a
(b) ( )  converges
a
Mxd x
∞
∫
then (, )
a
fx d xα
∞
∫  is uniformly and absolutely convergent in α1 < α < α 2.
EXAMPLE. Since 22 2 0
cos 1 dx  and 11x 1
x
xx
α ∞
<++ + ∫  converges, it follows that 20
cos x
x1 dxα∞
+∫  is uniformly and
absolutely convergent for all real values of α.


## Page 339

CHAPTER 12  Improper Integrals328
As in the case of infinite series, it is possible for integrals to be uniformly convergent without being ab-
solutely convergent, and conversely.
2. Dirichlet’s test. Suppose that
(a) ψ(x) is a positive monotonic decreasing function which approches zero as x → /H11009.
(b) 12( , )  for all  and .
u
a
f x dx P u aαα α α<> < <∫
Then the integral (,   ) ()
a
fx xd xαψ
∞
∫  is uniformly convergent for α1 < α < α 2.
Theorems on Uniformly Convergent Integrals
Theorem 6. If f (x, α) is continuous for x ε a and α 1 < α < α 2, and if (, )
a
fx d xα
∞
∫  is uniformly conver-
gent for α1 < α < α 2, then φ(α) = (, )
a
fx d xα
∞
∫ is continuous in α1 < α < α 2. In particular, if α0 is any point
of α 1 < α < α 2, we can write
lim ( ) lim ( , ) lim ( , )
au v aa
df x f x d x
αα αα αα
φα α α α
∞∞
→→ →
== ∫∫  (9)
If α 0 is one of the endpoints, we use right- or left-hand limits.
Theorem 7. Under the conditions of Theorem 6, we can integrate φ(α) with respect to α 1 to α 2 to obtain
φα α α α α α
α
α
α
α
α
α
() ( ,) ( ,)df x d x d f x d
a
= {}∫∫ ∫
∞
1
2
1
2
1
2 2
∫ ∫{}
∞
a
dx/H9278(/H9251)d/H9251/H9251/H9251 /H9251/H9251 (10)
which corresponds to a change of the order of integration.
Theorem 8. If f (x, α) is continuous and has a continuous partial derivative with respect to α for x ε a and
α 1 < α < α 2, and if
a
f dxα
∞ ∂
∂∫  converges uniformly in α1 < α < α 2, then if a does not depend on α,
a
df dxd
φ
αα
∞ ∂= ∂∫  (11)
If a depends on α, this result is easily modified (see Leibniz’s rule, Page 198).
Evaluation of Definite Integrals
Evaluation of definite integrals which are improper can be achieved by a variety of techniques. One useful
device consists of introducing an appropriately placed parameter in the integral and then differentiating or
integrating with respect to the parameter, employing the aforementioned properties of uniform convergence.
Laplace Transforms
Operators that transform one set of objects into another are common in mathematics. Both the derivative and
the indefinite integral are examples. Logarithms provide an immediate arithmetic advantage by replacing
multiplication, division, and powers, respectively, by the relatively simpler processes of addition, subtraction,
and multiplication. After obtaining a result with logarithms, an antilogarithm procedure is necessary to find
its image in the original framework. The Laplace transform has a role similar to that of logarithms but in the
more sophisticated world of differential equations. (See Problems 12.34 and 12.36.)


## Page 340

CHAPTER 12  Improper Integrals 329
The Laplace transform of a function F(x) is defined as
5
0
() { ( ) } ( ) xfs L Fx e Fxd x
∞ −== ∫  (12)
and is analogous to power series as seen by replacing e–s by t so that e–sx = tx. Many properties of power series
also apply to Laplace transforms. Table 12.1, showing Laplace transforms, is useful. In each case, a is a real
constant.
TABLE 12.1
s s
s
s
s
s
s
s
s
s
s
s s
 F (x) /H5112{F(x)}
Linearity
The Laplace transform is a linear operator; i.e., ζ{F(x) + G(x)} = ζ{F(x)} + ζ{G(x)}.
This property is essential for returning to the solution after having calculated in the setting of the trans-
forms. (See the example that follows and the previously cited problems.)
Convergence
The exponential e–st contributes to the convergence of the improper integral. What is required is that F(x)
does not approach infinity too rapidly as x → /H11009. This is formally stated as follows: If there is some constant
a such that |F(x)| < eax for all sufficiently large values of x, then 5
0
() ( ) sfs e Fxd x
∞ −= ∫  converges when s > a
and f has derivatives of all orders. (The differentiations of f can occur under the integral sign.)
Application
The feature of the Laplace transform that (when combined with linearity) establishes it as a tool for solving
differential equations is revealed by applying integration by parts to
0
() ()
x stfs e F td t −= ∫ . By letting u = F(t)
and dυ = e–st dt, we obtain, after letting x → /H11009,
00
11() ( 0 ) ()
x st steF t d t F eF t d tss
∞−− ′=+∫∫


## Page 341

CHAPTER 12  Improper Integrals330
Conditions must be satisfied that guarantee the convergence of the integrals (for example, e –st F(t) → 0 as
t → /H11009).
This result of integration by parts may be put in the form
(a) ζ {F/H11032 (t)} = sζ {F(t)} – F(0).
Repetition of the procedure combined with a little algebra yields
(b) ζ {F/H11033(t)} = s2ζ {F(t)} – sF(0) – F/H11032 (0).
The Laplace representation of derivatives of the order needed can be obtained by repeating the process.
To illustrate application, consider the differential equation
2
2 43 s i ndy ytdt +=
where y = F(t) and F(0) = 1, F´ (0) = 0. We use
22 22
5(sin } , {cos }at atsa sa
αζζ == ++
and recall that
f (s) = ζ{F(t)} ζ {F/H11033(t)} + 4ζ{F(t)} = 3ζ{sint}
Using (b), we obtain
2
2
3() 4 () 1sfs s fs s−+ = +
Solving for f (s) yields
22 2 2 2 2
31() (4 ) (1 ) 4 1 4 4
sj sfs ss s s s s=+ = − +++ + + + +
(Partial fractions were employed.)
Referring to the table of Laplace transforms, we see that this last expression may be written
1() { s i n} { s i n 2) { c o s 2 }2fs t t t ζζ ζ=− +
then, using the linearity of the Laplace transform,
1( ) sin sin 2 cos22fs t t t ζ ⎧⎫=−+⎨⎬⎩⎭
We find that
1( ) sin sin 2 cos22Ft t t t=− +
satisfies the differential equation.
Improper Multiple Integrals
The definitions and results for improper single integrals can be extended to improper multiple integrals.
SOLVED PROBLEMS
Improper integrals
12.1. Classify according to the type of improper integral:
(a)
1
31 (1 )
dx
xx− +∫  (c)
10
23 (2 )
xd x
x −∫  (e) 20
1c o s x dxx
π −
∫


## Page 342

CHAPTER 12  Improper Integrals 331
(b)
0 1t a n
dx
x
∞
+∫  (d)
2
42 1
xd x
xx
∞
−∞ ++∫
(a) Second kind (integrand is unbounded at x = 0 and x = –1).
(b) Third kind (integration limit is infinite and integrand is unbounded where tan x = –1).
(c) This is a proper integral (integrand becomes unbounded at x = 2, but this is outside the range of in-
tegration 3
< x <  10).
(d) First kind (integration limits are infinite but integrand is bounded).
(e) This is a proper integral (since 20
1 cos 1lim 2x
x
x→+
− =  by applying L’ Hospital’s rule).
12.2. Show how to transform the improper integral of the second kind,
2
,
(2 )t
dx
xx −∫  into (a) an improper
integral of the first kind, (b) a proper integral.
(a) Consider
2
(2 )t
dx
xx
−∈
−∫ , where 0 < < 1, say.∈ 1Let 2 . x y−=  Then the integral becomes
1/
1 21
dy
yy
∈
−∫ . As /H9280→ 0 +, we see that consideration of the given integral is equivalent to consideration
of
1
,
21
dy
yy
∞
−∫
 which is an improper integral of the first kind.
(b) Letting 2 – x = υ2 in the integral of (a), it becomes
1
2
2.
2
dυ
υ
∈
+∫  We are thus led to consideration of
1
0 2
2
1
dυ
υ+∫ , which is a proper integral.
From this, we see that an improper integral of the first kind may be transformed into an improper integral
of the second kind, and conversely (actually this can always be done).
We also see that an improper integral may be transformed into a proper integral (this can only sometimes
be done).
Improper integrals of the first kind
12.3. Prove the comparison test (Page 326) for convergence of improper integrals of the first kind.
Since 0 < f (x) < g(x) for x ε a, we have, using Property 7, Page 98,
0( ) ( ) ( )
bb
aa
f x dx g x dx g x dx
α
∞
<<<∫∫∫
But, by hypothesis, the last integral exists. Thus, lim ( )  exists,
b
ab
fxd x
→∞ ∫  and, hence, ( )  convergesfxd x
α
∞
∫ .
12.4. Prove the quotient test (a) on Page 326.
By hypothesis, ()lim 0.()x
fx Agx→∞
=>  Then, given any /H9280 > 0, we can find N such that ()
()
fx Agx −< ∈  when
x ε N. Thus, for x ε N, we have
() ( )() () ( )()()
fxAA o r A g x f x A g xgx−∈< < +∈ −∈ < < +∈
Then
( ) ()   ()   ( ) ()
bb b
NN N
A gxd x fxd x A gxd x−∈ < < +∈∫∫ ∫  (1)
There is no loss of generality in choosing A – /H9280 > 0.
If
a
∞
∫ g(x) dx converges, then by the inequality on the right of Equation (1),
lim ( ) exists, and so ( )  converges
b
Nab
fxd x fxd x
∞
→∞ ∫∫ .


## Page 343

CHAPTER 12  Improper Integrals332
If
a
∞
∫ g(x) dx diverges, then by the inequality on the left of Equation (1), lim ( )
b
Nb
fxd x
→∞
=∞∫ ,
and so ( ) diverges
a
fxd x
∞
∫ .
For the cases where A = 0 and A = /H11009, see Problem 12.41.
As seen in this and Problem 12.3, there is, in general, a marked similarity between proofs for infinite
series and improper integrals.
12.5. Test for convergence: 421
()
351
xd xa
xx
∞
++∫ and
2
2 6
1() .
16
xbd x
x
∞ −
+∫
(a) Method 1: For large x, the integrand is approximately x/3x4 = 1/3x3.
42 3
1Since 351 3
x
xx x <++ 3
1 and 3 t
dx
x
∞
∫  converges (p integral with p = 3), it follows by the compari-
son test that 421 351
xd x
xx
∞
++∫  also converges.
Note that the purpose of examining the integrand for large x is to obtain a suitable comparison integral.
 Method 2: 42 3 1
1( )( ) , ( ) . Since lim , and ( )  converges3351 x
xf xLet f x g x g x dxxx x
∞
→∞
== ++ ∫ ,
1
( ) also converges by the quotient test.fxd x
∞
∫
Note that in the comparison function g(x), we have discarded the factor 1
3
. However, it could just as well
have been included.
 Method 3: 3
42
1lim .3351x
xx xx→∞
⎛⎞ =⎜⎟ ++⎝⎠
 Hence, by Theorem 1, Page 324, the required integral
converges.
(b) Method 1: For large x, the integrand is approximately x 2/ x6 = 1/x.
22
2266
11 1 1 1For 2, . . Since   diverges,  also diverges.2211 6
xd x xxd xxxxx
∞∞−−>>
++ ∫∫
 Method 2:
2
6
11Let ( ) , ( ) . Then
x1 6
xfx g x x
−==
−
, ()since lim 1 ()x
fx
gx→∞
=
2
and ( )  diverges,gxd x
∞
∫
2
( )  also diverges.fxd x
∞
∫
 Method 3: Since
2
6
1lim 1
16x
xx
x→∞
⎛⎞ − =⎜⎟⎜⎟ +⎝⎠
, the required integral diverges by Theorem 1, Page 324.
Note that Method 1 may (and often does) require us to obtain a suitable inequality factor (in this case,
1
2
or any positive constant less than
1
2 ) before the comparison test can be applied. Methods 2 and 3, however, do
not require this.
12.6. Prove that
2
0
xed x
∞ −
∫  converges.
lim
x→∞
x2
2xe−  = 0 (by L’Hospital’s rule or otherwise). Then, by Theorem 1, with A = 0, p = 2, the given
integral converges. Compare Problem 11.10(a).
12.7. Examine for convergence: (a)
1
ln ,x dxxa
∞
+∫  where a is a positive constant and (b) 20
1c o s .x dxx
∞ −
∫
(a) lnlim . .
x
xx xa→∞
=∞+
 Hence, by Theorem 1, Page 324, with A = /H11009, p = 1, the given integral diverges.
(b) 22 200
1c o s 1c o s 1c o sxxxdx dx dxxxx
π
π
∞∞ −−− =+∫∫ ∫ .


## Page 344

CHAPTER 12  Improper Integrals 333
The first integral on the right converges [see Problem 12.1(e)].
Since 3/2
2
1c o slim 0,
x
xx x→∞
−⎛⎞ =⎜⎟⎝⎠
 the second integral on the right converges by Theorem 1, Page 324, with
A = 0 and p = 3/2.
Thus, the given integral converges.
12.8. Test for convergence:
1
()
xead x x
−
−∞∫ and
32
6() .1
xxbd xx
∞
−∞
+
+∫
(a) Let x = – y. Then the integral becomes
1
.
ye dyy
−∞
−∫
 Method 1:  for 1. Then
y
ye ey
−
−<< , -y
11
since e  converges,
yedy dyy
−∞∞
∫∫  converges; hence, the
given integral converges.
 Method 2: 2lim lim 0.
y
y
xy
eyy ey
−
−
→∞ →∞
⎛⎞ ==⎜⎟
⎝⎠
 Then the given integral converges by Theorem 1, Page 324,
with A = 0 and p = 2.
(b) Write the given integral as
32 320
66 011
xx xx dx dxxx
∞
−∞
++ +++∫∫ . Letting x = –y in the first integral, it becomes
32 32
3
660
. Since lim 1,
11 y
yy yydy y
yy
∞
→∞
⎛⎞−−−= ⎜⎟++ ⎝⎠∫  this integral converges.
32
3
6Since lim 1,
1x
xxx
x→∞
⎛⎞ + =⎜⎟ +⎝⎠
 the second integral converges.
Thus, the given integral converges.
Absolute and conditional convergence for improper integrals of the first kind
12.9. Prove that
0
( )  converges if | ( ) |fxd x fx d x
α
∞∞
∫∫  converges; i.e., an absolutely convergent integral is
convergent.
We have – |f (x)| < f (x) <  | f (x)|; i.e., 0 < f (x) + | f (x)| 2| f (x)|. Then
0 [ () | () ] 2 | () |
bb
aa
fx fx d x fx d x<< + <∫∫
If
α
∞
∫ | f (x)| dx converges, it follows that
α
∞
∫ | f (x) + |f (x)|] dx converges. Hence, by subtracting
α
∞
∫ | f (x)| dx,
which converges, we see that
α
∞
∫ f (x) dx converges.
12.10. Prove that 2
cos.
t
x
x
∞
∫ dx converges.
Method 1: 22
cos. 1  for 1.x xxx <>  Then by the comparison test, since 2t
dx
x
∞
∫  converges, it follows that
2
cos.  x converges
t
x d
x
∞
∫ ; 22
cos. cos. x converges, i.e.,
tt
xx d
xx
∞∞
∫∫  converges absolutely, and so converges
by Problem 12.9.
Method 2: Since 3/2
21 / 2
cos. cos.lim lim 0
xx
xxx ex→∞ →∞
==  it follows from Theorem 1, Page 324, with A = 0 and
p = 3/2. that 2
cos.
t
x dxx
∞
∫  converges, and, hence, 2
cos.
t
x dxx
∞
∫  converges (absolutely).


## Page 345

CHAPTER 12  Improper Integrals334
12.11. Prove that sin  converges.
t
x dxx
∞
∫
1
0 0
sin sin sinSince  converges because  is continuous in 0 <  < 1 and  lim 1
x
xx xdx xxx x →+
⎛⎞ =⎜⎟⎝⎠∫ , we
need
1
sinonly show that  converges.x dxx
∞
∫
Method 1: Integration by parts yields
22
1
sin cos cos cos coscos1
M
MM M
tt t
xxx M xdx dx dxxx Mxx=− + = − +∫∫ ∫  (1)
or, on taking the limit on both sides of Equation (1) as M → /H11009 and using the fact that coslim 0,
M
M
M→∞
=
211
sin coscos1xxdx dxx x
∞∞
=+∫∫  (2)
Since the integral on the right of Equation (2) converges by Problem 12.10, the required result follows.
The technique of integration by parts to establish convergence is often useful in practice.
Method 2:
2( 1)
00
(1 )
0
sin sin sin sin
sin
n
n
n
nn
xx x xdx dx dx dxxx x x
x dxx
ππ π
ππ
π
π
∞+
∞ +
=
=+ + … + + …
=
∫∫ ∫ ∫
∑ ∫
Letting x = υ + nπ, the summation becomes
000 00
sin sin sin sin(1 ) 2
n
n
dd d dnn
πππ π υυ υ υυυ υ υπυ υ π υ π
∞
=
−+ + − …++ +∑ ∫∫∫ ∫
This is an alternating series. Since 11
(1 )nnυπυ π <++ +
 and sin υ >  0 in [0, π], it follows that
00
sin sin
(1 )ddnn
ππ υυ υυυπ υ π <++ +∫∫
Also,
00
sinlim lim 0
nn
ddnn
ππ υυ υυπ π→∞ →∞
<=+∫∫
Thus, each term of the alternating series is, in absolute value, less than or equal to the preceding term, and
the nth term approaches zero as n → /H11009. Hence, by the alternating series test (Page 281), the series and, thus,
the integral converge.
12.12. Prove that
0
sin x dxx
∞
∫  converges conditionally.
Since, by Problem 12.11, the given integral converges, we must show that it is not absolutely convergent;
i.e.,
0
sin  diverges.x dxx
∞
∫  diverges.
As in Problem 12.11, Method 2, we have
(1 )
00 00
sin sin sinn
nnn
xx dx dx dxx n
ππ
π
υ υυπ
∞∞∞+
==
== +∑∑∫∫ ∫  (1)
11Now  for 0 <  < . Hence,(1 )nn υπυπ π >++
09
sin 1 2  sin(1 ) (1 )ddnn n
ππ υ υυ υυπ π π>=++ +∫∫  (2)


## Page 346

CHAPTER 12  Improper Integrals 335
Since
0
2
(1 )n n π
∞
= +∑  diverges, the series on the right of Equation (1) diverges by the comparison test.
Hence,
0
sin x dxx
∞
∫  diverges and the required result follows.
Improper integrals of the second kind, cauchy principal value
12.13. (a) Prove that
7
31 1
dx
x− +∫  converges and (b) find its value.
The integrand is unbounded at x = – 1. Then we define the integral as
72/37 2/3
3100 0
1
(1 ) 3lim lim lim 6 62/3 21
dx x
x−+ ∈∈→ + ∈→ + ∈→ +
−+ ∈
+ ⎛⎞== − ∈ =⎜⎟+ ⎝⎠∫
This shows that the integral converges to 6.
12.14. Determine whether
5
31 (1 )
dx
x− −∫  converges (a) in the usual sense and (b) in the Cauchy principal value sense.
(a) By definition,
1
212
12
51 5
33 311 1 00
2200
12
lim lim(1 ) (1 ) (1 )
11 1 1lim lim83 222
dx dx dx
xx x
−∈
−− + ∈ ∈→ + ∈→ +
∈→ + ∈→ +
=+−− −
⎛⎞ ⎛ ⎞=− + − ⎜⎟ ⎜ ⎟ ∈∈⎝⎠ ⎝ ⎠
∫∫ ∫
and, since the limits do not exist, the integral does not converge in the usual sense.
(b) Since
15
33 2 21100
11 1 1 3lim lim 83 2 3 2(1 ) (1 ) 2 2
dx dx
xx
−∈
−+ ∈∈→ + ∈→ +
⎧⎫ ⎧⎫+= − + − =⎨⎬ ⎨ ⎬−− ∈ ∈ ⎩⎭⎩⎭∫∫
the integral exists in the Cauchy principal value sense. The principal value is 3/32.
12.15. Investigate the convergence of:
(a)
3
23 2 / 32 (8 )
dx
xx −∫  (c)
5
1 (5 )( 1)
dx
xx−−∫  (e)
/2
1/0
,1(cos ) n
dx nx
π
>∫
(b) 30
sin x dxx
π
∫  (d)
1sin1
1
2
1
x
dxx
−
− −∫
(a)
2/3
2/3
23 2 / 3 2 2 322
11 11lim ( 2) . lim .
(8 ) 2 4 81 8xx
x
xx x x x→+ →+
⎛⎞−= = ⎜⎟−+ +⎝⎠
·  Hence, the integral converges by
Theorem 3(i), Page 326.
(b) 2
30
sinlim . 1.
x
xx
x→+
=·  Hence, the integral diverges by Theorem 3(ii) on Page 326.
(c) Write the integral as
35
13
.
(5 )( 1) (5 )( 1)
dx dx
xx xx
+
−− −−∫∫
Since
1/2
1
11lim ( 1) . ,2(5 )( 1)x
x
xx→+
−=
−−
·  the first integral converges.
Since 1/2
5
11lim (5 ) . ,2(5 )( 1)x
x
xx→−
−=
−−
·  the second integral converges.
Thus, the given integral converges.
(d)
1sin
/2
1
2lim (1 ). 2 .1
x
x
x x
π
−
→−
−= −·  Hence, the integral diverges.


## Page 347

CHAPTER 12  Improper Integrals336
Another method:
1sin2
1
x
x
−
− >
/2 1
1
2 ,a n d11
dx
xx
π −
−−− ∫ diverges. Hence, the given integral diverges.
(e)
1/
1/
1/1/2 1/2
1/ 2lim ( / 2 ) . lim 1cos(cos )
n
n
nxx
xx xxππ
ππ
→− →−
−⎛⎞−= = ⎜⎟⎝⎠
· . Hence, the integral converges.
12.16. If m and n are real numbers, prove that
1 11
0
(1 )mnxx d x−− −∫  (a) converges if m > 0 and n > 0 simultaneously
and (b) diverges otherwise.
(a) For m >  1 and n >  1 simultaneously, the integral converges, since the integrand is continuous in 0 < x
<  1. Write the integral as
1/2 111 11
01 / 2
(1 ) (1 )mn mnxx d x xx d x−− −− −+ −∫∫  (1)
If 0 < m < 1 and 0 < n < 1, the first integral converges, since
0
lim
x→ + x1–m · xm–1 (1 – x)n–1 = 1, using Theorem
3(i), Page 326, with p = 1 – m and a = 0.
Similarly, the second integral converges, since limx→ 1 –  (1 – x)1–n · x)n–1 (1 – x)n – 1 = 1, using 4(i), Page
326, with p = 1 – n and b = 1.
Thus, the given integral converges if m > 0 and n > 0 simultaneously.
(b) If m <  0,
0
lim
x→ +
x · xm–1 (1 – x)n–1 = /H11009. Hence, the first integral in Equation (1) diverges, regardless of the
value of n, by Theorem 3(ii), Page 326, with p = 1 and a = 0.
Similarly, the second integral diverges if n
<  0, regardless of the value of m, and the required result fol-
lows.
Some interesting properties of the given integral, called the beta integral or beta function, are considered
in Chapter 15.
12.17.
0
11Prove that sin   converges conditionally.dxxx
π
∫
Letting x = 1/y, the integral becomes
1/
sin y dyyπ
∞
∫  and the required result follows from Problem 12.12.
Improper integrals of the third kind
12.18. If n is a real number, prove that 1
0
nxxe d x
∞ −−
∫  (a) converges if n > 0 and (b) diverges if n <  0.
Write the integral as
1 11
01
nx nxxe d x xe d x
∞−− −− +∫∫  (1)
(a) If n >  1, the first integral in Equation (1) converges, since the integrand is continuous in 0 < x <  1.
If 0 < n < 1, the first integral in Equation (1) is an improper integral of the second kind at x = 0. Since
0
lim
x→ +
x1–n · xn–1 e–x = 1, the integral converges by Theorem 3(i), Page 326, with p = 1 – n and a = 0.
Thus, the first integral converges for n > 0.
If n > 0, the second integral in Equation (1) is an improper integral of the first kind. Since lim
x→∞
x2 · xn–1
e–x = 0 (by L’Hospital’s rule or otherwise), this integral converges by Theorem 1(i), Page 324, with p = 2.
Thus, the second integral also converges for n > 0, and so the given integral converges for n > 0.
(b) If n <  0, the first integral of Equation (1) diverges, since
0
lim
x→ +
x · xn–1 e–x = /H11009 [Theorem 3(ii), Page 326].
If n <  0, the second integral of Equation (1) converges, since lim
x→∞
 · xn–1 e–x = 0 [Theorem 1(i), Page 324].
Since the first integral in Equation (1) diverges while the second integral converges, their sum also di-
verges; i.e., the given integral diverges if n <  0.
Some interesting properties of the given integral, called the gamma function , are considered in Chap-
ter 15.


## Page 348

CHAPTER 12  Improper Integrals 337
Uniform convergence of improper integrals
12.19. (a) Evaluate φ (α) =
0
 for  > 0.xed xααα
∞ −
∫ (b) Prove that the integral in (a) converges uniformly to 1 for α
/H9280α1 > 0. (c) Explain why the integral does not converge uniformly to 1 for α > 0.
(a)
0
( ) lim lim lim1 1  if  > 0
bb ae x ab
abb b x
ed x e eαφα α α−− −
→∞ →∞ →∞=
== − = − =∫
Thus, the integral converges to 1 for all α > 0.
(b) Method 1, using definition: The integral converges uniformly to 1 in αεα 1 > 0 if for each /H9280 > 0 we can
find N, depending on /H9280 but not on α, such that
0
1  for all  > .
u xed x uNαα −−< ∈∫
Since 1
0
1
111 |1 (1 ) | for ln ,
u uxu aued x e e e u N
αααα α
−−− −−= − − = < < ∈ > = ∈∫  the result follows.
 Method 2, using the Weierstrass M test: Since lim
x→/H11009
x2 · α e–α x = 0 for αα 1 > 0, we can choose
|| xe αα − < 2
1
x
 for sufficiently large x —say, x > x0. Taking 2
1()Mx x=  and noting that
0
2x
dx
x
∞
∫
converges, it follows that the given integral is uniformly convergent to 1 for αεα 1 > 0.
(c) As α1 → 0, the number N in the first method of (b) increases without limit, so that the integral cannot be
uniformly convergent for α > 0.
12.20. If
0
() ( , ) fx d xφα α
∞
= ∫  is uniformly convergent for α1 < α < α 2, prove that φ(α) is continuous this
interval.
Let ( ) ( , ) ( , ), where R( , ) ( , ) .
u
uu
f x dx R u u f x dxφα α α α α
∞
=+ =∫∫
Then ( ) ( , ) ( , ) and so
u
u
h f x h dx R u hφα α α+= + + +∫
() ( ) { ( , ) ( , ) } ( , ) ( , )
u
u
h f x h f x dx R u h R uφα φα α α α α+− = +− + +− ∫
Thus,
| ( ) ( )| | ( , ) ( , )| | ( , | | ( , )|
u
a
h f x h f x dx R u h R uφα φα α α α α+− < +− + ++ ∫  (1)
Since the integral is uniformly convergent in (α)1 <  (α) < α 2, we can, for find N independent of (α) such
that for (u) > N,
 | R(u, α + h)| < /H9280/3, |R(u,α)| < /H9280/3 (2)
Since f (x, α) is continuous, we can find δ > 0 corresponding to each /H9280 > 0 such that
| ( , ) ( , ) | / 3 for | |
a
fx h fx d x h
υ
αα δ+− < ∈ <∫  (3)
Using Equations (2) and (3) in (1), we see that |φ(α + h) – φ (α)| < /H9280 for |(h)| < δ, so that φ(α) is continuous.
Note that in this proof we assume that both α and α + h are in the interval α 1 < α < α 2. Thus, if α = α 1,
for example, h > 0 and right-hand continuity is assumed.
Also note the analogy of this proof with that for infinite series.
Other properties of uniformly convergent integrals can be proved similarly.
12.21. (a) Show that lim lim
α
α
α
ααα
→+
−∞
→+
−∞
≠ ( )∫∫0 0 00
ed x e d xxx
 and (b) explain the result in (a).
(a)
000
lim lim 1 by Problem 12.19xed xα
αα
α
∞ −
→+ →+
==∫ (a).
lim .
α
αα
→+
−∞∞
( ) ==∫∫ 000
00ed x d xx
 Thus, the required result follows.
(b) Since
0
() xed xαφα α
∞ −= ∫  is not uniformly convergent for /H9251/H11084 0 (see Problem 12.19), there is no guar-
antee that φ(/H9251) will be continuous for /H9251/H11084 0. Thus,
0
lim
α→ +
φ(/H9251) may not be equal to φ(0).


## Page 349

CHAPTER 12  Improper Integrals338
12.22. (a) Prove that 220
cos  for  > 0xer x d x r
α α αα
∞ − = +∫  and any real value of r. (b) Prove that the integral in
(a) converges uniformly and absolutely for a < /H9251< b, where 0 < a < b and any r.
(a) From integration formula 34, Page 103, we have
22 220
0
(s i n c o s )lim cos lim
MxM x
MM
e r rx rxer x d x rr
α
α αα
αα
−
−
→∞ →∞
−== ++∫
(b) This follows at once from the Weierstrass M test for integrals, by noting that | e–α x cos rx| < e–α x and
0
xed xα∞ −
∫  converges.
Evaluation of definite integrals
12.23. Prove that
/2
0
ln sin ln 2. 2xd x
π π=∫
The given integral converges [Problem 12.42(f)]. Letting x = π/2 – y,
/2 /2 /2
00 0
ln sin ln cos In cos I x dx y dy x dx
ππ π
===∫∫∫ l
Then
/2 /2
00
/2 /2 /2
00 0
sin 22 (ln sin  ln cos ) ln 2
ln sin 2 ln 2 ln sin 2 ln 2 2
xIx x dx d x
xdx dx x dx
ππ
ππ π π
⎛⎞=+ = ⎜⎟⎝⎠
=− = −
∫∫
∫∫ ∫
 (1)
Letting 2x = υ,
{}
/2 /2
02 0 0
11ln sin 2 ln sin ln sin22
1 ( ) (letting  =  in the last integral)2
xd x d d
II I
ππ π
υυ υ υ
υπ
==
=+ = −
∫∫ ∫
123
123
0
π
∫
Hence, Equation ( ) becomes 2 ln on ln 2.22lI I I ππ== −
12.24. Prove that
2
0
ln sin ln 2.xx d x
π π=− 2∫
Let x = π – y. Then, using the results in the preceding problem,
00 0
ln sin ( ) ln sin ( ) ln sin Jx x d x u u d u x x d x
ππ π
ππ== − = −∫∫ ∫
00
2
ln sin  ln sin
ln 2
xd x x xd x
J
ππ
π
π
=−
=− −
∫∫
2
or     ln 2. 2J π=−
12.25. (a) Prove that 2
dx
x αφα
∞
+0
() = ∫  is uniformly convergent for α /H11084 1. (b) Show that ( ) = .
2
πφα
α
(c) 220
Evaluate . (1 )
dx
x
∞
+∫ (d)
/2 2
2100
1.3.5...(2 1)Prove that  cos .2.4.6...(2 ) 2(1 )
n
n
dx nd nx
π πθθ
∞
+
−==+∫∫
···
···
(a) The result follows from the Weierstrass test, since 2
1
x α +< 22 0
1  for  > 1 and 11
dxaxx
∞
++ ∫ converges.
(b)
11
20
0
11( ) = lim lim tan lim tan
2
b
b
bb b
dx x b
x
πφα α αα αα α
−−
→∞ →∞ →∞
== =+∫


## Page 350

CHAPTER 12  Improper Integrals 339
(c) From (b), 20
.
2
dx
x
π
α α
∞
=+∫  Differentiating both sides with respect to /H9251, we have
3/2
22 200
1
4()
dxdxxx
π αα αα
∞∞ −∂ ⎛⎞ =− =⎜⎟∂ ++⎝⎠∫∫
the result being justified by Theorem 8, Page 328, since 220 ()
dx
x α
∞
+∫  is uniformly convergent for α /H11084 1
2 2 22 22 0
11because    and  converges .() ( 1 ) ( 1 )
dx
xx x α
∞⎛⎞ <⎜⎟ ++ +⎝⎠ ∫
Taking the limit as α→  1 +, using Theorem 6, Page 328, we find 220
.4(1 )
dx
x
π∞
=+∫
(d) Differentiating both sides of 1/2
20 2
dx nx
π αα
∞ −=+∫ times, we find
(2 1, 2)
210
135 2 1( 1)( 2)...( ) 222 2 2()
n
n
dx nn x
π αα
∞ −−
+
−⎛⎞ ⎛⎞ ⎛⎞ ⎛ ⎞− −− = −−− … − ⎜⎟ ⎜⎟ ⎜⎟ ⎜ ⎟+ ⎝⎠ ⎝⎠ ⎝⎠ ⎝ ⎠∫··· ···
where justification proceeds as in (c). Letting α→  1 +, we find
210
135 ( 2 1 ) 135 ( 2 1 )
22 4 6 ( 2 ) 2(1 ) 2 ! nn
dx n n
nxn
ππ∞
+
⋅ ⋅ ⋅⋅⋅ − ⋅ ⋅ … −== ⋅⋅…+∫
···
···
Substituting x = tan θ, the integral becomes
/2 2
0
cos n d
π
θθ∫  and the required result is obtained.
12.26. Prove that
22
220
1 ln  where , 0.sec 2
ax bxee b r dx a bxr x ae
−∞ −+ => +∫
From Problem 12.22 and Theorem 7, Page 328, we have
e rx d dx e rx dxx
a
b
x
x
x
−
= =
∞ −
=
∞
∫∫∫{} = {
α
α
ααcos cos
00 } }=∫α
α
a
b
d
or
220
cos
bx b
xa
a
er x dx dx r
α
α
α
α αα
∞
==
=
=− +∫∫
i.e.,
22
220
1 lnsec 2
ax bxee b r dxxr x ar
−−∞ −+ = +∫
12.27. Prove that 12
20
1 cos 1tan ln( 1), 0.2
x xed x x
α α ααα
∞ −− =− + >∫
By Problem 12.22 and Theorem 7, Page 328, we have
e rx dx dr e rx dr dxxr axr−∞ −∞
∫∫∫ ∫{} = {}
α cos cos
000 0
or
1
2200
sin tan
rax rx red x x r
α
αα
∞ −− == +∫∫
Integrating again with respect to r from 0 to r yields
11 2 2
200
1c o s tan tan ln( ) 2
rax rx r red x d r r rx
α ααα
∞ −− − − == − +∫∫
using integration by parts. The required result follows on letting r = 1.
12.28. Prove that 20
1c o s .2
x dxx
π∞ − =∫


## Page 351

CHAPTER 12  Improper Integrals340
Since 22 20
1c o s 1c o s 1c o s for  > 0,  > 0 and ax xx xex dxxx xα
∞− −− −< ∫  converges [see Problem
12.7(b)], it follows by the Weierstrass test that 20
1c o sx xed x x
α∞ −
∫  is uniformly convergent and represents a
continuous function of α for α /H11084 0 (Theorem 6, Page 328). Then, letting α→ 0 +, using Problem 12.27, we have
12
220000
1 cos 1 cos 1lim lim tan ln( 1) 22
x xxed x d xxx
α
αα
απ αα
∞∞ −−
→→
−− ⎧⎫== − + = ⎨⎬⎩⎭∫∫
12.29. Prove that
2
200
sin sin .2
xx dxx x
π∞∞
==∫∫
Integrating by parts, we have
2
1 cos 1 sin 1 cos 1 cos sin(1 cos )
M
MM M xx M xdx x dx dxxx M xx∈∈ ∈
∈
−− ∈ −⎛⎞=− − + = − +⎜⎟ ∈⎝⎠∫∫ ∫
Taking the limit as /H9280→ 0+ and M → /H11009 shows that
00
sin 1 cos
2
xxdx dxxx
π∞∞ −==∫∫
2
20
1 cos sin ( / 2)Since 2 xxdxxx
∞ − =∫
2
2200
sin  on letting u = / 2, we also have udx du xu
∞∞
=∫∫
2
20
sin .2
x dxx
π∞
=∫
12.30. Prove that
3
0
sin .4
x dxx
π∞
=∫
2 32 2 3
3
3
33
() 3 () ( ) 3 () () ( )sin 2 (2 )
131 3 sin 3 sin42 4 2 4 4
ix ix ix ix ix ix ix ix
ix ix ix ix
ee e e e e e ex i i
ee e e xxii
−− −
−− −
⎛⎞ −− + −==⎜⎟
⎝⎠
⎛⎞ ⎛ ⎞−−=− + =− +⎜⎟ ⎜ ⎟
⎝⎠ ⎝ ⎠
Then
3
00 0 0 0
sin 3 sin 1 sin 3 3 sin 1 sin
44 4 4
3
4
xx xx udx dx dx dx duxxx x u
∞∞ ∞ ∞ ∞
=− = −
=
∫∫ ∫ ∫ ∫
1
24 2 4
ππ π⎛⎞ ⎛⎞−=⎜⎟ ⎜⎟⎝⎠ ⎝⎠
Miscellaneous problems
12.31. Prove that
2
0
/2 .xed x π
∞ − =∫
By Problem 12.6, the integral converges.
22
00
Let  and let lim ,
MM xy
MM M
I e dx e dy I I−−
→∞
== =∫∫  the re-
quired value of the integral. Then
I e dx e dy
ed x d y
M
xM xM
xyM
2
00
0
22
22
= ( )( )
=
−−
−+
∫∫
∫
()
0 0
22
M
xy
M
ed x d y
∫
∫∫= −+()
where ℜ M is the square OACE of side M (see Figure 12.3). Since the integrand is positive, we have
22 22() 2 ()xy xy
M
MM
ed x d y I ed x d y−+ −+<<∫∫ ∫∫  (1)


## Page 352

CHAPTER 12  Improper Integrals 341
where ℜ 1 and ℜ 2 are the regions in the first quadrant bounded by the circles having radii M and M π2 , respec-
tively.
Using polar coordinates, we have, from Equation (1),
2/2
00
M
p
ed d
π ρ
φ
ρρφ−
==∫∫ < 2
MI <
2/2 2
00
M
ed d
π ρ
φπ
ρρφ−
==∫∫  (2)
or
22 22(1 ) (1 )44
MM
MeI eππ −−< < −  (3)
Then, taking the limit as M → /H11009 in Equation (3), we find lim
M →∞
I2
M = I2 = π/4 and I = /2π
12.32. Evaluate
2
0
cos .xex d x α
∞ −
∫
Figure 12.3
Let
2
0
() c o s . xIe x d xαα
∞ −= ∫  Then, using integration by parts and appropriate limiting procedures.
22 2
000
11sin sin | cos22 2
xx xdt x e xd x e x e xd x Id
ααα α αα
∞∞ −− ∞ −=− = − = −∫∫
The differentiation under the integral sign is justified by Theorem 8, Page 328, and the fact that
2
0
xxe
∞ −
∫  sin
α x dx is uniformly convergent for all α (since by the Weierstrass test, |xe– x2 sin α x| < xe – x2 and
2
0
xxe dx
∞ −
∫
converges).
From Problem 12.31 and the uniform convergence, and thus continuity, of the given integral (since |e– x2
cos α  x | < e–x2 and
0
∞
∫ e–x2 dx converges, so that that Weierstrass test applies), we have I (0) =
0
1lim ( ) . 2I
α
απ
→
=
2 /4Solving  subject to (0) ,  we find ( )22 2
dI II I ed
ααπ π αα
−=− = =
12.33.
2 22(/ ) ( x )
00
( )  Prove that ( ) . ( ) Evaluate e .2
xx xaI e d x b d xα πα
−∞∞ −− − +==∫∫
(a)
2(/ ) 2
0
We have ( ) 2 (1 / ) xxIe x d x ααα
∞ −−′ =− ∫
The differentiation is proved valid by observing that the integrand remains bounded as x → 0 + and that
for sufficiently large x,
e–(x–α/x)2  (1 – α/x 2) = e– x2 + 2α – α 2/x2 (1 – α/x 2) < e2α e–x2
so that I/H11032 (α) converges uniformly for αε 0 by the Weierstrass test, since
0
∞
∫ e – x2
dx converges. Now


## Page 353

CHAPTER 12  Improper Integrals342
2
2
(/ )
(/ )
200
() 2 2 0
xx
xx eI e dx dxx
α
ααα
−−∞∞ −−′ =− =∫∫
as seen by letting α/x = y in the second integral. Thus, I(α) = c, a constant. To determine c, let α→  0+ in the
required integral and use Problem 12.31 to obtain c = /2 .π
(b)
22 2 2 2 2 2
22 2 22
(/ ) ( ) 2 ( )
00 0
() 2 ( ) 2
00
From (a), .2
Then  .  Putting  = 1,  .22
x x xx xx
xx x x
e dx e dx e e dx
e d xe ed xe
αα α α
αα
π
ππ α
−−
− −
∞∞ ∞ −− + − +
∞∞ −+ − −+ −
== =
==
∫∫ ∫
∫∫
12.34. Verify the results: () { } ,ae s saax/H5112= − >1
α and ( ) {cos } ,ba z s
sa s/H5112= + > 022 ..
(a) {} l i m ()ee e d x e d xax sx ax
M
sa xM
/H5112==
=
−∞
→∞
−−
∫∫00
llim
()
M
sa Me
sa sa sa
→∞
−−−
− = −
11 if  >
(b) {cos ) cosax e ax dx s
sa
sx/H5112== +
−∞
∫0 22  by Problem 12.22 with α = s, r = a.
Another method, using complex numbers. From (a), e sa
ax{} ./H5112= −
1  Replace a by ai. Then
/H5112/H5112 /H5112 /H5112{ } {cos sin } {cos } {sie ax i ax ax iaix =+ = + nn}ax
sa i
sa i
sa
s
sa i a
sa= − = +
+ = + + +
1
22 22 22
Equating real and imaginary parts:
/H5112{cos }ax s
s= +2 a a ax a
sa22 2,{ s i n}/H5112= +
This formal method can be justified using the methods in Chapter 16.
12.35. Prove that (a) /H5112{Y/H11032 (x)} = (s) /H5112 {Y (x)} – Y(0) and (b) /H5112 {Y/H11033 (x)} = s2 /H5112{Y(x)} – sY (0) – Y/H11032 (0) under
suitable conditions on Y(x).
(a) By definition (and with the aid of integration by parts),
/H5112{( ) } ( ) l i m ( )′ = ′ = ′−
→
∞ −
∫Yx eYx d x eYx d xsx
M
sxM
000 ∫ ∫
∫=+ {}
=
→∞
−−
−
lim ( ) ( )
M
sx M sxM
sx
eY x s eY x d x
se Y
0 0
(() () { () } ()xd x Y s x Y−= −
∞
∫ 00
0
/H5112
assuming that s is such that limM→/H11009e–sM Y (M) = 0.
(b) Let U(x) = Y/H11032(x). Then by (a), /H5112{U/H11032(x)} – U(0). Thus,
/H5112{Y/H11032 (x)} = s/H5112{Y/H11032(x)} – Y/H11032(0) = s[s/H5112{Y(x)} – Y (0)] – Y/H11032(0)
= s2 /H5112{Y (x)} – sY(0) – Y/H11032(0)
12.36. Solve the differential equation Y /H11033 (x) + Y (x) = x,Y(0) = 0, Y/H11032 (0) = 2.
Take the Laplace transform of both sides of the given differential equation. Then by Problem 12.35.
/H5112{Y/H11033 (x) + Y (x)} = /H5112{x},/H5112{Y/H11033 (x)} + /H5112{Y(x)} = 1/s2
and so
s2 /H5112{Y (x)} – s/H5112 (0) – Y/H11032(0) + /H5112{Y(x)} = 1/s2


## Page 354

CHAPTER 12  Improper Integrals 343
Solving for /H5112{Y(x)} using the given conditions, we find
/H5112{() } ()Yx s
ss s s= + =+ +
2
1
11
1
2
22 2 2  (1)
by methods of partial fractions.
Since  and  it follow11
122s x s x= + =/H5112/H5112{ } {sin }, ss that 11
122ss xx+ + =+/H5112{s i n }
Hence, from (1), /H5112{Y(x)} = /H5112{x + sin x}, from which we can conclude that Y(x) = x + sin x, which is, in
fact, found to be a solution.
Another method: If /H5112{F(x)} = f(s), we call f(s) the inverse Laplace transform of F(x) and write f(s) = /H5112–1
{F(x)}.
By Problem 12.78. /H5112–1 {f (s) + g(s)} = /H5112–1 = /H5112–1 {f (s) + /H5112–1 {g(s)}. Then, from Equation (1),
Yx ss s s() =+ +
⎧⎨⎩
⎫⎬⎭
= ⎧⎨⎩
⎫⎬⎭
+−− −/H5112/H5112 /H51121
22
1
2
1
2
11
1
11
+ +
⎧⎨⎩
⎫⎬⎭
=+1 x sin
Inverse Laplace transforms can be read from Table 12.1.
SUPPLEMENTARY PROBLEMS
Improper integrals of the first kind
12.37. Test for convergence:
(a)
2
40
1
1
x dxx
∞ +
+∫ (d) 40 4
dx
x
∞
+∫ (g)
2
25 / 20 (1 )
xd x
xx
∞
++∫
(b)
2 3 1
xd x
x
∞
−∫ (e) 2
2s i n
1
x dxx
∞
−∞
+
+∫ (h) ln
xt
xd x
xe
∞
−+∫
(c)
32t
dx
xx
∞
+∫ (f) 32 (ln )
xd x
x
∞
∫ (i)
2
20
sin x dxx
∞
∫
Ans. (a) convergence (b) divergence (c) convergence (d) convergence (e) convergence (f ) divergence (g)
convergence (h) divergence (i) convergence
12.38. Prove that 22 22
 if | | .2
dx baxa x b ba
π∞
−∞
=>++ −∫
12.39. Test for convergence: () l n , x
t
ae x d x
∞ −
∫ 0
() l n ( 1 ) ,xxbe e d x
∞ − +∫ and 2
0
() c o s h .xce x d x
∞ −
∫
Ans. (a) convergence (b) convergence (c) divergence
12.40. Test for convergence, indicating absolute or conditional convergence where possible: 30
sin 2()
1
xad x x
∞
+∫ ;
2
() axbe
∞ −
−∞∫  cos bx dx, where a, b are positive constants;
0 2
cos()
1
xcd x
x
∞
+∫ ;
0 22
sin() ;xxdd x
xa
∞
+∫ and
0
cos() .cosh
xed xx
∞
∫
Ans. (a) absolute convergence (b) absolute convergence (c) conditional convergence (d) divergence (e)
absolute convergence
12.41. Prove the quotient tests (b) and (c) on Page 323.


## Page 355

CHAPTER 12  Improper Integrals344
Improper integrals of the second kind
12.42. Test for convergence:
(a)
1
0 2(1 ) 1
dx
xx+−∫ (d)
2
1 3 3
ln
8
x dx
x−∫ (g)
23
20 (3 )
x dxx−∫ (j)
3
0 x
dx
x∫
(b)
1
20
cos x dxx∫ (e)
1
0 ln(1/ )
dx
x∫ (h)
/2
0
cosxex dxx
π −
∫
(c)
1tan1
1
xe dxx
−
−∫ (f)
/2
0
ln sin xd x
π
∫ (i)
221
20
1 ,| | 11
kx dx kx
− <−∫
Ans. (a) convergence (b) divergence (c) divergence (d) convergence (e) convergence (f) convergence (g)
divergence (h) divergence (i) convergence (j) convergence
12.43. (a) Prove that
5
0 4
dx
x−∫  diverges in the usual sense but converges in the Cauchy principal value senses. (b)
Find the Cauchy principal value of the integral in (a) and give a geometric interpretation.
Ans. (b) In 4
12.44. Test for convergence, indicating absolute or conditional convergence where possible:
1
0
1() c o s ,ad xx
⎛⎞
⎜⎟⎝⎠∫
1
0
11() c o s ,bd xxx
⎛⎞
⎜⎟
⎝⎠∫ and
1
20
11() c o s .cd xxx
⎛⎞
⎜⎟
⎝⎠∫
Ans. (a) absolute convergence (b) conditional convergence (c) divergence
12.45.
4 2
30
1 1 32 2Prove that 3 sin cos .xx d x xx
π
π
⎛⎞ −=⎜⎟⎝⎠∫
Improper integrals of the third kind
12.46. Test for convergence:
0
() l n , xae x d x
∞ −
∫ 0
() ,
ln( 1)
xed xb
xx
−∞
+∫ and
30
() .
(3 2sin )
xed xc
xx
−∞
+∫
Ans. (a) convergence (b) divergence (c) convergence
12.47. Test for convergence:
0 3 42
() dxa
xx
∞
+∫ and
0
() , 0 .
sinh ( )
xed xba
ax
∞
>∫
Ans. (a) convergence (b) convergence if a > 2, divergence if 0 < a <  2.
12.48. Prove that
0
sinh( )
sinh( )
ax dxxπ
∞
∫  converges if 0 <  |a| < π and diverges if |a| < π.
12.49. Test for convergence, indicating absolute or conditional convergence where possible:
0
sin()
2
xad x
∞
∫ and
0
sin() .
sinh
xbd x
x
∞
∫
Ans. (a) conditional convergence (b) absolute convergence
Uniform convergence of improper integrals
12.50. (a) Prove that 20
cos() 1
x dxx
αφα
∞
= +∫  is uniformly convergent for all α. (b) Prove that φ(α) is continuous for
all α. (c) Find
0
lim
α→
φ(α).
Ans. (c) π/2
12.51. Let
22
0
() () , ) ,w h e r e  ( , ) . xFx d x Fx x e αφα α α α
∞ −==∫  (a) Show that φ(α) is not continuous at α = 0;
i.e.,
0000
lim ( , ) lim ( , )Fx d x Fx d x
αα
αα
∞∞
→→
≠∫∫ . (b) Explain the result in (a).


## Page 356

CHAPTER 12  Improper Integrals 345
12.52. Work Problem 12.51 if F(x, α) = α 2 xe–αx .
12.53. If F(x) is bounded and continuous for –/H11009 < x < /H11009 and
22
1( )(, ) ()
yF dVx y yx
λλ
π λ
∞
−∞
= +−∫
Prove that
y
lim
→0
V(x, y) = F(x).
12.54. Prove (a) Theorem 7 and (b) Theorem 8 on Page 328.
12.55. Prove the Weierstrass M test for uniform convergence of integrals.
12.56. Prove that if
00
( )  converges, then ( ) xF x dx e F x dxα∞∞ −
∫∫  converges uniformly for α /H11084 0.
12.57. Prove that (a)
0
sin( ) ( )  converges uniformly for   0, ax xaa e d x axφ
∞ −=>∫
1()  () t a n , 2ba a πφ −=− and
0
sin( )  (compare Problems 12.27 through 12.29).2
xcd x x
π∞
=∫
12.58. State the definition of uniform convergence for improper integrals of the second kind.
12.59. State and prove a theorem corresponding to Theorem 8, Page 328, if α is a differentiable function of α.
Evaluation of definite integrals
Establish each of the following results. Justify all steps in each case.
12.60.
0
ln( / ), , 0
ax bxee dx b a a bx
−−∞ − =>∫
12.61. 11
0
t a n(/ ) t a n(/ ) , , , 0csc
ax bxee d x br ar a b rxr x
−−∞ −−− =− >∫
12.62. 20
sin (1 ), 02(1 )
rrx dx e rxx
π∞ −=− >+∫
12.63. 20
1c o s ||2
rx dx rx
π∞ − =∫
12.64. 220
sin ,02
arxr x dx e a rax
π∞ −=>
+∫
12.65. (a) Prove that
22
220
cos cos 1 ln , 0.2
x ax bx bed xx a
α α α
α
∞ − ⎛⎞−+⎛⎞ => ⎜⎟⎜⎟ +⎝⎠ ⎝⎠∫ (b) Use (a) to prove that
0
cos cos ln .ax bx b dxxa
∞ − ⎛⎞= ⎜⎟⎝⎠∫  [The results of (b) and Problem 12.60 are special cases of Frullani’s
integral,
0
() () (0) ln ,F ax F bx bdx Fxa
∞ − ⎛⎞= ⎜⎟⎝⎠∫  where F(t) is continuous for t < 0, t > 0, F/H11032(0) exists and
1
()Ft
t
∞
∫ dt converges.]
12.66. Given
2
0
1 /, 02
xed xα πα α
∞ − =>∫ , prove that for p = 1,2,3, . . . ,
22
(2 1)/20
135 ( 2 1 ). . ....222 2 2
px
p
pxe d xα π
α
∞ −
+
−=∫ ···· · .


## Page 357

CHAPTER 12  Improper Integrals346
12.67. If a > 0, b > 0, prove that
22//
0
() .ux bxee d x b a ππ
∞ −− −= −∫
12.68. Prove that
11
0
t a n(/) t a n(/) ln  2
xa xb b dxxa
π−−∞ − ⎛⎞= ⎜⎟⎝⎠∫ , where 0, 0.ab>>
12.69. Prove that 23
4 .(1 ) 33
dx
xx
π∞
−∞
=++∫  (Hint: Use Problem 12.38.)
Miscellaneous problems
12.70. Prove that
2
0
ln(1 ) x dxx
∞ +⎧⎫⎨⎬
⎩⎭
∫  converges.
12.71. Prove that
(1 )
32 320 0
 converges. Hint: Consider  and use the fact1s i n 1s i n
n
nn
dx dx
xx xx
π
π
∞∞ +
=
⎡
⎢++ ⎣ ∑∫∫
(n+1) ( 1)
32 32that . 1s i n 1 ( ) s i n
n
nn
dx dx
xx n x
ππ
ππ π
+ ⎤< ⎥++ ⎦∫∫
12.72. Prove that 320 1s i n
xd x
xx
∞
+∫  diverges.
12.73. (a) Prove that
22
20
ln(1 ) ln(1 ), 0.1
x dxx
α πα α
∞ + =+ >+∫ (b) Use (a) to show that
/2
0
ln sin  d  = ln 2. 2
π πθθ −∫
12.74. Prove that
4
40
sin .3
x dxx
π∞
=∫
12.75. Evaluate (a) /H5112(1 / ),x  (b) /H5112{coshax}, and (c) /H5112{(sinx)/x}.
Ans. (a) /, 0ssπ>  (b) 22 ,| |s sasa >−
 (c) 1 1tan , 0 ss
− ⎛⎞ >⎜⎟⎝⎠
12.76. (a) If /H5112{eaxF(x)} prove that /H5112{eax F(x)}= f (s – a) and (b) evaluate /H5112{eax sin bx}.
Ans. (b) 22 ,()
b sasa b >−+
12.77. (a) If /H5112{F(x)} = f(s), prove that /H5112{xn F(x)} = (–1)n f (n)(s), giving suitable restrictions on F(x). (b) Evaluate
/H5112{x cos x].
Ans. (b)
2
22
1 ,0(1 )
s ss
− >+
12.78. Prove that /H5112–1 {f (s) + g(s)} = /H5112–1 {f (s)} + /H5112–1 [g(s)], stating any restrictions.
12.79. Solve using Laplace transforms, the following differential equations subject to the given conditions:
(a) Y/H11033(x) + 3Y/H11032(x) + 2Y(x) = 0; Y(0) = 3, Y/H11032(0) = 0
(b) Y/H11033(x) – Y/H11032(x) = x;Y(0) = 2, Y/H11032 (0) = –3
(c) Y/H11033(x) + 2Y/H11032(x) + 2Y(x) = 4; Y(0) = 0 Y/H11032(0) = 0
Ans. (a) Y(x) = 6e–x – 3e–2x (b) Y(x) = 4 – 2ex – 1
2
x2 – x (c) Y(x) = 1 – e–x (sin x + cos x)
12.80. Prove that /H5112{F(x)} exists if F(x) is piecewise continuous in every finite interval [0, b] where b > 0 and if
F(x) is of exponential order as x → /H11009; i.e., there exists a constant α such that |e–α x F(x)| < P (a constant) for
all x > b.


## Page 358

CHAPTER 12  Improper Integrals 347
12.81. If f (s) = /H5112{F(x)} and g(s) = /H5112{G(x)}, prove that f(s)g(s) = /H5112{H(x)} where
0
() () ( )
x
Hx Fu Gx u d u=−∫
is called the convolution of F and G, written F*G. Hint: Write
fs g s e F ud u
M
suM
()() l i m ()= {}→∞
−
∫0
eeG d
eF u G
seM
M
su rM
−
→∞
−
∫
∫
{}
=
()
lim ( ) (()
υυ
υ
0
0
) )du d
M
υυ
0∫ = and then let u + s(u+v) t
12.82. (a) Find /H5112–1
22
1
(1 )s
⎧⎨ +⎩
 (b) Solve Y/H11033(x) + Y(x) = R(x),Y(0) = Y/H11032(0) = 0. (c) Solve the integral equation
0
() () s i n ( ) .
x
Yx x Yu x ud u=+ − ∫ (Hint: Use Problem 12.81.)
Ans. (a) 1 (sin cos )2 xx x−  (b)
0
( ) ( )sin( )
x
Yx R u x u d u=−∫  (c) 3() / 6Yx x x=+
12.83. Let f (x), g(x), and g/H11032(x) be continuous in every finite interval a< x < b and suppose that g/H11032(x)<  0.
Suppose also that h(x) =
0
x
∫ f (x) dx is bounded for all x ε a and
0
lim
x→
g(x) = 0.
(a)
0
P r o v e  t h a t  ()() ()() .
a
f x g x dx g x h x dx
∞∞
′=−∫∫
(b) Prove that the integral on the right, and, hence, the integral on the left, are convergent. The result is that
under the given conditions on f (x) and g(x), ()()
a
fx g x d x
∞
∫  converges and is sometimes called Abel’s
integral test. [Hint: For (a), consider l i m ()()
b
ab
fx g x d x
→∞ ∫ after replacing f (x) by h/H11032(x) and integrating by
parts. For (b), first prove that if |h(x)| < H (a constant), then ()()
b
a
gx h x d x′∫  and then let b → /H11009.]
12.84. Use Problem 12.83 to prove that
00
sin( )  and   ( ) sin , 1 pxad x b x d x px
∞∞
>∫∫  converge.
12.85. (a) Given that 22
00
1sin cos 22xd x xd x π∞∞
==∫∫  [see Problems 15.27 and 15.68(a)], evaluate
22
00
sin( )x y dx dy
∞∞
+∫∫  and (b) Explain why the method of Problem 12.31 cannot be used to evaluate the
multiple integral in (a).
Ans. π/4


## Page 359

This page intentionally left blank


## Page 360

349
CHAPTER 13
Fourier Series
Mathematicians of the eighteenth century, including Daniel Bernoulli and Leonhard Euler, expressed the
problem of the vibratory motion of a stretched string through partial differential equations that had no solu-
tions in terms of “elementary functions.” Their resolution of this difficulty was to introduce infinite series of
sine and cosine functions that satisfied the equations. In the early nineteenth century, Joseph Fourier, while
studying the problem of heat flow, developed a cohesive theory of such series. Consequently, they were
named after him. Fourier series and Fourier integrals are investigated in this chapter and Chapter 14. As you
explore the ideas, notice the similarities and differences with the chapters on infinite series and improper
integrals.
Periodic Functions
A function f (x) is said to have a period T or to be periodic with period T if for all x, f (x + T) = f (x), where
T is a positive constant. The least value of T > 0 is called the least period or simply the period of f(x).
EXAMPLE 1. The function sin x has periods 2π, 4π, 6π, . . . , since sin(x + 2π), sin( + 4π), sin(x +
6π), . . . all equal sin x. However, 2π is the least period or the period of sin x.
EXAMPLE 2. The period of sin nx or cos nx, where n is a positive integer, is 2π/n.
EXAMPLE 3. The period of tan x is π.
EXAMPLE 4. A constant has any positive number as period.
Other examples of periodic functions are shown in the graphs of Figure 13.1(a), (b), and (c).
Figure 13.1
Fourier Series
Let f (x) be defined in the interval (–L, L) and outside of this interval by f (x + 2L) = f (x); i.e., f (x) is 2L-
periodic. It is through this avenue that a new function on an infinite set of real numbers is created from the
image on (–L, L). The Fourier series or Fourier expansion corresponding to f(x) is given by
f (x)
(a)
x
Period


## Page 361

CHAPTER 13  Fourier Series350
0
1
cos sin2
nn
n
a nx nxab LL
ππ∞
=
⎛⎞++ ⎜⎟⎝⎠∑  (1)
where the Fourier coefficients an and bn are
1 () c o s
0,1,2,...1 () s i n
L
n L
L
n L
nxaf x d xLL nnxbf xd xLL
π
π
−
−
⎧ =⎪⎪ =⎨
⎪ =⎪⎩
∫
∫
 (2)
To correlate the coefficients with the expansion, see the following Examples 1 and 2.
Orthogonality Conditions for the Sine and Cosine Functions
Notice that the Fourier coefficients are integrals. These are obtained by starting with the series (1) and em-
ploying the following properties called orthogonality conditions:
(a) cos cos 0 if and if
L
L
mx nx dx m n L m nLL
ππ
−
=≠ =∫
(b) sin sin 0 if and if
L
L
mx nx dx m n L m nLL
ππ
−
=≠ =∫  (3)
(c) sin cos 0.
L
L
mx nx dxLL
ππ
−
=∫  Where m and n assume any positive integer values.
An explanation for calling these orthogonality conditions is given on Page 355. Their application in de-
termining the Fourier coefficients is illustrated in the following pair of examples and then demonstrated in
detail in Problem 13.4.
EXAMPLE 1. To determine the Fourier coefficient a0, integrate both sides of the Fourier series (1) and em-
ploy the orthogonality conditions (2).
}
0
1
() c o s s i n2
LL L
nnLL L n
a nx nxf x dx dx a b dxLL
ππ∞
−− − =
⎧=+ + ⎨⎩∑∫∫ ∫
Now
0
0 ,s i n 0 ,c o s 0 ,2
LL L
LL L
a nx nxdx a L dx dxLL
ππ
−− −
== =∫∫ ∫
therefore
0
1 ()
L
L
af x d xL −
= ∫
EXAMPLE 2. To determine a1, multiply both sides of series (1) by cos x
L
π  and then integrate. Using the or-
thogonality conditions (3)a and (3)c, we obtain 1
1 () c o s .
L
L
xaf x d xLL
π
−
= ∫  Now see Problem 13.4.
If L = π, the series (1) and the coefficients (2) or (3) are particularly simple. The function in this case has
the period 2π.
Dirichlet Conditions
Suppose that
1. f (x) is defined except possibly at a finite number of points in (–L, L).
2. f (x) is periodic outside (–L, L) with period 2L.
3. f (x) and f ′(x) are piecewise continuous in (–L, L).


## Page 362

CHAPTER 13  Fourier Series 351
Then the series (1) with Fourier coefficients converges to
(a) f (x) if x is a point of continuity
(b) (0 )(0 )
2
fx fx++ −  if x is a point of discontinuity
Here f (x + 0) and f(x – 0) are the right- and left-hand limits of f (x) at x and represent
0
lim
ε→ +
f (x + /H9280) and
0
lim
ε→ +
f (x – /H9280), respectively. For a proof, see Problems 13.18 through 13.23.
The conditions 1, 2, and 3 imposed on f (x) are sufficient but not necessary, and are generally satisfied in
practice. There are at present no known necessary and sufficient conditions for convergence of Fourier series.
It is of interest that continuity of f (x) does not alone ensure convergence of a Fourier series.
Odd and Even Functions
A function f (x) is called odd if f (–x) = –f (x). Thus, x3, x5 – 3x3 + 2x, sin x, and tan 3x are odd functions.
A function f (x) is called even if f (–x) = f (x). Thus, x4, 2x6 – 4x2 + 5, cos x, and e x + e–x are even func-
tions.
The functions portrayed graphically in Figure 13.1(a) and (b) are odd and even, respectively, but that of
Figure 13.1(c) is neither odd nor even.
In the Fourier series corresponding to an odd function, only sine terms can be present. In the Fourier series
corresponding to an even function, only cosine terms (and possibly a constant, which we shall consider a
cosine term) can be present.
Half Range Fourier Sine or Cosine Series
A half range Fourier sine or cosine series is a series in which only sine terms or only cosine terms are present,
respectively. When a half range series corresponding to a given function is desired, the function is generally
defined in the interval (0, L) [which is half of the interval (–L, L), thus accounting for the name half range]
and then the function is specified as odd or even, so that it is clearly defined in the other half of the interval,
namely, (–L, 0). In such case, we have
0
20, ( )sin for
20, ( ) cos for
L
nn L
L
nn
nxa b f x dx half range sine seriesLL
nxb a f x dx half range consine seriesLL
π
π
−
⎧ ==⎪⎪⎨
⎪ ==⎪⎩
∫
∫
 (4)
Parseval’s Identity
If an and bn are the Fourier coefficients corresponding to f (x) and if f (x) satisfies the Dirichlet conditions,
then
2
222 0
1
1 {() } ( )2
L
nnL n
afx d x a bL
∞
− =
=+ + ∑∫  (5)
(See Problem 13.13.)
Differentiation and Integration of Fourier Series
Differentiation and integration of Fourier series can be justified by using the theorems on Page 285, which
hold for series in general. It must be emphasized, however, that those theorems provide sufficient conditions
and are not necessary. The following theorem for integration is respecially useful.


## Page 363

CHAPTER 13  Fourier Series352
Theorem The Fourier series corresponding to f (x) may be integrated term by term from a to and the result-
ing series will converge uniformly to ()
x
a
fxd x∫  provided that F(x) is piecewise continueus in –L < x < L
and both a and x are in this interval.
Complex Notation for Fourier Series
Using Euler’s identities,
eiθ = cos θ + i sinθ, e– iθ = cos θ – i sin θ (6)
where i = 1−  (see Problem 11.48), the Fourier series for f (x) can be written as
/() in x L
n
n
fx c e π
∞
=−∞
= ∑  (7)
where
/1 ()2
L in x L
n L
cf x e d xL
π −
−
= ∫  (8)
In writing the equality (7), we are supposing that the Dirichlet conditions are satisfied and, further, that
f (x) is continuous at x . If f (x) is discontinuous at x , the left side of (7) should be replaced by
(( 0 ) ( 0 ) .2
fx fx++ −
Boundary-Value Problems
Boundary value problems seek to determine solutions of partial differential equations satisfying certain
prescribed conditions called boundary conditions. Some of these problems can be solved by use of Fourier
series (see Problem 13.24).
EXAMPLE. The classical problem of a vibrating string may be idealized in the following way. See Figure
13.2.
Suppose a string is tautly stretched between points (0, 0) and (L, 0). Suppose the tension F is the same at
every point of the string. The string is made to vibrate in the xy plane by pulling it to the parabolic position
g(x) = m(Lx – x2) and releasing it (m is a numerically small positive constant). Its equation will be of the form
y = f (x, t). The problem of establishing this equation is idealized by (a) assuming that the constant tension F
is so large as compared to the weight wL of the string that the gravitational force can be neglected, (b) the
displacement at any point of the string is so small that the length of the string may be taken as L for any of
its positions, and (c) the vibrations are purely transverse.
The force acting on a segment PQ is
2
2 ,wy xg t
∂Δ ∂
x < x1 < x + Δx, g ≈ 32 ft per sec2
If α  and β  are the angles that F  makes with the horizontal, then the vertical difference in tensions is
F(sin α – sin β). This is the force producing the acceleration that accounts for the vibratory motion.
)


## Page 364

CHAPTER 13  Fourier Series 353
Figure 13.2
Now
F{sin α – sin β} = F
22
tan tan
1t a n 1t a n
αβ
αβ
⎧⎫⎪⎪ −⎨⎬
++⎪⎪⎩⎭
≈ F{tan α – tan β} (, ) ( , )yyF x xt xtxx
∂∂⎧⎫=+ Δ −⎨⎬∂∂⎩⎭
where the squared terms in the denominator are neglected because the vibrations are small.
Next, equate the two forms of the force, i.e.,
2
2(, ) ( , )yy w yF x xt xt xxx g t
∂∂ ∂⎧⎫ +Δ − = Δ⎨⎬∂∂ ∂⎩⎭
divide by Δx, and then let Δx → 0. After letting ,Fg
wα=  the resulting equation is
22
2
22
yy
tx α∂∂ =∂∂
This homogeneous second partial derivative equation is the classical equation for the vibrating string.
Associated boundary conditions are
y(0, t) = 0, y(L, t) = 0, t > 0
The initial conditions are
2( ,0) ( ), ( ,0) 0,0 yyx mL x x x x L t
∂=− = < < ∂
The method of solution is to separate variables, i.e., assume
y(x, t) = G(x)H(t)
Then, upon substituting,
G(x) H″ (t) = α2 G″ (x)H(t)
Separating variables yields
""
2,,GH kkGH α==  where k is an arbitrary constant
Since the solution must be periodic, trial solutions are
12
34
() s i n c o s , 0
() s i n c o s
Gx c kx c kx
Ht c kt c kt αα
=− + − <
=− + −
Therefore,
12 3 4[ sin cos ][ sin cos ]yG H c k xc k x c k tc k t αα== − + − − + −
The initial condition y = 0 at x = 0 for all t leads to the evaluation c2 = 0.
 ″  ″


## Page 365

CHAPTER 13  Fourier Series354
Thus,
13 4[ sin ][ sin cos ]yc k x c k t c k t αα=− − + −
Now impose the boundary condition y = 0 at x = L; thus, 0 = [c1 sin kL− ] [c3 sin α kt−  + c4 cos α
kt− ].
c1 /HS11005 0, as that would imply y = 0 and a trivial solution. The next-simplest solution results from the
choice 13 4,since sin sin cosnn n nky c x c t c tLL l L
ππ π π αα⎡⎤ ⎡ ⎤−= = +⎢⎥ ⎢ ⎥⎣⎦ ⎣⎦
 and the first factor is zero when
x = L.
With this equation in place, the boundary condition ( , 0) 0, 0y xx Lt
∂ == < <∂  can be considered.
13 4sin cos sinyn n n n ncx c t c ttL L L L L
ππ π π παα α α∂ ⎡⎤ ⎡ ⎤=−⎢⎥ ⎢ ⎥∂⎣ ⎦ ⎣ ⎦
At t = 0,
130s i n nncx c LL
ππ α⎡⎤= ⎢⎥⎣⎦
Since c1 /HS11005 0 and sinn
L
π x is not identically zero, it follows that c3 = 0 and that
14sin cosnn nyc x c t LL L
ππ π αα⎡⎤ ⎡ ⎤= ⎢⎥ ⎢ ⎥
⎣⎦ ⎣ ⎦
The remaining initial condition is
y(x, 0) = m(Lx – x2), 0 < x < L
When it is imposed,
2
14() s i n nnmL x x c c x LL
ππα−=
However, this relation cannot be satisfied for all x on the interval (0, L). Thus, the preceding extensive
analysis of the problem of the vibrating string has led us to an inadequate form:
14 sin cosnn nyc c x t LL L
ππ παα=
and an initial condition that is not satisfied. At this point the power of Fourier series is employed. In particu-
lar, a theorem of differential equations states that any finite sum of a particular solution also is a solution.
Generalize this to infinite sum and consider
1
sin cosn
n
nnyb x t LL
ππ α
∞
=
= ∑
with the initial condition expressed through a half range sine series, i.e.,
2
1
sin ( ), 0n
n
nbx m L x x tL
π∞
=
=− =∑
According to the formula on Page 351 for the coefficient of a half range sine series,
2
0
() s i n2
L
n
Ln xbL x x d xmL
π=−∫
That is,
2
00
sin sin2
LL
n
Ln x n xbL x d x x d xmL L
ππ=−∫∫
Application of integration by parts to the second integral yields
3
00
sin cos cos 22
LL
n
Ln x L L n xbL x d x n x d xmL n n L
ππ πππ=+ +∫∫


## Page 366

CHAPTER 13  Fourier Series 355
When integration by parts is applied to the two integrals of this expression and a little algebra is employed,
the result is
2
3
4 (1 cos )()
n
Lbn n ππ=−
Therefore,
1
sin cosn
n
nnyb x t LL
ππ α
∞
=
= ∑
with the coefficients bn defined previously.
Orthogonal Functions
Two vectors A and B are called orthogonal (perpendicular) if A · B = 0 or or A1B1 + A2B2 + A3B3 = 0, where
A = A1i + A2 j + A3k and B = B1i + B2 j + B3k. Although not geometrically or physically evident, these ideas
can be generalized to include vectors with more than three components. In particular, we can think of a
function—say, A(x)—as being a vector with an infinity of components (i.e., an infinite dimensional vector),
the value of each component being specified by substituting a particular value of x in some interval (a, b). It
is natural in such case to define two functions, A(x) and B(x), as orthogonal in (a, b) if
() () 0
b
a
Ax Bxd x =∫  (9)
A vector A is called a unit vector or normalized vector if its magnitude is unity, i.e., if A · A = A 2 = 1.
Extending the concept, we say that the function A(x) is normal or normalized in (a, b) if
2{() } 1
b
a
Ax d x =∫  (10)
From this, it is clear that we can consider a set of functions {φk (x)}, k = 1, 2, 3, . . . , having the properties
()
b
ma
xφ∫ ) () 0n xd x m nφ= ≠  (11)
2{ ( )} 1 1,2,3,...
b
ma
xd x mφ= =∫  (12)
In such case, each member of the set is orthogonal to every other member of the set and is also normalized.
We call such a set of functions an orthonormal set.
Equations (11) and (12) can be summarized by writing
()
b
ma
xφ φ∫ ()nm nxd xφδ =  (13)
where δmn, called Kronecker’s symbol, is defined as 0 if m /HS11005n and 1 if m = n.
Just as any vector r in three dimensions can be expanded in a set of mutually orthogonal unit vectors i, j,
k in the form r = c1i + c2 j + c3k, so we consider the possibility of expanding a function f(x) in a set of ortho-
normal functions, i.e.,
1
() () nn
n
fx c x a x b φ
∞
=
=≤ ≤∑  (14)
As we have seen, Fourier series are constructed from orthogonal functions. Generalizations of Fourier
series are of great interest and utility from both theoretical and applied viewpoints.


## Page 367

CHAPTER 13  Fourier Series356
SOLVED PROBLEMS
Fourier Series
13.1. Graph each of the following functions.
(a) 30 5( ) Period 1035 0
xfx x
<<⎧==⎨−− < <⎩
Figure 13.3
Since the period is 10, that portion of the graph in –5 < x < 5 (indicated by heavy lines in Figure 13.3) is
extended periodically outside this range (indicated by dashed lines). Note that f (x) is not defined at x = 0, 5,
–5, 10, –10, 15, –15, and so on. These values are the discontinuities of f (x).
(b)
sin 0
( ) Period = 2
02
xx
fx
x
π
π
ππ
<<⎧⎪= ⎨ <<⎪⎩
Figure 13.4
Refer to Figure 13.4. Note that f (x) is defined for all x and is continuous everywhere.
(c)
00 2
() 1 2 4 P e r i o d 6
04 6
x
fx x
x
≤<⎧
⎪=≤ < =⎨
⎪ ≤<⎩
Fig.13.5
Refer to Figure 13.5. Note that f (x) is defined for all x and is discontinuous at x = ±2, ±4, ±8, ±10,
±14, . . . .
13.2. kx kxprove sin cos 0 1,2,3,...LL
LL
-L -L
dx dx if kππ == =∫∫


## Page 368

CHAPTER 13  Fourier Series 357
kx kxsin cos cos cos( ) 0LL
kxcos sin sin sin( ) 0L
L
-L
L
-L
LLL Ldx k kLkk k
LLk x L Ldx k kLkL k k
ππ ππππ π
ππ ππππ π
=− = + − =−
== − − = −
∫
∫
13.3. Prove (a) 0cos cos sin sin
LL
LL
mnmx nx mx nx dx dx LmnLL L L
ππ π π
−−
≠⎧== ⎨ =⎩∫∫
  (b) sin cos 0
L
L
mx nx dxLL
ππ
−
=∫
where m and n can assume any of the values 1, 2, 3, . . . .
(a) From trigonometry: cos A cos B = 1
2  {cos(A – B) + cos(A + B)}, sin A sin B = 1
2
 {cos(A – B) –
cos (A + B)}.
Then, if m /HS11005n, by Problem 13.2,
1( ) ( )cos cos cos cos 02
LL
LL
mx nx m x x m n xdx dxLL L L
ππ π π
−−
−+⎧⎫=+ = ⎨⎬⎩⎭∫∫
Similarly, if m /HS11005n,
1( ) ( )sin sin cos cos 02
LL
LL
mx nx m n x m n xdx dxLL L L
ππ π π
−−
−+⎧⎫=− = ⎨⎬
⎩⎭
∫∫
If m = n, we have
12cos cos 1 cos2
12sin sin 1 cos2
LL
LL
LL
LL
mx nx nxdx dx LLL L
mx nx nxdx dx LLL L
ππ π
ππ π
−−
−−
⎛⎞=+ = ⎜⎟⎝⎠
⎛⎞=− = ⎜⎟
⎝⎠
∫∫
∫∫
Note that if m = n these integrals are equal to 2L and 0, respectively.
(b) We have sin A cos B = 1/2 {sin(A – B) + sin(A + B)}. Then by Problem 13.2, if m /HS11005n,
1( ) ( )sin cos sin sin2
LL
LL
mx nx m n x m n xdxLL L L
ππ π π
−−
−+⎧⎫=+ ⎨ ⎬⎩⎭∫∫ 0dx =
If m = n,
12sin cos sin 02
LL
LL
mx nx nxdx dxLL L
ππ π
−−
==∫∫
The results of (a) and (b) remain valid even when the limits of integration –L,L are replaced by c, c + 2L,
respectively.
13.4. If the series
1
cos sinnn
n
nx nxAa b LL
ππ∞
=
⎛⎞++ ⎜⎟⎝⎠∑  converges uniformly to f(x) in (–L, L), show that for n =
1, 2, 3, . . . , (a) 1 () c o s
L
n L
nxaf x d xLL
π
−
= ∫  and (b) 1 () s i n ,
L
n L
nxbf xd xLL
π
−
= ∫  (c) 0 .2
aA =
(a) Multiplying
1
() c o s s i n nn
n
nx nxfx A a b LL
ππ∞
=
⎛⎞=+ +⎜⎟
⎝⎠
∑  (1)
by cos mx
L
π  and integrating from –L to L, using Problem 13.3, we have


## Page 369

CHAPTER 13  Fourier Series358
1
() c o s c o s
cos cos cos sin
if 0
LL
LL
LL
nn LLn
m
mx mxf x dx A dxLL
mx nx mx nxad x b d xLL L L
aL m
ππ
ππ π π
−−
∞
−−=
=
⎧⎫++ ⎨⎬⎩⎭
=≠
∫∫
∑ ∫∫
Thus,
1 ( ) cos if 1,2,3,...
L
m L
mxaf x d x mLL
π
−
== ∫
(b) Multiplying Equation (1) by sin mx
L
π  and integrating from –L to L, using Problem 13.3, we have
() s i n s i n
LL
LL
mx mxf x dx A dxLL
ππ
−−
=∫∫
1
sin cos cos sin
LL
nn LLn
mx nx mx nxad x bd xLL L L
ππ π π∞
−−=
⎧⎫++ ⎨⎬
⎩⎭
∑ ∫∫
mbL=Thus,
1 ( )sin if 1,2,3,...
L
m L
mxbf x d x mLL
π
−
== ∫
(c) Integrating Equation (1) from –L to L, using Problem 13.2, gives
1() 2 o r ()2
LL
LL
f x dx AL A f x dx L−−
==∫∫
Putting m = 0 in the result of (a), we find 0
0
1 () a n d s o . 2
L
L
aaf x d x AL −
== ∫
The above results also hold when the integration limits –L, L are replaced by c, c + 2L.
Note that in (a), (b), and (c), interchange of summation and integration is valid because the series is as-
sumed to converge uniformly to f (x) in (–L, L). Even when this assumption is not warranted, the coefficients
am and bm as obtained are called Fourier coefficients corresponding to f (x), and the corresponding series with
these values of am and bm is called the Fourier series corresponding to f(x). An important problem in this case
is to investigate conditions under which this series actually converges to f (x). Sufficient conditions for this
convergence are the Dirichlet conditions established in Problems 13.18 through 13.23.
13.5. (a) Find the Fourier coefficients corresponding to the function
05 0( ) Period = 1030 5
xfx x
−< <⎧= ⎨ <<⎩
(b) Write the corresponding Fourier series.
(c) How should f (x) be defined at x = –5, x = 0, and x = 5 in order that the Fourier series will converge to f(x)
for –5 < x < 5?
The graph of f (x) is shown in Figure 13.6.


## Page 370

CHAPTER 13  Fourier Series 359
Figure 13.6
(a) Period = 2L = 10 and L = 5. Choose the interval c to c + 2L as –5 to 5, so that c = –5. Then
25
5
11 () c o s () c o s55
cL
n c
nx nxa f xd x f xd xLL
ππ+
−
== ∫∫
}
05 5
50 0
13 (0) cos (3) cos cos55 5 5 5
nx nx nxdx dx dxππ π
−
⎧=+ =⎨⎩∫∫ ∫

35 sin55
nx
n
π
π
⎛ ⎞= ⎜ ⎟⎝ ⎠
5
0
00 if n⎞ =≠⎟⎠
55
0 00
2
30 3If 0, cos 3.55 5
11 () s i n () s i n55
n
cL
n c
xna a d x d x
nx nxbf x d x f xLL
π
ππ+
== = = =
==
∫∫
∫
}
5
5
05 5
50 0
5
0
13 (0)sin (3 )sin sin55 5 5 5
3 5 3(1 cos )cos55
dx
nx nx nxdx dx dx
nx n
nn
πππ
ππ
ππ
−
−
⎧=+ =⎨⎩
−⎛⎞=− =⎜⎟⎝⎠
∫
∫∫ ∫
(b) The corresponding Fourier series is
0
11
33 ( 1 c o s )cos sin sin22 5
36 1 3 1 5sin sin sin25 3 5 5 5
nn
nn
a nx nx n nxab LL n
xxx
ππ π π
π
πππ
π
∞∞
==
−⎛⎞++ = +⎜⎟
⎝⎠
⎛⎞=+ + + +⎜⎟
⎝⎠
∑∑
L
(c) Since f (x) satisfies the Dirichlet conditions, we can say that the series converges to f (x) at all points of
continuity and to (0 )(0 )
2
fx fx++ − at points of discontinuity. At x = –5, 0, and 5, which are points
of discontinuity, the series converges to (3 + 0)/2 = 3/2, as seen from the graph. If we redefine f (x) as
follows,
3/2 5
050
( ) Period = 103/2 0
30 5
3/2 5
x
x
fx x
x
x
=−⎧
⎪ −< <⎪⎪= =⎨
⎪ <<⎪
⎪ =⎩
then the series will converge to f(x) for –5 < x <  5.
13.6. Expand f(x) = x2, 0 < x < 2π in a Fourier series if (a) the period is 2π and (b) the period is not specified.
(a) The graph of f (x) with period 2π is shown in Figure 13.7.
      . . .


## Page 371

CHAPTER 13  Fourier Series360
Period = 2L = 2π and L = π. Choosing c = 0, we have
22 2
0
11 () c o s c o s
cL
n c
nxa f x dx x nx dxLL
ππ
π
+
== ∫∫
1
π= ⎧
⎨
⎩
{
2
2
23 2
0
sin cos sin 4() ( 2 ) 2 , 0nx nx nxxx nn nn n
π
⎫−−⎛⎞ ⎛ ⎞ ⎛ ⎞−+ = ≠ ⎬⎜⎟ ⎜⎟ ⎜ ⎟⎝⎠ ⎝⎠ ⎝ ⎠ ⎭
22 2
0 0
18If 0, .3na x d x
π π
π== = ∫
22 2
0
11 () s i n s i n
cL
n c
nxb f x dx x nx dxLL
ππ
π
+
== ∫∫
1
π== ⎧
⎨
⎩
{
2
2
23
0
sin cos sin() ( 2 ) 2 nx nx nxxx n nn
π
⎫−−⎛⎞ ⎛ ⎞ ⎛ ⎞−+ ⎬⎜⎟ ⎜⎟ ⎜ ⎟⎝⎠ ⎝⎠ ⎝ ⎠ ⎭
2
2
2
1
44 4Then ( ) cos sin .3 n
fx x n x n xnn
ππ ∞
=
⎛⎞== + − ⎜⎟⎝⎠∑
This is valid for 0 < x < 2π. At x = 0 and x = 2π the series converges to 2π2.
(b) If the period is not specified, the Fourier series cannot be determined uniquely in general.
13.7. Using the results of Problem 13.6, prove that 222
111
123+++ ...
2
.6
π=
At x = 0, the Fourier series of Problem 13.6 reduces to
2
2
1
44 .3 n n
π ∞
=
+ ∑
By the Dirichlet conditions, the series converges at x = 0 to 1
2
 (0 + 4π2) = 2π 2.
Then
22
2
22
11
44 1 2, a n d s o .36 nn nn
ππ π
∞∞
==
+= =∑∑
Odd and even functions, half range Fourier series
13.8. Classify each of the following functions according to whether they are even, odd, or neither even nor odd.
(a) 20 3( ) Period 623 0
xfx x
<<⎧==⎨−− < <⎩
From Figure 13.8, it is seen that f (–x) = –f (x), so that the function is odd.
(b) cos 0() P e r i o d = 202
xxfx x
π πππ
<<⎧= ⎨ <<⎩


## Page 372

CHAPTER 13  Fourier Series 361
Figure 13.8
From Figure 13.9, it is seen that the function is neither even nor odd.
Figure 13.9
(c) f (x) = x(10 –x), 0 < x < 10    Period = 10
From Figure 13.10 below the function is seen to be even.
Figure 13.10
13.9. Show that an even function can have no sine terms in its Fourier expansion.
Method 1: No sine terms appear if bn = 0, n = 1, 2, 3, . . . . To show this, let us this, let us write
0
0
111 () s i n () s i n () s i n
L L
n LL
nx nx nxbf xd x f xd x f xd xLL LL L L
ππ π
−−
==+∫∫∫  (1)
If we make the transformation x = –u in the first integral on the right of Equation (1), we obtain
0
00
00
11 1 ( )sin ( )sin ( )sin
11 () s i n () s i n
LL
L
LL
nx nu nuf x dx f u du f u duLL L L L L
nu nuf u du f x dxLL LL
πππ
ππ
−
⎛⎞=− − = −− ⎜⎟⎝⎠
=− =−
∫∫ ∫
∫∫
 (2)
where we have used the fact that for an even function f (–u) = f (u) and in the last last step that the dummy
variable of integration u can be replaced by any other symbol, in particular, x. Thus, from Equation (1), using
Equation (2), we have
00
11 () s i n () s i n 0
LL
n
nx nubf x d x f x d xLL LL
ππ=− + =∫∫


## Page 373

CHAPTER 13  Fourier Series362
Method 2: Assume
0
1
() c o s s i n2
nn
n
a nx nxfx a b LL
ππ∞
=
⎛⎞=+ + ⎜⎟⎝⎠∑
Then
0
1
() c o s s i n2
nN
n
a nx nxfx a b LL
ππ∞
=
⎛⎞−= + −⎜⎟
⎝⎠
∑
If f (x) is even, f (–x) = f (x). Hence,
00
11
cos sin cos sin22
nn nn
nn
aa nx nx nx nxab ab LL LL
ππ ππ∞∞
==
⎛⎞ ⎛⎞++ = +−⎜⎟ ⎜⎟⎝⎠ ⎝⎠∑∑
and so
0
11
sin 0, i.e., ( ) cos2
nn
nn
anx nxbf x aLL
ππ∞∞
==
== +∑∑
and no sine terms appear.
In a similar manner, we can show that an odd function has no cosine terms (or constant term) in its Fourier
expansion.
13.10. If f (x) is even, show that (a)
0
2 () c o s ,
L
n
nxaf x d xLL
π= ∫  and (b) bn = 0.
(a)
0
0
111 () c o s () c o s () c o s
L L
n LL
nx nx nxa f xd x f xd x f xd xLL LL L L
ππ π
−−
==+∫∫∫
Letting x = –u,
0
00
11 1 ( ) cos ( ) cos ( ) cos
LL
L
nx nx nxf x dx f u du f u duLL L L L L
ππ π
−
−⎛⎞=− = ⎜⎟
⎝⎠
∫∫ ∫
since, by definition of an even function, f (–u) = f (u). Then
00 0
112 ( ) cos ( ) cos ( ) cos
LL L
n
nu nx nxa f ud u f xd x f xd xLL LL LL
πππ=+ =∫∫∫
(b) This follows by Method 1 of Problem 13.9.
13.11. Expand f (x) = sin x, 0 < x < π, in a Fourier cosine series.
A Fourier series consisting of cosine terms alone is obtained only for an even function. Hence, we extend
the definition of f (x) so that it becomes even (dashed part of Figure 13.11). With this extension, f (x) is then
defined in an interval of length 2π. Taking the period as 2π, we have 2L = 2π so that L = π.
Figure 13.11
By Problem 13.10, bn = 0 and
00
22 ( ) cos sin cos
L
n
nua f x dx x nx dxLL
ππ
π== ∫∫


## Page 374

CHAPTER 13  Fourier Series 363
0
0
2
1 1 cos( 1) cos( 1){sin( ) sin( )} 11
1 1 cos( 1) cos( 1) 1 1 1 cos 1 cos
11 1 1
2(1 cos ) if 1.
(1 )
nx nxxn x xn x nn
nn n n
nn n n
n n
n
π
π
ππ
ππ π π
ππ
π
π
⎧⎫ +−=+ + − = −+ ⎨⎬ +−⎩⎭
⎧⎫ ⎧ ⎫−+ − − + +=+ = +⎨⎬ ⎨ ⎬+− + −⎩⎭ ⎩ ⎭
−+=≠
−
∫
For n = 1,
2
1 0 0
22 sin1, sin cos 02
xna x x d x
π
π
ππ== = = ∫
For n = 0,
0 0 0
2240, sin ( cos )na x d x x
π
π
πππ== = − = ∫
Then
2
2
22 ( 1 c o s)() c o s1n
nfx n xn
π
ππ
∞
=
+=− −∑
222
2 4 cos2 cos 4 cos6
214161
xxx
ππ
⎛=− + + +⎜ −−−⎝
....⎞
⎟⎠
13.12. Expand f (x) = x, 0 < x < 2, in a half range (a) sine series and (b) cosine series.
(a) Extend the definition of the given function to that of the odd function of period 4 shown in Figure 13.12.
This is sometimes called the odd extension of f (x). Then 2L = 4, L = 2.
Figure 13.12
Thus, an = 0 and
2
00
2
22
0
22 () s i n s i n22
24 4( ) cos (1) sin cos `22
L
n
nx nxbf x d x xd xLL
nx nxxn nn n
ππ
ππ πππ π
==
⎧⎫ −− −⎛⎞ ⎛ ⎞=− =⎨⎬ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠⎩⎭
∫∫
Then
1
4() c o s s i n 2
41 2 1 3sin sin sin22 2 3 2
n
nxfx nn
xxx
πππ
πππ
π
∞
=
−=
⎛⎞=−+ −⎜⎟⎝⎠
∑
L
(b) Extend the definition of f (x) to that of the even function of period 4 shown in Figure 13.13. This is the
even extension of f (x). Then 2L = 4, L = 2.
 ...


## Page 375

CHAPTER 13  Fourier Series364
Figure 13.13
Thus, bn = 0,
2
00
22 () c o s c o s22
L
n
nx nxaf x d x x d xLL
ππ== ∫∫
2
22
0
24() s i n ( 1 ) c o s22
nx nxx n
ππ
π π
⎧⎫ −⎛⎞ ⎛ ⎞=−⎨⎬ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠⎩⎭
22
4 (cos 1) If n 0nn ππ=− ≠
If
2
0 0
0, 2.na x d x== = ∫
Then
22
1
22 2
4() 1 ( c o s 1 ) c o s 2
81 3 1 51 cos cos cos22 2 35
n
nxfx nn
nx x x
πππ
ππ
π
∞
=
=+ −
⎛⎞=− + = +⎜⎟⎝⎠
∑
L
It should be noted that the given function f(x) = x, 0 < x < 2 is represented equally well by the two differ-
ent series in (a) and (b).
Parseval’s identity
13.13. Assuming that the Fourier series corresponding to f (x) converges uniformly to f (x) in (–L, L), prove
Parseval’s identity
2
2 01 {() } (2
L
nL
af x dx aL −
=+ ∑∫
22
nb+ 2 )
where the integral is assumed to exist.
If 0
1
() c o s s i n ,2
nn
n
a nx nxfx a b LL
ππ∞
=
⎛⎞=+ + ⎜⎟
⎝⎠
∑  then multiplying by f (x) and integrating term by term
from –L to L (which is justified since the series is uniformly convergent), we obtain
{
2 0
1
{() } () () c o s () s i n2
LL L L
nnLL L L n
a nx nxfx d x fx d x a fx d x b fx d x LL
ππ∞
−− − − =
⎫=+ + ⎬⎭∑∫∫ ∫ ∫
2 220
1
()2
nn
n
a LL a b
∞
=
=+ + ∑  (1)
where we have used the results
:
0() c o s , () s i n , ()
LL L
nnLL L
nx nxfx d x L a fx d x L b fx d x L aLL
ππ
−− −
== =∫∫∫  (2)
obtained from the Fourier coefficients.
The required result follows on dividing both sides of Equation (1) by L. Parseval’s identity is valid under
less restrictive conditions than that imposed here.
 ...


## Page 376

CHAPTER 13  Fourier Series 365
13.14. (a) Write Parseval’s identity corresponding to the Fourier series of Problem 13.12(b). (b) Determine from (a)
the sum S of the series 444 4
111 1 .123 n+++ ++ LL
(a) Here 0 22
42, 2, (cos 1), 0, 0.nnLa a n nb n ππ=== − ≠=
Then Parseval’s identity becomes
222 22 2
4422 1
11 ( 2) 1 6{ ( )} (cos 1)22 2 n
fx d x x d x nn ππ
∞
−− =
== + − ∑∫∫
or
44 4 4 4 4 4
86 4 1 1 1 1 1 12. ie.,3 135 135π
⎛⎞=+ + + + + + +⎜⎟⎝⎠
LL
4
96
π=
(b) 444 444 444
444 4 444
44
111 111 111,123 135 246
111 1 111
135 2 123
, from which96 16 90
S
S Sππ
⎛⎞ ⎛ ⎞=+ + + = + + ++ + + + ⎜⎟ ⎜ ⎟⎝⎠ ⎝ ⎠
⎛⎞ ⎛⎞=+ + + + + + +⎜⎟ ⎜⎟⎝⎠ ⎝⎠
=+ =
LL L
LL
13.15. Prove that for all positive integers M,
2 2220
1
1() { ( ) }2
M L
nn Ln
a ab f x d x L −=
++ ≤∑ ∫
where an and bn are the Fourier coefficients corresponding to f (x), and f (x) is assumed piecewise continuous
in (–L, L).
Let
0
1
() c o s s i n2
M
Mn n
n
a nx nxSx a b LL
ππ
=
⎛⎞=+ + ⎜⎟
⎝⎠
∑  (1)
For M = 1, 2, 3, . . . , this is the sequence of partial sums of the Fourier series corresponding to f (x).
We have
2{() () } 0
L
ML
fx S x d x
−
−>∫  (2)
since the integrand is nonnegative. Expanding the integrand, we obtain
222( ) ( ) ( ) { ( ) }
LL L
MMLL L
f x S x dx S x dx f x dx
−− −
−<∫∫ ∫  (3)
Multiplying both sides of Equation (1) by 2 f (x) and integrating from – L to L , using Equations (2) of
Problem 13.13, gives
2
220
1
2( ) ( )2 ( ) 2
ML
Mn nL n
af x S x dx L a b
− =
⎧⎫⎪⎪=+ + ⎨⎬⎪⎪⎩⎭
∑∫  (4)
Also, squaring Equation (1) and integrating from –L to L, using Problem 13.3, we find
2
22 2
1
() 2 ( ) 2
ML
Mn nL n
aoS x dx L a b
− =
⎧⎫=+ + ⎨⎬
⎩⎭
∑∫  (5)
Substitution of Equations (4) and (5) into Equation (3) and dividing by L yields the required result.
Taking the limit as M → /H11009, we obtain Bessel’s inequality
2
2 220
1
1() { ( ) }2
L
nn Ln
a ab f x d x L
∞
−=
++ <∑ ∫  (6)
If the equality holds, we have Parseval’s identity (Problem 13.13).
 ...  ...
 ...  ...
 ...  ...  ...
 ...  ...


## Page 377

CHAPTER 13  Fourier Series366
We can think of SM(x) as representing an approximation to f(x), while the left-hand side of Equation (2),
divided by 2L , represents the mean square error of the approximation. Parseval’s identity indicates that as
M → /H11009, the mean square error approaches zero, while Bessels’ inequality indicates the possibility that this
mean square error does not approach zero.
The results are connected with the idea of completeness of an orthonormal set. If, for example, we were
to leave out one or more terms in a Fourier series (cos 4πx/L, for example), we could never get the mean square
error to approach zero no matter how many terms we took. For an analogy with three-dimensional vectors, see
Problem 13.60.
Differentiation and integration of Fourier series
13.16. (a) Find a Fourier series for f (x) = x2, 0 < x < 2, by integrating the series of Problem 13.12(a). (b) Use (a) to
evaluate the series
1
2
1
(1 ) .
n
n n
−∞
=
−
∑
(a) From Problem 13.12(a).
41 2 1 3sin sin sin22 2 3 2
xxxx πππ
π
⎛⎞=−+ −⎜⎟⎝⎠
L  (1)
Integrating both sides from 0 to x (applying the theorem of Page 352) and multiplying by 2, we find
2
22 2
16 1 2 1 3cos cos cos22 2 23
xxxxC πππ
π
⎛⎞== − + − ⎜⎟⎝⎠
L  (2)
where 2
22 2 2
16 1 1 11 234xC π
⎛⎞== − + − +⎜⎟⎝⎠
L
(b) To determine C in another way, note that Equation (2) represents the Fourier cosine series for x2 in 0 < x
< 2. Then, since L = 2 in this case,
2 20
00
11 4 ()22 3
LaCf x x d xL== = = ∫∫
Then, from the value of C in (a), we have
12 2
22 2 2
1
(1 ) 1 1 1 41 16 3 12234
n
n n
ππ−∞
=
− =− + − + = ⋅ =∑ L
13.17. Show that term-by-term differentiation of the series in Problem 13.12(a) is not valid.
Term-by-term differentiation yields 232 cos cos cos .22 2
xxxπππ⎛⎞ −+−⎜⎟
⎝⎠ L
 Since the n th term of this
series does not approach 0, the series does not converge for any value of x.
Convergence of Fourier series
13.18. Prove that
(a) 1 cos cos22 tt++ +  . . .
1sin 2cos 12sin 2
Mt
Mt
t
⎛⎞ +⎜⎟
⎝⎠+=(b)
0
0
11sin sin11 1 122 ,11 222sin 2sin22
Mt Mt
dt dt
tt
π
πππ −
⎛⎞ ⎛⎞++⎜⎟ ⎜⎟⎝⎠ ⎝⎠==∫∫
 ...
 ...
 ...
 ...
 ...


## Page 378

CHAPTER 13  Fourier Series 367
(a) We have 11 1 1cos sin sin sin .22 2 2nt t n t n t ⎫⎧ ⎪⎛⎞ ⎛ ⎞=+ − − ⎜⎟ ⎜ ⎟⎨⎬ ⎝⎠ ⎝ ⎠ ⎪⎩ ⎭
Then, summing from n = 1 to M,
1sin {cos cos22 tt t ++ ... + 31 53cos }. sin sin sin sin22 22Mt t t t t⎛⎞ ⎛⎞+ =−+ − ⎜⎟ ⎜⎟⎝⎠ ⎝⎠
+ ...+ 11(sin sin sin22Mt M t⎛⎞⎛ ⎞++ − −⎜⎟⎜ ⎟
⎝⎠⎝ ⎠
11 1sin sin22 2 Mt t⎧⎫ ⎛⎞=+ − ⎜⎟⎨⎬ ⎝⎠⎩⎭
On dividing by sin 1
2
t and adding 1
2
, the required result follows.
(b) Integrating the result in (a) from –π to 0 and 0 to π, respectively, gives the required results, since the in-
tegrals of all the cosine terms are zero.
13.19. Prove that lim ( )sin lim ( )cos 0 if ( )
nn
f x nx dx f x nx dx f x
ππ
ππ−−→∞ →∞
==∫∫  is piecewise continuous.
This follows at once from Problem 13.15, since if the series
2 220
1
()2
nn
n
a ab
∞
=
++∑ is convergent,
lim lim 0.nnnn
ab
→∞ →∞
==
The result is sometimes called Riemann’s theorem.
13.20. Prove that 1lim ( )sin 0 if ( )2m
fx M x d x fx
π
π −→∞
⎛⎞ +=⎜⎟
⎝⎠
∫ is piecewise continuous.
We have
11 1() s i n {() s i n } c o s {() c o s } s i n22 2fx M x d x fx x M x d x fx x M x d x
ππ π
ππ π−− −
⎛⎞ += +⎜⎟
⎝⎠
∫∫ ∫
Then the required result follows at once by using the result of Problem 13.19, with f(x) replaced by f(x) sin 1
2
x and f (x) cos 1
2
x, respectively, which are piecewise continuous if f(x) is.
The result can also be proved when the integration limits are a and b instead of –π and π.
13.21. Assuming that L = π, i.e., that the Fourier series corresponding to f (x) has period 2L = 2π, show that
0
1
1sin1 2() ( c o s s i n ) ( ) 12 2sin 2
M
Mn n
n
MtaS x a nx b nx f t x dt
t
π
ππ −=
⎛⎞ +⎜⎟
⎝⎠=+ + = +
∑ ∫
Using the formulas for the Fourier coefficients with L = π, we have
1cos sin ( ) cosnna nx b nx f u nu du
π
ππ −
⎛⎞+= ⎜⎟
⎝⎠
∫
1cos ( )sinnx f u nu du
π
ππ −
⎛⎞+ ⎜⎟
⎝⎠
∫ sin nx
1 ( )(cos cos sin sin )f u nu nx nu nx du
π
ππ −
=+ ∫
1 () c o s ( )fu n u x d u
π
ππ −
=− ∫
Also,
1 ()22
oa fu d u
π
ππ −
= ∫
2
2 2


## Page 379

CHAPTER 13  Fourier Series368
Then
0
1
1
1
() ( c o s s i n )2
11 () () c o s ( )2
11 () c o s ( )2
1sin ( )1 2() 12sin ( )2
M
Mn n
n
M
n
M
n
aSx a n x b n x
fu d u fu n u x d u
fu n u x d u
Mu x
fu d u
ux
ππ
ππ
π
π
π
π
ππ
π
π
=
−− =
− =
−
=+ +
=+ −
⎧⎫=+ − ⎨⎬⎩⎭
⎛⎞ +−⎜⎟⎝⎠=
−
∑
∑∫∫
∑∫
∫
using Problem 13.18. Letting u – x = t, we have
1sin1 2() ( ) 12sin 2
x
M x
Mt
Sx f tx d t
t
π
ππ
−
−−
⎛⎞ +⎜⎟⎝⎠=+ ∫
Since the integrand has period 2π, we can replace the interval –π – x,π – x by any other interval of length
2π, in particular, –π, π. Thus, we obtain the required result.
13.22. Prove that
() ()0(0 )(0 ) ( )(0 ) 11() s i n122 2sin 2
M
fx fx ft x fxSx M t d t
t
ππ −
⎛⎞ ⎛ ⎞++ − +− − ⎛⎞−= +⎜⎟ ⎜ ⎟⎜⎟⎝⎠ ⎝ ⎠⎜⎟⎜⎟⎝⎠
∫
()
0
() ( 0 )11 sin1 22sin 2
ft x fx Mt d t
t
π
π
⎛⎞ +− + ⎛⎞++ ⎜⎟⎜⎟ ⎝⎠⎜⎟⎜⎟⎝⎠
∫
From Problem 13.21,
0
0
11sin sin11 22() ( ) ( )112sin 2sin22
M
Mt Mt
Sx f tx d t f tx d t
tt
π
πππ −
⎛⎞ ⎛⎞++⎜⎟ ⎜⎟⎝⎠ ⎝⎠=+ + +∫∫  (1)
Multiplying the integrals of Problem 13.18(b) by f (x – 0) and f (x + 0), respectively,
00
11sin sin(0 )(0 ) 1 122(0 ) (0 )112 2sin 2sin22
Mt Mtfx fx fx d t fx d t
tt
ππππ −−
⎛⎞ ⎛⎞++⎜⎟ ⎜⎟++ − ⎝⎠ ⎝⎠=− ++∫∫  (2)
Subtracting Equation (2) from Equation (1) yields the required result.
13.23. If f (x) and f ′(x) are piecewise continuous in (–π,π), prove that
(0 )(0 )lim ( ) 2
MM
fx fxSx
→∞
++ −=
The function () ( 0 )
12sin 2
ft x fx
t
+− +  is piecewise continuous in 0 < t < π because f (x) is piecewise con-
tinuous.


## Page 380

CHAPTER 13  Fourier Series 369
Also,
00 0
() ( 0 ) () ( 0 ) () ( 0 )lim lim . lim112sin 2sin22
tt t
ft x fx ft x fx t ft x fx
tttt
→+ →+ →+
+− + +− + +− +==  exists,
since, by hypothesis, f ′(x) is piecewise continuous so that the right-hand derivative of f(x) at each x exists.
Thus, () ( 0 )
12sin 2
ft x fx
t
+− −  is piecewise continuous in 0 < t < π.
Similarly, () ( 0 )
12sin 2
ft x fx
t
+− −  is piecewise continuous in –π < t <  0.
Then, from Problems 13.20 and 13.22, we have
( 0) ( 0) ( 0) ( 0)l i m () 0 o r l i m ()22
MMMM
fx fx fx fxSx Sx
→∞ →∞
+− − ++ −⎧⎫ ⎧⎫−= =⎨⎬ ⎨⎬⎩⎭ ⎩⎭
Boundary value problems
13.24. Find a solution U(x, t) of the boundary value problem
2
230 ,0 2UU txt x
∂∂ => < <∂ ∂
(0, ) 0, (2, ) 0Ut Ut ==         0t >
(, 0 ) 0 2Ux x x =< <
A method commonly employed in practice is to assume the existence of a solution of the partial differen-
tial equation having the particular form U(x,t) = X(x) T(t), where X(x) and T(t) are functions of x and t, respec-
tively, which we shall try to determine. For this reason, the method is often called the method of separation of
variables.
Substitution in the differential equation yields
2
2() 3 ()U XT XTt x
∂∂ =∂ ∂
  (1)
or
2
23dT d XXTdt dx=   (2)
where we have written X and T in place of X(x) and T(t).
Equation (2) can be written as
2
2
11
3
dT d X
Td t X dx
=  (3)
Since one side depends only on t and the other only on x, and since x and t are independent variables, it is clear
that each side must be a constant c.
In Problem 13.47 we see that if c
>  0, a solution satisfying the given boundary conditions cannot exist.
Let us thus assume that c is a negative constant, which we write as –λ 2. Then, from Equation (3), we
obtain two ordinary differentiation equations
2
22
230 , 0dT d XTXdt dxλλ+= + =  (4)
whose solutions are, respectively,


## Page 381

CHAPTER 13  Fourier Series370
23
11 1 , cos sintTC e XA x B xλ λλ−== +  (5)
A solution is given by the product of X and T, which can be written
23(, ) ( c o s s i n )tUxt e A x B xλ λλ−=+  (6)
where A and B are constants.
We now seek to determine A and B so that Equation (6) satisfies the given boundary conditions. To satisfy
the condition U(0, t) = 0, we must have
2
() 0 o r 0steA Aλ − ==  (7)
so that Equation (6) becomes
(, )Uxt B e=
23 te λ − sin xλ  (8)
To satisfy the condition U(2, t) = 0, we must then have
2
sin 2 0stBe λ λ− =  (9)
Since B = 0 makes the solution (8) identically zero, we avoid this choice and instead take
sin 2 0, i.e., 2 or = 2
mm πλλ π λ==  (10)
where m = 0, ±1, ±2, . . . .
Substitution in Equation (8) now shows that a solution satisfying the first two boundary conditions is
223/ 4(, ) s i n 2
mt
m
mxUxt Be π π−=  (11)
where we have replaced B by Bm, indicating that different constants can be used for different values of m.
If we now attempt to satisfy the last boundary condition U(x, 0) = x, 0 < x < 2, we find it to be impossible
using Equation (11). However, upon recognizing the fact that sums of solutions having the form (11) are also
solutions (called the principle of superposition), we are led to the possible solution
223/ 4
1
(, ) s i n 2
mt
m
m
mxUxt Be π π∞
−
=
= ∑  (12)
From the condition U(x, 0) = x, 0 < x < 2, we see, on placing t = 0, that Equation (12) becomes
1
sin 0 22
m
m
mxxB x π∞
=
=< <∑  (13)
This, however, is equivalent to the problem of expanding the function f(x) = x for 0 < x < 2 into a sine
series. The solution to this is given in Problem 13.12(a), from which we see that 4
mB mπ
−=  cos mπ so that
Equation (12) becomes
223/ 4
1
4( , ) cos sin 2
mt
m
mxUxt m em
π πππ
∞
−
=
⎛⎞=− ⎜⎟⎝⎠∑  (14)
which is a formal solution. To check that Equation (14) is actually a solution, we must show that it satisfies the
partial differential equation and the boundary conditions. The proof consists in justification of term-by-term
differentiation and use of limiting procedures for infinite series and may be accomplished by methods of
Chapter 11.
The boundary value problem considered here has an interpretation in the theory of heat conduction. The
equation
2
2
UU kt x
∂∂ =∂ ∂
 is the equation for heat conduction in a thin rod or wire located on the x axis between
x = 0 and x = L if the surface of the wire is insulated so that heat cannot enter or escape. U(x, t) is the tem-
perature at any place x in the rod at time t. The constant k = K/sp (where K is the thermal conductivity, s is the
specific heat, and ρ is the density of the conducting material) is called the diffusivity. The boundary conditions
U(0, t) = 0 and U(L, t) = 0 indicate that the end temperatures of the rod are kept at zero units for all time t > 0,
while U(x, 0) indicates the initial temperature at any point x of the rod. In this problem the length of the rod is
L = 2 units, while the diffusivity is k = 3 units.


## Page 382

CHAPTER 13  Fourier Series 371
Orthogonal functions
13.25. (a) Show that the set of functions
22 331,sin ,cos ,sin ,cos ,sin ,cos ,xx x x x x
LL L L L L
ππ π π π π L
forms an orthogonal set in the interval (–L, L).
(b) Determine the corresponding normalizing constants for the set in (a) so that the set is orthonormal in
(–L, L).
(a) This follows at once from the results of Problems 13.2 and 13.3.
(b) By Problem 13.3,
22sin , cos
LL
LL
mx mxdx L dx LLL
ππ
−−
==∫∫
Then 22
11sin 1 cos 1
LL
LL
mx mxdx dxLL L L
ππ
−−
⎛⎞ ⎛ ⎞ ==⎜⎟ ⎜ ⎟⎝⎠ ⎝ ⎠∫∫
Also,
2
2 1(1) 2 or 1
2
LL
LL
dx L dx
L−−
⎛⎞== ⎜⎟⎝⎠∫∫
Thus, the required orthonormal set is given by
11 1 1 2 1 2, sin , cos , sin , cos ,...
2
xx x x
LL L LLL L L L
ππ π π
Miscellaneous problems
13.26. Find a Fourier series for f(x) = cos αx, –π < x < π, where α /HS11005 0, ±1, ±2, ±3, . . . .
We shall take the period as 2π so that 2L = 2π, L = π. Since the function is even, bn = 0 and
00
0
22 ( ) cos cos cos
1 {cos( ) cos( ) }
L
na f x nx dx x nx dxL
nx nxd x
π
π
απ
ααπ
==
=− + +
∫∫
∫
0
1 sin( ) sin( )
2sin
nn
nn
απ απ
πα α
απα απ
−+⎧=+ +⎨ −+⎩
=
 . . .
22
2s i n c o s
()
n
n
αα π π
πα
⎫ =⎬ −⎭
Then
22
1
22 2 2 2 2
sin 2 sin coscos cos2
sin 1 2 2 2cos cos2 cos312 3
n
nxn x
xxx
απ α απ πα απ π α
απ α α α
πα αα α
∞
=
=+ −
⎛⎞=− + − + ⎜⎟ −− −⎝⎠
∑
L
13.27. Prove that
22 2
222sin 1 1 1
(2 ) (3 )
xx xxx
ππ π
⎛⎞ ⎛ ⎞ ⎛ ⎞=− − −⎜⎟ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠ ⎝⎠
L
Let x = π in the Fourier series obtained in Problem 13.26. Then
 ...
 ...
 ...


## Page 383

CHAPTER 13  Fourier Series372
22 2 2 2 2
sin 1 2 2 2cos 123
απ α α αα πα αα α
⎛⎞=+ + + + ⎜⎟ −− −⎝⎠
L
or
22 2 2 2 2
12 2 2cot 123
αααπα π α αα α−= + + + −− − L  (1)
This result is of interest since it represents an expansion of the contangent into partial fractions.
      By the Weierstrass M test,       the series on the right of Equation (1) converges uniformly for 0 < ⎟α ⎟ <⎟ x⎟ < 1
and the left-hand side of (1) approaches zero as α→  0,       as is seen by using L’Hospital’s rule. Thus,       we can integrate
both sides of (1) from 0 to x to obtain
22 200 0
12 2cot 12
xx x
dd d ααπα π α α α α αα
⎛⎞ −= + +⎜⎟ −−⎝⎠∫∫ ∫ L
or
sinln απ
απ
⎛ ⎞⎜ ⎟⎝ ⎠
2
2
0
In 1 1
x
x⎛⎞⎞ =− ⎜⎟⎟ ⎝⎠⎠
2
2In 1 2
x⎛⎞+− +⎜⎟⎝⎠ L
i.e.,
2
2
sinln lim ln 1 1n
x
x
π
π →∞
⎛⎞⎛⎞ =− ⎜⎟⎜⎟ ⎝⎠⎝⎠
2
2ln 1 2
x⎛⎞+− ⎜⎟
⎝⎠
⎞+⎟
⎠
...
2
2ln 1 x
n
⎛⎞+− ⎜⎟
⎝⎠
22
22lim ln 1 1 12n
xx
→∞
⎧⎛⎞ ⎛⎞⎪=− − ⎨⎜ ⎟⎜ ⎟⎝⎠ ⎝⎠⎪⎩
...
2
21 x
n
⎛⎞−⎜⎟⎝⎠
⎫⎪⎬⎪⎭
22
22ln lim 1 1 12n
xx
→∞
⎧ ⎛⎞ ⎛⎞⎪=− −⎨⎜ ⎟ ⎜ ⎟⎝⎠ ⎝⎠⎪⎩
...
2
21 x
n
⎛⎞−⎜⎟⎝⎠
⎫⎪⎬⎪⎭
so that
22
22
sin lim 1 1 .
12n
xx
x
π
π →∞
⎛⎞ ⎛⎞=− − ⎜⎟ ⎜⎟⎝⎠ ⎝⎠
...
22 2
22 2. 11 1 12
xx x
n
⎛⎞ ⎛⎞ ⎛⎞−= − − ⎜⎟ ⎜⎟⎜⎟ ⎝⎠ ⎝⎠⎝⎠
L  (2)
Replacing x by x/π, we obtain
22
22sin 1 1 (2 )
xxxx ππ
⎛⎞ ⎛ ⎞=− −⎜⎟ ⎜⎟⎝⎠ ⎝⎠
L  (3)
called the infinite product for sin x, which can be shown valid for all x. The result is of interest since it corre-
sponds to a factorization of sin x in a manner analogous to factorization of a polynomial.
13.28. Prove that 22446688 .2 13355779
π ⋅⋅⋅⋅⋅⋅⋅= ⋅⋅⋅⋅⋅⋅⋅
L
L
Let x = 1/2 in Equation (2) of Problem 13.27. Then,
222
21 1 1111
246π
⎛⎞ ⎛⎞ ⎛⎞=− − −⎜⎟ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠ ⎝⎠
... 13 35 57
22 44 66
⎛⎞ ⎛⎞ ⎛ ⎞=⋅ ⋅ ⋅⎜⎟ ⎜⎟ ⎜ ⎟⎝⎠ ⎝⎠ ⎝ ⎠
...
Taking reciprocals of both sides, we obtain the required result, which is often called Wallis’s product.
SUPPLEMENTARY PROBLEMS
Fourier Series
13.29. Graph each of the following functions and find their corresponding Fourier series using properties of even
and odd functions wherever applicable.
 ...
 ...
 ...
l l  ...
 ...
 ...
 ...
 ...


## Page 384

CHAPTER 13  Fourier Series 373
(a) 80 2( ) Period 482 4
xfx x
<<⎧= ⎨−< <⎩
 (c) ( ) 4 ,0 10, Period 10fx x x=< <
(b)
40
( ) Period 804
xx
fx xx
−− < <⎧⎪= ⎨ <<⎪⎩
(d) 20 3( ) Period 603 0
xxfx x
<<⎧⎫= ⎨⎬ −< <⎩⎭
Ans. (a)
1
16 (1 cos ) sin 2n
nn x
n
ππ
π
∞
=
−
∑    (c)
1
40 120 sin 5n
nx
n
π
π
∞
=
− ∑
 (b) 22
1
8 (1 cos )2c os 4n
nn x
n
ππ
π
∞
=
−− ∑  (d) 22
1
3 6(cos 1) 6 cos cos sin23 3n
nn x n n x
nn
ππ π π
ππ
∞
=
−⎧⎫+−⎨⎬⎩⎭∑
13.30. In each part of Problem 13.29, tell where the discontinuities of f (x) are located and to what value the series
converges at the discontunities.
Ans. (a) x = 0, ±2, ±4, . . . ; 0  (c) x = 0, ±10, ±20, . . . ; 20
(b) no discontinuities  (d) x = ±3, ±9, ±15, . . . ; 3
13.31. Expand 20 4() 64 8
xxfx xx
−< <⎧= ⎨ −< <⎩
 in a Fourier series of period 8.
Ans. 22 2
16 1 3 1 5cos cos cos44 435
xxxπππ
π
⎫⎧ +++⎨⎬⎩ ⎭
L
13.32. (a) Expand f (x) = cos x, 0 < x < π, in a Fourier sine series. (b) How should f(x) be defined at x = 0 and x = π
so that the series will converge to f(x) for 0 <  x < π?
Ans. 2
1
8s i n 2() () ( 0 ) ( ) 041n
nn xab f fn ππ
∞
=
==−∑
13.33. (a) Expand in a Fourier series f (x) = cos x, 0 < x < π if the period is π, and (b) compare with the result of
Problem 13.32, explaining the similarities and differences, if any.
Ans. Answer is the same as in Problem 13.32.
13.34. Expand 04() 84 8
xxfx xx
<<⎧= ⎨ −< <⎩
 in a series of (a) sines and (b) cosines.
Ans. (a) 22
1
32 1 sin sin28n
nn x
n
ππ
π
∞
=
∑   (b) 22
1
16 2 cos / 2 cos 1 cos 8n
nn n x
n
ππ π
π
∞
=
−−⎛⎞⎜⎟⎝⎠∑
13.35. Prove that for 0 < x < π,
(a)
2
22 2
cos2 cos 4 cos6() 6 12 3
xx xxx ππ ⎛⎞−= − + + ⎜⎟⎝⎠
L
(b) 33 3
8 sin sin 3 sin 5()
13 5
xxxxxπ π
⎛⎞−= + + +⎜⎟⎝⎠
L
13.36. Use the preceding problem to show that
(a)
2
2
1
1
6n n
π∞
=
=∑  (b)
12
2
1
(1 )
12
n
n n
π−∞
=
− =∑  (c)
13
3
1
(1 )
32(2 1)
n
n n
π−∞
=
− =−∑
 ...
 ...
 ...


## Page 385

CHAPTER 13  Fourier Series374
13.37. Show that 33333 3
11111 1
135791 1+−−++ −  . . .
232 .16
π=
Differentiation and integration of Fourier series
13.38. (a) Show that for –π < x < π,
sin sin 2 sin 32 12 3
xxxx ⎛⎞=− + −⎜⎟⎝⎠
L
(b) By integrating the result of (a), show that for –π < x < π,
2
2
22 2
cos cos2 sin 343 12 3
xx xx π ⎛⎞=− − + − ⎜⎟⎝⎠
L
(c) By integrating the result of (b), show that for –π <  x < π,
33 3
sin sin 2 sin 3() () 1 2 12 3
xxxxx xππ ⎛⎞−+ = − + − ⎜⎟⎝⎠
L
13.39. (a) Show that for –π < x < π,
1234cos sin 2 sin 2 sin 3 sin 421 3 2 4 3 5xx x x x x ⎛⎞=− + − + −⎜⎟⋅⋅⋅⎝⎠
L
(b) Use (a) to show that for –π <  x < π,
1 cos2 cos3 cos 4sin 1 cos 22 1.3 2.4 3.5
xxxxx x ⎛⎞=− − − + − ⎜⎟
⎝⎠
L
13.40. By differentiating the result of Problem 13.35(b), prove that for 0 < x < π,
22 2
4 cos cos3 cos5
2 13 5
xxxx π
π
⎛⎞=− + + +⎜⎟⎝⎠
L
Parseval’s identity
13.41. By using Problem 13.35 and Parseval’s identity, show that
46
46
11
11() ()90 945nn
ab
nn
ππ∞∞
==
==∑∑
13.42. Show that
2
22 22 22
111 8 .1613 35 57
π−+++ =⋅⋅⋅ L  (Hint: Use Problem 13.11.)
13.43. Show that
(a)
4
4
1
1
96(2 1)n n
π∞
=
=−∑
(b)
6
6
1
1
960(2 1)n n
π∞
=
=−∑
13.44. Show that
2
222 222 222
111 4 3 9
16123 234 345
π−+++ =⋅⋅ ⋅⋅ ⋅⋅ L
 ...
 ...
 ...
 ...
 ...
 ...
 ...
 ...


## Page 386

CHAPTER 13  Fourier Series 375
Boundary value problems
13.45. (a) Solve
2
22UU
t x
∂∂ =∂ ∂
, subject to the conditions U(0, t) = 0, U (4, t) = 0, U (x, 0) = 3 sin πx – 2 sin 5π x,
where 0 < x < 4, t > 0. (b) Give a possible physical interpretation of the problem and solution.
Ans. (a) U(x, t) = 3e –2π2t sin πx – 2e –50π2t sin 5πx
13.46. Solve
2
2
UU
t x
∂∂ =∂ ∂
, subject to the conditions 10 3(0, ) 0, (6, ) 0, ( ,0) 03 6
xUt Ut U x x
<<⎧== = ⎨ <<⎩
, and
interpret and interpret physically.
Ans.
22 /3 6
1
1c o s ( / 3 )(, ) 2 s i n 6
mt
m
mm xUxt em
πππ
π
∞
−
=
−⎡⎤= ⎢⎥⎣⎦∑
13.47. Show that if each side of Equation (3), Page 369, is a constant c, where c >  0, then there is no solution
satisfying the boundary value problem.
13.48. A flexible string of length π is tightly stretched between points x = 0 and x = = π on the x axis, its ends are
fixed at these points. When set into small transverse vibration, the displacement Y(x, t) from the the x axis of
any point x at time t is given by
22
2
22 ,YY atx
∂∂ =∂∂
 where a2 = T/ρ, T = tension, ρ = mass per unit length.
(a) Find a solution of this equation (sometimes called the wave equation) with a2 = 4 which satisfies the
conditions Y(0, t) = 0, Y(π, t) = 0, Y(x, 0) = 0.1 sin x + 0.01 sin 4x, Yt(x, 0) = 0 for 0 < x < π, t > 0.
(b) Interpret physically the boundary conditions in (a) and the solution.
Ans. (a) Y(x, t) = 0.1 sin x cos 2t + 0.01 sin 4x cos 8t
13.49. (a) Solve the boundary value problem
22
22 9YY
tx
∂∂ =∂∂
, subject to the conditions Y(0, t) = 0, Y(2, t) = 0, Y(x, 0)
= 0.05x(2 – x), Yt(x, 0) = 0, where 0 < x < 2, t > 0. (b) Interpret physically.
Ans. (a) 33
1
1.6 1 (2 1) 3(2 1)(, ) s i n c o s22(2 1)n
nx ntYx t n
ππ
π
∞
=
−−= −∑
13.50. Solve the boundary value problem
2
2 ,UU
t x
∂∂ =∂ ∂
U(0, t) = 1, U(π, t) = 3, U(x, 0) = 2. [Hint: Let U(x, t) =
V(x, t) + F(x) and choose F(x) so as to simplify the differential equation and boundary conditions for V(x, t).]
Ans.
2
1
24 c o s(, ) 1 s i nmt
m
xmUxt e m xm
π
ππ
∞
−
=
=+ + ∑
13.51. Give a physical interpretation to Problem 13.50.
13.52. Solve Problem 13.49 with the boundary conditions for Y(x, 0) and Y t(x, 0) interchanged; i.e., Y(x,) = 0,
Yt(x, 0) = 0.05x(2 – x), and give a physical interpretation.
Ans. 44
1
3.2 1 (2 1) 3(2 1)(, ) s i n s i n223( 2 1 )n
nx ntYx t n
ππ
π
∞
=
−−= −∑
13.53. Verify that the boundary value problem of Problem 13.24 actually has the solution (14), Page 370.


## Page 387

CHAPTER 13  Fourier Series376
Miscellaneous Problems
13.54. If –π < x < π and α /HS11005 0, ±1. ±2, . . . , prove that
222222
sin sin 2sin 2 3sin 3
2sin 123
xx x xπα
απ ααα=− +−−−−
 . . .
13.55. If –π < x < π, prove that
(a) 22 2 2 2 2
sinh sin 2sin 2 3sin 3
2s i n h 123
xx x xπα
απ αα α=−+−++ +
. . .
(b) 22 2 2
cosh 1 cos cos2
2s i n h 2 12
xx xπα α α
απ α αα=− + − ++
. . .
13.56. Prove that
22 2
222sinh 1 1 1 (2 ) (3 )
xx xxx ππ π
⎛⎞ ⎛ ⎞ ⎛ ⎞=+ + +⎜⎟ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠ ⎝⎠
. . . .
13.57. Prove that
22 2
22 2
44 4cos 1 1 1 (3 ) (5 )
xx xx ππ π
⎛⎞ ⎛ ⎞ ⎛ ⎞=− − −⎜⎟ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠ ⎝⎠
. . . . [Hint: cos x = (sin 2x)/(2 sin x).]
13.58. Show that
(a) 2 135792 21 31 5
22661 01 01 41 42
⋅⋅⋅⋅⋅ ⋅ ⋅= ⋅⋅⋅⋅ ⋅ ⋅ ⋅
L
L
 . . .
. . .
(b) 4 4 8 8 12 12 16 1624 3 5 7 9 11 13 15 17π ⋅ ⋅ ⋅ ⋅⋅⋅⋅⎛⎞= ⎜⎟ ⋅ ⋅ ⋅ ⋅⋅⋅⋅⎝⎠
L
L. . .
. . .
13.59. Let r be any three-dimensional vector. Show that (a) (r · i)2 + (r · j)2 <  (r)2 and (b) (r · i)2 + (r · j)2 + (r · k)2
= r2 and discuss these with reference to Parseval’s identity.
13.60. If {φ n (x)}, n = 1, 2, 3, . . . is orthonormal in (a, b, prove that
2
1
() ()
b
nna n
fx c x φ
∞
=
⎧⎫ −⎨⎬⎩⎭ ∑∫ dx is a minimum
when ()
b
n a
cf x= ∫ ()n xd xφ . Discuss the relevance of this result to Fourier series.


## Page 388

377
CHAPTER 14
Fourier Integrals
Fourier integrals are generalizations of Fourier series. The series representation a0
2 + an cos nπ x
L + bn sin nπ x
L
⎧⎨⎩
⎫⎬⎭n=1
∞
∑
of a function is a periodic form on –/H11009 < x < /H11009 obtained by generating the coefficients from the function’s
definition on the least period [–L, L]. If a function defined on the set of all real numbers has no period, then
an analogy to Fourier integrals can be envisioned as letting L → /H11009 and replacing the integer valued index n
by a real valued function α . The coefficients a
n and b n then take the form A (α ) and B (α ). This mode of
thought leads to the following definition. (See Problem 14.8.)
The Fourier Integral
Let us assume the following conditions on f (x):
1. f (x) satisfies the Dirichlet conditions (Page 350) in every finite interval (–L, L).
2. f (x)
−∞
∞
∫ dx converges; i.e., f(x) is absolutely integrable in (–/H11009,/H11009).
Then Fourier’s integral theorem states that the Fourier integral of a function f is
f (x) = {A(α )c os α x
0
∞
∫ + B(α )sin α x} dα  (1)
where
A(α ) = 1
π f (x)c os α xd x
−∞
∞
∫
B(α ) = 1
π f (x)sin α xd x
−∞
∞
∫
⎧
⎨
⎪⎪
⎩
⎪
⎪
⎫
⎬
⎪⎪
⎭
⎪
⎪
 (2)
A(α) and B(α) with –/H11009 < α < /H11009 are generalizations of the Fourier coefficients an and bn. The right-hand
side of Equation (1) is also called a Fourier integral expansion of f. (Since Fourier integrals are improper
integrals, a review of Chapter 12 is a prerequisite to the study of this chapter.) The result ( 1) holds if x is a
point of continuity of f(x). If x is a point of discontinuity, we must replace f(x) by f (x + 0) + f (x − 0)
2 , as in
the case of Fourier series. Note that these conditions are sufficient but not necessary.
In the generalization of Fourier coefficients to Fourier integrals, a0 may be neglected, since whenever
f (x)
−∞
∞
∫ dx exists,
| a0| = 1
L f (x) dx
− L
L
∫ → 0 as L →∞


## Page 389

CHAPTER 14  Fourier Integrals378
Equivalent Forms of Fourier’s Integral Theorem
Fourier’s integral theorem can also be written in the forms
f (x) = 1
π f (u)c os α (x − u) du dα
u=−∞
∞
∫α= 0
∞
∫  (3)
f (x) = 1
2π eiα x dα f (u)eiau du
−∞
∞
∫−∞
∞
∫
= 1
2π f (u)eiα (u− x)du dα
−∞
∞
∫−∞
∞
∫
 (4)
where it is understood that if f (x) is not continuous at x, the left side must be replaced by f (x + 0) + f (x − 0)
2
.
These results can be simplified somewhat if f(x) is either an odd or an even function, and we have
00
2( ) cos ( ) cos if ( ) is evenfx x d x fu u d u fxααπ
∞∞
= ∫∫  (5)
f (x) = 2
π sin α xd x
0
∞
∫ f (u)sin α ud u
0
∞
∫ if f (x) is odd  (6)
An entity of importance in evaluating integrals and solving differential and integral equations is introduced
in the next paragraph. It is abstracted from the Fourier integral form of a function, as can be observed by putting
Equation (4) in the form
f (x) = 1
2π
e− iα x
−∞
∞
∫
1
2π
eiα u f (u)du
−∞
∞
∫
⎧⎨⎩
⎫⎬⎭
dα
and identifying the parenthetic expression, as F(α). The following Fourier transforms result.
Fourier Transforms
From Equation (4) it follows that
F(α ) = 1
2π
f (u)eiα u
−∞
∞
∫ du  (7)
then
F(x) = 1
2π
F(α )eiax
−∞
∞
∫ dα  ( 8)
The function F(α) is called the Fourier transform of f (x) and is sometimes written F(α) = /H5106{f (x)}. The
function f (x) is the inverse Fourier transform of F(α) and is written f(x) = /H5106–1 {F(α)}.
Note: The constants preceding the integral signs in Equations (7) and (8) were here taken as equal to
1/ 2 π . However, they can be any constants different from zero so long as their product is 1/2 π. This is
called the symmetric form. The literature is not uniform as to whether the negative exponent appears in Equa-
tion (7) or in (8).
EXAMPLE. Determine the Fourier transform of f if f (x) = e–x for x > 0 and e2x when x < 0.
F e f x dx e e dx e eix ix x ix() ( )α
π π
αα α== +
−∞
∞ −
∫
1
22
1
2
2 x x
i
x
x i
dx
e
i
e
i
0
0
2 0 11
2 2
∞
−∞
+
→−∞
→− −
∫ ∫{}
= + + −π αα
αα
1 1
1
2
1
2
1
10x
x
ii→+
→∞
⎧
⎨⎪
⎩⎪
⎫
⎬⎪
⎭⎪
= + + −
⎧⎨⎩
⎫⎬⎭π αα
If f (x) is an even function, Equation (5) yields
Fc (α ) = 2
π f (u)c os α ud u
0
∞
∫
f (x) = 2
π Fc (α )c os α xd x
0
∞
∫
⎧
⎨
⎪⎪
⎩
⎪
⎪
 (9)
and we call Fc(α) and f (x) Fourier cosine transforms of each other.


## Page 390

CHAPTER 14  Fourier Integrals 379
If f (x) is an odd function, Equation (6) yields
Fs (α ) = 2
π f (u)sin α ud u
0
∞
∫
f (x) = 2
π Fs (α )sin α xd α
0
∞
∫
⎧
⎨
⎪⎪
⎩
⎪
⎪
 (10)
and we call Fs(α) and f (x) Fourier sine transforms of each other.
Note: The Fourier transforms Fc and Fs are (up to a constant) of the same form as A(α) and B(α). Since f
is even for Fc and odd for Fs, the domains can be shown to be 0 < α < /H11009.
When the product of Fourier transforms is considered, a new concept called convolution comes into being,
and in conjunction with it, a new pair (function and its Fourier transform) arises. In particular, if F(α) and
G(α) are the Fourier transforms of f and g, respectively, and the convolution of f and g is defined to be
f * g = 1
π
f (u)g(x − u) du
−∞
∞
∫  (11)
then
F(α ) G(α ) = 1
π
eiα u f * gd u
−∞
∞
∫  (12)
f * g = 1
π
eiα x
−∞
∞
∫ F(α ) G(α ) dα  (13)
where in both Equations (11) and (13) the convolution f ∗ g is a function of x.
It may be said that multiplication is exchanged with convolution. Also “the Fourier transform of the con-
volution of two functions, f and g is the product of their Fourier transforms,” i.e.,
T ( f * g) = G( f ) T (g)
[F(α) G(α) and f ∗ g) are demonstrated to be a Fourier transform pair in Problem 14.29.]
Now equate the representations of f ∗ g expressed in Equations (11) and (13), i.e.,
1
π f (u) g(x − u) du = 1
π−∞
∞
∫ eiax F(α ) G(α ) dα
−∞
∞
∫  (14)
and let the parameter x be zero; then
f (u) g(−u) du =
−∞
∞
∫ F(α ) G(α ) dα
−∞
∞
∫  (15)
Now suppose that g = f  and, thus, G = F , where the bar symbolizes the complex conjugate function.
Then Equation (15) takes the form
| f (u)| 2 du =
−∞
∞
∫ | F(α )| 2 dα
−∞
∞
∫  (16)
This is Parseval’s theorem for Fourier integrals.
Furthermore, if f and g are even functions, it can be shown that Equation (15) reduces to the following
Parseval identities:
f (u) g(u)du =
0
∞
∫ Fc (α ) Gc (α ) dα
0
∞
∫  (17)
where Fc and Gc are the Fourier cosine transforms of f and g. If f and g are odd functions, then Equation (15)
takes the form
f (u) g(u)du =
0
∞
∫ Fs (α ) Gs (α ) dα
0
∞
∫  (18)
where Fs and Gs are the Fourier sine transforms of f and g . (See Problem 14.3.)


## Page 391

CHAPTER 14  Fourier Integrals380
SOLVED PROBLEMS
The Fourier integral and Fourier transforms
14.1. (a) Find the Fourier transform of f (x) = 1| x | < a
0| x | > a
⎧
⎨
⎩
.  (b) Graph f (x) and its Fourier transform for a = 3.
(a) The Fourier transform of f (x) is
F(α ) = 1
2π
f (u)eiα u
−∞
∞
∫ du = 1
2π
(1)eiα u du = 1
2 π− a
a
∫
eiα u
iα − a
a
= 1
2π
eiα a − e− iα a
iα
⎛
⎝⎜
⎞
⎠⎟ = 2
π
sin α a
α , α≠ 0
For α = 0, we obtain F(α ) = 2/ π a.
(b) The graphs of f (x) and F(α) for a = 3 are shown in Figures 14.1, and 14.2, respectively.
 Figure 14.1  Figure 14.2
14.2. (a) Use the result of Problem 14.1 to evaluate sin α a cos α x
α dα
−∞
∞
∫ . (b) Deduce the value of sin u
u du
0
∞
∫ .
(a) From Fourier’s integral theorem, if
F(α ) = 1
2π
f (u)eiα u du
−∞
∞
∫ then f (x) = 1
2π
F(α )e− iα x dα
−∞
∞
∫
Then, from Problem 14.1,
1
2π
2
π
sinα a
α−∞
∞
∫ e− iaxdx =
1| x | < a
1/2 | x | = a
0| x | > a
⎧
⎨⎪
⎩⎪
 (1)
The left side of Equation (1) is equal to
1
π
sin α a cos α x
α−∞
∞
∫ dα− i
π
sin α a sin α x
α−∞
∞
∫ dα  (2)
The integrand in the second integral of Equation (2) is odd, and so the integral is zero. Then from Equa-
tions (1) and (2), we have
sin α a cos α x
α dα=
π | x | < a
π /2 | x | = a
0| x | > a
⎧
⎨⎪
⎩⎪
−∞
∞
∫  (3)
Alternative solution: Since the function f in Problem 14.1 is an even function, the result follows immedi-
ately from the Fourier cosine transform (9).


## Page 392

CHAPTER 14  Fourier Integrals 381
(b) If x = 0 and a = 1 in the result of (a), we have
sinα
α dα=π
−∞
∞
∫ or sinα
α dα= π
20
∞
∫
since the integrand is even.
14.3. If f (x) is an even function, show that (a) F(α ) = 2
π f (u)c os α ud u
0
∞
∫  and
(b) f (x) = 2
π F(α )c os α xd α
0
∞
∫
We have
F(α ) = 1
2π
f (u)eiau
−∞
∞
∫ du = 1
2π
f (u)c os α ud u + i
2π−∞
∞
∫ f (u)sin α ud u
−∞
∞
∫  (1)
(a) If f (u) is even, f (u) cos λu is even and f (u) sin λu is odd. Then the second integral on the right of Equa-
tion (1) is zero, and the result can be written
F(α ) = 2
2π
f (u)c os α ud u
0
∞
∫ = 2
π f (u)c os α ud u
0
∞
∫
(b) From (a), F(–α) = F(α) so that F(α) is an even function. Then, by using a proof exactly analogous to that
in (a), the required result follows.
A similar result holds for odd functions and can be obtained by replacing the cosine by the sine.
14.4. Solve the integral equation f (x)c os α xd x =
1−α 0 < α< 1
0 α> 1
⎧
⎨
⎩
0
∞
∫ .
Let 2
π f (x)c os α xd x
0
∞
∫ = F(α ) and choose F(α ) = 2/ π (1−α )0 <α < 1
0 α> 1
⎧
⎨⎪
⎩⎪
 Then, by Prob-
lem 14.3,
f (x) = 2
π F(α )
0
∞
∫ cos α xd α= 2
π
2
π (1−α )c os α xd α
0
1
∫
= 2
π (1−α )c osα xd α= 2(1− cos x)
π x20
1
∫
14.5. Use Problem 14.4 to show that sin2 u
u20
∞
∫ du = π
2 .
As obtained in Problem 14.4,
2
π
1− cos x
x20
∞
∫ cos α xd x =
1−α 0 < α< 1
0 α> 1
⎧
⎨
⎩
Taking the limit as α→  0 +, we find
1− cos x
x20
∞
∫ dx = π
2
But this integral can be written as 2s i n2 (x /2 )
x20
∞
∫ dx , which becomes sin2 u
u20
∞
∫ du on letting x = 2u,  so
that the required result follows.
14.6. Show that cos α x
a2 + 10
∞
∫ dα= π
2 e− x , x > 0.
Let f (x) = e–x in the Fourier integral theorem
f (x) = 2
π cos α xd α
0
∞
∫ f (u)c os λud u
0
∞
∫


## Page 393

CHAPTER 14  Fourier Integrals382
Then
2
π cosα xd α
0
∞
∫ e− u cos α ud u = e− x
0
∞
∫
But by Problem 12.22, we have e− u
0
∞
∫ cos α ud u = 1
α 2 + 1
. Then
2
π
cos α x
α 2 + 10
∞
∫ dα= e− x or cos α x
a2 + 10
∞
∫ dα= π
2 e− x
Parseval’s identity
14.7. Verify Parseval’s identity for Fourier integrals for the Fourier transforms of Problem 14.1.
We must show that
{ f (x)}2 dx = {F(α )}2
−∞
∞
∫ dα
−∞
∞
∫
where
f (x) = 1| x | < a
0| x | < a
⎧
⎨
⎩
 and   F(α ) = 2
π
sin α a
α
This is equivalent to
(1)2 dx = 2
π
sin2 α a
α 2−∞
∞
∫− a
a
∫ dα
or
sin2 α a
α 2−∞
∞
∫ dα= 2 sin2 α a
a20
∞
∫ dα=π a
i.e.,
sin2 α a
α 20
∞
∫ dα= π a
2
By letting αa = u and using Problem 14.5, it is seen that this is correct. The method can also be used to
find sin2 u
u20
∞
∫ du directly.
Proof of the Fourier integral theorem
14.8. Present a heuristic demonstration of Fourier’s integral theorem by use of a limiting form of Fourier series.
Let
f (x) = a0
2 + an cos nπ x
L + bn sin nπ x
L
⎛
⎝⎜ ⎞
⎠⎟
n=1
∞
∑  (1)
where
an = 1
L f (u)c osnπ u
L du  and  bn = 1
L f (u)sin nπ u
L du
− L
L
∫− L
L
∫
Then, by substitution (see Problem 13.21),
f (x) = 1
2L f (u) du +
− L
L
∫
1
L f (u)c osnπ
L (u − x) du
n=1
∞
∑  (2)
If we assume that f (u) du
−∞
∞
∫ converges, the first term on the right of Equation (2) approaches zero as
L → /H11009, while the remaining part appears to approach
lim
L→∞
1
L f (u)c osnπ
L (u − x) du
−∞
∞
∫
n=1
∞
∑  (3)


## Page 394

CHAPTER 14  Fourier Integrals 383
This last step is not rigorous and makes the demonstration heuristic.
Calling Δα = π/L, Equation (3) can be written
f (x) = lim
Δα→ 0
Δα F(nΔα )
n=1
∞
∑  (4)
where we have written
F(α ) = 1
π f (u)c os α (u − x) du
0
∞
∫  (5)
But the limit (4) is equal to
f (x) = F(α ) dα
0
∞
∫ = 1
π dα
0
∞
∫ f (u)c os α (u − x) du
−∞
∞
∫
which is Fourier’s integral formula.
This demonstration serves only to provide a possible result. To be rigorous, we start with the integral
1/π∫/H11009
0 dα∫ /H11009
–/H11009f (u) cos α(u – x)dx
and examine the convergence. This method is considered in Problems 14.9 through 14.12.
14.9. Prove that
(a) lim
α→∞
sinαυ
υ0
L
∫ dυ= π
2 ,
(b) lim
α→∞
sinαυ
υ− L
0
∫ dυ= π
2 .
(a) Let αυ = y. Then lim
α→∞
sin αυ
υ0
L
∫ dυ= lim
α→∞
sin y
y dy = sin y
y dy = π
20
∞
∫0
α L
∫ .  by Problem 12.29.
(b) Let αυ = − y. Then  lim
α→∞
sin αυ
υ− L
0
∫ dυ= lim
x→∞
sin y
y dy = π
20
α L
∫
.
14.10. Riemann’s theorem states that if F(x) is piecewise continuous in (a, b), then
lim
α→∞
F(x)sin α xd x = 0
a
b
∫
with a similar result for the cosine (see Problem 14.32). Use this to prove that
(a) lim
α→∞
f (x +υ ) sin αυ
υ0
L
∫ dυ= π
2 f (x + 0)
(b) lim
α→∞
f (x +υ ) sin αυ
υ− L
0
∫ dυ= π
2 f (x − 0)
where f (x) and f ′ (x) are assumed piecewise continuous in (0, L) and (–L, 0), respectively.
(a) Using Problem 14.9(a), it is seen that a proof of the given result amounts to proving that
lim
α→∞
{ f (x +υ ) − f (x + 0)} sinαυ
υ0
L
∫ dυ= 0
This follows at once from Riemann’s theorem, because F(υ ) = f (x +υ ) − f (x + 0)
υ
is piecewise continuous
in (0, L), since
0
lim
n→+
F(υ) exists and f (x) is piecewise continuous.
(b) A proof of this is analogous to that in (a) if we make use of Problem 14.9(b).


## Page 395

CHAPTER 14  Fourier Integrals384
14.11. If f (x) satisfies the additional condition that | f (x)| dx
−∞
∞
∫ converges, prove that
(a) lim
α→∞
f (x +υ ) sin αυ
υ0
∞
∫ dυ= π
2 f (x + 0) (b) lim
α→∞
f (x +υ ) sinαυ
υ−∞
0
∫ dυ= π
2 f (x − 0)
We have
f (x +υ ) sinαυ
υ0
∞
∫ dυ= f (x +υ ) sin αυ
υ0
L
∫ dυ+ f (x +υ ) sin αυ
υL
∞
∫ dυ  (1)
f (x + 0) sinαυ
υ0
∞
∫ dυ= f (x + 0) sin αυ
υ0
L
∫ dυ+ f (x + 0) sin αυ
υL
∞
∫ dυ  (2)
Subtracting,
{ f (x +υ ) − f (x + 0)} sinαυ
υ0
∞
∫ dυ= { f (x +υ ) − f (x + 0)} sinαυ
υ0
L
∫ dυ
 (3)
+ f (x +υ ) sinαυ
υ dυ− f (x + 0) sinαυ
υ dυ
L
∞
∫L
∞
∫
Denoting the integrals in Equation (3) by I, I1, I2, and I3, respectively, we have I = I1 + I2 + I3 so that
 ⏐ I⏐ < ⏐I1⏐ + ⏐I 2⏐ + ⏐I 3⏐  (4)
Now
| I2 | < f (x +υ ) sinαυ
υL
∞
∫ dυ< 1
L | f (x +υ )| dυ
L
∞
∫
Also,
| I3 | < | f (x + 0) | sinαυ
υ dυ
L
∞
∫ .
Since both | f (x)}dx and sinαυ
υ0
∞
∫0
∞
∫ dυ  converge, we can choose L so large that ⏐I 2⏐ < /H9280/3,⏐I3⏐
< /H9280 /3. Also, we can choose α so large that ⏐I1⏐ < /H9280 /3. Then from Equation (4) we have ⏐I⏐ < /H9280 for α and
L sufficiently large so that the required result follows.
This result follows by reasoning exactly analogous to that in (a).
14.12. Prove Fourier’s integral formula where f (x) satisfies the conditions stated on Page 377.
We must prove that lim
L→∞
1
π f (u)c osα (x − u) du d α= f (x + 0) + f (x − 0)
2u=−∞
∞
∫α= 0
L
∫ .
Since f (u)c osα (x − u) du
−∞
∞
∫ < | f (u)|  du,
−∞
∞
∫ which converges, it follows by the Weierstrass test
that f (u)c osα (x − u) du
−∞
∞
∫ converges absolutely and uniformly for all α. Thus, we can reverse the order of
integration to obtain
1
π dα
α= 0
L
∫ f (u)c osα (x − u) du
u=−∞
∞
∫ = 1
π f (u) du cosα (x − u) dα
α= 0
L
∫u=−∞
∞
∫
= 1
π f (u)
u=−∞
∞
∫
sin L(u − x)
u − x du
= 1
π f (x +υ ) sin Lυ
υu=−∞
∞
∫ dυ
= 1
π f (x +υ ) sin Lυ
υ dυ
−∞
0
∫ + 1
π f (x +υ ) sin Lυ
υ0
∞
∫ dυ
where we have let u = x + υ.
Letting L → /H11009, we see by Problem 14.11 that the given integral converges to f (x) + 0) + f (x − 0)
2
 as
required.


## Page 396

CHAPTER 14  Fourier Integrals 385
Miscellaneous problems
14.13. Solve ∂U
∂t = ∂2U
∂x2 , subject to the conditions U(0, t) = 0, U(x, 0) =
1   0 < x < 1
0         x > 1
⎧
⎨
⎩
, U(x, 1) is bounded
where x > 0, t > 0.
We proceed as in Problem 13.24. A solution satisfying the partial differential equation and the first bound-
ary condition is given by Be– λ2t sin λx. Unlike Problem 13.24, the boundary conditions do not prescribe the
specific values for λ, so we must assume that all values of λ are possible. By analogy with that problem, we
sum over all possible values of λ, which corresponds to an integration in this case, and are led to the possible
solution
U(x, 1) = B(λ)
0
∞
∫ e−λ 2t sin λ xdλ  (1)
where B(λ) is undetermined. By the second condition, we have
B(λ)sin λ xdλ=
1   0 < x < 1
0        x > 1
⎧
⎨
⎩
0
∞
∫ = f (x)  (2)
from which we have, by Fourier’s integral formula,
B(λ) = 2
π f (x)sin λ xd x
0
∞
∫ = 2
π sin λ xd x = 2(1− cos λ)
πλ0
1
∫  (3)
so that, at least formally, the solution is given by
U(x, 1) = 2
π
1− cos λ
λ
⎛
⎝⎜ ⎞
⎠⎟0
∞
∫ e−λ 2t sin λ xd x  (4)
See Problem 14.26.
14.14. Show that e–x2/2 is its own Fourier transform.
Since e–x2/2 is even, its Fourier transform is given by 2/ π = e− x2 /2
0
∞
∫ cos xα dx .
Letting x = 2u  and using Problem 12.32, the integral becomes
2
π
e− u2
0
∞
∫ cos(α 2 u) du = 2
π
. π
2 e−α 2 /2
which proves the required result.
14.15. Solve the integral equation
y(x) = g(x) + y(u) r(x − u) du
−∞
∞
∫
where g(x) and r(x) are given.
Suppose that the Fourier transforms of y(x), g(x), and r(x) exist, and denote them by Y(α ), G(α ), and R(α ),
respectively. Then, taking the Fourier transform of both sides of the given integral equation, we have, by the
convolution theorem,
Y (α ) = G(α ) + 2πY (α ) R(α )          or Y (α ) = G(α )
1− 2π R(α )
Then
y(x) = /H5106−1 G(α )
1− 2π R(α )
⎧
⎨
⎩
⎫
⎬
⎭
= 1
2π
G(α )
1− 2π R(α )
e− iα x
−∞
∞
∫ dα
assuming this integral exists.


## Page 397

CHAPTER 14  Fourier Integrals386
SUPPLEMENTARY PROBLEMS
The Fourier integral and Fourier transforms
14.16. (a) Find the Fourier transform of f (x) =
1/2 ∈   | x | < ∈
0         | x | >∈
⎧
⎨
⎩
. (b) Determine the limit of this transform as
/H9280→ 0+ and discuss the result.
Ans. (a) 1
2π
sinα∈
α∈
 (b) 1
2π
14.17. (a) Find the Fourier transform of f (x) = 1− x2     | x | < 1
  0        | x | > 1
⎧
⎨
⎩⎪
. (b) Evaluate x cos x − sin x
x3
⎛
⎝⎜ ⎞
⎠⎟0
∞
∫  cos x
2 dx .
Ans. (a) 2 2
π
α cosα− sinα
α 3
⎛
⎝⎜ ⎞
⎠⎟ (b) 3π
16
14.18. If f (x) =
1   0 < x < 1
0         x > 1
⎧
⎨
⎩⎪
, find (a) the Fourier since transform and (b) the Fourier cosine transform of f(x).
In each case, obtain the graph of f (x) and its transform.
Ans. (a) 2
π
1− cos α
α
⎛
⎝⎜ ⎞
⎠⎟ (b) 2
π
sinα
α
14.19. (a) Find the Fourier sine transform of e –x, x >  0. (b) Show that x sin mx
x2 + 10
∞
∫ dx = π
2 e− m , m > 0  by using
the result in (a). (c) Explain from the viewpoint of Fourier’s integral theorem why the result in (b) does not
hold for m = 0.
Ans. (a) 2/ π [α /( 1+α 2 )]
14.20. Solve for Y(x) the integral equation
Y (x)sin xt dx
0
∞
∫ =
10  < t < 1
21  < t < 2
0 t > 0
⎧
⎨⎪
⎩⎪
and verify the solution by direction substitution.
Ans. Y(x) = (2 + 2 cos x – 4 cos 2x)/πx
Parseval’s identity
14.21. Evaluate (a) dx
(x2 + 1)20
∞
∫  and (b) x2dx
(x2 + 1)20
∞
∫  by use of Parseval’s identity. (Hint: Use the Fourier sine and
cosine transforms of e–x, x > 0.)
Ans. (a) π/4 (b) π/4
14.22. Use Problem 14.18 to show that (a) 1− cos x
x
⎛
⎝⎜ ⎞
⎠⎟
2
dx
0
∞
∫ = π
2
 and (b) sin4 x
x20
∞
∫ dx = π
2 .
14.23. Show that (x cos x − sin x)2
x60
∞
∫ dx = π
15 .


## Page 398

CHAPTER 14  Fourier Integrals 387
Miscellaneous problems
14.24. (a) Solve ∂U
∂t = 2 ∂2U
∂x2 , U(0, t) = 0,  U(x, 0) = e− x , x > 0,  U(x, t)  is bounded where x > 0, t > 0.
(b) Give a physical interpretation.
Ans. U(x, t) = 2
π
λe−2λ 2t sin λ x
λ 2 + 10
∞
∫ dλ
14.25. Solve ∂U
∂t = ∂2U
∂x2 , Ux (0,  t) = 0,  U(x,  0) =
x   0 < x < 1
0          x > 1
⎧
⎨
⎩
, U(x, t)  is bounded where x > 0, t > 0.
Ans.U(x, t) = 2
π
sin λ
λ + cos λ− 1
λ 2
⎛
⎝⎜ ⎞
⎠⎟0
∞
∫ e−λ 2t cos λ xd λ
14.26. (a) Show that the solution to Problem 14.13 can be written
U(x, t) = 2
π
e−υ 2
0
x/2 t
∫ dυ− 1
π
e−υ 2
(1− x)/2 t
(1+x)/2 2
∫ dυ
(b) Prove directly that the function in (a) satisfies ∂U
∂t = ∂2U
∂x2 and the conditions of Problem 14.13.
14.27. Verify the convolution theorem for the functions f (x) = g(x) = 1    | x |< 1
0   | x |> 1
⎧
⎨
⎩
.
14.28. Establish Equation (4), Page 378, form Equation (3), Page 378.
14.29. Prove the result (12), Page 379. [Hint: If F(α ) = 1
2π
f (u)eiα u du
−∞
∞
∫ and G(α ) = 1
2π
g(v)eiα v dυ,
−∞
∞
∫
then F(α )G(α ) = 1
2π eiα (u+v) f (u)g(υ ) du d υ
−∞
∞
∫−∞
∞
∫ . Now make the transformation u + υ = x.]
F(α ) G(α ) = 1
π
eiα x f (u)g(x − u) du dx
−∞
∞
∫−∞
∞
∫
Define
f * g = 1
π
f (u)g(x − u) du
−∞
∞
∫          ( f * g   is a function of x)
then
F(α ) G(α ) = 1
π
eiα x
−∞
∞
∫−∞
∞
∫ f * gd x
Thus, F(α) G(α) is the Fourier transform of the convolution f ∗ g and, conversely, as indicated in Equa-
tion (13), f ∗ g is the Fourier transform of F(α) G(α).
14.30. If F(α) and G(α) are the Fourier transforms of f (x) and g(x), respectively, prove (by repeating the pattern of
Problem 14.29) that
F(α ) G(α )
−∞
∞
∫ dα= f (x) g(x)
−∞
∞
∫ dx
where the bar signifies the complex conjugate. Observe that if G is expressed as in Problem 14.29, then
G(α ) = 1
π e− iα x
−∞
∞
∫ f (u) g(υ ) dυ


## Page 399

CHAPTER 14  Fourier Integrals388
14.31. Show that the Fourier transform of g(u – x) is e iαx ; i.e., eiα xG(α ) = 1
π
eiα u
−∞
∞
∫ f (u) g(u − x) du . (Hint:
See Problem 14.29. Let υ = u – x.)
14.32. Prove Riemann’s theorem (see Problem 14.10).


## Page 400

389
CHAPTER 15
Gamma and Beta
Functions
The Gamma Function
The gamma function may be regarded as a generalization of n! (n-factorial), where n is any positive integer
to x!, where x is any real number. (With limited exceptions, the discussion that follows will be restricted to
positive real numbers.) Such an extension does not seem reasonable, yet, in certain ways, the gamma function
defined by the improper integral
Γ (x) = tx−1
0
∞
∫ e− t dt  (1)
meets the challenge. This integral has proved valuable in applications. However, because it cannot be repre-
sented through elementary functions, establishment of its properties takes some effort. Some of the important
properties are outlined as follows.
The gamma function is convergent for x > 0. (See Problem 12.18.)
The fundamental property
 Γ (x + 1) = xΓ(x) (2)
may be obtained by employing the technique of integration by parts to Equation (1). The process is carried
out in Problem 15.1. From the form of Equation (2), the function Γ(x) can be evaluated for all x > 0 when its
values in the interval 1
< x < 2 are known. (Any other interval of unit length will suffice.) Table 15.1 and the
graph in Figure 15.1 illustrate this idea.
Tables of Values and Graph of
the Gamma Function
TABLE 15.1
N Γ(N)
1.00 1.0000
1.10 0.9514
1.20 0.9182
1.30 0.8975
1.40 0.8873
1.50 0.8862
1.60 0.8935
1.70 0.9086
1.80 0.9314
1.90 0.9618
2.00 1.0000
Figure 15.1


## Page 401

CHAPTER 15  Gamma and Beta Functions390
Equation (2) is a recurrence relationship that leads to the factorial concept. First observe that if x = 1, then
Equation (1) can be evaluated and in particular,
Γ(1) = 1
From Equation (2)
Γ(x + 1) = xΓ(x) = x(x – 1)Γ(x – 1) = . . . x (x – 1)(x – 2) . . . (x – k)Γ(x – k)
If x = n, where n is a positive integer, then
 Γ (n + 1) = n(n – 1)(n – 2) . . . 1 = n! (3)
If x is a real number, then x! = Γ(x + 1) is defined by Γ(x + 1). The value of this identification is in intuitive
guidance.
If the recurrence relation (2) is characterized as a differential equation, then the definition of Γ(x) can be
extended to negative real numbers by a process called analytic continuation. The key idea is that even though
Γ(x) as defined in Equation (1) is not convergent for x < 0, the relation 1() ( 1 )xx xΓ= Γ +  allows the meaning
to be extended to the interval – 1 < x < 0, and from there to – 2 < x < – 1, and so on. A general development
of this concept is beyond the scope of this presentation; however, some information is presented in Problem
15.7.
The factorial notion guides us to information about Γ(x + 1) in more than one way. In the eighteenth cen-
tury, James Stirling introduced the formula (for positive integer values n)
12lim 1
nn
n
ne
n
π +−
→∞
=!
 (4)
This is called Stirling’s formula, and it indicates that n! asymptotically approaches 12 nnneπ +−  for large
values of n. This information has proved useful, since n! is difficult to calculate for large values of n.
There is another consequence of Stirling’s formula. It suggests the possibility that for sufficiently large
values of x,
1(1 ) 2 xxxx x e π +−!=Γ + ≈  (5a)
(An argument supporting this is made in Problem 15.20.)
It is known that Γ(x + 1) satisfies the inequality
11
12( 1)
12( 1 ) 2xx xx
xxe x xe eππ +− +−
+<Γ + <  (5b)
Since the factor 12( 1)
1
xe + →  0 for large values of x, the suggested value (5a) of Γ(x + 1) is consistent with (5b).
An exact representation of Γ(x + 1) is suggested by the following manipulation of n!. [It depends on (n + k)!
= (k + n)!.]
12 ( 1) ( 2) ( ) ( 1)( 2) ( )lim lim lim(1 ) (2 ) ( ) (1 ) ( )
n
nkk k
nn n n k kk k k k nn nn n k n n k k→∞ →∞ →∞
+ + ++ ! + ++!= =++ + + +
KK K
KKK
K
K
K K
Since n is fixed, the second limit is one; therefore, lim .(1 ) ( )
n
k
kkn nn k→∞
!!= ++ KK  (This must be read as an in-
finite product.)
This factorial representation for positive integers suggests the possibility that
( 1) lim 1, 2,(1 ) ( )
x
k
kkxx x kxx k→∞
!Γ+= ! = ≠ − − −++ KK  (6)
Carl Friedrich Gauss verified this identification back in the nineteenth century.
This infinite product is symbolized by Π(x,k); i.e., Π(x,k) .(1 ) ( )
xkk
xx k
!= ++ LL  It is called Gauss’s function,
and through this symbolism,
( 1) lim ( , )
k
xx k
→∞
Γ+= Π  (7)


## Page 402

CHAPTER 15  Gamma and Beta Functions 391
The expression for 1
()xΓ  [which has some advantage in developing the derivative of Γ(x)] results as fol-
lows. Put Equation (6) in the form
11lim , ,(1 )(1 / 2) (1 / ) 2 3
x
k
k xxx x k→∞
≠−++ + KK
 . . . 1, k
Next, introduce
111 23
kγ=+ + +  . . . 1 1nk − k
Then
lim kk
γγ
→∞
=
is Euler’s constant. This constant has been calculated to many places, a few of which are
γ≈  0.57721566 . . . .
By letting kx = ex ln k = ex[– γk+1+1/2+… +1/k], the representation (6) can be further modified so that
/2 /
In
1
1
( 1) lim / 111 / 2 1 /
123( ) lim lim ( , )(1 ) (2 ) ( )
xx x k
xx x x k
k k
xx
kkk
ee e xxe e e exx x k k
kkkk x x xkxx x k
γγ γ
∞
−−
→∞ =
∞
→∞ →∞=
⎛⎞Γ+= = +⎜⎟++ + ⎝⎠
⋅⋅=! + = = ∏++ +
∏
∏
L
L
L
L
L
L
l
 (8)
Since Γ(x + 1) = xΓ(x),
/2
11 1 / 2lim()
x
xxk
xxxex ee
γ
→∞
++=Γ
 . . . /
/
1
1/ (1 / )xx k
xk
k
xk xe x k ee
γ
∞
−
=
+ =+ ∏  (9)
Another result of special interest emanates from a comparison of Γ(x)Γ(1 – x) with the well-known for-
mula
22
11limsin 11 ( / 2 )k
x
x xx
π
π →∞
⎧= ⎨ −−⎩
 . . . 2
2
1
1 {1 ( / }(1 / k
xkxk
∞
=
⎫ =−⎬− ⎭ ∏  (10)
[See Differential and Integral Calculus, by R. Courant (translated by E. J. McShane), Blackie & Son Limited.]
Γ(1 – x) is obtained from 1() ( 1 )yy yΓ= Γ +  by letting y = – x; i.e.,
1() ( 1 ) o r ( 1 ) ()xx x x xxΓ − = −Γ− Γ− = − Γ −
Now use Equation (8) to produce
Γ(x)Γ(1 – x) = 11 /
1
lim (1 / )xx k
k
xe k eγ
κ
∞
−− −
→ =∞
⎛⎞⎧⎫ +⎨⎬⎜⎟⎩⎭⎝⎠
∏
⎛
⎜
⎝
e 1/
1
lim (1 / )xx kxk eγ
κ
−−
=
− ⎞
⎟
⎠
2
1
1 lim (1( / ) )
k
xkx κ
∞
→∞ =
= ∏
Thus,
()( 1 ) , 0 1 sinxx x π
πΓΓ −= < <  (11a)
Observe that Equation (11a) yields the result
1
2 π⎛⎞Γ=⎜⎟⎝⎠
 (11b)
Another exact representation of Γ(x + 1) is
1
23
1 1 139(1 ) 2 1 12 288 51840
xxxx e x xxπ +− ⎧Γ+= + + + +⎨⎩
 . . . ⎫
⎬
⎭
 (12)
The method of obtaining this result is closely related to Stirling’s asymptotic series for the gamma func-
tion. (See Problems 15.20 and 15.74.)


## Page 403

CHAPTER 15  Gamma and Beta Functions392
The duplication formula
21 12( ) ( 2 ) 2
x xx x π− ⎛⎞ΓΓ+ = Γ⎜⎟⎝⎠
 (13a)
is also part of the literature. Its proof is given in Problem 15.24.
The duplication formula is a special case (m = 2) of the following product formula:
1()xx m
⎛⎞ΓΓ+ ⎜⎟
⎝⎠
 . . . 2x m
⎛⎞Γ+⎜⎟
⎝⎠
 . . .
11
221 (2 ) ( )
mmxmXm m xm π
−−−⎛⎞Γ+ = Γ⎜⎟
⎝⎠
 (13b)
It can be shown that the gamma function has continuous derivatives of all orders. They are obtained by
differentiating (with respect to the parameter) under the integral sign.
It helps to recall that 1x -1
0
( ) and that if y = t ,xy txt e d t
∞ −−Γ= ∫  then ln y = ln tx–1 = (x – 1) ln t.
Therefore; 1 yy
′= ln t.
It follows that
1
0
() xtxt e
∞ −−Γ′ = ∫ ln t dt. (14a)
This result can be obtained (after making assumptions about the interchange of differentiation with limits)
by taking the logarithm of both sides of Equation (9) and then differentiating.
In particular,
 Γ′ (1) = –γ (γ is Euler’s constant.) (14b)
It also may be shown that
() 1 1 1 1
() 1 2 1
x
xx x γΓ′ ⎛⎞ ⎛ ⎞=− + − + − +⎜⎟ ⎜ ⎟Γ+ ⎝⎠ ⎝ ⎠
 . . . 11
1nx n
⎛⎞ −⎜⎟ +−⎝⎠
 (15)
(See Problem 15.73 for further information.)
The Beta Function
The beta function is a two-parameter composition of gamma functions that has been useful enough in ap-
plication to gain its own name. Its definition is
1 11
0
(,) ( 1 ) xyBxy t t d t −−=−∫  (16)
If x ≥ 1 and y ≥ 1, this is a proper integral. If x > 0, y > 0, and either or both x < 1 or y < 1, the integral is
improper but convergent.
It is shown in Problem 15.11 that the beta function can be expressed through gamma functions in the fol-
lowing way
()()(,) ()
xyBxy xy
ΓΓ= Γ+
 (17)
Many integrals can be expressed through beta and gamma functions. Two of special interest are
/2 21 21
0
11 ( ) ( )sin cos ( , )22 ( )
xy xydB x y xy
π
θθ θ−− ΓΓ== Γ+∫  (18)
1
0
() ( 1 ) 0 11s i n
px dx p p pxP
π
π
−∞
=Γ Γ − = < <+∫  (19)
See Problem 15.17. Also see Page 391, where a classical reference is given. Finally, see Problem 16.38,
where an elegant complex variable resolution of the integral is presented.


## Page 404

CHAPTER 15  Gamma and Beta Functions 393
Dirichlet Integrals
If V denotes the closed region in the first octant bounded by the surface 1
pqr
xyz
aac
⎛⎞ ⎛⎞ ⎛⎞++=⎜⎟ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠ ⎝⎠
 and the
coordinate planes, then if all the constants are positive,
11 1
1V
pbrabcxyz d x d y d z pqr
pqr
αβ γ
αβ γ
αβγ
αβγ
−− −
⎛⎞ ⎛⎞ ⎛ ⎞ΓΓΓ ⎜⎟⎜⎟⎜⎟ ⎝⎠⎝⎠⎝⎠=
⎛⎞Γ+++⎜⎟
⎝⎠
∫∫∫  (20)
Integrals of this type are called Dirichlet integrals and are often useful in evaluating multiple integrals
(see Problem 15.21).
SOLVED PROBLEMS
The gamma function
15.1. Prove (a) Γ(x + 1) = xΓ(x), x > 0 and (b) Γ(n + 1) = n!, n = 1, 2, 3, . . .
(a)
Γ () l i m
lim (
υ υυ+= =
=
∞ −
→∞
−
→∞
∫∫1
00
xe d x xe d x
x
x
M
M x
M
υυυ υ)( ) ( )( )
lim
−− −⎧
⎨
⎩⎪
⎫
⎬
⎭⎪
=
−− −
∫e M ex d xxx M
M
0
1
0
→→∞
−− −−+{} =>∫Me x e d xM M xυυ υυ υ υ1
0
0Γ () i f
(b) 00
(1) lim lim (1 ) 1.
Mxx M
MM
e dx e dx e
∞ −− −
→∞ →∞
Γ= = = − =∫∫
Put n = 1, 2, 3, . . . in Γ(n + 1) = nΓ(n). Then
Γ(2) = 1Γ(1) = 1, Γ(3) = 2Γ(2) = 2 · 1 = 2! Γ(4) = 3Γ(3) = 3 · 2! = 3!
In general, Γ(n + 1) = n! if n is a positive integer.
15.2. Evaluate each of the following:
(a) (6) 5! 5 4 3 2 302( 3 ) 2 2 ! 2 2
Γ⋅ ⋅ ⋅== =Γ⋅ ⋅
(b)
53 33 1 1 . 322 22 2 2
11 1 4
22 2
⎛⎞ ⎛⎞ ⎛⎞ΓΓ Γ⎜⎟ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠ ⎝⎠== =
⎛⎞ ⎛⎞ ⎛⎞ΓΓ Γ⎜⎟ ⎜⎟ ⎜⎟
⎝⎠ ⎝⎠ ⎝⎠
(c) (3) (2.5) 2!(1.5)(0.5) (0.5) 16
(5.5) (4.5)(3.5)(2.5)(1.5)(0.5) (0.5) 315
ΓΓ Γ==ΓΓ
(d)
85 2 266 433 3 3
22 355 33
⎛⎞ ⎛⎞ ⎛⎞⎛⎞ΓΓ⎜⎟ ⎜⎟ ⎜⎟⎜⎟
⎝⎠ ⎝⎠ ⎝⎠⎝⎠==
⎛⎞ ⎛⎞ΓΓ⎜⎟ ⎜⎟
⎝⎠ ⎝⎠
15.3. Evaluate each integral.
(a) 3
0
(4) 3! 6xxe d x
∞ − =Γ = =∫
(b) 62
0
xxe d x
∞ −
∫


## Page 405

CHAPTER 15  Gamma and Beta Functions394
Let 2x = 7. Then the integral becomes
6
6
77 700
1( 7) 6! 45
22 822 2
yyyd yey e d y
∞∞ −− Γ⎛⎞ == = =⎜⎟⎝⎠∫∫
15.4. Prove that 1 .2 π⎛⎞Γ=⎜⎟
⎝⎠
1/2
0
1 .2
xxe d x
∞ −−⎛⎞Γ=⎜⎟
⎝⎠
∫
Letting x = u2 this integral becomes
2
0
22 2
ued u π π
∞ − ⎛⎞== ⎜⎟⎝⎠∫
using Problem 12.31. This result also is described in Equation (11a, b) on Page 391.
15.5. Evaluate each integral.
(a)
2
0
.yye d y
∞ −
∫
Letting y3 = x, the intergral becomes
1/3 2/3 1/2
00
11 1 1. 33 3 2 3
xxxe xd x xe d x π∞∞ −− − − ⎛⎞== Γ =⎜⎟⎝⎠∫∫
(b)
22 24 In3 ( 4 ) (4In3)
00 0
3( ) (xxzdx e dz e dz
∞∞ ∞−− − ==∫∫ ∫
Letting (4 ln 3)z2 = x, the integral becomes
1/2
-1 / 2
00
1( 1/ 2)e
4In3 2 4In3 2 4In3 4 In3
xx xdx e dx π∞∞ −−⎛⎞ Γ== =⎜⎟⎝⎠∫∫ l l ll
(c)
1
0
.
ln
dx
x−∫
Let – ln x = u. Then x = e–u. When x = 1, u = 0; when x = 0, u = /H11009. The integral becomes
1/2
00
(1 / 2)
u
ue du u e du
u
π
−∞∞ −−== Γ =∫∫
15.6. Evaluate
0
nma xxe d x
∞ −
∫ , where m, n, and a are positive constants.
Letting axn = y, the integral becomes
1/ 1/
(1 ) / 1
(1 ) / (1 ) /00
11 1
mnn
ym n y
mn mn
yy med y ed yaa nna na
∞∞ −+ − −
++
⎧⎫ ⎧⎫ +⎪⎪ ⎪⎪⎛⎞ ⎛⎞ ⎛ ⎞ == Γ⎨⎬ ⎨⎬⎜⎟ ⎜⎟ ⎜ ⎟⎝⎠ ⎝⎠ ⎝ ⎠⎪⎪ ⎪⎪⎩⎭ ⎩⎭
∫∫
15.7. Evaluate (a) () (1 / 2 )a Γ−  (b) (5 / 2 )−
We use the generalization to negative values defined by (1 )() . xx x
Γ+Γ=
(a) Letting 1( 1/ 2),( 1 / 2 ) 2 .21 / 2x πΓ=− Γ− = =− −
(b) Letting (1 / 2 ) 2 43/2 , ( 3/2 ) ,3/2 3/2 3x ππΓ− −=− Γ− = = = −−
 using (a)
Then (3 / 2 ) 8(5 / 2 ) .5/2 1 5 πΓ−Γ− = =− −


## Page 406

CHAPTER 15  Gamma and Beta Functions 395
15.8. Prove that xd x n
m
m
n
n0
1
1
1
1∫ = −
+ +( ()!
()
,ln x n)  where n is a positive integer and m > –1.
Letting x = e–y, the integral becomes (1 )
0
(1 ) . I f ( 1 )nn m yy e dy m+ y = u,
∞ −+− ∫  this last integral becomes
11 100
(1 ) (1 ) (1 ) !(1 ) ( 1 )1( 1) ( 1) ( 1) ( 1)
nn n n
nu n u
nn n n
ud u neu e du nmmm m m
∞∞ −−
++ +
−− −−= = Γ + =+++ + +∫∫
Compare with Problem 8.50.
15.9. A particle is attracted toward a fixed point O with a force inversely proportional to its instantaneous distance
from O. If the particle is released from rest, find the time for it to reach O
At time t  = 0, let the particle be located on the x  axis at x  = a  > 0 and let O  be the origin. Then, by
Newton’s law,
2
2
dx km xdt =−  (1)
where m is the mass of the particle and k > 0 is a constant of proportionality.
Let dx
dt υ =, the velocity of the particle. Then
2
2 ..d x d d dx d
dt dx dt dxdt
υυ υ υ== =  and Equation (1) be-
comes
2
or 2
dk mmk dx x
υυυ= − = − ln x+c  (2)
upon integrating. Since υ = 0 at x = a, we find c = k ln a. Then
m k dx
dt
k
m
a
x
υ υ
2
2
2== = −ln or lna
x
 (3)
where the negative sign is chosen, since x is decreasing as t increases. We thus find that the time T taken for
the particle to go from x = a to x = 0 is given by
T m
k
dx
ax
a
= ∫2 0
ln /
 (4)
Letting ln a/x = u or x = ae–u, this becomes
1/2
0
1
22 2 2
umm mTa u e d ua akk k
π∞ −− ⎛⎞== Γ =⎜⎟⎝⎠∫
The Beta Function
15.10. Prove that (a) B(u, υ) = B(υ, u) and (b)
/2 21 21
0
( , ) 2 sin cos . uBu d
π υυθ θ θ−−= ∫
(a) Using the transformation x = 1 – y, we have
11 1 11 1 1 11
00 0
(, ) ( 1 ) ( 1 ) ( 1 ) (,)uu uB u x x dx y y dy y y dy B uυυ υυυ −− − − −−=− = − =− =∫∫∫
(b) Using the transformation x = sin 2 θ, we have
1/ 2 111 2 1 2
00
/2 21 21
0
( , ) (1 ) (sin ) (cos ) 2sin cos
2s i n c o s
uu
ux
B u x x dx d
d
π υυ
π
υθ θ θ θ θ
θθ θ
−−− −
−−
=− =
=
∫∫
∫
15.11. Prove that () ()(, ) , 0 .()
uBu uu
υυυ υ
ΓΓ=>Γ+
Letting z2 = x2, we have
212 1
00
() 2 .uz uxuz e d x x e d x
∞∞ −− −−Γ= = ∫∫


## Page 407

CHAPTER 15  Gamma and Beta Functions396
Similarly,
221
0
() 2 . yye d yυυ
∞ −−Γ= ∫  Then
ΓΓ()()ux e d x y e d yux yυ υ= () ()
=
−−∞ −−∞
∫∫4 21
0
21
0
22
4 4 2121
0 0
22
xye d x d yux y−− − +∞ ∞
∫ ∫
υ ()
Transforming to polar coordinates, x = ρ cos φ, y = ρ sin φ,
ΓΓ()() ( ) c o s s i nuu v e uυρ φ ρυ
ρ
=+ − −− −
=
∞
∫41 22 1 2 1
0
2
φ φ
π
υ
φρφ
=
+− −
=
∞ −
∫
∫= ()
0
2
21
0
24
2
/
() cos
dd
pe d pup
p
u 112 1
0
2
21 22
φφ φ
υφ
υ
φ
π
υ
sin
() c o ss i n
/ −
=
−
∫()
=+
d
u uΓ − − =+
=+
∫
1
0
2
φφ υ υ
υυ
π
du B u
uB u
Γ
Γ
() ( , )
() ( , )
/
using the results of Problem 15.10. Hence, the required result follows.
This argument can be made rigorous by using a limiting procedure as in Problem 12.31.
15.12. Evaluate each of the following integrals.
(a)
1 43
0
(5) (4) 4!3! 1(1 ) (5, 4) (9) 8! 280x x dx B ΓΓ−= = = = Γ∫
(b)
22
0 2
xd x
x−∫
Letting x = 2υ, the integral becomes
211 21 / 2
00
42( 3 )( 1 / 2 )16 4 242 42 ( 1 ) 42 3 , 2 (7 / 2) 151
dd Bυ υυ υ υ
υ
− ΓΓ⎛⎞=− = = = ⎜⎟⎝⎠ Γ−∫∫
(c)
42 2
0
a
ya y d y−∫
Letting
22 or ,ya x y x== the integral becomes
66163 / 2 1 / 2 6
0
(5 / 2) (3 / 2)( 1 ) ( 5/2 ,3/2 ) (4) 16
aaax xd x a B πΓΓ−= = = Γ∫
15.13. Show that
/2 21 21
0
() ()sin cos , 0.2( )
u udu u
π υ υθθ θ υ υ
−− ΓΓ=> Γ+∫
This follows at once from Problems 15.10 and 15.11.
15.14. Evaluate (a)
/2 6
0
sin , d
π
θθ∫  (b)
/2 45
0
sin cos , d
π
θθ θ∫  and (c)
/2 4
0
cos d
π
θθ∫ .
(a) Let 2u – 1 = 6, 2υ – 1 = 0, i.e., u = 7/2, υ = 1/2, in Problem 15.13. Then the required integral has the value
(7 / 2) (1/ 2) 5 .2 (4) 32
πΓΓ =Γ
(b) Letting 2u – 1 = 4, 2υ – 1 = 5, the required integral has the value (5 / 2) (3) 8 .2 (11/ 2) 315
ΓΓ =Γ
(c) The given integral =
/2 4
0
2 cos . d
π
θθ∫  Thus, letting 2u – 1 = 0, 2υ – 1 = 4 in Problem 15.13, the value is
2( 1 / 2 )( 5 / 2 ) 3 .2( 3 ) 8
πΓΓ =Γ


## Page 408

CHAPTER 15  Gamma and Beta Functions 397
15.15. Prove
/2 /2
00
135 ( 1 )sin cos ( ) if246 2
pp pdd a p p
ππ πθθ θθ ⋅⋅ −== ⋅⋅∫∫
L
L
L
L
is an even positive integer and
(b) 246 ( 1 )
135
p
p
⋅⋅ −
⋅⋅
L
L
L
L
 if p is an odd positive integer.
From Problem 15.13, with 2u – 1 = p, 2υ – 1 = 0, we have
/2
0
11(1 )22sin 12( 2 )2
p
p
d
p
π
θθ
⎡⎛ ⎞Γ+ Γ ⎜⎟⎢⎣⎝ ⎠=
⎡⎤Γ+⎢⎥
⎣⎦
∫
(a) If p = 2r, the integral equals
13 1 1 11 .(1 ) (2 1)(2 3) 1 1 3 5 (2 1)22 2 2 22
2 ( 1) 2 ( 1) 2 (2 2) 2 2 2 4 6 2 2
rrr rr r
rr rr r r
ππ
⎛⎞ ⎛⎞ ⎛ ⎞ ⎛ ⎞⎛⎞ −− Γ ΓΓ+Γ ⎜⎟ ⎜ ⎟ ⎜ ⎟ ⎜⎟ ⎜⎟ −− ⋅ ⋅ −⎝⎠ ⎝ ⎠ ⎝ ⎠ ⎝⎠ ⎝⎠== =Γ+ − − ⋅ ⋅
L LL
LL
L & L L
LL
(b) If p = 2r + 1, the integral equals
1(1 ) (1 ) 1 2 4 6 22
31 1 1 135 ( 2 1 )22 22 2 2
r rr r
rrr r
π
π
⎛⎞Γ+Γ ⎜⎟ −⋅ ⋅ ⋅⎝⎠ == ⋅⋅ +⎛⎞ ⎛⎞ ⎛⎞Γ+ + −⎜⎟ ⎜⎟ ⎜⎟⎝⎠ ⎝⎠ ⎝⎠
LL
LL
L
L L
L
In both cases,
/2 /2
00
sin cos ,as seen by letting / 2 .pp dd
ππ
θθ θθ θ π φ== −∫∫
15.16. Evaluate (a)
/2 6
0
cos , d
π
θθ∫  (b)
/2 32
0
sin cos , d
π
θθ θ∫  and (c)
2 8
0
sin . d
π
θθ∫
(a) From Problem 15.15, the integral equals 135 5
246 3 2
π⋅⋅ =⋅⋅
 [compare Problem 15.14(a)].
(b) The integral equals
/2 /2 /232 3 5
00 0
22 42sin (1 sin ) sin sin 13 135 1 5ddd
ππ π
θθ θ θ θ θ θ ⋅−= − = − = ⋅⋅ ⋅∫∫ ∫
The method of Problem 15.14(b) can also be used.
(c) The given integral equals
/2 8
0
1357 3 54s i n 4 .2468 2 6 4d
π ππθθ ⋅⋅⋅⎛⎞== ⎜⎟ ⋅⋅⋅⎝⎠∫
15.17. Given
1
0
,1s i n
px dxxp
π
π
−∞
=+∫  show that ()( 1 ) , sinpp p
π
πΓΓ −=  where 0 < p < 1.
Letting or ,11
xy yxxy==+−
 the given integral becomes
1 1
0
( 1 ) (, 1 ) ()( 1 )ppy y dy B p p p p−− −= − = Γ Γ −∫
and the result follows.
15.18. Evaluate 40
.1
dy
y
∞
+∫
Let y4 = x . Then the integral becomes ()
3/4
0
12
41 4 s i n/ 4 4
x dxx
ππ
π
−∞
==+∫  by Problem 15.17, with
1 .4p =  The result can also be obtained by letting y2 = tan θ.


## Page 409

CHAPTER 15  Gamma and Beta Functions398
15.19. Show that
2 3 3
0
168.
93
xx d x π−=∫
Letting x3 – 8y or x = 2y1/3, the integral becomes
11 1/3 2/3 1/3 1/3
00
28 8 2 42 8(1 ) . (1 ) ,33 3 3 3
24
88 1 2 8 1 633 .3 (2) 9 3 3 9 sin / 3 93
yy y d y y y d y B
ππ
π
−− ⎛⎞−= − = ⎜⎟⎝⎠
⎛⎞ΓΓ⎜⎟ ⎛⎞⎛⎞⎝⎠== Γ Γ = = ⎜⎟⎜⎟Γ ⎝⎠⎝⎠
∫∫
Stirling’s formula
15.20. Show that for large positive integers ,! 2 nnnn n ne π −=  approximately.
By definition, 1
0
() . ztzt e d t
∞ −−Γ= ∫  Let lfz = x + 1, then
In In
00 0
(1 )
xxt t t t x tx t e dt e dt e dt
∞∞ ∞ −− + − +Γ+= = = ∫∫ ∫  (1)
For a fixed value of x the function x, ln t – t has a relative maximum for t = x (as is demonstrated by ele-
mentary ideas of calculus). The substitution t = x + y yields
yIn 1+In(x+y)-y x(1 )
xyxx x x
xx
xe ed y x e e d y
⎛⎞ −∞∞ ⎜⎟−− ⎝⎠
−−
Γ+= =∫∫  (2)
To this point the analysis has been rigorous. The following formal steps can be made rigorous by incor-
porating appropriate limiting procedures; however, because of the difficulty of the proofs, they have been
omitted.
In Equation (2) introduce the logarithmic expansion
l
23
23n1 23
yy y y
xx xx
⎛⎞+= − + − +⎜⎟⎝⎠
 . . . (3)
and also let
,yx d yx dυυ==
Then
23/2 ( /3 )
(1 )
xxx
x
x x exe d
υυ
υ
∞ −+ −−
−
Γ+= ∫
LL  (4)
For large values of x
2 /2(1 ) 2xx xx
x
x x exe d x e x υ υπ
∞−− −
−
Γ+≈ =∫
When x is replaced by integer values n, then the Stirling relation
!( 1 ) 2 xxnx x x e π −=Γ + ≈   (5)
is obtained.
It is of interest that from Equation (4) we can also obtain the result (12) on Page 391. See Problem 15.72.
Dirichlet integrals
15.21. Evaluate 11 1 y
V
I x y z dx dy dzαβ−− −= ∫∫∫ , where V is the region in the first octant bounded by the sphere x2 + y2
+ z2 = 1 and the coordinate planes.


## Page 410

CHAPTER 15  Gamma and Beta Functions 399
Let x2 = u, y2 = υ, z2 = w. Then
( 1 )/2 ( 1 )/2 ( 1 )/2
( /2) 1 ( /2) 1 ( /2) 1
222
1
8
y du d dwIu w
uw
u w du d dw
αβ
ℜ
αβ γ
ℜ
υυ
υ
υυ
−−−
−−−
=
=
∫∫∫
∫∫∫
 (1)
where ℜ is the region in the uυw space bounded by the plane
u + υ  + w  = 1 and the uυ, υw, and uw planes, as in Figure
15.2. Thus,
Iu w y
w
u
= −− − −
=
−−
=
−
∫
1
8
21 21 21
0
1
0
1 (/ ) (/ ) ( / )αβυ
υ
υ
u u
u
du d dw
uu
∫ ∫=
−−=− −
0
1
21 211
4 1
υ
γ υυαβ γ(/ ) (/ ) /() 2 2
0
1
0
1
21
0
1 211
4
υ
αβ
υ
γ υ
=
−
=
−
=
−
∫ ∫
∫=
u
u
u
du d
u(/ ) (/ ) (() /1 2
0
1
−−{} =
−
∫ ud d u
u
υυγ
υ
 (2)
Letting υ = (1 – u)t, we have
11 ( /2) 1 /2 ( )/2 ( /2) 1 /2
00
() / 2
(1 ) (1 ) (1 )
( / 2) ( / 2 1)(1 ) [( ) / 2 1]
u
t
ud u t t d t
u
βγ β γ β γ
υ
βγ
υυ υ
βγ
βγ
− −+ −
==
+
−− = − −
ΓΓ +=− Γ+ +
∫∫
so that Equation (2) becomes
11 (/ 2 ) ( ) / 2
0
1 ( /2 ) ( /2 1 ) (1 )4[ ( ) / 2 1 ]
1 ( / 2) ( / 2 1) ( / 2) ( ) / 2 1) ( / 2) ( / 2) ( / 2).4 [( ) / 2 1] [( ) / 2 1] 8 [( ) / 2 1]
u
Iu u duαβ γβγ
γβ γ
βγ αβ γ αβγ
γβ γ α β γ α β
− +
=
ΓΓ +=− Γ+ +
ΓΓ + ΓΓ + + ΓΓΓ== Γ+ + Γ+ + + Γ+ ++
∫
 (3)
where we have used (γ/2) Γ(γ/2) = Γ(γ/2 + 1).
The integral evaluated here is a special case of the Dirichlet integral Equation (20), Page 393. The general
case can be evaluated similarly.
15.22. Find the mass of the region bounded by x 2 + y2 + z 2 = a2 if the density is σ = x2y2z2.
The required mass 2228,
V
xyzd x d y d z= ∫∫∫  where V is the region in the first octant bounded by the sphere
x2 + y2 + z2 = a2 and the coordinate planes.
In the Dirichlet integral, Equation (20), Page 393, let b = c = a, p = q = r = 2, and α = β = γ = 3. Then the
required result is
333 9(3 / 2) (3 / 2) (3 / 2) 48. 2 2 2 (1 3 / 2 3 / 2 3 / 2) 945
aaa sπ⋅ ⋅ ΓΓΓ =⋅ ⋅ Γ +++
Miscellaneous problems
15.23. Show that
21 4
0
{ (1/ 4)}1.
62
xd x
π
Γ−=∫
Let x4 = y. Then the integral becomes
21 3/4 1/2
0
1 1 (1/ 4) (3 / 2) { (1/ 4)}(1 ) .4 4 (7 / 4) 4 (1.4) (3 / 4)yy d y π− ΓΓ Γ−= = ΓΓ Γ∫
From Problem 15.17, with p = 1/4, Γ(1/4)Γ(3/4) = π 2 , so that the required result follows.
Figure 15.2


## Page 411

CHAPTER 15  Gamma and Beta Functions400
15.24. Prove the duplication formula 22p–1 Γ(p)Γ(p + 1
2
) = π Γ(2p).
Let
/2 /222
00
sin , sin 2 .ppI x dx J x dx
ππ
==∫∫
Then
1
11 1 2,22 2 2 ( 1 )
p
IB p p
π⎛⎞Γ+⎜⎟⎛⎞ ⎝⎠=+ = ⎜⎟⎝⎠ Γ +
.
Letting 2x = u, we find
/222
00
1 sin sin2
ppJu d u u d u I
ππ
== =∫∫
But
/2 /222 2 2
00
2
21
21
(2sin cos ) 2 sin cos
12 2112, 22 ( 2 1 )
pp p p
p
p
Jx x d x x x d x
p
Bp P p
ππ
−
−
==
⎧⎫ ⎛⎞Γ+⎜⎟⎨⎬ ⎝⎠⎛⎞ ⎩⎭=+ + = ⎜⎟
⎝⎠ Γ +
∫∫
Then, since I = J,
2
21 11 2 22
2( ) 2 ( 2 )
p pp
pp p p
π
− ⎧⎫ ⎛⎞⎛⎞ Γ+⎜⎟⎨⎬Γ+⎜⎟ ⎝⎠⎝⎠ ⎩ ⎭ =ΓΓ
and the required result follows. (See Problem 15.74, where the duplication formula is developed for the simpler
case of integers.)
15.25. Show that
2/2
0
2
{ (1/ 4)} .
141s i n2
dπ φ
πφ
Γ=
−
∫
Consider
2
/2 /2 1/2
00
11
411 1 4cos , 324 2cos 2 22 4
dId B
ππ
πθ θθ
θπ
−
⎧⎫ ⎛⎞⎛⎞ Γ ⎜⎟⎨⎬Γ ⎜⎟ ⎝⎠⎛⎞ ⎝⎠ ⎩ ⎭== = = = ⎜⎟⎝⎠ ⎛⎞Γ ⎜⎟
⎝⎠
∫∫
as in Problem 15.23.
But
/2 /2 /2
00 022 2
.
cos cos / 2 sin / 2 1 2sin / 2
dd dI
ππ πθθ θ
θ θθ θ
== =
−−∫∫ ∫
Letting 2  sin θ /2 = sinφ in this last integral, it becomes
/2
0
2
2,
11s i n2
dπ φ
φ −
∫  from which the result
follows.
15.26. Prove that
0
cos ,0 1.2 ( ) cos( / 2)p
x dx pppx
π
π
∞
=< <Γ∫
We have 1
0
11 .()
px u
p ued upx
∞ −−= Γ ∫  Then
1
00 0
20
cos 1 cos()
1
() 1
px u
p
p
x dx u e x du dxpx
u dup u
∞∞ ∞ −−
∞
= Γ
= Γ +
∫∫ ∫
∫
 (1)
where we have reversed the order of integration and used Problem 12.22.


## Page 412

CHAPTER 15  Gamma and Beta Functions 401
Letting u2 = υ in the last integral, we have, by Problem 15.17,
(1 ) / 2
200
1
21 2 s i n ( 1 ) / 2 2 c o s / 21
ppu du d ppu
υπ π υυπ π
−∞∞
=== +++∫∫  (2)
Substitution of Equation (2) in Equation (1) yields the required result.
15.27. Evaluate 2
0
cos .xd x
∞
∫
Lettingx2 = y, the integral becomes
0
1c o s 1 1 /2122 2 2c o s / 42
y dy
y
π π
π
∞ ⎛⎞== ⎜⎟ ⎛⎞⎜⎟Γ ⎜⎟⎜⎟ ⎝⎠⎝⎠
∫  by Problem 15.26.
This integral and the corresponding one for the sine [see Problem 15.68(a)] are called Fresnel integrals.
SUPPLEMENTARY PROBLEMS
The gamma function
15.28. Evaluate (a) (7) ,2 (4) (3)
Γ
ΓΓ
 (b) (3) (3 / 2) ,(9 / 2)
ΓΓ
Γ
 and (c) ( 1/2 ) ( 3/2 ) ( 5/2 ) .ΓΓΓ
Ans. (a) 30 (b) 16/105 (c) 3/23
8 π
15.29. Evaluate (a) 4
0
,xxe d x
∞ −
∫  (b) 63
0
,xxe d x
∞ −
∫  and (c)
222
0
.xxe d x
∞ −
∫
Ans. (a) 24 (b) 80
243
 (c) 2
16
π
15.30. Find (a)
2
0
,xed x
∞ −
∫   (b) 4
0
xe
∞
∫ e ,x dx−  and (c)
532
0
.yye d y
∞ −
∫
Ans. (a) 11
33
⎛⎞Γ ⎜⎟⎝⎠
 (b) 3
2
π  (c)
5
(4 / 5)
51 6
Γ
15.31. Show that
0
,0 .8
ste dt s
t
π−∞
=>∫
15.32. Prove that
1
1
0
1() l n , 0 . dxx
υ
υυ
−
⎛⎞Γ= >⎜⎟
⎝⎠
∫
15.33. Evaluate (a)
1 4
0
(ln ) ,xd x∫  (b)
1 3
0
(l n  ) ,xx d x∫  and (c)
1
3
0
ln(1/ )xd x .∫
Ans. (a) 24 (b) –3/128 (c) 11
33
⎛⎞Γ ⎜⎟⎝⎠
15.34. Evaluate (a) Γ(–7/2) and (b) Γ(–1/3).
Ans. (a) (16 π )/105 (b) – 3 Γ(2/3)
15.35. Prove that lim
xm→−
Γ(x) = /H11009, where m = 0, 1, 2, 3, . . . .


## Page 413

CHAPTER 15  Gamma and Beta Functions402
15.36. Prove that if m is a positive integer, 1( 1 ) 2
21 3 5 ( 21 )
mm
m m
π −⎛⎞Γ− + =⎜⎟⎝⎠ ⋅ ⋅ − LL
.
15.37. Prove that
0
(1) ln xex d x
∞ −Γ′ = ∫  is a negative number (it is equal to –γ, where γ = 0.577215 . . . is called
Euler’s constant, as in Problem 11.49).
The beta function
15.38. Evaluate (a) B(3,5), (b) B(3/2,2), and (c) B(1/3, 2/3).
Ans. (a) 1/105 (b) 4/15 (c) 2/ 3π
15.39. Find (a)
1 23
0
(1 ) ,xx d x−∫  (b)
1
0
(1 ) / ,xx d x−∫  and (c)
1 23 / 2
0
(4 ) .xd x−∫
Ans. (a) 1/60 (b) π/2 (c) 3π
15.40. Evaluate (a)
4 3/2 5/2
0
(4 )uu d u−∫  and (b)
3
0 2
.
3
dx
xx−∫
Ans. (a) 12π (b) π
15.41. Prove that
2
0 44
{ (1/ 4)} .
42
a dy
aay π
Γ=
−∫
15.42. Evaluate (a)
/2 44
0
sin cos d
π
θθ θ∫  and (b)
2 6
0
cos . d
π
θθ∫
Ans. (a) 3π/256 (b) 5π/8
15.43. Evaluate (a) 5
0
sin d
π
θθ∫  and (b)
/2 52
0
cos sin . d
π
θθ θ∫
Ans. (a) 16/15 (b) 8/105
15.44. Prove that tanθ
0
π /2
∫ dθ=π /2 .
15.45. Prove that (a) xd x
1+ x60
∞
∫ = π
33
 and (b) y2 dy
1+ y40
∞
∫ = π
22
.
15.46. Prove that
2
3 2/3 1/3
2 .
33
x
x
e dx
ae b ab
π∞
−∞
=
+∫  where a, b > 0.
15.47. Prove that e2 x
(e3x + 1)−∞
∞
∫ dx = 2π
93
. [Hint: Differentiate with respect to Problem 15.46(b).]
15.48. Use the method of Problem 12.31 to justify the procedure used in Problem 15.11.
Dirichlet integrals
15.49. Find the mass of the region in the xy plane bounded by x + y = 1, x = 0, y = 0 if the density is σ = xy.
Ans. π/24


## Page 414

CHAPTER 15  Gamma and Beta Functions 403
15.50. Find the mass of the region bounded by the ellipsoid x2
a2 + y2
b2 + z2
c2 = 1  if the density varies as the square of
the distance from its center.
Ans. π abck
30 (a2 + b2 + c2 ), k =  constant of proportionality
15.51. Find the volume of the region bounded by x 2/3 + y2/3 + z2/3 = 1.
Ans. 4π/35
15.52. Find the centroid of the region in the first octant bounded by x 2/3 + y2/3 + z2/3 = 1.
Ans. x  = y  = z  = 21/128
15.53. Show that the volume of the region bounded by x m + ym + zm = am, where m > 0, is given by 8{Γ (1 /m)}3
3m2Γ (3 / m) a3.
15.54. Show that the centroid of the region in the first octant bounded by x m + ym + zm = am, where m > 0, is given
by x = y = z = 3Γ (2 / m)Γ (3 / m)
4Γ (1 /m)Γ (4 / m) a.
Miscellaneous problems
15.55. Prove that (x − a)p (b − x)q dx = (b − a)p + q +1 B(p + 1,q + 1)
a
b
∫ , where p > –1, q > –1, and b > a. [Hint:
Let x – a = (b – a)y.]
15.56. Evaluate (a) dx
(x − 1)(3− x)1
3
∫  and (b) (7 − x)(x − 3)4 dx
3
7
∫ .
Ans. (a) π (b) 2{Γ (1 / 4 )}2
3 π
15.57. Show that {Γ (1 / 3)}2
Γ (1 / 6) = π 23
3 .
15.58. Prove that B(u,υ ) = 1
2
xu−1 + xυ− 1
(1+ x)u+υ0
1
∫ dx, where u, υ > 0. [Hint: Let y = x/(1 + x).]
15.59. If 0 < p < 1, prove that tanp θ dθ
0
π /2
∫ = π
2 sec pπ
2 .
15.60. Prove that xu−1 (1− x)υ− 1
(x + r)u+υ0
1
∫ = B(u,υ )
ru (1+ r)u+υ , where u, υ and r are positive constants. [Hint: Let x = (r + 1)y/
(r + y).]
15.61. Prove that sin2u−1 θ cos2υ− 1 θdθ
(a sin2 θ+ b cos2 θ)u+υ0
π /2
∫ = B(u,υ )
2aυ bu  where u, υ > 0. (Hint: Let x = sin2 θ in Problem 15.60
and choose r appropriately.)
15.62. Prove that dx
xx0
1
∫ = 1
11 + 1
22 + 1
33 + . . . .


## Page 415

CHAPTER 15  Gamma and Beta Functions404
15.63. Prove that for m = 2, 3, 4, . . . , sin π
m sin 2π
m sin 3π
m L sin (m − 1)π
m = m
2m−1L . [Hint: Use the factored form
xm – 1 = (x – 1)(x –α 1) (x – α 2) . . . (x – α n–1), divide both sides by x – 1, and consider the limit as x → 1.]
15.64. Prove that ln lnsin /
/
xd x =−∫ π
π
22
0
2
, using Problem 15.63. (Hint: Take logarithms of the result in
Problem 15.63 and write the limit as m → /H11009 as a definite integral.)
15.65. Prove that Γ 1
m
⎛
⎝⎜ ⎞
⎠⎟ Γ 2
m
⎛
⎝⎜ ⎞
⎠⎟ Γ 3
m
⎛
⎝⎜ ⎞
⎠⎟L Γ (m − 1)
m = (2π )(m−1)/2
m
.L [Hint: Square the left-hand side and use
Problem 15.63 and Equation (11a), Page 391.]
15.66. Prove that ln InΓ () ( ) .xd x =∫
1
2 2
0
1
π  (Hint: Take logarithms of the result in Problem 15.65 and let m → /H11009.)
15.67. (a) Prove that sin x
xp dx = π
2Γ (p)sin( pπ /2 )0
∞
∫ ,0 < p < 1. (b) Discuss the cases p = 0 and p = 1.
15.68. Evaluate (a) sin x2dx
0
∞
∫  and (b) x cos x3dx
0
∞
∫
Ans. (a) 1
2
π /2  (b) π
33 Γ (1 / 3)
15.69. Prove that xx
x dx
p−∞
+ =−∫
1
0
2
1
ln π csc pπ cot pπ, 0 < p < 1.
15.70. Show that ln x
x dx40
2
1
2
16+ = −∞
∫
π
15.71. If a > 0, b > 0, and 4ac > b2, prove that e− (ax2 +bxy+cy2 )dx dy = 2π
4ac − b2−∞
∞
∫−∞
∞
∫ .
15.72. Obtain Equation (12) on Page 391 from the result (4) of Problem 15.20. [Hint: Expand
3 /(3 ) neυ + . . . in a
power series and replace the lower limit of the integral by –/H11009.]
15.73. Obtain the result (15) on Page 392. [Hint: Observe that
1() ( ! )xx xΓ= Γ + ; thus, ln Γ(x) = ln Γ (x + 1) – ln x,
and Γ′(x)
Γ (x) = Γ′(x + 1)
Γ (x + 1) − 1
x
. Furthermore, according to Equation (6), page 390, Γ (x +!) = lim
k→∞
k!kx
(x + 1)L (x + k)L .
Now take the logarithm of this expression and then differentiate. Also, recall the definition of the Euler
constant γ.]
15.74. The duplication formula (13a), Page 392, is proved in Problem 15.24. For further insight, develop it for positive
integers; i.e., show that 22n−1 Γ n + 1
2
⎛
⎝⎜ ⎞
⎠⎟ Γ (n) =Γ (2n) π . [Hint: Recall that
1 ,2 π⎛⎞Γ=⎜⎟⎝⎠
 then show that
Γ n + 1
2
⎛
⎝⎜ ⎞
⎠⎟ Γ 2n + 1
2
⎛
⎝⎜ ⎞
⎠⎟ = (2n − 1)L 5 ⋅3⋅1
2n π .L  Observe that Γ (2n + 1)
2n Γ (n + 1)= (2n!)
2n n! = (2n − 1) . . . 5 ⋅3⋅1 .
Now substitute and refine.


## Page 416

405
CHAPTER 16
Functions of a Complex
Variable
Ultimately, it was realized that to accept numbers that provided solutions to equations such as x2 + 1 = 0 was
no less meaningful than had been the extension of the real number system to admit a solution for x + 1 = 0 or
roots for x2 – 2 = 0. The complex number system was in place around 1700, and by the early nineteenth century,
mathematicians were comfortable with it. Physical theories took on a completeness not possible without this
foundation of complex numbers and the analysis emanating from it. The theorems of the differential and integral
calculus of complex functions introduce mathematical surprises as well as analytic refinement. This chapter is
a summary of the basic ideas.
Functions
If to each of a set of complex numbers which a variable z may assume there corresponds one or more values
of a variable w, then w is called a function of the complex variable z, written w = f (z). The fundamental op-
erations with complex numbers have already been considered in Chapter 1.
A function is single-valued if for each value of z there corresponds only one value of w; otherwise, it is multiple-
valued or many-valued. In general, we can write w = f(z) = u(x, y) + iυ(x, y), where u and υ are real functions of
x and y.
EXAMPLE. w = z2 = (x + iy)2 = x2 – y2 + 2ixy = u + iυ so that u(x, y) = x2 – y2, υ(x, y) = 2xy. These are called
the real and imaginary parts of w = z2, respectively.
In complex variables, multiple-valued functions often are replaced by a specially constructed single-
valued function with branches. This idea is discussed in a later paragraph.
EXAMPLE. Since e2πki = 1, the general polar form of z is z = ρ ei(θ+2πk). This form and the fact that the loga-
rithm and exponential functions are inverse leads to the following definition of ln z:
ln z = ln ρ + (θ + 2πk)ik  = 0, 1, 2, . . . , n . . .
Each value of k determines a single-valued function from this collection of multiple-valued functions. These
are the branches from which (in the realm of complex variables) a single-valued function can be constructed.
Limits and Continuity
Definitions of limits and continuity for functions of a complex variable are analogous to those for a real variable.
Thus, f (z) is said to have the limit l as z approaches z
0 if, given any /H9280 > 0, there exists a δ > 0 such that ⏐f (z) – l⏐
< /H9280 whenever 0 < ⏐z – z0⏐ < δ.
Similarly, f (z) is said to be continuous at z0 if, given any /H9280 > 0, there exists a δ > 0 such that ⏐f (z) – f(z0)⏐ <
/H9280 whenever ⏐z – z0⏐ < δ. Alternatively, f (z) is continuous at z0 if lim
z→ z0
f (z) = f (z0 ).


## Page 417

CHAPTER 16  Functions of a Complex Variable406
Note: While these definitions have the same appearance as in thereal variable setting, remember that
⏐z – z0⏐ < δ means
(x − x0 + i(y − y0 ) = (x − x0 )2 (y − y0 )2 <δ
Thus, there are two degrees of freedom as (x, y) → (x 0, y0).
Derivatives
If f (z) is single-valued in some region of the z plane, the derivative of f(z), denoted by f ′(z), is defined as
lim
Δz→ 0
( f (z +Δ z) − f (z)
Δ z
 (1)
provided the limit exists independent of the manner in which Δz → 0. If the limit (1) exists for z = z 0, then
f (z) is called analytic at z0. If the limit exists for all z in a region ℜ, then f (z) is called analytic in ℜ. In order
to be analytic, f (z) must be single-valued and continuous. The converse, however, is not necessarily true.
We define elementary functions of a complex variable by a natural extension of the corresponding functions
of a real variable. Where series expansions for real functions f (x) exist, we can use as definition the series with
x replaced by z. The convergence of such complex series has already been considered in Chapter 11.
EXAMPLE 1. We define ex = 1 + z + z2
2! + z3
3! + . . . , sin z = z − z3
3! + z5
5! − z7
7! + . . . , and
cos z = 1 − z2
2! + z4
4! − z6
6! + . . . . From these we can show that ex = ex + iy = ex (cos y + sin y), as well as numer-
ous other relations.
Rules for differentiating functions of a complex variable are much the same as for those of real variables.
Thus, d
dz (zn ) = nzn − 1, d
dz (sin z) = cos z  and so on.
Cauchy-Riemann Equations
A necessary condition that w = f (z) = u(x, y) + iυ(x, y) be analytic in a region ℜ is that u and υ satisfy the
Cauchy-Riemann equations
∂u
∂x = ∂υ
∂y , ∂u
∂y =− ∂υ
∂x
 (2)
(see Problem 16.7). If the partial derivatives in Equations (2) are continuous in ℜ , the equations are sufficient
conditions that f (z) be analytic in ℜ.
If the second derivatives of u and υ with respect to x and y exist and are continuous, we find by differentiat-
ing Equations (2) that
∂2u
∂x2 = ∂2u
∂y2 = 0, ∂2υ
∂x2 + ∂2υ
∂y2 = 0  (3)
Thus, the real and imaginary parts satisfy Laplace’s equation in two dimensions. Functions satisfying
Laplace’s equation are called harmonic functions.
Integrals
Let f (z) be defined, single-valued, and continuous in a region ℜ. We define the integral of of f(z) along some
path C in ℜ from point z 1 to point z2, where z1 = x1 + iy1, z2 = x2 + iy 2, as
f (z) dz = (u + iυ )( dx + id y) = ud x
(x1 , y1 )
(x2 , y2 )
∫(x1 , y1 )
(x2 , y2 )
∫c∫ −υ dy + i υ dx + ud y
(x1 , y1 )
(x2 , y2 )
∫


## Page 418

CHAPTER 16  Functions of a Complex Variable 407
With this definition, the integral of a function of a complex variable can be made to depend on line integrals
for real functions already considered in Chapter 10. An alternative definition based on the limit of a sum, as
for functions of a real variable, can also be formulated and turns out to be equivalent to the one aforemen-
tioned.
The rules for complex integration are similar to those for real integrals. An important result is
f (z) dz
c∫ ≤ f (z) dz
c∫ ≤ Md s = ML
c∫  (4)
where M is an upper bound of ⏐f (z)⏐ on C; i.e., ⏐f (z)⏐ < M, and L is the length of the path C.
Complex function integral theory is one of the most esthetically pleasing constructions in all of mathemat-
ics. Major results are outlined as follows.
Cauchy’s Theorem
Let C be a simple closed curve. If f (z) is analytic within the region bounded by C as well as on C, then we
have Cauchy’s theorem that
f (z) dz ≡
c∫ Fc
f (z) dz = 0  (5)
where the second integral emphasizes the fact that C is a simple closed curve.
Expressed in another way, Equation (5) is equivalent to the statement that f (z) dz
z1
z2
∫ has a value inde-
pendent of the path joining z 1 and z2. Such integrals can be evaluated as F(z 2) −F(z1), where F ′(z) = f(z).
These results are similar to corresponding results for line integrals developed in Chapter 10.
EXAMPLE. Since f (z) = 2z is analytic everywhere, we have for any simple closed curve C
Fc
2zd z= 0
Also,
2zd z= z2
2i
1 + i
∫
2i
1 + i
= (1+ i)2 (2i)2 = 2i + 4
Cauchy’s Integral Formulas
If f (z) is analytic within and on a simple closed curve C and a is any point interior to C, then
f (a) = 1
2π i FC
f (z)
z − a dz  (6)
where C is traversed in the positive (counterclockwise) sense.
Also, the nth derivative of f(z) at z = a is given by
f (n) (a) = n!
2π i FC
f (z)
(z − a)n + 1 dz  (7)
These are called Cauchy’s integral formulas. They are quite remarkable because they show that if the
function f (z) is known on the closed curve C then it is also known within C, and the various derivatives at
points within C can be calculated. Thus, if a function of a complex variable has a first derivative, it has all
higher derivatives as well. This, of course, is not necessarily true for functions of real variables.


## Page 419

CHAPTER 16  Functions of a Complex Variable408
Taylor’s Series
Let f (z) be analytic inside and on a circle having its center at z = a. Then for all points z in the circle we have
the Taylor series representation of f(z) given by
f (z) = f (a) + f ′(a)( z − a) + f ′′(a)
2! (z − a)2 + f ′′′(a)
3! (z − a)3 + . . . (8)
See Problem 16.21.
Singular Points
A singular point of a function f (z) is a value of z at which f (z) fails to be analytic. If f (z) is analytic every-
where in some region except at an interior point z = a, we call z = a an isolated singularity of f(z).
EXAMPLE. f (z) = 1
(z − 3)2 ,  then z = 3 is an isolated singularity of f (z).
EXAMPLE. The function f (z) = sin z
z
has a singularity at z = 0. Because lim
z→ 0
lim is finite, this singularity is
called a removable singularity.
Poles
If f (z) = φ(z)
(z − a)n , φ(a) ≠ 0, where φ(z)  is analytic everywhere in a region including z = a, and if n is a posi-
tive integer, then f (z) has an isolated singularity at z = a, which is called a pole of order n. If n = 1, the pole
is often called a simple pole; if n = 2, it is called a double pole, and so on.
Laurent’s Series
If f (z) has a pole of order n at z = a but is analytic at every other point inside and on a circle C with center at
a, then (z – a)n f (z) is analytic at all points inside and on C and has a Taylor series about z = a so that
f (z) = a− n
(z − a)n +
a− n +1
(z − a)n − 1 + . . . + a−1
z − a + a0 + a1 (z − a) + a2 (z − a)2 + . . . (9)
This is called a Laurent series for f (z). The part a0 + a1 (z – a) + a2(z – a)2 + . . . is called the analytic part.
while the remainder consisting of inverse powers of z – a is called the principal part. More generally, we
refer to the series ak (z − a)k
k =− ∞
∞
∑ as a Laurent series, where the terms with k < 0 constitute the principal part.
A function which is analytic in a region bounded by two concentric circles having center at z = a can always
be expanded into such a Laurent series (see Problem 16.92).
It is possible to define various types of singularities of a function f(z) from its Laurent series. For example,
when the principal part of a Laurent series has a finite number of terms and a–n /HS11005 0 while a–n –1, a–n –2, . . . are
all zero, then z = a is a pole of order n. If the principal part has infinitely many terms, z = a is called an es-
sential singularity or sometimes a pole of infinite order.
EXAMPLE. The function 1/
2
111
2!
ze z z
=+ + +  . . . has an essential singularity at z = 0.


## Page 420

CHAPTER 16  Functions of a Complex Variable 409
Branches and Branch Points
Another type of singularity is a branch point. These points play a vital role in the construction of single-
valued functions from ones that are multiple-valued, and they have an important place in the computation of
integrals.
In the study of functions of a real variable, domains were chosen so that functions were single-valued.
This guaranteed inverses and removed any ambiguities from differentiation and integration. The applications
of complex variables are best served by the approach illustrated here. It is in the realm of real variables and
yet illustrates a pattern appropriate to complex variables.
Let y
2 = x, x < 0, then y = ± x . In real variables, two functions f1 and f2 are described by y = + x  on
x > 0 and y = – x  on x > 0, respectively. Each of them is single-valued.
An approach that can be extended to complex variables results by defining the positive xaxis (not includ-
ing zero) as a cut in the plane. This creates two branches f1 and f2 of a new function on a domain called the
Riemann axis. The only passage joining the spaces in which the branches f1 and f2, respectively, are defined
is through 0. This connecting point, zero, is given the special name branch point. Observe that two points x*
in the space of f
1 and x** in that of f 2 can appear to be near each other in the ordinary view but, from the
Riemannian perspective, are not. (See Figure 16.1.)
Figure 16.1
The preceding real variables construction suggests one for complex variables illustrated by w = z1/2.
In polar coordinates, e2πi = 1; therefore, the general representation of w = z1/2 in that system is w = ρ1/2 ei(θ + 2πk)/2,
k = 0, 1.
Thus, this function is double-valued.
If k = 0, then w
1 = ρ1/2 · eiθ/2, 0 < θ≤  2π, ρ > 0
If k = 1, then w2 = ρ1/2 · ei(θ+ 2 π)/2 = ρ1/2 · eiθ/2eiπ ,2ρπ θ π ρ1/2=− < ≤4 , >0 .
Thus, the two branches of w are w1 and w2, where w1 = –w2. (The double-valued characteristic of w is il-
lustrated by noticing that as z traverses a circle, C: ⏐z⏐ = ρ through the values /H9280 to 2π; the functional values
run from ρ 1/2 ei/H9280/2 to ρ 1/2eπi. In other words, as z navigates the entire circle, the range variable only moves
halfway around the corresponding range circle. In order for that variable to complete the circuit, z would
have to make a second revolution. Thus, we would have coincident positions of z giving rise to distinct values
of w. For example, z1 = e(π/2)i are and z2 = e(π/2 + 2π)i  are coincident points on on the unit circle. The distinct
functional values are z1
1/2 = 2
2 (1+ i)a n d z2
1/2 =− 2
2 (1+ i).
The following abstract construction replaces the multiple-valued function with a new single-valued one.
Make a cut in the complex plane that includes all of the positive x axis except the origin. Think of two
planes P
1 and P2, the first one of infinitesimal distance above the complex plane and the other infinitesimally
below it. The point 0 which connects these spaces is called a branch point. The planes and the connecting
point constitute a Riemann surface, and w
1 and w2 are the branches of the function each defined in one of the
planes. (Since the space of complex variables is the complex plane, this Riemann surface may be thought of
as a flight of fancy that supports a rigorous analytic construction.)


## Page 421

CHAPTER 16  Functions of a Complex Variable410
To visualize this Riemann surface and perceive the single-valued character of the new function in it, first
think of duplicates C1 and C2 of the domain circle C: ⏐z⏐ = ρ in the planes P 1 and P2, respectively. Start at
θ = /H9280 on C1, and proceed counterclockwise to the edge U2 of the cut of P1. (This edge corresponds to θ = 2π.)
Paste U2 to L1, the initial edge of the cut on P 2. Transfer to P2 through this join and continue on C 2. Now,
after a complete counterclockwise circuit of C 2, we reach the edge L 2 of the cut. Pasting L 2 to U1 provides
passage back to P1 and makes it possible to close the curve in the Riemann plane. See Figure 16.2.
Figure 16.2
Note that the function is not continuous on the positive x axis. Also, the cut is somewhat arbitrary. Other
rays and even curves extending from the origin to infinity can be employed. In many integration applications
the cut θ = πi proves valuable. On the other hand, the branch point (0 in this example) is special. If another
point, z
0 /HS11005 0, were chosen as the center of a small circle with radius less than ⏐z0⏐, then the origin would lie
outside it. As a point z traversed its circumference, its argument would return to the original value, as would
the value of w. However, for any circle that has the branch point as an interior point, a similar traversal of the
circumference will change the value of the argument by 2π, and the values of w
1 and w2 will be interchanged.
(See Problem 16.37.)
Residues
The coefficients in Equation (9) can be obtained in the customary manner by writing the coefficients for the
Taylor series corresponding to (z – a)
n f (z). In further developments, the coefficient a–1, called the formula
residue of f(z) at the pole z = a, is of considerable importance. It can be found from the formula
a−1 = lim
z→ a
1
(n − 1)!
dn − 1
dzn − 1 {(z − a)n f (z)}  (10)
where n is the order of the pole. For simple poles, the calculation of the residue is of particular simplicity
since it reduces to
a−1 = lim
z→ a
(z − a) f (z)  (11)
Residue Theorem
If f (z) is analytic in a region ℜ except for a pole of order n at z = a and if C is any simple closed curve in ℜ
containing z = a, then f (z) has the form of Equation (9). Integrating Equation (9), using the fact that
FC
dz
(z − a)n = 0i f n ≠ 1
2π i if n ≠ 1
⎧
⎨
⎩
 (12)
(see Problem 16.13), it follows that
FC
f (z) dz = 2π ia−1  (13)


## Page 422

CHAPTER 16  Functions of a Complex Variable 411
i.e., the integral of f (z) around a closed path enclosing a single pole of f (z) is 2πi times the residue at the
pole.
More generally, we have the following important theorem.
Theorem. If f (z) is analytic within and on the boundary C of a region ℜ except at a finite number of poles
a, b, c, . . . within ℜ, having residues a –1, b–1, c–1, . . . , respectively, then
FC
f (z) dz = 2π i (a−1 + b−1 + c−1 + . . . )  (14)
i.e., the integral of f (z) is 2π i times the sum of the residues of f (z) at the poles enclosed by C. Cauchy’s
theorem and integral formulas are special cases of this result, which we call the residue theorem.
Evaluation of Definite Integrals
The evaluation of various definite integrals can often be achieved by using the residue theorem together with
a suitable function f (z) and a suitable path or contour C, the choice of which may require great ingenuity.
The following types are most common in practice.
 1. F(x) dx, F(x)
0
∞
∫  is an even function.
Consider FC
F(z) dz  along a contour C consisting of the line along the x axis from –R to +R and the
semicircle above the x axis having this line as diameter. Then let R → /H11009. See Problems 16.29 and
16.30.
 2. G(sin θ,c o sθ) dθ, G
0
2π
∫ is a rational function of sin θ and cos θ.
Let z = eiθ. Then sin θ= z − z−1
2i ,c o sθ= z + z−1
2 and dz = ieθ dθ or dθ = dz/iz. The given integral is
equivalent to FC
F(z) dz,  where C is the unit circle with center at the origin. See Problems 16.31 and
16.32.
 3. F(x) cos mx
sin mx
⎧
⎨
⎩
⎫
⎬
⎭−∞
∞
∫ dx, F(x) is a rational function.
Here we consider FC
F(z)eimz dz , where C  is the same contour as that in Type 1. See Problem
16.34.
 4. Miscellaneous integrals involving particular contours. See Problems 16.35 and 16.38. In particular,
Problem 16.38 illustrates a choice of path for an integration about a branch point.
SOLVED PROBLEMS
Functions, limits, continuity
16.1. Determine the locus represented by (a) ⏐z – 2⏐ = 3, (b) ⏐z – 2⏐ = ⏐z + 4⏐, and (c) ⏐z –3⏐ + ⏐z + 3⏐ = 10.
(a) Method 1: z − 2 = x + iy − 2 = x − 2 + iy = (x − 2)2 + y2 = 3o r( x − 2)2 + y2 = 9, a circle with
center at (2, 0) and radius 3.
Method 2: ⏐z – 2⏐ is the distance between the complex numbers z = x + iy and 2 + 0i. If this distance
is always 3, the locus is a circle of radius 3 with center at 2 + 0i or (2, 0).


## Page 423

CHAPTER 16  Functions of a Complex Variable412
(b) Method 1: x + iy − 2 = x + iy + 4 = or ( x − 2)2 + y2 = (x + 4)2 + y2 , Squaring, we find x = –1, a
straight line.
Method 2: The locus is such that the distances from any point on it to (2, 0) and (–4, 0) are equal. Thus,
the locus is the perpendicular bisector of the line joining (2, 0) and (–4, 0), or x = –1.
(c) Method 2: The locus is given by (x − 3)
2 + y2 + (x + 3)2 + y2 = 10 or (x − 3)2 + y2
= 10 − (x + 3)2 + y2 . Squaring and simplifying, 25 + 3x = 5( x + 3)2 + y2 . Squaring and simplifying
again yields x2
25 + y2
16 = 1, an ellipse with semimajor and semiminor axes of lengths 5 and 4, respec-
tiv
ely.
Method 2: The locus is such that the sum of the distances from any point on it to (3, 0) and (–3, 0) is
10. Thus, the locus is an ellipse whose foci are at (–3, 0) and (3, 0) and whose major axis has length 10.
16.2. Determine the region in the z plane represented by each of the following.
(a) ⏐z⏐ < 1.
Interior of a circle of radius 1. See Figure 16.3(a).
(b) 1 < ⏐z + 2i⏐
<  2.
 ⏐z + 2i⏐ is the distance from z to –2i, so that ⏐z + 2i⏐ = 1 is a circle of radius 1 with center at –2i; Then
1 < ⏐ z + 2i⏐ <  2 represents the region exterior to ⏐z + 2i⏐ = 1 but interior to or on ⏐z + 2i⏐ = 2. See
Figure 16.3(b).
(c) π/3 < arg z < π/2.
Note that argz = φ, where z = ρeiφ. The required region is the infinite region bounded by the lines φ = π/3
and φ = π/2, including these lines. See Figure 16.3(c).
Figure 16.3
16.3. Express each function in the form u(x, y) + iυ(x, y), where u and υ are real: (a) z 3, (b) 1/(1 – z), (c) e3z, and
(d) ln z.
(a) w = z3  = (x + iy)3 = x3 + 3x2(iy) + 3x(iy)2 + (iy3 = x3 + 3ix2y – 3xy2 – iy2
= x3 – 3xy2 + i(3x2y – y3)
Then u(x, y) = x3 – 3xy2, υ(x, y) = 3x 3x2y – y3.
(b) w = 1
1 − z = 1
1 − (x + iy) = 1
1 − x − iy ⋅1 − x + iy
1 − x + iy = 1 − x + iy
(1− x)2 + y2
Then u(x, y) = 1 − x
(1− x)2 + y2 , υ (x, y) = y
(1− x)2 + y2 .


## Page 424

CHAPTER 16  Functions of a Complex Variable 413
(c) e3z = e3(x + iy) = e3x = e3x e3iy = e3x (cos 3y + i sin 3y) and u = e3x cos 3y, υ = e3x sin 3y
(d) ln z = ln(ρeiφ ) = ln ρ + iφ= ln x2 + y2 + i tan−1 y / x and
u = 1
2
 ln (x2 + y2 ), υ= tan−1 y / x
Note that In z is a multiple-valued function (in this case it is infinitely many-valued), since φ can be in-
creased by any multiple of 2π. The principal value of the logarithm is defined as that value for which 0 < φ
< 2π and is called the principal branch of In z.
16.4. Prove (a) sin(x + iy) = sin x cosh y + i cos x sinh y and (b) cos(x + iy) = cos x cosh y – i sin x sinh y.
We use the relations eix = cos z + i sin z, e–ix = cos z – i sinz, from which
sin z = eiz − e−iz
2i ,c o s z = eiz + e−iz
2
Then
sin z = sin (x + iy) = ei(x + iy) − e−i(x + iy)
2i = eix − y − e−ix + y
2i
= 1
2i {e− y (cos x + i sin x) − ey (cos x − i sin x)}
= (sin x) ey + e− y
2
⎛
⎝⎜
⎞
⎠⎟ + i (cos x) ey − e− y
2
⎛
⎝⎜
⎞
⎠⎟
= sin x cosh y + i cos x sinh y
Similarly,
cos z = cos(x + iy) = ei(x + iy) + e−i(x + iy)
2
= 1
2 {eix − y + e−ix + y } = 1
2
{e− y (cos x + i sin x) + ey (cos x − i sin x)}
= (cos x) ey + e− y
2
⎛
⎝⎜
⎞
⎠⎟ − i (sin x) ey − e− y
2
⎛
⎝⎜
⎞
⎠⎟ = cos x cosh y − i sin x sinh y
Derivatives, cauchy-riemann equations
16.5. Prove that d
dz z , where z  is the conjugate of z, does not exist anywhere.
By definition, d
dz f (z) = lim
Δ z→ 0
f (z +Δ z) − f (z)
Δ z
 if this limit exists independent of the manner in which
Δ z = Δx + i Δy approaches zero. Then
d
dz z = lim
Δ z→ 0
z +Δ z − z
Δ z = lim
Δ x→ 0
Δ y→ 0
x + iy +Δ x + i Δ y − x + iy
Δ x + i Δ y
= lim
Δ x→ 0
Δ y→ 0
x − iy +Δ x + i Δ y − (x − iy)
Δ x + i Δ y = lim
Δ x→ 0
Δ y→ 0
Δ x − i Δ y
Δ x + i Δ y
If Δy = 0, the required limit is lim
Δ x→ 0
Δ x
Δ x = 1.
If Δx = 0, the required limit is lim
Δ y→ 0
−i Δ y
i Δ y =− 1.
These two possible approaches show that the limit depends on the manner in which Δz → 0, so that the
derivative does not exist; i.e., z  is nonanalytic anywhere.


## Page 425

CHAPTER 16  Functions of a Complex Variable414
16.6. (a) If w = f (z) = 1 + z
1 − z ,f i n ddw
dz . (b) Determine where w is nonanalytic.
(a) Method 1: dw
dz = lim
Δ z→∞
1 + (z +Δ z)
1 − (z +Δ z) − 1 + z
1 − z
Δ z = lim
Δ z→ 0
2
(1− z −Δ z)( 1− z)
= 2
(1− z)2
provided z /HS11005 1, independent of the manner in which Δz→ 0.
 Method 2: The usual rules of differentiation apply provided z /HS11005 1. Thus, by the quotient rule for dif-
ferentiation,
d
dz
1 + z
1 − z
⎛
⎝⎜
⎞
⎠⎟ =
(1− z) d
dz (1+ z) − (1+ z) d
dz (1− z)
(1− z)2 = (1−z)( 1 )− (1+ z)( −1)
(1− z)2 = 2
(1− z)2
(b) The function is analytic everywhere except at z = 1, where the derivative does not exist; i.e., the function
is nonanalytic at z = 1.
16.7. Prove that a necessary condition for w = f (z) = u(x, y) + i υ(x, y) to be analytic in a region is that the Cauchy-
Riemann equations ∂u
∂x = ∂υ
∂y , ∂u
∂x =− ∂υ
∂x
 be satisfied in the region.
Since f (z) = f (x + iy) = u(x, y) + i υ(x, y), we have
f (z + Δz) = f [x + Δx + i(y + Δy)] = u(x + Δx, y + Δy) + i υ(x + Δx, y + Δy)
Then
lim
Δ z→ 0
f (z +Δ z) − f (z)
Δ z
= lim
Δ x→ 0
Δ y→ 0
u(x +Δ x, y +Δ y) − u (x, y) + i {υ (x +Δ x, y +Δ y) −υ (x, y)}
Δ x + i Δ y
If Δy = 0, the required limit is
lim
Δ x→ 0
u (x +Δ x, y) − u (x, y)
Δ x + i υ (x +Δ x, y) −υ (x, y)
Δ x
⎧
⎨
⎩
⎫
⎬
⎭
= ∂u
∂x + i ∂υ
∂x
If Δx = 0, the required limit is
lim
Δ y→ 0
u (x, y +Δ y) − u (x, y)
i Δ y + υ (x, y +Δ y) −υ (x, y)
Δy
⎧
⎨
⎩
⎫
⎬
⎭
= 1
i
∂u
∂y + ∂υ
∂y
If the derivative is to exist, these two special limits must be equal, i.e.,
∂u
∂x + i ∂υ
∂x = 1
i
∂u
∂y + ∂υ
∂y =− 1 ∂u
∂y + ∂υ
∂y
so that we must have ∂u
∂x = ∂υ
∂x and ∂υ
∂x =− ∂u
∂y .
Conversely, we can prove that if the first partial derivatives of u and υ with respect to x and y are con-
tinuous in a region, then the Cauchy-Riemann equations provide sufficient conditions for f (z) to be analytic.
16.8. (a) If f (z) = u(x, y) + i υ(x, y) is analytic in a region ℜ, prove that the one-parameter families of curves
u(x, y) = C1 and υ (x, y) = C2 are orthogonal families. (b) Illustrate by using f (z) = z2.
(a) Consider any two particular members of these families u(x, y) = u0, υ(x, y) = υ0 which intersect at the
point (x0, y0).


## Page 426

CHAPTER 16  Functions of a Complex Variable 415
Since du = ux dx + uy dy = 0, we have dy
dx = ux
uy
.
Also, since dυ=υ x dx +υ y dy = 0, dy
dx = υ x
υ y
.
When evaluated at (x0, y0), these represent, respectively, the slopes of the two curves at this point of inter-
section.
By the Cauchy-Riemann equations, ux = υy, uy = –υx, we have the product of the slopes at the point (x0, y0)
equal to
− ux
uy
⎛
⎝⎜
⎞
⎠⎟ − υ x
υ y
⎛
⎝⎜
⎞
⎠⎟ =− 1
so that any two members of the respective families are orthogonal, and thus the two families are orthogonal.
(b) If f (z) = z2, then u = x2 –y2, υ = 2xy. The graphs of several members of x2 –y2 = C1, 2xy = C2 are shown
in Figure 16.4.
Figure 16.4
16.9. In aerodynamics and fluid mechanics, the functions φ  and ψ  in f(z) = φ + iψ , where f(z) is analytic, are called
the velocity potential and stream function, respectively. If φ = x2 + 4x –y2 + 2y, (a) find ψ and (b) find f(z).
(a) By the Cauchy-Riemann equations, ∂φ
∂x = ∂ψ
∂y , ∂ψ
∂x =− ∂φ
∂y . Then
∂ψ
∂y = 2x + 4 (1)
∂ψ
∂x = 2x − 2 (2)
Method 1:  Integrating Equation (1), ψ = 2xy + 4y + F(x).
Integrating Equation (2), ψ = 2xy – 2x + G(y).
These are identical if F(x) = –2x + c, G(y) = 4y + c, where c is a real constant. Thus, ψ = 2xy + 4y – 2x + c.
Method 2: Integrating Equation (1), ψ  = 2xy + 4y  + F(x). Then substituting in Equation (2), 2 y + F ′(x) =
2y – 2 or F′(x) = –2 and F(x) = –2x + c. Hence, ψ = 2xy + 4y – 2x + c.
(b) From (a),
f (z) = φ + iψ = x2 + 4x – y2 + 2y + i(2xy + 4y – 2x + c)
 = (
x2 – y2 + 2ixy) + 4(x + iy) – 2i(x + iy) + ic = z2 + 4z – 2iz + c1
where c1 is a pure imaginary constant.


## Page 427

CHAPTER 16  Functions of a Complex Variable416
This can also be accomplished by noting that z = x + iy, z  = x – iy so that x = z + z
2 , y = z − z
2i .  The
result is then obtained by substitution; the terms involving z  drop out.
Integrals, Cauchy’s theorem, Cauchy’s integral formulas
16.10. Evaluate z2 dz
1 + i
2 + 4i
∫
(a) along the parabola x = t, y = t2, where 1 < t <  2
(b) along the straight line joining 1 + i and 2 + 4i
(c) along straight lines from 1 + i to 2 + i and then to 2 + 4i
We have
z2 dz
1 + i
2 + 4i
∫ = (x + iy)2 (dx + idy) = (x2 − y2 + 2 ixy)( dx + id y)
(1.1)
(2.4)
∫(1.1)
(2.4)
∫
= (x2 − y2 ) dx − 2xy dy + i 2xy dx + (x2 − y2 )
(1.1)
(2.4)
∫ dy
(1.1)
(2.4)
∫
Method 1:
(a) The points (1,1) and (2,4) correspond to t = 1 and t = 2, respectively. Then the preceding line integrals
become
{(t2 − t4 ) dt − 2(t)( t)2 2td t} + i
t = 1
2
∫ {2(t)( t2 ) dt + (t2 − t4 )( 2t) dt} =− 86
3 − 6i
t = 1
2
∫
(b) The line joining (1,1) and (2, 4) has the equation y − 1 = 4 − 1
2 − 1 (x − 1) or y = 3x − 2.  Then we find
{[x2
x = 1
2
∫ − (3x − 2)2 ] dx − 2x (3x − 2) 3 dx}
+ i {2x
x = 1
2
∫ (3x − 2) dx + [x2 − (3x − 2)2 ]3 dx} =− 86
3 − 6i
(c) From 1 + i to 2 + i [or (1, 1) to (2, 1)], y = 1, dy = 0 and we have
(x2 − 1)
x = 1
2
∫ dx + i 2
x = 1
2
∫ xd x = 4
3 + 3i
From 2 + i to 2 + 4i [or (2, 1) to (2, 4)], x = 2, dx = 0 and we have
−4yd y
y = 1
4
∫ + i (4 − y2 )
y = 1
4
∫ dy =− 30 − 9i
Adding, ( 4
3 + 3i) + (−30 − 91) =− 86
3 − 6i.
Method 2: By the methods of Chapter 10 it is seen that the line integrals are independent of the path, thus
accounting for the same values obtained in (a), (b), and (c). In such case the integral can be evaluated directly,
as for real variables, as follows:
z2 dz = z3
31+ i
2 + 4i
∫
1i
2 + 4i
= (2 + 4i)3
3 − (1+ i)3
3 =− 86
3 − 6i.
16.11. (a) Prove Cauchy’s theorem: If f (z) is analytic inside and on a simple closed curve C, then FC
f (z) dz = 0.
(b) Under these conditions prove that f (z) dz
p1
p2
∫  is independent of the path joining P1 and P2.
(a) FC
f (z) dz = FC
(u + iυ )( dx + id y) = FC
ud x −υ dy + i FC
υ dx + ud y


## Page 428

CHAPTER 16  Functions of a Complex Variable 417
By Green’s theorem (Chapter 10),
FC
ud x −υ dy =− ∂u
∂x − ∂υ
∂y
⎛
⎝⎜
⎞
⎠⎟
ℜ
∫∫ dx dy, FC
υ dx + ud y = ∂u
∂x − ∂υ
∂y
⎛
⎝⎜
⎞
⎠⎟
ℜ
∫∫ dx dy
where ℜ is the region (simply-connected) bounded by C.
Since f (z) is analytic, ∂u
∂x = ∂υ
∂y , ∂υ
∂x =− ∂u
∂y
 (Problem 16.7), and so these integrals are zero. Then
FC
f (z) dz = 0,  assuming f ′(z) (and, thus, the partial derivatives) to be continuous.
(b) Consider any two paths joining points P 1 and P2 (see Figure 16.5).
By Cauchy’s theorem,
f (z) dz = 0
P1 AP2 BP1
∫
Then
f (z) dz +
P1 AP2
∫ f (z) dz = 0
P2 BP1
∫
or
f (z) dz =−
P1 AP2
∫ f (z) dz =
P2 BP1
∫ f (z) dz
P1 BP2
∫
i.e., the integral along P1AP2 (path 1) = integral along P1BP2 (path 2), and so the integral is independent of the
path joining P1 and P2.
This explains the results of Problem 16.10, since f (z) = z2 is analytic.
16.12. If f (z) is analytic within and on the boundary of a region bounded
by two closed curves C1 and C2 (see Figure 16.6), prove that
FC
f (z) dz =
1
FC2
f (z) dz
As in Figure 16.6, construct line AB (called a crosscut) con-
necting any point on C2 and a point on C1. By Cauchy’s theorem
(Problem 16.11),
f (z) dz = 0
AQPABRSTBA
∫
since f (z) is analytic within the region shaded and also on the bound-
ary. Then
f (z) dz +
AQPA
∫ f (z) dz +
AB
∫ f (z) dz +
BRSTB
∫ f (z) dz = 0
BA
∫  (1)
But f (z) dz =−
AB
∫ f (z) dz.
BA
∫  Hence, (1) gives
f (z) dz =−
AQPA
∫ f (z) dz =
BRSTB
∫ f (z) dz
BTSRB
∫
i.e.,
FC
f (z) dz =
C1
FC2
f (z) dz
Note that f (z) need not be analytic within curve C2.
Figure 16.5
Figure 16.6


## Page 429

CHAPTER 16  Functions of a Complex Variable418
16.13. (a) Prove that FC
dz
(z − a)n = 2π i if n = 1
0i f n = 2, 3, 4,
⎧
⎨
⎩  . . . , where C is a simple closed curve bounding a region
having z = a as interior point. (b) What is the value of the integral if n = 0, –1, –2, –3, . . . ?
(a) Let C1 be a circle of radius /H9280 having center at z = a (see Figure
16.7). Since (z – a)–n is analytic within and on the boundary of
the region bounded by C and C1, we have, by Problem 16.12,
FC
dz
(z − a)n = FC
dz
(z − a)n
1
To evaluate this last integral, note that on C1, z − a =ε
or z − a =ε eiθ and dz = iεeiθ dθ.  The integral equals
iεeiθ dθ
εn εinθ0
2π
∫ = i
εn −1 e(1− n)iθ dθ=
0
2π
∫
i
εn −1
e(1− n)iθ
(1− n)i 0
2π
= 0i f n ≠ 1
If n = 1, the integral equals id θ=
0
2π
∫ 2π i.
(b) For n = 0, –1, –2, . . . , the integrand is 1,(z – a), (z – a)2, . . . and is analytic everywhere inside C1, includ-
ing z = a. Hence, by Cauchy’s theorem, the integral is zero.
16.14. Evaluate FC
dz
z − 3,  where C is (a) the circle ⏐z⏐ = 1 and (b) the circle ⏐z + i⏐ = 4.
(a) Since z = 3 is not interior to ⏐z⏐ = 1, the integral equals zero (Problem 16.11).
(b) Since z = 3 is interior to ⏐z + i⏐ = 4, the integral equals 2πi (Problem 16.13).
16.15. If f (z) is analytic inside and on a simple closed curve C, and a is any point within C, prove that
f (a) = 1
2π i FC
f (z)
z − a dz
Referring to Problem 16.12 and Figure 16.7, we have
FC
f (z)
z − a dz = FC
f (z)
z − aC1
dz
Letting z – a = /H9280eiθ, the last integral becomes if (a +ε ei
0
2π
∫
iθ ) dθ.  But since f (z) is analytic, it is con-
tinuous. Hence,
2
0 0
lim ( ifa e
π
ε
ε
→
+∫
2
00
) lim ( idi f ae
πθθ
ε
θε
→
=+ ∫
2
0
)( ) 2 ( )i d i fad ifa
πθ θθ π== ∫
and the required result follows.
16.16. Evaluate (a) FC
cos z
z −π
dz and (b) FC
ex
z (z + 1) dz, where C is the circle ⏐z – 1⏐ = 3.
(a) Since z = π lies within C, 1
2π i FC
cos z
z −π dz = cos π=− 1 by Problem 16.15 with f (z) = cos z, a = π.
Then FC
cos z
z −π dz =− 2π i.
(b) FC
ez
z (z + 1) dz = FC
ez 1
z − 1
z + 1
⎛
⎝⎜
⎞
⎠⎟ dz = FC
ez
z dz − FC
ez
z + 1 dz
= 2π ie0 − 2π ie−1 = 2π i(1− e−1)
by Problem 16.15, since z = 0 and z = –1 are both interior to C.
Figure 16.7


## Page 430

CHAPTER 16  Functions of a Complex Variable 419
16.17. Evaluate FC
5z2 − 3z + 2
(z − 1)3 dz, where C is any simple closed curve enclosing z = 1.
Method 1: By Cauchy’s integral formula, f (n) (a) = n!
2π i FC
f (z)
(z − a)n +1 dz.
If n = 2 and f (z) = 5z2 – 3z + 2, then f ″(1) = 10. Hence,
10 = 2!
2π i FC
5z2 − 3z + 2
(z − 1)3 dz or FC
5z2 − 3z + 2
(z − 1)3 dz = 10π i
Method 2: 5z2 − 3z + 2 = 5(z − 1)2 + 7( z − 1) + 4. Then
5z2 − 3z + 2
(z − 1)3CÑ∫ dz = 5(z − 1)2 + 7(z − 1) + 4
(z − 1)3CÑ∫ dz
= 5 d
z − 1 + 7
CÑ∫
dz
(z − 1)2 + 4
CÑ∫
dz
(z − 1)3 = 5(2π i)
CÑ∫ + 7(0) + 4(0)
= 10π i
FC FC
FC FC FC
by Problem 16.13.
Series and singularities
16.18. For what values of z does each series converge?
(a) zn
n2 2n .
n = 1
∞
∑  The nth term = un = zn
n2 2n .  Then
lim
n →∞
un +1
un
= lim
n →∞
zn +1
(n + 1)2 2n +1 ⋅n2 2n
zn = z
2
By the ratio test, the series converges if ⏐z⏐ < 2 and diverges if ⏐z⏐ > 2. If ⏐z⏐ = 2, the ratio test fails.
However, the series of absolute values zn
n2 2n
n = 1
∞
∑ =
zn
n2 2n
n = 1
∞
∑  converges if ⏐z⏐ = 2, since 1
n2
n = 1
∞
∑
converges.
Thus, the series converges (absolutely) for ⏐z⏐ <  2, i.e., at all points inside and on the circle ⏐z⏐ = 2
(b) (−1)n − 1 z2n − 1
(2n − 1)! = z − z3
3! + z5
5!n = 1
∞
∑ − . . . .We have
lim
n →∞
un +1
un
= lim
n →∞
(−1)n z2n +1
(2n + 1)! ⋅ (2n − 1)!
(−1)n − 1 z2n − 1 = lim
n →∞
−z2
2n(2n + 1) = 0
Then the series, which represents sin z, converges for all values of z.
(c)
11
n+1
1
() () 3.W e h a v e l i m l i m 333 ( )
nn n
nn nn nn
u zizi zi n
u zi
∞ ++
→∞ →∞=
−−− =⋅ =
−∑ .
The series converges if ⏐z – i⏐ < 3, and diverges if ⏐z – i⏐ > 3.
If ⏐z – i⏐ = 3, then z – i = 3e iθ, and the series becomes
1n
e
∞
=
∑
inθ. This series diverges, since the nth term
does not approach zero as n → /H11009.
Thus, the series converges within the circle ⏐z – i⏐ = 3 but not on the boundary.
16.19. If
0
n
n
n
az
∞
=
∑  is absolutely convergent for ⏐z⏐ < R, show that it is uniformly convergent for these values of z.
The definitions, theorems, and proofs for series of complex numbers are analogous to those for real series.


## Page 431

CHAPTER 16  Functions of a Complex Variable420
In this case we have nn
nn naz a R M≤= . Since, by hypothesis,
1
n
n
M
∞
=
∑ converges, it follows by the
Weierstrass M test that
0
n
n
n
az
∞
=
∑  converges uniformly for ⏐z⏐ < R.
16.20. Locate in the finite z plane all the singularities, if any, of each function and name them.
(a)
2
3 .1
(1 )
z z
z
=−
+
is a pole of order 3.
(b)
3
2
21
(4 ) ( ) (1 2 )
zz
zz i zi
−+
−− − +
. z = 4 is a pole of order 2 (double pole); z = i and z = 1 – 2i are poles of
order 1 (simple poles).
(c) 2
sin ,0 .
22
mz m
zz
≠
++
 Since z 2 + 2z  + 2 = 0 when 24 8 22 122
izi −± − −±== = ± , we can write
2 2 2 {( 1) } {( 1) } ( 1) ( 1) .zz z i z iz i z i+ + = − − + − − − = +− ++
The function has the two simple poles: z = –1 + i and z = –1 – i.
(d) 1c o s .z
z
− z = 0 appears to be a singularity. However, since
0
1c o slim 0,
x
z
z→
− =  singularity.
Another method:
2461 cos 1Since 1 2! 4! 6!
zz z z
zz
⎧ ⎛− ⎪=− + − + ⎜⎨ ⎜⎪ ⎝⎩
 . . .
3
2! 4!
zz⎫⎞⎪ =− +⎟⎬⎟⎪⎠⎭
 . . . , we see that z = 0
is a removable singularity.
(e) 1/( 1)2
24
111
(1 ) 2 ! (1 )
xe
zz
−− =− + −
−−
 . . .  . This is a Laurent series where the principal part has an
infinite number of nonzero terms. Then z = 1 is an essential singularity.
(f) ez. This function has no finite singularity. However, letting z = 1/u, we obtain e1/u, which has an essential
singularity at u = 0. We conclude that z = /H11009 is an essential singularity of ez.
In general, to determine the nature of a possible singularity of f (z) at z = /H11009, we let z = /H11009, we let z = 1/u
and then examine the behavior of the new function at u = 0.
16.21. If f (z) is analytic at all points inside and on a circle of radius R with center at a, and if a + h is any point
inside C, prove Taylor’s theorem that
23
( ) () () () 2! 3!
hhfa h fa h f a f a f+ = + ′ + ′′ + ′′′(α) +  . . .
By Cauchy’s integral formula (Problem 16.15), we have
1() 2fa h iπ+= FC
()fzd z
zah−−
 (1)
By division,
2
2
11
() [ 1 / () ]
1 1() () ()
zah za h za
hh
za za za
=−− − − −
⎧⎪=+ + + ⎨−− −⎪⎩
 . . .
1
() () ( )
nn
nn
hh
za za zah
+ ⎫⎪++ ⎬−− − − ⎪⎭
 (2)
Substituting Equation (2) in Equation (1) and using Cauchy’s integral formulas, we have
21
2
()
1( ) ( ) ( )() 22 2 () ()
() () () ()2! !
n
nnCC C
n
n
n
fzd z h fzd z h fzd zfa h Riz a i iza za
hhfa h f a f a f a R n
ππ π ++= + ++ +− −−
′′ ′=+ + + + +
∫∫ ∫ L
L
ÑÑ ÑFC FC
L
L FC


## Page 432

CHAPTER 16  Functions of a Complex Variable 421
where
1
2
n
n
hR iπ
+
= FC 1
()
() ( ) n
fzd z
za zah +−− −
Now when z is on (), and ,fzCM z a Rzah ≤− =−−
 so that by Equation (4), Page 407, we have, since
2πR is the length of C,
1
1 2
2
n
n n
hMRR
R
π
π
+
+≤⋅
As n → /H11009,⏐Rn⏐ → 0. Then R n → 0, and the required result follows.
If f (z) is analytic in an annular region r1 < ⏐z – a⏐ < r2, we can generalize the Taylor series to a Laurent
series (see Problem 16.92). In some cases, as shown in Problem 16.22, the Laurent series can be obtained by
use of known Taylor series.
16.22. Find Laurent series about the indicated singularity for each of the following functions. Name the singularity
in each case and give the region of convergence of each series.
(a) 2 ; 1. Let 1 . Then 1 and
(1 )
ze zz u z u
z
=− = = +
−
1 234
22 2 2 1 2! 3! 4!(1 )
zu uee e e u u u eu
zu u u
+ ⎧⎪== ⋅ = + + + + + ⎨− ⎪⎩
 . . . ⎫⎪⎬
⎪⎭
2
2
(1 ) (1 )
12 ! 3 ! 4 !(1 )
ee e e z e z
zz
−−=+ + ++ + −−
 . . .
z = 1 is a pole of order 2, or double pole.
The series converges for all values of z /HS11005 1.
(b) 1cos ; 0.zz z =
246
11 1 1cos 1
2! 4! 6!
zz z zzz
⎛=− + − +⎜⎜⎝
 . . .
35
11 1
2! 4! 6!
z z zz
⎞ =− + − +⎟
⎟
⎠
 . . .
z = 0 is an essential singularity.
The series converges for all values of z /HS11005 0.
(c) sin ; . Let . Then andz zz u z uz ππ ππ =− = = +−
35
24 2 4
sin sin ( ) sin 1
3! 5!
() ()11 3! 5! 3! 5!
zu u u u uzu u u
uu z z
π
π
ππ
⎛⎞+== − = − − + − ⎜⎟⎜⎟− ⎝⎠
−−=− + + + =− + − +
L
LL
L
LL
z = π is a removable singularity.
The series converges for all values of z.
(d) ;(1 ) (2 )
z
zz++ 1. Let 1 . Thenzz u=− + =
234
23
2
11 (1 )( 1) ( 2) ( 1)
1 22 2 2
1 2 2 (1 ) 2 (1 )1
zu u uu u uzz u u u
uu uu
zzz
−−== − + − + −++ −
=− + − + − +
=− + − + + + −+
L
L
L
L
L
L


## Page 433

CHAPTER 16  Functions of a Complex Variable422
z = –1 is a pole of order 1, or simple pole.
The series converges for values of z such that 0 < ⏐z + 1⏐ < 1.
(e) 3
1 ;0 , 2 .
(2 )
z
zz
=−
+
Case 1, z = 0. Using the binomial theorem,
23
33
2
1 1 1 ( 3) ( 4) ( 3) ( 4) ( 5)1( 3 )82 2 ! 2 3 ! 2(2 )8 ( 1/ 2 )
133 5
81 6 1 6 3 2
zz z
zzz z z
zzz
⎧⎫ −− −−−⎪⎪ ⎛⎞ ⎛⎞ ⎛⎞== + − + + +⎨⎬ ⎜⎟ ⎜⎟ ⎜⎟++ ⎝⎠ ⎝⎠ ⎝⎠⎪⎪⎩⎭
=−+ − +
L
L
L
L
z = 0 is a pole of order 1, or simple pole.
The series converges for 0 < ⏐z⏐ < 2.
Case 2, z = –2. Let z + 2 = u. Then
234
33 3 3
32
32
11 1 1 1 22 2 2( 2) ( 2) 2 (1 / 2) 2
11 1 1 1
81 6 3 224
11 1 1 1 (2 )8( 2) 16 322( 2) 4( 2)
uu u u
zz u u u u u
uuuu
zzzz
⎧⎫⎪⎪ ⎛⎞ ⎛⎞ ⎛⎞== = − + + + + + ⎨⎬ ⎜⎟ ⎜⎟ ⎜⎟+− − − ⎝⎠ ⎝⎠ ⎝⎠⎪⎪⎩⎭
=− − − − − −
=− − −− − − + − +++
L
L
L
L
LL
L
z = –2 is a pole of order 3.
The series converges for 0 < ⏐z + 2⏐ < 2.
Residues and the residue theorem
16.23. Suppose f (z) is analytic everywhere inside and on a simple closed curve C except at z = a, which is a pole of
order n. Then
1
1()
()()
nn
nn
aafz
za za
−+−
−=+ +
−−
 . . . 2
01 2 () ()aa z a a z a++ − + − +  . . .
where a–n /HS11005 0. Prove that
(a) FC 1() 2fzd z i a π −=
(b)
1
1 1
1lim {( ) ( )}(1 ) !
n
n
nza
daz a f zn dz
−
− −→
=− −
(a) By integration, we have, on using Problem 16.13,
21
01 2
1
() { ( ) ( ) )
()
2
n
nCC C C
a af z dz dz dz a a z a a z a dzzaza
iaπ
− −
−
=+ + + + − + − +−−
=
∫∫ ∫ ∫ LLÑÑ Ñ ÑFC FC FC FC
LL
Since only the term involving a–1 remains, we call a–1 the residue of f(z) at the pole z = a.
(b) Multiplication by (z – a) n gives the Taylor series
1() ( ) ()n
nnza f z a a za −− +−= + − +  . . . 1
1 () naz a −
−+− +  . . .
Taking the (n – 1)st derivative of both sides and letting z→ a, we find
1
1 1( 1)! lim {( ) ( )}
n
n
nza
dna z a f z
dz
−
− −→
−= −
from which the required result follows.


## Page 434

CHAPTER 16  Functions of a Complex Variable 423
16.24. Determine the residues of each function at the indicated poles.
(a)
2
2 ;2 , , .
(2 ) ( 1 )
z ii
zz
−
−+
 These are simple poles. Then:
2
22
4Residue at 2 is lim ( 2) 5(2 ) ( 1 )z
zzz
zz→
⎧⎫⎪⎪=− = ⎨⎬ −+⎪⎪⎩⎭
22 12Residue at is lim ( ) ( 2 )( )( ) ( 2 )( 2) 1 0zi
zi izi zi zz i z i i i→
⎧⎫ −⎪⎪=− = = ⎨⎬ −− + −⎪⎪
⎩⎭ 22 12Residue at is lim ( ) ( 2 )( )( ) ( 2 )( 2) 1 0zi
zi izi z i zz i z i i i→−
⎧⎫ +⎪⎪=− + = = ⎨⎬ −− + − − −⎪⎪
⎩⎭
(b) 3
1 ;0 , 2
(2 )
z
zz
=−
+
. z = 0 is a simple pole, z = –2 is a pole of order 3. Then:
Residue at 0 isz = 30
11lim 8(2 )z
z
zz→
⋅=
+
2
3
232
11Residue at 2 is lim ( 2) 2! (2 )z
dzz
dz z z→−
⎧⎫⎪⎪=− + ⋅ ⎨⎬ +⎪⎪⎩⎭
2
2322
11 1 21lim lim22 8zz
d
zdz z→− →−
⎛⎞⎛⎞== = −⎜⎟⎜⎟⎝⎠ ⎝⎠
Note that these residues can also be obtained from the coefficients of 1/z and 1/(z + 2) in the respective
Laurent series [see Problem 16.22(e)].
(c) 2 ;3 ,
(3 )
ztze z
z
=
−
 a pole of order 2 or double pole. Then:
2
233 3
33
Residue is lim ( 3) lim ( ) lim ( )
(3 )
3
zt
zt zt zt
zz z
tt
dz e dzz e e ztedz dzz
et e
→→ →
⎧⎫⎪⎪ −⋅ = = +⎨⎬ −⎪⎪⎩⎭
=+
(d) cot z; z = 5π, a pole of order 1. Then:
()55 5 5
cos 5 1Residue is lim ( 5 ) lim lim cos lim ( 1)sin sin coszz z z
zzzz zz zππ π π
ππ
→→ → →
−⎛⎞ ⎛ ⎞−⋅ = = −⎜⎟ ⎜ ⎟⎝⎠ ⎝ ⎠
where we have used L’Hospital’s rule, which can be shown to be applicable for functions of a complex vari-
able.
16.25. If f (z) is analytic within and on a simple closed curve C except at a number of poles a, b, c, . . . interior to C,
prove that
FC
() 2f z dz i π = {sum of residues of f (z) at poles a, b, c, etc.}
Refer to Figure 16.8.
By reasoning similar to that of Problem 16.12 (i.e., by con-
structing crosscuts from C to C1, C2, C3, etc.), we have
FC
()fzd z = FC1
()fzd z + FC2
()fzd z + . . .
For pole a,
()
()
m
m
afz
za
− +
−
 . . . 1
01 ()()
a aa z aza
−++ + − +−
 . . .
Figure 16.8


## Page 435

CHAPTER 16  Functions of a Complex Variable424
hence, as in Problem 16.23,
FC1
1() 2fzd z i a π −=
Similarly for pole b,
()
()
n
n
bfz
zb
−=+
−
 . . . 1
01 ()()
b bb z bzb
−++ + − +−
 . . .
so that
FC2
1() 2
C
fzd z i b π −=
Continuing in this manner, we see that
FC2
11() 2 (
C
f z dz i a b π −−=+ +  . . . ) 2 (sum of residues)iπ =
16.26. Evaluate FC 2(1 ) (3 )
zed z
zz−+
, where C is given by (a) ⏐z⏐ = 3/2 and (b) ⏐z⏐ = 10.
 Residue at simple pole z = 1 is
2
21
lim ( 1) 16(1 ) (3 )z
eez
zz→
⎧⎫⎪⎪ −=⎨⎬ −+⎪⎪⎩⎭
 Residue at double pole z = –3 is
3
2
2233
(1 ) 5lim ( 3) lim 16(1 ) (3 ) (1 )
zz z
zz
dez e e ezdz zz z
−
→− →−
⎧⎫ −− −⎪⎪ += =⎨⎬ −+ −⎪⎪
⎩⎭(a) Since ⏐z⏐ = 3/2 encloses only the pole z = 1,
the required integral 2 16 8
ei ei ππ ⎛⎞== ⎜⎟⎝⎠
(b) Since ⏐z⏐ = 10 encloses both poles z = 1 and z = –3,
the required integral
335( 5 )2 16 16 8
ee i e ei ππ
−−⎛⎞ −=− = ⎜⎟⎜⎟⎝⎠
Evaluation of definite integrals
16.27. If f () f o r R ek
Mzz
R
≤= iθ, where k > 1 and M are constants, prove that lim ( ) 0
R
fzd z
→∞ Γ
=∫ , where Γ is
the semicircular arc of radius R shown in Figure 16.9.
By the result (4), Page 407, we have
1() () kk
MMf z dz f z dz R
RR
ππ −ΓΓ
≤≤ ⋅ +∫∫
since the length of arc L = πR. Then
lim ( ) 0
R
fzd z
Γ
→∞
=∫
and so
lim ( ) 0
R
fzd z
→∞ Γ
=∫
16.28. Show that for z = Re iθ, () , 1 k
Mfz k
R
≤>  if 4
1() .
1
fz
z
=
+
If Rez = iθ
44 4 444
11 1 2,( )
11 1i ifz
Re R R Reθ θ=≤= ≤
+− −iθ iθ  if R is large enough (R > 2, for ex-
ample) so that M = 2, k = 4.
Figure 16.9


## Page 436

CHAPTER 16  Functions of a Complex Variable 425
Note that we have made use of the inequality ⏐z1 + z2⏐ ε ⏐z1⏐ – ⏐z2⏐ with z1 = R4 e4iθ and z2 = 1.
16.29. Evaluate 40
.
1
dx
x
∞
+∫
Consider FC 4 ,
1
dz
z +
 where C is the closed contour of Problem 16.27 consisting of the line from –R to R
and the semicircle Γ, traversed in the positive (counterclockwise) sense.
Since z4 + 1 = 0 when z = eπi/4, e3πi/4, e5πi/4, e7πi/4, these are simple poles of 1/(z4 + 1). Only the poles eπi/4
and e3πi/4 lie within C. Then, using L’Hospital’s rule,
/4
/4
3/ 4
3/ 4
/4 /4
4
3/ 4
3
3/ 4 3/ 4
4
9/ 4
3
1Residue at lim ( )
1
11lim 44
1Residue at lim ( )
1
11lim 44
i
i
i
i
ii
ze
i
ze
ii
ze
i
ze
ez e
z
e
z
ez e
z
e
z
π
π
π
π
ππ
π
ππ
π
→
−
→
→
−
→
⎧⎫⎪⎪=− ⎨⎬ +⎪⎪⎩⎭
==
⎧⎫⎪⎪=− ⎨⎬ +⎪⎪⎩⎭
==
Thus,
FC
3/ 4 9/ 4
4
11 22 44 21
iidz ie e
z
ππ ππ −−⎧⎫=+ = ⎨⎬+ ⎩⎭
 (1)
i.e.,
44
2
211
R
R
dx dz
xz
π
−Γ
+=
++∫∫  (2)
Taking the limit of both sides of Equation (2) as R → /H11009 and using the results of Problem 16.28, we have
44
2lim 211
R
R R
dx dx
xx
π∞
→∞ −− ∞
==
++∫∫
Since 44 0
,
11
dx dx
xx
∞∞
−∞
=
++∫∫  the required integral has the value 2 .4
π
16.30. Show that
2
22 2
7 .50(1 ) (2 2 )
xd x
xx x
π∞
−∞
=
++ +∫
The poles of
2
22 2(1 ) (2 2 )
z
zz z++ +
, enclosed by the contour C in Problem 16.27, are z = i of order 2
and z = – 1 + i of order 1.
2
2
22 2
91 2Residue at is lim ( ) 100() () ( 2 2 )zi
dz izi zi dz zi zi z z→
⎧⎫ −⎪⎪=− =⎨⎬ +− + +⎪⎪
⎩⎭
Residue at
2
221
341 is lim ( 1 ) 25(1 ) ( 1 ) ( 1 )zi
zizi z i
zz i z i→− +
−=− + + − =
++ − + +
Then
FC
2
22 2
91 23 4 72 100 25 50(1 ) (2 2 )
zd z i ii
zz z
ππ⋅− −⎧⎫=+ = ⎨⎬++ + ⎩⎭
or
22
22 2 2 2 2
7
50(1 ) (2 2 ) (1 ) (2 2 )
R
R
xd x zd z
xx x zz z
π
−Γ
+=
++ + ++ +∫∫


## Page 437

CHAPTER 16  Functions of a Complex Variable426
Taking the limit as R → /H11009 and noting that the second integral approaches zero, by Problem 16.27, we
obtain the required result.
16.31. Evaluate
2
0
.53 s i n
dπ θ
θ +∫
Let z = eiθ. Then
1
sin , so that22
ii
iee z z dz ie d iz dii
θθ
θθθ θ
−−−−== = =
iθiθ
iθ
2
0 53 s i n
dπ θ
θ =+∫ FC 1
/
53 2
dz iz
zz
i
− =
⎛⎞ −+ ⎜⎟⎜⎟⎝⎠
FC 2
2
31 0 3
dz
zi z+−
where C is the circle of unit radius with center at the origin, as shown in Figure
16.10.
The poles of 2
2
31 0 3zi z+−
 are the simple poles
10 100 36
6
10 8
6
3, /3 .
iz
ii
ii
−± − +=
−±=
=− −
Only –i/3 lies inside C.
Residue at 2/2 /2
22 1/ 3 lim lim3 6 10 431 0 3zi zi
iiz zi izi z→→
⎛⎞⎛⎞−= + = =⎜⎟⎜⎟ ⎜⎟ ++−⎝⎠ ⎝⎠
Then FC 2
21 2, 4231 0 3
dz i izi z
ππ ⎛⎞== ⎜⎟+− ⎝⎠
 the required value.
16.32. Show that
2
0
cos3 .54 c o s 1 2d
π θπ θθ =−∫
13 3 3 3
If , cos , cos3 , .22 2
ii
i zz e e z zz e dz iz d
θθ
θ θθ θ
−− −++ +== = = =
Then
332
10
6
3
cos3 ( ) / 2
54 c o s
54 2
11
2 (2 1) ( 2)
C
C
zz d zd izzz
z dzi zz z
π θ θθ
−
−
+=− ⎛⎞ +− ⎜⎟⎜⎟⎝⎠
+=−
−−
∫∫
∫
Ñ
Ñ
FC
FC
where C is the contour of Problem 16.31.
The integrand has a pole of order 3 at z = 0 and a simple pole z = 1
2  within C.
26
3
230
11 2 1Residue at 0 is lim .2! 8(2 1) ( 2)z
dzzz
dz z z z→
⎧⎫ +⎪⎪=⋅= ⎨⎬ −−⎪⎪⎩⎭
6
31/2
11 1 6 5Residue at is lim ( ) .22 2 4(2 1) ( 2)z
zzz
zz z→
⎧⎫ +⎪⎪=− ⋅ = ⎨⎬ −−⎪⎪
⎩⎭1Then 2i− FC
6
3
1 1 21 65(2 ) as required.2 8 24 12(2 1) ( 2)C
z dz i izz z
ππ+ ⎧⎫=− − =⎨⎬−− ⎩⎭
Figure 16.10


## Page 438

CHAPTER 16  Functions of a Complex Variable 427
16.33. If () f o r , i
k
Mfz z R e
R
θ≤=  where k > 0 and M are constants, prove that
lim ( ) 0imz
R
ef z d z
→∞ Γ
=∫
where Γ is the semicircular arc of the contour in Problem 16.27 and m is a positive constant.
0
If , ( ) ( ) .
iii m z i m R e i izR e e f z d z e f R e i R e d
θπθθ θ θ
Γ
== ∫∫
iθ iθ iθiθ
Then
00
cos sin
0
sin
0
/2sin sin
11 00
() ()
()
()
2
iiimRe i i imRe i i
imR m R i i
mR i
mR mr
kk
ef R e i R e d ef R e i R e d
ef Re i Re d
ef R e R d
MM ed e d
RR
θθππ θθ θθ
π θθ θ θ
π θθ
ππ θθ
θθ
θ
θ
θθ
−
−
−−
−−
≤
=
=
≤=
∫∫
∫
∫
∫∫
iθ
iθ iθ
iθ
iθiθiθ iθiθ
Now sinθε 2θ/π for 0 < θ < π/2 (see Problem 4.73). Then the last integral is less than or equal to
/2 2/
1 0
2 (1 )mR mR
kk
MM ed e
Rm R
π θπ πθ−−
− =−∫
As R → /H11009, this approaches zero, since m and k are positive, and the required result is proved.
16.34. Show that 20
cos ,0 .21
mmx dx e m
x
π∞ −=>
+∫
Consider FC 2 1
imze dz
z +
, where C is the contour of Problem 16.27.
The integrand has simple poles at z = ±i, but only z = i lies within C.
Residue at is lim ( ) .() () 2
imz m
zi
eezi zi zizi i
−
→
⎧⎫⎪⎪=− = ⎨⎬ −+⎪⎪⎩⎭
Then
FC 2 2 21
imz m
mee dz i e iz
ππ
−
−⎛⎞== ⎜⎟⎜⎟+ ⎝⎠
or
22 11
imx imzR m
R
ee dx dz e
xz
π −
−Γ
+=
++∫∫
i.e.,
22 2
cos sin
11 1
imzRR m
RR
mx mx edx i dx dz e
xx z
π −
−− Γ
++ =
++ +∫∫ ∫
and so
220
cos2
11
imzR mmx edx dz e
xz
π −
Γ
+=
++∫∫
Taking the limit as R → /H11009 and using Problem 16.33 to show that the integral around Γ approaches zero,
we obtain the required result.
16.35. Show that
0
sin .2
x dxx
π∞
=∫


## Page 439

CHAPTER 16  Functions of a Complex Variable428
The method of Problem 16.34 leads us to consider the integral of eiz/z around the contour of Problem 16.27.
However, since z = 0 lies on this path of integration and since we cannot integrate through a singularity, we modify
that contour by indenting the path at z = 0, as shown in Figure 16.11, which we call contour C′ or ABDEFGHJA.
Figure 16.11
Since z = 0 is outside C′, we have
0
iz
C
e dzz′
=∫
or
0
ix iz ix izrR
Rr
HJA BDEFG
ee e edx dz dx dzxz x z
−
−
+++ =∫∫ ∫ ∫
Replacing x by –x in the first integral and combining with the third integral, we find
0
ix ix iz izR
r
HJA BDEFG
ee e e dx dz dzxz z
−− ++ =∫∫ ∫
or
sin2
iz ixR
r
HJA BDEFG
xe eid x d z d zxz z =− −∫∫ ∫
Let r → 0 and R → /H11009. By Problem 16.33, the second integral on the right approaches zero. The first in-
tegral on the right approaches
00
00
lim lim
i
iire
ii re
irr
e ire d ie d i
re
θ
θθ
θππ
θθ π
→→
−= − =∫∫
iθ
iθ
iθ
iθ
since the limit can be taken under the integral sign.
Then we have
0
0
sin sinlim 2 or 2
R
R r
r
xxid x i d xxx
ππ
∞
→∞
→
==∫∫
Miscellaneous problems
16.36. Let w = z2 define a transformation from the z plane (xy plane) to the w plane (uυ plane). Consider a triangle
in the z plane with vertices at A(2, 1), B(4,1), C(4, 3). (a) Show that the image or mapping of this triangle is
a curvilinear triangle in the uυ plane. (b) Find the angles of this curvilinear triangle and compare with those
of the original triangle.
(a) Since w = z2, we have u = x 2, –y2, υ = 2xy as the transformation equations. Then point A(2, 1) in the xy
plane maps into point A′ (3, 4) of the uυ plane (see Figure 16.12). Similarly, points B and C map into
points B′ and C ′, respectively. The line segments AC, BC, AB of triangle ABC map, respectively, into
parabolic segments A′C′,B′C′,A′B′ of curvilinear triangle A′B′C′ with equations as shown in Figure
16.12 (a) and (b).


## Page 440

CHAPTER 16  Functions of a Complex Variable 429
Figure 16.12
(b) The slope of the tangent to the curve 2
1
(3, 4) (3, 4)
214(1 ) at (3, 4) is .2
dum du
υυ υ=+ = = =
The slope of the tangent to the curve 2
2
(3, 4)
21 a t ( 3 , 4 ) i s 3 .dum u du
υυ=+ = = =
Then the angle θ between the two curves at A′ is given by
21
12
13 2tan 1, and = /4 11 1( 3 ) 2
mm
mmθθ π
−−== =+ ⎛⎞+ ⎜⎟⎝⎠
Similarly, we can show that the angle between A′C′ and B′C′ is π/4, while the angle between A′B′ and B′C′
is π/2. Therefore, the angles of the curvilinear triangle are equal to the corresponding ones of the given triangle. In
general, if w = f(z) is a transformation where f(z) is analytic, the angle between two curves in the z plane intersect-
ing at z = z0 has the same magnitude and sense (orientation) as the angle between the images of the two curves, so
long as f ′(z0) /HS11005 0. This property is called the conformal property of analytic functions, and, for this reason, the
transformationw = f(z) is often called a conformal transformation or conformal mapping function.
16.37. Let w = z  define a transformation from the z plane to the w plane. A point moves counterclockwise along
the circle ⏐z⏐ = 1. Show that when it has returned to its starting position for the first time, its image point
has not yet returned, but that when it has returned for the second time, its image point returns for the first
time.
Let z = eiθ. Then w = z  = eiθ/2. Let θ = 0 correspond to the starting position. Then z = 1 and w = 1 [cor-
responding to A and P in Figure 16.13(a) and (b)].
When one complete revolution in the z plane has been made, θ = 2π,z = 1, but w = eiθ/2 = eiπ = – 1, so the
image point has not yet returned to its starting position.
However, after two complete revolutions in the z plane have been made, θ = 4π, z = 1 and w = eiθ/2 = e2πi = 1,
so the image point has returned for the first time.
It follows from this that w is not a single-valued function of z but is a double-valued function of valued
function, we must restrict θ. We can, for example, choose 0 < θ < 2π, although other possibilities exist. This
represents one branch of the double-valued function w = z . In continuing beyond this interval we are on the
second branch, e.g., 2π < θ < 4π. The point z = 0 about which the rotation is taking place is called a branch
point. Equivalently, we can ensure that f(z) = z  will be single-valued by agreeing not to cross the line Ox,
called a branch line.


## Page 441

CHAPTER 16  Functions of a Complex Variable430
Figure 16.13
16.38.
1
0
Show that , 0 1.1s i n
px dx pxp
π
π
−∞
=< <+∫
Consider FC
1
.1
pz dzz
−
+
 Since z = 0 is a branch point,
choose C as the contour of Figure 16.14, where AB and
GH are actually coincident with the x axis but are shown
separated for visual purposes.
The integrand has the pole z = –1 lying within C.
Residue at z = −1 = e
πi is
1
1( 1 )
1
lim ( 1) ( ) 1
p
ip p i
z
zze e z
ππ
−
−−
→−
+= = +
Then
FC
1
(1 )21
p
piz dz iez
ππ
−
−=+
or, omitting the integrand,
(1 )2 pi
AB BDEFG GH HJA
ie ππ −++ + =∫∫∫ ∫
We thus have
11 1 2
0
() ( )
1 11
pi p i 2 i pRr
i2 irR
xR e i Re d x edx dxx Re xe
θθ ππ
θπ
θ−− −
+++ ++∫∫ ∫
iθ iθ
iθ
10 (1 )
2
() 2
1
ip i
pi
i
re ire d ie
re
θθ
π
θπ
θ π
−
−+=
+∫
iθ iθ
iθ
where we have to use z = xe2πi for the integral along GH, since the argument of z is increased by 2π in going
round the circle BDEFG.
Taking the limit as r→  0 and R→ /H11009 and noting that the second and fourth integrals approach zero, we find
12 ( 1 ) 10 (1 )
0
211
pi p p
pixe x dx dx exx
π
ππ
−− −∞ −
∞
+=++∫∫
or
1
2( 1 ) ( 1 )
0
(1 ) 21
p
ip p ixed x i ex
ππ π
−∞−−−= +∫
so that
1( 1)
2( 1 )0
22
1s in1
pp i
ip pi pi
xi e i dxxp ee e
π
ππ π
ππ π
π
−−∞
−−===+ −−∫
Figure 16.14


## Page 442

CHAPTER 16  Functions of a Complex Variable 431
SUPPLEMENTARY PROBLEMS
Functions, limits, continuity
16.39. Describe the locus represented by (a) ⏐z + 2 – 3i⏐ = 5, (b) ⏐z + 2⏐ = 2⏐z – 1⏐, and (c) ⏐z + 5⏐ – ⏐z – 5⏐ = 6.
Construct a figure in each case.
Ans. (a) Circle (x + 2)2 + (y – 3)2 = 25, center (–2, 3), radius 5
(b) Circle (x – 2)2 + y2 = 4, center (2,0), radius 2
(c) Branch of hyperbola x2/9 – y2/16 = 1, where x ≥  3
16.40. Determine the region in the z plane represented by each of the following: (a) ⏐z – 2 + i⏐ ≥  4,
(b) 3, 0 arg , 4zz π≤≤ ≤  and (c) ⏐z – 3⏐ + ⏐z + 3⏐ < 10.Construct a figure in each case.
Ans.  (a) Boundary and exterior of circle (x – 2)2 + (y + 1)2 = 16
(b) Region in the first quadrant bounded by x2 + y2 = 9, the x axis, and the line y = x
(c) Interior of ellipse x2/25 + y2/16 = 1
16.41. Express each function in the form u(x, y) + iυ(x, y), where u and υ are real: (a) z2 + 2iz, (b) z/(3 + z), (c) e2,
and (d) ln(1 + z).
Ans.  (a) u = x3 – 3xy2 – 2y,υ = 3x2y – y2 + 2x
(b)
22
22 22
33 ,
69 69
xx y yu
xx y xx y
υ++==
+++ +++
(c) u = ex2 –y2
 cos 2xy, υ = ex2
–y2 sin 2xy
(d) 1
2u = ln 22 1{(1 + ) }, tan 2 , 0, 1, 2, 1
yxy k kxυπ −+= + = ± ± +
 . . .
16.42. Prove that (a)
0
22
0lim
zx
zz
→
= (b) 2()fz z =  is continuous at z = z0 directly
16.43. (a) If z = ω is any root of z 5 = 1 different from 1, prove that all the roots are 1, ω, ω 2, ω 3, ω 4. (b) Show that 1
+ ω + ω 2 + ω 3 + ω 4 = 0. (c) Generalize the results in (a) and (b) to the equation zn = 1.
Derivatives, Cauchy-Riemann equations
16.44. (a) If 1If ( ) , find dwwf z z zd z== +  directly from the definition. (b) For what finite values of z is f(z)
nonanalytic?
Ans. (a) 1 – 1/z2 (b) z = 0
16.45. Given the function w = z 4, (a) find real functions u and υ such that w = u + iυ, (b) Show that the Cauchy-
Riemann equations hold at all points in the finite z plane, (c) prove that u and υ are harmonic functions, and
(d) Determine dw/dz.
Ans. (a) u = x4 – 6x2 y2 + y 4, υ = 4x3 y – 4xy2 (d) 4z3
16.46. Prove that f (z) = z⏐z⏐ is not analytic anywhere.


## Page 443

CHAPTER 16  Functions of a Complex Variable432
16.47. Prove that 1() 2fz z= −
 is analytic in any region not including z = 2.
16.48. If the imaginary part of an analytic function is 2x(1 – y), determine (a) the real part and (b) the function.
Ans. (a) y2 – x2 – 2y + c (b) 2iz – z2 + c, where c is real
16.49. Construct an analytic function f (z) whose real part is e–x (x cos y + sin y) and for which f (0) = 1.
Ans. ze–z + 1
16.50. Prove that there is no analytic function whose imaginary part is x 2 – 2y.
16.51. Find f (z) such that f ′ (z) = 4z – 3 and f (1 + i) = –3i.
Ans. f (z) = 2z2 – 3z + 3 – 4i
Integrals, Cauchy’s theorem, Cauchy’s integral formulas
16.52. Evaluate
3
12
(2 3)
i
i
zd z
+
−
+∫ : (a) along the path x = 2t + 1, y = 4t2 – t –2 0 < t <  1, (b) along the straight line
joining 1 – 2i and 3 + i, and (c) along straight lines from 1 – 2i to 1 + i and then to 3 + i.
Ans. 17 + 19i in all cases
16.53. Evaluate 2(2 ) ,
C
zz d z−+∫  where C is the upper half of the circle ⏐z⏐ = 1 tranversed in the positive sense.
Ans. –14/3
16.54. Evaluate FC
, ,25
z
z +
 where C is the circle (a) ⏐z⏐ = 2 and (b) ⏐z⏐ = 2, (b) ⏐z – 3⏐ = 2.
Ans. (a) 0 (b) 5πi/2
16.55. Evaluate Fc
2
(2 ) (1 )
z dzzz+−
 where C is (a) a square with vertices at –1, –i, –1 + i, –3 + i, –3 –i; (b) the
circle ⏐z + i⏐ = 3; and (c) the circle ⏐z⏐ = 2.
Ans. (a) –8πi/3 (b) –2π i (c) –2πi/3
16.56. Evaluate (a) FC
cos
1
z dzz
π
−
 and (b) FC
2
4(1 )
ez dz
z
+
−
, where C is any simple closed curve enclosing z = 1.
Ans. (a) –2πi (b) πie/3
16.57. Prove Cauchy’s integral formulas. (Hint: Use the definition of derivative and then apply mathematical
induction.)
Series and singularities
16.58. For what values of z does each series converge?
(a)
1
(2 )
!
n
n
z
n
∞
=
+
∑  (b)
1
(1 )
1
n
n
nz
n
∞
=
−
+∑  (c) 22
1
(1 ) ( 2 2 )nn
n
zz
∞
=
−+ +∑
Ans. (a) all z (b) ⏐z – i⏐ < 1 (c) z = –1 ± i


## Page 444

CHAPTER 16  Functions of a Complex Variable 433
16.59. Prove that the series
1 (1 )
n
n
z
nn
∞
= +∑  is (a) absolutely convergent and (b) uniformly convergent for ⏐z⏐ <  1.
16.60. Prove that the series
0
()
2
n
n
n
zi∞
=
+
∑  converges uniformly within any circle of radius R such that ⏐z + i⏐ < R < 2.
16.61. Locate in the finite z plane all the singularities, if any, of each function and name them:
(a) 4
2
(2 1)
z
z
−
+
  (d) 1cos z
(b) 2(1 ) (2 )
z
zz−+
  (e) sin( / 3)
3
z
z
π
π
−
−
(c)
2
2
1
22
z
zz
+
++
  (f) 22
cos
(4 )
z
z +
Ans.   (a) z = –1/2, pole of order 4  (d) z = 0, essential singularity
(b) z = 1, simple pole; z = –2, double pole  (e) z = π/3, removable singularity
(c) simple poles z = –1 ± i   (f) z = ±2i, double poles
16.62. Find Laurent series about the indicated singularity for each of the following functions, naming the
singularity in each case. Indicate the region of convergence of each series.
(a) cos ;z zz ππ =−
 (b) z2e–1/z; z = 0 (c)
2
2 ;1
(1 ) (3 )
z z
zz
=
−+
Ans. (a)
351( ) ( )
2! 4! 6!
zz z
z
ππ π
π
−− −−+− + −−
 . . . , simple pole, all z π ≠
(b) 2
23
11 1 1
2! 3! 4! 5!
zz z zz
−+ − + − +  . . . , essential singularity, all 0z ≠
(c) 2
17 9 9 ( 1 )
16( 1) 64 2564( 1)
z
zz
−++ − + −−
 . . . , double pole, 0 < 1 4z −<
Residues and the residue theorem
16.63. Determine the residues of each function at its poles: (a) 2
23 ,
4
z
z
+
−
 (b) 32
3 ,
5
z
zz
−
+
 (c) 3 ,
(2 )
zte
z −
 and
(d) 22 .
(1 )
z
z +
Ans. (a) z = 2; 7/4, z = –2; 1/4  (c) z = 2; 1
2 t2 e2t
(b) z = 0; 8/25, z = –5; –8/25  (d) z = i; 0, z = –i; 0
16.64. Find the residue of e zt tan z at the simple pole z = 3π/2.
Ans. –e3πt/2
16.65. Evaluate FC
2
,(1 ) (3 )
zd z
zz++
 where C is a simple closed curve enclosing all the poles.
Ans. – 8πi
16.66. If C is a simple closed curve enclosing z = ±i, show that
FC 22
1 sin2(1 )
ztze dz t t
z
=
+


## Page 445

CHAPTER 16  Functions of a Complex Variable434
16.67. If f (z) = P(z)/Q(z), where P(z) and Q(z) are polynomials such that the degree of P(z) is at least two less than
the degree of Q(z), prove that FC
() 0 ,fzd z =  where C encloses all the poles of f (z).
Evaluation of definite integrals
Use contour integration to verify each of the following
16.68.
2
40 1 22
xd x
x
π∞
=
+∫ 16.78.
2
20
cos
12 c o s
nd
aa
π θθ
θ
=
−+∫
2
2 ,0 , 1 , 2 , 3 ,
1
na n
a
π =
−
 . . . ,0 1 a<<
16.69. 66 5
2 ,0
3
dx a
xa a
π∞
−∞
=>
+∫ 16.79.
222
32 2 5 / 20
(2 ) ,
( cos ) ( )
da b ab
ab a b
π θπ
θ
+=>
+−∫
16.70. 220 32(4 )
dx
x
π∞
=
+∫ 16.80.
4
20
sin 2
44
xx e dx
x
π −∞
=
+∫
16.71. 30 31
x dx
x
π∞
=
+∫ 16.81. 40
cos 2
84
xcdx
x
πππ −∞
=
+∫
16.72. 7
44 20
3 ,0
() 82
dx aa
xa
π∞ −=>
+∫ 16.82.
2
220
sin
4(1 )
xx e dx
x
πππ −∞
=
+∫
16.73. 22 2 9(1 ) (4 )
dx
xx
π∞
−∞
=
++∫ 16.83. 220
sin (2 3)
4(1 )
xe dx exx
π∞ −=
+∫
16.74.
2
0
2
2c o s 3
dπ θπ
θ =−∫ 16.84.
2
20
sin
2
x dx
x
π∞
=∫
16.75.
2
20
43
9(2 cos )
dπ θπ
θ
=
+∫ 16.85.
3
30
sin 3
8
x dx
x
π∞
=∫
16.76.
2
0
sin
54 c o s 8 d
π θπ θθ =−∫ 16.86.
0
cos
cosh 2 cosh ( / 2)
x dxx
π
π
∞
=∫
16.77.
2
220
3
(1 sin ) 22
dπ θπ
θ
=
+∫
[Hint: Consider FC
,cosh
ize dzz
 where C is a rectangle with vertices at (–R, 0), (R, 0), (R,π)r (–R, π). Then let
R → /H11009.]
Miscellaneous problems
16.87. If z = ρeiφ and f (z) = u (ρ, φ) + iυ (ρ, φ), where ρ and φ are polar coordinates, show that the Cauchy-
Riemann equations are
11 ,uu υυ
ρρ φ ρρ φ
∂∂ ∂ ∂==∂∂ ∂∂


## Page 446

CHAPTER 16  Functions of a Complex Variable 435
16.88. If w = f (z), where f (z) is analytic, defines a transformation from the z plane to the w plane where z = x + iy
and w = u + iυ, prove that the Jacobian of the transformation is given by
2(, ) ()(, )
u fzxy
υ ∂=′∂
16.89. Let F(x, y) be transformed to G(u, υ) by the transformation w = f (z). Show that if
22
22 0FF
xy
∂∂ +=
∂∂
, then at
all points where
22
22( ) 0, 0.GGfz
u υ
∂∂′≠ + =
∂∂
16.90. Show that by the bilinear transformation w = ,az b
cz d
+= +
 where ad – bc /HS11005 0, circles in the z plane are
transformed into circles of the w plane.
16.91. If f (z) is analytic inside and on the circle ⏐z – a⏐ = R, prove Cauchy’s inequality, namely,
() !()n
n
nMfa
R
≤
where ⏐f (z)⏐ < M on the circle. (Hint: Use Cauchy’s integral formulas.)
16.92. Let C1 and C2 be concentric circles having center a and radii r1 and r2, respectively, where r1 < r2. If a + h is
any point in the annular region bounded by C1 and C2, and f (z) is analytic in this region, prove Laurent’s
theorem that
() n
nfa h a h
∞
−∞
+= ∑
where
1
2na iπ= FC 1
()
() n
fzd z
za +−
C being any closed curve in the angular region surrounding C 1. [Hint: Write ()fa h+ 1
2 iπ=
FC
() 1
() 2
fzd z
za h i π−−+ FC1
() 1and expand()C
fzd z
za h z a h−+ − −
 in two different ways.]
16.93. Find a Laurent series expansion for the function () (1 ) (2 )
zfz zz= ++
 which converges for 1 < ⏐z⏐ < 2
and diverges elsewhere. 12 1 1Hint: Write .( 1) ( 2) 1 2 (1 1/ ) 1 / 2)
z
zz z z z z z
⎡⎤ −−=+ = +⎢⎥ ++ + + + +⎣⎦
Ans. . . .
23
5432
1111 1 1 24 8
zz z
zzzzz
−+−+− + − +−+ . . .
16.94. Let
0
() ()steF t d tf s
∞ − =∫ , where f (s) is a given rational function with numerator of degree less than
that of the denominator. If C is a simple closed curve enclosing all the poles of f(s), we can show that ()Ft
1
2 iπ= FC
( ) sum of residues of ( ) at its poleszt ztef z d z ef z= . Use this result to find F(t) if f (s) is
(a) 2 ,
1
s
s +
 (b) 2
1 ,
25ss ++
 (c)
2
2
1 ,
(1 )
s
ss
+
−
 and (d) 22
1
(1 )s +
, and check results in each case. [Note that
f (s) is the Laplace transform of F(t), and F (t) is the inverse Laplace transform of f(s) (see Chapter 12).
Extensions to other functions f (x) are possible.]
Ans. (a) cos t, (b) 1 sin 2 ,2
tet− (c) 2215 3 ,42 4
ttte e++  (d) 1 (sin cos )2 tt t−


## Page 447

This page intentionally left blank


## Page 448

437
INDEX
Abel, integral test of, 347
summability, 320
theorems of, 291, 308
Absolute convergence:
of integrals, 314, 315, 322–325
of series, 282, 297, 315
theorems on, 282, 297
Absolute maximum or minimum, 47
(See also Maxima and minima)
Absolute value, 4
of complex numbers, 7
Acceleration, 80, 169
centripetal, 188
in cylindrical and spherical
coordinates, 193
normal and tangential components
of, 188
Accumulation, point of, 6, 126 (See
also Limit points)
Addition, 2
associative law of, 3, 9
commutative law of, 3
of complex numbers, 8, 14
of vectors, 161, 162, 174
Aerodynamics, 415
Aleph- null, 6
Algebra:
of complex numbers, 7, 8, 14–16
fundamental theorem of, 47
of vectors, 162, 163, 174–177
Algebraic functions, 48
Algebraic numbers, 7, 14
countability of, 14
Alternating series, 281, 296
convergence test for, 281
error in computations using, 281
Amplitude, 8
Analytic continuation, of gamma
function, 390
Analytic functions, 406
Analytic part, of Laurent series,
408
Antiderivatives, 100
Approximations:
to irrational numbers, 10
least square, 212
by partial sums of Fourier series,
365
using differentials, 84, 85, 139,
140
using Newton’s method, 80
using Taylor’s theorem, 287–289
(See also Numerical methods)
Archimedes, 97
Arc length, 105, 106
element, 172
Area, 107, 115
of ellipse, 218
expressed as line integral, 251
of parallelogram, 166
Argand diagram, 8
Argument, 8
Arithmetic mean, 10
Associative law, 3
for vectors, 162, 166
Axiomatic foundations:
of complex numbers, 7
of real numbers, 5
of vector analysis, 166
Axis, real, 2
Base, of logarithms, 4–5
Bases, orthonormal, 163
Bernoulli, Daniel, 349
Bernoulli numbers, 319
Bernoulli’s inequality, 17
Bessel differential equation, 290
Bessel functions, 290
Beta functions, 389, 392, 393,
395–398
relation to gamma functions,
392
Bilinear transformation, 435
Binary scale, 17, 23
system, 1
Binomial coefficients, 23
series, 289
theorem, 23
 Bolzano- Weierstrass theorem, 7, 13,
20, 126
Boundary conditions, 352
Boundary point, 126
Boundary- value problems:
and Fourier integrals, 377
and Fourier series, 349, 372,
373
in heat conduction, 370
separation of variables method for
solving, 369
in vibration of strings, 375
Bounded functions, 45
sequences, 26, 32, 34, 39
sets, 6
Bounds, lower and upper, 6, 13, 14
Box product, 166
Branches of a function, 45
Branch line, 429
Branch point, 409, 429
Calculus, fundamental theorem of
integral, 101, 111
Cardinal number of the continuum, 6
Cardioid, 121
Catenary
, 121
Cauchy form of remainder in Taylor’s
theorem, 287
Cauchy principal value, 325, 335


## Page 449

INDEX438
Cauchy- Riemann equations, 406,
413–416
derivation of, 415
in polar form, 434
Cauchy’s convergence criterion,
27, 35
Cauchy’s generalized theorem of the
mean, 78, 88
Cauchy’s inequality, 435
Cauchy’s integral formulas, 407,
416–419
Cauchy’s theorem, 407, 416–419
Centripetal acceleration, 188
Chain rules, 75, 131, 144
for Jacobians, 132
Circle of convergence, 290
Class, 1 (See also Sets)
Closed interval, 5
region, 126
set, 6, 13, 14, 126
Closure law or property, 3
Cluster point, 6, 126 (See also Limit
points)
Collection, 1 (See also Sets)
Commutative law, 3
for dot products, 164
for vectors, 165, 176, 177
Comparison test, for series, 280, 292,
293
Complex numbers, 7, 14, 15
absolute value of, 7
amplitude of, 8
argument of, 8
axiomatic foundations of, 7
conjugate of, 7
equality of, 7
modulus of, 7
operations with, 7, 14, 15
as ordered pairs of real numbers, 8
polar form of, 8, 15
real and imaginary parts of, 7
roots of, 8, 16
as vectors, 21
Complex plane, 8
Complex variable, 405, 406 (See also
Functions of a complex variable)
Components of a vector, 163
Composite fuctions, 52
continuity of, 52
differentiation of, 75, 144–148
Conditional convergence:
of integrals, 321, 324, 331, 332
of series, 282, 315
Conductivity, thermal, 370
Conformal mapping or
transformation, 429 (See also
Transformations)
Conjugate, complex, 7
Connected region, 245
set, 126
simply, 126, 245
Conservative field, 246
Constraints, 200
Continuity, 51–63, 128, 136
and differentiability, 73, 129, 130
definition of, 51
of functions of a complex variable,
405
of infinite series of functions, 284,
285, 303
of integrals, 110, 328
in an interval, 51
piecewise, 52
in a region, 126, 128
right- and  left- hand, 51
theorems on, 52
uniform, 53
of vector functions, 167
Continuous differentiability, 73, 130
Continuously differentiable functions,
73, 130
Continuum, cardinality of, 6
Contour integration, 411
Convergence:
absolute (see Absolute
convergence)
circle of, 286
conditional (see Conditional
convergence)
criterion of Cauchy, 27, 35
domain of, 283
of Fourier integrals (see Fourier’s
integral theorem)
of Fourier series, 349, 372–374
of improper integrals (see Improper
integrals)
of infinite series (see Infinite series)
interval of, 27, 283
radius of, 285
region of, 126
of series of constants, 292–299
uniform (
see Uniform convergence)
Convergent integrals, 322–324 (See
also Improper integrals)
Convergent sequences, 35, 283 (See
also Sequences)
Convergent series, 27 (See also
Infinite series)
Convolution theorem:
for Fourier transforms, 378
for Laplace transforms, 346
Coordinate curve, 171
Coordinates:
curvilinear, 149, 171 (See also
Curvilinear coordinates)
cylindrical, 172, 186
hyperbolic, 231
polar, 8
rectangular, 163
spherical, 173, 202
Correspondence, 2, 12, 171
 one- to- one, 2, 12
Countability, 6, 12, 13
of algebraic numbers, 14
of rational numbers, 13
Countable set, 6, 13
measure of, 98, 103
Critical points, 73
Cross products, 168, 177–179
proof of distributive law for, 177
Curl, 170, 171, 183–185
in curvilinear coordinates, 173
Curvature:
radius of, 188, 193
simple closed, 126, 245, 255
space, 168
Curvilinear coordinates, 149, 150
curl, divergence, gradient, and
Laplacian in, 173, 174
Jacobians and, 173, 174
multiple integrals in, 221–242
orthogonal, 221–242
special, 173, 174
transformations and, 158, 171
vectors and, 173, 174
Cut (see Dedekind cuts)
Cycloid, 121
Cylindrical coordinates, 173, 185, 186
arc length element in, 172
divergence in, 186
gradient in, 186
Laplacian in, 173, 174
multiple integrals in, 235
parabolic, 192
volume element in, 173, 174
Decimal representation of real
numbers, 2
Decimals, recurring, 2
Decreasing functions, 45, 52
monotonic, 45
strictly, 45, 52


## Page 450

INDEX 439
Decreasing sequences:
monotonic, 26
strictly, 26
Dedekind cuts, 5, 18
Definite integrals, 92–100, 108 (See
also Integrals)
change of variable in, 101, 111–113
definition of, 98
mean value theorems for, 99, 100,
110
numerical methods for evaluating,
104, 105, 115
properties of, 98
theorem for existence of, 98
with variable limits, 101, 186, 313,
321
Degree:
of polynomial equation, 7
of homogeneous functions, 131
Del (/H17006), 170
in curl, gradient, and divergence,
170
formulas involving, 170
Deleted neighborhood, 6, 126
De Moivre’s theorem, 8, 16
Dense, everywhere, 3
Denumerable set (see Countable set)
Dependent variable, 43, 119
Derivatives, 71–96, (See also
Differentiation)
chain rules for, 75, 133
continuity and, 72, 78, 130, 139
definition of, 72, 73
directional, 198, 205–206, 215
of elementary functions, 71,
76–77
evaluation of, 76, 81–92
of functions of a complex variable,
405, 411–414
graphical interpretation of, 71
higher- order, 77, 129
of infinite series of functions, 283,
413–416
partial (see Partial derivatives)
right- and  left- hand, 72, 83, 92
rules for finding, 75–76
of vector functions, 168, 182, 183
Determinant:
for cross product, 166
for curl, 170
Jacobian (see Jacobians)
for scalar triple product, 166
Dextral system, 163
Difference equations, 72
Differentiability, 72, 73, 130
and continuity, 73, 77–78
continuous, 73
piecewise, 73
Differential:
elements of area, of volume, 172,
221, 222, 242
as linear function, 73, 129
Differential equation:
Gauss’s, 290
solution of, by Laplace
transforms, 329, 342
Differential geometry, 169, 193
Differentials, 73, 84, 129–131
approximations using, 71, 129
exact, 130
of functions of several variables,
129, 139
geometric interpretation of, 74,
129–130
total, 129
of vector functions, 167–168
Differentiation:
of Fourier series, 351, 369
under integral sign, 198, 206, 216
rules for, 75–76, 91
(See also Derivatives)
Diffusivity, 370
Directed line segments, 162
Directional derivatives, 198, 205–206,
215
Dirichlet conditions, 350, 358, 360
integrals, 393, 398, 402
Dirichlet’s test:
for integrals, 328
for series, 284, 319
Discontinuities, 51
removable, 60
Distance between points, 176
Distributive law, 3
for cross products, 165
for dot products, 164
Divergence, 170, 171, 183, 184
in curvilinear coordinates, 173
in cylindrical coordinates, 173
of improper integrals, 322–324 (See
also Improper integrals)
of infinite series (see Infinite series)
Divergence theorem, 250, 262–265,
275
proof of, 262, 263
Divergent integrals, 322–347
sequences (See Sequences)
series (See Series)
Division, 2
of comple
x numbers, 7, 8
by zero, 9
Domain:
of a function, 43
of convergence, 279
Dot products, 164, 165, 176,
177
commutative law for, 164
distributive law for, 164
laws for, 164, 165
Double series, 291
Dummy variable, 100
Duplication formula for gamma
function, 392, 400
e, 5
Electric field vector, 193
Electromagnetic theory, 193
Elementary transcendental functions,
48, 85
Elements of a set, 1
Ellipse, 120
area of, 120
Empty set, 1
Envelopes, 197, 198, 204
Equality:
of complex number, 7
of vectors, 170
Equations:
differential (see Differential
equation)
integral, 377, 380, 381
polynomial, 7, 47
Errors, applications to, 200, 212,
217
in computing sums of alternating
series, 281, 297
mean square, 366
Essential singularity, 408
Eudoxus, 97
Euler, Leonhart, 349
Euler’s constant, 310
theorem on homogeneous
functions, 131
Even function, 351, 360–364
Everywhere dense set, 3
Exact differentials, 129, 130, 139,
140, 244 (See also Differentials)
Expansion of functions:
in Fourier series (see Fourier series)
in power series, 286, 287
Expansions (see Series)
Explicit functions, 137


## Page 451

INDEX440
Exponential function, 48
order, 346
Exponents, 4, 12
Factorial function (see Gamma
functions)
Fibonacci sequence, 38
Field, 3
conservative, 246
scalar, 162
vector, 162
Fourier, Joseph, 349
Fourier coefficients, 350, 358
expansion (see Fourier series)
Fourier integrals, 377–388
convergence of (see Fourier’s
integral theorem)
solution of  boundary- value
problems by, 385
(See also Fourier transforms)
Fourier series, 349–376
complex notation for, 352
convergence of, 351, 366–368
differentiation and integration of,
352
Dirichlet conditions for
convergence of, 350
half range, 351, 360–364
Parseval’s identity for, 351, 364,
365
solution of  boundary- value
problems by, 352, 369–371
Fourier’s integral theorem, 377, 378
heuristic demonstration of, 382
proof of, 382
Fourier transforms, 378–382
convolution theorem for, 379
inverse, 378
Parseval’s identities for, 379, 382,
386
symmetric form for, 378
(See also Fourier integrals)
Fractions, 2
Frenet- Serret formulas, 193
Fresnel integrals, 401
Frullani’s integral, 345
Functional determinant, 132, 146 (See
also Jacobians)
Functional notation, 43, 125
Functions, 43–70, 125, 141, 405
algebraic, 48
beta (see Beta functions)
bounded, 45
branches of, 43
Functions (Cont.):
of a complex variable (see
Functions of a complex variable)
composite (see Composite
functions)
continuity of (see Continuity)
decreasing, 45
definition of, 43, 126
derivatives of (see Derivatives)
differential of (see Differentials)
domain of, 43, 126
elementary transcendental, 48, 49
even, 351, 360–364
explicit and implicit, 131
of a function (see Composite
functions)
gamma (see Gamma functions)
harmonic, 406
hyperbolic, 48, 49
hypergeometric, 290, 318
increasing, 45
inverse (see Inverse functions)
limits of (see Limits of functions)
maxima and minima of (see
Maxima and minima)
monotonic, 45
multiple- valued (see  Multiple-
valued function)
normalized, 355
odd, 351, 360–364
orthogonal, 355, 371, 372
orthonormal, 355
periodic, 379
polynomial, 47
sequences and series of, 283, 284,
300, 301
of se
veral variables, 125, 130, 133
single- valued, 43, 405
staircase of step, 55
transcendental, 48
types of, 47
vector (see Vector functions)
Functions of a complex variable,
405–435
analytic, 406
Cauchy- Riemann equations, 406,
414 (See also Cauchy- Riemann
equations)
continuity of, 406, 413, 414
definition of, 405
derivatives of, 406, 414–417
elementary, 406
imaginary part of, 405, 414
integrals of, 407, 417–420
Functions of a complex variable
(Cont.):
Jacobians and, 435
Laplace transforms and, 435
limits of, 405, 411, 412
line integrals and, 406
multiple- valued, 405
poles of, 408
real part of, 405, 414
residue theorem for (see Residue
theorem)
series of, 300–302, 405, 419–422
single- valued, 405
singular points of, 408
Fundamental theorem:
of algebra, 47
of calculus, 101, 110–111
Gamma functions, 389–404
analytic continuation of, 390
asymptotic formulas for, 390, 392
duplication formula for, 392, 400
infinite product for, 390
recurrence formula for, 389–390
Stirling’s formulas and asymptotic
series for, 398
table and graph of, 389
Gauss’s:
differential equation, 290
/H9266 function, 391
test, 282
Geometric integral, 323
Gibbs, Williard, 161
g.l.b (see Greatest lower bound)
Gradient, 169, 170, 171, 183
in curvilinear coordinates, 172
in cylindrical coordinates, 173
Graph:
function of one variable, 44
function of two variables, 153, 154
Grassman, Herman, 161
Greater than, 3
Greatest limit (see Limit superior)
Greatest lower bound, 6
of a function, 45
of a sequence, 26, 34, 39
Green’s theorem:
in the plane, 246, 253–256, 273
in space, (see Divergence theorem)
Grouping method for exact
differentials, 141
Half range Fourier sine or cosine
series, 351, 360–364


## Page 452

INDEX 441
Hamilton, William Rowen, 161, 169
Harmonic functions, 406
series, 280
Heat conduction equation, 370
solution of by Fourier integrals, 385
solution of by Fourier series, 367,
368
Homogeneous functions, Euler’s
theorem on, 131
Hyperbolic coordinates, 231
Hyperbolic functions, 48, 49
inverse, 47
Hyperboloid of one sheet, 135
Hypergeometric function or series,
290, 318
Hypersphere, 125
Hypersurface, 125
Identity, with respect to addition and
multiplication, 3
Image or mapping, 133, 428
Imaginary part:
of a complex number, 7
of functions of a complex variable,
405, 414, 417
Imaginary unit, 7
Implicit functions, 75, 130
and Jacobians, 144–149
Improper integrals, 104, 116, 117,
321–347
absolute and conditional
convergence of, 322, 324, 326
comparison test for, 323, 327
containing a parameter, 327
definition of, 321
of the first kind, 321–322, 330–331
of the second kind, 324–326, 335
of the third kind, 321, 327
quotient test for, 323
uniform convergence of, 327,
337–338
Weierstrass M test for, 327, 337–342
Increasing functions, 45
monotonic, 45
strictly, 45, 52
Indefinite integrals, 104 (See also
Integrals)
Independence of the path, 256–259,
273
Independent variable, 48, 125
Indeterminate forms, 88–90
L’Hospital’s rules for (see
L’Hospital’s rules)
Induction, mathematical, 8
Inequality, 3, 10
Bernoulli’s, 17
Cauchy’s, 435
Schwarz’s, 11, 20, 116
Inferior limit (see Limit inferior)
Infinite:
countably, 6
interval, 5
Infinite product, 291
for gamma function, 389
Infinite series, 27, 36, 39, 279–320
absolute convergence of, 282, 297,
315
comparison test for, 281, 293, 297
of complex terms, 290
conditional convergence of, 282,
297
convergence tests for, 280–281
of functions, 286, 287, 290, 291
functions defined by, 290
Gauss’s test for, 282
integral test for, 281, 294–296
nth root test for, 281
partial sums of, 27, 279
quotient test for, 281, 290
Raabe’s test for, 282, 300
ratio test for, 282, 298, 315
rearrangement of terms in, 282
special, 284
uniform convergence of, 283, 284
(See also Uniform convergence)
Weierstrass M test for, 284, 303
(See also Series)
Infinitesimal, 96
Infinity, 26, 50
Inflection, point of, 79
Initial point of a vector, 161
Integers, positive and negative, 2
Integrable, 98
Integral equations, 377, 382, 383
Integral formulas of Cauchy, 407,
416–419
Integrals, 97–123, 221–242, 321–347,
377–388, 406–407, 411, 422–435
definite, 97–98 (See also Definite
integrals)
Dirichlet, 393, 399, 402
double, 221, 227–230
of elementary functions, 102
evaluation of, 328, 345–347
Fresnel, 401
Frullani’s, 345
of functions of a comple
x variable,
405–435
Integrals (Cont.):
improper, 104 (see Improper
integrals)
indefinite, 100
of infinite series of functions, 283,
286
iterated, 222–223
line (see Line integrals)
mean value theorems for, 86, 99
multiple (see Multiple integrals)
Schwarz’s inequality for, 116
table of, 102
transformations of, 101, 109–114
uniform convergence of, 328, 337,
338
(See also Integration)
Integral test for infinite series, 281
Integrand, 98
Integration:
applications of, 105–108
contour, 411
of elementary functions, 102, 103
of Fourier series, 351, 366
under integral sign, 198, 206
interchange of order of, 222
limits, of, 98
by parts, 103–120
range of, 98
special methods of, 103,
111–114
(See also Integrals)
Intercepts, 134
Interior point, 126
Intermediate value theorem, 52
Intersection of sets, 13
Intervals:
closed, 5
continuity in, 51
of convergence, 27
infinite, 5
nested, 27, 35
open, 5
unbounded, 6
Invariance relations, 194
Invariant:
scalar, 194
Fourier transforms, 378 (See also
Fourier transforms)
Laplace transforms, 328, 435 (See
also Laplace transforms)
Inverse functions, 45
continuity of, 51
hyperbolic, 48
trigonometric, 48


## Page 453

INDEX442
Inverse, of addition and
multiplication, 3
Irrational algebraic functions, 48
Irrationality of √⎯2, proof of, 10
Irrational numbers, 2, 9, 10
approximations to, 10
definition of, 2 (See also Dedekind
cuts)
Isolated singularity, 408
Iterated integrals, 222–223
limits, 127
Jacobian determinant (see Jacobians)
Jacobians, 132, 144–149, 172, 185,
186
chain rules for, 132
curvilinear coordinates and, 172, 173
implicit functions and, 144–148
multiple integrals and, 221
partial derivatives using, 133
theorems on, 132, 171
of transformations, 133
vector interpretation of, 171
Kronecker’s symbol, 355
Lagrange multipliers, 200, 210, 211
Lagrange’s form of the remainder, in
Taylor series, 288, 311
Laplace’s equation, 138 (See also
Laplacian operator)
Laplace transforms, 328, 329, 342
convolution theorem for, 343
inverse, 343, 435
relation of functions of a complex
variable to, 435
in solving differential equations, 329
table of, 329
Laplacian operator, 172, 173
in curvilinear coordinates, 172
in cylindrical coordinates, 173, 185
in spherical coordinates, 173
(See also Laplace’s equation)
Laurent’s series, 400, 420, 421
theorem, 421, 422
Least limit (see Limit inferior)
Least square approximations, 212
Least upper bound, 6, 34
of functions, 46
of sequences, 26, 39
 Left- hand continuity, 51
limits, 49
Leibniz, Gottfried Wilhelm, 65, 97,
265
Leibniz’s formula for nth derivative of
a product, 96
rule for differentiating under the
integral sign, 198, 206
Length of a vector, 161
Less than, 3
Level curves and surfaces, 152, 197
L’Hospital’s rules, 78, 88–90, 95
proofs of, 88, 89, 96
Limit inferior, 36, 39
Limit points, 6, 13, 127
 Bolzano- Weierstrass theorem on
(see  Bolzano- Weierstrass
theorem)
Limits of functions, 43–70, 127, 128,
405– 406, 411 –413
of a complex variable, 405, 411–413
definition of, 47, 127
iterated, 127, 222
proofs of theorems on, 58–61
right- and  left- hand, 49
special, 50
theorems on, 50
Limits of integration, 98
Limits of sequences, 29–30
definition of, 25
of functions, 49
theorems of, 25–26
Limits of vector functions, 168
Limit superior, 27, 34
Line:
normal (see Normal line)
tangent (see Tangent line)
Linear dependence of vectors,
194
Linear transformations, 158
Line integrals, 243–245, 251–255,
272–273
evaluation of, 244
independence of path of, 246,
251–253
properties of, 245
relation to functions of a complex
variable, 407
vector notation for, 244
Logarithms, 4–5, 12
base of, 4
as  multiple- valued functions,
405
Lower bound, 6, 13
of functions, 45
of sequences, 26
Lower limit (
see Limit inferior)
l.u.b. (see Least upper bound)
Maclaurin series, 287
Magnetic field vector, 193
Magnitude of a vector, 161
Many- valued function (seeMultiple-
valued function)
Mappings, 133
conformal, 429
(See also Transformations)
Mathematical induction, 8, 16
Maxima and minima, 46–47, 79, 197,
200, 208–212
absolute, 47
of functions of several variables,
199, 200
Lagrange’s multiplier method for,
210–212
relative, 47
Taylor’s theorem and, 287, 288,
311, 312
Maximum (see Maxima and minima)
Maxwell’s equations, 193
Mean square error, 366
Mean value theorems:
for derivatives, 77, 86–88, 94, 134,
150–151
for integrals, 99–100, 110, 119
Measure zero, 98, 109
Mechanics, 169
fluid, 415
Members of a set, 1
Minimum (see Maxima and
minima)
Moebius strip, 262
Moment of inertia, 115
polar, 227, 231
Monotonic functions, 42
Monotonic sequences, 26, 32–34
fundamental theorem on, 26
Multiple integrals, 221–242
in curvilinear coordinates, 225,
226, 236, 237
in cylindrical coordinates, 225
improper, 330
Jacobians and, 225
in spherical coordinates, 226
transformations of, 225–226
 Multiple- valued functions, 43, 125,
405
logarithms as, 405
Multiplication, 3
associative law of, 3
of complex numbers, 7, 8
involving vectors, 164–167
Multiply connected regions, 125


## Page 454

INDEX 443
Natural base of logarithms, 4
Natural numbers, 1
Negative integers, 2
numbers, 1, 2
Neighborhoods, 6, 126
Nested intervals, 27, 35
Newton, Isaac, 71, 97, 279
first and second laws, 74
Newton’s method, 80
Normal component of acceleration, 188
Normalized vectors and functions, 355
Normal line:
parametric equations for, 196, 214
principal, 188, 192
to a surface, 196, 201–203
Normal plane, 196, 197, 203, 204
nth root test, 282
Null set, 1
vector, 161
Numbers, 1–24
algebraic (see Algebraic numbers)
Bernoulli, 349
cardinal, 6
complex (see Complex numbers)
history, 1
irrational (see Irrational numbers)
natural, 2
negative, 2
operations with, 2–7
positive, 1
rational (see Rational numbers)
real (see Real numbers)
transcendental, 7, 14
Numerator, 2
Numerical methods for evaluating
definite integrals, 105, 115 (See
also Approximations)
Odd functions, 351, 360–364
Open ball, 126
Open interval, 5
region, 126
Operations:
with complex numbers, 7, 15
with real numbers, 3
Order, exponential, 346
of derivatives, 77
of poles, 408, 409
Ordered pairs of real numbers, 8
triplets of real numbers, 164
Orientable surface, 262
Origin, of a coordinate system, 125
Orthogonal curvilinear coordinates
(see Curvilinear coordinates)
Orthogonal families, 414, 415
functions, 163, 371, 372
Orthonormal functions, 371
Pappus’s theorem, 242
Parabolic cylindrical coordinates, 192
Parallelepiped, volume of, 166, 180
Parallelogram:
area of, 166, 179
law, 162, 174
Parametric equations:
of line, 201
of normal line, 196
of space curve, 168
Parseval’s identity:
for Fourier integrals, 377, 378
for Fourier series, 351, 364, 374
Partial derivatives, 125–159
applications of, 195–219
definition of, 128
evaluation of, 129, 137–139
higher- order, 128
notations for, 128
order of differentiation of, 128
using Jacobians, 132
Partial sums of infinite series, 27, 279,
280
Period of a function, 349
Piecewise continuous, 52
differentiable, 74
p integrals, 323
Plane, complex, 8
Plane, equation of, 181
normal to a curve (see Normal
plane)
tangent to a surface (see Tangent
plane)
Points:
of accumulation, 6 (See also Limit
points)
boundary, 126
branch, 409, 410
cluster
, 6, 126 (See also Limit
points)
critical, 79
interior, 126
limit (see Limit points)
neighborhoods of, 6, 126
singular (see Singular points)
Point set:
 one- dimensional, 6
two- dimensional, 126
Polar coordinates, 8
Polar form of complex numbers, 8, 15
Poles, 408
defined from a Laurent series, 408
of infinite order, 408
residues at, 408
Polynomial functions, 47
degree of, 47
Position vector, 167
Positive definite quadratic form, 219
Positive direction, 245
normal, 248
Positive integers, 1
numbers, 1, 2
Potential, velocity, 415
Power series, 284, 289, 290, 306–308
Abel’s theorem on, 286
expansion of functions in, 286
operations with, 286, 287
radius of convergence of, 285
special, 290, 291
theorems on, 284
uniform covergence of, 284
Prime, relatively, 10
Principal branch:
of a function, 45
of a logarithm, 410
Principal normal to a space curve,
188, 191
Principal part, 73, 129
of a Laurent series, 408
Principal value:
of functions, 45
of integrals (see Cauchy principal
value)
of inverse hyperbolic functions, 48
of inverse trigonometric
functions, 48
of logarithms, 404
p series, 280
Quadratic equation, solutions of, 15
Quadratic form, 219
Quotient, 2
Quotient test:
for integrals, 323, 326, 352
for series, 281, 292, 293
Raabe’s test, 282, 300
Radius of convergence, 285
of curvature, 189, 193
of torsion, 193
Radius vector, 164
Range, of integration, 104
Rates of change, 71
Rational algebraic functions, 48


## Page 455

INDEX444
Rational numbers, 2, 9, 10
countability of, 12
Ratio test, 282, 300
proof of, 299
Real axis, 2
Real numbers, 1
absolute value of, 4
axiomatic foundations of, 5
decimal representation of, 2
geometric representation of, 2
inequalities for (see Inequality)
noncountability of, 13
operations with, 3, 9
ordered pairs and triplets of, 7, 166
(See also Numbers)
Real part:
of a complex number, 7
of functions of a complex variable,
405, 411, 412
Rectangular component vectors, 163
Rectangular coordinates, 7, 125, 171
Rectangular neighborhood, 126
rule for integration, 101
Recurring decimal, 2
Region, 126
closed, 126
connected, 245
of convergence, 126
multiply connected, 126
open, 126
simply connected, 127, 245, 255
Regular summability, 291, 320
Relative extrema, 79
Relativity, theory of, 194
Removable discontinuity, 61, 128
singularity, 408, 419
Residues, 410, 422–424
Residue theorem, 410, 411, 422–424
evaluation of integrals by, 411,
413–416
proof of, 422, 423
Resultant of vectors, 162, 174
Reversion of series, 286
Riemann axis, 408
Riemann integrable, 98
Riemann’s theorem, 367, 383
Riemann surface, 409
Right- hand continuity, 51
derivatives, 72, 73, 83
limits, 49
 Right- handed rectangular coordinate
system, 163, 164
Rolle’s theorem, 77
proof of, 86
Roots:
of complex numbers, 8, 15
of equations, 47
Newton’s method for finding, 80
of real numbers, 4, 12
Saddle points, 200
Scalar, 162
field, 162
invariant, 194
product (see Dot products)
triple product, 166
Scale factors, 172
Scale of two (see Binary scale)
Schwarz’s inequality for real numbers,
11, 20
Section (see Dedekind cuts)
Separation of variables in  boundary-
value problems, 369
Sequences, 25–41, 283
bounded, monotonic, 26, 32–34
convergent and divergent, 25, 283
decreasing, 26
definition of, 25
Fibonacci, 38
finite and infinite, 283
of functions, 283
increasing, 26
limits of, 25, 29, 283 (See also
Limits of sequences)
terms of, 28
uniform covergence of, 284
Series
alternating (see Alternating series)
binomial, 289
double, 291
of functions of a complex variable,
419–422
geometric, 36, 280
harmonic, 280
Laurent’s, 408, 420, 421, 433
Maclaurin, 288
partial sums of, 27, 279
power (see Power series)
reversion of, 286
sum of, 27, 279
Taylor (see Taylor series)
telescoping, 292
terms of, 279
test for integrals, 294
(See also Infinite series)
Sets, 1
bounded, 6
closed, 6, 14
Sets (Cont.):
connected, 126
countable or denumerable (see
Countable set)
elements of, 1
ev
erywhere dense, 3
intersection of, 13
orthonormal, 350, 355
point, 126
union of, 13
Simple closed curves, 126, 245, 254
Simple poles, 408
Simply connected region, 126, 245,
254
Simpson’s rule, 105, 115
Single- valued function, 43, 125,
405
Singular points or singularities,
408–411, 419–422
defined from Laurent series, 408
essential, 408, 420
isolated, 408
removable, 408, 420
Sink, 272
Slope, 71
Smooth function (see Piecewise
continuous, differentiable)
Solenoidal vector fields, 272
Source, 272
Space curve, 168
Specific heat, 369, 370
Spherical coordinates, 173, 185, 186
arc length element in, 173, 185
Laplacian in, 173, 187
multiple integrals in, 188
volume element in, 173, 186
Staircase or step function, 55
Stirling’s asymptotic formula and
series, 391, 398
Stokes’s theorem, 251, 265–270
proof of, 265–266
Stream function, 415
Subset, 1
Subtraction, 3
of complex numbers, 14
of vectors, 162
Sum, 1
partial, 27, 279
of series, 27, 279
of vectors, 161, 174
Summability, 310, 318, 320
Abel, 320
Césaro, 291, 320
regular, 291, 319


## Page 456

INDEX 445
Superior limit (see Limit superior)
Superposition, principal of, 370
Surface, 125
equipotential, 198
level, 154, 198
normal line to (see Normal line)
orientable, 262
tangent place to (see Tangent plane)
Surface integrals, 247–250, 274–275
Tangential component of acceleration,
188
Tangent line:
to a coordinate curve, 92
to a curve, 71, 196, 214
Tangent plane, 195, 201–203, 214
in curvilinear coordinates, 215
Tangent vector, 168, 188
Taylor polynomials, 288
Taylor series:
of functions of a complex variable,
408
in one variable, 289 (See also
Taylor’s theorem)
in several variables, 290
Taylor’s theorem, 287, 312
for functions of one variable,
287
for functions of several variables,
290, 291
proof of, 311, 420, 421
remainder in, 289
(See also Taylor series)
Telescoping series, 292
Tensor analysis, 194
Term:
of a sequence, 25
of a series, 280
Terminal point of a vector, 162
Thermal conductivity, 370, 371
Thermodynamics, 159
Torsion, radius of, 188
Total differential, 129 (See also
Differentials)
Trace, on a place, 135
Transcendental functions, 48, 49
numbers, 7, 21
Transformations, 133, 149, 150
conformal, 429
and curvilinear coordinates, 149,
150, 159
of integrals, 102, 108–111, 225,
230–234
Jacobians of, 132, 171
Transforms (see Fourier transforms;
Laplace transforms)
Transitivity, law of, 3
Trigonometric functions, 48, 104
derivatives of, 71
integrals of, 97, 98
inverse, 48
Triple integrals, 224, 233–234
transformation of, 240–242
Triple products:
scalar, 166
vector, 166
Unbounded interval, 6
Uniform continuity, 53, 63, 128
Uniform convergence, 282, 283, 302,
303
of integrals, 322, 323, 327–328
of power series, 285
of sequences, 283
of series, 283–284
tests for integrals, 323, 326,
327 –328
tests for series, 284
theorems for integrals, 328
theorems for series, 284–286
Weierstrass M test for (see
Weierstrass M test)
Union of sets, 13
Unit tangent vector, 168
Unit vectors, 163
infinite dimensional, 355
rectangular, 163
Upper bound, 6
of functions, 45
of sequences, 26
Upper limit (see Limit superior)
Variable, 5
change of, in differentiation, 74, 76
change of, in integration,101, 114,
225
complex, 405, 406 (See also
Functions of a complex variable)
dependent and independent, 43, 125
dummy, 100
limits of integration, 100, 199, 206
Vector algebra, 162–167
Vector analysis (see Vectors)
V
ector field, 168
solenoidal, 272
Vector functions, 167
limits, continuity and derivatives of,
167, 168
Vector product (see Cross
products)
Vectors, 22, 161–194
algebra of, 162–163, 188–190
axiomatic foundations for, 166
bound, 161
complex numbers as, 22
components of, 163
curvilinear coordinates and, 172,
173
equality of, 161
free, 161
infinite dimensional, 355
Jacobians interpreted in terms of,
171
length or magnitude of, 161
normalized, 355
null, 162
position, 164
radius, 164
resultant or sum of, 161, 174
scalar product, 165
tangent, 169, 188
unit, 163, 164
Vector triple product, 166, 179–182
Velocity, 89, 188
of light, 193
potential, 415
Vibrating string, equation of,
325
V olume, 107
element of, 172, 173, 186
of parallelepiped, 172, 186
V olume of revolution:
disk method, 107, 108
shell method, 107
Wallis’s product, 372
Wave equation, 375
Weierstrass M test:
for integrals, 327, 338–343
for series, 280, 303
Wilson, E.B., 161
Work, as a line integral, 252
x axis, 125
z axis, 125
intercept, 135
Zeno of Elea, 279
Zero, 1
division by, 9
measure, 98, 109
vector, 161
