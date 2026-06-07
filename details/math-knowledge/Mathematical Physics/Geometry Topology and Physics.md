# Geometry Topology and Physics

Source title: GRADUA TE STUDENT SERIES IN PHYSICS

Converted from: `11.pdf`


## Page 1

GRADUA TE STUDENT SERIES IN PHYSICS
Series Editor:
Professor Douglas F Brewer, MA, DPhil
Emeritus Professor of Experimental Physics, University of Sussex
GEOMETRY , TOPOLOGY
AND PHYSICS
SECOND EDITION
MIKIO NAKAHARA
Department of Physics
Kinki University, Osaka, Japan
INSTITUTE OF PHYSICS PUBLISHING
Bristol and Philadelphia


## Page 2

c
/AD IOP Publishing Ltd 2003
All rights reserved. No part of this publication may be reproduced, stored
in a retrieval system or transmitted in any form or by any means, electronic,
mechanical, photocopying, recording or otherwise, without the prior permission
of the publisher. Multiple copying is permitted in accordance with the terms
of licences issued by the Copyright Licensing Agency under the terms of its
agreement with Universities UK (UUK).
British Library Cataloguing-in-Publication Data
A catalogue record for this book is available from the British Library.
ISBN 0 7503 0606 8
Library of Congress Cataloging-in-Publication Data are available
Commissioning Editor: Tom Spicer
Production Editor: Simon Laurenson
Production Control: Sarah Plenty
Cover Design: Victoria Le Billon
Marketing: Nicola Newey and V erity Cooke
Published by Institute of Physics Publishing, wholly owned by The Institute of
Physics, London
Institute of Physics Publishing, Dirac House, Temple Back, Bristol BS1 6BE, UK
US Ofﬁce: Institute of Physics Publishing, The Public Ledger Building, Suite
929, 150 South Independence Mall West, Philadelphia, P A 19106, USA
Typeset in LATEX2
Ꜽ
by Text 2 Text, Torquay, Devon
Printed in the UK by MPG Books Ltd, Bodmin, Cornwall


## Page 3

Dedicated to my family


## Page 4

CONTENTS
Preface to the First Edition
Preface to the Second Edition
How to Read this Book
Notation and Conventions
1 Quantum Physics
1.1 Analytical mechanics
1.1.1 Newtonian mechanics
1.1.2 Lagrangian formalism
1.1.3 Hamiltonian formalism
1.2 Canonical quantization
1.2.1 Hilbert space, bras and kets
1.2.2 Axioms of canonical quantization
1.2.3 Heisenberg equation, Heisenberg picture and Schr¨ odinger
picture
1.2.4 Wavefunction
1.2.5 Harmonic oscillator
1.3 Path integral quantization of a Bose particle
1.3.1 Path integral quantization
1.3.2 Imaginary time and partition function
1.3.3 Time-ordered product a nd generating functional
1.4 Harmonic oscillator
1.4.1 Transition amplitude
1.4.2 Partition function
1.5 Path integral quantization of a Fermi particle
1.5.1 Fermionic harmonic oscillator
1.5.2 Calculus of Grassmann numbers
1.5.3 Differentiation
1.5.4 Integration
1.5.5 Delta-function
1.5.6 Gaussian integral
1.5.7 Functional derivative
1.5.8 Complex conjugation
1.5.9 Coherent states and completeness relation


## Page 5

1.5.10 Partition function of a fermionic oscillator
1.6 Quantization of a scalar ﬁeld
1.6.1 Free scalar ﬁeld
1.6.2 Interacting scalar ﬁeld
1.7 Quantization of a Dirac ﬁeld
1.8 Gauge theories
1.8.1 Abelian gauge theories
1.8.2 Non-Abelian gauge theories
1.8.3 Higgs ﬁelds
1.9 Magnetic monopoles
1.9.1 Dirac monopole
1.9.2 The Wu–Yang monopole
1.9.3 Charge quantization
1.10 Instantons
1.10.1 Introduction
1.10.2 The (anti-)self-dual solution
Problems
2 Mathematical Preliminaries
2.1 Maps
2.1.1 Deﬁnitions
2.1.2 Equivalence relation and equivalence class
2.2 Vector spaces
2.2.1 Vectors and vector spaces
2.2.2 Linear maps, images and kernels
2.2.3 Dual vector space
2.2.4 Inner product and adjoint
2.2.5 Tensors
2.3 Topological spaces
2.3.1 Deﬁnitions
2.3.2 Continuous maps
2.3.3 Neighbourhoods and Hausdorff spaces
2.3.4 Closed set
2.3.5 Compactness
2.3.6 Connectedness
2.4 Homeomorphisms and topological invariants
2.4.1 Homeomorphisms
2.4.2 Topological invariants
2.4.3 Homotopy type
2.4.4 Euler characteristic: an example
Problems


## Page 6

3 Homology Groups
3.1 Abelian groups
3.1.1 Elementary group theory
3.1.2 Finitely generated Abelia n groups and free Abelian groups
3.1.3 Cyclic groups
3.2 Simplexes and simplicial complexes
3.2.1 Simplexes
3.2.2 Simplicial complexes and polyhedra
3.3 Homology groups of simplicial complexes
3.3.1 Oriented simplexes
3.3.2 Chain group, cycle group and boundary group
3.3.3 Homology groups
3.3.4 Computation of H
0(K )
3.3.5 More homology computations
3.4 General properties of homology groups
3.4.1 Connectedness and homology groups
3.4.2 Structure of homology groups
3.4.3 Betti numbers and the Euler–Poincar´ e theorem
Problems
4 Homotopy Groups
4.1 Fundamental groups
4.1.1 Basic ideas
4.1.2 Paths and loops
4.1.3 Homotopy
4.1.4 Fundamental groups
4.2 General properties of fundamental groups
4.2.1 Arcwise connectedness and fundamental groups
4.2.2 Homotopic invariance of fundamental groups
4.3 Examples of fundamental groups
4.3.1 Fundamental group of torus
4.4 Fundamental groups of polyhedra
4.4.1 Free groups and relations
4.4.2 Calculating fundamental groups of polyhedra
4.4.3 Relations between H
1(K ) and π 1(|K|)
4.5 Higher homotopy groups
4.5.1 Deﬁnitions
4.6 General properties of higher homotopy groups
4.6.1 Abelian nature of higher homotopy groups
4.6.2 Arcwise connectedness and higher homotopy groups
4.6.3 Homotopy invariance of higher homotopy groups
4.6.4 Higher homotopy groups of a product space
4.6.5 Universal covering spaces and higher homotopy groups
4.7 Examples of higher homotopy groups


## Page 7

4.8 Orders in condensed matter systems
4.8.1 Order parameter
4.8.2 Superﬂuid 4He and superconductors
4.8.3 General consideration
4.9 Defects in nematic liquid crystals
4.9.1 Order parameter of nematic liquid crystals
4.9.2 Line defects in nematic liquid crystals
4.9.3 Point defects in nematic liquid crystals
4.9.4 Higher dimensional texture
4.10 Textures in superﬂuid
3He-A
4.10.1 Superﬂuid 3He-A
4.10.2 Line defects and non-singular vortices in 3He-A
4.10.3 Shankar monopole in 3He-A
Problems
5 Manifolds
5.1 Manifolds
5.1.1 Heuristic introduction
5.1.2 Deﬁnitions
5.1.3 Examples
5.2 The calculus on manifolds
5.2.1 Differentiable maps
5.2.2 Vectors
5.2.3 One-forms
5.2.4 Tensors
5.2.5 Tensor ﬁelds
5.2.6 Induced maps
5.2.7 Submanifolds
5.3 Flows and Lie derivatives
5.3.1 One-parameter group of transformations
5.3.2 Lie derivatives
5.4 Differential forms
5.4.1 Deﬁnitions
5.4.2 Exterior derivatives
5.4.3 Interior product and Lie derivative of forms
5.5 Integration of differential forms
5.5.1 Orientation
5.5.2 Integration of forms
5.6 Lie groups and Lie algebras
5.6.1 Lie groups
5.6.2 Lie algebras
5.6.3 The one-parameter subgroup
5.6.4 Frames and structure equation
5.7 The action of Lie groups on manifolds


## Page 8

5.7.1 Deﬁnitions
5.7.2 Orbits and isotropy groups
5.7.3 Induced vector ﬁelds
5.7.4 The adjoint representation
Problems
6 de Rham Cohomology Groups
6.1 Stokes’ theorem
6.1.1 Preliminary consideration
6.1.2 Stokes’ theorem
6.2 de Rham cohomology groups
6.2.1 Deﬁnitions
6.2.2 Duality of Hr (M) and Hr (M); de Rham’s theorem
6.3 Poincar´ e’s lemma
6.4 Structure of de Rham cohomology groups
6.4.1 Poincar´ e duality
6.4.2 Cohomology rings
6.4.3 The K¨ unneth formula
6.4.4 Pullback of de Rham cohomology groups
6.4.5 Homotopy and H 1(M)
7 Riemannian Geometry
7.1 Riemannian manifolds and pseudo-Riemannian manifolds
7.1.1 Metric tensors
7.1.2 Induced metric
7.2 Parallel transport, connection and covariant derivative
7.2.1 Heuristic introduction
7.2.2 Afﬁne connections
7.2.3 Parallel transport and geodesics
7.2.4 The covariant derivative of tensor ﬁelds
7.2.5 The transformation properties of connection coefﬁcients
7.2.6 The metric connection
7.3 Curvature and torsion
7.3.1 Deﬁnitions
7.3.2 Geometrical meaning of the Riemann tensor and the
torsion tensor
7.3.3 The Ricci tensor and the scalar curvature
7.4 Levi-Civita connections
7.4.1 The fundamental theorem
7.4.2 The Levi-Civita connection in the classical geometry of
surfaces
7.4.3 Geodesics
7.4.4 The normal coordinate system
7.4.5 Riemann curvature tensor with Levi-Civita connection
7.5 Holonomy


## Page 9

7.6 Isometries and conformal transformations
7.6.1 Isometries
7.6.2 Conformal transformations
7.7 Killing vector ﬁelds and conformal Killing vector ﬁelds
7.7.1 Killing vector ﬁelds
7.7.2 Conformal Killing vector ﬁelds
7.8 Non-coordinate bases
7.8.1 Deﬁnitions
7.8.2 Cartan’s structure equations
7.8.3 The local frame
7.8.4 The Levi-Civita connection in a non-coordinate basis
7.9 Differential forms and Hodge theory
7.9.1 Invariant volume elements
7.9.2 Duality transformations (Hodge star)
7.9.3 Inner products of r-forms
7.9.4 Adjoints of exterior derivatives
7.9.5 The Laplacian, harmonic forms and the Hodge
decomposition theorem
7.9.6 Harmonic forms and de Rham cohomology groups
7.10 Aspects of general relativity
7.10.1 Introduction to general relativity
7.10.2 Einstein–Hilbert action
7.10.3 Spinors in curved spacetime
7.11 Bosonic string theory
7.11.1 The string action
7.11.2 Symmetries of the Polyakov strings
Problems
8 Complex Manifolds
8.1 Complex manifolds
8.1.1 Deﬁnitions
8.1.2 Examples
8.2 Calculus on complex manifolds
8.2.1 Holomorphic maps
8.2.2 Complexiﬁcations
8.2.3 Almost complex structure
8.3 Complex differential forms
8.3.1 Complexiﬁcation of real differential forms
8.3.2 Differential forms on complex manifolds
8.3.3 Dolbeault operators
8.4 Hermitian manifolds and Hermitian differential geometry
8.4.1 The Hermitian metric
8.4.2 K¨ ahler form
8.4.3 Covariant derivatives


## Page 10

8.4.4 Torsion and curvature
8.5 K¨ ahler manifolds and K¨ahler differential geometry
8.5.1 Deﬁnitions
8.5.2 K¨ ahler geometry
8.5.3 The holonomy group of K¨ ahler manifolds
8.6 Harmonic forms and
 ∂ -cohomology groups
8.6.1 The adjoint operators ∂ † and
 ∂ † 337
8.6.2 Laplacians and the Hodge theorem
8.6.3 Laplacians on a K¨ ahler manifold
8.6.4 The Hodge numbers of K¨ ahler manifolds
8.7 Almost complex manifolds
8.7.1 Deﬁnitions
8.8 Orbifolds
8.8.1 One-dimensional examples
8.8.2 Three-dimensional examples
9 Fibre Bundles
9.1 Tangent bundles
9.2 Fibre bundles
9.2.1 Deﬁnitions
9.2.2 Reconstruction of ﬁbre bundles
9.2.3 Bundle maps
9.2.4 Equivalent bundles
9.2.5 Pullback bundles
9.2.6 Homotopy axiom
9.3 Vector bundles
9.3.1 Deﬁnitions and examples
9.3.2 Frames
9.3.3 Cotangent bundles and dual bundles
9.3.4 Sections of vector bundles
9.3.5 The product bundle and Whitney sum bundle
9.3.6 Tensor product bundles
9.4 Principal bundles
9.4.1 Deﬁnitions
9.4.2 Associated bundles
9.4.3 Triviality of bundles
Problems
10 Connections on Fibre Bundles
10.1 Connections on principal bundles
10.1.1 Deﬁnitions
10.1.2 The connection one-form
10.1.3 The local connection form and gauge potential
10.1.4 Horizontal lift and parallel transport
10.2 Holonomy


## Page 11

10.2.1 Deﬁnitions
10.3 Curvature
10.3.1 Covariant derivatives in principal bundles
10.3.2 Curvature
10.3.3 Geometrical meaning of the curvature and the Ambrose–
Singer theorem
10.3.4 Local form of the curvature
10.3.5 The Bianchi identity
10.4 The covariant derivative on associated vector bundles
10.4.1 The covariant derivative on associated bundles
10.4.2 A local expression for the covariant derivative
10.4.3 Curvature rederived
10.4.4 A connection which preserves the inner product
10.4.5 Holomorphic vector b undles and Hermitian inner
products
10.5 Gauge theories
10.5.1 U(1) gauge theory
10.5.2 The Dirac magnetic monopole
10.5.3 The Aharonov–Bohm effect
10.5.4 Yang–Mills theory
10.5.5 Instantons
10.6 Berry’s phase
10.6.1 Derivation of Berry’s phase
10.6.2 Berry’s phase, Berry’s connection and Berry’s curvature
Problems
11 Characteristic Classes
11.1 Invariant polynomials and the Chern–Weil homomorphism
11.1.1 Invariant polynomials
11.2 Chern classes
11.2.1 Deﬁnitions
11.2.2 Properties of Chern classes
11.2.3 Splitting principle
11.2.4 Universal bundles and classifying spaces
11.3 Chern characters
11.3.1 Deﬁnitions
11.3.2 Properties of the Chern characters
11.3.3 Todd classes
11.4 Pontrjagin and Euler classes
11.4.1 Pontrjagin classes
11.4.2 Euler classes
11.4.3 Hirzebruch L-polynomial and ˆA-genus
11.5 Chern–Simons forms
11.5.1 Deﬁnition


## Page 12

11.5.2 The Chern–Simons form of the Chern character
11.5.3 Cartan’s homotopy operator and applications
11.6 Stiefel–Whitney classes
11.6.1 Spin bundles
11.6.2 ˇCech cohomology groups
11.6.3 Stiefel–Whitney classes
12 Index Theorems
12.1 Elliptic operators and Fredholm operators
12.1.1 Elliptic operators
12.1.2 Fredholm operators
12.1.3 Elliptic complexes
12.2 The Atiyah–Singer index theorem
12.2.1 Statement of the theorem
12.3 The de Rham complex
12.4 The Dolbeault complex
12.4.1 The twisted Dolbeault complex and the Hirzebruch–
Riemann–Roch theorem
12.5 The signature complex
12.5.1 The Hirzebruch signature
12.5.2 The signature complex and the Hirzebruch signature
theorem
12.6 Spin complexes
12.6.1 Dirac operator
12.6.2 Twisted spin complexes
12.7 The heat kernel and generalized ζ -functions
12.7.1 The heat kernel and index theorem
12.7.2 Spectral ζ -functions
12.8 The Atiyah–Patodi–Singer index theorem
12.8.1 η -invariant and spectral ﬂow
12.8.2 The Atiyah–Patodi–Singer (APS) index theorem
12.9 Supersymmetric quantum mechanics
12.9.1 Clifford algebra and fermions
12.9.2 Supersymmetric quantum mechanics in ﬂat space
12.9.3 Supersymmetric quantum mechanics in a general
manifold
12.10 Supersymmetric proof of index theorem
12.10.1 The index
12.10.2 Path integral and index theorem
Problems


## Page 13

13 Anomalies in Gauge Field Theories
13.1 Introduction
13.2 Abelian anomalies
13.2.1 Fujikawa’s method
13.3 Non-Abelian anomalies
13.4 The Wess–Zumino consistency conditions
13.4.1 The Becchi–Rouet–Stora operator and the Faddeev–
Popov ghost
13.4.2 The BRS operator, FP ghost and moduli space
13.4.3 The Wess–Zumino conditions
13.4.4 Descent equations and solutions of WZ conditions
13.5 Abelian anomalies versus non-Abelian anomalies
13.5.1 m dimensions versus m+ 2 dimensions
13.6 The parity anomaly in odd-dimensional spaces
13.6.1 The parity anomaly
13.6.2 The dimensional ladder: 4–3–2
14 Bosonic String Theory
14.1 Differential geometry on Riemann surfaces
14.1.1 Metric and complex structure
14.1.2 Vectors, forms and tensors
14.1.3 Covariant derivatives
14.1.4 The Riemann–Roch theorem
14.2 Quantum theory of bosonic strings
14.2.1 Vacuum amplitude of Polyakov strings
14.2.2 Measures of integration
14.2.3 Complex tensor calculus and string measure
14.2.4 Moduli spaces of Riemann surfaces
14.3 One-loop amplitudes
14.3.1 Moduli spaces, CKV , Beltrami and quadratic differentials
14.3.2 The evaluation of determinants
References


## Page 14

PREFACE TO THE FIRST EDITION
This book is a considerable expansion of lectures I gave at the School of
Mathematical and Physical Sciences, U niversity of Sussex during the winter
term of 1986. The audience included postgraduate students and faculty members
working in particle physics, condensed matter physics and general relativity. The
lectures were quite informal and I have tried to keep this informality as much as
possible in this book. The proof of a theorem is given only when it is instructive
and not very technical; otherwise exam ples will make the theorem plausible.
Many ﬁgures will help the reader to obtain concrete images of the subjects.
In spite of the extensive use of the concepts of topology, differential ge-
ometry and other areas of contemporar y mathematics in recent developments in
theoretical physics, it is rather difﬁcult to ﬁnd a self-contained book that is easily
accessible to postgraduate students in physics. This book is meant to ﬁll the gap
between highly advanced books or research papers and the many excellent intro-
ductory books. As a reader, I imagined a ﬁrst-year postgraduate student in theo-
retical physics who has some familiarity with quantum ﬁeld theory and relativity.
In this book, the reader will ﬁnd many examples from physics, in which topo-
logical and geometrical notions are very i mportant. These examples are eclectic
collections from particle physics, general relativity and condensed matter physics.
Readers should feel free to skip examples that are out of their direct concern.
However, I believe these examples should be the theoretical minima to students
in theoretical physics. Mathematicians who are interested in the application of
their discipline to theoretical physics will also ﬁnd this book interesting.
The book is largely divided into four parts. Chapters 1 and 2 deal with the
preliminary concepts in physics and mathematics, respectively. In chapter 1,
a brief summary of the physics treated in this book is given. The subjects
covered are path integrals, gauge theories (including monopoles and instantons),
defects in condensed matter physics, general relativity, Berry’s phase in quantum
mechanics and strings. Most of the subjects are subsequently explained in detail
from the topological and geometrical viewpoints. Chapter 2 supplements the
undergraduate mathematics that the average physicist has studied. If readers are
quite familiar with sets, maps and general topology, they may skip this chapter
and proceed to the next.
Chapters 3 to 8 are devoted to the basics of algebraic topology and
differential geometry. In chapters 3 and 4, the idea of the classiﬁcation of spaces
with homology groups and homotopy groups is introduced. In chapter 5, we


## Page 15

deﬁne a manifold, which is one of the central concepts in modern theoretical
physics. Differential forms deﬁned there play very important roles throughout this
book. Differential forms allow us to deﬁne the dual of the homology group called
the de Rham cohomology group in chapter 6. Chapter 7 deals with a manifold
endowed with a metric. With the met ric, we may deﬁne such geometrical
concepts as connection, covariant derivat ive, curvature, torsion and many more.
In chapter 8, a complex manifold is deﬁned as a special manifold on which there
exists a natural complex structure.
Chapters 9 to 12 are devoted to the uniﬁcation of topology and geometry.
In chapter 9, we deﬁne a ﬁbre bundle and show that this is a natural setting
for many physical phenomena. The connection deﬁned in chapter 7 is naturally
generalized to that on ﬁbre bundles in chapter 10. Characteristic classes deﬁned
in chapter 11 enable us to classify ﬁbre bundles using various cohomology
classes. Characteristic classes are particularly important in the Atiyah–Singer
index theorem in chapter 12. We do not prove this, one of the most important
theorems in contemporary mathematics, but simply write down the special forms
of the theorem so that we may use them in practical applications in physics.
Chapters 13 and 14 are devoted to the most fascinating applications of
topology and geometry in contemporary physics. In chapter 13, we apply the
theory of ﬁbre bundles, characteristic classes and index theorems to the study of
anomalies in gauge theories. In chapter 14, Polyakov’s bosonic string theory is
analysed from the geometrical point of view. We give an explicit computation of
the one-loop amplitude.
I would like to express deep gratitude to my teachers, friends and students.
Special thanks are due to Tetsuya Asai, David Bailin, Hiroshi Khono, David
Lancaster, Shigeki Matsutani, Hiroyuki Nagashima, David Pattarini, Felix E A
Pirani, Kenichi Tamano, David Waxman and David Wong. The basic concepts
in chapter 5 owe very much to the lectures by F E A Pirani at King’s College,
University of London. The evaluation of the string Laplacian in chapter 14 using
the Eisenstein series and the Kronecker limiting formula was suggested by T Asai.
I would like to thank Euan Squires, Davi d Bailin and Hiroshi Khono for useful
comments and suggestions. David Bailin suggested that I should write this book.
He also advised Professor Douglas F Brewer to include this book in his series. I
would like to thank the Science and Engineering Research Council of the United
Kingdom, which made my stay at Sussex possible. It is a pity that I have no
secretary to thank for the beautiful typing. Word processing has been carried out
by myself on two NEC PC9801 computers. Jim A Revill of Adam Hilger helped
me in many ways while preparing the manuscript. His indulgence over my failure
to meet deadlines is also acknowledge d. Many musicians have ﬁlled my ofﬁce
with beautiful music during the preparation of the manuscript: I am grateful to
J S Bach, Ryuichi Sakamoto, Ravi Shankar and Erik Satie.
Mikio Nakahara
Shizuoka, February 1989


## Page 16

PREFACE TO THE SECOND EDITION
The ﬁrst edition of the present book was published in 1990. There has been
incredible progress in geometry and topology applied to theoretical physics and
vice versa since then. The boundaries among these disciplines are quite obscure
these days.
I found it impossible to take all the progress into these ﬁelds in this second
edition and decided to make the revision minimal. Besides correcting typos, errors
and miscellaneous small additions, I added the proof of the index theorem in terms
of supersymmetric quantum mechanics. There are also some rearrangements of
material in many places. I have learned from publications and internet homepages
that the ﬁrst edition of the book has been read by students and researchers from a
wide variety of ﬁelds, not only in physics and mathematics but also in philosophy,
chemistry, geodesy and oceanology among others. This is one of the reasons
why I did not specialize this book to th e forefront of recent developments. I
hope to publish a separate book on the recent fascinating application of quantum
ﬁeld theory to low dimensional topology and number theory, possibly with a
mathematician or two, in the near future.
The ﬁrst edition of the book has been used in many classes all over the world.
Some of the lecturers gave me valuable comments and suggestions. I would like
to thank, in particular, Jouko Mikkelsson for constructive suggestions. Kazuhiro
Sakuma, my fellow mathematician, joined me to translate the ﬁrst edition of the
book into Japanese. He gave me valuable comments and suggestions from a
mathematician’s viewpoint. I also want to thank him for frequent discussions
and for clarifying many of my questions. I had a chance to lecture on the material
of the book while I was a visiting professor at Helsinki University of Technology
during fall 2001 through spring 2002. I would like to thank Martti Salomaa for
warm hospitality at his materials physics laboratory. Sami Virtanen was the course
assisitant whom I would like to thank for his excellent work. I would also like to
thank Juha Vartiainen, Antti Laiho, Teemu Ojanen, Teemu Keski-Kuha, Markku
Stenberg, Juha Heiskala, Tuomas Hyt¨onen, Antti Niskanen and Ville Bergholm
for helping me to ﬁnd typos and errors in the manuscript and also for giving me
valuable comments and questions.
Jim Revill and Tom Spicer of IOP Publishing have always been generous
in forgiving me for slow revision. I would like to thank them for their generosity
and patience. I also want to thank Simon Laurenson for arranging the copyediting,
typesetting and proofreading and Sarah Plenty for arranging the printing, binding


## Page 17

and scheduling. The ﬁrst edition of the book was prepared using an old NEC
computer whose operating system no longer exists. I hesitated to revise the
book mainly because I was not so courageous as to type a more-than-500-page
book again. Thanks to the progress of information technology, IOP Publishing
scanned all the pages of the book and supplied me with the ﬁles, from which I
could extract the text ﬁles with the help of optical character recognition (OCR)
software. I would like to thank the technical staff of IOP Publishing for this
painstaking work. The OCR is not good enough to produce the L
ATEX codes for
equations. Mariko Kamada edited the equations from the ﬁrst version of the book.
I would like to thank Yukitoshi Fujimura of Peason Education Japan for frequent
TEX-nical assistance. He edited the Japanese translation of the ﬁrst edition of the
present book and produced an excellent LATEX ﬁle, from which I borrowed many
LATEX deﬁnitions, styles, diagrams and so on. Without the Japanese edition, the
publication of this second edition would have been much more difﬁcult.
Last but not least, I would thank my family to whom this book is dedicated.
I had to spend an awful lot of weekends on this revision. I wish to thank my
wife, Fumiko, and daughters, Lisa and Yuri, for their patience. I hope my
little daughters will someday pick up thi s book in a library or a bookshop and
understand what their dad was doing at weekends and late after midnight.
Mikio Nakahara
Nara, December 2002


## Page 18

HOW TO READ THIS BOOK
As the author of this book, I strongly wish that this book is read in order. However,
I admit that the book is thick and the materials contained in it are diverse. Here
I want to suggest some po ssibilities when t his book is used for a course in
mathematics or mathematical physics.
(1) A one year course on mathematical physics: chapters 1 through 10.
Chapters 11 and 12 are optional.
(2) A one-year course on geometry and topology for mathematics students:
chapters 2 through 12. Chapter 2 may be omitted if students are familiar with
elementary topology. Topics from physics may be omitted without causing
serious problems.
(3) A single-semester course on geometry and topology: chapters 2 through
7. Chapter 2 may be omitted if the students are familiar with elementary
topology. Chapter 8 is optional.
(4) A single-semester course on differential geometry for general relativity:
chapters 2, 5 and 7.
(5) A single-semester course on advanced mathematical physics: sections 1.1–
1.7 and sections 12.9 and 12.10, assuming that students are familiar with
Riemannian geometry and ﬁbre bundles. This makes a self-contained course
on the path integral and its application to index theorem.
Some repetition of the material or a s ummary of the subjects introduced in
the previous part are made to make these choices possible.


## Page 19

NOTATION AND CONVENTIONS
The symbols /C6 , /CI , /C9 , /CA and /BV denote the sets of natural numbers, integers,
rational numbers, real numbers and complex numbers, respectively. The set of
quaternions is deﬁned by
/C0 ={ a+ bi+ c j+ d k| a, b, c, d∈/CA }
where (1, i, j, k) is a basis such that i· j =−j· i = k, j· k =−k· j = i,
k· i=−i· k= j, i2 = j2 = k2 =−1. Note that i, j and k have the 2×2m a t r i x
representations i= iσ 3, j= iσ 2, k= iσ 1 where σ i are the Pauli spin matrices
σ 1 =
( 01
10
)
σ 2 =
( 0 −i
i0
)
σ 3 =
( 10
0 −1
)
.
The imaginary part of a complex number z is denoted by Im z while the real part
is Re z.
We put c (speed of light) = ¯h (Planck’s constant/2π )= k
B (Boltzmann’s
constant) = 1, unless otherwise stated explicitly. We employ the Einstein
summation convention: if the same index appears twice, once as a superscript
and once as a subscript, then the index is summed over all possible values. For
example, if µ runs from 1 to m, one has
Aµ Bµ =
m∑
µ=1
Aµ Bµ.
The Euclid metric isgµν = δµν = diag(+1,..., +1) while the Minkowski metric
is gµν = η µν = diag(−1,+1,..., +1).
The symbol /A3 denotes ‘the end of a proof’.


## Page 20

1
QUANTUM PHYSICS
A brief introduction to path integral quantization is presented in this chapter.
Physics students who are familiar with this subject and mathematics students who
are not interested in physics may skip thischapter and proceed directly to the next
chapter. Our presentation is sketchy and a more detailed account of this subject
is found in Bailin and Love (1996), Cheng and Li (1984), Huang (1982), Das
(1993), Kleinert (1990), Ramond (1989), Ryder (1986) and Swanson (1992). We
closely follow Alvarez (1995), Bertlmann (1996), Das (1993), Nakahara (1998),
Rabin (1995), Sakita (1985) and Swanson (1992).
1.1 Analytical mechanics
We introduce some elementary princ iples of Lagrangian and Hamiltonian
formalisms that are necessary to understand quantum mechanics.
1.1.1 Newtonian mechanics
Let us consider the motion of a particle m in three-dimensional space and let x(t)
denote the position of m at time t.
1 Suppose this particle is moving under an
external force F(x).T h e nx(t) satisﬁes the second-order differential equation
m d2 x(t)
dt2 = F(x(t)) (1.1)
called Newton’s equation or the equation of motion.
If force F(x) is expressed in terms of a scalar function V (x) as F(x) =
−∇V (x), the force is called a conserved force and the function V (x) is called
the potential energy or simply the potential.W h e nF is a conserved force, the
combination
E= m
2
( dx
dt
) 2
+ V (x) (1.2)
is conserved. In fact,
dE
dt =
∑
k=x,y,z
[
m dxk
dt
d2xk
dt2 + ∂ V
∂ xk
dxk
dt
]
=
∑
k
(
m d2xk
dt2 + ∂ V
∂ xk
)
dxk
dt = 0
1 We call a particle with mass m simply ‘a particle m’.


## Page 21

where use has been made of the equation of motion. The function E,w h i c hi s
often the sum of the kinetic energy and the potential energy, is called the energy.
Example 1.1. (One-dimensional harmonic oscillator )L e t x be the coordinate
and suppose the force acting on m is F(x)=−kx , k being a constant. This force
is conservative. In fact, V (x) = 1
2 kx 2 yields F(x) =−dV (x)/dx =−kx .
In general, any one-dimensional force F(x) which is a function of x only is
conserved and the potential is given by
V (x)=−
∫ x
F(ξ )dξ.
An example of a force that is not conserved is friction F =−η dx/dt.W e
will be concerned only with conserved forces in the following.
1.1.2 Lagrangian formalism
Newtonian mechanics has the following difﬁculties;
1. This formalism is based on a vector equation (1.1) which is not very easy to
handle unless an orthogonal coordinate system is employed.
2. The equation of motion is a second-order equation and the global properties
of the system cannot be ﬁgured out easily.
3. The analysis of symmetries is not easy.
4. Constraints are difﬁcult to take into account.
Furthermore, quantum mechanics cannot be derived directly from
Newtonian mechanics. The Lagrangian formalism is now introduced to overcome
these difﬁculties.
Let us consider a system whose state (the position of masses for example)
is described by N parameters{qi} (1 ≤i ≤N). The parameter is an element
of some space M .2 The space M is called the conﬁguration space and the{qi}
are called the generalized coordinates. If one considers a particle on a circle, for
example, the generalized coordinate q is an angle θ and the conﬁguration space
M is a circle. The generalized velocity is deﬁned by˙qi = dqi /dt.
The Lagrangian L(q,˙q) is a function to be deﬁned in Hamilton’s
principle later. We will restrict ourselv es mostly to one-dimensional space but
generalization to higher-dimensional space should be obvious. Let us consider
a trajectory q(t)( t ∈[ti , t f]) of a particle with conditions q(ti ) = qi and
q(t f )= q f . Consider a functional3
S[q(t),˙q(t)]=
∫ t f
ti
L(q,˙q) dt (1.3)
2 A manifold, to be more precise, see chapter 5.
3 A functional is a function of functions. A function f (•) produces a number f (x) for a given number
x. Similarly, a functional F[•]assigns a number F[ f] to a given function f (x).


## Page 22

called the action. Given a trajectory q(t) and ˙q(t), the action S[q,˙q] produces
a real number. Hamilton’s principle, also known as the principle of the least
action, claims that the physically realized trajectory corresponds to an extremum
of the action. Now the Lagrangian must be chosen so that Hamilton’s principle is
fulﬁlled.
It turns out to be convenient to write Hamilton’s principle in a local form
as a differential equation. Suppose q(t) is a path realizing an extremum of S.
Consider a variation δq(t) of the trajectory such that δq(ti )= δq(t f )= 0. The
action changes under this variation by
δ S=
∫ t f
ti
L(q+ δq,˙q+ δ˙q) dt−
∫ t f
ti
L(q,˙q) dt
=
∫ t f
ti
( ∂ L
∂ q −d
dt
∂ L
∂˙q
)
δq dt (1.4)
which must vanish because q yields an extremum of S. Since this is true for any
δq, the integrand of the last line of (1.4) must vanish. Thus, the Euler–Lagrange
equation
∂ L
∂ q −d
dt
∂ L
∂˙q = 0 (1.5)
has been obtained. If there are N degrees of freedom, one obtains
∂ L
∂ qk
−d
dt
∂ L
∂˙qk
= 0 (1≤k≤N). (1.6)
If we introduce the generalized momentum conjugate to the coordinate qk
by
pk = ∂ L
∂˙qk
(1.7)
the Euler–Lagrange equation takes the form
d pk
dt = ∂ L
∂ qk
. (1.8)
By requiring this equation to reduce to Newton’s equation, one quickly ﬁnds the
possible form of the Lagrangian in the ordinary mechanics of a particle. Let us
put L=
1
2 m˙q2−V (q). By substituting this Lagrangian into the Euler–Lagrange
equation, it is easily shown that it reduces to Newton’s equation of motion,
m¨qk + ∂ V
∂ qk
= 0. (1.9)
Let us consider the one-dimensional harmonic oscillator for example. The
Lagrangian is
L(x,˙x)= 1
2 m˙x2−1
2 kx 2 (1.10)


## Page 23

from which one ﬁnds m¨x+ kx = 0.
It is convenient for later purposes to introduce the notion of a functional
derivative. Let us consider the case with a single degree of freedom for simplicity.
Deﬁne the functional derivative of S with respect to q by
δ S[q,˙q]
δq(s) ≡lim
ε→0
{S[q(t)+ εδ( t−s),˙q(t)+ ε d
dt δ(t−s)]−S[q(t),˙q(t)]}
ε .
(1.11)
Since
S
[
q(t)+ εδ( t−s),˙q(t)+ ε d
dt δ(t−s)
]
=
∫
dtL
(
q(t)+ εδ( t−s),˙q(t)+ ε d
dt δ(t−s)
)
=
∫
dtL (q,˙q)+ ε
∫
dt
( ∂ L
∂ q δ(t−s)+ ∂ L
∂˙q
d
dt δ(t−s)
)
+ /C7 (ε2)
= S[q,˙q]+ ε
( ∂ L
∂ q (s)−d
dt
∂ L
∂˙q (s)
)
+ /C7 (ε2),
the Euler–Lagrange equation may be written as
δ S
δq(s)= ∂ L
∂ q (s)−d
dt
( ∂ L
∂˙q
)
(s)= 0. (1.12)
Let us next consider symmetries in the context of the Lagrangian formalism.
Suppose the Lagrangian L is independent of a certain coordinate qk .4 Such
a coordinate is called cyclic. The momentum which is conjugate to a cyclic
coordinate is conserved. In fact, the condition ∂ L/∂ qk = 0 leads to
d pk
dt = d
dt
∂ L
∂˙qk
= ∂ L
∂ qk
= 0. (1.13)
This argument can be mathematically elaborated as follows. Suppose the
Lagrangian L has a symmetry, which is continuously parametrized. This means,
more precisely, that the action S =
∫
dtL is invariant under the symmetry
operation on qk (t). Let us consider an inﬁnitesimal symmetry operation qk (t)→
qk (t)+ δqk (t) on the path qk (t).5 This implies that if qk (t) is a path producing
an extremum of the action, then qk (t)→qk (t)+ δqk (t) also corresponds to an
extremum. Since S is invariant under this change, it follows that
δ S=
∫ t f
ti
∑
k
δqk
( ∂ L
∂ qk
−d
dt
∂ L
∂˙qk
)
+
∑
k
[
δqk
∂ L
∂˙qk
] t f
ti
= 0.
4 Of course, L may depend on˙qk. Otherwise, the coordinate qk is not our concern at all.
5 Since the symmetry is continuous, it is always po ssible to deﬁne such an inﬁnitesimal operation.
Needless to say, δq(ti ) and δq(t f ) do not, in general, vanish in the present case.


## Page 24

The ﬁrst term in the middle expression vanishes sinceq is a solution to the Euler–
Lagrange equation. Accordingly, we obtain
∑
k
δqk (ti )pk (ti )=
∑
k
δqk (t f )pk (t f ) (1.14)
where use has been made of the deﬁnition pk = ∂ L/∂˙qk.S i n c e ti and t f
are arbitrary, this equation shows that the quantity ∑
k δqk (t)pk (t) is, in fact,
independent of t and hence conserved.
Example 1.2. Let us consider a particle m moving under a force produced by a
spherically symmetric potential V (r ),w h e r er,θ,φ are three-dimensional polar
coordinates. The Lagrangian is given by
L= 1
2 m[˙r2+ r2(˙θ 2+ sin2 θ˙φ 2)]−V (r ).
Note that qk = φ is cyclic, which leads to the conservation law
δφ ∂ L
∂˙φ ∝mr 2 sin2 θ˙φ = constant.
This is nothing but the angular momentum around the z axis. Similar arguments
can be employed to show that the angular momenta around the x and y axes are
also conserved.
A few remarks are in order:
• Let Q(q) be an arbitrary function of q. Then the Lagrangians L and
L+ dQ/dt yield the same Euler–Lagrange equation. In fact,
∂
∂ qk
(
L+ dQ
dt
)
−d
dt
[ ∂
∂˙qk
(
L+ dQ
dt
)]
= ∂ L
∂ qk
+ ∂
∂ qk
dQ
dt −d
dt
∂ L
∂˙qk
−d
dt
∂
∂˙qk
( ∑
j
∂ Q
∂ q j
˙q j
)
= ∂
∂ qk
dQ
dt −d
dt
∂ Q
∂ qk
= 0.
• An interesting observation is that N ewtonian mechanics is realized as an
extremum of the action but the action itself is deﬁned forany trajectory. This
fact plays an important role in path integral formation of quantum theory.
1.1.3 Hamiltonian formalism
The Lagrangian formalism yields a second-order ordinary differencial equation
(ODE). In contrast, the Hamiltonian formalism gives equations of motion which
are ﬁrst order in the time derivative and, hence, we may introduce ﬂows in the


## Page 25

phase space deﬁned later. What is more important, however, is that we can make
the symplectic structure manifest in the Hamiltonian formalism, which will be
shown in example 5.12 later.
Suppose a Lagrangian L is given. Then the corresponding Hamiltonian is
introduced via Legendre transformation of variables as
H (q, p)≡
∑
k
pk˙qk−L(q,˙q), (1.15)
where˙q is eliminated in the left-hand side (LHS) in favour of p by making use of
the deﬁnition of the momentum pk = ∂ L(q,˙q)/∂˙qk. For this transformation to
be deﬁned, the Jacobian must satisfy
det
( ∂ pi
∂˙q j
)
= det
(
∂ 2 L
∂˙qi˙q j
)
̸= 0.
The space with coordinates (qk , pk ) is called the phase space.
Let us consider an inﬁnitesimal change in the Hamiltonian induced by δqk
and δpk,
δ H=
∑
k
[
δpk˙qk + pk δ˙qk −∂ L
∂ qk
δqk −∂ L
∂˙qk
δ˙qk
]
=
∑
k
[
δpk˙qk −∂ L
∂ qk
δqk
]
.
It follows from this relation that
∂ H
∂ pk
=˙qk , ∂ H
∂ qk
=−∂ L
∂ qk
(1.16)
which are nothing more than the repl acements of independent variables.
Hamilton’s equations of motion are obtained from these equations if the Euler–
Lagrange equation is employed to replace the LHS of the second equation,
˙qk = ∂ H
∂ pk
˙pk =−∂ H
∂ qk
. (1.17)
Example 1.3. Let us consider a one-dimensional harmonic oscillator with the
Lagrangian L= 1
2 m˙q2−1
2 mω 2q2,w h e r eω 2 = k/m. The momentum conjugate
to q is p = ∂ L/∂˙q = m˙q, which can be solved for ˙q to yield ˙q = p/m.T h e
Hamiltonian is
H (q, p)= p˙q−L(q,˙q)= p2
2m+ 1
2mω 2q2. (1.18)
Hamilton’s equations of motion are:
d p
dt =−mω 2q dq
dt = p
m . (1.19)


## Page 26

Let us take two functions A(q, p) and B(q, p) deﬁned on the phase space of
a Hamiltonian H . Then the Poisson bracket[A, B] is deﬁned by 6
[A, B]=
∑
k
( ∂ A
∂ qk
∂ B
∂ pk
−∂ A
∂ pk
∂ B
∂ qk
)
. (1.20)
Exercise 1.1. Show that the Poisson bracket is a Lie bracket, namely it satisﬁes
[A, c1 B1+ c2 B2]= c1[A, B1]+ c2[A, B2] linearity (1.21a)
[A, B]=−[B, A] skew-symmetry (1.21b)
[[A, B], C]+[[ C, A], B]+[[ B, C], A]= 0 Jacobi identity. (1.21c)
The fundamental Poisson brackets are
[ pi , p j]=[ qi , q j]= 0 [qi , p j]= δij . (1.22)
It is important to notice that the time development of a physical quantity
A(q, p) is expressed in terms of the Poisson bracket as
dA
dt =
∑
k
( dA
dqk
dqk
dt + dA
d pk
d pk
dt
)
=
∑
k
( dA
dqk
∂ H
∂ pk
−dA
d pk
∂ H
∂ qk
)
=[ A, H]. (1.23)
If it happens that [A, H]= 0, the quantity A is conserved, namely d A/dt = 0.
The Hamilton equations of motion themselves are written as
d pk
dt =[ pk , H] dqk
dt =[ qk , H]. (1.24)
Theorem 1.1. (Noether’s theorem )L e t H (qk, pk ) be a Hamiltonian which is
invariant under an inﬁnitesimal coordinate transformation qk →q′
k = qk +
ε fk (q).T h e n
Q=
∑
k
pk fk (q) (1.25)
is conserved.
Proof. One has H (qk, pk ) = H (q′
k, p′
k ) by deﬁnition. It follows from q′
k =
qk + ε fk (q) that the Jacobian associated with the coordinate change is
/Lambda1ij = ∂ q′
i
∂ q j
≃ δij + ε ∂ fi (q)
∂ q j
6 When the commutation relation[A, B] of operators is introduced later, the Poisson bracket will be
denoted as[A, B]PB to avoid confusion.


## Page 27

up to /C7 (ε). The momentum transforms under this coordinate change as
pi →
∑
j
p j /Lambda1−1
ji ≃ pi −ε
∑
j
p j
∂ f j
∂ qi
.
Then, it follows that
0= H (q′
k, p′
k )−H (qk, pk )
= ∂ H
∂ qk
ε f (q)−∂ H
∂ p j
ε pi
∂ fi
∂ q j
= ε
[ ∂ H
∂ qk
fk (q)−∂ H
∂ p j
pi
∂ fi
∂ q j
]
= ε[H, Q]= ε dQ
dt ,
which shows that Q is conserved. /A3
This theorem shows that to ﬁnd a conserved quantity is equivalent to ﬁnding
a transformation which leaves the Hamiltonian invariant.
A conserved quantity Q is the ‘generator’ of the transformation under
discussion. In fact,
[qi , Q]=
∑
k
[ ∂ qi
∂ qk
∂ Q
∂ pk
−∂ qi
∂ pk
∂ Q
∂ qk
]
=
∑
k
δik fk (q)= fi (q)
which shows that δqi = ε fi (q)= ε[qi , Q].
A few examples are in order. Let H = p2/2m be the Hamiltonian of a free
particle. Since H does not depend onq, it is invariant underq↦→q+ε·1, p↦→p.
Therefore, Q= p· 1= p is conserved. The conserved quantity Q is identiﬁed
with the linear momentum.
Example 1.4. Let us consider a paticlem moving in a two-dimensional plane with
the axial symmetric potential V (r ). The Lagrangian is
L(r,θ) = 1
2 m(˙r2+ r2˙φ 2)−V (r ).
The canonical conjugate momenta are:
pr = m˙rp θ = mr 2˙θ.
The Hamiltonian is
H= pr˙r+ pθ ˙θ−L= p2
r
2m+ p2
θ
2mr 2 + V (r ).
This Hamiltonian is clearly independent of θ and, hence, invariant under the
transformation
θ ↦→θ+ ε· 1, pθ ↦→pθ .


## Page 28

The corresponding conserved quantity is
Q= pθ · 1= mr 2˙θ
that is the angular momentum.
1.2 Canonical quantization
It was known by the end of the 19th century that classical physics,
namely Newtonian mechanics and classi cal electromagnetism, contains serious
inconsistencies. Later at the beginning of the 20th century, these were resolved by
the discoveries of special and general relativities and quantum mechanics. So far,
there is no single experiment which contradicts quantum theory. It is surprising,
however, that there is no proof for quantum theory. What one can say is that
quantum theory is not in contradiction to Nature. Accordingly, we do not prove
quantum mechanics here but will be satisﬁed with outlining some ‘rules’ on which
quantum theory is based.
1.2.1 Hilbert space, bras and kets
Let us consider a complex Hilbert space
7
/C0 ={| φ⟩,|ψ⟩,... }. (1.26)
An element of /C0 is called a ket or a ket vector.
A linear function α : /C0 →/BV is deﬁned by
α( c1|ψ 1⟩+ c2|ψ 2⟩)= c1α(|ψ 1⟩)+ c2α(|ψ 2⟩) ∀ci ∈/BV ,|ψ i⟩∈/C0 .
We employ a special notation introduced by Dirac and write the linear function
as⟨α| and the action as ⟨α|ψ⟩∈/BV . The set of linear functions is itself a vector
space called the dual vector space of /C0 , denoted /C0
∗. An element of /C0 is called
a bra or a bra vector.
Let{|e1⟩,|e2⟩,... } be a basis of /C0 .8 Any vector|ψ⟩∈/C0 is then expanded
as|ψ⟩= ∑
k ψ k|ek⟩,w h e r eψ k ∈/BV is called the kth component of|ψ⟩.N o wl e t
us introduce a basis {⟨ε1|,⟨ε2|,... } in /C0
∗. We require that this basis be a dual
basis of{|ek⟩},t h a ti s
⟨εi|ej⟩= δij . (1.27)
7 In quantum mechanics, a Hilbert space often means the space of square integrable functionsL2(M)
on a space (manifold) M. In the following, however, we need to deal with such functions as δ( x) and
eikx with inﬁnite norm. An extended Hilbert space which contains such functions is called the rigged
Hilbert space. The treatment of Hilbert spaces here is not mathematically rigorous but it will not cause
any inconvenience.
8 We assume /C0 is separable and there are, at most, a countably inﬁnite number of vectors in the basis.
Note that we cannot impose an orthonormal condition since we have not deﬁned the norm of a vector.


## Page 29

Then an arbitrar y linear function ⟨α| is expanded as ⟨α|= ∑
k α k⟨εk|,w h e r e
α k ∈/BV is the kth component of⟨α|. The action of ⟨α|∈/C0
∗on|ψ⟩∈/C0 is now
expressed in terms of their components as
⟨α|ψ⟩=
∑
ij
α i ψ j⟨εi|ej⟩=
∑
ij
α i ψ j δij =
∑
i
α i ψ i . (1.28)
One may consider|ψ⟩ as a column vector and ⟨α| as a row vector so that ⟨α|ψ⟩
is regarded as just a matrix multiplication of a row vector and a column vector,
yielding a scalar.
It is possible to introduce a one-to-one correspondence between elements in
/C0 and /C0
∗. Let us ﬁx a basis{|ek⟩} of /C0 and{⟨εk|} of /C0
∗. Then corresponding to
|ψ⟩= ∑
k ψ k|ek⟩, there exists an element ⟨ψ|= ∑
k ψ∗
k⟨εk|∈/C0
∗. The reason
for the complex conjugation of ψ k becomes clear shortly. Then it is possible to
introduce an inner product between two elements of /C0 .L e t|φ⟩,|ψ⟩∈/C0 .T h e i r
inner product is deﬁned by
(|φ⟩,|ψ⟩)≡⟨φ|ψ⟩=
∑
k
φ∗
k ψ k . (1.29)
We customarily use the same letter to denote corresponding bras and kets. The
norm of a vector |ψ⟩ is naturally deﬁned by the inner product. Let ∥|ψ⟩∥ =√
⟨ψ|ψ⟩. It is easy to show that this deﬁnition satisﬁes all the axioms of the norm.
Note that the norm is real and non-negative thanks to the complex conjugation in
the components of the bra vector.
By using the inner product between two ket vectors, it becomes possible
to construct an orthonormal basis {|ek⟩} such that (|ei⟩,|ej⟩) =⟨ ei|ej⟩= δij .
Suppose |ψ⟩= ∑
k ψ k|ek⟩. By multiplying ⟨ek| from the left, one obtains
⟨ek|ψ⟩= ψ k .T h e n|ψ⟩ is expressed as|ψ⟩= ∑
k⟨ek|ψ⟩|ek⟩= ∑
k|ek⟩⟨ek|ψ⟩.
Since this is true for any|ψ⟩, we have obtained the completeness relation
∑
k
|ek⟩⟨ek|= I, (1.30)
I being the identity operator in /C0 (the unit matrix when /C0 is ﬁnite dimensional).
1.2.2 Axioms of canonical quantization
Given an isolated classical dynamical system such as a harmonic oscillator, we
can construct a corresponding quantum system following a set of axioms.
A1. There exists a Hilbert space /C0 for a quantum system and the state of the
system is required to be described by a vector |ψ⟩∈ /C0 .I n t h i s s e n s e ,
|ψ⟩ is also called the state or a state vector. Moreover, two states |ψ⟩ and
c|ψ⟩ (c∈/BV , c̸= 0) describe the same state. The state can also be described
as a ray representation of /C0 .


## Page 30

A2. A physical quantity A in classical mechanics is replaced by a Hermitian
operator ˆA acting on /C0 .9 The operator ˆA is often called an observable.
The result obtained when A is measured is one of the eigenvalues ofˆA.( T h e
Hermiticity of ˆA has been assumed to guarantee real eigenvalues.)
A3. The Poisson bracket in classi cal mechanics is replaced by the commutator
[ˆA, ˆB]≡ˆAˆB−ˆBˆA (1.31)
multiplied by −i/¯h. The unit in which ¯h = 1 will be employed hereafter
unless otherwise stated explicitly. T he fundamental commutation relations
are (cf (1.22))
[ˆqi ,ˆq j]=[ˆ pi , ˆp j]= 0 [ˆqi , ˆp j]= iδij . (1.32)
Under this replacement, Hamilton’s equations of motion become
dˆqi
dt = 1
i[ˆqi , H] dˆpi
dt = 1
i[ˆpi , H]. (1.33)
When a classical quantity A is independent of t explicitly, A satisiﬁes the
same equation as Hamilton’s equation. By analogy, for ˆA which does not
depend on t explicitly, one has Heisenberg’s equation of motion:
dˆA
dt = 1
i[ˆA, ˆH]. (1.34)
A4. Let |ψ⟩∈/C0 be an arbitrary state. Suppose one prepares many systems, each
of which is in this state. Then, observation of A in these systems at time t
yields random results in general. Then the expectation value of the results is
given by
⟨A⟩t = ⟨ψ|ˆA(t)|ψ⟩
⟨ψ|ψ⟩ . (1.35)
A5. For any physical state|ψ⟩∈/C0 , there exists an operator for which|ψ⟩ is one
of the eigenstates.10
These ﬁve axioms are adopted as the rules of the game. A few comments
are in order. Let us examine axiom A4 more carefully. Let us assume that |ψ⟩ is
normalized as∥|ψ⟩∥2 =⟨ ψ|ψ⟩= 1 for simplicity. Suppose ˆA(t) has the set of
discrete eigenvalues{an} with the corresponding normalized eigenvectors{|n⟩}:11
ˆA(t)|n⟩= an|n⟩⟨ n|n⟩= 1.
9 An operator on /C0 is denoted by ˆ. This symbol will be dropped later unless this may cause
confusion.
10 This axiom is often ignored in the literature. The raison d’etre of this axiom will be clariﬁed later.
11 Since ˆA(t) is Hermitian, it is always possible to choose{|n⟩} to be orthonormal.


## Page 31

Then the expectation value of ˆA(t) with respect to an arbitrary state
|ψ⟩=
∑
n
ψ n|n⟩ ψ n =⟨ n|ψ⟩
is
⟨ψ|ˆA(t)|ψ⟩=
∑
m,n
ψ∗
m ψ n⟨m|ˆA(t)|n⟩=
∑
n
an|ψ n|2.
From the fact that the result of the measurement of A in state|n⟩ is always an,i t
follows that the probability of the outcome of the measurement being an,t h a ti s
the probability of|ψ⟩ being in|n⟩,i s
|ψ n|2 =|⟨ n|ψ⟩|2.
The number⟨n|ψ⟩ represents the ‘weight’ of the state |n⟩ in the state|ψ⟩ and is
called the probability amplitude.
If ˆA has a continuous spectrum a,t h es t a t e|ψ⟩ is expanded as
|ψ⟩=
∫
da ψ( a)|a⟩.
The completeness relation now takes the form
∫
da|a⟩⟨a|= I. (1.36)
Then, from the identity
∫
da′|a′⟩⟨a′|a⟩=| a⟩, one must have the normalization
⟨a′|a⟩= δ(a′−a), (1.37)
where δ(a) is the Dirac δ-function. The expansion coefﬁcient ψ( a) is obtained
from this normalization condition as ψ( a) =⟨ a|ψ⟩.I f |ψ⟩ is normalized as
⟨ψ|ψ⟩= 1, one should have
1=
∫
da da′ ψ∗(a)ψ( a′)⟨a|a′⟩=
∫
da|ψ( a)|2.
It also follows from the relation
⟨ψ|ˆA|ψ⟩=
∫
a|ψ( a)|2 da
that the probability with which the measured value of A is found in the interval
[a, a+ da] is|ψ( a)|2 da. Therefore, the probability density is given by
ρ( a)=|⟨ a|ψ⟩|2. (1.38)
Finally let us clarify why axiom A5 is required. Suppose that the system
is in the state |ψ⟩ and assume that the probability of the state to be in |φ⟩
simultaneously is |⟨ψ|φ⟩|2. This has already been mentioned, when |ψ⟩ is an
eigenstate of some observable. Axiom A5 asserts that this is true for an arbitrary
state|ψ⟩.


## Page 32

1.2.3 Heisenberg equation, Heisenberg picture and Schr ¨odinger picture
The formal solution to the Heisenberg equation of motion
dˆA
dt = 1
i[ˆA, ˆH]
is easily obtained as
ˆA(t)= eiˆHt ˆA(0)e−iˆHt . (1.39)
Therefore, the operators ˆA(t) and ˆA(0) are related by the unitary operator
ˆU (t)= e−iˆHt (1.40)
and, hence, are unitary equivalent. This formalism, in which operators depend on
t, while states do not, is called the Heisenberg picture.
It is possible to introduce another picture which is equivalent to the
Heisenberg picture. Let us write down the expectation value of ˆA with respect
to the state|ψ⟩ as
⟨ˆA(t)⟩=⟨ ψ|ei ˆHt ˆA(0)e−iˆHt|ψ⟩
= (⟨ψ|ei ˆHt )ˆA(0)(e−iˆHt|ψ⟩).
If we write |ψ( t)⟩≡ e−i ˆHt|ψ⟩, we ﬁnd that the expectation value at t is also
expressed as
⟨ˆA(t)⟩=⟨ ψ( t)|ˆA(0)|ψ( t)⟩. (1.41)
Thus, states depend on t while operators do not in this formalism. This formalism
is called the Schr¨odinger picture.
Our next task is to ﬁnd the equation of motion for|ψ( t)⟩. To avoid confusion,
quantities associated with the Schr¨ odinger picture (the Heisenberg picture) are
denoted with the subscript S (H), respectively. Thus, |ψ( t)⟩S = e−i ˆHt|ψ⟩H
and ˆAS = ˆAH(0). By differentiating |ψ( t)⟩S with respect to t, one ﬁnds the
Schr¨odinger equation:
i d
dt|ψ( t)⟩S = ˆH|ψ( t)⟩S. (1.42)
Note that the Hamiltonian ˆH is the same for both the Schr¨odinger picture and the
Heisenberg picture. We will drop the subscripts S and H whenever this does not
cause confusion.
1.2.4 Wavefunction
Let us consider a particle moving on the real line /CA and let ˆx be the position
operator with the eigenvalue y and the corresponding eigenvector |y⟩; ˆx|y⟩=
y|y⟩. The eigenvectors are normalized as⟨x|y⟩= δ(x−y).


## Page 33

Similarly, let q be the eigenvalue ofˆp with the eigenvector|q⟩; ˆp|q⟩= q|q⟩
such that⟨p|q⟩= δ( p−q).
Let|ψ⟩∈/C0 be a state. The inner product
ψ( x)≡⟨x|ψ⟩ (1.43)
is the component of|ψ⟩ in the basis|x⟩,
|ψ⟩=
∫
|x⟩⟨x| dx|ψ⟩=
∫
ψ( x)|x⟩ dx.
The coefﬁcient ψ( x) ∈/BV is called the wavefunction. According to the
earlier axioms of quantum mechanics outlined, it is the probability amplitude of
ﬁnding the particle at x in the state|ψ⟩, namely|ψ( x)|2 dx is the probability of
ﬁnding the particle in the interval [x, x+ dx]. Then it is natural to impose the
normalization condition
∫
dx|ψ( x)|2 =⟨ ψ|ψ⟩= 1 (1.44)
since the probability of ﬁnding the particle anywhere on the real line is always
unity.
Similarly, ψ( p)=⟨ p|ψ⟩ is the probability amplitude of ﬁnding the particle
in the state with the momentum p and the probability of ﬁnding the momentum
of the particle in the interval[ p, p+ d p] is|ψ( p)|2 d p.
The inner product of two states in terms of the wavefunctions is
⟨ψ|φ⟩=
∫
dx⟨ψ|x⟩⟨x|φ⟩=
∫
dx ψ∗(x)φ( x), (1.45a)
=
∫
d p⟨ψ|p⟩⟨p|φ⟩=
∫
d p ψ∗(p)φ( p). (1.45b)
An abstract ket vector is now expressed in terms of a more concrete
wavefunction ψ( x) or ψ( p). What about the operators? Now we write down the
operators in the basis |x⟩. From the deﬁning equation ˆx|x⟩= x|x⟩, one obtains
⟨x|ˆx=⟨ x|x, which yields after multiplication by|ψ⟩ from the right,
⟨x|ˆx|ψ⟩= x⟨x|ψ⟩= xψ( x). (1.46)
This is often written as (ˆxψ)( x)= xψ( x).
What about the momentum operator ˆp? Let us consider the unitary operator
ˆU (a)= e−iaˆp.
Lemma 1.1. The operator ˆU (a) deﬁned as before satisﬁes
ˆU (a)|x⟩=| x+ a⟩. (1.47)


## Page 34

Proof. It follows from [ˆx, ˆp]= it h a t[ˆx, ˆpn]= inˆpn−1 for n = 1, 2,... .
Accordingly, we have
[ˆx, ˆU (a)]=
[
ˆx,
∑
n
(−ia)n
n! ˆpn
]
= aˆU (a)
which can also be written as
ˆxˆU (a)|x⟩= ˆU (a)(ˆx+ a)|x⟩= (x+ a)ˆU(a)|x⟩.
This shows that ˆU (a)|x⟩∝|x+ a⟩.S i n c eˆU (a) is unitary, it preseves the norm
of a vector. Thus, ˆU (a)|x⟩=| x+ a⟩. /A3
Let us take an inﬁnitesimal number ε.T h e n
ˆU (ε)|x⟩=| x+ ε⟩≃ (1−iεˆp)|x⟩.
It follows from this that
ˆp|x⟩= |x+ ε⟩−|x⟩
−iε
ε→0
−→i d
dx|x⟩ (1.48)
and its dual
⟨x|ˆp=⟨x+ ε|−⟨x|
iε
ε→0
−→ −i d
dx⟨x|. (1.49)
Therefore, for any state|ψ⟩, one obtains
⟨x|ˆp|ψ⟩=−i d
dx⟨x|ψ⟩=−i d
dx ψ( x). (1.50)
This is also written as (ˆpψ)( x)=−id ψ( x)/dx.
Similarly, if one uses a basis|p⟩, one will have the momentum representation
of the operators as
ˆx|p⟩=− i d
d p|p⟩ (1.51)
ˆp|p⟩= p|p⟩ (1.52)
⟨p|ˆx|ψ⟩= i d
d p ψ( p) (1.53)
⟨p|ˆp|ψ⟩= pψ( p). (1.54)
Exercise 1.2. Prove (1.51)–(1.54).
Proposition 1.1.
⟨x|p⟩= 1
√
2π
eipx (1.55)
⟨p|x⟩= 1
√
2π
e−ipx (1.56)


## Page 35

Proof.T a k e|ψ⟩=| p⟩ in the relation
(ˆpψ)( x)=⟨ x|ˆp|ψ⟩=−i d
dx ψ( x)
to ﬁnd
p⟨x|p⟩=⟨ x|ˆp|p⟩=−i d
dx⟨x|p⟩.
The solution is easily found to be
⟨x|p⟩= Ceipx .
The normalization condition requires that
δ(x−y)=⟨ x|y⟩=⟨ x|
∫
|p⟩⟨p| d p|y⟩
= C2
∫
d p eip(x−y)
= C22πδ( x−y),
where C has been taken to be real. This shows that C = 1/
√
2π . The proof of
(1.56) is left as an exercise. /A3
Thus, ψ( x) and ψ( p) are related as
ψ( p)=⟨ p|ψ⟩=
∫
dx⟨p|x⟩⟨x|ψ⟩=
∫ dx
√
2π
e−ipx ψ( x) (1.57)
which is nothing other than the Fourier transform of ψ( x).
Let us next derive the Schr¨ odinger equation which ψ( x) satisﬁes. By
applying⟨x| on (1.42) from the left, we obtain
⟨x|i d
dt|ψ( t)⟩=⟨ x| ˆH|ψ( t)⟩
where the subscript S has been dropped. For a Hamiltonian of the type ˆH =
ˆp2/2m+ V (ˆx), we obtain the time-dependent Schr¨odinger equation:
i d
dt ψ( x, t)=
⟨
x
⏐⏐⏐⏐
⏐
ˆp
2
2m+ V (ˆx)
⏐
⏐⏐⏐
⏐ ψ( t)
⟩
=− 1
2m
d2
dx2 ψ( x, t)+ V (x)ψ( x, t), (1.58)
where ψ( x, t)≡⟨x|ψ( t)⟩.
Suppose a solution of this equation is written in the form ψ( x, t) =
T (t)φ( x). By substituting this into (1.58) and dividing the result by ψ( x, t),
we obtain
iT′(t)
T (t) =−φ′′(x)/2m+ V (x)φ( x)
φ( x)


## Page 36

where the prime denotes the derivative with respect to a relevant variable. Since
the LHS is a function of t only while the right-hand side (RHS) of x only, they
must be a constant, which we label E. Accordingly, there are two equations,
which should be solved simultaneously,
iT′(t)= ET (t) (1.59)
−1
2m
d2
dx2 φ( x)+ V (x)φ( x)= Eφ( x). (1.60)
The ﬁrst equation is easily solved to yield
T (t)= exp(−iEt ) (1.61)
while the second one is the eigenvalue problem of the Hamiltonian operator
and called the time-independent Schr ¨odinger equation ,t h e stationary state
Schr¨odinger equation or, simply, the Schr¨odinger equation . For three-
dimensional space, it is written as
−1
2m∇2φ( x)+ V (x)φ( x)= Eφ( x). (1.62)
1.2.5 Harmonic oscillator
It is instructive to stop here for the moment and work out some non-trivial
example. We take a one-dimensional harmonic oscillator as an example since
it is not trivial, it is still solvable exactly and it is very important in the folllowing
applications.
The Hamiltonian operator is
ˆH= ˆp2
2m+ 1
2 mω 2ˆx2 [ˆx, ˆp]= i. (1.63)
The (time-independent) Schr¨odinger equation is
−1
2m
d2
dx2 ψ( x)+ 1
2 mω 2x2ψ( x)= Eψ( x). (1.64)
By rescaling the variables as ξ =√
mω x, ε= E/¯hω , one arrives at
ψ′′+ (ε−ξ 2)ψ = 0. (1.65)
The normalizable solution of this ordinary differential equation (ODE) exists only
when ε= εn ≡(n+ 1
2 )( n= 0, 1, 2,... ) namely
E= En ≡(n+ 1
2 )ω ( n= 0, 1, 2,... ) (1.66)
and the normalized solution is written in terms of the Hermite polynomial
Hn(ξ )= (−1)neξ 2/2 dne−ξ 2/2
dξ n (1.67)


## Page 37

as
ψ(ξ) =
√
 mω
2nn!√
π Hn(ξ )e−ξ 2/2. (1.68)
This eigenvalue problem can also be analysed by an algebraic method.
Deﬁne the annihilation operatorˆa and the creation operatorˆa† by
ˆa=
√
mω
2 ˆx+ i
√
1
2mω ˆp (1.69)
ˆa† =
√
mω
2 ˆx−i
√
1
2mω ˆp. (1.70)
The number operator ˆN is deﬁned by
ˆN=ˆa†ˆa. (1.71)
Exercise 1.3. Show that
[ˆa,ˆa]=[ˆ a†,ˆa†]= 0 [ˆa,ˆa†]= 1 (1.72)
and
[ˆN ,ˆa]=−ˆa [ˆN ,ˆa†]=ˆ a†. (1.73)
Show also that
ˆH= (ˆN+ 1
2 )ω. (1.74)
Let|n⟩ be a normalized eigenvector of ˆN,
ˆN|n⟩= n|n⟩.
Then it follows from the commutation relations proved in exercise 1.3 that
ˆN (ˆa|n⟩)= (ˆaˆN−ˆa)|n⟩= (n−1)(ˆa|n⟩)
ˆN (ˆa†|n⟩)= (ˆa† ˆN+ˆa†)|n⟩= (n+ 1)(ˆa†|n⟩).
Therefore,ˆa decreases the eigenvalue by one whileˆa† increases it by one, hence
the name annihilation and creation. Note that the eigenvalue n≥0s i n c e
n=⟨ n|ˆN|n⟩= (⟨n|ˆa†)(ˆa|n⟩)=∥ˆa|n⟩∥2 ≥0.
The equality holds if and only if ˆa|n⟩= 0. Take a ﬁxed n0 > 0 and apply ˆa
many times on |n0⟩. Eventually the eigenvalue of ˆak|n0⟩ will be negative for
some integer k > n0, which is a contradiction. This can be avoided only when n0
is a non-negative integer. Thus, there exists a state |0⟩ which satisﬁes ˆa|0⟩= 0.
The state|0⟩ is called the ground state.S i n c eˆN|0⟩=ˆ a†ˆa|0⟩= 0, this state is


## Page 38

the eigenvector of ˆN with the eigenvalue 0. The wavefunction ψ 0(x)≡⟨x|0⟩ is
obtained by solving the ﬁrst-order ODE
⟨x|ˆa|0⟩=
√
1
2mω
( d
dx ψ 0(x)+ mω xψ 0(x)
)
= 0. (1.75)
The solution is easily found to be
ψ 0(x)= C exp(−mω x2/2) (1.76)
where C is the normalization constant given in (1.68). An arbitrary vector |n⟩ is
obtained from|0⟩ by a repeated application ofˆa†.
Exercise 1.4. Show that
|n⟩= 1
√
n!
(ˆa†)n|0⟩ (1.77)
satisﬁes ˆN|n⟩= n|n⟩ and is normalized.
Thus, the spectrum of ˆN turns out to be Spec ˆN ={ 0, 1, 2,... } and hence
the spectrum of the Hamiltonian is
Spec ˆH={ 1
2 , 3
2 , 5
2 ,... }. (1.78)
1.3 Path integral quantization of a Bose particle
The canonical quantization of a classical system has been discussed in the
previous section. There the main role was played by the Hamiltonian and the
Lagrangian did not show up at all. In the present section, it will be shown that
there exists a quantization process, called the path integral quantization, based
heavily on the Lagrangian.
1.3.1 Path integral quantization
We start our analysis with one-dimensional systems. Let ˆx(t) be the position
operator in the Heisenberg picture. Suppose the particle is found at xi at time
ti (>0). Then the probability amplitude of ﬁnding this particle at x f at later time
t f (>ti ) is
⟨x f , t f|xi , ti⟩ (1.79)
where the vectors are deﬁned in the Heisenberg picture, 12
ˆx(ti )|xi , ti⟩= xi|xi , ti⟩ (1.80)
ˆx(t f )|x f , t f⟩= x f|x f , t f⟩. (1.81)
12 We have dropped S and H again to simplify the notation. Note that |xi , ti⟩ is an instantaneous
eigenvector and hence parametrized by the time ti when the position is measured. This should not be
confused with the dynamical time dependence of a wavefunction in the Schr¨odinger picture.


## Page 39

The probability amplitude (1.79) is also called the transition amplitude.
Let us rewrite the probability amplitude in terms of the Schr¨odinger picture.
Letˆx=ˆx(0) be the position operator with the eigenvector
ˆx|x⟩= x|x⟩. (1.82)
Sinceˆx has no time dependence, its eigenvector should be also time independent.
If
ˆx(ti )= ei ˆHti ˆxe−iˆHti (1.83)
is substituted into (1.80), we obtain
ei ˆHti ˆxe−iˆHti|xi , ti⟩= xi|xi , ti⟩.
By multiplying e−i ˆHti from the left, we ﬁnd
ˆx[e−iˆHti|xi , ti⟩]= xi[e−iˆHti|xi , ti⟩].
This shows that the two eigenvectors are related as
|xi , ti⟩= eiˆHti|xi⟩. (1.84)
Similarly, we have
|x f , t f⟩= eiˆHt f|x f⟩, (1.85)
from which we obtain
⟨x f , t f|=⟨ x f|e−i ˆHt f . (1.86)
From these results, we express the probability amplitude in the Schr¨ odinger
picture as
⟨x f , t f|xi , ti⟩=⟨ x f|e−i ˆH (t f−ti )|xi⟩. (1.87)
In general, the function
h(x, y; β) ≡⟨x|e−ˆH β|y⟩ (1.88)
is called the heat kernel of ˆH. This nomenclature originates from the similarity
between the Schr¨odinger equation and the heat equation. The amplitude (1.87) is
the heat kernel of ˆH with imaginary β :
⟨x f , t f|xi , ti⟩= h(x f , xi; i(t f −ti )). (1.89)
Now the amplitude (1.87) is expressed in the path integral formalism. To
this end, we consider the case in which t f −ti = ε is an inﬁnitesimal positive
number. Let us put xi = x and x f = y to simplify the notation and suppose the
Hamiltonian is of the form
ˆH= ˆp2
2m+ V (ˆx). (1.90)


## Page 40

1
2
34
y = -x
R
- R 0
-planez
Figure 1.1. The integration contour.
We ﬁrst prove the following lemma.
Lemma 1.2. Let a be a positive constant. Then
∫ ∞
−∞
e−iap2
d p=
√
 π
ia . (1.91)
Proof. The integral is different from an ordinary Gaussian integral in that the
coefﬁcient of p2 is a pure imaginary number. First replace p by z= x+ iy.T h e
integrand exp(−iaz2) is analytic in the wholez-plane. Now change the integration
contour from the real axis to the one shown in ﬁgure 1.1. Along path 1, we have
dz= dx and hence this path gives the same contribution as the original integration
(1.91). The contribution from paths 2 and 4 vanishes as R→∞. Noting that the
variable along path 3 is z= (1−i)x, we evaluate the contribution from this path
as
(1−i)
∫ −∞
∞
e−2ax 2
dx=−e−iπ/ 4
√
 π
a .
The summation of all the contribution must vanish due to Cauchy’s theorem and,
hence, ∫ ∞
−∞
d p e−iap2
= e−iπ/ 4
√
 π
a =
√
 π
ia . /A3
Now this lemma is employed to obtain the heat kernel for an inﬁnitesimal
time interval.
Proposition 1.2. Let ˆH be a Hamiltonian of the form (1.90) and ε be an
inﬁnitesimal positive number. Then for any x, y∈/CA ,w eﬁ n dt h a t
⟨x|e−i ˆH ε|y⟩= 1
√
2π iε
exp
[
iε
{ m
2
( (x−y)2
ε
) 2
−V
( x+ y
2
)}
+ /C7 (ε2)+ /C7 (ε(x−y)2)
]
. (1.92)


## Page 41

Proof. The completeness relation for the momentum eigenvectors is inserted into
the LHS of (1.92) to yield
⟨x|e−i ˆH ε|y⟩=
∫
dk⟨x|e−iε ˆH|k⟩⟨k|y⟩
=
∫ dk
2π e−iky e−iε ˆHx eikx
where
ˆHx =−1
2m
d2
dx2 + V (x).
Now we ﬁnd from the commutation relation of ∂x ≡d/dx and eikx that
∂x eikx = ikeikx + eikx ∂x = eikx (ik+ ∂x ).
Repeated application of this commutation relation yields
∂ n
x eikx = eikx (ik+ ∂x )n (n= 0, 1, 2,... )
from which we obtain
e−iε[−∂ 2
x /2m+V (x)]eikx = eikx e−iε[−(ik+∂x )2/2m+V (x)].
Therefore,
⟨x|e−iˆH ε|y⟩=
∫ dk
2π eik(x−y)e−iε[−(ik+∂x )2/2m+V (x)]
=
∫ dk
2π e−i[εk2/2m−k(x−y)]e−iε[−ik∂x /m−∂ 2
x /2m+V (x)]· 1
where the ‘1’ at the end of the last line is written explicitly to remind us of the
fact ∂x 1= 0. If we further put p =√
ε/2mk and expands the last exponential
function in the last line, we obtain
⟨x|e−iε ˆH|y⟩=
√
2m
ε eim(x−y)2/2ε
∫ d p
2π e−i[p+√
m/2ε( x−y)]2
×
∞∑
n=0
(−iε)n
n!
[
i
√
2
εm p∂x −∂ 2
x
2m+ V (x)
] n
· 1.


## Page 42

If we put q= p+√
m/2ε(x−y) and use lemma 1.2, we obtain:
⟨x|e−iε ˆH|y⟩=
√
2m
ε eim(x−y)2/2ε
∫ dq
2π e−iq2
×
[
1+ (−iε)V (x)+ (−ε2)
2
(−i)
ε (x−y)∂x V (x)
+ /C7 (ε2)+ /C7 (ε|x−y|2)
]
=
√
 m
2π iε eiε(m/2)[(x−y)/ε]2
× exp
[
−iεV
( x+ y
2
)
+ /C7 (ε2)+ /C7 (ε|x−y|2)
]
.
Thus, the proposition has been proved. /A3
Note that the average value(x+ y)/2 appeared as the variable ofV in (1.92).
This prescription is often called the Weyl ordering.
It is found from (1.92) that the integrand oscillates very rapidly for|x−y| >√
ε and it can be regarded as zero in the sense of distribution (the Riemann–
Lebesgue theorem). Therefore, as x−y <ε , the exponent of (1.92) approaches
the action for an inﬁnitesimal time interval[0,ε],
/Delta1S=
∫ ε
0
dt
[ m
2 v2−V (x)
]
≃
[ m
2 v2−V (x)
]
ε (1.93)
where v= (x−y)/ε is the average velocity and x is the average position.
Equation (1.92) also satisﬁes the boundary condition for ε→0,
⟨x|e−i ˆH ε|y⟩
ε→0
−→ ⟨x|y⟩= δ(x−y). (1.94)
This can be shown by noting that
∫ ∞
−∞
dx
√
 m
2π iε eim(x−y)2/2ε = 1.
The transition amplitude (1.79) for a ﬁnite time interval is obtained by
inﬁnitely repeating the transition amplitude for an inﬁnitesimal time interval one
after another. Let us ﬁrst divide the interval t f −ti into n equal intervals,
ε= t f −ti
n .
Put t0 = ti and tk = t0+εk (0≤k≤n). Clearly tn = t f . Insert the completeness
relation
1=
∫
dxk|xk , tk⟩⟨xk , tk| (1≤k≤n−1)


## Page 43

for each instant of time tk into (1.79) to yield
⟨x f , t f|xi , ti⟩=⟨ x f , t f|
∫
dxn−1|xn−1, tn−1⟩⟨xn−1, tn−1|
×
∫
dxn−2|xn−2, tn−2⟩ ...
∫
dx1|x1, t1⟩⟨x1, t1|x0, t0⟩.
Let us consider here the limit ε→0, namely n→∞. Proposition 1.2 states that
for an inﬁnitesimal ε,w eh a v e
⟨xk , tk|xk−1, tk−1⟩≃
√
 m
2π iε ei/Delta1Sk
where
/Delta1Sk = ε
[
m
2
( xk −xk−1
ε
) 2
−V
( xk−1+ xk
2
) ]
.
Therefore, we ﬁnd
⟨x f , t f|xi , ti⟩= limn→∞
( m
2π iε
)n/2 ∫ n−1∏
j=1
dx j exp
(
i
n∑
k=1
/Delta1Sk
)
. (1.95)
If n−1 points x1, x2,..., xn−1 are ﬁxed, we obtain a piecewise linear path from
x0 to xn via these points. Then we deﬁne S({xk})= ∑
k /Delta1Sk , which in the limit
n→∞can be written as
S({xk})
n→∞
−→S[x(t)]=
∫ t f
ti
dt
[ m
2 v2−V (x)
]
. (1.96)
Note, however, that the S[x(t)] deﬁned here is formal; the variables xk and xk−1
need not be close to each other and hence v= (xk −xk−1)/ε may diverge. This
transition amplitude is written symbolically as
⟨x f , t f|xi , ti⟩=
∫
/BW x exp
[
i
∫ t f
ti
dt
( m
2 v2−V (x)
) ]
=
∫
/BW x exp
[
i
∫ t f
ti
dtL (x,˙x)
]
(1.97)
which is called the path integral representation of the transition amplitude. It
should be stressed again that the ‘v’ is not well deﬁned and that this expression is
just a symbolic representation of the limit (1.95).
The integration measure is understood as
∫
/BW x= summation over all paths x(t) with x(ti )= xi , x(t f )= x f (1.98)


## Page 44

Figure 1.2. All the paths with ﬁxed endpoints are considered in the path integral. The
integrand exp[iS({xk})] is integrated over these paths.
see ﬁgure 1.2. Although /BW x or S({xk}) is ill deﬁned in the limit n →∞,t h e
amplitude⟨x f , t f|xi , ti⟩ constructed from /BW x and S({xk}) together is well deﬁned
and hence meaningful. This point is clariﬁed in the following example.
Example 1.5. Let us work out the transition amplitude of a free particle moving
on the real axis with the Lagrangian
L= 1
2 m˙x2. (1.99)
The canonical conjugate momentum is p= ∂ L/∂˙x= m˙x and the Hamiltonian is
H= p˙x−L= p2
2m . (1.100)
The transition amplitude is calculated within the canonical quantum theory as
⟨x f , t f|xi , ti⟩=⟨ x f|e−iˆHT|xi⟩=
∫
d p⟨x f|e−i ˆHT|p⟩⟨p|xi⟩
=
∫ d p
2π eip(x f−xi )e−iT (p2/2m)
=
√
 m
2π iT exp
(
im(x f −xi )2
2T
)
(1.101)
where T = t f −ti .
This result is obtained using the path integral formalism next. The amplitude
is expressed as
⟨x f , t f|xi , ti⟩= limn→∞
( m
2π iε
)n/2 ∫
dx1 ... dxn−1
exp
[
iε
n∑
k=1
m
2
( xk −xk−1
ε
) 2 ]
(1.102)


## Page 45

where ε= T /n. After scaling the coordinates as
yk =
( m
2ε
)1/2
xk
the amplitude becomes
⟨x f , t f|xi , ti⟩= limn→∞
( m
2π iε
)n/2 ( 2ε
m
) (n−1)/2
∫
dy1 ... dyn−1 exp
[
i
n∑
k=1
(yk −yk−1)2
]
. (1.103)
It can be shown by induction (exercise) that
∫
dy1 ... dyn−1 exp
[
i
n∑
k=1
(yk −yk−1)2
]
=
[
(iπ) (n−1)
n
] 1/2
ei(yn−y0)2/n .
Taking the limit n→∞, we ﬁnally obtain
⟨x f , t f|xi , ti⟩= limn→∞
( m
2π iε
)n/2 ( 2π iε
m
) (n−1)/2 1
√
n eim(x f−xi )2/(2nε)
=
√
 m
2π iT exp
[
im(x f −xi )2
2T
]
. (1.104)
It should be noted here that the exponent is the classical action. In fact, if we
note that the average velocity is v = (x f −xi )/(t f −ti ), the classical action is
found to be
Scl =
∫ t f
ti
dt 1
2mv2 = m(x f −xi )2
2(t f −ti ) .
It happens in many exactly solvable systems that the transition amplitude takes
the form
⟨x f , t f|xi , ti⟩= AeiScl , (1.105)
where all the effects of quantum ﬂuctuation are taken into account in the prefactor
A.
1.3.2 Imaginary time and partition function
Suppose the spectrum of a Hamiltonian ˆH is bounded from below. Then it is
always possible, by adding a postive constant to the Hamiltonian, to make ˆH
positive deﬁnite;
Spec ˆH={0 < E0 ≤E1 ≤E2 ≤···} . (1.106)


## Page 46

It has been assumed for simplicity that the ground state is not degenerate. The
spectral decomposition of e−iˆHt given by
e−iˆHt =
∑
n
e−iEnt|n⟩⟨n| (1.107)
is analytic in the lower half-plane of t,w h e r eˆH|n⟩= En|n⟩. Introduce the Wick
rotation by the replacement
t=−iτ( τ ∈/CA
+ ) (1.108)
where /CA
+ is the set of positive real numbers. The variable τ is regarded as
imaginary time, which is also known as the Euclidean time since the world
distance changes from t2−x2 to−(τ 2+ x2). Physical quan tities change under
this change of variable as
˙x= dx
dt = idx
dτ
e−iˆHt = e−ˆH τ
i
∫ t f
ti
dt
[ 1
2m˙x2−V (x)
]
= i(−i)
∫ τ f
τi
dτ
[
−1
2m
( dx
dτ
) 2
−V (x)
]
=−
∫ τ f
τi
dτ
[
1
2m
( dx
dτ
) 2
+ V (x)
]
.
Accordingly, the path integral is expressed in terms of the new variable as
⟨x f ,τ f|xi ,τ i⟩=⟨ x f|e−ˆH (τ f−τi )|xi⟩
=
∫
¯
/BW x e
−
∫ τ f
τi dτ
[
1
2 m
(
dx
dτ
)2
+V (x)
]
, (1.109)
where ¯
/BW is the integration measure in the imaginary time τ .
For a given Hamiltonian ˆH,t h epartition function is deﬁned as
Z (β) = Tr e−β ˆH (β > 0), (1.110)
where the trace is over the Hilbert space associated with ˆH.
Let us take the eigenstates {|En⟩} of ˆH as the basis vectors of the Hilbert
space;
ˆH|En⟩= En|En⟩, ⟨Em|En⟩= δmn .
Then the partition function is expressed as
Z (β) =
∑
n
⟨En|e−β ˆH|En⟩=
∑
n
⟨En|e−β En|En⟩
=
∑
n
e−β En . (1.111)


## Page 47

The partition function is also expressed in terms of the eigenvector|x⟩ of ˆx.
Namely
Z (β) =
∫
dx⟨x|e−β ˆH|x⟩. (1.112)
If β is identiﬁed with the Euclidean time by putting β = iT ,w eﬁ n dt h a t
⟨x f|e−iˆHT|xi⟩=⟨ x f|e−β ˆH|xi⟩,
from which we obtain the path integral expression of the partition function
Z (β) =
∫
dy
∫
x(0)=x(β)=y
¯
/BW x exp
{
−
∫ β
0
dτ
( 1
2 m˙x2+ V (x)
)}
=
∫
periodic
¯
/BW x exp
{
−
∫ β
0
dτ
( 1
2 m˙x2+ V (x)
)}
, (1.113)
where the integral in the last line is over all paths periodic in[0,β ].
1.3.3 Time-ordered product and generating functional
Deﬁne the T-product of Heisenberg operators A(t) and B(t) by
T[A(t1)B(t2)]= A(t1)B(t2)θ (t1−t2)+ B(t2)A(t1)θ (t2−t1) (1.114)
θ( t) being the Heaviside function. 13 Generalization to the case with more than
three operators should be trivial; operators in the bracket are rearranged so that the
time parameters decrease from the left to the right. The T -product of n operators
is expanded into n! terms, each of which is proportional to the product of n−1
Heaviside functions. An important quantity in quantum mechanics is the matrix
element of the T -product,
⟨x f , t f|T[ˆx(t1)ˆx(t f )···ˆ x(tn )]|xi , ti⟩,( ti < t1, t2,..., tn < t f ). (1.115)
Suppose ti < t1 ≤t2 ≤···≤tn < t f in equation (1.115). By inserting the
completeness relation
1=
∫ ∞
−∞
dxk|xk , tk⟩⟨xk , tk| (k= 1, 2,..., n)
into equation (1.115), we obtain
⟨x f , t f|ˆx(tn )···ˆ x(t1)|xi , ti⟩
=⟨ x f , t f|ˆx(tn )
∫
dxn|xn, tn⟩⟨xn , tn|···ˆ x(t1)
∫
dx1|x1, t1⟩⟨x1, t1|xi , ti⟩
=
∫
dx1 ... dxn x1 ... xn⟨x f , t f|xn , tn⟩···⟨ x1, t1|xi , ti⟩ (1.116)
13 The Heaviside function is deﬁned by
θ( x)=
{
0 x < 0
1 x≥0.


## Page 48

where use has been made of the eigenvalue equationˆx(tk )|xk , tk⟩= xk|xk , tk⟩.I f
⟨xk , tk|xk−1, tk−1⟩ in the last line is expressed in terms of a path integral, we ﬁnd
⟨x f , t f|ˆx(tn )... ˆx(t1)|xi , ti⟩=
∫
/BW xx (t1)... x(tn )eiS . (1.117)
It is crucial to note that ˆx(tk ) in the LHS is a Heisenberg operator, while
x(tk )(=xk ) in the RHS is the real value of a classical path x(t) at time tk .
Accordingly, the RHS remains true for any ordering of the time parameters in
the LHS as long as the Heisenberg operators are arranged in a way deﬁned by the
T -product. Thus, the path integral expression automatically takes the T -product
ordering into account to yield
⟨x f , t f|T[ˆx(tn )... ˆx(t1)]|xi , ti⟩=
∫
/BW xx (t1)... x(tn )eiS . (1.118)
The reader is encouraged to verify this result explicitly for n= 2.
It turns out to be convenient to deﬁne the generating functional Z[J] to
obtain the matrix elements of the T -products efﬁciently. We couple an external
ﬁeld J (t) (also called the source) with the coordinate x(t) as x(t)J (t) in the
Lagrangian, where J (t) is deﬁned on the interval[ti , t f]. Deﬁne the action with
the source as
S[x(t), J (t)]=
∫ t f
ti
dt[1
2 m˙x2−V (x)+ xJ]. (1.119)
The transition amplitude in the presence of J (t) is then given by
⟨x f , t f|xi , ti⟩J =
∫
/BW x exp
[
i
∫ t f
ti
dt (1
2 m˙x2−V (x)+ xJ )
]
. (1.120)
The functional derivative of this equation with respect toJ (t)( ti < t < t f ) yields
δ
δ J (t)⟨x f , t f|xi , ti⟩J =
∫
/BW x ix(t) exp
[
i
∫ t f
ti
dt (1
2 m˙x2−V (x)+ xJ )
]
.
(1.121)
Higher functional derivatives are easy to obtain; the factor i x(tk ) appears in the
integrand of the path integral each time δ/δ J (t) acts on⟨x f , t f|xi , ti⟩J .T h i s i s
nothing but the matrix element of the T -product of the Heisenberg operator ˆx(t)
in the presence of the source J (t). Accordingly, if we put J (t)= 0i nt h ee n do f
the calculation, we obtain
⟨x f , t f|T [x(tn )... x(t1)]|xi , ti⟩
= (−i)n δn
δ J (t1)...δ J (tn )
∫
/BW x eiS[x(t ),J (t)]
⏐⏐
⏐
⏐
J=0
. (1.122)
It often happens in physical applications that the transition probability
amplitude between general states, in particular the ground states, is required


## Page 49

rather than those between coordinate eigenstates. Suppose the system under
consideration is in the ground state|0⟩ at ti and calculate the probability amplitude
with which the system is also in the ground state at later time t f . Suppose
J (t) is non-vanishing only on an interval [a, b]⊂[ti , t f]. (The reason for this
assumption will become clear later.) The transition amplitude in the presence of
J (t) may be obtained from the Hamiltonian H J = H−x(t)J (t) and the unitary
operator U J (t f , ti ) of the Hamiltonian. The transition probability amplitude
between the coordinate eigenstates is
⟨x f , t f|xi , ti⟩J =⟨ x f|U J (t f , ti )|xi⟩
=⟨ x f|e−iH (t f−b)U J (b, a)e−iH (a−ti )|xi⟩, (1.123)
where use has been made of the fact H J = H outside the interval [a, b].B y
inserting the completeness relations of the energy eigenvectors ∑
n|n⟩⟨n|= 1
into this equation, we obtain
⟨x f , t f|xi , ti⟩J =
∑
m,n
⟨x f|e−iH (t f−b)|m⟩⟨m|U J (b, a)|n⟩⟨n|e−iH (a−ti )|xi⟩
=
∑
m,n
e−iEm (t f−b)e−iEn (a−ti )⟨x f|m⟩⟨n|xi⟩⟨m|U J (b, a)|n⟩.
(1.124)
Now let us Wick rotate the time variable t →−iτ under which the exponential
function changes as e −iEt →e−Eτ . Then the limit τ f →∞,τ i →− ∞
picks up only the ground states m = n = 0. Alternatively, we may introduce a
small imaginary term−iεx2 in the Hamiltonian so that the eigenvalue has a small
negative imaginary part. Then only the ground state survives in the summations
over m and n under τ f →∞,τ i →−∞.
After all we have proved that
lim
t f→∞
ti→−∞
⟨x f , t f|xi , ti⟩J =⟨ x f|0⟩⟨0|xi⟩Z[J] (1.125)
w h e r ew eh a v ed e ﬁ n e dt h egenerating functional
Z[J]=⟨ 0|U J (b, a)|0⟩= lim
t f→∞
ti→−∞
⟨0|U J (t f , ti )|0⟩. (1.126)
The generating functional may be also expressed as
Z[J]= lim
t f→∞
ti→−∞
⟨x f , t f|xi , ti⟩J
⟨x f|0⟩⟨0|xi⟩ . (1.127)
Note that the denominator is just a constant independent of Z[J].N o w w e h a v e
found the path integral representation for Z[J],
Z[J]= /C6
∫
/BW x eiS[x,J] (1.128)


## Page 50

where the path integral is over paths with arbitrarily ﬁxed xi and x f .T h e
normalization constant /C6 is chosen so that Z[0]= 1, namely
/C6
−1 =
∫
/BW x eiS[x,0].
It is readily shown that Z[J] generates the matrix elements of the T -product
between the ground states:
⟨0|T [x(t1)··· x(tn )]|0⟩= (−i)n δn
δ J (t1)··· δ J (tn ) Z[J]
⏐⏐
⏐
⏐
J=0
. (1.129)
1.4 Harmonic oscillator
We work out the path integral quantization of a harmonic oscillator, which is an
example of systems for which the path integral may be evaluated exactly. We also
introduce the zeta function regularization, which is a useful tool in many areas of
theoretical physics.
1.4.1 Transition amplitude
The Lagrangian of a one-dimensional harmonic oscillator is
L= 1
2 m˙x2−1
2 mω 2x2. (1.130)
The transition amplitude is given by
⟨x f , t f|xi , ti⟩=
∫
/BW x eiS[x(t )], (1.131)
where S[x(t)]=
∫ t f
ti L dt is the action.
Let us expand S[x] around its extremum xc(t) satisfying
δ S[x]
δx
⏐⏐
⏐
⏐
x=xc(t )
= 0. (1.132)
Clearly xc(t) is the classical path connecting (xi , ti ) and (x f , t f ) and satiﬁes the
Euler–Lagrange equation
¨xc+ ω 2xc = 0. (1.133)
The solution of equation (1.133) satifying xc(ti )= xi and xc(t f )= x f is easily
obtained as
xc(t)= 1
sin ω T[x f sin ω( t−ti )+ xi sin ω( t f −t)] (1.134)
where T = t f −ti . Substituting this solution into the action, we obtain (exercise)
Sc ≡S[xc]
= mω
2s i nω T[(x2
f + x2
i ) cos ω T−2x f xi]. (1.135)


## Page 51

Now the expansion of S[x] around x= xc takes the form
S[xc+ y]= S[xc]+ 1
2!
∫
dt1 dt2 y(t1)y(t2) δ2 S[x]
δx(t1)δx(t2)
⏐⏐
⏐⏐
x=xc
(1.136)
where y(t) satisﬁes the boundary condition y(ti )= y(t f )= 0. Note that (1) the
ﬁrst-order term vanishes since δ S[x]/δx = 0a t x = xc and (2) terms of order
three and higher do not exist since the action is second order in x. Therefore, this
expansion is exact and this problem is exactly solvable as we see later.
By noting that
δ
δx(t1)
∫ t f
ti
dt
[ 1
2m˙x(t)2−1
2 mω 2x(t)2
]
=−m d2
dt2
1
x(t1)−mω 2x(t1)
=−m
(
d2
dt2
1
+ ω 2
)
x(t1)
and that
δx(t1)
δx(t2)= δ(t1−t2)
we obtain the second-order functional derivative
δ2 S[x]
δx(t1)δx(t2)=−m
(
d2
dt2
1
+ ω 2
)
δ(t1−t2). (1.137)
Substituting this into equation (1.136) we ﬁnd that
S[xc+ y]= S[xc]−m
2!
∫
dt1 dt2 y(t1)y(t2)
(
d2
dt2
1
+ ω 2
)
δ(t1−t2)
= S[xc]+ m
2
∫
dt (˙y2−ω 2 y2), (1.138)
where the boundary condition y(ti )= y(t f )= 0 has been taken into account.
Since /BW x is translationally invariant,14 we may replace /BW x by /BW y to obtain
⟨x f , t f|xi , ti⟩= eiS[xc]
∫
y(ti )=y(t f )=0
/BW y ei m
2
∫ t f
ti dt (˙y2−ω 2 y2). (1.139)
Let us evaluate the ﬂuctuation part
I f =
∫
y(0)=y(T )=0
/BW y ei m
2
∫ T
0 dt (˙y2−ω 2 y2) (1.140)
14 Integrating over all possible paths x(t) with x(ti )= xi and x(t f )= x f is equivalent to integrating
over all possible paths y(t) with y(ti )= y(t f )= 0, where x(t)= xc (t)+ y(t).


## Page 52

where we have shifted the t variable so that ti now becomes t = 0. We expand
y(t) as
y(t)=
∑
n∈/C6
an sin nπ t
T (1.141)
in conformity with the boundary condition.Substitution of this expansion into the
integral in the exponent yields
∫ T
0
dt (˙y2−ω 2 y2)= T
2
∑
n∈/C6
a2
n
[ ( nπ
T
)2
−ω 2
]
.
The Fourier transform from y(t) to{an} may be regarded as a change of variables
in the integration. For this transformation to be well deﬁned, the number of
variables must be the same. Suppose the number of the time slice is N + 1,
including t = 0a n d t = T , for which there are N −1 independent yk.
Correspondingly, we must put an = 0f o rn > N−1. The Jacobian associated
with this change of variables is
JN = det ∂ yk
∂ an
= det
[
sin
( nπ tk
T
)]
(1.142)
where tk is the kth time step when[0, T] is divided into N inﬁnitesimal steps.
This Jacobian can be evaluated most easily for a free particle. Since the
transformation{yk}→{ an} is independent of the potential, the Jacobian should
be identical for both cases. The probability amplitude for a free particle has been
obtained in (1.104) leading to
⟨x f , T|xi , 0⟩=
( 1
2π iT
) 1/2
exp
[
i m
2T (x f −xi )2
]
=
( 1
2π iT
) 1/2
eiS[xc].
(1.143)
This is written in terms of a path integral as
eiS[xc]
∫
y(0)=y(T )=0
/BW y ei m
2
∫ T
0 dt ˙y2
. (1.144)
By comparing these two expressions and noting that
m
2
∫ T
0
dt˙y2 →m
N∑
n=1
a2
nn2π 2
4T
we arrive at the equality
( 1
2π iT
) 1/2
=
∫
y(0)=y(T )=0
/BW y ei m
2
∫ T
0 dt ˙y2
= lim
N→∞
JN
( 1
2π iε
) 1/2 ∫
da1 ... daN−1 exp
(
im
N−1∑
n=1
a2
n π 2n2
4T
)
.


## Page 53

By carrying out the Gaussian integrals, it is found that
( 1
2π iT
) 1/2
= lim
N→∞
JN
( 1
2π iε
) N/2 N−1∏
n=1
1
n
( 4π iT
π 2
) 1/2
= lim
N→∞
JN
( 1
2π iε
) N/2 1
(N−1)!
( 4π iT
π 2
) (N−1)/2
from which we ﬁnally obtain, for ﬁnite N ,t h a t
JN = N−N/22−(N−1)/2π N−1(N−1)!. (1.145)
The Jacobian JN clearly diverges as N →∞. This does not matter at all,
however, since we are not interested in JN on its own but a combination with
other (divergent) factors.
The transition amplitude of a harmonic oscillator is now given by
⟨x f , T|xi , 0⟩= lim
N→∞
JN
( 1
2π iε
) N/2
eiS[xc]
×
∫
da1 ... daN−1 exp
[
imT
4
N−1∑
n=1
a2
n
{( nπ
T
)2
−ω 2
}]
.
(1.146)
The integrals over an are simple Gaussian integrals and easily carried out to yield
∫
dan exp
[ imT
4 a2
n
{( nπ
T
)2
−ω 2
}]
=
( 4iT
π n2
) 1/2 [
1−
( ω T
nπ
) 2]−1/2
.
By substituting this result into equation (1.146), we obtain
⟨x f , t f|xi , ti⟩= lim
N→∞
JN
( N
2π iT
) N/2
eiS[xc]
×
N−1∏
k=1
[
1
k
( 4iT
π
) 1/2] N−1∏
n=1
[
1−
( ω T
nπ
) 2]−1/2
=
( 1
2π iT
) 1/2
eiS[xc]
N−1∏
n=1
[
1−
( ω T
nπ
) 2]−1/2
. (1.147)
The inﬁnite product over n is well known and reduces to
lim
N→∞
N∏
n=1
[
1−
( ω T
nπ
) 2]
= sin ω T
ω T (1.148)


## Page 54

Note that the divergence of JN cancelled with the divergence of the other terms
to yield a ﬁnite value. Finally we have shown that
⟨x f , t f|xi , ti⟩=
( ω
2π is i nω T
)1/2
eiS[xc]
=
( ω
2π is i nω T
)1/2
exp
[ iω
2s i nω T{(x2
f + x2
i ) cos ω T−2xi x f}
]
.
(1.149)
1.4.2 Partition function
The partition function of a harmonic oscillator is easily obtained from the
eigenvalue En = (n+ 1/2)ω ,
Tr e−β ˆH =
∞∑
n=0
e−β( n+1/2)ω = 1
2s i n h(βω/ 2) . (1.150)
The inverse temperature β can be regarded as the imaginary time by putting
iT = β . Then the partition function may be evaluated from the path integral
point of view.
Method 1: The trace may be taken over{|x⟩} to yield
Z (β) =
∫
dx⟨x|e−β ˆH|x⟩
=
( ω
2π i(−is i n hβω)
) 1/2
×
∫
dx exp i
[ ω
−2i sinh βω (2x2 cosh βω −2x2)
]
=
( ω
2π sinh βω
) 1/2 [ π
ω tanh(βω/ 2)
] 1/2
= 1
2s i n h(βω/ 2) (1.151)
where use has been made of equation (1.149).
The following exercise serves as a preliminary to Method 2.
Exercise 1.5. (1) Let A be a symmetric positive-deﬁnite n× n matrix. Show that
∫
dx1 ... dxn exp
(
−
∑
i, j
xi Aij x j
)
= π n/2(det A)−1/2 = π n/2 ∏
i
λ−1/2
i
(1.152)


## Page 55

where λ i is the eigenvalue of A.
(2) Let A be a positive-deﬁnite n× n Hermite matrix. Show that
∫
dz1 d¯z1 ... dzn d¯zn exp
(
−
∑
i, j
¯zi Aij z j
)
= π n (det A)−1 = π n ∏
i
λ−1
i .
(1.153)
Method 2 : We next obtain the partition function by evaluating the path
integral over the ﬂuctuations with the help of the functional determinant and the
ζ -function regularization. We introduce the imaginary time τ = it and rewrite
the path integral as
∫
y(0)=y(T )=0
/BW y exp
[ i
2
∫
dty
(
−d2
dt2 −ω 2
)
y
]
→
∫
y(0)=y(β)=0
¯
/BW y exp
[
−1
2
∫
dτ y
(
−d2
dτ 2 + ω 2
)
y
]
,
where we noted the boundary condition y(0) = y(β) = 0. Here the bar on /BW
implies the path integration measure with imaginary time.
Let A be an n × n Hermitian matrix with positive-deﬁnite eigenvalues
λ k (1≤k≤n). Then for real variables xk , we obtain from exercise 1.5 that
n∏
k=1
( ∫ ∞
−∞
dxk
)
e−1
2
∑
p,q x p Apq xq =
n∏
k=1
1
√
λ k
= 1
√
det A
where we neglected numerical factors. This is a generalization of the well-known
Gaussian integral ∫ ∞
−∞
dxe−1
2 λ x2
=
√
2π
λ
for λ> 0. We deﬁne the determinant of an operator /C7 by the (properly
regularized) inﬁnite product of its eigenvalues λ k as Det /C7 = ∏
k λ k .15 Then
the previous path integral is written as
∫
y(0)=y(β)=0
¯
/BW y exp
[
−1
2
∫
dτ y
(
−d2
dτ 2+ω 2
)
y
]
= 1
√
DetD(−d2/dτ 2+ ω 2)
,
(1.154)
where the subscript ‘D’ implies that the eigenvalues are evaluated with the
Dirichlet boundary condition y(0)= y(β) = 0.
The general solution y(τ ) satisfying the boundary condition is written as
y(τ )= 1
√
β
∑
n∈/C6
yn sin nπτ
β . (1.155)
15 We will use ‘det’ for the determinant of a ﬁnite di mensional matrix while ‘Det’ for the (formal)
determinant of an operator throughout this book. Similarly, the trace of a ﬁnite-dimensional matrix is
denoted ‘tr’ while that of an operator is denoted ‘Tr’.


## Page 56

Note that yn ∈/CA since y(τ ) is a real function. Since the eigenvalue of the
eigenfunction sin (nπτ/ β) is λ n = (nπ/β) 2 + ω 2, the functional determinant
is formally written as
DetD
(
−d2
dτ 2 + ω 2
)
=
∞∏
n=1
λ n =
∞∏
n=1
[ ( nπ
β
) 2
+ ω 2
]
=
∞∏
n=1
( nπ
β
) 2 ∞∏
p=1
[
1+
( βω
pπ
) 2]
. (1.156)
The ﬁrst inﬁnite product in the last line is written as
DetD
(
−d2
dτ 2
)
.
We will evaluate this inﬁnite product through the ζ -function regularization. Let
/C7 be an operator with positive-deﬁnite eigenvalues λ n.T h e nw eh a v eformally
log Det/C7 = Tr log/C7 =
∑
n
log λ n . (1.157)
Now we deﬁne the spectral ζ -function as
ζ
/C7
(s)≡
∑
n
1
λ sn
. (1.158)
The RHS converges for sufﬁciently large Re s and ζ
/C7
(s) is analytic with respect
to s in this region. Moreover, it can be analytically continued to the wholes-plane
except at a possible ﬁnite number of points. By noting that
dζ
/C7
(s)
ds
⏐⏐
⏐
⏐
s=0
=−
∑
n
log λ n
we arrive at the expression
Det /C7 = exp
[
−dζ
/C7
(s)
ds
⏐
⏐
⏐
⏐
s=0
]
. (1.159)
We replace /C7 by−d2/dτ 2 in the case at hand to ﬁnd
ζ−d2/dτ 2 (s)=
∑
n≥1
( nπ
β
)−2s
=
( β
π
) 2s
ζ( 2s) (1.160)
where ζ( 2s) is the celebrated Riemann ζ-function. It is analytic over the whole
s-plane except at the simple pole at s= 1. From the well-known values
ζ( 0)=−1
2 ζ′(0)=−1
2 log(2π) (1.161)


## Page 57

we obtain
ζ′
−d2/dτ 2 (0)= 2l o g
( β
π
)
ζ( 0)+ 2ζ′(0)=−log(2β).
We have ﬁnally shown that
DetD
(
−d2
dτ 2
)
= elog(2β) = 2β (1.162)
and that
DetD
(
−d2
dτ 2 + ω 2
)
= 2β
∞∏
p=1
[
1+
( βω
pπ
) 2]
. (1.163)
The inﬁnite product in this equation is well known but let us pretend that we are
ignorant about this product.
The partition function is now expressed as
Tr e−β H =
[
2β
∞∏
p=1
{
1+
( βπ
pπ
) 2 }]−1/2 [ π
ω tanh(βω/ 2)
] 1/2
. (1.164)
By comparing this with the result (1.151), we have proved the formula
∞∏
n=1
[
1+
( βω
nπ
) 2]
= π
βω sinh(βω)
namely
∞∏
n=1
(
1+ x2
n2
)
= sinh(π x)
π x . (1.165)
What about the inﬁnite product expansion of the cosh function? This is given
by using the path integral with respect to the fermion, which we will work out in
the next section.
1.5 Path integral quantiz ation of a Fermi particle
The particles observed in Nature are not necessarily Bose particles whose position
and momentum operators obey the commutation relation[p, x]=−i. There are
particles called fermions whose operators satisfy anti-commutation relations. A
classical description of a fermion requires anti-commuting numbers called the
Grassmann numbers.


## Page 58

1.5.1 Fermionic harmonic oscillator
The bosonic harmonic oscillator in the previous section is described by the
Hamiltonian16
H= 1
2 (a†a+ aa†)
where a and a† satisfy the commutation relations
[a, a†]= 1 [a, a]=[ a†, a†]= 0.
The Hamiltonian has eigenvalues (n+ 1/2)ω ( n∈/C6 ) with the eigenvector|n⟩:
H|n⟩= (n+ 1
2 )ω|n⟩.
Now suppose there is a Hamiltonian
H= 1
2 (c†c−cc†)ω. (1.166)
This is called the fermionic harmonic oscillator , which may be regarded as
a Fourier component of the Dirac Hamilt onian, which describes relativistic
fermions. If the operators c and c† should satisfy the same commutation relations
as those satisﬁed by bosons, the Hamiltonian would be a constant H =−ω/ 2.
Suppose, in contrast, they satisfy the anti-commutation relations
{c, c†}≡cc†+ c†c= 1 {c, c}={ c†, c†}= 0. (1.167)
The Hamiltonian takes the form
H= 1
2[c†c−(1−cc†)]ω = (N−1
2 )ω (1.168)
where N = c†c. It is easy to see that the eigenvalue of N must be either 0 or 1.
In fact, N satisﬁes N2 = c†cc†c= N, namely N(N−1)= 0. This is nothing
other than the Pauli principle.
Let us study the Hilbert space of the Hamiltonian H .L e t |n⟩ be an
eigenvector of H with the eigenvalue n,w h e r en = 0, 1 as shown earlier. It
is easy to verify the following relations;
H|0⟩=−ω
2|0⟩ H|1⟩= ω
2|1⟩
c†|0⟩=| 1⟩ c|0⟩= 0 c†|1⟩= 0 c|1⟩=| 0⟩.
It is convenient to introduce the component expressions
|0⟩=
( 0
1
)
|1⟩=
( 1
0
)
.
16 We will dropˆ on operators from now on unless this may cause confusion.


## Page 59

Exercise 1.6. Suppose the basis vectors have this form. Show that the operators
have the following matrix representations
c=
( 00
10
)
, c† =
( 01
00
)
,
N=
( 10
00
)
, H= ω
2
( 10
0 −1
)
.
The commutation relation [x, p]= i for a boson has been replaced by
[x, p]= 0 in the path integral formalism of a boson. For a fermion, the anti-
commutation relation{c, c†}= 1 should be replaced by{θ,θ ∗}= 0, where θ and
θ∗are anti-commuting classical numbers called Grassmann numbers.
1.5.2 Calculus of Grassmann numbers
To distinguish anti-commuting Grassmann numbers from commuting real and
complex numbers, the latter will be called the ‘c-number’, where c stands for
commuting. Let n generators{θ1,...,θ n} satisfy the anti-commutation relations
{θi ,θ j}= 0 ∀i, j. (1.169)
Then the set of the linear combinations of {θi} with the c-number coefﬁcients is
called the Grassmann number and the algebra generated by {θi} is called the
Grassmann algebra, denoted by /Lambda1n. An arbitrary element f of /Lambda1n is expanded
as
f (θ )= f0+
n∑
i=1
fi θi +
∑
i< j
fij θi θ j +···
=
∑
0≤k≤n
1
k!
∑
{i}
fi1 ,...ik θi1 ...θ ik , (1.170)
where f0, fi , fij ,... and fi1 ,...,ik are c-numbers that are anti-symmetric under the
exchange of any two indices. The element f is also written as
f (θ )=
∑
ki=0,1
˜fk1 ,...,kn θ k1
1 ...θ kn
n . (1.171)
Take n= 2 for example. Then
f (θ )= f0+ f1θ1+ f2θ2+ f12θ1θ2
= ˜f00+ ˜f10θ1+ ˜f01θ2+ ˜f11θ1θ2.
The subset of λ n which is generated by monomials of even (resp. odd) power in
θk is denoted by /Lambda1n
+ (/Lambda1n
−
):
/Lambda1n = /Lambda1n
+⊕/Lambda1n
−
. (1.172)


## Page 60

The separation of /Lambda1n into these two subspaces is called /CI
2-grading. We call an
element of /Lambda1n
+ (/Lambda1n
−
) G-even (G-odd). Note that dim λ n = 2n while dim /Lambda1n
+
=
dim /Lambda1n
−
= 2(n−1).
The generator θk does not have a magnitude and hence the set of Grassmann
numbers is not an ordered set. Zero is the only number that is a c-number as well
as a Grassmann number simultaneously. A Grassmann number commutes with a
c-number. It should be clear that the generators satisfy the following relations:
θ 2
k = 0
θk1 θk2 ...θ kn = εk1k2 ...kn θ1θ2 ...θ n (1.173)
θk1 θk2 ...θ km = 0 (m > n),
where
εk1 ...kn =



+1i f {k1 ... kn} is an even permutation of{1 ... n}
−1i f {k1 ... kn} is an odd permutation of{1 ... n}
0o t h e r w i s e.
A function of Grassmann numbers is deﬁned as a Taylor expansion of the
function. When n= 1, for example, we have
eθ = 1+ θ
since higher-order terms in θ vanish identically.
1.5.3 Differentiation
It is assumed that the differential operator acts on a function from the left:
∂θ j
∂θ i
= ∂
∂θ i
θ j = δij . (1.174)
It is also assumed that the differential operator anti-commutes with θk .T h e
Leibnitz rule then takes the form
∂
∂θ i
(θ j θk )= ∂θ j
∂θ i
θk −θ j
∂θ k
∂θ i
= δij θk−δik θ j . (1.175)
Exercise 1.7. Show that
∂
∂θ i
∂
∂θ j
+ ∂
∂θ j
∂
∂θ i
= 0. (1.176)
It is easily shown from this exercise that the differential operator is nilpotent
∂ 2
∂θ 2
i
= 0. (1.177)
Exercise 1.8. Show that ∂
∂θ i
θ j + θ j
∂
∂θ i
= δij . (1.178)


## Page 61

1.5.4 Integration
Supprisingly enough, integration with respect to a Grassmann variable is
equivalent to differentiation. Let D denote differentiation with respect to a
Grassmann variable and let I denote integration, where integration is understood
as a deﬁnite integral. Suppose they satisfy the relations
(1) ID = 0,
(2) DI = 0,
(3) D(A)= 0⇒I (BA )= I (B)A,
where A and B are arbitrary functions of Grassmann variables. The ﬁrst relation
states that the integration of a derivative of any function yields the surface term
and it is set to zero. The second relation states that a derivative of a deﬁnite
integral vanishes. The third relation implies that A is a constant if D(A)= 0a n d
hence it can be taken out of the integral. These relations are satiﬁed if we take
I ∝D. Here we adopt the normalization I = D and put
∫
dθ f (θ )= ∂ f (θ )
∂θ . (1.179)
We ﬁnd from the previous deﬁnition that
∫
dθ = ∂ 1
∂θ = 0
∫
dθθ = ∂θ
∂θ = 1.
If there are n generators{θk}, equation (1.179) is generalized as
∫
dθ1 dθ2 ... dθn f (θ1,θ 2,...,θ n )= ∂
∂θ 1
∂
∂θ 2
... ∂
∂θ n
f (θ1,θ 2,...,θ n ).
(1.180)
Note the order of dθk and ∂/∂θ k.
The equivalence of differentiation and integration leads to an odd behaviour
of integration under the change of integration variables. Let us consider the case
n= 1 ﬁrst. Under the change of variable θ′ = aθ (a∈/BV ), we obtain
∫
dθ f (θ )= ∂ f (θ )
∂θ = ∂ f (θ′/a)
∂θ′/a = a
∫
dθ′ f (θ′/a)


## Page 62

which leads to dθ′ = (1/a)dθ . This is readily extended to the case of n variables.
Let θi →θ′
i = aij θ j .T h e n
∫
dθ1 ...θ n f (θ )= ∂
∂θ 1
... ∂
∂θ n
f (θ )
=
n∑
ki=1
∂θ′
k1
∂θ 1
...
∂θ′
kn
∂θ n
∂
∂θ′
k1
... ∂
∂θ′
kn
f (a−1θ′)
=
n∑
ki=1
εk1 ...kn ak11 ... akn n
∂
∂θ′
k1
... ∂
∂θ′
kn
f (a−1θ′)
= det a
∫
dθ′
1 ...θ ′
n f (a−1θ′).
Accordingly, the integral measure transforms as
dθ1 dθ2 ...θ n = det a dθ′
1 dθ′
2 ... dθ′
n. (1.181)
1.5.5 Delta-function
The δ-function of a Grassmann variable is introduced as
∫
dθδ ( θ−α) f (θ )= f (α) (1.182)
for a single variable. If we substitute the expansion f (θ ) = a+ bθ into this
deﬁnition, we obtain
∫
dθδ ( θ−α)( a+ bθ) = a+ bα
from which we ﬁnd that the δ-function is explicitly given by
δ(θ −α) = θ−α. (1.183)
Extension of this result to n variables is easily veriﬁed to be (note the order of
variables)
δn (θ−α) = (θn −α n )...( θ 2−α 2)(θ1−α 1). (1.184)
The integral form of the δ-function is obtained from
∫
dξ eiξθ =
∫
dξ( 1+ iξθ) = iθ
as
δ(θ) = θ =−i
∫
dξ eiξθ . (1.185)


## Page 63

1.5.6 Gaussian integral
Let us consider the integral
I =
∫
dθ∗
1 dθ1 ... dθ∗
n dθn e−∑
ij θ∗
i Mij θ j (1.186)
where{θi} and{θ∗
i } are two sets of independent Grassmann variables. The n× n
c-number matrix M is taken to be anti-symmetric since θi and θ∗
i anti-commute.
The integral is evaluated with the help of the change of variables θ′
i = ∑
j Mij θ j
as
I = det M
∫
dθ∗
1 dθ′
1 ... dθ∗
n dθ′
ne−∑
i θ∗
i θ′
i
= det M
[ ∫
dθ∗dθ( 1+ θ′θ∗)
] n
= det M. (1.187)
We prove an interesting formula as an application of the Gaussian integral.
Proposition 1.3. Let a be an anti-symmetric matrix of order 2 n and deﬁne the
Pfafﬁan of a by
Pf(a)= 1
2nn!
∑
Permutations of
{i1 ,...,i2n}
sgn(P)ai1i2 ... ai2n−1i2n . (1.188)
Then
det a= Pf(a)2. (1.189)
Proof. Observe that
I =
∫
dθ2n ... dθ1 exp
[ 1
2
∑
ij
θi aij θ j
]
= 1
2nn!
∫
dθ2n ... dθ1
( ∑
ij
θi aij θ j
) n
= Pf(a).
Note also that
I 2 =
∫
dθ2n ... dθ1 dθ′
2n ... dθ1 exp
[ 1
2
∑
ij
(θi aij θ j + θ′
i aij θ′
j )
]
.
Under the change of variables
η k = 1
√
2
(θk + θ′
k ), η ∗
k = 1
√
2i
(θk−θ′
k ),


## Page 64

we obtain the Jacobian= (−1)n and
θi θ j + θ′
i θ′
j = η i η∗
j −η∗
j η i
dη 2n ... dη i dη∗
2n ... dη∗
1 = (−1)n2
dη 1 dη∗
1 ... dη 2n dη∗
2n ,
from which we verify that
Pf(a)2 =
∫
dη 1 dη∗
1 ... dη 2n dη∗
2n exp
[ ∑
ij
η∗
i aij η j
]
= det a. /A3
Exercise 1.9. (1) Let M be a skewsymmetric matrix and Ki be Grassmann
numbers. Show that
∫
dθ1 ... dθn e−1
2
t
θ·M·θ+t K·θ = 2n/2√
det M e−t K·M−1·K /4. (1.190)
(2) Let M be a skew-Hermitian matrix and Ki and K∗
i be Grassmann numbers.
Show that
∫
dθ∗
1 dθ1 ... dθ∗
n dθn e−θ †·M·θ+K †·θ+θ †·K = det M eK †·M−1·K . (1.191)
1.5.7 Functional derivative
The functional derivative with respect to a Grassmann variable can be deﬁned
similarly to that for a commuting variable. Let ψ( t) be a Grassmann variable
depending on a c-number parameter t and F[ψ( t)] be a functional of ψ .T h e nw e
deﬁne
δ F[ψ( t)]
δψ( s) = 1
ε{F[ψ( t)+ εδ( t−s)]−F[ψ( t)]}, (1.192)
where ε is a Grassmann parameter. The Taylor expansion of F[ψ( t)−εδ( t−s)]
with respect to ε is linear in ε since ε2 = 0. Accordingly, the limit ε →0i s
not necessary. A word of caution: division by a Grassmann number is not well
deﬁned in general. Here, however, the numerator is proportional toε and division
by ε simply means picking up the coefﬁcient of ε in the numerator.
1.5.8 Complex conjugation
Let{θi} and{θ∗
i } be two sets of the generators of Grassmann numbers. Deﬁne the
complex conjugation of θi by (θi )∗= θ∗
i and (θ∗
i )∗= θi .W ed e ﬁ n e
(θi θ j )∗= θ∗
j θ∗
i . (1.193)
Otherwise, the real c-number θi θ∗
i does not satisify the reality condition
(θi θ∗
i )∗= θi θ∗
i .


## Page 65

1.5.9 Coherent states and completeness relation
The fermion annihilation and creation operators c and c† satisfy the anti-
commutation relations {c, c}={ c†, c†}= 0a n d{c, c†}= 1 and the number
operator N = c†c has the eigenvectors |0⟩ and|1⟩. Let us consider the Hilbert
space spanned by these vectors
/C0 = Span{|0⟩,|1⟩}.
An arbitrary vector| f⟩ in /C0 may be written in the form
| f⟩=| 0⟩ f0+| 1⟩ f1,
where f0, f1 ∈/BV .
Now we consider the states
|θ⟩=| 0⟩+| 1⟩θ (1.194)
⟨θ|=⟨ 0|+ θ∗⟨1| (1.195)
where θ and θ∗are Grassmann numbers. These states are called the coherent
states and are eigenstates of c and c† respectively,
c|θ⟩=| 0⟩θ =| θ⟩θ, ⟨θ|c† = θ∗⟨0|= θ∗⟨θ|.
Exercise 1.10. Verify the following identities;
⟨θ′|θ⟩= 1+ θ′∗θ = eθ′∗θ ,
⟨θ| f⟩= f0+ θ∗f1,
⟨θ|c†| f⟩=⟨ θ|1⟩ f0 = θ∗f0 = θ∗⟨θ| f⟩,
⟨θ|c| f⟩=⟨ θ|0⟩ f1 = ∂
∂θ∗⟨θ| f⟩.
Let
h(c, c†)= h00+ h10c†+ h01c+ h11c†ch ij ∈/BV
be an arbitrary function of c and c†. Then the matrix elements of h are
⟨0|h|0⟩= h00 ⟨0|h|1⟩= h01 ⟨1|h|0⟩= h10 ⟨1|h|1⟩= h00+ h11.
It is easily found from these matrix elements that
⟨θ|h|θ′⟩= (h00+ θ∗h10+ h01θ′+ θ∗θ′h11)eθ∗θ′
. (1.196)
Lemma 1.3. Let|θ⟩ and⟨θ| be deﬁned as before. Then the completeness relation
takes the form ∫
dθ∗dθ|θ⟩⟨θ|e−θ∗θ = I. (1.197)


## Page 66

Proof. Straightforward calculation yields
∫
dθ∗dθ|θ⟩⟨θ|e−θ∗θ
=
∫
dθ∗dθ(|0⟩+| 1⟩θ) (⟨0|+ θ∗⟨1|)(1−θ∗θ)
=
∫
dθ∗dθ
(
|0⟩⟨0|+| 1⟩θ⟨0|+| 0⟩θ∗⟨1|+| 1⟩θθ∗⟨1|
)
(1−θ∗θ)
=| 0⟩⟨0|+| 1⟩⟨1|= I. /A3
1.5.10 Partition function of a fermionic oscillator
We obtain here the partition fuction of a fermionic harmonic oscillator as an
application of the path integral formalism of fermions. The Hamiltonian is
H= (c†c−1/2)ω , which has eigenvalues±ω/ 2. The partition function is then
Z (β) = Tr e−β H =
1∑
n=0
⟨n|e−β H|n⟩= eβω/ 2+ e−βω/ 2 = 2c o s h(βω/ 2).
(1.198)
Now we evaluate Z (β) in two different ways using a path integral. We start our
exposition with the following lemma.
Lemma 1.4. Let H be the Hamiltonian of a fermionic harmonic oscillator. Then
the partition function is written as
Tr e−β H =
∫
dθ∗dθ⟨−θ|e−β H|θ⟩e−θ∗θ . (1.199)
Proof. Let us insert the completeness rel ation (1.197) into the deﬁnition of a
partition function to obtain
Z (β) =
∑
n=0,1
⟨n|e−β H|n⟩
=
∑
n
∫
dθ∗dθ e−θ∗θ⟨n|θ⟩⟨θ|e−β H|n⟩
=
∑
n
∫
dθ∗dθ( 1−θ∗θ) (⟨n|0⟩+⟨ n|1⟩θ) (⟨0|e−β H|n⟩+ θ∗⟨1|e−β H|n⟩)
=
∑
n
∫
dθ∗dθ( 1−θ∗θ)[⟨0|e−β H|n⟩⟨n|0⟩
−θ∗θ⟨1|e−β H|n⟩⟨n|1⟩+ θ⟨0|e−β H|n⟩⟨n|1⟩+ θ∗⟨1|e−β H|n⟩⟨n|0⟩].


## Page 67

The last term of the last line does not contribute to the integral and hence we may
change θ∗to−θ∗.T h e n
Z (β) =
∑
n
∫
dθ∗dθ( 1−θ∗θ)[⟨0|e−β H|n⟩⟨n|0⟩
−θ∗θ⟨1|e−β H|n⟩⟨n|1⟩+ θ⟨0|e−β H|n⟩⟨n|1⟩−θ∗⟨1|e−β H|n⟩⟨n|0⟩]
=
∫
dθ∗dθ e−θ∗θ⟨−θ|e−β H|θ⟩. /A3
Accordingly, the coordinate in the trace is over anti-periodic orbits. The
Grassmann variable is θ at τ = 0 while−θ at τ = β a n dw eh a v et oi m p o s ea n
anti-periodic boundary condition over[0,β ] in the trace.
Use the expression
e−β H = lim
N→∞
(1−β H /N)N
and insert the completeness relation at each time step to ﬁnd
Z (β) = lim
N→∞
∫
dθ∗dθ e−θ∗θ⟨−θ|(1−β H /N)N|θ⟩
= lim
N→∞
∫
dθ∗dθ
N−1∏
k=1
∫
dθ∗
k dθk e−∑N−1
n=1 θ∗
n θn
×⟨−θ|(1−ε H )|θN−1⟩⟨θN−1| ... |θ1⟩⟨θ1|(1−ε H )|θ⟩
= lim
N→∞
∫ N∏
k=1
dθ∗
k dθk e−∑N
n=1 θ∗
n θn
×⟨ θN|(1−ε H )|θN−1⟩⟨θN−1| ... |θ1⟩⟨θ1|(1−ε H )|−θN⟩
w h e r ew eh a v ep u tε= β/ N and θ =−θN = θ0,θ∗=−θ∗
N = θ∗
0 .
Each matrix element is evaluated as
⟨θk|(1−ε H )|θk−1⟩=⟨ θk|θk−1⟩
[
1−ε⟨θk|H|θk−1⟩
⟨θk|θk−1⟩
]
≃⟨ θk|θk−1⟩e−ε⟨θk|H|θk−1⟩/⟨θk|θk−1⟩
= eθ∗
k θk−1 e−εω(θ ∗
k θk−1−1/2)
= eεω/ 2e(1−εω)θ ∗
k θk−1 .


## Page 68

The partition function is now expressed in terms of the path integral as
Z (β) = lim
N→∞
eβω/ 2
N∏
k=1
∫
dθ∗
k dθke−∑N
n=1 θ∗
n θn e(1−εω) ∑N
n=1 θ∗
n θn−1
= eβω/ 2 lim
N→∞
N∏
k=1
∫
dθ∗
k dθke−∑N
n=1[θ∗
n (θn−θn−1)+εωθ ∗
n θn−1]
= eβω/ 2 lim
N→∞
N∏
k=1
∫
dθ∗
k dθke−θ †·B·θ , (1.200)
where
θ =


θ1
θ2
..
.
θ
N

 θ † =
(
θ∗
1 ,θ∗
2 ,...,θ ∗
N
)
BN =



10 ... 0 −y
y 10 ... 0
0 y 1 ... 0
... . . . ...
00 ... y 1



with y =−1+ εω in the last line. We ﬁnally ﬁnd from the deﬁnition of the
Gaussian integral of Grassmann numbers that
Z (β) = e
βω/ 2 lim
N→∞
det BN = eβω/ 2 lim
N→∞
[1+ (1−βω/ N)N]
= eβω/ 2(1+ e−βω )= 2c o s h1
2 βω. (1.201)
This should be compared with the par tition function (1.151) of the bosonic
harmonic oscillator.
This partition function is also obtained by making use of the ζ -function
regularization. It follows from the second line of equation (1.200) that
Z (β) = eβω/ 2 lim
N→∞
N∏
k=1
∫
dθ∗
k dθke−∑
n[(1−εω)θ ∗
n (θn−θn−1)/ε+ωθ ∗
n θn]
= eβω/ 2
∫
/BW θ∗
/BW θ exp
[
−
∫ β
0
dτθ ∗
(
(1−εω) d
dτ + ω
)
θ
]
= eβω/ 2 DetAPBC
(
(1−εω) d
dτ + ω
)
.
Here the subscript APBC implies that the eigenvalue should be evaluated for the
solutions that satisfy the anti-periodic boundary condition θ( β) =−θ( 0).I t


## Page 69

might seem odd that the differential operator contains ε. We ﬁnd later that this
gives a ﬁnite contribution to the inﬁnite product of eigenvalues. Let us expand
the orbit θ( τ) in the Fourier modes. The eigenmodes and the corresponding
eigenvalues are
exp
( π i(2n+ 1)τ
β
)
,( 1−εω) π i(2n+ 1)
β + ω,
where n = 0,±1,±2,... . It should be noted that the coherent states are
overcomplete and that the actual number of degrees of freedom is N,w h i c hi s
related to ε as ε = β/ N. Then we have to truncate the product at −N/4≤k≤
N/4 since one complex variable has two real degrees of freedom. Accordingly,
the partition function takes the form
Z (β) = eβω/ 2 lim
N→∞
N/4∏
k=−N/4
[
i(1−εω) π( 2n−1)
β + ω
]
= eβω/ 2e−βω/ 2
∞∏
k=1
[ ( 2π( n−1/2)
β
) 2
+ ω 2
]
=
∞∏
k=1
[ π( 2k−1)
β
] 2 ∞∏
n=1
[
1+
( βω
π( 2n−1)
) 2]
.
The ﬁrst inﬁnite product, which we call P, is divergent and requires
regularization. Note, ﬁrst, that
log P=
∞∑
k=1
2l o g
[ 2π( k−1/2)
β
]
.
Deﬁne the corresponding ζ -function by
˜ζ( s)=
∞∑
k=1
[ 2π( k−1/2)
β
]−s
=
( β
2π
) s
ζ( s, 1/2)
with which we obtain P= e−2˜ζ′(0).H e r e
ζ( s, a)=
∞∑
k=0
1
(k+ a)s (0 < a < 1) (1.202)
is the generalized ζ -function (the Hurwitz ζ -function). The derivative of ˜ζ( s)
at s= 0 yields
˜ζ′(0)= log
( β
2π
)
ζ( 0, 1/2)+ ζ′(0, 1/2)=−1
2 log 2,


## Page 70

where use has been made of the values 17
ζ( 0, 1/2)= 0 ζ′(0, 1/2)=−1
2 log 2.
Finally we obtain
P= e−2˜ζ′(0) = elog 2= 2. (1.203)
Note that P is independent of β after regularization.
Putting them all together, we arrive at the partition function
Z (β) = 2
∞∏
n=1
[
1+
( βω
π( 2n−1)
) 2]
. (1.204)
By making use of the well-known formula
cosh x
2 =
∞∏
n=1
[
1+ x2
π 2(2n−1)2
]
(1.205)
we obtain
Z (β) = 2c o s hβω
2 . (1.206)
Suppose, alternatively, we are ignorant about the formula (1.205). Then,
by equating equation (1.201) with equation (1.204), we have proved the formula
(1.205) with the help of path integrals. This is a typical application of physics
to mathematics: evaluate some physical quantity by two different methods
and equate the results. Then we often obtain a non-trivial relation which is
mathematically useful.
1.6 Quantization of a scalar ﬁeld
1.6.1 Free scalar ﬁeld
The analysis made in the previous sections may be easily generalized to a case
with many degrees of freedom. We are interested, in particular, in a system with
inﬁnitely many degrees of freedom; the quantum ﬁeld theory (QFT). Let us
start our exposition with the simplest cas e, that is, the scalar ﬁeld theory. Let
φ( x) be a real scalar ﬁeld at the spacetime coordinatesx= (x, x0) where x is the
space coordinate while x0 is the time coordinate. The action depends on φ and its
derivatives ∂µφ( x)= ∂φ( x)/∂ xµ:
S=
∫
dx /C4 (φ, ∂ µφ). (1.207)
17 The ﬁrst formula follows from the relation ζ( s, 1/2) = (2s −1)ζ (s), which is derived from
the identity ζ( s, 1/2)+ ζ( s) = 2s ∑∞
n=1[1/(2n−1)s + 1/(2n)s]= 2s ζ( s). The second formula
is obtained by differentiating ζ( s, 1/2) = (2s −1)ζ (s) with respect to s and using the formula
ζ( 0)=−1/2.


## Page 71

Here /C4 is the Lagrangian density. The Euler–Lagrange equation now takes the
form
∂
∂ xµ
( ∂ /C4
∂(∂ µφ)
)
−∂ /C4
∂φ = 0. (1.208)
The Lagrangian density of a free scalar ﬁeld is
/C4
0(φ, ∂ µφ) =−1
2 (∂µφ∂ µφ + m2φ 2). (1.209)
The Euler–Lagrange equation derived from this Lagrangian density is the Klein–
Gordon equation
(/A3 −m2)φ = 0, (1.210)
where /A3 = ∂ µ∂µ =−∂ 2
0 +∇2.
The vacuum-to-vacuum amplitude in the presence of a source J has the path
integral representation⟨0,∞|0,−∞⟩J ∝Z0[J],w h e r e
Z0[J]=
∫
/BW φ exp
[
i
∫
dx
(
/C4
0+ J φ + i
2 εφ 2
)]
(1.211)
where the iε term has been added to regularize the path integral.18 Integration by
parts yields
Z0[J]=
∫
/BW φ exp
[
i
∫
dx (1
2{φ( /A3 −m2)φ + iεφ 2}+ J φ)
]
. (1.212)
Let φ c be the classical solution to the Klein–Gordon equation in the presence
of the source,
(/A3 −m2+ iε)φ c =−J. (1.213)
The solution is easily found to be
φ c(x)=−
∫
dy /Delta1(x−y)J (y) (1.214)
where /Delta1(x−y) is the Feynman propagator
/Delta1(x−y)= −1
(2π) d
∫
dd k eik(x−y)
k2+ m2−iε . (1.215)
Here d denotes the spacetime dimension. Note that /Delta1(x−y) satisﬁes
(/A3 −m2+ iε)/Delta1(x−y)= δd (x−y).
It is easy to show that (exercise) the functional Z0[J] is now written as
Z0[J]= Z0[0] exp
[
−i
2
∫
dx dyJ (x)/Delta1(x−y)J (y)
]
. (1.216)
18 Alternatively, we can introduce the imaginary time τ = ix0 to Wick rotate the time axis.


## Page 72

It is instructive to note that the propagator is conversely obtained by the functional
derivative of Z0[J],
/Delta1(x−y)= i
Z0[0]
δ2 Z0[J]
δ J (x)δ J (y)
⏐⏐⏐
⏐
J=0
. (1.217)
The amplitude Z0[0] is the vacuum-to-vacuum amplitude in the absence of
the source and may be evaluated as follows. Let us introduce the imaginary time
x4 = τ = ix0. Then, we obtain
Z0[0]=
∫
¯
/BW φ exp
[
1
2
∫
dx φ( ¯
/A3 −m2)φ
]
=[ Det(¯
/A3 −m2)]−1/2, (1.218)
where ¯
/A3 = ∂ 2
τ +∇2 and the deteminant is understood in the sense of section 1.4,
namely it is the product of eigenvalues with a relevant boundary condition.
A free complex scalar ﬁeld theory has a Lagrangian density
/C4
0 =−∂µφ∗∂ µφ −m2|φ|2+ J φ∗+ J∗φ (1.219)
where the source terms have been included. The generating functional is now
given by
Z0[J, J∗]=
∫
/BW φ /BW φ∗exp
[
i
∫
dx (/C4
0−iε|φ|2)
]
=
∫
/BW φ /BW φ∗exp
[
i
∫
dx{φ∗(/A3 −m2+ iε)φ + J∗φ + J φ∗}
]
.
(1.220)
The propagator is now given by
/Delta1(x−y)= i
Z0[0, 0]
δ2 Z0[J, J∗]
δ J∗(x)δ J (y)
⏐⏐
⏐
⏐
J=J∗=0
. (1.221)
By substituting the Klein–Gordon equations
(/A3 −m2)φ c =−J (/A3 −m2)φ∗
c =−J∗ (1.222)
we separate the generating functional as
Z0[J, J∗]= Z0[0, 0] exp
[
−i
∫
dx dyJ∗(x)/Delta1(x−y)J (y)
]
(1.223)
where
Z0[0, 0]=
∫
/BW φ /BW φ∗exp
[
−i
∫
dxφ∗(/A3 −m2−iε)φ
]
=[ Det(¯
/A3 −m2)]−1. (1.224)
Wick rotation has been made to occur at the last line.


## Page 73

1.6.2 Interacting scalar ﬁeld
It is possible to add interaction terms to the free ﬁeld Lagrangian (1.209),
/C4 (φ, ∂ µφ) = /C4
0(φ, ∂ µφ) −V (φ). (1.225)
The possible form of V (φ) is restricted by the symmetry and renormalizability of
the theory. A typical form of V is a polynomial
V (φ) = g
n! φ n (n≥3, n∈/C6 )
where the constant g∈/CA controls the strength of the interaction. The generating
functional is deﬁned similarly to the free theory as
Z[J]=
∫
/BW φ exp
[
i
∫
dx{1
2 φ( /A3 −m2)φ −V (φ) + J φ}
]
. (1.226)
The presence of V (φ) makes things slightly more complicated. It can be handled
at least perturbatively as
Z[J]=
∫
/BW φ exp
[
−i
∫
dxV (φ)
]
exp
[
i
∫
dx {
/C4
0+ J φ}
]
= exp
[
−i
∫
dxV
( 1
i
δ
δ J (x)
)] ∫
/BW φ exp
[
i
∫
dx {
/C4
0+ J φ}
]
= exp
[
−i
∫
dxV
( 1
i
δ
δ J (x)
)]
Z0[J]
=
∞∑
k=0
∫
dx1 ...
∫
dxk
(−i)k
k!
× V
( 1
i
δ
δ J (x1)
)
... V
( 1
i
δ
δ J (xk )
)
Z0[J]. (1.227)
The generating functional Z[J] generates the vacuum expectation value
of the T -product of ﬁeld operators, also known as the Green function
Gn (x1,..., xn ),a s
Gn (x1,..., xn )≡⟨0|T[φ( x1)...φ( xn )]|0⟩
= (−i)n δn
δ J (x1)...δ J (xn ) Z[J]
⏐⏐⏐⏐
J=0
. (1.228)
Since this is the nth functional derivative of Z[J] around J = 0, we obtain the
functional Taylor expansion of Z[J] as
Z[J]=
∞∑
n=1
1
n!
[ n∏
i=1
∫
dxi J (xi )
]
⟨0|T[φ( x1)...φ( xn )]|0⟩
=⟨ 0|T e
∫
dxJ (x)φ( x)|0⟩. (1.229)


## Page 74

The connected n-point functions are generated by W[J] deﬁned by
Z[J]= e−W[J]. (1.230)
The effective action /Gamma1[φ cl] is deﬁned by the Legendre transformation
/Gamma1[φ cl]≡W[J]−
∫
dτ dx J φ cl (1.231)
where
φ cl ≡⟨φ⟩J = δW[J]
δ J . (1.232)
The functional /Gamma1[φ cl] generates one-particle irreducible diagrams.
1.7 Quantization of a Dirac ﬁeld
The Lagrangian of the free Dirac ﬁeld ψ is
/C4
0 = ¯ψ( i/∂−m)ψ, (1.233)
where /∂ = γ µ∂µ. In general /A≡γ µ Aµ. Variation with respect to ¯ψ yields the
Dirac equation
(i/∂−m)ψ = 0. (1.234)
The Dirac ﬁeld, in canonical quantization, satisifes the anti-commutation
relation
{¯ψ( x0, x), ψ( x0, y)}= δ( x−y). (1.235)
Accordingly, it is expressed as a Grassmann number function in path integrals.
The generating functional is
Z0[¯η, η]=
∫
/BW
¯ψ /BW ψ exp
[
i
∫
dx (¯ψ( i/∂−m)ψ + ¯ψη +¯ηψ )]
(1.236)
where η, ¯η are Grassmannian sources.
The propagator is given by the functional derivative with respect to the
sources,
S(x−y)=− δ2 Z0[¯η, η]
δ¯η( x)δη( y)
= 1
(2π) d
∫
dd k eikx
/k−m−iε = (i/∂+ m+ iε)/Delta1(x−y)
(1.237)
where /Delta1(x−y) is the scalar ﬁeld propagator.
By making use of the Dirac equations
(i/∂−m)ψ =−η ¯ψ( i←−/∂ + m)=¯η (1.238)


## Page 75

the generating functional is cast into the form
Z0[¯η, η]= Z0[0, 0] exp
[
−i
∫
dx dy¯η( x)S(x−y)η( y)
]
. (1.239)
After Wick rotation τ = ix0, the normalization factor is obtained as
Z0[0, 0]= Det(i/∂−m)=
∏
i
λ i (1.240)
where λ i is the ith eigenvalue of the Dirac operator i/∂−m.
1.8 Gauge theories
At present, physically sensible theories of fundamental interactions are based
on gauge theories. The gauge principle— physics should not depend on how we
describe it—is in harmony with the principle of general relativity. Here we give
a brief summary of classical aspects of gauge theories. For further references, the
reader should consult those books listed at the beginning of this chapter.
1.8.1 Abelian gauge theories
The reader should be familiar with Maxwell’s equations:
div B= 0 (1.241a)
∂ B
∂ t + curl E= 0 (1.241b)
div E= ρ (1.241c)
∂ E
∂ t −curl E=−j . (1.241d)
The magnetic ﬁeld B and the electric ﬁeld E are expressed in terms of the vector
potential Aµ = (φ, A) as
B= curl AE = ∂ A
∂ t −grad φ. (1.242)
Maxwell’s equations are invariant under the gauge transformation
Aµ →Aµ+ ∂µχ (1.243)
where χ is a scalar function. This invariance is manifest if we deﬁne the
electromagnetic ﬁeld tensor Fµν by
Fµν ≡∂µ Aν −∂ν Aµ =


0 −Ex −Ey −Ez
Ex 0 Bz −By
Ey −Bz 0 Bz
Ez By −Bx 0

 . (1.244)


## Page 76

From the construction, F is invariant under (1.243). The Lagrangian of the
electromagnetic ﬁelds is given by
/C4
EM =−1
4 Fµν Fµν + Aµ j µ (1.245)
where j µ = (ρ, j).
Exercise 1.11. Show that (1.241a) and (1.241b) are written as
∂ξ Fµν + ∂µ Fνξ + ∂ν Fξµ = 0 (1.246a)
while (1.241c) and (1.241d) are
∂ν Fµν = j µ (1.246b)
where the raising and lowering of spacetime indices are carried out with the
Minkowski metric η = diag(−1, 1, 1, 1). Verify that (1.246b) is the Euler–
Lagrange equation derived from (1.245).
Let ψ be a Dirac ﬁeld with electric charge e. The free Dirac Lagrangian
/C4
0 = ¯ψ( iγ µ∂µ+ m)ψ (1.247)
is clearly invariant under the global gauge transformation
ψ →e−ieα ψ ¯ψ →¯ψ eieα (1.248)
where α ∈/CA is a constant. We elevate this symmetry to invariance under thelocal
gauge transformation,
ψ →e−ieα( x)ψ ¯ψ →¯ψ eieα( x). (1.249)
The Lagrangian transforms under (1.249) as
¯ψ( iγ µ∂µ+ m)ψ →¯ψ( iγ µ∂µ+ eγ µ∂µα + m)ψ. (1.250)
Since the extra term e∂µα looks like a gauge transformation of the vector
potential, we couple the gauge ﬁeld Aµ with ψ so that the Lagrangian has a local
gauge symmetry. We ﬁnd that
/C4 = ¯ψ [iγ µ(∂µ−ieA µ)+ m]ψ (1.251)
is invariant under the combined gauge transformation,
ψ →ψ′ = e−ieα( x)ψ ¯ψ →¯ψ′ = ¯ψ eieα( x)
Aµ →A′
µ = Aµ−∂µα( x).
(1.252)


## Page 77

Let us introduce the covariant derivatives,
∇µ ≡∂µ−ieA µ ∇′
µ ≡∂µ−ieA′
µ. (1.253)
The reader should verify that∇µψ transforms in a nice way,
∇′
µψ′ = e−ieα( x)∇µψ. (1.254)
The total quantum electrodynamic (QED) Lagrangian is
/C4
QED =−1
4 Fµν Fµν + ¯ψ( iγ µ∇µ+ m)ψ. (1.255)
Exercise 1.12. Let φ = (φ 1 + iφ 2)/
√
2 be a complex scalar ﬁeld with electric
charge e. Show that the Lagrangian
/C4 = η µν (∇µφ) †(∇ν φ) + m2φ †φ (1.256)
is invariant under the gauge transformation
φ →e−ieα( x)φφ † →φ †eieα( x) Aµ →Aµ−∂µα( x). (1.257)
1.8.2 Non-Abelian gauge theories
The gauge transformation just described is a member of a U(1) group, that
is a complex number of modulus 1, which happens to be an Abelian group.
A few decades ago, Yang and Mills (1954) introduced non-Abelian gauge
transformations. At that time, non-Abelian gauge theories were studied from
curiosity. Nowadays, they play a central role in elementary particle physics.
Let G be a compact semi-simple Lie group such as SO (N) or SU(N).T h e
anti-Hermitian generators{Tα} satisfy the commutation relations
[Tα , Tβ]= fαβ γ Tγ (1.258)
where the numbers fαβ γ are called the structure constants of G.A ne l e m e n tU
of G near the unit element can be expressed as
U= exp(−θ α Tα ). (1.259)
We suppose a Dirac ﬁeld ψ transforms under U∈G as
ψ →U ψ ¯ψ →¯ψ U†. (1.260)
[Remark: Strictly speaking, we have to specify the representation of G to which
ψ belongs. If readers feel uneasy about (1.260), they may consider ψ is in the
fundamental representation, for example.]
Consider the Lagrangian
/C4 = ¯ψ [iγ µ(∂µ+ g/BT
µ)+ m]ψ (1.261)


## Page 78

where the Yang–Mills gauge ﬁeld/BT
µ takes its values in the Lie algebra ofG,t h a t
is, /BT
µ can be expanded in terms of Tα as /BT
µ = Aµα Tα . (Script ﬁelds are anti-
Hermitian.) The constant g is the coupling constant which controls the strength
of the coupling between the Dirac ﬁeld and the gauge ﬁeld. It is easily veriﬁed
that /C4 is invariant under
ψ →ψ′ = U ψ ¯ψ →¯ψ′ = ¯ψ U†
/BT
µ →/BT
′
µ = U /BT
µU†+ g−1U ∂µU†.
(1.262)
The covariant derivative is deﬁned by∇µ = ∂µ+ g/BT
µ as before. The covariant
derivative∇µψ transforms covariantly under the gauge transformation
∇′
µψ′ = U∇µψ. (1.263)
The Yang–Mills ﬁeld tensor is
/BY
µν ≡∂µ
/BT
ν −∂ν
/BT
µ+ g[/BT
µ, /BT
ν]. (1.264)
The component Fµν α is
Fµν α = ∂µ Aν α −∂ν Aµα + gf βγ α Aµβ Aν γ . (1.265)
If we deﬁne the dual ﬁeld tensor ∗/BY
µν ≡1
2 εµνκλ
/BY
κλ , it satisﬁes the Bianchi
identity,
/BW
µ∗/BY
µν ≡∂µ∗/BY
µν + g[/BT
µ,∗/BY
µν]= 0. (1.266)
Exercise 1.13. Show that /BY
µν transforms under (1.262) as
/BY
µν →U /BY
µν U†. (1.267)
From this exercise, we ﬁnd a gauge-invariant action
/C4
YM =−1
2 tr(/BY
µν
/BY
µν ) (1.268a)
where the trace is over the group matrix. The component form is
/C4
YM =−1
2 Fµνα Fµν β tr(Tα Tβ )= 1
4 Fµνα Fµνα (1.268b)
where we have normalized {Tα} so that tr (Tα Tβ )=−1
2 δαβ . The ﬁeld equation
derived from (1.268) is
/BW
µ
/BY
µν = ∂µ
/BY
µν + g[/BT
µ, /BY
µν]= 0. (1.269)


## Page 79

1.8.3 Higgs ﬁelds
If the gauge symmetry is manifest in our world, there would be many observable
massless vector ﬁelds. The absence of such ﬁelds, except for the electromagnetic
ﬁeld, forces us to break the gauge symmetry. The theory is left renormalizable if
the symmetry is broken spontaneously.
Let us consider a U(1) gauge ﬁeld coupled to a complex scalar ﬁeldφ , whose
Lagrangian is given by
/C4 =−1
4 Fµν Fµν + (∇µφ) †(∇µφ) −λ(φ †φ −v2)2. (1.270)
The potential V (φ) = λ(φ †φ −v2)2 has minima V = 0a t |φ|= v.T h e
Lagrangian (1.270) is invariant under the local gauge transformation
Aµ →Aµ−∂µαφ →e−ieα φφ † →eieα φ †. (1.271)
This symmetry is spontaneously broken due to the vacuum expectation value
(VEV)⟨φ⟩ of the Higgs ﬁeld φ . We expand φ as
φ = 1
√
2
[v+ ρ( x)]eiα( x)/v ∼1
√
2
[v+ ρ( x)+ iα( x)]
assuming v̸= 0. If v̸= 0, we may take the unitary gauge in which the phase of
φ is ‘gauged away’ so that φ has only the real part,
φ( x)= 1
√
2
(v+ ρ( x)). (1.272)
If we substitute (1.272) into (1.270) and expand in ρ ,w eh a v e
/C4 =−1
4 Fµν Fµν + 1
2 ∂µρ∂ µρ + 1
2 e2 Aµ Aµ(v2+ 2vρ+ ρ 2)
−1
4 λ( 4v2ρ 2+ 4vρ 3+ ρ 4). (1.273)
The equations of motion for Aµ and ρ derived from the free parts are
∂ ν Fνµ + 2e2v2 Aµ = 0 ∂µ∂ µρ + 2λv 2ρ = 0. (1.274)
From the ﬁrst equation, we ﬁnd Aµ must satisfy the Lorentz condition ∂µ Aµ = 0.
The apparent degrees of freedom of (1.270) are 2(photon)+ 2(complex scalar)=
4. If VEV̸= 0, we have 3(massive vector)+ 1(real scalar)= 4. The ﬁeld A0 has
a mass term with the wrong sign and so cannot be a physical degree of freedom.
The creation of massive ﬁelds out of a gauge ﬁeld is called theHiggs mechanism..
1.9 Magnetic monopoles
Maxwell’s equations unify electricity and magnetism. In the history of physics
they should be recognized as the ﬁrst attempt to unify forces in Nature. In spite
of their great success, Dirac (1931) noticed that there existed an asymmetry in
Maxwell’s equations: the equation div B = 0 denies the existence of magnetic
charges. He introduced the magnetic monopole, a point magnetic charge, to make
the theory symmetric.


## Page 80

1.9.1 Dirac monopole
Consider a monopole of strength g sitting at r= 0,
div B= 4π gδ3(r). (1.275)
It follows from /Delta1(1/r )=−4πδ 3(r) and∇(1/r )=−r/r3 that the solution of
this equation is
B= gr/r3. (1.276)
The magnetic ﬂux /Phi1is obtained by integrating B over a sphere S of radius R so
that
/Phi1=
∮
S
B· dS= 4π g. (1.277)
What about the vector potential which gives the monopole ﬁeld (1.276)? If
we deﬁne the vector potential AN by
ANx = −gy
r (r+ z) ANy = gx
r (r+ z) ANz = 0 (1.278a)
we easily verify that
curl AN = gr/r3+ 4π gδ(x)δ( y)θ (−z). (1.279)
We have curl AN = B except along the negative z-axis (θ = π ). The singularity
along the z-axis is called the Dirac string and reﬂects the poor choice of the
coordinate system. If, instead, we deﬁne another vector potential
ASx = gy
r (r−z) AS y = −gx
r (r−z) ASz = 0 (1.278b)
we have curl AS = B except along the positive z-axis (θ = 0) this time. The
existence of a singularity is a natural consequence of (1.277). If there were a
vector A such that B= curl A with no singularity, we would have, from Gauss’
law,
/Phi1=
∮
S
B· dS=
∮
S
curl A· dS=
∫
V
div(curl A) dV = 0
where V is the volume inside the surface S. This problem is avoided only when
we abandon the use of a single vector potential.
Exercise 1.14. Let us introduce the polar coordinates (r,θ,φ ) . Show that the
vector potentials AN and AS are expressed as
AN(r)= g(1−cos θ)
r sin θ ˆeφ (1.280a)
AS(r)=−g(1+ cos θ)
r sin θ ˆeφ (1.280b)
whereˆeφ =−sin φ ˆex + cos φ ˆey .


## Page 81

1.9.2 The Wu–Yang monopole
Wu and Yang (1975) noticed that the geometrical and topological structures
behind the Dirac monopole are best described by ﬁbre bundles. In chapters 9
and 10, we give an account of the Dirac monopole in terms of ﬁbre bundles and
their connections. Here we outline the idea of Wu and Yang without introducing
the ﬁbre bundle. Wu and Yang noted that we may employ more than one vector
potential to describe a monopole. For exa mple, we may avoid singularities if
we adopt AN in the northern hemisphere and AS in the southern hemisphere
of the sphere S surrounding the monopole. These vector potentials yield the
magnetic ﬁeld B = gr/r3, which is non-singular everywhere on the sphere.
On the equator of the sphere, which is the boundary between the northern and
southern hemispheres, AN and AS are related by the gauge transformation,
AN−AS = grad /Lambda1. To compute this quantity /Lambda1, we employ the result of exercise
1.14,
AN−AS = 2g
r sin θˆeφ = grad(2gφ) (1.281)
where use has been made of the expression
grad f = ∂ f
∂ rˆer + 1
r
∂ f
∂θ ˆeθ + 1
r sin θ
∂ f
∂φ ˆeφ .
Accordingly, the gauge transformation function connecting AN and AS is
/Lambda1= 2gφ. (1.282)
Note that /Lambda1is ill deﬁned at θ = 0a n d θ = π . Since we perform the gauge
transformation only atθ = π/ 2, these singularities do not show up in our analysis.
The total ﬂux is
/Phi1=
∮
S
curl A· dS=
∫
UN
curl AN· dS+
∫
US
curl AS· dS (1.283)
where UN and US stand for the northern and southern hemispheres respectively.
Stokes’ theorem yields
/Phi1=
∮
equator
AN· ds−
∮
equator
AS· ds=
∮
equator
( AN−AS)· ds
=
∮
equator
grad(2gφ) · ds= 4gπ (1.284)
in agreement with (1.277).
1.9.3 Charge quantization
Consider a point particle with electric charge e and mass m moving in the ﬁeld
of a magnetic monopole of charge g. If the monopole is heavy enough, the


## Page 82

Schr¨odinger equation of the particle takes the form
1
2m
(
p−e
c A
)2
ψ( r)= Eψ( r). (1.285)
It is easy to show that under the gauge transformation A →A+ grad /Lambda1,t h e
wavefunction changes as ψ →exp(ie/Lambda1/¯hc)ψ . In the present case, AN and AS
differ only by the gauge transformation AN−AS = grad(2gφ) .I f ψ N and ψ S are
wavefunctions deﬁned on UN and US respectively, they are related by the phase
change
ψ S(r)= exp
(−ie/Lambda1
¯hc
)
ψ N(r). (1.286)
Let us take θ = π/ 2 and study the behaviour of wavefunctions as we go round
the equator of the sphere from φ = 0t o φ = 2π . The wavefunction is required to
be single valued, hence (1.286) forces us to take
2eg
¯hc = nn ∈/CI . (1.287)
This is the celebrated Dirac quantization condition for the magnetic charge; if
the magnetic monopole exists, the magnetic charge takes discrete values,
g= ¯hcn
2e n∈/CI . (1.288)
By the same token, if there exists a magnetic monopole somewhere in the
universe, all the electric charges are quantized.
1.10 Instantons
The vacuum-to-vacuum amplitude in the Euclidean theory is
Z≡⟨0|0⟩∝
∫
/BW φ e−S[φ,∂ µφ] (1.289)
where S is the Euclidean action. Equation (1.289) shows that the principal
contribution to Z comes from the values of φ( x) which give the local minima
of S[φ,∂ µφ]. In many theories there exist a number of local minima in addition
to the absolute minimum. In the case of non-Abelian gauge theories these minima
are called instantons.
1.10.1 Introduction
Let us consider the SU(2) gauge theory deﬁned in the four-dimensional Euclidean
space /CA
4 . The action is
S=
∫
d4 x/C4 (x)=
∫
d4 x[−1
2 tr /BY
µν
/BY
µν] (1.290)


## Page 83

where the ﬁeld strength is
/BY
µν = ∂µ
/BT
ν −∂ν
/BT
µ+ g[/BT
µ, /BT
ν] (1.291)
with
/BT
µ ≡Aµα σ α
2i
/BY
µν ≡Fµν α σ α
2i .
The ﬁeld equation is
/BW
µ
/BY
µν = ∂µ
/BY
µν + g[/BT
µ, /BY
µν]= 0. (1.292)
In the path integral only those ﬁeld conﬁgurations with ﬁnite action
contribute. Suppose /BT
µ satisﬁes
/BT
µ →iU (x)−1∂µU (x) as|x|→∞ (1.293)
where U (x) is an element of SU(2). We easily ﬁnd that /BY
µν vanishes for the /BT
µ
of (1.293). We require that on sphere S3 of large radius, the gauge potential be
given by (1.293).
Later we show that this conﬁguration is characterized by the way in which
S3 is mapped to the gauge group SU(2). Non-trivial conﬁgurations are those that
cannot be deformed continuously to a uniform conﬁguration. They were proposed
by Belavin et al (1975) and are called instantons.
1.10.2 The (anti-)self-dual solution
In general, solving a second-order diffe rential equation is more difﬁcult than
solving a ﬁrst-order one. It is nice if a second-order differential equation can
be replaced by a ﬁrst-order one which is e quivalent to the original problem. Let
us consider the inequality
∫
d4x tr (
/BY
µν ±∗/BY
µν
)2 ≥0. (1.294)
Clearly (1.294) is saturated if
/BY
µν =±∗/BY
µν . (1.295)
If the positive sign is chosen, /BY is said to be self-dual while the negative sign
gives an anti-self-dual solution. If (1.295) is satisﬁed, the ﬁeld equation is
automatically satisﬁed since
/BW
µ
/BY
µν =± /BW
µ∗/BY
µν = 0 (Bianchi identity). (1.296)
As we will show in section 10.5, the integral
Q≡−1
16π 2
∫
d4x tr /BY
µν ∗/BY
µν (1.297)


## Page 84

is an integer characterizing the way S3 is mapped to SU(2). If /BY is self-dual then
Q is positive, and if /BY is anti-self-dual then Q is negative. From (1.294), we ﬁnd
(note that∗/BY
µν ∗/BY
µν = /BY
µν
/BY
µν )t h a t
∫
d4x (2/BY
µν
/BY
µν ± 2∗/BY
µν ∗/BY
µν )≥0. (1.298)
From this inequality and the deﬁnition of the action, we ﬁnd that
S≥8π 2|Q| (1.299)
where the inequality is saturated for (1. 295). Let us concentrate on the self-dual
solution /BY =∗/BY . We look for an instanton solution of the form
/BT
µ = i f (r )U (x)−1∂µU (x) (1.300)
where r≡|x| and
f (r )→1a s r→∞ (1.301a)
U (x)= 1
r (x4−ixi σ i ). (1.301b)
Substituting (1.300) into (1.295), we ﬁnd that f satisﬁes
r d f (r )
dr = 2 f (1−f ). (1.302)
The solution that satisﬁes the boundary condition (1.301a) is
f (r )= r2
r2+ λ 2 (1.303)
where λ is a parameter that speciﬁes the size of the instanton. Substituting this
into (1.300) we ﬁnd that
/BT
µ(x)= ir2
r2+ λ 2 U (x)−1∂µU (x) (1.304)
and the corresponding ﬁeld strength
/BY
µν (x)= 4λ 2
r2+ λ 2 σ µν (1.305)
where
σ ij ≡1
4i[σ i ,σ j] σ i0 ≡1
2 σ i =−σ 0i . (1.306)
This solution gives Q=+ 1a n dS= 8π 2.


## Page 85

Problems
1.1 Consider a Hamiltonian of the form
H=
∫
dn x
[
1
2
( ∂φ
∂ t
) 2
+ 1
2 (∇φ) 2+ V (φ)
]
where V (φ) (≥0) is a potential. If φ is a time-independent classical solution, we
may drop the ﬁrst term and write H[φ]= H1[φ]+ H2[φ],w h e r e
H1[φ]≡1
2
∫
dn x (∇φ) 2 H2[φ]≡
∫
dn xV (φ).
(1) Consider a scale transformation φ( x) → φ(λ x). Show that Hi[φ]
transforms as
H1[φ]→H λ
1[φ]= λ (n−2) H1[φ] H2[φ]→ H λ
2[φ]= λ−n H2[φ].
(2) Suppose φ satisﬁes the ﬁeld equation. Show that
(2−n)H1[φ]−nH2[φ]= 0.
[Hint:T a k et h eλ -derivative of H λ
1[φ]+ H λ
2[φ] and put λ = 1.]
(3) Show that time-independent topological excitations of H[φ] exist if and
only if n= 1( Derrick’s theorem). Consider ways out of this restriction.


## Page 86

2
MATHEMATICAL PRELIMINARIES
In the present chapter we introduce elementary concepts in the theory of maps,
vector spaces and topology. A modest knowledge of undergraduate mathematics,
such as set theory, calculus, complex analysis and linear algebra is assumed.
The main purpose of this book is to study the application of the theory of
manifolds to the problems in physics. Vector spaces and topology are, in a sense,
two extreme viewpoints of manifolds. A manifold is a space which locally looks
like /CA
n (or /BV
n ) but not necessarily globally. As a ﬁrst approximation, we may
model a small part of a manifold by a Euclidean space /CA
n (or /BV
n )( as m a l l
area around a point on a surface can be approximated by the tangent plane at
that point); this is the viewpoint of a vector space. In topology, however, we
study the manifold as a whole. We want to study the properties of manifolds and
classify manifolds using some sort of ‘measures’. Topology usually comes with
an adjective: algebraic topology, differential topology, combinatorial topology,
general topology and so on. These adjectives refer to the measure we use when
classifying manifolds.
2.1 Maps
2.1.1 Deﬁnitions
Let X and Y be sets. A map (or mapping) f is a rule by which we assign y∈Y
for each x∈X. We write
f : X→Y. (2.1)
If f is deﬁned by some explicit formula, we may write
f : x↦→f (x) (2.2)
There may be more than two elements in X that correspond to the same y∈Y .A
subset of X whose elements are mapped to y ∈Y under f is called the inverse
image of y, denoted by f
−1(y) ={ x ∈X| f (x) = y}.T h e s e t X is called
the domain of the map while Y is called the range of the map. The image of
the map is f (X ) ={ y ∈Y|y = f (x) for some x ∈X}⊂ Y .T h e i m a g e
f (X) is also denoted by im f . The reader should note that a map cannot be
deﬁned without specifying the domain and the range. Take f (x) = exp x,f o r
example. If both the domain and the range are /CA , f (x) =−1h a sn oi n v e r s e


## Page 87

image. If. however, the domain and the range are the complex plane /BV ,w eﬁ n d
f−1(−1)={ (2n+ 1)π i|n∈Z}. The domain X and the range Y are as important
as f itself in specifying a map.
Example 2.1. Let f : /CA → /CA be given by f (x) = sin x. We also write
f : x ↦→sin x. The domain and the range are /CA and the image f (/CA ) is[−1, 1].
The inverse image of 0 is f−1(0)={ nπ|n∈/CI }. Let us take the same function
f (x)= sin x= (eix −e−ix )/2i but f : /BV →/BV this time. The image f (C) is the
whole complex plane /BV .
Deﬁnition 2.1. If a map satisﬁes a certain condition it bears a special name.
(a) A map f : X →Y is called injective (or one to one)i f x ̸= x′ implies
f (x)̸= f (x′).
(b) A map f : X →Y is called surjective (or onto) if for each y∈Y there
exists at least one element x∈X such that f (x)= y.
(c) A map f : X→Y is called bijective if it is both injective and surjective.
Example 2.2. Am a p f : /CA →/CA deﬁned by f : x ↦→ax (a ∈/CA −{0}) is
bijective. f : /CA →/CA deﬁned by f : x ↦→x2 is neither injective nor surjective.
f : /CA →/CA given by f : x↦→exp x is injective but not surjective.
Exercise 2.1. Am a p f : /CA →/CA deﬁned by f : x ↦→sin x is neither injective
nor surjective. Restrict the domain and the range to make f bijective.
Example 2.3. Let M be an element of the general linear group GL (n, /CA ) whose
matrix representation is given by n× n matrices with non-vanishing determinant.
Then M : /CA
n →/CA
n , x ↦→Mx is bijective. If det M = 0, it is neither injective
nor surjective.
A constant map c : X →Y is deﬁned by c(x)= y0 where y0 is a ﬁxed
element in Y and x is an arbitrary element in X. Given a map f : X →Y ,w e
may think of its restriction to A⊂X, which is denoted as f|A : A→Y .G i v e n
two maps f : X →Y and g: Y →Z,t h ecomposite map of f and g is a map
g◦f : X →Z deﬁned by g◦f (x)= g( f (x)). A diagram of maps is called
commutative if any composite maps between a pair of sets do not depend on how
they are composed. For example, in ﬁgure 2.1, f ◦g= h◦j and f ◦g= k etc.
Exercise 2.2. Let f : /CA →/CA be deﬁned by f : x →x2 and g : /CA →/CA by
g: x→exp x.W h a ta r eg◦f : /CA →/CA and f ◦g: /CA →/CA ?
If A ⊂X,a n inclusion map i : A →X is deﬁned by i (a) = a for any
a ∈A. An inclusion map is often written as i : A ↪→X.T h e identity map
idX : X →X is a special case of an inclusion map, for which A = X.I f
f : X →Y deﬁned by f : x ↦→f (x) is bijective, there exists an inverse map
f−1 : Y →X, such that f−1 : f (x)→x, which is also bijective. The maps f


## Page 88

g
k
X
Z
j
Y
f
h
W
Figure 2.1. A commutative diagram of maps.
and f−1 satisfy f ◦f−1 = idY and f−1◦f = idX .C o n v e r s e l y , i ff : X →Y
and g: Y →X satisfy f◦g= idY and g◦f = idX ,t h e nf and g are bijections.
This can be proved from the following exercise.
Exercise 2.3. Show that if f : X →Y and g: Y →X satisfy g◦f = idX , f is
injective and g is surjective. If this is applied to f ◦g= idY as well, we obtain
the previous result.
Example 2.4. Let f : /CA →(0,∞) be a bijection deﬁned by f : x ↦→exp x.
Then the inverse map f−1 : (0,∞) → /CA is f−1 : x ↦→ ln x.L e t g :
(−π/ 2,π / 2)→(−1, 1) be a bijection deﬁned by g : x →sin x.T h e i n v e r s e
map is g−1 : x↦→sin−1 x.
Exercise 2.4. The n-dimensional Euclidean group En is made of an n-
dimensional translation a: x→x+ a (x, a∈/CA
n ) a n da nO(n) rotation R: x→
Rx , R∈O(n). A general element (R, a) of En acts on x by (R, a): x↦→Rx+a.
The product is deﬁned by (R2, a2)× (R1, a1): x ↦→R2(R1x+ a1)+ a2,t h a t
is, (R2, a2)◦(R1, a1)= (R2 R1, R2a1+ a2). Show that the maps a, R and (R, a)
are bijections. Find their inverse maps.
Suppose certain algebraic structures (product or addition, say) are endowed
with the sets X and Y .I f f : X→Y preserves these algebraic structures, then f
is called a homomorphism. For example, let X be endowed with a product. If f
is a homomorphism, it preserves the product, f (ab)= f (a) f (b). Note that ab is
deﬁned by the product rule in X,a n d f (a) f (b) by that in Y . If a homomorphism
f is bijective, f is called an isomorphism and X is said to be isomorphic to Y ,
denoted x∼= y.


## Page 89

2.1.2 Equivalence relation and equivalence class
Some of the most important concepts in mathematics are equivalence relations
and equivalence classes. Although these subjects are not directly related to maps,
it is appropriate to deﬁne them at this point before we proceed further. Arelation
R deﬁned in a set X is a subset of X2. If a point (a, b)∈X2 is in R, we may write
aRb . For example, the relation > is a subset of /CA
2 .I f (a, b)∈>,t h e na > b.
Deﬁnition 2.2. An equivalence relation ∼is a relation which satisﬁes the
following requirements:
(i) a∼a (reﬂective).
(ii) If a∼b,t h e nb∼a (symmetric).
(iii) If a∼b and b∼c,t h e na∼c (transitive).
Exercise 2.5. If an integer is divided by 2, the remainder is either 0 or 1. If two
integers n and m yield the same remainder, we write m ∼n. Show that ∼is an
equivalence relation in /CI .
Given a set X and an equivalence relation∼, we have a partition of X into
mutually disjoint subsets called equivalence classes. A class [a] is made of all
the elements x in X such that x∼a,
[a]={ x∈X|x∼a} (2.3)
[a] cannot be empty since a ∼a. We now prove that if [a]∩[b] ̸=∅then
[a]=[ b]. First note that a ∼b.( S i n c e[a]∩[b] ̸=∅there is at least one
element in [a]∩[b] that satisﬁes c ∼a and c ∼b. From the transitivity, we
have a ∼b.) Next we show that [a]⊂[b]. Take an arbitrary element a′ in[a];
a′ ∼a.T h e na ∼b implies b∼a′,t h a ti sa′ ∈[b]. Thus, we have [a]⊂[b].
Similarly,[a]⊃[ b] can be shown and it follows that [a]=[ b]. Hence, two
classes[a] and[b] satisfy either[a]=[ b] or[a]∩[b]=∅. In this way a set X
is decomposed into mutually disjoint equivalence classes. The set of all classes
is called the quotient space, denoted by X/∼. The element a (or any element
in[a]) is called the representative of a class[a]. In exercise 2.5, the equivalence
relation∼divides integers into two classes, even integers and odd integers. We
may choose the representative of the even class to be 0, and that of the odd class
to be 1. We write this quotient space /CI /∼. /CI /∼is isomorphic to /CI
2,t h ecyclic
group of order 2, whose algebra is deﬁned by 0 + 0 = 0, 0+ 1 = 1+ 0= 1
and 1+ 1= 0. If all integers are divided int o equivalence classes according to
the remainder of division by n, the quotient space is isomorphic to /CI
n, the cyclic
group of order n.
Let X be a space in our usual sense. (To be more precise, we need the
notion of topological space, which will be de ﬁned in section 2.3. For the time
being we depend on our intuitive notio n of ‘space’.) Then quotient spaces may
be realized as geometrical ﬁgures. For example, let x and y be two points in /CA .


## Page 90

Figure 2.2. In (a) all the points x+ 2nπ , n∈/CI are in the same equivalence class[x].W e
may take x∈[0, 2π) as a representative of[x].( b) The quotient space /CA /∼is the circle
S1.
Introduce a relation∼by: x ∼y if there exists n ∈/CI such that y = x+ 2π n.
It is easily shown that ∼is an equivalence relation. The class [x] is the set
{..., x−2π, x, x+ 2π ,... }. A number x∈[0, 2π) serves as a representative of
an equivalence class[x], see ﬁgure 2.2(a). Note that 0 and 2π are different points
in /CA but, according to the equivalence rel ation, these points are looked upon as
the same element in /CA / ∼. We arrive at the conclusion that the quotient space
/CA / ∼is the circle S1 ={ eiθ|0≤θ< 2π}; see ﬁgure 2.2( b). Note that a point
ε is close to a point 2 π −ε for inﬁnitesimal ε. Certainly this is the case for S1,
where an angle ε is close to an angle 2π −ε, but not the case for /CA . The concept
of closeness of points is one of the main ingredients of topology.
Example 2.5. (a) Let X be a square disc {(x, y)∈/CA
2|| x|≥1,|y|≥1}.I f w e
identify the points on a pair of facing edges, (−1, y)∼(1, y), for example, we
obtain the cylinder, see ﬁgure 2.3(a). If we identify the points (−1,−y)∼(1, y),
we ﬁnd the M¨obius strip, see ﬁgure 2.3(b).[ Remarks: If readers are not familiar
with the M¨obius strip, they may take a strip of paper and glue up its ends after
a π -twist. Because of the twist, one side of the strip has been joined to the
other side, making the surface single sided. The M¨ obius strip is an example
of a non-orientable surface, while the cylinder has deﬁnite sides and is said to
be orientable. Orientability will be discussed in terms of differential forms in
section 5.5.]
(b) Let (x1, y1) and (x2, y2) be two points in/CA
2 and introduce an equivalence
relation∼by: (x1, y1) ∼(x2, y2) if x2 = x1 + 2π nx and y2 = y1 + 2π ny,
nx , ny ∈/CI .T h e n∼is an equivalence relation. The quotient space /CA
2 / ∼is
the torus T 2 (the surface of a doughnut), see ﬁgure 2.4( a). Alternatively, T 2 is


## Page 91

Figure 2.3. (a) The edges |x|= 1 are identiﬁed in the direction of the arrows to form a
cylinder. (b) If the edges are identiﬁed in the opposite direction, we have a M¨obius strip.
Figure 2.4. If all the points (x+ 2π nx , y+ 2π ny ), nx , ny ∈/CI are identiﬁed as in ( a),
the quotient space is taken to be the shaded area whose edges are identiﬁed as in (b). This
resulting quotient space is the torus T 2.
represented by a rectangle whose edges are identiﬁed as in ﬁgure 2.4(b).
(c) What if we identify the edges of a rectangle in other ways? Figure 2.5
gives possible identiﬁcations. The sp aces obtained by these identiﬁcations are


## Page 92

Figure 2.5. The Klein bottle (a) and the projective plane (b).
called the Klein bottle , ﬁgure 2.5( a), and the projective plane, ﬁgure 2.5( b),
neither of which can be realized (orembedded) in the Euclidean space/CA
3 without
intersecting with itself. They are known to be non-orientable.
The projective plane, which we denote RP 2, is visualized as follows. Let us
consider a unit vector n and identify n with−n, see ﬁgure 2.6. This identiﬁcation
takes place when we describe a rod with no head or tail, for example. We are
tempted to assign a point on S2 to specify the ‘vector’ n. This works except for
one point. Two antipodal points n= (θ, φ) and−n= (π −θ,π + φ) represent
the same state. Then we may take a northern hemisphere as the coset spaceS2/∼
since only a half ofS2 is required. However, the coset space is not just an ordinary
hemisphere since the antipodal points on the equator are identiﬁed. By continuous
deformation of this hemisphere into a square, we obtain the square in ﬁgure 2.5(b).
(d) Let us identify pairs of edges of the octagon shown in ﬁgure 2.7(a). The
quotient space is the torus with two handles, denoted by /Sigma12, see ﬁgure 2.7( b).
/Sigma1g, the torus with g handles, can be obtained by a similar identiﬁcation, see
problem 2.1. The integer g is called the genus of the torus.
(e) Let D2 ={ (x, y) ∈/CA
2|x2 + y2 ≤1} be a closed disc. Identify the
points on the boundary {(x, y) ∈/CA
2|x2 + y2 = 1}; (x1, y1) ∼(x2, y2) if
x2
1 + y2
1 = x2
2 + y2
2 = 1. Then we obtain the sphere S2 as the quotient space
D2/∼, also written as D2/S1, see ﬁgure 2.8. If we take an n-dimensional disc
Dn ={ (x0,..., xn )∈/CA
n+1|(x0)2+···+ (xn )2 ≤1} and identify the points on
the surface Sn−1, we obtain the n-sphere Sn, namely Dn /Sn−1 = Sn.
Exercise 2.6. Let H be the upper-half complex plane{τ ∈/BV | Im τ ≥0}.D e ﬁ n ea


## Page 93

Figure 2.6. If n has no head or tail, one cannot distinguish n from−n and they must
be identiﬁed. One obtains the projective plane RP 2 by this identiﬁcation n ∼−n;
RP 2 ≃ S2/∼. It sufﬁces to take a hemisphere to describe the coset space. Note, however,
that the antipodal points on the equator are identiﬁed.
Figure 2.7. If the edges of (a) are identiﬁed a torus with two holes (genus two) is obtained.
Figure 2.8. Ad i s cD2 whose boundary S1 is identiﬁed is the sphere S2.
group
SL(2, /CI )≡
{( ab
cd
) ⏐⏐
⏐
⏐a, b, c, d∈
/CI , ad−bc= 1
}
. (2.4)


## Page 94

Introduce a relation∼,f o rτ, τ′ ∈H, by τ ∼τ′ if there exists a matrix
A=
( ab
cd
)
∈SL(2, /CI )
such that
τ′ = (aτ+ b)/(cτ+ d). (2.5)
Show that this is an equivalence relation. (The quotient space H /SL(2, /CI ) is
s h o w ni nﬁ g u r e8 . 3 . )
Example 2.6. Let G be a group and H a subgroup of G.L e t g, g′ ∈G and
introduce an equivalence relation ∼by g ∼g′ if there exists h ∈H such that
g′ = gh. We denote the equivalence class [g]={ gh|h∈H} by gH . The class
gH is called a ( left) coset. gH satisﬁes either gH ∩g′ H =∅or gH = g′ H .
The quotient space is denoted by G/H . In general G/H is not a group unless H
is a normal subgroup of G,t h a ti s ,ghg−1 ∈H for any g ∈G and h ∈H .I f
H is a normal subgroup of G, G/H is called the quotient group, whose group
operation is given by [g]∗[g′]=[ gg′],w h e r e∗is the product in G/H .T a k e
ghϵ[g] and g′h′ϵ[g′]. Then there exists h′′ϵ H such that hg′ = g′h′′ and hence
ghg′h′ = gg′h′′h′ϵ[gg′]. The unit element of G/H is the equivalence class [e]
and the inverse element of[g] is[g−1].
Exercise 2.7. Let G be a group. Two elements a, b∈G are said to be conjugate
to each other, denoted bya≃ b, if there exists g∈G such that b= gag−1.S h o w
that≃ is an equivalence relation. The equivalence class[a]={ gag−1|g∈G} is
called the conjugacy class.
2.2 Vector spaces
2.2.1 Vectors and vector spaces
A vector space (or a linear space ) V over a ﬁeld K is a set in which two
operations, addition and multiplication by an element of K (called a scalar), are
deﬁned. (In this book we are mainly interested in K = /CA and /BV .) The elements
(called vectors)o f V satisfy the following axioms:
(i) u+ v= v+ u.
(ii) (u+ v)+ w= u+ (v+ w).
(iii) There exists a zero vector 0 such that v+ 0= v.
(iv) For any u, there exists−u, such that u+ (−u)= 0.
(v) c(u+ v)= cu+ cv.
(vi) (c+ d)u= cu+ d u.
(vii) (cd )u= c(d u).
(viii) 1u= u.
Here u,v,w∈V and c, d∈K and 1 is the unit element of K .


## Page 95

Let{vi} be a set of k (>0) vectors. If the equation
x1v1+ x2v2+···+ xkvk = 0 (2.6)
has a non-trivial solution, xi ̸= 0f o rs o m ei, the set of vectors {v j} is called
linearly dependent, while if (2.6) has only a trivial solution, xi = 0f o ra n yi,
{vi} is said to be linearly independent. If at least one of the vectors is a zero
vector 0, the set is always linearly dependent.
A set of linearly independent vectors {ei} is called a basis of V ,i fa n y
element v∈V is written uniquely as a linear combination of{ei}:
v= v1 e1+ v2 e2+···+ vn en . (2.7)
The numbers vi ∈K are called the components of v with respect to the basis
{ej}.I f t h e r e a r en elements in the basis, the dimension of V is n, denoted by
dim V = n. We usually write the n-dimensional vector space over K as V (n, K )
(or simply V if n and K are understood from the context). We assume n is ﬁnite.
2.2.2 Linear maps, images and kernels
Given two vector spaces V and W,am a p f : V →W is called a linear map
if it satisﬁes f (a1v1 + a2v2) = a1 f (v1)+ a2 f (v2) for any a1, a2 ∈K and
v1,v2 ∈V . A linear map is an example of a homomorphism that preserves the
vector addition and the scalar multiplication. The image of f is f (V )⊂W and
the kernel of f is{v∈V| f (v)= 0} and denoted by im f and ker f respectively.
ker f cannot be empty since f (0) is always 0.I f W is the ﬁeld K itself, f is
called a linear function.I f f is an isomorphism, V is said to be isomorphic to
W and vice versa, denoted by V ∼= W. It then follows that dim V = dim W.
In fact, all the n-dimensional vector spaces are isomorphic to K n,a n dt h e ya r e
regarded as identical vector spaces. The isomorphism between the vector spaces
is an element of GL(n, K ).
Theorem 2.1. If f : V →W is a linear map, then
dim V = dim(ker f )+ dim(im f ). (2.8)
Proof.S i n c ef is a linear map, it follows that ker f and im f are vector spaces,
see exercise 2.8. Let the basis of ker f be {g1,..., gr} and that of im f be
{h′
1,..., h′
s}. For each i (1 ≤i ≤s),t a k ehi ∈V such that f (hi ) = h′
i and
consider the set of vectors{g1,..., gr , h1,..., hs}.
Now we show that these vectors form a linearly independent basis of V .
Take an arbitrary vectorv∈V .S i n c ef (v)∈im f , it can be expanded as f (v)=
ci h′
i = ci f (hi ). From the linearity of f , it then follows that f (v−ci hi )= 0,t h a t
is v−ci hi ∈ker f . This shows that an arbitrary vector v is a linear combination
of{g1,..., gr , h1,..., hs}. Thus, V is spanned by r+ s vectors. Next let us


## Page 96

assume ai gi + bi hi = 0.T h e n0= f (0)= f (ai gi + bi hi )= bi f (hi )= bi h′
i ,
which implies that bi = 0. Then it follows from ai gi = 0 that ai = 0, and
the set {g1,..., gr , h1,..., hs} is linearly independent in V . Finally we ﬁnd
dim V = r+ s= dim(ker f )+ dim(im f ). /A3
[Remark: The vector space spanned by {h1,..., hs} is called the orthogonal
complement of ker f and is denoted by (ker f )⊥.]
Exercise 2.8. (1) Let f : V →W be a linear map. Show that both ker f and im f
are vector spaces.
(2) Show that a linear map f : V →V is an isomorphism if and only if
ker f ={ 0}.
2.2.3 Dual vector space
The dual vector space has already been introduced in section 1.2 in the context of
quantum mechanics. The exposition here is more mathematical and complements
the materials presented there.
Let f : V →K be a linear function on a vector space V (n, K ) over a
ﬁeld K .L e t{ei} be a basis and take an arbitrary vector v= v1 e1+···+ vn en.
From the linearity of f ,w eh a v ef (v)= v1 f (e1)+···+ vn f (en ). Thus, if we
know f (ei ) for all i, we know the result of the operation of f on any vector. It is
remarkable that the set of linear functi ons is made into a vector space, namely a
linear combination of two linear functions is also a linear function.
(a1 f1+ a2 f2)(v)= a1 f1(v)+ a2 f2(v) (2.9)
This linear space is called the dual vector space to V (n, K ) and is denoted by
V∗(n, K ) or simply by V∗.I f d i m V is ﬁnite, dim V∗is equal to dim V .L e t
us introduce a basis {e∗i} of V∗.S i n c ee∗i is a linear function it is completely
s p e c i ﬁ e db yg i v i n ge∗i (e j ) for all j. Let us choose the dual basis,
e∗i (ej )= δi
j . (2.10)
Any linear function f , called a dual vector in this context, is expanded in terms
of{e∗i},
f = fi e∗i . (2.11)
The action of f on v is interpreted as an inner product between a column vector
and a row vector,
f (v)= fi e∗i (v j e j )= fi v j e∗i (e j )= fi vi . (2.12)
We sometimes use the notation⟨ , ⟩: V∗× V →K to denote the inner product.
Let V and W be vector spaces with a linear map f : V →W and let
g : W →K be a linear function on W (g ∈W∗). It is easy to see that the


## Page 97

g ο f
V KW
W ∗V ∗
g ο f g
f g
f ∗
∋
∋
Figure 2.9. The pullback of a function g is a function f∗(g)= g◦f .
composite map g◦f is a linear function on V . Thus, f and g give rise to an
element h∈V∗deﬁned by
h(v)≡g( f (v)) v∈V. (2.13)
Given g ∈W∗,am a p f : V →W has induced a map h ∈V∗. Accordingly,
we have an induced map f∗: W∗→V∗deﬁned by f∗: g↦→h = f∗(g),s e e
ﬁgure 2.9. The map h is called the pullback of g by f∗.
Since dim V∗= dim V , there exists an isomorphism between V and V∗.
However, this isomorphism is not canonical; we have to specify an inner product
in V to deﬁne an isomorphism between V and V∗and vice versa,s e et h en e x t
section. The equivalence of a vector space and its dual vector space will appear
recurrently in due course.
Exercise 2.9. Suppose{ f
j} is another basis of V and{ f∗i} the dual basis. In
terms of the old basis, f i is written as f i = Ai j ej where A∈GL(n, K ).S h o w
that the dual bases are related by e∗i = f∗j A j i .
2.2.4 Inner product and adjoint
Let V = V (m, K ) be a vector space with a basis{ei} and let g be a vector space
isomorphism g : V →V∗,w h e r eg is an arbitrary element of GL (m, K ).T h e
component representation of g is
g: v j →gij v j . (2.14)
Once this isomorphism is given, we may deﬁne the inner product of two vectors
v1,v2 ∈V by
g(v1,v2)≡⟨gv1,v2⟩. (2.15)
Let us assume that the ﬁeld K is a real number /CA . for deﬁniteness. Then
equation (2.15) has a component expression,
g(v1,v2)= v1i g ji v2 j . (2.16)


## Page 98

We require that the matrix (gij ) be positive deﬁnite so that the inner product
g(v,v) has the meaning of the squared norm ofv. We also require that the metric
be symmetric: gij = g ji so that g(v1,v2)= g(v2,v1).
Next, let W = W (n, /CA ) be a vector space with a basis { f α} and a vector
space isomorphism G: W →W∗. Given a map f : V →W, we may deﬁne the
adjoint of f , denoted by ˜f ,b y
G(w, f v)= g(v, ˜f w) (2.17)
where v ∈V and w ∈W. It is easy to see that ˜(˜f ) = f . The component
expression of equation (2.17) is
wα Gαβ f β
i vi = vi gij ˜f j α wα (2.18)
where f β i and ˜f j α are the matrix representations of f and ˜f respectively. If
gij = δij and Gαβ = δαβ , the adjoint ˜f reduces to the transpose f t of the matrix
f .
Let us show that dim im f = dim im ˜f . Since (2.18) holds for any v ∈V
and w∈W,w eh a v eGαβ f β i = gij ˜f j α ,t h a ti s
˜f = g−1 f tGt. (2.19)
Making use of the result of the following exercise, we obtain rank f = rank ˜f ,
where the rank of a map is deﬁned by that of the corresponding matrix (note that
g ∈GL(m, /CA ) and G ∈GL(n, /CA )). It is obvious that dim im f is the rank of a
matrix representing the map f and we conclude dim im f = dim im ˜f .
Exercise 2.10. Let V = V (m, /CA ) and W = W (n, /CA ) and let f b eam a t r i x
corresponding to a linear map from V to W. Verify that rank f = rank f t =
rank(Mf t N),w h e r eM∈GL(m, /CA ) and N∈GL(n, /CA ).
Exercise 2.11. Let V be a vector space over /BV . The inner product of two vectors
v1 and v2 is deﬁned by
g(v1,v2)=
 v1i gij v2 j (2.20)
where¯ denotes the complex conjugate. From the positivity and symmetry of the
inner product, g(v1,v2)=
 g(v2,v1), the vector space isomorphism g: V →V∗
is required to be a positive-deﬁnite Hermitian matrix. Let f : V →W be a
(complex) linear map and G : W →W∗be a vector space isomorphism. The
adjoint of f is deﬁned by g(v, ˜f w) =
 G(w, f v). Repeat the analysis to show
that
(a) ˜f = g−1 f †G†,w h e r e† denotes the Hermitian conjugate, and
(b) dim im f = dim im ˜f .
Theorem 2.2. (Toy index theorem )L e t V and W be ﬁnite-dimensional vector
spaces over a ﬁeld K and let f : V →W be a linear map. Then
dim ker f −dim ker ˜f = dim V−dim W. (2.21)


## Page 99

Proof. Theorem 2.1 tells us that
dim V = dim ker f + dim im f
and, if applied to ˜f : W →V ,
dim W = dim ker ˜f + dim im ˜f .
We saw earlier that dim im f = dim im ˜f , from which we obtain
dim V−dim ker f = dim W−dim ker ˜f . /A3
Note that in (2.21), each term on the LHS depends on the details of the map
f . The RHS states, however, that thedifference in the two terms is independent of
f ! This may be regarded as a ﬁnite-dimensional analogue of the index theorems,
see chapter 12.
2.2.5 Tensors
A dual vector is a linear object that maps a vector to a scalar. This may be
generalized to multilinear objects called tensors, which map several vectors and
dual vectors to a scalar. A tensor T of type (p, q) is a multilinear map that maps
p dual vectors and q vectors to /CA ,
T :
p⨂
V∗
q⨂
V →/CA . (2.22)
For example, a tensor of type (0, 1) maps a vector to a real number and is
identiﬁed with a dual vector. Similarly, a tensor of type (1, 0) is a vector. If
ω maps a dual vector and two vectors to a scalar, ω : V∗× V× V →/CA , ω is of
type (1, 2).
The set of all tensors of type (p, q) is called the tensor space of type (p, q)
and denoted by /CC
p
q .T h etensor product τ = µ⊗ν ∈/CC
p
q ⊗/CC
p′
q′ is an element of
/CC
p+p′
q+q′ deﬁned by
τ( ω 1,...,ω p ,ξ 1,...,ξ p′; u1,..., uq ,v 1,...,v q′ )
= µ(ω 1,...,ω p; u1,..., uq )ν(ξ 1,...,ξ p′; v1,...,v q′ ). (2.23)
Another operation in a tensor space is the contraction, which is a map from
a tensor space of type (p, q) to type (p−1, q−1) deﬁned by
τ( ..., e∗i ,... ; ..., ei ,... ) (2.24)
where{ei} and{e∗i} are the dual bases.
Exercise 2.12. Let V and W be vector spaces and let f : V →W be a linear
map. Show that f is a tensor of type (1, 1).


## Page 100

2.3 Topological spaces
The most general structure with which we work is a topological space. Physicists
often tend to think that all the spaces th ey deal with are equipped with metrics.
However, this is not always the case. In fact, metric spaces form a subset of
manifolds and manifolds form a subset of topological spaces.
2.3.1 Deﬁnitions
Deﬁnition 2.3. Let X be any set and/CC ={ Ui|i∈I} denote a certain collection of
subsets of X. The pair (X, /CC ) is a topological space if /CC satisﬁes the following
requirements.
(i)∅, X ∈/CC .
(ii) If /CC is any (maybe inﬁnite) subcollection of I, the family {Uj| j ∈J}
satisﬁes∪j∈J Uj ∈/CC .
(iii) If K is any ﬁnite subcollection of I, the family {Uk|k ∈K} satisﬁes
∩k∈K Uk ∈/CC .
X alone is sometimes called a topological space. The Ui are called the open
sets and /CC is said to give a topology to X.
Example 2.7. (a) If X is a set and /CC is the collection of all the subsets of X,t h e n
(i)–(iii) are automatically satisﬁed. This topology is called the discrete topology.
(b) Let X be a set and/CC ={∅, X}. Clearly /CC satisﬁes (i)–(iii). This topology
is called the trivial topology. In general the discrete topology is too stringent
while the trivial topology is too trivial to give any interesting structures on X.
(c) Let X be the real line /CA . All open intervals (a, b) and their unions
deﬁne a topology called the usual topology ; a and b may be −∞and ∞
respectively. Similarly, the usual topology in /CA
n can be deﬁned. [Take a product
(a1, b1)×···× (an , bn ) a n dt h e i ru n i o n s .... ]
Exercise 2.13. In deﬁnition 2.3, axioms (ii) and ( iii) look somewhat unbalanced.
Show that, if we allow inﬁnite intersection in (iii), the usual topology in/CA reduces
to the discrete topology (and is thus not very interesting).
A metric d: X× X→/CA is a function that satisﬁes the conditions:
(i) d(x, y)= d(y, x)
(ii) d(x, y)≥0 where the equality holds if and only if x= y
(iii) d(x, y)+ d(y, z)≥d(x, z)
for any x, y, z∈X.I f X is endowed with a metricd, X is made into a topological
space whose open sets are given by ‘open discs’,
Uε (X )={ y∈X|d(x, y)<ε } (2.25)


## Page 101

and all their possible unions. The topology /CC thus deﬁned is called the metric
topology determined by d. The topological space (X, /CC ) is called ametric space.
[Exercise: Verify that a metric space (X, /CC ) is indeed a topological space.]
Let (X, /CC ) be a topological space and A be any subset of X.T h e n/CC ={ Ui}
induces the relative topology in A by /CC
′ ={ Ui ∩A|Ui ∈/CC }.
Example 2.8. Let X= /CA
n+1 and take the n-sphere Sn,
(x0)2+ (x1)2+···+ (xn )2 = 1. (2.26)
A topology in Sn may be given by the relative topology induced by the usual
topology on /CA
n+1 .
2.3.2 Continuous maps
Deﬁnition 2.4. Let X and Y be topological spaces. A map f : X →Y is
continuous if the inverse image of an open set in Y is an open set in X.
This deﬁnition is in agreement with our intuitive notion of continuity. For
instance, let f : /CA →/CA be deﬁned by
f (x)=
{
−x+ 1 x≤0
−x+ 1
2 x > 0. (2.27)
We take the usual topology in /CA , hence any open interval (a, b) is an open
set. In the usual calculus, f is said to have a discontinuity at x = 0. For an
open set (3/2, 2)⊂Y ,w eﬁ n d f−1((3/2, 2))= (−1,−1/2) which is an open
set in X. I fw et a k ea no p e ns e t(1−1/4, 1+ 1/4) ⊂Y ,h o w e v e r ,w eﬁ n d
f−1((1−1/4, 1+ 1/4)) = (−1/4, 0] which is not an open set in the usual
topology.
Exercise 2.14. By taking a continuous function f : /CA →/CA , f (x) = x2 as an
example, show that the reverse deﬁnition, ‘ a map f is continuous if it maps an
open set in X to an open set in Y ’, does not work. [Hint:F i n dw h e r e(−ε,+ε) is
mapped to under f .]
2.3.3 Neighbourhoods and Hausdorff spaces
Deﬁnition 2.5. Suppose /CC gives a topology to X. N is a neighbourhood of a
point x∈X if N is a subset of X and N contains some (at least one) open set Ui
to which x belongs. (The subset N need not be an open set. If N happens to be
an open set in /CC , it is called an open neighbourhood.)
Example 2.9. Take X = /CA with the usual topology. The interval [−1, 1] is a
neighbourhood of an arbitrary point x∈(−1, 1).


## Page 102

Deﬁnition 2.6. A topological space (X, /CC ) is a Hausdorff space if, for an
arbitrary pair of distinct points x, x′ ∈X, there always exist neighbourhoods
Ux of x and Ux′ of x′ such that Ux ∩Ux′ =∅.
Exercise 2.15. Let X ={ John, Paul, Ringo, George} and U0 =∅, U1 =
{John}, U2 ={ John, Paul}, U3 ={ John, Paul, Ringo, George}. Show that /CC =
{U0, U1, U2, U3} gives a topology to X. Show also that (X, /CC ) is not a Hausdorff
space.
Unlike this exercise, most spaces that appear in physics satisfy the Hausdorff
property. In the rest of the present book we always assume this is the case.
Exercise 2.16. Show that /CA with the usual topology is a Hausdorff space. Show
also that any metric space is a Hausdorff space.
2.3.4 Closed set
Let (X, /CC ) be a topological space. A subset A of X is closed if its complement
in X is an open set, that is X−A∈/CC . According to the deﬁnition, X and∅are
both open and closed. Consider a set A (either open or closed). The closure of A
is the smallest closed set that contains A and is denoted by ¯A.T h e interior of A
is the largest open subset of A and is denoted by A◦.T h eboundary b(A) of A is
the complement of A◦in A; b(A)= A−A◦. An open set is always disjoint from
its boundary while a closed set always contains its boundary.
Example 2.10. Take X = /CA with the usual topology and take a pair of open
intervals (−∞, a) and (b,∞) where a < b.S i n c e(−∞, a)∪(b,∞) is open
under the usual topology, the complement [a, b] is closed. Any closed interval
is a closed set under the usual topology. Let A = (a, b),t h e n ¯A =[ a, b].
The boundary b(A) consists of two points {a, b}.T h e s e t s(a, b),[a, b],( a, b],
and[a, b) all have the same boundary, closure and interior. In /CA
n , the product
[a1, b1]×···×[ an , bn] is a closed set under the usual topology.
Exercise 2.17. Whether a set A⊂X is open or closed depends on X.L e tu st a k e
an interval I = (0, 1) in the x-axis. Show that I is open in the x-axis /CA while it
is neither closed nor open in the xy-plane /CA
2 .
2.3.5 Compactness
Let (X, /CC ) be a topological space. A family {Ai} of subsets of X is called a
covering of X,i f ⋃
i∈I
Ai = X.
If all the Ai happen to be the open sets of the topology /CC , the covering is called
an open covering.


## Page 103

Deﬁnition 2.7. Consider a set X and all possible coverings of X.T h e s e tX is
compact if, for every open covering{Ui|i∈I}, there exists a ﬁnite subset J of I
such that{Uj| j∈J} is also a covering of X.
In general, if a set is compact in /CA
n , it must be bounded. What else is
needed? We state the result without the proof.
Theorem 2.3. Let X be a subset of /CA
n . X is compact if and only if it isclosed and
bounded.
Example 2.11. (a) A point is compact.
(b) Take an open interval (a, b) in /CA and choose an open covering Un =
(a, b−1/n), n∈/C6 . Evidently
⋃
n∈/CI
Un = (a, b).
However, no ﬁnite subfamily of{Un} covers (a, b). Thus, an open interval (a, b)
is non-compact in conformity with theorem 2.3.
(c) Sn in example 2.8 with the relative topology is compact, since it is closed
and bounded in /CA
n+1 .
The reader might not appreciate the si gniﬁcance of compactness from the
deﬁnition and the few examples given here. It should be noted, however, that some
mathematical analyses as well as physics become rather simple on a compact
space. For example, let us consider a system of electrons in a solid. If the solid
is non-compact with inﬁnite volume, we have to deal with quantum statistical
mechanics in an inﬁnite volume. It is known that this is mathematically quite
complicated and requires knowledge of the advanced theory of Hilbert spaces.
What we usually do is to conﬁne the system in a ﬁnite volume V surrounded by
hard walls so that the electron wavefunction vanishes at the walls, or to impose
periodic boundary conditions on the walls, which amounts to putting the system in
a torus, see example 2.5(b). In any case, the system is now put in a compact space.
Then we may construct the Fock space whose excitations are labelled by discrete
indices. Another signiﬁcance of compactness in physics will be found when we
study extended objects such as instantons and Belavin–Polyakov monopoles, see
section 4.8. In ﬁeld theories, we usua lly assume that the ﬁeld approaches some
asymptotic form corresponding to the vacuum (or one of the vacua) at spatial
inﬁnities. Similarly, a class of order parameter distributions in which the spatial
inﬁnities have a common order parameter is an interesting class to study from
various points of view as we shall see later. Since all points at inﬁnity are
mapped to a point, we have effectively compactiﬁed the non-compact space
/CA
n
to a compact space Sn = /CA
n ∪{∞}. This procedure is called the one-point
compactiﬁcation.


## Page 104

2.3.6 Connectedness
Deﬁnition 2.8. (a) A topological space X is connected if it cannot be written as
X = X1∪X2,w h e r eX1 and X2 are both open and X1∩X2 =∅.O t h e r w i s eX
is called disconnected.
(b) A topological space X is called arcwise connected if, for any points
x, y ∈X, there exists a continuous map f :[ 0, 1]→ X such that f (0) = x
and f (1) = y. With a few pathological exceptions, arcwise connectedness is
practically equivalent to connectedness.
(c) A loop in a topological space X is a continuous map f :[ 0, 1]→ X
such that f (0)= f (1). If any loop in X can be continuously shrunk to a point, X
is called simply connected.
Example 2.12. (a) The real line /CA is arcwise connected while /CA −{0} is not.
/CA
n (n≥2) is arcwise connected and so is /CA
n −{0}.
(b) Sn is arcwise connected. The circle S1 is not simply connected. If n≥2,
Sn is simply connected. The n-dimensional torus
T n = S1× S1×···× S1

 
 
n
(n≥2)
is arcwise connected but not simply connected.
(c) /CA
2 −/CA is not arcwise connected. /CA
2 −{0} is arcwise connected but not
simply connected. /CA
3 −{0} is arcwise connected and simply connected.
2.4 Homeomorphisms and topological invariants
2.4.1 Homeomorphisms
As we mentioned at the beginning of this chapter, the main purpose of topology
is to classify spaces. Suppose we have several ﬁgures and ask ourselves which
are equal and which are different. Since we have not deﬁned what is meant by
equal or different, we may say ‘they are all different from each other’ or ‘they
are all the same ﬁgures’. Some of the deﬁnitions of equivalence are too stringent
and some are too loose to produce any sensible classiﬁcation of the ﬁgures or
spaces. For example, in elementary geometry, the equivalence of ﬁgures is given
by congruence, which turns out to be too stringent for our purpose. In topology,
we deﬁne two ﬁgures to be equivalent if it is possible to deform one ﬁgure into the
other by continuous deformation. Namely we introduce the equivalence relation
under which geometrical objects are classiﬁed according to whether it is possible
to deform one object into the other by continuous deformation. To be more
mathematical, we need to introduce the following notion of homeomorphism.
Deﬁnition 2.9. Let X
1 and X2 be topological spaces. A map f : X1 →X2 is a
homeomorphism if it is continuous and has an inverse f−1 : X2 →X1 which is


## Page 105

Figure 2.10. (a) A coffee cup is homeomorphic to a doughnut. ( b) The linked rings are
homeomorphic to the separated rings.
also continuous. If there exists a homeomorphism between X1 and X2, X1 is said
to be homeomorphic to X2 and vice versa.
In other words, X1 is homeomorphic to X2 if there exist maps f : X1 →X2
and g: X2 →X1 such that f◦g= idX2 ,a n dg◦f = idX1 . It is easy to show that
a homeomorphism is an equivalence relation. Reﬂectivity follows from the choice
f = idX , while symmetry follows since if f : X1 →X2 is a homeomorphism
so is f−1 : X2 →X1 by deﬁnition. Transitivity follows since, if f : X1 →X2
and g: X2 →X3 are homeomorphisms so is g◦f : X1 →X3. Now we divide
all topological spaces into equivalence classes according to whether it is possible
to deform one space into the other by a homeomorphism. Intuitively speaking,
we suppose the topological spaces are made out of ideal rubber which we can
deform at our will. Two topological spaces are homeomorphic to each other if we
can deform one into the other continuously, that is, without tearing them apart or
pasting.
Figure 2.10 shows some examples of homeomorphisms. It seems impossible
to deform the left ﬁgure in ﬁgure 2.10( b) into the right one by continuous
deformation. However, this is an artefact of the embedding of these objects
in
/CA
3 . In fact, they are continuously deformable in /CA
4 , see problem 2.3. To
distinguish one from the other, we have to embed them in S3, say, and compare
the complements of these objects in S3. This approach is, however, out of the
scope of the present book and we will content ourselves with homeomorphisms.
2.4.2 Topological invariants
Now our main question is: ‘ How can we characterize the equivalence classes
of homeomorphism? ’ In fact, we do not know the complete answer to this
question yet. Instead, we have a rather modest statement, that is, if two spaces
have different ‘ topological invariants ’, they are not homeomorphic to each
other. Here topological invariants are those quantities which are conserved under
homeomorphisms. A topological invariant may be a number such as the number
of connected components of the space, an al gebraic structure such as a group or


## Page 106

a ring which is constructed out of the space, or something like connectedness,
compactness or the Hausdorff property. (Although it seems to be intuitively
clear that these are topological invariants, we have to prove that they indeed
are. We omit the proofs. An interested reader may consult any text book on
topology.) If we knew the complete set of topological invariants we could specify
the equivalence class by giving these invariants. However, so far we know a partial
set of topological invariants, which means that even if all the known topological
invariants of two topological spaces coincide, they may not be homeomorphic to
each other. Instead, what we can say at most is: if two topological spaces have
different topological invariants they cannot be homeomorphic to each other.
Example 2.13. (a) A closed line [−1, 1] is not homeomorphic to an open line
(−1, 1),s i n c e[−1, 1] is compact while (−1, 1) is not.
(b) A circle S
1 is not homeomorphic to /CA ,s i n c eS1 is compact in /CA
2 while
/CA is not.
(c) A parabola (y= x2) is not homeomorphic to a hyperbola (x2−y2 = 1)
although they are both non-compact. A parabola is (arcwise) connected while a
hyperbola is not.
(d) A circle S1 is not homeomorphic to an interval [−1, 1], although they
are both compact and (arcwise) connected. [−1, 1] is simply connected while
S1 is not. Alternatively S1 −{p}, p being any point in S1 is connected while
[−1, 1]−{0} is not, which is more evidence against their equivalence.
(e) Surprisingly, an interval without the endpoints is homeomorphic to a line
/CA . To see this, let us take X = (−π/ 2,π / 2) and Y = /CA and let f : X →Y be
f (x)= tan x. Since tan x is one to one on X and has an inverse, tan−1 x,w h i c h
is one to one on /CA , this is indeed a homeomorphism. Thus, boundedness is not a
topological invariant.
(f) An open disc D2 ={ (x, y)∈/CA
2|x2+ y2 < 1} is homeomorphic to /CA
2 .
A homeomorphism f : D2 →/CA
2 may be
f (x, y)=
(
x
√
1−x2−y2
, y
√
1−x2−y2
)
(2.28)
while the inverse f−1 : /CA
2 →D2 is
f−1(x, y)=
(
x
√
1+ x2+ y2 , y
√
1+ x2+ y2
)
. (2.29)
The reader should verify that f ◦f−1 = id
/CA
2 ,a n d f−1 ◦f = idD2 .A s w e
saw in example 2.5(e), a closed disc whose boundary S1 corresponds to a point
is homeomorphic to S2. If we take this point away, we have an open disc. The
present analysis shows that this open disc is homeomorphic to /CA
2 .B y r e v e r s i n g
the order of arguments, we ﬁnd that if we add a point (inﬁnity) to /CA
2 , we obtain
a compact space S2. This procedure is the one-point compactiﬁcation S2 =
/CA
2 ∪{∞}introduced in the previous section. We similarly have Sn = /CA
n ∪{∞}.


## Page 107

(g) A circle S1 ={ (x, y)∈/CA
2|x2+ y2 = 1} is homeomorphic to a square
I2 ={ (x, y)∈/CA
2|(|x|= 1,|y|≤1), (|x|≤1,|y|= 1)}. A homeomorphism
f : I2 →S1 may be given by
f (x, y)=
( x
r , y
r
)
r=
√
x2+ y2. (2.30)
Since r cannot vanish, (2.27) is invertible.
Exercise 2.18. Find a homeomorphism between a circle S1 ={ (x, y)∈/CA
2|x2+
y2 = 1} and an ellipse E={ (x, y)∈/CA
2|(x/a)2+ (y/b)2 = 1}.
2.4.3 Homotopy type
An equivalence class which is somewhat coarser than homeomorphism but which
is still quite useful is ‘of the same homotopy type’. We relax the conditions in
deﬁnition 2.9 so that the continuous functions f or g need not have inverses. For
example, take X = (0, 1) and Y ={ 0} and let f : X →Y , f (x) = 0a n d
g: Y →X, g(0)= 1
2 .T h e nf ◦g= idY , while g◦f ̸= idX . This shows that an
open interval (0, 1) is of the same homotopy type as a point{0}, although it is not
homeomorphic to{0}. We have more on this topic in section 4.2.
Example 2.14. (a) S1 is of the same homotopy type as a cylinder, since a cylinder
is a direct product S1× /CA and we can shrink /CA to a point at each point of S1.B y
the same reason, the M¨obius strip is of the same homotopy type as S1.
(b) A disc D2 ={ (x, y)∈/CA
2|x2+ y2 < 1} is of the same homotopy type
as a point. D2−{(0, 0)} is of the same homotopy type as S1. Similarly, /CA
2 −{0}
is of the same homotopy type as S1 and /CA
3 −{0} as S2.
2.4.4 Euler characteristic: an example
The Euler characteristic is one of the most useful topological invariants.
Moreover, we ﬁnd the prototype of the algebraic approach to topology in it. To
avoid unnecessary complication, we restrict ourselves to points, lines and surfaces
in /CA
3 .A polyhedron is a geometrical object surrounded by faces. The boundary
of two faces is an edge and two edges meet at a vertex. We extend the deﬁnition
of a polyhedron a bit to include polygons and the boundaries of polygons, lines or
points. We call the faces, edges and vertices of a polyhedronsimplexes. Note that
the boundary of two simplexes is either empty or another simplex. (For example,
the boundary of two faces is an edge.) Formal deﬁnitions of a simplex and a
polyhedron in a general number of dimensions will be given in chapter 3. We are
now ready to deﬁne the Euler characteristic of a ﬁgure in /CA
3 .
Deﬁnition 2.10. Let X be a subset of/CA
3 , which is homeomorphic to a polyhedron
K . Then the Euler characteristic χ( X ) of X is deﬁned by
χ( X )= (number of verticies in K )−(number of edges in K )
+ (number of faces in K ). (2.31)


## Page 108

Figure 2.11. Example of a polyhedron which is homeomorphic to a torus.
The reader might wonder if χ( X ) depends on the polyhedron K or not. The
following theorem due to Poincar´e and Alexander guarantees that it is, in fact,
independent of the polyhedron K .
Theorem 2.4. (Poincar´e–Alexander) The Euler characteristic χ( X) is indepen-
dent of the polyhedron K as long as K is homeomorphic to X.
Examples are in order. The Euler characteristic of a point is χ(·) = 1b y
deﬁnition. The Euler characteristic of a line is χ( ——) = 2−1 = 1, since a
line has two vertices and an edge. For a triangular disc, we ﬁnd χ( triangle) =
3−3+ 1= 1. An example which is a bit non-trivial is the Euler characteristic of
S1. The simplest polyhedron which is homeomorphic toS1 is made of three edges
of a triangle. Then χ( S1)= 3−3= 0. Similarly, the sphere S2 is homeomorphic
to the surface of a tetrahedron, hence χ( S2)= 4−6+ 4= 2. It is easily seen
that S2 is also homeomorphic to the surface of a cube. Using a cube to calculate
the Euler characteristic of S2,w eh a v eχ( S2)= 8−12+ 6= 2, in accord with
theorem 2.4. Historically this is the conclusion of Euler’s theorem:i f K is any
polyhedron homeomorphic to S2, with v vertices, e edges and f two-dimensional
faces, then v−e+ f = 2.
Example 2.15. Let us calculate the Euler characteristic of the torus T 2.
Figure 2.11( a) is an example of a polyhedron which is homeomorphic to T 2.
From this polyhedron, we ﬁnd χ( T 2) = 16−32+ 16 = 0. As we saw
in example 2.5(b), T 2 is equivalent to a rectangle whose edges are identiﬁed;
see ﬁgure 2.4. Taking care of this identiﬁcation, we ﬁnd an example of a
polyhedron made of rectangul ar faces as in ﬁgure 2.11( b), from which we also
have χ( T 2)= 0. This approach is quite useful when the ﬁgure cannot be realized
(embedded) in /CA
3 . For example, the Klein bottle (ﬁgure 2.5(a)) cannot be realized
in /CA
3 without intersecting itself. From the rectangle of ﬁgure 2.5( a), we ﬁnd
χ( Klein bottle)= 0. Similarly, we have χ( projective plane)= 1.


## Page 109

Figure 2.12. The connected sum. (a) S2♯S2= S2, (b) T 2♯T 2 = /Sigma12.
Exercise 2.19. (a) Show that χ( M¨obius strip)= 0.
(b) Show that χ( /Sigma12) =−2, where /Sigma12 is the torus with two handles (see
example 2.5). The reader may either construct a polyhedron homeomorphic to/Sigma12
or make use of the octagon in ﬁgure 2.6(a). We show later that χ( /Sigma1g )= 2−2g,
where /Sigma1g is the torus with g handles.
The connected sum X ♯Y of two surfaces X and Y is a surface obtained by
removing a small disc from each of X and Y and connecting the resulting holes
with a cylinder; see ﬁgure 2.12. Let X be an arbitrary surface. Then it is easy to
see that
S2♯X= X (2.32)
since S2 and the cylinder may be deformed so that they ﬁll in the hole on X;s e e
ﬁgure 2.12(a). If we take a connected sum of two tori we get (ﬁgure 2.12(b))
T 2♯T 2 = /Sigma12. (2.33)
Similarly, /Sigma1g may be given by the connected sum of g tori,
T 2♯T 2♯··· ♯T 2

 
 
g factors
= /Sigma1g . (2.34)
The connected sum may be used as a trickto calculate an Euler characteristic
of a complicated surface from those of known surfaces. Let us prove the following
theorem.
Theorem 2.5. Let X and Y be two surfaces. Then the Euler characteristic of the
connected sum X ♯Y is given by
χ( X ♯Y )= χ( X)+ χ( Y )−2.


## Page 110

Proof. Take polyhedra KX and KY homeomorphic to X and Y , respectively. We
assume, without loss of generality, that each of KY and KY has a triangle in it.
Remove the triangles from them and conn ect the resulting holes with a trigonal
cylinder. Then the number of vertices does not change while the number of edges
increases by three. Since we have removed two faces and added three faces,
the number of faces increases by −2+ 3 = 1. Thus, the change of the Euler
characteristic is 0−3+ 1=−2. /A3
From the previous theorem and the equality χ( T 2)= 0, we obtain χ( /Sigma12)=
0+ 0−2=−2a n dχ( /Sigma1g )= g× 0−2(g−1)= 2−2g, cf exercise 2.19(b).
The signiﬁcance of the Euler characteristic is that it is a topological invariant,
which is calculated relatively easily . We accept, without proof, the following
theorem.
Theorem 2.6. Let X and Y be two ﬁgures in /CA
3 .I f X is homeomorphic to Y ,t h e n
χ( X)= χ( Y ). In other words, if χ( X )̸= χ( Y ), X cannot be homeomorphic to
Y .
Example 2.16. (a) S1 is not homeomorphic to S2,s i n c eχ( S1) = 0 while
χ( S2)= 2.
(b) Two ﬁgures, which are not homeo morphic to each other, may have the
same Euler characteristic. A point ( ·) is not homeomorphic to a line (—–) but
χ(·) = χ( —–) = 1. This is a general consequence of the following fact: if a
ﬁgure X is of the same homotopy type as a ﬁgure Y , then χ( X)= χ( Y ).
The reader might have noticed that the Euler characteristic is different from
other topological invariants such as compactness or connectedness in character.
Compactness and connectedness are geometrical properties of a ﬁgure or a space
while the Euler ch aracteristic is an integer χ( X) ∈/CI . Note that /CI is an
algebraic object rather than a geometr ical one. Since the work of Euler, many
mathematicians have worked out the rel ation between geometry and algebra
and elaborated this idea, in the last century, to establish combinatorial topology
and algebraic topology. We may compute the Euler characteristic of a smooth
surface by the celebrated Gauss–Bonnet theorem, which relates the integral of
the Gauss curvature of the surface with th e Euler characteristic calculated from
the corresponding polyhedron. We will give the generalized form of the Gauss–
Bonnet theorem in chapter 12.
Problems
2.1 Show that the 4 g-gon in ﬁgure 2.13( a), with the boundary identiﬁed,
represents the torus with genus g of ﬁgure 2.13( b). The reader may use
equation (2.34).
2.2 Let X={ 1, 1/2,..., 1/n,... } be a subset of /CA . Show that X is not closed in
/CA . Show that Y ={ 1, 1/2,..., 1/n,..., 0} is closed in /CA , hence compact.


## Page 111

Figure 2.13. The polygon (a) whose edges are identiﬁed is the torus /Sigma1g with genus g.
2.3 Show that two ﬁgures in ﬁgure 2.109(b) are homeomorphic to each other. Find
how to unlink the right ﬁgure in /CA
4 .
2.4 Show that there are only ﬁve regular polyhedra: a tetrahedron, a hexahedron,
an octahedron, a dodecahedron and an icosahedron. [Hint: Use Euler’s theorem.]


## Page 112

3
HOMOLOGY GROUPS
Among the topological invariants the Eul er characteristic is a quantity readily
computable by the ‘polyhedronizati on’ of space. The homology groups are
reﬁnements, so to speak, of the Euler characteristic. Moreover, we can easily read
off the Euler characteristic from the homology groups. Let us look at ﬁgure 3.1.
In ﬁgure 3.1( a), the interior is included but not in ﬁgure 3.1( b). How do we
characterize this difference? An obvious observation is that the three edges of
ﬁgure 3.1(a) form a boundary of the interior while the edges of ﬁgure 3.1( b)d o
not (the interior is not ap a r to fﬁ g u r e3 . 1 (b)). Clearly the edges in both cases
form a closed path (loop), having no boundary. In other words, the existence of
a loop that is not a boundary of some area implies the existence of a hole within
the loop. This is our guiding princi ple in classifying spaces here: ﬁnd a region
without boundaries, which is not itself a boundary of some region. This principle
is mathematically elaborated into the theory of homology groups.
Our exposition follows Armstrong (1983), Croom (1978) and Nash and Sen
(1983). An introduction to group theory is found in Fraleigh (1976).
3.1 Abelian groups
The mathematical structures underlying homology groups are ﬁnitely generated
Abelian groups. Throughout this chapter, the group operation is denoted by +
since all the groups considered here are Abelian (commutative). The unit element
is denoted by 0.
3.1.1 Elementary group theory
Let G
1 and G2 be Abelian groups. A map f : G1 →G2 is said to be a
homomorphism if
f (x+ y)= f (x)+ f (y) (3.1)
for any x, y∈G1.1 f f is also a bijection, f is called an isomorphism.I ft h e r e
exists an isomorphism f : G1 →G2, G1 is said to be isomorphic to G2, denoted
by G1 ∼= G2. For example, a map f : /CI →/CI
2={ 0, 1} deﬁned by
f (2n)= 0 f (2n+ 1)= 1


## Page 113

Figure 3.1. (a) is a solid triangle while (b) is the edges of a triangle without an interior.
is a homomorphism. Indeed
f (2m+ 2n)= f (2(m+ n))= 0= 0+ 0= f (2m)+ f (2n)
f (2m+ 1+ 2n+ 1)= f (2(m+ n+ 1))= 0= 1+ 1
= f (2m+ 1)+ f (2n+ 1)
f (2m+ 1+ 2n)= f (2(m+ n)+ 1)= 1= 1+ 0
= f (2m+ 1)+ f (2n).
A subset H ⊂G is a subgroup if it is a group with respect to the group
operation of G. For example,
k/CI ≡{kn|n∈/CI } k∈/C6
is a subgroup of /CI , while /CI
2={ 0, 1} is not.
Let H be a subgroup of G.W es a yx, y∈G are equivalent if
x−y∈H (3.2)
and write x ∼y. Clearly ∼is an equivalence relation. The equivalence class to
which x belongs is denoted by [x].L e t G/H be the quotient space. The group
operation+ in G naturally induces the group operation+ in G/H by
[x]+[ y]=[ x+ y]. (3.3)
Note that+ on the LHS is an operation in G/H while+ on the RHS is that in G.
The operation in G/H should be independent of the choice of representatives. In
fact, if[x′]=[ x],[y′]=[ y],t h e nx−x′ = h, y−y′ = g for some h, g ∈H
and we ﬁnd that
x′+ y′ = x+ y−(h+ g)∈[x+ y]
Furthermore, G/H becomes a group with this operation, since H is always a
normal subgroup of G; see example 2.6. The unit element of G/H is[0]=[ h],


## Page 114

h∈H .I f H = G,0 −x∈G for any x∈G and G/G has just one element[0].
If H={ 0}, G/H is G itself since x−y= 0 if and only if x= y.
Example 3.1. Let us work out the quotient group /CI /2/CI . For even numbers
we have 2 n−2m = 2(n−m) ∈2/CI and[2m]=[ 2n]. For odd numbers
(2n+1)−(2m+1)= 2(n−m)∈2/CI and[2m+1]=[ 2n+1]. Even numbers and
odd numbers never belong to the same equivalence class since 2n−(2m+1)/∈2/CI .
Thus, it follows that
/CI /2/CI ={[ 0],[1]}. (3.4)
If we deﬁne an isomorphism ϕ : /CI /2/CI →/CI
2 by ϕ([0])= 0a n dϕ([1])= 1, we
ﬁnd /CI /2/CI
∼=
/CI
2. For general k∈/C6 ,w eh a v e
/CI /k/CI
∼
=
/CI
k. (3.5)
Lemma 3.1. Let f : G1 →G2 be a homomorphism. Then
(a) ker f ={ x|x∈G1, f (x)= 0} is a subgroup of G1,
(b) im f ={ x|x∈f (G1)⊂G2} is a subgroup of G2.
Proof.( a )L e tx, y∈ker f .T h e nx+ y∈ker f since f (x+ y)= f (x)+ f (y)=
0+0= 0. Note that 0∈ker f for f (0)= f (0)+ f (0).W ea l s oh a v e−x∈ker f
since f (0)= f (x−x)= f (x)+ f (−x)= 0.
(b) Let y1 = f (x1), y2 = f (x2)∈im f where x1, x2 ∈G1.S i n c ef is a
homomorphism we have y1+ y2 = f (x1)+ f (x2)= f (x1+ x2)∈im f . Clearly
0 ∈im f since f (0) = 0. If y = f (x),−y ∈im f since 0 = f (x−x) =
f (x)+ f (−x) implies f (−x)=−y. /A3
Theorem 3.1. (Fundamental theorem of homomorphism )L e t f : G1 →G2
be a homomorphism. Then
G1/ker f ∼= im f. (3.6)
Proof. Both sides are groups according to lemma 3.1. Deﬁne a map ϕ :
G1/ ker f →im f by ϕ([x]) = f (x). This map is well deﬁned since for
x′ ∈[x], there exists h ∈ker f such that x′ = x+ h and f (x′)= f (x+ h)=
f (x)+ f (h) = f (x). Now we show that ϕ is an isomorphism. First, ϕ is a
homomorphism,
ϕ([x]+[ y])= ϕ([x+ y])= f (x+ y)
= f (x)+ f (y)= ϕ([x])+ ϕ([y]).
Second, ϕ is one to one: if ϕ([x])= ϕ([y]),t h e nf (x)= f (y) or f (x)−f (y)=
f (x−y)= 0. This shows that x−y∈ker f and[x]=[ y]. Finally, ϕ is onto:
if y∈im f , there exists x∈G1 such that f (x)= y= ϕ([x]). /A3
Example 3.2. Let f : /CI →/CI
2 be deﬁned by f (2n)= 0a n d f (2n+1)= 1. Then
ker f = 2/CI and im f = /CI
2 are groups. Theorem 3.1 states that /CI /2/CI
∼=
/CI
2,i n
agreement with example 3.1.


## Page 115

3.1.2 Finitely generated Abelian groups and free Abelian groups
Let x be an element of a group G.F o rn∈/CI , nx denotes
x+···+ x
 
 
n
(if n > 0)
and
(−x)+···+ (−x)
 
 
|n|
(if n < 0).
If n= 0, we put 0x= 0. Take r elements x1,..., xr of G. The elements of G of
the form
n1x1+···+ nr xr (ni ∈/CI , 1≤i≤r ) (3.7)
form a subgroup of G, which we denote H . H is called a subgroup of G
generated by the generators x1,..., xr .I f G itself is generated by ﬁnite
elements x1,..., xr , G is said to be ﬁnitely generated.I f n1x1+···+ nr xr = 0
is satisﬁed only when n1 =···= nr = 0, x1,..., xr are said to be linearly
independent.
Deﬁnition 3.1. If G is ﬁnitely generated by r linearly independent elements, G is
called a free Abelian group of rank r.
Example 3.3. /CI is a free Abelian group of rank 1 ﬁnitely generated by 1 (or−1).
Let /CI ⊕/CI be the set of pairs{(i, j )|i, j∈/CI }. It is a free Abelian group of rank 2
ﬁnitely generated by generators (1, 0) and (0, 1). More generally
/CI ⊕/CI ⊕···⊕/CI

 
 
r
is a free Abelian group of rank r. The group /CI
2={ 0, 1} is ﬁnitely generated by
1b u ti snot free since 1 is not linearly independent (note 1+ 1= 0).
3.1.3 Cyclic groups
If G is generated by one element x, G ={ 0,±x,±2x,... }, G is called a cyclic
group.I f nx ̸= 0f o ra n yn ∈
/CI −{0},i ti sa n inﬁnite cyclic group while if
nx = 0f o rs o m en ∈/CI −{0},a ﬁnite cyclic group .L e t G be a cyclic group
generated by x and let f : /CI →G be a homomorphism deﬁned by f (n)= nx .
f maps /CI onto G but not necessarily one to one. From theorem 3.1, we have
G= im f ∼=
/CI / ker f .L e t N be the smallest positive integer such that Nx = 0.
Clearly
ker f ={ 0,±N,±2N,... }= N/CI (3.8)
and we have
G∼=
/CI /N /CI
∼=
/CI
N. (3.9)


## Page 116

If G is an inﬁnite cyclic group, then ker f ={ 0} and G∼=
/CI . Any inﬁnite cyclic
group is isomorphic to /CI while a ﬁnite cyclic group is isomorphic to some /CI
N.
We will need the following lemma and theorem in due course. We ﬁrst state
the lemma without proof.
Lemma 3.2. Let G be a free Abelian group of rankr and let H (̸=∅) be a subgroup
of G. We may always choose p generators x1,..., xp, out of r generators of G
so that k1x1,..., kp xp generate H . Thus, H ∼= k1
/CI ⊕... ⊕kp
/CI and H is of
rank p.
Theorem 3.2. (Fundamental theorem of ﬁnitely generated Abelian groups )
Let G be a ﬁnitely generated Abelian group (not necessarily free) with m
generators. Then G is isomorphic to the direct sum of cyclic groups,
G∼=
/CI ⊕···⊕/CI

 
 
r
⊕/CI
k1 ⊕···⊕/CI
kp (3.10)
where m= r+ p. The number r is called the rank of G.
Proof.L e tG be generated by m elements x1,..., xm and let
f : /CI ⊕···⊕/CI

 
 
m
→G
be a surjective homomorphism,
f (n1,..., nm )= n1x1+···+ nm xm .
Theorem 3.1 states that
/CI ⊕···⊕/CI

 
 
m
/ ker f ∼= G.
Since ker f is a subgroup of
/CI ⊕···⊕/CI

 
 
m
lemma 3.2 claims that if we choose the generators properly, we have
ker f ∼= k1
/CI ⊕···⊕kp
/CI .
We ﬁnally obtain
G∼=
/CI ⊕···⊕/CI

 
 
m
/ ker f ∼=
/CI ⊕···⊕/CI

 
 
m
/(k1
/CI ⊕···⊕kp
/CI )
∼=
/CI ⊕···⊕/CI

 
 
m−p
⊕/CI
k1 ⊕···⊕/CI
kp . /A3


## Page 117

Figure 3.2. 0-, 1-, 2- and 3-simplexes.
3.2 Simplexes and simplicial complexes
Let us recall how the Euler characteris tic of a surface is calculated. We ﬁrst
construct a polyhedron homeomorphic to the given surface, then count the
numbers of vertices, edges and faces. The Euler characteristic of the polyhedron,
and hence of the surface, is then give n by equation (2.31). We abstract this
procedure so that we may represent each part of a ﬁgure by somestandard object.
We take triangles and their analogues in other dimensions, called simplexes, as
the standard objects. By this standardization, it becomes possible to assign to
each ﬁgure Abelian group structures.
3.2.1 Simplexes
Simplexes are building blocks of a polyhedron. A 0-simplex ⟨p0⟩ is a point, or
a vertex, and a 1-simplex ⟨p0 p1⟩ is a line, or an edge. A 2-simplex ⟨p0 p1 p2⟩ is
deﬁned to be a triangle with its interior included and a 3-simplex ⟨p0 p1 p2 p3⟩ is
a solid tetrahedron (ﬁgure 3.2). It is common to denote a 0-simplex without the
bracket;⟨p0⟩ may be also written as p0. It is easy to continue this construction
to any r-simplex⟨p0 p1 ... pr⟩. Note that for an r-simplex to represent an r-
dimensional object, the vertices pi must be geometrically independent, that is, no
(r −1)-dimensional hyperplane contains all the r + 1 points. Let p0,..., pr
be points geometrically independent in /CA
m where m ≥r.T h e r-simplex
σ r =⟨ p0,..., pr⟩ is expressed as
σ r =
{
x∈/CA
m
⏐⏐
⏐
⏐x=
r∑
i=0
ci pi , ci ≥0,
r∑
i=0
ci = 1
}
. (3.11)
(c0,..., cr ) is called the barycentric coordinate of x.S i n c eσ r is a bounded and
closed subset of /CA
m , it is compact.
Let q be an integer such that 0 ≤q ≤r. If we choose q + 1 points
pi0 ,..., piq out of p0,..., pr ,t h e s eq + 1 points deﬁne a q-simplex σ q =
⟨pi0 ,..., piq⟩, which is called a q-face of σ r . We write σ q ≤σ r if σ q is a face of


## Page 118

Figure 3.3. A 0-face p0 and a 2-face⟨p1 p2 p3⟩ of a 3-simplex⟨p0 p1 p2 p3⟩.
σ r .I f σ q ̸= σ r ,w es a yσ q is a proper face of σ r , denoted as σ q <σ r . Figure 3.3
shows a 0-face p0 and a 2-face⟨p1 p2 p3⟩ of a 3-simplex⟨p0 p1 p2 p3⟩.T h e r e a r e
one 3-face, four 2-faces, six 1-faces and four 0-faces. The reader should verify
that the number of q-faces in an r-simplex is
( r+ 1
q+ 1
)
. A 0-simplex is deﬁned
to have no proper faces.
3.2.2 Simplicial complexes and polyhedra
Let K be a set of ﬁnite number of simplexes in /CA
m . If these simplexes are nicely
ﬁtted together, K is called a simplicial complex. By ‘nicely’ we mean:
(i) an arbitrary face of a simplex of K belongs to K ,t h a ti s ,i fσ ∈K and
σ′ ≤σ then σ′ ∈K ;a n d
(ii) if σ and σ′ are two simplexes of K , the intersection σ ∩σ′ is either empty
or a common face of σ and σ′,t h a ti s ,i fσ, σ ′ ∈K then either σ ∩σ′ =∅
or σ ∩σ′ ≤σ and σ ∩σ′ ≤σ′.
For example, ﬁgure 3.4( a) is a simplicial complex but ﬁgure 3.4( b) is not.
The dimension of a simplicial complex K is deﬁned to be the largest dimension
of simplexes in K .
Example 3.4. Let σ r be an r-simplex and K ={ σ′|σ′ ≤σ r} be the set of
faces of σ r . K is an r-dimensional simplicial complex. For example, take


## Page 119

Figure 3.4. (a) is a simplicial complex but (b) is not.
σ 3 =⟨ p0 p1 p2 p3⟩ (ﬁgure 3.3). Then
K ={ p0, p1, p2, p3,⟨p0 p1⟩,⟨p0 p2⟩,⟨p0 p3⟩,
⟨p1 p2⟩,⟨p1 p3⟩,⟨p2 p3⟩,⟨p0 p1 p2⟩,⟨p0 p1 p3⟩,
⟨p0 p2 p3⟩,⟨p1 p2 p3⟩,⟨p0 p1 p2 p3⟩}. (3.12)
A simplicial complex K is a set whose elements are simplexes. If each
simplex is regarded as a subset of/CA
m (m≥dim K ), the union of all the simplexes
becomes a subset of /CA
m . This subset is called the polyhedron|K| of a simplicial
complex K . The dimension of |K| as a subset of /CA
m is the same as that of K ;
dim|K|= dim K .
Let X be a topological space. If there exists a simplicial complex K and a
homeomorphism f :| K|→ X, X is said to be triangulable and the pair (K , f )
is called a triangulation of X. Given a topological space X, its triangulation is
far from unique. We will be concerned with triangulable spaces only.
Example 3.5. Figure 3.5(a) is a triangulation of a cylinderS1×[ 0, 1]. The reader
might think that somewhat simpler choices exist, ﬁgure 3.5(b), for example. This
is, however, not a triangulation since, forσ 2 =⟨ p0 p1 p2⟩ and σ′
2 =⟨ p2 p3 p0⟩,w e
ﬁnd σ 2∩σ′
2 =⟨ p0⟩∪⟨p2⟩, which is neither empty nor a simplex.
3.3 Homology groups of simplicial complexes
3.3.1 Oriented simplexes
We may assign orientations to an r-simplex for r ≥1. Instead of ⟨...⟩ for an
unoriented simplex, we will use ( ... ) to denote an oriented simplex. The symbol
σ r is used to denote both types of simplex. An oriented 1-simplex σ 1 = (p0 p1) is
a directed line segment traversed in the direction p0 →p1 (ﬁgure 3.6(a)). Now


## Page 120

Figure 3.5. (a) is a triangulation of a cylinder while (b) is not.
Figure 3.6. An oriented 1-simplex (a) and an oriented 2-simplex (b).
(p0 p1) should be distinguished from (p1 p0). We require that
(p0 p1)=−(p1 p0). (3.13)
Here ‘−’ in front of (p1 p0) should be understood in the sense of a ﬁnitely
generated Abelian group. In fact, (p1 p0) is regarded as the inverse of (p0 p1).
Going from p0 to p1 followed by going from p1 to p0 means going nowhere,
(p0 p1)+ (p1 p0)= 0, hence−(p1 p0)= (p0 p1).
Similarly, an oriented 2-simplex σ 2 = (p0 p1 p2) is a triangular region
p0 p1 p2 with a prescribed orientation along the edges (ﬁgure 3.6(b)). Observe that
the orientation given by p0 p1 p2 is the same as that given by p2 p0 p1 or p1 p2 p0
but opposite to p0 p2 p1, p2 p1 p0 or p1 p0 p2. We require that
(p0 p1 p2)= (p2 p0 p1)= (p1 p2 p0)
=−(p0 p2 p1)=−(p2 p1 p0)=−(p1 p0 p2).
Let P be a permutation of 0, 1, 2
P=
( 012
ij k
)
.
These relations are summarized as
(pi p j pk )= sgn(P)(p0 p1 p2)


## Page 121

where sgn(P)=+ 1 (−1) if P is an even (odd) permutation.
An oriented 3-simplex σ 3 = (p0 p1 p2 p3) is an ordered sequence of four
vertices of a tetrahedron. Let
P=
( 0123
ij k l
)
be a permutation. We deﬁne
(pi p j pk pl )= sgn(P)(p0 p1 p2 p3).
It is now easy to construct an oriented r-simplex for any r ≥1. The
formal deﬁnition goes as follows. Take r+ 1 geometrically independent points
p0, p1,..., pr in /CA
m .L e t{pi0 , pi1 ,..., pir} be a sequence of points obtained by
a permutation of the points p0,..., pr .W ed e ﬁ n e{p0,..., pr} and{pi0 ,..., pir}
to be equivalent if
P=
( 01 ... r
i0 i1 ... ir
)
is an even permutation. Clearly this is an equivalence relation, the equivalence
class of which is called an oriented r-simplex. There are two equivalence
classes, one consists of even permutations of p0,..., pr , the other of odd
permutations. The equivalence class (oriented r-simplex) which contains
{p0,..., pr} is denoted by σ r = (p0 p1 ... pr ), while the other is denoted by
−σ r =−(p0 p1 ... pr ).I no t h e rw o r d s ,
(pi0 pi1 ... pir )= sgn(P)(p0 p1 ... pr ). (3.14)
For r = 0, we formally deﬁne an oriented 0-simplex to be just a point
σ 0 = p0.
3.3.2 Chain group, cycle group and boundary group
Let K ={ σ α} be an n-dimensional simplicial complex. We regard the simplexes
σ α in K as oriented simplexes and denote them by the same symbols σ α as
remarked before.
Deﬁnition 3.2. The r-chain group Cr (K ) of a simplicial complex K is a free
Abelian group generated by the oriented r-simplexes of K .I f r > dim K , Cr (K )
is deﬁned to be 0. An element of Cr (K ) is called an r-chain.
Let there be Ir r-simplexes in K . We denote each of them by σ r,i (1≤i ≤
Ir ).T h e nc∈Cr (K ) is expressed as
c=
Ir∑
i=1
ci σ r,i ci ∈/CI . (3.15)


## Page 122

Figure 3.7. (a) An oriented 1-simpl ex with a ﬁc titious boundary p1.( b) A simplicial
complex without a boundary.
The integers ci are called the coefﬁcients of c. The group structure is given as
follows. The addition of two r-chains, c= ∑
i ci σ r,i and c′ = ∑
i c′
i σ r,i ,i s
c+ c′ =
∑
i
(ci + c′
i )σ r,i . (3.16)
The unit element is 0 = ∑
i 0· σ r,i , while the inverse element of c is−c =∑
i (−ci )σ r,i .[ Remark: An oppositely oriented r-simplex−σ r is identiﬁed with
(−1)σ r ∈Cr (K ).] Thus, Cr (K ) is a free Abelian group of rank Ir ,
Cr (K )∼=
/CI ⊕/CI ⊕···⊕/CI

 
 
Ir
. (3.17)
Before we deﬁne the cycle group and the boundary group, we need to
introduce the boundary operator. Let us denote the boundary of an r-simplex
σ r by ∂r σ r . ∂r should be understood as an operator acting on σ r to produce its
boundary. This point of view will be elaborated later. Let us look at the boundaries
of lower-dimensional simplexes. Since a 0-simplex has no boundary, we deﬁne
∂0 p0 = 0. (3.18)
For a 1-simplex (p0 p1),w ed e ﬁ n e
∂1(p0 p1)= p1−p0. (3.19)
The reader might wonder about the appearance of a minus sign in front of p0.
This is again related to the orientation. Th e following examples will clarify this
point. In ﬁgure 3.7( a), an oriented 1-simplex (p0 p2) is divided into two, (p0 p1)
and (p1 p2). We agree that the boundary of (p0 p2) is{p0}∪{p2} and so should
be that of (p0 p1)+ (p1 p2).I f ∂1(p0 p2) were deﬁned to be p0+ p2, we would
have ∂1(p0 p1)+ ∂1(p1 p2)= p0+ p1+ p1+ p2. This is not desirable since p1
is a ﬁctitious boundary. If, instead, we take ∂1(p0 p2)= p2 −p0, we will have
∂1(p0 p1)+ ∂1(p1 p2)= p1−p0+ p2−p1 = p2−p0 as expected. The next
example is the triangle of ﬁgure 3.7(b). It is the sum of three oriented 1-simplexes,


## Page 123

(p0 p1)+ (p1 p2)+ (p2 p0). We agree that it has no boundary. If we insisted on
the rule ∂1(p0 p1)= p0+ p1, we would have
∂1(p0 p1)+ ∂1(p1 p2)+ ∂1(p2 p0)= p0+ p1+ p1+ p2+ p2+ p0
which contradicts our intuition. If, on the other hand, we take ∂1(p0 p1) =
p1−p0,w eh a v e
∂1(p0 p1)+ ∂1(p1 p2)+ ∂1(p2 p0)= p1−p0+ p2−p1+ p0−p2 = 0
as expected. Hence, we put a plus sign if the ﬁrst vertex is omitted and a minus
sign if the second is omitted. We employ this fact to deﬁne the boundary of a
general r-simplex.
Let σ
r (p0 ... pr )( r > 0) be an oriented r-simplex. The boundary ∂r σ r of
σ r is an (r−1)-chain deﬁned by
∂r σ r ≡
r∑
i=0
(−1)i (p0 p1 ... ˆpi ... pr ) (3.20)
where the point pi underˆ is omitted. For example,
∂2(p0 p1 p2)= (p1 p2)−(p0 p2)+ (p0 p1)
∂3(p0 p1 p2 p3)= (p1 p2 p3)−(p0 p2 p3)+ (p0 p1 p3)−(p0 p1 p2).
We formally deﬁne ∂0σ 0 = 0f o rr= 0.
The operator ∂r acts linearly on an element c= ∑
i ci σ r,i of Cr (K ),
∂r c=
∑
i
ci ∂r σ r,i . (3.21)
The RHS of (3.21) is an element of Cr−1(K ). Accordingly, ∂r deﬁnes a map
∂r : Cr (K )→Cr−1(K ). (3.22)
∂r is called the boundary operator. It is easy to see that the boundary operator
is a homomorphism.
Let K be an n-dimensional simplicial complex. There exists a sequence of
free Abelian groups and homomorphisms,
0
i
−→Cn (K )
∂n
−→Cn−1(K )
∂n−1
−→···
∂2
−→C1(K )
∂1
−→C0(K )
∂0
−→0 (3.23)
where i : 0 ↪→Cn (K ) is an inclusion map (0 is regarded as the unit element
of Cn (K )). This sequence is called the chain complex associated with K and
is denoted by C(K ). It is interesting to study the image and kernel of the
homomorphisms ∂r .


## Page 124

Deﬁnition 3.3. If c∈Cr (K ) satisﬁes
∂r c= 0 (3.24)
c is called an r-cycle.T h e s e t o fr-cycles Zr (K ) is a subgroup of Cr (K ) and is
called the r-cycle group. Note that Zr (K ) = ker ∂r .[ Remark:I f r = 0, ∂0c
vanishes identically and Z0(K )= C0(K ), see (3.23).]
Deﬁnition 3.4. Let K be an n-dimensional simplicial complex and letc∈Cr (K ).
If there exists an element d∈Cr+1(K ) such that
c= ∂r+1d (3.25)
then c is called an r-boundary.T h e s e t o fr-boundaries Br (K ) is a subgroup
of Cr (K ) and is called the r-boundary group. Note that Br (K ) = im ∂r+1.
[Remark: Bn (K ) is deﬁned to be 0.]
From lemma 3.1, it follows that Zr (K ) and Br (K ) are subgroups of Cr (K ).
We now prove an important relation between Zr (K ) and Br (K ), which is crucial
in the deﬁnition of homology groups.
Lemma 3.3. The composite map ∂r ◦∂r+1 : Cr+1(K )→Cr−1(K ) is a zero map;
that is, ∂r (∂r+1c)= 0f o ra n yc∈Cr+1(K ).
Proof.S i n c e∂r is a linear operator on Cr (K ), it is sufﬁcient to prove the identity
∂r ◦∂r+1 = 0 for the generators of Cr+1(K ).I f r = 0, ∂0◦∂1 = 0s i n c e∂0 is a
zero operator. Let us assume r > 0. Take σ = (p0 ... pr pr+1)∈Cr+1(K ).W e
ﬁnd
∂r (∂r+1σ) = ∂r
r+1∑
i=0
(−1)i (p0 ... ˆpi ... pr+1)
=
r+1∑
i=0
(−1)i ∂r (p0 ... ˆpi ... pr+1)
=
r+1∑
i=0
(−1)i
( i−1∑
j=0
(−1)j (p0 ... ˆp j ... ˆpi ... pr+1)
+
r+1∑
j=i+1
(−1)j−1(p0 ... ˆpi ... ˆp j ... pr+1)
)
=
∑
j <i
(−1)i+ j (p0 ... ˆp j ... ˆpi ... pr+1)
−
∑
j >i
(−1)i+ j (p0 ... ˆpi ... ˆp j ... pr+1)= 0 (3.26)


## Page 125

which proves the lemma. /A3
Theorem 3.3. Let Zr (K ) and Br (K ) be the r-cycle group and the r-boundary
group of Cr (K ),t h e n
Br (K )⊂Zr (K )( ⊂Cr (K )). (3.27)
Proof. This is obvious from lemma 3.3. Any element c of Br (K ) is written as
c= ∂r+1d for some d ∈Cr+1(K ). Then we ﬁnd ∂r c= ∂r (∂r+1d)= 0, that is,
c∈Zr (K ). This implies Zr (K )⊃Br (K ). /A3
What are the geometrical pictures of r-cycles and r-boundaries? With our
deﬁnitions, ∂r picks up the boundary of anr-chain. If c is an r-cycle, ∂r c= 0 tells
us that c has no boundary. If c= ∂r+1d is an r-boundary, c is the boundary of d
whose dimension is higher than c by one. Our intuition tells us that a boundary
has no boundary, hence Zr (K )⊃Br (K ). Those elements of Zr (K ) that are not
boundaries play the central role in this chapter.
3.3.3 Homology groups
So far we have deﬁned three groups Cr (K ), Zr (K ) and Br (K ) associated with
a simplicial complex K . How are they related to topological properties of K or
to the topological space whose triangulation is K ? Is it possible for Cr (K ) to
express any property which is conserved under homeomorphism? We all know
that the edges of a triangle and those of asquare are homeomorphic to each other.
What about their chain groups? For example, the 1-chain group associated with a
triangle is
C1(K1)={ i (p0 p1)+ j (p1 p2)+ k(p2 p0)|i, j, k∈/CI }
∼=
/CI ⊕/CI ⊕/CI
while that associated with a square is
C1(K2)∼=
/CI ⊕/CI ⊕/CI ⊕/CI .
Clearly C1(K1) is not isomorphic to C1(K2), hence Cr (K ) cannot be a candidate
of a topological invariant. The same is true for Zr (K ) and Br (K ). It turns out
that the homology groups deﬁned in the following provide the desired topological
invariants.
Deﬁnition 3.5. Let K be an n-dimensional simplicial complex. The rth
homology group Hr (K ),0 ≤r≤n, associated with K is deﬁned by
Hr (K )≡Zr (K )/Br (K ). (3.28)
[Remarks: If necessary, we deﬁne Hr (K ) = 0f o r r > n or r < 0. If we
want to stress that the group structure is deﬁned with integer coefﬁcients, we


## Page 126

write Hr (K; /CI ). We may also deﬁne the homology groups with /CA -coefﬁcients,
Hr (K; /CA ) or those with /CI
2-coefﬁcients, Hr (K; /CI
2).]
Since Br (K ) is a subgroup of Zr (K ), Hr (K ) is well deﬁned. The group
Hr (K ) is the set of equivalence classes of r-cycles,
Hr (K )≡{[z]|z∈Zr (K )} (3.29)
where each equivalence class[z] is called a homology class.T w or-cycles z and
z′ are in the same equivalence class if and only ifz−z′ ∈Br (K ), in which case z
is said to be homologous to z′ and denoted by z∼z′ or[z]=[ z′]. Geometrically
z−z′ is a boundary of some space. By deﬁnition, any boundary b ∈Br (K ) is
homologous to 0 since b−0∈Br (K ). We accept the following theorem without
proof.
Theorem 3.4. Homology groups are topological invariants. Let X be
homeomorphic to Y and let (K , f ) and (L, g) be triangulations of X and Y
respectively. Then we have
Hr (K )∼= Hr (L) r= 0, 1, 2,.... (3.30)
In particular, if (K , f ) and (L, g) are two triangulations of X,t h e n
Hr (K )∼
= H
r (L) r= 0, 1, 2,.... (3.31)
Accordingly, it makes sense to talk of homology groups of a topological
space X which is not necessarily a polyhedron but which is triangulable. For an
arbitrary triangulation (K , f ), Hr (X ) is deﬁned to be
Hr (X )≡Hr (K ) r= 0, 1, 2,.... (3.32)
Theorem 3.4 tells us that this is independent of the choice of the triangulation
(K , f ).
Example 3.6. Let K ={ p0}. The 0-chain is C0(K )={ ip 0|i ∈/CI }∼=
/CI . Clearly
Z0(K )= C0(K ) and B0(K )={ 0} (∂0 p0 = 0a n d p0 cannot be a boundary of
anything). Thus
H0(K )≡Z0(K )/B0(K )= C0(K )∼
=
/CI . (3.33)
Exercise 3.1. Let K ={ p0, p1} be a simplicial complex consisting of two 0-
simplexes. Show that
Hr (K )=
{
/CI ⊕/CI (r= 0)
{0} (r̸= 0). (3.34)


## Page 127

Example 3.7. Let K ={ p0, p1,( p0 p1)}.W eh a v e
C0(K )={ ip 0+ jp 1|i, j∈/CI }
C1(K )={ k(p0 p1)|k∈/CI }.
Since (p0 p1) is not a boundary of any simplex in K , B1(K )={ 0} and
H1(K )= Z1(K )/B1(K )= Z1(K ).
If z= m(p0 p1)∈Z1(K ), it satisﬁes
∂1z= m∂1(p0 p1)= m{p1−p0}= mp1−mp0 = 0.
Thus, m has to vanish and Z1(K )= 0, hence
H1(K )= 0. (3.35)
As for H0(K ),w eh a v eZ0(K )= C0(K )={ ip 0+ jp 1} and
B0(K )= im ∂1 ={ ∂1i (p0 p1)|i∈/CI }={ i (p0−p1)|i∈/CI }.
Deﬁne a surjective (onto) homomorphism f : Z0(K )→/CI by
f (ip 0+ jp 1)= i+ j.
Then we ﬁnd
ker f = f−1(0)= B0(K ).
Theorem 3.1 states that Z0(K )/ ker f ∼= im f = /CI ,o r
H0(K )= Z0(K )/B0(K )∼
=
/CI . (3.36)
Example 3.8. Let K ={ p0, p1, p2,( p0 p1), (p1 p2), (p2 p0)}, see ﬁgure 3.7( b).
This is a triangulation of S1. Since there are no 2-simplexes in K ,w eh a v e
B1(K ) = 0a n d H1(K ) = Z1(K )/B1(K ) = Z1(K ).L e t z = i (p0 p1)+
j (p1 p2)+ k(p2 p0)∈Z1(K ) where i, j, k∈/CI . We require that
∂1z= i (p1−p0)+ j (p2−p1)+ k(p0−p2)
= (k−i )p0+ (i−j )p1+ ( j−k)p2 = 0.
This is satisﬁed only when i= j= k. Thus, we ﬁnd that
Z1(K )={ i{(p0 p1)+ (p1 p2)+ (p2 p0)}|i∈/CI }.
This shows that Z1(K ) is isomorphic to /CI and
H1(K )= Z1(K )∼=
/CI . (3.37)


## Page 128

Let us compute H0(K ).W eh a v eZ0(K )= C0(K ) and
B0(K )={ ∂1[l(p0 p1)+ m(p1 p2)+ n(p2 p0)]|l, m, n∈/CI }
={ (n−l)p0+ (l−m)p1+ (m−n)p2| l, m, n∈/CI }.
Deﬁne a surjective homomorphism f : Z0(K )→/CI by
f (ip 0+ jp 1+ kp2)= i+ j+ k.
We verify that
ker f = f−1(0)= B0(K ).
From theorem 3.1 we ﬁnd Z0(K )/ ker f ∼= im f = /CI ,o r
H0(K )= Z0(K )/B0(K )∼
=
/CI . (3.38)
K is a triangulation of a circle S1, and (3.37) and (3.38) are the homology
groups of S1.
Exercise 3.2. Let K ={ p0, p1, p2, p3,( p0 p1), (p1 p2), (p2 p3), (p3 p0)} be a
simplicial complex whose polyhedron is a square. Verify that the homology
groups are the same as those of example 3.8 above.
Example 3.9. Let K ={ p0, p1, p2,( p0 p1), (p1 p2), (p2 p0), (p0 p1 p2)};s e e
ﬁgure 3.6 (b). Since the structure of 0-simplexes and 1-simplexes is the same
as that of example 3.8, we have
H0(K )∼=
/CI . (3.39)
Let us compute H1(K )= Z1(K )/B1(K ). From the previous example, we
have
Z1(K )={ i{(p0 p1)+ (p1 p2)+ (p2 p0)}|i∈/CI }.
Let c= m(p0 p1 p2)∈C2(K ).I f b= ∂2c∈B1(K ),w eh a v e
b= m{(p1 p2)−(p0 p2)+ (p0 p1)}
= m{(p0 p1)+ (p1 p2)+ (p2 p0)} m∈/CI .
This shows that Z1(K )∼= B1(K ), hence
H1(K )= Z1(K )/B1(K )∼
={0}. (3.40)
Since there are no 3-simplexes in K ,w eh a v e B
2(K ) ={ 0}.T h e n
H2(K ) = Z2(K )/B2(K ) = Z2(K ).L e t z = m(p0 p1 p2) ∈Z2(K ).S i n c e
∂2z= m{(p1 p2)−(p0 p2)+ (p0 p1)}= 0, m must vanish. Hence, Z1(K )={ 0}
and we have
H2(K )∼
={0}. (3.41)


## Page 129

Exercise 3.3. Let
K ={ p0, p1, p2, p3,( p0 p1), (p0 p2), (p0 p3), (p1 p2), (p1 p3), (p2 p3),
(p0 p1 p2), (p0 p1 p3), (p0 p2 p3), (p1 p2 p3)}
be a simplicial complex whose polyhedron is the surface of a tetrahedron. Verify
that
H0(K )∼=
/CI H1(K )∼
={0} H
2(K )∼
=
/CI . (3.42)
K is a triangulation of the sphere S2 and (3.42) gives the homology groups of S2.
3.3.4 Computation of H0(K)
Examples 3.6–3.9 and exercises 3.2, 3.3 share the same zeroth homology group,
H0(K ) ∼
=
/CI . What is common to these simplicial complexes? We have the
following answer.
Theorem 3.5. Let K be a connected simplicial complex. Then
H0(K )∼=
/CI . (3.43)
Proof.S i n c eK is connected, for any pair of 0-simplexes pi and p j , there exists
a sequence of 1-simplexes (pi pk ), (pk pl ) ,...,( pm p j ) such that ∂1((pi pk )+
(pk pl )+···+ (pm p j )) = p j −pi . Then it follows that pi is homologous
to p j , namely[ pi]=[ p j]. Thus, any 0-simplex in K is homologous to p1 say.
Suppose
z=
I0∑
i=1
ni pi ∈Z0(K )
where I0 is the number of 0-simplexes in K . Then the homology class [z] is
generated by a single point,
[z]=
[ ∑
i
ni pi
]
=
∑
i
ni[pi]=
∑
i
ni[p1].
It is clear that[z]= 0, namely z∈B0(K ),i f ∑ ni = 0.
Let σ j = (p j,1 p j,2)( 1≤j≤I1) be 1-simplexes in K , I1 being the number
of 1-simplexes in K ,t h e n
B0(K )= im ∂1
={ ∂1(n1σ 1+···+ nI1 σ I1 )|n1,..., nI1 ∈/CI }
={ n1(p1,2−p1,1)+···+ nI1 (pI1 ,2−pI1,1)|n1,..., nI1 ∈/CI }.
Note that n j (1≤j ≤I1) always appears as a pair+n j and−n j in an element
of B0(K ). Thus, if
z=
∑
j
n j p j ∈B0(K ) then
∑
j
n j = 0.


## Page 130

Figure 3.8. A triangulation of the M¨obius strip.
Now we have proved for a connected complex K that z = ∑ ni pi ∈B0(K ) if
and only if ∑ ni = 0.
Deﬁne a surjective homomorphism f : Z0(K )→/CI by
f (n1 p1+···+ nI0 pI0 )=
I0∑
i=1
ni .
We then have ker f = f−1(0) = B0(K ). It follows from theorem 3.1 that
H0(K )= Z0(K )/B0(K )= Z0(K )/ ker f ∼= im f = /CI . /A3
3.3.5 More homology computations
Example 3.10. This and the next example deal with homology groups of non-
orientable spaces. Figure 3.8 is a triangulation of the M¨ obius strip. Clearly
B2(K )= 0. Let us take a cycle z∈Z2(K ),
z= i (p0 p1 p2)+ j (p2 p1 p4)+ k(p2 p4 p3)
+ l(p3 p4 p5)+ m(p3 p5 p1)+ n(p1 p5 p0).
z satisﬁes
∂2z= i{(p1 p2)−(p0 p2)+ (p0 p1)}
+ j{(p1 p4)−(p2 p4)+ (p2 p1)}
+ k{(p4 p3)−(p2 p3)+ (p2 p4)}
+ l{(p4 p5)−(p3 p5)+ (p3 p4)}
+ m{(p5 p1)−(p3 p1)+ (p3 p5)}
+ n{(p5 p0)−(p1 p0)+ (p1 p5)}= 0.
Since each of (p0 p2), (p1 p4), (p2 p3), (p4 p5), (p3 p1) and (p5 p0) appears once
and only once in ∂2z, all the coefﬁcients must vanish, i= j= k= l= m= n=


## Page 131

0. Thus, Z2(K )={ 0} and
H2(K )= Z2(K )/B2(K )∼={0}. (3.44)
To ﬁnd H1(K ), we use our intuition rather than doing tedious computations.
Let us ﬁnd the loops which make complete circuits. One such loop is
z= (p0 p1)+ (p1 p4)+ (p4 p5)+ (p5 p0).
Then all the other complete cir cuits are homologous to multiples of z.F o r
example, let us take
z′ = (p1 p2)+ (p2 p3)+ (p3 p5)+ (p5 p1).
We ﬁnd that z∼z′ since
z−z′ = ∂2{(p2 p1 p4)+ (p2 p4 p3)+ (p3 p4 p5)+ (p1 p5 p0)}.
If, however, we take
z′′ = (p1 p4)+ (p4 p5)+ (p5 p0)+ (p0 p2)+ (p2 p3)+ (p3 p1)
we ﬁnd that z′′ ∼2z since
2z−z′′ = 2(p0 p1)+ (p1 p4)+ (p4 p5)+ (p5 p0)−(p0 p2)
−(p2 p3)−(p3 p1)
= ∂2{(p0 p1 p2)+ (p1 p4 p2)+ (p2 p4 p3)+ (p3 p4 p5)
+ (p3 p5 p1)+ (p0 p1 p5)}.
We easily verify that all the closed circuits are homologous to nz, n∈/CI . H1(K )
is generated by just one element[z],
H1(K )={ i[z]|i∈/CI }∼
=
/CI . (3.45)
Since K is connected, it follows from theorem 3.5 that H0(K )={ i[pa]|i∈
/CI }∼
=
/CI , pa being any 0-simplex of K .
Example 3.11. The projective plane /CA P2 has been deﬁned in example 2.5(c) as
the sphere S2 whose antipodal points are identiﬁed. As a coset space, we may
take the hemisphere (or the disc D2) whose opposite points on the boundary S1
are identiﬁed, see ﬁgure 2.5( b). Figure 3.9 is a triangulation of the projective
plane. Clearly B2(K )={ 0}. Take a cycle z∈Z2(K ),
z= m1(p0 p1 p2)+ m2(p0 p4 p1)+ m3(p0 p5 p4)
+ m4(p0 p3 p5)+ m5(p0 p2 p3)+ m6(p2 p4 p3)
+ m7(p2 p5 p4)+ m8(p2 p1 p5)+ m9(p1 p3 p5)+ m10(p1 p4 p3).


## Page 132

Figure 3.9. A triangulation of the projective plane.
The boundary of z is
∂2z= m1{(p1 p2)−(p0 p2)+ (p0 p1)}
+ m2{(p4 p1)−(p0 p1)+ (p0 p4)}
+ m3{(p5 p4)−(p0 p4)+ (p0 p5)}
+ m4{(p3 p5)−(p0 p5)+ (p0 p3)}
+ m5{(p2 p3)−(p0 p3)+ (p0 p2)}
+ m6{(p4 p3)−(p2 p3)+ (p2 p4)}
+ m7{(p5 p4)−(p2 p4)+ (p2 p5)}
+ m8{(p1 p5)−(p2 p5)+ (p2 p1)}
+ m9{(p3 p5)−(p1 p5)+ (p1 p3)}
+ m10{(p4 p3)−(p1 p3)+ (p1 p4)}= 0.
Let us look at the coefﬁcient of each 1-simplex. For example, we have (m1 −
m2)(p0 p1), hence m1−m2 = 0. Similarly,
−m1+ m5 = 0, m4−m5 = 0, m2−m3 = 0, m1−m8 = 0,
m9−m10 = 0,−m2+ m10 = 0, m5−m6 = 0, m6−m7 = 0,
m6+ m10 = 0.


## Page 133

These ten conditions are satisﬁed if and only if mi = 0, 1≤i≤10. This means
that the cycle group Z2(K ) is trivial and we have
H2(K )= Z2(K )/B2(K )∼={0}. (3.46)
Before we calculate H1(K ), we examine H2(K ) from a slightly different
viewpoint. Let us add all the 2-simplexes in K with the same coefﬁcient,
z≡
10∑
i=1
mσ 2,i m∈/CI .
Observe that each 1-simplex of K is a common face of exactly two 2-simplexes.
As a consequence, the boundary of z is
∂2z= 2m(p3 p5)+ 2m(p5 p4)+ 2m(p4 p3). (3.47)
Thus, if z ∈Z2(K ), m must vanish and we ﬁnd Z2(K ) ={ 0} as before. This
observation remarkably simpliﬁes the computation of H1(K ). Note that any 1-
cycle is homologous to a multiple of
z= (p3 p5)+ (p5 p4)+ (p4 p3)
cf example 3.10. Furthermore, equation (3.47) shows that an even multiple ofz is
a boundary of a 2-chain. Thus, z is a cycle and z+ z is homologous to 0. Hence,
we ﬁnd that
H1(K )={[ z]|[z]+[ z]∼[0]}∼
=
/CI
2. (3.48)
This example shows that a homology group is not necessarily free Abelian but
may have the full structure of a ﬁnitely generated Abelian group. Since K is
connected, we have H0(K )∼=
/CI .
It is interesting to compare example 3.11 with the following examples.
In these examples, we shall use the intuition developed in this section on
boundaries and cycles to obtain results rather than giving straightforward but
tedious computations.
Example 3.12. Let us consider the torusT 2. A formal derivation of the homology
groups of T 2 is left as an exercise to the reader: see Fraleigh (1976), for example.
This is an appropriate place to recall t he intuitive meaning of the homology
groups. The rth homology group is generated by those boundaryless r-chains
that are not, by themselves, boundaries of some (r + 1)-chains. For example,
the surface of the torus has no boundary but it is not a boundary of some 3-
chain. Thus, H2(T 2) is freely generated by one generator, the surface itself,
H2(T 2)∼=
/CI . Let us look at H1(T 2) next. Clearly the loops a and b in ﬁgure 3.10
have no boundaries but are not boundaries of some 2-chains. Take another loop
a′. a′ is homologous to a since a′ −a bounds the shaded area of ﬁgure 3.10.


## Page 134

Figure 3.10. a′ is homologous to a but b is not. a and b generate H1(T 2).
Figure 3.11. ai and bi (1≤i≤g) generate H1(/Sigma1g ).
Hence, H1(T 2) is freely generated by a and b and H1(T 2)∼=
/CI ⊕/CI .S i n c eT 2 is
connected, we have H0(T 2)∼
=
/CI .
Now it is easy to extend our analysis to the torus/Sigma1g of genus g.S i n c e/Sigma1g has
no boundary and there are no 3-simplexes, the surface /Sigma1g itself freely generates
H2(T 2) ∼
=
/CI . The ﬁrst homology group H1(/Sigma1g ) is generated by those loops
which are not boundaries of some area. Figure 3.11 shows the standard choice for
the generators. We ﬁnd
H1(/Sigma1g )={ i1[a1]+ j1[b1]+···+ ig[ag]+ jg[bg]}
∼=
/CI ⊕/CI ⊕···⊕/CI

 
 
2g
. (3.49)
Since /Sigma1g is connected, H0(/Sigma1g )∼=
/CI . Observe that ai (bi ) is homologous to the
edge ai (bi ) of ﬁgure 2.12. The 2g curves{ai , bi} are called the canonical system
of curves on /Sigma1g.
Example 3.13. Figure 3.12 is a triangulation of the Klein bottle. Computations of
the homology groups are much the same as those of the projective plane. Since
B2(K )= 0, we have H2(K )= Z2(K ).L e t z ∈Z2(K ).I f z is a combination
of all the 2-simplexes of K with the same coefﬁcient, z = ∑ mσ 2,i , the inner
1-simplexes cancel out to leave only the outer 1-simplexes
∂2z=−2ma


## Page 135

Figure 3.12. A triangulation of the Klein bottle.
where a= (p0 p1)+ (p1 p2)+ (p2 p0).F o r∂2z to be 0, the integer m must vanish
and we have
H2(K )= Z2(K )∼={0}. (3.50)
To compute H1(K ) we ﬁrst note, from our experience with the torus, that
every 1-cycle is homologous to ia+ jb for some i, j∈/CI . For a 2-chain to have
a boundary consisting of a and b only, all the 2-simplexes in K must be added
with the same coefﬁcient. As a result, for such a 2-chain z= ∑ mσ 2,i ,w eh a v e
∂ z= 2ma. This shows that 2ma∼0. Thus, H1(K ) is generated by two cycles a
and b such that a+ a= 0, namely
H1(K )={ i[a]+ j[b]|i, j∈/CI }∼
=
/CI
2⊕/CI . (3.51)
We obtain H0(K )∼
=
/CI since K is connected.


## Page 136

3.4 General properties of homology groups
3.4.1 Connectedness and homology groups
Let K ={ p0} and L ={ p0, p1}. From example 3.6 and exercise 3.1, we have
H0(K )= /CI and H0(L)= /CI ⊕/CI . More generally, we have the following theorem.
Theorem 3.6. Let K be a disjoint union of N connected components, K =
K1∪K2∪···∪KN where Ki ∩K j =∅.T h e n
Hr (K )= Hr (K1)⊕Hr (K2)⊕···⊕Hr (KN ). (3.52)
Proof. We ﬁrst note that an r-chain group is consistently separated into a direct
sum of Nr -chain subgroups. Let
Cr (K )=
{ Ir∑
i=1
ci σ r,i
⏐⏐⏐⏐ci ∈/CI
}
where Ir is the number of linearly independent r-simplexes in K .I t i s a l w a y s
possible to rearrange σ i so that those r-simplexes in K1 come ﬁrst, those in K2
next and so on. Then Cr (K ) is separated into a direct sum of subgroups,
Cr (K )= Cr (K1)⊕Cr (K2)⊕···⊕Cr (KN ).
This separation is also carried out for Zr (K ) and Br (K ) as
Zr (K )= Zr (K1)⊕Zr (K2)⊕···⊕Zr (KN )
Br (K )= Br (K1)⊕Br (K2)⊕···⊕Br (KN ).
We now deﬁne the homology groups of each component Ki by
Hr (Ki )= Zr (Ki )/Br (Ki ).
This is well deﬁned since Zr (Ki )⊃Br (Ki ). Finally, we have
Hr (K )= Zr (K )/Br (K )
= Zr (K1)⊕···⊕Zr (KN )/Br (K1)⊕···⊕Br (KN )
={ Zr (K1)/Br (K1)}⊕···⊕{Zr (KN )/Br (KN )}
= Hr (K1)⊕···⊕Hr (KN ). /A3
Corollary 3.1. (a) Let K be a disjoint union of N connected components,
K1,..., KN . Then it follows that
H0(K )∼=
/CI ⊕···⊕/CI

 
 
N factors
. (3.53)
(b) If H0(K )∼
=
/CI , K is connected. [Together with theorem 3.5 we conclude
that H0(K )∼
=
/CI if and only if K is connected.]


## Page 137

3.4.2 Structure of homology groups
Zr (K ) and Br (K ) are free Abelian groups since they are subgroups of a free
Abelian group Cr (K ). It does not mean that Hr (K )= Zr (K )/Br (K ) is also free
Abelian. In fact, according to theorem 3.2, the most general form of Hr (K ) is
Hr (K )∼=
/CI ⊕···⊕/CI

 
 
f
⊕/CI
k1 ⊕···⊕/CI
kp . (3.54)
It is clear from our experience that the number of generators of Hr (K ) counts
the number of (r+ 1)-dimensional holes in|K|.T h e ﬁ r s tf factors form a free
Abelian group of rank f and the next p factors are called the torsion subgroup
of Hr (K ). For example, the projective plane has H1(K ) ∼
=
/CI
2 and the Klein
bottle has H1(K ) ∼
=
/CI ⊕/CI
2. In a sense, the torsion subgroup detects the
‘twisting’ in the polyhedron|K|. We now clarify why the homology groups with
/CI -coefﬁcients are preferable to those with /CI
2-o r /CA -coefﬁcients. Since /CI
2 has no
non-trivial subgroups, the torsion subgroup can never be recognized. Similarly,
if /CA -coefﬁcients are employed, we cannot see the torsion subgroup either, since
/CA /m/CA
∼= {0} for any m ∈/CI −{0}.[ F o r a n ya, b ∈/CA , there exists a number
c∈/CA such that a−b= mc.] If Hr (K; /CI ) is given by (3.54), Hr (K; /CA ) is
Hr (K; /CA )∼=
/CA ⊕/CA ⊕···⊕/CA

 
 
f
. (3.55)
3.4.3 Betti numbers and the Euler–Poincar ´et h e o r e m
Deﬁnition 3.6. Let K be a simplicial complex. The rth Betti number br (K ) is
deﬁned by
br (K )≡dim Hr (K; /CA ). (3.56)
In other words, br (K ) is the rank of the free Abelian part of Hr (K; /CI ).
For example, the Betti numbers of the torus T 2 are (see example 3.12)
b0(K )= 1, b1(K )= 2, b2(K )= 1
and those of the sphere S2 are (exercise 3.3)
b0(K )= 1, b1(K )= 0, b2(K )= 1.
The following theorem relates the Euler characteristic to the Betti numbers.
Theorem 3.7. (The Euler–Poincar ´et h e o r e m)L e t K be an n-dimensional
simplicial complex and let Ir be the number of r-simplexes in K .T h e n
χ( K )≡
n∑
r=0
(−1)r Ir =
n∑
r=0
(−1)r br (K ). (3.57)
[Remark: The ﬁrst equality deﬁnes the Euler characteristic of a general
polyhedron|K|. Note that this is the generalization of the Euler characteristic
deﬁned for surfaces in section 2.4.]


## Page 138

Proof. Consider the boundary homomorphism,
∂r : Cr (K; /CA )→Cr−1(K; /CA )
where C−1(K; /CA ) is deﬁned to be{0}. Since both Cr−1(K; /CA ) and Cr (K; /CA ) are
vector spaces, theorem 2.1 can be applied to yield
Ir = dim Cr (K; /CA )= dim(ker ∂r )+ dim(im ∂r )
= dim Zr (K; /CA )+ dim Br−1(K; /CA )
where B−1(K ) is deﬁned to be trivial. We also have
br (K )= dim Hr (K; /CA )= dim(Zr (K; /CA )/Br (K; /CA ))
= dim Zr (K; /CA )−dim Br (K; /CA ).
From these relations, we obtain
χ( K )=
n∑
r=0
(−1)r Ir =
n∑
r=0
(−1)r (dim Zr (K; /CA )+ dim Br−1(K; /CA ))
=
n∑
r=0
{(−1)r dim Zr (K; /CA )−(−1)r dim Br (K; /CA )}
=
n∑
r=0
(−1)r br (K ). /A3
Since the Betti numbers are topological invariants, χ( K ) is also conserved
under a homeomorphism. In particular, if f :| K|→ X and g :| K′|→ X are
two triangulations of X,w eh a v eχ( K )= χ( K′). Thus, it makes sense to deﬁne
the Euler characteristic of X by χ( K ) for any triangulation (K , f ) of X.
Figure 3.13. A hole in S2, whose edges are identiﬁed as shown. We may considerS2 with
q such holes.


## Page 139

Problems
3.1 The most general orientable two-dimensional surface is a 2-sphere with h
handles and q holes. Compute the homology groups and the Euler characteristic
of this surface.
3.2 Consider a sphere with a hole and identify the edges of the hole as shown in
ﬁgure 3.13. The surface we obtained was simply the projective plane /CA P2 .M o r e
generally, consider a sphere with q such ‘crosscaps’ and compute the homology
groups and the Euler characteristic of this surface.


## Page 140

4
HOMOTOPY GROUPS
The idea of homology groups in the previous chapter was to assign a group
structure to cycles that are not boundaries. In homotopy groups, however, we
are interested in continuous deformation of maps one to another. Let X and Y
be topological spaces and let /BY be the set of continuous maps, from X to Y .W e
introduce an equivalence relation, called ‘homotopic to’, in/BY by which two maps
f, g ∈/BY are identiﬁed if the image f (X) is continuously deformed to g(X) in
Y . We choose X to be some standard topological spaces whose structures are
well known. For example, we may take then-sphere Sn as the standard space and
study all the maps from Sn to Y to see how these maps are classiﬁed according to
homotopic equivalence. This is the basic idea of homotopy groups.
We will restrict ourselves to an elementary study of homotopy groups, which
is sufﬁcient for the later discussion. Nash and Sen (1983) and Croom (1978)
complement this chapter.
4.1 Fundamental groups
4.1.1 Basic ideas
Let us look at ﬁgure 4.1. One disc has a hole in it, the other does not. What
characterizes the difference between these two discs? We note that any loop in
ﬁgure 4.1(b) can be continuously shrunk to a point. In contrast, the loop α in
ﬁgure 4.1(a) cannot be shrunk to a point due to the existence of a hole in it. Some
loops in ﬁgure 4.1(a) may be shrunk to a point while others cannot. We say a loop
α is homotopic to β if α can be obtained from β by a continuous deformation. For
example, any loop in Y is homotopic to a point. It turns out that ‘homotopic to’
is an equivalence relation, the equivalence class of which is called the homotopy
class. In ﬁgure 4.1, there is only one homotopy class associated with Y .I n X,
each homotopy class is characterized by n∈
/CI , n being the number of times the
loop encircles the hole; n < 0 if it winds clockwise, n > 0 if counterclockwise,
n= 0 if the loop does not wind round the hole. Moreover, /CI is an additive group
and the group operation (addition) has a geometrical meaning;n+ m corresponds
to going round the hole ﬁrst n times and then m times. The set of homotopy
classes is endowed with a group structure called the fundamental group.


## Page 141

Figure 4.1. A disc with a hole (a) and without a hole (b). The hole in (a) prevents the loop
α from shrinking to a point.
4.1.2 Paths and loops
Deﬁnition 4.1. Let X be a topological space and let I =[ 0, 1]. A continuous
map α : I →X is called a path with an initial point x0 and an end point x1 if
α( 0)= x0 and α( 1)= x1.I f α( 0)= α( 1)= x0, the path is called a loop with
base point x0 (or a loop at x0).
For x ∈X,a constant path cx : I →X is deﬁned by cx (s)= x, s∈I.A
constant path is also a constant loop since cx (0)= cx (1)= x. The set of paths
or loops in a topological space X may be endowed with an algebraic structure as
follows.
Deﬁnition 4.2. Let α, β : I →X be paths such that α( 1)= β( 0). The product of
α and β , denoted by α ∗β , is a path in X deﬁned by
α ∗β( s)=
{
α( 2s) 0≤s≤1
2
β( 2s−1) 1
2 ≤s≤1 (4.1)
see ﬁgure 4.2. Since α( 1) = β( 0), α ∗β is a continuous map from I to X.
[Geometrically, α ∗β corresponds to traversing the image α( I ), in the ﬁrst half,
then followed by β( I ) in the remaining half. Note that the velocity is doubled.]
Deﬁnition 4.3. Let α : I →X be a path from x0 to x1.T h ei n v e r s ep a t hα−1 of α
is deﬁned by
α−1(s)≡α( 1−s) s∈I. (4.2)
[The inverse path α−1 corresponds to traversing the image of α in the opposite
direction from x1 to x0.]
Since a loop is a special path for which the initial point and end point agree,
the product of loops and the inverse of a loop are deﬁned in exactly the same way.


## Page 142

Figure 4.2. The product α ∗β of paths α and β with a common end point.
It seems that a constant map cx is the unit element. However, it is not: α ∗α−1
is not equal to cx ! We need a concept of homotopy to deﬁne a group operation in
the space of loops.
4.1.3 Homotopy
The algebraic structure of loops introduced earlier is not so useful as it is. For
example, the constant path is not exactly the unit element. We want to classify the
paths and loops according to a neat equivale nce relation so that the equivalence
classes admit a group structure. It turns out that if we identify paths or loops that
can be deformed continuously one into another, the equivalence classes form a
group. Since we are primarily interested in loops, most deﬁnitions and theorems
are given for loops. However, it should be kept in mind that many statements are
also applied to paths with proper modiﬁcations.
Deﬁnition 4.4. Let α, β : I →X be loops at x
0. They are said to be homotopic,
written as α ∼β , if there exists a continuous map F: I× I →X such that
F(s, 0)= α( s), F(s, 1)= β( s) ∀s∈I
F(0, t)= F(1, t)= x0 ∀t∈I.
(4.3)
The connecting map F is called a homotopy between α and β .
It is helpful to represent a homotopy as ﬁgure 4.3( a). The vertical edges of
the square I× I are mapped to x0. The lower edge is α( s) while the upper edge
is β( s). In the space X, the image is continuously deformed as in ﬁgure 4.3(b).
Proposition 4.1. The relation α ∼β is an equivalence relation.


## Page 143

Figure 4.3. (a) The square represents a homotopy F interpolating the loops α and β .( b)
The image of α is continuously deformed to the image of β in real space X.
Figure 4.4. A homotopy H between α and γ via β .
Proof. Reﬂectivity: α ∼α . The homotopy may be given by F(s, t) = α( s) for
any t∈I .
Symmetry:L e t α ∼β with the homotopy F(s, t) such that F(s, 0)= α( s),
F(s, 1)= β( s).T h e nβ ∼α , where the homotopy is given by F(s, 1−t).
Transitivity:L e t α ∼β and β ∼γ .T h e nα ∼γ .I f F(s, t) is a homotopy
between α and β and G(s, t) is a homotopy between β and γ , a homotopy
between α and γ may be (ﬁgure 4.4)
H (s, t)=
{
F(s, 2t) 0≤t≤1
2
G(s, 2t−1) 1
2 ≤t≤1.
/A3


## Page 144

4.1.4 Fundamental groups
The equivalence class of loops is denoted by [α] and is called the homotopy
class of α . The product between loops naturally deﬁnes the product in the set of
homotopy classes of loops.
Deﬁnition 4.5. Let X be a topological space. The set of homotopy classes of loops
at x0 ∈X is denoted by π 1(X, x0) and is called the fundamental group (or the
ﬁrst homotopy group)o f X at x0. The product of homotopy classes[α] and[β]
is deﬁned by
[α]∗[β]=[ α ∗β]. (4.4)
Lemma 4.1. The product of homotopy classes is independent of the representa-
tive, that is, if α ∼α′ and β ∼β′,t h e nα ∗β ∼α′∗β′.
Proof.L e t F(s, t) be a homotopy between α and α′ and G(s, t) be a homotopy
between β and β′.T h e n
H (s, t)=
{
F(2s, t) 0≤s≤1
2
G(2s−1, t) 1
2 ≤s≤1
is a homotopy between α ∗β and α′∗β′, hence α ∗β ∼α′∗β′ and[α]∗[β] is
well deﬁned. /A3
Theorem 4.1. The fundamental group is a group. Namely, if α ,β ,... are loops at
x∈X, the following group properties are satisﬁed:
(1) ([α]∗[β])∗[γ]=[ α]∗([β]∗[γ])
(2)[α]∗[cx]=[ α] and[cx]∗[α]=[ α] (unit element)
(3)[α]∗[α−1]=[ cx], hence[α]−1 =[ α−1] (inverse).
Proof.( 1 )L e tF(s, t) be a homotopy between (α ∗β) ∗γ and α ∗(β ∗γ) .I tm a y
be given by (ﬁgure 4.5(a))
F(s, t)=














α
( 4s
1+ t
)
0≤s≤1+ t
4
β( 4s−t−1) 1+ t
4 ≤s≤2+ t
4
γ
( 4s−t−2
2−t
) 2+ t
4 ≤s≤1.
Thus, we may simply write[α ∗β ∗γ] to denote[(α ∗β) ∗γ] or[α ∗(β ∗γ)].


## Page 145

Figure 4.5. (a) A homotopy between (α∗β)∗γ and α∗(β∗γ) .( b) A homotopy between
α ∗cx and α .
(2) Deﬁne a homotopy F(s, t) by (ﬁgure 4.5(b))
F(s, t)=





α
( 2s
1+ t
)
0≤s≤t+ 1
2
x t+ 1
2 ≤s≤1.
Clearly this is a homotopy between α ∗cx and α . Similarly, a homotopy between
cx ∗α and α is given by
F(s, t)=






x 0≤s≤1−t
2
α
( 2s−1+ t
1+ t
) 1−t
2 ≤s≤1.
This shows that[α]∗[cx]=[ α]=[ cx]∗[α].
(3) Deﬁne a map F: I× I →X by
F(s, t)=
{
α( 2s(1−t)) 0≤s≤1
2
α( 2(1−s)(1−t)) 1
2 ≤s≤1.
Clearly F(s, 0)= α ∗α−1 and F(s, 1)= cx , hence
[α ∗α−1]=[ α]∗[α−1]=[ cx].
This shows that[α−1]=[ α]−1. /A3
In summary, π 1(X, x) is a group whose unit element is the homotopy class
of the constant loop cx . The product [α]∗[β] is well deﬁned and satisﬁes the


## Page 146

Figure 4.6. From a loop α at x0, a loop η−1∗α ∗η at x1 is constructed.
group axioms. The inverse of [α] is[α]−1 =[ α−1]. In the next section we
study the general properties of fundamental groups, which simplify the actual
computations.
4.2 General properties of fundamental groups
4.2.1 Arcwise connectedness and fundamental groups
In section 2.3 we deﬁned a topological space X to be arcwise connected if, for
any x0, x1 ∈X, there exists a path α such that α( 0)= x0 and α( 1)= x1.
Theorem 4.2. Let X be an arcwise connected topological space and let x0, x1 ∈
X.T h e nπ 1(X, x0) is isomorphic to π 1(X, x1).
Proof.L e t η : I → X be a path such that η( 0) = x0 and η( 1) = x1.
If α is a loop at x0,t h e n η−1∗α ∗η is a loop at x1 (ﬁgure 4.6). Given an
element[α]∈π 1(X, x0), this correspondence induces a unique element [α′]=
[η−1∗α ∗η]∈π 1(X, x1). We denote this map by Pη : π 1(X, x0)→π 1(X, x1)
so that[α′]= Pη ([α]).
We show that Pη is an isomorphism. First, Pη is a homomorphism,s i n c ef o r
[α],[β]∈π 1(X, x0),w eh a v e
Pη ([α]∗[β])=[ η−1]∗[α]∗[β]∗[η]
=[ η−1]∗[α]∗[η]∗[η−1]∗[β]∗[η]
= Pη ([α])∗Pη ([β]).
To show that Pη is bijective, we introduce the inverse of Pη . Deﬁne a map
P−1
η : π 1(X, x1)→π 1(X, x0) whose action on[α′] is P−1
η ([α′])=[ η∗α∗η−1].


## Page 147

Clearly P−1 is the inverse of Pη since
P−1
η ◦Pη ([α])= P−1
η ([η−1∗α ∗η])=[ η∗η−1∗α ∗η∗η−1]=[ α].
Thus, P−1
η ◦Pη = idπ 1(X,x0). From the symmetry, we have Pη◦P−1
η = idπ 1(X,x1).
We ﬁnd from exercise 2.3 that Pη is one to one and onto. /A3
Accordingly, if X is arcwise connected, we do not need to specify the base
point since π 1(X, x0)∼= π 1(X, x1) for any x0, x1 ∈X, and we may simply write
π 1(X).
Exercise 4.1. (1) Let η and ζ be paths from x0 to x1, such that η ∼ζ . Show that
Pη = Pζ .
(2) Let η and ζ be paths such that η( 1)= ζ( 0). Show that Pη∗ζ = Pζ ◦Pη .
4.2.2 Homotopic invariance of fundamental groups
The homotopic equivalence of paths and loops is easily generalized to arbitrary
maps. Let f, g : X →Y be continuous maps. If there exists a continuous map
F : X× I →Y such that F(x, 0)= f (x) and F(x, 1)= g(x), f is said to be
homotopic to g, denoted by f ∼g.T h em a pF is called a homotopy between f
and g.
Deﬁnition 4.6. Let X and Y be topological spaces. X and Y are of the same
homotopy type, written as X ≃ Y , if there exist continuous maps f : X →Y
and g : Y →X such that f ◦g ∼idY and g◦f ∼idX .T h e m a p f is
called the homotopy equivalence and g, its homotopy inverse.[ Remark:I f X is
homeomorphic to Y , X and Y are of the same homotopy type but the converse is
not necessarily true. For example, a point{p} and the real line /CA are of the same
homotopy type but{p} is not homeomorphic to /CA .]
Proposition 4.2. ‘Of the same homotopy type’ is an equivalence relation in the
set of topological spaces.
Proof. Reﬂectivity: X ≃ X where id X is a homotopy equivalence. Symmetry:
Let X ≃ Y with the homotopy equivalence f : X →Y .T h e n Y ≃ X,t h e
homotopy equivalence being the homotopy inverse of f . Transitivity: Let X≃ Y
and Y ≃ Z. Suppose f : X →Y , g: Y →Z are homotopy equivalences and
f′ : Y →X, g′ : Z→Y , their homotopy inverses. Then
(g◦f )( f′◦g′)= g( f ◦f′)g′ ∼g◦idY ◦g′ = g◦g′ ∼idZ
( f′◦g′)(g◦f )= f′(g′◦g) f ∼f′◦idY ◦f = f′◦f ∼idX
from which it follows X≃ Z. /A3


## Page 148

Figure 4.7. The circle R is a retract of the annulus X. The arrows depict the action of the
retraction.
One of the most remarkable properties of the fundamental groups is that two
topological spaces of the same homotopy type have the same fundamental group.
Theorem 4.3. Let X and Y be topological spaces of the s ame homotopy type. If
f : X→Y is a homotopy equivalence, π 1(X, x0) is isomorphic to π 1(Y, f (x0)).
The following corollary follows directly from theorem 4.3.
Corollary 4.1. A fundamental group is invariant under homeomorphisms, and
hence is a topological invariant.
In this sense, we must admit that fundamental groups classify topological
spaces in a less strict manner than homeomorphisms. What we claim at most is
that if topological spaces X and Y have different fundamental groups, X cannot
be homeomorphic to Y . Note, however, that the homotopy groups including the
fundamental groups have many applications to physics as we shall see in due
course. We should stress that the main usage of the homotopy groups in physics
is not to classify spaces but to classify maps or ﬁeld conﬁgurations.
It is rather difﬁcult to appreciate what is meant by ‘of the same homotopy
type’ for an arbitrary pair of X and Y . In practice, however, it often happens that
Y is a subspace of X. We then claim that X≃ Y if Y is obtained by a continuous
deformation of X.
Deﬁnition 4.7. Let R (̸=∅) be a subspace of X. If there exists a continuous map
f : X→R such that f|
R = idR, R is called a retract of X and f a retraction.
Note that the whole of X is mapped onto R keeping points in R ﬁxed.
Figure 4.7 is an example of a retract and retraction.


## Page 149

Figure 4.8. The circle R is not a deformation retract of X.
Deﬁnition 4.8. Let R be a subspace of X. If there exists a continuous map
H: X× I →X such that
H (x, 0)= xH (x, 1)∈R for any x∈X (4.5)
H (x, t)= x for any x∈R and any t∈I . (4.6)
The space R is said to be adeformation retract of X. Note that H is a homotopy
between idX and a retraction f : X →R, which leaves all the points in R ﬁxed
during deformation.
A retract is not necessarily a deforma tion retract. In ﬁgure 4.8, the circle R
is a retract of X but not a deformation retract, since the hole inX is an obstruction
to continuous deformation of idX to the retraction. Since X and R are of the same
homotopy type, we have
π 1(X, a)∼= π 1(R, a) a∈R. (4.7)
Example 4.1. Let X be the unit circle and Y be the annulus,
X={ eiθ|0≤θ< 2π} (4.8)
Y ={ reiθ|0≤θ< 2π, 1
2 ≤r≤2
3} (4.9)
see ﬁgure 4.7. Deﬁne f : X ↪→Y by f (eiθ ) = eiθ and g : Y →X by
g(reiθ ) = eiθ .T h e n f ◦g : reiθ ↦→eiθ and g◦f : eiθ ↦→eiθ . Observe that
f ◦g∼idY and g◦f = idX . There exists a homotopy
H (reiθ , t)={ 1+ (r−1)(1−t)}eiθ
which interpolates between id X and f ◦g, keeping the points on X ﬁxed.
Hence, X is a deformation retract of Y . As for the fundamental groups we have
π 1(X, a)∼= π 1(Y, a) where a∈X.


## Page 150

Deﬁnition 4.9. If a point a ∈X is a deformation retract of X, X is said to be
contractible.
Let ca : X →{a} be a constant map. If X is contractible, there exists a
homotopy H : X × I →X such that H (x, 0) = ca (x) = a and H (x, 1) =
idX (x) = x for any x ∈X and, moreover, H (a, t) = a for any t ∈I.T h e
homotopy H is called the contraction.
Example 4.2. X = /CA
n is contractible to the origin 0. In fact, if we deﬁne
H : /CA
n × I →/CA by H (x, t)= tx ,w eh a v e( i )H (x, 0)= 0a n d H (x, 1)= x
for any x∈X and (ii) H (0, 1)= 0f o ra n yt∈I. Now it is clear that any convex
subset of /CA
n is contractible.
Exercise 4.2. Let D2 ={ (x, y) ∈/CA
2|x2 + y2 ≤1}. Show that the unit circle
S1 is a deformation retract of D2 −{0}. Show also that the unit sphere Sn is a
deformation retract of Dn+1−{0},w h e r eDn+1 ={ x∈/CA
n+1||x|≤1}.
Theorem 4.4. The fundamental group of a contractible space X is trivial,
π 1(X, x0) ∼= {e}. In particular, the fundamental group of /CA
n is trivial,
π 1(/CA
n , x0)∼={e}.
Proof. A contractible space has the same fundamental group as a point {p} and a
point has a trivial fundamental group. /A3
If an arcwise connected space X has a trivial fundamental group, X is said
to be simply connected, see section 2.3.
4.3 Examples of fundamental groups
There does not exist a routine procedure to compute the fundamental groups,
in general. However, in certain cases, they are obtained by relatively simple
considerations. Here we look at the fundamental groups of the circle S
1 and
related spaces.
Let us express S1 as{z ∈/BV ||z|= 1}. Deﬁne a map p : /CA →S1 by
p : x ↦→exp(ix). Under p, the point 0 ∈/CA is mapped to 1 ∈S1,w h i c hi s
taken to be the base point. We imagine that /CA wraps around S1 under p,s e e
ﬁgure 4.9. If x, y ∈/CA satisﬁes x−y = 2π m(m ∈/CI ), they are mapped to the
same point in S1. Then we write x ∼y. This is an equivalence relation and the
equivalence class[x]={ y|x−y = 2π m for some m ∈/CI } is identiﬁed with
a point exp (ix) ∈S1. It then follows that S1 ∼=
/CA /2π /CI .L e t ˜f : /CA →/CA be
a continuous map such that ˜f (0) = 0a n d ˜f (x+ 2π) ∼˜f (x). It is obvious
that ˜f (x+ 2π) = ˜f (x)+ 2nπ for any x ∈/CA ,w h e r en is a ﬁxed integer. If
x∼y (x−y= 2π m),w eh a v e
˜f (x)−˜f (y)= ˜f (y+ 2π m)−˜f (y)
= ˜f (y)+ 2π mn−˜f (y)= 2π mn


## Page 151

Figure 4.9. The map p: /CA →S1 deﬁned by x↦→exp(ix) projects x+ 2mπ to the same
point on S1, while ˜f : /CA →/CA , such that ˜f (0)= 0a n d ˜f (x+ 2π) = ˜f (x)+ 2nπ for
ﬁxed n,d e ﬁ n e sam a pf : S1 →S1. The integer n speciﬁes the homotopy class to which
f belongs.
hence ˜f (x) ∼˜f (y). Accordingly, ˜f : /CA →/CA uniquely deﬁnes a continuous
map f : /CA /2π /CI →/CA /2π /CI by f ([x])= p◦˜f (x), see ﬁgure 4.9. Note that f
keeps the base point 1∈S1 ﬁxed. Conversely, given a map f : S1 →S1,w h i c h
leaves 1∈S1 ﬁxed, we may deﬁne a map ˜f : /CA →/CA such that ˜f (0)= 0a n d
˜f (x+ 2π) = ˜f (x)+ 2π n.
ln summary, there is a one-to-one correspondence between the set of maps
from S1 to S1 with f (1)= 1 and the set of maps from /CA to /CA such that ˜f (0)= 0
and ˜f (x+ 2π) = ˜f (x)+ 2π n. The integer n is called the degree of f and is
denoted by deg( f ). While x encircles S1 once, f (x) encircles S1 n times.
Lemma 4.2. (1) Let f, g : S1 → S1 such that f (1) = g(1) = 1. Then
deg( f )= deg(g) if and only if f is homotopic to g.
(2) For any n∈/CI , there exists a map f : S1 →S1 such that deg( f )= n.


## Page 152

Proof.( 1 )L e td e g( f )= deg(g) and ˜f ,˜g: /CA →/CA be the corresponding maps.
Then ˜F(x, t)≡t ˜f (x)+ (1−t)˜g(x) is a homotopy between ˜f (x) and ˜g(x).I t
is easy to verify that F ≡p◦˜F is a homotopy between f and g.C o n v e r s e l y ,
if f ∼g : S1 →S1, there exists a homotopy F : S1 × I →S1 such that
F(1, t) = 1f o ra n yt ∈I . The corresponding homotopy ˜F : /CA × I →/CA
between ˜f and ˜g satisﬁes ˜F (x+ 2π, t)= ˜F(x, t)+ 2nπ for some n∈/CI . Thus,
deg( f )= deg(g).
(2) ˜f : x↦→nx induces a map f : S1 →S1 with deg( f )= n. /A3
Lemma 4.2 tells us that by assigning an integer deg( f ) to a map f : S1 →S1
such that f (1)= 1, there is a bijection between π 1(S1, 1) and /CI . Moreover, this
is an isomorphism. In fact, for f, g : S1 →S1, f ∗g, deﬁned as a product of
loops, satisﬁes deg( f ∗g)= deg( f )+ deg(g).[ L e t˜f (x+ 2π) = ˜f (x)+ 2π n
and ˜g(x+ 2π) =˜g(x)+ 2π m.T h e nf ∗g(x+ 2π) = f ∗g(x)+ 2π( m+ n).
Note that∗is not a composite of maps but a product of paths.] We have ﬁnally
proved the following theorem.
Theorem 4.5. The fundamental group of S1 is isomorphic to /CI ,
π 1(S1)∼=
/CI . (4.10)
[Since S1 is arcwise connected, we may drop the base point.]
Although the proof of the theorem is not too obvious, the statement itself is
easily understood even by children. Suppose we encircle a cylinder with an elastic
band. If it encircles the cylindern times, the conﬁguration cannot be continuously
deformed into that with m (̸=n) encirclements. If an elastic band encircles a
cylinder ﬁrst n times and then m times, it encircles the cylinder n+ m times in
total.
4.3.1 Fundamental group of torus
Theorem 4.6. Let X and Y be arcwise connected topological spaces. Then
π 1(X× Y,( x0, y0)) is isomorphic to π 1(X, x0)⊕π 1(Y, y0).
Proof. Deﬁne projections p1 : X× Y →X and p2 : X× Y →Y .I f α is a
loop in X × Y at (x0, y0), α 1 ≡p1(α) is a loop in X at x0,a n d α 2 ≡p2(α)
is a loop in Y at y0. Conversely, any pair of loops α 1 of X at x0 and α 2 of Y
at y0 determines a unique loop α = (α 1,α 2) of X × Y at (x0, y0).D e ﬁ n e a
homomorphism ϕ : π 1(X× Y,( x0, y0))→π 1(X, x0)⊕π 1(Y, y0) by
ϕ([α])= ([α 1],[α 2]).
By construction ϕ has an inverse, hence it is the required isomorphism and
π 1(X× Y,( x0, y0))∼= π 1(X, x0)⊕π 1(Y, y0). /A3


## Page 153

Example 4.3. (1) Let T 2 = S1× S1 be a torus. Then
π 1(T 2)∼= π 1(S1)⊕π 1(S1)∼
=
/CI ⊕/CI . (4.11)
Similarly, for the n-dimensional torus
T n = S1× S1×···× S1

 
 
n
we have
π 1(T n )∼
=
/CI ⊕/CI ⊕···⊕/CI

 
 
n
. (4.12)
(2) Let X= S1× /CA be a cylinder. Since π 1(/CA )∼
={e},w eh a v e
π
1(X )∼
=
/CI ⊕{e}∼
=
/CI . (4.13)
4.4 Fundamental groups of polyhedra
The computation of fundamental groups in the previous section was, in a sense,ad
hoc and we certainly need a more systematic way of computing the fundamental
groups. Fortunately if a space X is triangulable, we can compute the fundamental
group of the polyhedron K , and hence that of X by a routine procedure. Let us
start with some aspects of group theories.
4.4.1 Free groups and relations
The free groups that we deﬁne here are not necessarily Abelian and we employ
multiplicative notation for the group operation. A subset X ={ x j} of a group G
is called a free set of generators of G if any element g ∈G−{e} is uniquely
written as
g= xi1
1 xi2
2 ··· xin
n (4.14)
where n is ﬁnite and ik ∈/CI . We assume no adjacent x j are equal; x j ̸= x j+1.
If i j = 1, x j 1 is simply written as x j .I f i j = 0, the term x j 0 should be dropped
from g. For example, g = a3b−2cb3 is acceptable but h = a3a−2cb0 is not. If
each element is to be written uniquely, h must be reduced to h= ac.I f G has a
free set of generators, it is called a free group.
Conversely, given a setX, we can construct a free group G whose free set of
generators is X. Let us call each element of X a letter. The product
w= xi1
1 xi2
2 ··· xin
n (4.15)
is called a word,w h e r ex j ∈X and i j ∈/CI .I f i j ̸= 0a n dx j ̸= x j+1 the word is
called a reduced word. It is always possible to reduce a word by ﬁnite steps. For
example,
a−2b−3b3a4b3c−2c4 = a−2b0a4b3c2 = a2b3c2.


## Page 154

A word with no letters is called an empty word and denoted by 1. For example,
it is obtained by reducing w= a0.
A product of words is deﬁned by simply juxtaposing two words. Note that a
juxtaposition of reduced words is not necessarily reduced but it is always possible
to reduce it. For example, if v= a2c−3b2 and w= b−2c2b3, the product vw is
reduced as
vw= a2c−3b2b−2c2b3 = a2c−3c2b3 = a2c−1b3.
Thus, the set of all reduced words form a well-deﬁned free group called the free
group generated by X, denoted by F[X]. The multiplication is the juxtaposition
of two words followed by reduction, the unit element is the empty word and the
inverse of
w= xi1
1 xi2
2 ··· xin
n
is
w−1 = x−in
n ··· x−i2
2 x−i1
1 .
Exercise 4.3. Let X ={ a}. Show that the free group generated by X is
isomorphic to /CI .
In general, an arbitrary group G is speciﬁed by the generators and certain
constraints that these must satisfy. If {xk} is the set of generators, the constraints
are most commonly written as
r= xi1
k1 xi2
k2 ··· xin
kn = 1 (4.16)
and are called relations. For example, the cyclic group of order n generated by x
(in multiplicative notation) satisﬁes a relation xn = 1.
More formally, let G be a group which is generated by X ={ xk}.A n y
element g ∈G is written as g = xi1
1 xi2
2 ··· xin
n , where we do not require that
the expression be unique ( G is not necessarily free). For example, we have
xi = xn+1 in /CI .L e t F[X] be the free group generated by X. Then there is a
natural homomorphism ϕ from F[X] onto G deﬁned by
xi1
1 xi2
2 ··· xin
n
ϕ
−→xi1
1 xi2
2 ··· xin
n ∈G. (4.17)
Note that this is not an isomorphism since the LHS is not unique.ϕ is onto since X
generates both F[X] and G. Although F[X] is not isomorphic to G, F[X]/ ker ϕ
is (see theorem 3.1),
F[X]/ ker ϕ ∼= G. (4.18)
In this sense, the set of generators X and ker ϕ completely determine the group
G.[ k e r ϕ is a normal subgroup. Lemma 3.1 claims that ker ϕ is a subgroup
of F[X].L e t r ∈ker ϕ ,t h a ti s ,r ∈F[X] and ϕ( r ) = 1. For any element
x ∈F[X],w eh a v e ϕ( x−1rx ) = ϕ( x−1)ϕ( r )ϕ( x) = ϕ( x)−1ϕ( r )ϕ( x) = 1,
hence x−1rx ∈ker ϕ .]


## Page 155

In this way, a group G generated by X is speciﬁed by the relations. The
juxtaposition of generators and relations
(x1,..., xp; r1,..., rq ) (4.19)
is called the presentation of G. For example, /CI
n= (x; xn) and /CI = (x;∅).
Example 4.4. Let /CI ⊕/CI ={ xn ym|n, m∈/CI } be a free Abelian group generated
by X={ x, y}.T h e nw eh a v exy = yx .S i n c exyx−1y−1 = 1, we have a relation
r= xyx−1y−1. The presentation of /CI ⊕/CI is (x, y: xyx−1y−1).
4.4.2 Calculating fundamental groups of polyhedra
We shall be sketchy here to avoid getting into the technical details. We
shall follow Armstrong (1983); the interested reader should consult this book
or any textbook on algebraic topology. As noted in the previous chapter, a
polyhedron|K| is a nice approximation of a given topological space X within
a homeomorphism. Since fundamental groups are topological invariants, we have
π 1(X)= π 1(|K|). We assume X is an arcwise connected space and drop the base
point. Accordingly, if we have a systematic way of computing π 1(|K|), we can
also ﬁnd π 1(X ).
We ﬁrst deﬁne the edge group of a simplicial complex, which corresponds to
the fundamental group of a topological space, then introduce a convenient way of
computing it. Let f :| K|→X be a triangulation of a topological space X.I fw e
note that an element of the fundamental group of X can be represented by loops
in X, we expect that similar loops must exist in|K| as well. Since any loop in|K|
is made up of 1-simplexes, we look at the set of all 1-simplexes in|K|, which can
be endowed with a group structure called the edge group of K .
An edge path in a simplicial complex K is a sequence v0v1 ...v k of vertices
of|K|, in which the consecutive pair vi vi+1 is a 0- or 1-simplex of |K|.[ F o r
technical reasons, we allow the possibility vi = vi+1, in which case the relevant
simplex is a 0-simplex vi = vi+1.] If v0 = vk (=v), the edge path is called
an edge loop at v. We classify these loops into equivalence classes according to
some equivalence relation. We deﬁne two edge loops α and β to be equivalent
if one is obtained from the other by repeating the following operations a ﬁnite
number of times.
(1) If the vertices u,v and w span a 2-simplex in K , the edge path uvw may
be replaced by uw and vice versa; see ﬁgure 4.10(a).
(2) As a special case, if u = w in (1), the edge path uvw corresponds to
traversing along uv ﬁrst then reversing backwards from v to w = u. This edge
path uvu may be replaced by a 0-simplex u and vice versa, see ﬁgure 4.10(b).
Let us denote the equivalence class of edge loops atv,t ow h i c hvv1 ...v k−1v
belongs, by{vv1 ...v k−1v}. The set of equivalence classes forms a group under
the product operation deﬁned by
{vu1 ... uk−1v}∗{vv1 ...v i−1v}={ vu1 ... uk−1vv1 ...v i−1v}. (4.20)


## Page 156

Figure 4.10. Possible deformations of the edge loops. In ( a), uvw is replaced by uw.I n
(b), uvu is replaced by u.
The unit element is an equivalence class {v} while the inverse of{vv1 ...v k−1 v}
is{vvk−1 ...v 1v}. This group is called the edge group of K at v and denoted by
E(K; v).
Theorem 4.7. E (K; v) is isomorphic to π 1(|K|; v).
The proof is found in Armstrong (1983), for example. This isomorphism
ϕ : E(K; v)→π 1(|K|; v) is given by identifying an edge loop in K with a loop
in|K|.T oﬁ n d E(K; v), we need to read off the generators and relations. Let L
be a simplicial subcomplex of K , such that
(a) L contains all the vertices (0-simplexes) of K ;
(b) the polyhedron |L| is arcwise connected and simply connected.
Given an arcwise-connected simplicial complex K , there always exists a
subcomplex L that satisﬁes these conditions. A one-dimensional simplicial
complex that is arcwise connect ed and simply connected is called a tree.A t r e e
TM is called the maximal tree of K if it is not a proper subset of other trees.
Lemma 4.3. A maximal tree TM contains all the vertices of K and hence satisﬁes
conditions (a) and (b) above.
Proof. Suppose TM does not contain some vertex w.S i n c e K is arcwise
connected, there is a 1-simplex vw in K such that v ∈TM and w ̸∈TM. TM ∪
{vw}∪{w} is a one-dimensional subcomplex of K which is arcwise connected,
simply connected and contains TM, which contradicts the assumption. /A3
Suppose we have somehow obtained the subcomplex L.S i n c e|L| is simply
connected, the edge loops in |L| do not contribute to E(K; v). Thus, we can
effectively ignore the simplexes in L in our calculations. Let v0 (=v), v1,...,v n
be the vertices of K . Assign an ‘object’ gij for each ordered pair of verticesvi ,v j
if⟨vi vj⟩ is a 1-simplex of K .L e tG(K; L) be a group that is generated by all gij .
What about the relations? We have the following.


## Page 157

(1) Since we ignore those simplexes in L, we assign gij = 1i f⟨vi vj⟩∈L.
(2) If ⟨vi vj vk⟩ is a 2-simplex of K , there are no non-trivial loops around vi vj vk
and we have the relation gij g jk gki = 1.
The generators{gij} and the set of relations completely determine the group
G(K; L).
Theorem 4.8. G (K; L) is isomorphic to E(K; v)≃ π 1(|K|; v).
In fact, we can be more efﬁcient than is apparent. For example, gii should
be set equal to 1 since gii corresponds to the vertex vi w h i c hi sa ne l e m e n to f
L. Moreover, from gij g ji = gii = 1, we have gij = g−1
ji . Therefore, we only
need to introduce those generators gij for each pair of vertices vi , vj such that
⟨vi vj⟩∈K−L and i < j. Since there are no generators gij such that⟨vi vj⟩∈L,
we can ignore the ﬁrst type of relation. If ⟨vi vj vk⟩ is a 2-simplex of K−L such
that i < j < k, the corresponding relation is uniquely given by gij g jk = gik
since we are only concerned with simplexes⟨vi vj⟩ such that i < j.
To summarize, the rules of the game are as follows.
(1) First, ﬁnd a triangulation f :| K|→ X.
(2) Find the subcomplex L that is arcwise connected , simply connected and
contains all the vertices of K .
(3) Assign a generator gij to each 1-simplex⟨vi vj⟩ of K−L,f o rw h i c hi < j.
(4) Impose a relation gij g jk = gik if there is a 2-simplex ⟨vi vj vk⟩ such that
i < j < k. If two of the vertices vi ,v j and vk form a 1-simplex of L,t h e
corresponding generator should be set equal to 1.
(5) Now π 1(X ) is isomorphic to G(K; L) which is a group generated by {gij}
with the relations obtained in (4).
Let us work out several examples.
Example 4.5. From our construction, it should be clear thatE(K; v) and G(K; L)
involve only the 0-, 1- and 2-simplexes of K . Accordingly, if K (2) denotes a 2-
skeleton of K , which is deﬁned to be the set of all 0-, 1- and 2-simplexes in K ,
we should have
π 1(|K|)∼= π 1(|K (2)|). (4.21)
This is quite useful in actual computations. For example, a 3-simplex and its
boundary have the same 2-skeleton. A 3-simplex is a polyhedron|K| of the solid
ball D3, while its boundary |L| is a polyhedron of the sphere S2.S i n c eD3 is
contractible, π 1(|K|)∼={e}. From (4.21) we ﬁnd π 1(S2)∼
= π
1(|K|)∼
={e}.I n
general, for n≥2, the (n+ 1)-simplex σ
n+1 and the boundary of σ n+1 have the
same 2-skeleton. If we note that σ n+1 is contractible and the boundary of σ n+1 is
a polyhedron of Sn, we ﬁnd the formula
π 1(Sn )∼
={e} n≥2. (4.22)


## Page 158

Figure 4.11. A triangulation of a 3-bouquet. The bold lines denote the maximal tree L.
Example 4.6. Let K ≡{ v1,v 2,v 3,⟨v1v2⟩,⟨v1 v3⟩,⟨v2v3⟩} be a simplicial
complex of a circle S1.W e t a k ev1 as the base point. A maximal tree may be
L={ v1,v 2,v 3,⟨v1v2⟩,⟨v1 v3⟩}. There is only one generator g23. Since there are
no 2-simplexes in K , the relation is empty. Hence,
π 1(S1)∼= G(K; L)= (g23;∅)∼
=
/CI (4.23)
in agreement with theorem 4.5.
Example 4.7. An n-bouquet is deﬁned by the one-point union of n circles. For
example, ﬁgure 4.11 is a triangulation of a 3-bouquet. Take the common point
v as the base point. The bold lines in ﬁgure 4.11 form a maximal tree L.T h e
generators of G(K; L) are g12, g34 and g56. There are no relations and we ﬁnd
π 1(3-bouquet)= G(K; L)= (x, y, z;∅). (4.24)
Note that this is a free group but not free Abelian. The non-commutativity can
be shown as follows. Consider loops α and β at v encircling different holes.
Obviously the product α∗β∗α−1 cannot be continuously deformed intoβ , hence
[α]∗[β]∗[α]−1 ̸=[ β],o r
[α]∗[β]̸=[ β]∗[α]. (4.25)
In general, an n-bouquet has n generators g12,..., g2n−12 n and the
fundamental group is isomorphic to the free group with n generators with no
relations.


## Page 159

Figure 4.12. A triangulation of the torus.
Example 4.8. Let D2 be a two-dimensional disc. A triangulationK of D2 is given
by a triangle with its interior included. Clearly K itself may be L and K−L is
empty. Thus, we ﬁnd π 1(K )∼={e}.
Example 4.9. Figure 4.12 is a triangulation of the torus T 2. The shaded area is
chosen to be the subcomplex L. [Verify that it contains all the vertices and is both
arcwise and simply connected.] There are 11 generators with ten relations. Let us
take x= g02 and y= g04 and write down the relations
(a) g02 g27 = g07 → g07 = x
x 1
(b) g03 g37 = g07 → g37 = x
1 x
(c) g37 g78 = g38 → g38 = x
x 1
(d) g34 g48 = g38 → g48 = x
1 x
(e) g24 g48 = g28 → g24x= g28
x
(f) g02 g24 = g04 → xg24 = y
xy


## Page 160

(g) g04 g46 = g06 → g06 = y
y 1
(h) g01 g16 = g06 → g16 = y
1 y
(i) g16 g68 = g18 → g18 = y
y 1
(j) g12 g28 = g18 → g28 = y
1 y .
It follows from (e) and (f) that x−1 yx = g28. We ﬁnally have
g02 = g07 = g37 = g38 = g48 = x
g04 = g06 = g16 = g18 = g28 = y
g24 = x−1 y
with a relation x−1 yx = y or
xyx−1y−1 = 1. (4.26)
This shows that G(K; L) is generated by two commutative generators (note
xy = yx ), hence (cf example 4.4)
G(K; L)= (x, y; xyx−1y−1)∼=
/CI ⊕/CI (4.27)
in agreement with (4.11).
We have the following intuitive picture. Consider loops α = 0 →1 →
2→0a n dβ = 0→3→4→0. The loop α is identiﬁed with x = g02 since
g12 = g01 = 1a n d β with y = g04. They generate π 1(T 2) since α and β are
independent non-trivial loops. In terms of these, the relation is written as
α ∗β ∗α−1∗β−1 ∼cv (4.28)
where cv is a constant loop at v, see ﬁgure 4.13.
More generally, let /Sigma1g be the torus with genus g. A sw eh a v es h o w ni n
problem 2.1, /Sigma1g is expressed as a subset of /CA
2 with proper identiﬁcations at
the boundary. The fundamental group of /Sigma1g is generated by 2 g loops α i ,β i
(1≤i≤g). Similarly, to (4.28), we verify that
g∏
i=1
(α i ∗β i ∗α−1
i ∗β−1
i )∼cv (4.29)
If we denote the generators corresponding to α i by xi and β i by yi , there is only
one relation among them,
g∏
i=1
(xi yi x−1
i y−1
i )= 1. (4.30)


## Page 161

Figure 4.13. The loops α and β satisfy the relation α ∗β ∗α−1∗β−1 ∼cv.
Figure 4.14. A triangulation of the Klein bottle.
Exercise 4.4. Figure 4.14 is a triangulation of the Klein bottle. The shaded area is
the subcomplex L. There are 11 generators and ten relations. Take x = g02 and
y= g04 and write down the relations for 2-simplexes to show that
π 1(Klein bottle)∼= (x, y; xyxy−1). (4.31)
Example 4.10. Figure 4.15 is a triangulation of the projective plane /CA P2 .T h e
shaded area is the subcomplex L. There are seven generators and six relations.


## Page 162

Figure 4.15. A triangulation of the projective plane.
Let us take x= g23 and write down the relations
(a) g23 g34 = g24 → g24 = x
x 1
(b) g24 g46 = g26 → g26 = x
x 1
(c) g12 g26 = g16 → g16 = x
1 x
(d) g13 g36 = g16 → g36 = x
1 x
(e) g35 g56 = g36 → g35 = x
1 x
(f) g23 g35 = g25 → x2 = 1.
xx 1
Hence, we ﬁnd that
π 1(/CA P2 )∼= (x; x2)∼
=
/CI
2. (4.32)
Intuitively, the appearance of a cyclic group is understood as follows.
Figure 4.16( a) is a schematic picture of /CA P2 . Take loops α and β . It is easy
to see that α is continuously deformed to a point, and hence is a trivial element of
π 1(/CA P2 ). Since diametrically opposite points are identiﬁed in /CA P2 , β is actually


## Page 163

Figure 4.16. (a) α is a trivial loop while the loop β cannot be shrunk to a point. (b) β ∗β
is continuously shrunk to a point.
a closed loop. Since it cannot be shrunk to a point, it is a non-trivial element of
π 1(/CA P2 ). What about the product? β∗β is a loop which traverses from P to Q∼
P twice. It can be read off from ﬁgure 4.16( b)t h a tβ ∗β is continuously shrunk
to a point, and thus belongs to the trivial class. This shows that the generator x,
corresponding to the homotopy class of the loop β , satisﬁes the relation x2 = 1,
which veriﬁes our result.
The same pictures can be used to show that
π 1(/CA P3 )∼=
/CI
2 (4.33)
where /CA P3 is identiﬁed as S3 with diametrically opposite points identiﬁed,
/CA P3 = S3/(x ∼−x). If we take the hemisphere of S3 as the representative,
/CA P3 can be expressed as a solid ballD3 with diametrically opposite points on the
surface identiﬁed. If the discs D2 in ﬁgure 4.16 are interpreted as solid balls D3,
the same pictures verify (4.33).
Exercise 4.5. A triangulation of the M¨obius strip is given by ﬁgure 3.8. Find the
maximal tree and show that
π 1(M¨obius strip)∼=
/CI . (4.34)
[Note: Of course the M¨ obius strip is of the same homotopy type as S1, hence
(4.34) is trivial. The reader is asked to obtain this result through routine
procedures.]
4.4.3 Relations between H1(K) and π1(|K |)
The reader might have noticed that there is a certain similarity between the ﬁrst
homology group H1(K ) and the fundamental group π 1(|K|). For example, the
fundamental groups of many spaces (circle, disc,n-spheres, torus and many more)
are identical to the corresponding ﬁrst homology group. In some cases, however,
they are different: H1(2-bouquet)∼=
/CI ⊕/CI and π 1(2-bouquet)= (x, y:∅),f o r


## Page 164

example. Note that H1(2-bouquet) is a free Abelian group while π 1(2-bouquet)
is a free group. The following theorem relates π 1(|K|) to H1(K ).
Theorem 4.9. Let K be a connected simplicial complex. Then H1(K ) is
isomorphic to π 1(|K|)/F,w h e r eF is the commutator subgroup (see later) of
π 1(|K|).
Let G be a group whose presentation is (xi; rm ).T h e commutator
subgroup F of G is a group generated by the elements of the form xi x j x−1
i x−1
j .
Thus, G/F is a group generated by {xi} with the set of relations {rm} and
{xi x j x−1
i x−1
j }. The theorem states that if π 1(|K|)= (xi : rm ),t h e nH1(K ) ∼=
(xi : rm , xi x j x−1
i x−1
j ). For example, from π 1(2-bouquet)= (x, y:∅),w eﬁ n d
π 1(2-bouquet)/F∼
= (x, y; xyx
−1y−1)∼
=
/CI ⊕/CI
which is isomorphic to H1(2-bouquet).
The proof of theorem 4.9 is found in Greenberg and Harper (1981) and also
outlined in Croom (1978).
Example 4.11. From π 1(Klein bottle)∼= (x, y; xyxy−1),w eh a v e
π 1(Klein bottle)/F∼= (x, y; xyxy−1, xyx−1y−1).
Two relations are replaced by x2 = 1a n dxyx−1y−1 = 1 to yield
π 1(Klein bottle)/F∼= (x, y; xyx−1y−1, x2)∼
=
/CI ⊕/CI
2
∼
= H
1(Klein bottle)
where the factor /CI is generated by y and /CI
2 by x.
Corollary 4.2. Let X be a connected topological space. Thenπ 1(X) is isomorphic
to H1(X ) if and only if π 1(X ) is commutative. In particular, if π 1(X) is generated
by one generator, π 1(X ) is always isomorphic to H1(X). [Use theorem 4.9.]
Corollary 4.3. If X and Y are of the same homotopy type, their ﬁrst homology
groups are identical: H1(X )= H1(Y ). [Use theorems 4.9 and 4.3.]
4.5 Higher homotopy groups
The fundamental group classiﬁes the homotopy classes of loops in a topological
space X. There are many ways to assign other groups to X. For example, we may
classify homotopy classes of the spheres in X or homotopy classes of the tori in
X. It turns out that the homotopy classes of the sphere Sn (n≥2) form a group
similar to the fundamental group.


## Page 165

4.5.1 Deﬁnitions
Let In (n≥1) denote the unit n-cube I×···× I,
In ={ (s1,..., sn )|0≤si ≤1 (1≤i≤n)}. (4.35)
The boundary ∂ In is the geometrical boundary of In,
∂ In ={ (s1,..., sn )∈In| some si = 0o r1}. (4.36)
We recall that in the fundamental group, the boundary∂ I of I =[ 0, 1] is mapped
to the base point x0. Similarly, we assume here that we shall be concerned with
continuous maps α : In →X, which map the boundary ∂ In to a point x0 ∈X.
Since the boundary is mapped to a single point x0, we have effectively obtained
Sn from In; cf ﬁgure 2.8. If I n /∂ In denotes the cube I n whose boundary ∂ In is
shrunk to a point, we have In /∂ In ∼= Sn.T h em a pα is called an n-loop at x0.A
straightforward generalization of deﬁnition 4.4 is as follows.
Deﬁnition 4.10. Let X be a topological space and α, β : In →X be n-loops at
x0 ∈X.T h e m a p α is homotopic to β , denoted by α ∼β , if there exists a
continuous map F: In × I →X such that
F(s1,..., sn , 0)= α( s1,..., sn ) (4.37a)
F(s1,..., sn , 1)= β( s1,..., sn ) (4.37b)
F(s1,..., sn , t)= x0 for (s1,..., sn )∈∂ I n , t∈I. (4.37c)
F is called a homotopy between α and β .
Exercise 4.6. Show that α ∼β is an equivalence relation. The equivalence class
to which α belongs is called the homotopy class of α and is denoted by[α].
Let us deﬁne the group operations. The product α ∗β of n-loops α and β is
deﬁned by
α ∗β( s1,..., sn )=
{
α( 2s1,..., sn ) 0≤s1 ≤1
2
β( 2s1−1,..., sn ) 1
2 ≤s1 ≤1. (4.38)
The product α ∗β looks like ﬁgure 4.17( a)i n X. It is helpful to express it as
ﬁgure 4.17(b). If we deﬁne α−1 by
α−1(s1,..., sn )≡α( 1−s1,..., sn ) (4.39)
it satisﬁes
α−1∗α( s1,..., sn )∼α ∗α−1(s1,..., sn )∼cx0 (s1,..., sn ) (4.40)
where cx0 is a constant n-loop at x0 ∈X, cx0 : (s1,..., sn )↦→x0.V e r i f y t h a t
both α ∗β and α−1 are n-loops at x0.


## Page 166

Figure 4.17. A product α ∗β of n-loops α and β .
Deﬁnition 4.11. Let X be a topological space. The set of homotopy classes of
n-loops (n≥1) at x0 ∈X is denoted by π n (X, x0) and called the nth homotopy
group at x0. π n (x, x0) is called the higher homotopy group if n≥2.
The product α ∗β just deﬁned naturally induces a product of homotopy
classes deﬁned by
[α]∗[β]≡[α ∗β] (4.41)
where α and β are n-loops at x0. The following exercises verify that this product
is well deﬁned and satisﬁes the group axioms.
Exercise 4.7. Show that the product of n-loops deﬁned by (4.41) is independent
of the representatives: cf lemma 4.1.
Exercise 4.8. Show that the nth homotopy group is a group. To prove this, the
following facts may be veriﬁed; cf theorem 4.1.
(1) ([α]∗[β])∗[γ]=[ α]∗([β]∗[γ]).
(2)[α]∗[cx]=[ cx]∗[α]=[ α].
(3)[α]∗[α−1]=[ cx], which deﬁnes the inverse[α]−1 =[ α−1].
We have excluded π 0(X, x0) so far. Let us classify maps from I 0 to X.W e
note I0 ={ 0} and ∂ I0 =∅.L e t α, β :{ 0}→ X be such that α( 0) = x and
β( 0)= y.W e d e ﬁ n eα ∼β if there exists a continuous map F :{ 0}× I →X
such that F(0, 0)= x and F(0, 1)= y. This shows that α ∼β if and only if
x and y are connected by a curve in X, namely they are in the same (arcwise)
connected component. Clearly this equivalence relation is independent of x0 and
we simply denote the zeroth homology group by π 0(X). Note, however, that
π 0(X) is not a group and denotes the number of (arcwise) connected components
of X.


## Page 167

Figure 4.18. Higher homotopy groups are always commutative, α ∗β ∼β ∗α .
4.6 General properties of higher homotopy groups
4.6.1 Abelian nature of higher homotopy groups
Higher homotopy groups are always Abelian; for any n-loops α and β at x0 ∈X,
[α] and[β] satisfy
[α]∗[β]=[ β]∗[α]. (4.42)
To verify this assertion let us observe ﬁgure 4.18. Clearly the deformation is
homotopic at each step of the sequence. This shows that α ∗β ∼β ∗α , namely
[α]∗[β]=[ β]∗[α].
4.6.2 Arcwise connectedness and higher homotopy groups
If a topological space X is arcwise connected, π n (X, x0) is isomorphic to
π n (X, x1) for any pair x0, x1 ∈X. The proof is parallel to that of theorem 4.2.
Accordingly, if X is arcwise connected, the base point need not be speciﬁed.
4.6.3 Homotopy invariance of higher homotopy groups
Let X and Y be topological spaces of the same homotopy type; see deﬁnition
4.6. If f : X →Y is a homotopy equivalence, the homotopy group π n (X, x0)
is isomorphic to π n (Y, f (x0)); cf theorem 4.3. Topological invariance of higher
homotopy groups is the direct consequence of this fact. In particular, if X is
contractible, the homotopy groups are trivial: π n (X, x0)={ e}, n > 1.
4.6.4 Higher homotopy groups of a product space
Let X and Y be arcwise connected topological spaces. Then
π n (X× Y )∼= π n (X)⊕π n (Y ) (4.43)
cf theorem 4.6.
4.6.5 Universal covering spaces and higher homotopy groups
There are several cases in which the homotopy groups of one space are given by
the known homotopy groups of the other space. There is a remarkable property


## Page 168

between the higher homotopy groups of a topological space and its universal
covering space.
Deﬁnition 4.12. Let X and ˜X be connected topological spaces. The pair (˜
X, p),
or simply ˜
X, is called the covering space of X if there exists a continuous map
p: ˜X→X such that
(1) p is surjective (onto)
(2) for each x ∈X, there exists a connected open set U ⊂X containing
x, such that p
−1(U ) is a disjoint union of open sets in ˜X, each of which is
mapped homeomorphically onto U by p.
In particular, if ˜X is simply connected, (˜
X , p) is called the universal
covering space of X.[ Remarks: Certain groups are known to be topological
spaces. They are called topological groups. For example SO (n) and SU(n) are
topological groups. If X and ˜
X in deﬁnition 4.12 happen to be topological groups
and p: ˜X →X to be a group homomorphism, the (universal) covering space is
called the (universal) covering group.]
For example,
/CA is the universal covering space of S1, see section 4.3. Since
S1 is identiﬁed with U(1), /CA is a universal covering group of U(1) if /CA is regarded
as an additive group. The map p: /CA →U(1) may be p: x →ei2π x . Clearly p
is surjective and if U={ ei2π x|x∈(x0−0.1, x0+ 0.1)},t h e n
p−1(U )=
⋃
n∈/CI
(x0−0.1+ n, x0+ 0.1+ n)
which is a disjoint union of open sets of /CA . I ti se a s yt os h o wt h a tp is also a
homomorphism with respect to addition in /CA and multiplication in U(1). Hence,
(/CA , p) is the universal covering group of U(1)= S1.
Theorem 4.10. Let (˜X , p) be the universal covering space of a connected
topological space X.I f x0 ∈X and˜x0 ∈˜X are base points such that p(˜x0)= x0,
the induced homomorphism
p∗: π n (˜X , ˜x0)→π n (X, x0) (4.44)
is an isomorphism for n≥2. [Warning: This theorem cannot be applied if n= 1;
π 1(/CA )={ e} while π 1(S1)= /CI .]
The proof is given in Croom (1978). For example, we have π n (/CA ) ={ e}
since /CA is contractible. Then we ﬁnd
π n (S1)∼= π n (U(1))={ e} n≥2. (4.45)
Example 4.12. Let Sn ={ x∈/CA
n+1|| x|2 = 1}. The real projective space /CA Pn is
obtained from Sn by identifying the pair of antipodal points (x,−x). It is easy to


## Page 169

see that Sn is a covering space of /CA Pn for n≥2. Since π 1(Sn )={ e} for n≥2,
Sn is the universal covering space of /CA Pn and we have
π n (/CA Pm )∼= π n (Sm ). (4.46)
It is interesting to note that /CA P3 is identiﬁed with SO (3). To see this let
us specify an element of SO (3) by a rotation about an axis n by an angle θ
(0 <θ <π ) and assign a ‘vector’ /Omega1≡θ n to this element. /Omega1takes its value in
the disc D3 of radius π . Moreover, π n and−π n represent the same rotation and
should be identiﬁed. Thus, the space to which /Omega1belongs is a disc D3 whose anti-
podal points on the surface S2 are identiﬁed. Note also that we may express /CA P3
as the northern hemisphere D3 of S3, whose anti-podal points on the boundaryS2
are identiﬁed. This shows that /CA P3 is identiﬁed with SO(3).
It is also interesting to see that S3 is identiﬁed with SU (2). First note that
any element g∈SU(2) is written as
g=
(
a −
b
b
 a
)
|a|2+| b|2 = 1. (4.47)
If we write a= u+ iv and b= x+ iy, this becomes S3,
u2+ v2+ x2+ y2 = 1.
Collecting these results, we ﬁnd
π n (SO(3))= π n (/CA P3 )= π n (S3)= π n (SU(2)) n≥2. (4.48)
More generally, the universal covering group Spin(n) of SO(n) is called the spin
group.F o rs m a l ln,t h e ya r e
Spin(3)= SU(2) (4.49)
Spin(4)= SU(2)× SU(2) (4.50)
Spin(5)= USp(4) (4.51)
Spin(6)= SU(4). (4.52)
Here USp(2N) stands for the compact group of 2 N× 2N matrices A satisfying
At JA = J,w h e r e
J=
( 0 IN
−IN 0
)
.
4.7 Examples of higher homotopy groups
In general, there are no algorithms to compute higher homotopy groups π n (X).
An ad hoc method is required for each topological space for n ≥2. Here, we
study several examples in which higher homotopy groups may be obtained by
intuitive arguments. We also collect useful results in table 4.1.


## Page 170

Table 4.1. Useful homotopy groups.
π 1 π 2 π 3 π 4 π 5 π 6
SO(3) /CI
2 0 /CI /CI
2
/CI
2
/CI
12
SO(4) /CI
2 0 /CI + /CI /CI
2+ /CI
2
/CI
2+ /CI
2
/CI
12+ /CI
12
SO(5) /CI
2 0 /CI /CI
2
/CI
2 0
SO(6) /CI
2 0 /CI 0 /CI 0
SO(n) n > 6 /CI
2 0 /CI 00 0
U(1) /CI 00 0 0 0
SU(2) 00 /CI /CI
2
/CI
2
/CI
12
SU(3) 00 /CI 0 /CI /CI
6
SU(n) n > 30 0 /CI 0 /CI 0
S2 0 /CI /CI /CI
2
/CI
2
/CI
12
S3 00 /CI /CI
2
/CI
2
/CI
12
S4 00 0 /CI /CI
2
/CI
2
G2 00 /CI 00 /CI
3
F4 00 /CI 00 0
E6 00 /CI 00 0
E7 00 /CI 00 0
E8 00 /CI 00 0
Example 4.13. If we note that π n (X, x0) is the set of the homotopy classes of
n-loops Sn in X, we immediately ﬁnd that
π n (Sn , x0)∼=
/CI n≥1. (4.53)
If α maps Sn onto a point x0 ∈Sn,[α] is the unit element 0 ∈/CI . Since both
In /∂ In and Sn are orientable, we may assign orientations to them. If α maps
In /∂ In homeomorphically to Sn in the same sense of orientation, then [α] is
assigned an element 1 ∈/CI . If a homeomorphism α maps I n /∂ In onto Sn in an
orientation of opposite sense, [α] corresponds to an element −1. For example,
let n = 2. Since I2/∂ I2 ∼= S2, the point in I2 can be expressed by the polar
coordinate (θ, φ) , see ﬁgure 4.19. Similarly, X = S2 can be expressed by the
polar coordinate (θ′,φ ′).L e t α : (θ, φ) →(θ′,φ ′) be a 2-loop in X.I f θ′ = θ
and φ′ = φ , the point (θ′,φ ′) sweeps S2 once while the point (θ, φ) scans I2
once in the same orientation. This 2-loop belongs to the class +1∈π 2(S2, x0).
If α : (θ, φ) →(θ′,φ ′) is given by θ′ = θ and φ′ = 2φ , the point (θ′,φ ′)
sweeps S2 twice while (θ, φ) scans I2 once. This 2-loop belongs to the class
2∈π 2(S2, x0). In general, the map (θ, φ) ↦→(θ, kφ), k∈/CI , corresponds to the
class k of π 2(S2, x0). A similar argument veriﬁes (4.53) for general n > 2.
Example 4.14. Noting that Sn is a universal covering space of/CA Pn for n > 2, we
ﬁnd
π n (/CA Pn )∼= π n (Sn )∼
=
/CI n≥2. (4.54)


## Page 171

Figure 4.19. A point in I2 may be expressed by polar coordinates (θ, φ) .
[Of course this happens to be true for n= 1, since /CA P1 = S1.] For example, we
have π 2(/CA P2 )∼= π 2(S2)∼
=
/CI .S i n c eS U(2)= S3 is the universal covering group
of SO(3)= /CA P3 , it follows from theorem 4.10 that (see also (4.48))
π 3(SO(3))∼
= π
3(SU(2))∼
= π
3(S3)∼
=
/CI . (4.55)
Shankar’s monopoles in superﬂuid 3He-A correspond to non-trivial elements
of these homotopy classes, see section 4.10. π 3(SU(2)) is also employed in the
classiﬁcation of instantons in example 9.8.
In summary, we have table 4.1. In this table, other useful homotopy groups
are also listed. We comment on several interesting facts.
(a) Since Spin (4)= SU(2)× SU(2) is the universal covering group of SO (4),
we have π n (SO(4))= π n (SU(2))⊕π n (SU(2)) for n > 2.
(b) There exists a map J called the J-homomorphism J : π k (SO(n)) →
π k+n (Sn ), see Whitehead (1978). In particular, if k= 1, the homomorphism
is known to be an isomorphism and we have π 1(SO(n))= π n+1(Sn ).F o r
example, we ﬁnd
π 1(SO(2))∼
= π
3(S2)∼
=
/CI
π 1(SO(3))∼
= π
4(S3)∼
= π
4(SU(2))∼
= π
4(SO(3))∼
=
/CI
2.
(c) The Bott periodicity theorem states that
π k (U(n))∼
= π
k (SU(n))∼
=
{
{e} if k is even
/CI if k is odd (4.56)


## Page 172

for n≥(k+ 1)/2. Similarly,
π k (O(n))∼= π k (SO(n))∼
=



{e} if k≡2, 4, 5, 6 (mod 8)
/CI
2 if k≡0, 1 (mod 8)
/CI if k≡3, 7 (mod 8)
(4.50)
for n ≥k+ 2. Similar periodicity holds for symplectic groups which we
shall not give here.
Many more will be found in appendix A, table 6 of Ito (1987).
4.8 Orders in condensed matter systems
Recently topological methods have played increasingly important roles in
condensed matter physics. For example, homotopy theory has been employed to
classify possible forms of extended objects, such as solitons, vortices, monopoles
and so on, in condensed systems. These classiﬁcations will be studied in
sections 4.8–4.10. Here, we brieﬂy look at the order parameters of condensed
systems that undergo phase transitions.
4.8.1 Order parameter
Let H be a Hamiltonian describing a condensed matter system. We assume H is
invariant under a certain symmetry operation. The ground state of the system need
not preserve the symmetry of H . If this is the case, we say the system undergoes
spontaneous symmetry breakdown.
To illustrate this phenomenon, we consider the Heisenberg Hamiltonian
H=−J
∑
(i, j )
Si · S j + h·
∑
i
Si (4.57)
which describes N ferromagnetic Heisenberg spins {Si}. The parameter J is a
positive constant, the summation is over the pair of the nearest-neighbour sites
(i, j ) and h is the uniform external magnetic ﬁeld. The partition function is
Z = tr e−β H ,w h e r eβ = 1/T is the inverse temperature. The free energy F
is deﬁned by exp(−β F)= Z. The average magnetization per spin is
m≡1
N
∑
i
⟨Si⟩= 1
Nβ
∂ F
∂ h (4.58)
where⟨...⟩≡tr( ... e−β H )/Z. Let us consider the limit h →0. Although H
is invariant under the SO(3) rotations of all Si in this limit, it is well known that
m does not vanish for large enough β and the system does not observe the SO(3)
symmetry. It is said that the system exhibits spontaneous magnetization and
the maximum temperature, such that m ̸= 0 is called the critical temperature.


## Page 173

The vector m is the order parameter describing the phase transition between
the ordered state ( m̸= 0) and the disordered state ( m= 0). The system is still
symmetric under SO(2) rotations around the magnetization axis m.
What is the mechanism underlying the phase transition? The free energy is
F =⟨ H⟩−TS , S being the entropy. At low temperature, the term TS in F
may be negligible and the minimum of F is attained by minimizing ⟨H⟩,w h i c h
is realized if all Si align in the same direction. At high temperature, however, the
entropy term dominates F and the minimum of F is attained by maximizing S,
which is realized if the directions of Si are totally random.
If the system is at a uniform temperature, the magnitude |m| is independent
of the position and m is speciﬁed by its direction only. In the ground state, m
itself is expected to be independent of position. It is convenient to introduce
the polar coordinate (θ, φ) to specify the direction of m. There is a one-to-one
correspondence between m and a point on the sphere S2. Suppose m varies as a
function of position: m= m(x). At each point x of the space, a point (θ, φ) of
S2 is assigned and we have a map (θ (x), φ( x)) from the space to S2. Besides
the ground state (and excited states that are described by small oscillations
(spin waves) around the ground state) the system may carry various excited
states that cannot be obtained from the ground state by small perturbations.
What kinds of excitation are possible depends on the dimension of the space
and the order parameter. For example, if the space is two dimensional, the
Heisenberg ferromagnet may admit an excitation called the Belavin–Polyakov
monopole shown in ﬁgure 4.20 (Belavin and Polyakov 1975). Observe that m
approaches a constant vector (ˆz in this case) so the energy does not diverge. This
condition guarantees the stability of this excitation; it is impossible to deform this
conﬁguration into the uniform one with m far from the origin kept ﬁxed. These
kinds of excitation whose stability depe nds on topological arguments are called
topological excitations. Note that the ﬁeld m(x) deﬁnes a map m : S2 →S2
and, hence, are classiﬁed by the homotopy group π 2(S2)= /CI .
4.8.2 Superﬂuid 4He and superconductors
In Bogoliubov’s theory, the order parameter of superﬂuid 4He is the expectation
value
⟨φ( x)⟩= /Psi1(r)= /Delta10(x)eiα( x) (4.59)
where φ( x) is the ﬁeld operator. In the operator formalism,
φ( x)∼(creation operator)+ (annihilation operator)
from which we ﬁnd the number of particles is not conserved if /Psi1(x)̸= 0. This
is related to the spontaneous breakdown of the global gauge symmetry. The


## Page 174

Figure 4.20. A sketch of the Belavin–Polyakov monopole. The vector m approachesˆz as
|x|→∞.
Hamiltonian of 4He is
H=
∫
dx φ †(x)
(
−∇2
2m−µ
)
φ( x)
+ 1
2
∫
dx d y φ †( y)φ( y)V (|x−y|)φ †(x)φ( x). (4.60)
Clearly H is invariant under the global gauge transformation
φ( x)→eiχ φ( x). (4.61)
The order parameter, however, transforms as
/Psi1(x)→eiχ /Phi1(x) (4.62)
and hence does not observe the symmetry of the Hamiltonian. The
phenomenological free energy describing 4He is made up of two contributions.
The main contribution is the condensation energy
/BY
0 ≡α
2!|/Psi1(x)|2+ β
4!|/Psi1(x)|4 (4.63a)
where α ∼α 0(T −Tc) changes sign at the critical temperature T ∼4K .
Figure 4.21 sketches /BY
0 for T > Tc and T < Tc.I f T > Tc, the minimum
of /BY
0 is attained at /Psi1(x) = 0 while if T < Tc at|/Psi1|= /Delta10 ≡[ −(6α/β) ]1/2.
If /Psi1(x) depends on x, we have an additional contribution called the gradient
energy
/BY
grad≡1
2 K
∇/Psi1(x)·∇/Psi1(x) (4.63b)


## Page 175

Figure 4.21. T h ef r e ee n e r g yh a sam i n i m u ma t|/Psi1|= 0f o rT > Tc and at|/Psi1|= /Delta10 for
T < Tc.
K being a positive constant. If the spatial variation of /Psi1(x) is mild enough, we
may assume /Delta10 is constant (the London limit).
In the BCS theory of superconductors, the order parameter is given by
(Tsuneto 1982)
/Psi1αβ ≡⟨ψ α (x)ψ β (x)⟩ (4.64)
ψ α (x) being the (non-relativistic) electron ﬁeld operator of spin α = (↑,↓).I t
should be noted, however, that (4.64) is not an irreducible representation of the
spin algebra. To see this, we examine the behaviour of /Psi1αβ under a spin rotation.
Consider an inﬁnitesimal spin rotation around an axis n by an angle θ , whose
matrix representation is
R= I2+ i θ
2 nµσ µ,
σ µ being the Pauli matrices. Since ψ α transforms as ψ α →Rα β ψ β we have
/Psi1αβ →Rα α′
/Psi1α′β′ Rβ β′
= (R· /Psi1· Rt)αβ
=
[
/Psi1+ i δ
2 n(σ/Psi1σ2−/Psi1σ2σ)
]
αβ
where we note that σ t
µ =−σ 2σ µσ 2. Suppose /Psi1αβ ∝i(σ 2)αβ .T h e n/Psi1does not
change under this rotation, hence it represents the spin-singlet pairing. We write
/Psi1αβ (x)= /Delta1(x)(iσ 2)αβ = /Delta10(x)eiϕ( x)(iσ 2)αβ . (4.65a)
If, however, we take
/Psi1αβ (x)= /Delta1µ(x)i(σ µ· σ 2)αβ (4.65b)


## Page 176

we have
/Psi1αβ →[/Delta1µ+ δε µνλ nν /Delta1λ](iσ µ· σ 2)αβ .
This shows that /Delta1µ is a vector in spin space, hence (4.65b) represents the spin-
triplet pairing.
The order parameter of a conventional superconductor is of the form (4.65a)
and we restrict the analysis to this case for the moment. In (4.65a),/Delta1(x) assumes
t h es a m ef o r ma s/Psi1(x) of superﬂuid 4He and the free energy is again given by
(4.63). This similarity is attributed to the Cooper pair. In the superﬂuid state,
a macroscopic number of 4He atoms occupy the ground state (Bose–Einstein
condensation) which then behaves like a huge molecule due to the quantum
coherence. In this state creating elementary excitations requires a ﬁnite amount
of energy and the ﬂow cannot decay unless this critical energy is supplied. Since
an electron is a fermion there is, at ﬁrst sight, no Bose–Einstein condensation.
The key observation is the Cooper pair. By the exchange of phonons, a pair of
electrons feels an attractive force that ba rely overcomes the Coulomb repulsion.
This tiny attractive force makes it possible for electrons to form a pair (in
momentum space) that obeys Bose statistics. The pairs then condense to form
the superﬂuid state of the Cooper pairs of electric charge 2e.
An electromagnetic ﬁeld couples to the system through the minimal coupling
/BY
grad = 1
2 K
⏐⏐(∂µ−i2eA µ)/Delta1(x)
⏐
⏐
2 . (4.66)
(The term 2e is used since the Cooper pair carries charge 2 e.) Superconductors
are roughly divided into two types accord ing to their behaviour in applied
magnetic ﬁelds. The type-I superconductor forms an intermediate state in which
normal and superconducting regions coexist in strong magnetic ﬁelds. The
type-II superconductor forms a vortex lattice ( Abrikosov lattice) to conﬁne the
magnetic ﬁelds within the cores of the vortices with other regions remaining in
the superconducting state. A similar vorte x lattice has been observed in rotating
superﬂuid
4He in a cylinder.
4.8.3 General consideration
ln the next two sections, we study applications of homotopy groups to the
classiﬁcation of defects in ordered medi a. The analysis of this section is based
on Toulouse and Kl´eman (1976), Mermin (1979) and Mineev (1980).
As we saw in the previous subsections, when a condensed matter system
undergoes a phase transition, the symmetry of the system is reduced and this
reduction is described by the order parameter. For deﬁniteness, let us consider the
three-dimensional medium of a superconductor. The order parameter takes the
form ψ( x)= /Delta10(x)eiϕ( x). Let us consider a homogeneous system under uniform
external conditions (temperature, pressure etc). The amplitude /Delta10 is uniquely
ﬁxed by minimizing the condensation free energy. Note that there are still a large
number of degrees of freedom left. ψ may take any value in the circle S1 ∼= U(1)


## Page 177

Figure 4.22. Ac i r c l eS1 surrounding a line defect (vortex) is mapped to U(1)= S1.T h i s
map is classiﬁed by the fundamental group π 1(U(1).
determined by the phase e iϕ . In this way, a uniform system takes its value in
a certain region M called the order parameter space . For a superconductor,
M= U (1). For the Heisenberg spin system, M= S2. The nematic liquid crystal
has M= /CA P2 while M= S2×SO(3) for the superﬂuid 3He-A, see sections 4.9–
4.10.
If the system is in an inhomogeneous state, the gradient free energy cannot be
negligible and ψ may not be in M. If the characteristic size of the variation of the
order parameter is much larger than the coherence length, however, we may still
assume that the order parameter takes its value inM, where the value is a function
of position this time. If this is the case, there may be points, lines or surfaces in the
medium on which the order parameter is not uniquely deﬁned. They are called the
defects.W eh a v epoint defects (monopoles), line defects (vortices)a n dsurface
defects (domain walls) according to their dimensionalities. These defects are
classiﬁed by the homotopy groups.
To be more mathematical, let X be a space which is ﬁlled with the medium
under consideration. The order parameter is a classical ﬁeld ψ( x), which is also
regarded as a map ψ : X →M. Suppose there is a defect in the medium. For
concreteness, we consider a line defect in the three-dimensional medium of a
superconductor. Imagine a circle S1 which encircles the line defect. If each part
of S1 is far from the line defect, much further than the coherence length ξ ,w e
may assume the order parameter along S1 takes its value in the order parameter
space M= U(1), see ﬁgure 4.22. This is how the fundamental group comes into
the problem; we talk of loops in a topological space U (1).T h em a pS1 →U(1)
is classiﬁed by the homotopy classes. Take a point r0 ∈S1 and require that r0 be
mapped to x0 ∈M. By noting that π 1(U(1), x0)= /CI , we may assign an integer
to the line defect. This integer is called the winding number since it counts how
many times the image of S1 winds the space U (1). If two line defects have the


## Page 178

same winding number, one can be continuously deformed to the other. If two
line defects A and B merge together, the new line defect belongs to the homotopy
class of the product of the homotopy classes to which A and B belonged before
coalescence. Since the group operation in /CI is an addition, the new winding
number is a sum of the old winding numbers. A uniform distribution of the order
parameter corresponds to the constant map ψ( x) = x0 ∈M, which belongs to
the unit element 0 ∈/CI . If two line defects of opposite winding numbers merge
together, the new line defect can be continuously deformed into the defect-free
conﬁguration.
What about the other homotopy groups? We ﬁrst consider the dimensionality
of the defect and the sphere S
n which surrounds it. For example, consider a point
defect in a three-dimensional medium. It can be surrounded by S2 and the defect
is classiﬁed by π 2(M, x0).I f M has many components, π 0(M) is non-trivia1. Let
us consider a three-dimensional Ising model for which M = {↓}∪{↑}.T h e n
there is a domain wall on which the order parameter is not deﬁned. For example,
if S=↑for x < 0a n d S=↓for x > 0, there is a domain wall in the yz -plane
at x = 0. In general, an m-dimensional defect in a d-dimensional medium is
classiﬁed by the homotopy group π n (M, x0) where
n= d−m−1. (4.67)
In the case of the lsing model, d= 3, m= 2; hence n= 0.
4.9 Defects in nematic liquid crystals
4.9.1 Order parameter of nematic liquid crystals
Certain organic crystals exhibit quite interesting optical properties when they are
in their ﬂuid phases. They are called li quid crystals and they are characterized
by their optical anisotropy. Here we are interested in so-called nematic liquid
crystals. An example of this isoctyloxy-cyanobiphenyl whose molecular structure
is
The molecule of a nematic liquid crystal is very much like a rod and the order
parameter, called the director, is given by the average direction of the rod. Even
though the molecule itself has a head and a tail, the director has an inversion
symmetry; it does not make sense to distinguish the directors n=→and−n=
←. We are tempted to assign a point on S2 to specify the director. This works
except for one point. Two antipodal points n= (θ, φ) and−n= (π −θ,π + φ)
represent the same state; see ﬁgure 4.23. Accordingly, the order parameter of the
nematic liquid crystal is the projective plane /CA P2 . The director ﬁeld in general


## Page 179

Figure 4.23. Since the director n has no head or tail, one cannot distinguish n from−n.
Therefore, these two pictures correspond to the same order-parameter conﬁguration.
Figure 4.24. A vortex in a nematic liquid crystal, which corresponds to the non-trivial
element of π 1(/CA P2 )= /CI
2.
depends on the position r. Then we may deﬁne a map f : /CA
3 →/CA P2 .T h i s
m a pi sc a l l e dt h etexture. The actual order-parameter conﬁguration in /CA
3 is also
called the texture.
4.9.2 Line defects in nematic liquid crystals
From example 4.10 we have π 1(/CA P2 ) ∼=
/CI
2 ={ 0, 1}. There exist two kinds
of line defect in nematic liquid crystals; one can be continuously deformed into
a uniform conﬁguration while the other cannot. The latter represents a stable
vortex, whose texture is sketched in ﬁgure 4.24. The reader should observe how
the loop α is mapped to /CA P2 by this texture.
Exercise 4.9. Show that the line ’defect’ in ﬁgure 4.25 is ﬁctitious, namely the
singularity at the centre may be eliminated by a continuous deformation of
directors with directors at the boundary ﬁxed. This corresponds to the operation
1+ 1= 0.


## Page 180

Figure 4.25. A line defect which may be continuously deformed into a uniform
conﬁguration.
Figure 4.26. The texture of a point defect in a nematic liquid crystal.
4.9.3 Point defects in nematic liquid crystals
From example 4.14, we have π 2(/CA P2 )= /CI . Accordingly, there are stable point
defects in the nematic liquid crystal. Figure 4.26 shows the texture of the point
defects that belong to the class 1∈/CI .
It is interesting to point out that a line defect and a point defect may be
combined into a ring defect, which is speciﬁed by both π 1(/CA P2 ) and π 2(/CA P2 ),
see Mineev (1980). If the ring defect is observed from far away, it looks like


## Page 181

Figure 4.27. The texture of a ring defect in a nematic liquid crystal. The loop α classiﬁes
π 1(/CA P2 ) while the sphere (2-loop) β classiﬁes π 2(/CA P2 ).
a point defect, while its local structure along the ring is speciﬁed by π 1(/CA P2 ).
Figure 4.27 is an example of such a ring defect. The loopα classiﬁes π 1(/CA P2 )∼=
/CI
2 while the sphere (2-loop) β classiﬁes π 2(/CA P2 )= /CI .
4.9.4 Higher dimensional texture
The third homotopy group π( /CA P2 ) ∼=
/CI leads to an interesting singularity-
free texture in a three-dimensional medium of nematic liquid crystal. Suppose
the director ﬁeld approaches an asymptotic conﬁguration, say n = (1, 0, 0)t,
as |r|→∞ . Then the medium is effectively compactiﬁed into the three-
dimensional sphere S3 and the topological structure of the texture is classiﬁed
by π 3(/CA P2 )∼=
/CI . What is the texture corresponding to a non-trivial element of
the homotopy group?
An arbitrary rotation in /CA
3 is speciﬁed by a unit vector e, around which the
rotation is carried out, and the rotation angle α . It is possible to assign a ‘vector’
/Omega1= α e to this rotation. It is not exactly a vector since /Omega1= π e and−/Omega1=−π e
are the same rotation and hence should be identiﬁed. Therefore, /Omega1belongs to the
real projective space /CA P3 . Suppose we take n0 = (1, 0, 0)t as a standard director.
Then an arbitrary director conﬁgur ation is speciﬁed by rotating n0 around some
axis e by an angle α : n= R(e,α ) n0,w h e r eR(e,α ) is the corresponding rotation
matrix in SO(3). Suppose a texture ﬁeld is given by applying the rotation
α e(r)= f (r )ˆr (4.68)


## Page 182

Figure 4.28. The texture of the non-trivial element of π 3(/CA P2 ) ∼=
/CI .( a)s h o w st h e
rotation ‘vector’ α e. The length α approaches π as|r|→∞.( b) shows the corresponding
director ﬁeld.
to n0,w h e r eˆr is the unit vector in the direction of the position vector r and
f (r )=
{
0 r= 0
π r→∞.
Figure 4.28 shows the director ﬁeld of this texture. Note that although there
is no singularity in the texture, it is impossible to ‘wind off’ this to a uniform
conﬁguration.
4.10 Textures in superﬂuid 3He-A
4.10.1 Superﬂuid 3He-A
Here comes the last and most interesting example. Before 1972 the only example
of the BCS superﬂuid was the conventional superconductor (apart from indirect
observations of superﬂuid neutrons in neutron stars). Figure 4.29 is the phase
diagram of superﬂuid 3He without an external magnetic ﬁeld. From NMR and
other observations, it turns out that the superﬂuid is in the spin-triplet p-wave
state. Instead of the ﬁeld operators (see (4.65b)), we deﬁne the order parameter
in terms of the creation and annihilation operators. The most general form of the
triplet superﬂuid order parameter is
⟨cα, kcβ,−k⟩∝
3∑
µ=1
(iσ 2σ µ)αβ dµ(k) (4.69a)


## Page 183

Figure 4.29. The phase diagram of superﬂuid 3He.
where α and β are spin indices. The Cooper pair forms in the p-wave state hence
dµ(k) is proportional to Y1m ∼ki ,
dµ(k)=
3∑
i=1
/Delta10 Aµi ki . (4.69b)
The bulk energy has several minima. The absolute minimum depends on the
pressure and the temperature. We are p articularly interested in the A phase in
ﬁgure 4.29.
The A-phase order parameter takes the form
Aµi = dµ(/Delta11+ i/Delta12)i (4.70)
where d is a unit vector along which the spin projection of the Cooper pair
vanishes and (/Delta11,/Delta12) is a pair of orthonormal unit vectors. The vector d takes
its value in S2.I f w e d e ﬁ n e l ≡/Delta11 × /Delta12, the triad (/Delta11,/Delta12, l) forms an
orthonormal frame at each point of the m edium. Since any orthonormal frame
can be obtained from a standard orthonormal frame (e1, e2, e3) by an application
of a three-dimensional rotation matrix, we conclude that the order parameter of
3He-A is S2 × SO(3). The vector l introduced here is the axis of the angular
momentum of the Cooper pair.
For simplicity, we neglect the variation of theˆd-vector. [In fact, ˆd is locked


## Page 184

alongˆl due to the dipole force.] The order parameter assumes the form
Ai = /Delta10(ˆ/Delta11+ ˆ/Delta12)i (4.71)
where ˆ/Delta11, ˆ/Delta12 andˆl ≡ˆ/Delta11 × ˆ/Delta12 form an orthonormal frame at each point of
the medium. Let us take a standard orthonormal frame (e1, e2, e2). The frame
(ˆ/Delta11, ˆ/Delta12,ˆl) is obtained by applying an element g∈SO(3) to the standard frame,
g: (e1, e2, e2)→(ˆ/Delta11, ˆ/Delta12,ˆl). (4.72)
Since g depends on the coordinate x, the conﬁguration (ˆ/Delta11(x), ˆ/Delta12(x),ˆl(x))
deﬁnes a map ψ : X →SO(3) as x ↦→g(x).T h e m a pψ is called the texture
of a superﬂuid 3He.1 The relevant homotopy groups for classifying defects in
superﬂuid 3He-A are π n (SO(3)).
If a container is ﬁlled with 3He-A, the boundary poses certain conditions on
the texture. The vectorˆl is understood as the direction of the angular momentum
of the Cooper pair. The pair should rotate in the plane parallel to the boundary
wall, thusˆl should be perpendicular to the wall. [ Remark: If the wall is diffuse,
the orbital motion of Cooper pairs is disturbed and there is a depression in the
amplitude of the order parameter in the vicinity of the wall. We assume, for
simplicity, that the wall is specularly smooth so that Cooper pairs may execute
orbital motion with no disturbance.] There are several kinds of free energy and
the texture is determined by solving the Euler–Lagrange equation derived from
the total free energy under given boundary conditions.
Reviews on superﬂuid
3He are found in Anderson and Brinkman (1975),
Leggett (1975) and Mermin (1978).
4.10.2 Line defects and non-singular vortices in 3He-A
The fundamental group of SO (3) ∼=
/CA P3 is π 1(/CA P3 ) ∼=
/CI
2 ∼
= {0, 1}.
Textures which belong to class 0 can be continuously deformed into the uniform
conﬁguration. Conﬁgurations in class 1 are called disgyrations and have
been analysed by Maki and Tsuneto (1977) and Buchholtz and Fetter (1977).
Figure 4.30 describes these disgyrations in their lowest free energy conﬁgurations.
A remarkable property of
/CI
2 is the addition 1 + 1= 0; the coalescence of
two disgyrations produces a trivial texture. By merging two disgyrations, we may
construct a texture that looks like a vortex of double vorticity (homotopy class
‘2’) without a singular core; see ﬁgure 4.31(a). It is easy to verify that the image
of the loop α traverses /CA P3 twice while that of the smaller loop β may be shrunk
to a point. This texture is called the Anderson–Toulouse vortex (Anderson and
Toulouse 1977). Mermin and Ho (1976) pointed out that if the medium is in a
cylinder, the boundary imposes the condition ˆl ⊥(boundary) and the vortex is
cut at the surface, see ﬁgure 4.31(b)( t h eMermin–Ho vortex).
1 The name ‘texture’ is, in fact, borrowed from the or der-parameter conﬁguration in liquid crystals,
see section 4.9.


## Page 185

Figure 4.30. Disgyrations in 3He-A.
Figure 4.31. The Anderson–Toulouse vortex (a) and the Mermin–Ho vortex (b). In (b)t h e
boundary forcesˆl to be perpendicular to the wall.
Since π 2(/CA P3 ) ∼= {e}, there are no point defects in 3He-A. However,
π 3(/CA P3 ) ∼
=
/CI introduces a new type of pointlike structure called the Shankar
monopole, which we will study next.
4.10.3 Shankar monopole in 3He-A
Shankar (1977) pointed out that there exi sts a pointlike singularity-free object
in 3He-A. Consider an inﬁnite medium of 3He-A. We assume the medium is
asymptotically uniform, that is, (ˆ/Delta11, ˆ/Delta12,ˆl) approaches a standard orthonormal
frame (e1, e2, e3) as|x|→∞. Since all the points far from the origin are mapped
to a single point, we have compactiﬁed /CA
3 to S3. Then the texture is classiﬁed
according to π 3(/CA P3 ) = /CI . Let us specify an element of SO (3) by a ‘vector’
/Omega1= θ n in /CA P3 as before (example 4.12). Shankar (1977) proposed a texture,
/Omega1(r)= r
r · f (r ) (4.73)


## Page 186

Figure 4.32. The Shankar monopole: (a) shows the ‘vectors’ /Omega1(r) and (b)s h o w st h et r i a d
(ˆ/Delta11,ˆ/Delta12,ˆl). Note that as|r|→∞the triad approaches the same conﬁguration.
where f (r ) is a monotonically decreasing function such that
f (r )=
{
2π r= 0
0 r=∞. (4.74)
We formally extend the radius of/CA P3 to 2π and deﬁne the rotation angle modulo
2π . This texture is called theShankar monopole, see ﬁgure 4.32(a). At ﬁrst sight
it appears that there is a singularity at the origin. Note, however, that the length
of /Omega1is 2π there and it is equivalent to the unit element of SO(3). Figure 4.32( b)
describes the triad ﬁeld. Since /Omega1(r)= 0a s r→∞, irrespective of the direction,
the space /CA
3 is compactiﬁed to S3. As we scan the whole space, /Omega1(r) sweeps
SO(3) twice and this texture corresponds to class 1 of π 3(SO(3))∼=
/CI .
Exercise 4.10. Sketch the Shankar monopole which belongs to the class −1o f
π 3(/CA P3 ). [You cannot simply reverse the arrows in ﬁgure 4.32.]
Exercise 4.11. Consider classical Heisenberg spins deﬁned in/CA
2 , see section 4.8.
Suppose spins take the asymptotic value
n(x)→ez |x|≥L (4.75)
for the total energy to be ﬁnite, see ﬁgure 4.20. Show that the extended objects in
this system are classiﬁed by π 2(S2). Sketch examples of spin conﬁgurations for
the classes−1a n d+2.
Problems
4.1 Show that the n-sphere Sn is a deformation retract of punctured Euclidean
space Rn+1−{0}. Find a retraction.


## Page 187

4.2 Let D2 be the two-dimensional closed disc and S1 = ∂ D2 be its boundary.
Let f : D2 →D2 be a smooth map. Suppose f has no ﬁxed points, namely
f (p)̸= p for any p∈D2. Consider a semi-line starting at p through f (p) (this
semi-line is always well deﬁned if p̸= f (p)). The line crosses the boundary at
some point q ∈S1. Then deﬁne ˜f : D2 →S1 by ˜f (p)= q.U s e π 1(S1)= /CI
and π 1(D2)={ 0} to show that such an ˜f does not exist and hence, that f must
have ﬁxed points. [ Hint: Show that if such an ˜f existed, D2 and S1 would be of
the same homotopy type.] This is the two-dimensional version of the Brouwer
ﬁxed-point theorem.
4.3 Construct a map f : S3 →S2 which belongs to the elements 0 and 1 of
π 3(S2)∼=
/CI . See also example 9.9.


## Page 188

5
MANIFOLDS
Manifolds are generaliza tions of our familiar ideas about curves and surfaces to
arbitrary dimensional objects. A curve in three-dimensional Euclidean space is
parametrized locally by a single numbert as (x(t), y(t), z(t)), while two numbers
u and v parametrize a surface as (x(u,v ) ,y(u,v ) ,z(u,v ) ). A curve and a surface
are considered locally homeomorphic to /CA and /CA
2 , respectively. A manifold,
in general, is a topological space which is homeomorphic to /CA
m locally;i tm a y
be different from /CA
m globally. The local homeomorphism enables us to give
each point in a manifold a set of m numbers called the (local) coordinate. If a
manifold is not homeomorphic to /CA
m globally, we have to introduce several local
coordinates. Then it is possible that a si ngle point has two or more coordinates.
We require that the transition from one coordinate to the other be smooth.A s
we will see later, this enables us to develop the usual calculus on a manifold.
Just as topology is based on continuity, so the theory of manifolds is based on
smoothness.
Useful references on this subject are Crampin and Pirani (1986), Matsushima
(1972), Schutz (1980) and Warner (1983). Chapter 2 and appendices B and C of
Wald (1984) are also recommended. Flanders (1963) is a beautiful introduction
to differential forms. Sattinger and Weaver (1986) deals with Lie groups and Lie
algebras and contains many applications to problems in physics.
5.1 Manifolds
5.1.1 Heuristic introduction
To clarify these points, consider the usual sphere of unit radius in
/CA
3 .W e
parametrize the surface of S2, among other possibilities, by two coordinate
systems—polar coordinates and stereographic coordinates. Polar coordinates θ
and φ are usually deﬁned by (ﬁgure 5.1)
x= sin θ cos φ y= sin θ sin φ z= cos θ, (5.1)
where φ runs from 0 to 2π and θ from 0 to π . They may be inverted on the sphere
to yield
θ = tan−1
√
x2+ y2
z φ = tan−1 y
x . (5.2)


## Page 189

Figure 5.1. Polar coordinates (θ, φ) and stereographic coordinates (X, Y ) of a point P on
the sphere S2.
Stereographic coordinates, however, are deﬁned by the projection from the North
Pole onto the equatorial plane as in ﬁgure 5.1. First, join the North Pole (0, 0, 1)
to the point P(x, y, z) on the sphere and then continue in a straight line to
the equatorial plane z = 0 to intersect at Q(X, Y, 0).T h e n X and Y are the
stereographic coordinates of P.W eﬁ n d
X= x
1−z Y = y
1−z . (5.3)
The two coordinate systems are related as
X= cot 1
2 θ cos φ Y = cot 1
2 θ sin φ. (5.4)
Of course, other systems, polar coordinates with different polar axes or
projections from different points on S2, could be used. The coordinates on the
sphere may be kept arbitrary until some speciﬁc calculation is to be carried out.
[The longitude is historically measured from Greenwich. However, there is no
reason why it cannot be measured from New York or Kyoto.] This arbitrariness
of the coordinate choice underlies the theory of manifolds:all coordinate systems
are equally good . It is also in harmony with the basic principle of physics: a
physical system behaves in the same way whatever coordinates we use to describe
it.


## Page 190

Another point which can be seen from this example is that no coordinate
system may be usable everywhere at once . Let us look at the polar coordinates
on S2. Take the equator (θ = 1
2 π) for deﬁniteness. If we let φ range from 0 to
2π , then it changes continuously as we go round the equator until we get all the
way to φ = 2π .T h e r e t h eφ -coordinate has a discontinuity from 2 π to 0 and
nearby points have quite different φ -values. Alternatively we could continue φ
through 2 π . Then we will encounter another difﬁculty: at each point we must
have inﬁnitely many φ -values, differing from one another by an integral multiple
of 2π . A further difﬁculty arises at the poles, where φ is not determined at all.
[An explorer on the Pole is in a state of timelessness since time is deﬁned by the
longitude.] Stereographic coordinates also have difﬁculties at the North Pole or
at any projection point that is not projected to a point on the equatorial plane; and
nearby points close to the Pole have widely different stereographic coordinates.
Thus, we cannot label the points on the sphere with a single coordinate
system so that both of the following conditions are satisﬁed.
(i) Nearby points always have nearby coordinates.
(ii) Every point has unique coordinates.
Note, however, that there are inﬁnitely many ways to introduce coordinates that
satisfy these requirements on a part of S
2. We may take advantage of this fact to
deﬁne coordinates on S2: introduce two or more overlapping coordinate systems,
each covering a part of the sphere whos e points are to be labelled so that the
following conditions hold.
(i′) Nearby points have nearby coordinatcs in at least one coordinate system.
(ii′) Every point has unique coordinates in each system that contains it.
For example, we may introduce two stereographic coordinates on S2, one a
projection from the North Pole, the other from the South Pole. Are these
conditions (i′)a n d( i i′) enough to develop sensible theories of the manifold? In
fact, we need an extra condition on the coordinate systems.
(iii) If two coordinate systems overlap, they are related to each other in a
sufﬁciently smooth way.
Without this condition, a differentia ble function in one coordinate system
may not be differentiable in the other system.
5.1.2 Deﬁnitions
Deﬁnition 5.1. M is an m-dimensional differentiable manifold if
(i) M is a topological space;
(ii) M is provided with a family of pairs{(Ui ,ϕ i )};
(iii){Ui} is a family of open sets which covers M,t h a ti s ,∪i Ui = M. ϕ i is a
homeomorphism from Ui onto an open subset U′
i of /CA
m (ﬁgure 5.2); and


## Page 191

Figure 5.2. A homeomorphism ϕ i maps Ui onto an open subset U′
i ⊂/CA
m , providing
coordinates to a point p∈Ui .I f Ui ∩U j ̸=∅, the transition from one coordinate system
to another is smooth.
(iv) given Ui and Uj such that Ui ∩Uj ̸=∅,t h em a pψ ij = ϕ i ◦ϕ−1
j from
ϕ j (Ui ∩Uj ) to ϕ i (Ui ∩Uj ) is inﬁnitely differentiable.
The pair (Ui ,ϕ i ) is called a chart while the whole family {(Ui ,ϕ i )} is
called, for obvious reasons, an atlas. The subset Ui is called the coordinate
neighbourhood while ϕ i is the coordinate function or, simply, the coordinate.
The homeomorphism ϕ i is represented by m functions{x1(p) ,..., xm (p)}.T h e
set{xµ(p)} is also called the coordinate. A point p∈M exists independently of
its coordinates; it is up to us how we assign coordinates to a point. We sometimes
employ the rather sloppy notation x to denote a point whose coordinates are
{x1,..., xm}, unless several coordinate systems are in use. From (ii) and (iii), M
is locally Euclidean. In each coordinate neighbourhood Ui , M looks like an open
subset of /CA
m whose element is{x1,..., xm}. Note that we do not require that M
be /CA
m globally. We are living on the earth whose surface is S2, which does not
look like /CA
2 globally. However, it looks like an open subset of /CA
2 locally.W h o
can tell that we live on the sphere by just looking at a map of London, which, of
course, looks like a part of /CA
2 ?1
1 Strictly speaking the distance between two longitudes in the northern part of the city is slightly


## Page 192

If Ui and Uj overlap, two coordinate systems are assigned to a point in
Ui ∩Uj . Axiom (iv) asserts that the transition from one coordinate system to
another be smooth (C∞).T h em a pϕ i assigns m coordinate values xµ (1≤µ≤
m) to a point p ∈Ui ∩Uj , while ϕ j assigns yν (1 ≤ν ≤m) to the same
point and the transition from y to x, xµ = xµ(y),i sg i v e nb ym functions of m
variables. The coordinate transformation functions xµ = xµ(y) are the explicit
form of the map ψ ji = ϕ j ◦ϕ−1
i . Thus, the differentiability has been deﬁned
in the usual sense of calculus: the coordinate transformation is differentiable if
each function xµ(y) is differentiable with respect to each yν . We may restrict
ourselves to the differentiability up to kth order (Ck ). However, this does not
bring about any interesting conclusions. We simply require, instead, that the
coordinate transformations be inﬁnitely differentiable, that is, of class C∞.N o w
coordinates have been assigned to M in such a way that if we move over M in
whatever fashion, the coordinates we use vary in a smooth manner.
If the union of two atlases {(Ui ,ϕ i )} and{(Vj ,ψ j )} is again an atlas, these
two atlases are said to be compatible. The compatibility is an equivalence
relation, the equivalence class of which is called thedifferentiable structure.I ti s
also said that mutually compatible atlases deﬁne the same differentiable structure
on M.
Before we give examples, we brieﬂy comment on manifolds with
boundaries. So far, we have assumed that the coordinate neighbourhood Ui is
homeomorphic to an open set of /CA
m . In some applications, however, this turns
out to be too restrictive and we need to relax this condition. If a topological space
M is covered by a family of open sets{Ui} each of which is homeomorphic to an
open set of H m ≡{(x1,..., xm )∈/CA
m|xm ≥0}, M is said to be amanifold with
a boundary, see ﬁgure 5.3. The set of points which are mapped to points with
xm = 0i sc a l l e dt h eboundary of M, denoted by ∂ M. The coordinates of ∂ M
may be given by m−1 numbers (x1,..., xm−1, 0). Now we have to be careful
when we deﬁne the smoothness. The map ψ ij : ϕ j (Ui ∩Uj ) →ϕ i (Ui ∩Uj )
is deﬁned on an open set of H m in general, and ψ ij is said to be smooth if it is
C∞in an open set of /CA
m which contains ϕ j (Ui∩Uj ). Readers are encouraged to
use their imagination since our deﬁnition is in harmony with our intuitive notions
about boundaries. For example, the boundary of the solid ball D3 is the sphere S2
and the boundary of the sphere is an empty set.
5.1.3 Examples
We now give several examples to develop our ideas about manifolds. They are
also of great relevance to physics.
Example 5.1. The Euclidean space /CA
m is the most trivial example, where a single
chart covers the whole space and ϕ may be the identity map.
shorter than that in the southern part and one may suspect that one lives on a curved surface. Of
course, it is the other way around if one lives in a city in the southern hemisphere.


## Page 193

Figure 5.3. A manifold with a boundary. The point p is on the boundary.
Example 5.2. Let m = 1 and require that M be connected. There are only two
manifolds possible: a real line /CA and the circle S1. Let us work out an atlas of S1.
For concreteness take the circle x2 + y1 = 1i nt h e xy -plane. We need at least
two charts. We may take them as in ﬁgure 5.4. Deﬁne ϕ−1
1 : (0, 2π) →S1 by
ϕ−1
1 : θ ↦→(cos θ, sin θ) (5.5a)
whose image is S1−{(1, 0)}. Deﬁne also ψ−1
2 : (−π, π) →S1 by
ϕ−1
2 : θ ↦→(cos θ, sin θ) ( 5.5b)
whose image is S1 −{(−1, 0)}. Clearly ϕ−1
1 and ϕ−1
2 are invertible and all the
maps ϕ 1,ϕ 2,ϕ−1
1 and ϕ−1
2 are continuous. Thus, ϕ 1 and ϕ 2 are homeomorphisms.
Verify that the maps ψ 12 = ϕ 1◦ϕ−1
2 and ψ 21 = ϕ 2◦ϕ−1
1 are smooth.
Example 5.3. The n-dimensional sphere Sn is a differentiable manifold. It is
realized in /CA
n+1 as n∑
i=0
(xi )2 = 1. (5.6)
Let us introduce the coordinate neighbourhoods
Ui+ ≡{(x0, x1,..., xn )∈Sn|xi > 0} (5.7a)
Ui−≡{(x0, x1,..., xn )∈Sn|xi < 0}. (5.7b)


## Page 194

Figure 5.4. Two charts of a circle S1.
Deﬁne the coordinate map ϕ i+ : Ui+ →/CA
n by
ϕ i+(x0,..., xn )= (x0,..., xi−1, xi+1,..., xn ) (5.8a)
and ϕ i−: Ui−→/CA
n by
ϕ i−(x0,..., xn )= (x0,..., xi−1, xi+1,..., xn ). ( 5.8b)
Note that the domains of ϕ i+ and ϕ i−are different. ϕ i± are the projections of the
hemispheres Ui± to the plane xi = 0. The transition functions are easily obtained
from (5.8). Take S2 as an example. The coordinate neighbourhoods areUx±, Uy±
and Uz±. The transition function ψ y−x+ ≡ϕ y−◦ϕ−1
x+ is given by
ψ y−x+ : (y, z)↦→
( √
1−y2−z2, z
)
(5.9)
which is inﬁnitely differentiable on Ux+∩Uy−.
Exercise 5.1. At the beginning of this chapter, we introduced the stereographic
coordinates on S2. We may equally deﬁne the stereographic coordinates projected
from points other than the North Pole. For example, the stereographic coordinates
(U, V ) of a point in S2−{South Pole} projected from the South Pole and (X, Y )
for a point in S2−{North Pole} projected from the North Pole are shown in ﬁgure
5.5. Show that the transition functions between (U, V ) and (X, Y ) are C∞and
that they deﬁne a differentiable structure on M. See also example 8.1.
Example 5.4. The real projective space /CA Pn is the set of lines through the origin
in /CA
n+1 .I f x = (x0,..., xn ) ̸= 0, x deﬁnes a line through the origin. Note
that y ∈/CA
n+1 deﬁnes the same line as x if there exists a real number a ̸= 0
such that y = ax . Introduce an equivalence relation ∼by x ∼y if there


## Page 195

Figure 5.5. Two stereographic coordinate systems on S2. The point P may be projected
from the North Pole N giving (X, Y ) or from the South Pole S giving (U, V ).
exists a ∈/CA −{0} such that y = ax .T h e n /CA Pn = (/CA
n+1 −{0})/ ∼.T h e
n+ 1 numbers x0, x1,..., xn are called the homogeneous coordinates .T h e
homogeneous coordinates cannot be a good coordinate system, since /CA Pn is an
n-dimensional manifold (an ( n+ 1)-dimensional space with a one-dimensional
degree of freedom killed). The charts are deﬁned as follows. First we take the
coordinate neighbourhood Ui as the set of lines with xi ̸= 0, and then introduce
the inhomogeneous coordinates on Ui by
ξ j
(i) = x j /xi . (5.10)
The inhomogeneous coordinates
ξ(i) = (ξ 0
(i),ξ 1
(i),...,ξ i−1
(i) ,ξ i+1
(i) ,...,ξ n
(i))
with ξ i
(i) = 1 omitted, are well deﬁned on Ui since xi ̸= 0, and furthermore
they are independent of the choice of the representative of the equivalence class
since x j /xi = y j /yi if y = ax . The inhomogeneous coordinate ξ(i) gives the
coordinate map ϕ i : Ui →/CA
n ,t h a ti s
ϕ i : (x0,..., xn )↦→(x0/xi ,..., xi−1/xi , xi+1/xi ,..., xn /xi )
where xi /xi = 1 is omitted. For x = (x0, x1,..., xn ) ∈Ui ∩Uj we assign
two inhomogeneous coordinates, ξ k
(i) = xk /xi and ξ k
( j ) = xk /x j . The coordinate


## Page 196

transformation ψ ij = ϕ i ◦ϕ−1
j is
ψ ij : ξ k
( j ) ↦→ξ k
(i) = (x j /xi )ξ k
( j ). (5.11)
This is a multiplication by x j /xi .
In example 4.12, we deﬁned /CA Pn as the sphere Sn with antipodal points
identiﬁed. This picture is in conformity with the deﬁnition here. As a
representative of the equivalence class[x], we may take points|x|= 1o nal i n e
through the origin. These are points on the unit sphere. Since there are two points
on the intersection of a line with Sn we have to take one of them consistently,
that is nearby lines are represented by nearby points in Sn. This amounts to
taking the hemisphere. Note, however, that the antipodal points on the boundary
(the equator of Sn) are identiﬁed by deﬁnition, (x0,..., xn ) ∼−(x0,..., xn ).
This ‘hemisphere’ is homeomorphic to the ball Dn with antipodal points on the
boundary Sn−1 identiﬁed.
Example 5.5. A straightforward generalization of /CA Pn is the Grassmann
manifold. An element of /CA Pn is a one-dimensional subspace in /CA
n+1 .T h e
Grassmann manifold Gk,n (/CA ) is the set of k-dimensional planes in /CA
n . Note that
G1,n+1(/CA ) is nothing but /CA Pn . The manifold structure of Gk,n (/CA ) is deﬁned in a
manner similar to that of /CA Pn .
Let Mk,n (/CA ) be the set of k× n matrices of rank k (k ≤n).T a k e A =
(aij )∈Mk,n (/CA ) and deﬁne k vectors ai (1≤i ≤k) in /CA
n by ai = (aij ).S i n c e
rank A= k, k vectors ai are linearly independent and span a k-dimensional plane
in /CA
n . Note, however, that there are inﬁnitely many matrices inMk,n (/CA ) that yield
the same k-plane. Take g∈GL(k, /CA ) and consider a matrix ¯A= gA ∈Mk,n (/CA ).
¯A deﬁnes the same k-plane as A,s i n c eg simply rotates the basis within the k-
plane. Introduce an equivalence relation∼by ¯A∼A if there exists g∈GL(k, /CA )
such that ¯A= gA . We identify Gk,n (/CA ) with the coset space Mk,n (/CA )/GL(k, /CA ).
Let us ﬁnd the charts of Gk,n (/CA ).T a k eA∈Mk,n (/CA ) and let{A1,..., Al},
l=
(n
k
)
, be the collection of all k× k minors of A.S i n c er a n kA= k, there exists
some Aα (1≤α ≤l) such that det A̸= 0. For example, let us assume the minor
A1 made of the ﬁrst k columns has non-vanishing determinant,
A= (A1, ˜A1) (5.12)
where ˜A1 is a k× (n−k) matrix. Let us take the representative of the class to
which A belongs to be
A−1
1 · A= (Ik , A−1
1 · ˜A1) (5.13)
where Ik is the k× k unit matrix. Note that A−1
1 always exists since det A1 ̸= 0.
Thus, the real degrees of freedom are given by the entries of the k× (n−k)
matrix A−1
1 · ˜A1. We denote this subset of Gk,n (/CA ) by U1. U1 is a coordinate
neighbourhood whose coordinates are given by k(n−k) entries of A−1
1 · ˜A1.
Since U1 is homeomorphic to /CA
k(n−k) we ﬁnd that
dim Gk,n (/CA )= k(n−k). (5.14)


## Page 197

In the case where det Aα ̸= 0, where Aα is composed of the columns
(i1, i2,..., ik ), we multiply A−1
α to obtain the representative
column→ i1 i2 ... ik
A−1
α · A =


... 1 ... 0 ...... 0 ...
... 0 ... 1 ...... 0 ...
... . ... . ...... . ...
... 0 ... 0 ...... 1 ...

 (5.15)
where the entries not written explicitly form a k× (n−k) matrix. We denote this
subset of Mk,n (/CA ) with det Aα ̸= 0b y Uα . The entries of the k× (n−k) matrix
are the coordinates of Uα .
The relation between the projective s pace and the Grassmann manifold is
evident. An element of M1,n+1(/CA ) is a vector A = (x0, x1,..., xn ). Since the
α th minor Aα of A is a number xα , the condition det Aα ̸= 0 becomes xα ̸= 0.
The representative (5.15) is just the inhomogeneous coordinate
(xα )−1(x0, x1,..., xα ,..., xn )
= (x0/xα , x1/xα ,..., xα /xα = 1,..., xn /xα ).
Let M be an m-dimensional manifold with an atlas{(Ui ,ϕ i )} and N be an n-
dimensional manifold with{(Vj ,ψ j )}.A product manifold M×N is an (m+n)-
dimensional manifold whose atlas is {(Ui × Vj ), (ϕ i ,ψ j )}. A point in M× N
is written as (p, q), p∈M, q∈N, and the coordinate function (ϕ i ,ψ j ) acts on
(p, q) to yield (ϕ i (p), ψ j (p))∈/CA
m+n . The reader should verify that a product
manifold indeed satisﬁes the axioms of deﬁnition 5.1.
Example 5.6. The torus T 2 is a product manifold of two circles,T 2 = S1× S1.I f
we denote the polar angle of each circle as θi mod 2π( i= 1, 2), the coordinates
of T 2 are (θ1,θ 2). Since each S1 is embedded in /CA
2 , T 2 may be embedded in /CA
4 .
We often imagine T 2 as the surface of a doughnut in /CA
3 , in which case, however,
we inevitably have to introduce bending of the surface. This is an extrinsic feature
brought about by the ‘embedding’. When we say ‘a torus is a ﬂat manifold’, we
refer to the ﬂat surface embedded in /CA
4 . See deﬁnition 5.3 for further details.
We may also consider a direct product of n circles,
T n = S1× S1×···× S1

 
 
n
.
Clearly T n is an n-dimensional manifold with the coordinates (θ1,θ 2,...,θ n )
mod2π . This may be regarded as an n-cube whose opposite faces are identiﬁed,
see ﬁgure 2.4 for n= 2.
5.2 The calculus on manifolds
The signiﬁcance of differentiable manifolds resides in the fact that we may use
the usual calculus developed in/CA
n . Smoothness of the coordinate transformations


## Page 198

f (p) V N
fU
M
p
ψ
ψ( f(p))
ψ o fo ϕ
ϕ(p)
Rm
Rn
ϕ
Figure 5.6. Am a p f : M→N has a coordinate presentation ψ ◦f ◦ϕ−1: /CA
m →/CA
n .
ensures that the calculus is independent of the coordinates chosen.
5.2.1 Differentiable maps
Let f : M → N b eam a pf r o ma n m-dimensional manifold M to an n-
dimensional manifold N. A point p∈M is mapped to a point f (p)∈N, namely
f : p↦→f (p), see ﬁgure 5.6. Take a chart (U,ϕ ) on M and (V,ψ) on N,w h e r e
p∈U and f (p)∈V .T h e nf has the following coordinate presentation:
ψ ◦f ◦ϕ−1 : /CA
m →/CA
n . (5.16)
If we write ϕ( p) ={ xµ} and ψ( f (p)) ={ yα}, ψ ◦f ◦ϕ−1 is just the usual
vector-valued function y = ψ ◦f ◦ϕ−1(x) of m variables. We sometimes use
(in fact, abuse!) the notation y = f (x) or yα = f α (xµ), when we know which
coordinate systems on M and N are in use. If y = ψ ◦f ◦ϕ−1(x),o rs i m p l y
yα = f α (xµ),i s C∞with respect to each xµ, f is said to be differentiable at
p or at x = ϕ( p). Differentiable maps are also said to be smooth. Note that
we require inﬁnite (C∞) differentiability, in harmony with the smoothness of the
transition functions ψ ij .
The differentiability of f is independent of the coordinate system. Consider
two overlapping charts (U1,ϕ 1) and (U2,ϕ 2). Take a point p∈U1∩U2, whose
coordinates by ϕ 1 are {xµ
1}, while those by ϕ 2 are {xν
2}. When expressed in
terms of {xµ
1}, f takes the form ψ ◦f ◦ϕ−1
1 , while in {xν
2}, ψ ◦f ◦ϕ−1
2 =


## Page 199

ψ ◦f ◦ϕ−1
1 (ϕ 1 ◦ϕ−1
2 ). By deﬁnition, ψ 12 = ϕ 1 ◦ϕ−1
2 is C∞.I n t h e s i m p l e r
expressions, they correspond to y = f (x1) and y = f (x1(x2)). It is clear that
if f (x1) is C∞with respect to xµ
1 and x1(x2) is C∞with respect to xν
2 ,t h e n
y= f (x1(x2)) is also C∞with respect to xν
2 .
Exercise 5.2. Show that the differentiability of f is also independent of the chart
in N.
Deﬁnition 5.2. Let f : M→N be a homeomorphism and ψ and ϕ be coordinate
functions as previously deﬁned. If ψ ◦f ◦ϕ−1 is invertible (that is, there exists a
map ϕ ◦f−1◦ψ−1) and both y= ψ ◦f ◦ϕ−1(x) and x = ϕ ◦f−1◦ψ−1(y)
are C∞, f is called a diffeomorphism and M is said to be diffeomorphic to N
and vice versa, denoted by M≡N.
Clearly dim M = dim N if M ≡N. In chapter 2, we noted that
homeomorphisms classify spaces accordin g to whether it is possible to deform
one space into another continuously. Diffeomorphisms classify spaces into
equivalence classes according to whether it is possible to deform one space to
another smoothly. Two diffeomorphic spaces are regarded as the same manifold.
Clearly a diffeomorphism is a homeomorphism. What about the converse? Is
a homeomorphism a diffeomorphism? In the previous section, we deﬁned the
differentiable structure as an equivalence class of atlases. Is it possible for a
topological space to carry many differentiable structures? It is rather difﬁcult
to give examples of ‘diffeomorphically inequivalent homeomorphisms’ since it is
known that this is possible only in h igher-dimensional spaces (dim M ≥4). It
was believed before 1956 that a topological space admits only one differentiable
structure. However, Milnor (1956) pointed out that S
7 admits 28 differentiable
structures. A recent striking discovery in mathematics is that/CA
4 admits an inﬁnite
number of differentiable structures. Interested readers should consult Donaldson
(1983) and Freed and Uhlenbeck (1984). Here we assume that a manifold admits
a unique differentiable structure, for simplicity.
The set of diffeomorphisms f : M →M is a group denoted by Diff (M).
Take a point p in a chart (U,ϕ ) such that ϕ( p)= xµ(p). Under f ∈Diff(M),
p is mapped to f (p) whose coordinates are ϕ( f (p)) = yµ( f (p)) (we have
assumed f (p)∈U). Clearly y is a differentiable function of x;t h i si sa nactive
point of view to the coordinate transformation. However, if(U,ϕ ) and (V,ψ) are
overlapping charts, we have two coordinate valuesxµ = ϕ( p) and yµ = ψ( p) for
a point p∈U∩V .T h em a px↦→y is differentiable by the assumed smoothness
of the manifold; this reparametrization is apassive point of view to the coordinate
transformation. We also denote the group of reparametrizations by Diff(M).
Now we look at special classes of mappings, namely curves and functions.
An open curve in an m-dimensional manifold M is a map c: (a, b)→M where
(a, b) is an open interval such that a < 0 < b. We assume that the curve does
not intersect with itself (ﬁgure 5.7). The number a (b) may be −∞(+∞) and
we have included 0 in the interval for later convenience. If a curve is closed, it is


## Page 200

c
b
a
M
U c(t)
ϕ ο c
Rm
ϕ
Figure 5.7. Ac u r v ec in M and its coordinate presentation ϕ ◦c.
regarded as a map c: S1 →M. In both cases, c is locally a map from an open
interval to M. On a chart (U,ϕ ) ,ac u r v ec(t) has the coordinate presentation
x= ϕ ◦c: /CA →/CA
m .
A function f on M is a smooth map from M to /CA , see ﬁgure 5.8. On a chart
(U,ϕ ) , the coordinate presentation of f is given by f ◦ϕ−1 : /CA
m →/CA which is
a real-valued function of m variables. We denote the set of smooth functions on
M by /BY (M).
5.2.2 Vectors
Now that we have deﬁned maps on a manifold, we are ready to deﬁne other
geometrical objects: vectors, dual vectors and tensors. In general, an elementary
picture of a vector as an arrow connecting a point and the origin does not work in
a manifold. [Where is the origin? What is a straight arrow? How do we deﬁne a
straight arrow that connects London and Los Angeles on thesurface of the Earth?]
On a manifold, a vector is deﬁned to be a tangent vector to a curve in M.
To begin with, let us look at a tangent line to a curve in the xy -plane. If the
curve is differentiable, we may approximate the curve in the vicinity of x0 by
y−y(x0)= a(x−x0) (5.17)
where a = dy/dx|x=x0. The tangent vectors on a manifold M generalize this
tangent line. To deﬁne a tangent vector we need a curve c : (a, b) →M and
a function f : M →/CA ,w h e r e(a, b) is an open interval containing t = 0, see
ﬁgure 5.9. We deﬁne the tangent vector at c(0) as a directional derivative of a
function f (c(t)) along the curve c(t) at t = 0. The rate of change of f (c(t)) at


## Page 201

M
U
p
Rm
x
f
f ο ϕ−1
f (p)=f ο ϕ−1(x)
ϕ
R
Figure 5.8. A function f : M→/CA and its coordinate presentation f ◦ϕ−1.
t= 0 along the curve is
d f (c(t))
dt
⏐⏐
⏐
⏐
t=0
. (5.18)
In terms of the local coordinate, this becomes
∂ f
∂ xµ
dxµ(c(t))
dt
⏐
⏐
⏐
⏐
t=0
. (5.19)
[Note the abuse of the notation! The derivative ∂ f /∂ xµ really means ∂( f ◦
ϕ−1(x))/∂ xµ.] In other words, d f (c(t))/dt at t = 0 is obtained by applying
the differential operator X to f ,w h e r e
X= Xµ
( ∂
∂ xµ
)(
X µ = dxµ(c(t))
dt
⏐
⏐
⏐⏐
t=0
)
(5.20)
that is,
d f (c(t))
dt
⏐⏐
⏐
⏐
t=0
= Xµ
( ∂ f
∂ xµ
)
≡X[ f]. (5.21)
Here the last equality deﬁnes X[ f].I ti s X = Xµ∂/∂ xµ which we now deﬁne as
the tangent vector to M at p= c(0) along the direction given by the curve c(t).
Example 5.7. If X is applied to the coordinate functions ϕ( c(t)) = xµ(t),w e
have
X[xµ]=
( dxν
dt
)( ∂ xµ
∂ xν
)
= dxµ(t)
dt
⏐
⏐
⏐⏐
t=0


## Page 202

b R
f
a
0 c
ϕ ο c f ο ϕ−1
MX
c(0)c(t)
x
ϕ
Rm
Figure 5.9. Ac u r v ec and a function f deﬁne a tangent vector along the curve in terms of
the directional derivative.
which is the µth component of the velocity vector if t is understood as time.
To be more mathematical, we introduce an equivalence class of curves inM.
If two curves c1(t) and c2(t) satisfy
(i) c1(0)= c2(0)= p
(ii) dxµ(c1(t))
dt
⏐⏐
⏐
⏐
t=0
= dxµ(c2(t))
dt
⏐
⏐
⏐
⏐
t=0
c1(t) and c2(t) yield the same differential operatorX at p, in which case we deﬁne
c1(t)∼c2(t). Clearly ∼is an equivalence relation and deﬁnes the equivalence
classes. We identify the tangent vector X with the equivalence class of curves
[c(t)]=
{
˜c(t)
⏐⏐⏐⏐˜c(0)= c(0) and dx µ(˜c(t))
dt
⏐⏐⏐⏐
t=0
= dxµ(c(t))
dt
⏐
⏐⏐⏐
t=0
}
(5.22)
rather than a curve itself.
All the equivalence classes of curves at p ∈M, namely all the tangent
vectors at p, form a vector space called the tangent space of M at p, denoted
by Tp M.T oa n a l y s eTp M, we may use the theory of vector spaces developed in
section 2.2. Evidently, eµ = ∂/∂ xµ (1≤µ≤m) are the basis vectors of Tp M,
see (5.20), and dim Tp M = dim M. The basis {eµ} is called the coordinate
basis. If a vector V ∈Tp M is written as V = V µeµ, the numbers V µ are called
the components of V with respect to eµ. By construction, it is obvious that a
vector X exists without specifying the coordinate, see (5.21). The assignment of


## Page 203

the coordinate is simply for our convenience. This coordinate independence of
a vector enables us to ﬁnd the transformation property of the components of the
vector. Let p∈Ui∩Uj and x= ϕ i (p), y= ϕ j (p). We have two expressions for
X∈Tp M,
X= Xµ ∂
∂ xµ = ˜Xµ ∂
∂ yµ .
This shows that Xµ and ˜Xµ are related as
˜Xµ = Xν ∂ yµ
∂ xν . (5.23)
Note again that the components of the vector transform in such a way that the
vector itself is left invariant.
The basis of Tp M need not be {eµ}, and we may think of the linear
combinations ˆei ≡Ai µeµ,w h e r eA = (Ai µ) ∈GL(m, /CA ). The basis {ˆei} is
known as the non-coordinate basis.
5.2.3 One-forms
Since Tp M is a vector space, there exists a dual vector space to Tp M, whose
element is a linear function from Tp M to /CA , see section 2.2. The dual space is
called the cotangent space at p, denoted by T∗
p M.A ne l e m e n tω : Tp M→/CA of
T∗
p M is called a dual vector, cotangent vector or, in the context of differential
forms, a one-form. The simplest example of a one-form is the differential d f of
a function f ∈/BY (M). The action of a vector V on f is V[ f]= V µ∂ f /∂ xµ ∈/CA .
Then the action of d f ∈T∗
p M on V ∈Tp M is deﬁned by
⟨d f, V⟩≡V[ f]= V µ ∂ f
∂ xµ ∈/CA . (5.24)
Clearly⟨d f, V⟩ is /CA -linear in both V and f .
Noting that d f is expressed in terms of the coordinate x = ϕ( p) as
d f = (∂ f /∂ xµ)dxµ, it is natural to regard {dxµ} as a basis of T∗
p M. Moreover,
this is a dual basis, since
⟨
dxµ, ∂
∂ xµ
⟩
= ∂ xν
∂ xµ = δν
µ. (5.25)
An arbitrary one-form ω is written as
ω = ω µ dxµ (5.26)
where the ω µ are the components of ω . Take a vector V = V µ∂/∂ xµ and a one-
form ω = ω µdxµ.T h e inner product⟨ , ⟩: T∗
p M× Tp M →/CA is deﬁned
by
⟨ω, V⟩= ω µV ν
⟨
dxµ, ∂
∂ xν
⟩
= ω µV ν δµ
ν = ω µV µ. (5.27)


## Page 204

Note that the inner product is deﬁned between a vector and a dual vector and not
between two vectors or two dual vectors.
Since ω is deﬁned without reference to any coordinate system, for a point
p∈Ui ∩Uj ,w eh a v e
ω = ω µdxµ = ˜ω ν dyν
where x= ϕ i (p) and y= ϕ j (p).F r o mdyν = (∂ yν /∂ xµ)dxµ we ﬁnd that
˜ω ν = ω µ
∂ xµ
∂ yν . (5.28)
5.2.4 Tensors
A tensor of type (q, r ) is a multilinear object which mapsq elements of T∗
p M and
r elements of Tp M to a real number./CC
q
r,p(M) denotes the set of type(q, r ) tensors
at p∈M. An element of /CC
q
r,p(M) is written in terms of the bases described earlier
as
T = T µ1...µq ν1...νr
∂
∂ xµ1
... ∂
∂ xµq dxν1 ... dxνr . (5.29)
Clearly this is a linear function from
⊗q T∗
p M⊗r Tp M
to /CA .L e t Vi = V µ
i ∂/∂ xµ (1≤i≤r ) and ω i = ω iµdxµ (1≤i≤q). The action
of T on them yields a number
T (ω 1,...,ω q; V1,..., Vr )= T µ1 ...µq ν1...νr ω 1µ1 ...ω qµq V ν1
1 ... V νr
r .
In the present notation, the inner product is⟨ω, X⟩= ω( X).
5.2.5 Tensor ﬁelds
If a vector is assigned smoothly to each point of M, it is called a vector ﬁeld
over M.I n o t h e r w o r d s ,V is a vector ﬁeld if V[ f]∈
/BY (M) for any f ∈/BY (M).
Clearly each component of a vector ﬁeld is a smooth function from M to /CA .T h e
set of the vector ﬁelds on M is denoted as /CG (M). A vector ﬁeld X at p ∈M
is denoted by X|p, which is an element of Tp M. Similarly, we deﬁne a tensor
ﬁeld of type (q, r ) by a smooth assignment of an element of /CC
q
r,p(M) at each
point p ∈M. The set of the tensor ﬁelds of type (q, r ) on M is denoted by
/CC
q
r (M). For example, /CC
0
1(M) is the set of the dual vector ﬁelds, which is also
denoted by /Omega11(M) in the context of differential forms, see section 5.4. Similarly,
/CC
0
0(M)= /BY (M) is denoted by /Omega10(M) in the same context.


## Page 205

b R
f
a
c
M
g
N
p=c(0)c(t) f ο c(t)
f(p)
f∗
f∗ X
Tp M Tf (p) N
X
Figure 5.10. Am a p f : M→N induces the differential map f∗: Tp M→T f (p) N.
5.2.6 Induced maps
A smooth map f : M →N naturally induces a map f∗called the differential
map (ﬁgure 5.10),
f∗: Tp M→Tf (p) N. (5.30)
The explicit form of f∗is obtained by the deﬁnition of a tangent vector as a
directional derivative along a curve. If g∈/BY (N),t h e ng◦f ∈/BY (M). A vector
V ∈Tp M acts on g◦f to give a numberV[g◦f].N o ww ed e ﬁ n ef∗V ∈T f (p) N
by
( f∗V )[g]≡V[g◦f] (5.31)
or, in terms of charts (U,ϕ ) on M and (V.ψ) on N,
( f∗V )[g◦ψ−1(y)]≡V[g◦f ◦ϕ−1(x)] (5.32)
where x = ϕ( p) and y= ψ( f (p)).L e t V = V µ∂/∂ xµ and f∗V = W α ∂/∂ yα .
Then (5.32) yields
W α ∂
∂ yα [g◦ψ−1(y)]= V µ ∂
∂ xµ[g◦f ◦ϕ−1(x)].
If we take g= yα , we obtain the relation between W α and V µ,
W α = V µ ∂
∂ xµ yα (x). (5.33)
Note that the matrix (∂ yα /∂ xµ) is nothing but the Jacobian of the map f :
M →N. The differential map f∗is naturally extended to tensors of type (q, 0),
f∗: /CC
q
0,p(M)→/CC
q
0, f (p)
(N).
Example 5.8. Let (x1, x2) and (y1, y2, y3) be the coordinates in M and N,
respectively, and let V = a∂/∂ x1 + b∂/∂ x2 be a tangent vector at (x1, x2).


## Page 206

Let f : M → N be a map whose coordinate presentation is y =
(x1, x2,
√
1−(x1)2−(x2)2).T h e n
f∗V = V µ ∂ yα
∂ xµ
∂
∂ yα = a ∂
∂ y1 + b ∂
∂ y2 −
(
a y1
y3 + b y2
y3
)
∂
∂ y3 .
Exercise 5.3. Let f : M→N and g: N→P. Show that the differential map of
the composite map g◦f : M→P is
(g◦f )∗= g∗◦f∗. (5.34)
Am a p f : M→N also induces a map
f∗: T∗
f (p) N→T∗
p M. (5.35)
Note that f∗goes in the same direction as f , while f∗goes backward, hence
the name pullback, see section 2.2. If we take V ∈Tp M and ω ∈T∗
f (p) N,t h e
pullback of ω by f∗is deﬁned by
⟨ f∗ω, V⟩=⟨ ω, f∗V⟩. (5.36)
The pullback f∗naturally extends to tensors of type (0, r ), f∗: /CC
0
r, f (p)(N)→
/CC
0
r,p (M). The component expression of f∗is given by the Jacobian matrix
(∂ yα /∂ xµ), see exercise 5.4.
Exercise 5.4. Let f : M →N be a smooth map. Show that for ω = ω α dyα ∈
T∗
f (p) N, the induced one-form f∗ω = ξµ dxµ ∈T∗
p M has components
ξµ = ω α
∂ yα
∂ xµ . (5.37)
Exercise 5.5. Let f and g be as in exercise 5.3. Show that the pullback of the
composite map g◦f is
(g◦f )∗= f∗◦g∗. (5.38)
There is no natural extension of the induced map for a tensor of mixed type.
The extension is only possible if f : M →N is a diffeomorphism, where the
Jacobian of f−1 is also deﬁned.
Exercise 5.6. Let
T µν
∂
∂ xµ ⊗dxν
be a tensor ﬁeld of type (1, 1) on M and let f : M →N be a diffeomorphism.
Show that the induced tensor on N is
f∗
(
T µν
∂
∂ xµ ⊗dxν
)
= T µν
( ∂ yα
∂ xµ
)( ∂ xν
∂ yβ
) ∂
∂ yα ⊗dyβ
where xµ and yα are local coordinates in M and N, respectively.


## Page 207

Figure 5.11. (a) An immersion f which is not an embedding. (b) An embedding g and
the submanifold g(S1).
5.2.7 Submanifolds
Before we close this section, we deﬁne a submanifold of a manifold. The meaning
of embedding is also clariﬁed here.
Deﬁnition 5.3. (Immersion, submanifold, embedding )L e t f : M →N be a
smooth map and let dim M≤dim N.
(a) The map f is called an immersion of M into N if f∗: Tp M →T f (p) N
is an injection (one to one), that is rank f∗= dim M.
(b) The map f is called an embedding if f is an injection and an immersion.
The image f (M) is called a submanifold of N. [In practice, f (M) thus
deﬁned is diffeomorphic to M.]
If f is an immersion, f∗maps Tp M isomorphically to an m-dimensional
vector subspace of Tf (p) N since rank f∗= dim M. From theorem 2.1, we also
ﬁnd ker f∗={ 0}.I f f is an embedding, M is diffeomorphic to f (M).E x a m p l e s
will clarify these rather technical points. Consider a map f : S1 →/CA
2 in ﬁgure
5.11(a). It is an immersion since a one-dimensional tangent space ofS1 is mapped
by f∗to a subspace ofT f (p)
/CA
2 .T h ei m a g ef (S1) is not a submanifold of/CA
2 since
f is not an injection. The mapg: S1 →/CA
2 in ﬁgure 5.11(b) is an embedding and
g(S1) is a submanifold of /CA
2 . Clearly, an embedding is an immersion although
the converse is not necessarily true. In the previous section, we occasionally
mentioned the embedding of Sn into /CA
n+1 . Now this meaning is clear; if Sn is
embedded by f : Sn →/CA
n+1 then Sn is diffeomorphic to f (Sn ).
5.3 Flows and Lie derivatives
Let X be a vector ﬁeld in M. An integral curve x(t) of X is a curve in M, whose
tangent vector at x(t) is X|x .G i v e nac h a r t(U,ϕ ) , this means
dxµ
dt = X µ(x(t)) (5.39)


## Page 208

where xµ(t) is the µth component of ϕ( x(t)) and X= X µ∂/∂ xµ. Note the abuse
of the notation: x is used to denote a point in M as well as its coordinates. [For
later convenience we assume the point x(0) is included in U.] Put in another
way, ﬁnding the integral curve of a vector ﬁeld X is equivalent to solving the
autonomous system of ordinary differential equations (ODEs) (5.39). The initial
condition xµ
0 = xµ(0) corresponds to the coordinates of an integral curve att= 0.
The existence and uniqueness theorem of ODEs guarantees that there is a unique
solution to (5.39), at least locally, with the initial data xµ
0 . It may happen that
the integral curve is deﬁned only on a subset of /CA , in which case we have to
pay attention so that the parameter t does not exceed the given interval. In the
following we assume that t is maximally extended. It is known that if M is a
compact manifold, the integral curve exists for all t∈/CA .
Let σ( t, x0) be an integral curve of X which passes a point x0 at t = 0a n d
denote the coordinate by σ µ(t, x0). Equation (5.39) then becomes
d
dt σ µ(t, x0)= X µ(σ (t, x0)) (5.40a)
with the initial condition
σ µ(0, x0)= xµ
0 .( 5.40b)
The map σ : /CA × M→M is called a ﬂow generated by X∈/CG (M).Aﬂ o w
satisﬁes the rule
σ( t,σ µ(s, x0))= σ( t+ s, x0) (5.41)
for any s, t∈/CA such that both sides of (5.41) make sense. This can be seen from
the uniqueness of ODEs. In fact, we note that
d
dt σ µ(t,σ µ(s, x0))= Xµ(σ (t,σ µ(s, x0)))
σ( 0,σ( s, x0))= σ( s, x0)
and
d
dt σ µ(t+ s, x0)= d
d(t+ s) σ µ(t+ s, x0)= X µ(σ (t+ s, x0))
σ( 0+ s, x0)= σ( s, x0).
Thus, both sides of (5.41) satisfy the same ODE and the same initial condition.
From the uniqueness of the solution, they should be the same. We have obtained
the following theorem.
Theorem 5.1. For any pointx∈M, there exists a differentiable mapσ : /CA ×M →
M such that
(i) σ( 0, x)= x;
(ii) t↦→σ( t, x) is a solution of (5.40a) and (5.40b); and


## Page 209

(iii) σ( t,σ µ(s, x))= σ( t+ s, x).
[Note: We denote the initial point by x instead of x0 to emphasize that σ is a map
/CA × M→M.]
We may imagine a ﬂow as a (steady) stream ﬂow. If a particle is observed at
a point x at t= 0, it will be found at σ( t, x) at later time t.
Example 5.9. Let M = /CA
2 and let X ((x, y)) =−y∂/∂ x+ x∂/∂ y be a vector
ﬁeld in M. It is easy to verify that
σ( t,( x, y))= (x cos t−y sin t, x sin t+ y cos t)
is a ﬂow generated by X. The ﬂow through (x, y) is a circle whose centre is at
the origin. Clearly, σ( t,( x, y))= (x, y) if t = 2nπ, n ∈/CI .I f (x, y)= (0, 0),
the ﬂow stays at (0, 0).
Exercise 5.7. Let M = /CA
2 ,a n dl e tX = y∂/∂ x+ x∂/∂ y be a vector ﬁeld in M.
Find the ﬂow generated by X.
5.3.1 One-parameter group of transformations
For ﬁxed t ∈/CA ,aﬂ o w σ( t, x) is a diffeomorphism from M to M, denoted by
σ t : M→M. It is important to note that σ t is made into a commutative group by
the following rules.
(i) σ t (σ s (x))= σ t+s (x),t h a ti s ,σ t ◦σ s = σ t+s;
(ii) σ 0 = the identity map (= unit element); and
(iii) σ−t = (σ t )−1.
This group is called the one-parameter group of transformations .T h e
group locally looks like the additive group /CA , although it may not be isomorphic
to /CA globally. In fact, in example 5.9, σ 2π n+t was the same map as σ t and we ﬁnd
that the one-parameter group is isomorphic to SO (2), the multiplicative group of
2× 2 real matrices of the form
( cos θ −sin θ
sin θ cos θ
)
or U(1), the multiplicative group of complex numbers of unit modulus eiθ .
Under the action of σ ε , with an inﬁnitesimal ε, we ﬁnd from (5.40a) and
(5.40b) that a point x whose coordinate is xµ is mapped to
σ µ
ε (x)= σ µ(ε, x)= xµ+ ε Xµ(x). (5.42)
The vector ﬁeld X is called, in this context, the inﬁnitesimal generator of the
transformation σ t .


## Page 210

Given a vector ﬁeld X, the corresponding ﬂow σ is often referred to as the
exponentiation of X and is denoted by
σ µ(t, x)= exp(tX )x µ. (5.43)
The name ‘exponentiation’ is justiﬁed as we shall see now. Let us take a parameter
t and evaluate the coordinate of a point which is separated from the initial point
x = σ( 0, x) by the parameter distance t along the ﬂow σ . The coordinate
corresponding to the point σ( t, x) is
σ µ(t, x)= xµ+ t d
ds σ µ(s, x)
⏐⏐
⏐
⏐
s=0
+ t2
2!
( d
ds
) 2
σ µ(s, x)
⏐⏐⏐
⏐
⏐
s=0
+···
=
[
1+ t d
ds+ t2
2!
( d
ds
) 2
+···
]
σ µ(s, x)
⏐
⏐
⏐⏐⏐
s=0
≡exp
(
t d
ds
)
σ µ(s, x)
⏐
⏐
⏐
⏐
s=0
. (5.44)
The last expression can also be written as σ µ(t, x) = exp(tX )x µ, as in (5.43).
The ﬂow σ satisﬁes the following exponential properties.
(i)σ ( 0, x)= x= exp(0X)x (5.45a)
(ii) dσ( t, x)
dt = X exp(tX )x= d
dt[exp(tX )x] (5.45b)
(iii)σ ( t,σ( s, x))= σ( t, exp(sX )x)= exp(tX ) exp(sX )x
= exp{(t+ s)X}x= σ( t+ s, x). (5.45c)
5.3.2 Lie derivatives
Let σ( t, x) and τ( t, x) be two ﬂows generated by the vector ﬁelds X and Y ,
dσ µ(s, x)
ds =Xµ(σ (s, x)) (5.46a)
dτ µ(t, x)
dt =Y µ(τ (t, x)). (5.46b)
Let us evaluate the change of the vector ﬁeldY along σ( s, x). To do this, we have
to compare the vector Y at a point x with that at a nearby point x′ = σ ε (x),
see ﬁgure 5.12. However, we cannot simply take the difference between the
components of Y at two points since they belong to different tangent spaces
Tp M and Tσ ε (x) M; the naive difference between vectors at different points is
ill deﬁned. To deﬁne a sensibl e derivative, we ﬁrst map Y|σ ε (x) to Tx M by
(σ−ε )∗: Tσ ε (x)M→Tx M, after which we take a difference between two vectors
(σ−ε )∗Y|σ ε (x) and Y|x , both of which are vectors in Tx M.T h eLie derivative of
a vector ﬁeld Y along the ﬂow σ of X is deﬁned by
/C4
X Y = lim
ε→0
1
ε[(σ−ε )∗Y|σ ε (x)−Y|x]. (5.47)


## Page 211

Figure 5.12. To compare a vector Y|x with Y|σ ε (x), the latter must be transported back to
x by the differential map (σ−ε )∗.
Exercise 5.8. Show that /C4
X Y is also written as
/C4
X Y = lim
ε→0
1
ε[Y|x −(σ ε )∗Y|σ−ε (x)]
= lim
ε→0
1
ε[Y|σ ε (x)−(σ ε )∗Y|x].
Let (U,ϕ ) be a chart with the coordinates x and let X= X µ∂/∂ xµ and
Y = Y µ∂/∂ xµ be vector ﬁelds deﬁned on U.T h e n σ ε (x) has the coordinates
xµ+ ε Xµ(x) and
Y|σ ε (x) = Y µ(xν + ε Xν (x))eµ|x+ε X
≃[ Y µ(x)+ ε Xµ(x)∂ν Y µ(x)]eµ|x+ε X
where{eµ}={ ∂/∂ xµ} is the coordinate basis and ∂ν ≡∂/∂ xν . If we map this
vector deﬁned at σ ε (x) to x by (σ−ε )∗, we obtain
[Y µ(x)+ ε Xλ (x)∂λ Y µ(x)]∂µ[xν −ε Xν (x)]eν|x
=[ Y µ(x)+ ε Xλ (x)∂λ Y µ(x)][δν
µ−ε∂ µ Xν (x)]eν|x
= Y µ(x)eµ|x + ε[Xµ(x)∂µY ν (x)−Y µ(x)∂µ Xν (x)]eν|x + O(ε2).
(5.48)
From (5.47) and (5.48), we ﬁnd that
/C4
X Y = (Xµ∂µY ν −Y µ∂µ Xν )eν . (5.49a)


## Page 212

Exercise 5.9. Let X = Xµ∂/∂ xµ and Y = Y µ∂/∂ xµ be vector ﬁelds in M.
Deﬁne the Lie bracket[X, Y] by
[X, Y] f = X[Y[ f]]−Y[X[ f]] (5.50)
where f ∈/BY (M). Show that[X, Y] is a vector ﬁeld given by
(Xµ∂µY ν −Y µ∂µ Xν )eν .
This exercise shows that the Lie derivative ofY along X is
/C4
X Y =[ X, Y].( 5.49b)
[Remarks: Note that neither XY nor YX is a vector ﬁeld since they are second-
order derivatives. The combination[X, Y] is, however, a ﬁrst-order derivative and
indeed a vector ﬁeld.]
Exercise 5.10. Show that the Lie bracket satisﬁes
(a) bilinearity
[X, c1Y1+ c2Y2] = c1[X, Y1]+ c2[X, Y2]
[c1 X1+ c2 X2, Y ] = c1[X1, Y]+ c2[X2, Y]
for any constants c1 and c2,
(b) skew-symmetry
[X, Y]=−[YX]
(c) the Jacobi identity
[[X, Y], Z]+[[ Z , X], Y]+[[ Y, Z], X]= 0.
Exercise 5.11. (a) Let X, Y ∈/CG (M) and f ∈/BY (M). Show that
/C4
fX Y = f[X, Y]−Y[ f]X (5.51a)
/C4
X ( fY )= f[X, Y]+ X[ f]Y. (5.51b)
(b) Let X, Y ∈/CG (M) and f : M→N. Show that
f∗[X, Y]=[ f∗X, f∗Y]. (5.52)
Geometrically, the Lie bracket shows the non-commutativity of two ﬂows.
This is easily observed from the following consideration. Let σ( s, x) and τ( t, x)
be two ﬂows generated by vector ﬁelds X and Y , as before, see ﬁgure 5.13. If we
move by a small parameter distance ε along the ﬂow σ ﬁrst, then by δ along τ ,
we shall be at the point whose coordinates are
τ µ(δ, σ (ε, x))≃ τ µ(δ, xν + ε Xν (x))
≃ xµ+ ε Xµ(x)+ δY µ(xν + ε Xν (x))
≃ xµ+ ε Xµ(x)+ δY µ(x)+ εδ Xν (x)∂ν Y ν (x).


## Page 213

Figure 5.13. A Lie bracket[X, Y] measures the failure of the closure of the parallelogram.
If, however, we move byδ along τ ﬁrst, then by ε along σ , we will be at the point
σ µ(ε, τ (δ, x))≃ σ µ(ε, xν + δY ν (x))
≃ xµ+ δY µ(x)+ ε Xµ(xν + δY ν (x))
≃ xµ+ δY µ(x)+ ε Xµ(x)+ εδ Y ν (x)∂ν Xµ(x).
The difference between the coordinates of these two points is proportional to the
Lie bracket,
τ µ(δ, σ (ε, x))−σ µ(ε, τ (δ, x))= εδ[X, Y]µ.
The Lie bracket of X and Y measures the failure of the closure of the
parallelogram in ﬁgure 5.13. It is easy to see /C4
X Y =[ X, Y]= 0 if and only
if
σ( s,τ( t, x))= τ( t,σ( s, x)). (5.53)
We may also deﬁne the Lie derivative of a one-form ω ∈/Omega11(M) along
X∈/CG (M) by
/C4
X ω ≡lim
ε→0
1
ε[(σ ε )∗ω|σ ε (x)−ω|x] (5.54)
where ω|x ∈T∗
x M is ω at x.P u t ω = ω µdxµ. Repeating a similar analysis as
before, we obtain
(σ ε )∗ω|σ ε (x) = ω µ(x) dxµ+ ε[Xν (x)∂ν ω µ(x)+ ∂µ Xν (x)ω ν (x)] dxµ
which leads to
/C4
X ω = (Xν ∂ν ω µ+ ∂µ Xν ω ν ) dxµ. (5.55)
Clearly /C4
X ω ∈T∗
x (M), since it is a difference of two one-forms at the same point
x.


## Page 214

The Lie derivative of f ∈/BY (M) along a ﬂow σ s generated by a vector ﬁeld
X is
/C4
X f ≡lim
ε→0
1
ε[ f (σ ε (x))−f (x)]
= lim
ε→0
1
ε[ f (xµ+ ε Xµ(x))−f (xµ)]
= Xµ(x) ∂ f
∂ xµ = X[ f] (5.56)
which is the usual directional derivative of f along X.
The Lie derivative of a general tensor is obtained from the following
proposition.
Proposition 5.1. The Lie derivative satisﬁes
/C4
X (t1+ t2)= /C4
X t1+ /C4
X t2 (5.57a)
where t1 and t2 are tensor ﬁelds of the same type and
/C4
X (t1⊗t2)= (/C4
X t1)⊗t2+ t1⊗(/C4
X t2)( 5.57b)
where t1 and t2 are tensor ﬁelds of arbitrary types.
Proof. (a) is obvious. Rather than giving the general proof of (b), which is full
of indices, we give an example whose extension to more general cases is trivial.
Take Y ∈/CG (M) and ω ∈/Omega11(M) and construct the tensor product Y⊗ω .T h e n
(Y⊗ω)|σ ε (x) is mapped onto a tensor at x by the action of (σ−ε )∗⊗(σ ε )∗:
[(σ−ε )∗⊗(σ ε )∗](Y⊗ω)|σ ε (x) =[ (σ−ε )∗Y⊗(σ ε )∗ω]|x .
Then there follows (the Leibnitz rule):
/C4
X (Y⊗ω) = lim
ε→0
1
ε[{(σ−ε )∗Y⊗(σ ε )∗ω}|x −(Y⊗ω)|x]
= lim
ε→0
1
ε[(σ−ε )∗Y⊗{(σ ε )∗ω −ω}+{ (σ−ε )∗Y−Y}⊗ω]
= Y⊗(/C4
X ω) + (/C4
X Y )⊗ω.
Extensions to more general cases are obvious. /A3
This proposition enables us to calculate the Lie derivative of a general tensor
ﬁeld. For example, let t= tµν dxµ⊗eν ∈/CC
1
1(M). Proposition 5.1 gives
/C4
X t= X[tµν] dxµ⊗eν + tµν (/C4
X dxµ)⊗eν + tµν dxµ⊗(/C4
X eν ).
Exercise 5.12. Let t be a tensor ﬁeld. Show that
/C4
[X,Y]t= /C4
X
/C4
Y t−/C4
Y
/C4
X t. (5.58)


## Page 215

5.4 Differential forms
Before we deﬁne differential forms, we examine the symmetry property of
tensors. The symmetry operation on a tensor ω ∈/CC
0
r,p (M) is deﬁned by
Pω( V1,..., Vr )≡ω( VP(1),..., VP(r)) (5.59)
where Vi ∈Tp M and P is an element of Sr ,t h e symmetric group of order r.
Take the coordinate basis{eµ}={ ∂/∂ xµ}. The component of ω in this basis is
ω( eµ1 , eµ2 ,..., eµr )= ω µ1µ2 ...µr .
The component of Pω is obtained from (5.59) as
Pω( eµ1 , eµ2 ,..., eµr )= ω µP(1) µP(2)...µP(r) .
For a general tensor of type (q, r ), the symmetry operations are deﬁned for q
indices and r indices separately.
For ω ∈/CC
0
r,p(M),t h esymmetrizer /CB is deﬁned by
/CB ω = 1
r!
∑
P∈Sr
Pω (5.60)
while the anti-symmetrizer /BT is
/BT ω = 1
r!
∑
P∈Sr
sgn(P)Pω (5.61)
where sgn(P)=+ 1 for even permutations and −1 for odd permutations. /CB ω is
totally symmetric (that is, P/CB ω = /CB ω for any P ∈Sr )a n d /BT ω is totally anti-
symmetric (P/BT ω = sgn(P)/BT ω ).
5.4.1 Deﬁnitions
Deﬁnition 5.4. A differential form of order r or an r-form is a totally anti-
symmetric tensor of type (0, r ).
Let us deﬁne the wedge product ∧of r one-forms by the totally anti-
symmetric tensor product
dxµ1∧dxµ2∧... ∧dxµr =
∑
P∈Sr
sgn(P) dxµP(1)∧dxµP(2)∧... ∧dxµP(r) . (5.62)
For example,
dxµ∧dxν = dxµ⊗dxν −dxν ⊗dxµ
dxλ ∧dxµ∧dxν = dxλ ⊗dxµ⊗dxν + dxν ⊗dxλ ⊗dxµ
+ dxµ⊗dxν ⊗dxλ −dxλ ⊗dxν ⊗dxµ
−dxν ⊗dxµ⊗dxλ −dxµ⊗dxλ ⊗dxν .


## Page 216

It is readily veriﬁed that the wedge product satisﬁes the following.
(i) d xµ1 ∧... ∧dxµr = 0 if some index µ appears at least twice.
(ii) d xµ1 ∧... ∧dxµr = sgn(P) dxµP(1) ∧... ∧dxµP(r) .
(iii) d xµ1 ∧... ∧dxµr is linear in each dxµ.
If we denote the vector space of r-forms at p ∈M by /Omega1r
p (M),t h es e to f
r-forms (5.62) forms a basis of /Omega1r
p(M) a n da ne l e m e n tω ∈/Omega1r
p (M) is expanded
as
ω = 1
r! ω µ1 µ2...µr dxµ1 ∧dxµ2 ∧... ∧dxµr (5.63)
where ω µ1 µ2...µr are taken totally anti-symmetric , reﬂecting the anti-symmetry
of the basis. For example, the components of any second-rank tensor ω µν are
decomposed into the symmetric part σ µν and the anti-symmetric part α µν :
σ µν =ω (µν) ≡1
2 (ω µν + ω νµ ) (5.64a)
α µν =ω[µν] ≡1
2 (ω µν −ω νµ ). (5.64b)
Observe that σ µν dxµ∧dxν = 0, while α µν dxµ∧dxν = ω µν dxµ∧dxν .
Since there are
(m
r
)
choices of the set (µ1,µ 2,...,µ r ) out of (1, 2,..., m)
in (5.62), the dimension of the vector space /Omega1r
p(M) is
( m
r
)
= m!
(m−r )!r! .
For later convenience we deﬁne /Omega10
p(M) = /CA . Clearly /Omega11
p (M) = T∗
p M.I f
r in (5.62) exceeds m, it vanishes identically since some index appears at least
twice in the anti-symmetrized summation. The equality
(m
r
)
=
( m
m−r
)
implies
dim /Omega1r
p (M) = dim /Omega1m−r
p (M).S i n c e /Omega1r
p(M) is a vector space, /Omega1r
p (M) is
isomorphic to /Omega1m−r
p (M) (see section 2.2).
Deﬁne the exterior product of a q-form and an r-form ∧: /Omega1q
p(M)×
/Omega1r
p (M)→/Omega1q+r
p (M) by a trivial extension. Let ω ∈/Omega1q
p(M) and ξ ∈/Omega1r
p (M),
for example. The action of the (q+ r )-form ω ∧ξ on q+ r vectors is deﬁned by
(ω ∧ξ) (V1,..., Vq+r )
= 1
q!r!
∑
P∈Sq+r
sgn(P)ω( VP(1),..., VP(q))ξ( VP(q+1),..., VP(q+r))
(5.65)
where Vi ∈Tp M.I f q+ r > m, ω ∧ξ vanishes identically. With this product,
we deﬁne an algebra
/Omega1∗
p (M)≡/Omega10
p(M)⊕/Omega11
p (M)⊕... ⊕/Omega1m
p (M). (5.66)


## Page 217

Table 5.1.
r-forms Basis Dimension
/Omega10(M)= /BY (M) {1} 1
/Omega11(M)= T∗M {dxµ} m
/Omega12(M) {dxµ1 ∧dxµ2} m(m−1)/2
/Omega13(M) {dxµ1 ∧dxµ2 ∧dxµ3} m(m−1)(m−2)/6
...
...
...
/Omega1m (M) {dx1∧dx2∧... dxm} 1
/Omega1∗
p (M) is the space of all differential forms at p and is closed under the exterior
product.
Exercise 5.13. Take the Cartesian coordinates(x, y) in /CA
2 . The two-form dx∧dy
is the oriented area element (the vector product in elementary vector algebra).
Show that, in polar coordinates, this becomes rdr∧dθ .
Exercise 5.14. Let ξ ∈/Omega1q
p (M), η ∈/Omega1r
p(M) and ω ∈/Omega1s
p(M). Show that
ξ∧ξ = 0i f q is odd (5.67a)
ξ∧η = (−1)qr η∧ξ (5.67b)
(ξ∧η)∧ω = ξ∧(η∧ω). (5.67c)
We may assign an r-form smoothly at each point on a manifold M.W e
denote the space of smooth r-forms on M by /Omega1r (M).W e a l s o d e ﬁ n e/Omega10(M) to
be the algebra of smooth functions, /BY (M). In summary we have table 5.1.
5.4.2 Exterior derivatives
Deﬁnition 5.5. The exterior derivative dr is a map /Omega1r (M) →/Omega1r+1(M) whose
a c t i o no na nr-form
ω = 1
r! ω µ1 ...µr dxµ1 ∧... ∧dxµr
is deﬁned by
dr ω = 1
r!
( ∂
∂ xν ω µ1 ...µr
)
dxν ∧dxµ1 ∧... ∧dxµr . (5.68)
It is common to drop the subscript r and write simply d. The wedge product
automatically anti-symmetrizes the coefﬁcient.


## Page 218

Example 5.10. The r-forms in three-dimensional space are:
(i) ω 0 = f (x, y, z),
(ii) ω 1 = ω x (x, y, z) dx + ω y (x, y, z) dy+ ω z (x, y, z) dz,
(iii) ω 2 = ω xy (x, y, z) dx∧dy+ ω yz (x, y, z) dy∧dz+ ω zx (x, y, z) dz∧dx
and
(iv) ω 3 = ω xyz (x, y, z) dx∧dy∧dz.
If we deﬁne an axial vector α µ by εµνλ ω νλ , a two-form may be regarded as a
‘vector’. The Levi-Civita symbol εµνλ is deﬁned by ε P(1)P(2)P(3)= sgn(P) and
provides the isomorphism between /CG (M) and /Omega12(M). [Note that both of these
are of dimension three.]
The action of d is
(i) dω 0 = ∂ f
∂ x dx+ ∂ f
∂ y dy+ ∂ f
∂ z dz,
(ii) dω 1 =
( ∂ω y
∂ x −∂ω x
∂ y
)
dx ∧dy +
( ∂ω z
∂ y −∂ω y
∂ z
)
dy ∧dz
+
( ∂ω x
∂ z −∂ω z
∂ x
)
dz∧dx,
(iii) dω 2 =
( ∂ω yz
∂ x + ∂ω zx
∂ y + ∂ω xy
∂ z
)
dx∧dy∧dz and
(iv) dω 3 = 0.
Hence, the action of d on ω 0 is identiﬁed with ‘grad’, on ω 1 with ‘rot’ and on ω 2
with ‘div’ in the usual vector calculus.
Exercise 5.15. Let ξ ∈/Omega1q (M) and ω ∈/Omega1r (M). Show that
d(ξ∧ω) = dξ∧ω + (−1)q ξ∧dω. (5.69)
A useful expression for the exterior derivative is obtained as follows. Let us
take X = Xµ∂/∂ xµ, Y = Y ν ∂/∂ xν ∈/CG (M) and ω = ω µ dxµ ∈/Omega11(M).I t i s
easy to see that the combination
X[ω( Y )]−Y[ω( X )]−ω([X, Y])= ∂ω µ
∂ xν (Xν Y µ−XµY ν )
is equal to dω( X, Y ), and we have the coordinate-free expression
dω( X, Y )= X[ω( Y )]−Y[ω( X)]−ω([X, Y]). (5.70)
For an r-form ω ∈/Omega1r (M), this becomes
dω( X1,..., Xr+1)
=
r∑
i=1
(−1)i+1 Xi ω( X1,..., ˆXi ,..., Xr+1)
+
∑
i< j
(−1)i+ j ω([Xi , X j], X1,..., ˆXi ,..., ˆX j ,..., Xr+1) (5.71)


## Page 219

where the entry below ˆ has been omitted. As an exercise, the reader should
verify (5.71) explicitly for r= 2.
We now prove an important formula:
d2 = 0 (or dr+1 dr = 0). (5.72)
Take
ω = 1
r! ω µ1 ...µr dxµ1 ∧... ∧dxµr ∈/Omega1r (M).
The action of d2 on ω is
d2ω = 1
r!
∂ 2ω µ1 ...µr
∂ xλ ∂ xν dxλ ∧dxν ∧dxµ1 ∧... ∧dxµr .
This vanishes identically since ∂ 2ω µ1...µr /∂ xλ ∂ xν is symmetric with respect to λ
and ν while dxλ ∧dxν is anti-symmetric.
Example 5.11. It is known that the electromagnetic potential A = (φ, A) is a
one-form, A = Aµdxµ (see chapter 10). The electromagnetic tensor is deﬁned
by F= dA and has the components


0 −Ex −Ey −Ex
Ex 0 Bz −By
Ey −Bz 0 Bx
Ez By −Bx 0

 (5.73)
where
E=−∇φ −∂
∂ x0 A and B=∇×A
as usual. Two Maxwell equations,∇·B= 0a n d∂ B/∂ t=−∇×E follow from
the identity dF= d(dA)= 0, which is known as the Bianchi identity, while the
other set is the equation of motion derived from the Lagrangian (1.245).
Am a p f : M →N induces the pullback f∗: T∗
f (p) N →T∗
p M and
f∗is naturally extended to tensors of type (0, r ); see section 5.2. Since an
r-form is a tensor of type (0, r ), this applies as well. Let ω ∈/Omega1r (N) and
let f b eam a p M →N. At each point f (p) ∈N, f induces the pullback
f∗: /Omega1r
f (p) N→/Omega1r
p M by
( f∗ω)( X1,..., Xr )≡ω( f∗X1,..., f∗Xr ) (5.74)
where Xi ∈Tp M and f∗is the differential map Tp M→T f (p) N.
Exercise 5.16. Let ξ,ω ∈/Omega1r (N) and let f : M→N. Show that
d ( f∗ω) = f∗(dω) (5.75)
f∗(ξ∧ω) = ( f∗ξ)∧( f∗ω). (5.76)


## Page 220

The exterior derivative dr induces the sequence
0
i
−→/Omega10(M)
d0
−→/Omega11(M)
d1
−→···
dm−2
−→/Omega1m−1(M)
dm−1
−→/Omega1m (M)
dm
−→0 (5.77)
where i is the inclusion map 0 ↪→/Omega10(M). This sequence is called the de Rham
complex.S i n c e d2 = 0, we have im dr ⊂ker dr+1.[ T a k eω ∈/Omega1r (M).T h e n
dr ω ∈im dr and dr+1(dr ω) = 0i m p l ydr ω ∈ker dr+1.] An element of ker dr is
called a closed r-form, while an element of im d r−1 is called an exact r-form.
Namely, ω ∈/Omega1r (M) is closed if dω = 0 and exact if there exists an (r−1)-form
ψ such that ω = dψ . The quotient space ker d r / im dr−1 is called the rth de
Rham cohomology group which is made into the dual space of the homology
group; see chapter 6.
5.4.3 Interior product and Lie derivative of forms
Another important operation is the interior product iX : /Omega1r (M)→/Omega1r−1(M),
where X∈/CG (M).F o rω ∈/Omega1r (M),w ed e ﬁ n e
iX ω( X1,..., Xr−1)≡ω( X, X1,..., Xr−1). (5.78)
For X= Xµ∂/∂ xµ and ω = (1/r!)ω µ1 ...µr dxµ1 ∧... ∧dxµr we have
iX ω = 1
(r−1)! Xν ω νµ 2...µr dxµ2 ∧... ∧dxµr
= 1
r!
r∑
s=1
Xµs ω µ1 ...µs ...µr (−1)s−1 dxµ1 ∧... ∧ˆdxµs ∧... ∧dxµr
(5.79)
where the entry below ˆ has been omitted. For example, let (x, y, z) be the
coordinates of /CA
3 .T h e n
iex (dx∧dy)= dy, iex (dy∧dz)= 0, iex (dz∧dx)=−dz.
The Lie derivative of a form is most neatly written with the interior product.
Let ω = ω µdxµ be a one-form. Consider the combination
(diX + iX d)ω = d (Xµω µ)+ iX[1
2 (∂µω ν −∂ν ω µ) dxµ∧dxν]
= (ω µ∂ν Xµ+ Xµ∂ν ω µ) dxν + Xµ(∂µω ν −∂ν ω µ) dxν
= (ω µ∂ν Xµ+ Xµ∂µω ν ) dxν .
Comparing this with (5.55), we ﬁnd that
/C4
X ω = (diX + iX d)ω. (5.80)


## Page 221

For a general r-form ω = (1/r!)ω µ1...µr dxµ1 ∧... ∧dxµr ,w eh a v e
/C4
X ω = lim
ε→0
1
ε ((σ ε )∗ω|σ ε (x)−ω|x )
= Xν 1
r! ∂ν ω µ1 ...µr dxµ1 ∧... ∧dxµr
+
r∑
s=1
∂µs Xν 1
r! ω µ1 ...
s
↓
ν ...µr dxµ1 ∧... ∧dxµr . (5.81)
We also have
(diX + iX d)ω
= 1
r!
r∑
s=1
[∂ν Xµs ω µ1 ...µs ...µr + Xµs ∂ν ω µ1 ...µs ...µr]
× (−1)s−1 dxν ∧dxµ1 ∧... ∧ˆdxµs ∧dxµr
+ 1
r![Xν ∂ν ω µ1 ...µr dxµ1 ∧... ∧dxµr
+
r∑
s=1
Xµs ω µ1 ...µs ...µr (−1)s dxν ∧dxµ1 ∧... ∧ˆdxµs ∧... ∧dxµr]
= 1
r!
r∑
s=1
[∂ν Xµs ω µ1 ...µs ...µr (−1)s−1 dxν ∧dxµ1 ∧... ∧ˆdxµs ∧... ∧dxµr
+ 1
r! Xν ∂ν ω µ1 ...µr dxµ1 ∧... ∧dxµr .
If we interchange the roles of µs and ν in the ﬁrst term of the last expression and
compare it with (5.81), we verify that
(diX + iX d)ω = /C4
X ω (5.82)
for any r-form ω .
Exercise 5.17. Let X, Y ∈/CG (M) and ω ∈/Omega1r (M). Show that
i[X,Y]ω = X (iY ω) −Y (iX ω). (5.83)
Show also that iX is an anti-derivation,
iX (ω ∧η) = iX ω ∧η+ (−1)r ω ∧iX η (5.84)
and nilpotent,
i2
X = 0. (5.85)
Use the nilpotency to prove
/C4
X iX ω = iX
/C4
X ω. (5.86)


## Page 222

Exercise 5.18. Let t∈/CC
n
m(M). Show that
(/C4
X t)µ1 ...µn
ν1...νm = Xλ ∂λ tµ1 ...µn
ν1...νm +
n∑
s=1
∂νs Xλ tµ1 ...µn
ν1...λ...ν m−
n∑
s=1
∂λ Xµs tµ1 ...λ...µ n
ν1...νm . (5.87)
Example 5.12. Let us reformulate Hamiltonian m echanics (section 1.1) in terms
of differential forms. Let H be a Hamiltonian and (qµ, pµ) be its phase space.
Deﬁne a two-form
ω = d pµ∧dqµ (5.88)
called the symplectic two-form. If we introduce a one-form
θ = qµ d pµ, (5.89)
the symplectic two-form is expressed as
ω = dθ. (5.90)
Given a function f (q, p) in the phase space, one can deﬁne theHamiltonian
vector ﬁeld
X f = ∂ f
∂ pµ
∂
∂ qµ −∂ f
∂ qµ
∂
∂ pµ
. (5.91)
Then it is easy to verify that
iX f ω =−∂ f
∂ pµ
d pµ−∂ f
∂ qµ dqµ =−d f.
Consider a vector ﬁeld generated by the Hamiltonian
X H = ∂ H
∂ pµ
∂
∂ qµ −∂ H
∂ qµ
∂
∂ pµ
. (5.92)
For the solution (qµ, pµ) to Hamilton’s equation of motion
dqµ
dt = ∂ H
∂ pµ
d pµ
dt =−∂ H
∂ qµ , (5.93)
we also obtain
X H = d pµ
dt
∂
∂ pµ
dqµ
dt
∂
∂ qµ = d
dt . (5.94)
The symplectic two-form ω is left invariant along the ﬂow generated byX H ,
/C4
X H ω = d(iX H ω) + iX H (dω)
= d(iX H ω) =−d2 H= 0 (5.95)
where use has been made of (5.82). Conversely, if X satisifes /C4
X ω = 0, there
exists a Hamiltonian H such that Hamilton’s equation of motion is satisﬁed


## Page 223

along the ﬂow generated by X. This follows from the previous observation that
/C4
X ω = d(iX ω) = 0 and hence by Poincar´ e’s lemma, there exists a function
H (q, p) such that
iX ω =−dH.
The Poisson bracket is cast into a form independent of the special coordinates
chosen with the help of the Hamiltonian vector ﬁelds. In fact,
iX f (iXg ω) =−iX f (dg)= ∂ f
∂ qµ
∂ g
∂ pµ
−∂ f
∂ qµ
∂ g
∂ pµ
=[ f, g]PB. (5.96)
5.5 Integration of differential forms
5.5.1 Orientation
An integration of a differential form over a manifold M is deﬁned only when
M is ‘orientable’. So we ﬁrst deﬁne an orientation of a manifold. Let M be
a connected m-dimensional differentiable manifold. At a point p ∈M,t h e
tangent space Tp M is spanned by the basis {eµ}={ ∂/∂ xµ},w h e r exµ is the
local coordinate on the chartUi to which p belongs. Let Uj be another chart such
that Ui ∩Uj ̸=∅with the local coordinates yα .I f p∈Ui ∩Uj , Tp M is spanned
by either{eµ} or{˜eα}={ ∂/∂ yα}. The basis changes as
˜eα =
( ∂ xµ
∂ yα
)
eµ. (5.97)
If J = det(∂ xµ/∂ yα )> 0o n Ui ∩Uj ,{eµ} and{˜eα} are said to deﬁne the same
orientation on Ui ∩Uj and if J < 0, they deﬁne the opposite orientation.
Deﬁnition 5.6. Let M be a connected manifold covered by {Ui}. The manifold
M is orientable if, for any overlapping charts Ui and Uj , there exist local
coordinates{xµ} for Ui and{yα} for Uj such that J= det(∂ xµ/∂ yα )> 0.
If M is non-orientable, J cannot be positive in all intersections of charts.
For example, the M¨obius strip in ﬁgure 5.14 (a) is non-orientable since we have
to choose J to be negative in the intersection B.
If an m-dimensional manifold M is orientable, there exists an m-form ω
which vanishes nowhere. This m-form ω is called a volume element ,w h i c h
plays the role of a measure when we integrate a function f ∈/BY (M) over M.
Two volume elements ω and ω′ are said to be equivalent if there exists a strictly
positive function h ∈/BY (M) such that ω = hω′. A negative-deﬁnite function
h′ ∈/BY (M) gives an inequivalent orientation to M. Thus, any orientable manifold
admits two inequivalent orientations, one of which is called right handed,t h e
other left handed.T a k ea nm-form
ω = h(p) dx1∧... ∧dxm (5.98)


## Page 224

Figure 5.14. (a) The M¨obius strip is obtained by twisting the part B ′ of the second
strip by π before pasting A with A ′ and B with B ′. The coordinate change on B is
y1 = x1, y2 =−x2 and the Jacobian is −1. (b) Basis frames on the M¨ obius strip.
with a positive-deﬁnite h(p) on a chart (U,ϕ ) whose coordinate is x = ϕ( p).
If M is orientable, we may extend ω throughout M such that the component
h is positive deﬁnite on any chart Ui .I f M is orientable, this ω is a volume
element. Note that this positivity of h is independent of the choice of coordinates.
In fact, let p∈Ui ∩Uj ̸=∅and let xµ and yα be the coordinates of Ui and Uj ,
respectively. Then (5.98) becomes
ω = h(p) ∂ x1
∂ yµ1
dyµ1 ∧... ∧∂ xm
∂ yµm
dyµm = h(p) det
( ∂ xµ
∂ yν
)
dy1∧... ∧dym .
(5.99)
The determinant in (5.99) is the Jacobian of the coordinate transformation and
must be positive by assumed orientability. If M is non-orientable, ω with a
positive-deﬁnite component cannot be deﬁned on M. Let us look at ﬁgure 5.14
again. If we circumnavigate the strip along the direction shown in the ﬁgure,
ω = dx∧dy changes the signature dx∧dy→−dx∧dy when we come back to
the starting point. Hence, ω cannot be deﬁned uniquely on M.
5.5.2 Integration of forms
Now we are ready to deﬁne an integration of a function f : M →
/CA over an
orientable manifold M. Take a volume elementω . In a coordinate neighbourhood
Ui with the coordinate x, we deﬁne the integration of an m-form f ω by
∫
Ui
f ω ≡
∫
ϕ( Ui )
f (ϕ−1
i (x))h(ϕ−1
i (x)) dx1 ... dxm . (5.100)


## Page 225

The RHS is an ordinary multiple integration of a function of m variables. Once
the integral of f over Ui is deﬁned, the integral of f over the whole of M is given
with the help of the ‘partition of unity’ deﬁned now.
Deﬁnition 5.7. Take an open covering {Ui} of M such that each point of M is
covered with a ﬁnite number of Ui . [If this is always possible, M is called
paracompact, which we assume to be the case.] If a family of differentiable
functions εi (p) satisﬁes
(i) 0≤εi (p)≤1
(ii) εi (p)= 0i f p /∈Ui and
(iii) ε1(p)+ ε2(p)+ ... = 1 for any point p∈M
the family{ε( p)} is called a partition of unity subordinate to the covering{Ui}.
From condition (iii), it follows that
f (p)=
∑
i
f (p)εi (p)=
∑
i
fi (p) (5.101)
where fi (p) ≡f (p)εi (p) vanishes outside Ui by (ii). Hence, given a point
p∈M, assumed paracompactness ensures that there are only ﬁnite terms in the
summation over i in (5.101). For each fi (p), we may deﬁne the integral over Ui
according to (5.100). Finally the integral of f on M is given by
∫
M
f ω ≡
∑
i
∫
Ui
fi ω. (5.102)
Although a different atlas {(Vi ,ψ i )} gives different coordinates and a different
partition of unity, the integral deﬁned by (5.102) remains the same.
Example 5.13. L e tu st a k et h ea t l a so fS1 deﬁned in example 5.2. Let U1 =
S1 −{(1, 0)}, U2 = S1−{(−1, 0)}, ε1(θ )= sin2(θ/ 2) and ε2(θ )= cos2(θ/ 2).
The reader should verify that {εi (θ )} is a partition of unity subordinate to {Ui}.
Let us integrate a function f = cos2 θ , for example. [Of course we know
∫ 2π
0
dθ cos2 θ = π
but let us use the partition of unity.] We have
∫
S1
dθ cos2 θ =
∫ 2π
0
dθ sin2 θ
2 cos2 θ+
∫ π
−π
dθ cos2 θ
2 cos2 θ
= 1
2 π + 1
2 π = π.
So far, we have left h arbitrary provided it is strictly positive. The reader
might be tempted to choose h to he unity. However, as we found in (5.99), h
is multiplied by the Jacobian under the change of coordinates and there is no
canonical way to single out the component h; unity in one coordinate might not
be unity in the other. The situation changes if the manifold is endowed with a
metric, as we will see in chapter 7.


## Page 226

5.6 Lie groups and Lie algebras
A Lie group is a manifold on which the group manipulations,product and inverse,
are deﬁned. Lie groups play an extremely important role in the theory of ﬁbre
bundles and also ﬁnd vast applications in physics. Here we will work out the
geometrical aspects of Lie groups and Lie algebras.
5.6.1 Lie groups
Deﬁnition 5.8. A Lie group G is a differentiable manifold which is endowed with
a group structure such that the group operations
(i)·: G× G→G,( g
1, g2)↦→g1· g2
(ii)−1 : G→G, g↦→g−1
are differentiable. [Remark: It can be shown thatG has a unique analytic structure
with which the product and the inverse operations are written as convergent power
series.]
The unit element of a Lie group is written ase. The dimension of a Lie group
G is deﬁned to be the dimension of G as a manifold. The product symbol may be
omitted and g1·g2 is usually written asg1g2. For example, let /CA
∗≡/CA −{0}.T a k e
three elements x, y, z∈/CA
∗such that xy = z. Obviously if we multiply a number
close to x by a number close to y, we have a number close to z. Similarly, an
inverse of a number close to x is close to 1/x. In fact, we can differentiate these
maps with respect to the relevant arguments and/CA
∗is made into a Lie group with
these group operations. If the product is commutative, namely g1g2 = g2g1,w e
often use the additive symbol+ instead of the product symbol.
Exercise 5.19.
(a) Show that /CA
+ ={ x ∈/CA |x > 0} is a Lie group with respect to
multiplication.
(b) Show that /CA is a Lie group with respect to addition.
(c) Show that /CA
2 is a Lie group with respect to addition deﬁned by(x1, y1)+
(x2, y2)= (x1+ x2, y1+ y2).
Example 5.14. Let S1 be the unit circle on the complex plane,
S1 ={ eiθ|θ ∈/CA (mod 2π)}.
The group operations deﬁned by e iθ eiϕ = ei(θ+ϕ) and (eiθ )−1 = e−iθ are
differentiable and S1 is made into a Lie group, which we call U (1). It is easy
to see that the group operations are the same as those in exercise 5.19(b) modulo
2π .
Of particular interest in physical applications are the matrix groups which
are subgroups of general linear groups GL (n, /CA ) or GL (n, /BV ). The product of


## Page 227

elements is simply the matrix multiplication and the inverse is given by the matrix
inverse. The coordinates of GL (n, /CA ) are given by n2 entries of M ={ xij}.
GL(n, /CA ) is a non-compact manifold of real dimension n2.
Interesting subgroups of GL (n, /CA ) are the orthogonal group O(n),t h e
special linear group SL(n, /CA ) and the special orthogonal group SO(n):
O(n)={ M∈GL(n, /CA )|MM t = Mt M= In} (5.103)
SL(n, /CA )={ M∈GL(n, /CA )| det M= 1} (5.104)
SO(n)= O(n)∩SL(n, /CA ) (5.105)
where t denotes the transpose of a matrix. In special relativity, we are familiar
with the Lorentz group
O(1, 3)={ M∈GL(4, /CA )|Mη Mt = η}
where η is the Minkowski metric, η = diag(−1, 1, 1, 1). Extension to higher-
dimensional spacetime is trivial.
Exercise 5.20. Show that the group O (1, 3) is non-compact and has four
connected components according to the signof the determinant and the sign of the
(0, 0) entry. The component that contains the unit matrix is denoted by O↑
+(1, 3).
The group GL(n, /BV ) is the set of non-singular linear transformations in /BV
n ,
which are represented by n× n non-singular matrices with complex entries. The
unitary group U(n),t h especial linear group SL(n, /BV ) and the special unitary
group SU(n) are deﬁned by
U(n)={ M∈GL(n, /BV )|MM † = M† M= 1} (5.106)
SL(n, /BV )={ M∈GL(n, /BV )| det M= 1} (5.107)
SU(n)= U(n)∩SL(n, /BV ) (5.108)
where † is the Hermitian conjugate.
So far we have just mentioned that the matrix groups are subgroups of a Lie
group GL(n, /CA ) (or GL(n, /BV )). The following theorem guarantees that they are
Lie subgroups, that is, these subgroups are Lie groups by themselves. We accept
this important (and difﬁcult to prove) theorem without proof.
Theorem 5.2. Every closed subgroup H of a Lie group G is a Lie subgroup.
For example, O(n),S L(n, /CA ) and SO(n) are Lie subgroups of GL(n, /CA ).T o
see why SL (n, /CA ) is a closed subgroup, consider a map f : GL(n, /CA ) →/CA
deﬁned by A ↦→ det A. Obviously f is a continuous map and f−1(1) =
SL(n, /CA ). A point{1} is a closed subset of/CA , hence f−1(1) is closed in GL(n, /CA ).
Then theorem 5.2 states that SL(n, /CA ) is a Lie subgroup. The reader should verify
that O(n) and SO(n) are also Lie subgroups of GL(n, /CA ).


## Page 228

Let G be a Lie group and H a Lie subgroup of G. Deﬁne an equivalence
relation∼by g ∼g′ if there exists an element h ∈H such that g′ = gh.A n
equivalence class[g] is a set{gh|h∈H}. The coset space G/H is a manifold (not
necessarily a Lie group) with dimG/H= dim G−dim H . G/H is a Lie group if
H is a normal subgroup of G,t h a ti s ,i fghg−1 ∈H for any g∈G and h∈H .I n
fact, take equivalence classes[g],[g′]∈G/H and construct the product[g][g′].
If the group structure is well deﬁned in G/H , the product must be independent
of the choice of the representatives. Let gh and g′h′ be the representatives of[g]
and[g′] respectively. Then ghg′h′ = gg′h′′h′ ∈[gg′] where the equality follows
since there exists h′′ ∈H such that hg′ = g′h′′. I ti sl e f ta sa ne x e r c i s et ot h e
reader to show that[g]−1 is also a well deﬁned operation and[g]−1 =[ g−1].
5.6.2 Lie algebras
Deﬁnition 5.9. Let a and g be elements of a Lie group G.T h eright-translation
Ra : G→G and the left-translation La : G→G of g by a are deﬁned by
Ra g=ga (5.109a)
La g=ag. (5.109b)
By deﬁnition, Ra and La are diffeomorphisms from G to G. Hence, the
maps La : G →G and Ra : G →G induce La∗: Tg G →Tag G and
Ra∗: Tg G →Tga G; see section 5.2. Since these translations give equivalent
theories, we are concerned mainly with the left-translation in the following. The
analysis based on the right-translation can be carried out in a similar manner.
Given a Lie groupG, there exists a special class of vector ﬁelds characterized
by an invariance under group action. [On the usual manifold there is no canonical
way of discriminating some vector ﬁelds from the others.]
Deﬁnition 5.10. Let X be a vector ﬁeld on a Lie group G. X is said to be a left-
invariant vector ﬁeld if La∗X|g = X|ag .
Exercise 5.21. Verify that a left-invariant vector ﬁeld X satisﬁes
La∗X|g = Xµ(g) ∂ xν (ag)
∂ xµ(g)
∂
∂ xν
⏐⏐
⏐
⏐
ag
= Xν (ag) ∂
∂ xν
⏐
⏐
⏐
⏐
ag
(5.110)
where xµ(g) and xµ(ag) are coordinates of g and ag, respectively.
A vector V ∈TeG deﬁnes a unique left-invariant vector ﬁeldXV throughout
G by
XV|g = Lg∗Vg ∈G. (5.111)
In fact, we verify from (5.34) that XV|ag = Lag∗V = (La Lg )∗V = La∗Lg∗V =
La∗XV|g. Conversely, a left-invariant vector ﬁeld X deﬁnes a unique vector
V = X|e ∈Te G. Let us denote the set of left-invariant vector ﬁelds on G by


## Page 229

/CV .T h e m a pTeG →/CV deﬁned by V ↦→XV is an isomorphism and it follows
that the set of left-invariant vector ﬁelds is a vector space isomorphic to Te G.I n
particular, dim /CV = dim G.
Since /CV is a set of vector ﬁelds, it is a subset of /CG (G) and the Lie bracket
deﬁned in section 5.3 is also deﬁned on /CV . We show that /CV is closed under the
Lie bracket. Take two points g and ag = La g in G. If we apply La∗to the Lie
bracket[X, Y] of X, Y ∈/CV ,w eh a v e
La∗[X, Y]|g =[ La∗X|g , La∗Y|g]=[ X, Y]|ag (5.112)
where the left-invariances of X and Y and (5.52) have been used. Thus,[X, Y]∈
/CV ,t h a ti s/CV is closed under the Lie bracket.
It is instructive to work out the left-invariant vector ﬁeld of GL (n, /CA ).T h e
coordinates of GL (n, /CA ) are given by n2 entries xij of the matrix. The unit
element is e = In = (δij ).L e t g ={ xij (g)} and a ={ xij (a)} be elements
of GL(n, /CA ). The left-translation is
La g= ag=
∑
xik (a)xkj (g).
T a k eav e c t o rV = ∑ V ij ∂/∂ xij|e ∈TeG where the V ij are the entries of V .T h e
left-invariant vector ﬁeld generated by V is
XV|g = Lg∗V =
∑
ijklm
V ij ∂
∂ xij
⏐⏐
⏐
⏐
e
xkl (g)xlm (e) ∂
∂ xkm
⏐
⏐
⏐
⏐
g
=
∑
V ij xkl (g)δl
i δm
j
∂
∂ xkm
⏐
⏐⏐⏐
g
=
∑
xki (g)V ij ∂
∂ xkj
⏐
⏐
⏐
⏐
g
=
∑
(gV )kj ∂
∂ xkj
⏐
⏐
⏐
⏐
g
(5.113)
where gV is the usual matrix multiplication ofg and V . The vector XV|g is often
abbreviated as gV since it gives the components of the vector.
The Lie bracket of XV and XW generated by V = V ij ∂/∂ xij|e and W =
Wij ∂/∂ xij|e is
[XV , XW]|g =
∑
xki (g)V ij ∂
∂ xkj
⏐⏐⏐
⏐
g
xca (g)Wab ∂
∂ xcb
⏐⏐⏐
⏐
g
−(V ↔W )
=
∑
xij (g)[V jk Wkl −W jk V kl] ∂
∂ xil
⏐
⏐
⏐⏐
g
=
∑
(g[V , W])ij ∂
∂ xij
⏐⏐
⏐
⏐
g
. (5.114)
Clearly, (5.113) and (5.114) remain true for any matrix group and we establish
that
Lg∗V = gV (5.115)
[XV , XW]|g = Lg∗[V, W]= g[V, W]. (5.116)


## Page 230

Now a Lie algebra is deﬁned as the set of left-invariant vector ﬁelds /CV with
the Lie bracket.
Deﬁnition 5.11. The set of left-invariant vector ﬁelds /CV with the Lie bracket
[ , ]: /CV × /CV →/CV is called the Lie algebra of a Lie group G.
We denote the Lie algebra of a Lie group by the corresponding lower-case
German gothic letter. For example /D7/D3 (n) is the Lie algebra of SO(n).
Example 5.15.
(a) Take G= /CA as in exercise 5.19(b). If we deﬁne the left translation La by
x↦→x+ a, the left-invariant vector ﬁeld is given by X= ∂/∂ x. In fact,
La∗X
⏐⏐
⏐⏐
x
= ∂( a+ x)
∂ x
∂
∂( a+ x)= ∂
∂( x+ a)= X
⏐⏐
⏐⏐
x+a
.
Clearly this is the only left-invariant vector ﬁeld on /CA . We also ﬁnd that
X= ∂/∂θ is the unique left-invariant vector ﬁeld onG= SO(2)={ eiθ|0≤
θ ≤2π}. Thus, the Lie groups /CA and SO(2) share the common Lie algebra.
(b) Let /CV/D0 (n, /CA ) be the Lie algebra of GL(n, /CA ) and c: (−ε, ε) →GL(n, /CA )
b eac u r v ew i t hc(0)= In. The curve is approximated by c(s)= In + sA+
O(s2) near s = 0, where A is an n× n matrix of real entries. Note that
for small enough s,d e tc(s) cannot vanish and c(s) is, indeed, in GL(n, /CA ).
The tangent vector to c(s) at In is c′(s)
⏐⏐
s=0 = A. This shows that /CV/D0 (n, /CA )
is the set of n× n matrices. Clearly dim /CV/D0 (n, /CA ) = n2 = dim GL(n, /CA ).
Subgroups of GL(n, /CA ) are more interesting.
(c) Let us ﬁnd the Lie algebra /D7/D0 (n, /CA ) of SL (n, /CA ). Following this
prescription, we approximate a curve through In by c(s)= In+sA+ O(s2).
The tangent vector to c(s) at In is c′(s)
⏐
⏐
s=0 = A. Now, for the curve c(s) to
be in SL(n, /CA ), c(s) has to satisfy detc(s)= 1+ strA= 1, namely tr A= 0.
Thus, /D7/D0 (n, /CA ) is the set ofn×n traceless matrices and dim/D7/D0 (n, /CA )= n2−1.
(d) Let c(s) = In + sA + O(s2) be a curve in SO (n) through In.S i n c e
c(s) is a curve in SO (n), it satisﬁes c(s)tc(s) = In. Differentiating this
identity, we obtain c′(s)tc(s)+ c(s)tc′(s) = 0. At s = 0, this becomes
At + A = 0. Hence, /D7/D3 (n) is the set of skew-symmetric matrices. Since
we are interested only in the vicinity of the unit element, the Lie algebra
of O(n) is the same as that of SO (n): /D3 (n) = /D7/D3 (n). It is easy to see that
dim /D3 (n)= dim /D7/D3 (n)= n(n−1)/2.
(e) A similar analysis can be carried out for matrix groups of GL (n, /BV ).
/CV/D0 (n, /BV ) is the set of n×n matrices with complex entries and dim/CV/D0 (n, /BV )=
2n2 (the dimension here is a real dimension). /D7/D0 (n, /BV ) is the set of traceless
matrices with real dimension 2 (n2 −1).T o ﬁ n d /D9 (n), we consider a
curve c(s) = In + sA + O(s2) in U (n).S i n c e c(s)†c(s) = In,w e
have c′(s)†c(s)+ c(s)†c′(s) = 0. At s = 0, we have A† + A = 0.


## Page 231

Hence, /D9 (n) is the set of skew-Hermitian matrices with dim /D9 (n) = n2.
/D7/D9 (n)= /D9 (n) ∩/D7/D0 (n) is the set of traceless skew-Hermitian matrices with
dim /D7/D9 (n)= n2−1.
Exercise 5.22. Let
c(s)=


cos s −sin s 0
sin s cos s 0
00 1


be a curve in SO(3). Find the tangent vector to this curve at I3.
5.6.3 The one-parameter subgroup
A vector ﬁeld X ∈/CG (M) generates a ﬂow in M (section 5.3). Here we are
interested in the ﬂow generated by a left-invariant vector ﬁeld.
Deﬁnition 5.12. Ac u r v eφ : /CA →G is called a one-parameter subgroup of G
if it satisﬁes the condition
φ( t)φ( s)= φ( t+ s). (5.117)
It is easy to see that φ( 0)= e and φ−1(t)= φ(−t). Note that the curve φ
thus deﬁned is a homomorphism from /CA to G. Although G may be non-Abelian,
a one-parameter subgroup is an Abelian subgroup: φ( t)φ( s) = φ( t + s) =
φ( s+ t)= φ( s)φ( t).
Given a one-parameter subgroup φ : /CA →G, there exists a vector ﬁeld X,
such that
dφ µ (t)
dt = Xµ(φ( t)). (5.118)
We now show that the vector ﬁeld X is left-invariant. First note that the vector
ﬁeld d/dt is left-invariant on /CA , see example 5.15(a). Thus, we have
(Lt )∗
d
dt
⏐⏐
⏐
⏐
0
= d
dt
⏐
⏐
⏐
⏐
t
. (5.119)
Next, we apply the induced map φ∗: Tt
/CA →Tφ( t )G on the vectors d /dt|0 and
d/dt|t ,
φ∗
d
dt
⏐
⏐
⏐⏐
0
= dφ µ(t)
dt
⏐⏐
⏐⏐
0
∂
∂ gµ
⏐⏐
⏐⏐
e
= X|e (5.120a)
φ∗
d
dt
⏐
⏐⏐
⏐
t
= dφ µ(t)
dt
⏐⏐⏐
⏐
t
∂
∂ gµ
⏐⏐⏐
⏐
g
= X|g (5.120b)
w h e r ew ep u tφ( t)= g. From (5.119) and (5.120b), we have
(φ Lt )∗
d
dt
⏐⏐⏐
⏐
0
= φ∗Lt∗
d
dt
⏐⏐⏐
⏐
0
= X|g . (5.121a)


## Page 232

It follows from the commutativity φ Lt = Lg φ that φ∗Lt∗= Lg∗φ∗.T h e n
(5.121a) becomes
φ∗Lt∗
d
dt
⏐⏐⏐
⏐
0
= Lg∗φ∗
d
dt
⏐⏐⏐
⏐
0
= Lg∗X|e.( 5.121b)
From (5.121), we conclude that
Lg∗X|e = X|g . (5.122)
Thus, given a ﬂow φ( t), there exists an associated left-invariant vector ﬁeld
X∈/CV .
Conversely, a left-invariant vector ﬁeld X deﬁnes a one-parameter group of
transformations σ( t, g) such that dσ( t, g)/dt= X and σ( 0, g)= g.I fw ed e ﬁ n e
φ : /CA →G by φ( t)≡σ( t, e),t h ec u r v eφ( t) becomes a one-parameter subgroup
of G. To prove this, we have to show φ( s+ t) = φ( s)φ( t). By deﬁnition, σ
satisﬁes d
dt σ( t,σ( s, e))= X (σ (t,σ( s, e))). (5.123)
[We have omitted the coordinate indices for notational simplicity. If readers feel
uneasy, they may supplement the indices as in (5.118).] If the parameters is ﬁxed,
¯σ( t,φ( s))≡φ( s)φ( t) is a curve /CA →G at φ( s)φ( 0)= φ( s). Clearly σ and ¯σ
satisfy the same initial condition,
σ( 0,σ( s, e))=¯σ( 0,φ( s))= φ( s). (5.124)
¯σ also satisﬁes the same differential equation as σ :
d
dt¯σ( t,φ( t))= d
dt φ( s)φ( t)= (Lφ( s))∗
d
dt φ( t)
= (Lφ( s))∗X (φ( t))
= X (φ( s)φ( t)) (left-invariance)
= X (¯σ( t,φ( s))). (5.125)
From the uniqueness theorem of ODEs, we conclude that
φ( s+ t)= φ( s)φ( t). (5.126)
We have found that there is a one-to-one correspondence between a one-
parameter subgroup of G and a left-invariant vector ﬁeld. This correspondence
becomes manifest if we deﬁne the exponential map as follows.
Deﬁnition 5.13. Let G be a Lie group and V ∈TeG. The exponential map
exp: TeG→G is deﬁned by
exp V ≡φ V (1) (5.127)


## Page 233

where φ V is a one-parameter subgroup of G generated by the left-invariant vector
ﬁeld XV|g = Lg∗V .
Proposition 5.2. Let V ∈Te G and let t∈/CA .T h e n
exp(tV )= φ V (t) (5.128)
where φ V (t) is a one-parameter subgroup generated by XV|g = Lg∗V .
Proof.L e ta̸= 0 be a constant. Then φ V (at ) satisﬁes
d
dt φ V (at )
⏐⏐⏐⏐
t=0
= a d
dt φ V (t)
⏐
⏐⏐⏐
t=0
= aV
which shows that φ V (at ) is a one-parameter subgroup generated by Lg∗aV .T h e
left-invariant vector ﬁeld Lg∗aV also generates φ aV (t) and, from the uniqueness
of the solution, we ﬁnd that φ V (at )= φ aV (t). From deﬁnition 5.13, we have
exp(aV )= φ aV (1)= φ V (a).
The proof is completed if a is replaced by t. /A3
For a matrix group, the exponential map is given by the exponential of a
matrix. Take G = GL(n, /CA ) and A ∈/CV/D0 (n, /CA ). Let us deﬁne a one-parameter
subgroup φ A : /CA →GL(n, /CA ) by
φ A(t)= exp(tA )= In + tA + t2
2! A2+···+ tn
n! An+··· . (5.129)
In fact, φ A(t)∈GL(n, /CA ) since[φ A(t)]−1 = φ A (−t) exists. It is also easy to see
φ A(t)φ A (s)= φ( t+ s). Now the exponential map is given by
φ A(1)= exp(A)= In + A+ 1
2! A2+···+ 1
n! An +··· . (5.130)
The curve g exp(tA ) is a ﬂow through g∈G.W eﬁ n dt h a t
d
dt g exp(tA )
⏐
⏐
⏐
⏐
t=0
= Lg∗A= X A|g
where X A is a left-invariant vector ﬁeld generated by A. From (5.115), we ﬁnd,
for a matrix group G,t h a t
Lg∗A= X A|g = gA . (5.131)
The curve g exp(tA ) deﬁnes a map σ t : G→G by σ t (g)≡g exp(tA ) which is
also expressed as a right-translation,
σ t = Rexp(tA ). (5.132)


## Page 234

5.6.4 Frames and structure equation
L e tt h es e to fn vectors{V1, V2,..., Vn} b eab a s i so fTeG where n = dim G.
[We assume throughout this book that n is ﬁnite.] The basis deﬁnes the set of n
linearly independent left-invariant vector ﬁelds{X1, X2,..., Xn} at each point g
in G by Xµ
⏐⏐
g = Lg∗Vµ. Note that the set {Xµ} is a frame of a basis deﬁned
throughout G.S i n c e[Xµ, Xν]|g is again an element of /CV at g, it can be expanded
in terms of{Xµ} as
[Xµ, Xν]= cµν λ Xλ (5.133)
where cµν λ are called thestructure constants of the Lie groupG.I f G is a matrix
group, the LHS of (5.133) at g = e is precisely the commutator of matrices Vµ
and Vν ; see (5.116). We show that the cµν λ are, indeed, constants independent of
g.L e t cµν λ (e) be the structure constants at the unit element. If Lg∗is applied to
the Lie bracket, we have
[Xµ, Xν]|g = cµν λ (e)Xλ|g
which shows the g-independence of the structure constants. In a sense, the
structure constants determine a Lie group completely (Lie’s theorem).
Exercise 5.23. Show that the structure constants satisfy
(a) skew-symmetry
cµν λ =−cνµ λ (5.134)
(b) Jacobi identity
cµν τ cτρ λ + cρµ τ cτν λ + cνρ τ cτµ λ = 0. (5.135)
Let us introduce a dual basis to{Xµ} and denote it by{θ µ};⟨θ µ, Xν⟩= δµ
ν .
{θ µ} is a basis for the left-invariant one-forms. We will show that the dual basis
satisﬁes Maurer–Cartan’s structure equation,
dθ µ =−1
2 cνλ µθ ν ∧θ λ . (5.136)
This can be seen by making use of (5.70):
dθ µ(Xν , Xλ )= Xν[θ µ(Xλ )]−Xλ[θ µ(Xν )]−θ µ([Xν , Xλ])
= Xν[δµ
λ ]−Xλ[δµ
ν ]−θ µ(cνλ κ Xκ )=−cνλ µ
which proves (5.136).
We deﬁne a Lie-algebra-valued one-form θ : Tg G→TeG by
θ : X↦→(Lg−1 )∗X= (Lg )−1
∗XX ∈Tg G. (5.137)
θ is called the canonical one-form or Maurer–Cartan form on G.


## Page 235

Theorem 5.3. (a) The canonical one-form θ is expanded as
θ = Vµ⊗θ µ (5.138)
where{Vµ} is the basis of TeG and{θ µ} the dual basis of T∗
e G.
(b) The canonical one-form θ satisﬁes
dθ+ 1
2[θ∧θ]= 0 (5.139)
where dθ ≡Vµ⊗dθ µ and
[θ∧θ]≡[Vµ, Vν]⊗θ µ∧θ ν . (5.140)
Proof.
(a) Take any vector Y = Y µ Xµ ∈Tg G,w h e r e{Xµ} is the set of frame
vectors generated by{Vµ}; Xµ|g = Lg∗Vµ. From (5.137), we ﬁnd
θ( Y )= Y µθ( Xµ)= Y µ(Lg∗)−1[Lg∗Vµ]= Y µVµ.
However,
(Vµ⊗θ µ)(Y )= Y ν Vµθ µ(Xν )= Y ν Vµδµ
ν = Y µVµ.
Since Y is arbitrary, we have θ = Vµ⊗θ µ.
(b) We use the Maurer–Cartan structure equation (5.136):
dθ+ 1
2[θ∧θ]=−1
2 Vµ⊗cνλ µθ ν ∧θ λ + 1
2 cνλ µVµ⊗θ ν ∧θ λ = 0
where the cνλ µ are the structure constants of G. /A3
5.7 The action of Lie groups on manifolds
In physics, a Lie group often appears as the set of transformations acting on a
manifold. For example, SO(3) is the group of rotations in /CA
3 , while the Poincar´e
group is the set of transformations acting on the Minkowski spacetime. To study
more general cases, we abstract the action of a Lie group G on a manifold M.
We have already encountered this interaction between a group and geometry. In
section 5.3 we deﬁned a ﬂow in a manifold M as a map σ : /CA × M →M,i n
which /CA acts as an additive group. We abstract this idea as follows.
5.7.1 Deﬁnitions
Deﬁnition 5.14. Let G be a Lie group and M be a manifold. The action of G on
M is a differentiable map σ : G× M→M which satisﬁes the conditions
(i)σ ( e, p)= p for any p∈M (5.141a)
(ii)σ ( g1,σ( g2, p))= σ( g1g2, p). (5.141b)


## Page 236

[Remark: We often use the notation gp instead of σ( g, p). The second condition
in this notation is g1(g2 p)= (g1g2)p.]
Example 5.16. (a) A ﬂow is an action of /CA on a manifold M.I f a ﬂ o w i s
periodic with a period T , it may be regarded as an action of U (1) or SO (2)
on M. Given a periodic ﬂow σ( t, x) with period T , we construct a new action
¯σ( exp(2π it/T ), x)≡σ( t, x) whose group G is U(1).
(b) Let M ∈GL(n, /CA ) and let x ∈/CA
n . The action of GL (n, /CA ) on /CA
n is
deﬁned by the usual matrix action on a vector:
σ( M, x)= M· x. (5.142)
The action of the subgroups of GL (n, /CA ) is deﬁned similarly. They may also act
on a smaller space. For example, O (n) acts on Sn−1(r ),a n (n−1)-sphere of
radius r,
σ : O(n)× Sn−1(r )→Sn−1(r ). (5.143)
(c) It is known that SL (2, /BV ) acts on a four-dimensional Minkowski space
M4 in a special manner. For x = (x0, x1, x2, x3) ∈M4, deﬁne a Hermitian
matrix,
X (x)≡xµσ µ =
( x0+ x3 x1−ix2
x1+ ix2 x0−x3
)
(5.144)
where σ µ = (I2,σ 1,σ 2,σ 3), σ i (i= 1, 2, 3) being the Pauli matrices. Conversely,
given a Hermitian matrix X, a unique vector (xµ)∈M4 is deﬁned as
xµ = 1
2 tr(σ µ X)( 5.130)
where tr is over the 2× 2 matrix indices. Thus, there is an isomorphism between
M4 and the set of 2 × 2 Hermitian matrices. It is interesting to note that
det X (x)= (x0)2−(x1)2−(x2)2−(x3)2 =−Xtη X =−(Minkowski norm)2.
Accordingly
det X (x)> 0i f x is a timelike vector
= 0i f x is on the light cone
< 0i f x is a spacelike vector.
Take A∈SL(2, /BV ) and deﬁne an action of SL(2, /BV ) on M4 by
σ( A, x)≡AX (x)A†. (5.145)
The reader should verify that this action, in fact, satisﬁes the axioms of deﬁnition
5.14. The action of SL (2, /BV ) on M4 represents the Lorentz transformation
O(1, 3). First we note that the action preserves the Minkowski norm,
det σ( A, x)= det[AX (x)A†]= det X (x)


## Page 237

since det A= det A† = 1. Moreover, there is a homomorphism ϕ : SL(2, /BV )→
O(1, 3) since
A(BXB †)A† = (AB )X (AB )†.
However, this homomorphism cannot be one to one, since A∈SL(2, /BV ) and−A
give the same element of O(1, 3); see (5.145). We verify (exercise 5.24) that the
following matrix is an explicit form of a rotation about the unit vector ˆn by an
angle θ ,
A= exp
[
−i θ
2 (ˆn· σ)
]
= cos θ
2 I2−i(ˆn· σ) sin θ
2 . (5.146a)
The appearance of θ/ 2 ensures that the homomorphism between SL(2, /BV ) and the
O(3) subgroup of O(1, 3) is indeed two to one. In fact, rotations aboutˆn by θ and
by 2π+θ should be the same O(3) rotation, but A(2π+θ) =−A(θ ) in SL(2, /BV ).
This leads to the existence of spinors. [See Misner et al (1973) and Wald (1984).]
A boost along the directionˆn with the velocity v= tanh α is given by
A= exp
[ α
2 (ˆn· σ)
]
= cosh α
2 I2+ (ˆn· σ) sinh α
2 .( 5.146b)
We show thatϕ maps SL(2, /BV ) onto the proper orthochronous Lorentz group
O↑
+(1, 3)={ /Lambda1∈O(1, 3)| det /Lambda1=+ 1,/Lambda100 > 0}.T a k ea n y
A=
( ab
cd
)
∈SL(2, /BV )
and suppose xµ = (1, 0, 0, 0) is mapped to x′µ. If we write ϕ( A)= /Lambda1,w eh a v e
x′0 = 1
2 tr(AXA †)= 1
2 tr
[( ab
cd
)( ¯a ¯c
¯b ¯d
)]
= 1
2 (|a|2+| b|2+| c|2+| d|2)> 0
hence /Lambda100 > 0. To show det A=+ 1, we note that any element of SL(2, /BV ) may
be written as
A=
( eiα 0
0e −iα
)( cos β sin β eiγ
−sin β e−iγ cos β
)
B
=
( eiα/ 2 0
0e iα/ 2
) 2 ( cos(β/ 2) sin(β/ 2)eiγ
−sin(β/ 2)e−iγ cos(β/ 2)
) 2
B
≡M2 N2 B2
0
where B ≡B2
0 is a positive-deﬁnite matrix. This shows that ϕ( A) is positive
deﬁnite:
det ϕ( A)= (det ϕ( M))2(det ϕ( N))2(det ϕ( B0))2 > 0.


## Page 238

N o ww eh a v ee s t a b l i s h e dt h a tϕ( SL(2, /BV )) ⊂O↑
+(1, 3). Equations (5.146a) and
(5.146b) show that for any element of O↑
+
(1, 3), there is a corresponding matrix
A∈SL(2, /BV ), hence ϕ is onto. Thus, we have established that
ϕ( SL(2, /BV ))= O↑
+
(1, 3). (5.147)
It can be shown that SL (2, /BV ) is simply connected and is the universal covering
group SPIN (1, 3) of O↑
+
(1, 3), see section 4.6.
Exercise 5.24. Verify by explicit calculations that
(a)
A=
( e−iθ/ 2 0
0e iθ/ 2
)
represents a rotation about the z-axis by θ ;
(b)
A=
( cosh(α/ 2)+ sinh(α/ 2) 0
0c o s h (α/ 2)−sinh(α/ 2)
)
represents a boost along the z-axis with the velocity v= tanh α .
Deﬁnition 5.15. Let G be a Lie group that acts on a manifoldM by σ : G× M→
M. The action σ is said to be
(a) transitive if, for any p1, p2 ∈M, there exists an element g ∈G such
that σ( g, p1)= p2;
(b) free if every non-trivial element g ̸= e of G has no ﬁxed points in M,
that is, if there exists an element p∈M such that σ( g, p)= p,t h e ng must be
the unit element e;a n d
(c) effective if the unit element e∈G is the unique element that deﬁnes the
trivial action on M,i . e . i fσ( g, p)= p for all p ∈M,t h e ng must be the unit
element e.
Exercise 5.25. Show that the right translation R : (a, g) ↦→ Ra g and left
translation L: (a, g)↦→La g of a Lie group are free and transitive.
5.7.2 Orbits and isotropy groups
Given a point p∈M, the action of G on p takes p to various points in M.T h e
orbit of p under the action σ is the subset of M deﬁned by
Gp={ σ( g, p)|g∈G}. (5.148)
If the action of G on M is transitive, the orbit of any p∈M is M itself. Clearly
the action of G on any orbit Gp is transitive.


## Page 239

Example 5.17. (a) A ﬂow σ generated by a vector ﬁeld X=−y∂/∂ x+ x∂/∂ y is
periodic with period 2π , see example 5.9. The action σ : /CA × /CA
2 →/CA
2 deﬁned
by (t,( x, y))→σ( t,( x, y)) is not effective sinceσ( 2π n,( x, y))= (x, y) for all
(x, y)∈/CA
2 . For the same reason, this ﬂow is not free either. The orbit through
(x, y)̸= (0, 0) is a circle S1 centred at the origin.
( b )T h ea c t i o no fO(n) on /CA
n is not transitive since if|x|̸=| x′|,n oe l e m e n t
of O(n) takes x to x′. However, the action of O(n) on Sn−1 is obviously transitive.
The orbit through x is the sphere Sn−1 of radius|x|. Accordingly, given an action
σ : O(n)× /CA
n →/CA
n , the orbits divide /CA
n into mutually disjoint spheres of
different radii. Introduce a relation by x ∼y if y= σ( g, x) for some g∈G.I t
is easily veriﬁed that∼is an equivalence relation. The equivalence class[x] is an
orbit through x. The coset space /CA
n /O(n) is[0,∞) since each equivalence class
is parametrized by the radius.
Deﬁnition 5.16. Let G be a Lie group that acts on a manifold M.T h e isotropy
group of p∈M is a subgroup of G deﬁned by
H (p)={ g∈G|σ( g, p)= p}. (5.149)
H (p) is also called the little group or stabilizer of p.
It is easy to see that H (p) is indeed a subgroup. Let g1, g2 ∈H (p),t h e n
g1g2 ∈H (p) since σ( g1g2, p) = σ( g1,σ( g2, p)) = σ( g1, p) = p. Clearly
e∈H (p) since σ( e, p)= p by deﬁnition. If g∈H (p),t h e ng−1 ∈H (p) since
p= σ( e, p)= σ( g−1g, p)= σ( g−1,σ( g, p))= σ( g−1, p).
Exercise 5.26. Suppose a Lie group G acts on a manifold M freely. Show that
H (p)={ e} for any p∈M.
Theorem 5.4. Let G be a Lie group which acts on a manifold M. Then the
isotropy group H (p) for any p∈M is a Lie subgroup.
Proof.F o rﬁ x e dp ∈M, we deﬁne a map ϕ p : G →M by ϕ p (g)≡gp.T h e n
H (p) is the inverse imageϕ−1
p (p) of a point p , and hence a closed set. The group
properties have been shown already. It follows from theorem 5.2 that H (p) is a
Lie subgroup. /A3
For example, let M = /CA
3 and G= SO(3) and take a point p= (0, 0, 1)∈
/CA
3 . The isotropy group H (p) is the set of rotations about the z-axis, which is
isomorphic to SO(2).
Let G be a Lie group andH any subgroup ofG. The coset space G/H admits
a differentiable structure and G/H becomes a manifold, called a homogeneous
space. Note that dim G/H = dim G−dim H .L e t G be a Lie group which
acts on a manifold M transitively and let H (p) be an isotropy group of p∈M.
H (p) is a Lie subgroup and the coset space G/H (p) is a homogeneous space.


## Page 240

In fact, if G, H (p) and M satisfy certain technical requirements (for example,
G/H (p) compact) is, it can be shown that G/H (p) is homeomorphic to M,s e e
example 5.18.
Example 5.18. (a) Let G = SO(3) be a group acting on /CA
3 and H = SO(2) be
the isotropy group of x ∈/CA
3 . The group SO (3) acts on S2 transitively and we
have SO(3)/SO(2)∼= S2. What is the geometrical picture of this? Let g′ = gh
where g, g′ ∈G and h ∈H .S i n c eH is the set of rotations in a plane, g and
g′ must be rotations about the common axis. Then the equivalence class [g] is
speciﬁed by the polar angles (θ, φ) . Thus, we again ﬁnd that G/H = S2.S i n c e
SO(2) is not a normal subgroup of SO(3), S2 does not admit a group structure.
It is easy to generalize this result to higher-dimensional rotation groups and
we have the useful result
SO(n+ 1)/SO(n)= Sn . (5.150)
O(n+ 1) also acts on Sn transitively and we have
O(n+ 1)/O(n)= Sn . (5.151)
Similar relations hold for U(n) and SU(n):
U(n+ 1)/U(n)= SU(n+ 1)/SU(n)= S2n+1. (5.152)
(b) The group O (n+ 1) acts on /CA Pn transitively from the left. Note, ﬁrst,
that O(n+ 1) acts on /CA
n+1 in the usual manner and preserves the equivalence
relation employed to deﬁne /CA Pn (see example 5.12). In fact, take x, x′ ∈/CA
n+1
and g ∈O(n+ 1).I f x ∼x′ (that is if x′ = ax for some a ∈/CA −{0}), then it
follows that gx ∼gx′ (gx′ = agx ). Accordingly, this action of O(n+1) on /CA
n+1
induces the natural action of O (n+ 1) on /CA Pn . Clearly this action is transitive
on /CA Pn . (Look at two representatives with the same norm.) If we take a point p
in /CA Pn , which corresponds to a point (1, 0,..., 0)∈/CA
n+1 , the isotropy group
H (p) is
H (p)=



±10 0 ... 0
0
0
..
. O(n)
0



= O(1)× O(n) (5.153)
where O(1) is the set{−1,+1}=
/CI
2.N o ww eﬁ n dt h a t
O(n+ 1)/[O(1)× O(n)]∼= Sn //CI
2∼=
/CA Pn . (5.154)
(c) This result is easily generalized to the Grassmann manifolds: Gk,n (/CA )=
O(n)/[O(k)× O(n−k)]. We ﬁrst show that O (n) acts on Gk,n (/CA ) transitively.


## Page 241

Let A be an element of Gk,n (/CA ),t h e nA is a k-dimensional plane in /CA
n . Deﬁne an
n×n matrix PA which projects a vectorv∈/CA
n to the plane A. Let us introduce an
orthonormal basis{e1,..., en} in /CA
n and another orthonormal basis{ f1,..., fk}
in the plane A, where the orthonormality is deﬁned with respect to the Euclidean
metric in /CA
n .I nt e r m so f{ei}, fa is expanded as fa = ∑
i fai ei and the projected
vector is
PAv= (v f1) f1+···+ (v fk ) fk
=
∑
i, j
(vi f1i f1 j +···+ vi fki fkj )ej =
∑
i,a, j
vi fai faj ej .
Thus, PA is represented by a matrix
(PA )ij =
∑
fai faj . (5.155)
Note that P2
A = PA, Pt
A = PA and tr PA = k. [The last relation holds since it is
always possible to choose a coordinate system such that
PA = diag(1, 1,..., 1
 
 
k
, 0,..., 0
 
 
n−k
).
This guarantees that A is, indeed, a k-dimensional plane.] Conversely any matrix
P that satisﬁes these three conditions determines a uniquek-dimensional plane in
/CA
n , that is a unique element of Gk,n (/CA ).
We now show that O(n) acts on Gk,n (/CA ) transitively. Take A∈Gk,n (/CA ) and
g ∈O(n) and construct PB ≡gP Ag−1. The matrix PB determines an element
B ∈Gk,n (/CA ) since P2
B = PB , Pt
B = PB and tr PB = k. Let us denote this
action by B = σ( g, A). Clearly this action is transitive since given a standard
k-dimensional basis of A, { f1,..., fk} for example, any k-dimensional basis
{ ˜f1,..., ˜fk} can be reached by an action of O(n) on this basis.
Let us take a special plane C0 which is spanned by the standard basis
{ f1,..., fk}. Then an element of the isotropy group H (C0) is of the form
kn −k
M=
( g1 0
0 g2
) k
n−k (5.156)
where g1 ∈O(k).S i n c eM ∈O(n),a n (n−k)× (n−k) matrix g2 must be an
element of O(n−k). Thus, the isotropy group is isomorphic to O(k)× O(n−k).
Finally we veriﬁed that
Gk,n (/CA )∼= O(n)/[O(k)× O(n−k)]. (5.157)
The dimension of Gk,n (/CA ) is obtained from the general formula as
dim Gk,n (/CA )= dim O(n)−dim[O(k)× O(n−k)]
= 1
2 n(n−1)−[1
2 k(k−1)+ 1
2 (n−k)(n−k−1)]
= k(n−k) (5.158)


## Page 242

in agreement with the result of example 5.5. Equation (5.157) also shows that the
Grassmann manifold is compact.
5.7.3 Induced vector ﬁelds
Let G be a Lie group which acts on M as (g, x)↦→gx . A left-invariant vector
ﬁeld XV generated by V ∈TeG naturally induces a vector ﬁeld in M.D e ﬁ n e a
ﬂow in M by
σ( t, x)= exp(tV )x, (5.159)
σ( t, x) is a one-parameter group of transformations, and deﬁne a vector ﬁeld
called the induced vector ﬁeld denoted by V ♯,
V ♯|x = d
dt exp(tV )x
⏐⏐⏐⏐
t=0
. (5.160)
Thus, we have obtained a map ♯: TeG→/CG (M) deﬁned by V ↦→V ♯.
Exercise 5.27. The Lie group SO(2) acts on M= /CA
2 in the usual way. Let
V =
( 0 −1
10
)
be an element of /D7/D3 (2).
(a) Show that
exp(tV )=
( cos t −sin t
sin t cos t
)
and ﬁnd the induced ﬂow through
x=
( x
y
)
∈/CA
2 .
(b) Show that V ♯|x =−y∂/∂ x+ x∂/∂ y.
Example 5.19. Let us take G = SO(3) and M = /CA
3 . The basis vectors of TeG
are generated by rotations about the x, y and z axes. We denote them by Xx , Xy
and Xz, respectively (see exercise 5.22),
Xx =


00 0
00 −1
01 0

 , Xy =


00 1
00 0
−100

 , X
z =


0 −10
100
000

 .
Repeating a similar analysis to the previous one, we obtain the corresponding
induced vectors,
X
♯
x =−z ∂
∂ y+ y ∂
∂ z , X♯
y =−x ∂
∂ z+ z ∂
∂ x , X♯
z =−y ∂
∂ x + x ∂
∂ y .


## Page 243

5.7.4 The adjoint representation
A Lie group G acts on G itself in a special way.
Deﬁnition 5.17. Take any a∈G and deﬁne a homomorphism ad a : G→G by
the conjugation,
ada : g↦→aga−1. (5.161)
This homomorphism is called the adjoint representation of G.
Exercise 5.28. Show that ada is a homomorphism. Deﬁne a map σ : G× G→G
by σ( a, g)≡ada g. Show that σ( a, g) is an action of G on itself.
Noting that adae= e, we restrict the induced map ada∗: Tg G→Tada g G to
g= e,
Ada : TeG→TeG (5.162)
where Ad a ≡ada∗|Te G . If we identify TeG with the Lie algebra /CV ,w eh a v e
obtained a map Ad : G × /CV → /CV called the adjoint map of G.S i n c e
ada∗adb∗= adab∗, it follows that Ad aAdb = Adab . Similarly, Ad a−1 = Ad−1
a
follows from ada−1∗ada∗|Te G = idTeG .
If G is a matrix group, the adjoint representation becomes a simple matrix
operation. Let g ∈G and XV ∈/CV ,a n dl e t σ V (t) = exp(tV ) be a one-
parameter subgroup generated by V ∈TeG.T h e n a dg acting on σ V (t) yields
g exp(tV )g−1 = exp(tgVg−1).A sf o rA dg we have Adg : V ↦→gVg−1 since
Adg V = d
dt[adg exp(tV )]
⏐⏐
⏐
⏐
t=0
= d
dt exp(tgVg−1)
⏐
⏐
⏐⏐
t=0
= gVg−1. (5.163)
Problems
5.1 The Stiefel manifold V (m, r ) is the set of orthonormal vectors{ei} (1≤i ≤
r ) in /CA
m (r≤m). We may express an element A of V (m, r ) by an m× r matrix
(e1,..., er ). Show that SO(m) acts transitively on V (m, r ).L e t
A0 ≡




10 ... 0
01 ... 0
... ... ... ...
00 ... 1
00 ... 0
00 ... 0




be an element ofV (m, r ). Show that the isotropy group ofA
0 is SO(m−r ).V e r i f y
that V (m, r )= SO(m)/SO(m−r ) and dim V (m, r )=[ r (r−1)]/2+ r (m−r ).
[Remark: The Stiefel manifold is, in a sense, a generalization of a sphere. Observe
that V (m, 1)= Sm−1.]


## Page 244

5.2 Let M be the Minkowski four-spacetime. Deﬁne the action of a linear operator
∗:/Omega1r (M)→/Omega14−r (M) by
r= 0:∗ 1=−dx0∧dx1∧dx2∧dx3;
r= 1:∗ dxi =−dx j ∧dxk∧dx0 ∗dx0 =−dx1∧dx2∧dx3;
r= 2:∗ dxi ∧dx j = dxk∧dx0 ∗dxi ∧dx0 =−dx j ∧dxk;
r= 3:∗ dx1∧dx2∧dx3 =−dx0 ∗dxi ∧dx j ∧dx0 =−dxk;
r= 4:∗ dx0∧dx1∧dx2∧dx3 = 1;
where (i, j, k) is an even permutation of (1, 2, 3). The vector potential A and
the electromagnetic tensor F are deﬁned as in example 5.11. J = Jµdxµ =
ρ dx0+ jk dxk is the current one-form.
(a) Write down the equation d ∗F=∗J and verify that it reduces to two of the
Maxwell equations∇·E= ρ and∇×B−∂ E/∂ t= j.
(b) Show that the identity 0 = d(d∗F) = d∗J reduces to the charge
conservation equation
∂µ J µ = ∂ρ
∂ t +∇·j= 0.
(c) Show that the Lorentz condition ∂µ Aµ = 0 is expressed as d∗A= 0.


## Page 245

6
DE RHAM COHOMOLOGY GROUPS
The homology groups of topological spaces have been deﬁned in chapter 3. If
a topological space M is a manifold, we may deﬁne the dual of the homology
groups out of differential forms deﬁned on M. The dual groups are called the
de Rham cohomology groups. Besides physicists’ familiarity with differential
forms, cohomology groups have several advantages over homology groups.
We follow closely Nash and Sen (1983) and Flanders (1963). Bott and Tu
(1982) contains more advanced topics.
6.1 Stokes’ theorem
One of the main tools in the study of de Rham cohomology groups is Stokes’
theorem with which most physicists are familiar from electromagnetism. Gauss’
theorem and Stokes’ theorem are treated in a uniﬁed manner here.
6.1.1 Preliminary consideration
Let us deﬁne an integration of an r-form over an r-simplex in a Euclidean space.
To do this, we need ﬁrst to deﬁne the standard n-simplex ¯σ r = (p0 p1 ... pr ) in
/CA
r where
p0 = (0, 0,..., 0)
p1 = (1, 0,..., 0)
...
pr = (0, 0,..., 1)
see ﬁgure 6.1. If{xµ} is a coordinate of /CA
r ,¯σ r is given by
¯σ r =
{
(x1,..., xr )∈/CA
r
⏐⏐⏐
⏐x
µ ≥0,
r∑
µ=1
xµ ≤1
}
. (6.1)
An r-form ω (the volume element) in /CA
r is written as
ω = a(x) dx1∧dx2∧... ∧dxr .


## Page 246

Figure 6.1. The standard 2-simplex ¯σ 2 = (p0 p1 p2) and the standard 3-simplex
¯σ 3= (p0 p1 p2 p3).
We deﬁne the integration of ω over¯σ r by
∫
¯σ r
ω ≡
∫
¯σ r
a(x) dx1 dx2 ... dxr (6.2)
where the RHS is the usual r-fold integration. For example, if r = 2a n d
ω = dx∧dy,w eh a v e
∫
¯σ 2
ω =
∫
¯σ 2
dx dy=
∫ 1
0
dx
∫ 1−x
0
dy= 1
2 .
Next we deﬁne an r-chain, an r-cycle and an r-boundary in an m-
dimensional manifold M.L e t σ r be an r-simplex in /CA
r and let f : σ r →M
be a smooth map. [To avoid the subtlety associated with the differentiability of
f at the boundary of σ r , f may be deﬁned over an open subset U of /CA
r ,w h i c h
contains σ r .] Here we assume f is not required to have an inverse. For example,
im f may be a point in M. We denote the image of σ r in M by sr and call it a
(singular) r-simplex in M. These simplexes are called singular since they do not
provide a triangulation of M and, moreover, geometrical independence of points
makes no sense in a manifold (see section 3.2). If {sr,i} is the set of r-simplexes
in M, we deﬁne an r-chain in M by a formal sum of{sr,i} with /CA -coefﬁcients
c=
∑
i
ai sr,i ai ∈/CA . (6.3)
In the following, we are concerned with /CA -coefﬁcients only and we omit the
explicit quotation of /CA .T h e r-chains in M form the chain group Cr (M). Under
f : σ r →M, the boundary ∂σ r is also mapped to a subset of M. Clearly,
∂ sr ≡f (∂σ r ) is a set of (r−1)-simplexes in M and is called the boundary of


## Page 247

sr . ∂ sr corresponds to the geometrical boundary of sr with an induced orientation
deﬁned in section 3.3. We have a map
∂ : Cr (M)→Cr−1(M). (6.4)
The result of section 3.3 tells us that ∂ is nilpotent; ∂ 2 = 0.
Cycles and boundaries are deﬁned in exactly the same way as in section 3.3
(note, however, that /CI is replaced by /CA ). If cr is an r-cycle, ∂ cr = 0 while if cr
is an r-boundary, there exists an (r+ 1)-chain cr+1 such that cr = ∂ cr+1.T h e
boundary group Br (M) is the set of r-boundaries and the cycle group Zr (M)
is the set of r-cycles. There are inﬁnitely many singular simplexes which make
up Cr (M), Br (M) and Zr (M). It follows from ∂ 2 = 0t h a tZr (M)⊃Br (M);c f
theorem 3.3. The singular homology group is deﬁned by
Hr (M)≡Zr (M)/Br (M). (6.5)
With mild topological assumptions, the singular homology group is isomorphic to
the corresponding simplicial homology group with /CA -coefﬁcients and we employ
the same symbol to denote both of them.
Now we are ready to deﬁne an integration of an r-form ω over an r-chain in
M. We ﬁrst deﬁne an integration of ω on an r-simplex sr of M by
∫
sr
ω =
∫
¯σ r
f∗ω (6.6)
where f :¯ σ r →M is a smooth map such that sr = f (¯σ r ).S i n c e f∗ω is
an r-form in /CA
r , the RHS is the usual r-fold integral. For a general r-chain
c= ∑
i ai sr,i ∈Cr (M),w ed e ﬁ n e
∫
c
ω =
∑
i
ai
∫
sr,i
ω. (6.7)
6.1.2 Stokes’ theorem
Theorem 6.1. (Stokes’ theorem)L e tω ∈/Omega1r−1(M) and c∈Cr (M).T h e n
∫
c
dω =
∫
∂ c
ω. (6.8)
Proof.S i n c ec is a linear combination of r-simplexes, it sufﬁces to prove (6.8) for
an r-simplex sr in M.L e t f :¯σ r →M be a map such that f (¯σ r )= sr .T h e n
∫
sr
dω =
∫
¯σ r
f∗(dω) =
∫
¯σ r
d( f∗ω)
where (5.75) has been used. We also have
∫
∂ sr
ω =
∫
∂¯σ r
f∗ω.


## Page 248

Note that f∗ω is an (r−1)-form in /CA
r . Thus, to prove Stokes’ theorem
∫
sr
dω =
∫
∂ sr
ω (6.9a)
it sufﬁces to prove an alternative formula
∫
¯σ r
dψ =
∫
∂¯σ r
ψ (6.9b)
for an (r−1)-form ψ in /CA
r . The most general form of ψ is
ψ =
∑
aµ(x) dx1∧... ∧dxµ−1∧dxµ+1∧... ∧dxr .
Since an integration is distributive, it sufﬁces to prove (6.9b) for ψ = a(x)dx1∧
... ∧dxr−1. We note that
dψ = ∂ a
∂ xr dxr ∧dx1∧... ∧dxr−1 = (−1)r−1 ∂ a
∂ xr dx1∧... ∧dxr−1∧dxr .
By direct computation, we ﬁnd, from (6.2), that
∫
¯σ r
dψ = (−1)r−1
∫
¯σ r
∂ a
∂ xr dx1 ... dxr−1 dxr
= (−1)r−1
∫
xµ≥0,∑r−1
µ=1 xµ≤1
dx1 ... dxr−1
∫ 1−∑r−1
µ=1 xµ
0
∂ a
∂ xr dxr
= (−1)r−1
∫
dx1 ... dxr−1
×
[
a
(
x1,..., xr−1, 1−
r−1∑
µ=1
xµ
)
−a
(
x1,..., xr−1, 0
) ]
.
For the boundary of¯σ r ,w eh a v e
∂¯σ r = (p1, p2,..., pr )−(p0, p2,..., pr )
+···+ (−1)r (p0, p1,..., pr−1).
Note that ψ = a(x)dx1 ∧... ∧dxr−1 vanishes when one of x1,..., xr−1 is
constant. Then it follows that
∫
(p0,p2,...,pr )
ψ = 0
since x1 ≡0o n (p0, p2,..., pr ). In fact, most of the faces of ∂¯σ r do not
contribute to the RHS of (6.9b) and we are left with
∫
∂¯σ r
ψ =
∫
(p1,p2,...,pr )
ψ + (−1)r
∫
(p0,p1,...,pr−1 )
ψ.


## Page 249

Since (p0, p1,..., pr−1) is the standard (r−1)-simplex (xµ ≥0, ∑r−1
µ=1 xµ ≤
1),o nw h i c hxr = 0, the second term is
(−1)r
∫
(p0,p1,...,pr−1 )
ψ = (−1)r
∫
¯σ r−1
a(x1,..., xr−1, 0) dx1 ... dxr−1.
The ﬁrst term is
∫
(p1,p2,...,pr )
ψ =
∫
(p1,...,pr−1 ,p0)
a
(
x1,..., xr−1, 1−
r−1∑
µ=1
xµ
)
dx1 ... dxr−1
= (−1)r−1
∫
¯σ r−1
a
(
x1,..., xr−1, 1−
r−1∑
µ=1
xµ
)
dx1 ... dxr−1
where the integral domain (p1,..., pr ) has been projected along xr to the
(p1,..., pr−1, p0)-plane, preserving the orientation. Collecting these results, we
have proved (6.9b). [The reader is advised to verify this proof for m = 3u s i n g
ﬁgure 6.1.] /A3
Exercise 6.1. Let M= /CA
3 and ω = a dx+b dy+c dz. Show that Stokes’ theorem
is written as
∫
S
curl ω· dS=
∮
C
ω· dS (Stokes’ theorem) (6.10)
where ω = (a, b, c) and C is the boundary of a surface S. Similarly, for
ψ = 1
2 ψ µν dxµ∧dxν , show that
∫
V
divψ dV =
∮
S
ψ· dS (Gauss’ theorem)
where ψ λ = ελµν ψ µν and S is the boundary of a volume V .
6.2 de Rham cohomology groups
6.2.1 Deﬁnitions
Deﬁnition 6.1. Let M be an m-dimensional differentiable manifold. The set of
closed r-forms is called the rth cocycle group, denoted Zr (M). The set of exact
r-forms is called the rth coboundary group, denoted Br (M). These are vector
spaces with /CA -coefﬁcients. It follows from d2 = 0t h a tZr (M)⊃Br (M).
Exercise 6.2. Show that
(a) if ω ∈Zr (M) and ψ ∈Zs (M),t h e nω ∧ψ ∈Zr+s (M);
(b) if ω ∈Zr (M) and ψ ∈Bs (M),t h e nω ∧ψ ∈Br+s (M);a n d


## Page 250

(c) if ω ∈Br (M) and ψ ∈Bs (M),t h e nω ∧ψ ∈Br+s (M).
Deﬁnition 6.2. The rth de Rham cohomology group is deﬁned by
Hr (M; /CA )≡Zr (M)/Br (M). (6.11)
If r≤−1o r r≥m+ 1, Hr (M; /CA ) may be deﬁned to be trivial. In the following,
we omit the explicit quotation of /CA -coefﬁcients.
Let ω ∈Zr (M).T h e n [ω]∈ Hr (M) is the equivalence class {ω′ ∈
Zr (M)|ω′ = ω + dψ, ψ ∈/Omega1r−1(M)}. Two forms which differ by an exact
form are called cohomologous. We will see later that Hr (M) is isomorphic to
Hr (M). The following examples will clarify the idea of de Rham cohomology
groups.
Example 6.1. When r = 0, B0(M) has no meaning since there is no (−1)-form.
We deﬁne /Omega1−1(M) to be empty, hence B0(M)= 0. Then H 0(M)= Z0(M)=
{ f ∈/Omega10(M) = /BY (M)|d f = 0}.I f M is connected, the condition d f = 0i s
satisﬁed if and only if f is constant over M. Hence, H 0(M) is isomorphic to the
vector space /CA ,
H 0(M)∼=
/CA . (6.12)
If M has n connected components, d f = 0 is satisﬁed if and only if f is constant
on each connected component, hence it is speciﬁed by n real numbers,
H 0(M)∼
=
/CA ⊕/CA ⊕···⊕/CA

 
 
n
. (6.13)
Example 6.2. Let M = /CA . From example 6.1, we have H 0(/CA ) = /CA .L e t u s
ﬁnd H 1(/CA ) next. Let x be a coordinate of /CA .S i n c e d i m/CA = 1, any one-form
ω ∈/Omega11(/CA ) is closed, dω = 0. Let ω = f dx,w h e r ef ∈/BY (/CA ). Deﬁne a function
F(x) by
F(x)=
∫ x
0
f (s) ds∈/BY (/CA )= /Omega10(/CA ).
Since dF(x)/dx= f (x), ω is an exact form,
ω = f dx= dF(x)
dx dx= dF.
Thus, any one-form is closed as well as exact. We have established
H 1(/CA )={ 0}. (6.14)
Example 6.3. Let S1 ={ eiθ|0 ≤θ< 2π}.S i n c e S1 is connected, we have
H 0(S1) = /CA . We compute H 1(S1) next. Let ω = f (θ )dθ ∈/Omega11(S1).I s i t


## Page 251

possible to write ω = dF for some F ∈/BY (S1)? Let us repeat the analysis of the
previous example. If ω = dF,t h e nF∈/BY (S1) must be given by
F(θ )=
∫ θ
0
f (θ′) dθ′.
For F to be deﬁned uniquely on S1, F must satisfy the periodicity F(2π) =
F(0)(=0). Namely F must satisfy
F(2π) =
∫ 2π
0
f (θ′) dθ′ = 0.
If we deﬁne a map λ : /Omega11(S1)→/CA by
λ : ω = f dθ ↦→
∫ 2π
0
f (θ′) dθ′ (6.15)
then B1(S1) is identiﬁed with ker λ . Now we have (theorem 3.1)
H 1(S1)= /Omega11(S1)/ ker λ = im λ = /CA . (6.16)
This is also obtained from the following consideration. Let ω and ω′ be closed
forms that are not exact. Although ω −ω′ is not exact in general, we can show
that there exists a number a∈/CA such that ω′−aω is exact. In fact, if we put
a=
∫ 2π
0
ω′
/ ∫ 2π
0
ω
we have ∫ 2π
0
(ω′−aω) = 0.
This shows that, given a closed form ω which is not exact, any closed form ω′ is
cohomologous to aω for some a∈/CA . Thus, each cohomology class is speciﬁed
by a real number a, hence H 1(S1)= /CA .
Exercise 6.3. Let M= /CA
2 −{0}. Deﬁne a one-form ω by
ω = −y
x2+ y2 dx+ x
x2+ y2 dy. (6.17)
(a) Show that ω is closed.
(b) Deﬁne a ‘function’ F(x, y) = tan−1(y/x). Show that ω = dF.I s ω
exact?


## Page 252

6.2.2 Duality of H r(M) and H r(M); de Rham’s theorem
As the name itself suggests, the cohomology group is a dual space of the
homology group. The duality is provided by Stokes’ theorem. We ﬁrst deﬁne
the inner product of an r-form and an r-chain in M.L e t M be an m-dimensional
manifold and let Cr (M) be the chain group of M.T a k e c ∈Cr (M) and ω ∈
/Omega1r (M) where 1≤r≤m. Deﬁne an inner product (, ) : Cr (M)×/Omega1r (M)→
/CA by
c,ω ↦→(c,ω ) ≡
∫
c
ω. (6.18)
Clearly, (c,ω ) is linear in both c and ω and (, ω ) may be regarded as a linear
map acting on c and vice versa,
(c1+ c2,ω ) =
∫
c1+c2
ω =
∫
c1
ω +
∫
c2
ω (6.19a)
(c,ω 1+ ω 2)=
∫
c
(ω 1+ ω 2)=
∫
c
ω 1+
∫
c
ω 2. (6.19b)
Now Stokes’ theorem takes a compact form:
(c, dω) = (∂ c,ω ) . (6.20)
In this sense, the exterior derivative operator d is the adjoint of the boundary
operator ∂ and vice versa.
Exercise 6.4. Let (i) c ∈Br (M), ω ∈Zr (M) or (ii) c ∈Zr (M), ω ∈Br (M).
Show, in both cases, that (c,ω ) = 0.
The inner product (, ) naturally induces an inner product λ between
the elements of Hr (M) and Hr (M). We now show that Hr (M) is the dual
of Hr (M).L e t [c]∈Hr (M) and[ω]∈Hr (M) and deﬁne an inner product
/Lambda1: Hr (M)× Hr (M)→/CA by
/Lambda1([c],[ω])≡(c,ω ) =
∫
c
ω. (6.21)
This is well deﬁned since (6.21) is independent of the choice of the
representatives. In fact, if we take c+ ∂ c′, c′ ∈Cr+1(M), we have, from Stokes’
theorem,
(c+ ∂ c′,ω ) = (c,ω ) + (c′, dω) = (c,ω )
where dω = 0 has been used. Similarly, for ω + dψ , ψ ∈/Omega1r−1(M),
(c,ω + dψ) = (c,ω ) + (∂ c,ψ) = (c,ω )
since ∂ c= 0. Note that /Lambda1( ,[ω]) is a linear map Hr (M)→/CA ,a n d/Lambda1([c],) is
a linear map Hr (M)→/CA . To prove the duality of Hr (M) and Hr (M),w eh a v e


## Page 253

to show that /Lambda1( ,[ω]) has the maximal rank, that is, dimHr (M)= dim Hr (M).
We accept the following theorem due to de Rham without the proof which is
highly non-trivial.
Theorem 6.2. (de Rham’s theorem )I f M is a compact manifold, Hr (M) and
Hr (M) are ﬁnite dimensional. Moreover the map
/Lambda1: Hr (M)× Hr (M)→/CA
is bilinear and non-degenerate. Thus, Hr (M) is the dual vector space of Hr (M).
A period of a closed r-form ω over a cycle c is deﬁned by (c,ω ) =
∫
c ω .
Exercise 6.4 shows that the period vanishes ifω is exact or if c is a boundary. The
following corollary is easily derived from de Rham’s theorem.
Corollary 6.1. Let M be a compact manifold and let k be the rth Betti number
(see section 3.4). Let c1, c2,..., ck be properly chosen elements of Zr (M) such
that[ci]̸=[ cj].
(a) A closed r-form ψ is exact if and only if
∫
ci
ψ = 0 (1≤i≤k). (6.22)
(b) For any set of real numbers b1, b2,..., bk there exists a closed r-form ω
such that ∫
ci
ω = bi (1≤i≤k). (6.23)
Proof. (a) de Rham’s theorem states that the bilinear form /Lambda1([c],[ω]) is non-
degenerate. Hence, if /Lambda1([ci],) is regarded as a linear map acting on Hr (M),
the kernel consists of the trivial element, the cohomology class of exact forms.
Accordingly, ψ is an exact form.
(b) de Rham’s theorem ensures that corresponding to the homology basis
{[ci]}, we may choose the dual basis{[ω i]} of Hr (M) such that
/Lambda1([ci],[ω j])=
∫
ci
ω j = δij . (6.24)
If we deﬁne ω ≡∑k
i=1 bi ω i , the closed r-form ω satisﬁes
∫
ci
ω = bi
as claimed. /A3
For example. we observe the duality of the following groups.


## Page 254

(a) H 0(M)∼= H0(M)∼
=
/CA ⊕···⊕/CA

 
 
n
if M has n connected components.
(b) H 1(S1)∼= H1(S1)∼
=
/CA .
Since Hr (M) is isomorphic to Hr (M),w eﬁ n dt h a t
br (M)≡dim Hr (M)= dim Hr (M)= br (M) (6.25)
where br (M) is the Betti number of M. The Euler characteristic is now written as
χ( M)=
m∑
r=1
(−1)r br (M). (6.26)
This is quite an interesting formula; the LHS is purelytopological while the RHS
is given by an analytic condition (note that d ω = 0 is a set of partial differential
equations). We will frequently encounter this interplay between topology and
analysis.
In summary, we have the chain complex C(M) and the de Rham complex
/Omega1∗(M),
←−Cr−1(M)
∂r
←−Cr (M)
∂r+1
←−Cr+1(M)←−
−→/Omega1r−1(M)
dr
−→/Omega1r (M)
dr+1
−→/Omega1r+1(M)←−
(6.27)
for which the rth homology group is deﬁned by
Hr (M)= Zr (M)/Br (M)= ker ∂r / im ∂r+1
and the rth de Rham cohomology group is deﬁned by
Hr (M)= Zr (M)/Br (M)= ker dr+1/ im dr .
6.3 Poincar ´e’s lemma
An exact form is always closed but the converse is not necessarily true. However,
the following theorem provides the situation in which the converse is also true.
Theorem 6.3. (Poincar´e’s lemma ) If a coordinate neighbourhood U of a
manifold M is contractible to a point p0 ∈M, any closed r-form on U is also
exact.
Proof. We assume U is smoothly contractible to p0, that is, there exists a smooth
map F: U× I →U such that
F(x, 0)= x, F(x, 1)= p0 for x∈U.


## Page 255

Let us consider an r-form η ∈/Omega1r (U× I ),
η = ai1 ...ir (x, t) dxi1 ∧... ∧dxir
+ b j1... jr−1 (x, t) dt∧dx j1 ∧... ∧dx jr−1 (6.28)
where x is the coordinate of U and t of I. Deﬁne a map P : /Omega1r (U× I ) →
/Omega1r−1(U ) by
Pη ≡
( ∫ 1
0
dsb j1... jr−1 (x, s)
)
dx j1 ∧... ∧dx jr−1 . (6.29)
Next, deﬁne a map ft : U →U× I by ft (x)= (x, t). The pullback of the ﬁrst
term of (6.28) by f∗
t is an element of /Omega1r (U ),
f∗
t η = ai1 ...ir (x, t) dxi1 ∧... ∧dxir ∈/Omega1r (U ). (6.30)
We now prove the following identity,
d(Pη)+ P(dη) = f1∗η−f0∗η. (6.31)
Each term of the LHS is calculated to be
dPη = d
( ∫ 1
0
dsb j1... jr−1
)
dx j1 ∧... ∧dx jr−1
=
∫ 1
0
ds
( ∂ b j1... jr−1
∂ x jr
)
dx jr ∧dx j1 ∧... ∧dx jr−1
P dη = P
[( ∂ ai1...ir
∂ xir+1
)
dxir+1 ∧dxi1 ∧... ∧dxir
+
( ∂ ai1...ir
∂ t
)
dt∧dxi1 ∧... ∧dxir
+
( ∂ b j1... jr−1
∂ x jr
)
dx jr ∧dt∧dx j1 ∧... ∧dx jr−1
]
=
[ ∫ 1
0
ds
( ∂ ai1...ir
∂ s
)]
dxi1 ∧... ∧dxir
−
[ ∫ 1
0
ds
( ∂ b j1... jr−1
∂ x jr
)]
dx jr ∧dx j1 ∧... ∧dx jr−1 .
Collecting these results, we have
d(Pη)+ P(dη) =
[ ∫ 1
0
ds
( ∂ ai1...ir
∂ s
)]
dxi1 ∧... ∧dxir
=[ ai1...ir (x, 1)−ai1 ...ir (x, 0)] dxi1 ∧... ∧dxir
= f1∗η−f0∗η.


## Page 256

Poincar´e’s lemma readily follows from (6.31). Let ω be a closed r-form on a
contractible chart U. We will show that ω is written as an exact form,
ω = d(−PF∗ω), (6.32)
F being the smooth contraction map. In fact, if η in (6.31) is replaced by
F∗ω ∈/Omega1r (U× I ) we have
dPF∗ω + P dF∗ω = f1∗◦F∗ω −f0∗◦F∗ω
= (F◦f1)∗ω −(F◦f0)∗ω (6.33)
where use has been made of the relation( f◦g)∗= g∗◦f∗. Clearly F◦f1 : U→
U is a constant map x ↦→p0, hence (F◦f1)∗= 0. However, F◦f0 = idU ,
hence (F ◦f0)∗: /Omega1r (U ) →/Omega1r (U ) is the identity map. Thus, the RHS of
(6.33) is simply −ω . The second term of the LHS vanishes since ω is closed;
dF∗ω = F∗dω = 0, where use has been made of (5.75). Finally, (6.33) becomes
ω =−dPF ∗ω , which proves the theorem. /A3
Any closed form is exact at least locally. The de Rham cohomology group is
regarded as an obstruction to the global exactness of closed forms.
Example 6.4. Since /CA
n is contractible, we have
Hr (/CA
n )= 01 ≤r≤n. (6.34)
Note, however, that H 0(/CA
n )= /CA .
6.4 Structure of de Rham cohomology groups
de Rham cohomology groups exhibit quite an interesting structure that is very
difﬁcult or even impossible to appreciate with homology groups.
6.4.1 Poincar ´e duality
Let M be a compact m-dimensional manifold and let ω ∈Hr (M) and η ∈
H m−r (M). Noting that ω ∧η is a volume element, we deﬁne an inner product
⟨ , ⟩: Hr (M)× H m−r (M)→/CA by
⟨ω, η ⟩≡
∫
M
ω ∧η. (6.35)
The inner product is bilinear. Moreover, it is non-singular, that is, if ω ̸= 0
or η ̸= 0,⟨ω, η ⟩ cannot vanish identically. Thus, (6.35) deﬁnes the duality of
Hr (M) and H m−r (M),
Hr (M)∼= H m−r (M) (6.36)


## Page 257

called the Poincar´e duality. Accordingly, the Betti numbers have a symmetry
br = bm−r . (6.37)
It follows from (6.37) that the Euler characteristic of an odd-dimensional space
vanishes,
χ( M)=
∑
(−1)r br = 1
2
{ ∑
(−1)r br +
∑
(−1)m−r bm−r
}
= 1
2
{ ∑
(−1)r br −
∑
(−1)−r br
}
= 0. (6.38)
6.4.2 Cohomology rings
Let[ω]∈H q (M) and[η]∈Hr (M). Deﬁne a product of[ω] and[η] by
[ω]∧[η]≡[ω ∧η]. (6.39)
It follows from exercise 6.2 that ω ∧η is closed, hence[ω ∧η] is an element of
H q+r (M). Moreover,[ω ∧η] is independent of the choice of the representatives
of[ω] and[η]. For example, if we take ω′ = ω + dψ instead of ω ,w eh a v e
[ω′]∧[η]≡[(ω + dψ) ∧η]=[ ω ∧η+ d(ψ ∧η)]=[ ω ∧η].
Thus, the product∧:H q (M)× Hr (M)→H q+r (M) is a well-deﬁned map.
The cohomology ring H∗(M) is deﬁned by the direct sum,
H∗(M)≡
m⨁
r=1
Hr (M). (6.40)
The product is provided by the exterior product deﬁned earlier,
∧:H∗(M)× H∗(M)→H∗(M). (6.41)
The addition is the formal sum of two elements of H∗(M). One of the
superiorities of cohomology groups overhomology groups resides here. Products
of chains are not well deﬁned and homology groups cannot have a ring structure.
6.4.3 The K¨ unneth formula
Let M be a product of two manifolds M = M1 × M2.L e t {ω p
i } (1 ≤i ≤
bp(M1)) b eab a s i so fH p(M1) and{η p
i } (1≤i ≤bp(M2)) be that of H p(M2).
Clearly ω p
i ∧η r−p
j (1≤p≤r ) is a closed r-form in M. We show that it is not
exact. If it were exact, it would be written as
ω p
i ∧η r−p
j = d(α p−1∧β r−p + γ p∧δr−p−1) (6.42)


## Page 258

for some α p−1 ∈/Omega1p−1(M1), β r−p ∈/Omega1r−p (M2), γ p ∈/Omega1p(M1) and δr−p−1 ∈
/Omega1r−p−1(M2). [If p= 0, we put α p−1 = 0.] By executing the exterior derivative
in (6.42), we have
ω p
i ∧η r−p
j = dα p−1∧β r−p + (−1)p−1α p−1∧dβ r−p
+ dγ p∧δr−p−1+ (−1)p γ p∧dδr−p−1. (6.43)
By comparing the LHS with the RHS, we ﬁnd α p−1 = δr−p−1 = 0, hence
ω p
i ∧η r−p
j = 0 in contradiction to our assumption. Thus, ω p
i ∧η r−p
j is a non-
trivial element of Hr (M). Conversely, any element ofHr (M) can be decomposed
into a sum of a product of the elements ofH p(M1) and Hr−p(M2) for 0≤p≤r.
Now we have obtained the K¨unneth formula
Hr (M)=
⨁
p+q=r
[H p(M1)⊗H q (M2)]. (6.44)
This is rewritten in terms of the Betti numbers as
br (M)=
∑
p+q=r
bp(M1)bq (M2). (6.45)
The K¨unneth formula also gives a relation between the cohomology rings of the
respective manifolds,
H∗(M)=
m∑
r=1
Hr (M)=
m∑
r=1
⨁
p+q=r
H p(M1)⊗H q (M2)
=
∑
p
H p(M1)⊗
∑
q
H q (M2)= H∗(M1)⊗H∗(M2). (6.46)
Exercise 6.5. Let M= M1× M2. Show that
χ( M)= χ( M1)· χ( M2). (6.47)
Example 6.5. Let T 2 = S1× S1 be the torus. Since H 0(S1)= /CA and H 1(S1)=
/CA ,w eh a v e
H 0(T 2)= /CA ⊗/CA = /CA (6.48a)
H 1(T 2)= (/CA ⊗/CA )⊕(/CA ⊗/CA )= /CA ⊕/CA (6.48b)
H 2(T 2)= /CA ⊗/CA = /CA . (6.48c)
Observe the Poincar´e duality H 0(T 2)= H 2(T 2).[ Remark: /CA ⊗/CA is the tensor
product and should not be confused with the direct product. Clearly the product
of two real numbers is a real number.] Let us parametrize the coordinate of T 2


## Page 259

as (θ1,θ 2) where θi is the coordinate of S1. The groups Hr (T 2) are generated by
the following forms:
r= 0: ω 0 = c0 c0 ∈/CA
r= 1: ω 1 = c1 dθ1+ c′
1 dθ2 c1, c′
1 ∈/CA (6.49a)
r= 2: ω 2 = c2 dθ1∧dθ2 c2 ∈/CA .
Although the one-form dθi looks like an exact form, there is no function θi which
is deﬁned uniquely on S1.S i n c eχ( S1)= 0, we have χ( T 2)= 0.
The de Rham cohomology groups of
T n = S1×···× S1

 
 
n
are obtained similarly. Hr (T n ) is generated by r-forms of the form
dθ i1 ∧dθ i2 ∧... ∧dθ ir (6.50)
where i1 < i2 <··· < ir are chosen from 1,..., n. Clearly
br = dim Hr (T n )=
( n
r
)
. (6.51)
The Euler characteristic is directly obtained from (6.51) as
χ( T n )=
∑
(−1)r
( n
r
)
= (1−1)n = 0. (6.52)
6.4.4 Pullback of de Rham cohomology groups
Let f : M →N be a smooth map. Equation (5.75) shows that the pullback f∗
maps closed forms to closed forms and exact forms to exact forms. Accordingly,
we may deﬁne a pullback of the cohomology groups f∗: Hr (N)→Hr (M) by
f∗[ω]=[ f∗ω][ ω]∈Hr (N). (6.53)
The pullback f∗preserves the ring structure of H∗(N). In fact, if [ω]∈H p(N)
and[η]∈H q (N),w eﬁ n d
f∗([ω]∧[η])= f∗[ω ∧η]=[ f∗(ω ∧η)]
=[ f∗ω ∧f∗η]=[ f∗ω]∧[f∗η]. (6.54)
6.4.5 Homotopy and H1(M)
Let f, g: M →N be smooth maps. We assume f and g are homotopic to each
other, that is, there exists a smooth map F : M× I →N such that F(p, 0)=


## Page 260

f (p) and F(p, 1)= g(p). We now prove that f∗: Hr (N)→Hr (M) is equal
to g∗: Hr (N)→Hr (M).
Lemma 6.1. Let f∗and g∗be deﬁned as before. If ω ∈/Omega1r (N) is a closed form,
the difference of the pullback images is exact,
f∗ω −g∗ω = dψψ ∈/Omega1r−1(M). (6.55)
Proof. We ﬁrst note that
f = F◦f0, g= F◦f1
where ft : M →M× I (p↦→(p, t)) has been deﬁned in theorem 6.3. The
LHS of (6.55) is
(F◦f0)∗ω −(F◦f1)∗ω = f∗
0 ◦F∗ω −f∗
1 ◦F∗ω
=−[dP(F∗ω) + P d(F∗ω)]=−dPF ∗ω
where (6.33) has been used. This shows that f∗ω −g∗ω = d(−PF∗ω) . /A3
Now it is easy to see that f∗= g∗as the pullback maps Hr (N)→Hr (M).
In fact, from the previous lemma,
[ f∗ω −g∗ω]=[ f∗ω]−[g∗ω]=[ dψ]= 0.
We have established the following theorem.
Theorem 6.4. Let f, g : M → N be maps which are homotopic to each
other. Then the pullback maps f∗and g∗of the de Rham cohomology groups
Hr (N)→Hr (M) are identical.
Let M be a simply connected manifold, namely π 1(M) ∼= {0}.S i n c e
H1(M) = π 1(M) modulo the commutator subgroup (theorem 4.9), it follows
that H1(M) is also trivial. In terms of the de Rham cohomology group this can be
expressed as follows.
Theorem 6.5. Let M be a simply connected manifold. Then its ﬁrst de Rham
cohomology group is trivial.
Proof.L e tω be a closed one-form on M. It is clear that if ω = d f , then a function
f must be of the form
f (p)=
∫ p
p0
ω (6.56)
p0 ∈M being a ﬁxed point.
We ﬁrst prove that an integral of a closed form along a loop vanishes. Let
α : I →M be a loop at p ∈M and let cp : I →M (t ↦→p) be a constant


## Page 261

loop. Since M is simply connected, there exists a homotopy F(s, t) such that
F(s, 0) = α( s) and F(s, 1) = cp (s). We assume F : I × I →M is smooth.
Deﬁne the integral of a one-form ω over α( I ) by
∫
α( I )
ω =
∫
S1
α∗ω (6.57)
w h e r ew eh a v et a k e nt h ei n t e g r a ld o m a i ni nt h eR H St ob eS1 since I =[ 0, 1] in
the LHS is compactiﬁed to S1. From lemma 6.1, we have, for a closed one-form
ω ,
α∗ω −c∗
p ω = dg (6.58)
where g=−PF∗ω . The pullback cpω vanishes since cp is a constant map. Then
(6.57) vanishes since ∂ S1 is empty,
∫
S1
α∗ω =
∫
S1
dg=
∫
∂ S1
g= 0. (6.59)
Let β and γ be two paths connecting p0 and p. According to (6.59), integrals
of ω along β and along γ are identical,
∫
β( I )
ω =
∫
γ( I )
ω.
This shows that (6.56) is indeed well deﬁned, hence ω is exact. /A3
Example 6.6. The n-sphere Sn (n≥2) is simply connected, hence
H 1(Sn )= 0 n≥2. (6.60)
From the Poincar´e duality, we ﬁnd
H 0(Sn )∼= H n(Sn )= /CA . (6.61)
It can be shown that
Hr (Sn )= 01 ≤r≤n−1. (6.62)
H n(Sn ) is generated by the volume element /Omega1. Since there are no (n+ 1)-forms
on Sn,e v e r yn-form is closed. /Omega1cannot be exact since if /Omega1= dψ , we would
have ∫
Sn
/Omega1=
∫
Sn
dψ =
∫
∂ Sn
ψ = 0.
The Euler characteristic is
χ( Sn )= 1+ (−1)n =
{
0 n is odd,
2 n is even. (6.63)


## Page 262

Example 6.7. Take S2 embedded in /CA
3 and deﬁne
/Omega1= sin θ dθ∧dφ (6.64)
where (θ, φ) is the usual polar coordinate. Verify that /Omega1is closed. We may
formally write /Omega1as
/Omega1=−d(cos θ)∧dφ =−d(cos θ dφ).
Note, however, that /Omega1is not exact.


## Page 263

7
RIEMANNIAN GEOMETRY
A manifold is a topological space which locally looks like /CA
n . Calculus on a
manifold is assured by the existence of smooth coordinate systems. A manifold
may carry a further structure if it is endowed with a metric tensor, which is
a natural generalization of the inner product between two vectors in /CA
n to an
arbitrary manifold. With this new structure, we deﬁne an inner product between
two vectors in a tangent space Tp M. We may also compare a vector at a point
p ∈M with another vector at a different point p′ ∈M with the help of the
‘connection’.
There are many books about Riemannian geometry. Those which are
accessible to physicists are Choquet-Bruhat et al (1982), Dodson and Poston
(1977) and Hicks (1965). Lightman et al (1975) and chapter 3 of Wald (1984)
are also recommended.
7.1 Riemannian manifolds and pseudo-Riemannian manifolds
7.1.1 Metric tensors
In elementary geometry, the inner product between two vectors U and V is
deﬁned by U · V = ∑m
i=1 Ui Vi where Ui and Vi are the components of the
vectors in /CA
m . On a manifold, an inner product is deﬁned at each tangent space
Tp M.
Deﬁnition 7.1. Let M be a differentiable manifold. A Riemannian metric g on
M is a type (0, 2) tensor ﬁeld on M which satisﬁes the following axioms at each
point p∈M:
(i) gp (U, V )= gp(V , U ),
(ii) gp(U, U )≥0, where the equality holds only when U= 0.
Here U, V ∈Tp M and gp = g|p. In short, gp is a symmetric positive-deﬁnite
bilinear form.
A tensor ﬁeld g of type (0, 2) is a pseudo-Riemannian metric if it satisﬁes
(i) and
(ii′)i f gp(U, V )= 0f o ra n yU∈Tp M,t h e nV = 0.


## Page 264

In chapter 5, we have deﬁned the inner product between a vector V ∈TM
and a dual vector ω ∈T∗
p M as a map ⟨ , ⟩: T∗
p M × Tp M →/CA .I f t h e r e
exists a metric g, we deﬁne an inner product between two vectors U, V ∈Tp M
by gp(U, V ).S i n c egp is a map Tp M ⊗Tp M →/CA we may deﬁne a linear
map gp(U,) : Tp M →/CA by V ↦→gp(U, V ).T h e n gp(U,) is identiﬁed
with a one-form ω U ∈T∗
p M. Similarly, ω ∈T∗
p M induces Vω ∈Tp M by
⟨ω, U⟩= g(Vω , U ). Thus, the metric gp gives rise to an isomorphism between
Tp M and T∗
p M.
Let (U,ϕ ) be a chart in M and{xµ} the coordinates. Since g∈/CC
0
2(M),i ti s
expanded in terms of dxµ⊗dxν as
gp = gµν (p)dxµ⊗dxν . (7.1a)
It is easily checked that
gµν (p)= gp
( ∂
∂ xµ , ∂
∂ xν
)
= gνµ (p)( p∈M). (7.1b)
We usually omit p in gµν unless it may cause confusion. It is common to
regard (gµν ) as a matrix whose (µ, ν)th entry is gµν .S i n c e (gµν ) has the
maximal rank, it has an inverse denoted by (gµν ) according to the tradition:
gµν gνλ = gλν gνµ = δλ
µ. The determinant det (gµν ) is denoted by g. Clearly
det(gµν )= g−1. The isomorphism between Tp M and T∗
p M is now expressed as
ω µ = gµν U ν , U µ = gµν ω ν . (7.2)
From (7.1a) and (7.1b) we recover the ‘old-fashioned’ deﬁnition of the
metric as an inﬁnitesimal distance squa red. Take an inﬁnitesimal displacement
dxµ∂/∂ xµ ∈Tp M and plug it into g to ﬁnd
ds2 = g
(
dxµ ∂
∂ xµ , dxν ∂
∂ xν
)
= dxµ dxν g
( ∂
∂ xµ , ∂
∂ xν
)
= gµν dxµ dxν . (7.3)
We also call the quantity d s2 = gµν dxµ dxν a metric, although in a strict sense
t h em e t r i ci satensor g= gµν dxµ⊗dxν .
Since (gµν ) is a symmetric matrix, the eigenvalues are real. If g
is Riemannian, all the eigenvalues are strictly positive and if g is pseudo-
Riemannian, some of them may be negative. If there are i positive and j negative
eigenvalues, the pair (i, j ) is called the index of the metric. If j = 1, the metric
is called a Lorentz metric . Once a metric is diagonalized by an appropriate
orthogonal matrix, it is easy to reduce all the diagonal elements to±1 by a suitable
scaling of the basis vectors with positive numbers. If we start with a Riemannian
metric we end up with the Euclidean metric δ = diag(1,..., 1) and if we start
with a Lorentz metric, the Minkowski metric η = diag(−1, 1,..., 1).


## Page 265

If (M, g) is Lorentzian, the elements of Tp M are divided into three classes
as follows,
(i) g(U, U )> 0−→U is spacelike,
(ii) g(U, U )= 0−→U is lightlike (or null), (7.4)
(iii) g(U, U )< 0−→U is timelike.
Exercise 7.1. Diagonalize the metric
(gµν )=


0100
1000
0010
0001


to show that it reduces to the Minkowski metric. The frame on which the
metric takes this form is known as the light cone frame .L e t {e0, e1, e2, e3}
be the basis of the Minkowski frame in which the metric is gµν = η µν .S h o w
that{e+, e−, e2, e3} are the basis vectors in the light cone frame, where e± ≡
(e1 ± e0)/
√
2. Let V = (V+, V−, V 2, V 3) be components of a vector V .F i n d
the components of the corresponding one-form.
If a smooth manifold M admits a Riemannian metric g, the pair (M, g) is
called a Riemannian manifold .I f g is a pseudo-Riemannian metric, (M, g)
is called a pseudo-Riemannian manifold.I f g is Lorentzian, (M, g) is called
a Lorentz manifold . Lorentz manifolds are of special interest in the theory
of relativity. For example, an m-dimensional Euclidean space (/CA
m ,δ ) is a
Riemannian manifold and an m-dimensional Minkowski space (/CA
m ,η ) is a
Lorentz manifold.
7.1.2 Induced metric
Let M be an m-dimensional submanifold of an n-dimensional Riemanian
manifold N with the metric gN .I f f : M→N is the embedding which induces
the submanifold structure of M (see section 5.2), the pullback map f∗induces
the natural metric gM = f∗gN on M. The components of gM are given by
gMµν (x)= gNαβ ( f (x)) ∂ f α
∂ xµ
∂ f β
∂ xν (7.5)
where f α denote the coordinates of f (x). For example, consider the metric of the
unit sphere embedded in (/CA
3 ,δ ).L e t (θ, φ) be the polar coordinates of S2 and
deﬁne f by the usual inclusion
f : (θ, φ) ↦→(sin θ cos φ, sin θ sin φ, cos θ)


## Page 266

from which we obtain the induced metric
gµν dxµ⊗dxν = δαβ
∂ f α
∂ xµ
∂ f β
∂ xν dxµ⊗dxν
= dθ⊗dθ+ sin2 θ dφ ⊗dφ. (7.6)
Exercise 7.2. Let f : T 2 →/CA
3 be an embedding of the torus into(/CA
3 ,δ ) deﬁned
by
f : (θ, φ) ↦→((R+ r cos θ) cos φ,( R+ r cos θ) sin φ, r sin θ)
where R > r. Show that the induced metric on T 2 is
g= r2 dθ⊗dθ+ (R+ r cos θ) 2 dφ ⊗dφ. (7.7)
When a manifold N is pseudo-Riemannian, its submanifold f : M →N
need not have a metric f∗gN . The tensor f∗gN is a metric only when it has a
ﬁxed index on M.
7.2 Parallel transport, conn ection and covariant derivative
A vector X is a directional derivative acting on f ∈/BY (M) as X : f ↦→X[ f].
However, there is no directional derivative acting on a tensor ﬁeld of type (p, q),
which arises naturally from the differentiable structure of M. [Note that the Lie
derivative /C4
V X =[ V , X] is not a directional derivative since it depends on the
derivative of V .] What we need is an extra structure called theconnection,w h i c h
speciﬁes how tensors are transported along a curve.
7.2.1 Heuristic introduction
We ﬁrst give a heuristic approach to parallel transport and covariant derivatives.
As we have noted several times, two vectors deﬁned at different points cannot be
compared naively with each other. Let us see how the derivative of a vector ﬁeld
in a Euclidean space /CA
m is deﬁned. The derivative of a vector ﬁeld V = V µeµ
with respect to xν has the µth component
∂ V µ
∂ xν = lim
/Delta1x→0
V µ( ..., xν + /Delta1xν ,... ) −V µ( ..., xν ,... )
/Delta1xν .
The ﬁrst term in the numerator of the LHS is deﬁned at x+ /Delta1x= (x1,..., xν +
/Delta1xν ,..., xm ), while the second term is deﬁned at x = (xµ). To subtract V µ(x)
from V µ(x+ /Delta1x), we have to transport V µ(x) to x+ /Delta1x without change and
compute the difference. This transport of a vector is called a parallel transport.
We have implicitly assumed that V|x parallel transported to x+ /Delta1x has the same
component V µ(x). However, there is no natural way to parallel transport a vector
in a manifold and we have to specifyhow it is parallel transportedfrom one point


## Page 267

to the other. Let ˜V|x+/Delta1x denote a vector V|x parallel transported to x+ /Delta1x.W e
demand that the components satisfy
˜V µ(x+ /Delta1x)−V µ(x)∝/Delta1x (7.8a)
/CM
(V µ+ W µ)(x+ /Delta1x)= ˜V µ(x+ /Delta1x)+ ˜W µ(x+ /Delta1x). (7.8b)
These conditions are satisﬁed if we take
˜V µ(x+ /Delta1x)= V µ(x)−V λ (x)/Gamma1µνλ (x)/Delta1xν . (7.9)
The covariant derivative of V with respect to xν is deﬁned by
lim
/Delta1xν→0
V µ(x+ /Delta1x)−˜V µ(x+ /Delta1x)
/Delta1xν
∂
∂ xµ =
( ∂ V µ
∂ xν + V λ /Gamma1µνλ
) ∂
∂ xµ . (7.10)
This quantity is a vector at x+ /Delta1x since it is a difference of two vectors V|x+/Delta1x
and ˜V|x+/Delta1x deﬁned at the same point x+ /Delta1x. There are many distinct rules
of parallel transport possible, one for each choice of /Gamma1. If the manifold is
endowed with a metric, there exists a preferred choice of/Gamma1, called the Levi-Civita
connection, see example 7.1 and section 7.4.
Example 7.1. Let us work out a simple example: two-dimensional Euclidean
space (/CA
2 ,δ ). We deﬁne parallel transportation according to the usual sense
in elementary geometry. In the Cartesian coordinate system (x, y), all the
components of /Gamma1vanish since ˜V µ(x+ /Delta1x, y+ /Delta1y) = V µ(x, y) for any /Delta1x
and /Delta1y. Next we take the polar coordinates (r,φ ) .I f (r,φ ) ↦→(r cos φ, r sin φ)
is regarded as an embedding, we ﬁnd the induced metric,
g= dr⊗dr+ r2 dφ ⊗dφ. (7.11)
Let V = V r ∂/∂ r+ V φ ∂/∂φ be a vector deﬁned at (r,φ ) . If we parallel transport
this vector to (r + /Delta1r,φ ) , we have a new vector ˜V = ˜V r ∂/∂ r|(r+/Delta1r,φ) +
˜V φ ∂/∂φ |(r+/Delta1r,φ) (ﬁgure 7.1(a)). Note that V r = V cos θ and V φ = V (sin θ/ r ),
where V =√
g(V , V ) and θ is the angle between V and ∂/∂ r.T h e n w e h a v e
˜V r = V r and
˜V φ = r
r+ /Delta1r V φ ≃ V φ −/Delta1r
r V φ .
By comparing these components with (7.9), we easily ﬁnd that
/Gamma1r rr = 0 /Gamma1r rφ = 0 /Gamma1φ rr = 0 /Gamma1φ rφ = 1
r . (7.12a)
Similarly, if V is parallel transported to (r,φ + /Delta1φ), it becomes
˜V = ˜V r ∂
∂ r
⏐⏐⏐⏐
(r,φ+/Delta1φ)
+ ˜V φ ∂
∂φ
⏐
⏐⏐⏐
(r,φ+/Delta1φ)


## Page 268

Figure 7.1. ˜V is a vector V parallel transported to (a) (r+ /Delta1r,φ ) and (b) (r,φ + /Delta1φ).
where
˜V r = V cos(θ−/Delta1φ)≃ V cos θ+ V sin θ/Delta1 φ= V r + V φ r /Delta1φ
and
˜V φ = V sin(θ−/Delta1φ)
r ≃ V sin θ
r −V cos θ /Delta1φ
r = V φ −V r /Delta1φ
r
(ﬁgure 7.1(b)). Then we ﬁnd
/Gamma1r φ r = 0 /Gamma1r φφ =−r /Gamma1φ φ r = 1
r /Gamma1φ φφ = 0. (7.12b)
Note that the /Gamma1satisfy the symmetry /Gamma1λ µν = /Gamma1λ νµ . It is also implicitly assumed
that the norm of a vector is invariant under parallel transport. A rule of parallel
transport which satisﬁes these two conditions is called aLevi-Civita connection,
see section 7.4. Our intuitive approach leads us to the formal deﬁnition of the
afﬁne connection.
7.2.2 Afﬁne connections
Deﬁnition 7.2. An afﬁne connection∇is a map∇:/CG (M)× /CG (M)→/CG (M),o r
(X, Y )↦→∇X Y which satisﬁes the following conditions:
∇X (Y+ Z )=∇X Y+∇X Z (7.13a)
∇(X+Y ) Z=∇X Z+∇Y Z (7.13b)
∇( fX )Y = f∇X Y (7.13c)
∇X ( fY )= X[ f]Y+ f∇X Y (7.13d)


## Page 269

where f ∈/BY (M) and X, Y, Z∈/CG (M).
T a k eac h a r t(U,ϕ ) with the coordinate x = ϕ( p) on M, and deﬁne m3
functions /Gamma1λ νµ called the connection coefﬁcients by
∇ν eµ ≡∇eν eµ = eλ /Gamma1λ νµ (7.14)
where {eµ}={ ∂/∂ xµ} is the coordinate basis in Tp M. The connection
coefﬁcients specify how the basis vectors change from point to point. Once the
action of∇on the basis vectors is deﬁned, we can calculate the action of ∇on
any vectors. Let V = V µeµ and W = W ν eν be elements of Tp (M).T h e n
∇V W = V µ∇eµ (W ν eν )= V µ(eµ[W µ]eν + W ν∇eµ eν )
= V µ
( ∂ W λ
∂ xµ + W ν /Gamma1λ µν
)
eλ . (7.15)
Note that this deﬁn ition of the connection coefﬁci ent is in agreement with the
previous heuristic result (7.10). By deﬁnition,∇maps two vectors V and W to a
new vector given by the RHS of (7.15), whoseλ th component is V µ∇µW λ where
∇µW λ ≡∂ W λ
∂ xµ + /Gamma1λ µν W ν . (7.16)
Note that∇µW λ is the λ th component of a vector∇µW =∇µW λ eλ and should
not be confused with the covariant derivative of a component W λ . ∇V W is
independent of the derivative of V , unlike the Lie derivative /C4
V W =[ V, W].
In this sense, the covariant derivative is a proper generalization of the directional
derivative of functions to tensors.
7.2.3 Parallel transport and geodesics
Given a curve in a manifold M, we may deﬁne the parallel transport of a vector
along the curve. Let c: (a, b)→M be a curve in M. For simplicity, we assume
the image is covered by a single chart (U,ϕ ) whose coordinate is x= ϕ( p).L e t
X be a vector ﬁeld deﬁned (at least) along c(t),
X|
c(t ) = Xµ(c(t))eµ|c(t ) (7.17)
where eµ = ∂/∂ xµ.I f X satisﬁes the condition
∇V X= 0f o r a n y t∈(a, b) (7.18a)
X is said to be parallel transported along c(t) where V = d/dt=
(dxµ (c(t))/dt)eµ|c(t ) is the tangent vector to c(t). The condition (7.18a) is
written in terms of the components as
dX µ
dt + /Gamma1µνλ
dxν (c(t))
dt Xλ = 0. (7.18b)


## Page 270

If the tangent vector V (t) itself is parallel transported along c(t), namely if
∇V V = 0 (7.19a)
the curve c(t) is called a geodesic. Geodesics are, in a sense, the s traightest
possible curves in a Riemannian manifold. In components, the geodesic
equation (7.19a) becomes
d2xµ
dt2 + /Gamma1µνλ
dxν
dt
dxλ
dt = 0 (7.19b)
where{xµ} are the coordinates of c(t). We might say that (7.19a) is too strong to
be the condition for the straightest possible curve, and instead require a weaker
condition
∇V V = fV (7.20)
where f ∈/BY (M). ‘Change of V is parallel to V ’ is also a feature of a straight
line. However, under the reparametrization t→t′, the component of the tangent
vector changes as
dxµ
dt →dt
dt′
dxµ
dt
and (7.20) reduces to (7.19a) if t′ satisﬁes
d2t′
dt2 = f dt′
dt .
Thus, it is always possible to reparametrize the curve so that the geodesic equation
takes the form (7.19a).
Exercise 7.3. Show that (7.19b) is left invariant under the afﬁne reparametrization
t→at+ b (a, b∈/CA ).
7.2.4 The covariant derivative of tensor ﬁelds
Since∇X has the meaning of a derivative, it is natural to deﬁne the covariant
derivative of f ∈/BY (M) by the ordinary directional derivative:
∇X f = X[ f]. (7.21)
Then (7.13d) looks exactly like the Leibnitz rule,
∇X ( fY )= (∇X f )Y+ f∇X Y.( 7.13d′)
We require that this be true for any product of tensors,
∇X (T1⊗T2)= (∇X T1)⊗T2+ T1⊗(∇X T2) (7.22)


## Page 271

where T1 and T2 are tensor ﬁelds of arbitrary types. Equation (7.22) is also true
when some of the indices are contracted. W ith these requirements, we compute
the covariant derivative of a one-form ω ∈/Omega11(M).S i n c e⟨ω, Y⟩∈/BY (M) for
Y ∈/CG (M), we should have
X[⟨ω, Y⟩]=∇X[⟨ω, Y⟩]=⟨∇X ω, Y⟩+⟨ ω, ∇X Y⟩.
Writing down both sides in terms of the components we ﬁnd
(∇X ω) ν = Xµ∂µω ν −Xµ/Gamma1λ µν ω λ . (7.23)
In particular, for X= eµ,w eh a v e
(∇µω) ν = ∂µω ν −/Gamma1λ µν ω λ . (7.24)
For ω = dxν , we obtain (cf (7.14))
∇µ dxν =−/Gamma1ν µλ dxλ . (7.25)
It is easy to generalize these results as
∇ν tλ 1 ...λ p
µ1 ...µq = ∂ν tλ 1...λ p
µ1...µq + /Gamma1λ 1 νκ tκλ 2...λ p
µ1...µq +···
+ /Gamma1λ p νκ t
λ 1...λ p−1κ
µ1...µq −/Gamma1κ νµ 1 tλ 1...λ p
κµ 2...µq −···
−/Gamma1κ νµ q tλ 1...λ p
µ1...µq−1 κ . (7.26)
Exercise 7.4. Let g be a metric tensor. Verify that
(∇ν g)λµ = ∂ν gλµ −/Gamma1κ νλ gκµ −/Gamma1κ νµ gλκ . (7.27)
7.2.5 The transformation properties of connection coefﬁcients
Introduce another chart (V ,ψ) such that U ∩V ̸=∅, whose coordinates are
y = ψ( p).L e t{eµ}={ ∂/∂ xµ} and{ fα}={ ∂/∂ yα} be bases of the respective
coordinates. Denote the connection coefﬁcients with respect to the y-coordinates
by ˜/Gamma1α βγ . The basis vector fα satisﬁes
∇fα fβ = ˜/Gamma1γ αβ fγ . (7.28)
If we write fα = (∂ xµ/∂ yα )eµ, the LHS becomes
∇fα fβ =∇fα
( ∂ xµ
∂ yβ eµ
)
= ∂ 2xµ
∂ yα ∂ yβ eµ+ ∂ xλ
∂ yα
∂ xµ
∂ yβ ∇eλ eµ
=
(
∂ 2xν
∂ yα ∂ yβ + ∂ xλ
∂ yα
∂ xµ
∂ yβ /Gamma1ν λµ
)
eν .


## Page 272

Since the RHS of (7.28) is equal to˜/Gamma1γ αβ (∂ xν /∂ yγ )eν , the connection coefﬁcients
must transform as
˜/Gamma1γ αβ = ∂ xλ
∂ yα
∂ xµ
∂ yβ
∂ yγ
∂ xν /Gamma1ν λµ + ∂ 2xν
∂ yα ∂ yβ
∂ yγ
∂ xν . (7.29)
The reader should verify that this transformation rule indeed makes∇X Y a vector,
namely
˜Xα (˜∂α ˜Y γ + ˜/Gamma1γ αβ ˜Y β ) fγ = Xλ (∂λ Y ν + /Gamma1ν λµ Y ν )eν .
In the literature, connection coefﬁci ents are often deﬁned as objects which
transform as (7.29). From our viewpoint, however, they must transform according
to (7.29) to make∇X Y independent of the coordinate chosen.
Exercise 7.5. Let /Gamma1be an arbitrary connection coefﬁcient. Show that /Gamma1λ µν+tλ µν
is another connection coefﬁcient provided that tλ µν is a tensor ﬁeld. Conversely,
suppose /Gamma1λ µν and ¯/Gamma1λ µν are connection coefﬁcients. Show that /Gamma1λ µν −¯/Gamma1λ µν is a
component of a tensor of type (1, 2).
7.2.6 The metric connection
So far we have left /Gamma1arbitrary. Now that our manifold is endowed with a metric,
we may put reasonable restrictions on the possible form of connections. We
demand that the metric gµν be covariantly constant , that is, if two vectors X
and Y are parallel transported along any curve, then the inner product between
them remains constant under parallel transport. [In example 7.1, we have already
assumed this reasonable condition.] Let V be a tangent vector to an arbitrary
curve along which the vectors are parallel transported. Then we have
0=∇V[g(X, Y )]= V κ[(∇κ g)(X, Y )+ g(∇κ X, Y )+ g(X,∇κ Y )]
= V κ XµY ν (∇κ g)µν
where we have noted that∇κ X=∇κ Y = 0. Since this is true for any curves and
vectors, we must have
(∇κ g)µν = 0 (7.30a)
or, from exercise 7.4,
∂λ gµν −/Gamma1κ λµ gκν −/Gamma1κ λν gκµ = 0. (7.30b)
If (7.30a) is satisﬁed, the afﬁne connection∇is said to be metric compatible or
simply a metric connection. We will deal with metric connections only. Cyclic
permutations of (λ, µ, ν) yield
∂µgνλ −/Gamma1κ µν gκλ −/Gamma1κ µλ gκν = 0 (7.30c)
∂ν gλµ −/Gamma1κ νλ gκµ −/Gamma1κ νµ gκλ = 0. (7.30d)


## Page 273

The combination−(7.30b)+ (7.30c)+ (7.30d) yields
−∂λ gµν + ∂µgνλ + ∂ν gλµ + T κ λµ gκν + T κ λν gκµ −2/Gamma1κ (µν) gκλ = 0 (7.31)
where T κ λµ ≡2/Gamma1κ[λµ] ≡/Gamma1κ λµ −/Gamma1κ µλ and /Gamma1κ (µν) ≡1
2 (/Gamma1κ νµ + /Gamma1κ µν ).T h e
tensor T κ λµ is anti-symmetric with respect to the lower indices T κ λµ =−T κ µλ
and called the torsion tensor, see exercise 7.6. The torsion tensor will be studied
in detail in the next section. Equation (7.31) is solved for /Gamma1κ (µν) to yield
/Gamma1κ (µν) =
{ κ
µν
}
+ 1
2
(Tν κ
µ+ Tµκ
ν
) (7.32)
where
{ κ
µν
}
are the Christoffel symbols deﬁned by
{ κ
µν
}
= 1
2 gκλ (∂µgνλ + ∂ν gµλ −∂λ gµν
) . (7.33)
Finally, the connection coefﬁcient /Gamma1is given by
/Gamma1κ µν = /Gamma1κ (µν) + /Gamma1κ[µν]
=
{ κ
µν
}
+ 1
2 (Tν κ
µ+ Tµκ
ν + T κ µν ). (7.34)
The second term of the last expression of (7.34) is called thecontorsion, denoted
by K κ µν :
K κ µν ≡1
2 (T κ µν + Tµκ
ν + Tν κ µ). (7.35)
If the torsion tensor vanishes on a manifold M, the metric connection
∇is called the Levi-Civita connection . Levi-Civita connections are natural
generalizations of the connection deﬁne d in the classical geometry of surfaces,
see section 7.4.
Exercise 7.6. Show that T κ µν obeys the tensor transformation rule. [ Hint:U s e
(7.29).] Show also that K κ[µν] = 1
2 T κ µν and Kκµν =−Kνµκ where Kκµν =
gκλ K λ µν .
7.3 Curvature and torsion
7.3.1 Deﬁnitions
Since /Gamma1is not a tensor, it cannot have an intrinsic geometrical meaning as
a measure of how much a manifold is curved. For example, the connection
coefﬁcients in example 7.1 vanish if the Cartesian coordinate is employed while
they do not in polar coordinates. As intrinsic objects, we deﬁne thetorsion tensor


## Page 274

T : /CG (M)⊗/CG (M)→/CG (M) and the Riemann curvature tensor (or Riemann
tensor) R: /CG (M)⊗/CG (M)⊗/CG (M)→/CG (M) by
T (X, Y )≡∇X Y−∇Y X−[X, Y] (7.36)
R(X, Y, Z )≡∇X∇Y Z−∇Y∇X Z−∇[X,Y] Z . (7.37)
It is common to write R(X, Y )Z instead of R(X, Y, Z ),s ot h a tR looks like an
operator acting on Z. Clearly, they satisfy
T (X, Y )=−T (Y, X ), R(X, Y )Z=−R(Y, X)Z . (7.38)
At ﬁrst sight, T and R seem to be differential operators and it is not obvious that
they are multilinear objects. We prove the tensorial property of R,
R( fX , gY )hZ = f∇X{g∇Y (hZ )}−g∇Y{ f∇X (hZ )}−fX[g]∇Y (hZ )
+ gY[ f]∇X (hZ )−fg∇[X,Y](hZ )
= fg∇X{Y[h]Z+ h∇Y Z}−gf∇Y{X[h]Z+ h∇X Z}
−fg[X, Y][h]Z−fgh∇[X,Y] Z
= fgh{∇X∇Y Z−∇Y∇X Z−∇[X,Y] Z}
= fgh R (X, Y )Z .
Now it is easy to see that R satisﬁes
R(X, Y )Z= Xλ Y µ Z ν R(eλ , eµ)eν (7.39)
which veriﬁes the tensorial property of R.S i n c eR maps three vector ﬁelds to a
vector ﬁeld, it is a tensor ﬁeld of type (1, 3).
Exercise 7.7. Show that T deﬁned by (7.36) is multilinear,
T (X, Y )= XµY ν T (eµ, eν ) (7.40)
and hence a tensor ﬁeld of type (1, 2).
Since T and R are tensors, their operations on vectors are obtained once their
actions on the basis vectors are known. With respect to the coordinate basis {eµ}
and the dual basis{dxµ}, the components of these tensors are given by
T λ µν =⟨ dxλ , T (eµ, eν )⟩=⟨ dxλ ,∇µeν −∇ν eµ⟩
=⟨ dxλ ,/Gamma1η µν eη −/Gamma1η νµ eη⟩= /Gamma1λ µν −/Gamma1λ νµ (7.41)
and
Rκ λµν =⟨ dxκ , R(eµ, eν )eλ⟩=⟨ dxκ ,∇µ∇ν eλ −∇ν∇µeλ⟩
=⟨ dxκ ,∇µ(/Gamma1η νλ eη )−∇ν (/Gamma1η µν eη )⟩
=⟨ dxκ ,( ∂µ/Gamma1η νλ )eη + /Gamma1η νλ /Gamma1ξ µη eξ −(∂ν /Gamma1η µλ )eη −/Gamma1η µλ /Gamma1ξ νη eξ⟩
= ∂µ/Gamma1κ νλ −∂ν /Gamma1κ µλ + /Gamma1η νλ /Gamma1κ µη −/Gamma1η µλ /Gamma1κ νη . (7.42)
We readily ﬁnd (cf (7.38))
T λ µν =−T λ νµ Rκ λµν =−Rκ λνµ . (7.43)


## Page 275

Figure 7.2. It is natural to deﬁne V parallel transported along a great circle if the angle V
makes with the great circle is kept ﬁxed. IfV at p is parallel transported along great circles
C and C′, the resulting vectors at q point in opposite directions.
Figure 7.3. A vector V0 at p is parallel transported along C and C′ to yield VC (r ) and
VC′ (r ) at r. The curvature measures the difference between two vectors.
7.3.2 Geometrical meaning of the Riemann tensor and the torsion tensor
Before we proceed further, we examine thegeometrical meaning of these tensors.
We consider the Riemann tensor ﬁrst. A crucial observation is that if we parallel
transport a vector V at p to q along two different curves C and C′, the resulting
vectors at q are different in general (ﬁgure 7.2). If, however, we parallel transport
a vector in a Euclidean space, where the parallel transport is deﬁned in our
usual sense, the resulting vector does not depend on the path along which it
has been parallel transported. We expect that this non-integrability of parallel
transport characterizes the intrinsic notion of curvature, which does not depend


## Page 276

on the special coordinates chosen. Let us take an inﬁnitesimal parallelogram
pqrs whose coordinates are {xµ},{xµ + εµ},{xµ + εµ + δµ} and{xµ + δµ}
respectively, εµ and δµ being inﬁnitesimal (ﬁgure 7.3). If we parallel transport
a vector V0 ∈Tp M along C = pqr ,w ew i l lh a v eav e c t o rVC (r )∈Tr M.T h e
vector V0 parallel transported to q along C is
V µ
C (q)= V µ
0 −V κ
0 /Gamma1µνκ (p)εν .
Then V µ
C (r ) is given by
V µ
C (r )= V µ
C (q)−V κ
C (q)/Gamma1µνκ (q)δν
= V µ
0 −V κ
0 /Gamma1µνκ εν −[V κ
0 −V ρ
0 /Gamma1κ ζρ (p)εζ]
×[ /Gamma1µνκ (p)+ ∂λ /Gamma1µνκ (p)ελ]δν
≃ V µ
0 −V κ
0 /Gamma1µνκ (p)εν −V κ
0 /Gamma1µνκ (p)δν
−V κ
0[∂λ /Gamma1µνκ (p)−/Gamma1ρ λκ (p)/Gamma1µνρ (p)]ελ δν
where we have kept terms of up to order two in ε and δ. Similarly, parallel
transport of V0 along C′ = psr yields another vector VC′ (r )∈Tr M,g i v e nb y
V µ
C′ (r )≃ V µ
0 −V κ
0 /Gamma1µνκ (p)δν −V κ
0 /Gamma1µνκ (p)εν
−V κ
0[∂ν /Gamma1µλκ (p)−/Gamma1ρ νκ (p)/Gamma1µλρ (p)]ελ δν .
The two vectors at r differ by
VC′ (r )−VC (r )= V κ
0[∂λ /Gamma1µνκ (p)−∂ν /Gamma1µλκ (p)
−/Gamma1ρ λκ (p)/Gamma1µνρ (p)+ /Gamma1ρ νκ (p)/Gamma1µλρ (p)]ελ δν
= V κ
0 Rµκλν ελ δν . (7.44)
We next look at the geometrical meaning of the torsion tensor. Let p∈M
be a point whose coordinates are {xµ}.L e t X = εµeµ and Y = δµeµ be
inﬁnitesimal vectors inTp M. If these vectors are regarded as small displacements,
they deﬁne two points q and s near p, whose coordinates are {xµ + εµ} and
{xµ+ δµ} respectively (ﬁgure 7.4). If we parallel transport X along the line ps,
we obtain a vector sr1 whose component is εµ −ελ /Gamma1µνλ δν . The displacement
vector connecting p and r1 is
pr1 = ps+ sr1 = δµ+ εµ−/Gamma1µνλ ελ δν .
Similarly, the parallel transport of δµ along pq yields a vector
pr2 = pq+ qr2 = εµ+ δµ−/Gamma1µλν ελ δν .
In general, r1 and r2 do not agree and the difference is
r2r1 = pr2−pr1 = (/Gamma1µνλ −/Gamma1µλν )ελ δν = T µνλ ελ δν . (7.45)


## Page 277

Figure 7.4. The vector qr2 (sr1) is the vector ps (pq) parallel transported to q (s). In
general, r1 ̸= r2 and the torsion measures the difference r2r1.
Thus, the torsion tensor measures the failure of the closure of the parallelogram
made up of the small displacement vectors and their parallel transports.
Example 7.2. Suppose we are navigating on the surface of the Earth. We deﬁne a
vector to be parallel transported if the angle between the vector and the latitude is
kept ﬁxed during the navigation. [ Remarks: This deﬁnition of parallel transport
is not the usual one. For example, the geodesic is not a great circle but a straight
line on Mercator’s projection. See example 7.5.] Suppose we navigate along
a small quadrilateral pqrs made up of latitudes and longitudes (ﬁgure 7.5( a)).
We parallel transport a vector at p along pqr and psr , separately. According
to our deﬁnition of parallel transport, two vectors at r should agree, hence the
curvature tensor vanishes. To ﬁnd the torsion, we parametrize the points p, q, r
and s as in ﬁgure 7.5(b). We ﬁnd the torsion by evaluating the difference between
pr1 and pr2 as in (7.45). If we parallel transport the vector pq along ps,w e
obtain a vector sr1, whose length is R sin θ dφ . However, a parallel transport
of the vector ps along pq yields a vector qr2 = qr .S i n c e sr has a length
R sin(θ −dθ) dφ ≃ R sin θ dφ −R cos θ dθ dφ ,w eﬁ n dt h a tr1r2 has a length
R cos θ dθ dφ .S i n c e r1r2 is parallel to −∂/∂φ , the connection has a torsion
T φ θφ , see (7.45). From gφφ = R2 sin2 θ ,w eﬁ n dt h a t r1r2 has components
(0,−cot θ dθ dφ) . Since the φ -component of r1r2 is equal to T φ θφ dθ dφ ,w e
obtain T φ θφ =−cot θ .
Note that the basis{∂/∂θ, ∂/∂φ } is not well deﬁned at the poles. It is known
that the sphere S2 does not admit two vector ﬁelds which are linearly independent
everywhere on S2. Any vector ﬁeld on S2 must vanish somewhere on S2 and


## Page 278

Figure 7.5. (a) If a vector makes an angleα with the longitude at p, this angle is kept ﬁxed
during parallel transport. (b) The vectorsr1 (qr2) is the vector pq (ps) parallel transported
to s (q). The torsion does not vanish.
hence cannot be linearly independent of the other vector ﬁeld there. If an m-
dimensional manifold M admits m vector ﬁelds which are linearly independent
everywhere, M is said to be parallelizable. On a parallelizable manifold, we
can use these m vector ﬁelds to deﬁne a tangent space at each point of M.A
vector Vp ∈Tp M is deﬁned to be parallel to Vq ∈Tq M if all the components of
Vp at Tp M are equal to those of Vq at Tq M. Since the vector ﬁelds are deﬁned
throughout M, this parallelism should be independent of the path connecting p
and q, hence the Riemann curvature tensor vanishes although the torsion tensor
may not in general. For Sm , this is possible only when m= 1, 3 and 7, which is
closely related to the existence of complex numbers, quaternions and octonions,
respectively. For deﬁniteness, let us consider
S3 =
{
(x1, x2, x3, x4)
⏐⏐
⏐
⏐
4∑
i=1
(xi )2 = 1
}
embedded in (/CA
4 ,δ ). Three orthonormal vectors
e1(x)= (−x2, x1,−x4, x3)
e2(x)= (−x3, x4, x1,−x2) (7.46)
e3(x)= (−x4,−x3, x2, x1)
are orthogonal to x = (x1, x2, x3, x4) and linearly independent everywhere
on S3, hence deﬁne the tangent space Tx S3. Two vectors V 1(x) and V 2(y)


## Page 279

are parallel if V 1(x) = ∑ ci ei (x) and V 2( y) = ∑ ci ei ( y). The connection
coefﬁcients are computed from (7.14). Let ε e1(x) be a small displacement
under which x = (x1, x2, x3, x4) changes to x′ = x + ε e1(x) ={ x1 −
εx2, x2 + εx1, x3 −εx4, x4 + εx3}. The difference between the basis vectors
at x and x′ is e2(x′)−e2(x)= (−x3−εx4, x4+ εx3, x1−εx2,−x2−εx1)−
(−x3, x4, x1,−x2) =−ε e3(x) = ε/Gamma1µ12eµ(x), hence /Gamma1312 =−1,/Gamma1112 =
/Gamma1212 = 0. Similarly, /Gamma1321 = 1 hence we ﬁnd T 312 =−2. The reader
should complete the computation of the connection coefﬁcients and verify that
T λ µν =−2 (+2) if (λµν) is an even (odd) permutation of (123) and vanishes
otherwise.
Let us see how this parallelizability of S3 is related to the existence of
quaternions. The multiplication rule of quaternions is
(x1, x2, x3, x4)· (y1, y2, y3, y4)
= (x1 y1−x2 y2−x3 y3−x4 y4, x1 y2+ x2 y1+ x3 y4−x4 y3,
x1 y3−x2 y4+ x3 y1+ x4 y2, x1 y4+ x2 y3−x3 y2+ x4 y1). (7.47)
S3 may be deﬁned by the set of unit quaternions
S3 ={ (x1, x2, x3, x4)|x·¯x= 1}
where the conjugate of x is deﬁned by ¯x = (x1,−x2,−x3,−x4). According to
(7.46), the tangent space at x0 = (1, 0, 0, 0) is spanned by
e1 = (0, 1, 0, 0) e2 = (0, 0, 1, 0) e3 = (0, 0, 0, 1).
Then the basis vectors (7.46) of the tangent space at x = (x1, x2, x3, x4) are
expressed as the quaternion products
e1(x)= e1· xe 2(x)= e2· xe 3(x)= e3· x. (7.48)
Because of this algebra, it is always possible to give a set of basis vectors at an
arbitrary point of S3 once it is given at some point, x0 = (1, 0, 0, 0), for example.
By the same token, a Lie group is parallelizable. If the set of basis vectors
{V1,..., Vm} at the unit element e of a Lie group G is given, we can always ﬁnd
a set of basis vectors of Tg G by the left translation of{Vµ} (see section 5.6),
{V1,..., Vn}
Lg∗
−→ {X1|g ,..., Xn|g}. (7.49)
7.3.3 The Ricci tensor and the scalar curvature
From the Riemann curvature tensor, we construct new tensors by contracting the
indices. The Ricci tensor Ric is a type (0, 2) tensor deﬁned by
Ric (X, Y )≡⟨dxµ, R(eµ, Y )X⟩ (7.50a)


## Page 280

whose component is
Ric µν = Ric (eµ, eν )= Rλ µλν . (7.50b)
The scalar curvature /CA is obtained by further contracting indices,
/CA ≡gµν Ric (eµ, eν )= gµν Ric µν . (7.51)
7.4 Levi-Civita connections
7.4.1 The fundamental theorem
Among afﬁne connections, there is a special connection called the Levi-Civita
connection, which is a natural generalization of the connection in the classical
differential geometry of surfaces. A connection ∇is called a symmetric
connection if the torsion tensor vanishes. In the coordinate basis, connection
coefﬁcients of a symmetric connection satisfy
/Gamma1λ µν = /Gamma1λ νµ . (7.52)
Theorem 7.1. (The fundamental theorem of (pseudo-)Riemannian geometry)
On a (pseudo-)Riemannian manifold (M, g), there exists a unique symmetric
connection which is compatible with the metric g. This connection is called the
Levi-Civita connection.
Proof. This follows directly from (7.34). Let ∇be an arbitrary connection such
that
˜/Gamma1κ µν =
{ κ
µν
}
+ K κ µν
where { κ
µν
} is the Christoffel symbol and K the contorsion tensor. It was shown
in exercise 7.5 that /Gamma1κ µν ≡˜/Gamma1κ µν + tκ µν is another connection coefﬁcient if t is
a tensor ﬁeld of type (1, 2). Now we choose tκ µν =−K κ µν so that
/Gamma1κ µν =
{ κ
µν
}
= 1
2 gκλ (∂µgλν + ∂ν gλµ −∂λ gµν ). (7.53)
By construction, this is symmetric and certainly unique given a metric. /A3
Exercise 7.8. Let V be a Levi-Civita connection.
(a) Let f ∈/BY (M). Show that
∇µ∇ν f =∇ν∇µ f. (7.54)
(b) Let ω ∈/Omega11(M). Show that
dω = (∇µω) ν dxµ∧dxν . (7.55)


## Page 281

Figure 7.6. On a surface M, a vector Vp ∈Tp M is deﬁned to be parallel to Vq ∈Tq M if
the projection of Vq onto Tp M is parallel to Vp in our ordinary sense of parallelism in /CA
2.
(c) Let ω ∈/Omega11(M) and let U ∈/CG (M) be the corresponding vector ﬁeld:
U µ = gµν ω ν . Show that, for any V ∈/CG (M),
g(∇X U, V )=⟨∇X ω, V⟩. (7.56)
Example 7.3.
(a) The metric on /CA
2 in polar coordinates is g = dr ⊗dr + r2 dφ ⊗dφ .
The non-vanishing components of the Levi-Civita connection coefﬁcients
are /Gamma1φ rφ = /Gamma1φ φ r = r−1 and /Gamma1r φφ =−r. This is in agreement with the
result obtained in example 7.1.
(b) The induced metric on S2 is g = dθ ⊗dθ + sin2 θ dφ ⊗dφ . The non-
vanishing components of the Levi-Civita connection are
/Gamma1θ φφ =−cos θ sin θ/Gamma1 φ θφ = /Gamma1φ φθ = cot θ. (7.57)
7.4.2 The Levi-Civita connection i n the classical geometry of surfaces
In the classical differential geometry of surfaces embedded in /CA
3 , Levi-Civita
deﬁned the parallelism of vectors at the nearby points p and q in the following
sense (ﬁgure 7.6). First, take the tangent plane at p and a vector Vp at p,w h i c h
lies in the tangent plane. A vector Vq at q is deﬁned to be parallel to Vp if the
projection of Vq to the tangent plane at p is parallel to Vp in our usual sense.
Now take two points q and s near p as in ﬁgure 7.7 and parallel transport the
displacement vectors pq along ps and ps along pq. If the parallelism is deﬁned
in the sense of Levi-Civita, the displ acement vectors projected to the tangent
plane at p form a closed parallelogram, hence this parallelism has vanishing
torsion. As has been proved in theorem 7.1, there exists a unique connection
which has vanishing torsion, which gener alizes the parallelism deﬁned here to
arbitrary manifolds.


## Page 282

Figure 7.7. If the parallelism is deﬁned in the sense of Levi-Civita, the torsion vanishes
identically.
7.4.3 Geodesics
When the Levi-Civita connection is employed, we can compute the connection
coefﬁcients, Riemann tensors and man y relations involving these by simple
routines. Besides this simplicity, the Levi-Civita connection provides a geodesic
(deﬁned as the straightest possible curve) with another picture, namely the
shortest possible curve connecting two given points. In Newtonian mechanics,
the trajectory of a free particle is the straightest possible as well as the shortest
possible curve, that is, a straight line. Einstein proposed that this property should
be satisﬁed in general relativity as well; if gravity is understood as a part of the
geometry of spacetime, a freely falling particle should follow the straightest as
well as the shortest possible curve. [ Remark: To be precise, the shortest possible
curve is too strong a condition. As we see later, a geodesic deﬁned with respect
to the Levi-Civita connection gives the local extremum of the length of a curve
connecting two points.]
Example 7.4. In a ﬂat manifold (/CA
m ,δ ) or (/CA
m ,η ), the Levi-Civita connection
coefﬁcients /Gamma1vanish identically. Hence, the geodesic equation (7.19b) is easily
solved to yield xµ = Aµt+ Bµ,w h e r eAµ and Bµ are constants.
Exercise 7.9. A metric on a cylinder S1× /CA is given by g= dφ ⊗dφ + dz⊗dz,
where φ is the polar angle ofS1 and z the coordinate of/CA . Show that the geodesics
given by the Levi-Civita connection are helices.
The equivalence of the straightest possible curve and the local extremum of
the distance is proved as follows. First we parametrize the curve by the distances
along the curve, xµ = xµ(s). The length of a path c connecting two points p and
q is
I (c)=
∫
c
ds=
∫
c
√
gµν x′µx′ν ds (7.58)
where x′µ = dxµ/ds. Instead of deriving the Euler–Lagrange equation from
(7.58), we will solve a slightly easier problem. Let F ≡1
2 gµν x′µx′ν and write


## Page 283

(7.58) as I (c) =
∫
c L(F)ds. The Euler–Lagrange equation for the original
problem takes the form
d
ds
( ∂ L
∂ x′λ
)
−∂ L
∂ xλ = 0. (7.59)
Then F= L2/2 satisﬁes
d
ds
( ∂ F
∂ x′λ
)
−∂ F
∂ xλ = L
[ d
ds
( ∂ L
∂ x′λ
)
−∂ L
∂ xλ
]
+ ∂ L
∂ x′λ
dL
ds = ∂ L
∂ x′λ
dL
ds . (7.60)
The last expression vanishes since L ≡1 along the curve; d L/ds = 0. Now
we have proved that F also satisﬁes the Euler–Lagrange equation provided that L
does so. We then have
d
ds (gλµ x′µ)−1
2
∂ gµν
∂ xλ x′µx′ν
= ∂ gλµ
∂ xν x′µx′ν + gλµ
d2xµ
ds2 −1
2
∂ gµν
∂ xλ x′µx′ν
= gλµ
d2xµ
ds2 + 1
2
( ∂ gλµ
∂ xν + ∂ gλν
∂ xµ −∂ gµν
∂ xλ
) dxµ
ds
dxν
ds = 0. (7.61)
If (7.61) is multiplied by gκλ , we reproduce the geodesic equation (7.19b).
Having proved that L and F satisfy the same variational problem, we take
advantage of this to compute the Christoffel symbols. Take S2, for example. F is
given by 1
2 (θ′2+ sin2 θφ′2) and the Euler–Lagrange equations are
d2θ
ds2 −sin θ cos θ
( dφ
ds
) 2
= 0 (7.62a)
d2φ
ds2 + 2c o tθ dφ
ds
dθ
ds = 0. (7.62b)
It is easy to read off the connection coefﬁcients /Gamma1θ φφ =−sin θ cos θ and
/Gamma1φ φθ = /Gamma1φ θφ = cot θ , see (7.57).
Example 7.5. Let us compute the geodesics of S2. Rather than solving the
geodesic equations (7.62) we ﬁnd the geodesic by minimizing the length of a
curve connecting two points on S2. Without loss of generality, we may assign
coordinates (θ1,φ 0) and (θ2,φ 0) to these points. Let φ = φ(θ) b eac u r v e
connecting these points. Then the length of the curve is
I (c)=
∫ θ2
θ1
√
1+ sin2
( dφ
dθ
) 2
dθ (7.63)


## Page 284

which is minimized when d φ/ dθ ≡0, that is φ ≡φ 0. Thus, the geodesic is a
great circle (θ, φ 0), θ1 ≤θ ≤θ2.[ Remark: Solving (7.62) is not very difﬁcult.
Let θ = θ( φ) be the equation of the geodesic. Then
dθ
ds = dθ
dφ
dφ
ds
d2θ
ds2 = d2θ
dφ 2
( dφ
ds
) 2
+ dθ
dφ
d2φ
ds2 .
Substituting these into the ﬁrst equation of (7.62), we obtain
d2θ
dφ 2
( dφ
ds
) 2
+ dθ
dφ
d2φ
ds2 −sin θ cos θ
( dφ
ds
) 2
= 0. (7.64)
The second equation of (7.62) and (7.64) yields
d2θ
dφ 2 −2c o tθ
( dθ
dφ
) 2
−sin θ cos θ = 0. (7.65)
If we deﬁne f (θ )≡cot θ , (7.65) becomes
d2 f
dφ 2 + f = 0
whose general solution is f (θ )= cot θ = A cos φ + B sin φ or
A sin θ cos φ + B sin θ sin φ −cos θ = 0. (7.66)
Equation (7.66) is the equation of a great circle which lies in a plane whose normal
vector is (A, B,−1).]
Example 7.6. Let U be the upper half-plane U ≡{(x, y)|y > 0} and introduce
the Poincar´e metric
g= dx⊗dx+ dy⊗dy
y2 . (7.67)
The geodesic equations are
x′′−2
y x′ y′ = 0 (7.68a)
y′′−1
y[x′2+ 3y′2]= 0 (7.68b)
where x′ ≡dx/ds etc. The ﬁrst equation of (7.68) is easily integrated, if divided
by x′, to yield
x′
y2 = 1
R (7.69)


## Page 285

Figure 7.8. Geodesics deﬁned by the Poincar´e metric in the upper half-plane. The geodesic
has an inﬁnite length.
where R is a constant. Since the parameter s is taken so that the vector (x′, y′)
has unit length, it satisﬁes (x′2+ y′2)/y2 = 1. From (7.69), this becomes
y2/R2+ (y′/y)2 = 1o r
ds= dy
y
√
1−y2/R2
= dt
sin t
w h e r ew ep u ty= R sin t. Equation (7.69) then becomes
x′ = y2
R = R sin2 t.
Now x is solved for t to yield
x=
∫
x′ ds=
∫ dx
ds
ds
dt dt
=
∫
R sin t dt=−R cos t+ x0.
Finally, we obtain the solution
x=−R cos t+ x0 y= R sin t (y > 0) (7.70)
which is a circle with radius R centred at (x0, 0). Maximally extended geodesics
are given by 0 < t <π (ﬁgure 7.8) whose length is inﬁnite,
I =
∫
ds=
∫ π−ε
0+ε
ds
dt dt=
∫ π−ε
0+ε
1
sin t dt
=−1
2 log 1+ cos t
1−cos t
⏐⏐⏐
⏐
π−ε
0+ε
−−−−−−→
ε→0
∞.
7.4.4 The normal coordinate system
The subject here is not restricted to Levi-Civita connections but it does take an
especially simple form when the Levi-Civita connection is employed. Let c(t) be


## Page 286

a geodesic in (M, g) deﬁned with respect to a connection∇, which satisﬁes
c(0)= p, d
dt
⏐⏐
⏐
⏐
p
= X= Xµeµ ∈Tp M (7.71)
where {eµ} is the coordinate basis at p. Any geodesic emanating from p is
speciﬁed by giving X ∈Tp M. Take a point q near p. There are many geodesics
which connect p and q. However, there exists a unique geodesic cq such that
cq (1) = q.L e t Xq ∈Tp M be the tangent vector of this geodesic at p.A s
long as q is not far from p, q uniquely speciﬁes Xq = Xµ
q eµ ∈Tp M and
ϕ : q →X µ
q serves as a good coordinate system in the neighbourhood of p.
This coordinate system is called the normal coordinate system based on p with
basis{eµ}. Obviously ϕ( p) = 0. We deﬁne a map EXP : Tp M →M by
EXP: Xq ↦→q. By deﬁnition, we have
ϕ( EXP Xµ
q eµ)= X µ
q . (7.72)
With respect to this coordinate system, a geodesic c(t) with c(0) = p and
c(1)= q has the coordinate presentation
ϕ( c(t))= X µ = Xµ
q t (7.73)
where Xµ
q are the normal coordinates of q.
We now show that Levi-Civita connection coefﬁcients vanish in the normal
coordinate system. We write down the geodesic equation in the normal coordinate
system,
0= d2 Xµ
dt2 + /Gamma1µνλ (Xκ
q t)dX ν
dt
dXλ
dt = /Gamma1µνλ (Xκ
q t)Xν
q Xλ
q . (7.74)
Since /Gamma1µνλ (p)Xν
q Xλ
q = 0f o rany X ν
q at p for which t = 0, we ﬁnd /Gamma1µνλ (p)+
/Gamma1µλν (p)= 0. Since our connection is symmetric we must have
/Gamma1µνλ (p)= 0. (7.75)
As a consequence, the covariant derivative of any tensor t in this coordinate
system takes the extremely simple form at p,
∇X t...
... = X[t...
...]. (7.76)
Equation (7.75) does not imply that /Gamma1µνλ vanishes at q (̸=p). In fact, we
ﬁnd from (7.42) that
Rκ λµν (p)= ∂µ/Gamma1κ νλ (p)−∂ν /Gamma1κ µλ (p) (7.77)
hence ∂µ/Gamma1κ νλ (p)̸= 0i f Rκ λµν (p)̸= 0.


## Page 287

7.4.5 Riemann curvature tenso r with Levi-Civita connection
Let∇be the Levi-Civita connection. The components of the Riemann curvature
tensor are given by (7.42) with
/Gamma1λ µν =
{ κ
µν
}
while the torsion tensor vanishes by deﬁnition. Many formulae are simpliﬁed if
the Levi-Civita connections are employed.
Exercise 7.10.
(a) Let g= dr⊗dr+ r2(dθ⊗dθ+ sin2 θ dφ⊗dφ) b et h em e t r i co f(/CA
3 ,δ ),
where 0 ≤θ ≤π ,0 ≤φ< 2π . Show, by direct calculation, that all the
components of the Riemann curvature tensor with respect to the Levi-Civita
connection vanish.
(b) The spatially homogeneous and isotropic universe is described by the
Robertson–Walker metric,
g=−dt⊗dt+ a2(t)
( dr⊗dr
1−kr 2 + r2(dθ⊗dθ+ sin2 θ dφ ⊗dφ)
)
(7.78)
where k is a constant, which may be chosen to be−1, 0o r+1b yas u i t a b l e
rescaling of r and 0 ≤θ ≤π ,0 ≤φ< 2π .I f k =+ 1, r is restricted to
0 ≤r < 1. Compute the Riemann tensor, the Ricci tensor and the scalar
curvature.
(c) The Schwarzschild metric takes the from
g=−
(
1−2M
r
)
dt⊗dt
+ 1
1−2M
r
dr⊗dr+ r2(dθ⊗dθ+ sin2 θ dφ ⊗dφ) (7.79)
where 0 < 2M < r,0 ≤θ ≤π ,0 ≤φ< 2π . Compute the Riemann
tensor, the Ricci tensor and the scalar curvature. [Remark: The metric (7.79)
describes a spacetime of a spherically symmetric object with mass M.]
Exercise 7.11. Let R be the Riemann tensor deﬁned with respect to the Levi-
Civita connection. Show that
Rκλµν = 1
2
(
∂ 2gκµ
∂ xλ ∂ xν −∂ 2gλµ
∂ xκ ∂ xν −∂ 2gκν
∂ xλ ∂ xµ + ∂ 2gµν
∂ xκ ∂ xµ
)
+ gζη (/Gamma1ζ κµ /Gamma1η λν −/Gamma1ζ κν /Gamma1η λµ )


## Page 288

where Rκλµν ≡gκζ Rζ λµν . Verify the following symmetries,
Rκλµν =−Rκλνµ (cf (7.43)) (7.80a)
Rκλµν =−Rλκµν (7.80b)
Rκλµν = Rµνκλ (7.80c)
Ric µν = Ric νµ . (7.80d)
Theorem 7.2. (Bianchi identities )L e t R be the Riemann tensor deﬁned with
respect to the Levi-Civita connection. Then R satisﬁes the following identities:
R(X, Y )Z+ R(Z , X )Y+ R(Y, Z )X = 0
(the ﬁrst Bianchi identity) (7.81a)
(∇X R)(Y, Z )V+ (∇Z R)(X, Y )V+ (∇Y R)(Z , X)V = 0
(the second Bianchi identity). (7.81b)
Proof. Our proof follows Nomizu (1981). Deﬁne the symmetrizor /CB by
/CB { f (X, Y, Z )}= f (X, Y, Z )+ f (Z , X, Y )+ f (Y, Z , X). Let us prove the
ﬁrst Bianchi identity /CB {R(X, Y )Z}= 0. Covariant differentiation of the identity
T (X, Y )=∇X Y−∇Y X−[X, Y]= 0 with respect to Z yields
0=∇Z{∇X Y−∇Y X−[X, Y]}
=∇Z∇X Y−∇Z∇Y X−{∇[X,Y] Z+[ Z ,[X, Y]]}
where the torsion-free condition has been used again to derive the second equality.
Symmetrizing this, we have
0= /CB {∇Z∇X Y−∇Z∇Y X−∇[X,Y] Z−[Z ,[X, Y]]}
= /CB {∇Z∇X Y−∇Z∇Y X−∇[X,Y] Z}= /CB {R(X, Y )Z}
where the Jacobi identity /CB {[X,[Y, Z]]}= 0 has been used.
The second Bianchi identity becomes /CB {(∇X R)(Y, Z )}V = 0w h e r e/CB
symmetrizes (X, Y, Z ) only. If the identity R(T (X, Y ), Z )V = R(∇X Y−∇Y X−
[X, Y], Z )V = 0 is symmetrized, we have
0= /CB {R(∇X Y, Z )−R(∇Y X, Z )−R([X, Y], Z )}V
= /CB {R(∇Z X, Y )−R(X,∇Z Y )−R([X, Y], Z )}V. (7.82)
If we note the Leibnitz rule,
∇Z{R(X, Y )V}= (∇Z R)(X, Y )V
+ R(X, Y )∇Z V+ R(∇Z X, Y )V+ R(X,∇Z Y )V
(7.82) becomes
0= /CB {−(∇Z R)(X, Y )+[∇Z , R(X, Y )]−R([X, Y], Z )}V.


## Page 289

The last two terms vanish if R(X, Y )V ={ [ ∇X ,∇Y]−∇[X,Y]}V is substituted
into them,
/CB {[∇Z , R(X, Y )]−R([X, Y], Z )}V
= /CB {[∇Z ,[∇X ,∇Y]]−[∇Z ,∇[X,Y]]−[∇[X,Y],∇Z]+∇[[X,Y],Z]}V
= 0
where the Jacobi identities /CB {[∇Z ,[∇X ,∇Y]]}= /CB {[[X, Y], Z]}= 0 have been
used. We ﬁnally obtain /CB {(∇X R)(Y, Z )}V = 0. /A3
In components, the Bianchi identities are
Rκ λµν + Rκ µνλ + Rκ νλµ = 0
(the ﬁrst Bianchi identity) (7.83a)
(∇κ R)ξ
λµν + (∇µ R)ξ
λνκ + (∇ν R)ξ
λκµ = 0
(the second Bianchi identity). (7.83b)
By contracting the indices ξ and µ of the second Bianchi identity, we obtain an
important relation:
(∇κ Ric )λν + (∇µ R)µλνκ −(∇ν Ric )λκ = 0. (7.84)
If the indices λ and ν are further contracted, we have∇µ(/CA δ−2Ric )µκ = 0o r
∇µGµν = 0 (7.85)
where Gµν is the Einstein tensor deﬁned by
Gµν = Ric µν −1
2 gµν
/CA . (7.86)
Historically, when Einstein formulated general relativity, he ﬁrst equated the Ricci
tensor Ric µν to the energy–momentum tensor T µν . Later he realized that T µν
satisﬁes the covariant conservation equation ∇µT µν = 0 while Ric µν does not.
To avoid this difﬁculty, he proposed that Gµν should be equated to T µν .T h i s
new equation is natural in the sense that it can be derived from a scalar action by
variation, see section 7.10.
Exercise 7.12. Let (M, g) be a two-dimensional manifold with g=−dt⊗dt+
R2(t)dx⊗dx,w h e r eR(t) is an arbitrary function of t. Show that the Einstein
tensor vanishes.
The symmetry properties (7.80a)–(7.80c) restrict the number of independent
components of the Riemann tensor. Letm be the dimension of a manifold(M, g).
The anti-symmetry Rκλµν =−Rλκνµ implies that there are N≡
(m
2
)
independent
choices of the pair (µ, ν). Similarly, from Rκλµν =−Rλκµν ,w eﬁ n dt h e r ea r e


## Page 290

N independent pairs of (κ, λ) .S i n c e Rκλµν is symmetric with respect to the
interchange of the pairs (κ, λ) and (µ, ν), the number of independent choices of
the pairs reduces from N2 to
(N+1
2
)
= 1
2 N(N+ 1). The ﬁrst Bianchi identity
Rκλµν + Rκµνλ + Rκνλµ = 0 (7.87)
further reduces the number of indepe ndent components. The LHS of (7.87) is
totally anti-symmetric with respect to the interchange of the indices ( λ ,µ ,ν ).
Furthermore, the anti-symmetry (7.80b) ensures that it is totally anti-symmetric
in all the indices. If m < 4, (7.87) is trivially satisﬁed and it imposes no additional
restrictions. If m ≥4, (7.87) yields non-trivial constraints only when all the
indices are different. The number of constraints is equal to the number of possible
ways of choosing four different indices out of m indices, namely
(m
4
)
. Noting
that
(m
4
)
= m(m−1)(m−2)(m−3)/4! vanishes for m < 4, the number of
independent components of the Riemann tensor is given by
F(m)= 1
2
( m
2
)[ ( m
2
)
+ 1
]
−
( m
4
)
= 1
12m2(m2−1). (7.88)
F(1)= 0 implies that one-dimensional manifolds are ﬂat. Since F(2)= 1, there
is only one independent component R1212 on a two-dimensional manifold, other
components being either 0 or±R1212. F(4)= 20 is a well-known fact in general
relativity.
Exercise 7.13. Let (M, g) be a two-dimensional manifold. Show that the
Riemann tensor is written as
Rκλµν = K (gκµ gλν −gκν gλµ ) (7.89)
where K ∈/BY (M). Compute the Ricci tensor to show Ric µν ∝gµν . Compute the
scalar curvature to show K = /CA /2.
7.5 Holonomy
Let (M, g) be an m-dimensional Riemannian manifold with an afﬁne connection
∇. The connection naturally deﬁnes a transformation group at each tangent space
Tp M as follows.
Deﬁnition 7.3. Let p be a point in (M, g) and consider the set of closed loops at
p,{c(t)|0 ≤t ≤1, c(0) = c(1) = p}. Take a vector X ∈Tp M and parallel
transport X along a curve c(t). After a trip along c(t), we end up with a new
vector Xc ∈Tp M. Thus, the loop c(t) and the connection ∇induce a linear
transformation
Pc : Tp M→Tp M. (7.90)
The set of these transformations is denoted by H (p) and is called the holonomy
group at p.


## Page 291

We assume that H (p) acts on Tp M from the right, Pc X = Xh (h ∈
H (p)). In components, this becomes Pc X = Xµhµν eν , {eν} being the basis
of Tp M. It is easy to see that H (p) is a group. The product Pc′ Pc corresponds to
parallel transport along c ﬁrst and then c′. If we write Pd = Pc′ Pc, the loop d is
given by
d(t)=
{
c(2t) 0≤t≤1
2
c′(2t−1) 1
2 ≤t≤1. (7.91)
The unit element corresponds to the constant map cp(t) = p (0 ≤t ≤1) and
the inverse of Pc is given by Pc−1 ,w h e r ec−1(t)= c(1−t). Note that H (p) is
a subgroup of GL(m, /CA ), which is the maximal holonomy group possible. H (p)
is trivial if and only if the Riemann tensor vanishes. In particular, if (M, g) is
parallelizable (see example 7.2), we can make H (p) trivial.
If M is (arcwise-)connected, any two points p, q ∈M are connected by a
curve a.T h ec u r v ea deﬁnes a map τa : Tp M→Tq M by parallel transporting a
vector in Tp M to Tq M along a. Then the holonomy groups H (p) and H (q) are
related by
H (q)= τ−1
a H (p)τa (7.92)
hence H (q) is isomorphic to H (p).
In general, the holonomy group is a subgroup of GL(m, /CA ).I f ∇is a metric
connection,∇preserves the length of a vector, gp(Pc(X), Pc (X)) = gp(X, X)
for X∈Tp M. Then the holonomy group must be a subgroup of SO(m) if (M, g)
is orientable and Riemannian and SO(m−1, 1) if it is orientable and Lorentzian.
Example 7.7. We work out the holonomy group of the Levi-Civita connection on
S2 with the metric g= dθ⊗dθ+ sin2 dφ ⊗dφ . The non-vanishing connection
coefﬁcients are /Gamma1θ φφ =−sin θ cos θ and /Gamma1φ φθ = /Gamma1φ θφ = cot θ . For simplicity,
w et a k eav e c t o reθ = ∂/∂θ at a point (θ0, 0) and parallel transport it along a
circle θ = θ0,0 ≤φ ≤2π .L e t X be the vector eθ parallel transported along the
circle. The vector X= Xθ eθ + Xφ eφ satisﬁes
∂φ Xθ −sin θ0 cos θ0 Xφ = 0 (7.93a)
∂φ Xφ + cot θ0 Xθ = 0. (7.93b)
Equations (7.93a) and (7.93b) represen t the harmonic oscillations. Indeed if we
take a φ -derivative of (7.93a) and use (7.93b), we have
d2 Xθ
dφ 2 −sin θ0 cos θ0
dXφ
dφ = d2 Xθ
dφ 2 −cos2 θ0 Xθ = 0. (7.94)
The general solution is Xθ = A cos(C0φ) + B sin(C0φ) ,w h e r eC0 ≡cos θ0.
Since Xθ = 1a t φ = 0w eh a v e
Xθ = cos(C0φ) Xφ =−sin(C0φ)
sin θ0
.


## Page 292

After parallel transport along the circle, we end up with
X (φ = 2π) = cos(2π C0)eθ −sin(2π C0φ)
sin θ0
eφ . (7.95)
Now the vector is rotated by /Theta1= 2π cos θ0, with its magnitude kept ﬁxed. If we
take a point p∈S2 and a circle in S2 which passes through p, we can always ﬁnd
a coordinate system such that the circle is given by θ = θ0 (0≤θ< π ) and we
can apply our previous calculation. The rotation angle is−2π ≤/Theta1<2π and we
ﬁnd that the holonomy group at p∈S2 is SO(2).
In general, Sm (m ≥2) admits the holonomy group SO (m). Product
manifolds admit more restricted holonomy groups. The following example is
taken from Horowitz (1986). Consider six-dimensional manifolds made of the
spheres with standard metrics. Examples are S6, S3 × S3, S2 × S2 × S2, T 6 =
S1×···× S1. Their holonomy groups are:
(i) S6: H (p)= SO(6).
(ii) S3× S3: H (p)= SO(3)× SO(3).
(iii) S2× S2× S2: H (p)= SO(2)× SO(2)× SO(2).
(iv) T 6: H (p) is trivial since the Riemann tensor vanishes.
Exercise 7.14. Show that the holonomy group of the Levi-Civita connection of
the Poincar´e metric given in example 7.6 is SO(2).
7.6 Isometries and conformal transformations
7.6.1 Isometries
Deﬁnition 7.4. Let (M, g) be a (pseudo-)Riemannian manifold. A diffeomor-
phism f : M→M is an isometry if it preserves the metric
f∗g f (p) = gp (7.96a)
that is, if g f (p)( f∗X, f∗Y )= gp(X, Y ) for X, Y ∈Tp M.
In components, the condition (7.96a) becomes
∂ yα
∂ xµ
∂ yβ
∂ xν gαβ ( f (p))= gµν (p)( 7.96b)
where x and y are the coordinates of p and f (p), respectively. The identity map,
the composition of the isometries and the inverse of an isometry are isometries; all
these isometries form a group. Since an isometry preserves the length of a vector,
in particular that of an inﬁnitesimal dis placement vector, it may be regarded as a
rigid motion. For example, in /CA
n , the Euclidean group En, that is the set of maps
f : x↦→Ax+ T (A∈SO(n), T ∈/CA
n ), is the isometry group.


## Page 293

7.6.2 Conformal transformations
Deﬁnition 7.5. Let (M, g) be a (pseudo-)Riemannian manifold. A diffeomor-
phism f : M →M is called a conformal transformation if it preserves the
metric u pt oas c a l e,
f∗g f (p) = e2σ gp σ ∈/BY (M) (7.97a)
namely, g f (p)( f∗X, f∗Y )= e2σ gp (X, Y ) for X, Y ∈Tp M.
In components, the condition (7.97a) becomes
∂ yα
∂ xµ
∂ yβ
∂ xν gαβ ( f (p))= e2σ( p)gµν (p). ( 7.97b)
The set of conformal transformations on M is a group, the conformal group
denoted by Conf(M). Let us deﬁne the angle θ between two vectors X = Xµ∂µ,
Y = Y µ∂µ ∈Tp M by
cos θ = gp(X, Y )
√
gp (X, X )gp(Y, Y ) = gµν XµY ν
√
gζη Xζ Xη gκλ Y κ Y λ . (7.98)
If f is a conformal transformation, the angle θ′ between f∗X and f∗Y is given by
cos θ′ = e2σ gµν XµY ν
√
e2σ gζη Xζ Xη · e2σ gκλ Y κ Y λ
= cos θ
hence f preserves the angle. In other words, f changes the scale but not the
shape.
A concept related to conformal transformations is Weyl rescaling. Let g and
¯g be metrics on a manifold M. ¯g is said to be conformally related to g if
¯gp = e2σ( p)gp. (7.99)
Clearly this is an equivalence relation among the set of metrics on M.T h e
equivalence class is called the conformal structure. The transformation g →
e2σ g is called a Weyl rescaling. The set of Weyl rescalings on M is a group
denoted by Weyl(M).
Example 7.8. Let w = f (z) be a holomorphic function deﬁned on the complex
plane /BV .[ A C∞-function regarded as a function of z= x+ iy and¯z= x−iy is
holomorphic if ∂¯z f (z,¯z)= 0.] We write the real part and the imaginary part of the
respective variables as z= x+ iy and w= u+ iv.T h em a pf : (x, y)↦→(u,v )
is conformal since
du2+ dv2 =
( ∂ u
∂ x dx+ ∂ u
∂ y dy
) 2
+
( ∂v
∂ x dx+ ∂v
∂ y dy
) 2
=
[ ( ∂ u
∂ x
) 2
+
( ∂ u
∂ y
) 2]
(dx2+ dy2) (7.100)


## Page 294

where use has been made of the Cauchy–Riemann relations
∂ u
∂ x = ∂v
∂ y
∂ u
∂ y =−∂v
∂ x .
Exercise 7.15. Let f : M →M be a conformal transformation on a Lorentz
manifold (M, g). Show that f∗: Tp M →T f (p) M preserves the local light cone
structure, namely
f∗:



timelike vector ↦→ timelike vector
null vector ↦→ null vector
spacelike vector ↦→ spacelike vector.
(7.101)
Let ¯g b eam e t r i co nM, which is conformally related to g as ¯g = e2σ( p)g.
Let us compute the Riemann tensor of ¯g. We could simply substitute ¯g into
the deﬁning equation (7.42). However, we follow the elegant coordinate-free
derivation of Nomizu (1981). Let K be the difference of the covariant derivatives
¯∇with respect to ¯g and∇with respect to g,
K (X, Y )≡¯∇X Y−∇X Y. (7.102)
Proposition 7.1. Let U be a vector ﬁeld which corresponds to the one-form d σ :
Z[σ]=⟨ dσ , Z⟩= g(U, Z ).T h e n
K (X, Y )= X[σ]Y+ Y[σ]X−g(X, Y )U. (7.103)
Proof. It follows from the torsion-free condition that K (X, Y )= K (Y, X).S i n c e
¯∇X¯g=∇X g= 0, we have
X[¯g(Y, Z )]= ¯∇X[¯g(Y, Z )]=¯ g(¯∇X , Z )+¯g(Y, ¯∇X Z )
and also
X[¯g(Y, Z )]=∇X[e2σ g(Y, Z )]
= 2X[σ]e2σ g(Y, Z )+ e2σ[g(∇X , Z )+ g(Y,∇X Z )].
Taking the difference between these two expressions, we have
g(K (X, Y ), Z )+ g(Y, K (X, Z ))= 2X[σ]g(Y, Z ). (7.104a)
Permutations of (X, Y, Z ) yield
g(K (Y, X ), Z )+ g(X, K (Y, Z ))= 2Y[σ]g(X, Z ) (7.104b)
g(K (Z , X ), Y )+ g(X, K (Z , Y ))= 2Z[σ]g(X, Y ). (7.104c)
The combination (7.104a)+ (7.104b)−(7.104c) yields
g(K (X, Y ), Z )= X[σ]g(Y, Z )+ Y[σ]g(X, Z )−Z[σ]g(X, Y ). (7.105)


## Page 295

The last term is modiﬁed as
Z[σ]g(X, Y )= g(U, Z )g(X, Y )= g(g(Y, X)U, Z ).
Substituting this into (7.105), we ﬁnd
g(K (X, Y )−X[σ]Y−Y[σ]X+ g(X, Y )U, Z )= 0.
Since this is true for any Z, we have (7.103). /A3
The component expression for K is
K (eµ, eν )= ¯∇µeν −∇µeν = (¯/Gamma1λ µν −/Gamma1λ µν )eλ
= eµ[σ]eν + eν[σ]eµ−g(eµ, eν )gκλ ∂κ σ eλ
from which it is readily seen that
¯/Gamma1λ
µν = /Gamma1λ µν + δλ ν ∂µσ + δλ µ∂ν σ −gµν gκλ ∂κ σ. (7.106)
To ﬁnd the Riemann curvature tensor, we start from the deﬁnition,
¯R(X, Y )Z= ¯∇X ¯∇Y Z−¯∇Y ¯∇X Z−¯∇[X,Y] Z
= ¯∇X[∇Y Z+ K (Y, Z )]−¯∇Y[∇X Z+ K (X, Z )]
−{∇[X,Y] Z+ K ([X, Y], Z )}
=∇X{∇Y Z+ K (Y, Z )}+ K (X,∇Y Z+ K (Y, Z ))
−∇Y{∇X Z+ K (X, Z )}−K (Y,∇X Z+ K (X, Z ))
−{∇[X,Y] Z+ K ([X, Y], Z )}. (7.107)
After a straightforward but tedious calculation, we ﬁnd that
¯R(X, Y )Z= R(X, Y )Z+⟨∇X dσ, Z⟩Y−⟨∇Y dσ, Z⟩X
−g(Y, Z )∇X U+ Y[σ]Z[σ]X
−g(Y, Z )U[σ]X+ X[σ]g(Y, Z )U
+ g(X, Z )∇Y U−X[σ]Z[σ]Y
+ g(X, Z )U[σ]Y−Y[σ]g(X, Z )U. (7.108)
Let us deﬁne a type (1, 1) tensor ﬁeld B by
BX ≡−X[σ]U+∇X U+ 1
2 U[σ]X. (7.109)
Since g(∇Y U, Z )=⟨∇Y dσ, Z⟩ (exercise 7.8(c)), (7.108) becomes
¯R(X, Y )Z= R(X, Y )Z−[g(Y, Z )BX −g(BX , Z )Y
+ g(BY, Z )X−g(X, Z )BY]. (7.110)


## Page 296

In components, this becomes
¯Rκ
λµν = Rκ λµν −gνλ Bµκ + gξλ Bµξ δκ ν −gξλ Bν ξ δκ µ+ gµλ Bν κ
(7.111)
where the components of the tensor B are
Bµκ =−∂µσ U κ + (∇µU )κ + 1
2 U[σ]δµκ
=−∂µσ gκλ ∂λ σ + gκλ (∂µ∂λ σ −/Gamma1ξ µλ ∂ξ σ) + 1
2 gλξ ∂λ σ∂ ξ σδ µκ .
(7.112)
Note that Bµν ≡gνλ Bµλ = Bνµ .
By contracting the indices in (7.111), we obtain
Ric µν = Ric µν −gµν Bλ λ −(m−2)Bνµ (7.113)
e2σ ¯
/CA = /CA −2(m−1)Bλ λ (7.114a)
where m= dim M. Equation (7.114a) is also written as
¯gµν ¯
/CA =[ /CA −2(m−1)Bλ λ]gµν . (7.114b)
If we eliminate gµν Bλ λ and Bµν in ¯Rκ λµν in favour of
 Ric and ¯
/CA and separate
barred and unbarred terms, we ﬁnd a combination which is independent of σ ,
Cκλµν = Rκλµν + 1
m−2 (Ric κµ gλν −Ric λµ gκν + Ric λν gκµ −Ric κν gλµ )
+
/CA
(m−2)(m−1) (gκµ gλν −gκν gλµ ) (7.115)
where m ≥4 (see problem 7.2 for m = 3). The tensor C is called the Weyl
tensor. The reader should verify that Cκλµν = ¯Cκλµν .
If every point p of a (pseudo-)Riemannian manifold (M, g) has a chart
(U,ϕ ) containing p such that gµν = e2σ δµν ,t h e n (M, g) is said to be
conformally ﬂat. Since the Weyl tensor vanishes for a ﬂat metric, it also vanishes
for a conformally ﬂat metric. If dim M ≥4, then C = 0 is the necessary and
sufﬁcient condition for conformal ﬂ atness (Weyl–Schouten). If dim M = 3, the
Weyl tensor vanishes identically; see problem 7.2. If dim M = 2, M is always
conformally ﬂat; see the next example.
Example 7.9. Any two-dimensional Riemannian manifold (M, g) is conformally
ﬂat. Let (x, y) be the original local coordinates with which the metric takes the
form
ds2 = gxx dx2+ 2gxy dx dy+ gyy dy2. (7.116)


## Page 297

Let g≡gxx gyy −g2
xy and write (7.116) as
ds2 =
(√
gxx dx+ gxy + i√
g
√
gxx
dy
)( √
gyy dx+ gxy −i√
g
√
gxx
dy
)
.
According to the theory of differential equations, there exists an integrating factor
λ( x, y)= λ 1(x, y)+ iλ 2(x, y) such that
λ
(√
gxx dx+ gxy + i√
g
√
gxx
dy
)
= du+ id v (7.117a)
¯λ
(√
gyy dx+ gxy −i√
g
√
gxx
dy
)
= du−id v. (7.117b)
Then ds2 = (du2+ dv2)/|λ|2 and by setting |λ|−2 = e2σ , we have the desired
coordinate system. The coordinates (u,v ) are called the isothermal coordinates.
[Remark:I ft h ec u r v eu = a constant is regarded as an isothermal curve, v = a
constant corresponds to the line of heat ﬂow.]
For example, let ds2 = dθ 2+sin2 θ dφ 2 be the standard metric of S2. Noting
that
d
dθ log
⏐⏐
⏐
⏐tan θ
2
⏐
⏐
⏐
⏐= 1
sin θ
we ﬁnd that f : (θ, φ) ↦→(u,v ) deﬁned by u= log| tan 1
2 θ| and v= φ yields a
conformally ﬂat metric. In fact,
ds2 = sin2 θ
(
dθ 2
sin2 θ
+ dφ 2
)
= sin2 θ( du2+ dv2).
If (M, g) is a Lorentz manifold, we have integrating factors λ( x, y) and
µ(x, y) such that
λ
(√
gxx dx+ gxy +√
−g
√
gxx
dy
)
= du+ dv (7.118a)
µ
(√
gxx dx+ gxy −√
−g
√
gxx
dy
)
= du−dv. (7.118b)
In terms of the coordinates (u,v ) the metric takes the form ds2 = λ−1µ−1(du2−
dv2). The product λµ is either positive deﬁnite or negative deﬁnite and we may
set 1/|λµ|= e2σ to obtain the form
ds2 =± e2σ (du2−dv2). (7.119)
Exercise 7.16. Let (M, g) be a two-dimensional Lorentz manifold with g =
−dt⊗dt+ t2dx⊗dx (the Milne universe). Use the transformation|t|↦→eη to
show that g is conformally ﬂat. In fact, it is further simpliﬁed by (η, x)↦→(u=
eη sinh x,v = eη cosh x). What is the resulting metric?


## Page 298

7.7 Killing vector ﬁelds and conformal Killing vector ﬁelds
7.7.1 Killing vector ﬁelds
Let (M, g) be a Riemannian manifold and X ∈/CG (M). If a displacement ε X, ε
being inﬁnitesimal, generates an isometry, the vector ﬁeld X is called a Killing
vector ﬁeld. The coordinates xµ of a point p∈M change to xµ+ ε X µ(p) under
this displacement, see (5.42). If f : xµ ↦→xµ+ ε Xµ is an isometry, it satisﬁes
(7.96b),
∂( xκ + ε Xκ )
∂ xµ
∂( xλ + ε Xλ )
∂ xν gκλ (x+ ε X)= gµν (x).
After a simple calculation, we ﬁnd that gµν and Xµ satisfy the Killing equation
X ξ ∂ξ gµν + ∂µ Xκ gκν + ∂ν Xλ gµλ = 0. (7.120a)
From the deﬁnition of the Lie derivative, this is written in a compact form as
(/C4
X g)µν = 0. (7.120b)
Let φ t : M →M be a one-parameter group of transformations which generates
the Killing vector ﬁeld X. Equation (7.120b) then shows that the local geometry
does not change as we move along φ t . In this sense, the Killing vector ﬁelds
represent the direction of the symmetry of a manifold.
A set of Killing vector ﬁelds are deﬁned to be dependent if one of them
is expressed as a linear combination of others with constant coefﬁcients. Thus,
there may be more Killing vector ﬁelds than the dimension of the manifold. [The
number of independent symmetries has no direct connection with dim M.T h e
maximum number, however, has; see example 7.10.]
Exercise 7.17. Let ∇be the Levi-Civita connection. Show that the Killing
equation is written as
(∇µ X )ν + (∇ν X )µ = ∂µ Xν + ∂ν Xµ−2/Gamma1λ µν Xλ = 0. (7.121)
Exercise 7.18. Find three Killing vector ﬁelds of (/CA
2 ,δ ). Show that two of
them correspond to translations while the third corresponds to a rotation; cf next
example.
Example 7.10. Let us work out the Killing vector ﬁelds of the Minkowski
spacetime (/CA
4 ,η ), for which all the Levi-Civita connection coefﬁcients vanish.
The Killing equation becomes
∂µ Xν + ∂ν Xµ = 0. (7.122)
It is easy to see that Xµ is, at most, of the ﬁrst order in x. The constant solutions
X µ
(i) = δµ
i (0≤i≤3) (7.123a)


## Page 299

correspond to spacetime translations. Next, let Xµ = aµν xµ, aµν being constant.
Equation (7.122) implies that aµν is anti-symmetric with respect to µ↔ν .S i n c e(4
2
)= 6, there are six independent solutions of this form, three of which
X( j )0 = 0 X( j )m = ε jmn xn (1≤j, m, n≤3) (7.123b)
correspond to spatial rotations about the x j -axis, while the others
X(k)0 = xk X(k)m =−δkm x0 (1≤k, m≤3) (7.123c)
correspond to Lorentz boosts along the xk -axis.
In m-dimensional Minkowski spacetime (m ≥2),t h e r ea r em(m+ 1)/2
Killing vector ﬁelds, m of which generate translations, (m −1), boosts and
(m−1)(m−2)/2, space rotations. Those spaces (or spacetimes) which admit
m(m+ 1)/2 Killing vector ﬁelds are called maximally symmetric spaces.
Let X and Y be two Killing vector ﬁelds. We easily verify that
(i) a linear combination aX + bY (a, b∈/CA ) is a Killing vector ﬁeld; and
(ii) the Lie bracket [X, Y] is a Killing vector ﬁeld.
(i) is obvious from the linearity of the covariant derivative. To prove (ii), we use
(5.58). We have /C4
[X,Y]g = /C4
X
/C4
Y g−/C4
Y
/C4
X g = 0, since /C4
X g = /C4
Y g = 0.
Thus, all the Killing vector ﬁelds form a Lie algebra of the symmetric operations
on the manifold M; see the next example.
Example 7.11. Let g= dθ⊗dθ+ sin2 θ dφ ⊗dφ be the standard metric of S2.
The Killing equations (7.121) are:
∂θ Xθ + ∂θ Xθ = 0 (7.124a)
∂φ Xφ + ∂φ Xφ + 2s i nθ cos θ Xθ = 0 (7.124b)
∂θ Xφ + ∂φ Xθ −2c o tθ Xφ = 0. (7.124c)
It follows from (7.124a) that Xθ is independent of θ : Xθ (θ, φ) = f (φ) .
Substituting this into (7.124b), we have
Xφ =−F(φ) sin θ cos θ+ g(θ ) (7.125)
where F(φ) =
∫ φ f (φ) dφ . Substitution of (7.125) into (7.124c) yields
−F(φ)( cos2 θ−sin2 θ)+ dg
dθ + d f
dφ + 2c o tθ( F(φ) sin θ cos θ−g(θ ))= 0.
This equation may be separated into
dg
dθ −2c o tθ g(θ )=−d f
dφ −F(φ).


## Page 300

Since both sides must be separately constant (≡C),w eh a v e
dg
dθ −2c o tθ g(θ )= C (7.126a)
d f
dφ + F(φ) =−C. (7.126b)
Equation (7.126a) is solved if we multiply both sides by exp (−∫ dθ 2c o tθ) =
sin−2 θ to make the LHS a total derivative,
d
dθ
( g(θ )
sin2 θ
)
= C
sin2 θ
.
The solution is easily found to be
g(θ )= (C1−C cot θ) sin2 θ.
Differentiating (7.126b) again, we ﬁnd that f is harmonic,
Xθ (φ) = f (φ) = A sin φ + B cos φ
F(φ) =−A cos φ + B sin φ −C.
Substituting these results into (7.125), we have
Xφ (θ, φ) =−(−A cos φ + B sin φ −C) sin θ cos θ+ (C1−C cot θ) sin2 θ
= (A cos φ −B sin φ) sin θ cos θ+ C1 sin2 θ.
A general Killing vector is given by
X= Xθ ∂
∂θ + Xφ ∂
∂φ
= A
(
sin φ ∂
∂θ + cos φ cot θ ∂
∂φ
)
+ B
(
cos φ ∂
∂θ −sin φ cot θ ∂
∂φ
)
+ C1
∂
∂φ . (7.127)
The basis vectors
Lx =−cos φ ∂
∂θ + cot θ sin φ ∂
∂φ (7.128a)
Ly = sin φ ∂
∂θ + cot θ cos φ ∂
∂φ (7.128b)
Lz = ∂
∂φ (7.128c)
generate rotations round the x, y and z axes respectively.


## Page 301

These vectors generate the Lie algebra /D7/D3 (3). This reﬂects the fact that S2
is the homogeneous space SO (3)/SO(2) and the metric on S2 retains this SO(3)
symmetry (see example 5.18(a)). In general Sn = SO(n+ 1)/SO(n) with the
usual metric has dim SO (n+ 1) = n(n+ 1)/2 Killing vectors and they form
the Lie algebra /D7/D3 (n+ 1). The sphere Sn with the usual metric is a maximally
symmetric space. We may squash S n so that it has fewer symmetries. For
example, if S2 considered here is squashed along the z-axis it has a rotational
symmetry around the z-axis only and there exists one Killing vector ﬁeld Lz =
∂/∂φ .
7.7.2 Conformal Killing vector ﬁelds
Let (M, g) be a Riemannian manifold and let X ∈/CG (M). If an inﬁnitesimal
displacement given by ε X generates a conformal transformation, the vector ﬁeld
X is called a conformal Killing vector ﬁeld (CKV). Under the displacement
xµ →xµ+ ε Xµ, this condition is written as
∂( xκ + ε Xκ )
∂ xµ
∂( xλ + ε Xλ )
∂ xν gκλ (x+ ε X)= e2σ gµν (x).
Noting that σ ∝ε,w es e tσ = εψ/ 2, where ψ ∈/BY (M). Then we ﬁnd that gµν
and Xµ satisfy
/C4
X gµν = Xξ ∂ξ gµν + ∂µ Xκ gκν + ∂ν Xλ gµλ = ψ gµν . (7.129a)
Equation (7.129a) is easily solved for ψ to yield
ψ = Xξ gµν ∂ξ gµν + 2∂µ Xµ
m (7.129b)
where m= dim M.W ev e r i f yt h a t
(i) a linear combination of CKVs is a CKV: (/C4
aX+bY g)µν = (aϕ + bψ) gµν
where a, b∈/CA , /C4
X gµν = ϕ gµν and /C4
Y gµν = ψ gµν ;
(ii) the Lie bracket [X, Y] of a CKV is again a CKV: /C4
[X,Y]gµν = (X[ψ]−
Y[ϕ])gµν .
Example 7.12. Let xµ be the coordinates of (/CA
m ,δ ). The vector
D≡xµ ∂
∂ xµ (7.130)
(dilatation vector) is a CKV . In fact,
/C4
D δµν = ∂µxκ δκν + ∂ν xλ δµλ = 2δµν .


## Page 302

7.8 Non-coordinate bases
7.8.1 Deﬁnitions
In the coordinate basis, Tp M is spanned by{eµ}={ ∂/∂ xµ} and T∗
p M by{dxµ}.
If, moreover, M is endowed with a metric g, there may be an alternative choice.
Let us consider the linear combination,
ˆeα = eα µ ∂
∂ xµ {eα µ}∈GL(m, /CA ) (7.131)
where det eα µ > 0. In other words, {ˆeα} is the frame of basis vectors which is
obtained by a GL(m, /CA )-rotation of the basis{eµ} preserving the orientation. We
require that{ˆeα} be orthonormal with respect to g,
g(ˆeα ,ˆeβ )= eα µeβ ν gµν = δαβ . (7.132a)
If the manifold is Lorentzian, δαβ should be replaced by η αβ . We easily reverse
(7.132a),
gµν = eα µeβ ν δαβ (7.132b)
where eα µ is the inverse of eα µ; eα µeα ν = δµν , eα µeβ µ = δα β . [We have used
the same symbols for a matrix and its inverse. So long as the indices are written
explicitly it does not cause confusion.] Since a vector V is independent of the
basis chosen, we have V = V µeµ = V α ˆeα = V α eα µeµ. It follows that
V µ = V α eα µ V α = eα µV µ. (7.133)
Let us introduce the dual basis{ˆθ α} deﬁned by⟨ˆθ α ,ˆeβ⟩= δα β . ˆθ α is given
by
ˆθ α = eα µdxµ. (7.134)
In terms of{ˆθ α}, the metric is
g= gµν dxµ⊗dxν = δαβ ˆθ α ⊗ˆθ β . (7.135)
The bases {ˆeα} and{ˆθ α} are called the non-coordinate bases .W e u s e κ, λ,
µ , ν , ... ( α , β , γ, δ ,... ) to denote the coordinate (non-coordinate) basis. The
coefﬁcients eα µ are called the vierbeins if the space is four dimensional and
vielbeins if it is many dimensional. The non-coordinate basis has a non-vanishing
Lie bracket. If the{ˆeα} are given by (7.131), they satisfy
[ˆeα ,ˆeβ]|p = cαβ γ (p)ˆeγ|p (7.136a)
where
cαβ γ (p)= eγ ν[eα µ∂µeβ ν −eβ µ∂µeα ν](p). (7.136b)


## Page 303

Example 7.13. The standard metric on S2 is
g= dθ⊗dθ+ sin2 θ dφ ⊗dφ = ˆθ 1⊗ˆθ 1+ˆθ 2⊗ˆθ 2 (7.137)
where ˆθ 1 = dθ and ˆθ 2 = sin θ dφ . The ‘zweibeins’ are
e1θ = 1 e1φ = 0
e2θ = 0 e2φ = sin θ.
(7.138)
The non-vanishing components of cαβ γ are c122 =−c212 =−cot θ .
Exercise 7.19. (a) Verify the identities,
δαβ = gµν eα µeβ ν gµν = δαβ eα µeβ ν . (7.139)
(b) Let γ α be the Dirac matrices in Minkowski spacetime, which satisfy
{γ α ,γ β}= 2η αβ . Deﬁne the curved spacetime counterparts of the Dirac matrices
by γ µ ≡eα µγ α . Show that
{γ µ,γ ν}= 2gµν . (7.140)
7.8.2 Cartan’s structure equations
In section 7.3 the curvature tensor R and the torsion tensor T have been deﬁned
by
R(X, Y )Z=∇X∇Y Z−∇Y∇X Z−∇[X,Y] Z
T (X, Y )=∇X Y−∇Y X−[X, Y].
Let{ˆeα} be the non-coordinate basis and {ˆθ α} the dual basis. The vector ﬁelds
{ˆeα} satisfy[ˆeα ,ˆeβ]= cαβ γ ˆeγ . Deﬁne the connection coefﬁcients with respect to
the basis{ˆeα} by
∇α ˆeβ ≡∇ˆeα ˆeβ = /Gamma1γ αβ ˆeγ . (7.141)
Letˆeα = eα µeµ. Then (7.141) becomes eα µ(∂µeβ ν+eβ λ /Gamma1ν µλ )eν = /Gamma1γ αβ eγ ν eν ,
from which we ﬁnd that
/Gamma1γ αβ = eγ ν eα µ(∂µeβ ν + eβ λ /Gamma1ν µλ )= eγ ν eα µ∇µeβ ν . (7.142)
The components of T and R in this basis are given by
T α βγ =⟨ ˆθ α , T (ˆeβ ,ˆeγ )⟩=⟨ ˆθ α ,∇β ˆeγ −∇γ ˆeβ −[ˆeβ ,ˆeγ]⟩
= /Gamma1α βγ −/Gamma1α γβ −cβγ α . (7.143)
Rα βγδ =⟨ ˆθ α ,∇γ∇δˆeβ −∇δ∇γ ˆeβ −∇[ˆeγ ,ˆeδ]ˆeβ⟩
=⟨ ˆθ α ,∇γ (/Gamma1ε δβ ˆeε )−∇δ /Gamma1ε γβ ˆeε )−cγδ ε∇εˆeβ⟩
=ˆeγ[/Gamma1α δβ]−ˆeδ[/Gamma1α γβ ]+ /Gamma1ε δβ /Gamma1α γε −/Gamma1ε γβ /Gamma1α δε −cγδ ε /Gamma1α εβ .
(7.144)


## Page 304

We deﬁne a matrix-valued one-form{ω α β} called the connection one-form by
ω α β ≡/Gamma1α γβ ˆθ γ . (7.145)
Theorem 7.3. The connection one-form ω α β satisﬁes Cartan’s structure
equations,
dˆθ α + ω α β ∧ˆθ β = T α (7.146a)
dω α β + ω α γ ∧ω γ β = Rα β (7.146b)
where we have introduced the torsion two-form T α ≡1
2 T α βγ ˆθ β ∧ˆθ γ and the
curvature two-form Rα β ≡1
2 Rα βγδ ˆθ γ ∧ˆθ δ .
Proof. Let the LHS of (7.146a) act on the basis vectorsˆeγ andˆeδ ,
dˆθ α (ˆeγ ,ˆeδ )+[⟨ ω α β ,ˆeγ⟩⟨ˆθ β ,ˆeδ⟩−⟨ˆθ β ,ˆeγ⟩⟨ω α β ,ˆeδ⟩]
={ˆeγ[⟨ˆθ α ,ˆeδ⟩]−ˆeδ[⟨ˆθ α ,ˆeγ⟩]−⟨ˆθ α ,[ˆeγ ,ˆeδ]⟩}+{⟨ ω α δ ,ˆeγ⟩−⟨ω α γ ,ˆeδ⟩}
=−cγδ α + /Gamma1α γδ −/Gamma1α δγ = T α γδ
where use has been made of (5.70). The RHS acting on ˆeγ andˆeδ yields
1
2 T α βε [⟨ˆθ β ,ˆeγ⟩⟨ˆθ ε ,ˆeδ⟩−⟨ˆθ ε ,ˆeγ⟩⟨ˆθ β ,ˆeδ⟩]= T α γδ
which veriﬁes (7.146a).
Equation (7.146b) may be proved similarly (exercise). /A3
Taking the exterior derivative of (7.146a) and (7.146b), we have theBianchi
identities
dT α + ω α β ∧T β = Rα β ∧ˆθ β (7.147a)
dRα β + ω α γ ∧Rγ β −Rα γ ∧ω γ β = 0. (7.147b)
These are the non-coordinate basis versions of (7.81a) and (7.81b).
7.8.3 The local frame
In an m-dimensional Riemannian manifold, the metric tensorgµν has m(m+1)/2
degrees of freedom while the vielbein eα µ has m2 degrees of freedom. There are
many non-coordinate bases which yield the same metric, g, each of which is
related to the other by the local orthogonal rotation,
ˆθ α −→ˆθ′α (p)= /Lambda1α β (p)ˆθ β (p) (7.148)
at each point p. The vielbein transforms as
eα µ(p)−→e′α µ(p)= /Lambda1α β (p)eβ µ(p). (7.149)


## Page 305

Unlike κ ,λ ,µ ,ν ,... which transform under coordinate changes, the indices
α ,β ,γ,... transform under the local orthogonal rotation and are inert under
coordinate changes. Since the metric tensor is invariant under the rotation, /Lambda1α β
satisﬁes
/Lambda1α β δαδ /Lambda1δ γ = δβγ if M is Riemannian (7.150a)
/Lambda1α β η αδ /Lambda1δ γ = η βγ if M is Lorentzian. (7.150b)
This implies that{/Lambda1α β (p)}∈SO(m) if M is Riemannian with dim M = m and
{/Lambda1α β (p)}∈SO(m−1, 1) if M is Lorentzian. The dimension of these Lie groups
is m(m−1)/2= m2 −m(m+ 1)/2, that is the difference between the degrees
of freedom of eα µ and gµν . Under the local frame rotation /Lambda1α β (p), the indices
α ,β ,γ,δ ,... are rotated while κ ,λ ,µ ,ν ,... (world indices) are not affected.
Under the rotation (7.148), the basis vector transforms as
ˆeα −→ ˆe′
α =ˆeβ (/Lambda1−1)β
α . (7.151)
Let t = tµν eµ ⊗dxν be a tensor ﬁeld of type (1, 1). In the bases {ˆeα}
and {ˆθ α},w eh a v e t = tα β ˆeα ⊗ˆθ β ,w h e r etα β = eα µeβ ν tµν . If the new
frames{ˆe′
α}={ˆ eβ (/Lambda1−1)β α} and{ˆθ′α}={ /Lambda1α β ˆθ β} are employed, the tensor t
is expressed as
t= t′α β ˆe′
α ⊗ˆθ′β = t′α β ˆeγ (/Lambda1−1)γ
α ⊗/Lambda1β δˆθ δ
from which we ﬁnd the transformation rule,
tα β −→t′α β = /Lambda1α γ tγ δ (/Lambda1−1)δ
β .
To summarize, the upper (lower) non-coordinate indices are rotated by /Lambda1(/Lambda1−1).
The change from the coordinate basis to t he non-coordinate basis is carried out
by multiplications of vielbeins.
From these facts we ﬁnd the transformation rule of the connection one-form
ω α β . The torsion two-form transforms as
T α −→T′α = dˆθ′α + ω′α β ∧ˆθ′β = /Lambda1α β[dˆθ β + ω β γ ∧ˆθ γ].
Substituting ˆθ′α = /Lambda1α β ˆθ β into this equation, we ﬁnd that
ω′α β /Lambda1β γ = /Lambda1α δ ω δ γ −d/Lambda1α γ .
Multiplying both sides by /Lambda1−1 from the right, we have
ω′α β = /Lambda1α γ ω γ δ (/Lambda1−1)δ
β + /Lambda1α γ (d/Lambda1−1)γ
β (7.152)
where use has been made of the identity d/Lambda1/Lambda1−1+ /Lambda1d/Lambda1−1 = 0, which is derived
from /Lambda1/Lambda1−1 = Im .
The curvature two-form transforms homogeneously as
Rα β −→R′α β = /Lambda1α γ Rγ δ (/Lambda1−1)δ
β (7.153)
under a local frame rotation /Lambda1.


## Page 306

7.8.4 The Levi-Civita connection in a non-coordinate basis
Let∇be a Levi-Civita connection on(M, g), which is characterized by the metric
compatibility∇X g = 0, and the vanishing torsion /Gamma1λ µν −/Gamma1λ νµ = 0. It is
interesting to see how these conditions are expressed in the present approach.
The components /Gamma1λ µν and /Gamma1α βγ are related to each other by (7.142). Let (M, g)
be a Riemannian manifold (if (M, g) is Lorentzian, we simply replace δαβ all
below by η αβ ). If we deﬁne the Ricci rotation coefﬁcient /Gamma1αβ γ by δαδ /Gamma1δ βγ the
metric compatibility is expressed as
/Gamma1αβ γ = δαδ eδ λ eβ µ∇µeγ λ =−δαδ eγ λ eβ µ∇µeδ λ
=−δγδ eδ λ eβ µ∇µeα λ =−/Gamma1γβα (7.154)
where∇µg = 0 has been used. In terms of the connection one-form ω αβ ≡
δαγ ω γ β , this becomes
ω αβ =−ω βα . (7.155)
The torsion-free condition is
dˆθ α + ω α β ∧ˆθ β = 0. (7.156)
The reader should verify that (7.156) implies the symmetry of the connection
coefﬁcient /Gamma1λ µν = /Gamma1λ νµ in the coordinate basis. The condition (7.156) enables
us to compute the cαβ γ of the basis{ˆeα}. Let us look at the commutation relation
cαβ γ ˆeγ =[ˆeα ,ˆeβ]=∇α ˆeβ −∇β ˆeα (7.157)
where the ﬁnal equality follows from the torsion-free condition. From (7.141),
we ﬁnd that
cαβ γ = /Gamma1γ αβ −/Gamma1γ βα . (7.158)
Substituting (7.158) into (7.144) we may express the Riemaun curvature tensor in
terms of /Gamma1only,
Rα βγδ =ˆeγ[/Gamma1α δβ]−ˆeδ[/Gamma1α γβ ]+ /Gamma1ε δβ /Gamma1α γε −/Gamma1ε γβ /Gamma1α δε
−(/Gamma1ε γδ −/Gamma1ε δγ )/Gamma1α εβ . (7.159)
Example 7.14. Let us take the sphere S2 of example 7.13. The components of
eα µ are
e1θ = 1 e1φ = 0 e2θ = 0 e2φ = sin θ. (7.160)
We ﬁrst note that the metric condition implies ω 11 = ω 22 = 0, hence ω 11 =
ω 22 = 0. Other connection one-forms are obtained from the torsion-free
conditions,
d(dθ)+ ω 12∧(sin θ dφ) = 0 (7.161a)
d(sin θ dφ) + ω 21∧dθ = 0. (7.161b)


## Page 307

From the second equation of (7.161), we easily see that ω 21 = cos θ dφ and the
metric condition ω 12 =−ω 21 implies ω 12 =−cos θ dφ . The Riemann tensor is
also found from Cartan’s structure equation,
ω 12∧ω 21 = 1
2 R11αβ ˆθ α ∧ˆθ β (7.162a)
dω 12 = 1
2 R12αβ ˆθ α ∧ˆθ β (7.162b)
dω 21 = 1
2 R21αβ ˆθ α ∧ˆθ β (7.162c)
ω 21∧ω 12 = 1
2 R22αβ ˆθ α ∧ˆθ β . (7.162d)
The non-vanishing components are R1212 =−R1221 = sin θ , R2112 =
−R2121 =−sin θ . The transition to the coordinate basis expression is carried
out with the help of eα µ and eα µ. For example,
Rθ φθφ = eα θ eβ φ eγ θ eδ φ Rα βγδ = 1
sin2 θ
R1212 = 1
sin θ .
Example 7.15. The Schwarzschild metric is given by
ds2 =−
(
1−2M
r
)
dt2+ 1
1−2M
r
dr2+ r2(dθ 2+ sin2 θ dφ 2)
=−ˆθ 0⊗ˆθ 0+ˆθ 1⊗ˆθ 1+ˆθ 2⊗ˆθ 2+ˆθ 3⊗ˆθ 3 (7.163)
where
ˆθ 0 =
(
1−2M
r
) 1/2
dt ˆθ 1 =
(
1−2M
r
)−1/2
dr
ˆθ 2 = r dθ ˆθ 3 = r sin θ dφ.
(7.164)
The parameters run over the range 0 < 2M < r,0 ≤θ ≤π and 0≤φ< 2π .
The metric condition yields ω 00 = ω 11 = ω 22 = ω 33 = 0 and the torsion-free
conditions are:
d[(1−2M/r )1/2dt]+ ω 0β ∧ˆθ β = 0 (7.165a)
d[(1−2M/r )−1/2dr]+ ω 1β ∧ˆθ β = 0 (7.165b)
d(r dθ)+ ω 2β ∧ˆθ β = 0 (7.165c)
d(r sin θ dφ) + ω 3β ∧ˆθ β = 0. (7.165d)
The non-vanishing components of the connection one-forms are
ω 01 = ω 10 = M
r2 dt ω 21 =−ω 12 =
(
1−2M
r
) 1/2
dθ
ω 31 =−ω 13 =
(
1−2M
r
) 1/2
sin θ dφω 32 =−ω 23 = cos θ dφ.
(7.166)


## Page 308

The curvature two-forms are found from the structure equations to be
R01 = R10 = 2M
r3
ˆθ 0∧ˆθ 1 R02 = R20 =−2M
r3
ˆθ 0∧ˆθ 2
R03 = R30 =−M
r3
ˆθ 0∧ˆθ 3 R12 =−R21 =−M
r3
ˆθ 1∧ˆθ 2
R13 =−R31 =−M
r3
ˆθ 1∧ˆθ 3 R23 =−R32 = 2M
r3
ˆθ 2∧ˆθ 3.
(7.167)
7.9 Differential forms and Hodge theory
7.9.1 Invariant volume elements
We have deﬁned the volume element as a non-vanishing m-form on an m-
dimensional orientable manifold M in section 5.5. If M is endowed with a
metric g, there exists a natural volume element which is invariant under coordinate
transformation. Let us deﬁne the invariant volume element by
/Omega1M ≡
√
|g| dx1∧dx2∧... ∧dxm (7.168)
where g = det gµν and xµ are the coordinates of the chart (U,ϕ ) .T h e m-form
/Omega1M is, indeed, invariant under a coordinate change. Let yλ be the coordinates of
another chart (V ,ψ) with U∩V ̸=∅. The invariant volume element is
√
⏐⏐
⏐
⏐det
( ∂ x
µ
∂ yκ
∂ xν
∂ yλ gµν
) ⏐
⏐
⏐
⏐ dy
1∧... ∧dym
in terms of the y-coordinates. Noting that dyλ = (∂ yλ /∂ xµ) dxµ, this becomes
⏐
⏐⏐⏐det
( ∂ x
µ
∂ yκ
) ⏐⏐⏐⏐
√
|g| det
( ∂ yλ
∂ xν
)
dx1∧dx2∧... ∧dxm
=±
√
|g|dx1∧dx2∧... ∧dxm .
If xµ and yκ deﬁne the same orientation, det (∂ xµ/∂ yκ ) is strictly positive on
U∩V and /Omega1M is invariant under the coordinate change.
Exercise 7.20. Let{ˆθ α}={ eα µdxµ} be the non-coordinate basis. Show that the
invariant volume element is written as
/Omega1M =| e| dx1∧dx2∧... ∧dxm = ˆθ 1∧ˆθ 2∧... ∧ˆθ m (7.169)
where e= det eα µ.
Now that we have deﬁned the invariant volume element, it is natural to deﬁne
an integration of f ∈/BY (M) over M by
∫
M
f /Omega1M ≡
∫
M
f
√
|g| dx1 dx2 ... dxm . (7.170)


## Page 309

Obviously (7.170) is invariant under a change of coordinates. In physics, there
are many objects which are expressed as volume integrals of this type, see
section 7.10.
7.9.2 Duality transformations (Hodge star)
As noted in section 5.4, /Omega1
r (M) is isomorphic to /Omega1m−r (M) on an m-dimensional
manifold M.I f M is endowed with a metric g, we can deﬁne a natural
isomorphism between them called the Hodge∗operation. Deﬁne the totally
anti-symmetric tensor ε by
εµ1µ2 ...µm =



+1i f (µ1µ2 ...µ m ) is an even permutation of (12 ... m)
−1i f (µ1µ2 ...µ m ) is an odd permutation of (12 ... m)
0o t h e r w i s e.
(7.171a)
Note that
εµ1 µ2...µm = gµ1ν1 gµ2ν2 ... gµm νm εν1ν2...νm = g−1εµ1µ2 ...µm . (7.171b)
The Hodge∗is a linear map ∗:/Omega1r (M)→/Omega1m−r (M) whose action on a basis
vector of /Omega1r (M) is deﬁned by
∗(dxµ1 ∧dxµ2 ∧... ∧dxµr )
=
√
|g|
(m−r )! εµ1 µ2...µr νr+1 ...νm dxνr+1 ∧... ∧dxνm . (7.172)
It should be noted that∗1 is the invariant volume element:
∗1=
√
|g|
m! εµ1µ2...µm dxµ1 ∧... ∧dxµm =
√
|g| dx1∧... ∧dxm .
For
ω = 1
r! ω µ1µ2 ...µr dxµ1 ∧dxµ2 ∧... ∧dxµr ∈/Omega1r (M)
we have
∗ω =
√
|g|
r!(m−r )! ω µ1µ2 ...µr εµ1µ2...µr νr+1 ...νm dxνr+1 ∧... ∧dxνm . (7.173)
If we take the non-coordinate basis {θ α}={ eα µ dxµ},t h e ∗operation
becomes
∗(ˆθ α 1 ∧... ∧ˆθ α r )= 1
(m−r )! εα 1 ...α r β r+1 ...β m ˆθ β r+1 ∧... ∧ˆθ β m (7.174)
where
εα 1...α m =



+1i f (α 1 ...α m ) is an even permutation of (12 ... m)
−1i f (α 1 ...α m ) is an odd permutation of (12 ... m)
0o t h e r w i s e
(7.175)


## Page 310

and the indices are raised by δαβ or η αβ .
Theorem 7.4.
∗∗ω = (−1)r(m−r)ω. (7.176a)
if (M, g) is Riemannian and
∗∗ω = (−1)1+r(m−r)ω (7.176b)
if Lorentzian.
Proof. It is simpler to prove (7.176a) with a non-coordinate basis. Let
ω = 1
r! ω α 1...α r ˆθ α 1 ∧... ∧ˆθ α r .
Repeated applications of∗on ω yield
∗∗ω = 1
r! ω α 1 ...α r
1
(m−r )! εα 1...α r β r+1...β m
× 1
r! εβ r+1 ...β m γ1...γr ˆθ γ1 ∧... ∧ˆθ γr
= (−1)r(m−r)
r!r!(m−r )!
∑
αβ γ
ω α 1...α r εα 1...α r β r+1 ...β m εγ1...γr β r+1 ...β m
×ˆθ γ1 ∧... ∧ˆθ γr
= (−1)r(m−r)
r! ω α 1 ...α r ˆθ α 1 ∧... ∧ˆθ α r = (−1)r(m−r)ω
where use has been made of the identity
∑
βγ
εα 1...α r β r+1 ...β m εγ1...γr β r+1 ...β m ˆθ γ1 ∧... ∧ˆθ γr = r!(m−r )!ˆθ α 1 ∧... ∧ˆθ α r .
The proof of (7.176b) is left as an exercise to the reader (use det η =−1). /A3
Thus, we ﬁnd that (−1)r(m−r) ∗∗(or (−1)1+r(m−r) ∗∗) is an identity map
on /Omega1r (M). We deﬁne the inverse of∗by
∗−1 = (−1)r(m−r)∗ (M, g) is Riemannian (7.177a)
∗−1 = (−1)1+r(m−r)∗ (M, g) is Lorentzian. (7.177b)
7.9.3 Inner products of r-forms
Take
ω = 1
r! ω µ1 ...µr dxµ1 ∧... ∧dxµr
η = 1
r! η µ1 ...µr dxµ1 ∧... ∧dxµr .


## Page 311

The exterior product ω ∧∗η is an m-form:
ω ∧∗η = 1
(r!)2 ω µ1 ...µr η ν1...νr
√
|g|
(m−r )! εν1...νr µr+1 ...µm
× dxµ1 ∧... ∧dxµr ∧dxµr+1 ∧... ∧dxµm
= 1
r!
∑
µν
ω µ1...µr η ν1...νr 1
r!(m−r )! εν1...νr µr+1 ...µm
× εµ1...µr µr+1 ...µm
√
|g| dx1∧... ∧dxm
= 1
r! ω µ1 ...µr η µ1...µr
√
|g| dx1∧... ∧dxm . (7.178)
This expression shows that the product is symmetric:
ω ∧∗η = η∧∗ω. (7.179)
Let{ˆθ α} be the non-coordinate basis and
ω = 1
r! ω α 1...α r ˆθ µ1 ∧... ∧ˆθ α r
η = 1
r! η α 1...α r ˆθ α 1 ∧... ∧ˆθ α r .
Equation (7.178) is rewritten as
ω ∧∗η = 1
r! ω α 1...α r η α 1...α r ˆθ 1∧... ∧ˆθ m . (7.180)
Since α ∧∗β is an m-form, its integral over M is well deﬁned. Deﬁne the
inner product (ω, η) of two r-forms by
(ω, η) ≡
∫
ω ∧∗η
= 1
r!
∫
M
ω µ1...µr η µ1...µr
√
|g| dx1 ... dxm . (7.181)
Since ω ∧∗η = η∧∗ω , the inner product is symmetric,
(ω, η) = (η, ω). (7.182)
If (M, g) is Riemannian, the inner product is positive deﬁnite,
(α, α) ≥0. (7.183)
where the equality holds only whenα = 0. This is not true if(M, g) is Lorentzian.


## Page 312

7.9.4 Adjoints of exterior derivatives
Deﬁnition 7.6. Let d : /Omega1r−1(M) →/Omega1r (M) be the exterior derivative operator.
The adjoint exterior derivative operator d† : /Omega1r (M)→/Omega1r−1(M) is deﬁned by
d† = (−1)mr+m+1∗d∗ (7.184a)
if (M, g) is Riemannian and
d† = (−1)mr+m ∗d∗ (7.184b)
if Lorentzian, where m= dim M.
In summary, we have the following diagram (for a Riemannian manifold),
/Omega1m−r (M)
(−1)mr+m+1d
−−−−−−−−−−→ /Omega1m−r+1(M)↑

∗


↓
∗
/Omega1r (M)
d†
−−−−−−−−−−→ /Omega1r−1(M).
(7.185)
The operator d† is nilpotent since d is: d†2 =∗d∗∗d∗∝∗d2∗=0.
Theorem 7.5. Let (M, g) be a compact orientable manifold without a boundary
and α ∈/Omega1r (M), β ∈/Omega1r−1(M).T h e n
(dβ, α) = (β, d†α). (7.186)
Proof. Since both dβ ∧∗α and β ∧∗d†α are m-forms, their integrals over M are
well deﬁned. Let d act on β ∧∗α ,
d(β ∧∗α) = dβ ∧∗α −(−1)r β ∧d∗α.
Suppose (M, g) is Riemannian. Noting that d ∗α is an (m−r+ 1)-form and
inserting the identity map (−1)(m−r+1)[m−(m−r+1)]∗∗=(−1)mr+m+r+1 ∗∗in
front of d∗α in the second term, we have
d(β ∧∗α) = dβ ∧∗α −(−1)mr+m+1β ∧∗(∗d∗α).
Integrating this equation over M,w eh a v e
∫
M
dβ ∧∗α −
∫
M
β ∧∗[(−1)mr+m+1∗d∗α]=
∫
M
d(β ∧∗α)
=
∫
∂ M
β ∧∗α = 0
where the last equality follows by assumption. This shows that (dβ, α) =
(β, d†α) . The reader should check how the proof is modiﬁed when (M, g) is
Lorentzian. /A3


## Page 313

7.9.5 The Laplacian, harmonic forms and the Hodge decomposition
theorem
Deﬁnition 7.7. The Laplacian /Delta1: /Omega1r (M)→/Omega1r (M) is deﬁned by
/Delta1= (d+ d†)2 = dd†+ d†d. (7.187)
As an example, we obtain the explicit form of /Delta1: /Omega10(M)→/Omega10(M).L e t
f ∈/BY (M).S i n c ed† f = 0, we have
/Delta1f = d†d f =−∗d∗(∂µ f dxµ)
=−∗d
( √
|g|
(m−1)! ∂µ fg µλ ελν 2...νm dxν2 ∧... ∧dxνm
)
=−∗ 1
(m−1)! ∂ν[
√
|g|gλµ ∂µ f]ελν 2...νm dxν ∧dxν2 ∧... ∧dxνm
=−∗∂ν[
√
|g|gνµ ∂µ f]g−1 dx1∧... ∧dxm
=− 1
√
|g| ∂ν[
√
|g|gνµ ∂µ f]. (7.188)
Exercise 7.21. Take a one-form ω = ω µ dxµ in the Euclidean space (/CA
m ,δ ).
Show that
/Delta1ω=−
m∑
µ=1
∂ 2ω ν
∂ xµ∂ xµ dxν .
Example 7.16. In example 5.11, it was shown that half of the Maxwell equations
are reduced to the identity, d F = d2 A = 0, where A = Aµ dxµ is the vector
potential one-form and F = dA is the electromagnetic two-form. Let ρ be the
electric charge density and j the electric current density and form the current one-
form j = η µν j ν dxµ =−ρ dt+ j· dx. Then the remaining Maxwell equations
become
d† F= d†dA= j. (7.189a)
The component expression is
∇·E= ρ ∇×B−∂ E
∂ t = j . (7.189b)
The vector potential A has a large number of degrees of freedom and we can
always choose an A which satisﬁes the Lorentz condition d† A = 0. Then
(7.189a) becomes (dd†+ d†d)A= /Delta1A= j.
Let (M, g) be a compact Riemannian manifold. The Laplacian /Delta1is a
positive operator on M in the sense that
(ω, /Delta1ω)= (ω, ( d†d+ dd†)ω) = (dω, dω) + (d†ω, d†ω) ≥0 (7.190)


## Page 314

where (7.183) has been used. An r-form ω is called harmonic if /Delta1ω= 0a n d
closed (coclosed)i fd ω = 0 (d†ω = 0). The following theorem is a direct
consequence of (7.190).
Theorem 7.6. An r-form ω is harmonic if and only if ω is closed and coclosed.
An r-form ω is called coexact if it is written globally as
ω r = d†β r+1 (7.191)
where β r+1 ∈/Omega1r+1(M) [cf a form ω r ∈/Omega1r (M) is exact if ω r = dα r−1,
α r−1 ∈/Omega1r−1(M)]. We denote the set of harmonic r-forms on M by Harmr (M)
and the set of exact r-forms (coexact r-forms) by d /Omega1r−1(M)( d†/Omega1r+1(M)).
[Note: The set of exact r-forms has been denoted by Br (M) so far.]
Theorem 7.7. (Hodge decomposition theorem )L e t (M, g) be a compact
orientable Riemannian manifold without a boundary. Then /Omega1r (M) is uniquely
decomposed as
/Omega1r (M)= d/Omega1r−1(M)⊕d†/Omega1r+1(M)⊕Harmr (M). (7.192a)
[That is, any r-form ω r is written globally as
ω r = dα r−1+ d†β r+1+ γr (7.192b)
where α r−1 ∈/Omega1r−1(M), β r+1 ∈/Omega1r+1(M) and γr ∈Harmr (M).]
If r = 0, we deﬁne /Omega1−1(M)={ 0}. The proof of this theorem requires the
results of the following two easy exercises.
Exercise 7.22. Let (M, g) be as given in theorem 7.7. Show that
(dα
r−1, d†β r+1)= (dα r−1,γ r )= (d†β r+1,γ r )= 0. (7.193)
Show also that if ω r ∈/Omega1r (M) satisﬁes
(dα r−1,ω r )= (d†β r+1,ω r )= (γr ,ω r )= 0 (7.194)
for any d α r−1 ∈d/Omega1r−1(M),d †β r+1 ∈d†/Omega1r+1(M) and γr ∈Harmr (M),t h e n
ω r = 0.
Exercise 7.23. Suppose ω r ∈/Omega1r (M) is written as ω r = /Delta1ψr for some ψ r ∈
/Omega1r (M). Show that (ω r ,γ r ) = 0f o ra n y γr ∈Harmr (M). The proof of the
converse ‘if ω r is orthogonal to any harmonic r-form, then ω r is written as /Delta1ψr
for some ψ r ∈/Omega1r (M)’ is highly technical and we just state that the operator/Delta1−1
(the Green function) is well deﬁned in the present problem and ψ r is given by
/Delta1−1ω r .
Let P : /Omega1r (M) →Harmr (M) be a projection operator to the space of
harmonic r-forms. Take an element ω r ∈/Omega1r (M).S i n c eω r −Pω r is orthogonal
to Harmr (M), it can be written as /Delta1ψr for some ψ r ∈/Omega1r (M).T h e nw eh a v e
ω r = d(d†ψ r )+ d†(dψ r )+ Pω r . (7.195)
This realizes the decomposition of theorem 7.7.


## Page 315

7.9.6 Harmonic forms and de Rham cohomology groups
We show that any element of the de Rham cohomology group has a unique
harmonic representative. Let [ω r]∈ Hr (M). We ﬁrst show that ω r ∈
Harmr (M)⊕d/Omega1r−1(M). According to (7.192b), ω r is decomposed as ω r =
γr + dα r−1+ d†β r+1.S i n c edω r = 0, we have
0= (dω r ,β r+1)= (dd†β r+1,β r+1)= (d†β r+1, d†β r+1).
This is satisﬁed if and only if d†β r+1 = 0. Hence, ω r = γr+dα r−1. From (7.195)
we have
ω r = Pω r + d(d†ψ) = Pω r + dd†/Delta1−1ω r . (7.196a)
γr ≡Pω r is the harmonic representative of[ω r].L e t˜ω r be another representative
of[ω r]: ˜ω r−ω r = dηr−1, ηr−1 ∈/Omega1r−1(M). Corresponding to (7.196a), we have
˜ω r = P˜ω r + d(d†/Delta1−1˜ω r )= Pω r + d( ... ) (7.196b)
where the last equality follows since dηr−1 is orthogonal to Harmr (M) and hence
its projection to Harmr (M) vanishes. (7.196a) and (7.196b) show that[ω r] has a
unique harmonic representative Pω r .
This proof shows that Hr (M)⊂Harmr (M). Now we prove that Hr (M)⊃
Harmr (M).S i n c e dγr = 0f o ra n yγr ∈Harmr (M),w eﬁ n dt h a tZr (M) ⊃
Harmr (M).W ea l s oh a v eBr (M)∩Harmr (M)=∅since Br (M)= d/Omega1r−1(M),
see (7.192a). Thus, every element of Harm r (M) is a non-trivial member of
Hr (M) and we ﬁnd that Harm r (M) is a vector subspace of Hr (M) and hence
Harmr (M)⊂Hr (M). We have proved:
Theorem 7.8. (Hodge’s theorem) On a compact orientable Riemannian manifold
(M, g), Hr (M) is isomorphic to Harmr (M):
Hr (M)∼= Harmr (M). (7.197)
The isomorphism is provided by identifying [ω]∈ Hr (M) with Pω ∈
Harmr (M).
In particular, we have
dim Harmr (M)= dim Hr (M)= br (7.198)
br being the Betti number. The Euler characteristic is given by
χ( M)=
∑
(−1)r br =
∑
(−1)r dim Harmr (M) (7.199)
see theorem 3.7. We note that the LHS is a topological quantity while the RHS is
an analytical quantity given by the eigenvalue problem of the Laplacian /Delta1.


## Page 316

7.10 Aspects of general relativity
7.10.1 Introduction to general relativity
The general theory of relativity is one of the most beautiful and successful
theories in classical physics. There is no disagreement between the theory
and astrophysical and cosmological observations such as solar system tests,
gravitational radiation from pulsars, g ravitational red shifts, the recently
discovered gravitational lens effect and so on. Readers not very familiar with
general relativity may consult Berry (1989) or the primer by Price (1982).
Einstein proposed the following principles to construct the general theory of
relativity
(I) Principle of General Relativity: All laws in physics take the same forms in
any coordinate system.
(II) Principle of Equivalence : There exists a coordinate system in which the
effect of a gravitational ﬁeld vanishes locally. (An observer in a freely falling
lift does not feel gravity until it crashes.)
Any theory of gravity must reduce to Newton’s theory of gravity in the weak-
ﬁeld limit. In Newton’s theory, the gravitational potential /Phi1satisﬁes the Poisson
equation
/Delta1/Phi1= 4π Gρ (7.200)
where ρ is the mass density. The Einstein equation generalizes this classical result
so that the principle of general relativity is satisﬁed.
In general relativity, the gravitational potential is replaced by the components
of the metric tensor. Then, instead of the LHS of (7.200), we have the Einstein
tensor deﬁned by
G
µν ≡Ric µν −1
2 gµν
/CA . (7.201)
Similarly, the mass density is replaced by a more general object called the
energy–momentum tensor Tµν .T h e Einstein equation takes a very similar
form to (7.200):
Gµν = 8π GTµν . (7.202)
The constant 8 π G is chosen so that (7.202) reproduces the Newtonian result in
the weak-ﬁeld limit. The tensor Tµν is obtained from the matter action by the
variational principle. From Noether’s theorem, Tµν must satisfy a conservation
equation of the form∇µT µν = 0. A similar conservation law holds for Gµν (but
not for Ric µν ). We shall see in the next subsection that the LHS of (7.202) is also
obtained from the variational principle.
Exercise 7.24. Consider a metric
g00 =−1−2/Phi1
c2 g0i = 0 gij = δij 1≤i, j≤3


## Page 317

and Tµν given by T00 = ρ c2, T0i = Tij = 0 which corresponds to dust at
rest. Show that (7.202) reduces to the Poisson equation in the weak-ﬁeld limit
(/Phi1/c2 ≪ 1).
7.10.2 Einstein–Hilbert action
This and the next example are taken from Weinberg (1972). The general theory
of relativity describes the dynamics of the geometry, that is, the dynamics of
gµν . What is the action principle for this theory? As usual, we require that the
relevant action should be a scalar. Moreover, it should contain the derivatives of
gµν :
∫√
|g| dm x cannot describe the dynamics of the metric. The simplest guess
will be SEH ∝
∫
/CA
√
|g| dm x.S i n c e/CA is a scalar and √
|g| dx1 dx2 ... dxm is
the invariant volume element, SEH is a scalar. In the following, we show that
SEH indeed yields the Einstein equation under the variation with respect to the
metric. Our connection is restricted to the Levi-Civita connection. We ﬁrst prove
a technical proposition.
Proposition 7.2. Let (M, g) be a (pseudo-)Riemannian manifold. Under the
variation gµν →gµν + δgµν , gµν , g and Ric µν change as
(a)δ gµν =−gµκ gλν δgκλ (7.203)
(b)δ g= ggµν δgµν ,δ
√
|g|= 1
2
√
|g|gµν δgµν (7.204)
(c)δ Ric µν =∇κ δ/Gamma1κ νµ −∇ν δ/Gamma1κ κµ (Palatini identity). (7.205)
Proof.( a )F r o mgκλ gλν = δκ ν , it follows that
0= δ(gκλ gλν )= δgκλ gλν + gκλ δgλν .
Multiplying by gµκ we ﬁnd that δgµν =−gµκ gλν δgκλ .
(b) We ﬁrst note the matrix identity ln (det gµν ) = tr(ln gµν ). This can be
proved by diagonalizinggµν . Under the variation δgµν , the LHS becomesδg·g−1
while the RHS yields gµν · δgµν , hence δg = ggµν δgµν . The rest of (7.204) is
easily derived from this.
(c) Let /Gamma1and ˜/Gamma1be two connections. The difference δ/Gamma1≡˜/Gamma1−/Gamma1is a tensor
of type (1, 2), see exercise 7.5. In the present case, we take ˜/Gamma1to be a connection
associated with g+ δg and /Gamma1with g. We will work in the normal coordinate
system in which /Gamma1≡0 (of course ∂/Gamma1̸= 0 in general); see section 7.4. We ﬁnd
δ Ric µν = ∂κ δ/Gamma1κ νµ −∂ν δ/Gamma1κ κµ =∇κ δ/Gamma1κ νµ −∇ν /Gamma1κ κµ .
[The reader should verify the second equa lity.] Since both sides are tensors, this
is valid in any coordinate system. /A3
We deﬁne the Einstein–Hilbert action by
SEH ≡ 1
16π G
∫
/CA
√
−g d4x. (7.206)


## Page 318

The constant factor 1/16π G is introduced to reproduce the Newtonian limit when
matter is added; see (7.214). We prove thatδ SEH = 0 leads to the vacuum Einstein
equation. Under the variation g →g+ δg such that δg →0a s|x|→ 0, the
integrand changes as
δ(/CA
√
−g)= δ(gµν Ric µν
√
−g)
= δgµν Ric µν
√
−g+ gµν δ Ric µν
√
−g+ /CA δ(√
−g)
=−gµκ gλν δgκλ Ric µν
√
−g
+ gµν (∇κ δ/Gamma1κ νµ −∇ν /Gamma1κ κµ )√
−g+ 1
2
/CA
√
−ggµν δgµν .
We note that the second term is a total divergence,
∇κ (gµν δ/Gamma1κ νµ
√
−g)−∇ν (gµν δ/Gamma1κ κµ
√
−g)
= ∂κ (gµν δ/Gamma1κ µν
√
−g)−∂ν (gµν δ/Gamma1κ κµ
√
−g)
and hence does not contribute to the variation. From the remaining terms we have
δ SEH = 1
16π G
∫ (
−Ric µν + 1
2
/CA gµν
)
δgµν
√
−g d4x. (7.207)
If we require thatδ SEH = 0 under any variationδg, we obtain the vacuum Einstein
equation,
Gµν = Ric µν −1
2 gµν
/CA = 0 (7.208)
where the symmetric tensor G is called the Einstein tensor.
So far we have considered the gravitational ﬁeld only. Suppose there exists
matter described by an action
SM ≡
∫
/C4 (φ)√
−g d4x (7.209)
where /C4 (φ) is the Lagrangian density of the theory. Typical examples are the real
scalar ﬁeld and the Maxwell ﬁelds,
SS ≡−1
2
∫
[gµν ∂µφ∂ ν φ + m2φ 2]√
−g d4x (7.210a)
SED ≡−1
4
∫
Fµν Fµν√
−g d4x (7.210b)
where Fµν = ∂µ Aν −∂ν Aµ =∇µ Aν −∇ν Aµ. If the matter action changes by
δ SM under δg,t h eenergy–momentum tensor T µν is deﬁned by
δ SM = 1
2
∫
T µν δgµν
√
−g d4x. (7.211)


## Page 319

Since δgµν is symmetric, T µν is also taken to be so. For example, Tµν of a real
scalar ﬁeld is given by
Tµν (x)= 2 1
√
−g
δ
δgµν (x) SS
= ∂µφ∂ ν φ −1
2 gµν (gκλ ∂κ φ∂ λ φ + m2φ 2). (7.212)
Suppose we have a gravitational ﬁeld coupled with a matter ﬁeld whose
action is SM. Now our action principle is
δ( SEH+ SM)= 0 (7.213)
under g→g+ δg. From (7.207) and (7.211), we obtain the Einstein equation
Gµν = 8π GTµν . (7.214)
Exercise 7.25. We may add an extra scalar to the scalar curvature without spoiling
the invariance of the action. For example, we can add a constant called the
cosmological constant /Lambda1,
˜SEH = 1
16π G
∫
M
(/CA + /Lambda1)√
−g d4x. (7.215)
Write down the vacuum Einstein equation. Other possible scalars may be such
terms as /CA
2, Ric µν Ric µν or Rκλµν Rκλµν .
7.10.3 Spinors in curved spacetime
For concreteness, we consider a Dirac spinor ψ in a four-dimensional Lorentz
manifold M. The vierbein eα µ deﬁned by
gµν = eα µeβ ν η αβ (7.216)
deﬁnes an orthonormal frame {ˆθ α = eα µdxµ} at each point p ∈M. As noted
before, α ,β ,γ,... are the local orthonormal indices while µ ,ν ,λ ,... are the
coordinate indices. With respect to this frame, the Dirac matrices γ α = eα µγ µ
satisfy{γ α ,γ β}= 2η αβ . Under a local Lorentz transformation /Lambda1α β (p),t h e
Dirac spinor transforms as
ψ( p)→ρ(/Lambda1)ψ(p) ¯ψ( p)→¯ψ( p)ρ(/Lambda1)−1 (7.217)
where ¯ψ ≡ψ †γ 0 and ρ(/Lambda1)is the spinor representation of /Lambda1. To construct an
invariant action, we seek a covariant derivative ∇α ψ which is a local Lorentz
vector and transforms as a spinor,
∇α ψ →ρ(/Lambda1)/Lambda1α β∇β ψ. (7.218)


## Page 320

I fw eﬁ n ds u c ha∇α ψ , an invariant Lagrangian may be given by
/C4 = ¯ψ
(
iγ α∇α + m
)
ψ (7.219)
m being the mass of ψ . We note that eα µ∂µψ transforms under /Lambda1(p) as
eα µ∂µψ →/Lambda1α β eβ µ∂µρ(/Lambda1)ψ= /Lambda1α η eβ µ[ρ(/Lambda1)∂µψ + ∂µρ(/Lambda1)ψ]. (7.220)
Suppose∇α is of the form
∇α ψ = eα µ[∂µ+ /Omega1µ]ψ. (7.221)
From (7.218) and (7.220), we ﬁnd that /Omega1µ satisﬁes
/Omega1µ →ρ(/Lambda1)/Omega1µρ(/Lambda1)−1−∂µρ(/Lambda1)ρ(/Lambda1)−1. (7.222)
To ﬁnd the explicit form of /Omega1µ, we consider an inﬁnitesimal local Lorentz
transformation /Lambda1α β (p)= δα β + εα β (p). The Dirac spinor transforms as
ψ →exp[ 1
2 iεαβ /Sigma1αβ ]ψ ≃[ 1+ 1
2 iεαβ /Sigma1αβ ]ψ (7.223)
where /Sigma1αβ ≡1
4 i
[
γ α ,γ β
]
is the spinor representation of the generators of the
Lorentz transformation. /Sigma1αβ satisﬁes the /D3 (1, 3) Lie algebra
i[/Sigma1αβ ,/Sigma1γδ ]= η γβ /Sigma1αδ −η γα /Sigma1βδ + η δβ /Sigma1γα −η δα /Sigma1γβ . (7.224)
Under the same Lorentz transformation, /Omega1µ transforms as
/Omega1µ →(1+ 1
2 iεαβ /Sigma1αβ )/Omega1µ(1−1
2 iεγδ /Sigma1γδ )−1
2 i∂µεαβ /Sigma1αβ (1−1
2 iεγδ /Sigma1γδ )
= /Omega1µ+ 1
2 iεαβ [/Sigma1αβ ,/Omega1µ]−1
2 i∂µεαβ /Sigma1αβ . (7.225)
We recall that the connection one-form ω α β transforms under an inﬁnitesimal
Lorentz transformation as (see (7.152))
ω α β →ω α β + εα γ ω γ β −ω α γ εγ β −dεα β (7.226a)
or in components,
/Gamma1α µβ →/Gamma1α µβ + εα γ /Gamma1γ µβ −/Gamma1α µγ εγ β −∂µεα β . (7.226b)
From (7.224), (7.225) and (7.226b), we ﬁnd that the combination
/Omega1µ ≡1
2 i/Gamma1α µβ /Sigma1αβ = 1
2 ieα ν∇µeβν /Sigma1αβ (7.227)
satisﬁes the transformation property (7.222). In fact,
1
2 i/Gamma1α µβ /Sigma1αβ →1
2 i(/Gamma1α µβ + εα γ /Gamma1γ µβ −/Gamma1α µγ εγβ −∂µεαβ )/Sigma1αβ
= 1
2 i/Gamma1α µβ /Sigma1αβ + 1
2 i(εα γ /Gamma1γ µβ /Sigma1αβ −/Gamma1α µγ εγβ /Sigma1αβ )
−1
2 i∂µεαβ /Sigma1αβ
= 1
2 i/Gamma1α µβ /Sigma1αβ + 1
2 iεαβ [/Sigma1αβ , 1
2 i/Gamma1γ µδ /Sigma1γδ ]−1
2 i∂µεαβ /Sigma1αβ .


## Page 321

We ﬁnally obtain the Lagrangian which is a scalar both under coordinate
changes and local Lorentz rotations,
/C4 ≡¯ψ [iγ α eα µ(∂µ+ 1
2 i/Gamma1β µ
γ
/Sigma1βγ )+ m]ψ (7.228)
and the scalar action
Sψ ≡
∫
M
d4x√
−g¯ψ [iγ α eα µ(∂µ+ 1
2 i/Gamma1β µ
γ
/Sigma1βγ )+ m]ψ. (7.229a)
If ψ is coupled to the gauge ﬁeld /BT , the action is given by
Sψ =
∫
M
d4x√
−g¯ψ[iγ α eα µ(∂µ+ /BT
µ+ 1
2 i/Gamma1β µ
γ
/Sigma1βγ )+ m]ψ. (7.229b)
It is interesting to note that the spin connection term vanishes if dim M= 2.
To see this, we rewrite (7.229a) as
Sψ = 1
2
∫
M
d2x√
−g¯ψ [iγ µ←→
∂µ + 1
2 i/Gamma1β µ
γ
{iγ µ,/Sigma1βγ }+ m]ψ( 7.229a′)
where γ µ = γ α eα µ and we have added total derivatives to the Lagrangian to
make it Hermitian. The non-vanishing components of/Sigma1are /Sigma101 ∝[γ0,γ 1]∝γ3,
where γ3 is the two-dimensional analogue of γ5.S i n c e{γ µ,γ 3}= 0, the spin
connection term drops out from Sψ .
7.11 Bosonic string theory
Quantum ﬁeld theory (QFT) is occasiona lly called particle physics since it deals
with the dynamics of particles. As far as high-energy processes whose typical
energy is much smaller than the Planck energy (∼1019 GeV) are concerned there
is no objection to this viewpoint. However, once we try to quantize gravity in
this framework, there exists an impenetrable barrier. We do not know how to
renormalize the ultraviolet divergences that are ubiquitous in the QFT of gravity.
In the early 1980s, physicists tried to construct a consistent theory of gravity
by introducing supersymmetry. In spite of a partial improvement, the resulting
supergravity could not tame the ultraviolet behaviour completely.
In the late 1960s and early 1970s, the dual resonance model was extensively
studied as a candidate for a model of had rons. In this, particles are replaced
by one-dimensional objects called strings. Unfortunately, it turned out that
the theory contained tachyons (imaginary mass particles) and spin-2 particles
and, moreover, it is consistent only in 26-dimensional spacetime! Due to
these difﬁculties, the theory was abandoned and taken over by quantum
chromodynamics (QCD). However, a small number of people noticed that the
theory must contain the graviton and they thought it could be a candidate for the
quantum theory of gravity.


## Page 322

Figure 7.9. The trajectories of an open string ( a) and a closed string ( b). Slices of the
trajectories at ﬁxed parameter τ0 are also shown.
Nowadays, supersymmetry has been built into string theory to form the
superstring theory, which is free of tachyons and consistent in ten-dimensional
spacetime. There are several candidates for consistent superstring theories. It is
sometimes suggested that complete mathematical consistency will single out a
unique theory of everything (TOE).
In this book, we study the elementary aspects of bosonic string theory in the
ﬁnal chapter. We also study some mathema tical tools relevant for superstrings.
The classical review is that of Scherk (1975). We give more references in
chapter 14.
7.11.1 The string action
The trajectory of a particle in a D-dimensional Minkowski spacetime is given by
the set of D functions Xµ(τ ),1 ≤µ≤D,w h e r eτ parametrizes the trajectory.
A string is a one-dimensional object and its conﬁguration is parametrized by two
numbers (σ, τ ), σ being spacelike and τ timelike. Its position in D-dimensional
Minkowski spacetime is given by Xµ(σ, τ ), see ﬁgure 7.9. The parameter σ can
be normalized as σ ∈[0,π ]. A string may be open or closed. We now seek an
action that governs the dynamics of strings.
We ﬁrst note that the action of a relativistic particle is thelength of the world
line,
S≡m
∫ sf
si
ds= m
∫ τf
τi
dτ(−˙Xµ ˙Xµ)1/2 (7.230)
where ˙Xµ ≡dX µ/dτ . For some purposes, it is convenient to take another
expression,
S=−1
2
∫
dτ√
g(g−1 ˙Xµ ˙Xµ−m2) (7.231)


## Page 323

where the auxiliary variable g≡gττ is regarded as a metric.
Exercise 7.26. Write down the Euler–Lagrange equations derived from (7.231).
Eliminate g from (7.231) making use of the equation of motion to reproduce
(7.230).
What is the advantage of (7.231) over (7.230)? We ﬁrst note that (7.231)
makes sense even when m2 = 0, while (7.230) vanishes in this case. Second,
(7.231) is quadratic inX while the X-dependence of (7.230) is rather complicated.
Nambu (1970) proposed an action describing the strings, which is
proportional to the area of the world sheet, the surface spanned by the trajectory
of a string. Clearly this is a generalization of the length of the world line of a
particle. He proposed the Nambu action,
S=− 1
2πα ′
∫ π
0
dσ
∫ τf
τi
dτ[−det(∂α Xµ∂β Xµ)]1/2 (7.232)
where ξ 0 = τ, ξ 1 = σ and ∂α Xµ ≡∂ Xµ/∂ξ α . The parameter τi (τf) is the
initial (ﬁnal) value of the parameter τ while α′ is a parameter corresponding to
the inverse string tension (the Regge slope).
Exercise 7.27. The action S is required to have no dimension. We takeσ and τ to
be dimensionless. Show that the dimension of α′ is[length]2.
Although the action provides a nice geometrical picture, it is not quadratic
in X and it turned out that the quantization of the theory was rather difﬁcult. Let
us seek an equivalent action which is easier to quantize. We proceed analogously
to the case of point particles. A quadratic action for strings is called thePolyakov
action (Polyakov 1981) and is given by
S=− 1
4πα ′
∫ π
0
dσ
∫ τf
τi
dτ√
−ggαβ ∂α Xµ∂β Xµ (7.233)
where g = det gαβ and gαβ = (g−1)αβ . If the string is open, the trajectory is
a sheet while if it is closed, it is a tube, see ﬁgure 7.9. It is shown here that the
action (7.233) agrees with (7.232) upon eliminating g. It should be noted though
that this is true only for the Lagrangian. There is no guarantee that this remains
true at the quantum level. It has been shown that the quantum theory based on the
respective Lagrangians agrees only for D = 26. The action (7.233) is invariant
under
(i) local reparametrization of the world sheet
τ →τ′(τ, σ ) σ →σ′(τ, σ ) (7.234a)
(ii) Weyl rescaling
gαβ →g′
αβ ≡eφ(σ,τ) gαβ (7.234b)


## Page 324

(iii) global Poincar´ei n v a r i a n c e
Xµ →X µ′ ≡/Lambda1µν Xν + aµ /Lambda1∈SO(D−1, 1) a∈/CA
D . (7.234c)
These symmetries will be worked out later.
Exercise 7.28. Taking advantage of symmetries (i) and (iii), it is always possible
to choose gαβ in the form gαβ = η αβ . Write down the equation of motion for Xµ
to show that it obeys the equation
η αβ ∂α ∂β Xµ = 0. (7.235)
7.11.2 Symmetries of the Polyakov strings
The bosonic string theory is deﬁned on a two-dimensional Lorentz manifold
(M, g). The embedding f : M → /CA
D is deﬁned by ξ α ↦→ Xµ where
{ξ α}= (τ, σ ) are the local coordinates of M. We assume the physical spacetime
is Minkowskian (/CA
D ,η ) for simplicity. The Polyakov action
S=−1
2
∫
d2ξ√
−gg αβ ∂α Xµ∂β Xν η µν (7.236)
is left invariant under the coordinate reparametrization Diff(M) since the volume
element√
−gd2ξ is invariant and gαβ ∂α Xµ∂β Xµ is a scalar.
Now we are ready to derive the equation of motion. Our variational
parameters are the embedding X µ and the geometry gαβ . Under the variation
δ Xµ, we have the Euler–Lagrange equation
∂α (√
−ggαβ ∂β Xµ)= 0. (7.237a)
Under the variation δgαβ , the integrand of S changes as
δ(√
−ggαβ ∂α Xµ∂β Xµ)= δ√
−ggαβ ∂α Xµ∂β Xµ+√
−gδgαβ ∂α Xµ∂β Xµ
=−1
2
√
−ggγδ δgγδ gαβ ∂α Xµ∂β Xµ
+√
−gδgαβ ∂α Xµ∂β Xµ
where proposition 7.2 has been used. Since this should vanish for any variation
δgαβ , we should have
Tαβ = ∂α Xµ∂β Xµ−1
2 gαβ (gγδ ∂γ Xµ∂δ Xµ)= 0. (7.237b)
This is solved for gαβ to yield
gαβ = ∂α Xµ∂β Xν η µν (7.238)
showing that the induced metric (the RHS) agrees with gαβ . Substituting (7.238)
into (7.236) to eliminate gαβ , we recover the Nambu action,
S=−1
2
∫
d2ξ
√
−det(∂α Xµ∂β Xµ). (7.239)


## Page 325

By construction, the action S is invariant under local reparametrization of
M,{ξ α}→{ ξ′α (ξ )}. In addition to this, the action has extra invariances. Under
the global Poincar´e transformation in D-dimensional spacetime,
Xµ →X′µ ≡/Lambda1µν Xν + aµ (7.240)
the action S transforms as
S→−1
2
∫
d2ξ√
−ggαβ ∂α (/Lambda1µκ Xκ + aµ)∂β (/Lambda1ν λ Xλ + aν )η µν
=− 1
2
∫
d2ξ√
−ggαβ ∂α Xκ ∂β Xλ (/Lambda1µκ /Lambda1ν λ η µν ).
From /Lambda1µκ /Lambda1ν λ η µν = η κλ ,w eﬁ n dt h a t S is invariant under global Poincar´ e
transformations. The action S is also invariant under the Weyl rescaling ,
gαβ (τ, σ ) →e2σ( τ, σ) gα,β (τ, σ ) keeping (τ, σ ) ﬁxed. In fact, S transforms as
S→−1
2
∫
d2ξ
√
−e4σ ge−2σ gαβ ∂α Xµ∂β Xν η µν
and hence is left invariant. Note that the Weyl rescaling invariance exists only
when M is two dimensional, making strings prominent among other extended
objccts such as membranes.
Since dim M = 2, we can always parametrize the world sheet by the
isothermal coordinate (example 7.9) so that
gαβ = e2σ( τ, σ) η αβ . (7.241)
Then the Weyl rescaling invariance allows us to choose the standard metric η αβ
on the world sheet. The metric gαβ has three independent components while the
reparametrization has two degrees of freedom and the Weyl scaling invariance
has one. Thus, so long as we are dealing with strings, we can choose the standard
metric η αβ .
We end our analysis of Polyakov strings here. Polyakov strings will be
quantized in the most elegant manner in chapter 14.
Exercise 7.29. Let (M, g) and (N, h) be Riemannian manifolds. Take a chart U
of M in which the metric g takes the form
g= gµν (x) dxµ⊗dxν .
Take a chart V of N on which h takes the form
h= Gαβ (φ) dφ α ⊗dφ β .
Am a pφ : M→N deﬁned by x↦→φ( x) is called a harmonic map if it satisﬁes
1
√
g ∂µ[√
gg µν ∂ν φ α]+ /Gamma1α βγ ∂µφ α ∂ν φ β gµν = 0. (7.242)


## Page 326

Show that this equation is obtained by the variation of the action
S≡1
2
∫
dm x√
gg µν ∂µφ α ∂ν φ β hαβ (φ) (7.243)
with respect to φ . Applications of harmonic maps to physics are found in Misner
(1978) and S´anchez (1988). Mathematical aspects have been reviewed in Eells
and Lemaire (1968).
Problems
7.1 Let∇be a general connection for which the torsion tensor does not vanish.
Show that the ﬁrst Bianchi identity becomes
/CB {R(X, Y )Z}= /CB {T (X,[Y, Z])}+ /CB {∇X[T (Y, Z )]}
where /CB is the symmetrizer deﬁned in theorem 7.2. Show also that the second
Bianchi identity is given by
/CB {(∇X R)(Y, Z )}V = /CB {R(X, T (Y, Z ))}V
where /CB symmetrizes X, Y and Z only.
7.2 Let (M, g) be a conformally ﬂat three-dimensional manifold. Show that the
Weyl–Schouten tensor deﬁned by
Cλµν ≡∇ν Ric λµ −∇µ Ric λν −1
4 (gλµ ∂ν
/CA −gλν ∂µ
/CA )
vanishes. It is known that Cλµν = 0 is the necessary and sufﬁcient condition for
conformal ﬂatness if dim M= 3.
7.3 Consider a metric
g=−dt⊗dt+ dr⊗dr+ (1−4µ2)r2 dφ ⊗dφ + dz⊗dz
where 0 <µ< 1/2a n dµ̸= 1/4. Introduce a new variable
˜φ ≡(1−4µ)φ
and show that the metric g reduces to the Minkowski metric. Does this mean that
g describes Minkowski spacetime? Compute the Riemann curvature tensor and
show that there is a stringlike singularity atr= 0. This singularity is conical (the
spacetime is ﬂat except along the line). This metric models the spacetime of a
cosmic string.


## Page 327

8
COMPLEX MANIFOLDS
A differentiable manifold is a topological space which admits differentiable
structures. Here we introduce another structure which has relevance in physics.
In elementary complex analysis, the partial derivatives are required to satisfy the
Cauchy–Riemann relations. W e talk not only of the differentiability but also of
the analyticity of a function in this case. A complex manifold admits a complex
structure in which each coordina te neighbourhood is homeomorphic to /BV
m and
the transition from one coordinate system to the other is analytic.
The reader may consult Chern (1979), Goldberg (1962) or Greene (1987)
for further details. Grifﬁths and Harris (1978), chapter 0 is a concise survey of
the present topics. For applications to physics, see Horowitz (1986) and Candelas
(1988).
8.1 Complex manifolds
To begin with, we deﬁne a holomorphic (or analytic) map on /BV
m .A c o m p l e x -
valued function f : /BV
m →/BV is holomorphic if f = f1 + i f2 satisﬁes the
Cauchy–Riemann relations for each zµ = xµ+ i yµ,
∂ f1
∂ xµ = ∂ f2
∂ yµ
∂ f2
∂ xµ =−∂ f1
∂ yµ . (8.1)
Am a p ( f 1,..., f n ) : /BV
m →/BV
n is called holomorphic if each function f λ
(1≤λ ≤n) is holomorphic.
8.1.1 Deﬁnitions
Deﬁnition 8.1. M is a complex manifold if the following axioms hold,
(i) M is a topological space.
(ii) M is provided with a family of pairs{(Ui ,ϕ i )}.
(iii){Ui} is a family of open sets which covers M.T h e m a p ϕ i is a
homeomorphism from Ui to an open subset U of /BV
m . [Hence, M is even
dimensional.]
(iv) Given Ui and Uj such that Ui ∩Uj ̸=∅,t h em a pψ ji = ϕ j ◦ϕ−1
i from
ϕ i (Ui ∩Uj ) to ϕ j (Ui ∩Uj ) is holomorphic.


## Page 328

The number m is called the complex dimension of M and is denoted as
dim
/BV
M = m. The real dimension 2 m is denoted either by dim
/CA
M or simply
by dim M.L e t zµ = ϕ i (p) and wν = ϕ j (p) be the (complex) coordinates of
a point p ∈Ui ∩Uj in the charts (Ui ,ϕ i ) and (Uj ,ϕ j ), respectively. Axiom
(iv) asserts that the function wν = uν + ivν (1 ≤ν ≤m) is holomorphic in
zµ = xµ+ iyµ, namely
∂ uν
∂ xν = ∂v ν
∂ yν
∂ uν
∂ yν =−∂v ν
∂ xν 1≤µ, ν ≤m.
These axioms ensure that calculus on complex manifolds can be carried out
independently of the special coordinates chosen. For example, /BV
m is the simplest
complex manifold. A single chart covers the whole space and ϕ is the identity
map.
Let{(Ui ,ϕ i )} and{(Vj ,ψ j )} be atlases of M. If the union of two atlases is
again an atlas which satisﬁes the axioms of deﬁnition 8.1, they are said to deﬁne
the same complex structure. A complex manifold may carry a number of complex
structures (see example 8.2).
8.1.2 Examples
Example 8.1. In exercise 5.1, it was shown that the stereographic coordinates of
a point P(x, y, z)∈S2−{North Pole} projected from the North Pole are
(X, Y )=
( x
1−z , y
1−z
)
while those of a point P(x, y, z)∈S2 −{South Pole} projected from the South
Pole are
(U, V )=
( x
1+ z , −y
1+ z
)
.
[Note the orientation of (U, V ) in ﬁgure 5.5.] Let us deﬁne complex coordinates
Z= X+ iY,
 Z= X−iY, W= U+ iV,
 W= U−iV.
W is a holomorphic function of Z,
W = x−iy
1+ z = 1−z
1+ z (X−iY )= X−iY
X2+ Y 2 = 1
Z .
Thus, S2 is a complex manifold which is identiﬁed with the Riemann sphere
/BV ∪{∞}.
Example 8.2. Take a complex plane /BV and deﬁne a lattice L(ω 1,ω 2)≡{ω 1m+
ω 2n|m, n ∈/CI } where ω 1 and ω 2 are two non-vanishing complex numbers such


## Page 329

Figure 8.1. Two complex numbers ω 1 and ω 2 deﬁne a lattice L(ω 1,ω 2) in the complex
plane. /BV /L(ω 1 ,ω 2) is homeomorphic to the torus (the shaded area).
that ω 2/ω 1 /∈/CA ; see ﬁgure 8.1. Without loss of generality, we may take
Im(ω 2/ω 1)> 0. The manifold /BV /L(ω 1 ,ω 2) is obtained by identifying the points
z1, z2 ∈/BV such that z1 −z2 = ω 1m+ ω 2n for some m, n ∈/CI . Since the
opposite sides of the shaded area of ﬁgure 8.1 are identiﬁed, /BV /L(ω 1 ,ω 2) is
homeomorphic to the torus T 2. The complex structure of /BV naturally induces
that of /BV /L(ω 1 ,ω 2). We say that the pair(ω 1,ω 2) deﬁnes a complex structure on
T 2. There are many pairs (ω 1,ω 2) which give the same complex structure onT 2.
When do pairs (ω 1,ω 2) and (ω′
1,ω ′
2) (Im(ω 2/ω 1)> 0, Im (ω′
2/ω′
1)> 0)
deﬁne the same complex structure? We ﬁrst note that two lattices L(ω 1,ω 2) and
L(ω′
1,ω ′
2) coincide if and only if there exists a matrix1
( ab
cd
)
∈PSL(2, /CI )≡SL(2, /CI )//CI
2
such that ( ω′
1
ω′
2
)
=
( ab
cd
)( ω 1
ω 2
)
. (8.2)
This statement is proved as follows.
Suppose
( ω′
1
ω′
2
)
=
( ab
cd
)( ω 1
ω 2
)
where
( ab
cd
)
∈SL(2, /CI ).
1 The group SL(2, /CI ) has been deﬁned in (2.4). Two matrices A and−A are identiﬁed in PSL(2, /CI ).


## Page 330

Since ω′
1,ω ′
2 ∈L(ω 1,ω 2),w eﬁ n dL(ω′
1,ω ′
2)⊂L(ω 1,ω 2).F r o m
( ω 1
ω 2
)
=
( d −b
−ca
)( ω′
1
ω′
2
)
we also ﬁnd L(ω 1,ω 2)⊂L(ω′
1,ω ′
2). Thus, L(ω 1,ω 2)= L(ω′
1,ω ′
2).C o n v e r s e l y ,
if L(ω 1,ω 2)= L(ω′
1,ω ′
2), ω′
1 and ω′
2 are lattice points of L(ω 1,ω 2) and can be
written as ω′
1 = dω 1 + cω 2 and ω′
2 = bω 1 + aω 2 where a, b, c, d ∈/CI .A l s o
ω 1 and ω 2 may be expressed as ω 1 = d′ω′
1+ c′ω′
2 and ω 2 = b′ω′
1+ a′ω′
2 where
a′, b′, c′, d′ ∈/CI .T h e nw eh a v e
( ω 1
ω 2
)
=
( a′ b′
c′ d′
)( ω′
1
ω′
2
)
=
( a′ b′
c′ d′
)( ab
cd
)( ω 1
ω 2
)
from which we ﬁnd
( a′ b′
c′ d′
)( ab
cd
)
=
( 10
01
)
.
Equating the determinants of both sides, we have (a′d′−b′c′)(ad−bc)= 1. All
the entries being integers, this is possible only when ad−bc=± 1. Since
Im
( ω′
2
ω′
1
)
= Im
( bω 1+ aω 2
dω 1+ cω 2
)
= ad−bc
|c(ω 2/ω 1)+ d|2 Im
( ω′
2
ω′
1
)
> 0
we must have ad−bc > 0, that is,
( ab
cd
)
∈SL(2, /CI ).
In fact, it is clear that
( ab
cd
)
∈SL(2, /CI )
deﬁnes the same lattice as
−
( ab
cd
)
and we have to identify those matrices of SL (2, /CI ) w h i c hd i f f e ro n l yb yt h e i r
overall signature. Thus, two lattices agree if they are related by PSL (2, /CI ) ≡
SL(2, /CI )//CI
2.
Assume that there exists a one-to-one holomorphic map h of /BV /L(ω 1 ,ω 2)
onto /BV /L(˜ω 1 ,˜ω 2) where Im (ω 2/ω 1)> 0, Im (˜ω 2/˜ω 1)> 0. Let p : /BV →
/BV /L(ω 1 ,ω 2) and ˜p: /BV →/BV /L(˜ω 1 ,˜ω 2) be the natural projections. For example,
p maps a point in /BV to an equivalent point in /BV /L(ω 1 ,ω 2). Choose the origin 0
and deﬁne h∗(0) to be a point such that ˜p◦h∗(0)= h◦p(0) (ﬁgure 8.2),
/BV
h∗
−−−−−−−−−−→ /BV

↓
p


↓
˜p
/BV /L(ω 1 ,ω 2)
h
−−−−−−−−−−→ /BV /L(˜ω 1 ,˜ω 2).
(8.3)


## Page 331

Figure 8.2. A holomorphic bijection h : /BV /L(ω 1 ,ω 2)→/BV /L(˜ω 1 ,˜ω 2) and the natural
projections p: /BV →/BV /L(ω 1 ,ω 2), ˜p: /BV →/BV /L(˜ω 1 ,˜ω 2) deﬁne a holomorphic bijection
h∗: /BV →/BV .
Then by analytic continuation from the origin, we obtain a one-to-one
holomorphic map h∗of /BV onto itself satisfying
˜p◦h∗(z)= h◦p(z) for all z∈/BV (8.4)
so that the diagram (8.3) commutes. It is known that a one-to-one holomorphic
map of /BV onto itself must be of the form z →h∗(z)= az+ b,w h e r ea, b∈/BV
and a ̸= 0. We then have h∗(ω 1)−h∗(0)= aω 1 and h∗(ω 2)−h∗(0)= aω 2.
For h to be well deﬁned as a map of /BV /L(ω 1 ,ω 2) onto /BV /L(˜ω 1 ,˜ω 2),w em u s t
have aω 1, aω 2 ∈L(˜ω 1,˜ω 2), see ﬁgure 8.2. By changing the roles of (ω 1,ω 2)
and (ω′
1,ω ′
2),w eh a v e˜a˜ω 1,˜a˜ω 1 ∈L(ω 1,ω 2) where˜a̸= 0 is a complex number.
Hence, we conclude that if /BV /L(ω 1 ,ω 2), /BV /L(˜ω 1 ,˜ω 2) have the same complex
structure, there must be a matrix M∈SL(2, /CI ) and a complex number λ( =˜a−1)
such that ( ˜ω 1
˜ω 2
)
= λ M
( ω 1
ω 2
)
. (8.5)
Conversely, we verify that (ω 1,ω 2) and (ω′
1,ω ′
2) related by (8.5) deﬁne the same
complex structure. In fact,
( ω 1
ω 2
)
and M
( ω 1
ω 2
)


## Page 332

Figure 8.3. The quotient space H/PSL(2, /CI ).
deﬁne the same lattice (modulo translation) and we may take h∗: /BV →/BV to be
z↦→z+ b. L(ω 1,ω 2) and L(λω 1,λ ω 2) also deﬁne the same complex structure.
We take, in this case, h∗: z↦→λ z+ b.
We have shown that the complex structure on T 2 is deﬁned by a pair of
complex numbers (ω 1,ω 2) modulo a constant factor and PSL(2, /CI ).T og e tr i do f
the constant factor, we introduce the modular parameter τ ≡ω 2/ω 1 ∈H≡{z∈
/BV | Im z > 0}, to specify the complex structure of T 2. Without loss of generality,
we take 1 and τ to be the generators of a lattice. Note, however, that not all of
τ ∈H are independent modular parameters. As was shown previously, τ and
τ′ = (aτ+ b)/(cτ+ d) deﬁne the same complex structure if
( ab
cd
)
∈PSL(2, /CI ).
The quotient space H /PSL(2, /CI ) is shown in ﬁgure 8.3, the derivation of which
can be found in Koblitz (1984) p 100, and Gunning (1962) p 4.
The change τ →τ′ is called the modular transformation and is generated
by τ →τ + 1a n d τ →−1/τ . The transformation τ →τ + 1 generates a
Dehn twist along the meridian m as follows (ﬁgure 8.4(a)). (i) First, cut a torus
along m. (ii) Then take one of the lips of the cut and rotate it by 2π with the other
lip kept ﬁxed. (iii) Then glue the lips together again. The other transformation
τ →−1/τ corresponds to changing the roles of the longitude l and the meridian
m (ﬁgure 8.4(b)).
Example 8.3. The complex projective space /BV Pn is deﬁned similarly to /CA Pn ;
see example 5.4. The ntuple z = (z0,..., zn )∈/BV
n+1 determines a complex
line through the origin provided that z ̸= 0. Deﬁne an equivalence relation


## Page 333

Figure 8.4. (a) Dehn twists generate modular transformations. (b)τ →−1/τ changes
the roles of l and m.
by z ∼w if there exists a complex number a ̸= 0s u c ht h a tw = az.
Then /BV Pn ≡(/BV
n+1 −{0})/ ∼.T h e (n + 1) numbers z0, z1,..., zn are
called the homogeneous coordinates, which is denoted by[z0, z1,..., zn] where
(z0,..., zn ) is identiﬁed with (λ z0,...,λ zn )( λ ̸= 0). A chart Uµ is a subset of
/BV
n+1−{0} such that zµ ̸= 0. In a chart Uµ,t h einhomogeneous coordinates are
deﬁned by ξ ν
(µ) = zν /zµ (ν ̸= µ).I n Uµ∩Uν ̸=∅, the coordinate transformation
ψ µν : /BV
n →/BV
n is
ξ λ
(ν) ↦→ξ λ
(µ) = zν
zµ ξ λ
(ν) . (8.6)
Accordingly, ψ µν is a multiplication by zν /zµ, which is, of course, holomorphic.
Example 8.4. The complex Grassmann manifoldsGk,n (/BV ) are deﬁned similarly
to the real Grassmann manifolds; see example 5.5. Gk,n (/BV ) is the set of complex
k-dimensional subspaces of /BV
n . Note that /BV Pn = G1,n+1(/BV ).
Let Mk,n (/BV ) be the set of k × n matrices of rank k (k ≤n).T a k e
A, B ∈Mk,n (/BV ) and deﬁne an equivalence relation by A ∼B if there exists
g∈GL(k, /BV ) such that B= gA . We identify Gk,n (/BV ) with Mk,n (/BV )/GL(k, /BV ).
Let{A1,..., Al} be the collection of all the k× k minors of A∈Mk,n (/BV ).W e
deﬁne the chart Uα to be a subset of Gk,n (/BV ) such that det Aα ̸= 0. The k(n−k)
coordinates on Uα are given by the non-trivial entries of the matrix A−1
α A.S e e
example 5.5 for details.


## Page 334

Example 8.5. The common zeros of a set of homogeneous polynomials are a
compact submanifold of /BV Pn called an algebraic variety . For example, let
P(z0,..., zn ) be a homogeneous polynomial of degree d.I f a̸= 0i sac o m p l e x
number, P satisﬁes
P(az0,..., azn )= ad P(z0,..., zn ).
This shows that the zeros of P are deﬁned on /BV Pn ;i f P(z0,..., zn ) = 0t h e n
P([z0,..., zn])= 0. For deﬁniteness, consider
P(z0, z1, z2)= (z0)2+ (z1)2+ (z2)2
and deﬁne N by
N={[ z0, z1, z2]∈/BV P2|P(z0, z1, z2)= 0}. (8.7)
We deﬁne Uµ as in example 8.3. In N∩U0,w eh a v e
[ξ 1
(0)]2+[ ξ 2
(0)]2+ 1= 0
where ξ µ
(0) = zµ/z0 (note that z0 ̸= 0). Consider a holomorphic change of
coordinates (ξ 1
(0),ξ 2
(0)) ↦→(η 1 = ξ 1
(0),η 2 =[ ξ 1
(0)]2 +[ ξ 2
(0)]2 + 1). Note that
∂(η 1,η 2)/∂(ξ 1
(0),ξ 2
(0))̸= 0 unless ξ 2
(0) = z2 = 0. Then N∩U0∩U2 ={ (η 1,η 2)∈
/BV
2|η 2 = 0} is clearly a one-dimensional submanifold of /BV
2 .I f ξ 2
(0) = z2 = 0, we
have (ξ 1
(0),ξ 2
(0))↦→(ζ 1 =[ ξ 1
(0)]2+[ ξ 2
(0)]2+ 1,ζ 2 = ξ 2
(0)) for which the Jacobian
does not vanish unless ξ 1
(0) = z1 = 0. Then N∩U0∩U1 ={ (ζ 1,ζ 2)∈/BV
2|ζ 1 =
0} is a one-dimensional submanifold of /BV
2 .O n N∩U0∩U1∩U2, the coordinate
change η 1 ↦→ζ 2 is a multiplication by z2/z1 and is, hence, holomorphic. In this
way, we may deﬁne a one-dimensional compact submanifold N of /BV P2 .
A complex manifold is a differentiable manifold. For example, /BV
m is
regarded as /CA
2m by the identiﬁcation zµ = xµ + iyµ, xµ, yµ ∈/CA . Similarly,
any chart U of a complex manifold has coordinates (z1,..., zm ) which may be
understood as real coordinates (x1, y1,..., xm , ym ). The analytic property of the
coordinate transformation functions ensures that they are differentiable when the
manifold is regarded as a 2m-dimensional differentiable manifold.
8.2 Calculus on complex manifolds
8.2.1 Holomorphic maps
Let f : M →N, M and N being complex manifolds with dim
/BV
M = m and
dim
/BV
N = n. Take a point p in a chart (U,ϕ ) of M.L e t (V,ψ) be a chart of N
such that f (p)∈V . If we write {zµ}= ϕ( p) and{wν}= ψ( f (p)),w eh a v ea
map ψ ◦f◦ϕ−1 : /BV
m →/BV
n . If each function wν (1≤ν ≤n) is a holomorphic


## Page 335

function of zµ, f is called a holomorphic map. This deﬁnition is independent
of the special coordinates chosen. In fact, let (U′,ϕ′) be another chart such that
U∩U′ ̸=∅and z′µ = x′λ + iy′λ be the coordinates. Take a point p∈U∩U′.I f
wν = uν + ivν is a holomorphic function with respect to z,t h e n
∂ uν
∂ x′λ = ∂ uν
∂ xµ
∂ xµ
∂ x′λ + ∂ uν
∂ yµ
∂ yµ
∂ y′λ = ∂v ν
∂ yµ
∂ yµ
∂ y′λ + ∂v ν
∂ xµ
∂ xµ
∂ y′λ = ∂v ν
∂ y′λ .
We also ﬁnd ∂ uν /∂ y′λ =−∂v ν /∂ x′λ . Thus, wν is holomorphic with respect to
z′ too. It can be shown that the holomorphic property is also independent of the
choice of chart in N.
Let M and N be complex manifolds. We say M is biholomorphic to
N if there exists a diffeomorphism f : M →N which is also holomorphic
(then f−1 : N →M is automatically holomorphic). The map f is called a
biholomorphism.
A holomorphic function is a holomorphic map f : M →/BV .T h e r e i s
a striking theorem; any holomorphic function on a compact complex manifold
is constant. This is a generalization of the maximum principle of elementary
complex analysis, see Wells (1980). The set of holomorphic functions on M
is denoted by /C7 (M). Similarly, /C7 (U ) is the set of holomorphic functions on
U⊂M.
8.2.2 Complexiﬁcations
Let M be a differentiable manifold with dim
/CA
M = m.I f f : M →/BV is
decomposed as f = g+ ih where g, h ∈/BY (M),t h e n f is a complex-valued
smooth function. The set of complex-valued smooth functions on M is called the
complexiﬁcation of /BY (M), denoted by /BY (M)
/BV
. A complexiﬁed function does
not satisfy the Cauchy–Riemann relation in general. For f = g+ ih∈/BY (M)
/BV
,
the complex conjugate of f is
 f ≡g−ih. f is real if and only if f =
 f .
Before we consider the complexiﬁcation of Tp M,w e d e ﬁ n e t h e
complexiﬁcation V
/BV
of a general vector space V with dim
/CA
V = m.A ne l e m e n t
of V
/BV
takes the form X+ iY where X, Y ∈V . The vector space V
/BV
becomes
a complex vector space of complex dimension m if the addition and the scalar
multiplication by a complex number a+ ib are deﬁned by
(X1+ iY1)+ (X2+ iY2)= (X1+ X2)+ i(Y1+ Y2)
(a+ ib)(X+ iY )= (aX −bY )+ i(bX + aY )
V is a vector subspace of V
/BV
since X ∈V and X+ i0∈V
/BV
may be identiﬁed.
Vectors in V are said to be real. The complex conjugate of Z = X + iY is
Z= X−iY . A vector Z is real if Z=
 Z.
A linear operator A on V is extended to act on V
/BV
as
A(X+ iY )= A(X)+ iA(Y ). (8.8)


## Page 336

If A →/CA is a linear function ( A ∈V∗), its extension is a complex-valued
linear function on V
/BV
, A : V
/BV
→/BV . In general, any tensor deﬁned on V
and V∗is extended so that it is deﬁned on V
/BV
and (V∗)
/BV
. An extended tensor is
complexiﬁed as t = t1 + it2,w h e r et1 and t2 are tensors of the same type. The
conjugate of t is
 t ≡t1−it2.I f t =
 t, the tensor is said to be real. For example
A: V
/BV
→/BV is real if
 A(X+ iY )= A(X−iY ).
Let {ek} be a basis of V . If the basis vectors are regarded as complex
vectors, the same basis{ek} becomes a basis of V
/BV
. To see this, let X = Xk ek ,
Y = Y kek ∈V .T h e nZ = X+ iY is uniquely expressed as (Xk + iY k )ek.W e
ﬁnd dim
/CA
V = dim
/BV
V
/BV
.
Now we are ready to complexify the tangent spaceTp M.I f V is replaced by
Tp M, we have the complexiﬁcation Tp M
/BV
of Tp M, whose element is expressed
as Z= X+ iY (X, Y ∈Tp M). The vector Z acts on a function f = f1+ i f2 ∈
/BY (M)
/BV
as
Z[ f]= X[ f1+ i f2]+ iY[ f1+ i f2]
= X[ f1]−Y[ f2]+ i{X[ f2]+ Y[ f1]}. (8.9)
The dual vector space T∗
p M is complexiﬁed if ω, η ∈T∗
p M are combined as
ζ = ω + iη . The set of complexiﬁed dual vectors is denoted by (T∗
p M)
/BV
.
Any tensor t is extended so that it is deﬁned on Tp M
/BV
and (T∗
p M)
/BV
and then
complexiﬁed.
Exercise 8.1. Show that (T∗
p M)
/BV
= (Tp M
/BV
)∗. From now on, we denote the
complexiﬁed dual vector space simply by T∗
p M
/BV
.
Given smooth vector ﬁelds X, Y ∈/CG (M), we deﬁne a complex vector ﬁeld
Z = X + iY . Clearly Z|p ∈Tp M
/BV
. The set of complex vector ﬁelds is the
complexiﬁcation of /CG (M) and is denoted by /CG (M)
/BV
. The conjugate vector ﬁeld
of Z = X+ iY is
 Z = X−iY . Z =
 Z if Z ∈/CG (M), hence /CG (M)
/BV
⊃/CG (M).
The Lie bracket of Z= X+ iY , W = U+ iV ∈/CG (M)
/BV
is
[X+ iY, U+ iV]={[ X, U]−[Y, V]}+ i{[X, V]+[ Y, U]}. (8.10)
The complexiﬁcation of a tensor ﬁeld of type (p, q) is deﬁned in an obvious
manner. If ω, η ∈/Omega11(M), ξ ≡ω + iη ∈/Omega11(M)
/BV
is a complexiﬁed one-form.
8.2.3 Almost complex structure
Since a complex manifold is also a differentiable manifold, we may use the
framework developed in chapter 5. We then put appropriate constraints on
the results. Let us look at the tangent space of a complex manifold M with
dim
/BV
M= m. The tangent space Tp M i ss p a n n e db y2m vectors
{ ∂
∂ x1 ,..., ∂
∂ xm; ∂
∂ y1 ,..., ∂
∂ ym
}
(8.11)


## Page 337

where zµ = xµ+ iyµ are the coordinates of p in a chart (U,ϕ ) . With the same
coordinates, T∗
p M is spanned by
{
dx1,..., dxm; dy1,..., dym
}
. (8.12)
Let us deﬁne 2m vectors
∂
∂ zµ ≡1
2
{ ∂
∂ xµ −i ∂
∂ yµ
}
(8.13a)
∂
∂
 zµ ≡1
2
{ ∂
∂ xµ + i ∂
∂ yµ
}
(8.13b)
where 1 ≤µ≤m. Clearly they form a basis of the 2 m-dimensional (complex)
vector space Tp M
/BV
. Note that
 ∂/∂ zµ = ∂/∂
 zµ. Correspondingly, 2m one-forms
dzµ ≡dxµ+ id yµ d
zµ ≡dxµ−id yµ (8.14)
form the basis of T∗
p M
/BV
. They are dual to (8.13),
⟨dzµ,∂ / ∂
zν⟩=⟨ d
zµ,∂ / ∂zν⟩= 0 (8.15a)
⟨dzµ,∂ / ∂zν⟩=⟨ d
zµ,∂ / ∂
zν⟩= δµν . (8.15b)
Let M be a complex manifold and deﬁne a linear map Jp : Tp M →Tp M
by
Jp
( ∂
∂ xµ
)
= ∂
∂ yµ Jp
( ∂
∂ yµ
)
=− ∂
∂ xµ (8.16)
Jp is a real tensor of type (1, 1). Note that
J2
p =−idTp M . (8.17)
Roughly speaking, Jp corresponds to the multiplication by±i. The action of Jp
is independent of the chart. In fact, let (U,ϕ ) and (V,ψ) be overlapping charts
with ϕ( p) = zµ = xµ + iyµ and ψ( p) = wµ = uµ + ivµ.O n U∩V ,t h e
functions zµ = zµ(w) satisfy the Cauchy–Riemann relations. Then we ﬁnd
Jp
( ∂
∂ uµ
)
= Jp
( ∂ xν
∂ uµ
∂
∂ xν + ∂ yν
∂ uµ
∂
∂ yν
)
= ∂ yν
∂v µ
∂
∂ yν + ∂ xν
∂v µ
∂
∂ xν = ∂
∂v µ .
We also ﬁnd that Jp ∂/∂v µ =−∂/∂ uµ. Accordingly, Jp takes the form
Jp =
( 0 −Im
Im 0
)
(8.18)
with respect to the basis (8.11), where Im is the m× m unit matrix. Since all
the components of Jp are constant at any point, we may deﬁne a smooth tensor
ﬁeld J whose components at p are (8.18). The tensor ﬁeld J is called the almost


## Page 338

complex structure of a complex manifold M. Note that any 2 m-dimensional
manifold locally admits a tensor ﬁeld J which squares to−I2m.H o w e v e r ,J may
be patched across charts and deﬁned globally only on a complex manifold. The
tensor J completely speciﬁes the complex structure.
The almost complex structure Jp is extended so that it may be deﬁned on
Tp M
/BV
,
Jp (X+ iY )≡Jp X+ iJpY. (8.19)
It follows from (8.16) that
Jp ∂/∂ zµ = i∂/∂ zµ Jp ∂/∂
 zµ =−i∂/∂
 zµ. (8.20)
Thus, we have an expression for Jp in (anti-)holomorphic bases,
Jp = id zµ⊗∂
∂ zµ −id
 zµ⊗∂
∂
 zµ (8.21)
whose components are given by
Jp =
( iIm 0
0 −iIm
)
. (8.22)
Let Z∈Tp M
/BV
be a vector of the form Z= Z µ∂/∂ zµ.T h e nZ is an eigenvector
of Jp; Jp Z = iZ. Similarly, Z = Z µ∂/∂
 zµ satisﬁes Jp Z =−iZ.I n t h i s w a y
Tp M
/BV
of a complex manifold is separated into two disjoint vector spaces,
Tp M
/BV
= Tp M+⊕Tp M− (8.23)
where
Tp M± ={ Z∈Tp M
/BV
|Jp Z=± iZ}. (8.24)
We deﬁne the projection operators /C8
± : Tp M
/BV
→Tp M± by
/C8
± ≡1
2 (I2m ∓iJp ). (8.25)
In fact, Jp
/C8
± Z= 1
2 (Jp ∓iJ2
p )Z=± i/C8
± Z for any Z∈Tp M
/BV
. Hence,
Z± ≡/C8
± Z∈Tp M±. (8.26)
Now Z ∈Tp M
/BV
is uniquely decomposed as Z = Z+ + Z−(Z± ∈Tp M±).
Tp M+ is spanned by {∂/∂ zµ} and Tp M−by{∂/∂
 zµ}. Z ∈Tp M+ is called a
holomorphic vector while Z ∈Tp M−is called an anti-holomorphic vector.
We readily verify that
Tp M−=
 Tp M+ ={
 Z|Z∈Tp M+}. (8.27)
Note that
dim
/BV
Tp M+ = dim
/BV
Tp M−= 1
2 dim
/BV
Tp M
/BV
= 1
2 dim
/BV
M.


## Page 339

Exercise 8.2. Let (U,ϕ ) and (V ,ψ) be overlapping charts on a complex manifold
M and let zµ = ϕ( p) and wµ = ψ( p).V e r i f y t h a tX = X µ∂/∂ zµ, expressed
in the coordinates wµ, contains a holomorphic basis
{
∂/∂w µ}
only. Thus, the
separation of Tp M
/BV
into Tp M± is independent of charts (note that J is deﬁned
independently of charts).
Given a complexiﬁed vector ﬁeld Z∈/CG (M)
/BV
, we obtain a new vector ﬁeld
JZ ∈/CG (M)
/BV
deﬁned at each point of M by JZ|p = Jp · Z|p. The vector ﬁeld
Z is naturally separated as
Z= Z++ Z− Z± = /C8
± Z (8.28)
where Z± = /C8
± Z. The vector ﬁeld Z+ (Z−) is called a holomorphic (anti-
holomorphic) vector ﬁeld. Accordingly, once J is given, /CG (M)
/BV
is decomposed
uniquely as
/CG (M)
/BV
= /CG (M)+⊕/CG (M)−. (8.29)
Z= Z++ Z−∈/CG (M)
/BV
is real if and only if Z+ =
 Z−.
Exercise 8.3. Let X, Y ∈/CG (M)+. Show that [X, Y]∈/CG (M)+. [If X, Y ∈
/CG (M)−,t h e n[X, Y]∈/CG (M)−.]
8.3 Complex differential forms
On a complex manifold, we deﬁne complex differential forms by which we will
discuss such topological properties as cohomology groups.
8.3.1 Complexiﬁcation of real differential forms
Let M be a differentiable manifold with dim
/CA
M = m.T a k e t w o q-forms
ω, η ∈/Omega1q
p(M) at p and deﬁne a complex q-form ζ = ω + iη . We denote the
vector space of complex q-forms at p by /Omega1q
p (M)
/BV
. Clearly /Omega1q
p (M)⊂/Omega1q
p(M)
/BV
.
The conjugate of ζ is
 ζ = ω −iη .Ac o m p l e xq-form ζ is real if ζ =
 ζ .
Exercise 8.4. Let ω ∈/Omega1q
p (M)
/BV
. Show that
ω( V1,..., Vq )=
 ω(
 V 1,...,
 V q ) Vi ∈Tp M
/BV
. (8.30)
Show also that
 ω + η =
 ω +
 η ,
 λω =
 λ
 ω and
 ω = ω ,w h e r eω, η ∈/Omega1q
p(M)
/BV
and
λ ∈/BV .
A complex q-form α deﬁned on a differentiable manifold M is a smooth
assignment of an element of /Omega1q
p (M)
/BV
. The set of complex q-forms is denoted by
/Omega1q (M)
/BV
.A c o m p l e xq-form ζ is uniquely decomposed as ζ = ω + iη ,w h e r e
ω, η ∈/Omega1q (M).


## Page 340

The exterior product of ζ = ω + iη and ξ = ϕ + iψ is deﬁned by
ζ∧ξ = (ω + iη)∧(ϕ + iψ)
= (ω ∧ϕ −η∧ψ) + i(ω ∧ψ + η∧ϕ). (8.31)
The exterior derivative d acts on ζ = ω + iη as
dζ = dω + id η. (8.32)
d is a real operator:
 dζ = dω −id η = d
ζ .
Exercise 8.5. Let ω ∈/Omega1q (M)
/BV
and ξ ∈/Omega1r (M)
/BV
. Show that
ω ∧ξ = (−1)qr ξ∧ω (8.33)
d(ω ∧ξ) = dω ∧ξ+ (−1)q ω ∧dξ. (8.34)
8.3.2 Differential forms on complex manifolds
Now we restrict ourselves to complex manifolds in which we have the
decompositions Tp M
/BV
= Tp M+⊕Tp M−and /CG (M)
/BV
= /CG (M)+⊕/CG (M)−.
Deﬁnition 8.2. Let M be a complex manifold with dim
/BV
M = m.L e t ω ∈
/Omega1q
p (M)
/BV
(q ≤2m) and r, s be positive integers such that r+ s = q.L e t Vi ∈
Tp M
/BV
(1≤i ≤q) be vectors in either Tp M+ or Tp M−.I f ω( V1,..., Vq )= 0
unless r of the Vi are in Tp M+ and s of the Vi are in Tp M−, ω is said to be of
bidegree (r, s) or simply an (r, s)-form. The set of (r, s)-forms at p is denoted by
/Omega1r,s
p (M).I f a n (r, s)-form is assigned smoothly at each point of M,w eh a v ea n
(r, s)-form deﬁned over M.T h es e to f(r, s)-forms over M is denoted by/Omega1r,s (M).
Take a chart (U,ϕ ) with the complex coordinates ϕ( p)= zµ. W et a k et h e
bases (8.13) for the tangent spaces Tp M±. The dual bases are given by (8.14).
Note that dzµ is of bidegree (1, 0) since⟨dzµ,∂ / ∂
zν⟩= 0a n dd
zµ is of bidegree
(0, 1). With these bases, a form ω of bidegree (r, s) is written as
ω = 1
r! s! ω µ1...µr ν1...νs dzµ1 ∧... ∧dzµr ∧d
zν1 ∧... ∧d
zνs . (8.35)
The set {dzµ1 ∧... ∧dzµr ∧d
zν1 ∧... ∧d
zνs} is the basis of /Omega1r,s
p (M).T h e
components are totally anti-symmetric in the µ and ν separately. Let zµ and wµ
be two overlapping coordinates. The reader should verify that an (r, s)-form in
the zµ coordinate system is also an (r, s)-form in the wν system.
Proposition 8.1. Let M be a complex manifold of dim
/BV
M = m and ω and ξ be
complex differential forms on M.
(a) If ω ∈/Omega1q,r (M) then
 ω ∈/Omega1r,q (M).
(b) If ω ∈/Omega1q,r (M) and ξ ∈/Omega1q′,r′
(M),t h e nω ∧ξ ∈/Omega1q+q′,r+r′
(M).


## Page 341

(c) A complex q-form ω is uniquely written as
ω =
∑
r+s=q
ω (r,s) (8.36a)
where ω (r,s) ∈/Omega1r,s (M). Thus, we have the decomposition
/Omega1q (M)
/BV
=
⨁
r+s=q
/Omega1r,s (M). ( 8.36b)
The proof is easy and is left to the reader. Now anyq-form ω is decomposed
as
ω =
∑
r+s=q
ω (r,s)
=
∑
r+s=q
1
r!s! ω µ1...µr
 ν 1...
ν s dzµ1 ∧... ∧dzµr ∧d
zν1 ∧... ∧d
zνs
(8.37)
where
ω µ1...µr
 ν 1...
ν s = ω
( ∂
∂ zµ1
,..., ∂
∂ zµr
, ∂
∂
 zν1 ,..., ∂
∂
 zνs
)
. (8.38)
Exercise 8.6. Let dim
/BV
M= m.V e r i f yt h a t
dim
/CA
/Omega1r,s
p (M)=



( m
r
)( m
s
)
if 0≤r, s≤m
0o t h e r w i s e .
Show also that dim
/CA
/Omega1q
p(M)
/BV
= ∑
r+s=q dim
/CA
/Omega1r,s
p (M)=
(2m
q
)
.
8.3.3 Dolbeault operators
Let us compute the exterior derivative of an (r, s)-form ω . From (8.35), we ﬁnd
dω = 1
r!s!
( ∂
∂ zλ ω µ1 ...µr
 ν 1...
ν s dzλ + ∂
∂
 zλ ω µ1 ...µr
 ν 1...
ν s d
zλ
)
× dzµ1 ∧... ∧dzµr ∧d
zν1 ∧... ∧d
zνs . (8.39)
dω is a mixture of an (r+ 1, s)-form and an (r, s+ 1)-form. We separate the
action of d according to its destinations,
d= ∂+
 ∂ (8.40)


## Page 342

where ∂ : /Omega1r,s (M)→/Omega1r+1,s (M) and
 ∂ : /Omega1r,s (M)→/Omega1r,s+1(M). For example,
if ω = ω µ
ν dzµ∧d
zν , its exterior derivatives are
∂ω = ∂ω µ
ν
∂ zλ dzλ ∧dzµ∧d
zν
∂ω = ∂ω µ
ν
∂
 zλ d
zλ ∧dzµ∧d
zν =−∂ω µ
ν
∂
 zλ dzµ∧d
zλ ∧d
zν .
The operators ∂ and
 ∂ are called the Dolbeault operators.
If ω is a general q-form given by (8.37), the actions of ∂ and
 ∂ on ω are
deﬁned by
∂ω =
∑
r+s=q
∂ω (r,s)
 ∂ω =
∑
r+s=q
∂ω (r,s). (8.41)
Theorem 8.1. Let M be a complex manifold and let ω ∈/Omega1q (M)
/BV
and ξ ∈
/Omega1p (M)
/BV
.T h e n
∂∂ω = (∂
 ∂+
 ∂∂)ω =
 ∂
 ∂ω = 0 (8.42a)
∂
 ω =
 ∂ω,
 ∂
 ω =
 ∂ω (8.42b)
∂(ω ∧ξ) = ∂ω ∧ξ+ (−1)q ω ∧∂ξ (8.42c)
∂(ω ∧ξ) =
 ∂ω ∧ξ+ (−1)q ω ∧
∂ξ. (8.42d)
Proof. It is sufﬁcient to prove them when ω is of bidegree (r, s).
(a) Since d= ∂+
 ∂ ,w eh a v e
0= d2ω = (∂+
 ∂)(∂ +
 ∂)ω = ∂∂ω + (∂
 ∂+
 ∂∂)ω +
 ∂
 ∂ω.
The three terms of the RHS are of bidegrees (r + 2, s), (r + 1, s + 1)
and (r, s+ 2) respectively. From proposition 8.1(c), each term must vanish
separately.
(b) Since d
ω =
 dω ,w eh a v e
∂
 ω +
 ∂
 ω = d
ω =
 (∂+
 ∂)ω =
 ∂ω +
 ∂ω.
Noting that ∂ω and
 ∂ω are of bidegree (s+ 1, r ) and
 ∂
 ω and
 ∂ω are of
(s, r+ 1), we conclude that ∂
 ω =
 ∂ω and
 ∂
 ω =
 ∂ω .
(c) We assume ω is of bidegree (r, s) and ξ of (r′, s′). Equation (8.42c) is
proved by separating d (ω ∧ξ) = dω ∧ξ + (−1)q ω ∧dξ , into forms of
bidegrees (r+ r′+ 1, s+ s′) and (r+ r′, s+ s′+ 1). /A3
Deﬁnition 8.3. Let M be a complex manifold. If ω ∈/Omega1r,0(M) satisiﬁes
 ∂ω = 0,
the r-form ω is called a holomorphic r-form.


## Page 343

Let us look at a holomorphic 0-form f ∈/BY (U )
/BV
on a chart (U,ϕ ) .T h e
condition
 ∂ f = 0 becomes
∂ f
∂
 zλ = 01 ≤λ ≤m= dim
/BV
M. (8.43)
A holomorphic 0-form is just a holomorphic function, f ∈/BY (U )
/BV
.L e t ω ∈
/Omega1r,0(M),w h e r e1≤r≤m= dim
/BV
M. On a chart (U,ϕ ) ,w eh a v e
ω = 1
r! ω µ1 ...µr dzµ1 ∧... ∧dzµr . (8.44)
Then
 ∂ω = 0 if and only if
∂
∂
 zλ ω µ1 ...µr = 0
namely if ω µ1...µr are holomorphic functions on U.
Let dim
/BV
M= m. The sequence of /BV -linear maps
/Omega1r,0(M)
∂
−→/Omega1r,1(M)
∂
−→···
···
∂
−→/Omega1r,m−1(M)
∂
−→/Omega1r,m (M) (8.45)
is called the Dolbeault complex. Note that
 ∂ 2 = 0. The set of
 ∂ -closed (r, s)-
forms (those ω ∈/Omega1r,s (M) such that
 ∂ω = 0) is called the (r, s)-cocycle and is
denoted by Zr,s
∂ (M).T h e s e t o f
∂ -exact (r, s)-forms (those ω ∈/Omega1r,s (M) such
that ω =
 ∂η for some η ∈/Omega1r,s−1(M)) is called the (r, s)-coboundary and is
denoted by Br,s
∂ (M). The complex vector space
Hr,s
∂ (M)≡Zr,s
∂ (M)/Br,s
∂ (M) (8.46)
is called the (r, s)th
 ∂-cohomology group, see section 8.6.
8.4 Hermitian manifolds and Hermitian differential geometry
Let M be a complex manifold with dim
/BV
M = m and let g be a Riemannian
metric of M as a differentiable manifold. TakeZ= X+iY, W = U+iV ∈Tp M
/BV
and extend g so that
gp(Z , W )= gp(X, U )−gp(Y, V )+ i[gp(X, V )+ gp(Y, U )]. (8.47)
The components of g with respect to the bases (8.13) are
gµν (p)= gp(∂/∂ zµ,∂ / ∂zν ) (8.48a)
gµ
ν (p)= gp(∂/∂ zµ,∂ / ∂
zν ) (8.48b)
g
µν (p)= gp(∂/∂
 zµ,∂ / ∂zν ) (8.48c)
g
µ
ν (p)= gp(∂/∂
 zµ,∂ / ∂
zν ). (8.48d)


## Page 344

We easily verify that
gµν = gνµ , g
µ
ν = g
ν
 µ, g
µν = gν
 µ,
 gµ
ν = g
µν ,
 gµν = g
µ
ν .
(8.49)
8.4.1 The Hermitian metric
If a Riemannian metric g of a complex manifold M satisﬁes
gp(Jp X, JpY )= gp(X, Y ) (8.50)
at each point p∈M and for any X, Y ∈Tp M, g is said to be aHermitian metric.
The pair (M, g) is called a Hermitian manifold. The vector Jp X is orthogonal
to X with respect to a Hermitian metric,
gp(Jp X, X )= gp(J2
p X, Jp X)=−gp(Jp X, X)= 0. (8.51)
Theorem 8.2. A complex manifold always admits a Hermitian metric.
Proof.L e tg be any Riemannian metric of a complex manifold M.D e ﬁ n e a n e w
metric ˆg by
ˆgp(X, Y )≡1
2[gp(X, Y )+ gp(Jp X, JpY )]. (8.52)
Clearly ˆgp(Jp X, JpY ) =ˆ gp(X, Y ). Moreover, ˆg is positive deﬁnite provided
that g is. Hence, ˆg is a Hermitian metric on M. /A3
Let g be a Hermitian metric on a complex manifoldM. From (8.50), we ﬁnd
that
gµν = g
( ∂
∂ zµ , ∂
∂ zν
)
= g
(
J ∂
∂ zµ , J ∂
∂ zν
)
=−g
( ∂
∂ zµ , ∂
∂ zν
)
=−gµν
hence gµν = 0. We also ﬁnd that g
µ
ν = 0. Thus, the Hermitian metric g takes
the form
g= gµ
ν dzµ⊗d
zν + g
µν d
zµ⊗dzν . (8.53)
[Remark: Take X, Y ∈Tp M+. Deﬁne an inner product h p in Tp M+ by
h p (X, Y )≡gp(X,
 Y ). (8.54)
It is easy to see that h p is a positive-deﬁnite Hermitian form in Tp M+. In fact,
h(X, Y )=
 g(X,
 Y )= g(
X, Y )= h(Y, X)
and h(X, X )= g(X,
 X )= g(X1, X1)+ g(X2, X2)≥0f o rX= X1+ iX2.T h i s
is why a metric g satisfying (8.50) is called Hermitian.]


## Page 345

8.4.2 K ¨ahler form
Let (M, g) be a Hermitian manifold. Deﬁne a tensor ﬁeld /Omega1whose action on
X, Y ∈Tp M is
/Omega1p (X, Y )= gp (Jp X, Y ) X, Y ∈Tp M. (8.55)
Note that /Omega1is anti-symmetric, /Omega1(X, Y ) = g(JX , Y ) = g(J2 X, JY ) =
−g(JY , X )=−/Omega1(Y, X ). Hence, /Omega1deﬁnes a two-form called the K¨ahler form
of a Hermitian metric g. Observe that /Omega1is invariant under the action of J,
/Omega1(JX , JY )= g(J2 X, JY )= g(J3 X, J2Y )= /Omega1(X, Y ). (8.56)
If the domain is extended from Tp M to Tp M
/BV
, /Omega1is a two-form of bidegree
(1, 1). Indeed, for the metric (8.53), it is found that
/Omega1
( ∂
∂ zµ , ∂
∂ zν
)
= g
(
J ∂
∂ zµ , ∂
∂ zν
)
= igµν = 0.
We also have
/Omega1
( ∂
∂
 zµ , ∂
∂
 zν
)
= 0,/Omega1
( ∂
∂ zµ , ∂
∂
 zν
)
= igµ
ν =−/Omega1
( ∂
∂
 zν , ∂
∂ zµ
)
.
Thus, the components of /Omega1are
/Omega1µν = /Omega1
µ
ν = 0 /Omega1µ
ν =−/Omega1
ν µ = igµ
ν . (8.57)
We may write
/Omega1= igµ
ν dzµ⊗d
zν −ig
νµ d
zν ⊗dzµ = igµ
ν dzµ∧d
zν . (8.58)
/Omega1is also written as
/Omega1=−Jµ
ν dzµ∧d
zν (8.59)
where Jµ
ν = gµ
λ J
 λ
 ν =−igµ
ν . /Omega1is a real form;
/Omega1=−i
gµ
ν d
zµ∧dzν = igν
 µ dzν ∧d
zµ = /Omega1. (8.60)
Making use of the K¨ahler form, we show that any Hermitian manifold, and
hence any complex manifold, is orientable. We ﬁrst note that we may choose an
orthonormal basis {ˆe1, Jˆe1,..., ˆem , Jˆem}. In fact, if g(ˆe1,ˆe1) = 1, it follows
that g(Jˆe1, Jˆe1)= g(ˆe1,ˆe1)= 1a n dg(ˆe1, Jˆe1)=−g(Jˆe1,ˆe1)= 0. Thus ˆe1
and Jˆe1 form an orthonormal basis of a two-dimensional subspace. Now take ˆe2
which is orthonormal to ˆe1 and Jˆe1 and form the subspace{ˆe2, Jˆe2}. Repeating
this procedure we obtain an orthonormal basis{ˆe1, Jˆe1,..., ˆem , Jˆem}.
Lemma 8.1. Let /Omega1be the K¨ahler form of a Hermitian manifold with dim
/BV
M =
m.T h e n
/Omega1∧... ∧/Omega1
 
 
m
is a nowhere vanishing 2m-form.


## Page 346

Proof. For the previous orthonormal basis, we have
/Omega1(ˆei , Jˆej )= g(Jˆei , Jˆej )= δij /Omega1(ˆei ,ˆej )= /Omega1(Jˆei , Jˆej )= 0.
Then it follows that
/Omega1∧... ∧/Omega1
 
 
m
(ˆe1, Jˆe1,..., ˆem , Jˆem )
=
∑
P
/Omega1(ˆeP(1), JˆeP(1)).../Omega1(ˆeP(m), JˆeP(m))
= m!/Omega1(ˆe1, Jˆe1).../Omega1(ˆem , Jˆem )= m!
where P is an element of the permutation group of m objects. This shows that
/Omega1∧... ∧/Omega1cannot vanish at any point. /A3
Since the real 2m-form /Omega1∧... ∧/Omega1vanishes nowhere, it serves as a volume
element. Thus, we obtain the following theorem.
Theorem 8.3. A complex manifold is orientable.
8.4.3 Covariant derivatives
Let (M, g) be a Hermitian manifold. We deﬁne aconnection which is compatible
with the complex structure. It is natural to assume that a holomorphic vector
V ∈Tp M+ parallel transported to another pointq is, again, a holomorphic vector
˜V (q)∈Tq M+. We show later that the almost complex structure is covariantly
conserved under this requirement. Let{zµ} and{zµ+ /Delta1zµ} be the coordinates of
p and q, respectively, and letV = V µ∂/∂ zµ|p and ˜V (q)= ˜V µ(z+ /Delta1z)∂/∂ zµ|q .
We assume that (cf (7.9))
˜V µ(z+ /Delta1z)= V µ(z)−V λ (z)/Gamma1µνλ (z)/Delta1zν . (8.61)
Then the basis vectors satisfy (cf (7.14))
∇µ
∂
∂ zν = /Gamma1λ µν (z) ∂
∂ zλ . (8.62a)
Since ∂/∂
 zµ is a conjugate vector ﬁeld of ∂/∂ zµ,w eh a v e
∇
µ
∂
∂
 zν = /Gamma1
λ
 µ
 ν
∂
∂
 zλ (8.62b)
where /Gamma1
λ
 µ
 ν =
 /Gamma1λ µν . /Gamma1λ µν and /Gamma1
λ
 µ
 ν are the only non-vanishing components of
the connection coefﬁcients. Note that ∇µ∂/∂
 zν =∇
µ∂/∂ zν = 0. For the dual
basis, non-vanishing covariant derivatives are
∇µ dzν =−/Gamma1ν µλ dzλ ∇
µ d
zν =−/Gamma1
ν
µ
λ
 zλ . (8.63)


## Page 347

The covariant derivative of X+ = Xµ∂/∂ zµ ∈/CG (M)+ is
∇µ X+ = (∂µ Xλ + Xν /Gamma1λ µν ) ∂
∂ zλ (8.64)
where ∂µ ≡∂/∂ zµ.F o r X−= X
µ∂/∂
 zµ ∈/CG (M)−,w eh a v e
∇µ X−= ∂µ X
λ ∂
∂
 zλ (8.65)
since /Gamma1
λ µν = /Gamma1
λ µ
ν = 0. As far as anti-holomorphic vectors are concerned, ∇µ
works as the ordinary derivative ∂µ. Similarly, we have
∇
µ X+ = ∂
µ Xλ ∂
∂ zλ (8.66)
∇
µ X−= (∂
µ X
λ + X
ν /Gamma1
λ
 µ
 ν ) ∂
∂
 zλ . (8.67)
It is easy to generalize this to an arbitrary tensor ﬁeld. For example, if t =
tµν
 λ dzµ⊗dxν ⊗∂/∂
 zλ ,w eh a v e
(∇κ t)µν
 λ = ∂κ tµν
 λ −tξν
 λ /Gamma1ξ κµ −tµξ
 λ /Gamma1ξ κν
(∇
κ t)µν
 λ = ∂
κ tµν
 λ + tµν
 ξ /Gamma1
λ
κ
 ξ .
We require the metric compatibility as in section 7.2. We demand that
∇κ gµ
ν =∇
κ gµ
ν = 0. In components, we have
∂κ gµ
ν −gλ
 ν /Gamma1λ κµ = 0 ∂
κ gµ
ν −gµ
λ /Gamma1
λ
 κ
 µ = 0. (8.68)
The connection coefﬁcients are easily read off:
/Gamma1λ κµ = g
νλ ∂κ gµ
ν /Gamma1
λ
 κ
 ν = g
λµ ∂
κ gµ
ν (8.69)
where{g
νλ} is the inverse matrix ofgµ
ν ; gµ
λ g
λν = δµν , g
νλ gλ
 µ = δ
ν
 µ. A metric-
compatible connection for which /Gamma1(mixed indices)= 0i sc a l l e dt h eHermitian
connection. By construction, this is unique and given by (8.69).
Theorem 8.4. The almost complex structure J is covariantly constant with respect
to the Hermitian connection,
(∇κ J )ν µ = (∇
κ J )ν µ = (∇κ J )
ν
 µ = (∇
κ J )
ν
 µ = 0. (8.70)
Proof. We prove the ﬁrst equality. From (8.22), we ﬁnd
(∇κ J )ν µ = ∂κ iδν µ−iδξ µ/Gamma1ξ κν + iδν ξ /Gamma1µκξ = 0.
Other equalities follow from similar calculations. /A3


## Page 348

8.4.4 Torsion and curvature
The torsion tensor T and the Riemann curvature tensor R are deﬁned by
T (X, Y )=∇X Y−∇Y X−[X, Y] (8.71)
R(X, Y )Z=∇X∇Y Z−∇Y∇X Z−∇[X,Y] Z . (8.72)
We ﬁnd that
T
( ∂
∂ zµ , ∂
∂ zν
)
= (/Gamma1λ µν −/Gamma1λ νµ ) ∂
∂ zλ
T
( ∂
∂ zµ , ∂
∂
 zν
)
= T
( ∂
∂
 zµ , ∂
∂ zν
)
= 0
T
( ∂
∂
 zµ , ∂
∂
 zν
)
= (/Gamma1
λ
 µ
ν −/Gamma1
λ
 ν
 µ) ∂
∂
 zλ .
The non-vanishing components are
T λ µν = /Gamma1λ µν −/Gamma1λ νµ = g
ξλ (∂µgν
 ξ −∂ν gµ
ξ ) (8.73a)
T
 λ
 µ
ν =/Gamma1
λ
 µ
ν −/Gamma1
λ
 ν
 µ = g
λξ (
∂
µg
νξ −∂
ν g
µξ
)
. (8.73b)
As for the Riemann tensor, we ﬁnd, for example, that
Rκ λµν = ∂µ/Gamma1κ νλ −∂ν /Gamma1κ µλ + /Gamma1η νλ /Gamma1κ µη −/Gamma1η µλ /Gamma1κ νη .
If (8.69) is substituted, we ﬁnd that
Rκ λµν = ∂µg
ξκ ∂ν gλ
 ξ + g
ξκ ∂µ∂ν gλ
 ξ −∂ν g
ξκ ∂µgλ
 ξ −g
ξκ ∂µ∂ν gλ
 ξ
+ g
ξη ∂ν gλ
 ξ g
ζκ ∂µgη
 ζ −g
ξη ∂µgλ
 ξ g
ζκ ∂ν gη
 ζ = 0
where use has been made of the identity g
ζκ ∂µgη
 ζ =−gη
 ζ ∂µg
ζκ etc. In general,
we ﬁnd that
Rκ
λ AB = R
κ λ AB = RA Bκλ = RA
B
κ
 λ = 0 (8.74)
where A and B are any (holomorphic or anti-holomorphic) indices. As a result,
we are left only with the components Rκ λ
 µν , Rκ λµ
 ν , R
κ
λ
 µν and R
κ
λµ
 ν . Note that
we have a trivial symmetry Rκ λ
 µν =−Rκ λν
 µ. So the independent components
are reduced to Rκ λ
 µν and R
κ
λµ
 ν =
 Rκ λ
 µν .W eﬁ n dt h a t
Rκ λ
 µν = ∂
µ/Gamma1κ νλ = ∂
µ(g
ξκ ∂ν gλ
 ξ ) (8.75a)
R
κ
λµ
 ν = ∂µ/Gamma1
κ
ν
 λ = ∂µ(g
κξ ∂
ν gξ
 λ ). (8.75b)


## Page 349

Exercise 8.7. Show that
R
κ λ
 µν ≡g
κ ξ Rξ λ
 µν = ∂
µ∂ν gλ
 κ −g
ηξ ∂
µg
κ ξ ∂ν gλ
 η (8.76a)
Rκ
 λµ
 ν ≡gκ
 ξ R
ξ
λµ
 ν = ∂µ∂
ν g
λκ −gη
 ξ ∂µgκ
 ξ ∂
ν g
λη (8.76b)
R
κλµ
 ν ≡g
κξ Rξ λµ
 ν =−R
κλ
 νµ (8.76c)
Rκ
 λ
 µν ≡gκ
 ξ Rξ
λ
 µν =−Rκ
 λν
 µ. (8.76d)
Verify the symmetries
R
κλ
 µν =−Rλ
 κ
 µν Rκ
 λµ
 ν =−R
λκµ
 ν . (8.77)
Let us contract the indices of the Riemann tensor as
/CA
µ
ν ≡Rκ κµ
 ν =−∂
ν (gκ
 ξ ∂µgκ
 ξ )=−∂
ν ∂µ log G (8.78)
where G ≡det(gµ
ν ) = √
g. To obtain the last equality, we used an identity
δG= Gg µ
ν δgµ
ν ; see (7.204). We deﬁne the Ricci form by
/CA ≡i/CA
µ
ν dzµ∧d
zν = i∂
 ∂ log G. (8.79)
/CA is a real form;
 /CA =−i
∂
 ∂ log G =−i∂
 ∂ log G = /CA . From the identity
∂
 ∂ =−1
2 d (∂−
∂) ,w eﬁ n d/CA is closed; d/CA ∝d2 (∂−
∂) log G= 0. However,
this does not imply that/CA is exact. In fact, G is not a scalar and(∂−
∂) log G is not
deﬁned globally. /CA deﬁnes a non-trivial element c1(M)≡[/CA /2π]∈H 2(M; /CA )
called the ﬁrst Chern class. We discuss this further in section 11.2.
Proposition 8.2. The ﬁrst Chern class c1(M) is invariant under a smooth change
of the metric g→g+ δg.
Proof. It follows from (7.204) that δ log G= gµ
ν δgµ
ν .T h e n
δ/CA = δi∂
 ∂ log G= i∂
 ∂ gµ
ν δgµ
ν =−1
2 d (∂−
∂) igµ
ν δgµ
ν .
Since gµ
ν δgµ
ν is a scalar, ω ≡−1
2 (∂−
∂) gµ
ν δgµ
ν is a well-deﬁned one-form on
M. Thus, δ/CA = dω is an exact two-form and[/CA ]=[ /CA + δ/CA ], namely c1(M) is
left invariant under g→g+ δg. /A3
8.5 K ¨ahler manifolds and K¨ahler differential geometry
8.5.1 Deﬁnitions
Deﬁnition 8.4. A K¨ahler manifold is a Hermitian manifold(M, g) whose K¨ahler
form /Omega1is closed: d /Omega1= 0. The metric g is called the K¨ahler metric of M.
[Warning: Not all complex manifolds admit K¨ahler metrics.]


## Page 350

Theorem 8.5. A Hermitian manifold (M, g) is a K¨ahler manifold if and only if
the almost complex structure J satisﬁes
∇µ J= 0 (8.80)
where∇µ is the Levi-Civita connection associated with g.
Proof. We ﬁrst note that for anyr-form ω ,d ω is written as
dω =∇ω ≡1
r!∇µω ν1...νr dxµ∧dxν1 ∧... ∧dxνr . (8.81)
[For example,
∇/Omega1= 1
2∇λ /Omega1µν dxλ ∧dxµ∧dxν
= 1
2 (∂λ /Omega1µν −/Gamma1κ λµ /Omega1κν −/Gamma1κ λν /Omega1µκ ) dxλ ∧dxµ∧dxν
= 1
2 ∂λ /Omega1µν dxλ ∧dxµ∧dxν = d/Omega1
since /Gamma1is symmetric.] Now we prove that∇µ J= 0 if and only if∇µ/Omega1= 0. We
verify the following equalities:
(∇Z /Omega1)(X, Y )=∇Z[/Omega1(X, Y )]−/Omega1(∇Z X, Y )−/Omega1(X,∇Z Y )
=∇Z[g(JX , Y )]−g(J∇Z X, Y )−g(JX ,∇Z Y )
= (∇Z g)(JX , Y )+ g(∇Z JX , Y )−g(J∇Z X, Y )
= g(∇Z JX −J∇Z X, Y )= g((∇Z J )X, Y )
where∇Z g= 0 has been used. Since this is true for any X, Y, Z, it follows that
∇Z /Omega1= 0 if and only if∇Z J= 0. /A3
Theorems 8.4 and 8.5 show that the Riemann structure is compatible with
the Hermitian structure in the K¨ahler manifold.
Let g be a K¨ahler metric. Since d/Omega1= 0, we have
(∂+
 ∂) igµ
ν dzµ∧d
zν
= i∂λ gµ
ν dzλ ∧dzµ∧d
zν + i∂
λ gµ
ν d
zλ ∧dzµ∧d
zν
= 1
2 i(∂λ gµ
ν −∂µgλ
 ν ) dzλ ∧dzµ∧d
zν
+ 1
2 i(∂
λ gµ
ν −∂
ν gµ
λ ) d
zλ ∧dzµ∧d
zν = 0
from which we ﬁnd
∂ gµ
ν
∂ zλ = ∂ gλ
 ν
∂ zµ
∂ gµ
ν
∂
 zλ =
∂ gµ
λ
∂
 zν . (8.82)


## Page 351

Suppose that a Hermitian metric g is given on a chart Ui by
gµ
ν = ∂µ∂
ν
/C3
i (8.83)
where /C3
i ∈/BY (Ui ). Clearly this metric satisﬁes the condition (8.82), hence it is
K¨ahler. Conversely, it can be shown that any K¨ahler metric is locally expressed
as (8.83). The function /C3
i is called the K¨ahler potential of a K¨ahler metric. It
follows that /Omega1= i∂
 ∂ /C3
i on Ui .
Let (Ui ,ϕ i ) and (Uj ,ϕ j ) be overlapping charts. On Ui ∩Uj ,w eh a v e
∂
∂ zµ
∂
∂
 zν
/C3
i dzµ⊗d
zν = ∂
∂w α
∂
∂
 wβ
/C3
j dwα ⊗d
wβ
where z= ϕ i (p) and w= ϕ j (p). It then follows that
∂w α
∂ zµ
∂
 wβ
∂
 zν
∂
∂w α
∂
∂
 wβ
/C3
j = ∂
∂ zµ
∂
∂
 zν
/C3
i . (8.84)
This is satisﬁed if and only if /C3
j (w,
 w)= /C3
i (z,
 z)+ φ ij (z)+ ψ ij (
z) where φ ij
(ψ ij ) is holomorphic (anti-holomorphic) in z.
Exercise 8.8. Let M be a compact K¨ahler manifold without a boundary. Show
that
/Omega1m ≡/Omega1∧... ∧/Omega1
 
 
m
is closed but not exact where m = dim
/BV
M [Hint: Use Stokes’ theorem.] Thus,
the 2mth Betti number cannot vanish, b2m ≥1. We will see later that b2p ≥1f o r
1≤p≤m.
Example 8.6. Let M = /BV
m ={ (z1,..., zm )}. /BV
m is identiﬁed with /CA
2m by the
identiﬁcation zµ →xµ+ iyµ.L e tδ be the Euclidean metric of /CA
2m ,
δ
( ∂
∂ xµ , ∂
∂ xν
)
= δ
( ∂
∂ yµ , ∂
∂ yν
)
= δµν
δ
( ∂
∂ xµ , ∂
∂ yν
)
= 0.
(8.85a)
Noting that J ∂/∂ xµ = ∂/∂ yµ and J ∂/∂ yµ =−∂/∂ xµ,w eﬁ n dt h a t δ is a
Hermitian metric. In complex coordinates, we have
δ
( ∂
∂ zµ , ∂
∂ zν
)
= δ
( ∂
∂
 zµ , ∂
∂
 zν
)
= 0
δ
( ∂
∂ zµ , ∂
∂
 zν
)
= δ
( ∂
∂
 zµ , ∂
∂ zν
)
= 1
2 δµν .
(8.85b)


## Page 352

The K¨ahler form is given by
/Omega1= i
2
m∑
µ=1
dzµ∧d
zµ = i
2
m∑
µ=1
dxµ∧dyµ. (8.86)
Clearly, d/Omega1= 0 and we ﬁnd that the Euclidean metricδ of /CA
2m is a K¨ahler metric
of /BV
m .T h eK ¨ahler potential is
/C3 = 1
2
∑
zµ
zµ. (8.87)
The K¨ahler manifold /BV
m is called the complex Euclid space.
Example 8.7. Any orientable complex manifold M with dim
/BV
M = 1i sK ¨ahler.
Take a Hermitian metric g whose K¨ahler form is /Omega1.S i n c e/Omega1is a real two-form, a
three-form d/Omega1has to vanish on M. One-dimensional compact orientable complex
manifolds are known as Riemann surfaces.
Example 8.8. A complex projective space /BV Pm is a K¨ ahler manifold. Let
(Uα ,ϕ α ) be a chart whose inhomogeneous coordinates are ϕ α (p)= ξ ν
(α) , ν ̸= α
(see example 8.3). It is convenient to introduce a tidier notation {ζ ν (α)|1≤ν ≤
m} by
ξ ν
(α) = ζ ν
(α) (ν ≤α −1)ξ ν+1
(α) = ζ ν
(α) (ν ≥α). (8.88)
{ζ ν (α)} is just a renaming of{ξ ν (α)}. Deﬁne a positive-deﬁnite function
/C3
α (p)≡
m∑
ν=1
|ζ ν
(α) (p)|2+ 1=
m+1∑
ν=1
⏐⏐
⏐
⏐
z
ν
zα
⏐
⏐
⏐
⏐
2
. (8.89)
At a point p∈Uα ∩Uβ , /C3
α (p) and /C3
β (p) are related as
/C3
α (p)=
⏐
⏐
⏐
⏐
z
β
zα
⏐
⏐
⏐
⏐
2
/C3
β (p). (8.90)
Then it follows that
log /C3
α = log /C3
β + log zβ
zα +
 log zβ
zα . (8.91)
Since zβ /zα is a holomorphic function, we have
 ∂ log zβ /zα = 0. Also
∂
 log zβ /zα =
 ∂ log zβ /zα = 0.
Then it follows that
∂
 ∂ log /C3
α = ∂
 ∂ log /C3
β . (8.92)


## Page 353

A closed two-form /Omega1is locally deﬁned by
/Omega1≡i∂
 ∂ log /C3
α . (8.93)
There exists a Hermitian metric whose K¨ ahler form is /Omega1.T a k e X, Y ∈
Tp
/BV Pn and deﬁne g : Tp
/BV Pn ⊗Tp
/BV Pn →/CA by g(X, Y ) = /Omega1(X, JY ).T o
prove that g is a Hermitian metric, we have to show that g satisﬁes (8.50) and is
positive deﬁnite. The Hermiticity is obvious since g(JX , JY )=−/Omega1(JX , Y )=
/Omega1(Y, JX ) = g(X, Y ). Next, we show that g is positive deﬁnite. On a chart
(Uα ,ϕ α ), we obtain
/Omega1= i ∂ 2 log /C3
∂ζ µ∂
 ζ ν dζ µ∧d
ζ ν (8.94)
where we have dropped the subscript(α) to simplify the notation. If we substitute
the expression (8.89) for /C3 on Uα ,w eh a v e
/Omega1= i
∑
µ,ν
δµν (∑|ζ λ|2+ 1)−ζ µ
ζ ν
(∑|ζ λ|2+ 1)2 dζ µ∧d
ζ ν . (8.95)
Let X be a real vector, X = Xµ∂/∂ζ µ +
 X
µ
∂/∂
 ζ µ and JX = iXµ∂/∂ζ µ −
i
X µ∂/∂
 ζ µ.T h e n
g(X, X)= /Omega1(X, JX )= 2
∑
µ,ν
δµν (∑|ζ λ|2+ 1)−ζ µ
ζ ν
(∑|ζ λ|2+ 1)2 Xµ
 X
ν
= 2
[ ∑
µ
|X µ|2
( ∑
λ
|ζ λ|2+ 1
)
−
⏐⏐
⏐⏐
∑
µ
Xµζ µ
⏐⏐
⏐⏐
2]( ∑
λ
|ζ λ|2+ 1
)−2
.
From the Schwarz inequality
∑
µ
|X µ|2 ·
∑
λ
|ζ λ|2 ≥
∑
µ
|X µζ µ|2,w eﬁ n dt h e
metric g is positive deﬁnite. This metric is called the Fubini–Study metric of
/BV Pn .
A few useful facts are:
(a) S2 is the only sphere which admits a complex structure. Since S2 ≃ /BV P1 ,i t
is a K¨ahler manifold.
(b) A product of two odd-dimensional spheres S2m+1× S2n+1 always admits a
complex structure. This complex structure does not admit a K¨ahler metric.
(c) Any complex submanifold of a K¨ ahler manifold is K¨ahler.
8.5.2 K ¨ahler geometry
AK ¨ahler metric g is characterized by (8.82):
∂ gµ
ν
∂ zλ = ∂ gλ
 ν
∂ zµ
∂ gµ
ν
∂
 zλ =
∂ gµ
λ
∂
 zν .


## Page 354

This ensures that the K¨ahler metric is torsion free:
T λ µν = g
ξλ (∂µgν
 ξ −∂ν gµ
ξ )= 0 (8.96a)
T
 λ
 µ
ν = g
λξ (∂
µg
νξ −∂
ν g
µξ )= 0. (8.96b)
In this sense, the K¨ahler metric deﬁnes a connection which is very similar to the
Levi-Civita connection. Now the Riemann tensor has an extra symmetry
Rκ λµ
 ν =−∂
ν (g
ξκ ∂µgλ
 ξ )=−∂
ν (g
ξκ ∂λ gµ
ξ )= Rκ µλ
 ν (8.97)
as well as those obtained from (8.97) by known symmetry operations,
R
κ
λ
 µν = R
κ
µ
λν , Rκ λ
 µν = Rκ ν
 µλ , R
κ
λµ
 ν = R
κ
νµ
 λ . (8.98)
The Ricci form /CA is deﬁned as before,
/CA =−i∂
ν ∂µ log G dzµ∧d
zν .
Because of (8.97), the components of the Ricci form agree with Ric µ
ν ; /CA
µ
ν ≡
Rκ κµ
 ν = Rκ µκ
 ν = Ric µ
ν .I f Ric = /CA = 0, the K¨ahler metric is said to be Ricci
ﬂat.
Theorem 8.6. Let (M, g) b eaK ¨ahler manifold. If M admits a Ricci ﬂat metric h,
then its ﬁrst Chern class must vanish.
Proof. By assumption, /CA = 0f o rt h em e t r i ch. As was shown in the previous
section, /CA (g)−/CA (h) = /CA (g) = dω . Hence, c1(M) computed from g agrees
with that computed from h and hence vanishes. /A3
A compact K¨ahler manifold with vanishing ﬁrst Chern class is called a
Calabi–Yau manifold. Calabi (1957) conjectured that if c1(M)= 0, the K¨ahler
manifold M admits a Ricci-ﬂat metric. This is proved by Yau (1977). Calabi–Yau
manifolds with dim
/BV
M = 3 have been proposed as candidates for superstring
compactiﬁcation (see Horowitz (1986) and Candelas (1988)).
8.5.3 The holonomy group of K ¨ahler manifolds
Before we close this section, we brieﬂy look at the holonomy groups of K¨ ahler
manifolds. Let (M, g) be a Hermitian manifold with dim
/BV
M = m.T a k e a
vector X ∈Tp M+ and parallel transport it along a loop c at p. Then we end up
with a vector X′ ∈Tp M+ where X
′µ = Xµhν µ. Note that ∇does not mix the
holomorphic indices with anti-holomorphic indices, hence X′ has no components
in Tp M−. Moreover, ∇preserves the length of a vector. These facts tell us that
(hµν (c)) is contained in U(m)⊂O(2m).
Theorem 8.7. If g is the Ricci-ﬂat metric of an m-dimensional Calabi–Yau
maifold M, the holonomy group is contained in SU(m).


## Page 355

Figure 8.5. X ∈Tp M+ is parallel transported along pqrs and comes back as a vector
X′∈Tp M+.
Proof. Our proof is sketchy. If X = Xµ∂/∂ zµ ∈Tp M+ is parallel transported
along the small parallelogram in ﬁgure 8.5 back top,w eh a v eX′ ∈Tp M+ whose
components are (cf (7.44))
X
′µ = Xµ+ Xν Rµ
νκ
 λ εκ
 δλ (8.99)
from which we ﬁnd
hµν = δµν + Rν
µκ
 λ εκ
 δλ . (8.100)
U(m) is decomposed as U(m)= SU(m)×U(1) in the vicinity of the unit element.
In particular, the Lie algebra /D9 (m)= Te(U(m)) is separated into
/D9 (m)= /D7/D9 (m)⊕/D9 (1). (8.101)
/D7/D9 (m) is the traceless part of/D9 (m) while /D9 (1) contains the trace. Since the present
metric is Ricci ﬂat, the /D9 (1) part vanishes,
Rκ κµ
 ν εµ
δν = /CA
µ
ν εµ
δν = 0.
This shows that the holonomy group is contained in SU (m).[ Remark: Strictly
speaking, we have only shown that the restricted holonomy group is contained in
SU(m). This statement remains true even when M is multiply connected.] /A3
8.6 Harmonic forms and
 ∂-cohomology groups
The (r, s)th
 ∂-cohomology group is deﬁned by
Hr,s
∂ (M)≡Zr,s
∂ (M)/Br,s
∂ (M). (8.102)


## Page 356

8.6 HARMONIC FORMS AND
 ∂ -COHOMOLOGY GROUPS 337
An element[ω]∈Hr,s
∂ (M) is an equivalence class of
 ∂ -closed forms of bidegree
(r, s) which differ from ω by a
 ∂ -exact form,
[ω]={ η ∈/Omega1r,s (M)|¯∂η = 0,ω −η =
 ∂ψ,ψ ∈/Omega1r,s−1(M)}. (8.103)
Clearly Hr,s
∂ (M) is a complex vector space. Similarly to the de Rham
cohomology groups, the
 ∂ -cohomology groups of /BV
m are trivial, that is, all the
closed (r, s)-forms are exact. The
 ∂ -cohomology groups measure the topological
non-triviality of a complex manifold M.
8.6.1 The adjoint operators ∂† and
 ∂
†
Let M be a Hermitian manifold with dim
/BV
M = m. Deﬁne the inner product
between α, β ∈/Omega1r,s (M)( 0≤r, s≤m) by
(α, β) ≡
∫
M
α ∧
∗β (8.104)
where
∗:/Omega1r,s (M)→/Omega1m−r,m−s (M) is the Hodge∗deﬁned by
∗β ≡
∗β =∗
β (8.105)
where∗β is computed according to (7.173) extended to /Omega1r+s (M)
/BV
.[ Remark:∗
maps an (r, s)-form to an (m−s, m−r )-form since it acts on a basis of /Omega1r,s (M),
up to an irrelevant factor, as
∗dzµ1 ∧... ∧dzµr ∧d
zν1 ∧... ∧d
zνs ∼εµ1...µr
 µr+1 ...
µm ε
ν 1...
ν s νs+1...νm
× d
zµr+1 ∧... ∧d
zµm ∧dzνs+1 ∧... ∧dzνm .
Note that the above ε-symbols are the only non-vanishing components in a
Hermitian manifold. Now it follows that
∗:/Omega1r,s (M)→/Omega1m−r,m−s (M).]
We deﬁne the adjoint operators ∂ † and
 ∂ † of ∂ and
 ∂ by
(α, ∂β) = (∂ †α, β) (α,
 ∂β) = (
∂
†
α, β). (8.106)
The operators ∂ † and
 ∂
†
change the bidegrees as ∂ † : /Omega1r,s (M) →/Omega1r−1,s (M)
and
 ∂
†
: /Omega1r,s (M) → /Omega1r,s−1(M). Clearly d † = ∂ † +
 ∂
†
. Noting that a
complex manifold M is even dimensional as a differentiable manifold, we have
(see (7.184a))
d† =−∗d∗. (8.107)
Proposition 8.3.
∂ † =−∗
∂∗,
 ∂ † =−∗∂∗. (8.108)


## Page 357

Proof.L e t ω ∈/Omega1r−1,s (M) and ψ ∈/Omega1r,s (M). If we note that ω ∧
∗ψ ∈
/Omega1m−1,m (M) and hence
 ∂(ω ∧
∗ψ) = 0, we ﬁnd that
d (ω ∧
∗ψ) = ∂(ω ∧
∗ψ) = ∂ω ∧
∗ψ + (−1)r+s−1ω ∧∂(
∗ψ)
= ∂ω ∧
∗ψ + (−1)r+s−1ω ∧(−1)r+s+1
∗
∗∂(
∗ψ)
= ∂ω ∧
∗ψ + ω ∧
∗
∗∂
∗ψ (8.109)
where use has been made of the facts ∂
∗ψ ∈/Omega12m−r−s−1(M),
∗∗β =∗∗β and
(7.176a). If (8.109) is integrated over a compact complex manifold M with no
boundary, we have
0= (∂ω, ψ) + (ω,
 ∗∂
∗ψ).
The second term is
(ω,
 ∗∂
∗ψ) = (ω, ∗
∂∗
ψ) = (ω, ∗
∂∗ψ).
We ﬁnally ﬁnd 0 = (∂ω, ψ) + (ω, ∗
∂ ∗ψ) , namely ∂ † =−∗
∂∗. The other
formula
 ∂ † =−∗∂∗follows similarly. /A3
As a corollary of proposition 8.3, we have
(∂ †)2 = (
∂ †)2 = 0. (8.110)
8.6.2 Laplacians and the Hodge theorem
Besides the usual Laplacian /Delta1= (dd†+ d†d), we deﬁne other Laplacians /Delta1∂ and
/Delta1
∂ on a Hermitian manifold,
/Delta1∂ ≡(∂+ ∂ †)2 = ∂∂ †+ ∂ †∂ (8.111a)
/Delta1
∂ ≡(
∂+
 ∂ †)2 =
 ∂
 ∂ †+
 ∂ †
∂. (8.111b)
An (r, s)-form ω which satisﬁes /Delta1∂ ω = 0 (/Delta1
∂ ω = 0) is said to be ∂-harmonic
(
∂-harmonic). If /Delta1∂ ω = 0 (/Delta1
∂ ω = 0), ω satisﬁes ∂ω = ∂ †ω = 0 (
∂ω =
 ∂ †ω =
0).
We have the complex version of the Hodge decomposition. Let Harmr,s
∂ (M)
be the set of
 ∂ -harmonic (r, s)-forms,
Harmr,s
∂ (M)≡{ω ∈/Omega1r,s (M)|/Delta1
∂ ω = 0}. (8.112)
Theorem 8.8. (Hodge’s theorem) /Omega1r,s (M) has a unique orthogonal decomposi-
tion:
/Omega1r,s (M)=
 ∂/Omega1r,s−1(M)⊕
∂
†
/Omega1r,s+1(M)⊕Harmr,s
∂ (M) (8.113a)


## Page 358

8.6 HARMONIC FORMS AND
 ∂ -COHOMOLOGY GROUPS 339
namely an (r, s)-form ω is uniquely expressed as
ω =
 ∂α +
 ∂
†
β + γ( 8.113b)
where α ∈/Omega1r,s−1(M), β ∈/Omega1r,s+1(M) and γ ∈Harmr,s
∂ (M).
The proof is found in lecture 22, Schwartz (1986), for example. If ω is
 ∂ -
closed, we have
 ∂ω =
 ∂
 ∂ †β = 0. Then 0 =⟨ β,
 ∂
 ∂ †β⟩=⟨
 ∂ †β,
 ∂ †β⟩≥0
implies
 ∂
†
β = 0. Thus, any closed (r, s)-form ω is written as ω = γ +
 ∂α ,
α ∈/Omega1r,s−1(M). This shows that Hr,s
∂ (M) ⊂Harmr,s
∂ (M). Note also that
Harmr,s
∂ (M) ⊂Zr,s
∂ (M) since
 ∂γ = 0f o r γ ∈Harmr,s
∂ (M). Moreover,
Harmr,s
∂ (M)∩Br,s
∂ (M) =∅since Br,s
∂ (M) =
 ∂/Omega1r,s−1(M) is orthogonal to
Harmr,s
∂ (M). Then it follows that Harm r,s
∂ (M)∼= Hr,s
∂ (M).I f P : /Omega1r,s (M)→
Harmr,s
∂ (M) denotes the projection operator to a harmonic (r, s)-form, [ω]∈
Hr,s
∂ (M) has a unique harmonic representative Pω ∈Harmr,s
∂ (M).
8.6.3 Laplacians on a K ¨ahler manifold
In a general Hermitian manifold, there exist no particular relationships among
the Laplacians /Delta1, /Delta1∂ and /Delta1
∂ .H o w e v e r , i fM is a K¨ahler manifold, they are
essentially the same. [Note that the Levi-Civita connection is compatible with the
Hermitian connection in a K¨ahler manifold.]
Theorem 8.9. Let M b eaK ¨ahler manifold. Then
/Delta1= 2/Delta1∂ = 2/Delta1
∂ . (8.114)
The proof requires some technicalities and we simply refer to Schwartz
(1986) and Goldberg (1962). This theorem puts constraints on the cohomology
groups of a K¨ahler manifold M. A form ω which satisﬁes
 ∂ω =
 ∂
†
ω = 0
also satisﬁes ∂ω = ∂ †ω = 0. Let ω be a holomorphic p-form;
 ∂ω = 0.
Since ω contains no d
 zµ in its expansion, we have
 ∂ †ω = 0, hence /Delta1
∂ ω =
(
∂
 ∂ †+
 ∂ †
∂)ω = 0. According to theorem 8.9, we then have /Delta1ω= 0, that is any
holomorphic form is automatically harmonic with respect to the K¨ahler metric.
Conversely /Delta1ω= 0 implies
 ∂ω = 0, hence every harmonic form of bidegree
(p, 0) is holomorphic.
8.6.4 The Hodge numbers of K ¨ahler manifolds
The complex dimension of Hr,s
∂ (M) is called the Hodge number br,s.T h e
cohomology groups of a complex manifold are summarized by the Hodge


## Page 359

diamond,






b
m,m
bm,m−1 bm−1,m
...
bm,0 bm−1,1 ... b1,m−1 b0,m
...
b1,0 b0,1
b0,0





. (8.115)
These (m+ 1)
2 Hodge numbers are far from independent as we shall see later.
Theorem 8.10. Let M be a K¨ahler manifold with dim
/BV
M= m. Then the Hodge
numbers satisfy
(a) br,s = bs,r (8.116)
(b) br,s = bm−r,m−s . (8.117)
Proof.( a )I f ω ∈/Omega1r,s (M) is harmonic, it satisﬁes /Delta1
∂ ω = /Delta1∂ ω = 0. Then the
(s, r )-form
 ω is also harmonic, /Delta1
∂
 ω = 0s i n c e/Delta1
∂
 ω =
 /Delta1∂ ω =
 /Delta1
∂ ω = 0 (note
that /Delta1∂ = /Delta1
∂ ). Thus, for any harmonic form of bidegree (r, s), there exists a
harmonic form of bidegree (s, r ) and vice versa. Thus, it follows that br,s = bs,r .
(b) Let ω ∈/Omega1r,s (M) and ψ ∈H m−r,m−s
∂ (M).T h e nω ∧ψ is a volume element
and it can be shown (Schwartz 1986) that
∫
M ω ∧ψ deﬁnes a non-singular
map Hr,s
∂ (M)× H m−r,m−s
∂ (M) →/BV , hence the duality between Hr,s
∂ (M) and
H m−r,m−s
∂ (M). This shows that Hr,s
∂ (M) is isomorphic to H m−r,m−s
∂ (M) as a
vector space and it follows that dim
/BV
Hr,s
∂ (M) = dim
/BV
H m−r,m−s
∂ (M) hence
br,s = bm−r,m−s . /A3
Accordingly, the Hodge diamond of a K¨ahler manifold is symmetric about
the vertical and horizontal lines. These symmetries reduce the number of
independent Hodge numbers to (1
2 m+ 1)2 if m is even and 1
4 (m+ 1)(m+ 3)
if m is odd.
In a general Hermitian manifold, there are no direct relations between the
Betti numbers and the Hodge numbers. If M is a K¨ahler manifold, however,
theorem 8.11 establishes close relationships between them.
Theorem 8.11. Let M be a K¨ahler manifold with dim
/BV
M = m and ∂ M =∅.
Then the Betti numbers bp (1≤p≤2m) satisfy the following conditions;
(a) bp =
∑
r+s=p
br,s (8.118)
(b) b2p−1 is even (1≤p≤m) (8.119)
(c) b2p ≥1 (1≤p≤m) (8.120)


## Page 360

Proof.( a ) Hr,s
∂ (M) is a complex vector space spanned by /Delta1
∂ -harmonic (r, s)-
forms, Hr,s
∂ (M) ={ [ω]|ω ∈/Omega1r,s (M), /Delta1
∂ ω = 0}. Note also that, H p(M)
is a real vector space spanned by /Delta1-harmonic p-forms, H p(M) ={ [ω]|ω ∈
/Omega1p (M), /Delta1ω= 0}. Then the complexiﬁcation of H p(M) is H p(M)
/BV
={[ ω]|ω ∈
/Omega1p (M)
/BV
,/Delta1 ω= 0}.S i n c eM is K¨ahler, any formω which satisﬁes /Delta1
∂ ω = 0a l s o
satsiﬁes /Delta1ω= 0a n dvice versa.S i n c e
/Omega1p(M)
/BV
=⊕r+s=p /Omega1r,s (M)
we ﬁnd that
H p(M)
/BV
=⊕r+s=p Hr,s (M).
Noting that dim
/CA
H p(M)= dim
/BV
H p(M)
/BV
, we obtain bp = ∑
r+s=p br,s.
(b) From (a) and (8.116), it follows that
b2p−1 =
∑
r+s=2p−1
br,s = 2
∑
r+s=2p−1
r>s
br,s .
Thus, b2p−1 must be even.
(c) The crucial observation is that the K¨ ahler form /Omega1is a closed real two-
form, d/Omega1= 0, and the real 2 p-form
/Omega1p = /Omega1∧... ∧/Omega1
 
 
p
is also closed, d /Omega1p = 0. We show that /Omega1p is not exact. Suppose /Omega1p = dη for
some η ∈/Omega12p−1(M).T h e n/Omega1m = /Omega1m−p∧/Omega1p = d (/Omega1m−p∧η) . It follows from
Stokes’ theorem that
∫
M
/Omega1m =
∫
M
d(/Omega1m−p∧η) =
∫
∂ M
/Omega1m−p∧η = 0.
Since the LHS is the volume of M, this is in contradiction. Thus, there is at least
one non-trivial element of H 2p(M) and we have proved that b2p ≥1. /A3
If a K¨ahler manifold is Ricci ﬂat, there exists an extra relationship among
the Hodge numbers, which further reduces the independent Hodge numbers, see
Horowitz (1986) and Candelas (1988).
8.7 Almost complex manifolds
This and the next sections deal with spaces which are closely related to complex
manifolds. These are somewhat specialized topics and may be omitted on a ﬁrst
reading.


## Page 361

8.7.1 Deﬁnitions
There are some differentiable manifolds which carry a similar structure to
complex manifolds. To study these manifolds, we somewhat relax the condition
(8.16) and require a weaker condition here.
Deﬁnition 8.5. Let M be a differentiable manifold. The pair (M, J ),o rs i m p l y
M, is called an almost complex manifold if there exists a tensor ﬁeld J of type
(1, 1) such that at each point p of M, J2
p =−idTp M . The tensor ﬁeld J is also
called the almost complex structure.
Since J2
p =−idTp M , Jp has eigenvalues±i. If there are m + i, then there
must be an equal number of−i, hence Jp is a 2m× 2m matrix and J2
p =−I2m.
Thus, M is an even-dimensional manifold. Note that not all even-dimensional
manifolds are almost complex manifolds. For example, S4 is not an almost
complex manifold (Steenrod 1951). Note also that we now require a weaker
condition J2
p =−I2m. Of course, the tensor Jp deﬁned by (8.16) satisﬁes
J2
p =−I2m, hence a complex manifold is an al most complex manifold. There
are almost complex manifolds which are not complex manifolds. For example, it
is known that S
6 admits an almost complex structure, although it isnot a complex
manifold (Fr¨ohlicher 1955).
Let us complexify a tangent space of an almost complex manifold (M, J ).
Given a linear transformation Jp at Tp M such that J2
p =−I2m,w ee x t e n dJp to a
/BV -linear map deﬁned on Tp M
/BV
. Jp deﬁned on Tp M
/BV
also satisﬁes J2
p =−I2m,
J2
p (X+ iY )= J2
p X+ iJ2
p Y =−X+ i(−Y )=−(X+ iY )
where X, Y ∈Tp M. Let us divide Tp M
/BV
into two disjoint vector subspaces,
according to the eigenvalue of Jp,
Tp M
/BV
= Tp M+⊕Tp M− (8.121)
where
Tp M± ={ Z∈Tp M
/BV
|Jp Z=± iZ}. (8.122)
Any vector V ∈Tp M
/BV
is written as V = W1 +
 W 2,w h e r eW1, W2 ∈Tp M+.
Note that Jp V = iW1−i
W 2. At this stage the reader might have noticed that we
can follow the classiﬁcation scheme of vectors and vector ﬁelds developed for the
complex manifolds in section 8.2. In fact, the only difference is that on a complex
manifold the almost complex structure is explicitly given by (8.18), while on
an almost complex manifold, it is required to satisfy the less strict condition
J
2
p =−I2m. To classify the complexiﬁed tangent spaces and complexiﬁed vector
spaces, we only need the latter condition. Accordingly, we separate Tp M
/BV
into
Tp M± and /CG (M)
/BV
into /CG (M)±, although there does not necessarily exist a basis


## Page 362

of Tp M+ of the form {∂/∂ zµ}. For example, we may still deﬁne the projection
operators
/C8
± ≡1
2 (idTp M ∓iJp ): Tp M
/BV
→Tp M±. (8.123)
We call a vector in Tp M+ (Tp M−) a holomorphic (anti-holomorphic) vector and
a vector ﬁeld in /CG (M)+ (/CG (M)−) a holomorphic (anti-holomorphic) vector ﬁeld.
Deﬁnition 8.6. Let (M, J ) be an almost complex manifold. lf the Lie bracket of
any holomorphic vector ﬁelds X, Y ∈/CG
+(M) is again a holomorphic vector ﬁeld,
[X, Y]∈/CG
+(M), the almost complex structure J is said to be integrable.
Let (M, J ) be an almost complex manifold. Deﬁne the Nijenhuis tensor
ﬁeld N: /CG (M)× /CG (M)→/CG (M) by
N(X, Y )≡[X, Y]+ J[JX , Y]+ J[X, JY]−[JX , JY]. (8.124)
Given a basis {eµ = ∂/∂ xµ} and the dual basis {dxµ}, the almost complex
structure is expressed as J = Jµν dxµ ⊗∂/∂ xν . The component expression
of N is
N(X, Y )= (Xν ∂ν Y µ−Y ν ∂ν Xµ)eµ
+ Jλ µ{Jκ ν Xκ ∂ν Y λ −Y ν ∂ν (Jκ λ Xκ )}eµ
+ Jλ µ{Xν ∂ν (Jκ λ Y κ )−Jκ ν Y κ ∂ν Xλ}eµ
−{Jκ ν Xκ ∂ν (Jλ µY λ )−Jκ ν Y κ ∂ν (Jλ µ Xλ )}eµ
= Xκ Y ν[−Jλ µ(∂ν Jκ λ )+ Jλ µ(∂κ Jν λ )
−Jκ λ (∂λ Jν µ)+ Jν λ (∂λ Jκ µ)]eµ. (8.125)
Thus, N is indeed linear in X and Y and hence a tensor. If J is a complex
structure, J is given by (8.18) and the Nijenhuis tensor ﬁeld trivially vanishes.
Theorem 8.12. An almost complex structure J on a manifold M is integrable if
and only if N(A, B)= 0f o ra n yA, B∈/CG (M).
Proof.L e tZ= X+ iY , W = U+ iV ∈/CG (M)
/BV
. We extend the Nijenhuis tensor
ﬁeld so that its action on vector ﬁelds in /CG (M)
/BV
is given by
N(Z , W )=[ Z , W]+ J[JZ , W]+ J[Z , JW]−[JZ , JW]
={ N(X, U )−N(Y, V )}+ i{N(X, V )+ N(Y, U )}. (8.126)
Suppose that N(A, B) = 0f o ra n yA, B ∈/CG (M). From (8.126), it turns
out that N(Z , W ) = 0f o r Z , W ∈/CG
/BV
(M).L e t Z , W ∈/CG
+(M) ⊂/CG (M)
/BV
.
Since JZ = iZ and JW = iW,w eh a v eN(Z , W )= 2{[Z , W]+ iJ[Z , W]}.B y
assumption, N(Z , W ) = 0a n dw eﬁ n d[Z , W]=− iJ[Z , W] or J[Z , W]=


## Page 363

i[Z , W],t h a ti s ,[Z , W]∈ /CG
+(M). Thus, the almost complex structure is
integrable.
Conversely, suppose that J is integrable. Since /CG
/BV
(M) is a direct sum of
/CG
+(M) and /CG
−(M), we can separate Z , W ∈/CG
/BV
(M) as Z = Z+ + Z−and
W = W++ W−.T h e n
N(Z , W )= N(Z+, W+)+ N(Z+, W−)+ N(Z−, W+)+ N(Z−, W−).
Since JZ± =± iZ± and JW± =± iW±, it is easy to see that N(Z+, W−)=
N(Z−, W+)= 0. We also have
N(Z+, W+)=[ Z+, W+]+ J[iZ+, W+]+ J[Z+, iW+]−[iZ+, iW+]
= 2[Z+, W+]−2[Z+, W+]= 0
since J[Z+, W+]= i[Z+, W+]. Similarly, N(Z−, W−) vanishes and we have
shown that N(Z , W )= 0f o ra n yZ , W ∈/CG
/BV
(M). In particular, it should vanish
for Z , W ∈/CG (M). /A3
If M is a complex manifold, the complex structure J is a constant tensor
ﬁeld and the Nijenhuis tensor ﬁeld vanishes. What about the converse? We now
state an important (and difﬁcult to prove) theorem.
Theorem 8.13. (Newlander and Nirenberg 1957) Let(M, J ) be a 2m-dimensional
almost complex manifold. If J is integrable, the manifold M is a complex
manifold with the almost complex structure J.
In summary we have:
Integrable almost
complex structure = Vanishing Nijenhuis
tensor ﬁeld = Complex manifold.
8.8 Orbifolds
Let M be a manifold and let G be a discrete group which acts on M. Then the
quotient space /Gamma1≡M/G is called an orbifold. As we will see later there are
ﬁxed points in M, which do not transform under the action of G. These points
are singular and the orbifold is not a manifold in general. Thus, even though we
start with a simple manifold M, the orbifold M/G may have quite a complicated
topology.
8.8.1 One-dimensional examples
To obtain a concrete idea, let us consider a simple example. Take M= /CA
2 which
is to be identiﬁed with the complex plane /BV .L e t u s t a k eG = /CI
3 and identify
the points z,e 2π i/3z and e4π i/3z. The orbifold M/G consists of a third of the


## Page 364

Figure 8.6. The orbifold /BV //CI
3 is a third of the complex plane. The edges of the orbifold
are identiﬁed as shown in the ﬁgure. V becomes a vector ˜V after parallel transportation
along C. The angle between V and ˜V is 2π/ 3.
complex plane and after the identiﬁcation of the edges we end up with a cone,
see ﬁgure 8.6. It is interesting to see what the holonomy group of this orbifold
is. We use the ﬂat connection induced by the Euclidean metric of /BV . Then, after
the parallel transport of a vector V along the loop C (this is indeed a loop!), we
obtain a vector ˜V which is different from V after the identiﬁcation. Observe that
the angle between V and ˜V is 2π/ 3. It is easy to verify that the holomony group
is /CI
3. Since the holonomy is trivial for the loop C0 which does not encircle the
origin, we ﬁnd that the curvature is singularat the origin (recall that the curvature
measures the non-triviality of the holonomy, see section 7.3). In general the ﬁxed
points (the origin in the present case) are singular points of the curvature. Note,
however, that /BV //CI
3 is a manifold since it has an open covering homeomorphic to
/CA
2 .
A less trivial example is obtained by taking the torus as the manifold. We
identify the points z and z+ m+ neiπ/ 3 (m, n ∈/CI ) in the complex plane; see
ﬁgure 8.7(a). If we identify the edges of the parallelogram OPQR, we have the
torus T 2.L e t /CI
3 act on T 2 as α : z ↦→e2π i/3z. We ﬁnd that there are three
inequivalent ﬁxed points z = (n/
√
3)eπ i/6 where n = 0, 1 and 2. This orbifold
/Gamma1= /BV //CI
3 consists of two triangles surrounding a hollow; see ﬁgure 8.7 (b).I f
the ﬂat connection induced by the ﬂat metric of the torus is employed to deﬁne the
parallel transport of vectors, we ﬁnd that the holonomy around each ﬁxed point is
/CI
3.


## Page 365

Figure 8.7. Under the action of /CI
3, points of the torus T 2 are identiﬁed. The shaded area
is the orbifold /Gamma1= T 2//CI
3. If the edges of the orbifold are identiﬁed, we end up with the
object in ﬁgure 8.7(b), which is homeomorphic to the sphere S2.
Figure 8.8. The conical singularity. The origin does not look like /CA
n or /BV
n .
8.8.2 Three-dimensional examples
Orbifolds with three complex dimensions have been proposed as candidates for
superstring compactiﬁcation. The detailed treatment of this subject is outside the
scope of this book and the reader should consult Dixson et al (1985, 1986) and
Green et al (1987).
Let T = /BV
3 /L be a three-dimensional complex torus, where L is a lattice
in /BV
3 . For deﬁniteness, let (z1, z2, z3) be the coordinates of /BV
3 and identify zi
and zi + m+ neπ i/3. Under this identiﬁcation, T is identiﬁed with a product of
three tori, T = T1 × T2 × T3. T admits, as before, the action of /CI
3 deﬁned


## Page 366

by α : zi ↦→ e2π i/3zi . If each zi takes one of the values 0 ,( 1/
√
3)eiπ/ 6,
(2/
√
3)eπ i/6, the action of α leaves the point (zi ) invariant. Thus, there are
33 = 27 ﬁxed points in the orbifold. In the present case, the ﬁxed point is a
conical singularity (ﬁgure 8.8) and the orbifold cannot be a manifold. [ Remarks:
The appearance of the conical singularity can be understood more easily from a
simpler example. Let (x, y) ∈/BV
2 and let /CI
2 act on /BV
2 as (x, y) ↦→±(x, y).
Then the orbifold /Gamma1= /BV
2 //CI
2 has a conical singularity at the origin. In fact, let
[(x, y)]→(x2, xy , y2)≡(X, Y, Z ) be an embedding of /Gamma1in /BV
3 . Note that X, Y
and Z satisfy a relation Y 2 = XZ .I f X, Y and Z are thought of as real variables,
this is simply the equation of a cone.]


## Page 367

9
FIBRE BUNDLES
A manifold is a topological space which looks locally like/CA
m , but not necessarily
so globally. By introducing a chart, we give a local Euclidean structure to a
manifold, which enables us to use the conve ntional calculus of several variables.
A ﬁbre bundle is, so to speak, a topological space which looks locally like a direct
product of two topological spaces. Many the ories in physics, such as general
relativity and gauge theories, are described naturally in terms of ﬁbre bundles.
Relevant references are Choquet-Bruhatet al (1982), Eguchi et al (1980) and
Nash and Sen (1983). A complete analysis is found in Kobayashi and Nomizu
(1963, 1969) and Steenrod (1951).
9.1 Tangent bundles
For clariﬁcation, we begin our exposition with a motivating example. A tangent
bundle TM over an m-dimensional manifold M is a collection of all the tangent
spaces of M:
TM ≡
⋃
p∈M
Tp M. (9.1)
The manifold M over which TM is deﬁned is called the base space.L e t{Ui} be
an open covering of M.I f xµ = ϕ i (p) is the coordinate on Ui , an element of
TU i ≡
⋃
p∈Ui
Tp M
is speciﬁed by a point p ∈M and a vector V = V µ(p)(∂/∂ xµ)|p ∈Tp M.
Noting that Ui is homeomorphic to an open subset ϕ( Ui ) of /CA
m and each
Tp M is homeomorphic to /CA
m ,w eﬁ n dt h a t TU i is identiﬁed with a direct
product /CA
m × /CA
m (ﬁgure 9.1). If (p, V ) ∈TU i , the identiﬁcation is given by
(p, V ) ↦→(xµ(p), V µ(p)). TU i is a 2 m-dimensional differentiable manifold.
What is more, TU i is decomposed into a direct product Ui × /CA
m .I f w e p i c k u p
a point u of TU i , we can systematically d ecompose the information u contains
into a point p ∈M and a vector V ∈Tp M. Thus, we are naturally led to the
concept of projection π : TU i →Ui (ﬁgure 9.1). For any point u∈TU i , π( u)
is a point p∈Ui at which the vector is deﬁned. The information about the vector


## Page 368

Figure 9.1. A local piece TU i ≃ /CA
m × /CA
m of a tangent bundle TM . The projection π
projects a vector V ∈Tp M to p.
is completely lost under the projection. Observe that π−1(p) = Tp M.I n t h e
context of the theory of ﬁbre bundles, Tp M is called the ﬁbre at p.
It is obvious by construction that if M = /CA
m , the tangent bundle itself is
expressed as a direct product /CA
m × /CA
m . However, this is not always the case
and the non-trivial structure of the tangent bundle measures the topological non-
triviality of M. To see this, we have to look not only at a single chart Ui but also
at other charts. Let Uj be a chart such that Ui ∩Uj ̸=∅and let yµ = ψ( p) be
the coordinates on Uj . Take a vector V ∈Tp M where p∈Ui ∩Uj . V has two
coordinate presentations,
V = V µ ∂
∂ xµ
⏐⏐
⏐
⏐
p
= ˜V µ ∂
∂ yµ
⏐
⏐
⏐
⏐
p
. (9.2)
It is easy to see that they are related as
˜V ν = ∂ yν
∂ xµ (p)V µ. (9.3)
For{xµ} and{yν} to be good coordinate systems, the matrix (Gν
µ)≡(∂ yν /∂ xµ)
must be non-singular: (Gν
µ) ∈GL(m, /CA ). Thus, ﬁbre coordinates are rotated
by an element of GL (m, /CA ) whenever we change the coordinates. The group
GL(m, /CA ) is called the structure group of TM . In this way ﬁbres are
interwoven together to form a tangent bundle, which consequently may have quite
a complicated topological structure.
We note en passant that the projection π can be deﬁned globally on M.I t
is obvious that π( u)= p does not depend on a special coordinate chosen. Thus,
π : TM →M is deﬁned globally with no reference to local charts.


## Page 369

Let X ∈/CG (M) be a vector ﬁeld on M. X assigns a vector X|p ∈Tp M
at each point p ∈M. From our viewpoint, X is looked upon as a smooth map
M →TM . This map is not utterly arbitrary since a point p must be mapped to
a point u ∈TM such that π( u)= p.W e d e ﬁ n e asection (or a cross section)
of TM as a smooth map s : M →TM such that π ◦s = idM . If a section
si : Ui →TU i is deﬁned only on a chart Ui , it is called a local section.
9.2 Fibre bundles
The tangent bundle in the previous section is an example of a more general
framework called a ﬁbre bundle. Deﬁnitions are now in order.
9.2.1 Deﬁnitions
Deﬁnition 9.1. A (differentiable) ﬁbre bundle (E,π , M, F, G) consists of the
following elements:
(i) A differentiable manifold E called the total space.
(ii) A differentiable manifold M called the base space.
(iii) A differentiable manifold F called the ﬁbre (or typical ﬁbre).
(iv) A surjection π : E →M called the projection. The inverse image
π−1(p)= Fp ∼= F is called the ﬁbre at p.
(v) A Lie group G called the structure group, which acts on F on the left.
(vi) A set of open covering{Ui} of M with a diffeomorphism φ i : Ui× F→
π−1(Ui ) such that π ◦φ i (p, f ) = p.T h e m a p φ i is called the local
trivialization since φ−1
i maps π−1(Ui ) onto the direct product Ui × F.
(vii) If we write φ i (p, f ) = φ i,p ( f ),t h em a p φ i,p : F → Fp is a
diffeomorphism. On Ui ∩Uj ̸=∅, we require that tij (p)≡φ−1
i,p ◦φ j,p :
F →F be an element of G.T h e nφ i and φ j are related by a smooth map
tij : Ui ∩Uj →G as (ﬁgure 9.2)
φ j (p, f )= φ i (p, tij (p) f ). (9.4)
The maps tij are called the transition functions.
[Remarks: We often use a shorthand notation E
π
−→M or simply E to denote a
ﬁbre bundle (E,π , M, F, G).
Strictly speaking, the deﬁnition o f a ﬁbre bundle should be independent of
the special covering {Ui} of M. In the mathematical literature, this deﬁnition
is employed to deﬁne a coordinate bundle (E,π , M, F, G,{Ui},{φ i}).T w o
coordinate bundles (E,π , M, F, G,{Ui},{φ i}) and (E,π , M, F, G,{Vi},{ψ i})
are said to be equivalent if (E,π , M, F, G,{Ui}∪{Vj},{φ i}∪{ψ j}) is again a
coordinate bundle. A ﬁbre bundle is deﬁned as an equivalence class of coordinate
bundles. In practical applications in physics, however, we always employ a certain


## Page 370

Figure 9.2. On the overlapUi∩U j , two elements fi , f j ∈F are assigned to u∈π−1(p),
p∈Ui ∩U j . They are related by tij (p) as fi = tij (p) f j .
deﬁnite covering and make no distinction between a coordinate bundle and a ﬁbre
bundle.]
We need to clarify several points. Let us take a chartUi of the base space M.
π−1(Ui ) is a direct product diffeomorphic to Ui × F, φ−1
i : π−1(Ui )→Ui × F
being the diffeomorphism. If Ui ∩Uj ̸=∅,w eh a v et w om a p sφ i and φ j on
Ui ∩Uj . Let us take a point u such that π( u)= p∈Ui ∩Uj . We then assign
two elements of F, one by φ−1
i and the other by φ−1
j ,
φ−1
i (u)= (p, fi ), φ −1
j (u)= (p, f j ) (9.5)
s e eﬁ g u r e9 . 2 .T h e r ee x i s t sam a ptij : Ui ∩Uj →G which relates fi and f j as
fi = tij (p) f j . This is also written as (9.4).
We require that the transition functions satisfy the following consistency
conditions:
tii (p)= identity map (p∈Ui ) (9.6a)
tij (p)= tji (p)−1 (p∈Ui ∩Uj ) (9.6b)
tij (p)· tjk (p)= tik (p)( p∈Ui ∩Uj ∩Uk ). (9.6c)
Unless these conditions are satisﬁed, local pieces of a ﬁbre bundle cannot be glued
together consistently. If all the transition functions can be taken to be identity
maps, the ﬁbre bundle is called a trivial bundle. A trivial bundle is a direct
product M× F.


## Page 371

Given a ﬁbre bundle E
π
−→M, the possible set of transition functions is
obviously far from unique. Let{Ui} be a covering of M and{φ i} and{˜φ i} be two
sets of local trivializations giving ri se to the same ﬁbre bundle. The transition
functions of respective local trivializations are
tij (p)= φ−1
i,p ◦φ j,p (9.7a)
˜tij (p)= ˜φ−1
i,p ◦˜φ j,p . (9.7b)
Deﬁne a map gi (p): F→F at each point p∈M by
gi (p)≡φ−1
i,p ◦˜φ i,p . (9.8)
We require that gi (p) be a homeomorphism which belongs to G.T h i s
requirement must certainly be fulﬁlled if {φ i} and{˜φ i} describe the same ﬁbre
bundle. It is easily seen from (9.7) and (9.8) that
˜tij (p)= gi (p)−1◦tij (p)◦g j (p). (9.9)
In the practical situations which we shall encounter later, tij are the gauge
transformations required for pasting local charts together, while gi corresponds
to the gauge degrees of freedom within a chartUi . If the bundle is trivial, we may
put all the transition functions to be identity maps. Then the most general form of
the transition functions is
tij (p)= gi (p)−1g j (p). (9.10)
Let E
π
−→M be a ﬁbre bundle. A section (or a cross section) s: M→E
is a smooth map which satisﬁesπ ◦s= idM . Clearly, s(p)= s|p is an element of
Fp = π−1(p). The set of sections on M is denoted by /Gamma1(M, F).I f U ⊂M,w e
may talk of alocal section which is deﬁned only onU. /Gamma1(U, F) denotes the set of
local sections on U. For example, /Gamma1(M, TM ) is identiﬁed with the set of vector
ﬁelds /CG (M). It should be noted that not all ﬁbre bundles admit global sections.
Example 9.1. Let E be a ﬁbre bundle E
π
−→S1 with a typical ﬁbre F=[−1, 1].
Let U1 = (0, 2π) and U2 = (−π, π) be an open covering of S1 and let
A = (0,π) and B = (π, 2π) be the intersection U1 ∩U2, see ﬁgure 9.3. The
local trivializations φ 1 and φ 2 are given by
φ−1
1 (u)= (θ, t), φ −1
2 (u)= (θ, t)
for θ ∈A and t ∈F. The transition function t12(θ ), θ ∈A, is the identity map
t12(θ ): t↦→t. We have two choices on B;
(I) φ−1
1 (u)= (θ, t), φ−1
2 (u)= (θ, t)
(II) φ−1
1 (u)= (θ, t), φ−1
2 (u)= (θ,−t)


## Page 372

Figure 9.3. The base space S1 and two charts U1 and U2 over which the ﬁbre bundle is
trivial.
Figure 9.4. Two ﬁbre bundles overS1:( a) is the cylinder which is a trivial bundle S1× I;
(b)i st h eM ¨obius strip.
For case (I), we ﬁnd that t12(θ ) is the identity map and two pieces of the local
bundles are glued together to form a cylinder (ﬁgure 9.4( a)). For case (II), we
have t12(θ ): t↦→−t, θ ∈B, and obtain the M¨obius strip (ﬁgure 9.4(b)). Thus, a
cylinder has the trivial structure group G={ e} where e is the identity map of F
onto F while the M¨obius strip has G={ e, g} where g: t↦→−t.S i n c eg2 = e,
we ﬁnd G∼=
/CI
2. A cylinder is a trivial bundle S1× F, while the M¨obius strip is
not. [Remark: The group /CI
2 is not a Lie group. This is the only occasion we use
a discrete group for the structure group.]
9.2.2 Reconstruction of ﬁbre bundles
What is the minimal information required to construct a ﬁbre bundle? We now
show that for given M,{Ui}, tij (p), F and G, we can reconstruct the ﬁbre bundle
(E,π , M, F, G). This amounts to ﬁnding a unique π, E and φ i from given data.
Let us deﬁne
X≡
⋃
i
Ui × F. (9.11)
Introduce an equivalence relation ∼between (p, f ) ∈Ui × F and (q, f′) ∈
Uj × F by (p, f ) ∼(q, f′) if and only if p = q and f′ = tij (p) f .A ﬁ b r e


## Page 373

Figure 9.5. A bundle map ¯f : E′→E induces a map f : M′ →M.
bundle E is then deﬁned as
E= X/∼. (9.12)
Denote an element of E by[(p, f )]. The projection is given by
π :[ (p, f )]↦→p. (9.13)
The local trivialization φ i : Ui × F→π−1(Ui ) is given by
φ i : (p, f )↦→[(p, f )]. (9.14)
The reader should verify that E,π and{φ i} thus deﬁned satisfy all the axioms of
ﬁbre bundles. Thus, the given data reconstruct a ﬁbre bundle E uniquely.
This procedure may be employed to construct a new ﬁbre bundle from an old
one. Let (E,π , M, F, G) be a ﬁbre bundle. Associated with this bundle is a new
bundle whose base space is M, transition function tij (p), structure group G and
ﬁbre F′ on which G acts. Examples of associated bundles will be given later.
9.2.3 Bundle maps
Let E
π
−→M and E′ π′
−→M′ be ﬁbre bundles. A smooth map ¯f : E′ →E
is called a bundle map if it maps each ﬁbre F′
p of E′ onto Fq of E.T h e n ¯f
naturally induces a smooth map f : M′ →M such that f (p)= q (ﬁgure 9.5).
Observe that the diagram
E′ ¯f
−→E
↓
π′


↓
π
M′ f
−→M


u
¯f
−→¯f (u)
↓
π′


↓
π
p
f
−→ q

 (9.15)
commutes. [ Caution: A smooth map ¯f : E′ →E is not necessarily a bundle
map. It may map u,v ∈F′
p of E′ to ¯f (u) and ¯f (v) on different ﬁbres of E so
that π( ¯f (u))̸= π( ¯f (v)).]


## Page 374

Figure 9.6. Given a ﬁbre bundle E π−→M,am a p f : N →M deﬁnes a pullback bundle
f∗E over N.
9.2.4 Equivalent bundles
Two bundles E′ π′
−→M and E
π
−→M are equivalent if there exists a bundle map
¯f : E′ →E such that f : M→M is the identity map and¯f is a diffeomorphism:
E′ ¯f
−→E↓π′
↓π
M
idM
−→M.
(9.16)
This deﬁnition of equivalent bundles is in harmony with that given in the remarks
following deﬁnition 9.1.
9.2.5 Pullback bundles
Let E
π
−→M be a ﬁbre bundle with typical ﬁbre F.I f a m a p f : N →M is
given, the pair (E, f ) deﬁnes a new ﬁbre bundle over N with the same ﬁbre F
(ﬁgure 9.6). Let f∗E be a subspace of N× E, which consists of points (p, u)
such that f (p)= π( u). f∗E ≡{(p, u)∈N× E| f (p)= π( u)} is called the
pullback of E by f .T h eﬁ b r eFp of f∗E is just a copy of the ﬁbre Ff (p) of E.I f
we deﬁne f∗E
π 1
−→N by π 1 : (p, u)↦→p and f∗E
π 2
−→E by (p, u)↦→u,t h e
pullback f∗E may be endowed with the structure of a ﬁbre bundle and we obtain
the following bundle map,
f∗E
π 2
−→E
↓
π 1


↓
π
N
f
−→M


(p, u)
π 2
−→ u
↓
π 1


↓
π
p
f
−→f (p)

 . (9.17)


## Page 375

Figure 9.7. The transition function t∗
ij of the pullback bundle f∗E is a pullback of the
transition function tij of E.
The commutativity of the diagram follows since π(π 2(p, u))= π( u)= f (p)=
f (π 1(p, u)) for (p, u)∈f∗E. In particular, if N = M and f = idM ,t h e nt w o
ﬁbre bundles f∗E and E are equivalent.
Let{Ui} be a covering of M and{φ i} be local trivializations. { f−1(Ui )}
deﬁnes a covering of N such that f∗E is locally trivial. Take u ∈E such
that π( u) = f (p) ∈Ui for some p ∈N.I f φ−1
i (u) = ( f (p), fi ) we ﬁnd
ψ−1
i (p, u)= (p, fi ) where ψ i is the local trivialization of f∗E. The transition
function tij at f (p)∈Ui ∩Uj maps f j to fi = tij ( f (p)) f j . The corresponding
transition function t∗
ij of f∗E at p∈f−1(Ui )∩f−1(Uj ) also maps f j to fi ;s e e
ﬁgure 9.7. This shows that
t∗
ij (p)= tij ( f (p)). (9.18)
Example 9.2. Let M and N be differentiable manifolds with dim M = dim N =
m.L e t f : N→M be a smooth map. The map f induces a mapπ 2 : TN →TM
such that the following diagram commutes:
TN
π 2
−→TM↓π 1

↓
π
N
f
−→M.
(9.19)
Let W = W ν ∂/∂ yν be a vector of Tp N and V = V µ∂/∂ xµ be the corresponding
vector of T f (p) M.I f TN is a pullback bundle f∗(TM ), π 2 maps Tp N to Tf (p) M
diffeomorphically. This is possible if and only if π 2 has the maximal rank m at


## Page 376

each point of TN .L e t ϕ( f (p)) = ( f 1(y) ,..., f m (y)) be the coordinates of
f (p) in a chart (U,ϕ ) of M,w h e r ey= ϕ( p) are the coordinates of p in a chart
(V,ψ) of N. The maximal rank condition is given by det (∂ f µ(y)/∂ yν )̸= 0f o r
any p∈N.
9.2.6 Homotopy axiom
Let f and g be maps from M′ to M. They are said to be homotopic if there
exists a smooth map F : M′ ×[ 0, 1]→ M such that F(p, 0) = f (p) and
F(p, 1)= g(p) for any p∈M′, see section 4.2.
Theorem 9.1. Let E
π
−→M be a ﬁbre bundle with ﬁbre F and let f and g be
homotopic maps from N to M.T h e n f∗E and g∗E are equivalent bundles over
N.
The proof is found in Steenrod (1951). Let M be a manifold which is
contractible to a point. Then there exists a homotopy F : M× I →M such
that
F(p, 0)= pF (p, 1)= p0
where p0 ∈M is a ﬁxed point. Let E
π
−→M be a ﬁbre bundle over M and
consider pullback bundles h∗
0 E and h∗
1
E,w h e r eht (p) ≡F(p, t).T h e ﬁ b r e
bundle h∗
1 E is a pullback of a ﬁbre bundle{p0}× F and hence is a trivial bundle:
h∗
1
E ≃ M× F.H o w e v e r ,h∗
0
E = E since h0 is the identity map. According to
theorem 9.1, h∗
0 E= E is equivalent toh∗
1
E= M× F, hence E is a trivial bundle.
For example, the tangent bundle T /CA
m is trivial. We have obtained the following
corollary.
Corollary 9.1. Let E
π
−→M be a ﬁbre bundle. E is trivial if M is contractible to
a point.
9.3 Vector bundles
9.3.1 Deﬁnitions and examples
A vector bundle E
π
−→M is a ﬁbre bundle whose ﬁbre is a vector space. Let
F be /CA
k and M be an m-dimensional manifold. It is common to call k the
ﬁbre dimension and denote it by dim E, although the total space E is m+ k
dimensional. The transition functions belong to GL (k, /CA ), since it maps a vector
space onto another vector space of the same dimension isomorphically. If F is a
complex vector space /BV
k , the structure group is GL(k, /BV ).
Example 9.3. A tangent bundle TM over an m-dimensional manifold M is a
vector bundle whose typical ﬁbre is /CA
m , see section 9.1. Let u be a point in
TM such that π( u) = p ∈Ui ∩Uj ,w h e r e{Ui} covers M.L e t xµ = ϕ i (p)


## Page 377

(yµ = ϕ j (p)) be the coordinate system of Ui (Uj ). The vector V corresponding
to u is expressed as V = V µ∂/∂ xµ|p = ˜V µ∂/∂ yµ|p. The local trivializations are
φ−1
i (u)= (p,{V µ})φ −1
j (u)= (p,{˜V µ}). (9.20)
The ﬁbre coordinates{V µ} and{˜V µ} are related as
V µ = Gµν (p)˜V ν (9.21)
where {Gµν (p)}={ (∂ xµ/∂ yν )p}∈ GL(m, /CA ). Hence, a tangent bundle
is (TM ,π , M, /CA
m , GL(m, /CA )). Sections of TM are the vector ﬁelds on M;
/CG (M)= /Gamma1(M, TM ).
For concreteness let us work out TS 2. Let the pair UN ≡S2−{South Pole}
and US ≡S2−{North Pole} be an open covering of S2.L e t (X, Y ) and (U, V )
be the respective stereographic coordinates (example 8.1). They are related as
U= X/(X2+ Y 2) V =−Y/(X2+ Y 2). (9.22)
Take u∈TS 2 such that π( u)= p∈UN∩US.L e t φ N and φ S be the respective
local trivializations such that φ−1
N (u) = (p, V µ
N ) and φ−1
S (u) = (p, V µ
S ).T h e
transition function is
tSN(p)= ∂( U, V )
∂( X, Y ) = 1
r2
( −cos 2θ −sin 2θ
sin 2θ −cos 2θ
)
(9.23)
w h e r ew eh a v ep u tX= r cos θ and Y = r sin θ . The transition of the components
of the tangent vectors consists of a rotation of{V µ
i } by an angle 2θ followed by a
rescaling. The reader should verify that tNS(p)= tSN(p)−1.
Example 9.4. Let M be an m-dimensional manifold embedded in /CA
m+k .L e t
Np M be the vector space which is normal to Tp M in /CA
m+k ,t h a ti s ,U· V = 0
with respect to the Euclidean metric in /CA
m+k for any U ∈Np M and V ∈Tp M.
The vector space Np M is isomorphic to /CA
k .T h enormal bundle
NM ≡
⋃
p∈M
Np M
is a vector bundle with the typical ﬁbre /CA
k .
Consider the sphere S2 embedded in /CA
3 . The normal bundle NS 2 is
imagined as S2 whose surface is pierced perpendicularly by straight lines. NS 2 is
a trivial bundle S2× /CA .
A vector bundle whose ﬁbre is one-dimensional ( F = /CA or /BV ) is called a
line bundle. A cylinder S1× /CA is a trivial /CA -line bundle. A M¨obius strip is also a
real line bundle. The structure group GL(1, /CA )= /CA −{0} or GL(1, /BV )= /BV −{0}
is Abelian.


## Page 378

In the following, we often consider thecanonical line bundle L. Recall that
an element p of /BV Pn is a complex line in /BV
n+1 through the origin (example 8.3).
The ﬁbre π−1(p) of L is deﬁned to be the line in /BV
n+1 which belongs to p.M o r e
formally, let In+1 ≡/BV Pn × /BV
n+1 be a trivial bundle over /BV Pn . If we write an
element of In+1 as (p,v ), p∈/BV Pn ,v ∈/BV
n+1 , L is deﬁned by
L≡{(p,v )∈I n+1|v= ap , a∈/BV }.
The projection is (p,v )
π
→p.
Example 9.5. The (trivial) complex line bundle L = /CA
3 × /BV is associated with
the non-relativistic quantum mechanics deﬁned on/CA
3 . The wavefunction ψ( x) is
simply a section of L.
Let us consider a wavefunction ψ( x) in the ﬁeld of a magnetic monopole
studied in section 1.9. When a monopole is at the origin, ψ( x) is deﬁned on
/CA
3 −{0} and we have a complex line bundle over /CA
3 −{0}. If we are interested
only in the wavefunction on S2 surrounding the monopole, we have a complex
line bundle over S2. Note that S2 is a deformation retract of /CA
3 −{0}.
9.3.2 Frames
On a tangent bundle TM , each ﬁbre has a natural basis {∂/∂ xµ} given by the
coordinate system xµ on a chart Ui . We may also employ the orthonormal basis
{ˆeα} if M is endowed with a metric. ∂/∂ xµ or{ˆeα} is a vector ﬁeld on Ui and the
set{∂/∂ xµ} or{ˆeα} forms linearly independent vector ﬁelds over Ui .I ti sa l w a y s
possible to choose m linearly independent tangent vectors over Ui but it is not
necessarily the case throughout M. By deﬁnition, the components of the basis
vectors are
∂/∂ xµ = (0, ..., 0, 1, 0, ..., 0)
µ
or
ˆeα = (0, ..., 0, 1, 0, ..., 0).
α
These vectors deﬁne a (local) frame over Ui , see later.
Let E
π
→M be a vector bundle whose ﬁbre is /CA
k (or /BV
k ). On a chart
Ui , the piece π−1(Ui ) is trivial, π−1(Ui ) ∼= Ui × /CA
k , and we may choose k
linearly independent sections{e1(p) ,..., ek (p)} over Ui . These sections are said
to deﬁne aframe over Ui . Given a frame overUi ,w eh a v ean a t u r a lm a pFp →F
(=/CA
k or /BV
k ) given by
V = V α eα (p)↦−→ {V α}∈F. (9.24)
The local trivialization is
φ−1
i (V )= (p,{V α (p)}). (9.25)


## Page 379

By deﬁnition, we have
φ i (p,{0, ..., 0, 1, 0, ..., 0})
α
= eα (p). (9.26)
Let Ui ∩Uj ̸=∅and consider the change of frames. We have a frame
{e1(p) ,..., ek (p)} on Ui and{˜e1(p) ,..., ˜ek (p)} on Uj ,w h e r ep∈Ui ∩Uj .A
vector˜eβ (p) is expressed as
˜eβ (p)= eα (p)G(p)α
β (9.27)
where G(p)α β ∈GL(k, /CA ) or GL(k, /BV ). Any vector V ∈π−1(p) is expressed as
V = V α eα (p)= ˜V α ˜eα (p). (9.28)
From (9.27) and (9.28) we ﬁnd that
˜V β = G−1(p)β
α V α (9.29)
where G−1(p)β α G(p)α γ = G(p)β α G−1(p)α γ = δβ γ . Thus, we ﬁnd that the
transition function tji (p) is given by a matrix G−1(p).
9.3.3 Cotangent bundles and dual bundles
The cotangent bundle T∗M ≡⋃
p∈M T∗
p M is deﬁned similarly to the tangent
bundle. On a chart Ui whose coordinates are xµ, the basis of T∗
p M is taken to be
{dx1,..., dxm}, which is dual to{∂/∂ xµ}.L e t yµ be the coordinates of Uj such
that Ui ∩Uj ̸=∅.F o r p∈Ui ∩Uj , we have the transformation,
dyµ = dxν
( ∂ yµ
∂ xν
)
p
. (9.30)
A one-form ω is expressed, in both coordinate systems, as
ω = ω µ dxµ =˜ω µ dyµ
from which we ﬁnd that
˜ω µ = Gµν (p)ω ν (9.31)
where Gµν (p)≡(∂ xν /∂ yµ)p corresponds to the transition function tji (p).N o t e
that /Gamma1(M, T∗M)= /Omega11(M).
This cotangent bundle is easily extended to more general cases. Given a
vector bundle E
π
→M with the ﬁbre F, we may deﬁne itsdual bundle E∗π
→M.
The ﬁbre F∗of E∗is the set of linear maps ofF to /CA (or /BV ). Given a general basis
{eα (p)} of Fp, we deﬁne the dual basis{θ α (p)} of F∗
p by⟨θ α (p), eβ (p)⟩= δα β .


## Page 380

9.3.4 Sections of vector bundles
Let s and s′ be sections of a vector bundle E
π
→M. The vector addition and the
scalar multiplication are pointwisely deﬁned as
(s+ s′)(p)= s(p)+ s′(p) (9.32a)
( fs )(p)= f (p)s(p) (9.32b)
where p ∈M and f ∈/BY (M). The null vector 0 of each ﬁbre is left invariant
under GL(k, /CA ) (or GL(k, /BV )) and plays a distinguished role. Any vector bundle
E admits a global section called the null section s0 ∈/Gamma1(M, E) such that
φ−1
i (s0(p))= (p, 0) in any local trivialization.
For example, let us consider sections of the canonical line bundle L over
/BV Pn .L e tξ ν (µ) be the inhomogeneous coordinates and{zν} be the homogeneous
coordinates on Uµ. The local section sµ over Uµ is of the form
sµ ={ ξ 0
(µ),..., 1,...,ξ n
(µ)}∈/BV
n+1 .
The transition from one coordinate system to the other is carried out by a scalar
multiplication: sν = (zµ/zν )sµ.L e t L∗be the dual bundle of L. Corresponding
to sµ, we may choose a dual section s∗
µ such that s∗
µ(sµ)= 1. From this, we ﬁnd
that the transition function of s∗
µ is a multiplication by zν /zµ, s∗
ν = (zν /zµ)s∗
µ.
Aﬁ b r em e t r i chµν (p) is also deﬁned pointwisely. Let s and s′ be sections
over Ui . The inner product between s and s′ at p is deﬁned by
(s, s′)p = hµν (p)sµ(p)s′ν (p) (9.33a)
if the ﬁbre is /CA
k .I ft h eﬁ b r ei s/BV
k we deﬁne
(s, s′)p = hµν (p)
sµ(p)s′ν (p). (9.33b)
We have more about this subject in section 10.4.
9.3.5 The product bundle and Whitney sum bundle
Let E
π
→M and E′ π′
→M′ be vector bundles with ﬁbres F and F′ respectively.
The product bundle
E× E′ π×π′
−−−−→M× M′ (9.34)
is a ﬁbre bundle whose typical ﬁbre is F⊕F′. [A vector in F⊕F′ is written as
( V
W
)
where V ∈F and W ∈F′.
Vector addition and scalar multiplication are deﬁned by
( V
W
)
+
( V′
W′
)
=
( V+ V′
W+ W′
)


## Page 381

and
λ
( V
W
)
=
( λ V
λ W
)
.
Let{eα} and{ fβ} be bases of F and F′ respectively. Then{eα}∪{fβ} is a basis
of F⊕F′ and we ﬁnd that dim (F⊕F′)= dim F+ dim F′.] If π( u)= p and
π′(u′)= p′ the projection π × π′ acts on (u, u′)∈E× E′ as
π × π′(u, u′)= (p, p′). (9.35)
T h eﬁ b r ea t(p, p′) is Fp ⊕F′
p′ . For example, if M = M1 × M2,w eh a v e
TM = TM 1× TM 2.
Let E
π
→ M and E′ π′
→ M be vector bundles with ﬁbres F and F′
respectively. The Whitney sum bundle E⊕E′ is a pullback bundle of E× E′
by f : M→M× M deﬁned by f (p)= (p, p),
E⊕E′ π 2
−→E× E′
↓π 1
↓π×π′
M
f
−→M× M.
(9.36)
Thus, E⊕E′ ={ (u, u′)∈E×E′|π×π′(u, u′)= (p, p)}. The ﬁbre of a Whitney
sum bundle is F⊕F′. (π × π′)−1(p) is isomorphic to π−1(p)⊕π′−1(p) =
Fp ⊕F′
p. In short, E⊕E′ is a bundle over M whose ﬁbre at p is Fp ⊕F′
p.L e t
{Ui} be an open covering of M and{t E
ij} and{t E′
ij } be the transition functions
of E and E′ respectively. Then the transition function Tij of E ⊕E′ is a
(dim F+ dim F′)× (dim F+ dim F′) matrix
Tij (p)=
(
t E
ij (p) 0
0 t E′
ij (p)
)
(9.37)
which acts on F⊕F′ on the left.
Example 9.6. Let E = TS 2 and E′ = NS 2 deﬁned in /CA
3 .T a k eu ∈TS 2 and
v∈NS 2 whose local trivializations are φ−1
i (u)= (p, V ) and ψ−1
i (v)= (q, W ),
respectively, where p, q ∈S2, V ∈/CA
2 and W ∈/CA .I f (u,v ) is a point of the
product bundle E× E′, we have a trivialization /Phi1i, j = φ i × ψ j such that
/Phi1−1
i, j (u,v )= (p, q; V, W ). (9.38a)
If, however, (u,v )∈E⊕E′, u and v satisfy the stronger condition π( u)= π′(v)
(=p, say). Thus, we have
/Phi1−1
i (u,v )= (p; V, W ). (9.38b)
The Whitney sum TS 2⊕NS 2, S2 being embedded in /CA
3 , is a trivial bundle over
S2, whose ﬁbre is isomorphic to /CA
3 .


## Page 382

9.3.6 Tensor product bundles
Let E
π
−→M and E′ π′
−→M be vector bundles over M.T h e tensor product
bundle E⊗E′ is obtained by assigning the tensor product of ﬁbres Fp ⊗F′
p to
each point p∈M.I f{eα} and{ fβ} are bases of F and F′, F⊗F′ is spanned by
{eα ⊗fβ} and, hence, dim(E⊗E′)= dim E× dim E′.
Let ⨂r E≡E⊗···⊗E be the tensor product bundle of rE .I f{eα} is the
basis of the ﬁbre F of E, the ﬁbre of ⨂r E is spanned by{eα 1 ⊗···⊗eα r}.I fw e
deﬁne∧by
eα ∧eβ ≡eα ⊗eβ −eβ ⊗eα (9.39)
we have a bundle ∧r (E) of totally anti-symmetric tensors spanned by {eα 1 ∧
... ∧eα r}. In particular, /Omega1r (M), the space of r-forms on M, is identiﬁed with
/Gamma1(M,/Lambda1r (T∗M)).
Exercise 9.1. Let E1, E2 and E3 be vector bundles over M. Show that ⊗is
distributive:
E1⊗(E2⊕E3)= (E1⊗E2)⊕(E1⊗E3). (9.40)
Express the transition functions of E1 ⊗(E2 ⊕F3) in terms of those of E1, E2
and E3.
9.4 Principal bundles
9.4.1 Deﬁnitions
A principal bundle has a ﬁbre F which is identical to the structure group G.A
principal bundle P
π
−→M is also denoted by P(M, G) and is often called a G
bundle over M.
The transition function acts on the ﬁbre on the left as before. In addition, we
may also deﬁne the action of G on F on the right .L e t φ i : Ui × G→π−1(Ui )
be the local trivialization given by φ−1
i (u) = (p, gi ),w h e r eu ∈π−1(Ui ) and
p= π( u). The right action of G on π−1(Ui ) is deﬁned by φ−1
i (ua )= (p, gi a),
that is (ﬁgure 9.8),
ua= φ i (p, gi a) (9.41)
for any a ∈G and u ∈π−1(p). Since the right action commutes with the
left action, this deﬁnition is independent of the local trivializations. In fact, if
p∈Ui ∩Uj ,
ua= φ j (p, g j a)= φ j (p, tji (p)gi a)= φ i (p, gi a).
Thus, the right multiplication is deﬁ ned without reference to the local
trivializations. This is denoted by P × G →P or (u, a) ↦→ua. Note that
π( ua )= π( u). The right action of G on π−1(p) is transitive since G acts on G
transitively on the right and Fp = π−1(p) is diffeomorphic to G. Thus, for any


## Page 383

Figure 9.8. The right action of G on P.
u1, u2 ∈π−1(p) there exists an element a of G such that u1 = u2a. Then, if
π( u)= p, we can construct the whole ﬁbre asπ−1(p)={ ua|a∈G}. The action
is also free;i f ua= u for some u∈P, a must be the unit element e of G. In fact,
if u= φ i (p, gi ),w eh a v eφ i (p, gi a)= φ i (p, gi )a= ua= u= φ i (p, gi ).S i n c e
φ i is bijective, we must have gi a= gi ,t h a ti s ,a= e.
Given a section s1(p) over Ui , we deﬁne a preferred local trivialization
φ i : Ui × G→π−1(Ui ) as follows. For u∈π−1(p), p∈Ui ,t h e r ei saunique
element gu ∈G such that u= si (p)gu. Then we deﬁne φ i by φ−1
i (u)= (p, gu ).
In this local trivialization, the section si (p) is expressed as
si (p)= φ i (p, e). (9.42)
This local trivialization is called the canonical local trivialization. By deﬁnition
φ i (p, g)= φ i (p, e)g= si (p)g.I f p∈Ui∩Uj , two sections si (p) and sj (p) are
related by the transition function tij (p) as follows
si (p)= φ i (p, e)= φ j (p, tji (p)e)= φ j (p, tji (p))
= φ j (p, e)tji (p)= sj (p)tji (p). (9.43)
Example 9.7. Let P be a principal bundle with ﬁbre U (1) = S1 and the base
space S2. This principal bundle represents the topological setting of themagnetic
monopole (section 1.9). Let{UN, US} be an open covering of S2, UN (US) being
the northern (southern) hemisphere. If we parametrize S2 by the usual polar
angles, we have
UN ={ (θ, φ)|0≤θ ≤π/ 2+ ε, 0≤φ< 2π}
US ={ (θ, φ)|π/ 2−ε≤θ ≤π, 0≤φ< 2π}.


## Page 384

The intersection UN∩US is a strip which is essentially the equator. Let φ N and
φ S be the local trivializations such that
φ−1
N (u)= (p, eiα N )φ −1
S (u)= (p, eiα S ) (9.44)
where p = π( u). Take a transition function tNS(p) of the form e inφ where n
must be an integer so that tNS(p) may be uniquely deﬁned on the equator. Since
tNS maps the equator S1 to U(1), this integer character izes the homotopy group
π 1(U(1))= /CI . The ﬁbre coordinates α N and α S are related on the equator as
eiα N = einφ eiα S . (9.45)
If n = 0, the transition function is the unit element of U (1) and we have a
trivial bundle P0 = S2 × S1.I f n ̸= 0, the U (1)-bundle Pn is twisted. It is
remarkable that the topological structure of a ﬁbre bundle is characterized by an
integer. The integer characterizes how t wo local sections are pasted together at
the equator. Accordingly, the integer corresponds to the element of the homotopy
group π 1(U(1))= /CI .
Since U (1) is Abelian, the right action and the left action are equivalent.
Under the right action g= ei/Lambda1,w eh a v e
φ−1
N (ug)= (p, ei(α N+/Lambda1)) (9.46a)
φ−1
S (ug)= (p, ei(α S+/Lambda1)). (9.46b)
The right action corresponds to the U(1)-gauge transformation.
Example 9.8. If we identify all the inﬁnite points of the Euclidean space /CA
m ,t h e
one-point compactiﬁcation Sm = /CA
m ∪{∞}is obtained. If a trivial G bundle is
deﬁned over /CA
m we shall have a new G bundle over Sm after compactiﬁcation,
which is not necessarily trivial. Let P be an SU(2) bundle over S4 obtained from
/CA
4 by one-point compactiﬁcation. This principal bundle represents an SU (2)
instanton (section 1.10). Introduce an open covering{UN, US} of S4,
UN ={ (x, y, z, t)|x2+ y2+ z2+ t2 ≤R2+ ε}
US ={ (x, y, z, t)|R2−ε≤x2+ y2+ z2+ t2}
where R is a positive constant and ε is an inﬁnitesimal positive number. The
thin intersection UN∩US is essentially S3.L e t tNS(p) be the transition function
deﬁned at p ∈UN ∩US.S i n c e tNS maps S3 to SU (2), it is classiﬁed by
π 3(SU(2)) = /CI . The integer characterizing the bundle is called the instanton
number.I f tNS(p) is taken to be the unit element e ∈SU(2),w eh a v eat r i v i a l
bundle P0 = S3×SU(2), which corresponds to the homotopy class 0. Non-trivial
bundles are obtained as follows. We ﬁrst note that SU (2)∼= S3 (example 4.12).
An element A∈SU(2) is written as
A=
( u v
−¯v ¯u
)


## Page 385

where|u|2 +| v|2 = 1. Separating u and v as u = t+ iz and v = y+ ix,w e
ﬁnd t2 + x2 + y2 + z2 = 1. Thus SU (2) is regarded as the unit sphere S3 and
π 3(SU(2))∼= π 3(S3)∼
=
/CI classiﬁes maps from S3 to SU(2)∼
= S
3.T h e identity
map f : S3 →S3 ∼
= SU(2) is
f (x, y, z, t)↦→
( t+ izy + ix
−y+ ixt −iz
)
= tI
2+ i(xσ x + yσ y + zσ z ) (9.47)
where I2 is the 2× 2 unit matrix and the σ µ are the Pauli matrices. Let us take
a point p= (x, y, z, t)∈UN ∩US.I f R= (x2+ y2+ z2+ t2)1/2 denotes the
radial distance of p, the vector (x/R, y/R, z/R, t/R) has unit length. We assign
an element of SU(2) to the point p as
tNS(p)= 1
R
(
tI 2+ i
∑
i
xi σ i
)
. (9.48)
Let φ N and φ S be the local trivializations,
φ−1
N (u)= (p, gN)φ −1
S (u)= (p, gS) (9.49)
where p= π( u) and gN, gS ∈SU(2).O n UN∩US,w eh a v e
gN = 1
R
(
tI 2+ i
∑
i
xi σ i
)
gS. (9.50)
While (t, x) scans S3 once, tNS(p) sweeps SU (2) once, hence this bundle
corresponds to the homotopy class 1 of π 3(SU(2)). It is not difﬁcult to see that
the transition function corresponding to the homotopy class n is given by
tNS(p)= 1
Rn
(
t1+ i
∑
i
xi σ i
) n
. (9.51)
To continue our study of monopoles and instantons, we have to introduce
connections (the gauge potentials) on the ﬁbre bundle. We will come back to
these topics in the next chapter.
Example 9.9. Hopf has shown that S3 is a U(1) bundle over S2. The unit three-
sphere embedded in /CA
4 is expressed as
(x1)2+ (x2)2+ (x3)2+ (x4)2 = 1.
If we introduce z0 = x1+ ix2 and z1 = x3+ ix4, this becomes
|z0|2+| z1|2 = 1. (9.52)


## Page 386

Figure 9.9. Stereographic coordinates of the sphere S2. (X, Y ) is deﬁned with respect to
the projection from the North Pole while (U, V ) with respect to the projection from the
South Pole.
Let us parametrize S2 as
(ξ 1)2+ (ξ 2)2+ (ξ 3)2 = 1.
The Hopf map π : S3 →S2 is deﬁned by
ξ 1 = 2(x1x3+ x2x4) (9.53a)
ξ 2 = 2(x2x3−x1x4) (9.53b)
ξ 3 = (x1)2+ (x2)2−(x3)2−(x4)2. (9.53c)
It is easily veriﬁed that π maps S3 to S2 since
(ξ 1)2+ (ξ 2)2+ (ξ 3)2 =[ (x1)2+ (x2)2+ (x3)2+ (x4)2]2 = 1.
Let (X, Y ) be the stereographic projection coordinates of a point in the
southern hemisphere US of S2 from the North Pole. If we take a complex plane
which contains the equator of S2, Z = X+ iY is within the circle of unit radius.
We found in example 8.1 that (ﬁgure 9.9)
Z= ξ 1+ iξ 2
1−ξ 3 = x1+ ix2
x3+ ix4 = z0
z1 (ξ ∈US). (9.54a)
Observe that Z is invariant under
(z0, z1)↦→(λ z0,λ z1)
where λ ∈U(1).S i n c e|λ|= 1, the point (λ z0,λ z1) is also in S3.T h e
stereographic coordinates (U, V ) of the northern hemisphere UN projected from
the South Pole are given by
W = U+ iV = ξ 1−iξ 2
1+ ξ 3 = x3+ ix4
x1+ ix2 = z1
z0 (ξ ∈UN). (9.54b)


## Page 387

Note that Z= 1/W on the equator UN∩US.
The ﬁbre bundle structure is given as follows. We ﬁrst deﬁne the local
trivializations, φ−1
S : π−1(US)→US× U(1) by
(z0, z1)↦→(z0/z1, z1/|z1|) (9.55a)
and φ−1
N : π−1(UN)→UN× U(1) by
(z0, z1)↦→(z1/z0, z0/|z0|). (9.55b)
Observe that these local trivializations are well deﬁned on each chart. For
example, z0 ̸= 0o n UN, hence both z1/z0 = U + iV and z0/|z0| are non-
singular. On the equator, ξ 3 = 0, we have|z0|=| z1|= 1/
√
2. Accordingly, the
local trivializations on the equator are
φ−1
S : (z0, z1)↦→(z0/z1,
√
2z1) (9.56a)
and
φ−1
N : (z0, z1)↦→(z1/z0,
√
2z0). (9.56b)
The transition function on the equator is
tNS(ξ )=
√
2z0
√
2z1 = ξ 1+ iξ 2 ∈U(1). (9.57)
If we circumnavigate the equator, tNS(ξ ) traverses the unit circle in the complex
plane once, hence the U (1) bundle S3 π
−→S2 is characterized by the homotopy
class 1 of π 1(U(1)) = /CI . Trautman (1977), Minami (1979) and Ryder (1980)
have pointed out that a magnetic monopole of unit strength is described by the
Hopf map S3 π
−→S2.
The Hopf map can be understood from a slightly different point of view. We
regard S3 as a complex one-sphere
S1
/BV
={ (z0, z1)∈/BV
2||z0|2+| z1|2 = 1}.
Deﬁne a map π : S1
/BV
→/BV P1 by
(z0, z1)↦→[(z0, z1)]={ λ( z0, z1)|λ ∈/BV −{0}}. (9.58)
Under this map, points of S3 of the form λ( z0, z1),|λ|= 1 are mapped to a single
point of /BV P1 = S2. This is the Hopf map π : S3 →S2 obtained earlier. This
is easily generalized to the case of the quaternion /C0 . The quaternion algebra is
deﬁned by the product table,
i2 = j2 = k2 =−1 ij =−ji = k
jk =−kj = ik i =−ik = j .


## Page 388

An arbitrary element of /C0 is written as
q= t+ ix+ j y+ kz.
Clearly the unit quaternion |q|= (t2+ x2+ y2+ z2)1/2 = 1r e p r e s e n t sS3 ∼=
SU(2). The quaternion one-sphere is given by
S1
/C0
={ (q0, q1)∈/C0
2||q0|2+| q1|2 = 1} (9.59)
which represents S7. The Hopf map, in this case, takes the form
π : S1
/C0
→/C0 P1 (9.60)
where /C0 P1 is the quaternion projective space whose element is
[(q0, q1)]={ η( q0, q1)∈/C0
2|η ∈/C0 −{0}}. (9.61)
Points of S7 with |η|= 1 are mapped under this map to a single point of
/C0 P1 = S4 and we have the Hopf map
π : S7 →S4. (9.62)
The ﬁbre is the unit quaternion S3 = SU(2). The transition function deﬁned by
the Hopf map belongs to the class 1 of π 3(SU(2)) ∼
=
/CI . An instanton of unit
strength is described in terms of this Hopf map.
Octonions deﬁne a Hopf map π : S15 →S8. This differs from other Hopf
maps in that the ﬁbre S7 is not really a group. So far we have not found an
application of this map in physics.1
Example 9.10. Let H be a closed Lie subgroup of a Lie group G.W e s h o w
that G is a principal bundle with ﬁbre H and base space M = G/H .D e ﬁ n e
the right action of H on G by g ↦→ga, g ∈G, a ∈H . The right action is
differentiable since G is a Lie group. Deﬁne the projection π : G→M= G/H
by the map π : g ↦→[g]={ gh|h ∈H}. Clearly, g, ga ∈G are mapped to
the same point [g] hence π( g)= π( ga)(=[g]). To deﬁne local trivializations,
we need to deﬁne a map fi : G → H on each chart Ui .L e t s be a local
section over Ui and g ∈π−1([g]).D e ﬁ n e fi by fi (g) = s([g])−1g.S i n c e
s([g]) is a section at [g], it is expressed as ga for some a∈H and accordingly,
s([g])−1g = a−1g−1g = a−1 ∈H . Then we deﬁne the local trivialization
φ i : Ui × H→G by
φ−1
i (g)= ([g], fi (g)). (9.63)
It is easy to see that fi (ga)= fi (g)a (a∈H ) hence φ−1
i (ga)= (p, fi (g)a) is
satisﬁed. Useful examples are (see example 5.18)
O(n)/O(n−1)= SO(n)/SO(n−1)= Sn−1 (9.64)
U(n)/U(n−1)= SU(n)/SU(n−1)= S2n−1. (9.65)
1 Octonions are also known as Cayley numbers . The set of octonions is a vector space over /CA but
not a ﬁeld. The product is neither commutative nor associative. See John C Baez, The Octonions
math.RA/0105155 for a recent review.


## Page 389

9.4.2 Associated bundles
Given a principal ﬁbre bundle P(M, G), we may construct an associated ﬁbre
bundle as follows. Let G act on a manifold F on the left. Deﬁne an action of
g∈G on P× F by
(u, f )→(ug, g−1 f ) (9.66)
where u ∈P and f ∈F. Then the associated ﬁbre bundle (E,π , M, G, F, P)
is an equivalence class P× F/G in which two points (u, f ) and (ug, g−1 f ) are
identiﬁed.
Let us consider the case in whichF is a k-dimensional vector space V .L e tρ
be the k-dimensional representation of G.T h eassociated vector bundle P×ρ V
is deﬁned by identifying the points (u,v ) and (ug,ρ( g)−1v) of P× V ,w h e r e
u ∈P, g ∈G and v ∈V . For example, associated with P(M, GL(k, /CA )) is a
vector bundle over M with ﬁbre /CA
k . The ﬁbre bundle structure of an associated
vector bundle E = P×ρ V is given as follows. The projection π E : E →M is
deﬁned by π E (u,v )= π( u). This projection is well deﬁned since π( u)= π( ug)
implies π E (ug,ρ( g)−1v)= π( ug)= π E (u,v ). The local trivialization is given
by ψ i : Ui × V →π−1
E (Ui ). The transition function of E is given by ρ( tij (p))
where tij (p) is that of P.
Conversely a vector bundle naturally induces a principal bundle associated
with it. Let E
π
−→M be a vector bundle with dim E = k (i.e. the ﬁbre is
/CA
k or /BV
k ). Then E induces a principal bundle P(E) ≡P(M, G) over M
by employing the same transition functions. The structure group G is either
GL(k, /CA ) or GL (k, /BV ). Explicit construction of P(E) is carried out following
the reconstruction process described in section 9.1.
Example 9.11. Associated with a tangent bundle TM over an m-dimensional
manifold M is a principal bundle called the frame bundle LM ≡⋃
p∈M L p M
where L p M is the set of frames at p. We introduce coordinates xµ on a chart Ui .
The bundle Tp M has a natural basis{∂/∂ xµ} on Ui . A frame u={ X1,..., Xm}
at p is expressed as
Xα = Xµα ∂/∂ xµ|p 1≤α ≤m (9.67)
where (Xµα ) is an element GL(m, /CA ) so that{Xα} are linearly independent. We
deﬁne the local trivialization φ i : Ui × GL(m, /CA ) →π−1(Ui ) by φ−1
i (u) =
(p,( X µα )). The bundle structure of LM is deﬁned as follows.
(i) If u ={ X1,..., Xm} is a frame at p,w ed e ﬁ n eπ L : LM →M by
π L (u)= p.
(ii) The action of a= (ai j )∈GL(m, /CA ) on the frame u={ X1,..., Xm} is
given by (u, a)↦→ua,w h e r eua is a new frame at p,d e ﬁ n e db y
Yβ = Xα aα β . (9.68)


## Page 390

Conversely, given any frames {Xα} and {Yβ} there exists an element of
GL(m, /CA ) such that (9.68) is satisﬁed. Thus, GL (m, /CA ) acts on LM
transitively.
(iii) Let Ui and Uj be overlapping charts with the coordinates xµ and yµ,
respectively. For p∈Ui ∩Uj ,w eh a v e
Xα = Xµα ∂/∂ xµ|p = ˜Xµα ∂/∂ yµ|p (9.69)
where (Xµα ), (˜X µ
α )∈GL(m, /CA ).S i n c eXµα = (∂ xµ/∂ yν )p ˜Xµα ,w eﬁ n d
the transition function t L
ij (p) to be
t L
ij (p)= ((∂ xµ/∂ yν )p)∈GL(m, /CA ). (9.70)
Accordingly, given TM , we have constructed a frame bundle LM with the
same transition functions.
In general relativity, the right action corresponds to the local Lorentz
transformation while the left action corresponds to the general coordinate
transformation. It turns out that the frame bundle is the most natural framework in
which to incorporate these transformations. If{Xα} is normalized by introducing
a metric, the matrix (Xµα ) becomes the vierbein and the structure group reduces
to O(m); see section 7.8.
Example 9.12. A spinor ﬁeld on M is a section of a spin bundle which we now
deﬁne. Since GL (k, /CA ) has no spinor representation, we need to introduce an
orthonormal frame bundle whose structure group is SO (k). As we mentioned in
example 4.12, SPIN(k) is the universal covering group of SO(k).[ T od e ﬁ n eas p i n
bundle, we have to check whether the SO(k) bundle lifts to a SPIN(k) bundle over
M. The obstruction to this lifting is discussed in section 11.6.]
To be speciﬁc, let us consider a spin bundle associated with the four-
dimensional Lorentz frame bundle LM ,w h e r eM is a four-dimensional Lorentz
manifold. We are interested in a frame with a deﬁnite spacetime orientation as
well as a time orientation. The structure group is then reduced to
O+
↑(3, 1)≡{/Lambda1∈O(3, 1)| det /Lambda1=+ 1,/Lambda100 > 0}. (9.71)
The universal covering group of O+
↑(3, 1) is SL(2, /BV ), see example 5.16 (c).T h e
homomorphism ϕ : SL(2, /BV )→O+
↑(3, 1) is a 2: 1 map with kerϕ ={ I2,−I2}.
The Weyl spinor is a section of the ﬁbre bundle (W,π , M, /BV
2 , SL(2, /BV )).T h e
Dirac spinor is a section of
(D,π , M, /BV
4 , SL(2, /BV )⊕
SL(2, /BV )). (9.72)
A section of W is a (1/2, 0) representation of O +
↑
(3, 1) and a section of
(¯W ,π , M, /BV
2 ,
 SL(2, /BV )) is a (0, 1/2) representation, see Ramond (1989) for
example. A Dirac spinor belongs to (1/2, 0)⊕(0, 1/2).
The general structure of the spin bundle will be worked out in section 11.6.


## Page 391

9.4.3 Triviality of bundles
A ﬁbre bundle is trivial if it is expressed as a direct product of the base space and
the ﬁbre. The following theorem giv es the condition under which a ﬁbre bundle
is trivial.
Theorem 9.2. A principal bundle is trivial if and only if it admits a global section.
Proof.L e t (P,π , M, G) be a principal bundle over M and let s ∈/Gamma1(M, P)
be a global section. This section may be used to show that there exists a
homeomorphism between P and M× G.I f a is an element of G, the product
s(p)a belongs to the ﬁbre at p. Since the right action is transitive and free, any
element u∈P is uniquely written as s(p)a for some p∈M and a∈G.D e ﬁ n e
am a p/Phi1: P→M× G by
/Phi1: s(p)a↦→(p, a). (9.73)
It is easily veriﬁed that /Phi1is indeed a homeomorphism and we have shown that P
is a trivial bundle M× G.
Conversely, suppose P∼= M× G.L e t φ : M× G→P be a trivialization.
Take a ﬁxed element g∈G.T h e nsg : M→P deﬁned by sg (p)= φ( p, g) is a
global section. /A3
Is there a corresponding theorem for vector bundles? We know that any
vector bundle admits a global null section. Thus, we cannot simply replace P by
E in theorem 9.2. Let us consider the associated principal bundle P(E) of E.
By deﬁnition, E and P(E) share the same set of transition functions. Since the
twisting of a bundle is described purely by the transition functions, we obtain the
following corollary.
Corollary 9.2. A vector bundle E is trivial if and only if its associated principal
bundle P(E) admits a global section.
Problems
9.1 Let L be the real line bundle over S1 (i.e. L is either the cylinder S1 × /CA or
the M¨obius strip). Show that the Whitney sum L⊕L is a trivial bundle. Sketch
L⊕L to conﬁrm the result.
9.2 Let /Omega1n be the volume element of Sn normalized as
∫
Sn /Omega1n = 1. Let
f : S2n−1 →Sn be a smooth map and consider the pullback f∗/Omega1n.
(a) Show that f∗/Omega1n is closed and written as d ω n−1,w h e r eω n−1 is an (n−1)-
form on S2n−1.
(b) Show that the Hopf invariant
H ( f )≡
∫
S2n−1
ω n−1∧dω n−1


## Page 392

is independent of the choice of ω n−1.
(c) Show that if f is homotopic to g,t h e nH ( f )= H (g).
(d) Show that H ( f )= 0i f n is odd. [ Hint:U s e ω n−1 ∧dω n−1 = 1
2 d(ω n−1 ∧
ω n−1).]
(e) Compute the Hopf invariant of the map π : S3 →S2 deﬁned in example 9.9.


## Page 393

10
CONNECTIONS ON FIBRE BUNDLES
In chapter 7 we introduced connections inRiemannian manifolds which enable us
to compare vectors in different tangent spaces. In the present chapter connections
on ﬁbre bundles are deﬁned in an abstract though geometrical way.
We ﬁrst deﬁne a connection on a prin cipal bundle. Our abstract deﬁnition
is realized concretely by introducing the connection one-form whose local form
is well known to physicists as a gauge potential. The Yang–Mills ﬁeld strength
is deﬁned as the curvature associated with the connection. A connection on a
principal bundle naturally deﬁnes a covariant derivative in the associated vector
bundle. We reproduce the results obtained in chapter 7, applying our approach to
tangent bundles. We conclude this chapter with a few applications of connections
to physics: to gauge ﬁeld theories and Berry’s phase. We follow the line of
Choquet-Bruhat et al (1982), Kobayashi (1984) and Nomizu (1981). Details will
be found in the classic books by Kobayashi and Nomizu (1963, 1969). See also
Daniel and Viallet (1980) for a quick review.
10.1 Connections on principal bundles
There are several equivalent deﬁnitions of a connection on a principal bundle.
Our approach is based on the separation of tangent space Tu P into ‘vertical’
and ‘horizontal’ subspaces. Although this approach seems to be abstract, it is
advantageous compared with other approaches in that it clariﬁes the geometrical
pictures involved and is deﬁned independe ntly of special local trivializations.
Connections are also deﬁned as /CV -valued one-forms which satisfy certain axioms.
These deﬁnitions are shown to be equivalent.
We brieﬂy summarize the basic facts on Lie groups and Lie algebras, since
we shall make extensive use of these (see section 5.6 for details). Let G be a
Lie group. The left action Lg and the right action Rg are deﬁned by Lgh = gh
and Rgh = hg for g, h ∈G. Lg induces a map Lg∗: Th (G) →Tgh (G).A
left-invariant vector ﬁeld X satisﬁes Lg∗X|h = X|gh . Left-invariant vector ﬁelds
form a Lie algebra of G, denoted by /CV .S i n c eX∈/CV is speciﬁed by its value at the
unit element e,a n dvice versa, there exists a vector space isomorphism /CV
∼= TeG.
The Lie algebra /CV is closed under the Lie bracket,[Tα , Tβ]= fαβ γ Tγ where{Tα}
is the set of generators of /CV . fαβ γ are called the structure constants. The adjoint
action ad : G →G is deﬁned by ad gh ≡ghg−1. The tangent map of ad g is


## Page 394

called the adjoint map and is denoted by Adg : Th (G)→Tghg−1 (G). If restricted
to Te(G)≃ /CV ,A dg maps /CV onto itself; Adg : /CV →/CV as A↦→gAg−1, A∈/CV .
10.1.1 Deﬁnitions
Let u be an element of a principal bundle P(M, G) and let G p be the ﬁbre at
p= π( u).T h evertical subspace Vu P is a subspace of Tu P which is tangent to
G p at u.[ Warning: Tu P is the tangent space of P and should not be confused
with the tangent space Tp M of M.] Let us see how Vu P is constructed. Take an
element A of /CV . By the right action
Rexp(tA )u= u exp(tA )
a curve through u is deﬁned in P.S i n c eπ( u)= π( u exp(tA ))= p, this curve
lies within G p. Deﬁne a vector A# ∈Tu P by
A# f (u)= d
dt f (u exp(tA ))|t=0 (10.1)
where f : P →/CA is an arbitrary smooth function. The vector A# is tangent to
P at u, hence A# ∈Vu P. In this way we deﬁne a vector A# at each point of P
and construct a vector ﬁeld A#, called the fundamental vector ﬁeld generated
by A. There is a vector space isomorphism ♯ : /CV →Vu P given by A ↦→A#.
The horizontal subspace Hu P is a complement of Vu P in Tu P and is uniquely
speciﬁed if a connection is deﬁned in P.
Exercise 10.1.
(a) Show that π∗X= 0f o rX∈Vu P.
(b) Show that ♯ preserves the Lie algebra structure:
[A#, B#]=[ A, B]#. (10.2)
Deﬁnition 10.1. Let P(M, G) be a principal bundle. A connection on P is a
unique separation of the tangent space Tu P into the vertical subspace Vu P and
the horizontal subspace Hu P such that
(i) Tu P= Hu P⊕Vu P.
(ii) A smooth vector ﬁeld X on P is separated into smooth vector ﬁelds
X H ∈Hu P and XV ∈Vu P as X= X H + XV .
(iii) Hug P= Rg∗Hu P for arbitrary u∈P and g∈G; see ﬁgure 10.1.
The condition (iii) states that horizontal subspaces Hu P and Hug P on
the same ﬁbre are related by a linear map Rg∗induced by the right action.
Accordingly, a subspace Hu P at u generates all the horizontal subspaces on the
same ﬁbre. This condition ensures that if a point u is parallel transported, so is its
constant multiple ug, g∈G; see later. At this point, the reader might feel rather


## Page 395

Figure 10.1. The horizontal subspace Hug P is obtained from Hu P by the right action.
uneasy about our deﬁnition of a connection. At ﬁrst sight, this deﬁnition seems
to have nothing to do with the gauge potential or the ﬁeld strength. We clarify
these points after we introduce the connection one-form on P. We again stress
that our deﬁnition, which is based on the separationTu P= Vu P⊕Hu P, is purely
geometrical and is deﬁned independently of any extra information. Although the
connection becomes more tractable in the following, the geometrical picture and
its intrinsic nature are generally obscured.
10.1.2 The connection one-form
In practical computations, we need to separate Tu P into Vu P and Hu P in a
systematic way. This can be achieved by introducing a Lie-algebra-valued one-
form ω ∈/CV ⊗T∗P called the connection one-form.
Deﬁnition 10.2. A connection one-form ω ∈/CV ⊗T∗P is a projection of Tu P onto
the vertical component Vu P ≃ /CV . The projection property is summarized by the
following requirements,
(i) ω( A#)= AA ∈/CV (10.3a)
(ii) R∗
g ω = Adg−1 ω (10.3b)
that is, for X∈Tu P,
R∗
g ω ug (X )= ω ug (Rg∗X)= g−1ω u (X)g.( 10.3b′)
Deﬁne the horizontal subspace Hu P by the kernel of ω ,
Hu P≡{X∈Tu P|ω( X)= 0}. (10.4)


## Page 396

To show that this deﬁnition is consistent with deﬁnition 10.1, we prove the
following proposition.
Proposition 10.1. The horizontal subspaces (10.4) satisfy
Rg∗Hu P= Hug P. (10.5)
Proof. Fix a point u∈P and deﬁne Hu P by (10.4). Take X∈Hu P and construct
Rg∗X∈Tug P.W eﬁ n d
ω( Rg∗X )= R∗
g ω( X)= g−1ω( X)g= 0
since ω( X )= 0. Accordingly, Rg∗X ∈Hug P. We note that Rg∗is an invertible
linear map. Hence, any vector Y ∈Hug P is expressed as Y = Rg∗X for some
X∈Hu P. This proves (10.5). /A3
We have shown that the deﬁnition of the connection one-formω is equivalent
to that of the connection, sinceω separates Tu P into Hu P⊕Vu P in harmony with
the axioms of deﬁnition 10.1. The connection one-form ω deﬁned here is known
as the Ehresmann connection in the literature.
10.1.3 The local connection form and gauge potential
Let{Ui} be an open covering of M and let σ i be a local section deﬁned on each
Ui . It is convenient to introduce a Lie-algebra-valued one-form /BT
i on Ui ,b y
/BT
i ≡σ∗
i ω ∈/CV ⊗/Omega11(Ui ). (10.6)
Conversely, given a Lie-algebra-valued one-form/BT
i ,o n Ui , we can reconstruct a
connection one-form ω whose pullback by σ∗
i is /BT
i .
Theorem 10.1. Given a /CV -valued one-form /BT
i on Ui and a local sectionσ i : Ui →
π−1(Ui ), there exists a connection one-form ω such that /BT
i = σ∗
i ω .
Proof. Let us deﬁne a /CV -valued one-form ω on P by
ω i ≡g−1
i π∗
/BT
i gi + g−1
i dP gi (10.7)
where d P is the exterior derivative on P and gi is the canonical local
trivialization deﬁned by φ−1
i (u) = (p, gi ) for u = σ i (p)gi .W e ﬁ r s t s h o w
that σ∗
i ω i = /BT
i .F o r X∈Tp M,w eh a v e
σ∗
i ω i (X )= ω i (σ i∗X )= π∗
/BT
i (σ i∗X)+ dP gi (σ i∗X)
= /BT
i (π∗σ i∗X )+ dP gi (σ i∗X)


## Page 397

Figure 10.2. The canonical local trivialization deﬁned by the local section σ i over Ui .
where we have noted that σ i∗X ∈Tσ i P and gi = e at σ i , see ﬁgure 10.2. We
further note that π∗σ i∗= idTp (M) and dP gi (σ i∗X)= 0s i n c eg≡e along σ i∗X.
Thus, we have obtained σ∗
i ω i (X )= /BT
i (X).
Next we show that ω i satisﬁes the axioms of a connection one-form given in
deﬁnition 10.2.
(i) Let X = A# ∈Vu P, A ∈/CV . It follows from exercise 10.1(a) that
π∗X= 0. Now we have
ω i (A#)= g−1
i dP gi (A#)= gi (u)−1 dg (u exp(tA ))
dt
⏐⏐
⏐⏐
t=0
= gi (u)−1gi (u) de x p(tA )
dt
⏐⏐
⏐
⏐
t=0
= A.
(ii) Take X∈Tu P and h∈G.W eh a v e
R∗
h ω i (X )= ω i (Rh∗X )= g−1
iuh
/BT
i (π∗Rh∗X)giuh + g−1
iuh dP giuh (Rh∗X).
Since giuh = giu h and π∗Rh∗X= π∗X (note that π Rh = π ), we have
R∗
h ω i (X )= h−1g−1
iu
/BT
i (π∗X)giu h+ h−1g−1
iu dP giu (X)h
= h−1ω i (X )h
where we have noted that
g−1
iuh dP giuh (Rh∗X )= g−1
iuh
d
dt giγ( t )h
⏐
⏐
⏐
⏐
t=0
= h−1g−1
iu
d
dt giγ( t )
⏐
⏐
⏐⏐
t=0
h= h−1g−1
iu dP giu (X)h.


## Page 398

Here γ( t) is a curve through u= γ( 0), whose tangent vector at u is X.
Hence, the /CV -valued one-form ω i deﬁned by (10.7) indeed satisﬁes /BT
i =
σ∗
i ω i and the axioms of a connection one-form. /A3
For ω to be deﬁned uniquely on P, i.e. for the separationTu P= Hu P⊕Vu P
to be unique, we must have ω i = ω j on Ui ∩Uj . A unique one-form ω is then
deﬁned throughout P by ω|Ui = ω i . To fulﬁl this condition, the local forms /BT
i
have to satisfy a peculiar transformation property similar to that of the Christoffel
symbols. We ﬁrst prove a technical lemma.
Lemma 10.1. Let P(M, G) be a principal bundle and σ i (σ j ) be a local section
over Ui (Uj ) such that Ui ∩Uj ̸=∅.F o r X ∈Tp M (p∈Ui ∩Uj ), σ i∗X and
σ j∗X satisfy
σ j∗X= Rtij∗(σ i∗X)+ (t−1
ij dtij (X))# (10.8)
where tij : Ui ∩Uj →G is the transition function.
Proof. Take a curve γ :[ 0, 1]→ M such that γ( 0)= p and ˙γ( 0)= X.S i n c e
σ i (p) and σ j (p) are related by the transition function as σ j (p) = σ i (p)tij (p)
(see (9.43)), we have
σ j∗X= d
dt σ j (γ (t))
⏐⏐
⏐
⏐
t=0
= d
dt{σ i (t)tij (t)}
⏐
⏐
⏐
⏐
t=0
= d
dt σ i (t)· tij (p)+ σ i (p)· d
dt tij (t)
⏐
⏐
⏐⏐
t=0
= Rtij∗(σ i∗X )+ σ j (p)tij (p)−1 d
dt tij (t)
⏐
⏐⏐
⏐
t=0
where σ i (t) stands for σ i (γ (t)) a n dw eh a v ea s s u m e dt h a tG is a matrix group for
which Rg∗X= Xg . We note that
tij (p)−1 dtij (X )= tij (p)−1 d
dt tij (t)
⏐
⏐
⏐
⏐
t=0
= d
dt[tij (p)−1tij (t)]
⏐⏐⏐
⏐
t=0
∈Te(G)∼=
/CV .
[Note that tij (p)−1tij (γ (t))= e at t = 0.] This shows that the second term of
σ j∗X represents the vector ﬁeld (t−1
ij dtij (X))# at σ j (p). /A3
The compatibility condition is easily obt ained by applying the connection
one-form ω on (10.8). We ﬁnd that
σ∗
j ω( X )= R∗
tij ω(σ i∗X)+ t−1
ij dtij (X)
= t−1
ij ω(σ i∗X)tij + t−1
ij dtij (X)


## Page 399

where the axioms of deﬁnition 10.2 have been used. Since this is true for any
X∈Tp M, this equation reduces to
/BT
j = t−1
ij
/BT
i tij + t−1
ij dtij . (10.9)
This is the compatibility condition we have been seeking.
Conversely, given an open covering {Ui}, the local sections {σ i} and the
local forms{/BT
i} which satisfy (10.9), we may construct the /CV -valued one-form ω
over P. Since a non-trivial principal bundle does not admit a global section, the
pullback /BT
i = σ∗
i ω exists locally but not necessarily globally. In gauge theories,
/BT
i is identiﬁed with the gauge potential (Yang–Mills potential). As we have
seen in the monopole case, the monopole ﬁeld B = gr/r3 does not admit a
single gauge potential and we require at least two /BT
i to describe this U(1) bundle
over S2.
Exercise 10.2. Let P(M, G) be a principal bundle over M and let U be a chart of
M. Take local sections σ 1 and σ 2 over U such that σ 2(p)= σ 1(p)g(p).S h o w
that the corresponding local forms /BT
1 and /BT
2 are related as
/BT
2 =g−1
/BT
1g+ g−1 dg. (10.10a)
In components, this becomes
/BT
2µ = g−1(p)/BT
1µ(p)g(p)+ g−1(p)∂µg(p)( 10.10b)
which is simply the gauge transformation deﬁned in section 1.8.
Example 10.1. Let P b eaU (1) bundle over M. Take overlapping charts Ui and
Uj .L e t /BT
i (/BT
j ) be a local connection form on Ui (Uj ). The transition function
tij : Ui ∩Uj →U(1) is given by
tij (p)= exp[i/Lambda1(p)] /Lambda1(p)∈/CA . (10.11)
/BT
i and /BT
j are related as
/BT
j (p)=tij (p)−1
/BT
i (p)tij (p)+ tij (p)−1 dtij (p)
=/BT
i (p)+ id/Lambda1(p). (10.12a)
In components, we have the familiar expression
/BT
j µ = /BT
iµ+ i∂µ/Lambda1. ( 10.12b)
Our connection /BT
µ differs from the standard vector potential Aµ by the Lie
algebra factor: /BT
µ = iAµ.
Here we note again that ω is deﬁned globally over the bundle P(M, G).
Although there are many connection one-forms on P(M, G), they share the same
global information about the bundle. In contrast, an individual local piece (gauge
potential) /BT
i is associated with the trivial bundle π−1(Ui ) and cannot have any
global information on P.I t i s ω or, equivalently, the total of{/BT
i} satisfying
the compatibility condition (10.9), which carries the global information about the
bundle.


## Page 400

10.1.4 Horizontal lift and parallel transport
Parallel transport of a vector has been deﬁned in chapter 7 as transport without
change. Parallel transport of an element of a principal bundle along a curve in M
is provided by the ‘horizontal lift’ of the curve.
Deﬁnition 10.3. Let P(M, G) be a G bundle and let γ :[ 0, 1]→ M be a curve
in M.A c u r v e˜γ :[ 0, 1]→ P is said to be a horizontal lift of γ if π ◦˜γ = γ
and the tangent vector to ˜γ( t) always belongs to H˜γ( t ) P.
Let ˜X be a tangent vector to ˜γ . Then it satisﬁes ω( ˜X ) = 0 by deﬁnition.
This condition is an ordinary differe ntial equation (ODE) and the fundamental
theorem of ODEs guarantees the local existence and uniqueness of the horizontal
lift.
Theorem 10.2. Let γ :[ 0, 1]→ M b eac u r v ei nM and let u0 ∈π−1(γ (0)).
Then there exists a unique horizontal lift ˜γ( t) in P such that ˜γ( 0)= u0.
Let us construct such a curve ˜γ .L e t Ui be a chart which contains γ and
take a section σ i over Ui . If there exists a horizontal lift ˜γ , it may be expressed
as ˜γ( t) = σ i (γ (t))gi (t),w h e r egi (t) stands for gi (γ (t)) ∈G. Without loss of
generality, we may take a section such that σ i (γ (0))=˜γ( 0),t h a ti sgi (0)= e.
Let X be a tangent vector to γ( t) at γ( 0).T h e n ˜X =˜ γ∗X is tangent to ˜γ at
u0 =˜γ( 0). Since the tangent vector ˜X is horizontal, it satisﬁes ω( ˜X ) = 0. A
slight modiﬁcation of lemma 10.1 yields
˜X= gi (t)−1σ i∗Xgi (t)+[ gi (t)−1 dgi (X)]#.
By applying ω on this equation, we ﬁnd
0= ω( ˜X )= gi (t)−1ω(σ i∗X)gi (t)+ gi (t)−1 dgi (t)
dt .
Multiplying on the left by gi (t),w eh a v e
dgi (t)
dt =−ω(σ i∗X)gi (t). (10.13a)
The fundamental theorem of ODEs guarantees the existence and uniqueness of
the solution of (10.13a).
Since ω(σ i∗X )= σ∗
i ω( X )= /BT
i (X), (10.13a) is expressed in a local form
as dgi (t)
dt =−/BT
i (X)gi (t)( 10.13b)
whose formal solution with gi (0)= e is
gi (γ (t))= /C8 exp
(
−
∫ t
0
/BT
iµ
dxµ
dt dt
)
= /C8 exp
(
−
∫ γ( t )
γ( 0)
/BT
iµ(γ (t)) dxµ
)
(10.14)


## Page 401

where /C8 is a path-ordering operator along γ( t).1 The horizontal lift is expressed
as ˜γ( t)= σ i (γ (t))gi (γ (t)).
Corollary 10.1. Let ˜γ′ be another horizontal lift of γ , such that ˜γ′(0)= γ( 0)g.
Then ˜γ′(t)=˜γ( t)g for all t∈[0, 1].
Proof. We ﬁrst note that the horizontal subspace is right invariant, Rg∗Hu P =
Hug P.L e t˜γ be a horizontal lift of γ .T h e n˜γ g : t ↦→˜γ( t)g is also a horizontal
lift of γ( t) since its tangent vector belongs to H˜γ g P. From theorem 10.2 we ﬁnd
˜γ′ is the unique horizontal lift which starts at ˜γ( 0)g. /A3
Example 10.2. Let us consider the bundle P(M, /CA ) ∼= M × /CA where M =
/CA
2 −{0}.L e tφ : ((x, y), f )↦→u∈P be a local trivialization, where (x, y) are
the coordinates of M while f is that of the additive group /CA .L e t
ω = ydx−xdy
x2+ y2 + d f
be a connection one-form. It is easily veriﬁed that ω satisﬁes the axioms of
the connection one-form. In fact, for A# = A∂/∂ f , A ∈/CA b e i n ga ne l e m e n t
of the Lie algebra of additive group, we have ω( A#) = A.F u r t h e r m o r e ,
Rg∗ω = ω = g−1ω g,s i n c e/CA is Abelian. Let γ :[ 0, 1]→ M be a
curve t ↦→(cos 2π t, sin 2π t). Let us work out a horizontal lift which starts at
((1, 0), 0).L e t
X= d
dt ≡dx
dt
∂
∂ x + dy
dt
∂
∂ y + d f
dt
∂
∂ f
be tangent to ˜γ( t).F o rX to be horizontal, it must satisfy
0= ω( X )= dx
dt
y
r2 −dy
dt
x
r2 + d f
dt =−2π + d f
dt .
The solution is easily found to be f = 2π t + constant. We ﬁnally ﬁnd the
horizontal lift ˜γ passing through ((1, 0), 0),
˜γ( t)= ((cos 2π t, sin 2π t), 2π t) (10.15)
which is a helix over the unit circle.
Under the group action (right or left does not matter), f translates to
f + g, g∈/CA . The shifted horizontal lift is
˜γ g (t)= ((cos 2π t, sin 2π t), 2π t+ g). (10.16)
1
/BT
iµ (γ (t)) and /BT
iν (γ (s)) do not commute in general and the exponential in (10.14) is not well
deﬁned as it is. Let A(t) and B(t) be t-dependent matrices. Then the action of /C8 is
/C8 [A(t)B(s)]=
{
A(t)B(s)( t > s)
B(s)A(t)( s > t).
Generalization to products of more matrices should be obvious.


## Page 402

Figure 10.3. Ac u r v eγ( t) in M and its horizontal lifts ˜γ( t) and ˜γ( t)g.
Let γ :[ 0, 1]→ M be a curve. Take a point u0 ∈π−1(γ (0)).T h e r e i s
a unique horizontal lift ˜γ( t) of γ( t) through u0, and hence a unique point u1 =
˜γ( 1)∈π−1(γ (1)), see ﬁgure 10.3. The point u1 is called the parallel transport
of u0 along the curve γ . This deﬁnes a map /Gamma1(˜γ) : π−1(γ (0)) →π−1(γ (1))
such that u0 ↦→u1. If the local form (10.14) is employed, we have
u1 = σ i (1)/C8 exp
(
−
∫ 1
0
/BT
iµ
dxµ (γ (t))
dt dt
)
. (10.17)
Corollary 10.1 ensures that /Gamma1(˜γ) commutes with the right action Rg.F i r s t
note that Rg /Gamma1(˜γ) (u0)= u1g and /Gamma1(˜γ) Rg (u0)= /Gamma1(˜γ) (u0g). Observe that ˜γ( t)g
is a horizontal lift through u0g and u 1g. From the uniqueness of the horizontal
lift through u0g,w eh a v eu1g= /Gamma1(˜γ) (u0g),t h a ti sRg /Gamma1(˜γ) (u0)= /Gamma1(˜γ) Rg (u0).
Since this is true for any u0 ∈π−1(γ (0)),w eh a v e
Rg /Gamma1(˜γ) = /Gamma1(˜γ) Rg . (10.18)
Exercise 10.3. Let ˜γ be a horizontal lift of γ :[ 0, 1]→ M. Consider a map
/Gamma1(˜γ−1): π−1(γ (1))→π−1(γ (0)) where ˜γ−1(t)=˜γ( 1−t). Show that
/Gamma1(˜γ−1)= /Gamma1(˜γ)−1. (10.19)


## Page 403

Consider two curves α :[ 0, 1]→ M and β :[ 0, 1]→ M such that
α( 1)= β( 0). Deﬁne the product α ∗β by
α ∗β =
{
α( 2t) 0≤t≤1
2
β( 2t−1) 1
2 ≤t≤1.
Let /Gamma1(˜α) : π−1(α( 0)) →π−1(α( 1)) and /Gamma1(˜β) : π−1(β( 0)) →π−1(β( 1)).
Show that
/Gamma1(
/CL
α ∗β) = /Gamma1(˜β) ◦/Gamma1(˜α). (10.20)
Exercise 10.4. Let us write u ∼v,i f u,v ∈P are on the same horizontal lift.
Show that∼is an equivalence relation.
10.2 Holonomy
10.2.1 Deﬁnitions
Let P(M, G) be a principal bundle and let γ :[ 0, 1]→ M be a curve whose
horizontal lift through u0 ∈π−1(γ (0)) is ˜γ . In the last section, we deﬁned
am a p /Gamma1(˜γ) : π−1(γ (0)) →π−1(γ (1)) which maps a point u0 =˜ γ( 0) to
u1 =˜γ( 1). Let us consider two curvesα, β :[ 0, 1]→M with α( 0)= β( 0)= p0
and α( 1) = β( 1) = p1. Take horizontal lifts ˜α and ˜β of α and β such that
˜α( 0)= ˜β( 0)= u0.T h e n˜α( 1) is not necessarily equal to ˜β( 1). This shows that if
we consider a loop γ :[ 0, 1]→M at p= γ( 0)= γ( 1),w eh a v e˜γ( 0)̸=˜γ( 1) in
general. A loop γ deﬁnes a transformation τγ : π−1(p)→π−1(p) on the ﬁbre.
This transformation is compatible with the right action of the group,
τγ (ug)= τγ (u)g (10.21)
which follows immediately from (10.18). We note that τγ depends not only on
the loop γ but also on the connection.
Example 10.3. Consider an /CA -bundle over M = /CA
2 −{0}. The connection
one-form ω and the loop γ in example 10.2 deﬁne a map τγ : π−1((1, 0)) →
π−1((1, 0)) given by g↦→g+ 2π , g∈/CA .
Take a point u∈P with π( u)= p and consider the set of loops Cp (M) at
p; Cp (M)≡{γ :[ 0, 1]→M|γ( 0)= γ( 1)= p}. The set of elements
/Phi1u ≡{g∈G|τγ (u)= ug,γ ∈Cp (M)} (10.22)
is a subgroup of the structure groupG and is called theholonomy group at u.T h e
group property of /Phi1u is easily derived from exercise 10.3. If α, β and γ = α ∗β
are loops at p,w eh a v eτγ = τβ ◦τα , hence
τγ (u)= τβ ◦τα (u)= τβ (ugα )= τβ (u)gα = ugβ gα


## Page 404

where τα (u)= ugα etc. This shows that
gγ = gβ gα . (10.23)
The constant loop c :[ 0, 1] ↦→ p deﬁnes the identity transformation
τc : u ↦→u. The inverse loop γ−1 of γ induces the inverse transformation
τγ−1 = τ−1
γ , hence gγ−1 = g−1
γ .
Exercise 10.5. (a) Let τα (u)= ugα . Show that
τα (ug)= ug(adg gα )= ug(g−1gα g). (10.24)
Verify that
/Phi1ua ∼= a−1/Phi1ua. (10.25)
(b) Let u, u′ ∈P be points on the same horizontal lift ˜γ . Show that
/Phi1u ∼
= /Phi1
u′ .
(c) Suppose that M is connected. Show that all /Phi1u are isomorphic to each
other.
Exercise 10.6. Let /BT
i = /BT
iµ dxµ be a gauge potential over Ui and γ a loop in
Ui .L e tτγ (u)= ugγ , u∈P, gγ ∈G. Use (10.14) to show that
gγ = /C8 exp
(
−
∮
γ
/BT
iµ dxµ
)
. (10.26)
Let C0
p (M) denote the set of loops at p, which are homotopic to the constant
loop at p. The group
/Phi10
u ≡{g∈G|τγ (u)= ug,γ ∈C0
p (M)} (10.27)
is called the restricted holonomy group.
10.3 Curvature
10.3.1 Covariant derivatives in principal bundles
We deﬁned the exterior derivative d : /Omega1r (M) →/Omega1r+1(M) in chapter 5. An
r-form η is a real-valued form acting on vectors,
η : TM ∧... ∧TM →/CA .
We will generalize this operation so that we can differentiate a vector-valued r-
form φ ∈/Omega1r (P)⊗V ,
φ : TP ∧... ∧TP →V
where V is a vector space of dimension k. The most general form of φ is
φ = ∑k
α=1 φ α ⊗eα ,{eα} being a basis of V and φ α ∈/Omega1r (P).


## Page 405

A connection ω on a principal bundle P(M, G) separates Tu P into Hu P⊕
Vu P. Accordingly, a vector X ∈Tu P is decomposed as X = X H + XV where
X H ∈Hu P and XV ∈Vu P.
Deﬁnition 10.4. Let φ ∈/Omega1r (P)⊗V and X1,..., Xr+1 ∈Tu P.T h e covariant
derivative of φ is deﬁned by
Dφ( X1,..., Xr+1)≡dP φ( X H
1 ,..., X H
r+1) (10.28)
where dP φ ≡dP φ α ⊗eα .
10.3.2 Curvature
Deﬁnition 10.5. The curvature two-form /Omega1is the covariant derivative of the
connection one-form ω ,
/Omega1≡Dω ∈/Omega12(P)⊗/CV . (10.29)
Proposition 10.2. The curvature two-form satisﬁes (cf (10.3b))
R∗
a /Omega1= a−1/Omega1aa ∈G. (10.30)
Proof. We ﬁrst note that (Ra∗X )H = Ra∗(X H ) (Ra∗preserves the horizontal
subspaces) and dP R∗
a = R∗
a dP , see (5.75). By deﬁnition we ﬁnd
R∗
a /Omega1(X, Y )= /Omega1(Ra∗X, Ra∗Y )= dP ω( ( Ra∗X)H ,( Ra∗Y )H )
= dP ω( Ra∗X H , Ra∗Y H )= R∗
a dP ω( X H , Y H )
= dP R∗
a ω( X H , Y H )
= dP (a−1ω a)(X H , Y H )= a−1dP ω( X H , Y H )a
= a−1/Omega1(X, Y )a
where we noted that a is a constant element and hence dPa= 0. /A3
Take a /CV -valued p-form ζ = ζ α ⊗Tα and a /CV -valued q-form η = η α ⊗Tα
where ζ α ∈/Omega1p (P), η α ∈/Omega1q (P),a n d{Tα} is a basis of /CV . Deﬁne the commutator
of ζ and η by
[ζ,η ]≡ζ∧η−(−1)pq η∧ζ
= Tα Tβ ζ α ∧η β −(−1)pq Tβ Tα η β ∧ζ α
=[ Tα , Tβ]⊗ζ α ∧η β = fαβ γ Tγ ⊗ζ α ∧η β . (10.31)
If we put ζ = η in (10.31), when p and q are odd, we have
[ζ,ζ ]= 2ζ∧ζ = fαβ γ Tγ ⊗ζ α ∧ζ β .
Lemma 10.2. Let X∈Hu P and Y ∈Vu P.T h e n[X, Y]∈Hu P.


## Page 406

Proof.L e tY be a vector ﬁeld generated by g(t),t h e n
/C4
Y X=[ Y, X]= lim
t→0
t−1(Rg(t )∗X−X).
Since a connection satisﬁes Rg∗Hu P = Hug P, the vector Rg(t )∗X is horizontal
a n ds oi s[Y, X]. /A3
Theorem 10.3. Let X, Y ∈Tu P.T h e n /Omega1and ω satisfy Cartan’s structure
equation
/Omega1(X, Y )=dP ω( X, Y )+[ ω( X), ω( Y )] (10.32a)
which is also written as
/Omega1= dP ω + ω ∧ω. ( 10.32b)
Proof. We consider the following three cases separately:
(i) Let X, Y ∈Hu P.T h e nω( X )= ω( Y )= 0 by deﬁnition. From deﬁnition
10.5, we have /Omega1(X, Y ) = dP ω( X H , Y H ) = dP ω( X, Y ),s i n c eX = X H and
= Y H .
(ii) Let X∈Hu P and Y ∈Vu P.S i n c eY H = 0, we have /Omega1(X, Y )= 0. We
also have ω( X )= 0. Thus, we need to prove d P ω( X, Y )= 0. From (5.70), we
obtain
dP ω( X, Y )= X ω( Y )−Y ω( X )−ω([X, Y])= Xω( Y )−ω([X, Y]).
Since Y ∈Vu P, there is an element V ∈/CV such that Y = V #.T h e nω( Y )= V is
constant, hence X ω( Y )= X· V = 0. From lemma 10.2, we have[X, Y]∈Hu P
so that ω([X, Y])= 0a n dw eﬁ n ddP ω( X, Y )= 0.
(iii) For X, Y ∈Vu P,w eh a v e/Omega1(X, Y )= 0. We ﬁnd that, in this case,
dP ω( X, Y )= X ω( Y )−Y ω( X)−ω([X, Y])=−ω([X, Y]).
We note thatX and Y are closed under the Lie bracket,[X, Y]∈Vu P, see exercise
10.1(b). Then there exists A∈/CV such that
ω([X, Y])= A
where A# =[ X, Y].L e t B# = X and C# = Y .T h e n[ω( X), ω( Y )]=[ B, C]=
A since[B, C]# =[ B#, C#]. Thus, we have shown that
0= dP ω( X, Y )+ ω([X, Y])= dP ω( X, Y )+[ ω( X), ω( Y )].
Since /Omega1is linear and skew symmetric, these three cases are sufﬁcient to show
that (10.32) is true for any vectors.
To derive (10.32b) from (10.32a), we note that
[ω, ω ](X, Y )=[ Tα , Tβ]ω α ∧ω β (X, Y )
=[ Tα , Tβ][ω α (X )ω β (Y )−ω β (X)ω α (Y )]
=[ ω( X ), ω( Y )]−[ω( Y ), ω( X)]= 2[ω( X), ω( Y )].
Hence, /Omega1(X, Y )= (dP ω + 1
2[ω, ω ])(X, Y )= (dP ω + ω ∧ω)( X, Y ). /A3


## Page 407

10.3.3 Geometrical meaning of the curvature and the Ambrose–Singer
theorem
We have shown in chapter 7 that the Riemann curvature tensor expresses the non-
commutativity of the parallel transport of vectors. There is a similar interpretation
of curvature on principal bundles. We ﬁrst show that /Omega1(X, Y ) yields the vertical
component of the Lie bracket[X, Y] of horizontal vectors X, Y ∈Hu P. It follows
from ω( X )= ω( Y )= 0t h a t
dP ω( X, Y )= X ω( Y )−Y ω( X)−ω([X, Y])=−ω([X, Y]).
Since X H = X, Y H = Y ,w eh a v e
/Omega1(X, Y )= dP ω( X, Y )=−ω([X, Y]). (10.33)
Let us consider a coordinate system {xµ} on a chart U.L e t V = ∂/∂ x1 and
W = ∂/∂ x2. Take an inﬁnitesimal parallelogram γ whose corners are O =
{0, 0,..., 0},P ={ ε, 0,..., 0},Q ={ ε, δ, 0,..., 0} and R ={ 0,δ , 0,..., 0}.
Consider the horizontal lift ˜γ of γ .L e t X, Y ∈Hu P such that π∗X = εV and
π∗Y = δW.T h e n
π∗([X, Y]H )= ϵδ[V , W]= ϵδ
[ ∂
∂ x1 , ∂
∂ x2
]
= 0 (10.34)
that is [X, Y] is vertical. This consideration shows that the horizontal lift ˜γ of
a loop γ fails to close. This failure is proportional to the vertical vector [X, Y]
connecting the initial point and the ﬁnal point on the same ﬁbre. The curvature
measures this distance,
/Omega1(X, Y )=−ω([X, Y])= A (10.35)
where A is an element of
/CV such that[X, Y]= A#.
Since the discrepancy between the initial and ﬁnal points of the horizontal
lift of a closed curve is simply the holonomy, we expect that the holonomy group
is expressed in terms of the curvature.
Theorem 10.4. (Ambrose–Singer theorem)L e t P(M, G) be a G bundle over a
connected manifold M.T h eL i ea l g e b r a
/CW of the holonomy group /Phi1u0 of a point
u0 ∈P agrees with the subalgebra of /CV spanned by the elements of the form
/Omega1u (X, Y ) X, Y ∈Hu P (10.36)
where a∈P is a point on the same horizontal lift as u0. [See Choquet-Bruhat et
al (1982) for the proof.]


## Page 408

10.3.4 Local form of the curvature
The local form /BY of the curvature /Omega1is deﬁned by
/BY ≡σ∗/Omega1 (10.37)
where σ is a local section deﬁned on a chartU of M (cf /BT = σ∗ω ). /BY is expressed
in terms of the gauge potential /BT as
/BY = d/BT + /BT ∧/BT (10.38a)
where d is the exterior derivative on M. The action of /BY on the vectors of TM is
given by
/BY (X, Y )= d/BT (X, Y )+[ /BT (X), /BT (Y )].( 10.38b)
To prove (10.38a) we note that /BT = σ∗ω , σ∗dP ω = dσ∗ω and σ∗(ζ ∧η) =
σ∗ζ∧σ∗η . From Cartan’s structure equation, we ﬁnd
/BY = σ∗(dP ω + ω ∧ω) = dσ∗ω + σ∗ω ∧σ∗ω = d/BT + /BT ∧/BT .
Next, we ﬁnd the component expression of/BY on a chartU whose coordinates
are xµ = ϕ( p).L e t /BT = /BT
µ dxµ be the gauge potential. If we write
/BY = 1
2
/BY
µν dxµ∧dxν , a direct computation yields
/BY
µν = ∂µ
/BT
ν −∂ν
/BT
µ+[ /BT
µ, /BT
ν]. (10.39)
/BY is also called the curvature two-form and is identiﬁed with the ( Yang–Mills)
ﬁeld strength. To avoid confusion, we call /Omega1the curvature and /BY the (Yang–
Mills) ﬁeld strength. Since /BT
µ and /BY
µν are /CV -valued functions, they can be
expanded in terms of the basis{Tα} of /CV as
/BT
µ = Aµα Tα
/BY
µν = Fµν α Tα . (10.40)
The basis vectors satisfy the usual commutation relations[Tα , Tβ]= fαβ γ Tγ .W e
then obtain the well-known expression
Fµν α = ∂µ Aν α −∂ν Aµα + fβγ α Aµβ Aν γ . (10.41)
Theorem 10.5. Let Ui and Uj be overlapping charts of M and let /BY
i and /BY
j be
ﬁeld strengths on the respective charts. On Ui∩Uj , they satisfy the compatibility
condition,
/BY
j = Adt−1
ij
/BY
i = t−1
ij
/BY
itij (10.42)
where tij is the transition function on Ui ∩Uj .


## Page 409

Proof. Introduce the corresponding gauge potentials /BT
i and /BT
j ,
/BY
i = d/BT
i + /BT
i ∧/BT
i
/BY
j = d/BT
j + /BT
j ∧/BT
j .
Substituting /BT
j = t−1
ij
/BT
i tij + t−1
ij dtij into /BY
j ,w ev e r i f yt h a t
/BY
j = d (t−1
ij
/BT
i tij + t−1
ij dtij )
+ (t−1
ij
/BT
i tij + t−1
ij dtij )∧(t−1
ij
/BT
i tij + t−1
ij dtij )
=[−t−1
ij dtij ∧t−1
ij
/BT
i tij + t−1
ij d/BT
i tij
−t−1
ij
/BT
i ∧dtij −t−1
ij dtij t−1
ij ∧dtij]
+[ t−1
ij
/BT
i ∧/BT
i tij + t−1
ij
/BT
i ∧dtij
+ t−1
ij dtij t−1
ij ∧/BT
i tij + t−1
ij dtij ∧t−1
ij dtij]
= t−1
ij (d/BT
i + /BT
i ∧/BT
i )tij = t−1
ij
/BY
itij
where use has been made of the identity dt−1 =−t−1 dtt−1. /A3
Exercise 10.7. The gauge potential/BT is called apure gauge if /BT is written locally
as /BT = g−1 dg. Show that the ﬁeld strength /BY vanishes for a pure gauge /BT . [It
can be shown that the converse is also true. If /BY = 0o nac h a r tU, the gauge
potential may be expressed locally as /BT = g−1 dg.]
10.3.5 The Bianchi identity
Since ω and /Omega1are /CV -valued, we expand them in terms of the basis {Tα} of /CV as
ω = ω α Tα , /Omega1= /Omega1α Tα . Then (10.32b) becomes
/Omega1α = dP ω α + fβγ α ω β ∧ω γ . (10.43)
Exterior differentiation of (10.43) yields
dP /Omega1α = fβγ α dP ω β ∧ω γ + fβγ α ω β ∧dP ω γ . (10.44)
If we note that ω( X )= 0 for a horizontal vector X,w eﬁ n d
D/Omega1(X, Y, Z )= dP /Omega1(X H , Y H , Z H )= 0
where X, Y, Z∈Tu P. Thus, we have proved the Bianchi identity
D/Omega1= 0. (10.45)
Let us ﬁnd the local form of the Bianchi identity. Operating with σ∗on
(10.44), we ﬁnd that σ∗dP /Omega1= d· σ∗/Omega1= d/BY for the LHS and
σ∗(dP ω ∧ω −ω ∧dP ω) = dσ∗ω ∧σ∗ω −σ∗ω ∧dσ∗ω
= d/BT ∧/BT −/BT ∧d/BT = /BY ∧/BT −/BT ∧/BY


## Page 410

for the RHS. Thus, we have obtained that
/BW /BY = d/BY + /BT ∧/BY −/BY ∧/BT = d/BY +[ /BT , /BY ]= 0 (10.46)
where the action of /BW on a /CV -valued p-form η on M is deﬁned by
/BW η ≡dη+[ /BT ,η]. (10.47)
Note that /BW /BY = d/BY for G= U(1).
10.4 The covariant derivative on associated vector bundles
A connection one-form ω on a principal bundle P(M, G) enables us to deﬁne the
covariant derivative in associated bundles of P in a natural way.
10.4.1 The covariant derivative on associated bundles
In physics, we often need to differentiate sections of a vector bundle which is
associated with a certain principal bundle. For example, a charged scalar ﬁeld in
QED is regarded as a section of a complex line bundle associated with a U (1)
bundle P(M, U(1)). Differentiating sections covariantly is very important in
constructing gauge-invariant actions.
Let P(M, G) be a G bundle with the projection π
P . Let us take a chart Ui of
M and a section σ i over Ui . We take the canonical trivializationφ i (p, e)= σ i (p).
Let ˜γ be a horizontal lift of a curve γ :[ 0, 1]→ Ui . We denote γ( 0) = p0
and ˜γ( 0) = u0. Associated with P is a vector bundle E = P×ρ V with the
projection π E , see section 9.4. Let X ∈Tp M be a tangent vector to γ( t) at p0.
Let s∈/Gamma1(M, E) be a section, or a vector ﬁeld, on M. Write an element of E as
[(u,v )]={ (ug,ρ( g)−1v|u ∈P,v ∈V, g∈G}. Taking a representative of the
equivalence class amounts to ﬁxing the gauge. We choose the following form,
s(p)=[ (σ i (p), ξ( p))] (10.48)
as a representative.
Now we deﬁne the parallel transport of a vector in E along a curve γ in M.
Of course, a naive guess ‘ξ is parallel transported ifξ(γ( t)) is constant alongγ( t)’
does not make sense since this statement depends on the choice of the section
σ i (p). We deﬁne a vector to be parallel transported if it is constant with respect to
a horizontal lift ˜γ of γ in P. In other words, a sections(γ (t))=[ (˜γ( t), η(γ ( t)))]
is parallel transported if η is constant along γ( t). This deﬁnition is intrinsic since
if ˜γ′(t) is another horizontal lift of γ , then it can be written as ˜γ′(t) =˜γ( t)a,
a∈G and we have (we omit ρ to simplify the notation)
[(˜γ( t), η( t))]=[ (˜γ′(t)a−1,η ( t))]=[ (˜γ′(t), a−1η( t))]
where η( t) stands for η(γ ( t)). Hence, if η( t) is constant along γ( t), so is its
constant multiple a−1η( t).


## Page 411

Now the deﬁnition of covariant derivative is in order. Let s(p) be a section
of E. Along a curve γ :[ 0, 1]→M we have s(t)=[ (˜γ( t), η( t))],w h e r e˜γ( t) is
an arbitrary horizontal lift of γ( t). The covariant derivative of s(t) along γ( t) at
p0 = γ( 0) is deﬁned by
∇X s≡
[(
˜γ( 0), d
dt η(γ ( t))
⏐⏐
⏐⏐
t=0
)]
(10.49)
where X is the tangent vector to γ( t) at p0. For the covariant derivative to be
really intrinsic, it should not depend on the extra information, that is the special
horizontal lift. Let ˜γ′(t)=˜γ( t)a (a∈G) be another horizontal lift of γ .I f ˜γ′(t)
is chosen to be the horizontal lift, we have a representative [(˜γ′(t), a−1η( t))].
The covariant derivative is now given by
[(
˜γ′(0), d
dt{a−1η( t)}
⏐⏐
⏐
⏐
t=0
)]
=
[(
˜γ′(0)a−1, d
dt η( t)
⏐
⏐
⏐
⏐
t=0
)]
which agrees with (10.49). Hence, ∇X s depends only on the tangent vector X
and the sections s∈/Gamma1(M, E) and not on the horizontal lift ˜γ( t). Our deﬁnition
depends only on a curve γ and a connection and not on local trivializations. The
local form of the covariant derivative is useful in practical computations and will
be given later.
So far we have deﬁned the covariant derivative at a point p0 = γ( 0).I t
is clear that if X is a vector ﬁeld, ∇X maps a section s to a new section ∇X s,
hence∇X is regarded as a map /Gamma1(M, E)→/Gamma1(M, E). To be more precise, take
X ∈/CG (M) whose value at p is X p ∈Tp M. There is a curve γ( t) such that
γ( 0)= p and its tangent at p is X p. Then any horizontal lift ˜γ( t) of γ enables
us to compute the covariant derivative ∇X s|p ≡∇X p s. We also deﬁne a map
∇:/Gamma1(M, E)→/Gamma1(M, E)⊗/Omega11(M) by
∇s(X )≡∇X sX ∈/CG (M) s∈/Gamma1(M, E). (10.50)
Exercise 10.8. Show that
∇X (a1s1+ a2s2)= a1∇X s1+ a2∇X s2 (10.51a)
∇(a1s1+ a2s2)= a1∇s1+ a2∇s2 (10.51b)
∇(a1 X1+a2 X2)s= a1∇X1 s+ a2∇X2 s (10.51c)
∇X ( fs )= X[ f]s+ f∇X s (10.51d)
∇( fs )= (d f )s+ f∇s (10.51e)
∇fX s= f∇X s (10.51f)
where ai ∈/CA , s, s′ ∈/Gamma1(M, E) and f ∈/BY (M).


## Page 412

10.4.2 A local expression for the covariant derivative
In practical computations it is convenient to have a local coordinate representation
of the covariant derivative. Let P(M, G) be a G bundle and E = P×ρ G be an
associate vector bundle. Take a local section σ i ∈/Gamma1(Ui , P) and employ the
canonical trivialization σ i (p)= φ i (p, e).L e t γ :[ 0, 1]→ M be a curve in Ui
and ˜γ its horizontal lift, which is written as
˜γ( t)= σ i (t)gi (t) (10.52)
where gi (t)≡gi (γ (t))∈G. Take a section eα (p)≡[(σ i (p), eα 0)] of E,w h e r e
eα 0 is the α th basis vector of V ; (eα 0)β = (δα )β .W eh a v e
eα (t)=[ (˜γ( t)gi (t)−1, eα 0)]=[ (˜γ( t), gi (t)−1eα 0)]. (10.53)
Note that gi (t)−1 acts on eα 0 to compensate for the change of basis along γ .T h e
covariant derivative ofeα is then given by
∇X eα =
[(
˜γ( 0), d
dt{gi (t)−1eα 0}
⏐⏐⏐
⏐
t=0
)]
=
[(
˜γ( 0),−gi (t)−1
{ d
dt gi (t)
}
gi (t)−1eα 0
⏐
⏐
⏐
⏐
t=0
)]
=[ (˜γ( 0)gi (0)−1, /BT
i (X)eα 0)] (10.54)
where (10.13b) has been used. From (10.54) we ﬁnd the local expression,
∇X eα =[ (σ i (0), /BT
i (X)eα 0)]. (10.55)
Let /BT
i = /BT
iµ dxµ = /BT
iµα
β dxµ where /BT
iµα
β ≡/BT
iµγ (Tγ )α
β . The second
entry of (10.55) is
/BT
i (X )eα 0 = dxµ
dt eβ 0
/BT
iµβ
γ δα γ = dxµ
dt
/BT
iµβ
α eβ 0.
Substituting this into (10.55), we ﬁnally have
∇X eα =
[(
σ i (0), dxµ
dt
/BT
iµβ
α eβ 0
)]
= dxµ
dt
/BT
iµβ
α eβ (10.56a)
or
∇eα = /BT
i β
α eβ .( 10.56b)
In particular, for a coordinate curve xµ,w eh a v e
∇∂/∂ xµ eα = /BT
iµβ
α eβ . (10.57)
It is remarkable that a connection /BT on a principal bundle P completely speciﬁes
the covariant derivative on an associated bundle E (modulo representations).


## Page 413

Exercise 10.9. Let s(p)=[ (σ i (p), ξi (p))]= ξi α (p)eα be a general section of E,
where ξi (p)= ξi α (p)eα 0. Use the results of exercise 10.8 to verify that
∇X s=
[(
σ i (0), dξi
dt + /BT
i (X )ξi
⏐⏐
⏐
⏐
t=0
)]
= dxµ
dt
{ ∂ξ i α
∂ xµ + /BT
iµα
β ξi β
}
eα .
(10.58)
By construction, the covariant derivative is independent of the local
trivialization. This is also observed from the local form of ∇X s.L e t σ i (p) and
σ j (p) be local sections on overlapping charts Ui and Uj .O n Ui ∩Uj ,w eh a v e
σ j (p)= σ i (p)tij (p).I nt h ei-trivialization, the covariant derivative is
∇X s=
[(
σ i (0), dξi
dt + /BT
i (X)ξi
⏐
⏐
⏐
⏐
t=0
)]
=
[(
σ j (0)· t−1
ij , d
dt (tij ξ j )+ /BT
i (X)tij ξ j
⏐
⏐⏐⏐
t=0
)]
=
[(
σ j (0), dξ j
dt + /BT
j (X)ξ j
⏐
⏐
⏐
⏐
t=0
)]
(10.59)
where use has been made of the condition (10.9). The last line of (10.59) is ∇X s
expressed in the j-trivialization.
We have found that the covariant derivative deﬁned by (10.49) is independent
of the horizontal lift as well as the local section. The gauge potential /BT
i
transforms under the change of local trivialization so that ∇X s is a well-deﬁned
section of E.I n t h i s s e n s e ,∇X is the most natural derivative on an associated
vector bundle, which is compatible with the connection on the principal bundle
P.
Example 10.4. Let us recover the results obtained in section 7.2. Let FM be a
frame bundle over M and let TM be its associated bundle. We note FM =
P(M, GL(m, /CA )) and TM = FM×ρ
/CA
m ,w h e r em= dim M and ρ is the m× m
matrix representation of GL (m, /CA ).E l e m e n t s o f/CV/D0 (m, /CA ) are m× m matrices.
Let us rewrite the local connection form /BT
i as /Gamma1α µβ dxµ. We then ﬁnd that
∇∂/∂ xµ eα =[ (σ i (0), /Gamma1µeα 0)]= /Gamma1β µα eβ (10.60)
which should be compared with (7.14). For a general section (vector ﬁeld),
s(p)=[(σ i (p), Xi (p))]= Xi α (p)eα ,w eﬁ n d
∇∂/∂ xµ s=
( ∂
∂ xµ Xi α + /Gamma1α µβ Xβ
)
eα (10.61)
which reproduces the result of section 7.2. It is evident that the roles played by the
indices α, β and µ in /Gamma1α µβ are very different in their characters; µ is the /Omega11(M)
index while α and β are the /CV/D0 (m, /CA ) indices.


## Page 414

Example 10.5. Let us consider the U (1) gauge ﬁeld coupled to a complex scalar
ﬁeld φ . The relevant ﬁbre bundles are the U (1) bundle P(M, U(1)) and the
associated bundle E= P×ρ
/BV where ρ is the natural identiﬁcation of an element
of U(1) with a complex number. The local expression for ω is /BT
i = /BT
iµ dxµ,
where /BT
iµ = /BT
i (∂/∂ xµ) is the vector potential of Maxwell’s theory. Let γ be
ac u r v ei nM with tangent vector X at γ( 0). Take a local section σ i and express
a horizontal lift ˜γ of γ as ˜γ( t) = σ i (t)eiϕ( t ).I f 1 ∈/BV is taken to be the basis
vector, the basis section is
e=[ (σ i (p), 1)].
Let φ( p)=[ (σ i (p), /Phi1(p))]= /Phi1(p)e (/Phi1: M →/BV ) be a section of E,w h i c h
is identiﬁed with a complex scalar ﬁeld. With respect to˜γ( t), the section is given
by
φ( t)= /Phi1(t)[(˜γ( t), U (t)−1)] (10.62)
where U (t)= eiϕ( t ). The covariant derivative of φ along γ is
∇X φ = d/Phi1
dt [(˜γ( 0), U (0)−1)]+ /Phi1(0)[(˜γ( 0), U (0)−1
/BT
i (X)· 1)]
=
( d/Phi1
dt + /BT
iµ/Phi1dxµ
dt
)
e= Xµ
( ∂/Phi1
∂ xµ + /BT
iµ/Phi1
)
e. (10.63)
Example 10.6. Let us consider the SU(2) Yang–Mills theory on M. The relevant
bundles are the SU (2) bundle P(M, SU(2)) and its associated bundle E =
P×ρ
/BV
2 , where we have taken the two-dimensional representation. The gauge
potential on a chart Ui is
/BT
i = /BT
iµ dxµ = Aiµα
( σ α
2i
)
dxµ (10.64)
where σ α /2i are generators of SU (2), σ α being the Pauli matrices. Let eα 0
(α = 1, 2) be basis vectors of /BV
2 and consider sections
eα (p)≡[(σ i (p), eα 0)] (10.65)
where σ i (p) deﬁnes a canonical trivialization of P over Ui .L e t φ( p) =
[(σ i (p), /Phi1α (p)eα 0)] b eas e c t i o no fE over M. Along a horizontal lift ˜γ( t) =
σ i (p)U (t), U (t)∈SU(2),w eh a v e
φ( t)=[ (˜γ( t), U (t)−1/Phi1α (t)eα 0)]. (10.66)
The covariant derivative of φ along X= d/dt is
∇X φ =
[(
˜γ( 0), U (0)−1 d/Phi1α (0)
dt eα 0
)]
+[ (˜γ( 0), U (0)−1
/BT
i (X)α
β /Phi1β (0)eα 0)]
= X µ
( ∂/Phi1α
∂ xµ + /BT
iµα
β /Phi1β
)
eα (10.67)


## Page 415

where (10.13b) has been used to obtain the last equality.
Exercise 10.10. Let us consider an associated adjoint bundleE
/CV
= P×Ad
/CV where
the action of G on /CV is the adjoint action V →Adg V = g−1Vg , V ∈/CV and
g ∈G. Take a local section σ i ∈/Gamma1(Ui , P) such that ˜γ( t)= σ i (t)g(t).T a k e a
section s(p)=[ (σ i (p), V (p))] on E
/CV
,w h e r eV (p)= V α (p)Tα ,{Tα} being the
basis of /CV . Deﬁne the covariant derivative /BW
X s by
/BW
X s≡
[(
˜γ( 0), d
dt{Adg(t )−1 V (t)}
⏐⏐
⏐
⏐
t=0
)]
. (10.68a)
Show that
/BW
X s=
[(
σ i (0), dV (t)
dt +[ /BT
i (X), V (t)]
⏐
⏐
⏐
⏐
t=0
)]
= X µ
( ∂ V α
∂ xµ + fβγ α
/BT
iµβ V γ
)
[(σ i (0), Tα )]. (10.68b)
10.4.3 Curvature rederived
The covariant derivative∇X s deﬁnes an operator ∇:/Gamma1(M, E) →/Gamma1(M, E ⊗
/Omega11(M)) by (10.50). More generally, the action of ∇on a vector-valued p-form
s⊗η , η ∈/Omega1p (M),i sd e ﬁ n e db y
∇(s⊗η) ≡(∇s)∧η+ s⊗dη. (10.69)
Let Ui be a chart of M and σ i a section of P over Ui . We take the canonical local
trivialization over Ui . We now prove
∇∇eα = eβ ⊗/BY
i β α (10.70)
where eα =[ (σ i , eα 0)]∈/Gamma1(Ui , E). In fact, by straightforward computation, we
ﬁnd
∇∇eα =∇(eβ ⊗/BT
i β
α )=∇eβ ∧/BT
i β
α + eβ ⊗d/BT
i β
α
= eβ ⊗(d/BT
i β
α + /BT
i β
γ ∧/BT
i γ
α )= eβ ⊗/BY
i β
α .
Exercise 10.11. Let s(p)= ξ α (p)eα (p) be a section of E. Show that
∇∇s= eα ⊗/BY
i α
β ξ β . (10.71)
10.4.4 A connection which preserves the inner product
Let E
π
−→M be a vector bundle with a positive-deﬁnite symmetric inner product
whose action is deﬁned at each point p∈M by
gp : π−1(p)⊗π−1(p)→/CA . (10.72)


## Page 416

Then g is said to deﬁne a Riemannian structure on E. A connection∇is called
a metric connection if it preserves the inner product,
d[g(s, s′)]= g(∇s, s′)+ g(s,∇s′). (10.73)
In particular, if we take s= eα , s′ = eβ and set g(eα , eβ )= gαβ ,w eﬁ n d
dgαβ = /BT
i γ
α gγβ + /BT
i γ
β gαγ . (10.74)
This should be compared with (7.30b). If E = TM and, moreover, the torsion-
free condition is imposed, our connection r educes to the Levi- Civita connection
of the Riemannian geometry.
Given an inner product, we may take an orthonormal frame{ˆeα} such that
g(ˆeα ,ˆeβ )= δαβ . The structure group G is taken to be O(k), k being the dimension
of the ﬁbre. The Lie algebra /D3 (k) is a vector space of skew symmetric matrices
and the connection one-form ω satisﬁes
ω α β =−ω β α . (10.75)
Theorem 10.6. Let E be a vector bundle with inner product g and let ∇be the
covariant derivative associated with the orthonormal frame. Then ∇is a metric
connection.
Proof.S i n c eg is bilinear, it sufﬁces to show that
d[g(s, s′)]= g(∇s, s′)+ g(s,∇s′)
for s = fˆeα and s′ = f′ˆeβ where f, f′ ∈/BY (M). In fact, the LHS is
d[g( fˆeα , f′ˆeβ )]= d[ ff ′δαβ ]= d ( ff ′)δαβ while the RHS is
g(∇fˆeα , f′ˆeβ )+ g( fˆeα ,∇f′ˆeβ )
= g(d f ˆeα + fˆeγ ω γ α , f′ˆeβ )+ g( fˆeα , d f′ ˆeβ + f′ˆeγ ω γ β )
= d ff ′ δαβ + ff ′ω γ α δγβ + f d f′ δαβ + ff ′ω γ β δαγ
= d( ff ′)δ αβ
where (10.75) has been used to obtain the ﬁnal equality. /A3
10.4.5 Holomorphic vector bundles and Hermitian inner products
Deﬁnition 10.6. Let E and M be complex manifolds and π : E → M a
holomorphic surjection. The manifold E is a holomorphic vector bundle if the
following axioms are fulﬁlled.
(i) The typical ﬁbre is /BV
k and the structure group is GL(k, /BV ).
(ii) The local trivialization φ i : Ui × /BV
k →π−1(Ui ) is a biholomorphism.


## Page 417

(iii) The transition function tij : Ui∩Uj →G= GL(k, /BV ) is a holomorphic
map.
For example, let M be a complex manifold with dim
/BV
M = m.T h e
holomorphic tangent bundle TM+ ≡⋃
p∈M Tp M+ is a holomorphic vector
bundle. The typical ﬁbre is /BV
m and the local basis is{∂/∂ zµ}.
Let h be an inner product on a holomorphic vector bundle whose action at
p ∈M is h p : π−1(p)× π−1(p) →/BV . The most natural inner product is a
Hermitian structure which satisﬁes:
(i) h p (u, av+ bw)= ah p(u,v )+ bh p (u,w ),f o ru,v ,w ∈π−1(p), a, b∈/BV ;
(ii) h p (u,v )=
 h p (v, u), u,v ∈π−1(p);
(iii) h p (u, u)≥0, h p (u, u)= 0 if and only if u= φ i (p, 0);a n d
(iv) h(s1, s2)∈/BY (M)
/BV
for s1, s2 ∈/Gamma1(M, E).
A set of sections{ˆe1,..., ˆek} is a unitary frame if
h(ˆei ,ˆej )= δij . (10.76)
The unitary frame bundle LM is not a holomorphic vector bundle since the
structure group U(m) is not a complex manifold.
Given a Hermitian structure h, we deﬁne a connection which is compatible
with h.T h e Hermitian connection∇is a linear map /Gamma1(M, E) →/Gamma1(M, E⊗
T∗M
/BV
) which satisﬁes:
(i) ∇( fs )= (d f )s+ f∇s, f ∈/BY (M)
/BV
, s∈/Gamma1(M, E);
(ii) d [h(s1, s2)]= h(∇s1, s2)+ h(s1,∇s2);a n d
(iii) according to the destination, we separate the action of ∇as∇s= Ds+ ¯Ds,
Ds (¯Ds) being a (1, 0)-form ((0, 1)-form) valued section. We demand that
¯D=¯∂ .
It can be shown that given E and a Hermitian metric h, there exists a unique
Hermitian connection∇. The curvature is deﬁned from the Hermitian connection.
Let{ˆe1,..., ˆek} be a unitary frame and deﬁne the local connection form /BT
β α by
∇ˆeα =ˆeβ
/BT
β α . (10.77)
The ﬁeld strength is deﬁned by
/BY ≡d/BT + /BT ∧/BT . (10.78)
We verify that
∇∇ˆeα =∇(ˆeβ
/BT
β α )=ˆeβ
/BY
β α . (10.79)
We prove that both /BT and /BY are skew Hermitian:
¯
/BT
β α + /BT
α β = h(∇ˆeα ,ˆeβ )+ h(ˆeα ,∇ˆeβ )= dh (ˆeα ,ˆeβ )= dδαβ = 0
/BY
β α + ¯
/BY
α β = d/BT
β α + /BT
β γ ∧/BT
γ α + d ¯
/BT
α β + ¯
/BT
α γ ∧¯
/BT
γ α
= d (/BT
β α −/BT
β α )+ /BT
β γ ∧/BT
γ α + /BT
γ α ∧/BT
α γ = 0.


## Page 418

Thus, we have shown that
/BT
α β =−¯
/BT
β α
/BY
β α =−¯
/BY
α β . (10.80)
Next we show that /BY is a (1, 1)-form. Let{ˆeα} be a unitary frame. /BY cannot
have a component of bidegree-(0, 2) since
ˆeβ
/BY
β α =∇∇ˆeα = (D+¯∂)( D+¯∂)ˆeα = DDˆeα + (D¯∂+¯∂ D)ˆeα .
It follows from /BY
β α =−¯
/BY
α β that ¯
/BY has no component of bidegree- (0, 2), and,
hence, /BY has no component of bidegree- (2, 0) either. Thus /BY
β α is a two-form of
bidegree-(1, 1).
10.5 Gauge theories
As we have remarked several times, a gauge potential can be regarded as a local
expression for a connection in a principal bundle. The Yang–Mills ﬁeld strength is
then identiﬁed with the local form of the curvature associated with the connection.
We summarize here the relevant aspects o f gauge theories from the geometrical
viewpoint.
10.5.1 U(1) gauge theory
Maxwell’s theory of electromagnetism is described by the U(1) gauge group. U(1)
is Abelian and one dimensional, hence we omit all the group indices α ,β ,...
and put the structure constants fαβ γ = 0. Suppose the base space M is a four-
dimensional Minkowski spacetime. From corollary 9.1, we ﬁnd that the U(1)
bundle P is trivial, namely P = /CA
4 × U(1) and a single local trivialization over
M is required. The gauge potential is simply
/BT = /BT
µ dxµ. (10.81)
Our gauge potential /BT differs from the usual vector potential A by the Lie algebra
factor i: /BT
µ = iAµ. The ﬁeld strength is
/BY =d/BT . (10.82a)
In components, we have
/BY
µν = ∂ /BT
ν /∂ xµ−∂ /BT
µ/∂ xν .( 10.82b)
/BY satisﬁes the Bianchi identity,
d/BY =/BY ∧/BT −/BT ∧/BY = 0. (10.83a)
This should be expected from the outset since /BY is exact, /BY = d/BT ; and hence
closed, d/BY = d2
/BT = 0. In components, we have
∂λ
/BY
µν + ∂ν
/BY
λµ + ∂µ
/BY
νλ = 0.( 10.83b)


## Page 419

If we identify the components /BY
µν ≡iFµν with the electric ﬁeld E and the
magnetic ﬁeld B as
Ei = Fi0 , Bi = 1
2 ϵijk Fjk (i, j, k= 1, 2, 3) (10.84)
(10.83b) reduces to two of Maxwell’s equations,
∇×E+ ∂ B
∂ t = 0 ∇·B= 0.( 10.83c)
These equations are geometrical rather than dynamical. To ﬁnd the dynamics, we
have to specify the action. The Maxwell action /CB
M[/BT ] is a functional of /BT and
is given by
/CB
M[/BT ]≡1
4
∫
/CA
4
/BY
µν
/BY
µν d4x=−1
4
∫
/CA
4
Fµν Fµν d4x. (10.85a)
Exercise 10.12. (a) Let∗/BY
µν ≡1
2
/BY
κλ εκλµν be the dual of /BY
µν . Show that
/CB
M[/BT ]=−1
4
∫
/CA
4
/BY ∧∗/BY .( 10.85b)
(b) Use (10.84) to show that
−1
4 Fµν Fµν = 1
2 (E2−B2). (10.86)
Show also that
Fµν ∗Fµν = B· E. (10.87)
By the variation of /CB
M[/BT ] with respect to /BT
µ, we obtain the equation of
motion,
∂µ
/BY
µν = 0. (10.88a)
We ﬁnd this equation is reduced to the second set of Maxwell’s equations (in the
vacuum):
∇·E= 0 ∇×B−∂ E
∂ t = 0.( 10.88b)
10.5.2 The Dirac magnetic monopole
We have studied Maxwell’s theory of electromagnetism deﬁned on /CA
4 .T h e
triviality of the base space makes the U(1) bundle trivial. Poincar´ e’s lemma
ensures that the ﬁeld strength /BY is globally exact: /BY = d/BT . It is interesting to
extend our analysis to U(1) bundles over a non-trivial base space. We assume
everything is independent of time for simplicity.


## Page 420

The Dirac monopole is deﬁned in /CA
3 with the origin O removed. /CA
3 −{0}
and S2 are of the same homotopy type and the relevant bundle is a U(1) bundle
P(S2, U(1)). S2 is covered by two charts
UN ≡{(θ, φ)|0≤θ ≤1
2 π + ϵ} US ≡{(θ, φ)|1
2 π −ϵ≤θ ≤π}
where θ and φ are polar coordinates. Let ω be an Ehresmann connection on P.
Take a local section σ N (σ S)o n UN (US) and deﬁne the local gauge potentials
/BT
N = σ∗
Nω /BT
S = σ∗
S ω.
We take /BT
N and /BT
S to be of the Wu–Yang form (section 1.9),
/BT
N = ig(1−cos θ) dφ /BT
S =−ig(1+ cos θ) dφ (10.89)
where g is the strength of the monopole.
Let tNS be the transition function deﬁned on the equator UN ∩US. tNS
deﬁnes a map from S1 (equator) to U(1) (structure group), which is classiﬁed
by π 1(U(1))= /CI , see example 9.7. Let us write
tNS(φ) = exp[iϕ(φ) ] (ϕ : S1 →/CA ). (10.90)
The gauge potentials /BT
N and /BT
S are related on UN∩US by
/BT
N = t−1
NS
/BT
StNS+ t−1
NS dtNS = /BT
S+ idϕ. (10.91)
For the gauge potentials (10.89), we ﬁnd
dϕ =−i(/BT
N−/BT
S)= 2g dφ.
While φ runs from 0 to 2π around the equator, ϕ(φ) takes the range
/Delta1ϕ≡
∫
dϕ =
∫ 2π
0
2g dφ = 4π g. (10.92)
For tNS to be deﬁned uniquely, /Delta1ϕmust be a multiple of 2π ,
/Delta1ϕ/2π = 2g∈/CI (10.93)
which is the quantization condition of the magnetic monopole. The integer 2 g
represents the homotopy class to which this bundle belongs. This number is also
obtained by considering FN = dAN and FS = dAS (/BY
N = iFN etc). The total
ﬂux /Phi1is
/Phi1=
∫
S2
B· dS=
∫
UN
dAN+
∫
US
dAS
=
∫
S1
AN−
∫
S1
AS = 2g
∫ 2π
0
dφ = 4π g. (10.94)
Thus, the curvature, that is the pair of the ﬁeld strengths d AN and d AS,
characterizes the twisting of the bundle. We discuss this further in chapter 11.


## Page 421

Figure 10.4. The Aharonov–Bohm experiment. B= 0 outside the solenoid.
10.5.3 The Aharonov–Bohm effect
In the elementary study of electromagnetism, the electric and magnetic ﬁelds (that
is Fµν ) are of central interest. The vector potential A and the scalar potential
φ = A0 are considered to be of secondary importance. In quantum mechanics,
however, there are a variety of situations in which Fµν are not sufﬁcient to
describe the phenomena and the use of Aµ = ( A, A0) is essential. One of these
examples is the Aharonov–Bohm effect.
The Aharonov–Bohm (AB) experiment is schematically described in ﬁgure
10.4. A beam of electrons with charge e is incoming from the far left and forms
an interference pattern on the screen C. A solenoid of inﬁnite length is placed in
the middle of the beam. A shield S prevents electrons from penetrating into the
solenoid. Accordingly, the electrons do not feel the magnetic ﬁeld at all. What
about the gauge ﬁeld A
µ?
For simplicity, we make the radius of the solenoid inﬁnitesimally small,
keeping the total ﬂux /Phi1=
∫
S B· dS ﬁxed. It is easy to verify that
A(r)=
(
−y/Phi1
2π r2 , x/Phi1
2π r2 , 0
)
A0 = 0 (10.95)
satisﬁes
∫
(∇×A)· dS = /Phi1and∇×A= 0 for r ̸= 0. The vector potential
does not vanish outside the solenoid. Classically, the solenoid cannot have any
inﬂuence on electrons since the Lorentz force e(v× B) vanishes on the path of
the beam.


## Page 422

In quantum mechanics, the Hamiltonian H of this system is
/C0 =−1
2m
( ∂
∂ xµ −ieA µ
) 2
+ V (r) (10.96)
where V (r) represents the effect of the experimental apparatus. Semiclassically,
we can distinguish between the paths γI and γII in ﬁgure 10.4. We write the
wavefunction corresponding to γI (γII)a s ψ I (ψ II)w h e nA= 0. If A̸= 0, the
wavefunction is given by the gauge-transformed form,
ψ A
i (r)≡exp
(
ie
∫ r
P
A(r′)· dr′
)
ψ i (r)( i= I, II) (10.97)
where P is a reference point far from the apparatus. Let us consider a
superposition ψ A
I + ψ A
II of wavefunctions ψ A
I and ψ A
II such that ψ A
I (P) =
ψ A
II (P). Its amplitude at a point Q on the screen is
ψ A
I (Q)+ ψ A
II (Q)= exp
(
ie
∫
γI
A(r′)· dr′
)
ψ I(Q)
+ exp
(
ie
∫
γII
A(r′)· dr′
)
ψ II(Q)
= exp
(
ie
∫
γII
A· dr′
)[
exp
(
ie
∮
γ
A· dr′
)
ψ I(Q)+ ψ II(Q)
]
(10.98)
where γ ≡γI −γII. It is evident that even though B = 0 at the points in
space through which the electrons travel, the wavefunction depends on the vector
potential A. From Stokes’ theorem, we ﬁnd that
∮
γ
A· dr′ =
∫
S
(∇×A)· dS=
∫
S
B· dS= /Phi1 (10.99)
where S is a surface bounded byγ . From this and (10.98), we ﬁnd the interference
pattern should be the same for two values of the ﬂuxes /Phi1a and /Phi1b if
e(/Phi1a−/Phi1b)= 2π nn ∈/CI . (10.100)
What is the geometry underlying the Aharonov–Bohm effect? Since the
problem is essentially two dimensional, we consider a region M = /CA
2 −{0},
where the solenoid is assumed to be at the origin. The relevant bundles are the
principal bundle P(M, U(1)) and its associated bundle E= P×
ρ
/BV , where U(1)
acts on /BV in an obvious way. The bundle E is a complex line bundle over M,
whose section is a wavefunction ψ .
Let us deﬁne a Lie-algebra-valued one-form /BT = iA = iAµ dxµ.T h e
covariant derivative associated with this local connection is /BW = d+ /BT ,w h e r e


## Page 423

/BT is given by (10.95). Since d /BT = /BY = 0, this connection is locally ﬂat. Let
us consider the unit circle S1 which encloses the solenoid at the origin. We
parametrize S1 as eiθ (0≤θ ≤2π) and write the connection on S1 as
/BT = i /Phi1
2π dθ. (10.101)
This is obtained from (10.95) by putting r= 1. We require that the wavefunction
ψ be parallel transported along S1 with respect to this local connection, namely
/BW ψ(θ) =
(
d+ i /Phi1
2π dθ
)
ψ(θ) = 0. (10.102)
The solution of (10.102) is easily found to be
ψ(θ) = e−i/Phi1θ/2π . (10.103)
Taking this section ψ amounts to neglecting the velocity of the electrons. The
holonomy /Gamma1: π−1(θ = 0)→π−1(θ = 2π) = π−1(θ = 0) is found to be
/Gamma1: ψ( 0)↦−→e−i/Phi1ψ( 0). (10.104)
In an experiment, a toroidal permalloy (20% Fe and 80% Ni) has been used
to eliminate the edge effects (Tonomura et al 1983). The dimensions of the
permalloy are several microns and it is coated with gold to prevent electrons from
penetrating into the magnetic ﬁeld.
10.5.4 Yang–Mills theory
Let us consider SU(2) gauge theory deﬁned on /CA
4 . The bundle which describes
this gauge theory is P(/CA
4 , SU(2)).S i n c e/CA
4 is contractible, there is just a single
gauge potential
/BT = Aµα Tα dxµ (10.105)
where Tα ≡σ α /2i generate the algebra /D7/D9 (2),
[Tα , Tβ]= ϵαβ γ Tγ .
T h eﬁ e l ds t r e n g t hi s
/BY ≡d/BT + /BT ∧/BT = 1
2
/BY
µν dxµ∧dxν (10.106a)
where
/BY
µν = ∂µ
/BT
ν −∂ν
/BT
µ+[ /BT
µ, /BT
ν]= Fµν α Tα (10.106b)
Fµν α = ∂µ Aνα −∂ν Aµα + ϵαβ γ Aµβ Aνγ .( 10.106c)
The Bianchi identity is
/BW /BY = d/BY +[ /BT , /BY ]= 0. (10.107)


## Page 424

The Yang–Mills action is
/CB
YM[/BT ]≡−1
4
∫
M
tr(/BY
µν
/BY
µν )= 1
2
∫
M
tr(/BY ∧∗/BY ). (10.108)
The variation with respect to /BT
µ yields
/BW
µ
/BY
µν = 0o r /BW ∗/BY = 0. (10.109)
10.5.5 Instantons
A path integral is well deﬁned only on a space with a Euclidean metric. To
evaluate this integral, it is important to ﬁnd the local minima of the Euclidean
action and compute the quantum ﬂuctuations around them. Let us consider the
SU(2) gauge theory on a four-dimensional Euclidean space/CA
4 . The local minima
of this theory are known as instantons (or pseudoparticles,B e l a v i net al (1975)),
see section 1.10. It is easy to verify that the Euclidean action is
/CB
E
YM[/BT ]= 1
4
∫
M
tr(/BY
µν
/BY
µν )=−1
2
∫
M
tr(/BY ∧∗/BY ) (10.110)
where the Hodge ∗is taken with respect to the Euclidean metric. As has been
shown in section 1.10 the ﬁeld strength corresponding to instantons is self-dual
(anti-self-dual),
/BY
µν =±∗/BY
µν . (10.111)
The action of a self-dual (anti-self-dual) ﬁeld conﬁguration is
/CB
E
YM[/BT ]=−1
2
∫
M
tr(/BY ∧∗/BY )=∓1
2
∫
M
tr(/BY ∧/BY ). (10.112)
Let us consider the topological properties of an instanton. We require that
/BT
µ(x)→g(x)−1∂µg(x) as|x|→L (10.113)
for the action to be ﬁnite, where L is an arbitrary positive number. Since|x|= L
is the sphere S3, (10.113) deﬁnes a map g : S3 →SU(2) which is classiﬁed
by π 3(SU(2)) ∼=
/CI . How is this reﬂected upon the transition function? We
compactify /CA
4 by adding the inﬁnity. We suppose the South Pole ofS4 represents
the points at inﬁnity and the North Pole the origin. Under this compactiﬁcation,
we separate /CA
4 into two pieces and identify them with the southern hemisphere
US and the northern hemisphere UN of S4 as
UN ={x∈/CA
4||x|≤L+ ε} (10.114a)
US ={x∈/CA
4||x|≥L−ε} (10.114b)
see ﬁgure 10.5. We assume there is no ‘twist’ of the gauge potential on US and
choose
/BT
S(x)≡0 x∈US. (10.115)


## Page 425

Figure 10.5. One-point compactiﬁcation of /CA
4 to S4.
Then all the topological information about the bundle is contained in /BT
N(x) or
the transition function tNS(x) on the ‘equator’ S3 (=UN∩US). Since /BT
S = 0, we
have, for x∈UN∩US,
/BT
N = t−1
NS
/BT
StNS+ t−1
NS dtNS = t−1
NS dtNS. (10.116)
Thus, g(x) in (10.113) is identiﬁed w ith the transition function tNS(x) and
classifying the maps g : S3 →SU(2) amounts to classifying the transition
functions according to π 3(SU(2))= /CI ; see example 9.11.
We now compute the degree of a map g: S3 →SU(2) following Coleman
(1979). First note that SU(2)≃ S3 since
t4 I2+ ti σ i ∈SU(2)↔t2+ (t4)2 = 1.
Thus, maps g: S3 →SU(2) are classiﬁed according to π 3(SU(2))∼= π 3(S3)∼
=
/CI . We easily ﬁnd the following.
(a) The constant map
g0 : x∈S3 ↦→e∈SU(2) (10.117a)
belongs to the class 0 (i.e. no winding) of π 3(SU(2)).
(b) The identity map (this is, in fact, the identity map S3 →S3)
g1 : x↦→1
r[x4 I2+ xi σ i], r2 = x2+ (x4)2 (10.117b)
deﬁnes the class 1 of π 3(SU(2)). The explicit form of the gauge potential
corresponding to this homotopy class is given in section 1.10.
(c) The map
gn ≡(g1)n : x↦→r−n[x4 I2+ xi σ i]n (10.117c)
deﬁnes the class n of π 3(SU(2)).
We recall that the strength (charge) of a magnetic monopole is given by the
integral of the ﬁeld strength /BY = d/BT over the sphere S2. We expect that a similar


## Page 426

relation exists for the instanton number. Since instantons are deﬁned over S4,w e
have to ﬁnd a four-form to be integrated overS4. A natural four-form is /BY ∧/BY .I n
the following, we shall omit the exterior product symbol when this does not cause
confusion (/BY
2 stands for /BY ∧/BY ). Observe that tr /BY
2 is closed,
dt r/BY
2 = tr[d/BY/BY + /BY d/BY ]
= tr{−[/BT , /BY ]/BY −/BY [/BT , /BY ]}= 0 (10.118)
where use has been made of the Bianchi identity d/BY +[ /BT , /BY ]= 0. [Remarks:I n
the present case, (10.118) seems to be trivial since any four-form on S4 is closed.
Note, however, that (10.118) remains true even on higher-dimensional manifolds.]
By Poincar´e’s lemma, the closed form tr
/BY
2 is locally exact,
tr /BY
2 = dK (10.119)
where K is a local three-form. Thus, tr /BY
2 is an element of the de Rham
cohomology group H 4(S4). Later tr /BY
2 is identiﬁed with the second Chern
character and K its Chern–Simons form, see chapter 11.
Lemma 10.3. The three-form K in (10.119) is given by
K = tr[/BT d/BT + 2
3
/BT
3]. (10.120)
Proof. A straightforward computation yields
dK = tr[(d/BT )2+ 2
3 (d/BT/BT
2−/BT d/BT/BT + /BT
2 d/BT )]
= tr[(/BY −/BT
2)(/BY −/BT
2)
+ 2
3{(/BY −/BT
2)/BT
2−/BT (/BY −/BT
2)/BT + /BT
2(/BY −/BT
2)}]
= tr[/BY
2−/BT
2
/BY −/BY/BT
2+ /BT
4+ 2
3 (/BY/BT
2−/BT/BY/BT + /BT
2
/BY −/BT
4)]
where use has been made of the identity d/BT = /BY −/BT
2. Now we note that
tr /BT
4 = 0t r /BT/BY/BT =−tr /BT
2
/BY =−tr /BY/BT
2.
For example, we have
tr /BT/BY/BT = 1
2 tr /BT
κ
/BY
λµ
/BT
ν dxκ ∧dxλ ∧dxµ∧dxν
=−1
2 tr /BT
ν
/BT
κ
/BY
λµ dxν ∧dxκ ∧dxλ ∧dxµ =−tr /BT
2
/BY
where the cyclicity of the trace and the anti-commutativity of dxµ have been used.
Then dK becomes
dK = tr[/BY
2−/BT
2
/BY −/BY/BT
2+ 2
3{/BY/BT
2+ 1
2 (/BY/BT
2+ /BT
2
/BY )+ /BT
2
/BY }]
= tr /BY
2
as has been claimed. /A3
Lemma 10.4. Let /BT be the gauge potential of an instanton. Then it follows that
∫
S4
tr /BY
2 =−1
3
∫
S3
tr /BT
3. (10.121)


## Page 427

Proof. From Stokes’ theorem, we ﬁnd that
∫
UN
tr /BY
2 =
∫
UN
dK =
∫
S3
K
where UN is deﬁned by (10.114) and S3 = ∂ UN.S i n c e/BY = 0o n S3, we obtain
K = tr[/BT d/BT + 2
3
/BT
3]= tr[/BT (/BY −/BT
2)+ 2
3
/BT
3]=−1
3 tr /BT
3
on S3, from which we ﬁnd that
∫
UN
tr /BY
2 =
∫
S4
tr /BY
2 =−1
3
∫
S3
tr /BT
3
w h e r ew eh a v ea d d e d
∫
US
tr /BY
2 = 0s i n c e/BT
S ≡0. /A3
Note that tr /BY
2 is invariant under the gauge transformation,
tr /BY
2 →tr[g−1
/BY
2g]= tr /BY
2.
Thus, it is reasonable to assume that tr /BY
2 indeed contains a certain amount
of topological information about the bundle, which is independent of particular
connections. Let us consider the gauge ﬁelds (10.117a−c) given before. We ﬁnd:
(a) For g0(x)≡e,w eh a v e/BT = 0o n S3. Since the bundle is trivial we may
take /BT = 0 throughout S4.T h e n/BY = 0, hence
∫
S4
tr /BY
2 =−1
3
∫
S3
tr /BT
3 = 0. (10.122)
Note that this relation is true for any gauge potential which is obtained from
/BT = 0 by smooth gauge transformations, that is for any gauge potential of
the form /BT (x)= g(x)−1 dg (x), x∈S4.
(b) Next consider a gauge potential whose value on S3 is given by (10.117b) as
/BT = 1
r (x4−ixk σ k ) d
( 1
r (x4+ ixl σ l )
)
. (10.123)
A considerable simpliﬁcation is achieved if we note that the integrand tr /BT
3
should not depend on the point on S3 at which it is evaluated since g1 maps
S3 onto SU(2)∼= S3 in a uniform way. So we may evaluate it at the North
Pole (x4 = 1, x= 0) of the unit sphere. We then ﬁnd /BT = iσ k dxk and
tr /BT
3 = i3 tr[σ i σ j σ k] dxi ∧dx j ∧dxk
= 2εijk dxi ∧dx j ∧dxk = 12 dx1∧dx2∧dx3. (10.124)


## Page 428

Next we note that (x1, x2, x3) is a good coordinate system on each
hemisphere of S3 and ω ≡dx1 ∧dx2 ∧dx3 is a volume element at the
North Pole. We ﬁnd∫
S3
tr /BT
3 = 12
∫
S3
ω = 12(2π 2)= 24π 2
where 2π 2 is the area of the unit sphere S3. We ﬁnally obtain
−1
8π 2
∫
S4
tr /BY
2 = 1
24π 2
∫
S3
tr /BT
3 = 1. (10.125)
(c) Next we consider the map gn : S3 →SU(2) given by (10.117c). We
show that g2 = g1g1 has a winding number 2. We divide S3 into the
northern hemisphere U (3)
N and the southern hemisphere U (3)
S . Given a map
g1 : S3 →SU(2), it is always possible to transform g1 smoothly to g1N
which has the winding number one and g1N(x)= e for x ∈U (3)
S . All the
variation takes place on U (3)
N . Similarly, g1 may be deformed to g1S with the
same winding number and g1S(x)= e for x∈U (3)
N . Under this deformation,
g2 becomes
g2(x)→g′
2(x)=
{
g1N(x) x∈U (3)
N
g1S(x) x∈U (3)
S .
For /BT (x)= g′
2(x)−1 dg′
2 (x)( x∈S3),w eh a v e
1
24π 3
∫
S3
tr /BT
3 = 1
24π 2
( ∫
U (3)
N
tr(g−1
1N dg1N)3+
∫
U (3)
S
tr(g−1
1S dg1S)3
)
= 1+ 1= 2. (10.126)
Repeating the same procedure we ﬁnd for /BT (x)= g−1
n dgn that
−1
8π 2
∫
S4
tr /BY
2 = 1
24π 2
∫
S3
tr /BT
3 = n. (10.127)
Collecting these results we establish the following theorem.
Theorem 10.7. The degree of mapping g: S3 →SU(2) is given by
n= 1
24π 2
∫
S3
tr(g−1 dg)3 = 1
2
∫
S4
tr
( i/BY
2π
) 2
. (10.128)
10.6 Berry’s phase
In quantum mechanics, we deﬁne a wavefunction up to the phase. In most
cases, the phase is neglected as an irrelevant factor. Berry (1984) pointed out
that if the system undergoes an adiabatic change, the phase may have observable
consequences.


## Page 429

10.6.1 Derivation of Berry’s phase
Let H (R) be a Hamiltonian which depends on some parameters collectively
written as R. Suppose R changes adiabatically as a function of time, R= R(t).
The Schr¨odinger equation is
H (R(t))|ψ( t)⟩= i d
dt|ψ( t)⟩. (10.129)
We assume the system att= 0i si nt h enth eigenstate,|ψ( 0)⟩=| n, R(0)⟩ where
H (R(0))|n, R(0)⟩= En (R(0))|n, R(0)⟩. (10.130)
What about the state|ψ( t)⟩ at later time t > 0? We assume the system is always
in the nth state, i.e. no level crossing takes place (adiabatic assumption).
Exercise 10.13. A naive guess of|ψ( t)⟩ is
|ψ( t)⟩= exp
[
−i
∫ t
0
dsE n (R(s))
]
|n, R(t)⟩ (10.131)
where the normalized state|n, R(t)⟩ satisﬁes
H (R(t))|n, R(t)⟩= En (R(t))|n, R(t)⟩. (10.132)
Show that (10.131) is not a solution of (10.129).
Since (10.131) does not satisfy the Schr¨ odinger equation, we have to try
other possibilities. Let us introduce an extra-phase η n (t) in the wavefunction:
|ψ( t)⟩= exp
[
iη( t)−i
∫ t
0
En (R(s)) ds
]
|n, R(t)⟩. (10.133)
Inserting (10.133) into the Schr¨odinger equation (10.129), we ﬁnd
H (R(t))|ψ( t)⟩= En (R(t))|ψ( t)⟩
for the LHS (see (10.132)) and
i d
dt|ψ( t)⟩=
[
−dη n (t)
dt + En (R(t))
]
|ψ( t)⟩
+ exp
[
iη n (t)−i
∫
En (R(s)) ds
]
i d
dt|n, R(t)⟩
for the RHS. Equating these, it is found that η n (t) satisifes
dη n (t)
dt = i⟨n, R(t)| d
dt|n, R(t)⟩. (10.134)


## Page 430

By integrating (10.134), we obtain
η n (t)= i
∫ t
0
⟨n, R(s)| d
ds|n, R(s)⟩ds
= i
∫ R(t )
R(0)
⟨n, R|∇R|n, R⟩d R (10.135)
where∇R stands for the gradient in R-space. Note that η n (t) is real since
2R e⟨n, R(s)| d
ds|n, R(s)⟩
=⟨ n, R(s)| d
ds|n, R(s)⟩+
( d
ds⟨n, R(s)|
)
|n, R(s)⟩
= d
ds⟨n, R(s)|n, R(s)⟩= 0.
Suppose the system executes a closed loop in R-space; R(0)= R(T ) for some
T > 0. We then have
η n (T )= i
∫ T
0
⟨n, R(s)| d
ds|n, R(s)⟩ds
= i
∫ R(T )
R(0)
⟨n, R|∇R|n, R⟩d R. (10.136)
Since R(T )= R(0), the last expression seems to vanish. However, the integrand
is not necessarily a total derivative andη n (T ) may fail to vanish. The phaseη n (T )
is called Berry’s phase (Berry 1984).
It was Simon (1983) who ﬁrst recognized the deep geometrical meaning
underlying Berry’s phase. He observed that the origin of Berry’s phase is
attributed to the holonomy in the parame ter space. We shall work out this point
of view following Berry (1984), Simon (1983), Aitchison (1987) and Zumino
(1987).
10.6.2 Berry’s phase, Berry’s conn ection and Berry’s curvature
Let M be a manifold describing t he parameter space and let R = (R
1,..., Rk )
be the local coordinate. At each point R of M, we consider the normalized nth
eigenstate of the Hamiltonian H (R). Since a quantum state |n; R⟩ cannot be
distinguished from eiφ|n; R⟩, a physical state is expressed by an equivalence class
[| R⟩]≡{g|R⟩|g∈U(1)} (10.137)
where we omit the index n since we are interested only in the nth eigenvector
(ﬁgure 10.6). At each point R of M, we have a U(l) degree of freedom and we
have a U(l) bundle P(M, U(1)) over the parameter space M. The projection is
given by π( g|R⟩)= R.


## Page 431

Figure 10.6. The ﬁbre of a quantum mechanical system which depends on adiabatic
parameters R.
Fixing the phase of|R⟩ at each point R∈M amounts to choosing a section.
Let σ( R) =| R⟩ be a local section over a chart U of M. The canonical local
trivialization is given by
φ−1(|R⟩)= (R, e). (10.138)
The ‘right’ action yields
φ−1(|R⟩· g)= (R, e)g= (R, g). (10.139)
Now that the bundle structure is deﬁned, we provide it with a connection.
Let us deﬁne Berry’s connection by
/BT = /BT
µ dRµ ≡⟨R|(d|R⟩)=−(d⟨R|)|R⟩ (10.140)
where d = (∂/∂ Rµ)dRµ is the exterior derivative in R-space. Note that /BT is
anti-Hermitian since
0= d(⟨R|R⟩)= (d⟨R|)|R⟩+⟨ R|d|R⟩=⟨ R|d|R⟩∗+⟨ R|d|R⟩.
To see (10.140) is indeed a local form of a connection, we have to check the
compatibility condition. Let Ui and Uj be overlapping charts of M and let
σ i (R) =| R⟩i and σ j (R) =| R⟩j be the respective local sections. They are
related by the transition function as|R⟩j =| R⟩i tij (R). We then ﬁnd that
/BT
j (R)= j⟨R|d|R⟩j = tij (R)−1
i⟨R|[d|R⟩i tij (R)+| R⟩dtij (R)]
= /BT
i (R)+ tij (R)−1dtij (R). (10.141)
The set of one-forms {/BT
i} satisfying (10.141) deﬁnes an Ehresmann connection
on P(M, U(1)).


## Page 432

The ﬁeld strength /BY of /BT is called Berry’s curvature and is given by
/BY = d/BT = (d⟨R|)∧(d|R⟩)=
( ∂⟨R|
∂ Rµ
)( ∂|R⟩
∂ Rν
)
dRµ∧dRν . (10.142)
After an example from atomic physics, we shall clarify how this geometrical
structure is reﬂected in Berry’s phase.
Example 10.7. Let us consider a quantum mechanical system which contains
‘fast’ degrees of freedom r and ‘slow’ degrees of freedom R. For example, we
may imagine an electron moving under the potential of slowly vibrating ions.
Suppose the Hamiltonian is given by
H= p2
2m+ P2
2M + V (r; R) (10.143)
where p( P) is the momentum canonical conjugate to r(R).A s a ﬁ r s t
approximation, we may consider the slow degrees of freedom are ‘frozen’ at some
value R and consider an instantaneous sub-Hamiltonian
h(R)= p2
2m+ V (r; R) (10.144)
and the eigenvalue problem
h(R)|R⟩= ϵn (R)|R⟩ (10.145)
where|R⟩ stands for the nth eigenvector|n; R⟩ of the ‘fast’ degrees of freedom.
We assume that the eigenvalue is isolated and non-degenerate. Berry’s connection
is /BT (R)=⟨ R|d|R⟩, while the curvature is /BY = (d⟨R|)∧(d|R⟩).
It is interesting to see how the fast degrees of freedom affect the slow degrees
of freedom. We assume the total wavefunction is written in the form
/Psi1(r; R)= /Phi1(R)|R⟩ (10.146)
and ﬁnd the ‘effective’ Schr¨ odinger equation which /Phi1(R), the wavefunction
of the ‘slow’ degrees of freedom, satisﬁes. The eigenvalue problem of the
Hamiltonian (10.143) is
H /Psi1(r; R)=− 1
2M[∇2
R/Phi1(R)|R⟩+ 2∇R/Phi1(R)·∇R|R⟩+ /Phi1(R)∇2
R
|R⟩]
−/Phi1(R) 1
2m∇2
r|R⟩+ /Phi1(R)V (r; R)|R⟩
= En (R)/Phi1(R)|R⟩.
If we multiply ⟨R| on the left and use the Schr¨ odinger equation (10.145), this
equation becomes
−1
2M[∇2
R/Phi1(R)+ 2∇R/Phi1(R)·⟨ R|∇R|R⟩+ /Phi1(R)(⟨R|∇R|R⟩)2]
+ ϵn (R)/Phi1(R)= En (R)/Phi1(R) (10.147)


## Page 433

where we have employed the Born–Oppenheimer approximation, in which all the
matrix elements except the diagonal ones are neglected,
⟨n; R|∇R|n′; R⟩= 0 n′ ̸= n. (10.148)
Now the effective Hamiltonian for|/Phi1(R)⟩ is given by
Heff(n)≡−1
2M
( ∂
∂ Rµ + /BT
µ(R)
) 2
+ εn (R) (10.149)
where /BT
µ is a component of Berry’s connection,
/BT
µ(R)=⟨ R| ∂
∂ Rµ|R⟩. (10.150)
It is remarkable that the fast degrees of freedom have induced a vector potential
coupled to the slow degrees of freedom. Note also that the eigenvalue εn (R)
behaves as a potential energy in Heff. This ‘spontaneous creation’ of the gauge
symmetry reﬂects the phase degree of freedom of the wavefunction|R⟩.
The Schr¨odinger equation describing the adiabatic change is
H (R(t))|R(t), t⟩= i d
dt|R(t), t⟩ (10.151a)
w h e r ew en o t et h a t|R(t), t⟩ has an explicit t-dependence as well as an implicit
one through R(t). Berry assumes that
|R(t), t⟩= exp
(
−i
∫ t
0
En (t) dt
)
eiη( t )|R(t)⟩ (10.152a)
where|R⟩ is an instantaneous normalized eigenstate of H (R),
/C0 (R)|R⟩= En (R)|R⟩⟨ R|R⟩= 1. (10.153)
The ﬁrst exponential is the ordinary dynamical phase while the second one is
Berry’s phase. It is convenient for our purpose to deﬁne an operator
/C0 (R)≡H (R)−En (R) (10.154)
to dispose of the dynamical phase. The state |R⟩ is the zero-energy eigenstate of
/C0 (R): /C0 (R)|R⟩= 0. The solution of the modiﬁed Schr¨odinger equation,
/C0 (R)|R(t), t⟩= i d
dt|R(t), t⟩ (10.151b)
is then given by
|R(t), t⟩= eiη( t )|R(t)⟩.( 10.152b)


## Page 434

We found in (10.136) that η is given by
η( t)= i
∫ t
0
ds dRµ
ds ⟨R(s)| ∂
∂ Rµ|R(s)⟩= i
∫ R(t )
R(0)
⟨R|d|R⟩. (10.155)
We show that Berry’s phase is a holonomy associated with the connection
(10.140) on P(M, U(1)). Take a section σ( R)=| R⟩ over a chart U of M.L e t
R:[ 0, 1]→ M be a loop in U.2 We write a horizontal lift of R(t) with respect
to the connection (10.140) as
˜R(t)= σ( R(t))g(R(t)) (10.156)
where g(R(0)) is taken to be the unit element of U(1). The group element g(t)
satisﬁes (10.13b),
dg(t)
dt g(t)−1 =−/BT
( d
dt
)
=−⟨R(t)| d
dt|R(t)⟩ (10.157)
where g(t) stands for g(R(t)).F r o mg(t)= exp(iη( t)), we obtain
idη( t)
dt =−⟨R(t)| d
dt|R(t)⟩
which is easily integrated to yield
η( 1)= i
∫ 1
0
⟨R(s)| d
ds|R(s)⟩ ds= i
∮
⟨R|d|R⟩. (10.158)
Let us note that R(0) = R(1), hence |R(0)⟩=| R(1)⟩. Then exp [iη( 1)] is
regarded as a holonomy (ﬁgure 10.7)
˜R(1)= exp
(
−
∮
⟨R|d|R⟩
)
·| R(0)⟩. (10.159a)
Exercise 10.14. Let S b eas u r f a c ei nM, which is bounded by the loop R(t).
Show that
˜R(1)= exp
(
−
∮
S
/BY
)
·| R(0)⟩ (10.159b)
where /BY is given by (10.142).
Example 10.8. Let us consider a spin- 1
2 particle in a magnetic ﬁeld with the
Hamiltonian
H (R)= R· σ=
( R3 R1−iR2
R1+ iR2 −R3
)
. (10.160)
2 We shall be a little sloppy in our notation.


## Page 435

Figure 10.7. If the parameter changes adiabatically along a loop R(t), the state with initial
condition|R(0)⟩ becomes|˜R(1)⟩ which is different from|R(0)⟩ in general. The difference
is the holonomy and is identiﬁed with Berry’s phase.
The parameter R corresponds to the applied magnetic ﬁeld. This is a two-level
system taking eigenvalues ±| R|. Let us consider the eigenvalue R =+ |R|.
According to the prescription just described, we introduce a Hamiltonian/C0 (R)≡
H (R)−|R| and consider the zero-energy eigenstate of /C0 (R) given by
|R⟩N =[ 2R(R+ R3)]−1/2
( R+ R3
R1+ iR2
)
. (10.161)
The gauge potential is obtained after a straightforward but tedious calculation as
/BT
N = N⟨R|d|R⟩N =−i R2 dR1−R1 dR2
2R(R+ R3) . (10.162)
T h eﬁ e l ds t r e n g t hi s
/BY = d/BT = i
2
R1 dR2∧dR3+ R2 dR3∧dR1+ R3 dR1∧dR2
R3 . (10.163)
So far we have assumed that the state |R⟩ is isolated. However, this
assumption breaks down if R= 0, in which case two eigenstates are degenerate.
Surprisingly, this singularity behaves like a magnetic monopole in R-space. To
see this, we introduce polar coordinates θ and φ in R-space,
R1 = R sin θ cos φ R2 = R sin θ sin φ R3 = R cos θ.


## Page 436

The state (10.161) is expressed as
|R⟩N =
( cos(θ/ 2)
eiφ sin(θ/ 2)
)
. (10.164)
This state is singular at θ = π , reﬂecting that|R⟩N is not deﬁned for R3 =−R.
Consider another eigenvector
|R⟩S ≡e−iφ|R⟩N =
(
e−iφ cos(θ/ 2)
sin(θ/ 2)
)
=[ 2R(R−R3)]−1/2
( R1−iR2
R−R3
)
(10.165)
with the same eigenvalue. This eigenvector is singular at θ = 0, that is at
R3 = R. Corresponding to these vectors, we have Berry’s gauge potentials in
polar coordinates,
/BT
N =1
2 i(1−cos θ) dφθ ̸= π (10.166a)
/BT
S =−1
2 i(1+ cos θ) dφθ ̸= 0. (10.166b)
They are related by the gauge transformation,
/BT
S = /BT
N−idφ = /BT
N+ eiφ de−iφ (10.167)
where g(π/ 2,φ ) = exp(−iφ) is identiﬁed with the transition function tNS.
Equation (10.166) is simply the vector potential of the Wu–Yang monopole of
strength −1
2 , see sections 1.9 and 10.5. The total ﬂux of the monopole is
/Phi1= 4π(−1
2 )=−2π .
The analogy between the present problem and the magnetic monopole is
evident by now. If we ﬁx the amplitude R of the magnetic ﬁeld, the restricted
parameter space is S2. At each point R of S2, the state has a phase degree
of freedom. Thus, we are dealing with a U(1) bundle P(S2, U(1)), which also
describes a magnetic monopole. For each choice of the parameters R,w eh a v e
a ﬁbre corresponding to the nth eigenstate|n; R⟩.T h e ﬁ b r e a tR consists of the
equivalence class [| R⟩] deﬁned by (10.137). The projection π maps a state to
the parameter on which it is deﬁned: π : eiα|R⟩→ R∈S2. As we have seen,
this bundle is non-trivial since it cannot be described by a single connection. The
non-triviality of the bundle implies the existence of a monopole at the origin. Note
that R = 0 (that is, B = 0) is a singular point at which all the eigenvalues are
degenerate.
Next we turn to the problem of holonomy. Take a standard point R(0)
on S2 and choose a vector |R(0)⟩. We choose a loop R(t) on S2 and execute
a parallel transportation of |R(0)⟩ along R(t), after which it comes back as
a vector exp [iη( 1)]| R(0)⟩. The additional phase η represents the holonomy


## Page 437

π−1(R) →π−1(R) and corresponds to Berry’s phase. From (10.158), η( 1)
is given by
η( 1)= i
∮
R
/BT = i
∫
S
/BY (10.168)
where /BY = d/BT is the ﬁeld strength and S is the surface bounded by the loop R(t).
It follows from (10.168) that Berry’s phase η( 1) represents the ‘magnetic ﬂux’
through the area S.
Exercise 10.15. Use (10.165) to show that
/BT
S = i
2
R2 dR1−R1 dR2
R(R−R3) . (10.169)
Show also that
dφ =−R2 dR1−R1 dR2
(R+ R3)(R−R3) . (10.170)
Observe that dφ is singular at R3 =± R.
Problems
10.1 Consider a two-dimensional plane M with coordinate R and a wavefunction
ψ which depends on R adiabatically as ψ = ψ( r, R).L e t R :[ 0, 1]→ M
be a loop in M and suppose ψ( r, R(1))=−ψ( r, R(0)), that is the phase of ψ
changes by π after an adiabatic change along the loop. Show that there is a point
within the loop at which the adiabatic assumption breaks down. See Longuet-
Higgins (1975).


## Page 438

11
CHARACTERISTIC CLASSES
Given a ﬁbre F, a structure group G and a base space M, we may construct
many ﬁbre bundles over M, depending on the choice of the transition functions.
Natural questions we may ask ourselves are how many bundles there are over M
with given F and G, and how much they differ from a trivial bundle M× F.F o r
example, we observed in section 10.5 that an SU (2) bundle over S4 is classiﬁed
by the homotopy group π 3(SU(2)) ∼=
/CI . The number n ∈/CI tells us how the
transition functions twist the local pi eces of the bundle when glued together.
We have also observed that this homotopy group is evaluated by integrating
tr /BY
2 ∈H 4(S4) over S4, see theorem 10.7.
Characteristic classes are subsets of the cohomology classes of the base
space and measure the non-triviality or twisting of a bundle. In this sense, they
are obstructions which prevent a bundle from being a trivial bundle. Most of the
characteristic classes are given by the de Rham cohomology classes. Besides their
importance in classiﬁcations of ﬁbre bundles, characteristic classes play central
roles in index theorems.
Here we follow Alvalez-Gaum´e and Ginsparg (1984), Eguchi et al (1980),
Gilkey (1995) and Wells (1980). See Bott and Tu (1982), Milnor and Stasheff
(1974) for more mathematical expositions.
11.1 Invariant polynomials and the Chern–Weil homomorphism
We give here a brief summary of the de Rham cohomology group (see chapter 6
for details). Let M be an m-dimensional manifold. An r-form ω ∈/Omega1
r (M) is
closed if dω = 0a n dexact if ω = dη for some η ∈/Omega1r−1(M). The set of closedr-
forms is denoted by Zr (M) and the set of exactr-forms by Br (M).S i n c ed2 = 0,
it follows that Zr (M)⊃Br (M).W ed e ﬁ n et h erth de Rham cohomology group
Hr (M) by
Hr (M)≡Zr (M)/Br (M).
In Hr (M), two closed r-forms ω 1 and ω 2 are identiﬁed if ω 1−ω 2 = dη for some
η ∈/Omega1r−1(M).L e t M be an m-dimensional manifold. The formal sum
H∗(M)≡H 0(M)⊕H 1(M)⊕···⊕H m (M)
is the cohomology ring with the product ∧: H∗(M)× H∗(M) → H∗(M)
induced by ∧: H p(M)× H q (M) → H p+q (M).L e t f : M → N be a


## Page 439

smooth map. The pullback f∗: /Omega1r (N) →/Omega1r (M) naturally induces a linear
map f∗: Hr (N) →Hr (M) since f∗commutes with the exterior derivative:
f∗dω = d f∗ω . The pullback f∗preserves the algebraic structure of the
cohomology ring since f∗(ω ∧η) = f∗ω ∧f∗η .
11.1.1 Invariant polynomials
Let M(k, /BV ) be the set of complex k× k matrices. Let Sr (M(k, /BV )) denote
the vector space of symmetric r-linear /BV -valued functions on M(k, /BV ).I n o t h e r
words, a map
˜P:
r
⊗M(k, /BV )→/BV
is an element of Sr (M(k, /BV )) if it satisﬁes, in addition to linearity in each entry,
the symmetry
˜P(a1,..., ai ,..., a j ,..., ar )
= ˜P(a1,..., a j ,..., ai ,..., ar ) 1≤i, j≤r (11.1)
where ap ∈GL(k, /BV ).L e t
S∗(M(k, /BV ))≡
∞
⊕
r=0
Sr (M(k, /BV ))
denote the formal sum of symmetric multilinear /BV -valued functions. We deﬁne a
product of ˜P∈Sp (M(k, /BV )) and ˜Q∈Sq (M(k, /BV )) by
˜P ˜Q(X1,..., X p+q )
= 1
(p+ q)!
∑
P
˜P(X P(1),..., X P(p))˜Q(X P(p+1),..., X P(p+q)) (11.2)
where P is the permutation of (1,..., p+ q). S∗(M(k, /BV )) is an algebra with
this multiplication.
Let G be a matrix group and /CV its Lie algebra. In practice, we take
G = GL(k, /BV ), U(k) or SU (k).T h e L i e a l g e b r a/CV is a subspace of M(k, /BV )
and we may consider the restrictions Sr (/CV ) and S∗(/CV )≡⨁
r≥0 Sr (/CV ). ˜P∈Sr (/CV )
is said to be invariant if, for any g∈G and Ai ∈/CV , ˜P satisﬁes
˜P(Adg A1,..., Adg Ar )= ˜P(A1,..., Ar ) (11.3)
where Adg Ai = g−1 Ai g. For example,
˜P(A1, A2,..., Ar )= str(A1, A2,..., Ar )
≡1
r!
∑
P
tr(AP(1), AP(2),..., AP(r)) (11.4)


## Page 440

is symmetric, r-linear and invariant, where ‘str’ stands for thesymmetrized trace
and is deﬁned by the last equality. The set of G-invariant members of Sr (/CV ) is
denoted by Ir (G). Note that /CV
1 = /CV
2 does not necessarily imply Ir (G1) =
Ir (G2). The product deﬁned by (11.2) naturally induces a multiplication
I p (G)⊗Iq (G)→I p+q (G). (11.5)
The sum I∗(G)≡⨂
r≥0 Ir (G) is an algebra with this product.
Take ˜P∈Ir (G). The shorthand notation for the diagonal combination is
P(A)≡˜P(A, A,..., A
 
 
r
) A∈/CV . (11.6)
Clearly, P is a polynomial of degree r and called an invariant polynomial. P is
also Ad G-invariant,
P(Adg A)= P(g−1 Ag)= P(A) A∈/CV , g∈G. (11.7)
For example, tr(Ar ) is an invariant polynomial obtained from (11.4). In general,
an invariant polynomial may be written in terms of a sum of products of Pr ≡
tr(Ar ).
Conversely, any invariant polynomial P deﬁnes an invariant and symmetric
r-linear form ˜P by expanding P(t1 A1+···+ tr Ar ) as a polynomial in ti .T h e n
1/r! times the coefﬁcient of t1t2··· tr is invariant and symmetric by construction
and is called thepolarization of P.T a k eP(A)≡tr(A3), for example. Following
the previous prescription, we expand tr(t1 A1+ t2 A2+ t3 A3)3 in powers of t1, t2
and t3. The coefﬁcient of t1t2t3 is
tr(A1 A2 A3+ A1 A3 A2+ A2 A1 A3+ A2 A3 A1+ A3 A1 A2+ A3 A2 A1)
= 3t r(A1 A2 A3+ A2 A1 A3)
where the cyclicity of the trace has been used. The polarization is
˜P(A1, A2, A3)= 1
2 tr(A1 A2 A3+ A2 A1 A3)= str(A1, A2, A3).
In the previous chapter, we introduced the local gauge potential/BT = /BT
µ dxµ
and the ﬁeld strength /BY = 1
2
/BY
µν dxµ ∧dxν on a principal bundle. We have
shown that these geometrical objects describe the associated vector bundles as
well. Since the set of connections {/BT
i} describes the twisting of a ﬁbre bundle,
the non-triviality of a principal bundle is equally shared by its associated bundle.
In fact, if (10.57) is employed as a deﬁnition of the local connection in a vector
bundle, it can be deﬁned even without reference to the principal bundle with which
it is originally associated. Later, we encounter situations in which use of vector
bundles is essential (the Whitney sum bundle, the splitting principle and so on).


## Page 441

Let P(M, /BV ) be a principal bundle. We extend the domain of invariant
polynomials from /CV to /CV -valued p-forms on M.F o r Ai η i (Ai ∈/CV ,η ∈
/Omega1pi (M); 1≤i≤r ),w ed e ﬁ n e
˜P(A1η 1,..., Ar ηr )≡η 1∧... ∧ηr ˜P(A1,..., Ar ). (11.8)
For example, corresponding to (11.4), we have
str(A1η 1,..., Ar ηr )= η 1∧... ∧ηr str(A1,..., Ar ).
The diagonal combination is
P(Aη) ≡η∧... ∧η
 
 
r
P(A). (11.9)
The action ˜P or P on general elements is given by the r-linearity. In particular,
we are interested in the invariant polynomial of the form P(/BY ) in the following.
The importance of invariant polynomials resides in the following fundamental
theorem.
Theorem 11.1. (Chern–Weil theorem)L e t P be an invariant polynomial. Then
P(/BY ) satisﬁes
(a) d P(/BY )= 0.
(b) Let /BY and /BY
′ be curvature two-forms corresponding to different
connections /BT and /BT
′. Then the difference P(/BY
′)−P(/BY ) is exact.
Proof. (a) It is sufﬁcient to prove that d P(/BY ) = 0 for an invariant polynomial
Pr (/BY ) which is homogeneous of degree r, since any invariant polynomial can be
decomposed into homogeneous polynomials. First consider the identity,
˜Pr (g−1
t X1gt ,..., g−1
t Xr gt )= ˜Pr (X1,..., Xr )
where gt ≡exp(tX ) and X, Xi ∈/CV . By putting t = 0 after differentiation with
respect to t, we obtain
r∑
i=1
˜Pr (X1,..., [Xi , X],..., Xr )= 0. (11.10)
Next, let A be a /CV -valued p-form and /Omega1i be a /CV -valued pi -form (1 ≤i ≤r ).
Without loss of generality, we may takeA= Xη and /Omega1i = Xi η i where X, Xi ∈/CV
and η( η i ) is a p-form ( pi -form). Deﬁne
[/Omega1i , A]≡η i ∧η[Xi , X]
= Xi X (η i ∧η)−(−1)ppi XX i (η∧η i ). (11.11)


## Page 442

Let us note that
˜Pr (/Omega11,..., [/Omega1i , A],...,/Omega1r )
= η 1∧... ∧η i ∧η∧... ∧ηr ˜Pr (X1,..., Xi X,..., Xr )
−(−1)p·pi η 1∧... ∧η∧η i ∧...
... ∧ηr ˜Pr (X1,..., XX i ,..., Xr )
= η∧η 1∧... ∧ηr (−1)p(p1+···+pi )
× ˜Pr (X1,..., [Xi , X],..., Xr ).
From this and (11.10), we ﬁnd
r∑
i=1
(−1)p(p1+···+pi ) ˜Pr (/Omega11,..., [/Omega1i , A],...,/Omega1r )= 0. (11.12)
Next, consider the derivative,
d˜Pr (/Omega11,...,/Omega1r )= d(η 1∧... ∧ηr )˜Pr (X1,..., Xr )
=
r∑
i=1
(−1)(p1+···+pi−1 )(η 1∧... ∧dη i ∧... ∧ηr )
× ˜Pr (X1,..., Xi ,..., Xr )
=
r∑
i=1
(−1)(p1+···+pi−1 ) ˜Pr (/Omega11,..., d/Omega1i ,...,/Omega1r ). (11.13)
Let A= /BT and /Omega1i = /BY in (11.12) and (11.13) for which p= 1a n d pi = 2. By
adding 0 of the form (11.12) to (11.13) we have
d˜Pr (/BY ,..., /BY )
=
r∑
i=1
[˜Pr (/BY ,..., d/BY ,..., /BY )+ ˜Pr (/BY ,..., [/BT , /BY ],..., /BY )]
=
r∑
i=1
˜Pr (/BY ,..., /BW /BY ,..., /BY )= 0 (11.14)
since /BW /BY = d/BY +[ /BT , /BY ]= 0 (the Bianchi identity). We have proved
dPr (/BY )= d˜Pr (/BY ,..., /BY )= 0.
(b) Let /BT and /BT
′ be two connections on E and let /BY and /BY
′ be the respective
ﬁeld strengths. Deﬁne an interpolating gauge potential /BT
t ,b y
/BT
t ≡/BT + tθθ ≡(/BT
′−/BT ) 0≤t≤1 (11.15)


## Page 443

so that /BT
0 = /BT and /BT
1 = /BT
′. The corresponding ﬁeld strength is
/BY
t ≡d/BT
t + /BT
t ∧/BT
t = /BY + t/BW θ+ t2θ 2 (11.16)
where /BW θ = dθ+[ /BT ,θ]= dθ+ /BT ∧θ+ θ∧/BT . We ﬁrst note that
Pr (/BY
′)−Pr (/BY )= Pr (/BY
1)−Pr (/BY
0)=
∫ 1
0
dt d
dt Pr (/BY
t )
= r
∫ 1
0
dt ˜Pr
( d
dt
/BY
t , /BY
t ,..., /BY
t
)
. (11.17)
From (11.16), we ﬁnd that
d
dt Pr (/BY
t )= r ˜Pr (/BW θ+ 2tθ 2, /BY
t ,..., /BY
t )
= r ˜Pr (/BW θ, /BY
t ,..., /BY
t )+ 2rt ˜Pr (θ 2, /BY
t ,..., /BY
t ). (11.18)
Note also that
/BW /BY
t = d/BY
t +[ /BT , /BY
t]=−[/BT
t , /BY
t]+[ /BT , /BY
t]= t[/BY
t ,θ]
where use has been made of the Bianchi identity /BW
t
/BY
t = d/BY
t+[ /BT
t , /BY
t]= 0. [/BW
is the covariant derivative with respect to /BT while /BW
t is that with respect to /BT
t .]
It then follows that
d[˜Pr (θ, /BY
t ,..., /BY
t )]
= ˜Pr (dθ, /BY
t ,..., /BY
t )−(r−1)˜Pr (θ, d/BY
t ,..., /BY
t )
= ˜Pr (/BW θ, /BY
t ,..., /BY
t )−(r−1)˜Pr (θ, /BW /BY
t ,..., /BY
t )
= ˜Pr (/BW θ, /BY
t ,..., /BY
t )−(r−1)t ˜Pr (θ,[/BY
t ,θ], /BY
t ,..., /BY
t ) (11.19)
where we have added a 0 of the form (11.12) to change d to /BW .I f w e t a k e
/Omega11 = A= θ,/Omega12 =···= /Omega1m = /BY
t in (11.12), we have
2˜Pr (θ 2, /BY
t ,..., /BY
t )+ (r−1)˜Pr (θ,[/BY
t ,θ], /BY
t ,..., /BY
t )= 0.
From (11.18), (11.19) and the previous identity, we obtain
d
dt Pr (/BY
t )= rd[˜Pr (θ, /BY
t ,..., /BY
t )].
We ﬁnally ﬁnd that
Pr (/BY
′)−Pr (/BY )= d
[
r
∫ 1
0
˜Pr (/BT
′−/BT , /BY
t ,..., /BY
t ) dt
]
. (11.20)
This shows that Pr (/BY
′) differs from Pr (/BY ) by an exact form. /A3


## Page 444

We deﬁne the transgression TP r (/BT
′, /BT ) of Pr by
TP r (/BT
′, /BT )≡r
∫ 1
0
dt ˜Pr (/BT
′−/BT , /BY
t ,..., /BY
t ) (11.21)
where ˜Pr is the polarization of Pr . Transgressions will play an important role
when we discuss Chern–Simons forms in section 11.5. Let dim M = m.S i n c e
Pm (/BY
′) differs from Pm (/BY ) by an exact form, their integrals over a manifold M
without a boundary should be the same:
∫
M
Pm (/BY
′)−
∫
M
Pm (/BY )=
∫
M
dTP m (/BT
′, /BT )=
∫
∂ M
Pm (/BT
′, /BT )= 0. (11.22)
As has been proved, an invariant polynomial is closed and, in general, non-
trivial. Accordingly, it deﬁnes a cohomology class of M. Theorem 11.1(b)
ensures that this cohomology class is independent of the gauge potential chosen.
The cohomology class thus deﬁned is called the characteristic class .T h e
characteristic class deﬁned by an invariant polynomial P is denoted by χ E (P)
where E is a ﬁbre bundle on which connections and curvatures are deﬁned.
[Remark: Since a principal bundle and its associated bundles share the same
gauge potentials and ﬁeld strengths, the Chern–Weil theorem applies equally to
both bundles. Accordingly, E can be either a principal bundle or a vector bundle.]
Theorem 11.2. Let P be an invariant polynomial inI∗(G) and E be a ﬁbre bundle
over M with structure group G.
(a) The map
χ E : I∗(G)→H∗(M) (11.23)
deﬁned by P→χ E (P) is a homomorphism (Weil homomorphism).
(b) Let f : N→M be a differentiable map. For the pullback bundle f∗E of
E,w eh a v et h es o - c a l l e dnaturality
χ f∗E = f∗χ E . (11.24)
Proof.( a )T a k ePr ∈Ir (G) and Ps ∈Is (G). If we write /BY = /BY
α Tα ,w eh a v e
(Pr Ps )(/BY )= /BY
α 1 ∧... ∧/BY
α r ∧/BY
β 1 ∧... ∧/BY
β s
× 1
(r+ s)!
˜Pr (Tα 1 ,..., Tα r )˜Pn (Tβ 1 ,..., Tβ s )
= Pr (/BY )∧Ps (/BY ).
Then (a) follows since Pr (/BY ), Ps (/BY )∈H∗(M).
(b) Let /BT be a gauge potential of E and /BY = d/BT + /BT ∧/BT . It is easy to verify
that the pullback f∗
/BT is a connection in f∗E. In fact, let /BT
i and /BT
j be local
connections in overlapping charts Ui and Uj of M.I f tij is a transition function


## Page 445

on Ui ∩Uj , the transition function on f∗E is given by f∗tij = tij ◦f .T h e
pullback f∗
/BT
i and f∗
/BT
j are related as
f∗
/BT
j = f∗(t−1
ij
/BT
i tij + t−1
ij dtij )
= ( f∗t−1
ij )( f∗
/BT
i )( f∗tij )+ ( f∗t−1
ij )(d f∗tij ).
This shows that f∗
/BT is, indeed, a local connection on f∗E. The corresponding
ﬁeld strength on f∗E is
d( f∗
/BT
i )+ f∗
/BT
i ∧f∗
/BT
i = f∗[d/BT
i + /BT
i ∧/BT
i]= f∗
/BY
i .
Hence, f∗P(/BY
i )= P( f∗
/BY
i ),t h a ti sf∗χ E (P)= χ f∗E (P). /A3
Corollary 11.1. Characteristic classes of a trivial bundle are trivial.
Proof.L e t E
π
−→M be a trivial bundle. Since E is trivial, there exists a map
f : M →{ p} such that E = f∗E0 where E0 −→ {p} is a bundle over a
point p. All the de Rham cohomology groups of a point are trivial and so are the
characteristic classes. Theorem 11.2(b) ensures that the characteristic classes χ E
(= f∗χ E0 ) of E are also trivial. /A3
11.2 Chern classes
11.2.1 Deﬁnitions
Let E
π
−→M be a complex vector bundle whose ﬁbre is /BV
k . The structure group
G is a subgroup of GL (k, /BV ), and the gauge potential /BT and the ﬁeld strength /BY
take their values in /CV .D e ﬁ n et h etotal Chern class by
c(/BY )≡det
(
I+ i/BY
2π
)
. (11.25)
Since /BY is a two-form, c(/BY ) is a direct sum of forms of even degrees,
c(/BY )= 1+ c1(/BY )+ c2(/BY )+··· (11.26)
where cj (/BY ) ∈/Omega12 j (M) is called the jth Chern class.I n a n m-dimensional
manifold M,t h eC h e r nc l a s scj (/BY ) with 2 j > m vanishes trivially. Irrespective
of dim M, the series terminates at ck (/BY )= det(i/BY /2π) and cj (/BY )= 0f o r j > k.
Since cj (/BY ) is closed, it deﬁnes an element[cj (/BY )] of H 2 j (M).
Example 11.1. Let F be a complex vector bundle with ﬁbre /BV
2 over M,w h e r e
G = SU(2) and dim M = 4. If we write the ﬁeld /BY = /BY
α (σ α /2i), /BY
α =
1
2
/BY
α µν dxµ∧dxν ,w eh a v e
c(/BY )= det
(
I+ i
2π
/BY
α (σ α /2i)
)


## Page 446

= det
( 1+ (i/2π) ( /BY
3/2i)( i/2π) ( /BY
1−i/BY
2)/2i
(i/2π) ( /BY
1+ i/BY
2)/2i 1 −(i/2π) ( /BY
3/2i)
)
= 1+ 1
4
( i
2π
) 2 (
/BY
3∧/BY
3+ /BY
1∧/BY
1+ /BY
2∧/BY
2
)
. (11.27)
Individual Chern classes are
c0(/BY )= 1
c1(/BY )= 0
c2(/BY )=
( i
2π
) 2 ∑
/BY
α ∧/BY
α
4 = det
( i/BY
2π
)
.
(11.28)
Higher Chern classes vanish identically.
For general ﬁbre bundles, it is rather cumbersome to compute the Chern
classes by expanding the determinant and it is desirable to ﬁnd a formula which
yields them more easily. This is done by diagonalizing the curvature form.
The matrix form /BY is diagonalized by an appropriate matrix g ∈GL(k, /BV ) as
g−1(i/BY /2π) g= diag(x1,..., xk ),w h e r exi is a two-form. This diagonal matrix
will be denoted by A. For example, if G= SU(k), the generators are chosen to be
anti-Hermitian and a Hermitian matrix i/BY /2π can be diagonalized by g∈SU(k).
We have
det(I+ A)= det[diag(1+ x1, 1+ x2,..., 1+ xk )]
=
k∏
j=1
(1+ x j )
= 1+ (x1+···+ xk )+ (x1x2+···+ xk−1xk )
+···+ (x1x2+···+ xk )
= 1+ tr A+ 1
2{(tr A)2−tr A2}+···+ det A. (11.29)
Observe that each term of (11.29) is an elementary symmetric function of{x j},
S0(x j )≡1
S1(x j )≡
k∑
j=1
x j
S2(x j )≡
∑
i< j
xi x j
..
.
S
k (x j )≡x1x2 ... xk .
(11.30)


## Page 447

Since det (I + A) is an invariant polynomial, we have P(/BY ) = P(g/BY g−1) =
P(2π A/i), see (11.7). Accordingly, we have, for general /BY ,
c0(/BY )= 1
c1(/BY )= tr A= tr
(
g i/BY
2π g−1
)
= i
2π tr /BY
c2(/BY )= 1
2[(tr /BT )2−tr /BT
2]= 1
2 (i/2π) 2[tr /BY ∧tr /BY −tr(/BY ∧/BY )]
...
ck (/BY )= det A= (i/2π) k det /BY .
(11.31)
Example 11.1 is easily veriﬁed from (11.31). [Note that the Pauli matrices (in
general, any element of the Lie algebra /D7/D9 (n) of SU(n)) are traceless, tr σ α = 0.]
11.2.2 Properties of Chern classes
We will deal with several vector bundles in the following. We often denote the
Chern class of a vector bundle E by c(E). If the speciﬁcation of the curvature is
required, we write c(/BY
E ).
Theorem 11.3. Let E
π
−→M be a vector bundle with G = GL(k, /BV ) and
F= /BV
k .
(a) (Naturality) Let f : N→M be a smooth map. Then
c( f∗E)= f∗c(E). (11.32)
(b) Let F
π′
−→M be another vector bundle with F= /BV
l and G= GL(l, /BV ).
The total Chern class of a Whitney sum bundle E⊕F is
c(E⊕F)= c(E)∧c(F). (11.33)
Proof.
(a) The naturality follows directly from theorem 11.2(a). Since the curvature
of f∗E is /BY
f∗E = f∗
/BY
E , the total Chern class of f∗E is
c( f∗E)= det
(
I+ i
2π
/BY
f∗E
)
= det
(
I+ i
2π f∗
/BY
E
)
= f∗det
(
I+ i
2π
/BY
E
)
= f∗c(E).
(b) Let us consider the Chern polynomial of a matrix
A=
( B 0
0 C
)
.


## Page 448

[Note that the curvature of a Whitney sum bundle is block diagonal:/BY
E⊕F =
diag(/BY
E , /BY
F ).] We ﬁnd that
det
(
I+ iA
2π
)
= det
( I+ iB
2π 0
0 I+ iC
2π
)
= det
(
I+ iB
2π
)
det
(
I+ iC
2π
)
= c(B)c(C).
This relation remains true whenB and C are replaced by /BY
E and /BY
F , namely
c(/BY
E⊕F )= c(/BY
E )∧c(/BY
F )
which proves (11.33). /A3
Exercise 11.1. (a) Let E be a trivial bundle. Use corollary 11.1 to show that
c(E)= 1. (11.34)
(b) Let E be a vector bundle such that E = E1 ⊕E2 where E1 is a vector
bundle of dimension k1 and E2 is a trivial vector bundle of dimension k2.S h o w
that
ci (E)= 0 k1+ 1≤i≤k1+ k2. (11.35)
11.2.3 Splitting principle
Let E be a Whitney sum of n complex line bundles,
E= L1⊕L2⊕···⊕Ln . (11.36)
From (11.33), we have
c(E)= c(L1)c(L2)... c(Ln ) (11.37)
where the product is the exterior product of differential forms. Since cr (L)= 0
for r≥2, we write
c(Li )= 1+ c1(Li )≡1+ xi . (11.38)
Then (11.37) becomes
c(E)=
n∏
i=1
(1+ xi ). (11.39)
Comparing this with (11.29), we ﬁnd that the Chern class of an n-dimensional
vector bundle E is identical with that of the Whitney sum of n complex line
bundles. Although E is not a Whitney sum of complex line bundles in general,
as far as the Chern classes are concerned, we may pretend that this is the case.
This is called the splitting principle and we accept this fact without proof. The
general proof is found in Shanahan (1978) and Hirzebruch (1966), for example.


## Page 449

Intuitively speaking, if the curvature /BY is diagonalized, the complex vector
space on which g acts splits into k independent pieces: /BV
k →/BV ⊕···⊕/BV .A n
eigenvalue xi is a curvature in each complex line bundle. Since diagonalizable
matrices are dense in M(n, /BV ), any matrix may be approximated by a diagonal
one as closely as we wish. Hence, the splitting principle applies to any matrix. As
an exercise, the reader may prove (11.33) using the splitting principle.
11.2.4 Universal bundles and classifying spaces
By now the reader must have some acquaintance with characteristic classes.
Before we close this section, we examine these from a slightly different point of
view emphasizing their role in the classiﬁcation of ﬁbre bundles. Let E
π
−→M
be a vector bundle with ﬁbre /BV
k . It is known that we can always ﬁnd a bundle
¯E
π′
−→M such that
E⊕¯E∼= M× /BV
n (11.40)
for some n≥k.T h eﬁ b r eFp of E at p∈M is a k-plane lying in /BV
n .L e tGk,n (/BV )
be the Grassmann manifold deﬁned in example 8.4. The manifold Gk,n (/BV ) is
the set of k-planes in /BV
n . Similarly to the canonical line bundle, we deﬁne the
canonical k-plane bundle Lk,n (/BV ) over Gk,n (/BV ) with the ﬁbre /BV
k . Consider a
map f : M→Gk,n (/BV ) which maps a point p to the k-plane Fp in /BV
n .
Theorem 11.4. Let M be a manifold with dim M = m and let E
π
−→M be a
complex vector bundle with the ﬁbre /BV
k . Then there exists a natural number N
such that for n > N,
(a) there exists a map f : M→Gk,n (/BV ) such that
E∼
= f
∗Lk,n (/BV ) (11.41)
(b) f∗Lk,n (/BV ) ∼= g∗Lk,n (/BV ) if and only if f, g : M → Gk,n (/BV ) are
homotopic.
The proof is found in Chern (1979). For example, if E
π
−→M is a complex
line bundle, then there exists a bundle ¯E
π′
−→M such that E⊕¯E∼= M× /BV
n and
am a p f : M →G1,n (/BV )∼
=
/BV Pn−1 such that E = f∗L, L being the canonical
line bundle over /BV Pn−1 . Moreover, if f ∼g,t h e n f∗L is equivalent to g∗L.
Theorem 11.4 shows that the classiﬁcation of vector bundles reduces to that of
the homotopy classes of the maps M→Gk,n (/BV ).
It is convenient to deﬁne the classifying space Gk (/BV ). Regarding a k-plane
in /BV
n as that in /BV
n+1 , we have natural inclusions.
Gk,k (/BV )↪→Gk,k+1(/BV )↪→··· ↪→Gk (/BV ) (11.42)


## Page 450

where
Gk (/BV )≡
∞⋃
n=k
Gk,n (/BV ). (11.43)
Correspondingly, we have the universal bundle Lk →Gk (/BV ) whose ﬁbre is
/BV
k . For any complex vector bundle E
π
−→M with ﬁbre /BV
k , there exists a map
f : M→Gk (/BV ) such that E= f∗Lk (/BV ).
Let E
π
−→M be a vector bundle. A characteristic class χ is deﬁned as a
map χ : E→χ( E)∈H∗(M) such that
χ( f∗E)= f∗χ( E)( naturality) (11.44a)
χ( E)= χ( E′) if E is equivalent to E′. (11.44b)
The map f∗on the LHS of (11.44a) is a pullback of the bundle while f∗on
the RHS is that of the cohomology class. Since the homotopy class [ f] of
f : M→Gk (/BV ) uniquely deﬁnes the pullback
f∗: H∗(Gk )→H∗(M) (11.45)
an element χ( E)= f∗χ( Gk ) proves to be useful in classifying complex vector
bundles over M with dim E = k. For each choice of χ( Gk ), there exists a
characteristic class in E.
The Chern class c(E) is also deﬁned axiomatically by
(i) c( f∗E)= f∗c(E)( naturality) (11.46a)
(ii) c(E)= c0(E)⊕c1(E)⊕···⊕ck (E)
ci (E)∈H 2i (M); ci (E)= 0 i > k (11.46b)
(iii) c(E⊕F)= c(E)c(E)( Whitney sum) (11.46c)
(iv) c(L)= 1+ x (normalization) (11.46d)
L being the canonical line bundle over /BV Pn . It can be shown that these axioms
uniquely deﬁne the Chern class as (11.25).
11.3 Chern characters
11.3.1 Deﬁnitions
Among the characteristic classes, the Che rn characters are of special importance
due to their appearance in the Atiyah–Singer index theorem. The total Chern
character is deﬁned by
ch(/BY )≡tr exp
( i/BY
2π
)
=
∑
j=1
1
j! tr
( i/BY
2π
) j
. (11.47)


## Page 451

The jth Chern character ch j (/BY ) is
ch j (/BY )≡1
j! tr
( i/BY
2π
) j
. (11.48)
lf 2 j > m= dim M,c hj (/BY ) vanishes, hence ch(/BY ) is a polynomial of ﬁnite order.
Let us diagonalize /BY as
i/BY
2π →g−1
( i/BY
2π
)
g= A≡diag(x1,..., xk ) g∈GL(k, /BV ).
The total Chern character is expressed as
tr[exp(A)]=
k∑
j=1
exp(x j ). (11.49)
In terms of the elementary symmetric functions Sr (x j ), the total Chern character
becomes
k∑
j=1
exp(x j )=
k∑
j=1
(
1+ x j + 1
2! x2
j + 1
3! x3
j +···
)
= k+ S1(x j )+ 1
2![S1(x j )2−2S2(x j )]+··· . (11.50)
Accordingly, each Chern character is expressed in terms of the Chern classes as
ch0(/BY )= k (11.51a)
ch1(/BY )= c1(/BY ) (11.51b)
ch2(/BY )= 1
2[c1(/BY )2−2c2(/BY )] (11.51c)
..
.
where k is the ﬁbre dimension of the bundle.
Example 11.2. Let P b eaU (1) bundle over S
2.I f /BT
N and /BT
S are the local
connections on UN and US deﬁned in section 10.5, the ﬁeld strength is given by
/BY
i = d/BT
i (i= N, S).W eh a v e
ch(/BY )= 1+ i/BY
2π (11.52)
where we have noted that /BY
n = 0 (n ≥2) on S2. This bundle describes the
magnetic monopole. The magnetic charge 2 g given by (10.94) is an integer
expressed in terms of the Chern character as
N= i
2π
∫
S2
/BY =
∫
S2
ch1(/BY ). (11.53)


## Page 452

Let P be an SU (2) bundle over S4. The total Chern class of P is given by
(11.27). The total Chern character is
ch(/BY )= 2+ tr
( i/BY
2π
)
+ 1
2 tr
( i/BY
2π
) 2
. (11.54)
Ch(/BY ) terminates at ch 2(/BY ) since /BY
n = 0f o r n ≥3. Moreover, tr /BY = 0f o r
G = SU(2), n≥2. As we found in section 10.5, the instanton number is given
by
1
2
∫
S4
tr
( i/BY
2π
) 2
=
∫
S4
ch2(/BY ). (11.55)
In both cases, ch j measures how the bundle is twisted when local pieces are
patched together.
Example 11.3. Let P be a U(1) bundle over a 2m-dimensional manifold M.T h e
mth Chern character is
1
m! tr
( i/BY
2π
) m
= 1
m!
( i
2π
) m [ 1
2
/BY
µν dxµ∧dxν
] m
= 1
m!
( i
4π
) m
/BY
µ1ν1 ... /BY
µm νm dxµ1 ∧dxν1 ∧... ∧dxµm ∧dxνm
=
( i
4π
) m
ϵµ1ν1...µm νm
/BY
µ1ν1 ... /BY
µm νm dx1∧... ∧dx2m
which describes the U(1) anomaly in 2m-dimensional space, see chapter 13.
Example 11.4. Let L be a complex line bundle. It then follows that
ch(L)= tr exp
( i/BY
2π
)
= ex = 1+ xx ≡i/BY
2π . (11.56)
For example, let L
π
−→/BV P1 be the canonical line bundle over /BV P1 = S2.T h e
Fubini–Study metric yields the curvature
/BY =−∂¯∂ ln(1+| z|2)=−dz∧d¯z
(1+ z¯z)2 (11.57)
see example 8.8. In real coordinates z= x+ iy= r exp(iθ) ,w eh a v e
/BY = 2i dx∧dy
(1+ x2+ y2)2 = 2ir dr∧dθ
(1+ r2)2 . (11.58)
From ch(/BY )= 1+ tr(i/BY /2π) ,w eh a v e
ch1(/BY )=−1
π
r dr∧dθ
(1+ r2)2 . (11.59)
Ch1(L), the integral of ch1(/BY ) over S2 is an integer,
Ch1(L)=−1
π
∫ r drdθ
(1+ r2)2 =−
∫ ∞
1
t−2 dt=−1. (11.60)


## Page 453

11.3.2 Properties of the Chern characters
Theorem 11.5. (a) (Naturality) Let E
π
−→M be a vector bundle with F =
/BV
k .L e t f : N→M be a smooth map. Then
ch( f∗E)= f∗ch(E). (11.61)
(b) Let E and F be vector bundles over a manifold M. The Chern characters
of E⊗F and E⊕F are given by
ch(E⊗F)= ch(E)∧ch(F) (11.62a)
ch(E⊕F)= ch(E)⊕ch(F). (11.62b)
Proof. (a) follows from theorem 11.2(a).
(b) These results are immediate from the deﬁnition of the ch-polynomial.
Let
ch(A)=
∑ 1
j! tr
( iA
2π
) j
be a polynomial of a matrix A. Suppose A is a tensor product of B and C,
A= B⊗C= B⊗I+ I⊗C (note that /BY
E⊗F = /BY
E ⊗I+ I⊗/BY
F ). Then we
ﬁnd that
ch(B⊗C)=
∑
j
1
j!
( i
2π
) j
tr(B⊗I+ I⊗C)j
=
∑
j
1
j!
( i
2π
) j j∑
m=1
( j
m
)
tr(Bm ) tr(C j−m )
=
∑
m
1
m! tr
( iB
2π
) m ∑
n
1
n! tr
( iC
2π
) n
= ch(B)ch(C).
Equation (11.62a) is proved if B is replaced by /BY
E and C by /BY
F .
If A is block diagonal,
A=
( B 0
0 C
)
= B⊕C
we have
ch(B⊕C)=
∑ 1
j!
( i
2π
) j
tr(B⊕C)j
=
∑ 1
j!
( 1
2π
) j
[tr(B j )+ tr(C j )]= ch(B)+ ch(C).
This relation remains true when A, B and C are replaced by /BY
E⊕F , /BY
E and /BY
F
respectively. /A3


## Page 454

Let us see how the splitting principle works in this case. Let L j (1≤j≤k)
be complex line bundles. From (11.62b) we have, for E= L1⊕L2⊕···⊕Lk ,
ch(E)= ch(L1)⊕ch(L2)⊕···⊕ch(Lk ). (11.63)
Since ch(Li )= exp(xi ),w eﬁ n d
ch(E)=
k∏
j=1
exp(x j ) (11.64)
which is simply (11.50). Hence, the Chern character of a general vector bundle E
is given by that of a Whitney sum of k complex line bundles. The characteristic
classes themselves cannot differentiate between two vector bundles of the same
base space and the same ﬁbre dimension. What is important is their integral over
the base space.
11.3.3 Todd classes
Another useful characteristic class associated with a complex vector bundle is the
Todd class deﬁned by
Td(/BY )=
∏
j
x j
1−e−x j (11.65)
where the splitting principle is unde rstood. If expanded in powers of x j ,T d(/BY )
becomes
Td (/BY )=
∏
j
(
1+ 1
2 x j +
∑
k≥1
(−1)k−1 Bk
(2k)! x2k
j
)
= 1+ 1
2
∑
j
x j + 1
12
∑
j
x2
j + 1
4
∑
j <k
x j xk +···
= 1+ 1
2 c1(/BY )+ 1
12[c1(/BY )2+ c2(/BY )]+··· (11.66)
where the Bk are the Bernoulli numbers
B1 = 1
6 B2 = 1
30 B3 = 1
42 B4 = 1
30 B5 = 5
66 ....
The ﬁrst few terms of (11.66) are:
Td0(/BY )= 1 (11.67a)
Td1(/BY )= 1
2 c1 (11.67b)
Td2(/BY )= 1
12 (c2
1+ c2) (11.67c)
Td3(/BY )= 1
24 c1c2 (11.67d)
Td4(/BY )= 1
720 (−c4
1+ 4c2
1c2+ 3c2
2+ c1c3−c4) (11.67e)
Td5(/BY )= 1
1440 (−c3
1c2+ 3c1c2
2+ c2
1c3−c1c4) (11.67f)


## Page 455

where ci stands for ci (/BY ).
Exercise 11.2. Let E and F be complex vector bundles over M. Show that
Td(E⊕F)= Td(E)∧Td(F). (11.68)
11.4 Pontrjagin and Euler classes
In the present section we will be concerned with the characteristic classes
associated with a real vector bundle.
11.4.1 Pontrjagin classes
Let E be a real vector bundle over anm-dimensional manifold M with dim
/CA
E=
k.I f E is endowed with the ﬁbre metric, we may introduce orthonormal frames
at each ﬁbre. The structure group may be reduced to O (k) from GL(k, /CA ).S i n c e
the generators of /D3 (k) are skew symmetric, the ﬁeld strength /BY of E is also skew
symmetric. A skew-symmetric matrix A is not diagonalizable by an element of a
subgroup of GL(k, /CA ). It is, however, reducible to block diagonal form as
A→



0 λ
1 0
−λ 1 0
0 λ 2
−λ 2 0
0 . . .


→



iλ
1
−iλ 1 0
iλ 2
−iλ 2
0 . . .



(11.69)
where the second diagonalization is achieved only by an element of GL(k,
/BV ).I f
k is odd, the last diagonal element is set to zero. For example, the generator of
/D3 (3)= /D7/D3 (3) generating rotations around the z-axis is
Tz =


01 0
−100
00 0

 .
The total Pontrjagin class is deﬁned by
p(
/BY )≡det
(
I+
/BY
2π
)
. (11.70)


## Page 456

From the skew symmetry /BY
t =−/BY , it follows that
det
(
I+
/BY
2π
)
= det
(
I+
/BY
t
2π
)
= det
(
I−
/BY
2π
)
.
Therefore, p(/BY ) is an even function in /BY . The expansion of p(/BY ) is
p(/BY )= 1+ p1(/BY )+ p2(/BY )+··· (11.71)
where p j (/BY ) is a polynomial of order 2 j and is an element of H 4 j (M; /CA ).W e
note that p j (/BY )= 0 for either 2 j > k= dim E or 4 j > dim M.1
Let us diagonalize /BY /2π as
/BY
2π →A≡





−ix
1
ix1 0
−ix2
0i x2
. . .




(11.72)
where x
k ≡−λ k /2π , λ k being the eigenvalues of /BY . The sign has been chosen
to simplify the Euler class deﬁned here. The generating function of p(/BY ) is given
by
p(/BY )= det(I+ A)=
[k/2]∏
i=1
(1+ x2
i ) (11.73)
where
[k/2]=→
{
k/2i f k is even
(k−1)/2i f k is odd.
In (11.73) only even powers appear, reﬂecting the skew symmetry. Each
Pontrjagin class is computed from (11.73) as
pj (/BY )=
[k/2]∑
i1 <i2 <...<i j
x2
i1 x2
i2 ... x2
i j . (11.74)
To write p j (/BY ) in terms of the curvature two-form /BY /2π , we ﬁrst note that
tr
(
/BY
2π
) 2 j
= tr A2 j = 2(−1)j
[k/2]∑
i=1
x2 j
i .
1 Although pm (/BY )= 0, pm (B) need not vanish for a matrix B. pm will be used to deﬁne the Euler
class later.


## Page 457

It then follows that
p1(/BY )=
∑
i
x2
i =−1
2
( 1
2π
) 2
tr /BY
2 (11.75a)
p2(/BY )=
∑
i< j
x2
i x2
j = 1
2
[( ∑
i
x2
i
) 2
−
∑
i
x4
i
]
= 1
8
( 1
2π
) 4
[(tr /BY
2)2−2t r/BY
4] (11.75b)
p3(/BY )=
∑
i< j <k
x2
i x2
j x2
k
= 1
48
( 1
2π
) 6
[−(tr /BY
2)3+ 6t r/BY
2 tr /BY
4−8t r/BY
6] (11.75c)
p4(/BY )=
∑
i< j <k<l
x2
i x2
j x2
k x2
l
= 1
384
( 1
2π
) 8
[(tr /BY
2)4−12(tr /BY
2)2 tr /BY
4+ 32 tr/BY
2 tr /BY
6
+ 12(tr /BY
4)2−48 tr/BY
8] (11.75d)
..
.
p
[k/2](/BY )= x2
1 x2
2 ... x2
[k/2] =
( 1
2π
) k
det /BY . (11.75e)
The reader should verify that
p(E⊕F)= p(E)∧p(F). (11.76)
It is easy to guess that the Pontrjagin classes are written in terms of Chern
classes. Since Chern classes are deﬁned only for complex vector bundles, we must
complexify the ﬁbre of E so that complex numbers make sense. The resulting
vector bundle is denoted by E
/BV
.L e t A be a skew-symmetric real matrix. We ﬁnd
that
det(I+ iA)= det




1+ x
1 0
1−x1
1+ x2
01 −x2
. . .



=
[k/2]∏
i=1
(1−x2
i )= 1−p1(A)+ p2(A)−···


## Page 458

from which it follows that
p j (E)= (−1)j c2 j (E
/BV
). (11.77)
Example 11.5. Let M be a four-dimensional Riemannian manifold. When the
orthonormal frame {ˆeα} is employed, the structure group of the tangent bundle
TM may be reduced to O(4).L e t/CA = 1
2
/CA
αβ θ α ∧θ β be the curvature two-form
(/CA should not be confused with the scalar curvature). For the tangent bundle, it is
common to write p(M) instead of p(/CA ).W eh a v e
det
(
I+
/CA
2π
)
= 1−1
8π 2 tr /CA
2+ 1
128π 4[(tr /CA
2)2−2t r/CA
4]. (11.78)
Each Pontrjagin class is given by
p0(M)= 1 (11.79a)
p1(M)=− 1
8π 2 tr /CA
2 =− 1
8π 2
/CA
αβ
/CA
βα (11.79b)
p2(M)= 1
128π 4[(tr /CA
2)2−2t r/CA
4]=
( 1
2π
) 4
det /CA . (11.79c)
Although p2(M) vanishes as a differential form, we need it in the next subsection
to compute the Euler class.
11.4.2 Euler classes
Let M be a 2 l-dimensional orientable Riemannian manifold and let TM be the
tangent bundle of M. We denote the curvature by /CA . It is always possible to
reduce the structure group of TM down to SO(2l) by employing an orthonormal
frame. The Euler class e of M is deﬁned by the square root of the 4l-form pl,
e(A)e(A)= pl (A). (11.80)
Both sides should be understood as functions of a 2 l× 2l matrix A and not of
the curvature /CA ,s i n c ep1(/CA ) vanishes identically. However, e(M)≡e(/CA ) thus
deﬁned is a 2l-form and, indeed, gives a volume element of M.I f M is an odd-
dimensional manifold we deﬁne e(M)= 0, see later.
Example 11.6. Let M= S2 and consider the tangent bundle TS 2.F r o me x a m p l e
7.14, we ﬁnd the curvature two-form,
/CA
θφ =−/CA
φθ = sin2 θ dθ∧dφ
sin θ = sin θ dθ∧dφ
where we have noted that gθθ = sin2 θ . Although p1(S2)= 0 as a differential
form, we compute it to ﬁnd the Euler form. We have
p1(S2)=− 1
8π 2 tr /CA
2 =− 1
8π 2[/CA
θφ
/CA
φθ + /CA
φθ
/CA
θφ ]
=
( 1
2π sin θ dθ∧dφ
) 2


## Page 459

from which we read off
e(S2)= 1
2π sin θ dθ∧dφ. (11.81)
It is interesting to note that
∫
S2
e(S2)= 1
2π
∫ 2π
0
dφ
∫ π
0
dθ sin θ = 2 (11.82)
which is the Euler characteristic of S2, see section 2.4. This is not just a
coincidence. Let us take another convincing example, a torusT 2.S i n c eT 2 admits
a ﬂat connection, the curvature vanishes identically. It then follows thate(T 2)≡0
and χ( T 2)= 0. These are special cases of the Gauss–Bonnet theorem,
∫
M
e(M)= χ( M) (11.83)
for a compact orientable manifold M.I f M is odd dimensional both e and χ
vanish, see (6.39).
In general, the determinant of a 2l× 2l skew-symmetric matrix A is a square
of a polynomial called the Pfafﬁan Pf(A), 2
det A= Pf(A)2. (11.84)
We show that the Pfafﬁan is given by
Pf(A)= (−1)l
2ll!
∑
P
sgn(P)AP(1)P(2) AP(3)P(4) ... AP(2l−1)P(2l) (11.85)
where the phase has been chosen for later convenience. We ﬁrst note that a skew-
symmetric matrix A can be block diagonalized by an element of O(2l) as
St AS= /Lambda1=






0 λ
1
−λ 1 00
0 λ 2
−λ 2 0
. . .
00 λ l
−λ l 0







. (11.86)
It is easy to see that
det A= det /Lambda1=
l∏
i=1
λ 2
i .
2 See proposition 1.3. The deﬁnition here differs in phase from that in section 1.5. It turns out to be
convenient to choose the present phase convention in the deﬁnition of the Euler class.


## Page 460

To compute Pf (/Lambda1), we note that the non-vanishing terms in (11.85) are of the
form A12 A34 ... A2l−1,2l. Moreover, there are 2l ways of changing the sufﬁces as
Aij →A ji ,s u c ha s
A12 A34 ... A2l−1,2l →A21 A34 ... A2l−1,2l
and l! permutations of the pairs of indices, for example,
A12 A34 ... A2l−1,2l →A34 A12 ... A2l−1,2l .
Hence, we have
Pf(/Lambda1)= (−1)l A12 A34 ... A2l−1,2l = (−1)l
l∏
i=1
λ i .
Thus, we conclude that a block diagonal matrix /Lambda1satisﬁes
det /Lambda1= Pf(/Lambda1)2.
To show that (11.84) is true for any skew-symmetric matrices (not necessarily
block diagonal) we use the following lemma,3
Pf(Xt AX )= Pf(A) det X. (11.87)
If St AS= /Lambda1for S∈O(2l),w eh a v eA= S/Lambda1St, hence
Pf(S/Lambda1St)= Pf(/Lambda1)det S= (−1)l
l∏
i=1
λ i det S.
We ﬁnally ﬁnd det A= Pf(A)2 for a skew-symmetric matrix A.
Note that Pf (A) is SO (2l) invariant but changes sign under an improper
rotation S (det S=−1) of O(2l).
Exercise 11.3. Show that the determinant of an odd-dimensional skew-symmetric
matrix vanishes. This is why we put e(M)= 0 for an odd-dimensional manifold.
The Euler class is deﬁned in terms of the curvature /CA as
e(M)= Pf(/CA /2π)
= (−1)l
(4π) ll!
∑
P
sgn(P)/CA
P(1)P(2) ... /CA
P(2l−1)P(2l). (11.88)
3 Since det(Xt AX )= (det X)2 det A,w eh a v eP f(Xt AX )=± Pf(A) det X. Here the plus sign should
be chosen since Pf(It AI )= Pf(A).


## Page 461

The generating function is obtained by taking x j =−λ i /2π ,
e(x)= x1x2 ... xl =
l∏
i=1
xi . (11.89)
The phase (−1)l has been chosen to simplify the RHS.
Example 11.7. Let M be a four-dimensional orientable manifold. The structure
group of TM is SO(4), see example 11.5. The Euler class is obtained from (11.88)
as
e(M)= 1
2(4π) 2 ϵijkl
/CA
ij ∧/CA
kl . (11.90)
This is in agreement with the result of example 11.5. The relevant Pontrjagin class
is
p2(M)= 1
128π 4[(tr /CA
2)2−2t r/CA
4]= x2
1 x2
2 .
Since e(M)= x1x2,w eh a v ep2(M)= e(M)∧e(M). This is written as a matrix
identity,
1
128π 4[(tr A2)2−2t r A4]=
( 1
2(4π) 4 ϵijkl Aij Akl
) 2
.
11.4.3 Hirzebruch L-polynomial and ˆA-genus
The Hirzebruch L-polynomial is deﬁned by
L(x)=
k∏
j=1
x j
tanh x j
=
k∏
j=1
(
1+
∑
n≥1
(−1)n−1 22n
(2n)! Bn x2n
j
)
(11.91)
where the Bn are Bernoulli numbers, see (11.66). The function L(x) is even in x j
and can be written in terms of the Pontrjagin classes,
L(/BY )= 1+ 1
3 p1+ 1
45 (−p2
1+ 7 p2)+ 1
945 (2 p3
1−13 p1 p2+ 62 p3)+··· (11.92)
where p j stands for p j (/BY ). From the splitting principle, we ﬁnd that
L(E⊕F)= L(E)∧L(F). (11.93)
The ˆA ( A-roof) genus ˆA(/BY ) is deﬁned by
ˆA(/BY )=
k∏
j=1
x j /2
sinh(x j /2)
=
k∏
j=1
(
1+
∑
n≥1
(−1)n (22n−2)
(2n)! Bn x2n
j
)
. (11.94)


## Page 462

This is an even function of x j and can be expanded in p j . ˆA is also called the
Dirac genus by physicists. It satisﬁes
ˆA(E⊕F)= ˆA(E)∧ˆA(F). (11.95)
ˆA is written in terms of the Pontrjagin classes as
ˆA(/BY )= 1−1
24 p1+ 1
5760 (7 p2
1−4 p2)
+ 1
967 680(−31 p3
1+ 44 p1 p2−16 p3)+··· . (11.96)
Example 11.8. Let M be a compact connected and orientable four-dimensional
manifold. Let us consider the symmetric bilinear form σ : H 2(M; /CA ) ×
H 2(M; /CA )→/CA deﬁned by
σ([α],[β])=
∫
M
α ∧β. (11.97)
σ is a b2× b2 symmetric matrix where b2 = dim H 2(M; /CA ) is the Betti number.
Clearly σ is non-degenerate since σ([α],[β]) = 0f o ra n y[α]∈ H 2(M; /CA )
implies[β]= 0. Let p (q) be the number of positive (negative) eigenvalues ofσ .
The Hirzebruch signature of M is
τ( M)≡p−q. (11.98)
According to the Hirzebruch signature theorem (see section 12.5), this number
is also given in terms of the L-polynomial as
τ( M)=
∫
M
L1(M)= 1
3
∫
M
p1(M). (11.99)
11.5 Chern–Simons forms
11.5.1 Deﬁnition
Let Pj (/BY ) be an arbitrary 2 j-form characteristic class. Since Pj (/BY ) is closed, it
can be written locally as an exact form by Poincar´e’s lemma. Let us write
Pj (/BY )= dQ2 j−1(/BT , /BY ) (11.100)
where Q2 j−1(/BT , /BY )∈/CV ⊗/Omega12 j−1(M).[ Warning: This cannot be true globally. If
Pj = dQ2 j−1 globally on a manifold M without boundary, we would have
∫
M
Pm/2 =
∫
M
dQm−1 =
∫
∂ M
Qm−1 = 0
where m= dim M.] The 2 j−1 from Q2 j−1(/BT , /BY ) is called the Chern–Simons
form of Pj (/BY ). From the proof of theorem 11.2(b), we ﬁnd that Q is given by the
transgression of Pj ,
Q2 j−1(/BT , /BY )= TP j (/BT , 0)= j
∫ 1
0
˜Pj (/BT , /BY
t ,..., /BY
t ) dt (11.101)


## Page 463

where ˜Pj is the polarization of Pj , /BY = d/BT + /BT
2 and we set /BT
′ = /BY
′ = 0. Since
Q2 j−1 depends on /BY and /BT , we explicitly quote the /BT -dependence. Of course,
/BT
′ can be put equal to zero only on a local chart over which the bundle is trivial.
Suppose M is an even-dimensional manifold (dim M = m = 2l) such that
∂ M̸=∅. Then it follows from Stokes’ theorem that
∫
M
Pl (/BY )=
∫
M
dQm−1(/BT , /BY )=
∫
∂ M
Qm−1(/BT , /BY ). (11.102)
The LHS takes its value in integers, and so does the RHS. Thus Qm−1 is a
characteristic class in its own right and it describes the topology of the boundary
∂ M.
11.5.2 The Chern–Simons form of the Chern character
As an example, let us work out the Chern–Simons form of a Chern character
chj (/BY ). The connection /BT
t which interpolates between 0 and /BT is
/BT
t = t/BT (11.103)
the corresponding curvature being
/BY
t = t d/BT + t2
/BT
2 = t/BY + (t2−t)/BT
2. (11.104)
We ﬁnd from (11.21) that
Q2 j−1(/BT , /BY )= 1
( j−1)!
( i
2π
) j ∫ 1
0
dt str(/BT , /BY
j−1
t ). (11.105)
For example,
Q1(/BT , /BY )= i
2π
∫ 1
0
dt tr /BT = i
2π tr /BT (11.106a)
Q3(/BT , /BY )=
( i
2π
) 2 ∫ 1
0
dt str(/BT , td/BT + t2
/BT
2)
= 1
2
( i
2π
) 2
tr
(
/BT d/BT + 2
3
/BT
3
)
. (11.106b)
Q5(/BT , /BY )= 1
2
( i
2π
) 3 ∫ 1
0
dt str[/BT ,( td/BT + t2
/BT
2)2]
= 1
6
( i
2π
) 3
tr
[
/BT (d/BT )2+ 3
2
/BT
3d/BT + 3
5
/BT
5
]
. (11.106c)
Exercise 11.4. Let /BY be the ﬁeld strength of the SU(2) gauge theory. Write down
the component expression of the identity ch 2(/BY )= dQ3(/BT , /BY ) to verify that (cf
lemma 10.3)
tr[ϵκλµν
/BY
κλ
/BY
µν]= ∂κ[2ϵκλµν tr(/BT
λ ∂µ
/BT
ν + 2
3
/BT
λ
/BT
µ
/BT
ν )]. (11.107)


## Page 464

11.5.3 Cartan’s homotopy operator and applications
For later purposes, we deﬁne Cartan’s homotopy formula following Zumino
(1985) and Alvarez-Gaum´e and Ginsparg (1985). Let
/BT
t = /BT
0+ t (/BT
1−/BT
0) /BY
t = d/BT
t + /BT
2
t (11.108)
as before. Deﬁne an operator lt by
lt
/BT
t = 0 lt
/BY
t = δt (/BT
1−/BT
0). (11.109)
We require that lt be an anti-derivative,
lt (η p ω q )= (lt η p )ω q + (−1)pη p (lt ω q ) (11.110)
for η p ∈/Omega1p (M) and ω q ∈/Omega1q (M).W ev e r i f yt h a t
(dlt + lt d)/BT
t = lt (/BY
t −/BT
2
t )= δt (/BT
1−/BT
0)= δt ∂ /BT
t
∂ t
and
(dlt + lt d)/BY
t = d[δt (/BT
1−/BT
0)]+ lt[/BW
t
/BY
t −/BT
t
/BY
t + /BY
t
/BT
t]
= δt[d(/BT
1−/BT
0)+ /BT
t (/BT
1−/BT
0)+ (/BT
1−/BT
0)/BT
t]
= δt/BW
t (/BT
1−/BT
0)= δt ∂ /BY
t
∂ t
where we have used the Bianchi identity /BW
t
/BY
t = 0. This shows that for any
polynomial S(/BT , /BY ) of /BT and /BY , we obtain
(dlt + lt d)S(/BT
t , /BY
t )= δt ∂
∂ t S(/BT
t , /BY
t ). (11.111)
On the RHS, S should be a polynomial of /BT and /BY only and not of d /BT or
d/BY :i f S does contain them, d /BT should be replaced by /BY −/BT
2 and d /BY by
/BW /BY −[/BT , /BY ]=−[/BT , /BY ]. Integrating (11.111) over [0, 1], we obtain Cartan’s
homotopy formula
S(/BT
1, /BY
1)−S(/BT
0, /BY
0)= (dk01+ k01d)S(/BT
t , /BY
t ) (11.112)
where the homotopy operator k01 is deﬁned by
k01 S(/BT
t , /BY
t )≡
∫ 1
0
δtl t S(/BT
t , /BY
t ). (11.113)
To operate k01 on S(/BT , /BY ), we ﬁrst replace /BT and /BY by /BT
t and /BY
t, respectively,
then operate lt on S(/BT
t , /BY
t ) and integrate over t.


## Page 465

Example 11.9. Let us compute the Chern–Simons form of the Chern character
using the homotopy formula. Let S(/BT , /BY )= ch j+1(/BY ) and /BT
1 = /BT , /BT
0 = 0.
Since d chj+1(/BY )= 0, we have
chj+1(/BY )= (dk01+ k01d)chj+1(/BY
t )= d[k01chj+1(/BY
t )].
Thus, k01ch j+1(/BY ) is identiﬁed with the Chern–Simons form Q2 j+1(/BT , /BY ).W e
ﬁnd that
k01ch j+1(/BY
t )= 1
( j+ 1)!k01 tr
( i/BY
2π
) j+1
= 1
( j+ 1)!
( i
2π
) j+1 ∫ 1
0
δtl t tr(/BY
j+1
t )
= 1
j!
( i
2π
) j+1 ∫ 1
0
δt str(/BT , /BY
j
t ) (11.114)
in agreement with (11.105).
Although a characteristic class is gauge invariant, the Chern–Simons form
need not be so. As an application of Cartan’s homotopy formula, we compute the
change in Q2 j+1(/BT , /BY ) under /BT →/BT
g = g−1(/BT + d)g, /BY →/BY
g = g−1
/BY g.
Consider the interpolating families /BT
g
t and /BY
g
t deﬁned by
/BT
g
t ≡tg−1
/BT g+ g−1dg (11.115a)
/BY
g
t ≡d/BT
g
t + (/BT
g
t )2 = g−1
/BY
t g (11.115b)
where /BY
t ≡t/BY + (t2 −t)/BT
2. Note that /BT
g
0 = g−1dg, /BT
g
1 = /BT
g, /BY
g
0 = 0a n d
/BY
g
1 = /BY
g. Equation (11.112) yields
Q2 j+1(/BT
g , /BY
g)−Q2 j+1(g−1dg, 0)= (dk01+ k01d)Q2 j+1(/BT
g
t , /BY
g
t ). (11.116)
For example, let Q2 j+1 be the Chern–Simons form of the Chern character
chj+1(/BY ).S i n c edQ2 j+1(/BT
g
t , /BY
g
t )= chj+1(/BY
g
t )= chj+1(/BY
t ),w eh a v e
k01 dQ2 j+1(/BT
g
t , /BY
g
t )= k01chj+1(/BY
g
t )
= k01chj+1(/BY
t )= Q2 j+1(/BT , /BY ) (11.117)
where the result of example 11.9 has been used to obtain the ﬁnal equality.
Collecting these results, we write (11.116) as
Q2 j+1(/BT
g , /BY
g)−Q2 j+1(/BT , /BY )= Q2 j+1(g−1dg, 0)+ dα 2 j (11.118)
where α 2 j is a 2 j-form deﬁned by
α 2 j (/BT , /BY ,v )≡k01 Q2 j+1(/BT
g
t , /BY
g
t )
= k01 Q2 j+1(/BT
t + v, /BY
t ) (11.119)


## Page 466

where v ≡dg· g−1. [Note that Q2 j+1(/BT , /BY )= Q2 j+1(g/BT g−1, g/BY g−1).] The
ﬁrst term on the RHS of (11.118) is
Q2 j+1(g−1dg, 0)= 1
j!
( i
2π
) j+1 ∫ 1
0
δt tr[g−1dg{(t2−t)(g−1dg)2}j]
= 1
j!
( i
2π
) j+1
tr[(g−1dg)2 j+1]
∫ 1
0
δt (t2−t)j
= (−1)j j!
(2 j+ 1)!
( i
2π
) j+1
tr[(g−1dg)2 j+1] (11.120)
where we have noted that /BY
t = (t2−t)(g−1dg)2 and
∫ 1
0
δt (t2−t)j = (−1)j B( j+ 1, j+ 1)= (−1)j ( j!)2
(2 j+ 1)!
B being the beta function. The 2 j+ 1f o r mQ2 j+1(gdg, 0) is closed and, hence,
locally exact: d Q2 j+1(g−1dg, 0)= chj+1(0)= 0.
As for α 2 j we have, for example,
α 2 = 1
2
( i
2π
) 2 ∫ 1
0
lt tr[(/BT
t + v)/BY
t −1
3 (/BT
t + v)3]
= 1
2
( i
2π
) 2 ∫ 1
0
δt tr(−t/BT
2−v/BT )
=−1
2
( i
2π
) 2
tr(v/BT ) (11.121)
where we have noted that
tr /BT
2 = dxµ∧dxν tr(/BT
µ
/BT
ν )=−dxν ∧dxµ tr(/BT
ν
/BT
µ)= 0.
Example 11.10. In three-dimensional spacetime, a gauge theory may have a
gauge-invariant mass term given by the Chern–Simons three-form (Jackiw and
Templeton 1981, Deser et al 1982a, b). Since the Chern–Simons form changes
by a locally exact form under a gauge transformation, the action remains invariant.
We restrict ourselves to the U(1) gauge theory for simplicity. Consider the
Lagrangian (we put /BT = iA, /BY = iF)
/C4 =−1
4 Fµν Fµν + 1
4 mϵλµν Fλµ Aν (11.122)
where Fµν = ∂µ Aν−∂ν Aµ. Note that the second term is the Chern–Simons form
of the second Chern character F2 (modulo a constant factor) of the U(1) bundle.
The ﬁeld equation is
∂µ Fµν + m∗Fν = 0 (11.123)


## Page 467

where
∗Fµ = 1
2 ϵµκλ Fκλ Fµν = ϵµνλ ∗Fλ .
The Bianchi identity
∂µ∗Fµ = 0 (11.124)
follows from (11.123) as a consequence of the skew symmetry of Fµν . It is easy
to verify that the ﬁeld equation is invariant under a gauge transformation,
Aµ →Aµ+ ∂µθ (11.125)
while the Lagrangian changes by a total derivative,
/C4 →−1
4 Fµν Fµν + 1
4 mϵλµν Fλµ (Aν + ∂ν θ) = /C4 + 1
2 m∂ν (∗Fν θ) . (11.126)
Equation (11.106b) shows that the last term on the RHS is identiﬁed with
Q3(Aθ , Fθ )−Q3(A, F)∼(A+ dθ) dA−A dA∼d(θ dA).
If we assume that F falls off at large spacetime distances, this term does not
contribute to the action:
∫
d3x/C4 →
∫
d3x/C4 + m
2
∫
d3x∂ν (∗Fν θ) =
∫
d3x/C4 . (11.127)
Let us show that (11.122) describes a massive ﬁeld. We ﬁrst write (11.123)
as
ϵµνα ∂µ∗Fα =−m∗Fν .
Multiplying εκλν on both sides, we have
∂λ ∗Fκ −∂κ ∗Fλ =−mFκλ .
Taking the ∂ λ -derivative and using (11.124), we ﬁnd that
(∂ λ ∂λ + m2)∗Fκ = 0 (11.128)
which shows that∗Fκ is a massive vector ﬁeld of mass m.
11.6 Stiefel–Whitney classes
The last example of the characteristic classes is the Stiefel–Whitney class. In
contrast to the rest of the characteristic classes, the Stiefel–Whitney class cannot
be expressed in terms of the curvature of the bundle. The Stiefel–Whitney class
is important in physics since it tells us whether a manifold admits a spin or not.
Let us start with a brief review of a spin bundle.


## Page 468

11.6.1 Spin bundles
Let TM
π
−→M be a tangent bundle with dim M = m. The bundle TM is
assumed to have a ﬁbre metric and the structure group G is taken to be O(m). If,
furthermore, M is orientable, G can be reduced down to SO (m).L e t LM be the
frame bundle associated with TM .L e ttij be the transition function of LM which
satisﬁes the consistency condition (9.6)
tij tjk tki = It ii = I.
A spin structure on M is deﬁned by the transition function ˜tij ∈SPIN(m) such
that
ϕ(˜tij )= tij ˜tij ˜tjk˜tki = I ˜tii = I (11.129)
where ϕ is the double covering SPIN(m)→SO(m).T h es e to f˜tij deﬁnes a spin
bundle PS (M) over M and M is said to admit a spin structure (of course, M
may admit many spin structures depending on the choice of˜tij ).
It is interesting to note that not all manifolds admit spin structures. Non-
admittance of spin structures is measured by the second Stiefel–Whitney class
which takes values in the ˇCech cohomology group H 2(M; /CI
2).
11.6.2 ˇCech cohomology groups
Let /CI
2 be the multiplicative group{−1,+1}.A ˇCech r-cochain is a function
f (i0, i1,..., ir ) ∈/CI
2,d e ﬁ n e do nUi0 ∩Ui1 ∩... ∩Uir ̸=∅, which is totally
symmetric under an arbitrary permutation P,
f (iP(0),..., iP(r))= f (i0,..., ir ).
Let Cr (M, /CI
2) be the multiplicative group of ˇCech r-cochains. We deﬁne the
coboundary operator δ: Cr (M; /CI
2)→Cr+1(M; /CI
2) by
(δ f )(i0,..., ir+1)=
r+1∏
j=0
f (i0,..., ˆi j ,..., ir+1) (11.130)
where the variable below the ˆ is omitted. For example,
(δ f0)(i0, i1)= f0(i1) f0(i0) f0 ∈C0(M; /CI
2)
(δ f1)(i0, i1, i2)= f1(i1, i2) f1(i0, i2) f1(i0, i1) f1 ∈C1(M; /CI
2).
Since we employ the multiplicative notation, the unit element of Cr (M; /CI
2) is
denoted by 1. We verify that δ is nilpotent:
(δ2 f )(i0,..., ir+2)=
r+1∏
j,k=1
f (i0,..., ˆi j ,..., ˆik ,..., ir+2)= 1


## Page 469

since −1 always appears an even number of times in the middle
expression (for example if f (i0,..., ˆi j ,..., ˆik ,..., ir+2) =−1, we have
f (i0,..., ˆik ,..., ˆi j ,..., ir+2)=−1 from the symmetry of f ). Thus, we have
proved, for any ˇCech r-cochain f ,t h a t
δ2 f = 1. (11.131)
The cocycle group Zr (M; /CI
2) and the coboundary group Br (M; /CI
2) are
deﬁned by
Zr (M; /CI
2)={ f ∈Cr (M; /CI
2)|δ f = 1} (11.132)
Br (M; /CI
2)={ f ∈Cr (M; /CI
2)| f = δ f′, f′ ∈Cr−1(M; /CI
2). (11.133)
Now the rth ˇCech cohomology group Hr (M; /CI
2) is deﬁned by
Hr (M; /CI
2)= kerδr /imδr−1 = Zr (M; /CI
2)/Br (M; /CI
2). (11.134)
11.6.3 Stiefel–Whitney classes
The Stiefel–Whitney class wr is a characteristic class which takes its values in
Hr (M; /CI
2).L e tTM
π
−→M be a tangent bundle with a Riemannian metric. The
structure group is O(m), m= dim M. We assume{Ui} is a simple open covering
of M, which means that the intersection of any number of charts is either empty
or contractible. Let{eiα} (1≤α ≤m) be a local orthonormal frame of TM over
Ui .W eh a v eeiα = tij ej α where tij : Ui ∩Uj →O(m) is the transition function.
Deﬁne the ˇCech 1-cochain f (i, j ) by
f (i, j )≡det(tij )=± 1. (11.135)
This is, indeed, an element of C1(M; /CI
2) since f (i, j ) = f ( j, i ).F r o m t h e
cocycle condition tij tjk tki = I ,w ev e r i f yt h a t
δ f (i, j, k)= det(tij ) det(tjk ) det(tki )
= det(tij tjk tki )= 1. (11.136)
Hence, f ∈Z1(M, /CI
2) and it deﬁnes an element [ f] of H 1(M; /CI
2).N o w w e
show that this element is independent of the local frame chosen. Let {¯eiα} be
another frame over Ui such that¯eiα = hi eiα , hi ∈O(m).F r o m¯eiα =¯tij ¯ej α ,w e
ﬁnd¯tij = hi tij h−1
j . If we deﬁne the 0-cochain f0 by f0(i )≡det hi ,w eﬁ n dt h a t
˜f (i, j )= det(hi tij h−1
j )= det(hi ) det(h j ) det(tij )
= δ f0(i, j ) f (i, j )
where use has been made of the identity det h−1
j = det h j for h j ∈O(m). Thus,
f changes by an exact amount and still deﬁnes the same cohomology class[ f].4
4 Note that the multiplicative notation is being used.


## Page 470

This special element w1(M) ≡[f]∈ H 1(M; /CI
2) is called the ﬁrst Stiefel–
Whitney class.
Theorem 11.6. Let TM
π
−→M be a tangent bundle with ﬁbre metric. M is
orientable if and only if w1(M) is trivial.
Proof.I f M is orientable, the structure group may be reduced to SO (m) and
f (i, j ) = det(tij ) = 1, and hence w1(M) = 1, the unit element of /CI
2.
Conversely, if w1(M) is trivial, f is a coboundary; f = δ f0.S i n c ef0(i )=± 1,
we can always choose hi ∈O(m) such that det (hi ) = f0(i ) for each i.I f
we deﬁne the new frame ¯eiα = hi eiα , we have transition functions ˜tij such
that det(˜tij ) = 1 for any overlapping pair (i, j ) and M is orientable. [Suppose
f (i, j )= det tij =−1 for some pair (i, j ).T h e nw e m a yt a k ef0(i )=−1a n d
f0( j )=+ 1, hence det˜tij =−det tij =+ 1.] /A3
Theorem 11.6 shows that the ﬁrst Stiefel–Whitney class is an obstruction to
the orientability. Next we deﬁne the s econd Stiefel–Whitney class. Suppose M
is an m-dimensional orientable manifold and TM is its tangent bundle. For the
transition function tij ∈SO(m), we consider a ‘lifting’˜tij ∈SPIN(m) such that
ϕ(˜tij )= tij ˜tji =˜t−1
ij (11.137)
where ϕ : SPIN(m)→SO(m) is the 2: 1 homomorphism (note that we have an
option tij ↔˜tij or−˜tij ). This lifting always exists locally. Since
ϕ(˜tij ˜tjk˜tki )= tij tjk tki = I
we have ˜tij ˜tjk˜tki ∈ker ϕ ={ ±I}.F o r˜tij to deﬁne a spin bundle over M,t h e y
must satisfy the cocycle condition,
˜tij ˜tjk˜tki = I. (11.138)
Deﬁne the ˇCech 2-cochain f : Ui ∩Uj ∩Uk →/CI
2 by
˜tij ˜tjk˜tki = f (i, j, k)I. (11.139)
It is easy to see that f is symmetric and closed. Thus, f deﬁnes an element
w2(M)∈H 2(M, /CI
2) called the second Stiefel–Whitney class. It can be shown
that w2(M) is independent of the local frame chosen.
Exercise 11.5. Suppose we take another lift −˜tij of tij . Show that f changes by
an exact amount under this change. Accordingly, [ f] is independent of the lift.
[Hint: Show that f (i, j, k) → f (i, j.k)δ f1(i, j, k) where f1(i, j ) denotes the
sign of±˜tij .]
Theorem 11.7. Let TM be the tangent bundle over an orientable manifold M.
There exists a spin bundle over M if and only if w2(M) is trivial.


## Page 471

Proof. Suppose there exists a spin bundle over M. T h e nw ed e ﬁ n eas e to f
transition functions˜tij such that˜tij ˜tjk˜tki = I over any overlapping charts Ui , Uj
and Uk , hence w2(M) is trivial. Conversely, suppose w2(M) is trivial, namely
f (i, j, k)= δ f1(i, j, k)= f1( j, k) f1(i, k) f1(k, i )
f1 being a 1-cochain. We consider the 1-cochain f1(i, j ) deﬁned in exercise 11.5.
If we choose new transition functions˜t′
ij ≡˜tij f1(i, j ),w eh a v e
˜t′
ij ˜t′
jk˜t′
ki =[ δ f1(i, j, k)]2 = I
and, hence,{˜t′
ij} deﬁnes a spin bundle over M. /A3
We outline some useful results:
(a)
w1(/BV Pm )= 1 w2(/BV Pm )=
{
1 m odd
xm even (11.140)
x being the generator of H 2(/BV Pm; /CI
2).
(b)
w1(Sm )= w2(Sm )= 1 (11.141)
(c)
w1(/Sigma1g )= w2(/Sigma1g )= 1 (11.142)
/Sigma1g being the Riemann surface of genus g.


## Page 472

12
INDEX THEOREMS
In physics, we often consider a differential operator deﬁned on a manifold M.
Typical examples will be the Laplacian, the d’Alembertian and the Dirac operator.
From the mathematical point of view, these operators are regarded as maps of
sections
D: /Gamma1(M, E)→/Gamma1(M, F)
where E and F are vector bundles over M. For example, the Dirac operator is a
map F(M, E)→F(M, E), E being a spin bundle over M. If inner products are
deﬁned on E and F, it is possible to deﬁne the adjoint of D,
D† : /Gamma1(M, F)→/Gamma1(M, E).
Since it is a differential operator, D carries analytic information on the
spectrum and its degeneracy. In what follows, we are interested in the zero
eigenvectors of D and D
†,
ker D≡{s∈/Gamma1(M, E)|Ds = 0}
ker D† ≡{s∈/Gamma1(M, F)|D†s= 0}.
The analytical index is deﬁned by
ind D= dim ker D−dim ker D†.
Surprisingly, this analytic quantity is a topological invariant expressed in terms of
an integral of an appropriate characteristic class over M, which provides purely
topological information on M. This interplay between analysis and topology is
the main ingredient of the index theorem.
Our exposition follows Eguchiet al (1980), Gilkey (1984), Shanahan (1978),
Kulkarni (1975) and Booss and Bleecker (1985). The reader should consult these
references for details. Alvarez (1985) contains a brief summary of this subject
along with applications to anomalies and strings.
12.1 Elliptic operators and Fredholm operators
In the following, we will be concerned with differential operators deﬁned on
vector bundles over a compact manifold M without a boundary. We exclusively
deal with a nice class of differential operators called the Fredholm operators.


## Page 473

12.1.1 Elliptic operators
Let E and F be complex vector bundles over a manifold M. A differential
operator D is a linear map
D: /Gamma1(M, E)→/Gamma1(M, F). (12.1)
T a k eac h a r tU of M over which E and F are trivial. We denote the local
coordinates of U as xµ. We introduce the following multi-index notation,
M≡(µ1,µ 2,...,µ m )µ j ∈/CI ,µ j ≥0
|M|≡µ1+ µ2+···+ µm
DM = ∂|M|
∂ x M ≡ ∂ µ1+···+µm
∂( x1)µ1 ...∂( xm )µm
.
If dim E= k and dim F= k′, the most general form of D is
[Ds(x)]α =
∑
|M|≤N
1≤a≤k
AMα a (x)DM sa (x) 1≤α ≤k′ (12.2)
where s(x) is a section of E. Note that x denotes a point whose coordinates are
xµ. This slight abuse simpliﬁes the notation. AM ≡(AM )α a is a k× k′ matrix
which may depend on the position x. The positive integer N in (12.2) is called
the order of D. We are interested in the case in whichN= 1 (the Dirac operator)
and N= 2 (the Laplacian). For example, if F is a spin bundle over M,t h eD i r a c
operator D≡iγ µ∂µ+ m: /Gamma1(M, E)→/Gamma1(M, E) acts on a section ψ( x) of E as
[Dψ( x)]α = i(γ µ)α
β ∂µψ β (x)+ mψ α (x).
The symbol of D is a k× k′ matrix
σ( D,ξ) ≡
∑
|M|=N
AMα a (x)ξM (12.3)
where ξ is a real m-tuple ξ = (ξ1,...,ξ m ). The symbol is also deﬁned
independently of the coordinates as follows. Let E
π
−→M be a vector bundle
and let p∈M,ξ ∈T∗
p M and s∈π−1
E (p). Take a section˜s∈/Gamma1(M, E) such that
˜s(p)= s and a function f ∈/BY (M) such that f (p)= 0a n dd f (p)= ξ ∈T∗
p M.
Then the symbol may be deﬁned by
σ( D,ξ) s= 1
N! D( f N˜s)|p . (12.4)
The factor f N automatically picks up the Nth-order term due to the condition
f (p)= 0. Equation (12.4) yields the same symbol as (12.3).


## Page 474

If the matrix σ( D,ξ) is invertible for each x ∈M and each ξ ∈/CA
m −{0},
the operator D is said to beelliptic. Clearly this deﬁnition makes sense only when
k= k′. It should be noted that the symbol for a composite operator D= D1◦D2
is a composite of the symbols, namely σ( D,ξ) = σ( D1,ξ) σ( D2,ξ) . This shows
that composites of elliptic operators are also elliptic. In general, powers and roots
of elliptic operators are elliptic.
Example 12.1. Let xµ be the natural coordinates in /CA
m .I f E and F are real line
bundles over /CA
m , the Laplacian /Delta1: /Gamma1(/CA
m , E)→/Gamma1(/CA
m , F) is deﬁned by
/Delta1≡ ∂ 2
∂( x1)2 +···+ ∂ 2
∂( xm )2 . (12.5)
According to (12.3), the symbol is
σ( /Delta1,ξ)=
∑
µ
(ξµ)2.
This is in agreement with the result obtained from (12.4),
σ( /Delta1,ξ)s= 1
2 /Delta1(f 2˜s)|p = 1
2
∑ ∂ 2
∂( xµ)2 ( f 2˜s)|p
= 1
2
(
f 2/Delta1˜s+ 2 f /Delta1f˜s+ 2 f
∑ ∂ f
∂ xµ
∂˜s
∂ xµ + 2
∑ ∂ f
∂ xµ
∂ f
∂ xµ˜s
) ⏐⏐
⏐
⏐
p
=
∑
(ξµ)2s.
This symbol is clearly invertible for ξ ̸= 0, and hence /Delta1is elliptic.
However, the d’Alembertian
/A3 ≡ ∂ 2
∂( x1)2 +···+ ∂ 2
∂( xm−1)2 − ∂ 2
∂( xm )2 (12.6)
is not elliptic since the symbol
σ( /A3 ,ξ) = (ξ 1)2+···+ (ξ m−1)2−(ξ m )2
vanishes everywhere on the light cone,
(ξ m )2 = (ξ 1)2+···+ (ξ m−1)2.
Exercise 12.1. Let M = /CA
2 and consider a differential operator D of order two.
The symbol of D is of the form
σ( D,ξ) = A11ξ 1ξ 1+ 2A12ξ 1ξ 2+ A22ξ 2ξ 2.
Show that D is elliptic if and only if σ( D,ξ) = 1 is an ellipse in ξ -space.


## Page 475

12.1.2 Fredholm operators
Let D: /Gamma1(M, E)→/Gamma1(M, F) be an elliptic operator. The kernel of D is the set
of null eigenvectors
ker D≡{s∈/Gamma1(M, E)|Ds = 0}. (12.7)
Suppose E and F are endowed with ﬁbre metrics, which will be denoted ⟨ , ⟩E
and⟨ , ⟩F , respectively. The adjoint D† : /Gamma1(M, F)→/Gamma1(M, E) of D is deﬁned
by
⟨s′, Ds⟩F ≡⟨D†s′, s⟩E (12.8)
where s∈/Gamma1(M, E) and s′ ∈/Gamma1(M, F).W ed e ﬁ n et h ecokernel of D by
coker D≡/Gamma1(M, F)/imD. (12.9)
Among elliptic operators we are interested in a class of operators whose
kernels and cokernels are ﬁnite dimensional. An elliptic operator D which
satisﬁes this condition is called a Fredholm operator.T h eanalytical index
ind D≡dim ker D−dim coker D (12.10)
is well deﬁned for a Fredholm operator. Henceforth, we will be concerned only
with Fredholm operators. It is known fro m the general theory of operators that
elliptic operators on a compact manifold are Fredholm operators. Theorem 12.1
shows that ind D is also expressed as
ind D= dim ker D−dim ker D†. (12.11)
Theorem 12.1. Let D: /Gamma1(M, E)→/Gamma1(M, F) be a Fredholm operator. Then
coker D∼= ker D† ≡{s∈/Gamma1(M, F)|D†s= 0}. (12.12)
Proof.L e t[s]∈coker D be given by
[s]={ s′ ∈/Gamma1(M, F)|s′ = s+ Du, u∈/Gamma1(M, E)}.
We show that there is a surjection ker D† →coker D, namely any[s]∈coker D
has a representative s0 ∈ker D†.D e ﬁ n es0 by
s0 ≡s−D 1
D† D D†s. (12.13)
We ﬁnd s0 ∈ker D† since D†s0 = D†s−D† D(D† D)−1 D†s= D†s−D†s=
0. Next, let s0, s′
0 ∈ker D† and s0 ̸= s′
0. We show that [s0] ̸=[ s′
0] in
/Gamma1(M, F)/ im D.I f [s0]=[ s′
0], there is an element u ∈/Gamma1(M, E) such that
s0−s′
0 = Du.T h e n0=⟨ u, D†(s0−s′
0)⟩E =⟨ u, D† Du⟩E =⟨ Du, Du⟩F ≥0,
hence Du = 0, which contradicts our assumption s0 ̸= s′
0. Thus, the map
s0 ↦→[s] is a bijection and we have established that coker D∼= ker D†. /A3


## Page 476

12.1.3 Elliptic complexes
Consider a sequence of Fredholm operators,
···→ /Gamma1(M, Ei−1 )
Di−1
−→/Gamma1(M, Ei )
Di
−→/Gamma1(M, Ei+1 )
Di+1
−→··· (12.14)
where{Ei} is a sequence of vector bundles over a compact manifold M.T h e
sequence (Ei , Di ) is called an elliptic complex if Di is nilpotent (that is
Di◦Di−1 = 0) for anyi. The reader may refer to/Gamma1(M, Ei )= /Omega1i (M) and Di = d
(exterior derivative) for example. The adjoint of Di : /Gamma1(M, Ei )→/Gamma1(M, Ei+1 )
is denoted by
D†
i : /Gamma1(M, Ei+1 )→/Gamma1(M, Ei ).
The Laplacian /Delta1i : /Gamma1(M, Ei )→/Gamma1(M, Ei ) is
/Delta1i ≡Di−1 D†i−1+ D†
i Di . (12.15)
The Hodge decomposition also applies to the present case,
si = Di−1si−1+ D†i si+1+ hi (12.16)
where si±1 ∈/Gamma1(M, Ei±1 ) and hi is in the kernel of /Delta1i , /Delta1i hi = 0.
Analogously to the de Rham cohomology groups, we deﬁne
H i (E, D)≡ker Di /imDi−1 . (12.17)
As in the case of the de Rham theory, it can be shown thatH i (E, D) is isomorphic
to the kernel of /Delta1i . Accordingly, we have
dim H i (E, D)= dim Harmi (E, D) (12.18)
where Harmi (E, D) is a vector space spanned by{hi}.T h e index of this elliptic
complex is deﬁned by
ind D≡
m∑
i=0
(−1)i dim H i (E, D)=
m∑
i=0
(−1)i dim ker/Delta1i . (12.19)
The index thus deﬁned generalizes the Euler characteristic, see example 12.2.
How is this related to (12.10)? Consider the complex/Gamma1(M, E)
D
→/Gamma1(M, F).
We may formally add zero on both sides,
0
i
↪→/Gamma1(M, E)
D
→/Gamma1(M, F)
ϕ
→0 (12.20)
where i is the inclusion. The index according to (12.19) is
dim ker D−{dim /Gamma1(M, F)−dim imD}= dim ker D−dim cokerD


## Page 477

where we have noted that dim im i = 0, ker ϕ = /Gamma1(M, F) and coker D =
ker ϕ/ im D. Thus, (12.19) yields the same index as (12.10).
It is often convenient to work with a two-term elliptic complex which has the
same index as the original elliptic complex (E, D).T h i srolling up is carried out
by deﬁning
E+ ≡⊕
r
E2r , E−≡⊕
r
E2r+1 (12.21)
which are called the even bundle and the odd bundle , respectively.
Correspondingly we consider the operators
A≡⊕
r
(D2r + D†2r−1), A† ≡⊕
r
(D2r+1+ D†2r ). (12.22)
We readily verify that A : /Gamma1(M, E+) →/Gamma1(M, E−) and A† : /Gamma1(M, E−) →
/Gamma1(M, E+).F r o mA and A†, we construct the two Laplacians
/Delta1+ ≡A† A=⊕
r,s
(D2r+1+ D†2r )(D2s + D†2s−1)
=⊕
r
(D2r−1 D†2r−1+ D†2r D2r )=⊕
r
/Delta12r (12.23a)
/Delta1−≡AA † =⊕
r
/Delta12r+1. (12.23b)
Then we have
ind(E±, A)= dim ker/Delta1+−dim ker/Delta1−
=
∑
(−1)r dim ker/Delta1r = ind(E, D). (12.24)
Example 12.2. Let us consider the de Rham complex /Omega1(M) over a compact
manifold M without a boundary,
0
i
→/Omega10(M)
d
→/Omega11(M)
d
→···
d
→/Omega1m (M)
d
→0 (12.25)
where m= dim M and d stands for dr : /Omega1r (M)→/Omega1r+1(M). Hr (E, D) deﬁned
by (12.25) agrees with the de Rham cohomology group Hr (M, /CA ). The index is
identiﬁed with the Euler characteristic,
ind(/Omega1∗(M), d)=
m∑
r=0
(−1)r dim Hr (M; /CA )= χ( M). (12.26)
We found in chapter 7 thatbr ≡dim Hr (M./CA ) agrees with the number of linearly
independent harmonic r-forms: dim Hr (M, /CA )= dim Harmr (M)= dim ker/Delta1r ,
where /Delta1r is the Laplacian
/Delta1r = (d+ d†)2 = dr−1d†r−1+ d†r dr (12.27)


## Page 478

d†
r : /Omega1r+1(M)→/Omega1r (M) being the adjoint of dr .N o ww eﬁ n dt h a t
χ( M)=
m∑
r=0
(−1)r dim ker/Delta1r . (12.28)
This relation is very interesting sin ce the LHS is a purely topological quantity
which can be computed by triangulating M, for example, while the RHS is given
by the solution of an analytic equation /Delta1r u= 0. We noted in example 11.6 that
χ( M) is given by integrating the Euler class over M: χ( M)=
∫
M e(TM ).N o w
(12.28) reads
m∑
r=1
(−1)r dim ker/Delta1r =
∫
M
e(TM ). (12.29)
This is a typical form of the index theorem. The RHS is an analytic index while
the LHS is a topological index given by the integral of certain characteristic
classes. In section 12.3, we derive (12.29) from the Atiyah–Singer index theorem.
The two-term complex is given by
/Omega1+(M)≡⊕
r
/Omega12r (M)/Omega1−(M)≡⊕
r
/Omega12r+1(M). (12.30)
The corresponding operators are
A≡⊕
r
(d2r + d†2r−1) A† ≡⊕
r
(d2r−1+ d†2r ). (12.31)
It is left as an exercise to the reader to show that
ind(/Omega1±(M), A)= dim ker A+−dim ker A−= χ( M). (12.32)
12.2 The Atiyah–Singer index theorem
12.2.1 Statement of the theorem
Theorem 12.2. (Atiyah–Singer index theorem )L e t (E, D) be an elliptic
complex over an m-dimensional compact manifold M without a boundary. The
index of this complex is given by
ind(E, D)= (−1)m(m+1)/2
∫
M
ch
(
⊕
r
(−1)r Er
) Td(TM
/BV
)
e(TM )
⏐⏐
⏐⏐
vol
. (12.33)
In the integrand of the RHS, only m-forms are picked up, so that the integration
makes sense. [ Remarks: The division by e(TM ) can really be carried out at the
formal level. If m is an odd integer, the index vanishes identically, see below.
Original references are Atiyah and Singer (1968a, b), Atiyah and Segal (1968).]
The proof of theorem 12.2 is found in Shanahan (1978), Palais (1965) and
Gilkey (1984). The proof found there is based on either K -theory or the heat


## Page 479

kernel formalism. In section 13.2, we give a proof of the simplest version of the
Atiyah–Singer (AS) index theorem for a spin complex. Recently physicists have
found another proof of the theorem maki ng use of supersymmetry. This proof is
outlined in sections 12.9 and 12.10. Interested readers should consult Alvarez-
Gaum´e (1983) and Friedan and Windey (1984, 1985) for further details.
The following corollary is a direct consequence of theorem 12.2.
Corollary 12.1. Let /Gamma1(M, E)
D
→/Gamma1(M, F) be a two-term elliptic complex. The
index of D is given by
ind D= dim ker D−dim ker D†
= (−1)m(m+1)/2
∫
M
(chE−chF)Td(TM
/BV
)
e(TM )
⏐⏐⏐⏐
vol
. (12.34)
12.3 The de Rham complex
Let M be an m-dimensional compact orientable manifold with no boundary. By
now we are familiar with the de Rham complex,
···
d
→/Omega1r−1(M)
/BV
d
→/Omega1r (M)
/BV
d
→/Omega1r+1(M)
/BV
d
→··· (12.35)
where /Omega1r (M)
/BV
= /Gamma1(M,∧r T∗M
/BV
). We complexiﬁed the forms so that we may
apply the AS index theorem. The exterior derivative satisﬁes d 2 = 0. To show
that (12.35) is an elliptic complex, we have to show that d is elliptic. To ﬁnd the
symbol for d, we note that
σ( d,ξ) ω = d( f˜s)|p = d f ∧˜s+ f d˜s|p = ξ∧ω
where p ∈M,ω ∈/Omega1r
p(M)
/BV
, f (p) = 0, d f (p) = ξ,˜s ∈/Omega1r (M)
/BV
and
˜s(p)= ω ; see (12.4). We ﬁnd
σ( d,ξ) = ξ∧. (12.36)
This deﬁnes a map /Omega1r (M)
/BV
→/Omega1r+1(M)
/BV
and is non-singular if ξ ̸= 0.
Thus, we have proved that d : /Omega1r (M)
/BV
→/Omega1r+1(M)
/BV
is elliptic and, hence,
(12.35) is an elliptic complex. Note, however, that the operator d : /Omega1k (M) →
/Omega1k+1(M) is not Fredholm since ker d is inﬁnite dimensional. To apply the index
theorem to this complex, we have to consider the de Rham cohomology group
Hr (M) instead. The operator d is certainly Fredholm on this space.
Let us ﬁnd the index theorem for this complex. We note that
dim
/BV
Hr (M; /BV )= dim
/CA
Hr (M; /CA ). Hence, the analytical index is
ind d=
m∑
r=0
(−1)r dim
/BV
Hr (M; /BV )
=
∑
(−1)r dim
/CA
Hr (M; /CA )= χ( M) (12.37)


## Page 480

where χ( M) is the Euler characteristic of M. Suppose M is even dimensional,
m= 2l. The RHS of (12.33) gives the topological index
(−1)l(2l+1)
∫
M
ch
( m
⊕
r=0
(−1)r ∧r T∗M
/BV
) Td(TM
/BV
)
e(TM )
⏐⏐⏐
⏐
vol
. (12.38)
The splitting principle yields
ch
( m
⊕
r=0
(−1)r ∧r T∗M
/BV
)
= 1−ch(T∗M
/BV
)+ ch(∧2T∗M
/BV
)+···+ (−1)mch(∧m T∗M
/BV
)
= 1−
m∑
i=1
e−xi (TM
/BV
)+
∑
i< j
e−xi e−x j (TM
/BV
)+···
+ (−1)me−x1 e−x2 ... e−xm (TM
/BV
)
=
m∏
i=1
(1−e−xi )(TM
/BV
)
where we have noted that xi (T∗M
/BV
)=−xi (TM
/BV
).[ L e t L be a complex line
bundle and L∗be its dual bundle. L⊗L∗is a bundle whose section is a map
/BV →/BV at each ﬁbre of L. L⊗L∗has a global section which vanishes nowhere
(the identity map, for example) from which we can showL⊗L∗is a trivial bundle.
We havec1(L⊗L∗)= c1(L)+c1(L∗)= 0, hence x(L∗)=−x(L). The splitting
principle yields xi (T∗M
/BV
)=−xi (TM
/BV
).] We also have
Td(TM
/BV
)=
m∏
i=1
xi
1−e−xi
(TM
/BV
)
e(TM )=
l∏
i=1
xi (TM
/BV
).
Substituting these in (12.38), we have
ind d=
∫
M
(−1)l(2l+1)(−1)l
( l∏
i=1
xi (TM
/BV
)
)
=
∫
M
e(TM ). (12.39)
If m is odd, it can be shown that (Shanahan (1978), p22)
ind d= 0 (12.40)
which is in harmony with the fact that e(TM )= 0i fd i mM is odd. In any case,
the index theorem for the de Rham complex is
χ( M)=
∫
M
e(TM ). (12.41)


## Page 481

Example 12.3. Let M be a two-dimensional orientable manifold without
boundary. Equation (12.41) reads
χ( M)= 1
4π
∫
M
ϵαβ
/CA
αβ = 1
2π
∫
M
/CA
12 (12.42a)
which is the celebrated Gauss–Bonnet theorem. For dim M= 4, it reads as
χ( M)= 1
32π 2
∫
M
ϵαβ γ δ
/CA
αβ ∧/CA
γδ .( 12.42b)
12.4 The Dolbeault complex
We recall some elementary facts about co mplex manifolds (see chapter 8 for
details). Let M be a compact complex manifold of complex dimensionm without
a boundary. Let zµ = xµ + iyµ be the local coordinates and ¯zµ = xµ −iyµ
their complex conjugates. TM+ denotes the tangent bundle spanned by{∂/∂ zµ}
and TM−=
 TM+ the complex conjugate bundle spanned by {∂/∂¯zµ}.T h e
dual of TM+ is denoted by T∗M+ and spanned by{dzµ} while that of TM−is
T∗M−=
 T∗M+ spanned by{d¯zµ}. The space /Omega1r (M)
/BV
of complexiﬁed r-forms
is decomposed as
/Omega1r (M)
/BV
=⊕
p+q=r
/Omega1p,q (M)
where /Omega1p,q (M) is the space of the (p, q)-forms, which is spanned by a basis of
the form
dzµ1 ∧... ∧dzµp ∧d¯zν1 ∧... ∧d¯zνq .
The exterior derivative is decomposed as d≡∂+¯∂ where
∂ = dzµ∧∂/∂ zµ ¯∂ = d¯zµ∧∂/∂¯zµ.
They satisfy ∂¯∂+¯∂∂ = ∂ 2 =¯∂ 2 = 0. We have the sequences
···
¯∂
→/Omega1p,q (M)
¯∂
→/Omega1p,q+1(M)
¯∂
→··· (12.43a)
···
∂
→/Omega1p,q (M)
∂
→/Omega1p+1,q (M)
∂
→··· . (12.43b)
We are interested in the ﬁrst sequence with p= 0,
···
¯∂
→/Omega10,q (M)
¯∂
→/Omega10,q+1(M)
¯∂
→··· . (12.44)
This sequence is called the Dolbeault complex.
To show that (12.44) is an elliptic complex, we compute the symbol for ¯∂ .
Let ξ = ξ 0,1+ ξ 1,0 be a real one-form at p∈M,w h e r eξ 0,1 ∈/Omega10,1
p (M) and
ξ 1,0 =
 ξ 0,1 ∈/Omega11,0
p (M).


## Page 482

Take an anti-holomorphic r-form ω ∈/Omega10,r (M).W eﬁ n d
σ(¯∂,ξ)ω =¯∂( f˜s)=¯∂ f ∧˜s+ f¯∂˜s|p = ξ 0,1∧ω
where f (p)= 0,¯∂ f (p)= ξ 0,1,˜s∈/Omega10,r (M) and˜s(p)= ω .W eh a v e
σ(¯∂,ξ) = ξ 0,1∧. (12.45)
From a similar argument to that given in the previous section, it follows that the
symbol (12.45) is elliptic. Thus, the Dolbeault complex (12.44) is an elliptic
complex.
The AS index theorem takes the form
ind¯∂ =
∫
M
ch
( ∑
r
(−1)r ∧r T∗M−
) Td(TM
/BV
)
e(TM )
⏐⏐⏐
⏐
vol
. (12.46)
The LHS is computed as follows. We ﬁrst note that
ker¯∂r /im¯∂r−1 = H 0,r (M)
where H 0,r (M) is the¯∂ -cohomology group. Then the LHS is
ind¯∂ =
n∑
r=0
(−1)r b0,r (12.47)
where b0,r ≡dim
/BV
H 0,r (M) is the Hodge number. This index is called the
arithmetic genus of M.
Simpliﬁcation of the topological index can be carried out as in the case of
the de Rham complex. We refer the reader to Shanahan (1978) for the technical
details. We have n∑
r=1
(−1)r b0,r =
∫
M
Td(TM+) (12.48)
where Td(TM+) is the Todd class of TM+.
12.4.1 The twisted Dolbeault compl ex and the Hirzebruch–Riemann–Roch
theorem
In the Dolbeault complex, we may replace/Omega10,r (M) by the tensor product bundles
/Omega10,r (M)⊗V ,w h e r eV is a holomorphic vector bundle over M,
···
¯∂V
→/Omega10,r−1(M)⊗V
¯∂V
→/Omega10,r (M)⊗V
¯∂V
→··· . (12.49)
The AS index theorem of this complex reduces to the Hirzebruch–Riemann–
Roch theorem,
ind¯∂V =
∫
M
Td(TM+)ch(V ). (12.50)


## Page 483

For example, if m= dim
/BV
M= 1, we have
ind¯∂V = 1
2 dim V
∫
M
c1(TM+)+
∫
M
c1(V )
= (2−g) dim V+
∫
M
i/BY
2π (12.51)
since it can be shown that
∫
M
c1(TM+)=
∫
M
e(TM )= 2−g
g being the genus of M.
12.5 The signature complex
12.5.1 The Hirzebruch signature
Let M be a compact orientable manifold of even dimension, m= 2l.L e t[ω] and
[η] be the elements of the ‘middle’ cohomology group Hl (M; /CA ). We consider a
bilinear form Hl (M; /CA )× Hl (M; /CA )→/CA deﬁned by
σ([ω],[η])≡
∫
M
ω ∧η (12.52)
cf example 11.8. This deﬁnition is independent of the representatives of [ω] and
[η]. The form σ is symmetric if l is even (m ≡0 mod 4) and anti-symmetric if
l is odd (m≡2 mod 4). Poincar´e duality shows that the bilinear form σ has the
maximal rank bl = dim Hl (M; /CA ) and is, hence, non-degenerate. If l ≡2k is
even, the symmetric form σ has real eigenvalues,b+ of which are positive andb−
of which are negative (b++ b−= bl). The Hirzebruch signature is deﬁned by
τ( M)≡b+−b−. (12.53)
If l is odd, τ( M) is deﬁned to vanish (an anti-symmetric form has pure imaginary
eigenvalues). In the following, we set l= 2k.
The Hodge∗satisﬁes∗2 = 1w h e na c t i n go na2k-form in a 4k-dimensional
manifold M and hence ∗has eigenvalues ±1. Let Harm 2k (M) be the set of
harmonic 2k-forms on M. We note that Harm 2k (M) ∼= H 2k(M; /CA ) and each
element of H 2k(M; /CA ) has a unique harmonic representative. Harm 2k (M) is
separated into disjoint subspaces,
Harm2k (M)= Harm2k
+ (M)⊕Harm2k
−(M) (12.54)
according to the eigenvalue of∗. This separation block diagonalizes the bilinear
form σ . In fact, for ω± ∈Harm2k
± (M),
σ( ω+,ω +)=
∫
M
ω+∧ω+ =
∫
M
ω+∧∗ω+ = (ω+,ω +)> 0


## Page 484

where (ω+,ω +) is the standard positive-deﬁnite inner product deﬁned by (7.181).
We also ﬁnd
σ( ω−,ω −)=−
∫
M
ω−∧∗ω−=−(ω−,ω −)< 0
σ( ω+,ω −)=−
∫
M
ω+∧∗ω−=−
∫
M
ω−∧∗ω+ =−σ( ω+,ω −)= 0
where we have noted that α ∧∗β = β ∧∗α for any forms α and β . Hence,
σ is block diagonal with respect to Harm 2k
+ (M)⊕Harm2k
−(M) and, moreover,
b± = dim
/CA
Harm2k
± (M).N o wτ( M) is expressed as
τ( M)= dim Harm2k
+ (M)−dim Harm2k
−(M). (12.55)
Exercise 12.2. Let dim M= 4k. Show that
τ( M)= χ( M) mod 2. (12.56)
[Hint: Use the Poincar´e duality to show that χ( M)= b2k mod 2.]
12.5.2 The signature complex and t he Hirzebruch signature theorem
Let M be an m-dimensional compact Riemannian manifold without a boundary
and let g be the given metric. Consider an operator
/BW ≡d+ d†. (12.57)
/BW is a square root of the Laplacian: /BW
2 = dd† + d†d = /Delta1. To show that /BW
is elliptic, it sufﬁces to verify that /Delta1is elliptic since the symbol of a product of
operators is the product of symbols. Let us compute the symbol of /Delta1. As for d,
we have σ( d,ξ) ω = ξ∧ω .A sf o rd†, it can be shown that (Palais 1965, pp77–8)
σ( d†,ξ) =−iξ . (12.58)
Here iξ : /Omega1r
p(M)→/Omega1r−1
p (M) is an interior product deﬁned by (cf. (5.79))
iξ (dxµ1 ∧... ∧dxµr )
≡
r∑
j=1
(−1)j+1gµj µξµ dxµ1 ∧... ∧dˆxµj ∧... ∧dxµr
where the one-form underˆ is omitted and we put ξ = ξµ dxµ. Now the symbol
of the Laplacian is obtained from (12.58) as
σ( /Delta1,ξ) ω= σ( dd†+ d†d,ξ) ω =−[ξ∧iξ (ω) + iξ (ξ∧ω)]
=−iξ (ξ )∧ω =−∥ξ∥2ω


## Page 485

where ω is an arbitrary r-form and the norm∥∥ is taken with respect to the given
Riemannian metric. Finally, we obtain
σ( /Delta1,ξ)=−∥ξ∥2. (12.59)
Thus, the Laplacian /Delta1is elliptic and so is /BW = d+ d†.
Since the Laplacian /Delta1= /BW
2 is self-dual on /Omega1∗(M), the index of /Delta1vanishes
trivially. It is also observed that /BW = /BW
† on /Omega1∗(M) and, hence, ind /BW = 0.
To construct a non-trivial index theorem, we have to ﬁnd a complex on which
/BW ̸= /BW
†.
Exercise 12.3. Consider the restriction /BW
e of /BW to even forms, /BW
e : /Omega1e(M)
/BV
→
/Omega1o(M)
/BV
where /Omega1e(M)
/BV
≡⊕/Omega12i (M)
/BV
and /Omega1o(M)
/BV
≡⊕/Omega12i+1(M)
/BV
.T h e
adjoint of /BW
e is /BW
o ≡/BW
e† : /Omega1o(M)C →/Omega1e(M)C. Show that
ind /BW
e = dim ker/BW
e−dim ker/BW
o = χ( M).
[Hint: Prove ker /BW
e =⊕Harm2i (M) and ker /BW
o =⊕Harm2i+1(M).T h i s
complex, although non-trivial, does not yield anything new.]
If dim M = m= 2l,w eh a v e∗∗η = (−1)r η for η ∈/Omega1r (M)
/BV
.W ed e ﬁ n e
an operator π : /Omega1r (M)
/BV
→/Omega1m−r (M)
/BV
by
π ≡ir(r−1)+l ∗. (12.60)
Observe that π is a ‘square root’ of (−1)r ∗∗=1. In fact, for ω ∈/Omega1r (M)
/BV
,
π 2ω = ir(r−1)+l π(∗ω) = ir(r−1)+l+(2l−r)(2l−r−1)+l ∗∗ω
= i2r2
∗∗ω = (−1)r ∗∗ω = ω (12.61)
where we have noted that r≡r2 mod 2. We easily verify (exercise) that
{π, /BW }= π /BW + /BW π = 0. (12.62)
Let π act on /Omega1∗(M)
/BV
=⊕/Omega1r (M)
/BV
.S i n c eπ 2 = 1, the eigenvalues of π are±1.
Then we have a decomposition of /Omega1∗(M)
/BV
into the±1 eigenspaces /Omega1±(M) of π
as
/Omega1∗(M)
/BV
= /Omega1+(M)⊕/Omega1−(M). (12.63)
Since /BW anti-commutes with π , the restriction of /BW to /Omega1+(M) deﬁnes an elliptic
complex called the signature complex,
/BW
+ : /Omega1+(M)→/Omega1−(M) (12.64)
where /BW
+ ≡/BW |/Omega1+(M). The index of the signature complex is
ind /BW
+ = dim ker/BW
+−dim ker/BW
−
= dim Harm(M)+−dim Harm(M)− (12.65)


## Page 486

where /BW
−≡/BW
†
+ : /Omega1−(M)→/Omega1+(M) and Harm(M)± ≡{ω ∈/Omega1±(M)|/BW
±ω =
0}. On the RHS of (12.65), all the contributions except those from the harmonic
l-forms cancel out. To see this, we separate ker /BW
+ and ker /BW
−as
ker /BW
± = Harml (M)±⊕
∑
0≤r<l
[Harmr (M)±⊕Harmm−r (M)±]
where Harm r (M)± ≡Harm(M)± ∩/Omega1r (M).I f ω ∈Harmr (M),w eh a v e
ω±πω ∈Harmr (M)±⊕Harmm−r (M)±.T h e nam a pω+πω →ω−πω deﬁnes
an isomorphism between Harm r (M)+ ⊕Harmm−r (M)+ and Harm r (M)−⊕
Harmm−r (M)−. Now the index simpliﬁes as
ind /BW
+ = dim Harm2k (M)+−dim Harm2k (M)− (12.66)
where we put l= 2k as before (the index vanishes if l is odd). It is important to
note that Harm2k (M)± = Harm2k
± (M) since π =∗in Harm2k (M), see (12.54).
Now the index (12.66) reduces to the Hirzebruch signature,
ind /BW
+ = τ( M). (12.67)
The derivation of the topological index is rather technical and we simply
quote the result from Shanahan (1978). Let∧±T∗M
/BV
be the subspace of∧T∗M
/BV
such that /Omega1±(M)= /Gamma1(M,∧±T∗M
/BV
).T h e nw eh a v e
topological index= (−1)l
∫
M
ch(∧+T∗M
/BV
−∧−T∗M
/BV
) Td(TM
/BV
)
e(TM )
⏐⏐
⏐⏐⏐
vol
= 2l
∫
M
l∏
i=1
xi /2
tanh xi /2
⏐
⏐
⏐
⏐
vol
=
∫
M
l∏
i=1
xi
tanh xi
⏐
⏐
⏐
⏐
vol
where the last equality is true only for the 2 l-forms in the expansion and xi =
xi (TM
/BV
). Now we have obtained the Hirzebruch signature theorem
τ( M)=
∫
M
L(TM )|vol (12.68)
where L is the Hirzebruch L-polynomial deﬁned by (11.91). Since L is even in
xi , τ( M) vanishes if m= 2 mod 4. For example, τ( M)= 0f o rm= 2. If m= 4,
we have
τ( M)=
∫
M
1
3 p1(TM )=− 1
24π 2
∫
tr /CA
2. (12.69)
As in the case of the Dolbeault complex, we may twist the signature complex,
see Eguchi et al (1980), for example.
12.6 Spin complexes
The ﬁnal example of classical complexe s is the spin complex. This complex is
very important in physics since it describes Dirac ﬁelds interacting with gauge
ﬁelds and/or gravitational ﬁelds.


## Page 487

12.6.1 Dirac operator
Let us consider a spin bundle S(M) over an m-dimensional orientable manifold
M. We shall denote the set of sections of this bundle by /Delta1(M)= /Gamma1(M, S(M)).
We assume that m= 2l is an even integer. The spin group SPIN(m) is generated
by m Dirac matrices{γ α}, which satisfy
γ α † = γ α (12.70a)
{γ α ,γ β}= 2δαβ . (12.70b)
Throughout this chapter we assume that the metric has the Euclidean signature.
The Clifford algebra is generated by
1; γ α; γ α 1 γ α 2 (α 1 <α 2); ... ;
γ α 1 ...γ α k (α 1 < ... < α k ); ... ; γ 1 ...γ 2l .
The last generator is of particular importance and we deﬁne
γ m+1 ≡il γ 1 ...γ m . (12.71)
Our convention is such that (γ m+1)2 = I and (γ m+1)† = γ m+1. It can be shown
from the general theory of the Clifford algebra that the γ x are represented by
2l × 2l matrices with complex entries. It is convenient to take a representation of
{γ x} such that γ m+1 is diagonal,
γ m+1 =
( 1 0
0 −1
)
(12.72)
where 1 here is the 2l−1× 2l−1 unit matrix.
Example 12.4. For m= 2, we take
γ 0 = σ 2 γ 1 = σ 1 γ 3 = iγ 0γ 1 = σ 3
σ α being the Pauli matrices,
σ 1 =
( 01
10
)
σ 2 =
( 0 −i
i0
)
σ 3 =
( 10
0 −1
)
.
For m= 4, we may take
γ
β =
( 0i α β
−i¯α β 0
)
α β = (I2,−iσ),¯α β = (I2, iσ)
γ 5 =−γ 0γ 1γ 2γ 3 =
( I2 0
0 −I2
)
.


## Page 488

A Dirac spinor ψ ∈/Delta1(M) is an irreducible representation of the Clifford
algebra but not that of SPIN (2l). Irreducible representations of SPIN (2l) are
obtained by separating /Delta1(M) according to the eigenvalues of γ m+1.S i n c e
(γ m+1)2 = I , the eigenvalues of γ m+1, called the chirality,m u s tb e±1. Then
/Delta1(M) is separated into two eigenspaces
/Delta1(M)= /Delta1+(M)⊕/Delta1−(M) (12.73)
where γ m+1ψ± =± ψ± for ψ± ∈/Delta1±(M). The projection operators /C8
± onto
/Delta1± are given by
/C8
+ ≡1
2 (I+ γ m+1)=
( 1 0
00
)
(12.74a)
/C8
−≡1
2 (I−γ m+1)=
( 00
0 1
)
. (12.74b)
Thus, we may write1
ψ+ =
( ψ+
0
)
∈/Delta1+(M), ψ −=
( 0
ψ−
)
∈/Delta1−(M). (12.75)
The reader should verify that /C8
+ + /C8
−= 1,( /C8
±)2 = /C8
±, /C8
+
/C8
−=
0, /C8
±ψ± = ψ± and /C8
±ψ∓= 0.
The Dirac operator in a curved space is given by (section 7.10)
i /∇ψ ≡iγ µ∇∂/∂ xµ ψ = iγ µ(∂µ+ ω µ)ψ (12.76)
where ω µ = 1
2 iω µαβ /Sigma1αβ is the spin connection and γ µ = γ α eα µ. Let us prove
that i /∇is elliptic. Let f be a function deﬁned near p∈M such that f (p)= 0
and iγ µ∂µ f (p)= iγ µξµ ≡i/ξ . 2 T a k eas e c t i o n˜ψ ∈/Delta1(M) such that ˜ψ( p)= ψ .
From (12.4), we have
σ( i /∇,ξ) ψ = i /∇( f ˜ψ) |p = (i /∇f )˜ψ |p = i/ξψ
which shows that
σ( i /∇, /ξ) = i/ξ. (12.77)
If we note that /ξ/ξ = ξα ξβ γ α γ β = ξ µξµ, we ﬁnd that (12.77) is invertible for
i/ξ ̸= 0, hence i /∇is an elliptic operator.
It can be shown that{γ α} is taken in the form
γ β =
( 0i α β
−i¯α β 0
)
α †β =¯α β (12.78)
1 Note the minor abuse of the notation.
2 For a vector A= Aµeµ,̸A denotes γ µ Aµ.


## Page 489

see example 12.4 for m= 2 and 4. Then (12.76) becomes
i /∇=
(
0 D†
D 0
)
(12.79)
where
D≡¯α β eβ µ(∂µ+ ω µ) D† ≡−α β eβ µ(∂µ+ ω µ). (12.80)
Hence, D† is, indeed, the adjoint of D (note that ∂µ+ ω µ is anti-Hermitian). For
( ψ+
0
)
∈/Delta1+(M)
we have
i /∇
( ψ+
0
)
=
(
0 D†
D 0
)( ψ+
0
)
=
( 0
Dψ+
)
while for ( 0
ψ−
)
∈/Delta1−(M)
we have
i /∇
( 0
ψ−
)
=
(
D†ψ−
0
)
.
Hence, D = i /∇/C8
+ : /Delta1+(M) →/Delta1−(M) and D† = i /∇/C8
−: /Delta1−(M) →
/Delta1+(M). Now we have a two-term complex
/Delta1+(M)
D
−→
←−
D†
/Delta1−(M) (12.81)
called the spin complex. The analytical index of this complex is
ind D= dim ker D−dim ker D† = ν+−ν− (12.82)
where ν+ (ν−) is the number of zero-energy modes of chirality+ (−).
Let us apply the AS index theorem to this case. Without getting into the
details of the Clifford algebra and the spin complex, we simply write down the
result. The AS index theorem for the spin complex (12.81) is
ν+−ν−=
∫
M
ch(/Delta1+(M)−/Delta1−(M)) Td(TM
/BV
)
e(TM )
⏐⏐⏐⏐
⏐
vol
=
∫
M
ˆA(TM )|vol (12.83)
where ˆA is the Dirac genus deﬁned by (11.94). Since ˆA contains only 4 j-forms,
ν+−ν−vanishes unless m= 0 mod 4. Of course, this does not necessarily imply
ν+ = ν−= 0. The proof of (12.83) will be given later in sections 12.9 and 12.10.


## Page 490

12.6.2 Twisted spin complexes
In physics, a spinor ﬁeld may belong to a representation of a group G.F o r
example, the quark ﬁeld in QCD belongs to the 3 of SU(3). A spinor which
belongs to a representation of G is a section of the product bundle S(M)⊗
E,w h e r e E is an associated vector bundle of P(M, G) in an appropriate
representation. The Dirac operator DE : /Delta1+(M)⊗E →/Delta1(M)−⊗E in this
case is
DE = iγ α eα µ(∂µ+ ω µ+ /BT
µ)/BW
+ (12.84)
where /BT
µ is the gauge potential on E. The AS index theorem for this twisted spin
complex is
ν+−ν−=
∫
M
ˆA(TM )ch(E)|vol. (12.85)
For dim M= 2, we have
ν+−ν−=
∫
M
ch1(E)= i
2π
∫
M
tr /BY (12.86)
while for dim M= 4,
ν+−ν−=
∫
M
[ch2(E)+ ˆA1(TM )ch0(E)]
= −1
8π 2
∫
M
tr /BY
2+ dim E
192π 2
∫
M
tr /CA
2. (12.87)
Example 12.5. Let
M= T 2l = S1×···× S1

 
 
2l times
.
Then we ﬁnd
ˆA(TM )= ˆA
( 2l
⊕
1
TS 1
)
=
2l∏
1
ˆA(TS 1)= 1.
We also have ˆA(TS 2l )= 1. Accordingly, the index of these bundles is
ν+−ν−=
∫
M
ch(E)|vol. (12.88)
Example 12.6. Let us consider the monopole bundle P(S2, U(1)).I f /BT is the
local gauge potential, the ﬁeld strength is /BY = d/BT . The index theorem is
ν+−ν−= i
2π
∫
S2
/BY =−1
2π
∫
S2
F (12.89)
where /BY = iF. As was shown in section 10.5, the RHS represents the winding
number π 1(U(1))= /CI and analytical information (the LHS) is now expressed in
a topological way (the RHS).


## Page 491

Let P(S4, SU(2)) be the instanton bundle. Expression (12.88) reads as
ν+−ν−=
∫
S4
ch2(/BY )= −1
8π 2
∫
S4
tr /BY
2. (12.90)
The RHS represents the instanton number k∈π 3(SU(2))= /CI . Note that k > 0
if /BY =∗/BY while k < 0i f /BY =−∗/BY . It can be shown that ν−= 0( ν+ = 0)
if k > 0( k < 0), see Jackiw and Rebbi (1977). For example, let /BY be self-dual.
Suppose ψ−∈ker D† = ker DD †. From (12.80), we ﬁnd that
DD † ψ−=[ (∂µ+ /BT
µ)2+ 2i¯σ µν
/BY
µν]ψ−= 0
where¯σ µν ≡(1/4i)(α µ¯α ν −α ν ¯σ µ). It is easily veriﬁed that¯σ µν is anti-self-dual
(¯σ µν =−∗¯σ νµ ) and hence¯σ µν
/BY
µν = 0. Since (∂µ+ /BT
µ)2 is a positive-deﬁnite
operator, it has no normalizable bound states. This veriﬁes that ker D† =∅.
12.7 The heat kernel and generalized ζ-functions
As we mentioned in section 12.2, there are several methods of proving the AS
index theorem. The heat kernel is relatively accessible to physicists and it also
has many applications to other problems in physics. The generalized ζ -function
is related to the heat kernel and also has relevance in physics.
12.7.1 The heat kernel and index theorem
Let E be a complex vector bundle over an m-dimensional compact manifold M.
Let /Delta1: /Gamma1(M, E)→/Gamma1(M, E) be an elliptic operator with eigenvectors|n⟩ such
that
/Delta1|n⟩= λ n|n⟩. (12.91)
We denote the set of eigenvalues of /Delta1by Spec /Delta1. We assume that /Delta1is non-
negative, i.e. all the eigenvalues are non-negative. Suppose there are n0 modes
|0, i⟩, 1≤i≤n0 with vanishing eigenvalue. In other words,
dim ker/Delta1= n0. (12.92)
These modes are called the zero modes.D e ﬁ n et h eheat kernel h(t) by
h(t)≡e−t /Delta1. (12.93)
It is convenient to represent h(t) in the coordinate basis as
h(x, y; t)≡⟨x|h(t)|y⟩=⟨ x|
∑
n
e−t /Delta1|n⟩⟨n|y⟩
=
∑
n
e−t λ n⟨x|n⟩⟨n|y⟩. (12.94)


## Page 492

12.7 THE HEAT KERNEL AND GENERALIZED ζ -FUNCTIONS 473
Multiple eigenstates should be counted as many times as they appear. We assume
⟨x|n⟩ is orthonormal:
∫
⟨n|x⟩⟨x|m⟩dx = δmn . The convergence of (12.93) for
t > 0 is guaranteed since /Delta1is non-negative. Taking the limit t→∞,w eh a v e
limt→∞h(x, y; t)=
n0∑
i=1
⟨x|0, i⟩⟨0, i|y⟩ (12.95)
where the summation is over the zero modes|0, i⟩ only. Thus, h= e−t /Delta1tends to
be the projection operator onto the space of zero modes as
e−t /Delta1t→∞
−→
n0∑
i=1
|0, i⟩⟨0, i|. (12.96)
Deﬁne
˜h(t)≡
∫
h(x, x; t) dx=
∑
n
e−t λ n . (12.97)
Then it follows from (12.95) that
n0 = limt→∞
˜h(t). (12.98)
It is easy to verify that h satisﬁes the heat equation,
( ∂
∂ t + /Delta1x
)
h(x, y; t)= 0. (12.99)
If /Delta1is the conventional Laplacian, (12.99) reduces to the ordinary heat equation.
The initial condition is
h(x, y; 0)=
∑
n
⟨x|n⟩⟨n|y⟩= δ(x−y) (12.100)
where the last equality follows from the completeness of the eigenvectors.
Exercise 12.4. Let u(x, t) be a solution of (12.99) such thatu(x, 0)= u(x).S h o w
that
u(x, t)=
∫
h(x, y; t)u(y) dy. (12.101)
[Hint: First verify that (12.101) satisﬁes the initial condition, next that it is a
solution of the heat equation.]
It is known that the solution of (12.99) has an asymptotic expansion for
t→ε given by
h(x, x; ε)=
∑
i
ai (x)εi (12.102)


## Page 493

see Gilkey (1984). Similarly, h(t) has an expansion
˜h(ϵ)≡
∑
i
ai εi (12.103)
where ai =
∫
ai (x)dx.
Let E and F be complex vector bundles over M and D : /Gamma1(M, E) →
/Gamma1(M, F) be an elliptic operator. We deﬁne two Laplacians
/Delta1E ≡D† D: /Gamma1(M, E)→/Gamma1(M, E) (12.104a)
/Delta1F ≡DD † : /Gamma1(M, F)→/Gamma1(M, F). (12.104b)
It is important to note that they have the same non-vanishing eigenvalues
including the degeneracy. To see this, let /Delta1E|λ⟩= λ|λ⟩. Then there is a vector
D|λ⟩∈/Gamma1(M, F) such that
/Delta1F (D|λ⟩)= DD † D|λ⟩= D/Delta1E|λ⟩= λ( D|λ⟩).
Note that D|λ⟩ ̸= 0s i n c ek e r/Delta1E = ker D.C o n v e r s e l y , i f|µ) ∈/Gamma1(M, F)
satisﬁes /Delta1F|µ)= µ|µ),t h e nD†|µ)∈/Gamma1(M, E) is an eigenvector of /Delta1E with
the same eigenvalue µ. Thus, we have found the symmetry3
Spec′ /Delta1E = Spec′ /Delta1F (12.105)
where the prime denotes that the zero eigenmodes are omitted.
Deﬁne two heat kernels hE and hF by
hE (x, y, t)=
∑
e−λ n⟨x|n⟩⟨n|y⟩ (12.106a)
hF (x, y, t)=
∑
e−µm⟨x|m)(m|y⟩. (12.106b)
We have
limt→∞
˜hE (t)= dim ker/Delta1E = dim ker D (12.107a)
limt→∞
˜hF (t)= dim ker/Delta1F = dim ker D†. (12.107b)
What is more interesting is the index of D.S i n c ek e rD= ker /Delta1E and ker D† =
ker /Delta1F ,w eh a v e
ind D= dim ker D−dim ker D† = dim ker/Delta1E −dim ker/Delta1F
= limt→∞[˜hE (t)−˜hF (t)]= ˜hE (t)−˜hF (t). (12.108)
The ﬁnal equality follows since thet-dependent part of˜hE (t)−˜hF (t) cancels out
by the symmetry (12.105). We expand˜hE (t) and˜hF (t) as
˜hE (t)=
∑
aE
i ti ˜hF (t)=
∑
aF
i ti .
3 This is a kind of ‘supersymmetry’, see section 12.10.


## Page 494

12.7 THE HEAT KERNEL AND GENERALIZED ζ -FUNCTIONS 475
Picking up t-independent terms, we have
ind D= aE
0 −aF
0 =
∫
dx[aE
0 (x)−aF
0 (x)] dx (12.109)
where aE,F
0 (x) are deﬁned in (12.102).
In general, aE,F
0 (x) are local invariants written in terms of curvature two-
forms. In section 13.2, we use the heat kernel to prove the index theorem
ind D= ν+−ν−=
∫
M
ch(/BY )|vol
for the twisted spin complex over a manifold with ˆA(TM )= 1.
Exercise 12.5. Let D, D† ,/Delta1E and /Delta1F be as before. Show that
I (s)≡tr
[ s
/Delta1E + s− s
/Delta1F + s
]
Re s > 0 (12.110)
is independent of s. Show also that I (s)= ind D.
12.7.2 Spectral ζ-functions
Let E and F be vector bundles over M. Deﬁne a new function
ζE (x, y; s)≡
∑′
⟨x|n⟩⟨n|y⟩λ−s
n Re s > 0 (12.111)
where /Delta1E|n⟩= λ n|n⟩ and the prime denotes the omission of the zero modes
(λ n = 0). A function ζF (x, y; s) may similarly be deﬁned for /Delta1F . The functions
hE and ζE are related by the Mellin transformation. To see this, we recall the
deﬁnition of the /Gamma1-function,
/Gamma1(s)≡
∫ ∞
0
ts−1e−t dt= λ s
∫ ∞
0
ts−1e−λ t dt
where λ is taken to be strictly positive. From this we ﬁnd
/Gamma1(s)ζ (x, y; s)=
∑
n
′
∫ ∞
0
ts−1e−λ nt⟨x|n⟩⟨n|y⟩dt
=
∫ ∞
0
ts−1
[
h(x, y; t)−
∑
i
⟨x|0, i⟩⟨0, i|y⟩
]
dt. (12.112)
We also note that
ζ/Delta1(s)≡
∫
M
ζ( x, x; s) dx=
∑
n
′
λ−s
n (12.113)


## Page 495

is the spectral ζ -function deﬁned in (1.158).
Exercise 12.6. Verify that
/Delta1−s f (x)=
∫
ζ( x, y; s) f (y) dy (12.114)
where the general power of an operator may be deﬁned in the sense of an
eigenvalue, namely we put /Delta1−s|n⟩= λ−s
n |n⟩.R e s is assumed to be sufﬁciently
large so that (12.114) is well deﬁned. [ Hint: Use the completeness of the
eigenvectors.]
Example 12.7. The following example is taken from Kulkarni (1975). Let M =
S1 ={ eiθ} and E = F = a trivial line bundle over S1 (a cylinder). Take an
operator /Delta1≡−∂ 2/∂θ 2. From the eigenvalue equation,
−∂ 2einθ
∂θ 2 = n2einθ n∈/CI
we ﬁnd that
λ n = n2 ⟨θ|n⟩= (2π)−1/2einθ .
The heat kernel is
h(θ1,θ 2; t)=
∑
e−n2t⟨θ1|n⟩⟨n|θ2⟩
= 1
2π
(
1+
∑′
e−n2t ein(θ1−θ2)
)
(12.115)
while
ζ( θ1,θ 2; s)=
∑′
n−2s⟨θ1|n⟩⟨n|θ2⟩
= 1
2π
∑′
n−2sein(θ1−θ2). (12.116)
We easily verify that˜h(t)= 1+ ∑′ e−n2t satisﬁes
1+ 2
∫ ∞
1
e−x2t dx < ˜h(t)< 1+ 2
∫ ∞
0
e−x2t dx.
We then ﬁnd from these inequalities that
∫ +∞
−∞
e−x2t dx−1 < ˜h(t)<
∫ +∞
−∞
e−x2t dx+ 1
or by putting the value ∫
e−x2t dx=√
π t−1/2


## Page 496

we ﬁnd √
π t−1/2−1 < ˜h(t)< √
π t−1/2+ 1.
This shows that
lim
t→0+
˜h(t)∼√
π t−1/2. (12.117)
In general, the asymptotic series starts with t−dim M/2.
12.8 The Atiyah–Patodi–Singer index theorem
So far we have been concerned with index theorems deﬁned on a compact
manifold without a boundary. In practical situations in physics, we often need
to ﬁnd an index of an operator deﬁned over a base space M with a boundary.
The extensions of the AS index theorem to these cases are discussed here. Our
argument is restricted to the spin bundle overM since this is the only situation we
shall be concerned with in chapter 13.
12.8.1 η-invariant and spectral ﬂow
Let i /∇be a Hermitian Dirac operator deﬁned on an odd-dimensional manifoldM,
dim M = 2l+ 1. Since i /∇is Hermitian, the eigenvalues λ k are real. We deﬁne
the η-invariant of i /∇by the spectral asymmetry of i /∇,
η ≡
∑
λ k >0
1−
∑
λ k <0
1. (12.118)
This is not well deﬁned and requires a proper regularization. For example, we
may deﬁne η by lims→0 η( s) where
η( s)≡
∑
k
′
sgn(λ k )|λ k|−2s Re s > 0. (12.119)
It can be shown that, under proper boundary conditions,η( s) has no pole ats= 0.
Exercise 12.7. Use the Mellin transformation
1
2 /Gamma1
( s+ 1
2
)
a−(s+1)/2=
∫ ∞
0
dxx se−ax 2
a > 0
to verify that
η( s)= 2
/Gamma1(1
2 (s+ 1))
∫ ∞
0
dxx s tr i/∇e−x2(i /∇)2
. (12.120)
Suppose a Dirac ﬁeld is interacting with an external gauge potential /BT
t , t∈
[0, 1]. The Dirac operator i /∇(/BT
t ) has a t-dependent eigenvalue problem. If
an eigenvalue of i /∇(/BT
t ) crosses zero, the η -invariant jumps by ±2. This jump


## Page 497

Figure 12.1. Whenever an eigenvalue λ crosses zero (a),t h eη -invariant jumps by±2 (b).
The sign depends on the way in which λ crosses zero.
denotes the spectral ﬂow from λ /BR 0 modes to λ /BJ 0 modes; if η jumps by
+2 (−2), there is a ﬂow of a state from λ< 0t o λ> 0( λ> 0t o λ< 0), see
ﬁgure 12.1. In addition to the discontinuous change associated with the spectral
ﬂow, i/∇also has a continuous variation η c.W eh a v e
η( t= 1)−η( t= 0)=
∫ 1
0
dt dη c
dt + 2× (spectral ﬂow). (12.121)
12.8.2 The Atiyah–Patodi–Singer (APS) index theorem
Let us consider a (2l+ 2)-dimensional Dirac operator
iˆD2l+2 = iσ 1
∂
∂ t + σ 2⊗i /∇(/BT
t )=
( 0 D
D† 0
)
(12.122a)
where
D= i∂t −/∇(/BT
t ) D† = i∂t + /∇(/BT
t ). ( 12.122b)
[Remark: The positions of D and D† are reversed since
γ 2l+3 =
( −1 0
0 1
)
for our choice of γ -matrices; cf (12.79).]
Theorem 12.3. (Atiyah–Patodi–Singer theorem)L e tM be an odd-dimensional
manifold and i /∇(/BT
t ) a Dirac operator on M interacting with an external gauge
ﬁeld /BT
t . Then,
ind D= dim ker D−dim ker D†
=
∫
M×I
ˆA(/CA )ch(/BY )|vol−1
2[η( i /∇(/BT
1))−η( i /∇(/BT
0))].
(12.123)


## Page 498

The general argument shows that the continuous part η c of the η -invariant
satisﬁes ∫ 1
0
dt dη c
dt = 2
∫
M×I
ˆA(/CA )ch(/BY )|vol. (12.124)
Then the RHS of (12.123) is simply the spectral ﬂow
−1
2[η( t= 1)−η( t= 0)]+ 1
2
∫ 1
0
dt dη c
dt =−spectral ﬂow.
Thus, we ﬁnd another expression for the APS index theorem,
ind iˆD2l+2 =−spectral ﬂow. (12.125)
The proof of the APS index theorem in its most general form is found in Atiyahet
al (1975a, b, 1976). The physicists’ proof is found in Alvarez-Gaum´e et al (1985).
We use the APS index theorem to study the odd-dimensional parity anomaly in
section 13.6.
Example 12.8. To see why the spectral ﬂow appears in the index theorem, we
consider an example taken from Atiyah (1985). Let M = S1 and θ be its
coordinate. Consider a Hermitian operator
i∇t ≡i
( ∂
∂θ −it
)
= i∂θ + tt ∈/CA . (12.126)
The term −it is thought of as a U(1) gauge potential. The eigenvector and the
eigenvalue of i∇t are
ψ n,t (θ )= 1
√
2π
e−inθ (n∈/CI )λ n (t)= n+ t.
Since Spec i∇t = Spec i∇t+1, the family of operators i∇t is periodic in t with the
period 1, see ﬁgure 12.2. This periodicity manifests itself in the gauge equivalence
of i∇t and i∇t+1:
i∇t+1 = eiθ i∇t e−iθ .
There is precisely unit spectral ﬂow fromλ< 0t o λ> 0a t t= 0 while t changes
from−ε to 1−ε, ε being a small positive number. From i ∇t , we construct a
two-dimensional Dirac operator
i /D2 ≡iσ 1⊗∂
∂ t + σ 2⊗i∇t =
( 0 D
D† 0
)
(12.127a)
where
D≡i∂t + ∂θ −itD † ≡i∂t −∂θ + it.( 12.127b)
These operators act on functions which satisfy the boundary conditions
φ(θ + 2π, t)= φ(θ, t)φ ( θ , t+ 1)= eiθ φ(θ, t). (12.128)


## Page 499

Figure 12.2. Time evolution of the eigenvalues of i∇t .S p e c i∇t has period 1. The ith
eigenvalue crosses zero at t= 0 and, hence, there is a unit spectral ﬂow.
Let φ 0 ∈ker D†. We have a Fourier expansion
φ 0(θ, t)=
∑
an (t)e−inθ .
It follows from D†φ 0 = 0t h a t
a′
n (t)+ (n+ t)an (t)= 0
which is easily solved to yield
an (t)= cn exp
(
−(n+ t)2
2
)
.
The boundary conditions (12.128) require that
∑
n
cn exp
(
−(n+ t+ 1)2
2
)
e−inθ =
∑
n
cn exp
(
−(n+ t)2
2
)
e−i(n−1)θ
from which we ﬁnd that cn is independent of n. Thus, ker D† is one dimensional
and is spanned by the theta function,
φ 0(θ, t)=
∑
exp
(
−(n+ t)2
2 −inθ
)
. (12.129)


## Page 500

Suppose ˜φ 0(θ, t)∈ker D. If we put ˜φ 0(θ, t)= ∑ bn (t)e−inθ , bn (t) satisﬁes
b′
n (t)−(n+ t)bn (t)= 0.
The solution of this equation is
bn (t)= bn (0) exp (n+ t)2
2
and, hence, ˜φ 0 cannot be normalized. This shows that
ind D= dim ker D−dim ker D† =−1
which agrees with−(spectral ﬂow).
12.9 Supersymmetric quantum mechanics
We present, in the next section, the physicists’ proof of the index theorem in
its simplest setting. The proof is heavily based on path integral formulation of
supersymmetric quantum mechanics (SUSYQM), which will be outlined in the
present section.
We have studied the path integral quantization of bosons and fermions.
If these particles are combined together, there appears a new symmetry called
supersymmetry. We will introduce a special class of SUSYQM later, which
turns out to be crucial in the proof of an index theorem.
This and the next sections may be read separately from the previous sections.
The necessary tools are supplied to make these sections self-contained. Our
exposition follows Alvarez (1995) and Nakahara (1998). Original references are
Alvarez-Gaum´e L (1983) and Friedan and Windey (1984, 1985).
12.9.1 Clifford algebra and fermions
We restrict ourselves to a particle moving in
/CA
3 to start with. More general
settings will be studied later. Let {ψ i}={ ψ 1,ψ 2,ψ 3} be real Grassmann
variables, where i= 1, 2, 3 labels the coordinate index. They satisfy the algebra
{ψ i ,ψ j}= 0
Let us consider the Lagrangian
L= i
2 ψ i ˙ψ i −i
2 ϵijk Bi ψ j ψ k (12.130)
where Bi is a real number. The canonical conjugate momentum for ψ i is
π i ≡∂ L
∂ ˙ψ i
=−i
2 ψ i .


## Page 501

Then the Hamiltonian is
H=−˙ψ i
i
2 ψ i −L= i
2 ϵijk Bi ψ j ψ k . (12.131)
The Poincar´e one-form of this system is
θ = i
2 ψ i dψ i . (12.132)
The corresponding symplectic two-form is
ω = dθ = i
2 dψ i ∧dψ i (12.133)
from which we obtain the Poisson bracket
[ψ j , iψ k]PB = iδ jk . (12.134)
Quantization of the system is achieved by r eplacing this Poisson bracket by the
anti-commutation relation
{ψ j ,ψ k}= δ jk . (12.135)
This anti-commutation relation is called theClifford algebra in /CA
3 .L e tσ i be the
ith component of the Pauli matrices. It is easily veriﬁed from the observation
{σ j ,σ k}= 2δ jk
that ψ i = σ i /
√
2 is the two-dimensional representation of the Clifford algebra.
It is known that the ﬁnite-dimensional irreducible representation of the Clifford
algebra is unique (modulo conjugate transformations). Thus, the Hilbert space of
this system turns out to be /C0 = /BV
2 . The Hamiltonian is rewritten in terms of the
Pauli matrices as
H=−1
2 B· σ. (12.136)
This Hamiltonian is known as the Pauli Hamiltonian and describes a spin in a
magnetic ﬁeld.
Similarly, the Clifford algebra deﬁned in /CA
2n and /CA
2n+1 acts on the Hilbert
space /C0 = /BV
2n
.
12.9.2 Supersymmetric quantum mechanics in ﬂat space
The Pauli Hamiltonian is made only of the spin coordinatesψ i and is independent
of the space coordinate xk. Accordingly, it cannot describe a travelling spin. Now
the Hamiltonian is modiﬁed so that the spin may move around the space. This can
be realized by adding a kinetic term to the Hamiltonian. Let us consider a spin in
/CA
d and put B= 0 to obtain the Hamiltonian
L= 1
2˙xk˙xk + i
2 ψ k ˙ψ k . (12.137)


## Page 502

The coefﬁcients of this Lagrangian have been chosen so that the system has a
supersymmetry deﬁned later. The canonically conjugate momenta are pk =˙xk
and π k =−iψ k /2, from which we obtain the Poisson brackets of the system
[x j , xk]PB =[ p j , pk]PB = 0 [x j , pk]PB =[ ψ j ,ψ k]PB = δ jk .
It is easy to derive (anti)commutation relations from these Poisson brackets. The
canonical (anti)commutation relations are
[x j , xk]=[ p j , pk]= 0 [x j , pk]={ ψ j ,ψ k}= δ jk . (12.138)
The Hamiltonian is
H=˙x j p j −˙ψ j
i
2 ψ j −L= 1
2 p2 =−1
2 /Delta1 (12.139)
where /Delta1= ∑d
k=1 ∂ 2
k is the d-dimensional Laplacian. The Hilbert space on which
H acts is L2(/CA
d )⊗/BV
2n
,w h e r eL2(/CA
d ) stands for the set of square-integrable
functions in /CA
d and n≡[d/2] is the integer part of d/2.
Variation of the Lagrangian yields
δ L=˙x j
d
dt δx j + i
2 δψ j ˙ψ j + i
2 ψ j
d
dt δψ j .
Let us verify that the Lagrangian is invariant under the followingsupersymmetry
transformation
δx j = iϵψ j δψ j =−ϵ˙x j (12.140)
where ϵ is an ‘inﬁnitesimal’ real Grassmann constant. In fact,
δ L= i˙x j ϵ˙ψ j −i
2 ϵ˙x j ˙ψ j −i
2 ψ j ϵ¨x j
= i˙x j ϵ˙ψ j −i
2 ϵ˙x j ˙ψ j −i
2
d
dt (ψ j ϵ˙x j )+ i
2
˙ψ j ϵ˙x j
=− i
2
d
dt (ψ j ϵ˙x j ) (12.141)
and the action S = ∫ Ldt is left invariant. The corresponding charge (the
generator) is called the supercharge and deﬁned through the Noether’s theorem
as4
ϵ Q≡iϵp j ψ j = iϵψ j p j = iϵψ j˙x j . (12.142)
Exercise 12.8. Show that
δx j =[ x j ,ϵ Q] (12.143)
δψ j ={ ψ j ,ϵ Q}. (12.144)
4 Note that the mass of the particle is set to unity and hence we have p j =˙x j .


## Page 503

These equations show that Q is the generator of SUSY transformations.
Let us take d = 2n to be an even integer and quantize the system in the
following. We introduce the matrix representation ψ j = γ j /
√
2, which is the
generalization of the two-dimensional r epresentation introduced in the previous
subsection. Here γ j are the d-dimensional Dirac matrices that satisfy the Clifford
algebra
{γ j ,γ k}= 2δij . (12.145)
The Hamiltonian acts on the Hilbert space
/C0 = L2(/CA
2n )⊗/BV
2n
.
The supercharge takes the form, upon diagonalizing the coordinate,
Q= iψ j p j = 1
√
2
γ j
∂
∂ x j
. (12.146)
The operator
/∂ ≡γ j
∂
∂ x j
(12.147)
is nothing but the Dirac operator in Euclidean space /CA
2n and plays an important
role in the proof of the index theorem.
The hypercharge Q transforms in an interesting way under an SUSY
transformation (12.140)
δ Q= i(δψ j )˙x j + i ψ j
d
dt δx j = i(−ϵ˙x j )˙x j + iψ j (iϵ˙ψ j )
=−iϵ˙x j˙x j + ϵψ j ˙ψ j =−2iϵ
( 1
2˙x j˙x j + i
2 ψ j ˙ψ j
)
=−2iϵL. (12.148)
Namely, the variation of the supercharge under an inﬁnitesimal SUSY
transformation is the Lagrangian!
We next consider the relation between the supercharge and the Hamiltonian
of the system. Let us consider successive SUSY transformations with Grassmann
parameters ϵ1 and ϵ2. If a transformation with ϵ1 is applied ﬁrst and then ϵ2 next,
we obtain
x j
ϵ1
→x j + iϵ1ψ j
ϵ2
→x j + i(ϵ1+ ϵ2)ψ j −iϵ1ϵ2˙x j
ψ j
ϵ1
→ψ j −ϵ1˙x j
ϵ2
→ψ j −(ϵ1+ ϵ2)˙x j −iϵ1ϵ2 ˙ψ j
while if the order of the SUSY transformations is reversed,
x j →x j + i(ϵ1+ ϵ2)ψ j −iϵ2ϵ1˙x j
ψ j →ψ j −(ϵ1+ ϵ2)˙x j −iϵ2ϵ1 ˙ψ j .


## Page 504

We ﬁnd, from these results, the commutation relation of the SUSY variations:
[δϵ2 ,δ ϵ1]= δϵ2 δϵ1 −δϵ1 δϵ2 =−2iϵ1ϵ2
∂
∂ t . (12.149)
The observation that the commutation relation of two SUSY transformations
is a time derivative, i.e. the Hamiltonian, suggests that the anti-commutation
relation of the supercharge, the generator of the SUSY transformation, also yields
the Hamiltonian. In fact,
{Q, Q}= 2Q2 = 2(ip j ψ j )(ipk ψ k )
=−p j pk (ψ j ψ k + ψ k ψ j )=−p j pk δ jk
=−2H.
After all, the SUSY algebra reduces to
Q2 =−H. (12.150)
Since Q is anti-Hermitian, the Hamiltoni an is a Hermite operator with non-
negative spectrum.
In summary, we proved in equations (12.148) and (12.141) that
δ Q=−2iϵL δ L= 1
2 ϵ dQ
dt . (12.151)
If these equations are compared with the SUSY transformations (12.140) of
the coordinates x j and ψ j , we readily notice that the roles played by bosonic
quantities (x j and L) and the fermionic quantities ( ψ j and Q) are interchanged.
Note that the variation of the superchargeQ in (12.151) is always a time derivative
of the Lagrangian L. This observation is crucial in constructing a SUSY-invariant
Lagrangian out of a supercharge Q.
12.9.3 Supersymmetric quantum mechanics in a general manifold
Let M be a Riemannian manifold with dim M= 2n. The Riemannian metric is
ds2 = gµν dxµ dxν
and the inner product of two vectorsX and Y with respect to this metric is denoted
as
⟨X, Y⟩= gµν XµY ν .
The vector ψ µ(t) belongs to TM x(t ) at each instant of time t. Therefore,
ψ µ(t) obeys the ordinary transformation rule for a vector under the coordinate
transformation xµ →x′µ = x′µ(xν ):
ψ µ →ψ′µ = ∂ x′µ
∂ xν ψ ν . (12.152)


## Page 505

Then, under the SUSY transformation δ≡δϵ, the coordinates transform as
δx′µ = ∂ x′µ
∂ xν δxν = ∂ x′µ
∂ xν iϵψ ν = iϵψ ′µ
and
δψ ′µ = ∂ 2x′µ
∂ xν ∂ xλ δxλ ψ ν + ∂ x′µ
∂ xν δψ ν
= ∂ 2x′µ
∂ xν ∂ xλ iϵψ λ ψ ν + ∂ x′µ
∂ xν (−iϵ˙xν )=−ϵ˙x′µ
where the anti-commutativity of Grassmann numbers has been used to obtain the
last equality. These transformation rules show that the SUSY transformation is
covariant under the coordinate transformation xµ →x′µ.
The supercharge Q introduced in the previous subsection should be
generalized on the manifold M as
Q= i⟨˙x,ψ ⟩= igµν (x)˙xµψ ν . (12.153)
The SUSY-invariant Lagrangian onM is constructed from the SUSY variation of
this Q as
δ Q= i∂λ gµν δxλ ˙xµψ ν + igµν δ˙xµψ ν + igµν˙xµδψ ν
= i∂λ gµν iϵψ λ ˙xµψ ν + igµν (iϵ˙ψ µ)ψ ν + igµν˙xµ(−ϵ˙xν )
=−2iϵ
[ 1
2 gµν˙xµ˙xν + i
2 gµν ψ ν ˙ψ µ
−i
2˙xµ 1
2
(
∂λ gµν −∂ν gµλ −∂µgλν
)
ψ λ ψ ν
]
=−2iϵ
( 1
2 gµν˙xµ˙xν + i
2 gµν ψ ν ˙ψ µ+ i
2˙xµgλρ /Gamma1ρ µν ψ λ ψ ν
)
where
/Gamma1ν λµ = 1
2 gνρ (
∂λ gρµ + ∂µgλρ −∂ρ gλν
)
is the Christoffel symbol associated with the Levi-Civita connection. Note the
symmetry /Gamma1λ µν = /Gamma1λ νµ . By comparing this δ Q with (12.151), we read off the
Lagrangian,
L= 1
2 gµν (x)˙xµ˙xν + i
2 gµν (x)ψ µ
( dψ ν
dt +˙xλ /Gamma1ν λκ (x)ψ κ
)
= 1
2⟨˙x,˙x⟩+ i
2
⟨
ψ, Dψ
Dt
⟩
. (12.154)
Here Dψ/ Dt is the covariant derivative of ψ along the curve x(t).


## Page 506

Exercise 12.9. Show that the SUSY variation of the Lagrangian is proportional to
the time derivative of the supercharge,
δ L= 1
2 ϵ dQ
dt . (12.155)
The quantum version of the supercharge is
Q∼gµν pµγ ν (12.156)
that is the Dirac operator /∂ on M.
Let us deﬁne some symbols that will be employed in the next section. The
connection one-form is
/Gamma1µ
ν = dxλ /Gamma1µλν (12.157)
while the Riemann curvature two-form is
/CA
µ
ν = d/Gamma1µ
ν + /Gamma1µ
σ ∧/Gamma1σ
ν . (12.158)
The Riemann curvature two-form is expanded in terms of dxρ ∧dxσ to yield
/CA
µ
ν = 1
2 Rµ
νρσ dxρ ∧dxσ (12.159)
the component of which is the ordinary Riemann curvature tensor. This
component is also written in terms of the connection∇µ as
Rκ
λµν =
⟨
dxκ ,∇µ∇ν
∂
∂ xλ −∇ν∇µ
∂
∂ xλ
⟩
= ∂µ/Gamma1κ
νλ −∂ν /Gamma1κ
µλ + /Gamma1η
νλ /Gamma1κ
µη −/Gamma1η
µλ /Gamma1κ
νη . (12.160)
12.10 Supersymmetric proof of index theorem
The proof of the index theorem in its simplest setting will be given in the present
section by making use of the supersymmetric quantum mechanics developed in
the previous section.
12.10.1 The index
Let us consider vector bundles E±
π
−→M, E= E+⊕E−and let /BW be an elliptic
differential operator acting as
/BW : /Gamma1(M, E+)→/Gamma1(M, E−).
It is possible, by using the ﬁbre norm, to deﬁne the adjoint of /BW as
/BW
† : /Gamma1(M, E−)→/Gamma1(M, E+).


## Page 507

Assuming that /BW is Fredholm, the index
Ind /BW = dim ker/BW −dim ker/BW
† (12.161)
is well deﬁned.
Theorem 12.4. The number ind /BW is invariant under a ‘small’ deformation of /BW .
Proof.N o t e ,ﬁ r s t ,t h a t/BW/BW
† and /BW
†
/BW are non-negative and, hence, it follows that
ker /BW = ker /BW
†
/BW ker /BW
† = ker /BW/BW
†.
Let {φ n} be the orthonormal set of eigensections of /BW
†
/BW : /Gamma1(M, E+) →
/Gamma1(M, E+):
(/BW
†
/BW )φ n = λ n φ n .
Deﬁne ψ n ≡/BW φ n /√
λ n for λ n > 0, namely φ n ∈(ker /BW )⊥. Then we ﬁnd that
ψ n is an eigensection with the same eigenvalue λ n, namely ψ n ∈(ker /BW
†)⊥since
(/BW/BW
†)ψ n = /BW (/BW
†
/BW φ n )/
√
λ n = λ n
/BW φ n /
√
λ n = λ n ψ n .
Note also that{ψ n} is an orthonormal eigensection,
⟨ψ n|ψ m⟩= 1
√
λ n λ m
⟨φ n|/BW
†
/BW |φ m⟩= λ m
√
λ n λ m
δnm = δnm .
Thus, it follows that there is a natural isomorphism between (ker /BW )⊥and
(ker /BW
†)⊥. Note, however, that there exists no such isomorphism between ker /BW
and ker /BW
†. Suppose N states in ker /BW obtain non-vanishing eigenvalues as a
result of a small perturbation of the operator /BW and dim ker /BW decreases by N.
Then it follows from this observation that the same number of states must also
leave ker/BW
†.O t h e r w i s e(ker /BW )⊥is no longer isomorphic to(ker /BW
†)⊥. Similary,
if dim ker /BW increases by N,d i m k e r/BW
† must also increase by N to keep the
pairing properties of (ker /BW )⊥and (ker /BW
†)⊥. Therefore, ind /BW is invariant under
small perturbations of /BW . /A3
Theorem 12.5. Let /BW be a Fredholm differential operator. Then its index is given
by
ind /BW = Tr e−β /BW
†
/BW
−Tr e−β /BW/BW
†
(12.162)
where β> 0 is a real constant. In fact, the index is independent of β .


## Page 508

Proof. The traces in (12.162) are over {φ n} and {ψ n}, respectively. Let {φ 0
i}
and{ψ 0
i } be orthonormal eigensections of ker /BW and ker /BW
†, respectively, and
1≤i≤dim ker/BW and 1≤j≤dim ker/BW
†. Then it follows that
Tr e−β /BW
†
/BW
−Tr e−β /BW/BW
†
=
∑
λ n̸=0
⟨φ n|e−β /BW
†
/BW
|φ n⟩−
∑
λ n̸=0
⟨ψ n|e−β /BW/BW
†
|ψ n⟩
+
∑
i
⟨φ 0
i|φ 0
i⟩−
∑
j
⟨ψ 0
j|ψ 0
j⟩
=
∑
λ n̸=0
e−βλ n (⟨φ n|φ n⟩−⟨ψ n|ψ n⟩)+
∑
i
1−
∑
j
1
= dim ker/BW −dim ker/BW
†
= ind /BW .
Since the summations over i and j are independent of β ,i n d/BW thus deﬁned is
independent of β . /A3
The trace that appears in theorem 12. 5 is identiﬁed with the heat kernel.
Let E = E+ ⊕E−and deﬁne a differential operator acting on E by5 (cf
equation (12.79))
iQ≡
(
0 /BW
†
/BW 0
)
: E→E. (12.163)
Moreover, deﬁne a ‘Hamiltonian’ and a matrix /Gamma1by
H= (iQ)2 =
(
/BW
†
/BW 0
0 /BW/BW
†
)
/Gamma1=
( 10
0 −1
)
. (12.164)
Since Q thus deﬁned is anti-Hermitian, the operator H is Hermite and non-
negative. The index of /BW is rewritten in a compact form by making use of /Gamma1
as
ind /BW = Tr /Gamma1e−β H . (12.165)
Let M be a spin manifold, for which the second Stiefel–Whitney class
w2(M) is trivial. Accordingly, the SO( k) principal bundle over M may be lifted
to the SPIN(k) principal bundle as
SO(k) → SPIN(k).
↓π
M
Let E = /Delta1(M) be this spin bundle. Then, associated with /Delta1(M) is a Clifford
algebra{γ µ,γ ν}= 2δµν . Let us deﬁne the chirality operator
γ2n+1 ≡in γ1γ2 ...γ 2n. (12.166)
5 The operator Q will be identiﬁed with the supercharge later.


## Page 509

It follows from γ 2
2n+1 = 1 that the eigenvalues of γ2n+1 are restricted to be ±1,
which we call chirality.
Exercise 12.10. Use the Clifford algebra to show that
γ 2
2n+1 = 1 {γ µ,γ 2n+1}= 0.
The set of sections/Gamma1(M,/Delta1 )for an evenk is not an irreducible representation
of SPIN(k) but can be decomposed into two subspaces according to the chirality
as
/Gamma1(M,/Delta1 )= /Gamma1(M,/Delta1+)⊕/Gamma1(M,/Delta1−) (12.167)
where ψ± ∈/Gamma1(M,/Delta1±) satisfy γ2n+1ψ± =± ψ±. We assign the fermion
number F = 0 to sections in /Gamma1(M,/Delta1+) while F = 1 for those in /Gamma1(M,/Delta1−).
Then the /Gamma1deﬁned in (12.164) can be written as
/Gamma1= (−1)F . (12.168)
It is clear that the operator Q ﬂips the chirality and hence{Q,/Gamma1}= 0.
Let Q be the Dirac operator on M and let /Gamma1= γ2n+1. In fact, it follows from
exercise 12.11 that{Q,γ 2n+1}= 0a n dγ2n+1 is identiﬁed with (−1)F .W h e n/Gamma1
is diagonalized as in (12.164), the chirality eigensections are expressed as6
ψ+ =
( ψ+
0
)
ψ−=
( 0
ψ−
)
. (12.169)
It should be then clear that /BW : /Gamma1(M,/Delta1+)→/Gamma1(M,/Delta1−) and /BW
† : /Gamma1(M,/Delta1−)→
/Gamma1(M,/Delta1+) are identiﬁed with D and D†, respectively, in (12.79). Accordingly,
the index of the Dirac operator is deﬁned as
ind Q= dim ker D−dim ker D†. (12.170)
Physicists often call the sections in ker D and ker D† zero modes. Then, the
index of the Dirac operator is the difference between the number of positive and
negative chirality zero modes. This index has a path integral expression as we see
in the next subsection.
12.10.2 Path integral and index theorem
Let us consider a Dirac operator Q on a 2 n-dimensional spin manifold M.W e
employ Euclidean time (t→−it) from now on.
Let H = (iQ)2 = 1
2 gµν pµ pν be the Hamiltonian corresonding to Q.T h e n
the index of the Dirac operator has a path integral expression
ind Q= Tr /Gamma1e−β H = Tr(−1)F e−β H
=
∫
PBC
/BW x /BW ψ e−
∫ β
0 dtL (12.171)
6 Note the slight abuse of notations. The symbols ψ± have been used to denote sections in /Gamma1(M, S)
as well as those in /Gamma1(M,/Delta1±).


## Page 510

where the Lagrangian L has been introduced in (12.154),
L= 1
2 gµν (x)˙xµ˙xν + 1
2 gµν (x)ψ µ Dψ ν
Dt (12.172)
and PBC stands for the bounda ry condition in which the path integral is over
functions satisfying a periodic boundary condition over[0,β ]. The factor (−1)F
disappears if the anti-periodic boundary c ondition for the fermionic variables is
changed into a periodic one. This can be seen from the following observation. In
the path integral formalism, the trace with (−1)F is (see section 1.5)
tr(−1)F e−β H =
∑
n
⟨n|(−1)F e−β H|n⟩
=
∫
dθ∗dθ⟨−θ|(−1)F e−β H|θ⟩e−θ∗θ (12.173)
where F= c†c is the Fermion number operator. By noting that
|θ⟩=| 0⟩+| 1⟩θ( −1)F|θ⟩=| 0⟩−|1⟩θ =|−θ⟩
this integral is cast into the form
∫
dθ∗dθ⟨θ|e−β H|θ⟩e−θ∗θ . (12.174)
Thus, by eliminating (−1)F , we have to change the boundary condition to a
periodic one.
This path integral is evaluated in the rest of this section to show that it reduces
to a topological index obtained from the Dirac ˆA-genus.
The SUSY transformation in Euclidean time is obtained by the replacement
t→−it in (12.140) as
δxµ = iϵψ µ δψ µ =−iϵ˙xµ.
As was shown in the previous subsection, the index is independent of β and,
hence, we may consider the limit β ↓0 in computing the trace. By rescaling the
time parameter as t= β s, we cast the action into the form
∫ β
0
dt
[ 1
2 gµν (x)˙xµ˙xν + 1
2 gµν (x)ψ µ Dψ ν
Dt
]
=
∫ 1
0
ds
[ 1
β
1
2 gµν (x)dxµ
ds
dxν
ds + 1
2 gµν (x)ψ µ Dψ ν
Ds
]
. (12.175)
Thus, any path with ˙x ̸= 0 has an exponentially small contribution to the path
integral in the limit β ↓0. Accordingly, the contributions to the path integral
come only from paths x(t)= constant in this limit. Clearly, these paths satisfy
the periodic boundary condition.


## Page 511

The periodic boundary condition forces us to take the set of loops in
M, which we will denote as L(M), as the conﬁguration space of the bosonic
coordinates. To apply the saddle point method to the evaluation of the path
integral, we have to ﬁnd the set /C5 of the extrema of the action, namely the
solutions of the classical Euler–Lagrange equations
−gλµ (x)D˙xµ
Dt + 1
2 Rµνλρ ψ µψ ν ˙xρ = 0 (12.176)
Dψ µ
Dt = dψ µ
dt +˙xλ /Gamma1µ
λν ψ ν = 0. (12.177)
It is instructive to outline the derivation of these equations since the anti-
commutativity of Grassmann numbers and the symmetries of the Riemann tensor
are fully utilized. The Euler–Lagrange equation for ψ µ is
0= ∂ L
∂ψ ρ −d
dt
( ∂ L
∂ ˙ψ ρ
)
= 1
2 gρν
Dψ ν
Dt −1
2 gκν ψ κ ˙xλ /Gamma1ν
λρ + 1
2
d
dt
(
gρν ψ ν )
= 1
2
[
gρν
Dψ ν
Dt −gκν ˙xλ /Gamma1ν
λρ ψ κ + (∂λ gρν
)˙xλ ψ ν + gρν ˙ψ ν
]
.
By multiplying both sides by gµρ and summing over ρ ,w eh a v e
0= Dψ µ
Dt −gµρ gκν ˙xλ /Gamma1ν
λρ ψ κ + gµρ (
∂λ gρν
)
˙xλ ψ ν + ˙ψ µ
= Dψ µ
Dt + ˙ψ µ+˙xλ
[
gµρ (
∂λ gρν
)
−gµρ gνκ /Gamma1κ
λρ
]
ψ ν = 2 Dψ µ
Dt
which proves (12.177). Here, use has been made of the identity
gµρ[(∂λ gρν )−1
2 (∂λ gνρ + ∂ρ gνλ −∂ν gλρ )]
= gµρ 1
2
(
∂λ gρν + ∂ν gλρ −∂ρ gνλ
)
= /Gamma1µ
νλ
in the square brackets in the second line above.
Let us prove the equation of motion for xµ next. We ﬁnd
∂ L
∂ xµ −d
dt
( ∂ L
∂˙xµ
)
= 1
2 (∂µgαβ )˙xα ˙xβ + 1
2 (∂µgαβ )ψ α Dψ β
Dt + 1
2 gαβ ψ α ˙xλ ∂µ/Gamma1β
λκ ψ κ
−d
dt
(
gµν˙xν + 1
2 gαβ ψ α /Gamma1β
µκ ψ κ
)
=−[gµν¨xν + 1
2 (∂λ gµν + ∂ν gµλ −∂µgνλ )˙xν˙xλ]


## Page 512

+ 1
2[gαβ ∂µ/Gamma1β
λκ −∂λ gαβ /Gamma1β
µκ −gαβ ∂λ /Gamma1β
µκ]ψ α ψ κ ˙xλ
+ 1
2 gαβ ˙xλ /Gamma1α
λγ ψ γ /Gamma1β
µκ ψ κ + 1
2 gαβ ψ α /Gamma1β
µκ ˙xλ /Gamma1κ
λν ψ ν
=−gµν
D˙xν
Dt + 1
2[gαβ ∂µ/Gamma1β
λκ −gαβ ∂λ /Gamma1β
µκ −∂λ gαβ /Gamma1β
µκ
+ gγβ /Gamma1γ
λα /Gamma1β
µκ + gαβ /Gamma1β
µγ /Gamma1γ
λκ ]ψ α ψ κ ˙xλ
=−gµν
D˙xν
Dt + 1
2 (∂µ/Gamma1β
λκ −∂λ /Gamma1β
µκ + /Gamma1β
µκ /Gamma1γ
λκ )ψ α ψ κ ˙xλ
+ 1
2 (gγβ /Gamma1γ
λα −∂λ gαβ )/Gamma1β
µκ ψ α ψ κ ˙xλ .
The last term of the last line of this equation is written as
[gγβ 1
2 gγν (∂λ gνα + ∂α gνλ −∂ν gλα )−∂λ gαβ ]/Gamma1β
µν ψ α ψ κ ˙xλ
=−1
2 (∂λ gαβ + ∂β gλα −∂α gλβ )/Gamma1β
µν ψ α ψ κ ˙xλ
=−/Gamma1αλβ /Gamma1β
µκ ψ α ψ κ ˙xλ
=−gαβ /Gamma1β
λβ /Gamma1β
µκ ψ α ψ κ ˙xλ
from which we obtain
0=−gµν
D˙xν
Dt + 1
2 (∂µ/Gamma1β
λκ −∂λ /Gamma1β
µκ + /Gamma1β
µγ /Gamma1γ
λκ −/Gamma1β
λγ /Gamma1γ
µκ )ψ α ψ κ ˙xλ
=−gµν
D˙xν
Dt + 1
2 Rακµλ ψ α ψ κ ˙xλ .
Equation (12.176) follows by renaming dummy indices.
Let us come back to the study of the solutions of the equations of motion
(12.176) and (12.177). Clearly, the pair x= constant and ψ = constant is one of
solutions. Therefore, xp : t↦→p∈M is always contained in the solutions, which
may be written as M ⊂/C5 . Equation (12.176) reduces to the geodesic equation
when ψ = 0 but not necessarily so in general. When the fundamental group
π 1(M) is non-trivial, there exist non-contractible geodesics in general. Their
contributions to the path integral, however, vanish exponentially as exp (−c/β)
as β ↓0 and, hence, are negligible.
Before we proceed to the proof of the index theorem, we need to explain the
saddle point method. Let us start with a simple example. Consider the integral
Z=
∫ ∞
−∞
dx
√
2π ¯h e−f (x)/¯h.
The function f (x) is assumed to have only one minimum at x = x0 and that
f (x) →∞as x →± ∞. Let us consider the asymmptotic expansion of the
integral Z when the limit¯h→0 is taken. Put x= x0+√
¯hy and expand f (x) at
x0.T a k i n gf′(x0)= 0 into account, we obtain the expansion
f (x)= f (x0)+ 1
2!¯hy 2 f′′(x0)+ 1
3!¯h3/2y3 f (3)(x0)+ 1
4!¯h2 y4 f (4)(x0)+··· .


## Page 513

If this expansion is substituted into Z,w eh a v e
Z= e−f (x0)/¯h
∫ ∞
−∞
dy
√
2π
× exp
[
−1
2 y2 f′′(x0)−
( 1
3!¯h1/2 y3 f (3)(x0)+ 1
4!¯hy 4 f (4)(x0)+···
)]
.
Let us deﬁne the moment of y by
⟨yn⟩=
∫ dy
√
2π
yne−y2 f′′(x0)/2
∫ dy
√
2π
e−y2 f′′(x0)/2
.
Then we ﬁnally obtain the expansion of Z as
Z= e−f (x0)/¯h
√
f′′(x0)
⟨
exp
[
−1
3!¯h1/2 y3 f (3)(x0)−1
4!¯hy 4 f (4)(x0)···
]⟩
.
One might think that one will get terms of order O (¯h1/2) if⟨···⟩ is expanded.
However, this is not the case since ⟨y3⟩= 0 and one has ⟨···⟩= 1+ O(¯h) in
reality. In the proof of the following index theorem, the parameter ¯h is replaced
by β . The index is, however, independent of β and we conclude that terms of
order O(β) vanish and, hence, we need to take only the extrema of the action and
the second-order ﬂuctuations thereof into account.
Exercise 12.11. Use the previous expansion to prove the Staring formula
n!≃
√
2π ne−nnn (12.178)
for n≫ 1.
Let us come back to SUSYQM. We take the second-order ﬂuctuation around
the solutions of the classical equations of motion in evaluating Z. The principal
contribution to the path integral comes from the solutionx= x0 and ψ = ψ 0.W e
employ the Riemann normal coordinate based at x= x0 to make our life easier.
This is to take a coordinate system in which the metric tensor satisﬁes conditions7
gµν (x0)= δµν
∂
∂ xλ gµν (x0)= 0.
Thus, we haveg≡det g= 1. We deﬁne the ﬂuctuations in this coordinate system
as
xµ(t)= xµ
0 + ξ µ(t)
ψ µ(t)= ψ µ
0 + η µ(t).
7 Of course, this choice does not imply that the Riemann tensor vanishes in general.


## Page 514

Note here that d xµ = dξ µ, dψ µ = dη µ. The second-order expansion of the
action is now written as
S2 =
∫ β
0
dt
[ 1
2
dξ µ
dt
dξ µ
dt + 1
2 η µ dη µ
dt + 1
2
˜
/CA
µν (x0)ξ µ dξ ν
dt
]
(12.179)
w h e r ew eh a v ep u t
˜
/CA
µν (x0)= 1
2 Rµνρσ (x0)ψ ρ
0 ψ σ
0 .
Needless to say, the zeroth-order action S0 = S(x0,ψ 0) vanishes identically.
Let us evaluate the index
ind Q=
∫
/BW ξ /BW η e−S2 (12.180)
using the second-order action S2. Here we have taken the translational invariance
of the path integral measure /BW x/BW ψ = /BW ξ /BW η . Taking the periodic boundary
condition of ξ,η into account, their Fourier expansions are given by
ξ µ = 1
√
β
∞∑
n=−∞
ξ µ
n e2π int /β
η µ = 1
√
β
∞∑
n=−∞
η µ
n e2π int /β .
The ﬂuctuation operator for ξ in S2 is
−δµν
d2
dt2 + ˜
/CA
µν
d
dt
while that for η is
δµν
d
dt .
We have to consider the zero modes ξ µ
0 and η µ
0 ,f o rw h i c hn = 0, separately in
the following Gaussian integrals.8 Taking these into account, we write
ind Q= /C6
∫ d∏
µ=1
dξ µ
0
√
2π
dη µ
0
[
DetPBC′
(
δµν
d
dt
)] 1/2
×
[
DetPBC′
(
−δµν
d2
dt2 + ˜
/CA
µν (x0) d
dt
)] −1/2
= /C6
∫ d∏
µ=1
dξ µ
0
√
2π
dη µ
0
[
DetPBC′
(
−δµν
d
dt + ˜
/CA
µν (x0)
)] −1/2
(12.181)
8 The integrations over ξ0 and η 0 are equivalent with those over x0 and ψ 0.


## Page 515

where′ indicates that the zero modes are omitted while /C6 is the normalization
factor, which takes care of the ambiguities associated with the ordering of
Grassmann numbers. Let us evaluate this factor now.
Since ind Q is independent of β , we put β = 1 for simplicity. We also
simplify our calculation by choosing the metric to be gµν = δµν . Then the
fermion and boson parts separate complet ely. The fermionic part is evaluated,
by noting Hfermion= 0, to yield
Tr γ2n+1 =
∫
PBC
/BW ψ e−1
2
∫ 1
0 ψ ·˙ψ dt
= /C6
f Det′
PBC(δµν ∂t )1/2
∫
dψ 1
0 ··· dψ 2n
0 ,
where ψ µ
0 is the zero mode. The determinant is evaluated as follows. First, note
that the argument in section 1.5 shows that the determinant is, in fact,
Det′
PBC
(∂t + ω )= lim
ε→0
Det′ ((1−εω)∂ t + ω )
where we have introduced the harmonic oscillator frequency ω , which will be set
to zero at the end of the calculation. The ‘partition function’ is
tr(−1)F e−β H = 2s i n h(βω/ 2)
= eβω/ 2 Det′
PBC ((1−εω)∂ t + ω ) . (12.182)
Therefore, the determinant in the limit ω →0i s
Det′
PBC (∂t )= lim
ω→0
e−βω/ 22s i n h(βω/ 2)= 1. (12.183)
Thus, we ﬁnally obtained
Tr γ2n+1 = /C6
f
∫
dψ 1
0 ... dψ 2n
0 . (12.184)
We insert
γ2n+1 = in γ 1
0 ...γ 2n
0 = (2i)n ψ 1
0 ...ψ 2n
0
further in the trace. Since Tr γ 2
2n+1 = Tr I = 2n, we obtain
Tr γ 2
2n+1 = 2n = /C6
f
∫
dψ 1
0 ... dψ 2n
0 (2i)n ψ 1
0 ...ψ 2n
0 = /C6
f (−2i)n
which leads to
/C6
f = in .
Next, we evaluate the normalization factor /C6
b of the boson part. If we employ
imaginary time in (1.101) to obtain⟨x, 1|x, 0⟩= (2π)−1/2,w eh a v e
∫
/BW xµe−1
2
∫ 1
0 ˙xµ 2
= /C6
b
1
Det1/2(−δµν ∂ 2
t )
∫ 2n∏
µ=1
dxµ
√
2π
= (2π)−n
∫ 2n∏
µ=1
dxµ.


## Page 516

The determinant is evaluated using theζ -function regularization as in section 1.4.
The eigenvalue of −d2/dt2 with the periodic boundary condition is λ n =
(2nπ/ β )2 and then
Det′
PBC
(
−d2
dt2
)
=
∏
n∈/CI ,n̸=0
( 2π n
β
) 2
.
The spectral ζ -function is
ζ−d2/dt2 (s)=
∞∑
n∈/CI ,n̸=0
[ ( 2nπ
β
) 2]−s
= 2
( β
2π
) 2s
ζ( 2s)
from which we ﬁnd
ζ′
−d2/dt2 (0)= 4l o g(β/ 2π) e2s log(β/ 2π) ζ( 2s)+ 4e2s log(β/ 2π) ζ′(2s)|s=0
= 4[log(β/ 2π) ζ( 0)+ ζ′(0)]=−2l o gβ.
Therefore, the determinant is
Det′
PBC
(
−d2
dt2
)
= exp[−ζ′
−d2/dt2 (0)]= β 2. (12.185)
By putting β = 1, we ﬁnd Det′
PBC
(
−d2/dt2)
= 1. Thus, we have obtained the
normalization factor
/C6
b = 1.
Putting these results together, we have shown that /C6 = /C6
f
/C6
b = in.
Accordingly, the index is expressed as
ind Q= in
∫ d∏
µ=1
dξ µ
0
√
2π
dη µ
0
[
DetPBC′
(
−δµν
d
dt + ˜
/CA
µν (x0)
)] −1/2
. (12.186)
Let us evaluate the functional determinant in (12.186). Since the Fermi
variables are contained only in ˜
/CA
µν (x0) and this is Grassmann-even, we pretend
this part is a commuting number for the time being. The anti-symmetry of the
Riemann tensor implies that ˜
/CA
µν (x0) satisﬁes ˜
/CA
µν =−˜
/CA
νµ . Therefore, it is
possible, in an even-dimensional manifold M, to block-diagonalize ˜
/CA
µν in the
form
˜
/CA
µν =





0 y
1
−y1 0
. . .
0 yn
−yn 0





. (12.187)


## Page 517

Let us concentrate on the ﬁrst block. The operator
−δµν
d
dt + ˜
/CA
µν (x0)
is real and, hence, the eigenvalues are made of complex conjugate pairs. Let us
express the determinant of this block in terms of the product of these complex
eigenvalues. We ﬁnd
det′


−d
dt y1
−y1 −d
dt

 = Det′
(
d2
dt2 + y2
1
)
=
∏
n̸=0
(
y2
1 −(2π n/β) 2
)
=

∏
n≥1
( 2π n
β
) 2 ∏
n≥1
[
1−
( y1β
2π n
) 2] 

2
=
( sin β y1/2
y1/2
) 2
. (12.188)
Now the index is expressed as
ind Q= in
∫ 2n∏
µ=1
dξ µ
0
√
2π
dη µ
0
n∏
j=1
yj /2
sin β yj /2 . (12.189)
The product with respect to j is written as
1
β d/2 det
(
β ˜
/CA /2
sin β ˜
/CA /2
) 1/2
.
Note that any Taylor expansion with respect to ˜
/CA terminates at ﬁnite order since
˜
/CA
p = 0f o rp > d/2.
We have evaluated the contributions of the second-order ﬂuctuations around
a particular pair x0,ψ 0 so far. Now we need to take the contributions coming
from all the solutions to the classical equations of motion into account. We have
noted before that the set /C5 of the solutions of the equations of motion contains
the constant solution (x0,ψ 0) as a subset and that the contributions from non-
constant solutions are exponentially small as β ↓0. Therefore, we neglect all
periodic solutions except for constant solutions. If we note the expansion
xµ = xµ
0 + 1
√
β ξ µ
0 +···
we ﬁnd that the integral over x0 is equivalent with that over ξ0/√
β , namely
dxµ
0 = dξ µ
0 /√
β . This argument is also applied to the Grassmannian zero mode


## Page 518

and we ﬁnd dψ µ
0 =√
β dη µ
0 . In summary, the index is now written as
ind Q= in
∫ 2n∏
µ=1
dxµ
0
√
2π
dψ µ
0
1
β d/2 det
(
β ˜
/CA /2
sin β ˜
/CA /2
) 1/2
. (12.190)
We make the following change of variables to erase the apparent β -dependence
of the index,
ψ µ
0 = χ µ
0
√
2πβ , dψ µ
0 =
√
2πβ dχ µ
0 .
Substituting
β ˜
/CA
µν = 1
2π
1
2
/CA
µνρσ χ ρ
0 χ σ
0
into the integrand, we obtain
ind Q= in
∫ 2n∏
µ=1
dxµ
0 dχ µ
0 det


1
2
1
2π
1
2
/CA
µνρσ (x0)χ ρ
0 χ σ
0
sin 1
2
1
2π
1
2
/CA
µνρσ (x0)χ ρ
0 χ σ
0


1/2
. (12.191)
This is the Atiyah–Singer index theorem for the Dirac operator.
Let us rewrite the previous theorem in a more familiar form. Note that only
terms of order 2 n in χ in the integrand yield non-vanishing contributions upon
integration over ∏ dχ µ
0 . Note also that ∏ dxµ
0 is just an ordinary volume element.
Then deﬁne the curvature two-form
/CA
µν = 1
2 Rµνρσ dxρ ∧dxσ . (12.192)
Then note that /CA / sin /CA is even in /CA and, hence, the integral is non-vanishing
only when n is even, that is only when d is a multiple of four. If this is the case,
the factor in takes only±1 and we can formally replace the integrand as
in
/CA
sin /CA
→
/CA
sinh /CA
.
The reader should verify the ﬁrst few terms. Then the index is now written in the
well-known form as
ind Q=
∫
M
det


1
2
1
2π
/CA
sinh 1
2
1
2π
/CA


1/2
.
We, moreover, deﬁne the ˆA-genus. Since /CA is anti-symmetric, it can be block-


## Page 519

diagonalized as
1
2π
/CA
µν =




0 x
1
−x1 0
. . .
0 xn
−xn 0




.
Then deﬁne the ˆA-genus of M by
ˆA(M)=
n∏
j=1
x j /2
sinh x j /2 (12.193)
where the RHS is deﬁned by its formal expansion with respect to x j .
In summary, we have proved the Atiyah–Singer index theorem in the
simplest setting (the spin complex).
Theorem 12.6. (Index theorem for a spin complex ) The index of a Dirac
operator deﬁned in M is
ind Q=
∫
M
ˆA(M). (12.194)
Problems
12.1 In the text, we dealt only with compact manifolds. The extension of the AS
index theorem to non-compact manifolds is the Callias–Bott–Seely index theorem
(Callias 1978, Bott and Seely 1978). Here we consider the simplest case studied
by Hirayama (1983). Consider a pair of operators
L≡1
i
d
dx −iW (x) L† ≡1
i
d
dx + iW (x)
where W (+∞)= µ and W (−∞)= λ .
(a) Show that Spec ′ L† L = Spec′ LL †, where the prime indicates that the zero
eigenvalues are omitted.
(b) Show that
J (z)≡tr
( z
L† L+ z− z
LL †+ z
)
= 1
2
( µ
(µ2+ z)1/2 − λ
(λ 2+ z)1/2
)
.


## Page 520

13
ANOMALIES IN GAUGE FIELD THEORIES
In particle physics, symmetry principles are some of the most important
concepts in model building. Symmetries play crucial roles for the theory to be
renormalizable and unitary. The Lagrangian must be chosen so that it fulﬁls
the observed symmetry. Note, however, that the symmetry of the Lagrangian is
classical. There is no warranty that symmetry of the Lagrangian may be elevated
to a quantum symmetry, i.e., the symmetry of the effective action. If the classical
symmetry of the Lagrangian cannot be maintained in the process of quantization,
the theory is said to have ananomaly. There are many types of anomaly: the chiral
anomaly, gauge anomaly, gravitational anomaly, supersymmetry anomaly and so
on. Each adjective refers to the symmetry under consideration. In the present
chapter we look at the geometrical and topological structures of the anomalies
appearing in gauge theories.
We follow closely Alvarez-Gaum´e (1986), Alvarez-Gaum´e and Ginsparg
(1985) and Sumitani (1985). See Rennie (1990) and Bartlmann (1996) for a
complete analysis of the subject. Mickelsson (1989) and Nash (1991) have a
section on anomalies from a more mathematical point of view.
13.1 Introduction
Before we introduce topological and geometrical methods to anomalies, we give
a brief survey of the subject here. Let ψ be a massless Dirac ﬁeld in four-
dimensional space interacting with an external gauge ﬁeld /BT
µ = Aµα Tα ,w h e r e
{Tα} is the set of anti-Hermitian generators of the gauge group G which is
compact and semisimple (SU (N), for example). The theory is described by the
Lagrangian
/C4 = i¯ψγ µ(∂µ−/BT
µ)ψ. (13.1)
The Lagrangian is invariant under the usual (local) gauge transformation
ψ( x)→g−1ψ( x) /BT
µ(x)→g−1[/BT
µ(x)+ ∂µ]g. (13.2)
It also has a global symmetry,
ψ( x)→eiγ5α ψ( x) ¯ψ( x)→¯ψ( x)eiγ5α (13.3)


## Page 521

called the chiral symmetry. The chiral current j5 derived from this symmetry is
j µ
5 ≡¯ψγ µγ5ψ. (13.4)
In general, whether the symmetry of a Lagr angian is retained under quantization
is not a trivial question. In fact, it has been shown that the chiral symmetry of /C4
is destroyed at the quantum level. Adler (1969) and Bell and Jackiw (1969) have
shown by computing the triangle diagram with an external axial current and two
external vector currents that the naive conservation law ∂µ j µ
5 = 0 is violated,
∂µ j µ
5 = 1
16π 2 ϵκλµν tr /BY
κλ
/BY
µν
= 1
4π 2 tr
[
ϵκλµν ∂κ
(
/BT
λ ∂µ
/BT
ν + 2
3
/BT
λ
/BT
µ
/BT
ν
)]
(13.5)
where tr is a trace over the group indices. The current j µ
5 which appears in (13.5)
has no group index, and, hence, (13.5) is called the Abelian anomaly.
It is interesting to study the behaviour of a current which carries the group
index. Consider a Weyl fermion ψ which couples with an external gauge
ﬁeld. The non-Abelian gauge current of the theory also satisﬁes an anomalous
conservation law which deﬁnes the non-Abelian anomaly. The action is given
by
/C4 ≡ψ †(i /∇)/C8
+ψ /C8
± = 1
2 (I± γ 5). (13.6)
The Lagrangian has the gauge symmetry
/BT
µ →g−1(/BT
µ+ ∂µ)g ψ →g−1ψ. (13.7)
The corresponding non-Abelian current is
j µα ≡ψ †γ µT α
/C8
+ψ. (13.8)
It has been shown by Bardeen (1969) and Gross and Jackiw (1972) that, up to the
one-loop level, the current is not conserved,
(/BW
µ j µ
δ )α = 1
24π 2 tr
[
T α ∂κ ϵκλµν
(
/BT
λ ∂µ
/BT
ν + 1
2
/BT
λ
/BT
µ
/BT
ν
)]
. (13.9)
At ﬁrst sight, the RHSs of (13.5) and (13.9) look very similar. However, the
difference between the normaliza tion and the numerical factors of 2
3 and 1
2 have
a deep topological origin. We shall see later that the Abelian anomaly in (2l+ 2)
dimensions and the non-Abelian anomaly in 2l dimensions are closely related but
in an unexpected manner.


## Page 522

13.2 Abelian anomalies
Henceforth, we work in an even-dimensional manifold M (dim M = m = 2l)
with a Euclidean signature. Four-dimensional results will readily be obtained by
putting m = 4. We assume our system is non-chiral, namely, the gauge ﬁeld
couples to the right and the left components in the same way. Our convention is
γ µ† = γ µ {γ µ,γ ν}= 2δµν γ m+1 = (i)l γ 1 ...γ m
γ m+1† = γ m+1 (γ m+1)2 =+ I.
The Lie group generators{Tα} satisfy
T †α =−Tα [Tα , Tβ]= fαβ γ Tγ tr(T α T β )=−1
2 δαβ .
13.2.1 Fujikawa’s method
Among several methods of deriving anomalies, Fujikawa’s way (Fujikawa 1979,
1980, 1986) reveals the topological and geometrical nature of the problem most
directly. This method is equivalent to the heat kernel proof of the relevant index
theorem.
Let ψ be a massless Dirac ﬁeld interacting with an external non-Abelian
gauge ﬁeld /BT
µ. The effective action W[/BT ] is given by
e−W[/BT ] =
∫
/BW ψ /BW
¯ψ e−
∫
dx ¯ψ i /∇ψ (13.10)
where i /∇=iγ µ∇µ = iγ µ(∂µ + ω µ + /BT
µ), with ω µ = 1
2 ω µαβ /Sigma1αβ being the
spin connection of the background space. We compactify the space in such a
way that the geometry (the spin connection) plays no role. For example, this
can be achieved by compactifying /CA
4 to S4 = /CA
4 ∪{∞}, for which the Dirac
genus ˆA(TM ) is trivial; see example 12.5. If this is the case, the spin connection
is irrelevant and may be dropped from i /∇. The classical action
∫
dx¯ψ i /∇ψ is
invariant with respect to the chiral rotation,
ψ →eiγ m+1α ψ ¯ψ →¯ψ eiγ m+1α . (13.11)
We expand ψ and ¯ψ as
ψ =
∑
i
ai ψ i ¯ψ =
∑
i
¯bi ψ †
i (13.12)
where ai and¯bi are anti-commuting Grassmann variables,
{ai , a j}= 0 {¯bi ,¯b j}= 0 {ai ,¯b j}= 0
and ψ i is an eigenvector of the Dirac operator
i /∇ψ i = λ i ψ i . (13.13)


## Page 523

Since i /∇is Hermitian, λ i is real. Since M is compact, ψ i can be normalized as
⟨ψ i|ψ j⟩=
∫
dxψ †
i (x)ψ j (x)= δij .
Now the path integrals over ψ and ¯ψ are replaced by those over ai and¯bi .
Consider an inﬁnitesimal chiral transformation,
ψ( x)→ψ( x)+ iα( x)γ m+1ψ( x) (13.14a)
¯ψ( x)→¯ψ( x)+ i¯ψ( x)α( x)γ m+1. (13.14b)
As usual, we take α = α( x) to be x-dependent. Under this change, the classical
action transforms as∫
dx ¯ψ i /∇ψ →
∫
dx (¯ψ + i¯ψαγ m+1)i /∇(ψ + iαγ m+1ψ)
=
∫
dx ¯ψ i /∇ψ + i
∫
dx[α ¯ψγ m+1i /∇ψ + ¯ψ i /∇(αγ m+1ψ)]
=
∫
dx ¯ψ i /∇ψ −
∫
dx[α ¯ψγ m+1γ µ(∂µ+ /BT
µ)ψ
+ ¯ψγ µ(∂µ+ /BT
µ)(αγ m+1ψ)]
=
∫
dx ¯ψ i /∇ψ +
∫
dx α( x)∂µ j µ
m+1(x) (13.15)
where we have used the anti-commutation relations{γ µ,γ m+1}= 0a n d
j µ
m+1(x)≡¯ψ( x)γ µγ m+1ψ( x) (13.16)
is the chiral current . This is the higher-dimensional analogue of j µ
5 deﬁned
previously. If (13.15) were the only change caused by (13.14), naive application
of the Ward–Takahashi relation would imply the conservation of the axial current
∂µ j µ
m+1 = 0. In quantum theory, however, we have an additional change, namely
the change of the path integral measure. Deﬁne the chiral-rotated ﬁelds by
ψ′ = ψ + iαγ m+1ψ =
∑
a′
i ψ i (13.17a)
¯ψ′ = ¯ψ + i¯ψαγ m+1 =
∑ ¯b′
i ψ †
i . (13.17b)
Now the measure changes as
∫ ∏
i
dai d¯bi →
∫ ∏
i
da′
i d¯b′
i . (13.18)
From the orthonormality of{ψ i},w eﬁ n dt h a t
a′
i =⟨ψ i|ψ′⟩=⟨ ψ i|(1+ iαγ m+1)ψ⟩
=
∑
j
⟨ψ i|(1+ iαγ m+1)ψ j⟩a j ≡
∑
j
Cij a j (13.19a)


## Page 524

where
Cij =⟨ ψ i|(1+ iαγ m+1)ψ j⟩= δij + iα⟨ψ i|γ m+1ψ j⟩. (13.20)
The measure in terms of the new variables is
∏
da′
j =[ det Cij]−1 ∏
dai = exp(−tr lnCij )
∏
dai
= exp[−tr ln(I+ iα⟨ψ i|γ m+1ψ j⟩)]
∏
dai
≈exp(−tr iα⟨ψ i|γ m+1ψ j⟩)
∏
dai
= exp
(
−iα
∑
i
⟨ψ i|γ m+1ψ i⟩
) ∏
dai (13.21)
where the inverse of the determinant appears since ai and a′
i are Grassmann
variables, see Berezin (1966).1 As for¯bi →¯b′
i ,w eh a v e
¯b′
i =
∑
j
¯b j⟨ψ j|(1+ iαγ m+1)|ψ i⟩=
∑
j
C ji ¯b j .( 13.19b)
The Jacobian for the change ¯bi →¯b′
i agrees with (13.21). Thus, the measure
transforms under the chiral rotation (13.17) as
∏
i
dai d¯bi →
∏
i
da′
i d¯b′
i exp
(
−2i
∫
dx α( x)
∑
ψ †
n (x)γ m+1ψ n (x)
)
.
(13.22)
Now the effective action has two expressions:
e−W[/BT ] =
∫ ∏
i
dai d¯bi exp
(
−
∫
dx ¯ψ i /∇ψ
)
=
∫ ∏
i
da′
i d¯b′
i exp
(
−
∫
dx ¯ψ i /∇ψ −
∫
dx α( x)∂µ j µ
m+1(x)
−2i
∫
dx α( x) A(x)
)
(13.23)
where
A(x)≡
∑
i
ψ †
i (x)γ m+1ψ i (x). (13.24)
Since α( x) is arbitrary, we have
∂µ j µ
m+1(x)=−2i A(x). (13.25)
1 See section 1.5. For example, we have
∫
a da =
∫
ca d(ca) = 1, c ∈/CA and a being a real
Grassmann number. This shows that d(ca)= da/c.


## Page 525

Thus, naive conservation of an axial current does not hold in quantum theory.
This non-conservation of the current j µ
m+1 is called the Abelian anomaly (or
chiral anomaly or axial anomaly).
How is this related to the topology? Let us look at the Jacobian (13.22)
and assume that α( x) is independent of x.2 The integral in (13.22) is not well
deﬁned and must be regularized. We introduce the Gaussian cut-off (heat kernel
regularization) as
∫
dx A(x)=
∫
dx
∑
i
ψ †
i (x)γ m+1ψ i (x) exp[−(λ i /M)2]|M→∞
=
∑
⟨ψ i|γ m+1 exp[−(i /∇/M)2]|ψ i⟩|M→∞. (13.26)
In (13.26), 1 /M2 corresponds to the ‘time’ parameter t in the previous chapter
and M→∞implies t→ε.L e t|ψ i⟩ be an eigenstate of i /∇with non-vanishing
eigenvalue λ i . Among the eigenstates, there exists a state|ψ i⟩χ ≡γ m+1|ψ⟩ with
eigenvalue−λ i :
i /∇|ψ i⟩χ = i /∇γ m+1|ψ i⟩=−γ m+1i /∇|ψ i⟩
=−λ i γ m+1|ψ i⟩=−λ i|ψ i⟩χ
where use has been made of the anti-commutation relation{γ m+1, i /∇}=0. Since
i /∇is a Hermitian operator, eigenvectors which belong to different eigenvalues are
orthogonal, hence⟨ψ i|ψ i⟩χ =⟨ ψ i|γ m+1|ψ i⟩= 0. This shows that
⟨ψ i|γ m+1 exp[−(i /∇/M)2]|ψ i⟩=⟨ ψ i|γ m+1|ψ i⟩ exp[−(λ i /M)2]= 0.
Thus, the contribution to the RHS of (13.26) comes only from the zero-energy
modes. Let |0, i⟩ be the zero-energy modes of i /∇, (1 ≤i ≤n0).T h e y a r e
not in an irreducible representation of the spin algebra and should be classiﬁed
according to the eigenvalue of γ m+1. We write
γ m+1|0, i⟩± =±| 0, i⟩±. (13.27)
Then, (13.26) becomes
∫
dx A(x)=
∑
⟨ψ i|γ m+1 exp[−(i /∇/M)2]|ψ i⟩|M→∞
=
∑
+
i
⟨0, i|0, i⟩+−
∑
−
i
⟨0, i|0, i⟩−
= ν+−ν−= ind i/∇+ (13.28)
where ν+ (ν−) is the number of zero-energy modes with positive (negative)
chirality (ν++ ν−= n0)a n di /∇+ is deﬁned by
i /∇=
( 0i /∇−
i /∇+ 0
)
i /∇−= (i /∇+)†.
2 We are looking at the zero-momentum Ward–Takahashi relation.


## Page 526

The Atiyah–Singer index theorem now comes into the problem.
To show that (13.28), indeed, represents an integral of the relevant Chern
character, we ﬁrst note that
(i /∇)2 =−γ µγ ν∇µ∇ν =−{δµν + 1
2[γ µ,γ ν]} 1
2[{∇µ,∇ν}+ /BY
µν]
=−∇µ∇µ−1
4[γ µ,γ ν]/BY
µν (13.29)
where use has been made of the relation[∇µ,∇ν]= /BY
µν .T h e n
A(x)=
∑
i
⟨ψ i|x⟩⟨x|γ m+1 exp[(∇2+ 1
4[γ µ,γ ν]/BY
µν )/M2]|ψ i⟩|M→∞. (13.30)
Let us take m= 4 for deﬁniteness. We introduce the plane wave basis as
⟨x|ψ i⟩=
∫ d4k
(2π) 4⟨x|k⟩⟨k|ψ i⟩.
Then (13.30) becomes
A(x)=
∫ dk
(2π) 4
∫ dk′
(2π) 4
∑
i
⟨ψ i|k′⟩⟨k′|x⟩
× γ m+1 exp[(∇2+ 1
4[γ µ,γ ν]/BY
µν )/M2]⟨x|k⟩⟨k|ψ i⟩
⏐⏐
⏐
⏐
M→∞
y→x
=
∫ dk
(2π) 4 tr γ m+1 exp[(−k2+ 1
4[γ µ,γ ν]/BY
µν )/M2]M→∞(13.31)
where use has been made of the completeness property
∑
i
⟨k|ψ i⟩⟨ψ i|k′⟩= (2π) 4δ4(k−k′).
In (13.31), we have replaced ∇2 by the symbol −k2 since the residual terms
containing /BT do not survive in the limit M →∞. If we put ˜kµ ≡kµ/M,
(13.31) becomes
A(x)= tr[γ 5 exp(1
4[γ µ,γ ν]/BY
µν /M2)]M4
∫ d˜k
(2π) 4 exp(−˜k2).
We expand the ﬁrst exponential and use
tr γ 5 = tr γ 5γ µγ ν = 0t r γ 5γ κ γ λ γ µγ ν =−4ϵκλµν
∫
d˜k exp(−˜k2)= π 2


## Page 527

to obtain
A(x)= 1
2 tr
[
γ 5 1
42{[γ µ,γ ν]/BY
µν}2
] 1
16π 2
= −1
32π 2 tr ϵκλµν
/BY
κλ (x)/BY
µν (x). (13.32)
Note that the higher-order terms in the expansion of the exponential vanish in the
limit M→∞. The anomalous conservation law (13.25) now becomes
∂µ j µ
5 = 1
16π 2 tr ϵκλµν
/BY
κλ
/BY
µν
= 1
4π 2 tr[ϵκλµν ∂κ (/BT
λ ∂µ
/BT
ν + 2
3
/BT
λ
/BT
µ
/BT
ν )]. (13.33)
This is regarded as a local version of the AS index theorem. Let us write (13.33)
in terms of the ﬁeld strength
/BY = 1
2
/BY
µν dxµ∧dxν . We easily verify that
ν+−ν−=
∫
M
dx ∂µ j µ
m+1 =
∫
M
ch2(/BY ). (13.34)
This is the index theorem for a twisted spinor complex with trivial background
geometry (ˆA(TM )= 1).
For dim M= m= 2l, we have the following identity:
ν+−ν−=
∫
M
dx ∂µ j µ
m+1 =
∫
M
chl (/BY )=
∫
M
1
l! tr
( i/BY
2π
) l
. (13.35)
13.3 Non-Abelian anomalies
In the last section we considered the chiral current which is a gauge singlet (no
gauge indices). Now we turn to the study of the gauge current j µα where α is the
gauge index. Here we consider a chiral theory in which the gauge ﬁeld/BT couples
only to the left-handed Weyl fermion ψ . Suppose ψ transforms in a complex
representation r of the gauge group G. For example, suppose ψ belongs to a 3 of
SU(3). The effective action Wr[/BT ] is given by
e−Wr[/BT ] =
∫
/BW ψ /BW
¯ψ exp
(
−
∫
dx¯ψ i /∇+ψ
)
(13.36)
where
i /∇+ = iγ µ(∂µ+ /BT
µ)/C8
+
/C8
± = 1
2 (1± γ m+1). (13.37)
The gauge current is
j µ
α = i¯ψγ µTα
/C8
+ψ. (13.38)


## Page 528

Let v = vα Tα be an inﬁnitesimal gauge transformation parameter, g = 1−v
under which we have
/BT
µ →(1+ v)(/BT
µ+ d)(1−v)= /BT
µ−/BW
µv (13.39)
where /BW
µv≡∂µv+[ /BT
µ,v] is the covariant derivative for a ﬁeld in the adjoint
representation. The effective action transforms as
Wr[/BT ]→Wr[/BT −/BW v]
= Wr[/BT ]−
∫
dx tr
(
/BW v δ
δ/BT
Wr[/BT ]
)
= Wr[/BT ]−
∫
dx tr(∂µvα + fαβ γ Aµβ vγ ) δ
δ Aµα Wr[/BT ]
= Wr[/BT ]+
∫
dx tr
(
vα
/BW
δ
δ/BT
Wr[/BT ]α
)
. (13.40)
Since
δ
δ Aµα Wr[/BT ]=⟨ i¯ψγ µTα 1
2 (1+ γ m+1)ψ⟩
/BT
=⟨ j µ
α⟩
we obtain
Wr[/BT −/BW v]−Wr[/BT ]=
∫
dx tr(vα
/BW
µ⟨ j µ⟩α ). (13.41)
We are naively tempted to regard (13.36) as det (i /∇) = ∏ λ′
i , λ i being the
‘eigenvalue’ of i/∇. A subtlety arises here: i /∇+ maps sections of S+⊗E to those
of S−⊗E,w h e r eE is the vector bundle associated with the G bundle and S±
are spin bundles with chirality ±. Accordingly, the equation i /∇+ψ = λψ is
meaningless. To avoid this difﬁculty, we formally introduce aDirac spinor ψ and
deﬁne
e−Wr[/BT ] =
∫
/BW ψ /BW
¯ψ exp
(
−
∫
dx ¯ψ iˆDψ
)
(13.42)
where iˆD is deﬁned by
iˆD≡iγ µ(∂µ+ i/BT
µ
/C8
+)=
( 0i /∂−
i /∇+ 0
)
(13.43)
where we have diagonalized γ m+1. In (13.43), the gauge ﬁeld /BT couples only
to the positive chirality ﬁeld. Now the eigenvalue problem i ˆDψ i = λ i ψ i is well
deﬁned. Note that i ˆD is not Hermitian and λ i is a complex number in general.
Moreover, we need to introduce right and left eigenfunctions separately by
iˆDψ i = λ i ψ i (13.44a)
χ †
i (i
←
ˆD)= λ i χ †
i (iˆD)†χ i =¯λ i χ i . (13.44b)


## Page 529

Since
∫
χ †
i ψ j dx= 0f o ri̸= j, we may choose an orthonormal basis,
∫
χ †
i ψ j dx= δij . (13.45)
It should be noted that the eigenvalueλ i is not gauge invariant. This follows from
the observation that
g(iˆD(/BT
g ))g−1 = giγ µ[∂µ+ g−1(/BT
µ+ ∂µ)g/C8
+]g−1
= iˆD(/BT )−i/∂ gg−1+ i/∂ gg−1
/C8
+ ̸= iˆD(/BT ). (13.46)
If the equality were to hold in (13.46), g−1ψ i would satisfy i ˆD(/BT
g )g−1ψ i =
λ i g−1ψ i when i ˆD(/BT )ψ i = λ i ψ i . Then Spec i ˆD(/BT ) would be gauge invariant.
Although individual eigenvalues are not gauge invariant, the absolute value of the
product of eigenvalues of iˆD is gauge invariant. In fact,
det(iˆD) det((iˆD)†)= det(iˆD(iˆD)†)
= det
( (i/∂−)(i/∂+) 0
0 (i /∇+)(i /∇−)
)
= det(i/∂−i/∂+) det(i /∇+i /∇−) (13.47)
where i /∂+ = (i/∂−)† and i /∇−= (i /∇+)†. This is simply the Dirac determinant
(up to an irrelevant factor det(i/∂−i/∂+)),
[det(i /∇)]2 = det
( i /∇−i /∇+ 0
0i /∇+i /∇−
)
=[ det(i /∇+i /∇−)]2 (13.48)
where i /∇is given by
i /∇=
( 0i /∇−
i /∇+ 0
)
. (13.49)
The Dirac determinant is gauge invariant, hence so is | det(iˆD)|. It then follows
that Re Wr[/BT ] is gauge invariant since
exp(−Wr[/BT ]) exp(−
Wr[/BT ])= det(iˆD) det((iˆD)†)∝det(i /∇+i /∇−)
is gauge invariant. Therefore, only the imaginary part of Wr[/BT ], that is the phase
of det(iˆD), may gain an anomalous variation under gauge transformations.
The anomaly may be computed by evaluating the Jacobian as before. The
functional measure is taken to be ∏
i dai d¯bi . We consider an inﬁnitesimal gauge
transformation,
/BT →/BT −/BW vψ →ψ + vψ+ ¯ψ →¯ψ −¯ψ−v (13.50)
where the gauge transformation rotates the positive chirality parts only. The
Jacobian factor is ∫
dx tr v(x)
∑
n
(n|x⟩γ m+1⟨x|n⟩ (13.51)


## Page 530

where⟨x|n⟩= ψ n (x) and (n|x⟩= χ †
n (x) (note that (n| is not the Hermitian
conjugate of|n⟩). This integral is ill deﬁned and m ust be regularized. As before,
we employ the Gaussian regulator,
∫
dx lim
M→∞
x→y
tr v(x)
∑
n
(n|y⟩γ m+1⟨x|e−(iˆD)2/M2
|n⟩
=
∫
dx lim
M→∞
x→y
tr v(x)γ m+1e−(iˆDx )2/M2
δ(x−y) (13.52)
where use has been made of the completeness relation
∑
n
|n⟩(n|= I. (13.53)
It follows from (13.41) and (13.52) that
∫
dx vα
/BW
µ
( δ
δ Aµα Wr[/BT ]
)
=
∫
dx lim
M→∞
x→y
tr[vγ m+1e−(iˆDx )2/M2
δ(x−y)].
(13.54)
In the present case Wr really changes under (13.50). The trace may be written as
tr[vγ m+1e−(iˆDx )2/M2
]= tr[v(/C8
+−/C8
−)e−(i̸∂−i̸∇+)−(i̸∇−i̸∂+)/M2
]
= tr[vP+e(i̸∂ i̸∇)/M2
]−tr[vP−e(i̸∇i̸∂)/ M2
]. (13.55)
(13.55) can be evaluated in the plane wave basis, which is straightforward but
tedious (see Gross and Jackiw (1972), for example). We derive the non-Abelian
anomaly from a topological viewpoint in the next section. For m = 4, the
anomalous variation is
Wr[/BT −/BW v]−Wr[/BT ]=
∫
dx vα
/BW
µ⟨ j µ⟩α
= 1
24π 2
∫
dx tr{vα Tα ϵκλµν ∂κ[/BT
λ ∂µ
/BT
ν + 1
2
/BT
λ
/BT
µ
/BT
ν]}
= 1
24π 2
∫
tr{vd[/BT d/BT + 1
2
/BT
3]}. (13.56)
The anomalous divergence of the gauge current is
/BW
µ⟨ j µ⟩α = 1
24π 2 tr{Tα ϵκλµν ∂κ[/BT
λ ∂µ
/BT
ν + 1
2
/BT
λ
/BT
µ
/BT
ν]}. (13.57)
This should be compared with (13.33). There are two differences between these
results: the two-thirds in front of /BT
3 is replaced by a half and the overall factor is
different.


## Page 531

13.4 The Wess–Zumino consistency conditions
13.4.1 The Becchi–Rouet–Stora opera tor and the Faddeev–Popov ghost
Let W[/BT ] be the effective action of the Weyl fermion in the complex
representation r of the gauge group G.3 In the previous section, we observed that
the change of W[/BT ] under an inﬁnitesimal gauge transformation δv
/BT =−/BW v is
given by
δv W[/BT ]=−
∫
(/BW
µv)α δ
δ/BT
µα W[/BT ]=
∫
vα
/BW
µ⟨ j µ⟩α . (13.58)
Following Stora (1984) and Zumino (1985) we introduce the BRS operator
/CB and the Faddeev–Popov ghost ω .L e t/Omega1m (G) be the set of maps from Sm to G.4
In addition to the ordinary exterior deri vative d, we introduce another exterior
derivative /CB on /Omega1m (G) which we call the Becchi–Rouet–Stora (BRS) operator.
In general, /CB is deﬁned on an inﬁnite-dimensional space but we may also consider
the restriction of /CB to a ﬁnite-dimensional compact subspace of /Omega1m (G),s u c ha s
Sn, parametrized by λ α .T h e n/CB may be written as /CB ≡dλ α ∂/∂λ α . We require
that d and /CB be anti-derivatives,
d2 = /CB
2 = d/CB + /CB d= 0. (13.59)
If we deﬁne /Delta1≡d+ /CB , /Delta1is clearly nilpotent,
/Delta12 = d2+ d/CB + /CB d+ /CB
2 = 0. (13.60)
Under the action of g= g(x,λ α ), /BT transforms as
/BT →A≡g−1(/BT + d)g. (13.61)
Note that /BT is independent of λ while A depends on λ through g.D e ﬁ n e t h e
Faddeev–Popov (FP) ghost by
ω ≡g−1
/CB g. (13.62)
The actions of /CB on A and ω are found to be
/CB A=/CB [g−1(/BT + d)g]=−g−1
/CB g A−g−1
/BT/CB g+ g−1
/CB (dg)
=−ω A−( A−g−1 dg)ω −g−1 d(/CB g)
=−ω A−Aω −dω ≡−/BW
Aω (13.63a)
/CB ω =−g−1
/CB gg−1
/CB g=−ω 2. (13.63b)
3 We drop the representation index r to simplify the expression.
4 The set /Omega1m (G) should not be confused with /Omega1m (M),t h es e to fm-forms on M. The distinction
should be clear from the context.


## Page 532

It is easy to verify that /CB is nilpotent on A and ω and, hence, on any polynomial
of A and ω as it should be; see exercise 13.1. Deﬁne the ﬁeld strength of A by
F≡d A+ A2 = g−1
/BY g. (13.64)
We also deﬁne
/BT ≡g−1(/BT + /Delta1)g= A+ g−1
/CB g= A+ ω (13.65a)
/BY ≡/Delta1/BT + /BT
2 = g−1
/BY g= F (13.65b)
where (13.65b) follows since /BY = d/BT + /BT
2 = /Delta1/BT + /BT
2 (note that /CB/BT = 0). It
is found from theorem 10.1 that /BT is an Ehresmann connection on the principal
bundle and /BY its associated curvature two-form.
The existence of a non-Abelian anomaly implies that W[ A] does not vanish
under the action of the BRS operator /CB (ω roughly corresponds to v; see (13.39)
and (13.63a)),
/CB W[ A]= G[ω, A]. (13.66)
Since W[ A] is independent of ω , /CB acts through A only. Before we write down
the Wess–Zumino consistency condition for the non-Abelian anomaly, we stop
here and consider the physical meaning of the BRS operator and the FP ghost.
Exercise 13.1. Verify from (13.63) that the actions of/CB on A and ω are nilpotent,
/CB
2 A= 0 /CB
2ω = 0. (13.67)
13.4.2 The BRS operator, FP ghost and moduli space
To ﬁnd the physical meaning of /CB and ω , we need to examine the topology of
the gauge ﬁelds (Atiyah and Jones 1978, Singer 1985, Sumitani 1985). Let /BT
be the space of all gauge potential conﬁgurations on Sm . For deﬁniteness, we
take m = 4 but the generalization to arbitrary m is obvious. The topology
of /BT is trivial since, for any gauge potential conﬁgurations /BT
1 and /BT
2,t h e
combination t/BT
1 + (1−t)/BT
2 (0 ≤t ≤1) is again a gauge potential on S4.
Note, however, that /BT does not describe the physical conﬁguration space of the
gauge theory. We have to identify those ﬁeld conﬁgurations which are connected
by G-gauge transformations. Let /BZ be the space of all gauge transformations on
S4 (/BZ = /Omega14(G) in our previous notation). Then the physical conﬁguration space
must be identiﬁed with /BT //BZ , called the moduli space of the gauge theory. We
have seen in section 10.5 that the gauge ﬁeld conﬁguration on S4 is classiﬁed by
the transition function g : S3 →G, S3 being the equator of S4. In the present
case, /BT //BZ is classiﬁed by the transition function on the equator S3 →G and,
hence,
/BT //BZ ≃ /Omega13(G). (13.68)
Thus, each connected component of /BT //BZ is labelled by the instanton number k.
This component is denoted by /Omega14
k (G).


## Page 533

Figure 13.1. The BRS operator /CB is the restriction of δ along the ﬁbre.
We note that the space /BT has a natural projection π : /BT →/BT //BZ and can
be made into a ﬁbre bundle whose ﬁbre is /BZ , see ﬁgure 13.1. Let a ∈/BT be a
representative of the class[a]∈/BT //BZ and let
/BT (x)= g−1(x)(a(x)+ d)g(x) (13.69)
be an element of /BT in[a]. We denote the exterior derivative operator in /BT by
δ,w h i c hi sa functional variation and should not be confused with the usual
derivative d; see Leinaas and Olaussen (1982). If δ is applied on (13.69), we
ﬁnd that
δ/BT =−g−1δg/BT + g−1δag−g−1aδg−g−1d (δg)
= g−1δag−d (g−1δg)−g−1δg/BT −/BT g−1δg
= g−1δag−/BW
/BT
(g−1δg) (13.70)
where /BW
/BT
= d+[ /BT , ]. The ﬁrst term of (13.70) represents the derivative of /BT
along /BT //BZ while the second represents that along the ﬁbre; see ﬁgure 13.1. The
BRS transformation /CB is obtained by restricting the variation δ along the ﬁbre,
/CB/BT ≡δ/BT |ﬁbre =−/BW
/BT
ω (13.71a)
where the FP ghost ω is g−1
/CB g≡g−1δg
⏐⏐
ﬁbre. We also ﬁnd that
/CB ω = δω|ﬁbre =−g−1
/CB gg−1
/CB g=−ω 2 (13.71b)
which reproduces (13.63a).


## Page 534

13.4.3 The Wess–Zumino conditions
Exercise 13.1 shows that /CB is nilpotent on any polynomial f of /BT and ω ,
/CB
2 f (ω, A)= 0. (13.72)
The nilpotency is required by the interpretation of /CB as an exterior derivative
operator. In particular, we should have
/CB G[ω, A]= /CB
2W[ A]= 0. (13.73)
This condition is called the Wess–Zumino consistency condition (WZ
condition) and can be used to determine the non-Abelian anomaly (Wess and
Zumino 1971, Stora 1984, Zumino 1985, Zuminoet al 1984). If the anomaly G is
mathematically well deﬁned, G should satisfy the WZ condition. This condition
is so strong that once the ﬁrst term ofG[ω, A] is given, the anomaly is completely
pinned down.
13.4.4 Descent equations and solutions of WZ conditions
Stora (1984) and Zumino (1985) constructed the solution of WZ conditions as
follows. The Abelian anomaly in (2l+ 2)-dimensional space is given by
chl+1(F)= 1
(l+ 1)! tr
( iF
2π
) l+1
(13.74)
where F = d A+ A2, A = g−1(/BT + d)g as before. Let Q2l+1( A, F) be the
Chern–Simons form of chl+1(F),
chl+1(F)= dQ2l+1( A, F). (13.75)
Since the algebraic structure of the triplet (/Delta1,/BT , /BY ) is exactly the same as that of
(d, A, F),w ea l s oh a v e
chl+1(/BY )= /Delta1Q2l+1(/BT , /BY )= /Delta1Q2l+1( A+ ω, F) (13.76)
where we have noted that /BT = A+ ω and /BY = F. If we expand Q2l+1(/BT , /BY )=
Q2l+1( A+ ω, F) in powers of ω ,w eh a v e
Q2l+1(/BT , /BY )= Q0
2l+1( A, F)+ Q1
2l (ω, A, F)+ Q2
2l−1
(ω, A, F)
+···+ Q2l+1
0 (ω, A, F) (13.77)
where Qs
r is sth order in ω and r+ s= 2l+ 1.
We now note that chl+1(/BY )= chl+1(F) since /BY = F= g−1
/BY g.I nt e r m so f
the Chern–Simons forms, this can be expressed as
/Delta1Q2l+1(/BT , /BY )= dQ2l+1( A, F). (13.78)


## Page 535

Substituting (13.77) into (13.78), we have
(d+ /CB )[Q0
2l+1( A, F)+ Q1
2l (ω, A, F)
+···+ Q2l+1
0 (ω, A, F)]= dQ0
2l+1
( A, F). (13.79)
If we collect terms of the same order in ω ,w eh a v et h e‘descent equations’
/CB Q0
2l+1
( A, F)+ dQ1
2l (ω, A, F)= 0 (13.80a)
/CB Q1
2l (ω, A, F)+ dQ2
2l−1
(ω, A, F)= 0 (13.80b)
..
.
/CB Q2l
1 (ω, A, F)+ dQ2l+1
0 (ω, A, F)= 0 (13.80c)
/CB Q2l+1
0 (ω, A, F)= 0. (13.80d)
Note here that /CB increases the degree of ω by one, see (13.63). Let us look at the
2l-form Q1
2l (ω, A, F). If we put
G[ω, A, F]≡
∫
M
Q1
2l
(ω, A, F) (13.81)
G[ω, A, F] satisﬁes the WZ condition,
/CB G[ω, A, F]=
∫
M
/CB Q1
2l
(ω, A, F)=−
∫
M
dQ2
2l−1
(ω, A, F)
=−
∫
∂ M
Q2
2l−1(ω, A, F)= 0
w h e r ew eh a v ea s s u m e dt h a tM has no boundary and use has been made
of (13.80b). This shows that once Q1
2l (ω, A, F) is obtained, the anomaly
G[ω, A, F] is easily found.
Proposition 13.1. Q 1
2l
deﬁned here is given by
Q1
2l (ω, /BT , /BY )=
( i
2π
) l+1 1
(l−1)!
∫ 1
0
δt (1−t) str[ω d(/BT/BY
l−1
t )]. (13.82)
[Note: In the proof, we tentatively drop the normalization factor (i/2π) l+1 to
simplify the expressions. This factor will be recovered at the very end.]
Proof. We start with (11.105),
Q2l+1(/BT + ω, /BY )= 1
l!
∫ 1
0
δt tr[(/BT + ω) ˆ
/BY
l
t]


## Page 536

where
ˆ
/BY
t ≡t/BY + (t2−t)(/BT + ω) 2
= /BY
t + (t2−t){/BT ,ω }+ (t2−t)ω 2
/BY
t ≡d (t/BT )+ (t/BT )2.
If we substitute ˆ
/BY
t into Q2l+1 and collect terms of ﬁrst order in ω ,w eh a v e :
1
l!
∫ 1
0
δt tr[ω /BY
l
t + (t2−t)(/BT [/BT ,ω ]/BY
l−1
t + /BT/BY
t[/BT ,ω ]/BY
l−2
t
+···+ /BT/BY
l−1
t [/BT ,ω ])]
= 1
l!
∫
δt str[ω /BY
l
t + (t2−t)/BT (/BY
l−1
t [/BT ,ω ]]
+ /BY
l−2
t [/BT ,ω ]/BY
t +··· )]
= 1
l!
∫
δt str[ω /BY
l
t + (t2−t)l/BT [/BT ,v]/BY
l−1
t ]
= 1
l!
∫
δt str[ω /BY
l
t + l(t2−t)([/BT , /BT ]ω /BY
l−1
t + /BT ω[/BT , /BY
l−1
t ])]
= 1
l!
∫
δt str[ω{/BY
l
t + l(t−1)(t[/BT , /BT ]/BY
l−1
t −/BT [/BT
t , /BY
l−1
t ])}]
where str is the symmetrized trace deﬁned by (11.8). Now we use
/BW
t
/BY
l−1
t ≡d/BY
l−1
t +[ /BT
t , /BY
l−1
t ]= 0
∂ /BY
t
∂ t = d/BT + t[/BT , /BT ]
to change the ﬁnal line of the previous equation to
1
l!
∫
δt str
[
ω
{
/BY
l
t + l(t−1)
[( ∂ /BY
t
∂ t −d/BT
)
/BY
l−1
t + /BT d/BY
l−1
t
]}]
= 1
l!
∫
δt str
[
ω
{
/BY
l
t + l(1−t)d(/BT/BY
l−1
t )+ (t−1) ∂ /BY
l
t
∂ t
}]
.
Integrating by parts, we ﬁnd that
Q1
2l (ω, /BT , /BY )= 1
(l−1)!
∫
δt (1−t) str[ω d(/BT/BY
l−1
t )].
If we recover the normalization, we ﬁnally have
Q1
2l
(ω, /BT , /BY )=
( i
2π
) l+1 1
(l−1)!
∫ 1
0
δt (1−t) str[ω d(/BT/BY
l−1
t )]. /A3


## Page 537

For m= 2l= 2a n dm= 4, we have
Q1
2(ω, A, F)=
( i
2π
) 2
tr(ω d A) (13.83a)
Q1
4
(ω, A, F)= 1
6
( i
2π
) 3
str(ω d( Ad A+ 1
2 A3)). (13.83b)
These results are also veriﬁed by direct computations. Up to the normalization
factor, (13.83b) yields the non-Abelian a nomaly in four-dimensional space; see
(13.56).
Sumitani (1984) pointed out that the approach to the non-Abelian anomalies
here is ad hoc and does not clarify the following points:
(1) The WZ condition (13.73) does not ﬁx the normalization of the anomaly and,
moreover, the uniqueness of the solution is far from trivial.
(2) It is not clear why we should start from the Abelian anomaly in (m+ 2)-
dimensional space.
To answer these questions we need to develop a more elaborate index
theorem called the family index theorem; see Atiyah and Singer (1984), Singer
(1985) and Sumitani (1984, 1985). In the next section, we outline the physicists’
approach to this problem, closely following the work of Alvarez-Gaum´ ea n d
Ginsparg (1984).
13.5 Abelian anomalies versus non-Abelian anomalies
Let us consider an m-dimensional Euclidean space ( m = 2l)w h i c hi s
compactiﬁed to Sm = /CA
m ∪{∞}and let G be a semisimple gauge group which
is simply connected (like SU (N) for which π 1(SU(N)) is trivial). Consider a
one-parameter family of gauge transformations g(θ, x)( 0≤θ ≤2π ) such that
g(0, x)= g(2π, x)= e. (13.84)
Without loss of generality, we may normalize g so that g(θ, x0) = e at a point
x0 ∈Sm .T h em a pg: S1×Sm →G is classiﬁed according to the homotopy class
π m+1(G). To see this we deﬁne the smash product X∧Y of topological spaces
X and Y by the direct product X× Y with X∨Y ≡(x0× X)∪(X× y0) shrunk
to a point. From ﬁgure 13.2, we easily ﬁnd that S1 ∧Sm = Sm ∧S1 = Sm+1.5
Repeated applications of this yield
Sm ∧Sn = Sm+n . (13.85)
In the case which interests us, the conditions (13.84) make the direct product
S1× Sm look topologically like S1∧Sm = Sm+1. Thus, g is regarded as a map
5 The readers may convince themselves by explicitly drawing S1∧S1= S2.


## Page 538

Figure 13.2. The smash product S1∧Sm ≃ Sm+1.
from Sm+1 to G and is classiﬁed by π m+1(G). Since we have a one-parameter
family in the space /BZ = /Omega1m (G),w ea l s oh a v eπ m+1(G)= π 1(/BZ ). In practice,
we take G= SU(N) for which we have
π m+1(SU(N))= /CI N≥1
2 m+ 1. (13.86)
Now we take a ‘reference’ gauge ﬁeld /BT in the zero instanton sector /Omega1m
0 (G) for
which we may assume, without loss of generality, that the Dirac operator (13.49)
has no zero modes. Consider a one-parameter family of gauge potentials
/BT
g(θ) (x)≡g−1(θ, x)(/BT (x)+ d)g(θ, x) (13.87)
where θ parametrizes S1. In section 13.3, we observed that | det iˆD| is gauge
invariant (see (13.47)) and only the phase of det i ˆD m a yg a i na na n o m a l o u s
variation under a gauge transformation. This, in particular, implies that det i ˆD
does not vanish for any θ . We write
exp{−Wr[/BT
g(θ)]}= det iˆD(/BT
g(θ) )=[ det i/∇(/BT )]1/2 exp[iw(/BT ,θ)] (13.88)
where i /∇is the Dirac operator (13.49) and exp[iw(/BT ,θ)] is the anomalous phase
associated with the gauge transformation (13.87). Next we consider a two-
parameter family of gauge ﬁelds /BT
t,θ (0 ≤t ≤1) which interpolates between
/BT = 0a n d/BT
g(θ) ,
/BT
t,θ ≡t/BT
g(θ) (0≤t≤1). (13.89)
The parameter space speciﬁed by(t,θ) is considered to be a two-dimensional unit
disc D2 with polar coordinates (t,θ) . On the boundary of the disc, ∂ D2 = S1,
the modulus of det iˆD(/BT
1,θ ) is a non-vanishing constant. The phase eiw(/BT ,θ ) now
deﬁnes a map S1 (=∂ D2)→S1 (=U(1)); see ﬁgure 13.3. As we move around


## Page 539

Figure 13.3. The phase of the effective action W[/BT
g(θ)] deﬁnes a map S1 →U(1) by
θ ↦→eiw(/BT ,θ ). On the disc, there are points { pi} at which det i ˆD(/BT
t,θ ) vanishes. The
winding number of the map S1 →U(1) is obtained by summing a winding number along
Ci .
the boundary of the disc, the phase winds around the unit circle. The winding
number of this map is an integer
/C6 = 1
2π
∫ 2π
0
∂w( /BT ,θ)
∂θ dθ. (13.90)
We ﬁnd below that/C6 is derived from the Abelian anomaly in(m+2) dimensions.
Exercise 13.2. Show that
W[/BT
g(2π)]−W[/BT
g(0)]=−2π i/C6 . (13.91)
Since g(2π) = g(0), (13.91) may be regarded as a Berry phase.
13.5.1 m dimensions versus m + 2d i m e n s i o n s
We recall that our reference gauge ﬁeld/BT supports no zero modes of the operator
iˆD(/BT ).S i n c e| det iˆD(/BT
g(θ) )|=| det iˆD(/BT )|̸= 0, the operator i ˆD(/BT
g(θ) ) does
not admit zero modes either. Of course, i ˆD(/BT
t,θ ) may have zero modes since
/BT
t,θ is not obtained from /BT by a gauge transformation in general. Suppose it
has a zero mode at pi = (ti ,θ i ). We assume they are isolated points. Since
det iˆD(/BT
t,θ ) is a regularized product of eigenvalues, it vanishes at pi .T h e
phase of det iˆD(/BT
t,θ ) may be homotopically non-trivial only around these points.
Moreover, the winding number at pi is determined by the eigenvalue which
vanishes at pi . For example, if λ n (t,θ) vanishes at pi it should be of the form
λ n (t,θ) = f (t,θ) eiwi (t,θ ) (13.92)


## Page 540

Figure 13.4.
where f (ti ,θ i )= 0. The winding number at pi is
mi = 1
2π
∫
Ci
d
ds wi (t,θ) ds (13.93)
where C i is a small contour surrounding pi , see ﬁgure 13.3. Continuously
deforming the loop S1 = ∂ D2 into a sum of small circles C i enclosing pi ,w e
ﬁnd that the total winding number is
/C6 = 1
2π
∫
S1
dθ ∂
∂θ w(/BT ,θ) =
∑
mi . (13.94)
Now we show that the winding number /C6 is related to the index theorem
in (m + 2)-dimensional space ( m = 2l): /C6 = ind i/∇m+2 where i /∇m+2 is
the Dirac operator on S2 × Sm deﬁned later. Let us consider a gauge theory
deﬁned on D2× Sm whose coordinates are (t,θ, x). To avoid the boundary term,
we add another piece, D2 × Sm , with coordinates (s,θ, x), to form a manifold
S2× Sm without a boundary; see ﬁgure 13.4. We call the patch(t,θ) the northern
hemisphere UN and (s,θ) the southern hemisphere US. On the equator S1 of S2,
we have t= s= 1. We choose the following local gauge potentials
/BT
N(t,θ, x)= /BT
t,θ + g−1 dθ g (t,θ) ∈UN (13.95a)
/BT
S(s,θ, x)= /BT (s,θ) ∈US (13.95b)
where /BT is the reference gauge ﬁeld introduced previously. To elevate /BT
N =
/BT
Nµ dxµ and /BT
S = /BT
Sµ dxµ to the globally deﬁned connection on the G bundle
over S2× Sm we deﬁne the (m+ 2)-dimensional gauge potentials
/BT
N (t,θ, x)= (/BT
t , /BT
θ , /BT
µ)= (0, 0, /BT
Nµ) (13.96a)
/BT
S (s,θ, x)= (/BT
s , /BT
θ , /BT
µ)= (0, 0, /BT
Sµ). (13.96b)


## Page 541

On the equator (t= s= 1), we have/BT
N = g−1(/BT
S+/Delta1)g,w h e r e/Delta1= d+dθ+dt
(note that dt g= 0). Thus, /BT ={ /BT
N , /BT
S} deﬁnes a global connection on S2× Sm .
Consider a Dirac operator i /∇m+2 which couples to /BT . The index theorem for
i /∇m+2 is given by
ind i/∇m+2 = /C6
+−/C6
−=
∫
S2×Sm
chl+1(/BY ) (13.97)
where /BY = /Delta1/BT + /BT
2 and /C6
+ (/C6
−) is the number of+ (−) chirality zero modes
of i /∇m+2 (chirality is deﬁned in an (m+ 2)-space).
Alvarez-Gaum´e and Ginsparg (1984) have shown, using an adiabatic
perturbative computation, that each winding number mi must be±1. Moreover,
the Dirac operator i /∇m+2 has a zero mode at pi = (ti ,θ i ) with (m + 2)-
dimensional chirality χ = mi =± 1. Then the total winding number /C6 = ∑ mi
is given by the index /C6
+−/C6
−.N o ww eh a v e
ind i/∇m+2 =
∫
S2×Sm
chl+1(/BY )= 1
2π
∫ 2π
0
dθ ∂w( /BT ,θ)
∂θ . (13.98)
We easily ﬁnd the non-Abelian anomaly from (13.98) including the
normalization. Since chl+1(/BY )= dQm+1(/BT , /BY ),w eh a v e
∫
S2×Sm
chl+1(/BY )=
∫
D2×Sm
chl+1(/BY
N )+
∫
D2×Sm
chl+1(/BY
S )
=
∫
S1×Sm
[Qm+1(/BT
N , /BY
N )|t=1−Qm+1(/BT
S , /BY
S )|s=1].
(13.99)
From (11.118), we ﬁnd that
Qm+1(/BT
N , /BY
N )|t=1−Qm+1(/BT
S , /BY
S )|s=1
= Qm+1(g−1/Delta1g, 0)+ /Delta1αm
= (−1)l
( i
2π
) l+1 l!
(m+ 1)! tr(g−1/Delta1g)m+1+ /Delta1αm . (13.100)
The index theorem is now given by
ind i/∇m+2 = (−1)l
( i
2π
) l+1 l!
(m+ 1)!
∫
S1×Sm
tr(g−1/Delta1g)m+1. (13.101)
Theorem 10.7 states that
∫
S3 tr(g−1dg)3 yields the winding number of the map
g: S3 →SU(2). In the same manner, (13.101) represents the winding number of
the map g: Sm+1 →G and is classiﬁed byπ m+1(G) (note that S1∧Sm = Sm+1).
Finally, we show that the non-Abelian anomaly should be identiﬁed with
Q1
m . We ﬁrst note that
∫
S1×Sm
Qm+1(/BT
S , /BY
S )= 0


## Page 542

since the integrand is independent of dθ and, thus, cannot be a volume element of
S1× Sm .T h e nw eh a v e
ind i/∇m+2 =
∫
S1×Sm
Qm+1(/BT
g(θ) + ω, /BY
g(θ) ) (13.102)
where ω = g−1 dθ g and /BY
g(θ) = d/BT
g(θ) + (/BT
g(θ) )2 = g(θ )−1
/BY g(θ ).
If the integrand in (13.102) is expanded in ω , only the term linear in d θ
contributes to the integral. This term Q1
m (ω, /BT
g(θ) , /BY
g(θ) ) is proportional to
dθ ∧(volume element in Sm ) and, hence, is a volume element of S1 × Sm .W e
now have
δω W[/BT ]=
∫
Sm
tr ω /BW
µ
δW[/BT ]
δ/BT
µ
= idθ w(θ, /BT )= 2π i
∫
Sm
Q1
m (ω, /BT
g(θ) , /BY
g(θ) ). (13.103)
The explicit form of Q1
m is given by (13.82). For m= 4, we ﬁnd that
∫
tr ω /BW
µ
δW[/BT ]
δ/BT
µ
= 2π i
∫
S4
Q1
4(ω, /BT
g(θ) , /BY
g(θ) )
= 1
24π 2
∫
S4
tr ω d
[
/BT
g(θ) d/BT
g(θ) + 1
2 (/BT
g(θ) )3
]
. (13.104)
Putting θ = 0 (g= e), we reproduce the anomalous divergence
/BW
µ⟨ j µ⟩α = 1
24π 2 tr Tα ϵκλµν ∂κ
[
/BT
λ ∂µ
/BT
ν + 1
2
/BT
λ
/BT
µ
/BT
ν
]
(13.105)
which is in agreement with (13.56). The present method guarantees that the
WZ condition yields the correct result. Moreover, it reproduces the anomalous
divergence including the normalization which cannot be ﬁxed by the WZ
condition alone.
13.6 The parity anomaly in odd-dimensional spaces
So far, we have been working in even-dimensional spaces. One of the reasons
for this is that SO (2l+ 1) has real or pseudo-real spinor representations but no
complex representations, hence no gauge anomaly is expected. However, we
can show that gauge theories in odd-dime nsional spaces have a different kind
of anomaly called the ‘parity anomaly’, in which the parity symmetry of the
classical action is not maintained through quantization. It should be noted that
the parity anomaly in 2 l+ 1 dimensions is related to the Abelian anomaly in
2l+ 2 dimensions as was pointed out by Alvarez-Gaum´e et al (1985).


## Page 543

13.6.1 The parity anomaly
Let M be a (2l + 1)-dimensional Riemannian manifold. We distinguish one
dimension from the others; that is we assume that M is of the form /CA × /C5 or
S1× /C5 ,w h e r e/C5 is a 2l-dimensional compact manifold without a boundary. We
denote the coordinate of /CA or S1 by t while that of /C5 is denoted by x. The index
0 denotes the component int-space while µ denotes that in x-space. For example,
the components of the γ -matrices are{γ 0,γ µ (1≤µ≤2l)}.
Deﬁne the ‘parity’ operation P by
/BT
0(t, x)→/BT
P
0 (t, x)=−/BT
0(−t, x)
/BT
µ(t, x)→/BT
P
µ(t, x)= /BT
µ(−t, x)
ψ( t, x)→ψ P(t, x)= iγ0ψ(−t, x)
¯ψ( t, x)→¯ψ P(t, x)= i¯ψ( −t, x)γ0.
The classical action is invariant under the parity operation,
∫
dt dx ¯ψ i /∇ψ →−
∫
dt dx ¯ψ( −t, x)γ 0i[γ 0(∂0−/BT
0(−t, x))
+ γ µ(∂µ+ /BT
µ(−t, x))]γ 0ψ(−t, x)
=
∫
dt dx ¯ψ( t, x)i[γ 0(∂0+ /BT
0(t, x))
+ γ µ(∂µ+ /BT
µ(t, x))]ψ( t, x)
where we put t →−t in the ﬁnal line. Let us see whether this invariance is
observed by the effective action. The eff ective action is given by the regularized
product of the eigenvalues of i/∇.W ee m p l o yt h ePauli–Villars regularization to
regulate the product, that is
/C4
reg ≡¯χ i /∇χ + iM¯χχ (13.106)
is added to the original Lagrangian. The Pauli–Villars regulator χ is a spinor
which obeys bosonic statistics and the limit M →∞is understood. The
regularized determinant is
e−W[/BT ] = det i/∇
det(i /∇+iM)=
∏
i
λ i
λ i + iM (13.107)
where we noted that χ is bosonic. Here λ i is the ith eigenvalue of i /∇;i /∇ψ i =
λ i ψ i . Under the parity operation, eigenvalues change sign,
i[γ 0(∂0−/BT
0(−t, x))+ γ i (∂i + /BT
i (−t, x))]iγ 0ψ i (−t, x)
= iγ 0[γ 0(−∂τ −/BT
0(τ, x))−γ i (∂i + /BT
i (τ, x))]iψ(τ, x)
=−λ i iγ 0ψ i (τ, x)


## Page 544

where τ =−t. This shows that the effective action W[/BT ] transforms under the
parity operation P as
W[/BT ]→W[/BT
P]=−ln
∏ −λ i
−λ i + iM =
 W[/BT ] (13.108)
where the bar denotes complex conjugation. (13.108) shows that the imaginary
part of W is identiﬁed with the parity-violating part
W[/BT ]−W[/BT
P]= 2I mW[/BT ]. (13.109)
Im W[/BT ] is given by the η -invariant deﬁned in section 12.8. In fact,
Im W[/BT ]= lim
M→∞
Im
(
−
∑
i
ln λ i
λ i + iM
)
= lim
M→∞
∑
i
tan−1(M/λ i )
= π
2
( ∑
λ> 0
1−
∑
λ< 0
1
)
= π
2 η. (13.110)
Thus, the Pauli–Villars regulator gives a regularized form for the η -invariant. We
ﬁnally have
Im W[/BT ]= π
2 η = π
2 lim
s→0
∑
i
′
sgnλ i|λ i|−2s (13.111)
where the prime indicates the omission of zero modes.
13.6.2 The dimensional ladder: 4–3–2
It is remarkable that the parity anomaly (13.110) is closely related to the chiral
anomaly in a (2l+ 2)-dimensional space (Alvarez-Gaum´e et al 1985). Following
Forte (1987), we look at the dimensional ladder,
four-dimensional Abelian anomaly
↓
three-dimensional parity anomaly (13.112)
↓
two-dimensional non-Abelian anomaly.
We take M4 = S2× S2 as a four-dimensional space. The Abelian anomaly
is given by the index
ind i/∇4 = /C6
+−/C6
−=
∫
S2×S2
∂µ j µ
5 =
∫
S2×S2
ch2(/BY ). (13.113)
As before, /C6
+ (/C6
−) is the number of positive (negative) chirality zero modes.
Let Q3 be the Chern–Simons form of ch 2(/BY );c h 2(/BY ) = dQ3(/BT , /BY ).T h e n


## Page 545

/C6 ≡/C6
+−/C6
−is given by
/C6 =
∫
S2×S2
ch2(/BY )=
∫
UN×S2
dQ3(/BT
N , /BY
N )+
∫
US×S2
dQ3(/BT
S , /BY
S )
=
∫
S1×S2
[Q3(/BT
N , /BY
N )−dQ3(/BT
S , /BY
S )]
= 1
24π 2
∫
S1×S2
tr(g−1dg)3 (13.114)
where g is the gauge transformation connecting /BT
N and /BT
S ; /BT
N = g−1(/BT
S +
d+ dθ )g. In the previous section, we have shown that /C6 also represents the
non-Abelian anomaly
/C6 = 1
2π
∫ 2π
0
dθ ∂w( /BT ,θ)
∂θ (13.115a)
where w is deﬁned by
det iˆD(/BT
g(θ) )= eiw(/BT ,θ ) det iˆD(/BT ). ( 13.115b)
Here /BT is the reference gauge potential and
/BT
g(θ) = g−1(x,θ) ( /BT + d)g(x,θ) iˆD= /∂+̸/BT/C8
+.
Next, we show that /C6 is also related to the parity anomaly in three-
dimensional space. Let i /∇3 be a three-dimensional Dirac operator and deﬁne
a four-dimensional Dirac operator by
i /D4[/BT ]≡iσ 1⊗I ∂
∂ t + σ 2⊗i /∇3[/BT
t] (13.116)
where /BT
t is a one-parameter family of gauge potentials interpolating /BT
0 = /BT
t=0
and /BT
1 = /BT
t=1. The Atiyah–Patodi–Singer index theorem (section 12.8) is
ind i /D4 =−
∫
S2×S1×I
ch2(/BY )+ 1
2[η( t= 1)−η( t= 0)] (13.117)
where we have noted that the Dirac genus ˆA is trivial on S2 × S1 × I. Suppose
/BT
0 and /BT
1 are related by a gauge transformation,
/BT
1 = g−1(/BT
0+ d)g (13.118a)
and consider an interpolating potential
/BT
t ≡t/BT
1+ (1−t)/BT
0.( 13.118b)


## Page 546

Since the spectrum of i /∇3 is gauge invariant, in particular Spec i /∇3(/BT
0) =
Spec i/∇3(/BT
1),t h eη -invariant is also gauge invariant.6 Then η( t= 0)= η( t= 1)
and the APS index theorem (13.117) yields
spectral ﬂow= ind i /D4(/BT
t )
=
∫
S2×S2
ch2(/BY )=
∫
S1×S2
[Q3(/BT
1, /BY
1)−Q3(/BT
0, /BY
0)]
=
∫
S1×S2
Q3(g−1 dg, 0)= /C6 . (13.119)
Thus, the spectral ﬂow of the three-dimensional theory is given by the index /C6 .
In summary, the mapg: S2× S1 →G is understood in three different ways:
(1) g is a transition function at the boundary of two patches of a G bundle over
S2× S2. It yields the index /C6 of the four-dimensional Abelian anomaly.
(2) Suppose /BT
0 and /BT
1 = g−1(/BT
0 + d)g are gauge potentials on S2 × S1.
The gauge transformation function g measures the spectral ﬂow /C6 between
Spe i/∇3(/BT
0) and Spe i/∇3(/BT
1).
(3) g: S2× S1 →G induces a map S1 →/BZ , the winding number /C6 of which
is identiﬁed with the non-Abelian anomaly in two-dimensional space.
Thus, we have obtained the ‘dimensional ladder’ 4–3–2. The extension to higher
dimensions is obvious.
6 Note that there is no gauge anomaly in odd-dimensional spaces.


## Page 547

14
BOSONIC STRING THEORY
In the present chapter, we study the one-loop amplitude of bosonic string
theory. Our example is the simplest one: closed, oriented bosonic strings in 26-
dimensional Euclidean space.1 The action is the Polyakov action
S= 1
2π
∫
/Sigma1g
d2ξ√
γγ αβ ∂α Xµ∂β Xµ−λ
4π
∫
/Sigma1g
d2ξ√
γ /CA (14.1)
where /Sigma1g is a Riemann surface with genus g. The second term is proportional
to the Euler characteristic χ = 2−2g and, hence, determines the relative ratio
of multi-loop amplitudes; the g-loop amplitude is proportional to exp(−λ g).W e
have not written down the possible counter terms explicitly.
In the following sections, we work out the path integral formalism of bosonic
strings. We ﬁrst develop the necessary math ematical tools, namely differential
geometry on Riemann surfaces. Then the path integral expression for the vacuum
amplitude is written down. As an example, we compute the one-loop vacuum
amplitude. Our exposition is based on D’Hoker and Phong (1986), Polchinski
(1986) and Moore and Nelson (1986). There are many surveys of these topics,
for example, Alvarez-Gaum´e and Nelson (1986), Bagger (1987), D’Hoker and
Phong (1988) and Weinberg (1988).
14.1 Differential geometry on Riemann surfaces
Riemann surfaces are real two-dimens ional manifolds without boundary. In our
study of topology and geometry, we refe rred to them in various places. Here
we summarize the basic facts on Riemann surfaces, which will make this chapter
self-contained. We also introduce several new aspects of Riemann surfaces, which
provide enough background for the study of bosonic string amplitudes.
14.1.1 Metric and complex structure
Let /Sigma1g be a Riemann surface of genus g. I tw a ss h o w ni ne x a m p l e7 . 9t h a tw e
may introduce, in any chart U,t h eisothermal coordinates (ξ 1,ξ 2) in which the
metric is conformally ﬂat:
g= e2σ( ξ) (dξ 1⊗dξ 1+ dξ 2⊗dξ 2). (14.2)
1 The reason for D= 26 will be clariﬁed in section 14.2.


## Page 548

Introduce the complex coordinates
z= ξ 1+ iξ 2 ¯z= ξ 1−iξ 2. (14.3)
Forms and vectors are spanned by
dz= dξ 1+ id ξ 2 d¯z= dξ 1−id ξ 2 (14.4a)
∂z = 1
2
( ∂
∂ξ 1 −i ∂
∂ξ 2
)
∂¯z = 1
2
( ∂
∂ξ 1 + i ∂
∂ξ 2
)
. (14.4b)
In terms of the complex coordinates, the metric takes the form
g= 1
2 e2σ( z,¯z)[dz⊗d¯z+ d¯z⊗dz]. (14.5)
The components of g are
gz¯z = g¯zz = 1
2 e2σ gzz = g¯z¯z = 0 (14.6a)
gz¯z = g¯zz = 2e−2σ gzz = g¯z¯z = 0. (14.6b)
Let V be another chart of /Sigma1g such that U ∩V ̸=∅.L e t (w, ¯w) be the
complex coordinates in V . The metric in V is
g= e2σ′(w,¯w) dw⊗d¯w. (14.7)
The two expressions (14.5) and (14.7) should agree on U∩V ,
e2σ( z,¯z) dz⊗d¯z= e2σ′(w,¯w) dw⊗d¯w.
Since
dw⊗d¯w=[ (∂w/∂ z) dz+ (∂w/∂ ¯z)d¯z]⊗[(∂¯w/∂ z) dz+ (∂ ¯w/∂¯z)d¯z]
∝dz⊗d¯z
we must have ∂w/∂ ¯z= ∂ ¯w/∂ z= 0. [Another possibility, ∂w/∂ z= ∂¯w/∂¯z= 0
is ruled out if (z,¯z) and (w, ¯w) deﬁne the same orientation.] Thus, it follows that
w= w(z) ¯w=¯w(¯z) (14.8)
which veriﬁes that /Sigma1g is a complex manifold. We also have
e2σ( z,¯z) = e2σ′(w,¯w)|∂w/∂ z|2. (14.9)
14.1.2 Vectors, forms and tensors
Let M = /Sigma1g. The components of vector ﬁelds V z ∂/∂ z ∈TM+ and V¯z ∂/∂¯z ∈
TM−transform as
V w = (∂w/∂ z)V z V¯w = (∂¯w/∂¯z)V¯z . (14.10)


## Page 549

The components of differential forms wz dz ∈/Omega11,0(M) and w¯z d¯z ∈/Omega10,1(M)
transform as
ω w = (∂w/∂ z)−1ω z ω ¯w = (∂ ¯w/∂¯z)−1ω¯z . (14.11)
These are identiﬁed with sections of the holomorphic (anti-holomorphic) line
bundles over M = /Sigma1g, for which the transition functions are holomorphic (anti-
holomorphic). The metric provides a natural isomorphism between TM+ and
/Omega10,1(M) through
ω¯z = g¯zz V z , V z = gz¯z ω¯z . (14.12)
Similarly, TM−is isomorphic to ω 1,0(M):
ω z = gz¯z V¯z , V¯z = g¯zz ω z . (14.13)
In general, given an arbitrary tensor, the metric allows us to trade all the¯z-indices
for z-indices. It is easy to see that
T
q1

z...z
q2

¯z...¯z
z...z
p1
¯z...¯z
p2
→T
q1+p2

z...z
z...z
p1+q2
= (gz¯z )q2 (gz¯z )p2 T
q1

z...z
q2

¯z...¯z
z...z
p1
¯z...¯z
p2
. (14.14)
This correspondence is an isomorphism. For example, observe that
Tz¯z¯z →gz¯z gz¯z Tz¯z¯z = Tzz
z .
Thus, it is only necessary to consider tensors with pure z-indices. For these
tensors, we assign the helicity. Since T has z-indices only, it transforms under
z→w as
T →
( ∂w
∂ z
) n
T (14.15)
where n∈/CI is given by the number of upperz-indices minus the number of lower
z-indices. For example,
T zz z →T ww w =
( ∂w
∂ z
)
T zz z .
All that matters is the difference between the number of upper indices and the
number of lower indices. The tensor T zz is left invariant under z →w and is
regarded as a scalar. The number n is called the helicity. The set of helicity- n
tensors is denoted by /CC
n:
/CC
n ≡{T
q

z...z z...z
p
|q−p= n}. (14.16)
The helicity characterizes the irreducible representation of U(1)= SO(2).


## Page 550

S of a rw eh a v ea s s u m e dn is an integer. It can be shown that n = 1
2
corresponds to the spinor ﬁeld on /Sigma1g. In fact, the existence of spinors on the
Riemann surfaces is guaranteed by the triviality of the second Stiefel–Whitney
class of /Sigma1g.T h es e t/CC
1 is identiﬁed with the holomorphic line bundle K over /Sigma1g.
Then /CC
1/2 is the square root of K : S2
+ = K = /CC
1 where S+ is the positive-
chirality spin bundle. Similarly, we have /CC
−1 = ¯K = S2
−where S−is the
negative-chirality spin bundle.2
Example 14.1. In real indices, the helicity±1 vectors are given byV 1±iV 2.T h i s
follows since
V 1 ∂
∂ξ 1 + V 2 ∂
∂ξ 2 = (V 1+ iV 2)∂z + (V 1−iV 2)∂¯z .
We put V z = V 1+ iV 2 and V¯z = V 1−iV 2 ≃ Vz. The helicity ±2 tensors are
T 11± iT 22,w h e r eT is a symmetric traceless tensor of rank two. In fact, we ﬁnd
T 11
( ∂
∂ξ 1 ⊗∂
∂ξ 1 −∂
∂ξ 2 ⊗∂
∂ξ 2
)
+ T 12
( ∂
∂ξ 1 ⊗∂
∂ξ 2 + ∂
∂ξ 2 ⊗∂
∂ξ 1
)
= 2(T 11+ iT 12)∂z ⊗∂z + 2(T 11−iT 12)∂¯z ⊗∂¯z .
Clearly T zz = 2(T 1 + iT 12) has helicity +2a n d T¯z¯z = 2(T 11 −iT 12) has
helicity−2 (note that gz¯zgz¯z T¯z¯z = Tzz ).
14.1.3 Covariant derivatives
The only non-vanishing Christoffel symbols of /Sigma1g are (see (8.69))
/Gamma1z zz = gz¯z ∂z gz¯z = 2∂z σ/Gamma1 ¯z¯z¯z = g¯zz ∂¯z g¯zz = 2∂¯z σ. (14.17)
For tensors in /CC
n, we deﬁne two kinds of covariant derivative:∇z
(n) : /CC
n →/CC
n+1
and∇(n)
z : /CC
n →/CC
n−1.L e t
T
q

z...z z...z
p
∈/CC
n (q−p= n).
We deﬁne
∇z
(n)T z...z z...z = gz¯z∇¯z T z...z z...z
= gz¯z[∂¯z + (q−p)/Gamma1z¯zz]T z...z z...z
= gz¯z ∂¯z T z...z z...z (14.18a)
∇(n)
z T z...z z...z =∇z T z...z z...z
=[ ∂z + (q−p)/Gamma1z zz]T z...z z...z
= (∂z + 2n∂z σ) T z...z z...z . (14.18b)
2 We use S±, instead of /Delta1±, to denote the spin bundles. The symbol /Delta1± is reserved for Laplacians.


## Page 551

In (14.18b), 2 n∂z σ acts like a gauge potential /BT . We also deﬁne covariant
derivatives with respect to¯z,
∇¯z
(n) = g¯zz∇(n)
z , ∇(n)
¯z = g¯zz∇z
(n). (14.19)
The curvature two-form of K and the scalar curvature associated with the
Christoffel symbols are
/BY = Rz zz¯z dz∧d¯z=−∂¯z (2∂z σ) dz∧d¯z
=−2∂z ∂¯z σ dz∧d¯z (14.20a)
/CA = g¯zz Ric¯zz + gz¯z Ric z¯z =−8e−2σ ∂z ∂¯z σ. (14.20b)
Exercise 14.1. Verify that
∇z
(n) = 2e−2σ ∂¯z ∇(n)
z = e−2nσ ∂ze2nσ (14.21a)
∇¯z
(n) = 2e−2(n+1)σ ∂ze2nσ ∇(n)
¯z = ∂¯z . (14.21b)
∇z
(n) and∇(n)
z are mutual adjoints with respect to a properly deﬁned inner
product. Let T, U ∈/CC
n. We require that the inner product be invariant under a
holomorphic change of the coordinate z→w.S i n c e
gz¯z →|dw/dz|−2gz¯z d2z√
g→d2w√
g
¯T →(
dw/dz)n ¯TU →(dw/dz)nU.
We ﬁnd the combination
(T, U )≡
∫
d2z√
g(gz¯z )n ¯TU (14.22)
is invariant under holomorphic coordinate transformations. Take T ∈/CC
n and
U∈/CC
n+1.W eﬁ n dt h a t
(U,∇z
(n)T )=
∫
d2z e2σ 2−n−1e2(n+1)σ ¯U2e−2σ ∂¯z T
=−2−n
∫
d2zT ∂¯z[e(2n+1)σ ¯U] (partial integration)
=−2−n
∫
d2zT e(2n+1)σ
[∂zU+ (2n+ 1)(∂z σ) U]
=−
∫
d2z√
g(gz¯z )n[∇(n+1)
z U]¯T =
 (−∇(n+1)
z U, T ).
This shows that
(∇z
(n))† =−∇(n+1)
z . (14.23a)


## Page 552

Exercise 14.2. Show that
(∇(n)
z )† =−∇z
(n−1).( 14.23b)
We deﬁne two kinds of Laplacian /Delta1±
(n) : /CC
n →/CC
n±1→/CC
n by
/Delta1+
(n)
≡−∇(n+1)
z ∇z
(n) =−2e−2σ[∂z ∂¯z + 2n(∂z σ) ∂¯z] (14.24a)
/Delta1−
(n)
≡−∇z
(n−1)∇(n)
z =−2e−2σ[∂z ∂¯z + 2n(∂z σ) ∂¯z + 2n(∂z ∂¯z σ)]. (14.24b)
Then it follows that
/Delta1+
(n)
−/Delta1−
(n)
= 4ne−2σ (∂z ∂¯z σ) =−1
2 n/CA . (14.25)
This shows, in particular, that
/Delta1+
(0)
= /Delta1−
(0)
(≡/Delta1(0)). (14.26)
14.1.4 The Riemann–Roch theorem
Here we derive a version of the Riemann–Roch theorem from the Atiyah–Singer
index theorem following D’Hoker and Phong (1988).
Theorem 14.1. (Riemann–Roch theorem)L e t/Sigma1g be a Riemann surface of genus
g. Then the index of the operator∇(n)
z is
dim
/BV
ker∇(n)
z −dim
/BV
ker∇z
(n−1) = (2n−1)(g−1). (14.27)
Proof. We use the heat kernel to evaluate the index. We ﬁrst note that ker∇(n)
z =
ker /Delta1−
(n) and ker∇z
(n−1) = ker /Delta1+
(n−1)
(see (14.24)). The heat kernel /C3
+
n of /Delta1+
(n)
satisﬁes
( ∂
∂ t + /Delta1+
(n)
)
/C3
+
n (z,w; t)=
( ∂
∂ t + /Delta1−Vn
)
/C3
+
n (z,w; t)= 0
where /Delta1≡−2∂z ∂¯z is the ﬂat-space Laplacian and
Vn ≡/Delta1−/Delta1+
(n)
= (1−e−2σ )/Delta1+ 4ne−2σ ∂z σ∂¯z .
The Laplacian /Delta1also deﬁnes a heat kernel by
( ∂
∂ t + /Delta1
)
K (z,w; t)= 0
which is easily solved to yield
K (z,w; t)= 1
4π t e−|z−w|2 /2t .


## Page 553

The perturbative computation and iteration yield
/C3
+
n (z, z′; t)= K (z, z′; t)
+
∫ t
0
ds
∫
dw K (z,w; t−s)Vn (w)/C3
+
n (w, z′; s)
= K (z, z′; t)+
∫
ds
∫
dw K (z,w; t−s)Vn (w)K (w, z′; s)
+
∫
ds
∫
ds′
∫
dv
∫
dw K (z,v; t−s)Vn (v)
× K (v, w; s−s′)Vn (w)K (w, z′; s′)
+··· .
We are particularly interested in /C3
+
n (z, z; t), t being small,
/C3
+
n (z, z; t)= 1
4π t +
∫ t
0
ds
∫
dw K (z,w; t−s)Vn (w)K (w, z; s)+ /C7 (t).
(14.28)
If we take a coordinate system in which σ = 0a t z,w eh a v e
σ( w )≃ 0+ ∂z σ( w−z)+ ∂¯z σ( ¯w−¯z)
+ 1
2[∂ 2
z σ( w−z)2+ ∂ 2
¯z σ( ¯w−¯z)2+ 2∂z ∂¯z σ|w−z|2]+··· .
Due to rotational symmetry in two-d imensional space, only those terms with
one z-derivative and one ¯z-derivative survive in the integral in (14.28). Terms
proportional to ∂z σ∂¯z σ cancel between the second and third terms in the
expansion and we are left with terms proportional to ∂z ∂¯z σ .N o w w e h a v e t o
evaluate
∫ t
0
ds
∫
d2w K (z,w; t−s)
×[ 2∂z ∂¯z σ|¯w−¯z|2/Delta1w+ 4n(¯w−¯z)∂z ∂¯z σ∂ ¯w]K (w, z; s).
From the identities
∫
d2w K (z,w; t−s)|w−z|2/Delta1w K (w, z; s)
= 1
16π 2s2(t−s)
∫
d2w|w|2 exp
(
− t
2s(t−s)|w|2
)
− 1
32π 2s3(t−s)
∫
d2w|w|4 exp
(
− t
2s(t−s)|w|2
)
= (t−s)(2s−t)
2π t3


## Page 554

and
∫
d2w K (z,w; t−s)(¯z−¯w)∂¯w K (w, z; s)
= 1
32π 2s2(t−s)
∫
d2w exp
(
− t
2s(t−s)|w|2
)
= t−s
4π t2
we ﬁnd that
/C3
+
n (z, z; t)= 1
4π t + 1+ 3n
12π /Delta1σ+ /C7 (t). (14.29a)
We also have the diagonal part of the heat kernel /C3
−
n for /Delta1−
(n),
/C3
−
n (z, z; t)= 1
4π t + 1−3n
12π /Delta1σ+ /C7 (t). ( 14.29b)
From (14.29) and (14.20b), we obtain
ind∇(n)
z =
∫
d2z
( 1−3n
12π −1+ 3(n−1)
12π
)
/Delta1σ= 1−2n
8π
∫
d2x /CA
=−2n−1
2 χ( /Sigma1g )= (2n−1)(g−1)
where
χ = 1
4π
∫
d2x /CA = 2−2g
is the Euler characteristic of /Sigma1g.
14.2 Quantum theory of bosonic strings
Now we are ready to introduce Polyakov’s formulation of bosonic strings, which
is based on the path integral over geometries. Since the string action contains an
enormous symmetry, we have to pay special attention to counting independent
geometries once and only once. This is achieved by the Faddeev–Popov trick.
Our argument will be restricted to the sim plest case, namely closed orientable
bosonic strings; the theory is deﬁned on Riemann surfaces.
14.2.1 Vacuum amplitude of Polyakov strings
According to the general prescription of the path integral formalism, the partition
function (vacuum-to-vacuum amplitude) of the string theory is given by
Z=
∞∑
g=0
Zg =
∞∑
g=0
∫
/BW X/BW γ e−S[X,γ] (14.30)


## Page 555

Figure 14.1. The total vacuum amplitude is given by summing over g-loop amplitudes.
see ﬁgure 14.1. To avoid confusion, we denote the genus by g and the metric by
γ . The sum over genera amounts to the sum over the topologies. Zg is the g-loop
amplitude and is obtained by integrating over all metricsγ and all embeddings X.
As we shall see later, the measure /BW X/BW γ is not well deﬁned and we need some
modiﬁcations. The string action S[X,γ ] is taken to be
S[X,γ ]≡1
2
∫
d2ξ√
γγ αβ ∂α Xµ∂β Xµ+ λ
4π
∫
d2ξ√
γ /CA . (14.31)
The ﬁrst term is the Polyakov action. The second term is proportional to the Euler
characteristic
χ = 1
4π
∫
d2 ξ√
γ /CA = 2−2g
and serves as the string coupling constant; the amplitude of a loop with genusg is
suppressed by the factor e−2λ g. Since this term is a topological invariant, it does
not affect the dynamics of the string. We are interested in Riemann surfaces of a
ﬁxed genus g and drop this term. The ﬁrst term of the action has the following
symmetries (section 7.11):
(A) Diff (/Sigma1g ), the group of diffeomorphisms f : /Sigma1g →/Sigma1g.L e tξ α →ξ
′α (ξ ) be
the coordinate expression for f . The new metric is the pullback of the old
one whose coordinate component expression is
γ αβ →f∗γ αβ = ∂ξ γ
∂ξ
′α
∂ξ δ
∂ξ
′β γ γδ . (14.32)
The embedding also gets transformed as
X µ →f∗Xµ = Xµ f. (14.33)
The invariance of the classical action takes the form
S[X,γ ]= S[ f∗X, f∗γ]. (14.34)
(B) Weyl (/Sigma1g ), the group of two-dimensional Weyl rescalings
γ αβ →ˆγ αβ ≡eφ γ αβ (14.35)


## Page 556

Figure 14.2. An element of /BX × /C5
g is obtained by the action of Diff(/Sigma1g )∗Weyl(/Sigma1g ) on
an element (X,γ) in the gauge slice.
where φ ∈/BY (/Sigma1g). The conformal invariance of S takes the form
S[X,γ ]= S[X,ˆγ]. (14.36)
The symmetries (A) and (B) must be preserved under quantization, otherwise
the theory has anomalies.
According to the standard Faddeev–Popov formalism, the degrees of
freedom corresponding to these symmetries have to be omitted when we deﬁne
Zg. For example, the string geometry speciﬁed by the pairs (X1,γ 1) and
(X2,γ 2) should not be counted independently if they are related by an element of
Diff(/Sigma1g ). Similarly, (X,γ) and (X, eφ γ) should not be counted as independent
conﬁgurations. Unless special attention is paid, we would count the same
conﬁgurations inﬁnitely many times, which leads to disastrous divergences. It
turns out that the space of all the geometries (X,γ) can be separated into
equivalence classes (the gauge slice ), any two points of which cannot be
connected by these symmetries, see ﬁgure 14.2.
To be more mathematical, let /BX be the space of all the embeddings X :
/Sigma1g →/CA
D and let /C5
g be the space of all the metrics deﬁned on /Sigma1g.N a i v e l y ,
the path integral is deﬁned over /BX × /C5
g. Because of the symmetries (A) and
(B), however, the integral should be restricted to the quotient space(/BX × /C5
g )/G
where G = Diff(/Sigma1g )∗Weyl(/Sigma1g ) is the gauge group. 3 The action of ( f, eφ ) on
(X,γ) ∈/BX × /C5
g is
( f, eφ )(X,γ) = ( f∗X, eφ f∗γ) . (14.37)
The quotient /C5
g /G is called the moduli space of /Sigma1g and is denoted by
Mod(/Sigma1g ). We are also interested in the subgroup Diff 0(/Sigma1g ) of Diff(/Sigma1g ),w h i c h
3 Here∗denotes the semi-direct product. Note that Diff(/Sigma1g )∩Weyl(/Sigma1g )̸=∅. We shall come back
to this point later.


## Page 557

Figure 14.3. The mapping class group (MCG) is generated by Dehn twists around ai , bi
and ci (1≤i≤g).
is a connected component of the identity map. The quotient space Teich (/Sigma1g )≡
/C5
g /Diff0(/Sigma1g )∗Weyl(/Sigma1g ) is called the Teichm ¨uller space of /Sigma1g. The general
theory of Riemann surfaces shows that Teich(/Sigma1g ) is a ﬁnite-dimensional universal
covering space of Mod(/Sigma1g ). Explicitly, we have
dim
/CA
Teich(/Sigma1g)=



0 g= 0
2 g= 1
6g−6 g≥2.
(14.38)
The group Diff (/Sigma1g )/Diff0(/Sigma1g ) is known as the modular group (MG) or the
mapping class group (MCG). The MCG is generated by theDehn twists deﬁned
in example 8.2. For the torus with genusg, the MCG is generated by 3g−1D e h n
twists around ai , bi and ci in ﬁgure 14.3. Unfortunately, these 3g−1D e h nt w i s t s
are not the minimal set of the generators. The general form of MCG for g≥2i s
not well understood.
From these arguments, the meaningful partition function turns out to be
Zg ≡
∫
/BX ×/C5
g
/BW X/BW γ
V (Diff∗Weyl)e−S[X,γ] (14.39)
where V (Diff∗Weyl) is the (inﬁnite) volume of the space of Diff(/Sigma1g )∗Weyl(/Sigma1g )
and takes care of the inﬁnite overcounting of the same geometry. The order (the
number of elements) of MCG is denoted by|MCG|. Clearly,
V (Diff∗Weyl)=| MCG|V (Diff0∗Weyl). (14.40)
14.2.2 Measures of integration
We have to deﬁne a sensible measure to carry out the integration (14.39) so that
the physical degrees of freedom and the gauge degrees of freedom are separated.
This separation of degrees of freedom requires the Jacobian,
/BW γ /BW X→J (/BW physical)(/BW gauge). (14.41)


## Page 558

To ﬁnd this Jacobian, we note that the Jacobian on a manifold M agrees with that
on TM . To see this, let xµ (yµ) be a coordinate of a chart U (V ) of M such that
U∩V ̸=∅. The Jacobian of the coordinate change is J = det(∂ yµ/∂ xν ).T a k e
V ∈Tp M. In components, we have V = uµ∂/∂ xµ = vµ∂/∂ yµ,w h e r e
vµ = uν (∂ yµ/∂ xν ). (14.42)
{uµ} and{vµ} are ﬁbre coordinates of Tp M. The Jacobian ˆJ associated with this
coordinate change is
ˆJ= det(∂v µ/∂ uν )= det(∂ yµ/∂ xν )= J. (14.43)
This shows that the Jacobian at p∈M is the same as that on Tp M. The Jacobian
ˆJ depends on p but not on the vector itself, since J depends only on p.
Example 14.2. Let (x, y) and (r,θ) be coordinates of /CA
2 ,w h e r ex= r cos θ and
y= r sin θ . The Jacobian of the coordinate change is
J= det ∂( x, y)
∂( r,θ) = r.
Let us take
V = vx ∂/∂ x+ vy ∂/∂ y= vr ∂/∂ r+ vθ ∂/∂θ ∈Tp R2.
(vx ,v y ) and (vr ,v θ ) serve as ﬁbre coordinates of Tp
/CA
2 .S i n c e
vx = vr ∂ x/∂ r+ vθ ∂ x/∂θ v y = vr ∂ y/∂ r+ vθ ∂ y/∂θ
the associated Jacobian ˆJ is easily calculated to be
ˆJ= det[∂(v x ,v y )/∂(v r ,v θ )]=
⏐⏐
⏐
⏐
∂ x/∂ r ∂ x/∂θ
∂ y/∂ r ∂ y/∂θ
⏐
⏐
⏐
⏐= J.
Let us derive this Jacobian in an indirect but suggestive way. We normalize
t h em e a s u r ed
2v as4
1=
∫
d2v exp(−1
2∥v∥2)=
∫
dvx dvy exp[−1
2 (v2
x + v2
y )].
We also have∥v2∥2 = v2
r + r2v2
θ . Noting that the Jacobian is independent of vr
and vθ ,w eh a v e
1= J
∫
dvr dvθ exp[−1
2 (v2
r + r2v2
θ )]= Jr−1
4 This normalization of the measure differs by a constant factor from the conventional one.


## Page 559

from which we ﬁnd J = r. We use this procedure to ﬁnd the functional measure
of string theory.5
This analysis enables us to write
/BW δγ /BW δ X= J /BW δ(physical)/BW δ(gauge) (14.44)
where δγ (δ X ) is a small variation of the metric γ (the embedding X)a n di s
regarded as an element of Tγ (/C5
g )( TX
/BX ). The meaning of the RHS becomes
clear in a moment.
Consider the diffeomorphism generated by an inﬁnitesimal vector ﬁeld δv
on /Sigma1g.S i n c eδv is inﬁnitesimal, it belongs to Diff0(/Sigma1g ) rather than the full group
Diff(/Sigma1g ). The changes of the metric and the embedding underδv are (see (7.120))
δDγ αβ = (/C4
δv γ) αβ =∇α δvβ +∇β δvα δD X= δv α ∂α X. (14.45)
The changes of γ and X under an inﬁnitesimal Weyl rescaling eδφ are
δWγ αβ = δφγ αβ δW X= 0. (14.46)
These changes belong to unphysical (gauge) degrees of freedom. In general, a
small change of metric is given by
δγ αβ = δWγ αβ + δDγ αβ + (physical change)
= δφγ αβ +∇α δvβ +∇β δvα + δti ∂
∂ ti γ αβ (t) (14.47)
where the last term is called the Teichm ¨uller deformation of the metric, which
can neither be described by a diffeomorphism nor by a Weyl rescaling. As
mentioned before, {i} is a ﬁnite set, 1 ≤i ≤n = dim
/CA
Teich(/Sigma1g ).I t i s
convenient for later purposes to separate δγ into a traceless part and a part with a
non-zero trace. We write
δγ αβ = δ¯φγ αβ + (P1δv) αβ + δti Tiαβ (t) (14.48)
where Tiαβ is the traceless part of the Teichm¨uller deformation,
Tiαβ ≡∂γ αβ
∂ ti −1
2 γ αβ γ γδ ∂γ γδ
∂ ti . (14.49)
The operator P1 is deﬁned by
(P1δv) αβ ≡∇α δvβ +∇β δvα −γ αβ (∇γ δvγ ) (14.50)
and picks up the traceless part of δDγ αβ while δ¯φ is deﬁned by
δ¯φ = δφ +
(
∇γ δv γ + trace part of δt ∂γ
∂ t
)
(14.51)
5 It should be kept in mind that we introduce the tangent space only to obtain the Jacobian. The
tangent space itself has no physical relevance.


## Page 560

where we do not need the explicit form in the parentheses.
As for the embeddings, we consider the quotient /BX /Diff(/Sigma1g ). An arbitrary
embedding X is obtained by the action of Diff (/Sigma1g ) on some ˜X ∈/BX /Diff(/Sigma1g ).
Then a small change of the embedding is expressed as
δ X= δv α ∂α ˜X+ δ˜X (14.52)
where the ﬁrst term represents the change of X generated by δv while the second
is not associated with diffeomorphisms. Now the measure should look like
/BW δγ /BW δ X = J dnt /BW δv /BW δφ /BW δ˜X . (14.53)
To deﬁne the measure, we need to specify a metric on the tangent space, see
example 14.2. We restrict ourselves to the so called ultralocal metric which is
quadratic and depends on γ αβ but not on ∂γ αβ . Deﬁne a metric for symmetric
second-rank tensors by
∥δh∥2
γ =
∫
d2ξ√
γ( Gαβ γ δ + uγ αβ γ γδ )δhαβ δhγδ (14.54a)
where u > 0 is an arbitrary constant and
Gαβ γ δ ≡γ αγ γ βδ + γ αδ γ βγ −γ αβ γ γδ . (14.55)
It is readily veriﬁed that G is the projection operator to the traceless part
(tr Gαβ γ δ δhγδ = γ αβ Gαβ γ δ δhγδ = 0) while uγ αβ γ γδ is that to the trace part.
In a ﬁnite-dimensional manifold, a metric deﬁnes a natural volume element. In
the present case, however, the measure cannot be deﬁned explicitly and we have
to deﬁne it implicitly in terms of the Gaussian integral (see example 14.2),
∫
/BW δh exp(−1
2||δh||2
γ )= 1. (14.56a)
Similarly, the metrics for a scalar δφ , a vector δv and a map δ Xµ are deﬁned by
∥δφ∥2
γ =
∫
d2ξ√
γδ φ 2 (14.54b)
∥δv∥2
γ =
∫
d2ξ√
γγ αβ δv α δv β (14.54c)
∥δ X∥2
γ
=
∫
d2ξ√
γδ X µδ Xµ. (14.54d)
With these metrics, the measures are deﬁned by
∫
/BW δφ exp(−1
2||δφ||2
γ
)= 1 (14.56b)
∫
/BW δv exp(−1
2||δv||2
γ )= 1 (14.56c)
∫
/BW δ X exp(−1
2||δ X||2
γ
)= 1. (14.56d)


## Page 561

Exercise 14.3. Show that∥δγ∥2
γ and∥δ X∥2
γ
are invariant under Diff(/Sigma1g ) but not
under Weyl(/Sigma1g ). This is the possible origin of conformal anomalies, see (14.84).
Before we proceed further, we need to clarify the overlap between Diff0(/Sigma1g )
and Weyl(/Sigma1g ). Suppose δv ∈ker P1,t h a ti s ,
P1δv =∇α δvβ +∇β δvα −γ αβ (∇γ δv γ )= 0. (14.57)
We ﬁnd, for such δv,t h a t δDγ αβ = (∇γ δv γ )γ αβ . A vector δv ∈ker P1
is identiﬁed with the conformal Killing vector (CKV), see section 7.7. It is
important to note that δD and δW yield the same metric deformations ifδφ is taken
to be ∇γ δv γ . Thus, the set of the CKVs is identiﬁed with the overlap between
Diff0(/Sigma1g ) and Weyl(/Sigma1g ). Let there be k independent CKVs on /Sigma1g and denote
these by /Phi1α
s
(1≤s≤k). It is known from the theory of Riemann surfaces that
k=



6 g= 0
2 g= 1
0 g≥2.
(14.58)
We separate δv into a part generated by the CKV , and its orthogonal complement,
which we write as
δv α = δ˜vα + δas /Phi1α
s . (14.59)
The tangent vector δ X is also decomposed as
δ X= δ˜X+ δ˜vα ∂α ˜Xµ+ δas /Phi1α
s ∂α ˜Xµ. (14.60)
The functional measures now become
/BW δγ /BW δ X →J dn δ t/BW δφ /BW δ˜v dk δ a/BW δ˜X (14.61)
where we noted that the t-a n da-parameters are ﬁnite dimensional.
Let Diff⊥
0 (/Sigma1g ) be the subspace of Diff 0(/Sigma1g ), which is orthogonal to the
CKV . We have
V (Diff0)= V (Diff⊥
0 )· V (CKV) (14.62)
V (Diff0∗Weyl)= V (Diff⊥
0 )V (Weyl)
= V (Diff0)V (Weyl)/V (CKV). (14.63)
T a k eas l i c eˆγ( t) of /C5
g. The slice is parametrized by n Teichm ¨uller
parameters. Any metric ˜γ related to ˆγ by G= Diff(/Sigma1g )∗Weyl(/Sigma1g ) is written as
˜γ = f∗(eφ ˆγ) f ∈Diff(/Sigma1g ), eφ ∈Weyl(/Sigma1g ). (14.64)
We express a small deformation δ˜γ at ˜γ as a pullback of a deformation δγ at
γ ≡eδφ ˆγ : δ˜γ = f∗(δγ ) . Note that δγ is a small diffeomorphism at the origin


## Page 562

of Diff0(/Sigma1g ) and, hence, can be described by a vector ﬁeld δv.A s w a s s h o w n
in exercise 14.3, Diff (/Sigma1g ) is the isometry of the relevant vector spaces. It then
follows that
∥δ˜γ∥2
˜γ =∥ f∗(δγ )∥2
f∗γ =∥ δγ∥2
γ γ = eφ ˆγ. (14.65)
At the point γ , we decompose δγ as
δγ αβ = δφγ αβ + (P1δ˜v)αβ + δti Tiαβ (14.66)
where δφ has been redeﬁned so that it includes the trace parts of the Teichm¨uller
deformation and∇α δvβ +∇β δvα , see (14.51).
Exercise 14.4. Show that Tiαβ at γ is related to ˆTiαβ at ˆγ as
Tiαβ = eφ ˆTiαβ . (14.67)
Now we are ready to give the explicit form of the measure. We ﬁrst ﬁnd the
Jacobian associated with the change /BW δv →/BW δ˜vdk δa.W eh a v e
1=
∫
/BW δv exp(−1
2∥δv∥2
γ
)
= J
∫
/BW δ˜v dk δ a exp(−1
2∥δ˜v∥2
γ −1
2∥δas /Phi1s∥2
γ
)
= J[det(/Phi1s ,/Phi1r )]−1/2 (14.68a)
where
(/Phi1s ,/Phi1r )=
∫
d2 ξ√
γγ αβ /Phi1α
s
/Phi1β
r .( 14.68b)
[Remark: Although the matrix element (14.68b) is deﬁned for γ = eφ ˆγ , we can
show that it is independent of eφ . To see this, let us take a CKV ˆ/Phi1α
s of the metric
ˆγ ; ˆ∇α ˆ/Phi1sβ +ˆ∇β ˆ/Phi1sα =ˆγ αβ ˆ∇ˆ/Phi1γ
s ,w h e r eˆ∇is the covariant derivative with respect
to ˆγ and ˆ/Phi1sα ≡ˆγ αβ ˆ/Phi1β
s
. A simple calculation shows that /Phi1sα = γ αβ ˆ/Phi1β
s
= eφ ˆ/Phi1sα
satisﬁes
∇α /Phi1sβ +∇β /Phi1sα = eφ (ˆ∇α ˆ/Phi1sβ + ˆ∇β ˆ/Phi1sα +ˆγ αβ /Phi1γ
s
∂γ φ)
= eφ ˆγ αβ (ˆ∇γ /Phi1γ
s
+ /Phi1γ
s
∂γ φ) = γ αβ ∇γ /Phi1γ
s
∇being the covariant derivative with respect to γ . Thus, /Phi1α
s = ˆ/Phi1α
s
is a CKV
of the metric γ = eφ ˆγ a n dt h eC K Va r et a k e nt ob eφ independent.] Equation
(14.68a) shows that
/BW δv =[ det(/Phi1r ,/Phi1s )]1/2
/BW δ˜v dk δ a. (14.69)
Now the total measure is written as
J[det(/Phi1r ,/Phi1s )]1/2 dnt /BW δφ /BW δ˜v dk δ a/BW δ˜X (14.70)


## Page 563

where J takes care of the rest of the variable changes.
The Jacobian J is now obtained from (14.60), (14.66), (14.70) and the
deﬁnition of the measures (14.56). We have
1=
∫
/BW δγ /BW δ X exp(−1
2||δγ||2
γ −1
2||δ X||2
γ
)
= J det1/2(/Phi1, /Phi1)
∫
dn δ t/BW δ˜v/BW δφ dk δ a/BW δ˜X
× exp
[
−1
2
δφγ αβ + (P1δ˜v)αβ + δti ∂γ αβ
∂ ti


2
−1
2∥δ˜X+ δ˜vα ∂α ˜X+ δas /Phi1α
s ∂α ˜X∥2
]
= J det1/2(/Phi1, /Phi1)
∫
dn δ t/BW δ˜v... exp(−1
2∥MV∥2) (14.71)
where
V =




δt
δφ
δ˜v
δa
δ˜X




M=
( ∂γ/∂ t γ P
1
 00
00 ∂ ˜X
 /Phi1· ∂ ˜X 1
)
≡
( A 0
CB
)
.
(14.72)
The matrix in the exponent of (14.71) is
M† M=
( A† C†
0 B†
)( A 0
CB
)
=
( A† A+ C†CC † B
B†CB † B
)
=
( I ∗
0 B† B
)(
A† A 0
∗∗I
)
(14.73)
where∗and∗∗are irrelevant. The last expression has been obtained from the
identity, ( AB
CD
)
=
( IB
0 D
)( A−BD−1C 0
D−1CI
)
.
The Gaussian integrals in (14.71) are readily evaluated to yield
1= J det1/2(/Phi1, /Phi1)det−1/2(M† M)
= J det1/2(/Phi1, /Phi1)[det(A† A) det(B† B)]−1/2. (14.74)
To compute det1/2(A† A), we need to evaluate∥δγ∥2
γ .W eh a v e
||δγ||2
γ =
∫
d2ξ√
γ( Gαβ γ δ + uγ αβ γ γδ )
×[ δφγ αβ + (P1δ˜v)αβ + δti Tiαβ ][δφγ γδ + (P1δ˜v)γδ + δt j Tj γδ]
= 4u∥δφ∥2
γ +∥ P1δ˜v∥2+ δti δt j (Ti , Tj )+ 2δti (P1δ˜v, Ti ).
(14.75)


## Page 564

In general, Ti is not orthogonal to P1δv. To separate Ti into parts orthogonal to
P1δv and parallel to P1δv, we need to deﬁne the adjointP†
1 of P1. P1 is an elliptic
operator which takes a vector ﬁeld into a traceless symmetric tensor ﬁeld. Thus,
P†
1 maps symmetric traceless tensors to vectors. For a symmetric traceless tensor
δh,w eh a v e
(P1δv, δ h)=
∫
d2ξ√
γ Gαβ γ δ (P1δv) αβ δhγδ
=
∫
d2ξ√
γ(∇α δv β +∇β δv α )δhαβ
=
∫
d2ξ√
γδ v α (−2∇β )δhαβ ≡(δv, P†
1 δh)
where the inner product in the last expression is deﬁned by (14.54c). Thus, it
follows that
(P†
1 δh)α =−2∇β δhαβ . (14.76)
Suppose δh is orthogonal to P1δv. From the previous discussion, we have
(P1δv, δ h) = (δv, P†
1 δh) = 0. Since δv is arbitrary, δh must be an element
of ker P†
1 , see ﬁgure 14.4. Now Ti may be separated as
Ti = /C8
0Ti + /C8
⊥Ti (14.77a)
where the projection operators /C8
0 and /C8
⊥are deﬁned by
/C8
0 ≡1−P1
1
P†
1 P1
P†
1
/C8
⊥≡P1
1
P†
1 P1
P†
1 .( 14.77b)
It is easy to verify that /C8
0 + /C8
1 = 1, /C8
0
/C8
⊥= 0, P†
1
/C8
0 = 0, P†
1
/C8
⊥=
P†
1 , /C8
0Ti = Ti and /C8
⊥Ti = 0f o rTi ∈kerP†
1 etc. Thus (14.77a) is an orthogonal
decomposition of Ti . We write /C8
⊥Ti = P1ui ,w h e r e
ui = 1
P†
1 P1
P†
1 Ti .
Let {ψ r} (1 ≤r ≤n) be a real basis of ker P†
1 , which is not necessarily
orthonormal. Then Ti can be expanded as (ﬁgure 14.5)
Ti =
∑
r
ψ r Qri + P1ui . (14.78)
Taking an inner product between Ti and ψ r ,w eﬁ n dt h a t
Qri =
∑
s
[(ψ, ψ) −1]rs (ψ s , Ti ). (14.79)


## Page 565

Figure 14.4. The map P1 and its adjoint P†
1 .
Figure 14.5.{Ti} spans the deformation tangent to the gauge slice while{ψ r} spans ker P†
1 .
Finally, δγ is decomposed into mutually orthogonal pieces as
δγ = δφγ + P1(δ˜v+ δti ui )+ δti ψ r Qri . (14.80a)
Correspondingly, the space of the metric deformation {δγ} separates into the
direct sum
{δγ}={ conf}⊕{im P1}⊕{ker P†
1}.( 14.80b)


## Page 566

Substituting (14.80a) into (14.75), we obtain
||δγ||2 = 4u||δφ||2+|| P1δ¯v||2
+ δti δt j (Ti ,ψ r )γ[(ψ, ψ) −1
γ ]rs (ψ s , Tj )γ (14.81)
where δ¯v≡δ˜v+ δti ui and the inverse in the last term refers to the inverse of the
matrix (ars )= ((ψ r ,ψ s )). If we put /CE
t
1 = (δt,δ φ,δ ¯v),w eﬁ n dt h a t
det−1/2(A† A)=
∫
dn δ t/BW δφ /BW δ¯v exp(−1
2
/CE
t
1 A† A/CE
1)
=
∫
/BW δφ exp(−2u||δφ||2)
∫
/BW δ¯v exp(−1
2||P1¯v||2)
×
∫
dn δ t exp{−1
2 δti (Ti ,ψ r )[(ψ, ψ) −1]rs (ψ s , Tj )δt j}
∝(det P†
1 P1)−1/2
(
det(T,ψ) 2
det(ψ, ψ)
)−1/2
. (14.82)
Collecting the results (14.71) and (14.82), we have
1= J det1/2(/Phi1, /Phi1)det−1/2 B† B det−1/2 P†
1 P1
(
det(T,ψ) 2
det(ψ, ψ)
)−1/2
.
The g-loop partition function is then given by
Zg =
∫ dnt /BW ¯v/BW φ det ˜X
V (Diff∗Weyl) det1/2 B† B det−1/2(/Phi1, /Phi1)
×
(
det P†
1 P1
det(T,ψ) 2
det(ψ, ψ)
) 1/2
e−S . (14.83)
The integral over a (the CKV) has been omitted since it is already included in the
φ -integration. Naively, the integral over¯v yields V (Diff⊥
0 ) and that over φ yields
V (Weyl). However, as exercise 14.3 shows, the measures /BW X and /BW γ depend
on the conformal factor. Polyakov (1981) has shown that, under the conformal
transformation γ →e2φ γ , the measures transform as
/BW X→exp
( D
24π 2
∫
d2ξ√
γ( γ αβ ∂α φ∂ β φ + /CA φ)
)
/BW X (14.84a)
/BW γ →exp
( −26
24π 2
∫
d2ξ√
γ( γ αβ ∂α φ∂ β φ + /CA φ)
)
/BW γ. (14.84b)
Thus, the measure /BW X/BW γ is conformally invariant if and only if D= 26. This
number 26 is called the critical dimension. Henceforth, we always assume that


## Page 567

D= 26. Now (14.83) simpliﬁes as
Zg = 1
|MCG|
∫
dnt /BW
˜X det1/2 B† B det−1/2(/Phi1, /Phi1)
×
(
det P†
1 P1
det(T,ψ) 2
det(ψ, ψ)
) 1/2
e−S . (14.85)
We perform the X-integration to eliminate det1/2 B† B.W eh a v e
1=
∫
/BW δ X exp(−1
2||δ X||2)
= J
∫
/BW δ˜X dk δ a exp(−1
2||δ˜X+ δas /Phi1α
s ∂α ˜X||2)
= J
∫
/BW δ˜X exp(−1
2||δ˜X||2)
∫
dk δ a exp(−1
2||δas /Phi1α
s ∂α ˜X||2)
= J det−1/2(B† B)
and hence det 1/2(B† B) is identiﬁed with the Jacobian of the transformation
X→(˜X , a). Thus, it follows that
∫
/BW
˜X det1/2 B† Be−S =
∫
/BW X
V (CKV)e−S (14.86)
where V (CKV)=
∫
dk a is the volume of the CKV .
The integration over X is readily carried out. Let us write
∫
/BX
/BW Xe−S =
∫
/BX
/BW X exp[−1
2 (X,/Delta1X)] (14.87a)
where
/Delta1=−1
√
γ ∂α
√
γγ αβ ∂β (14.87b)
is the Laplacian acting on 0-forms, see (7.188). We write down the explicit form
of the path integral (14.87a). Let ψ n be the eigenfunction of /Delta1,
/Delta1ψn = λ n ψ n λ n ∈[0,∞) (14.88)
where ψ n are normalized as
(ψ n ,ψ m )=
∫
d2ξ√
γψ n ψ m = δnm .
The eigenvalue λ is non-negative since /Delta1is positive deﬁnite. Let us expand Xµ
in ψ n as
Xµ =
∞∑
n=0
aµ
n ψ n = Xµ
0 + X
′µ aµ
n ∈R (14.89)


## Page 568

where Xµ
0 = aµ
0 ψ 0 is the zero eigenfunction of /Delta1and X
′µ are the remaining
degrees of freedom. Correspondingly, the path integral (14.87a) is written as
∫
/BW X exp[−1
2 (X,/Delta1X )]=
∫ ∏
n,µ
daµ
n exp
(
−1
2
∑
n,µ
λ n (aµ
n )2
)
=
∫ ∏
µ
daµ
0
∫ ∏
n̸=0
∏
µ
daµ
n exp
(
−1
2
∑
n,µ
λ n (aµ
n )2
)
=
( ∫ ∏
µ
daµ
0
)
(det′ /Delta1)−13 (14.90)
where the prime indicates that the zero mode is omitted. To integrate over the
zero mode, we note that the normalized eigenvector ψ 0 is given by6
ψ 0 =
( 1
∫
d2 ξ√
γ
) 1/2
. (14.91)
From Xµ
0 = aµ
0 ψ 0,w eh a v e
∫ ∏
µ
daµ
0 =
∫ ∏
µ
dXµ
0 (ψ 0)−26 = V
( 1
∫
d2 ξ√
γ
)−13
(14.92)
where V =
∫ ∏ dXµ
0 is the spacetime volume. Collecting the results (14.90) and
(14.92), we ﬁnd that
∫
/BW Xe−S =
( det′/Delta1
∫
d2 ξ√
γ
)−13
(14.93)
where we have dropped V and other irrelevant constants.
Finally, we have obtained the expression for the g-loop partition function
Zg =
∫
Mod
dnt
V (CKV)
det(T,ψ)
det1/2(ψ, ψ) det1/2(/Phi1, /Phi1)
×[ det′ P†
1 P1]1/2
( det′ /Delta1
∫
d2ξ√
γ
)−13
(14.94)
where we have noted that
1
|MCG|
∫
Teich
dnt=
∫
Mod
dnt. (14.95)
If g≥2, the Riemann surfaces have no CKV and (14.95) reduces to
Zg =
∫
Mod
dnt det(T,ψ)
det1/2(ψ, ψ)
(det′ P†
1 P1)1/2
( det′ /Delta1
∫
d2ξ√
γ
)−13
. (14.96)
6 Since ψ 0 satisﬁes /Delta1ψ0 = 0, it is a harmonic function. Any harmonic function on a Riemann
surface must be a constant by the maximum principle.


## Page 569

14.2.3 Complex tensor calculus and string measure
Since any Riemann surface admits complex structures, we may take advantage of
this fact to compute string amplitudes. Many beautiful aspects of string theory
are revealed only when these complex structures are explicitly taken into account.
Here we rewrite the partition function in t he language of complex differential
geometry.
We ﬁrst ﬁx the gauge in /C5
g by choosing the isothermal coordinate system
γ = 1
2 e2σ[dz⊗d¯z+ d¯z⊗dz]
where γ z¯z = γ¯zz = 1
2 exp 2σ .7 Then the deformation of γ under a
diffeomorphism generated by δv is (cf (14.45))
δDγ zz = 2∇(−1)
z δvz
δDγ z¯z =∇z δv¯z +∇¯z δvz = γ¯zz (∇(1)
z δv z +∇z
(−1)δvz ).
(14.97)
Similarly, δWγ generated by an inﬁnitesimal conformal change is (cf (14.46))
δW γ z¯z = δφγ z¯z δW γ zz = 0. (14.98)
To see the action of the operator P1 on vectors, we take δv z ∈/CC
1 and
δvz ∈/CC
−1. From (14.50), we ﬁnd that
(P1δv) zz = 2∇z
(1)δv z ∈/CC
2 (14.99a)
(P1δv) zz = 2∇(−1)
z δvz ∈/CC
−2. (14.99b)
This shows that P1 is a map:
P1 =
(
∇z
(1) 0
0 ∇(−1)
z
)
: /CC
1⊕/CC
−1→/CC
2⊕/CC
−2. (14.100)
Similarly, P†
1 maps traceless symmetric tensors to vectors. For δhzz ∈/CC
2 and
δhzz ∈/CC
−2,w eh a v e
(P†
1 δh)z =∇(2)
z δhzz ∈/CC
1 (14.101a)
(P†
1 δh)z =∇z
(−2)δhzz ∈/CC
−1. (14.101b)
Thus, P†
1 is a map:
P†
1 =
(
∇(2)
z 0
0 ∇z
(−2)
)
: /CC
2⊕/CC
−2→/CC
1⊕/CC
−1. (14.102)
7 In fact, the gauge is not uniquely ﬁxed with this choice. We will invoke theuniformization theorem
later to ﬁx the gauge completely.


## Page 570

The product P†
1 P1 is
P†
1 P1 =
(
∇(2)
z ∇z
(1) 0
0 ∇z
(−2)∇(−1)
z
)
: /CC
1⊕/CC
−1→/CC
1⊕/CC
−1. (14.103)
Accordingly, the determinant in (14.96) becomes
(det′ P†
1 P1)1/2 = (det′∇(2)
z ∇z
(1) det′∇z
(−2)∇(−1)
z )1/2
= (det′ /Delta1+
(1)/Delta1−
(−1)
)1/2 (14.104)
where /Delta1±
(n)
are the Laplacians. We show that the spectrum of /Delta1+
(1)
is the same as
that of /Delta1−
(−1)
. Take an eigenfunction δv z of /Delta1+
(1)
,
/Delta1+
(1)δv z =−2e−4σ ∂ze2σ ∂¯z δv z = λδ zz (14.105)
where (14.21a) has been used. The eigenvalue λ is a non-negative real number
(note /Delta1±
(n) are positive-deﬁnite Hermitian operators). Then we ﬁnd
/Delta1−
(−1)
(γ z¯z
 δv z )=−e−2σ ∂¯ze2σ ∂z
 δv z =−e−2σ
 ∂ze2σ ∂¯z δv z
=−γ z¯z2e−4σ
 ∂ze2σ ∂¯z δv z = λγ z¯z
 δv z (14.106)
which shows that γ z¯z
 δv z is an eigenfunction of /Delta1−
(−1)
with the same eigenvalue
λ . It is easy to see that the converse is also true, see exercise 14.5. Thus, /Delta1+
(1)
and /Delta1−
(−1)
share the same eigenvalues and det′ /Delta1+
(1)
= det′ /Delta1−
(−1)
. Now (14.104)
becomes
(det′ P†
1 P1)1/2 = det′ /Delta1−
(−1)
= det′ /Delta1+
(1)
. (14.107)
Exercise 14.5. Let δvz be an eigenvector of /Delta1−
(−1)
with an eigenvalue λ .S h o w
that γ z¯z
 δvz is an eigenvector of /Delta1+
(1)
with the same eigenvalue.
The physical change of the metric is the Teichm¨ uller deformation δτ i µi ,
where τ i (µi ) is the complex counterpart of ti (Ti ). From our experience, we
know that the relevant part of the Teichm¨ uller deformation is symmetric and
traceless in the real basis. In the complex basis, this amounts to µiz¯z = µi¯zz = 0.
Accordingly, the general variation of the metric is given by
δγ zz =∇(−1)
z δ˜vz + δτ i µizz (14.108a)
δγ z¯z = δφγ z¯z (14.108b)
where we have redeﬁned δφ so that it includes the variation of δγ z¯z due to δv
(note that δDγ z¯z ∝γ z¯z). In (14.108a), δ˜v does not contain the CKV , that is,
δ˜v∈(ker∇(−1)
z )⊥.


## Page 571

To carry out the orthogonal decomposition of {δγ},w en e e dt od e ﬁ n et h e
inner products in various spaces. The most natural choices are
∥δγ zz∥2 =
∫
d2z√
γ
 δγ zz δγ zz (14.109a)
∥δγ z¯z∥2 =
∫
d2z√
γ
 δγ z¯z δγ z¯z (14.109b)
and
∥δvz∥2 =
∫
d2z√
γγ z¯z
 δv z δv z .( 14.109c)
Note that δγ zz dz⊗dz and δγ z¯zdz⊗d¯z are different tensors; we have to specify
the inner product separately.
Following the argument in the previous subsection, we introduce the
orthogonal decomposition,
δγ zz =∇(−1)
z δ˜vz + δτ i µizz =∇(−1)
z δ¯vz + δτ i φ izz (14.110)
where δ¯v = δ˜v+ (projection of δτ i µizz into{im∇(−1)
z }). The orthogonality of
∇(−1)
z δ¯vz and φ izz implies
0= (∇(−1)
z δvz ,φ izz )=
∫
d2z√
γ
 δvz (−∇z
(−2)φ izz )
where we have noted that∇(−1)†
z =−∇z
(−2). Thus, we ﬁnd that (ﬁgure 14.6)
φ izz ∈ker∇z
(−2). (14.111)
The explicit form of∇z
(−2) shows that ∂¯z φ izz = 0, that is ker∇z
(−2) is the set
of holomorphic tensors of helicity−2. The tensor φ i = φ izz dz⊗dz is called the
quadratic differential while µi = µizz dz⊗dz is the Beltrami differential,s e e
ﬁgure 14.7. In practical computations, it is often convenient to specify the gauge
slice by the Beltrami differential, see later. Now we have established that
{ker P†
1}={ Quadratic differential}={ ker∇z
(−2)}. (14.112)
The Riemann–Roch theorem (14.27) takes the form
dim
/BV
ker∇(−1)
z −dim
/BV
ker∇z
(−2) = 3−3g. (14.113)
Now we have separated{δγ} into mutually orthogonal pieces
{δγ}={ conf}⊕{im∇(−1)
z }⊕{ker∇z
(−2)}+ cc (14.114)
which should be compared with (14.80b). The measure becomes
/BW δγ /BW δ X →J dn δτ /BW δ¯v/BW δφ /BW δ˜X dk δa (14.115)


## Page 572

Figure 14.6. The map∇(−)
z and its adjoint∇z
(−2).
Figure 14.7. The Beltrami differential {µi} spans the deformation tangent to the gauge
slice while{φ i} spans ker∇z
(−2).
where n and k are the complex dimensions of the Teichm¨uller space and the CKV ,
respectively. The Jacobian is obtained by repeating the argument in the previous
subsection and we ﬁnd that
Zg =
∫
/BW γ /BW X 1
V (Diff*Weyl)e−S
=
∫
Mod
dn τ /BW X
det′ /Delta1+
(1)
V (CKV)
| det(µ, φ)|2
det(φ, φ) det(/Phi1, /Phi1)e−S . (14.116)
Since we are integrating over complex variables, the power of a half in (14.96)


## Page 573

does not appear in (14.116). The X-integration yields
Zg =
∫
Mod
dn τ
V (CKV)
| det(µ, φ)|2
det(φ, φ) det(/Phi1, /Phi1)
× det′ /Delta1+
(1)
( det′ /Delta1
∫
d2 z√
γ
)−13
. (14.117)
14.2.4 Moduli spaces of Riemann surfaces
The spaces Mod(/Sigma1g ) and Teich(/Sigma1g ) have been deﬁned as
Mod(/Sigma1g)≡/C5
g /Diff(/Sigma1g) Teich(/Sigma1g)≡/C5
g/Diff0(/Sigma1g).
They are related through MCG ≡ Diff(/Sigma1g )/Diff0(/Sigma1g ) as Mod (/Sigma1g ) =
Teich(/Sigma1g )/MCG. We look at these objects more closely here. We ﬁrst note:
g dim
/BV
CKV CKV dim
/BV
Teich(/Sigma1g ) MCG
03 S L (2, C) 0S L (2, R)
11 U (1)× U(1) 1S L (2, Z )
≥20 e m p t y 3 g−3?
(14.118)
[Remark:M C G f o rg≥2 can be expressed by 3 g−1 Dehn twists which are,
however, not minimal.] From (14.118), we immediately conclude that Z0 = 0
since the Teichm¨uller space is a single point and the volume of SL(2, /BV ) is inﬁnite.
Of course, this does not imply that the three amplitudes with vertex operators
vanish. In general, Mod (/Sigma1g ) is topologically non-trivial although Teich (/Sigma1g ) is.
Teich(/Sigma1g ) is a universal covering space of Mod (/Sigma1g ) and the topological non-
triviality comes from MCG.
In actual computations, the uniformization theorem is very useful. In the
previous subsection, we ﬁrst chose the Beltrami differential µi , then changed the
basis to φ i ∈ker P†
1 . Our initial choice µi is motivated by the uniformization
theorem.
Theorem 14.2. (Uniformization theorem)L e t/Sigma1g be a torus with genus g.T h e n
it is conformally related to the constant-curvature Riemann surface, which is given
by the following:
g Riemann surface Metric sign /CA
0 /BV ∪{∞} ds2 = dz⊗d¯z/(1+ z¯z)2 +
1 /BV /Ld s2 = dz⊗d¯z 0
≥2 H /G ds2 = dz⊗d¯z/(Im z)2 −
(14.119)
where L is a lattice in /BV (see example 8.2), H the upper half-plane and G ⊂
SL(2, /CA ) is called the Fuchsian group. The metric for g ≥2i st h e Poincar´e
metric, see example 7.6.


## Page 574

The proof of this theorem is found in Farkas and Kra (1980), for example.
Thanks to this theorem, we may always take constant-curvature metrics to form
the gauge slice in /C5
g. This corresponds to a special choice of the Beltrami
differential µi . This slice deﬁnes the Weil–Petersson measure:
∫
dn τ | det(µ, φ)|2
det(φ, φ) =
∫
d(Weil–Petersson) (14.120)
see D’Hoker and Phong (1986).
Exercise 14.6. Compute the scalar curvature of the metrics given in (14.119).
Verify that they are independent of z and¯z.
14.3 One-loop amplitudes
As an illustration of the formalism developed in the previous section, we compute
the one-loop vacuum-to-vacuum amplitude of the closed orientable bosonic string
theory. Since dim
/BV
Teich(/Sigma11)= 1 and dim
/BV
ker∇(−1)
z = 1, we have
Z1 =
∫
Mod
dτ
V (CKV)
|(µ, φ)|2
(φ, φ) · (/Phi1, /Phi1)det′ /Delta1+
(1)
( det′ /Delta1
∫
d2 ξ√
γ
)−13
. (14.121)
To evaluate (14.121) we need to take several steps.
14.3.1 Moduli spaces, CKV , Beltrami and quadratic differentials
In example 8.2, we have shown that the complex structure, namely the conformal
structure, of the torus is sp eciﬁed by a complex parameter τ( Im τ> 0). Figure
8.3 shows the moduli space
Mod(/Sigma1g )= /C5
1/G= Teich(/Sigma1g )/SL(2, /CI )= H /SL(2, /CI )
where H is the upper half-plane.
Take the torus Tτ s p e c i ﬁ e db yt h eT e i c h m ¨uller parameter τ = τ1+ iτ2 (τ2 >
0). As a representative, we take a torus in ﬁgure 14.8. The metric in /BV naturally
induces a ﬂat metric (as guaranteed by the uniformization theorem)
γ = 1
2[dz⊗d¯z+ d¯z⊗dz]. (14.122)
The CKV are globally deﬁned holomorphic vectors. We take /Phi1= α∂/∂ z as
the normalized basis of the CKV . The condition (/Phi1, /Phi1)= 1 yields
∫
d2 z|α|2 =
τ2|α|2 = 1, that is α = τ−1/2
2 (we have dropped the phase). The vector /Phi1
generates translations in the complex plane,
z→z′ = z+ τ−1/2
2 (v1+ iv2). (14.123)


## Page 575

Figure 14.8. The parallelogram whose complex structure is parametrized by τ .
We must note, however, that the translation is deﬁned modulo the lattice;
τ−1/2
2 (v1+ iv2) and τ−1/2
2 (v1 + iv2)+ (m+ τ n) yield the identical translation.
This forces τ−1/2
2 (v1+ iv2) to lie within the parallelogram of ﬁgure 14.8. Since
τ2 =
∫
d2z= τ−1
2
∫
d2v
V (CKV) is found to be
V (CKV)=
∫
d2v= τ 2
2 . (14.124)
Our next task is to evaluate the Weil–Petersson measure. On the torus there
is one quadratic differential φ .S i n c eφ ∈/CC
−2 is a globally deﬁned holomorphic
differential, it must be of the form,
φ = a dz⊗dza ∈/BV . (14.125)
To ﬁnd the Beltrami differential, we evaluate the change of the metric under
a small variation of τ . For this purpose, it is convenient to introduce the ξ
α -
coordinate system in ﬁgure 14.8. The point A corresponds to (1, 0) and B to
(0, 1). Accordingly, we have z = ξ 1 + τξ 2. Under a small change δτ of the
Teichm ¨uller parameter, we have, up to a conformal factor,
|dz|2 →|dξ 1+ (τ+ δτ) dξ 2|2 =| dz+ δτ dξ 2|2
=
⏐⏐⏐⏐dz+ dτ dz−d¯z
2iτ2
⏐
⏐⏐⏐
2
=
⏐
⏐⏐⏐dz+ δτ id¯z
2τ2
⏐
⏐⏐⏐ .
Comparing this with (14.110), we ﬁnd that
µ
zz = i/2τ2. (14.126)


## Page 576

Here (δτ )µ is the complex conjugate of (δτ )µ in (14.110). Of course, this is a
reparametrization of the Teichm¨uller space and does not affect the results. If the
reader feels awkward with this, s/he may choose ¯τ as the Teichm¨uller parameter.
From (14.125) and (14.126), we have, up to irrelevant constants,
(µ, φ) =
∫
d2z
 µzz φ zz = i
2τ2
aτ2 ∝a
(φ, φ) =
∫
d2z
 φ zz φ zz = a2τ2.
Finally, we have obtained
|(µ, φ)|2
(φ, φ) = τ−1
2 . (14.127)
14.3.2 The evaluation of determinants
We ﬁrst consider det′ P†
1 P1 = det′ /Delta1+
(1). Since we take a ﬂat metric, the Laplacian
takes quite a simple form,
/Delta1+
(1) =−2∂z ∂¯z = /Delta1 (14.128)
where /Delta1is the Laplacian deﬁned by (14.87b). Since
∫
d2ξ√
γ =
∫
d2z= τ2
the amplitude (14.121) reduces to
Z1 =
∫
Mod
dτ
τ 2
2
det′ /Delta1
τ2
( det′ /Delta1
τ2
)−13
(14.129)
↑↑↑
V (CKV) W-P
∫
d2z
where we have used (14.124) and (14.127). We have factorized the integrand so
that the modular invariance is manifest, see exercise 14.7.
Let us compute the spectrum of /Delta1. It is convenient to express the Laplacian
in ξ α -coordinates. From
ξ 1 = i(¯τ z−τ¯z)/2τ2 ξ 2 = (z−¯z)/2iτ2 (14.130)
we readily ﬁnd that
/Delta1=−1
2τ 2
2
[|τ|2(∂1)2−2τ1∂1∂2+ (∂2)2] (14.131)
where ∂1 = ∂/∂ξ 1 etc. The eigenfunction satisfying the periodic boundary
condition on the torus is
ψ m,n (ξ )= exp[2π i(nξ 1+ mξ 2)] (m, n)∈/CI
2. (14.132)


## Page 577

Substituting this into (14.131), we ﬁnd the eigenvalue
λ m,n = 2π 2
τ 2
2
(m−τ n)(m−¯τ n). (14.133)
The determinant is expressed as an inﬁnite product:
det′ /Delta1=
∏
m,n
′ 2π 2
τ 2
2
|m+ τ n|2 (14.134)
the product being taken for all integers (m, n)̸= (0, 0).
Clearly det′ /Delta1is ill deﬁned and needs to be regularized. Let us introduce the
Eisenstein series (Siegel 1980, Lang 1987) deﬁned by
E(τ, s)≡
∑
m,n
′ τ s
2
|m+ τ n|2s (14.135)
the summation being taken for all integers (m, n)̸= (0, 0). This series converges
for Re s > 1 and can be analytically continued to the complexs-plane. The series
E(τ, s) has a simple pole at s= 1 where we have a Laurent expansion,
E(τ, s)= π
s−1+ 2π[γ −ln 2−ln(√
τ2|η(τ)|2)]+ /C7 (s−1). (14.136)
This expression is known as the Kronecker ﬁrst limit formula and is essential
for our purposes. In (14.136), γ = 0.57721 ... is Euler’s constant and η(τ) is the
Dedekind η-function
η(τ) ≡eiπτ/ 12 ∏
n>1
(1−e2iπ nτ ). (14.137)
Neglecting constant factors, we have
det′ /Delta1
τ2
= exp
(
−ln τ2+
∑′
ln|m+ τ n|2
τ 2
2
)
= exp
(
−ln τ2−∂
∂ s[τ s
2 E(τ, s)]
⏐⏐
⏐⏐
s=0
)
= exp{−ln τ2[1+ E(τ, 0)]−E′(τ, 0)}. (14.138)
To evaluate the exponent, we note the functional equation,
π−s /Gamma1(s)E(τ, s)= π−(1−s)/Gamma1(1−s)E(τ, 1−s). (14.139)
Taking the limit s→0 in (14.139), we have
sE (τ, 1−s)= π 1−2s /Gamma1(1+ s)
/Gamma1(1−s) E(τ, s)
= π( 1−2s ln π +··· ) (1−γ s+··· )
(1+ γ s+··· )[E(τ, 0)+ E′(τ, 0)s+···]
= π E(τ, 0)+[−2(ln π + γ) E(τ, 0)+ E′(τ, 0)]π s+··· .


## Page 578

From (14.136), we also have
sE (τ, 1−s)=−π + 2π s[γ −ln 2−ln(√
τ2|η(τ)|2)]+··· .
Equating the coefﬁcients of s0 and s1,w eﬁ n dt h a t
E(τ, 0)=−1 (14.140a)
E′(τ, 0)=−2[ln 2π + ln(√
τ2|η(τ)|2)]. (14.140b)
Substituting (14.140) into (14.138), we obtain
det′ /Delta1
τ2
= exp[−E′(τ, 0)]= τ2|η(τ)|4. (14.141)
Finally, it follows from (14.129) and (14.141) that
Z1 =
∫
Mod
dτ
τ 2
2
τ−12
2 |η(τ)|−48. (14.142)
A neat form of Z1 is obtained if we deﬁne the discriminant
/Delta1(τ )≡(2π) 12η(τ) 24. (14.143)
Up to an irrelevant constant, the one-loop amplitude is
Z1 =
∫
Mod
dτ
τ 2
2
τ−12
2 |/Delta1(τ )|−2. (14.144)
/Delta1(τ )is known as the cusp form of weight 12, implying
/Delta1
( aτ+ b
cτ+ d
)
= (cτ+ d)12/Delta1(τ ) (14.145)
and c(0)= 0, where the c(n) are the Fourier coefﬁcients,
/Delta1(τ )=
∑
n≥0
c(n)e2π niτ . (14.146)
Higher genus amplitudes are given by the cusp forms of other weights, see Belavin
and Knizhnik (1986), Moore (1986), Gilbert (1986) and Morozov (1987).
Exercise 14.7. Show that
η(τ + 1)= eπ i/12η(τ) η( −1/τ )= (−iτ) 1/2η(τ) (14.147)
where the branch is chosen so that √
z > 0i f z > 0. Use this result to show
that dτ/τ 2
2 and τ−12
2 |η(τ)|−48 are independently invariant under τ →τ + 1a n d
τ →−1/τ .


## Page 579

REFERENCES
Adler S L 1969 Phys. Rev. 177 2426
Aitchison I J R 1987 Acta Phys. Pol. B 18 207
Alvarez O 1985 Topological methods in ﬁeld theory Berkeley Preprint UCB-PTH-85/43
Alvarez O 1995 Geometry and Quantum Field Theory ed D S Freed et al (Providence, RI:
American Mathematical Society) p 271
Alvarez-Gaum´e L 1983 Commun. Math. Phys. 90 161
——1986 Fundamental Problems of Gauge Field Theory (Erice, 1985) ed V Gelo and A
S Wightman (New York: Plenum)
Alvarez-Gaum´e L and Della Pietra S 1985Recent Developments in Quantum Field Theory
ed J Ambjørn et al (Amsterdam: Elsevier) p 95
Alvarez-Gaum´e L, Della Pietra S and Moore G 1985 Ann. Phys., NY 163 288
Alvarez-Gaum´e L and Ginsparg P 1984 Nucl. Phys. B 243 449
——1985 Ann. Phys., NY 161 423
Alvarez-Gaum´e L and Nelson P 1986 Supersymmetry, Supergravity, and Superstrings ’86
ed B de Wit and M Grisaru (Singapore: World Scientiﬁc)
Anderson P W and Brinkman W F 1975 The Helium Liquids ed J G M Armitage and
I E Farquhar (New York: Academic) p 315
Anderson P W and Toulouse G 1977 Phys. Rev. Lett. 38 408
Armstrong M A 1983 Basic Topology (New York: Springer)
Atiyah M F 1985 Arbeitstagung Bonn 1984 ed F Hirzebruch, J Schwermer and S Suter
(Berlin and Heidelberg: Springer) p 251
Atiyah M F and Jones J D S 1978 Commun. Math. Phys. 61 97
Atiyah M F, Patodi V and Singer I M 1975a Math. Proc. Camb. Phil. Soc. 77 43
——1975b Math. Proc. Camb. Phil. Soc. 77 405
——1976 Math. Proc. Camb. Phil. Soc. 79 71
Atiyah M F and Segal G B 1968 Ann. Math. 87 531
Atiyah M F and Singer I M 1968a Ann. Math. 87 485
——1968b Ann. Math. 87 546
——1984 Proc. Natl Acad. Sci., USA 81 2597
Bagger J 1987 The Santa Fe TASI-87 ed R Slansky and G West (Singapore: World
Scientiﬁc)
Bailin D and Love A L 1996 Introduction to Gauge Field Theory revised edn (Bristol and
New York: Adam Hilger)
Bardeen W A 1969 Phys. Rev. 184 1848
Belavin A A and Knizhnik V G 1986 Sov. Phys.–JETP 64 214
Belavin A A and Polyakov A M 1975 JETP Lett. 22 245
Belavin A A, Polyakov A M, Schwartz A S and Tyupkin Yu S 1975Phys. Lett. B 59 85
Bell J and Jackiw R 1969 Nuovo Cimento A 60 47
Berezin F A 1966The Method of Second Quantization(New York and London: Academic)


## Page 580

Berry M 1984 Proc. R. Soc. A 392 45
——1989 Principles of Cosmology and Gravitation 2nd edn (Bristol: Adam Hilger)
Bertlmann R A 1996 Anomalies in Quantum Field Theory (Oxford: Oxford University
Press)
Booss B and Bleecker D D 1985Topology and Analysis: The Atiyah–Singer Index Formula
and Gauge-Theoretic Physics (New York: Springer)
Bott R and Seeley R 1978 Commun. Math. Phys. 62 235
Bott R and Tu L W 1982 Differential Forms in Algebraic Topology(New York: Springer)
Buchholtz L J and Fetter A L 1977 Phys. Rev. B 15 5225
Calabi E 1957 Algebraic Geometry and Topology: A Symposium in Honor of S Lefschetz
(Princeton, NJ: Princeton University Press)
Callias C 1978 Commun. Math. Phys. 62 213
Candelas P 1988 Superstrings ’87 (Singapore: World Scientiﬁc)
Cheng T-P and Li L-F 1984 Gauge Theory of Elementary Particle Physics (New York and
Oxford: Oxford University Press)
Chern S S 1979 Complex Manifolds without Potential Theory 2nd edn (New York:
Springer)
Choquet-Bruhat Y and DeWitt-Morette C with Dillard-Bleick M 1982 Analysis, Manifolds
and Physics revised edn (Amsterdam: North-Holland)
Coleman S 1979 The Whys of Subnuclear Physics ed A Zichichi (New York: Plenum)
Crampin M and Pirani F A E 1986 Applicable Differential Geometry (Cambridge:
Cambridge University Press)
Croom F H 1978 Basic Concepts of Algebraic Topology(New York: Springer)
Daniel M and Viallet C M 1980 Rev. Mod. Phys. 52 175
Das A 1993 Field Theory (Singapore: World Scientiﬁc)
Deser S, Jackiw R and Templeton S 1982a Phys. Rev. Lett. 48 975
——1982b Ann. Phys., NY 140 372
D’Hoker E and Phong D 1986 Nucl. Phys. B 269 205
——1988 Rev. Mod. Phys. 60 917
Dirac P A M 1931 Proc. R. Soc. A 133 60
Dixon L, Harvey J, Vafa C and Witten E 1985Nucl. Phys. B 261 678
——1986 Nucl. Phys. B 274 285
Dodson C T J and Poston T 1977 Tensor Geometry (London: Pitman)
Donaldson S K 1983 J. Diff. Geom. 18 279
Eells J and Lemaire L 1968 Bull. London Math. Soc. 10 1
Eguchi T, Gilkey P B and Hanson A J 1980 Phys. Rep. 66 213
Farkas H M and Kra I 1980 Riemann Surfaces (New York: Springer)
Federbush P 1987 Bull. Am. Math. Soc. (N.S.) 17 93
Flanders H 1963 Differential Forms with Applications to the Physical Sciences(New York:
Academic, reprint Dover)
Forte S 1987 Nucl. Phys. B 288 252
Fraleigh J B 1976 A First Course in Abstract Algebra (Reading, MA: Addison-Wesley)
Freed D S and Uhlenbeck K 1984 Instantons and Four-Manifolds (New York: Springer)
Friedan D and Windey P 1984 Nucl. Phys. B 235 395
——1985 Physica D 15 71
Fr¨odlicher A 1955 Math. Ann. 129 50
Fujikawa K 1979 Phys. Rev. Lett. 42 1195
——1980 Phys. Rev. D 21 2848; Phys. Rev. D 22 1499(E)


## Page 581

——1986 in Superstrings, Supergravity and Uniﬁed Theoriesed G Furlanet al (Singapore:
World Scientiﬁc) p 230
Gilbert G 1986 Nucl. Phys. B 277 102
Gilkey P B 1995 Invariance Theory, the Heat Equation and the Atiyah–Singer Index
Theorem 2nd edn (Boca Raton, FL: Chemical Rubber Company)
Goldberg S I 1962 Curvature and Homology (New York: Academic)
Green M B, Schwarz J H and Witten E 1987Superstring Theories vols I and II (Cambridge:
Cambridge University Press)
Greenberg M J and Harper J R 1981 Algebraic Topology: A First Course (Reading, MA:
Benjamin/Cummings)
Greene R E 1987 Differential Geometry (Lecture Notes in Mathematics 1263) ed
V L Hansen (Berlin and Heidelberg: Springer) p 228
Grifﬁths P and Harris J 1978 Principles of Algebraic Geometry (New York: Wiley)
Gross D J and Jackiw R 1972 Phys. Rev. D 6 477
Gunning R C 1962Lectures on Modular Forms(Princeton, NJ: Princeton University Press)
Hawking S 1977 Commun. Math. Phys. 55 133
Hicks N 1965 Notes on Differential Geometry (Princeton, NJ: Van Nostrand)
Hirayama M 1983 Prog. Theor. Phys.70 1444
Hirzebruch F 1966 Topological Methods in Algebraic Geometry 3rd edn (Berlin and
Heidelberg: Springer)
Horowitz G 1986 Uniﬁed String Theories ed M Green and D Gross (Singapore: World
Scientiﬁc) p 635
Huang K 1982 Quarks, Leptons and Gauge Fields (Singapore: World Scientiﬁc)
Ito K (ed) 1987 Encyclopedic Dictionary of Mathematics 3rd edn (Cambridge, MA: MIT
Press)
Jackiw R and Rebbi C 1977 Phys. Rev. D 16 1052
Jackiw R and Templeton S 1981 Phys. Rev. D 23 2291
Kleinert H 1990 Path Integrals(Singapore: World Scientiﬁc)
Kobayashi S 1984 Introduction to the Theory of Connections (Yokohama: Department of
Mathematics, Keio University) (in Japanese)
Kobayashi S and Nomizu K 1963 Foundations of Differential Geometry vol I (New York:
Interscience)
——1969 Foundations of Differential Geometryvol II (New York: Interscience)
Koblitz N 1984 Introduction to Elliptic Curves and Modular Forms(New York: Springer)
Kulkarni R S 1975 Index Theorems of Atiyah–Bott–Patodi and Curvature Invariants
(Montr´eal: Les Presses de l’Universit´ed eM o n t r ´eal)
Lang S 1987 Elliptic Functions 2nd edn (New York: Springer)
Leggett A J 1975 Rev. Mod. Phys. 47 331
Leinaas J M and Olaussen K 1982 Phys. Lett. B 108 199
Lightman A P, Press W H, Price R H and Teukolsky S A 1975Problem Book in Relativity
and Gravitation (Princeton, NJ: Princeton University Press)
Longuet-Higgins H C 1975 Proc. R. Soc. A 344 147
Maki K and Tsuneto T 1977 J. Low-Temp. Phys. 27 635
Matsushima Y 1972 Differentiable Manifolds (New York: Dekker)
Mermin N D 1978 in Quantum Liquids ed J Ruvalds and T Regge (Amsterdam: North-
Holland) p 195
——1979 Rev. Mod. Phys. 51 591
Mermin N D and Ho T-L 1976 P h y s .R e v .L e t t .36 594


## Page 582

Milnor J 1956 Ann. Math. 64 394
Mickelsson J 1989 Current Algebras and Groups (New York: Plenum)
Milnor J W and Stasheff J D 1974 Characteristic Classes (Princeton, NJ: Princeton
University Press)
Minami S 1979 Prog. Theor. Phys.62 1128
Mineev V P 1980 Sov. Sci. Rev.A 2 173
Misner C W 1978 Phys. Rev. D 18 4510
Misner C W, Thorne K S and Wheeler J A 1973Gravitation (San Francisco, CA: Freeman)
Moore G 1986 Phys. Lett. B 176 369
Moore G and Nelson P 1986 Nucl. Phys. B 266 58
Morozov 1987 Sov. J. Nucl. Phys. 45 181
Nakahara M 1998 Path Integrals and Their Applications (Tokyo: Graduate School of
Mathematical Sciences, University of Tokyo)
Nambu Y 1970 Lectures at the Copenhagen Symposium unpublished
Nash C 1991 Differential Topology and Quantum Field Theory(London: Academic)
Nash C and Sen S 1983 Topology and Geometry for Physicists (London: Academic)
Newlander A and Nirenberg L 1957 Ann. Math. 65 391
Nomizu K 1981 Introduction to Modern Differential Geometry (Tokyo: Shokabo) (in
Japanese)
Palais R S 1965 Seminars on the Atiyah–Singer Index Theorem (Princeton, NJ: Princeton
University Press)
Polchinski J 1986 Commun. Math. Phys. 104 37
Polyakov A M 1981 Phys. Lett. B 103 207
Price R H 1982 A m .J .P h y s .50 300
Rabin J M 1995 Geometry and Quantum Field Theory ed D S Freed et al (Providence, RI:
American Mathematical Society) p 183
Ramond P 1989 Field Theory: A Modern Primer 2nd edn (Reading, MA:
Benjamin/Cummings)
Rennie R 1990 Adv. Phys. 39 617
Ryder L H 1980 J. Phys. A: Math. Gen. 13 437
——1996 Quantum Field Theory 2nd edn (Cambridge: Cambridge University Press)
Sakita B 1985 Quantum Theory of Many-Variable System and Fields (Singapore: World
Scientiﬁc)
S´anchez N 1988 Harmonic Mappings, Twistors, and a-Models ed P Gauduchon
(Singapore: World Scientiﬁc) p 270
Sattinger D H and Weaver O L 1986Lie Groups and Algebras with Applications to Physics,
Geometry, and Mechanics (New York: Springer)
Scherk J 1975 Rev. Mod. Phys. 47 123
Schutz B F 1980 Geometrical Methods of Mathematical Physics (Cambridge: Cambridge
University Press)
Schwartz L 1986 Lectures on Complex Analytic Manifolds (Berlin and Heidelberg:
Springer)
Shanahan P 1978 The Atiyah–Singer Index Theorem: An Introduction (Berlin and
Heidelberg: Springer)
Shankar R 1977 J. Physique 38 1405
Siegel C L 1980 Advanced Analytic Number Theory (Bombay: Tata Institute of
Fundamental Research)
Simon B 1983 Phys. Rev. Lett. 51 2167


## Page 583

Singer I M 1985 Soc. Math. de France, Ast´erisque hors s´erie 323
Steenrod N 1951 The Topology of Fibre Bundles (Princeton, NJ: Princeton University
Press)
Stora R 1984 in Progress in Gauge Field Theory ed G ’t Hooft et al (New York: Plenum)
p 543
Sumitani T 1984 J. Phys. A: Math. Gen. 17 L811
——1985 MSc Thesis Soryushiron-Kenkyu 71 65 (in Japanese)
Swanson M S 1992 Path Integrals and Quantum Processes(Boston, MA: Academic)
Tonomura A, Umezaki H, Matsuda T, Osakabe N, Endo J and Sugita Y 1983 Phys. Rev.
Lett. 51 331
Toulouse G and Kl´eman M 1976 J. Physique Lett. 37 L149
Trautman A 1977 Int. J. Theor. Phys. 16 561
Tsuneto T 1982 The Structure and Properties of Mattered T Matsubara (Berlin: Springer)
p 101
Wald R M 1984 General Relativity (Chicago, IL: The University of Chicago Press)
Warner F W 1983 Foundations of Differentiable Manifolds and Lie Groups (New York:
Springer)
Weinberg S 1972Gravitation and Cosmology: Principles and Applications of the General
Theory of Relativity (New York: Wiley)
——1988 Strings and Superstrings: Jerusalem Winter School for Theoretical Physics ed
S Weinberg (Singapore: World Scientiﬁc)
Wells R O 1980 Differential Analysis on Complex Manifolds (New York: Springer)
Wess J and Zumino B 1971 Phys. Lett. B 37 95
Whitehead G W 1978 Elements of Homotopy Theory (New York: Springer)
Wu T T and Yang C N 1975Phys. Rev. D 12 3845
Yang C N and Mills R L 1954 Phys. Rev. 96 191
Utiyama R 1956 Phys. Rev. 101 1597
Yau S-T 1977 Proc. Natl Acad. Sci., USA 74 1798
Zumino B 1985 Relativity, Groups and Topology II vol 3, ed B S DeWitt and R Stora
(Amsterdam: North-Holland) p 1291
——1987 Geometry and physics Berkeley Preprint UCB/pTH-87/13
Zumino B, Wu Y-S and Zee A 1984Nucl. Phys. B 239 477
