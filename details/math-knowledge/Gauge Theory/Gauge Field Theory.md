# Gauge Field Theory

Source title: UNIVERSITY OF CAMBRIDGE PART III N ATURAL SCIENCES TRIPOS

Converted from: `27.pdf`


## Page 1

UNIVERSITY OF CAMBRIDGE PART III N ATURAL SCIENCES TRIPOS
Gauge Field Theory
Dr. Ben Gripaios
Cavendish Laboratory,
JJ Thomson Avenue,
Cambridge, CB3 0HE, United Kingdom.
January 4, 2016
E-mail: gripaios@hep.phy.cam.ac.uk


## Page 2

Contents
1 Avant propos 1
2 Bedtime Reading 2
3 Notation and conventions 3
4 Relativistic quantum mechanics 5
4.1 Why QM does and doesn’t work 5
4.2 The Klein-Gordon equation 7
4.3 The Dirac equation 7
4.4 Maxwell’s equations 10
4.5 Transition rates and scattering 12
5 Relativistic quantum ﬁelds 14
5.1 Classical ﬁeld theory 14
5.2 Scalar ﬁeld quantization 17
5.3 Multiple scalar ﬁelds 20
5.4 Spin-half quantization 23
5.5 Gauge ﬁeld quantization 26
5.6 How to go back again 27
5.7 Interactions 29
5.8 e+e− pair production 32
5.9 Compton scattering 33
6 Gauge ﬁeld theories 35
6.1 Quantum electrodynamics 36
6.2 Janet and John do group theory 37
6.3 Non-Abelian gauge theory 41
6.4 The strong nuclear force: quantum chromodynamics 43
6.5 The weak nuclear force and SU (2)× U(1) 45
6.6 Intermezzo: Parity violation and all that 47
6.7 Back to the weak interactions 49
6.8 Intermezzo: Spontaneous symmetry breaking 51
6.9 Back to the electroweak interaction 53
6.10 Fermion Masses 55
6.11 Three Generations 55
6.12 The Standard Model and the Higgs boson 55
7 Renormalization 58
7.1 Ultraviolet divergences in quantum ﬁeld theory 59
7.2 Non-renormalizable interactions and eﬀective theories: the modern view 61
– i –


## Page 3

8 Beyond the Standard Model 62
8.1 Neutrino masses 62
8.2 The gauge hierarchy problem 64
8.3 Grand uniﬁcation 65
9 Afterword 68
Acknowledgments
I thank Richard Batley and Bryan Webber, who gave previous versions of these lectures and
were kind enough to supply me with their notes. No doubt I have managed to introduce a
number of errors of my own and would be very grateful to have them pointed out to me –
please contact me by e-mail at the address on the front page.
1 Avant propos
A sexier title for these lectures would be ‘Current theory of everything’, but other lecturers
wouldn’t allow it. They are intended to take you from something that you (hopefully)
know very well – the Schrödinger equation of non-relativistic quantum mechanics – to the
current state-of-the-art in our understanding of the fundamental particles of Nature and
their interactions. That state-of-the-art is described by a gauge ﬁeld theory (hence the
dumbed-down title of these lectures) called the “Standard Model” of particle physics, of
which the Higgs boson, recently discovered at the CERN LHC, is a key part. All other
physics (except gravity) and indeed every phenomenon in the Universe, from consciousness
to chemistry, is but a convoluted application of it. Going further, it turns out that (despite
what you may have read in the newspapers) even quantum gravity (in its general relativistic
incarnation)makesperfectsenseasagaugeﬁeldtheory, providedwedon’taskwhathappens
at energy scales beyond the Planck scale of1019 GeV. So rather a lot is known. As the
late Sidney Coleman (who is right up there in the list of physicists too smart to have won
a Nobel prize) put it at the beginning ofhis lecture course, “Not only God knows, but I
know, and by the end of this semester, you will know too.”
Agaugeﬁeldtheoryisaspecialtypeofquantumﬁeldtheory, inwhichmatterﬁelds(like
electrons and quarks, which make up protons and neutrons) interact with each other via
forces that are mediated by the exchange of vector bosons (like photons and gluons, which
bind quarks together in nucleons). The Standard Model provides a consistent theoretical
description of all of the known forces except gravity. Perhaps more pertinently, it has been
spectacularly successful in describing essentially all experiments performed so far, including
the most precise measurements in the history of science. The recent discovery of the Higgs
boson, at CERN’s Large Hadron Collider, constitutes the ﬁnal piece in the jigsaw of its
experimental veriﬁcation.
– 1 –


## Page 4

As well as learning about of all of this, we hope to resolve, along the way, a number
of issues that must have appeared mysterious to you in your previous studies. We shall
see why a relativistic generalization of the Schrödinger equation is not possible and hence
why you have been stuck with the non-relativistic version until now, even though you
have known all about relativity for years. We shall learnwhy electrons have spin half,why
their gyromagnetic ratio is (about) two, andwhy identical electrons cannot occupy the same
quantum state. More to the point, we shall see how it is even conceivable that two electrons
can be exactly identical. We shall seewhy it is not possible to write down a Schrödinger
equation for the photon and hence why your lecturers, up until now, have taken great
pains to avoid discussing electromagnetism and quantum mechanics at the same time. We
shall understandwhy it is possible that three forces of nature (the strong and weak nuclear
forces, together with electromagnetism) which appear to be so diﬀerent in their nature,
have essentially the same underlying theoretical structure. We shall learn what rôle the
Higgs boson plays in the theory andwhy it was expected to appear at the LHC. Finally,
we shall learn about tantalizing hints that we need a theory that goes beyond the Standard
Model – gravity, neutrino masses, grand uniﬁcation, and the hierarchy problem.
That is the good news. The bad news is that all this is rather a lot to learn in only
twelve lectures, given that I assume only that the reader has a working knowledge of non-
relativistic quantum mechanics, special relativity, and Maxwell’s equations.1 Our coverage
of the material will be scandalously brief. Many important derivations and details will be
left out. It goes without saying that any student who wants more than just a glimpse of
this subject will need to devote rather more time to its proper study. For that, the books
recommended below are as good as any place to begin.
2 Bedtime Reading
• Quantum Field Theory, Mandl F and Shaw G (2nd edn Wiley 2009) [1].
This short book makes for a good companion to this course, covering most of the
material using the same (canonical quantization) approach.
• Quantum Field Theory in a Nutshell, Zee A (2nd edn Princeton University Press
2010) [2].
This is a wonderful book, full of charming insights and doing (in not so many pages)
a great job of conveying the ubiquity of quantum ﬁeld theory in modern particle and
condensed matter physics research. Written mostly using the path integral aproach,
but don’t let that put you oﬀ.
• An Introduction to Quantum Field Theory, Peskin M E and Schroeder D V (Addison-
Wesley 1995) [3].
1For those in Cambridge, there are no formal prerequisites, though it surely can do no harm to have
taken the Part III ‘Particle Physics’ or ‘Quantum Field Theory’ Major Options.
– 2 –


## Page 5

The title claims it is an introduction, but don’t be misled – this book will take you
a lot further than that. Suﬃce to say, this is where most budding particle theorists
learn ﬁeld theory these days.
• Gauge Theories in Particle Physics, Aitchison I J R and Hey A J G (4th edn 2 vols
IoP 2012) [4, 5].
These two volumes are designed for experimental particle physicists and oﬀer a gentler
(if longer) introduction to the ideas of gauge theory. The canonical quantization
approach is followed and both volumes are needed to cover this course.
• An Invitation to Quantum Field Theory, Alvarez-Gaume L and Vazquez-Mozo M A
(Springer Lecture Notes in Physics vol 839 2011)[6].
At a similar level to these notes, but discusses other interesting aspects not covered
here. An earlier version can be found at [7].
The necessary group theory aspects of the course are covered in the above books, but
to learn it properly I would read
• Lie Algebras in Particle Physics, Georgi H (2nd edn Frontiers in Physics vol 54 1999)
[8].
3 Notation and conventions
To make the formulæ as streamlined as possible, we use a system of units in which there is
only one dimensionful quantity (so that we may still do dimensional analysis) – energy –
and in whichℏ = c = 1. 2 Thus E = mc2 becomes E = m, and so on.
For relativity, we setx0 = t, x1 = x, x2 = y, x3 = z and denote the components of the
position 4-vector byxµ, with a Greek index. The components of spatial 3-vectors will be
denoted by Latin indices,e.g. xi = (x, y, z). We deﬁne Lorentz transformations as those
transformations which leave the metricηµν = diag(1,−1,−1,−1) invariant (they are said
to form the groupSO(3, 1)). Thus, under a Lorentz transformation,xµ→ x′µ = Λµ
νxν, we
must have thatηµν→ Λµ
σΛν
ρησρ = ηµν. The reader may check, for example, that a boost
along the x axis, given by
Λµ
ν =


γ −βγ 0 0
−βγ γ 0 0
0 0 1 0
0 0 0 1

 , (3.1)
with γ2 = (1− β2)−1, has just this property.
Any set of four components transforming in the same way asxµ is called acontravari-
ant 4-vector. The derivative ( ∂
∂t , ∂
∂x , ∂
∂y , ∂
∂z ) (which we denote by ∂µ), transforms as the
(matrix) inverse of xµ. Thus we deﬁne, ∂µ → ∂′
µ = Λ ν
µ ∂ν, with Λ ν
µ Λµ
ρ = δν
ρ, where
δ = diag(1 , 1, 1, 1). Any set of four components transforming in the same way as∂µ is
2Unfortunately I have not been able to ﬁnd a consistent set of units in which2π = 1!
– 3 –


## Page 6

called a covariant 4-vector. We now make the rule that indices may be raised or lowered
using the metric tensor ηµν or its inverse, which we write asηµν = diag(1 ,−1,−1,−1).
Thus, xµ = ηµνxν = (t,−x,−y,−z). With this rule, any expression in which all indices are
contracted pairwise with one index of each pair upstairs and one downstairs is manifestly
Lorentz invariant. For example,3 xµxµ = t2− x2− y2− z2→ x′
µx′µ = xµxµ.
When we come to spinors, we shall need thegamma matrices, γµ, which are a set of
four, 4 x 4 matrices satisfying the Cliﬀord algebra{γµ, γν}≡ γµγν+γνγµ = 2ηµν·1, where1
denotesa 4x4 unitmatrix. Inthese lecture notes, weshalluse two diﬀerentrepresentations,
both of which are common in the literature. The ﬁrst is thechiral representation, given by
γµ =
(
0 σµ
σµ 0
)
, (3.2)
where σµ = (1, σi), σµ = (1,−σi), and σi are the usual 2 x 2 Pauli matrices:
σ1 =
(
0 1
1 0
)
, σ2 =
(
0−i
i 0
)
, σ3 =
(
1 0
0−1
)
. (3.3)
For this representation,
γ5≡ iγ0γ1γ2γ3 =
(
−1 0
0 1
)
. (3.4)
The other representation for gamma matrices is thePauli-Dirac representation, in which
we replace
γ0 =
(
1 0
0−1
)
(3.5)
and hence
γ5 =
(
0 1
1 0
)
. (3.6)
We shall often employ Feynman’sslash notation, where, e.g., /a≡ aµγµ and we shall
often write an identity matrix as 1, or indeed omit it altogether. Its presence should always
be clear from the context.4
Finally, it is to be greatly regretted that the electron was discovered before the positron
and hence theparticle has negative charge. We therefore sete < 0.
3We employ the usual Einstein summation convention,xµxµ≡ ∑3
µ=0 xµxµ.
4All this cryptic notation may seem obtuse to you now, but most people grow to love it. If you don’t,
sue me.
– 4 –


## Page 7

4 Relativistic quantum mechanics
4.1 Why QM does and doesn’t work
I promised, dear reader, that I would begin with the Schrödinger equation of non-relativistic
quantum mechanics. Here it is:
i ∂ψ
∂t =− 1
2m∇2ψ + V ψ. (4.1)
For free particles, withV (x) = 0 , the equation admits plane wave solutions of the form
ψ ∝ ei(p·x−Et), provided that E = p2
2m, corresponding to the usual Energy-momentum
dispersion relation for free, non-relativistic particles.
No doubt all of this, together with the usual stuﬀ about|ψ(x)|2 being interpreted
as the probability to ﬁnd a particle at x, is old hat to you. By now, you have solved
countless complicated problems in quantum mechanics with spinning electrons orbiting
protons, bouncing oﬀ potential steps, being perturbed by hyperﬁne interactions, and so on.
But at the risk of boring you, and before we leap into the weird and wonderful world of
relativistic quantum mechanics and quantum ﬁeld theory, I would like to spend a little time
dwelling on what quantum mechanics really is.
The reason I do so is because the teaching of quantum mechanics these days usually
follows the same dogma: ﬁrstly, the student is told about the failure of classical physics at
the beginning of the last century; secondly, the heroic confusions of the founding fathers
are described and the student is given to understand that no humble undergraduate stu-
dent could hope to actuallyunderstand quantum mechanics for himself; thirdly, adeus ex
machina arrives in the form of a set of postulates (the Schrödinger equation, the collapse
of the wavefunction,etc); fourthly, a bombardment of experimental veriﬁcations is given,
so that the student cannot doubt that QM is correct; ﬁfthly, the student learns how to
solve the problems that will appear on the exam paper, hopefully with as little thought as
possible.
The problem with this approach is that it does not leave much opportunity to wonder
exactly in what regimes quantum mechanics does and does not work, or indeed why it has
a chance of working at all. This, unfortunately, risks leaving the student high and dry when
it turns out that QM (in its non-relativistic, undergraduate incarnation) is not a panacea
and that it too needs to be superseded.
To give an example, every student knows that
∫
dx|ψ(x, t)|2 gives the total probability
to ﬁnd the particle and that this should be normalized to one. Buta priori, this integral
could be a function oft, in which case either the total probability to ﬁnd the particle would
change with time (when it should be ﬁxed at unity) or (if we let the normalization constant
be time-dependent) the normalized wavefunction would no longer satisfy the Schrödinger
equation. Neither of these is palatable. What every student does not know, perhaps, is that
this calamity is automatically avoided in the following way. It turns out that the current
jµ = (ρ, j) = (ψ∗ψ,− i
2m(ψ∗∇ψ− ψ∇ψ∗)) (4.2)
– 5 –


## Page 8

isconserved, satisfying ∂µjµ = 0. (Fornow, youcanshowthisdirectlyusingtheSchrödinger
equation, but soon we shall see how such conserved currents can be identiﬁed just by looking
at the Lagrangian; in this case, the current conservation follows because a phase rotated
wavenfunction ψ′ = eiαψ also satisﬁes the Schrödinger equation.) Whyconserved? Well,
integrating ∂µjµ = 0 we get that the rate of change of the time component of the current
in a given volume is equal to (minus) the ﬂux of the spatial component of the current out
of that volume:
d
dt
∫
ρdV =−
∫
∂V
j· dS. (4.3)
In particular, ψ∗ψ integrated over all space, is constant in time. This is a notion which
is probably familiar to you from classical mechanics and electromagnetism. It says that
ψ∗ψ, which we interpret as the probability density in QM, is conserved, meaning that the
probability interpretation is a consistent one.
This conservation of the total probability to ﬁnd a particle in QM is both its salvation
and its downfall. Not only does it tell us that QM is consistent in the sense above, but it
also tells that QM cannot hope to describe a theory in which the number of particles present
changes with time. This is easy to see: if a particle disappears, then the total probability
to ﬁnd it beforehand should be unity and the total probability to ﬁnd it afterwards should
be zero. Note that in QM we are not forced to consider states with a single particle (like a
single electron in the Coulomb potential of a hydrogen atom), but we are forced to consider
states in which the number of particles is ﬁxed for all time. Another way to see this is that
the wavefunction for a many-particle state is given byψ(x1, x2, . . .), where x1, x2, . . . are
the positions of the diﬀerent particles. But there is no conceivable way for this wavefunction
to describe a process in which a particle atx1 disappears and a diﬀerent particle appears
at some otherx3.
Unfortunately, it happens to be the case in Nature that particles do appear and dis-
appear. An obvious example is one that (amusingly enough) is usually introduced at the
beginning of a QM course, namely the photoelectric eﬀect, in which photons are annihilated
at a surface. It is important to note that it is not the relativistic nature of the photons
which prevents their description using QM, it is the fact that their number is not conserved.
Indeed, phonons arise in condensed matter physics as the quanta of lattice vibrations. They
are non-relativistic, but they cannot be described using QM either.
Ultimately, this is the reason why our attempts to construct a relativistic version of
QM will fail: in the relativistic regime, there is suﬃcient energy to create new particles
and such processes cannot be described by QM. This particle creation is perhaps not such
a surprise. You already know that in relativity, a particle receives a contribution to its
energy from its mass viaE = mc2. This suggests (but certainly does not prove) that if
there is enoughE, then we may be able to create new sources ofm, in the form of particles.
It turns out that this does indeed happen and indeed much of current research in particle
physics is based on it: by building colliders (such as the Large Hadron Collider) producing
ever-higher energies, we are able to create new particles, previously unknown to science and
to study their properties.
– 6 –


## Page 9

Even though our imminent attempt to build a relativistic version of QM will eventually
fail, it will turn out to be enormously useful in ﬁnding a theory that does work. That theory
is called Quantum Field Theory and it will be the subject of the next section. For now, we
will press ahead with relativistic QM.
4.2 The Klein-Gordon equation
To write down a relativistic version of the Schrödinger equation is easy - so easy, in fact,
that Schrödinger himself wrote it downbeforehe wrote down the equation that made him
famous. Starting from the expectation that the free theory should have plane wave solutions
(just as in the non-relativistic case), of the formφ∝ e−iEt+ip·x = e−ipµxµ
and noting that
the relativistic dispersion relation pµpµ = m2 should be reproduced, we infer theKlein-
Gordon equation
(∂µ∂µ + m2)φ = 0. (4.4)
If we assume thatφ is a single complex number, then it must be a Lorentz scalar, being
invariant under a Lorentz transformation:φ(xµ)→ φ′(x′µ). The Klein-Gordon equation is
then manifestly invariant under Lorentz transformations. The problems with this equation
quickly become apparent. Firstly, the probability density cannot be|φ|2 as it is in the
non-relativistic case, because|φ|2 transforms as a Lorentz scalar (i.e. it is invariant), rather
than as the time component of a 4-vector (the probability density transforms like the inverse
of a volume, which is Lorentz contracted). Moreover,|φ|2 is not conserved in time. To ﬁnd
the correct probability density, we must ﬁnd a conserved quantity. Again, we shall soon
have the tools in hand to do so ourselves, but for now we pull another rabbit out of the
hat, claiming that the 4-current
jµ = i(φ∗∂µφ− φ∂µφ∗) (4.5)
satisﬁes ∂µjµ = 0 (exercise), meaning that its time component integrated over space,∫
dxi(φ∗ ∂
∂t φ− φ ∂
∂t φ∗) is a conserved quantity. So far so good, but note that
∫
dxi(φ∗ ∂
∂t φ−
φ ∂
∂t φ∗) is not necessarily positive. Indeed, for plane waves of the formφ = Ae∓ipµxµ
, we
obtain ρ =±2E|A|2. There is a related problem, which is that the solutionsφ = Ae±ipµxµ
,
correspond to both positive and negative energy solutions of the relativistic dispersion rela-
tion: E =±
√
p2 + m2. Negative energy states are problematic, because there is nothing to
stop the vacuum decaying into these states. In classical relativistic mechanics, the problem
of these negative energy solutions never reared its ugly head, because we could simply throw
them away, declaring that all particles (or rockets or whatever) have positive energy. But
when we solve a wave equation (as we do in QM), completeness requires us to include both
positive and negative energy solutions in order to be able to ﬁnd a general solution.
4.3 The Dirac equation
In 1928, Dirac tried to solve the problem of negative-energy solutions by looking for a wave
equation that was ﬁrst order in time-derivatives, the hope being that one could then obtain
– 7 –


## Page 10

a dispersion relation of the formE = +
√
p2 + m2 directly, without encountering negative-
energy states. Dirac realised that one could write an equation that was linear in both time
and space derivatives of the form
(iγν∂ν− m)ψ = 0 (4.6)
that implied the Klein-Gordon equation forψ, provided that the 4 constantsγν were ma-
trices. To wit, acting on the left with(iγµ∂µ + m), we obtain
(−γµγν∂µ∂ν− m2)ψ = 0. (4.7)
Since ∂µ∂ν = ∂ν∂µ, we may symmetrize to get
(−1
2{γµ, γν}∂µ∂ν− m2)ψ = 0. (4.8)
Thus, (minus) the Klein-Gordon equation is recovered if the anticommutator is such that
{γµ, γν} = 2ηµν. (4.9)
The γν evidently cannot be simply numbers, since, for example,γ0γ1 =−γ1γ0. In fact, the
smallest possible matrices that implement this relation are 4x4, as you may show by trial
and error. Any set of matrices satisfying the algebra will do, but some are more convenient
than others, depending on the problem at hand. We will either use thechiral representation
γµ =
(
0 σµ
σµ 0
)
, (4.10)
where σµ = (1, σi), σµ = (1,−σi), and σi are the usual 2 x 2 Pauli matrices:
σ1 =
(
0 1
1 0
)
, σ2 =
(
0−i
i 0
)
, σ3 =
(
1 0
0−1
)
(4.11)
or we will use thePauli-Dirac representation in which we replace
γ0 =
(
1 0
0−1
)
. (4.12)
Note that γ0 is Hermitian in either representation, whereas γi are anti-Hermitian.
This can be conveniently written as(γµ)† = γ0γµγ0, but note that this equation (and the
hermiticity properties) are not basis-independent. Since the γν are 4 x 4 matrices, the
wavefunction ψ must have 4 components. It is not a 4-vector (and nor are theγν, despite
the suggestive notation, since they are constants and do not transform). It transforms in a
special way under Lorentz transformations (which we don’t have time to go through here,
sadly) and we call it a 4-componentspinor. It is easy enough to show that Dirac’s equation
has a conserved current given by (one ﬁnal rabbit, I promise)
jµ = (ψ†ψ, ψ†γ0γiψ), (4.13)
– 8 –


## Page 11

where ψ† is the Hermitian conjugate (transpose conjugate) ofψ. Note that the probability
density, ψ†ψ is now positive deﬁnite, so Dirac managed to solve one problem. But what
about the negative energy solutions? In the rest frame, with (E, p) = ( m, 0), we ﬁnd
solutions to (4.6) of the formA∓e∓imt, provided that
(±γ0− 1)A∓ = 0 =⇒ A−∝


A1
A2
0
0

 , A+∝


0
0
A3
A4

 , (4.14)
where we used the Pauli-Dirac basis. So there are four modes, two of which have positive
energy and two of which have negative energy. The two positive energy modes are inter-
preted (as we shall soon see) as the two diﬀerent spin states of a spin-half particle. Dirac’s
proposal to deal with the negative energy states was as follows. Since the Pauli exclusion
principal for these spin-half fermions forbids multiple occupation of states, one can postu-
late that the vacuum corresponds to a state in which all of the negative energy states are
ﬁlled. Then, Dirac argued, if one has enough energy, one might be able to promote one of
these negative-energy particles to a positive-energy particle. One would be left with a ’hole’
in the sea of negative energy states, which would behave just like a particle with opposite
charge to the original particles. Thus Dirac came up with the concept of antiparticles. The
antiparticle of the electron, the positron, was duly found, bringing great acclaim to Dirac.
But this picture of theDirac seawas soon rendered obsolete by the emergence of quantum
ﬁeld theory.
Itisnotmuchhardertoﬁndtheplane-wavesolutionsoftheDiracequationinanyframe,
so we do it for completeness. For the positive-energy solutions of (4.6), writeψ = ue−ip·x,
such that(/p− m)u = 0. Writing u =
(
φ
χ
)
implies
u = N
(
φ
σ·p
E+m φ
)
. (4.15)
Finally, taking the two states to beφ1 =
(
1
0
)
and φ2 =
(
0
1
)
, we obtain
u1 = N


1
0
pz
E+mpx+ipy
E+m

 , u 2 = N


0
1
px−ipy
E+m−pz
E+m

 . (4.16)
For the negative-energy solutions, writeψ = ve+ip·x, such that(/p + m)v = 0. Thus,
v = N
(
σ·p
E+m χ
χ
)
, (4.17)
– 9 –


## Page 12

such that
v1 = N


px−ipy
E+m−pz
E+m
0
1

 , v 2 = N


pz
E+mpx+ipy
E+m
1
0

 . (4.18)
We ﬁnd it most convenient to normalize in such a way that that there is a number density
ρ = ψ†ψ = u†u = v†v of 2E particles per unit volume. This ﬁxesN =
√
E + m.
We end our treatment of the Dirac equation by showing that it does indeed describe a
spin-half particle. To do so, we show that there exists an operatorS, such thatJ≡ L + S
is a constant of the motion withS2 = s(s + 1) = 3
4. First note that the orbital angular
momentum L does not commute with the Hamiltonian, deﬁned,à la Schrödinger, to be
everything that appears on the right of the Dirac equation wheni ∂ψ
∂t appears on the left.
Thus,
H = γ0(γipi + m). (4.19)
Then, for example
[L3, H] = [x1p2− x2p1, H] = [x1, H]p2− [x2, H]p1 = iγ0(γ1p2− γ2p1)̸= 0. (4.20)
The operator S that ensures [H, J i] = 0 is given by S≡ Σ
2, where Σi≡
(
σi 0
0 σi
)
. As a
check (in the chiral basis),
[S3, H] = [1
2
(
σ3 0
0 σ3
)
,
(
−σipi m
m σ ipi
)
] =−iγ0(γ1p2− γ2p1) =−[L3, H]. (4.21)
Moreover, S2 = 1
4 σiσi = 3
4, as required.
4.4 Maxwell’s equations
This is a convenient juncture at which to introduce Maxwell’s equations of electromag-
netism, even though we make no eﬀort to make a quantum mechanical theory out of them
(since the number of photons is not ﬁxed, it is doomed to fail). We shall need them for our
later study of QFT, however.
In some system of units, Maxwell’s equations may be written as
∇· E = ρ,∇× E + ˙B = 0 (4.22)
∇· B = 0,∇× B = j + ˙E. (4.23)
In terms of the scalar and vector potentialsV and A we may solve the two homogeneous
equations by writing
E =−∇V− ˙A, (4.24)
B =∇× A. (4.25)
– 10 –


## Page 13

All of this is more conveniently (and covariantly) written in terms of the 4-vector potential,
Aµ≡ (V, A), the 4-current,jµ≡ (ρ, j) and the antisymmetricﬁeld strength tensor, Fµν≡
∂µAν− ∂νAµ; indeed, Maxwell’s equations then reduce to the rather more compact form
∂µF µν = jν. (4.26)
This rendering makes it obvious that Maxwell’s equations are invariant (as areE and B
themselves) under the gauge transformation Aµ → Aµ + ∂µχ, where χ is an arbitrary
function on spacetime. This ‘gauge’ is the same ‘gauge’ that appears in the title of these
lectures, so it behoves you to play close attention whenever you see the word from now on!
One way we can deal with the gauge freedom is to remove it (wholly or partially) by
gauge ﬁxing. One common choice is the Lorenz (not Lorentz!) gauge∂µAµ = 0. In this
gauge, each of the four components of the vectorAµ satisﬁes the Klein-Gordon equation
with m = 0, corresponding to a massless photon. We can ﬁnd plane wave solutions of the
form Aµ = ϵµe−ip·x, with p2 = 0. Since we have ﬁxed the gauge∂µAµ = 0, we must have
that ϵ· p = 0. Moreover, the residual gauge invariance implies that shifting the polarization
vector ϵµ by an amount proportional topµ gives an equivalent polarization vector. Thus,
there are only two physical degrees of polarization. These could, for example, be taken to
be purely transverse to the photon 3-momentum.5
Finally, we discuss how to couple the electromagnetic ﬁeld to Klein-Gordon or Dirac
particles. The usual argument given in classical mechanics and non-relativistic QM is that
one should use the rules of minimal subtraction, replacing∂µ→ Dµ≡ ∂µ + ieAµ.6 Thus,
the Klein-Gordon equation becomes
(∂µ + ieAµ)(∂µ + ieAµ)φ + m2φ = 0. (4.27)
It is interesting to note that, if we take a negative energy solutionφ∝ e+i(Et+p·x) with
charge +e, the complex conjugate ﬁeldφ∗∝ e−i(Et+p·x) (which satisﬁes the complex con-
jugate of the Klein-Gordon equation) can be interpreted as a positive energy solution with
opposite momentum and opposite charge−e. This presages the interpretation of the neg-
ative energy solutions in terms of antiparticles in quantum ﬁeld theory.
For the Dirac equation, the coupling to electromagnetism is even more interesting.
Blithely making the minimal substitution, we get
(iγµ(∂µ + ieAµ)− m)ψ = 0. (4.28)
Now, if we act on the left with(iγµ(∂µ + ieAµ) + m) we do not obtain the Klein-Gordon
equation (4.27). Instead, we ﬁnd the equation (exercise – hint: use2γµγν≡{ γµ, γν} +
5The fact that there are two polarizations does not mean that the photon has spin one-half! In fact,
spin – which could be described as the total angular momentum of a particle in its rest frame – is not a
well-deﬁned concept for massless particles, which do not have a rest frame. Massless particles can instead
be described by theirhelicity, which is deﬁned as the angular momentum parallel to the direction of motion.
It can take just two values (±1 for the photon), leading to the two polarizations just found.
6Thisiscompletelyunmotivated. Weshall, veryshortly, havethemeansathandtoprovideasatisfactory
discussion of how thingsshould be done, but for now we beg the reader’s leniency.
– 11 –


## Page 14

[γµ, γν])
(D2 + m2 + ie
2 [γµ, γν]Fµν) = 0, (4.29)
with the extra term ie
2 [γµ, γν]Fµν. Now, in the Pauli-Dirac basis, i
2[γi, γj] is given by
iϵijkΣk where, as we saw before,Σk
2 represents the spinSk. Thus, in a magnetic ﬁeld, with
Fij = ϵijk Bk, we get the extra term2eS· B. This factor of 2 is crucial – if one works out
the D2 term (which is present even for a spinless particle), one will also ﬁnd an interaction
between the orbital angular momentumL and B given by eL· B. Thus, Dirac’s theory
predicted that the electron spin would produce a magnetic moment a factor of two larger
that the magnetic moment due to orbital magnetic moment, as was observed in experiment.
Infact, increasingexperimentalprecisioneventuallyshowedthatthegyromagneticratio
of the electron is not quite two, but rather2.0023193 . . .. In yet another heroic triumph for
theoretical physics, Schwinger showed in 1948 that this tiny discrepancy could be perfectly
accounted for by quantum ﬁeld theory, to which we shortly turn.
4.5 Transition rates and scattering
Before we go further, we need to modify one more aspect of your quantum mechanics
education. QM has its hegemony in atomic physics, where one is interested in energy
spectra and so on. In particle physics, we are less interested in energy spectra. One reason
is that (as we shall see) we are not able to compute them. A more pragmatic reason is that
many of the particles in particle physics are very short-lived; we learn things about them by
doing scattering experiments, in which we collide stable particles (electrons or protons) to
form new particles, and then observe those new particles decay. The quantities of interest
(that we would like to compute using quantum ﬁeld theory) are therefore things likedecay
rates and cross sections. What a decay rate is should be obvious to you. A cross-section is
only a bit more complicated. Clearly, the probability for two beams of particles to scatter
depends on things like the area of the beams and their densities. The cross-section is a
derived quantity which depends only on the nature of the particles making up the beams
(and their four-momenta).
To derive formulæ for these, we start with something you should know from QM.
Fermi’s Golden ruledecrees thatthe transition rate from stateito statef via a Hamiltonian
perturbation H′ is given by
Γ = 2π|Tf i|2δ(Ei− Ef), (4.30)
where
Tf i =⟨f|H′|i⟩ + Σn̸=i
⟨f|H′|n⟩⟨n|H′|i⟩
En− Ei
+ . . . (4.31)
Let’s now try to apply this formula to the decay of a particle inton lighter particles,
a→ 1 + 2 +··· + n. There aren− 1 independent 3-momenta in the ﬁnal state (momentum
must be conserved overall in the decay). Now, for states normalized such that there is one
particle per unit volume in position space, then we have one particle perh3 = (2π)3 volume
– 12 –


## Page 15

in momentum space (recall the de Broglie relationp = h
λ and recall that ℏ = 1 in our
system of units). Thus, the decay rate to produce particles in the ﬁnal state with momenta
between p and p + dp is
Γ = 2π
∫ d3p1
(2π)3 . . . d3pn−1
(2π)3 |Tf i|2δ(Ea− E1− E2···− En), (4.32)
= (2π)4
∫ d3p1
(2π)3 . . . d3pn
(2π)3|Tf i|2δ3(pa− p1− p2···− pn)δ(Ea− E1− E2···− En),
(4.33)
where in the last line we have written things more covariantly.
There is one complication, which is that we willnot normalize states to one particle per
unit volume. Instead (as we just did for solutions of the Dirac equation), we will normalize
to 2E particles per unit volume. TheE is convenient because the density transforms under
a Lorentz transformation like an energy does (the volume is Lorentz contracted). The2
just makes some formulæ more streamlined. To compensate for this, we divide by 2E
everywhere in the above formula, deﬁning|Tf i|2 = |M|2
2Ea2E1...2En. Finally, we get
Γ = (2π)4
2Ea
∫ d3p1
(2π)32E1
. . . d3pn
(2π)32En
|M|2δ4(pµ
a− pµ
1− pµ
2···− pµ
n). (4.34)
For two-particle scattering,a + b→ 1 + 2 +··· + n, the transition rate is, analogously,
(2π)4
2Ea2Eb
∫ d3p1
(2π)32E1
. . . d3pn
(2π)32En
|M|2δ4(pµ
a + pµ
b− pµ
1− pµ
2···− pµ
n). (4.35)
To get the cross-section formula with these conventions, we just divide by the ﬂux ofa
particles on b in a given frame, which is|va− vb|. In all,
σ = (2π)4
2Ea2Eb|va− vb|
∫ d3p1
(2π)32E1
. . . d3pn
(2π)32En
|M|2δ4(pµ
a + pµ
b− pµ
1− pµ
2···− pµ
n).
(4.36)
It is useful to derive expressions from these general formulæ for two-body ﬁnal states.
For the two-body decay in the rest frame ofa, we ﬁnd (exercise)
Γ(a→ 1 + 2) = |p1|
32π2m2a
∫
|M|2 sin θdθdφ, (4.37)
where particle 1 has 3-momentum(|p1| sin θ cos φ,|p1| sin θ sin φ,|p1| cos θ). For two-body
scattering in the CM frame, we similarly ﬁnd
σ(a + b→ 1 + 2) = |p1|
64π2|pa|s
∫
|M|2 sin θdθdφ. (4.38)
Here we have introduced the ﬁrst of threeMandelstam variables
s≡ (pµ
a + pµ
b )2, (4.39)
t≡ (pµ
1− pµ
a)2, (4.40)
u≡ (pµ
a− pµ
2)2. (4.41)
Note that these three variables are dependent, satisfying (exercise)
s + t + u = m2
a + m2
b + m2
1 + m2
2. (4.42)
– 13 –


## Page 16

5 Relativistic quantum ﬁelds
5.1 Classical ﬁeld theory
Before we consider quantum ﬁeld theory, it is useful to begin with a primer on classical ﬁeld
theory. Happily (though you may not know it) you are already experts on classical ﬁeld
theory. Indeed, most undergraduate physics is based on the solution of wave equations,
etc., and that is all classical ﬁeld theory is. However, you may not be so expert on the
Hamiltonian and Lagrangian formulations of classical ﬁeld theory; just like in QM, it is
these formulations which are most useful in going from the classical to the quantum regime.
Let us begin with the Lagrangian formulation. Imagine we have a ﬁeld on spacetime,
which we denote generically byφ(xµ). Just like in classical mechanics, the action,S, is
obtained by integrating the Lagrangian, L, over time. Now, we shall restrict ourselves
to theories in which the Lagrangian can be obtained by integrating something called the
Lagrangian density,L over space.7 Thus
S =
∫
dtL =
∫
d4xµL(φ(x), ∂µφ(x)). (5.1)
From now on, we will almost always deal with the Lagrangian density only and will often
simply call it the Lagrangian.
Given the Lagrangian, the classical (Euler-Lagrange) equations of motion are obtained
by extremizing the action. Thus, consider the variationδS that results from a ﬁeld variation
δφ:
δS =
∫
d4x
(δL
δφ δφ + δL
δ∂ µφ δ∂ µφ
)
(5.2)
=
∫
d4x
(δL
δφ− ∂µ δL
δ∂ µφ
)
δφ, (5.3)
where we have integrated by parts. The action is thus extremal when
δL
δφ− ∂µ δL
δ∂ µφ = 0. (5.4)
As an example, the Klein-Gordon Lagrangian is the most general Lorentz-invariant with
two or fewer derivatives and is given by
L = ∂µφ∂µφ− m2φ2; (5.5)
you may easily show that the Klein-Gordon equation (4.4) follows from extremization (ex-
ercise).
7This is an extremely important assumption, in that it restricts us to theories which are local in space-
time, in the sense that the ﬁelds only couple to other ﬁelds which are at the same point in space or are at
most inﬁnitesimally far away. It is not obvious that this is a necessary requirement. The only motivations
for it are (i) that all observations so far seem to be consistent with it, (ii) even slightly non-local physics
looks local if viewed from far enough away and (iii) we have almost no idea of how to write down a consistent
theory, bar string theory, which violates locality. Perhaps you can ﬁnd one.
– 14 –


## Page 17

This formalism is particularly useful for identifying symmetries of the dynamics and
the consequent implications. This is encoded inNöther’s theorem. Suppose that the action
is invariant under some symmetry transformation of the ﬁelds,φ→ φ + δφ. The fact that
the action is invariant means that the Lagrangian can change at most by a total derivative,
∂µKµ (which integrates to zero in the action). Thus we have that
δL = ∂µKµ = δL
δφ δφ + δL
δ∂ µφ δ∂ µφ (5.6)
= δL
δφ δφ− ∂µ
δL
δ∂ µφ δφ + ∂µ
( δL
δ∂ µφ δφ
)
. (5.7)
But when the equations of motion hold – on classical trajectories – the ﬁrst two terms on
the right hand side cancel. Thus, classically, we have the conserved current
∂µJ µ = 0, where J µ≡ δL
δ∂ µφ δφ− Kµ. (5.8)
As an example, consider the theory of a complex Klein-Gordon ﬁeld. Its Lagrangian is
given by
L = ∂µφ∗∂µφ− m2φ∗φ. (5.9)
The action (and indeed the Lagrangian) is invariant underφ→ eiαφ; we can derive the
conserved current by takingα to be small, such thatδφ = iαφ and δφ∗ =−iαφ∗. Thus
(ignoring the irrelevant overall factor ofα)
J µ = iφ∗∂µφ− iφ∂µφ∗, (5.10)
which is precisely the probability current that we encountered in our discussion of the
Klein-Gordon equation in QM. Similarly, the Dirac Lagrangian is given by
L = ψ(i /∂− m)ψ. (5.11)
Here we introduce for the ﬁrst time the notationψ = ψ†γ0. Its utility lies in the fact
that ψψ is a Lorentz invariant, whereasψ†ψ is not.8 Indeed, as we have seen,ψ†ψ is the
time component of a 4-vector, namely the probability current. The invariance of the Dirac
Lagrangian under a global rephasing of ψ results in the conservation of this probability
current, a fact that we pulled out of a hat in our earlier discussion.
The theories that we concern ourselves with here are also Lorentz- (indeed, Poincaré-
) invariant and this too has consequences for the dynamics. Consider, for example, the
eﬀect of the invariance under spacetime translationsxµ→ xµ + aµ. A ﬁeld transforms
correspondingly as φ(xµ)→ φ(xµ + aµ)≃ φ(xµ) +aν∂νφ(xµ), for smallaν.The Lagrangian
also changes byL→L + aµ∂µL (a total derivative as required) and there are four resulting
conserved currents (one for eachν) given by
T µ
ν = δL
δ∂µφ ∂νφ− δµ
νL. (5.12)
8Sadly, I cannot show this without ﬁrst showing you explicitly how a spinor transforms. You will have
to look in a book.
– 15 –


## Page 18

This is called theenergy-momentum tensor. ∂µT µ
0 = 0 corresponds to the invariance under
time translations and hence expresses conservation of energy (T 0
0 is just the energy density)
and ∂µT µ
i = 0 expresses conservation of momentum. Similarly, invariance under rotations
(a subgroup of Lorentz transformations) implies conservation of angular momentum.
At this point, the Lagrangians that we have written down may seem completely arbi-
trary. In fact, it usually turns out in particle physics that the form of the Lagrangian is
essentially ﬁxed, up to a few free parameters, once one has speciﬁed the particle content
and the symmetries that one desires.9 Let us illustrate this by ‘deriving’ the Lagrangian
for electromagnetism. Here the key symmetry principles are Lorentz invariance and gauge
invariance. The second of these dictates that the Lagrangian should be built out of gauge-
invariant objects, for which the only candidate is the ﬁeld strength tensor,Fµν. The ﬁrst
dictates that all indices should be contracted together. If we are primarily interested in the
long-distance (hence low energy) behaviour of the theory, then the dominant term will be
the one with the smallest number of derivatives. Thus we arrive at the Lagrangian
L =−1
4 FµνF µν. (5.13)
It is worthwhile to point out that while the coeﬃcient in front is merely conventional,
the sign is not. The minus ensures that the term involving the spatial components of the
gauge ﬁeld (which ‘contain’ the physical degrees of freedom), ˙Ai2
, has a positive contri-
bution to the kinetic energy (recall thatL = T− V). In fact, we can get a lot further
by means of symmetry considerations. We can even, for example, determine exactly how
the electromagnetic ﬁeld should couple to complex Klein-Gordon or Dirac ﬁelds. We have
already seen how both of these ﬁelds have an invariance under a global phase rotation, say
φ→ eieχφ. Now suppose that we try to increase the symmetry even further, by promot-
ing this to a local transformation, in which the phaseχ, previously a constant, becomes a
function of spacetime χ(xµ). The mass terms in the Klein-Gordon or Dirac Lagrangians
remain invariant under this enlarged symmetry. But the derivative terms do not, because
∂µφ→ eieχ∂µφ + ie∂µχeieχφ. But now suppose that we introduce an electromagnetic ﬁeld
Aµ whose gauge transformation is given by
Aµ→ Aµ− ∂µχ. (5.14)
Then, the quantity(∂µ + ieAµ)φ≡ Dµφ→ eieχDµφ and the kinetic terms in the action
will be invariant.
Let us now pause for breath. What have we done? We have shown that if we take a
complex Klein-Gordon or Dirac ﬁeld with a global re-phasing invariance, we can promote it
9It is interesting to ponder, in the long winter evenings, why Nature exhibits such a high degree of
symmetry. (It is true that glancing casually at an atlas does not suggest that Nature is terribly symmetric.
But we shall see that at short distances, Nature shows a breathtakingly high degree of symmetry.) Some
attribute it to the genius of some higher intelligence. Others are more prosaic, arguing that it could not
really be any other way. Indeed, as you well know, it is extremely diﬃcult to build a mathematical theory
of physics which is fully consistent in all regimes. Every theory breaks down somewhere. The only chance
that a theory has to be consistent is for its dynamics to be very strongly constrained, so that nothing can
go wrong. But this is precisely what symmetry achieves. A good analogy is a mechanical system, where
experience tells us that the fewer moving parts, the less likely it is to break!
– 16 –


## Page 19

to a local symmetry at the expense of introducing a new, gauge ﬁeldAµ via the covariant
derivative Dµ.10 We have thus ‘derived’ the arbitrary principle of minimal substitution. But
is the principle of local symmetry any less arbitrary? Our general ‘theological’ argument is
that nature is symmetric because symmetry is necessary for consistency of physical laws.
But making such an argument for a local symmetry looks like a con. After all, the local
part of a symmetry is really just a redundancy of description: we can completely remove
it by ﬁxing the gauge. Nevertheless, requiring local symmetry does restrict the possible
dynamics (in the sense that various possible terms in the Lagrangian are forbidden) and
indeed it is the only way in which we can build a consistent theory of force-carrying vector
particles.11
The principle of gauge invariance (together with Lorentz invariance) ﬁxes the form of
the action involving electrons (which are described by a Dirac ﬁeld) and electromagnetic
radiation (or photons) - it is precisely the one which gives rise to Maxwell’s equations in the
classical limit. The quantum version of this theory, which is calledquantum electrodynamics
or QED, explains at a stroke all of chemistry and most of physics as well. It has successfully
predicted the results of measurements (like the gyromagnetic ratio of the electron) that are
the most precise ever carried out in Science. Gauge invariance even dictates how the photon
can couple to particles, like the Higgs boson, that do not carry electric charge and in fact
this coupling was crucial in the recent discovery of the Higgs boson. Not bad for a humble
re-phasing invariance, I would say.
5.2 Scalar ﬁeld quantization
You must be champing at the bit by now. Fifteen pages and still no quantum ﬁeld theory.
Well, here we go.
There exist two popular formalisms for QFT. Each has its advantages and disadvan-
tages. Here we follow the approach ofcanonical quantization. Its great advantage, for our
purposes, is that it is rather close to what you have already done in QM. Its great disad-
vantage is that it is not well-suited to gauge ﬁeld theories. We shall circumvent this hurdle
by studying only simple examples of QFTs, which are suited to canonical quantization, to
begin with, and by using these examples to motivate the form of theFeynman rules for
more complex theories. Those of you who view this course as the beginning of your career
in physics (rather than the end) would be well advised to consult the literature for how to
do canonical quantization properly and for the other,path integral, approach.
We begin with a real, scalar ﬁeld. The Lagrangian is12
L = 1
2(∂µφ∂µφ− m2φ2). (5.15)
10Note that the ﬁeld strength can be written in terms of the covariant derivative asFµν∼ [Dµ, Dν].
11This can be proven, but I won’t do it here. For what comes later, I add that this is also true for
non-renormalizable, eﬀective theories. There, all terms are allowed in the Lagrangian, but the sizes of their
coeﬃcients are ﬁxed by the principle of gauge invariance and this guarantees consistency.
12The factor of one-half is conventional.
– 17 –


## Page 20

The point of departure from QM is that we shall try to quantize the ﬁeldφ, rather than the
position x.13 Thus, we compute the momentum conjugate to the ﬁeldφ, namely π≡ δL
δ ˙φ
and impose the commutation relations
[φ(xi, t), π(x′i, t)] = iδ3(xi− x′i), (5.16)
[φ(xi, t), φ(x′i, t)] = [π(xi, t), π(x′i, t)] = 0. (5.17)
The δ function simply accounts for the fact that the ﬁelds at diﬀerent space points are
considered to be independent. Notice that, since the operatorsφ and π depend on time, we
are working in theHeisenberg pictureof QM, rather than theSchrödinger picture(in the
latter, operators are constant in time and states have all the time dependence). We’ll have
more to say about this later on.
The basic goal in QM is to ﬁnd the spectrum of energies and eigenstates of the Hamil-
tonian. This looks like a hard problem for our ﬁeld theory, for which the Hamiltonian
(density) is given by
H(φ, π)≡ π ˙φ−L = 1
2(π2 + (∇φ)2 + m2φ2). (5.18)
Thankfully, it is rendered almost trivial if we make the Fourier transform
φ(x, t) =
∫ d3p
(2π)32E
(
ape−iEt+ip·x + a†
pe+iEt−ip·x
)
, (5.19)
with E≡ +
√
p2 + m2. Note that we have forcedφ to be real (or rather Hermitian, since
it is now to be interpreted as an operator). Note also that we have normalized using the
Lorentz-invariant integration measure d3p
(2π)32E.14
With this transformation, one may show (recall that
∫
d3peip·x = (2π)3δ3(x)) that the
commutation relations (5.16) can be reproduced by
[ap, a†
p′] = (2π)32Eδ3(p− p′), (5.20)
[ap, ap′] = [a†
p, a†
p′] = 0. (5.21)
This is encouraging, since (apart from a normalization factor) these are the usual commu-
tation relations for the ladder operatorsa and a† of the simple harmonic oscillator, with
one oscillator for eachp. The delta function expresses the fact that the diﬀerent oscilla-
tors are independent. Even better, the various contributions to the Hamiltonian (not the
13Such a dramatic change makes it hard to imagine how QM can be recovered as a limit of QFT; we shall
have to go through some acrobatics later on to do so.
14This is Lorentz invariant, because it can also be written as1
(2π)3
∫
d4pδ(p2− m2).
– 18 –


## Page 21

Hamiltonian density, for once) may be written as (note thatE = E′ when p′ =−p, etc)
1
2
∫
d3x m2φ2 = 1
(2π)38E2
∫
d3p m2
(
apa−pe−2iEt + a†
pa†
−pe+2iEt + apa†
p + a†
pap
)
(5.22)
1
2
∫
d3x (∇φ)2 = 1
(2π)38E2
∫
d3p p2
(
apa−pe−2iEt + a†
pa†
−pe+2iEt + apa†
p + a†
pap
)
(5.23)
1
2
∫
d3x π 2 = 1
(2π)38E2
∫
d3p E2
(
−apa−pe−2iEt− a†
pa†
−pe+2iEt + apa†
p + a†
pap
)
.
(5.24)
All in all, we end up with
H =
∫ d3p
(2π)32E
E
2
(
apa†
p + a†
pap
)
. (5.25)
Again, this is nothing other than the Hamiltonian of a set of independent simple harmonic
oscillators15 (one for each p) of frequency ω = E, summed over p with the density of
states factor. It is then simple to ﬁgure out the spectrum. Deﬁne the vacuum (a.k.a. the
ground state) to be the state|0⟩ annihilated by all of theannihilation operators, ap, viz.
ap|0⟩ = 0∀p. Then, acting on the vacuum with a singlecreation operator, a†
p, one produces
a state|p⟩≡ a†
p|0⟩ of momentum p and energy E. (To show this explicitly, one should
act on the statea†
p|0⟩ with the HamiltonianH and with the momentumP, where P here
is not the ﬁeld momentum π, but rather is the operator corresponding to the generator
of spatial translations. We shall do this later on.) In QM we call this the ﬁrst excited
state, but in QFT we interpret it as a state with a single particle of momentump. A
two-particle state would be given by|p, p′⟩≡ a†
p′a†
p|0⟩, where the particles have momenta
p and p′, and so on. Note how the commutation relation[a†
p, a†
p′] = 0 implies immediately
that a multiparticle wavefunction is symmetric under the interchange of any two particles:
. . . a†
p . . . a†
p′ . . .|0⟩ = . . . a†
p′ . . . a†
p . . .|0⟩. Thus, quantum ﬁeld theory predicts that spinless
excitations of the Klein-Gordon ﬁeld obey Bose-Einstein statistics. Amazing.
The simple harmonic oscillator number operatora†
pap is now interpreted as counting
the number of particles that are present with momentump. Note that the total number of
particles is measured by the operator
N =
∫ d3p
(2π)32E a†
pap (5.26)
which is not a conserved quantity for the real Klein-Gordon ﬁeld (it does not correspond
to a symmetry of the action). So the total number of particles, unlike in QM, is not ﬁxed.
Notice also that the problem of negative energy solutions has gone away. Indeed, the
negative frequency modes in the superposition (5.19) now have a diﬀerent interpretation:
15Recall that the SHO Hamiltonian may be written asω
(
a†a + 1
2
)
≡
f racω2
(
a†a + aa†)
.
– 19 –


## Page 22

they accompany the annihilation operatorsap and reﬂect the fact that annihilating a par-
ticle of energyE causes the total energy stored in the ﬁeld todecreaseby E.
In its place, a diﬀerent problem appears. Let us try to calculate the energy of the
vacuum state|0⟩. It is
⟨0|H|0⟩ =
∫
d3p δ3(0) E
2 . (5.27)
The ﬁrst disturbing thing about this expression is that it containsδ(0). This in fact just
corresponds to the volume of space: since
∫
d3x eip·x = (2 π)3δ3(p), we may write V ≡∫
d3x = (2 π)3δ3(0). But even the Hamiltonian density is divergent, because it is a sum
over all momentum modes of the SHO zero point energyE
2. At least if we forget about
gravity, we can sidestep this problem by observing that we are only able to measure energy
diﬀerences in experiment. Thus we can simply re-deﬁne the Hamiltonian to beH−⟨0|H|0⟩.
Eﬀectively, this can be implemented by ensuring that we always put operators innormal
order, by which we mean that annihilation operators always appear to the right of creation
operators. This guarantees that a normally-ordered operator will vanish when acting on the
vacuum state. A normally-ordered operator is denoted by enclosing it in a pair of colons.
The normally-ordered Hamiltonian, for example, is given by
: H :≡
∫ d3p
(2π)32E Ea†
pap. (5.28)
This problem of the vacuum energy is only the ﬁrst of many peccadillos that appear
in quantum ﬁeld theory. In this case, it seems relatively benign. The other peccadillos
(which confused the founding fathers for decades) are now well understood. But this ﬁrst
problem of the vacuum energy reappears when we consider coupling quantum ﬁeld theory
to gravity, giving rise to thecosmological constant problem. It is arguably the greatest
unsolved problem in the Universe today.
5.3 Multiple scalar ﬁelds
Quantization of more than one scalar ﬁeld is trivial, but it is helpful to point out one
or two conceptual issues. Consider n real, scalar ﬁelds, φi. If we allow a maximum of
two derivatives and two ﬁelds in each term, we claim that the Lagrangian can be written,
without loss of generality, as
L = 1
2(∂µφi∂µφi− m2
i φ2
i ). (5.29)
Why? The most general kinetic term (the one involving the derivatives) could be written
as Zij∂µφi∂µφj, but the matrixZij may be diagonalized by an orthogonal transformation
of the ﬁelds φi. An independent rescaling of the ﬁelds φi can then make each of the
eigenvalues equal to±1. An eigenvalue of−1 would result in an inconsistent theory, since
the kinetic energy would be unbounded below. So the kinetic term can always be written
in thecanonicalform δij∂µφi∂µφj. Now, this kinetic term (which must be present in order
to have a consistent theory) has a globalO(n) symmetry,16 corresponding to orthogonal
16O(n) just means the group ofn× n orthogonal matrices. We’ll say more about it later on.
– 20 –


## Page 23

rotations of the ﬁeldsφi. This then is the largest possible symmetry that a theory based on
n real scalar ﬁelds can have, since the kinetic term must always be present for a dynamical
ﬁeld. This observation will be important when we come to consider gauge theories, since
the name of the game there will be to promote a subgroup of this to a local symmetry.
As for the mass term, this too could be an arbitrary symmetric matrix, in the basis
in which the kinetic term is canonical. This too can be diagonalized by an orthogonal
transformation, without changing the form of the kinetic term. Hence we arrive at the
Lagrangian written above. Note that the mass terms break theO(n) symmetry, unless we
force all themi to be equal.
A particularly interesting example is n = 2, with m1 = m2≡ m. This theory has
SO(2) symmetry, which you may know is (locally) equivalent to aU(1) symmetry.17 One
possibility is to simply quantize the two ﬁelds,φ1 and φ2 independently, as we did in the
last section. Evidently there are two types of ‘particle’, related somehow by theSO(2)
symmetry. More illuminating is to deﬁne a complex scalar ﬁeld,φ≡ 1√
2(φ1 + iφ2), in terms
of which the Lagrangian may be written as
L = (∂µφ∗∂µφ− m2|φ|2). (5.30)
This can be quantized via the mode expansion
φ(x, t) =
∫ d3p
(2π)32E
(
ape−iEt+ip·x + b†
pe+iEt−ip·x
)
, (5.31)
with
[ap, a†
p′] = (2π)32Eδ3(p− p′), (5.32)
[bp, b†
p′] = (2π)32Eδ3(p− p′), (5.33)
with all other commutators vanishing. It is not surprising that there are now two particle
creation operators, since there were two real scalar ﬁelds to begin with. In the complex
ﬁeld formalism here, we need two mode operators in the Fourier expansion becauseφ is
complex. The Hamiltonian is given by
: H :=
∫ d3p
(2π)32E E
(
a†
pap + b†
pbp
)
. (5.34)
As expected, since the two types of particle have the same mass, they contribute in the
same way to the total energy.
What about the SO(2) invariance? In the complex ﬁeld formalism, it maps to the
simple U(1) rephasing: φ→ eiαφ. Nöther’s theorem tells us that there is a conserved
charge and in terms of creation and annihilation operators it is given by
Q =
∫ d3p
(2π)32E
(
a†
pap− b†
pbp
)
. (5.35)
17Again, if you don’t know whatSO(2) and U(1) mean yet, don’t panic: I’ll say more about them later
on. For now,SO(2) is the group of2× 2, orthogonal matrices with unit determinant andU(1) is the group
of 1× 1, unitary matrices, a.k.a complex numbers of the formeiθ.
– 21 –


## Page 24

Note, crucially, that it is the number of particles of typea minus the number of particles
of type b that is conserved. We call the particles of typeb antiparticles. They have the
same mass as the particles, but the opposite charge (recall that when we couple such a ﬁeld
to electromagnetism, we do so precisely by gauging the phase invarianceφ→ eiαφ, so the
charge Q is to be interpreted as the electric charge.
This leads us naturally on to studycharge conjugation. Roughly speaking, this oper-
ation is deﬁned as exchanging particles with their antiparticles and is related to complex
conjugation; many treatments therefore deﬁne it in association with various ﬂips ofi to
minus i and e to minus e, etc.
This, in my view, is deeply confusing, sincei and e are supposed to be ﬁxed constants
of Nature (indeed, we have known since the old testament that we should only exchange an
i for an i ...). Much better is to deﬁne charge conjugation as a symmetry in exactly the
way that we deﬁned other symmetries above: a transformation acting onﬁelds that leaves
the action invariant.
We’ll begin with the Klein-Gordon ﬁeld. The Lagrangian is
L = (∂µ− ieAµ)φ∗(∂µ + ieAµ)φ− m2|φ|2. (5.36)
I hope it is obvious that this is invariant under the transformationAµ→− Aµ and φ→
φ∗. More particularly, the transformation corresponds to the symmetrygroup Z2, because
transforming twice takes Aµ→− Aµ→ Aµ and φ→ φ∗→ φ, which is the same as the
identity transformation. Because it is a discrete transformation, Nöther’s theorem does not
imply a conserved charge in this case. Note that the transformationAµ→− Aµ is just
what we expect for charge conjugation from Maxwell’s equations, which will be unchanged
if we also ﬂip the sign of the charge and the current (which in QFT will be generated by
ﬁeld conﬁgurations likeφ and ψ).
Now let’s do it for the Dirac ﬁeld. Here it is not so simple to guess what the symmetry
transformation is by looking at the Lagrangian, so we’ll ﬁnd our way along with the help
of Simplicio, Salviati, and Sagredo, the three ﬁctional characters of the Galilean trialogue.
The Dirac Lagrangian is
L = ψ(i /D− m)ψ, (5.37)
with Dµ = ∂µ + ieAµ. Simplicio knows, from his study of Maxwell’s equations, that the
transformation ofAµ must beAµ→− Aµ and he guesses that he can just complex conjugate
ψ, as he did for the Klein-Gordon ﬁeld. This doesn’t work well at all. Consider the mass
term for example, this transforms as
ψψ→ ψT γ0ψ∗ =−ψ†(γ0)T ψ =−ψ†γ0ψ =−ψψ. (5.38)
This argument is a bit subtle: in the second step we have used the fact that the whole
quantity is just a number (not a matrix) and therefore equals its transpose. But as we
shall see in the next subsection, this theory can only make sense as a QFT if the ﬁeld
anticommutes with itself. Thus, the transpose of a product of two ﬁelds is equal tominus
the reversed product of the transposed ﬁelds. Once we take this into account, we see that
– 22 –


## Page 25

charge conjugation cannot just involve complex conjugation of the ﬁelds, because the mass
term in the Lagrangian would not be invariant. If we wanted the electron to be charged, it
would have to be massless, which it is not. Simplicio is stuck.
Now Salviati enters the fray. He realises that complex conjugation is somewhat am-
biguously deﬁned for a multi-component spinor, since one could also mix up the diﬀerent
components at the same time. So he says, “Maybe it should beψ→ Cγ 0ψ∗,18 for some
matrix C. Then we’d ﬁnd
ψψ→ ψψ,
ψγ µψ′→− ψ′γµψ, (5.39)
provided CC† = 1 and C†γµC =−(γµ)T.” Note that Salviati carefully wrote the second
relation for a bi-linear combination of two diﬀerent ﬁeldsψ and ψ′, to stress that they get
ﬂipped by C.
Only now does Sagredo realise the true genius of Salviati. Sagredo realises that if we
set ψ′ = ψ in (5.39), we ﬁnd ψAµγµψ→ ψAµγµψ, whereas if we setψ′ = ∂µψ, we ﬁnd
ψ∂µγµψ→− ∂µψγ µψ→ +ψ∂µγµψ (where in the last step we integrated by parts). So all
terms in the Lagrangian will be invariant.
Simplicio hasn’t really followed any of this, but he does point out that a suitableC is
iγ2γ0. Thus, we can now forget the trialogue and remember only that charge conjugation
can be implemented on Dirac spinors asψ→ iγ2ψ∗.
Let me make one last point, which will be important when we study non-Abelian gauge
theories. Imagine thatψ carries an extra indexi and thatAµ is really a matrix with indices
i and j. Then, by an obvious generalization of Salviati’s result,ψiγµψj→− ψjγµψi and
charge conjugation will only be a symmetry of the Lagrangian if we also deﬁneAµ
ij→− Aµ
ji.
So a matrix-valued gauge ﬁeld must go to minus its transpose under charge conjugation.
5.4 Spin-half quantization
We now wish to quantize the Dirac Lagrangian19
L = ψ(i /∂− m)ψ. (5.40)
To do so, we ﬁrst derive the Hamiltonian. The ﬁeld momenta conjugate to the ﬁeldsψ and
ψ are
π≡ δL
δ ˙ψ
= iψ†, (5.41)
π≡ δL
δ ˙ψ
= 0, (5.42)
whence the Hamiltonian is
H =−ψiγ·∇ ψ + mψψ. (5.43)
18The γ0 is conventional.
19We’ll worry about the coupling to photons later, so for now we putD→ ∂.
– 23 –


## Page 26

We guess from our experience with the Klein-Gordon system that our best chance at solving
this system is to do a Fourier transform. For this, we need a complete set of plane wave
solutions to the Dirac equation. For the positive-energy solutions, we write these asψ =
us
pe−ip·x; plugging into the Dirac equation, we ﬁnd that they satisfy
(/p− m)us
p = 0. (5.44)
There are two solutions (one for each of the two possible spin states), which we label by
s∈{ 1, 2}. We found explicit expressions for these earlier in the Pauli-Dirac basis, but we
do not need them here. Instead we simply note that since theu provide a complete set of
states, the combination
∑
s
us
pus
p (5.45)
must satisfy a completeness relation. Moreover, this must be proportional to/p + m, since
acting on the left with/p− m then gives something proportional to/p2− m2 = p2− m2 =
0. This is as it should be, since (/p− m)us
p = 0. We ﬁx the normalization so that the
proportionality constant is unity (this corresponds to2E particles per unit volume, as for
the Klein-Gordon ﬁeld). Thus
∑
s
us
pus
p = /p + m. (5.46)
Similarly, for the two negative energy solutions, we writeψ = vs
pe+ip·x; plugging into the
Dirac equation, we ﬁnd that they satisfy
(/p + m)vs
p = 0 (5.47)
with completeness relation
∑
s
vs
pvs
p = /p− m. (5.48)
Our mode expansion is then
ψ =
∫ d3p
(2π)32E
(
cs
pus
pe−ip·x + ds†
p vs
pe+ip·x
)
, (5.49)
where a sum ons is implicit. As for the complex Klein-Gordon case, sinceψ is complex we
need two operatorsc and d.
So far, we have made no mention of commutation relations, with good reason. To see
why, let us compute the form of the conserved charge,Q≡
∫
d3xψ†ψ (corresponding to the
re-phasing symmetry ψ→ eiαψ). We ﬁnd
Q =
∫ d3p
(2π)3(2E)2
(
us†
p us′
p cs†
p cs′
p + vs†
p vs′
p ds
pds′†
p + us†
p vs′
−pcs†
p ds′†
−pe+2iEt + vs†
p us′
−pds
pcs′
−pe−2iEt
)
,
(5.50)
– 24 –


## Page 27

or something similar. We can simplify things using our completeness relations. Consider,
for example
∑
s
us
pus
p = /p + m. (5.51)
Multiplying this matrix equation on the right byγ0 and then taking the trace, we get
∑
s
u†s
p us
p = tr[(/p + m)γ0] = 4E. (5.52)
But since this corresponds to a sum over two orthogonal spin states, we must have that
u†s
p us′
p = 2E δ ss′
. (5.53)
We similarly derivev†s
p vs′
p = 2E δ ss′
. To get an expression forus†
p vs′
−p, which appears inQ
above, requires a little more ingenuity. Consider∑
s us
pvs
p. This must vanish when we act
on the left with/p− m (since (/p− m)up = 0), whence it is proportional to/p + m. But it
also must vanish when we act on the right with/p+ m, so it is proportional to/p− m. Hence
it vanishes identically. But thevp are proportional tov†
−p (one may easily check that they
both satisfy the same equation). Henceus†
p vs′
−p = 0. In all, Q simpliﬁes to
Q =
∫ d3p
(2π)32E
(
cs†
p cs
p + ds
pds†
p
)
. (5.54)
Similarly, one may show that
H =
∫ d3p
(2π)32E E
(
cs†
p cs
p− ds
pds†
p
)
. (5.55)
Now, if we imposecommutation relations on c and d, we may simply permute thed with
the d† to get operators into normal order, but we end up with a disaster: not only will the
charge count the numbers of both particles and antiparticles, but also the antiparticles will
give a negative contribution to the total energy as measured by the Hamiltonian. Now, you
may try as you like to insert factors ofi to try to patch things up, but nothing will work.
What does work is to make the simple but bold step of declaring that the commutation
relations should be replaced by anticommutation relations. Thus,
{cs
p, cs′†
p} = (2π)3δ3(p− p′)δss′
, (5.56)
{ds
p, ds′†
p} = (2π)3δ3(p− p′)δss′
(5.57)
with otheranti-commutators vanishing. Then the charge measures the number of particles
minus the number of antiparticles and both particles and antiparticles contribute positively
to the energy. Moreover, anyn-particle state . . . c† . . . c† . . .|0⟩ is manifestly antisymmetric
under the interchange of two particles. As Pauli realized, this means that if we try to put
two particles into thesame state, we ﬁnd(c†s
p )2|0⟩ = 0. So the Pauli exclusion principle of
QM follows from the fact that in QFT, we can only quantize spin-half ﬁelds consistently
by using anticommutation relations. Amazing.20
20Another philosophical discourse: Even if QFTs of both fermions and bosons are mathematically consis-
tent, whydidNaturechoosetorealizethemboth? OnepossibilityisthatconsistencyofthelawsofNatureat
a more fundamental level (e.g. including gravity) requires an even larger symmetry, called supersymmetry.
If you want to know more, take courses on supersymmetry and string theory.
– 25 –


## Page 28

5.5 Gauge ﬁeld quantization
To quantize the electromagnetic ﬁeld presents a thorny problem, which has a variety of
more or less elegant workarounds. The basic problem is that the ﬁeld componentA0 does
not appear in the Lagrangian with a time derivative. It is non-dynamical, and as a result,
its conjugate momentum vanishes:π0≡ δL
δ ˙A0 = 0. The Hamiltonian is given by
H =
∫
d3x
(
E2 + B2− A0∇· E
)
. (5.58)
Here, A0 appears as a Lagrange multiplier, enforcing Gauss’ law,∇· E = 0 as a constraint.
Thus, the problem we face (and the problem in quantizing gauge theories in general) is the
problem of how to quantize a dynamical system with constraints. This is a most interesting
problem, ﬁrst studied by (who else?) Dirac, with a variety of elegant solutions. Here we
shall follow what is perhaps the least elegant solution (but most direct) of all, which is to
make sure that we ﬁrst ﬁx the gauge completely.21 To do so, we set∂µAµ = 0 and A0 = 0,
removing the non-dynamical ﬁeldA0. This is called Coulomb gauge. A plane-wave solution
then takes the formAi = ϵie−ip·x, with p2 = 0 and the condition∇· A = 0 =⇒ ϵ· p = 0.
Thus ϵi has two independent polarizations.
The components of the gauge ﬁeldAi can then be quantized like massless Klein-Gordon
ﬁelds
Ai(x) =
∫ d3p
(2π)32E
∑
P
(
aP
p ϵP
i e−ip·x + a†P
p ϵ∗P
i e+ip·x
)
(5.59)
where ϵP
i are the polarization vectors for the two physical components. These satisfy the
completeness relation
∑
P
ϵP
i ϵP
j = δij− pipj
p2 , (5.60)
whose tensor structure is ﬁxed by the requirement thatϵ· p = 0. For example, if we choose
the two states to be circularly polarized, for waves travelling in thez direction, we have
ϵL,R
µ = 1√
2(0,−1,±i, 0). (5.61)
The required commutation relations are
[aP
p , a†P′
p′ ] = (2π)32Eδ P P′
δ3(p− p′) (5.62)
and they result in the Hamiltonian
H =
∫ d3p
(2π)32E
∑
P
Ea†P
p aP
p , (5.63)
after normal ordering, where nowE =
√
p2.
21This approach will not work for the non-Abelian gauge theories that we study later. But there we shall
bypass the details of the quantization procedure.
– 26 –


## Page 29

5.6 How to go back again
We have opened the Pandora’s box that is quantum ﬁeld theory. Having come this far, the
poor reader might be forgiven for wondering how on Earth he or she might go back again
to the mundane world of QM! That is to say, starting from quantum ﬁeld theory, how can
one re-derive quantum mechanics (relativistic or otherwise) as a limiting case?22
At ﬁrst glance, passing from quantum ﬁeld theory to quantum mechanics would seem
to be child’s play. Indeed, the Euler-Lagrange equation of motion for either the Klein-
Gordon or Dirac ﬁeld is precisely the respective quantum-mechanical Klein-Gordon or Dirac
equation. Wecaneventakethenon-relativisticlimitineithercasetoobtaintheSchrödinger
equation. For the complex Klein-Gordon ﬁeld, for example,23 satisfying
(∂µ∂µ− m2)φ = 0, (5.64)
we make the substitutionφ = e−imtχ. This substitution accounts for the fact that, in the
low energy limit, the energyE in the argument of the plane-wave exponential is dominated
by the rest massm. The remaining piece, χ should then have a small time dependence,
such that ˙χ≪ mχ. Making the substitution in the Klein-Gordon equation, we directly
obtain the Schrödinger equationi ∂χ
∂t =− 1
2m∇2χ.
Unfortunately, this argument is unsatisfactory for a number of reasons. For one thing,
the Euler-Lagrange equation of motion corresponds to the classical limit,ℏ→ 0,24 rather
than the limit of quantum mechanics. Moreover, in this framework, the positionx is just
a label, not an operator, as it should be in QM. Finally, the interpretation ofχ∗χ as the
probability density in QM is missing.
How, then, does QM really arise as the limit of QFT? Well, let us ﬁrst recall that QM is
a theory with a ﬁxed number of particles, which forces us to consider (i) the non-relativistic
limit and (ii) a theory in which the number of particles can be conserved by a symmetry.
Otherwise the limit cannot be consistent. This immediately rules out there being such a
limit for the real Klein-Gordon ﬁeld, for which there is no candidate conserved charge that
could correspond to particle number in the low energy limit. For the complex Klein-Gordon
ﬁeld, there is a candidate charge, but in the full theory it conserves the number of particles
minus the number of antiparticles, rather than the number of particles (which is what we
want in order for QM to be consistent). Nevertheless, we shall now show that it is possible
to have a consistent theory of QM in the low-energy limit.
22This is a topic that does not seem to be adequately addressed in the majority of ﬁeld theory textbooks
and so I beg the reader’s indulgence here in allowing me to treat it in some detail. Those who wish to
remain in blissful ignorance may skip it.
23The case of the Dirac ﬁeld is set as an exercise.
24One way to see thatℏ→ 0 is the limit of classical mechanics is to note that all commutation relations
vanish in this limit, meaning that operators can be replaced by numbers. A much more elegant way is to
note that in the path integral formulation of QM or QFT, amplitudes are obtained by integrating over all
paths in spacetime weighted by a factor ofeiS/ℏ, whereS is the action. In the limitℏ→ 0, the path integral
is dominated by paths for whichδS = 0, viz. those that satisfy the classical equations of motion. The units
ℏ = 1 are obviously not ideal for the present discussion!
– 27 –


## Page 30

To do so, we make the same substitutionφ = e−imtχ as before, but in the Lagrangian.
We get
L′ = iχ† ˙χ− 1
2m∇χ†∇χ (5.65)
where we have integrated by parts, taken the non-relativistic limit˙χ≪ mχ, and divided
by 2m. The canonical momentum conjugate to the ﬁeldχ is then π≡ δL
δ ˙χ = iχ† and the
Hamiltonian is
H′ = + 1
2m∇χ†∇χ. (5.66)
The canonical commutation relations are then
[χ, χ†] = δ(x− y) (5.67)
(with all others vanishing). Now, the important point is that we can consistently realize
these commutation relations with a single particle annihilation operator deﬁned by
χ(x) =
∫ d3p
(2π)3 apeip·x, (5.68)
with
[ap, a†
q] = (2π)3δ(p− q) (5.69)
This can be traced back to the fact that the Lagrangian is ﬁrst-order in the time derivative.
As a result, it is possible to quantize, in the low energy limit, in a way in which there are
only particles in the theory, with no antiparticles. Intuitively, the reason this is possible is
because in the non-relativistic limit, starting from a conﬁguration of particles only, there is
insuﬃcient energy to produce particle-antiparticle pairs from the vacuum.
It is important to note that this cannot be the only possible way to quantize the
theory at low energy, since it is also perfectly possible to have conﬁgurations consisting of
antiparticles only, or indeed of both particles and antiparticles.
The fact that it is possible to quantize the theory in terms of particles only is not enough
to guarantee the consistency of QM. (Indeed, we already know that this can be done for
the real Klein-Gordon ﬁeld and we shall soon show that this does not have a consistent QM
limit.) We must also show that the number of particles is a conserved quantity. This is
easily done: the low-energy Lagrangian has a symmetryχ→ eiαχ whose conserved charge
is Q =
∫ d3p
(2π)3 a†
pap. This charge simply counts the number of particles in a state (as one
may easily show for,e.g. the one-particle statesa†
p|0⟩.
So, we have shown that there is a consistent limit of the theory in which there is a ﬁxed
number of particles. It remains to show that this limit really corresponds to QM, with its
commutation relations, the Schrödinger equation, and so on.
To do so, one may ﬁrst easily show that the Hamiltonian and the conserved momentum
25 arising from the Nöther current corresponding to the symmetry of the Lagrangian under
25Note, this is not the momentumπ conjugate to the ﬁeldχ.
– 28 –


## Page 31

time and space translations are given by26
H =
∫ d3p
(2π)3
p2
2m a†
pap, (5.70)
P =
∫ d3p
(2π)3 pa†
pap. (5.71)
Note that the momentumP is indeed an operator and it is this momentum that should
obey the usual QM commutation relation[X, P] = i. To show this explicitly, we must ﬁrst
identify the position operatorX. We claim that it is
X≡
∫
d3xxχ†(x)χ(x). (5.72)
To verify this, note thatX acting on a one-particle state atx, viz.|x⟩≡ χ†(x)|0⟩, returns
eigenvalue x: X|x⟩ = x|x⟩. An arbitrary state, with wavefunction ψ(x), may then be
written as
|ψ⟩≡
∫
d3xψ(x)|x⟩, (5.73)
and one may then show (exercise) that
X|ψ⟩ =
∫
d3xxψ(x)|x⟩, (5.74)
P|ψ⟩ =
∫
d3x(−i∇ψ)|x⟩. (5.75)
Thus we have the usual correspondence P →− i ∂
∂x of QM and the usual commutation
relation [X, P] = i. Similarly, one may show that
H|ψ⟩ =
∫
d3x− 1
2m∇2ψ(x)|x⟩, (5.76)
so that ψ(x) satisﬁes the usual time-dependent Schrödinger equationi ∂ψ
∂t =− 1
2m∇2ψ(x).
Finally, the probability for the particle to be found atX is given by|⟨X|ψ⟩|2, which one
may show (exercise) is given by|ψ(x)|2.
To check that you understand things, you should now worry how we can obtain the
usual QM commutation relations[X, P] = ifor the non-relativistic limit of the Dirac theory,
in which all operators obeyanticommutation relations. (Hint: X and P both involvetwo
creation or annihilation operators.)
5.7 Interactions
If you have understood this far, you may rightly feel pleased with yourself. We have
successfully quantized relativistic ﬁeld theories containing particles with spin (or helicity)
zero, one-half, and one. This covers everything we have seen thus far in Nature, with the
exception of the spin-two graviton.
26These expressions are not unexpected: they sum the kinetic energies and momenta for each state
labelled by p, multiplied by the occupation number of each state.
– 29 –


## Page 32

You may, however, have noticed the elephant in the room: thus far we have only dealt
with Lagrangians that are quadratic in the ﬁelds. These correspond to linear equations of
motion, which everybody knows are far easier to solve than non-linear equations of motion,
in that solutions may be superposed. We call the quantum versions of such theoriesfree
or non-interacting theories. They are decidedly dull, in that particles that are present
remain present for ever. Interacting theories, which contain terms with more than two
powers of ﬁelds in the Lagrangian, are far more interesting: they provide the catalyst by
which particles can appear or disappear, being transformed into other sources of energy
and momentum. So rich, in fact, are such theories, that no one has been able to solve them,
except in a few very special cases (if you manage it, let me know – we can write a paper
together). We are forced to resort to perturbation theory. Let us now develop the necessary
formalism to do this. Unfortunately, this is one of the things that is perhaps more easily
done in the path integral approach to ﬁeld theory. Since our ultimate goal is to get to the
Feynman rules, which provide a straightforward mnemonic for doing real calculations, I will
merely sketch how things go in canonical quantization.
Thus far, we have been working in the Heisenberg picture of QM, in which operators
(like φ(x, t)) depend on time, but states do not. You have probably spent much of your
previous career working in the Schrödinger picture, in which the opposite happens. It is
simple to go between the two. In the Schrödinger picture, everyone knows that the time-
dependence of the states is given byi ∂
∂t|ψ⟩S = HS|ψ⟩S, where the subscripts are to remind
us that this is the Schrödinger picture. In the Heisenberg picture, we deﬁne
OH(t) = eiHt OSe−iHt (5.77)
|ψ⟩H = eiHt|ψ⟩S. (5.78)
The pictures are equivalent, because we always sandwich operators between states to com-
pute amplitudes, which are the things we use to make physical predictions.
For doing perturbation theory, a third picture, theinteraction picture, is useful. In this
picture, we split the Hamiltonian into a free partH0 (that we can solve) and a perturbation
H1 and we instead deﬁne
OI(t) = eiH0tOSe−iH0t (5.79)
|ψ⟩I = eiH0t|ψ⟩S. (5.80)
As a result, the operators evolve according toH0 (meaning that operator expressions like eq.
5.19, which was written in the Heisenberg picture of the free theory, are equally valid in the
interaction picture), while the states evolve according to (exercise)HI≡ eiH0t(H1)Se−iH0t:
i ∂
∂t|ψ⟩I = HI|ψ⟩I . (5.81)
Note that HI is explicitly time dependent. Given an initial state|ψ(t0)⟩I, Dyson showed
that a formal solution to this last equation is given by|ψ(t)⟩I = U(t, t0)|ψ(t0)⟩I, where
U(t, t0) = T exp−i
∫ t
t0
HI(t′)dt′. (5.82)
– 30 –


## Page 33

Here, the time-ordering operator acting on a product of ﬁelds is deﬁned by
T O1(t1)O2(t2) =
{
O1(t1)O2(t2), if t1 > t2
O2(t2)O1(t1), if t2 > t1
(5.83)
Acting on an exponential, the time ordering is obtained by Taylor expanding the exponen-
tial and then acting on the individual terms in the expansion (which are simple products
of ﬁelds). You may wonder why time ordering is needed. The point is thatHI, being time
dependent, does not commute with itself at diﬀerent times. SoHI(t)e−i
∫t dt′HI(t′) is not
the same thing ase−i
∫t dt′HI(t′)HI(t). But with time ordering,∂
∂t acting on U(t, t0) unam-
biguously gives−iHI(t)U(t, t0), since t is a later time than any time appearing inU(t, t0).
Hence (5.82) solves (5.81). Intuitively, the role of time ordering is to enforce causality in
the theory: colloquially, it prevents particles from being destroyed before they are created.
Formally, we have now solved quantum ﬁeld theory. Unfortunately, nobody knows how
to compute U(t, t0) for non-trivial HI. The best we can do is to attempt a perturbative
expansion. Provided HI is small enough,27 we may expand
U(t, t0) = 1− i
∫ t
t0
HI(t′)dt′ + (−i)2
2 T
(∫ t
t0
dt′
∫ t
t0
dt′′ HI(t′)HI(t′′)
)
+ . . . (5.84)
In the H2
I term, we integrate over a square region in(t′, t′′) we may simplify the time-
ordering operation by splitting the integration region into two triangles: one witht′′ > t′
and one witht′′ < t′. Thus,
T
(∫ t
t0
dt′
∫ t
t0
dt′′ HI(t′)HI(t′′)
)
=
∫ t
t0
dt′
∫ t′
t0
dt′′ HI(t′)HI(t′′) +
∫ t
t0
dt′′
∫ t′′
t0
dt′ HI(t′′)HI(t′). (5.85)
Perversely, we chose to do the ﬁrst integral with respect tot′′ and then t′, but we did the
second integral the other way round. Actually this is not so perverse, since it shows that the
two contributions are identical, once we interchange the dummy variablest′↔ t′′. Thus,
in toto, we have
U(t, t0) = 1− i
∫ t
t0
HI(t′)dt′−
∫ t
t0
dt′
∫ t′
t0
dt′′ HI(t′)HI(t′′) + . . . (5.86)
In particle physics experiments, we typically prepare some particles (a pair of protons
at the LHC, for example), arrange for them to collide, and try to detect the products. Now,
the relevant time and distance scales for particle physics tend to be so small that, to a very
good approximation, we may consider the initial and ﬁnal states to be in theinﬁnite far past
and future, respectively, and we also may safely integrate over all of space in computing the
27I make no attempt to deﬁne ‘small enough’; it turns out that the perturbative expansion of QFT almost
never converges, being at best an asymptotic expansion. This is in some sense a good thing, since there are
devils to be found in the details: many of the rich phenomena that have been discovered in QFT in recent
decades are non-perturbative.
– 31 –


## Page 34

Hamiltonian from the Hamiltonian density. We thus claim that the quantities of interest
for particle physics are the amplitudes
⟨f|U(+∞,−∞)|i⟩. (5.87)
We now have an idea how to computeU as a perturbation series inHI (and shall do so
explicitly for some examples presently). But how do we compute|i⟩ and|f⟩? They are
eigenstates of the full interacting theory (albeit in the interaction picture). One might hope
that since the particles are well separated in space, they might be considered to be the
n-particle eigenstates of H0, e.g. a†|0⟩, that we computed before. Unfortunately, this is
not quite correct, because even though the particles are well-separated from each other,
they are not well-separated from the vacuum, which, in QFT, is a complicated place, with
particles being created and annihilated on quantum timescales.28 Fortunately, the theorists
have declared that it is safe to consider|i⟩ and|f⟩ as free eigenstates, provided we make
one or two modiﬁcations to the Feynman rules later on. We will take their word for it for
now.29
Once we accept this, doing calculations in QFT is easy, if tedious. All we do is to
take initial and ﬁnal states (of the forma†|0⟩), sandwich them between products of time-
ordered Hamiltonians (expressed in terms of creation and annihilation operators asa†a),
and (anti-)commute theas and a†s until we are left with ac-number. This is the desired
amplitude, which we should square to ﬁnd the decay rate, cross-section or whatever (taking
into account phase space, of course). In fact, it is even easier than that. Feynman showed
that the whole tedious business can be reproduced by the mnemonic of drawingFeynman
diagrams, from which the amplitudes are reconstructed via theFeynman rules. Our strategy
in later lectures will be to take the Feynman rules as a starting point and compute from
there, but here we shall compute two processes the tedious way, so that you can fully
appreciate the favour that was done unto you by RPF.
5.8 e+e− pair production
Our ﬁrst process is conversion of a photon γ into an electron-positron pair. This can-
not happen in free space, because of energy-momentum conservation (exercise), but it can
occur in a material (which recoils). We have already seen that the electromagnetic inter-
action is given byHI = + eAµψγ µψ and that the scattering amplitude, at leading order
in perturbation theory, is given by−i⟨f|
∫
d4xHI|i⟩. Let’s examine the diﬀerent pieces
of this in turn. Firstly, the initial state is to be a photon, of momentum k, say, and
polarization P. So |i⟩ = a†P
k |0⟩. Similarly, we want the ﬁnal state to consist of an elec-
tron of momentum p1 and spin s1 and a positron of momentum p2 and spin s2.30 So
|f⟩ = c†s1
p1 d†s2
p2|0⟩ =⇒ ⟨f| =⟨0|ds2
p2cs1
p1. The bit in the middle ise
∫
d4xAµψγ µψ. When we
plug in the Fourier mode expansions, we have thatAµ∼ a + a†, but only thea piece will
28In fact, the vacuum is so complicated that we can compute everything in QFT from it: as we have seen,
every amplitude is just given by⟨0| . . .|0⟩, where . . . represent some operator.
29Those who feel their intelligence to have been insulted by this may consult a proper quantum ﬁeld
textbook for epiphany.
30If this doesn’t make sense to you, go back and read §5.4.
– 32 –


## Page 35

γ
e−
e+
Figure 1. Feynman diagram representing the processγ→ e+e−.
give a non-vanishing contribution to the matrix element (thea† piece can be commuted
to the left, where it will annihilate⟨0|. Similarly, only the d† and c† pieces of ψ and ψ,
respectively, contribute. Moreover, all of these contributions can be reduced toc-numbers
by commutation. For example, we can commute thea piece through the a† in|i⟩ to get
a delta-function (as in (5.62)) together with a term that annihilates|0⟩. Doing this, our
amplitude reduces to3132
− i⟨f|
∫
d4xHI|i⟩ =−ie
∫
d4x ϵ P
µ us1γµvs2e−i(k−p1−p2)·x =
− ie(2π)4δ4(k− p1− p2)ϵP
µ us1γµvs2. (5.88)
It is pleasing to see that conservation of 4-momentum is manifest. This happens because
we took the Fourier transform. To check conservation of angular momentum, you’d need
to work out the spin and polarization states explicitly.
For what comes later, it is useful to extract the overall(2π)4δ(pf− pi) (which al-
ways appears, cf. our discussion of Fermi’s Golden rule), deﬁning thematrix element by
⟨f|U(+∞,−∞)|i⟩≡ i(2π)4δ(pf− pi)M. Hence, we have
iM =−ieϵP
µ us1γµvs2. (5.89)
We can think of this as arising from the following factors: a factor ϵP
µ representing an
incoming photon; us1 and vs2 representing an outgoing electron and positron, respectively;
and−ieγµ representing the interaction vertex. When we get to the Feynman rules, our
process will be represented by the diagram in Fig. 1 with the external lines telling us
to include the various ingoing and outgoing factors and with the dot representing the
vertex factor. You should now convince yourself (exercise) that the matrix element for
e−(s1) +γ(P )→ e−(s2) is iM =−ieϵP
µ us2γµus1, so that the vertex factor for an incoming
electron is us1.
5.9 Compton scattering
For our second process, we wish to compute the amplitude for a photon to scatter oﬀ an
electron. Again, this cannot happen for free particles, but it can happen for an electron
31Previously, we worked in Coulomb gauge,A0 = 0 and wrote the polarization vector of a photon as a
3-vector ϵP
i ; more generally, we may write it as a 4-vector,ϵP
µ.
32This sort of argument is straightforward, but is liable to make one’s eyes glaze over. Suﬃce to say that
you will only really get to grips with it if you sit down and work out all the intermediate steps for yourself
(exercise). At this point, the angel on your right shoulder is probably saying “Yes. Go and get a pen and
paper and do it right now, once and for all.” The demon on your left shoulder is probably saying “Let’s
just quickly check the Facebook ...”
– 33 –


## Page 36

that is bound in an atom. It is called Compton scattering and you will doubtless have
heard it touted in your QM courses as evidence for the corpuscular nature of light. Touted
as it was, you probably did not go beyond computing the kinematics. That is because to
compute the scattering amplitude requires at least relativistic QM, and better still QFT.
Let’s do it at last.
Compton scattering is more complicated than pair production, because it cannot hap-
pen in leading order perturbation theory (exercise). So we need the second order perturba-
tion
⟨f|T
∫
t,t′
HI(t)HI(t′)|i⟩ (5.90)
and the issue of time-ordering rears its ugly head. You have by now realised that the game
in computing QFT matrix elements is to move all the annihilation operators to the right
and all the creation operators to the left, where they vanish when acting on|0⟩. But this is
precisely what we previously called normal ordering. So it would be very useful to have a
theorem that tells us how to convert from time-ordering to normal ordering. That theorem
is calledWick’s theorem. It decrees that
T φ(x1)φ(x2)··· =: φ(x1)φ(x2)··· : +contractions, (5.91)
where ‘contractions’ instructs us to take all possible pairs of operators from the list and
replace them with something called thepropagator. We shall not prove Wick’s theorem in
general, nor shall we derive the propagator for all ﬁelds. Rather, we shall content ourselves
with showing how things work for a product of two Klein-Gordon ﬁelds.
For these, there is only one possible contraction, so we write
T φ(x)φ(y) =: φ(x)φ(y) : +∆F (x− y), (5.92)
where ∆F (x− y) is known as the Feynman propagator and our goal is to determine it,
or at least to ﬁnd an expression for it in momentum space. Let us ﬁrst consider the
case x0 > y 0, such that T φ(x)φ(y) = φ(x)φ(y) . Then, when we write out the mode
expansion for φ(x)φ(y), the piece which is not in normal order is the piece containing
ape−ip·xa†
p′e+ip′·y. When we normally order it, we generate the additional contribution
[ap, a†
p′]e−ip·xe+ip′·y = (2π)32Eδ3(p− p′)e−ip·(x−y). If insteadx0 < y 0, we shall ﬁnd a piece
(2π)32Eδ3(p− p′)e−ip·(y−x). Thus, we may write
∆F (x− y) =
∫ d3p
(2π)32E
(
θ(x0− y0)e−ip·(x−y) + θ(y0− x0)e−ip·(y−x)
)
. (5.93)
This involves a Lorentz-invariant measure and indeed it may be written as (exercise)
∆F (x− y) =
∫ d4p
(2π)4
i
p2− m2 + iϵ e−ip·(x−y), (5.94)
– 34 –


## Page 37

p
k′
p′
k
p + k
ϵ
u
ϵ′
u′
µν +
p k′
p− k′
k p′ϵ
u
u′
ϵ′
µ
ν
(5.96)
Figure 2. Feynman diagram representing Compton scattering,e− + γ→ e− + γ.
where ϵ > 0 is a small quantity telling us how to avoid the poles atp0 =±
√
p2 + m2 in
the complex p0 plane.33
We can now see how to compute the matrix element for Compton scattering. We must
ﬁrst apply Wick’s theorem to the expression
(−ie)2⟨f|T
∫
x,x′
Aµ(x)ψ(x)γµψ(x)Aν(x′)ψ(x′)γνψ(x′)|i⟩. (5.95)
Given that the initial and ﬁnal states both contain an electron and a photon, the only
contractions in (5.91) that give a non-vanishing contribution involve oneψ and one ψ.
There are two such contractions and these are represented by the Feynman diagrams in
Fig. 2, where the propagator is represented by the line joining the two blobs, which are
called vertices. This propagator is theDirac propagatorgiven by
S(x− y) =
∫ d4p
(2π)4
i
/p− m + iϵ e−ip·(x−y), (5.97)
Its form is easy to understand: it too is a Green function, but this time for the Dirac
equation. The uncontracted ﬁelds act on the states|i⟩ and|f⟩; for them we derive the same
in/outgoing electron/photon factors that we derived above. In all the amplitude is given
by (ignoring theiϵs)
iM = (−ie)2ϵ∗′
µ u′
(
γµ i(/p + /k + m)
(p + k)2− m2 γν + γν i(/p− /k′ + m)
(p− k′)2− m2 γµ
)
uϵν. (5.98)
Since there are two contributions to the amplitude, the cross-section (which goes as|M|2)
contains interference terms.
In the examples, we’ll turn this into a cross-section.
6 Gauge ﬁeld theories
Our construction of the ediﬁce of QFT thus far has been painful to say the least. We
went down many blind alleys, broke Lorentz invariance (by givingt a special rôle in the
33These poles are present because∆F (x− y) is a Green function of the Klein-Gordon equation and is
deﬁned only up to a solution of the homogeneous equation until boundary conditions are speciﬁed. In this
case the iϵ prescription amounts to specifying the boundary conditions to be Lorentz-invariant and causal
(meaning that∆F (x−y) should vanish outside the light cone). Note that the latter condition is forced upon
us by the time ordering. So insisting on causality in time (together with Lorentz invariance) guarantees
causality in spacetime.
– 35 –


## Page 38

equations) and recovered it again, violated gauge symmetry, swept inﬁnities under the rug,
and more. All this without ever calculating a cross-section. But I hope at least that you
learnt something. We started with quantum mechanics and we ended up with quantum
ﬁeld theory, more or less. With the foundations in place, we can now relax a bit. For the
rest of the course, we shall not worry too much about the unpleasantries of quantization.
We shall start from the Lagrangian and from that write down the Feynman rules. As we
have hinted, even the Lagrangian itself is ﬁxed to a large extent, once we have speciﬁed the
ﬁeld content and the symmetries that we desire the theory to have.
6.1 Quantum electrodynamics
Consider, for example, quantum electrodynamics (QED). This is a theory containing a
spin-half Dirac ﬁeldψ (the electron) and a vector (helicity-one) ﬁeldAµ (the photon). We
insist that the theory possess the local (gauge) symmetry
ψ→ eieα(x)ψ, A µ→ Aµ− ∂µα. (6.1)
This together with Lorentz invariance, ﬁxes the form of the Lagrangian to be
LQED = ψ(i /D− m)ψ− 1
4 FµνF µν, (6.2)
provided we allow terms which are at most cubic in the ﬁelds (the reasons for this will
be discussed in the next Section). Recall that thecovariant derivative is given byDµ =
∂µ + ieAµ and thatFµν = ∂µAν− ∂νAµ. The theory has just two free parameters, the mass
m of the electron and the electron chargee (n.b. e < 0). Note how a mass term for the
photon,∼ AµAµ, which is allowed by Lorentz invariance, is forbidden by gauge invariance.
We now claim that a valid set of Feynman rules (in momentum space) for computing
the matrix element,iM, in QED are as follows.
1. The basic building blocks of Feynman diagrams are: a photon propagator, an electron
propagator, and an electron-photon-electron interaction vertex, as shown in Fig 3.
(The arrow on the electron propagator denotes the direction of particle number ﬂow.
It is conserved at a vertex, meaning arrows never clash.)
2. Draw all possible diagrams containing these elements with the required initial and
ﬁnal states, with the number of vertices ﬁxed by the desired order of perturbation
theory.
3. Assign momenta to the various internal lines so that the 4-momentum is conserved
at each vertex.
4. For each internal photon line with 4-momentumq, associate the propagator−igµν
q2+iϵ.
For an external in(out)-going photon of polarizationP, assign the factorϵP
µ (ϵ∗P
µ ).
5. For each (in)outgoing electron, assign a factor(us)us. For each (in)outgoing positron,
assign a factor(vs)vs. For each internal propagator with momentumq in the direction
of the arrow, write i
/q−m+iϵ. For each vertex, write−ieγµ.
– 36 –


## Page 39

= −igµν
q2 + iϵ (6.3)
= i
/q− m + iϵ (6.4)
=−ieγµ (6.5)
Figure 3. Feynman rules for QED.
6. Any loop in a diagram will have an unﬁxed 4-momentum,k. Integrate over it with
measure
∫ d4k
(2π)4.
7. Fret about the overall sign.
The last rule perhaps requires some further clariﬁcation. Since fermions anticommute, it
happens that diﬀerent diagrams contributing to the same amplitude have a relative minus
sign (the overall sign is not important, because we always take the modulus squared of the
amplitude). The sign can be easily ﬁgured out by going back to canonical quantization and
studying the positions of the fermion operators. In particular, it turns out that any closed
loop of fermions will always contribute a minus sign.
These rules should make sense to you after what we have done so far and we shall not
make an exhaustive derivation of them. In particular, we have written the propagator for
the photon as−igµν
q2+iϵ, when in fact the propagator is undeﬁned until we deal with the gauge
ﬁxing. For a proper treatment, see the textbooks.
Asanexercise, youshouldtrytocomputetheamplitudeforelectron-electronscattering,
at order e2. Hint: there are two diagrams and you need to worry about the relative sign.
You can ﬁgure it out by going back to canonical quantization and moving the creation and
annihilation operators around.
6.2 Janet and John do group theory
We have been going on and on about the central rôle played by symmetry in QFT. You
surely know by now that the correct mathematical language in which to study symmetry is
called group theory,34 and so it is proper that we discuss how group theory enters in QFT.
34Funnily enough, most of the group theory used by physicists is actually called representation theory by
mathematicians.
– 37 –


## Page 40

Figure 4. Probably you are far too young to ﬁnd this amusing. Never mind.
The reason I have held oﬀ mentioning group theory until now is that, unfortunately,
the group theory that you learnt in Part IB is not the sort of group theory that will pass
muster here. The key diﬀerence is that whilst you learnt all about discrete groups, of ﬁnite
order, we shall only be interested in continuous groups, of inﬁnite order. The ones we are
interested in are calledLie groups.35
Let’s start slowly, by seeing how group theory appears in QED. The symmetry is
ψ→ eieα(x)ψ, or in the global case,ψ→ eieαψ. This is a continuous symmetry, because
every value ofα∈ [0, 2π] corresponds to a diﬀerent symmetry transformation. In contrast,
if we allowed only, say,α∈{ 0, π}, we would have the discrete symmetryZ2.
Thereis, bytheway, agoodreason whyweareonlyinterestedincontinuoussymmetries
for gauge theory. The reason is that to promote a global symmetry to a gauge symmetry,
α→ α(x), the derivative∂α(x) needs to be well-deﬁned, since it appears in the rule for the
transformation of the gauge ﬁeld.
Getting back to QED, we note that U ≡ eieα can be thought of as 1 x 1 matrix.
Moreover, it is a unitary matrix, in thatU†U = e−ieαeieα = 1. We are thus entitled to say,
somewhat pompously, that QED is aU(1) gauge theory.
Backinthegoodolddays, 36 theonlyparticlesknockingaroundwereelectrons, positrons
and photons (well, and nuclei), and QED described all these quite nicely. But then someone
had the misfortune to discover (in cosmic rays) a new particle called the muon. It is rather
heavier that the electron (about 200 times), but it was straightforwardly incorporated into
35As always our level of rigour will be embarassingly low. For a more thorough treatment, you could
start by reading [8].
36This was a time when the Cavendish could be said to have had something of a monopoly on particle
physics, having discovered both the neutron and the electron and Dirac having predicted the positron. It is
probably stretching it a bit far to claim that Newton’s corpuscular theory of light pre-empted the photon,
however. It certainly pre-dated the Cavendish, in any case.
– 38 –


## Page 41

QED. Indeed, consider two ﬁeldsψ1 and ψ2, transforming as
ψ1→ eie1α(x)ψ1, ψ 2→ eie2α(x)ψ2. (6.6)
Then we can write down the locallyU(1) invariant Lagrangian
LQED = ψ1(i /∂− e1 /A− m1)ψ1 + ψ2(i /∂− e2 /A− m2)ψ2− 1
4 FµνF µν, (6.7)
which describes two particles, each of arbitrary mass and charge, coupled to the photon. In
a sense, this Lagrangian asks more questions than it answers, since it allows both particles
to have arbitrary mass and charge, whereas experiment showed that the charge of the muon
is exactly the same as that of the electron. In the intervening decades, we have managed to
discover many new particles andall of them have charges with are integer multiples ofe
3.
Neither QED nor indeed the Standard Model explains this basic feature of Nature, but we
shall see later on how it might be explained in the context of agrand uniﬁed theory.37
This way of thinking about QED as a theory based on the groupU(1) begs the question
ofwhetheritmightbepossibletobuildagaugetheorybasedonalargersymmetrygroup, for
example theN× N unitary matrices,U(N). This question was answered in the aﬃrmative
by Yang and Mills in the ’50s, who showed that the resulting theory is far richer than QED,
but it took a long time for us to realise that Nature actually chooses to do things this way.
By now, the pendulum has come full circle, in that our current ‘theory of everything’ (the
Standard Model of particle physics) is nothing but a gauge theory.38
The basic reason why gauge theories can be much richer (read: harder to answer exam
questions on) than QED is that QED is anAbelian theory.39 That is, two successiveU(1)
transformations commute (it is, after all, just the product of two complex numbers). But
two N× N matrices do not commute, in general, and so we have the possibility of a
non-Abelian theory. Let’s consider unitary matrices in more detail.40 A generic unitary
matrix U can be re-written as eiH, where H is an Hermitian matrix,H† = H, and the
exponential is deﬁned by the power series. Since this is a continuous group, and since every
group contains the identity element1 = e0, we may consider elements that are close to the
identity, writing them in terms of a basis for HermitianN× N matrices,{T a} and some
real parametersϵa. For elements close to the identity, theϵa are small, and we may expand
eiϵaTa
= 1 + iϵaT a + . . .. Now consider two elements (parameterised byϵa and ηa) and
compute41
eiϵaTa
eiηbTb
e−iϵaTa
e−iηbTb
= 1− ϵaηb[T a, T b] + O(ϵ2, η2, ηϵ). (6.8)
37Even if we could explain the muon charge in this way, nobody yet has a good explanation for why the
muon, a heavy cousin of the electron, exists at all. Do you?
38The moral of this story is that if you have a theory that is too elegant not to be true, but doesn’t seem
to be realised in Nature, you just need to be patient.
39The ‘A’ in Abel is pronounced as in ‘gargle’.
40It will turn out that all of the groups that we consider can be written in terms of unitary matrices, so
there is no loss of generality.
41This corresponds to the ‘diﬀerence’ between the product and its reverse, so will vanish for an Abelian
group.
– 39 –


## Page 42

This is a product of group elements and so must itself be a group element (by the axiom of
closure). Since{T a} form a basis, it must be possible to write
[T a, T b] = if abcT c, (6.9)
for some real constants f abc, which are manifestly antisymmetric in the ﬁrst two indices
and in fact may be taken to be antisymmetric in all three. This type of structure is called
a Lie algebra. The arguments we just made apply equally for a subgroup of the unitary
matrices, for which theT a form a basis for the relevant subalgebra. We call the number of
basis elements thedimension of the Lie algebra. ForN× N unitary matrices, for example,
a basis for theN× N Hermitian matrices containsN 2 elements.
The algebra is a much simpler object to work with than the group itself. (Locally, in
the vicinity of the identity element, the two are equivalent, but we shall see that groups with
the same algebra can have a distinct global structure. Everything we will say applies at the
level of the algebra.) Remarkably, just from the form of the relation (6.9), it is possible to
classify all of the possible Lie algebras. They are built from building blocks consisting of
three inﬁnite series, corresponding to: N× N unitary matrices (which can be thought of
as matrices such thatU†δU = δ) with unit determinant, calledSU (N); N× N orthogonal
matrices (which can be thought of as matrices such thatU T δU = δ) with unit determinant
(called SO(N)); and2N×2N matrices satisfyingU T ΩU = Ω, withΩ =
(
0 In
−In 0
)
(called
Sp(2N)).42 On top of these three inﬁnite series, there are ﬁveexceptional algebrascalled
G2, F4, E6, E7, and E8. The subscript denotes the rank of the Lie algebra, which is the
maximal number of commuting generators that one can ﬁnd. If you are lucky, you may
never need to worry about the exceptional algebras, though they do crop up in grand uniﬁed
theories and in string theory.
The algebra (6.9) is also suﬃciently strongly constraining to determine the possible
representationsthat each Lie algebra has. Recall that a representation is any set of matrices
that respects the multiplicative structure of the group (or, equivalently, the algebra (6.9)).
Recall too that representations can be divided up into those that arereducible and those
that areirreducible(henceforth, ‘irreps’), meaning that they cannot be further decomposed.
Representations are important for gauge theories, because it turns out (as we shall see) that
matter (such as the electrons of QED) must transform in some representation of the gauge
group.
Some representations are easy to ﬁnd. For example, forSU (N) we have thedeﬁning
representation carried by vectors inCN, on which theN×N matrices act by multiplication.
It turns out that one can build all of the other representations by taking tensor products of
this (together with its complex conjugate representation) and decomposing into irreps and
we shall do things in that way.SO(N) similarly has a deﬁning representation on vectors in
RN, but it is not possible to obtain all irreps from tensor products of this: one misses the
42In this picture, the Lorentz group consist of matrices such thatUT ηU = η, withη = diag(1,−1,−1,−1).
This group is calledSO(3, 1). Though clearly related, it does not appear in our classiﬁcation because it
cannot be represented by (ﬁnite-dimensional) unitary matrices.
– 40 –


## Page 43

spinor representations. You have already met these before in QM, in the form of the spin-1
2
(or doublet) representation of angular momentum operators, which are nothing but the Lie
algebra corresponding to the groupSO(3) of spatial rotations. We also met spinors in the
context of the Lorentz groupSO(3, 1), for which the Dirac ﬁeld comes in a 4-dimensional
spinor representation, whereas a gauge ﬁeld comes in the vector representation (which is
also 4-dimensional, but inequivalent to the spinor).
One representation, called theadjoint, is especially important, and is present for every
Lie algebra. To ﬁnd it, we note that the Lie algebra (6.9) implies theJacobi identity
[T a, [T b, T c]] + cyclic permutations = 0 , (6.10)
whichyoucanconﬁrmbysimplyexpanding. But [T a, [T b, T c]] = if bcd[T a, T d] =−f bcdf adeT e
and so
f bcdf ade + f abdf cde + f cadf bde = 0. (6.11)
So far this is just mindless algebra, but if we deﬁne(T a
adj)bc≡− if abc, we see that we can
recast this as
[T a
adj, T b
adj] = if abcT c
adj. (6.12)
That is, the matricesT a
adj form a representation of the algebra! This representation exists
for any Lie group and is called theadjoint representation. The dimension of the adjoint
representation is the same as the dimension of the Lie algebra itself. As examples,SU (N)
is generated by traceless, Hermitian matrices, and so has dimensionN 2− 1; SO(N) is
generated by antisymmetric, Hermitian matrices, and so has dimensionN
2 (N− 1).
One last point: the algebra (6.9) implies that the overall normalization of the generators
in any representation is ﬁxed, once we have decided on the normalization for thef abc, or
equivalently the generatorsT a
adj. This is the underlying reason why charges are quantized
in non-Abelian gauge theories.
6.3 Non-Abelian gauge theory
Suppose we wish to build a non-Abelian gauge theory with gauge groupG with matter
transforming in repr of G. Under a globalG transformation, the matter ﬁelds (fermions,
say) transform as
ψ→ U ψ≡ eigαaTa
r ψ. (6.13)
Remember that each T a
r is really an nr× nr matrix, where nr is the dimension of the
representation r. Thus ψ is really a vector of dimensionnr, but we write everything in
matrix notation to avoid drowning in a sea of indices.43 For nowg is just a constant, but
it will become the gauge coupling (liee in QED). To have a chance of promotingG to a
local symmetry (such thatαa→ αa(x), we need a derivative which tranforms covariantly.
43Don’t forget thatψ is also a spinor of the Lorentz group. Agh!
– 41 –


## Page 44

Following our noses, we assume that this takes the same formDµ = ∂µ + igAµ, as in QED
and deduce howA must transform (Aµ→ A′
µ), in order thatDµψ→ U Dµψ. We ﬁnd that
∂µ + igA′
µ = U(∂µ + igAµ)U−1. (6.14)
But since ∂µU−1 = U−1∂µ + (∂µU−1) (remember that this is an operator relation), we ﬁnd
that
A′
µ = U AµU−1− i
g U ∂µU−1 = U AµU−1 + i
g (∂µU)U−1. (6.15)
Note that for QED, where everything commutes, we recoverAµ→ Aµ− ∂µα.
It is clear that Aµ is an nr× nr matrix, but the transformation law for the gauge
ﬁeld may be deﬁned in a way that makes no reference to the representationr. Writing
Aµ≡ Aa
µT a
r and considering an inﬁnitesimal transformation, we ﬁnd that (exercise)
A′a
µ = Aa
µ− ∂αa− gf bcaαbAc
µ. (6.16)
So, the transformation of theAa is ﬁxed solely by the structure constantsf abc and indeed,
apart from the derivative term,Aa obeys the transformation law for a ﬁeld in the adjoint
representation. This is hardly surprising, given that the number of ﬁeldsAa is equal to the
dimension of the Lie algebra.
We have not yet completed our formulation of the gauge theory, because we have no
dynamical terms for the gauge ﬁeld in the action. In QED, we found the gauge-invariant
ﬁeld strength tensor Fµν by inspection, but here we shall have to be more clever. To ﬁnd
an analogue of the ﬁeld strength tensor, we use the covariance propertyDµ→ U DµU−1 of
the covariant derivative. This means that[Dµ, Dν] also transforms covariantly. Call this
igF a
µνT a
r (which amounts to an implicit deﬁnition ofF a
µν. Now,
[Dµ, Dν] = ig([Aµ, ∂ν] + [∂µ, Aν])− g2[Aµ, Aν] = ig(∂µAν− ∂νAµ)− g2[Aµ, Aν]. (6.17)
We now expandAµ = Aa
µT a
r (recall that r is any representation) and use the Lie algebra to
get (exercise)
F a
µν = ∂µAa
ν− ∂νAa
µ− gf abcAb
µAc
ν. (6.18)
ThisisabitliketheQEDﬁeldstrengthtensor, exceptthatitisnotgaugeinvariant(ittrans-
formscovariantly)anditisnotlinearintheﬁelds. But 1
2g2 tr[Dµ, Dν][Dµ, Dν] =− 1
4 F a
µνF aµν
is gauge invariant and is the appropriate generalization of the Maxwell Lagrangian. But
note that it necessarily contains terms that are cubic and quartic in the gauge ﬁelds. Thus,
a non-Abelian gauge theory (unlike QED) automatically contains self-interactions of the
gauge ﬁeld! Physically, the diﬀerence with QED is easy to understand: in QED, the gauge
ﬁeld does not transform under a globalU(1) transformation, so we think of it as uncharged;
in a non-Abelian gauge theory, the gauge ﬁeld itself transforms as an adjoint under a global
G transformation, so carries charge, so couples to itself.
– 42 –


## Page 45

6.4 The strong nuclear force: quantum chromodynamics
It is the self interactions of the gauge ﬁeld that give rise to much of the aforementioned
richness of non-Abelian gauge theory and indeed much of the richness of the world around
us. As our ﬁrst example, it was convincingly demonstrated in the 1970s and 1980s that the
strong nuclear force is actually anSU (3) gauge theory, calledquantum chromodynamicsor
QCD. There areN 2− 1 = 8 gauge bosons, which we callgluons, which couple to fermions,
whichwecall quarks, whichtransforminthedeﬁning3-dimensionalrepresentationof SU (3).
The three diﬀerent values for the index are sometimes labelled by diﬀerent colours (red,
green, and blue), hence the namechromodynamics. It turns out that there is more than one
quark (they are called diﬀerentﬂavours), all transforming as colour triplets. The diﬀerent
ﬂavours are calledup, down, strange, charm, bottom, and top, in order of increasing mass.
The QCD Lagrangian is thus given by
LQCD =−1
4 Ga
µνGaµν +
∑
f∈{u,d,s,c,b,t}
ψ
(
i /∂− gs /Aa λa
2 − mf
)
ψ. (6.19)
Here, theGell-Mann matrices
λ1 =


0 1 0
1 0 0
0 0 0

 , λ 2 =


0−i 0
i 0 0
0 0 0

 , λ 3 =


1 0 0
0−1 0
0 0 0


λ4 =


0 0 1
0 0 0
1 0 0

 , λ 5 =


0 0−i
0 0 0
i 0 0

 , λ 6 =


0 0 0
0 0 1
0 1 0


λ7 =


0 0 0
0 0−i
0 i 0

 , λ 8 = 1√
3


1 0 0
0 1 0
0 0−2


provide an explicit basis for the deﬁning triplet representation. Note that it is conventional
to denote the gluon ﬁeld strength byGa
µν and the strong coupling constant bygs. The
Feynman rules are given in Fig. 5. Actually, they are not really the Feynman rules. The
subtleties of gauge-ﬁxing in non-Abelian theories (which we have completely circumvented)
mean that one needs to modify the rules in general. But the rules we give suﬃce for
tree-level computations (that is, diagrams without loops of propagators).
Now, it turns out (for reasons that will become clearer later on) that the force between
two quarks – the analogue of the Coulomb interaction in QED – is strong at low energies.
So strong, in fact, that it is physically impossible to isolate a single quark. Rather quarks
are conﬁned in nuclei. This ‘explains’ at a stroke both why we have never seen a single
quark in the laboratory and why it took so long to establish QCD as the correct theory of
the strong nuclear force: the force is so strong at the relatively low energy scales of nuclear
physics that we are well beyond the realm of perturbation theory. In fact, nobody has yet
managed to start from the Lagrangian of QCD and show analytically that it predicts the
– 43 –


## Page 46

Aa
µ Ab
ν =−igµνδab
q2 + iϵ (6.20)
qi qj = iδij
/q− m + iϵ (6.21)
qi qj
Aaµ
=−igsγµ λa
ij
2 (6.22)
Aaµ(p)
Abν(q)
Acλ(r) =−gsf abc(ηµν(p− q)λ + ηνλ(q− r)µ + ηλµ(r− p)ν)
(6.23)
=−ig2
s[f eacf ebd(ηµνηλρ− ηµρηνλ) (6.24)
Aaµ
Abν
Acλ
Adρ
+ f eadf ebc(ηµνηλρ− ηµληνρ) (6.25)
+ f eabf ecd(ηµληνρ− ηµρηνλ)] (6.26)
Figure 5. Feynman rules for QCD. All momenta are deﬁned to be ingoing.
conﬁnement of quarks in nuclei. We have strong indications from numerical simulations
that it is so, but we do not have a proof.44
The ﬂipside of this (and the reason we know that QCD must be the correct theory of
the strong nuclear force) is that QCD is perturbative at high energies (like at the LHC),
so we can use the formalism we have already developed there. For example, the relevant
Feynman diagram for computing the amplitude for scattering two quarks of distinct ﬂavours
(e.g. an up quark and a down quark) is shown in Fig. 6. Compared to the analogous QED
44If you think you have found a proof, scribble it down and send it oﬀ to these people:http://www.
claymath.org/millennium/Yang-Mills_Theory/. If they think you are right, they will send you back a
cheque for a million dollars.
– 44 –


## Page 47

qi
q′k
qj
q′l
Figure 6. Feynman diagram for scattering of quarks of diﬀerent ﬂavours.
+ + (6.29)
Figure 7. Feynman diagrams for quark-gluon scattering.
scattering the only diﬀerent factor in the matrix element is the representation matrix, so
that
MQCD = T a
ijT a
klMQED, (6.27)
where i, j, k, and l are colour indices. To get the cross-section for unpolarized scattering,
we need to average over the initial colours and sum over the ﬁnal state colours. In all, we
get
σQCD
σQED
= 1
3· 3
∑
i,j,k,l
T a
ijT a
kl(T b
ijT b
kl)∗ = 1
9(trT aT b)2 = 2
9 . (6.28)
The analogue of Compton scattering in QED, quark-gluon scattering, is more complicated,
because the three-gluon vertex comes into play. Fig. 7 shows the contributing diagrams at
leading order.
6.5 The weak nuclear force and SU (2)× U(1)
Having built a gauge theory for the strong nuclear force, we now try to build a gauge
theory for the weak nuclear force. We’ll try to do this in the same way as our ancestors
did, piecing together the experimental facts one by one. This makes for a longer and more
arduous journey, but I think it is far more instructive than presenting the ﬁnal theory as a
fait accompli.
So, what do you know about the weak force? The one thing you should know, is that
it is responsible for things likeβ decay, in whichn→ p + e + ν. Our theory of the strong
force tells us that a proton is basically made up of two up quarks and a down quark and
that the neutron is made up of two downs and an up, so at a more fundamental level,β
decay involves u→ d + e− + ν. How could we describe this using a non-Abelian gauge
– 45 –


## Page 48

theory? Suppose we regard this process as occurring via exchange of a gauge boson. In
a non-Abelian theory, the eﬀect of a gauge boson vertex is to take one component of a
ﬁeld carrying some representation and to change it to another (as an example, in QCD, the
quark colour is changed when it interacts with a gluon). Since baryon and lepton number
are conserved to a very good degree in Nature, we expect that the gauge boson should turn
an up quark into a down quark at one vertex (conserving quark or baryon number) and turn
an electron into a neutrino at the other (conserving lepton number). Our representations
must contain at least two elements (since one particle gets turned into a diﬀerent one at a
vertex). Are there any reps which containonly two elements? There is one, which is the
fundamental (deﬁning) representation of the simplest non-Abelian Lie group,SU (2). Let’s
try to build a theory of the weak interactions usingSU (2). Fortunately (though you may
not know it), you are already quite good at doingSU (2) group theory. The reason (already
mentioned above) is that symmetry under spatial rotations corresponds to the groupSO(3)
(orthogonal rotations in 3 dimensions), but the Lie algebra ofSO(3) is exactly the same
as the Lie algebra of SU (2). (Remember we said before that two Lie groups can have
the same Lie algebra? Well, here’s an example.) This means that the theory of angular
momentum in QM (recall that angular momentum operators are really the Lie algebra of
spatial rotations) is really just the representation theory ofSU (2). So, for example, the
smallest rep is of dimension two (you call it spin-half) and the generators in that rep are
just given by the Pauli matrices (divided by two, in the usual normalization convention
trT aT b = δab
2 ). Another way of seeing why the Pauli matrices appear is to note that the
Lie algebra of SU (2) should be represented by a basis for2× 2, traceless (because of the
‘S’ in SU (2)), Hermitian (because of the ‘U’ in SU (2)) matrices. The Pauli matrices
σ1 =
(
0 1
1 0
)
, σ 2 =
(
0−i
i 0
)
, σ 3 =
(
1 0
0−1
)
(6.30)
are just that. With the Pauli matrices in hand, we can easily work out the Lie algebra of
SU (2). It is (exercise)[ σi
2 , σj
2 ] = iϵijk σk
2 .
Denoting the SU (2) gauge ﬁeld byW i
µ, the covariant derivative for the 2-dimensional
rep is then given by
Dµ = ∂µ + i g
2 W i
µσi = ∂µ + i g
2
(
W 3
µ W 1
µ− iW 2
µ
W 1
µ + iW 2
µ −W 3
µ
)
= ∂µ + i g
2
(
W 3
µ
√
2W +
µ√
2W−
µ −W 3
µ
)
,
(6.31)
where we have deﬁned a complex gauge ﬁeldW±
µ ≡ 1√
2(W 1
µ∓ iW 2
µ) (the
√
2 is included so
that we get the usual normalization for the kinetic term of a complex ﬁeld). The reason
for introducing W±
µ becomes clear when we package the quarks and leptons up intoSU (2)
doublets l ≡
(
ν
e
)
and q ≡
(
u
d
)
: the part of the Lagrangian involving the covariant
derivative
L⊃ li /Dl + qi /Dq (6.32)
– 46 –


## Page 49

contains interactions like ig
√
2ν /W +e− and the± superscript on W±
µ is just the electric
charge (which is conserved) carried by the gauge boson. Even more satisfyingly, recall from
our discussion of charge conjugation that a matrix gauge ﬁeld should transform into minus
its transpose. This sendsW±
µ → W∓
µ , meaning that the particle is sent into its antiparticle,
as we expect.
Thisisstartingtolooklikeagoodmodelforweakinteractions, butnowweencounterits
ﬁrst big ﬂaw. The ﬂaw is that it was observed in the 1950s by Madam Wu and collaborators
(at the suggestion of Lee and Yang) that the weak interactions do not conserve parity. That
is to say, the Lagrangian is not invariant under the spatial inversionx→− x. This result
shocked the physics community. Hitherto, no one had really bothered to question the status
of such symmetries; with the discovery that they were in fact broken, the race was on to
ﬁnd out how and why.45
6.6 Intermezzo: Parity violation and all that
To understand how parity can be violated in a gauge theory, we need to go back and work
out how to implement parity in a theory containing fermions. This is not too diﬃcult. Start
with the Dirac equation
(iγ0∂t + iγi∂i− m)ψ = 0 (6.33)
and premultiply byγ0. Now, γ0 commutes with itself, but anticommutes withγi. Thus
(iγ0∂t− iγi∂i− m)γ0ψ = 0 (6.34)
and ψ′(t,−xi)≡ γ0ψ(t, xi) satisﬁes the Dirac equation in a space-reﬂected Universe (where
∂i→− ∂i).
We want to know how to write down a Lagrangian that violates parity, but is still
Lorentz invariant. It is easy to show that the Lorentz invariant terms we have been writing
down, like ψψ and ψ /∂ψ, are also parity invariant. For example,
ψψ→ ψ
′
ψ′ = ψ†(γ0)3ψ = ψψ. (6.35)
As an exercise, you can now show parity invariance ofψ /∂ψ. But if we introduce the matrix
γ5≡ iγ0γ1γ2γ3, (6.36)
45At the same time, a race began to determine the status of similar symmetries like time reversal in-
variance and charge conjugation. In turns out that none of these symmetries is sacrosanct in QFT (and
surprise, surprise, none is sacrosanct in nature), though the combined operation ofCP T is. CP violation
is particularly interesting in that the Standard Model gives a very good description of allCP violation ob-
served in experiments up until now, but it is also known that amount ofCP violation in the SM is too small
to explain the predominance of matter over antimatter that we see in the Universe. This predominance
should be pretty important to you, because you would not be here without it — your proto-self would long
ago have annihilated with your anti-self.
– 47 –


## Page 50

(equal to
(
−1 0
0 1
)
in the chiral basis), we ﬁnd that it anticommutes withγµ. Hence, objects
like ψγ5ψ and ψγ5 /∂ψ are odd under parity.46 For example,
ψγ5ψ→ ψ
′
γ5ψ′ = ψ†(γ0)2γ5γ0ψ =−ψγ5ψ. (6.37)
Exercise: show parity oddness ofψγ5 /∂ψ.
These considerations have even more far reaching consequences than mere parity vi-
olation. The combinations PL,R ≡ 1
2(1∓ γ5) have the properties of a set of projection
operators when acting on a Dirac fermionψ.47 We deﬁneψL,R≡ PL,Rψ and call them left-
and right-handed fermions.48 Let’s now write the Dirac Lagrangian in terms ofψL,R. We
get49
L = i(ψL /∂ψL + ψR /∂ψR)− m(ψLψR + ψRψL). (6.38)
This rendering makes two points clear. The ﬁrst point is that, for massless fermions,
we could write a Lagrangian using just ψL (or ψR) alone. Such a theory describes a
massless Weyl fermion. Note that there are only two degrees of freedom (corresponding
to a particle spinning one way and an antiparticle spinning the other way). It violates
parity, but not Lorentz invariance. There is, furthermore, nothing to stop us promoting the
derivative to a covariant derivative and making a gauge theory involving Weyl fermions.
The second (related) point is that even in a theory which containsboth left- and right-
handed components, we can assign the diﬀerent components to diﬀerent representations of
the gauge group. But if we do so, the mass term (which couples left to right) will no longer
be gauge invariant.
There is a third point, which is not relevant to our present discussion, but which will
be relevant when we discuss neutrino masses. The point is that we can write a diﬀerent
mass term for a Weyl fermion,ψL say, called aMajorana mass term. It takes the form
L⊃− 1
2 mψT
L CψL + h. c., (6.39)
46Smart alecs will sniﬀ that we have not shown Lorentz invariance ofψγ 5ψ , to which my churlish retort
is that we never showed Lorentz invariance ofψψ either. And so the house of cards collapses. . .
47A set of projection operators should add up to the unit operator (PL + PR = 1), should be orthogonal
(PLPR = 0), and should be idempotent (P 2
L,R = PL,R), so that repeated projections have no further eﬀect.
48Why left- and right-handed? Well, consider the limit in which a fermion is massless and moving in the
+z direction. The Dirac equation in the chiral basis is just/pψ = 0 =⇒
(
0 E(1 + σ3)
E(1− σ3) 0
)
ψ = 0.
Now γ5 is diagonal in this basis (which is why we chose the basis in the ﬁrst place), and soψL has only the
top two components non-vanishing, whilstψR has only the bottom two components non-vanishing. We ﬁnd
that the Dirac equation implies thatψL∝
(
0 1 0 0
)T
and ψR∝
(
0 0 1 0
)T
. But these are eigenstates of
the spin operatorΣi =
(
σi 0
0 σi
)
, spinning opposite to, and along, the direction of motion, respectively.
49One has to be a bit careful with the notation here, because(ψL) = ψ†
Lγ0 = ψ† 1−γ5
2 γ0 = ψ†γ0 1+γ5
2 ≡
(ψ)R.
– 48 –


## Page 51

where C = iγ2γ0 is called the charge conjugation matrix (sinceψ→ Cγ 0ψ∗ is nothing but
charge conjugation) and the ‘+h. c.’ instructs us to add the Hermitian conjugate term to
make the action real. Note that onlyψL is required. The ﬂipside is thatψL is coupled to
itself, rather than to its complex conjugate. Thus this term is not invariant under aU(1)
phase rotationψL→ eiαψL and cannot describe a particle carrying electromagnetic charge.
It could describe a neutrino, however.
When we come to study grand uniﬁcation, it will be useful to know that charge con-
jugation switches a left handed ﬁeld to a right-handed ﬁeld.50 Thus we can replace any
right-handed ﬁeld by its charge conjugate and consider all ﬁelds as being left-handed.
6.7 Back to the weak interactions
Now we know how to violate parity, we can incoporate it into the weak interactions. We
do it by declaring that only the left-handed parts of the quarks and leptons couple to the
W µ via SU (2). (This introduces a further problem of how the quarks and leptons can
have a mass, which we shall only be able to solve after another intermezzo.) This can be
straightforwardly implemented in the Feynman rules by including a projection factorPL in
the vertex.
So far, we checked thatW±
µ could be the culprit behindβ decay. But what aboutW 3?
Could it be theZ boson? From (6.32), we ﬁnd the couplingsig
2 /W 3(νLνL− eLeL). This is a
bit like theZ boson, but unfortunately it turns out that theZ also couples to right-handed
quarks and leptons.51 Quel chagrin!
Salvation comes by noticing that there are two neutral bosons in Nature: theZ boson
and the photon. Both couple to left- and right-handed fermions. But could it be that they
are mixtures ofW 3
µ (which couples to only left-handed fermions) and a secondU(1) boson
(call it Bµ) which couples to both left and right-handed fermions?
Before we go further, it is useful to pause and appreciate what this means. The sug-
gestion is that the weak force and electromagnetism are not distinct phenomena, but are
somehow mixed up in a uniﬁedelectroweak theory. The claim is that these two forces, which
manifest themselves completely diﬀerently to our eyes (quite literally), are really diﬀerent
aspects of the same thing. Gadzooks!
Let’s see how it works. We put the left handed fermions in doubletsqL and lL of SU (2)
as before (and call the coupling constantg) and also give them each a charge, calledweak
hypercharge Yq,l, under aU(1) phase transformation gauged byBµ (for which the coupling
constant is denotedg′). We make the right-handed fermionsuR, dR, eR52 singlets of SU (2)
(meaning they don’t transform) and give them weak hyperchargesYu,d,e. We then demand
that the physical gauge boson eigenstatesAµ and Zµ be some mixture ofW 3
µ and Bµ, such
50Proof: γ2PL = PRγ2 . . .
51You might wonder how we know this. A direct way is to produce polarised electrons and positrons and
scatter them oﬀ each other.
52We discuss the possibility of aνR later on.
– 49 –


## Page 52

that
W 3
µ = cos θW Zµ + sin θW Aµ, (6.40)
Bµ =− sin θW Zµ + cos θW Aµ. (6.41)
Here θW is theWeinberg angle. Roughly, sin2 θW = 0.231.
Now we try to work out what the charges must be. On the one hand, the covariant
derivative for the right handed fermions contains a piece
L⊃− ψRg′Yψ /BψR⊃− ψRg′ cos θW Yψ /AψR. (6.42)
Thus we have no choice but to identifyg′ cos θW with the electric charge|e| and Yψ with
the electric charge of that particle. Thus53
Ye =−1, Y u = +2
3 , Y d =−1
3 . (6.43)
On the other hand, the covariant derivative for the left-handed fermions contains a piece
L⊃− ψL(g σ3
2
/W 3 + g′Yψ /B)ψL⊃− ψL(g sin θW
σ3
2 + g′ cos θW Yψ) /AψL. (6.44)
Now, both l and q doublets contain two states whose electric charges diﬀer by one (in units
of e). This can only happen here if we setg sin θW =|e|. Furthermore, we can only get the
absolute values of the charges right if we setYq = + 1
6 and Yl =− 1
2.
Thus we are able to ﬁx everything up so that the photon couples in the same way to
left- and right-handed ﬁelds (and with the correct charge for each particle). This brings us
back to our original, parity-invariant theory of QED. But the couplings of theZµ are not
the same for left and right. Speciﬁcally the charges are (exercise)
g cos θW I3− g′ sin θW Y = |e|
sin 2θW
(I3− Q sin2 θW ), (6.45)
where I3 = 0,± 1
2 is the weakisospin (the eigenvalue of the thirdSU (2) generator) and Q
is the electric charge in units of|e|.
Yet again, you may or may not have noticed an elephant in the room and the time has
come to chase it out. The elephant is manifest in two ways. The ﬁrst way is that we have
put left and right fermions in diﬀerent representations ofSU (2)× U(1). This forbids us
from writing a mass term for fermions, contrary to what we observe in Nature.54
The second way is that we claimed to have made a conceptual breakthrough in mixing
neutral gauge ﬁelds to obtain the physical photon and theZ boson. This is nonsense,
because we never speciﬁed what we meant by physical.
The resolution to both of these problems lies in what is apparently a third problem
- our theories of the weak force and electromagnetism are basically the same. Ok, the
53Oops! I didn’t tell you what the electric charges of the quarks are. But you can work it out for yourself
from the fact thatp∼ uud and n∼ udd.
54In fact, the top quark is the heaviest particle yet discovered!
– 50 –


## Page 53

charges and the symmetry groups are diﬀerent, but that turns out not to be a big deal.
This ﬂies totally in the face of what we observe in Nature. Speciﬁcally, the photon as far
as we are able to tell, is strictly massless, which translates to electromagnetism being a
long-range force. The weak interaction, on the other hand, is mediated over a very short
range, meaning that the corresponding gauge boson must have a mass (via the uncertainty
principle). We can even work out roughly what the mass should be. The Fermi constant
that describes beta decay has mass dimension minus two and value
10−5GeV−2, (6.46)
from which we infer a mass scale of about102GeV.
Uh oh! We said at the very beginning that gauge invariance forbids a gauge boson
mass. The particular kind of gauge invariance we have here (diﬀerent symmetry for left
and right fermions) also forbids fermion masses. How do we get all our masses back?
Enter the Higgs boson. The Higgs mechanism55 solves both of these problems via the
mechanism of spontaneous symmetry breaking. That is a big deal. It also predicts the
existence of the Higgs boson and we have spent several decades and several billion dollars
looking for it. And now, serendipitously, it would seem that the LHC has found it. Hurrah.
So, what is spontaneous symmetry breaking and what is the Higgs mechanism? Time
for another intermezzo.
6.8 Intermezzo: Spontaneous symmetry breaking
Let’s start simply. Consider a complex scalar ﬁeld, with the Klein-Gordon Lagrangian
L = ∂φ∗∂φ− m2|φ|2. (6.47)
This has a global symmetryφ→ eiαφ. We could also add an interaction, whilst maintaining
the symmetry, of the form−λ|φ|4. This is candidly calledphi-to-the-fourth theory and you
now know how to go and compute the eﬀect ofλ in perturbation theory. Let’s not bother.
Instead, let’s go back and think about the structure of the vacuum. The terms in the
Lagrangian which do not involve derivatives may be thought of as a potential for the ﬁeld,
of the form
V (φ) = m2|φ|2 + λ|φ|4. (6.48)
This potential has its minimum (which gives the classical vacuum) at the origin. That’s
why, back in the dark ages of canonical quantization, we started withφ = 0 and considered
ﬂuctuations about that point. Indeed, you can go back and verify that⟨0|φ|0⟩, which we
call thevacuum expectation value(VEV), vanishes.
What would happen ifm2 was actually negative? The global minima of the potential
would now be at points such that
|φ| =
√
−m2
2λ ≡ v√
2 (6.49)
55Conceived in the 1960s by a number of people, only one of whom is named Higgs, and only two of
whom were rewarded with the Nobel prize.
– 51 –


## Page 54

and we should quantize about one of those points instead.56 For our purposes though, it
is enough to think about what happens classically. Firstly, notice that (6.49) describes
not a single point in ﬁeld space, but rather a circle of points in the complex φ plane.
Any one of these points (which are degenerate in energy) could be the minimum. But
whichever point the theory picks, the symmetryφ→ eiαφ will be broken by the vacuum
conﬁguration. This is the phenomenon of spontaneous symmetry breaking.57 It has an
immediate consequence, which is that ﬂuctuations of the ﬁeld about the minimum in the
degenerate direction have no associated potential energy. So provided the wavelength of
the ﬂuctuations is large enough, the kinetic (and hence total) energy cost of the ﬂuctuation
will be small. This is formalized asGoldstone’s theoremand in Lorentz-invariant theories,
it means that spontaneous symmetry breaking always implies the existence of a massless
particle.
You can check that it works forφ4 theory right now. Choose the vacuum direction to
be along the realφ axis and expand
φ = 1√
2(v + φ1 + iφ2), (6.50)
where φ1,2 are real scalar ﬁelds. You should ﬁnd (by substituting in the Lagrangian and
picking out the quadratic terms — exercise) that φ1 has mass
√
−2m2 and that φ2 is
massless.
Now let’s ask what would happen if we had promoted the symmetryφ→ eiαφ to a
U(1) gauge symmetry,viz. α→ α(x). Then the Lagrangian would be
L = (Dµφ)∗Dµφ− m2|φ|2− λ|φ|4, (6.51)
with Dµ = ∂µ + ieAµ as always. This is called theAbelian Higgs model. When we allowφ
to have a VEV,⟨0|φ|0⟩ = v√
2, we ﬁnd the gauge boson mass term58
L⊃ + e2v2
2 AµAµ. (6.52)
So spontaneous breaking of a gauge ﬁeld gives rise to a gauge boson mass! There is some-
thing a bit ﬁshy here, which is that a massive vector boson has three polarizations (corre-
sponding to the three directions the spin can point it in its rest frame), whilst a massless
vector boson has only two (corresponding to whether its helicity is plus or minus). We
seem to have got a degree of freedom ‘for free’, just by ﬂipping the sign of a parameter in
the Lagrangian. This is not so. Indeed, we musn’t forget about the freedom to do gauge
transformations. In particular, there exists a transformation, given byα =− tan φ2
v+φ1
, in
which the degree of freedomφ′
2 (that was previously the Goldstone boson) of the gauge-
transformed scalar ﬁeld vanishes. This is nothing other than a choice of gauge ﬁxing, called
56Note that in quantum mechanics (or in QFT ind = 1 + 1), we would instead ﬁnd that the vacuum is
some linear superposition of states localized about each of the points. But QFT ind > 1 + 1is diﬀerent.
57Note that if you tried this trick for a fermion or a vector, rather than a scalar, you would end up
breaking Lorentz invariance as well.
58Note that this is a positive mass squared term in the potential for the spatial components of the gauge
ﬁeld.
– 52 –


## Page 55

the unitary gauge. Colloquially, we say that the massless Goldstone boson gets ‘eaten’ by
the gauge ﬁeld to become the third polarization of a massive vector ﬁeld.
All of this discussion generalizes directly to theories with non-Abelian symmetry group
G. Depending on what rep ofG the scalar ﬁeld comes in and depending on how the VEV is
aligned, the groupG will get broken to some subgroupH⊂ G. In the global version, there
will be as many massless Goldstone bosons as there are generators ofG (more precisely, its
Lie algebra) which are not inH. In the local (gauged) version, the gauge boson mass term
is given by
g2
2 v†T a
r T b
r vAµaAb
µ = (m2)ab
2 AµaAb
µ; (6.53)
gauge bosons which correspond to broken generators (T av̸= 0) become massive, whilst
those corresponding to unbroken generators remain massless.
We are now in a position to go back and work out the ﬁnal details of the weak inter-
actions. Before we do, you might be worrying that I am trying to pull the wool over your
eyes. I gave you gauge symmetry with one hand and I took it away with the other, by
breaking it. Aren’t we back where we started?
The answer is a resounding no. Actually, as we hinted earlier on, gauge symmetry is
not really a symmetry at all, or at least it is nomore of a symmetry than the underlying
global symmetry. One way to see this is to note there are no extra conservation laws that
appear once one gauges a symmetry. Rather, gauge symmetry is a convenientredundancy
of description, which can be got rid of by gauge ﬁxing.
Moreover, spontaneous symmetry breaking is not really a symmetry breaking. The
symmetry is still present, but acts on the physical degrees of freedom in a diﬀerent way. In
particular, for a globally symmetric theory, in the unbroken version, the scalar ﬁelds trans-
form linearly, like a representation:φ→ eiαφ. But in the ‘broken’ version, the Goldstone
boson transforms non-linearly: φ2→ φ2 + vα + . . .. So pedants say that the symmetry
is not broken, but rather is non-linearly realized. And they are right, as they usually are.
The symmetry still restricts the form of the Lagrangian and indeed allows us to have a
consistent theoretical description of a massive vector boson force-carrier.
6.9 Back to the electroweak interaction
Let’s now show what happens for the electroweak theory, a.k.a. the Standard Model. You
are probably getting tired of repeating the mistakes of your predecessors by now, so I will
just lay down the facts.
We have a gauge theory ofSU (2)× U(1), containing gauge bosonsW±
µ , W3
µ and Bµ.
We want to break things in such a way that theW±
µ , together with the combination of
W 3
µ and Bµ that we calledZµ, become massive, while the combinationAµ stays massless.
Clearly we need to break SU (2)× U(1) down to U(1), where the unbroken U(1) is the
‘right’ combination of the originalU(1) and a U(1) subgroup of SU (2). It can be done as
follows. Introduce a scalar ﬁeld (theHiggs ﬁeld), H, transforming as a doublet ofSU (2),
with hypercharge Y = 1
2. The Higgs potential takes the form
−µ2H†H + λ(H†H)2. (6.54)
– 53 –


## Page 56

This is minimized when
√
H†H≡ v√
2 =
√
µ2
2λ (6.55)
and we may choose, without loss of generality,
⟨H⟩ =
(
0
v√
2
)
, (6.56)
with v real. The covariant derivative
DµH = (∂µ + ig σi
2 W i
µ + i g′
2 Bµ)H (6.57)
then results in a gauge boson mass matrix
1
8
(
0 v
)(
gW 3
µ + g′Bµ
√
2gW +
µ√
2gW−
µ −gW 3
µ + g′Bµ
) (
gW 3
µ + g′Bµ
√
2gW +
µ√
2gW−
µ −gW 3
µ + g′Bµ
) (
0
v
)
(6.58)
or, using (6.40) together withcos θW = g√
g2+g′2 , sin θW = g′
√
g2+g′2
(gv)2
4 W +
µ W−µ + (g2 + g′2)v2
8 ZµZµ (6.59)
Taking into account the diﬀerent normalizations (the mass term ism2φ∗φ for a complex
ﬁeld but m2
2 φ2 for a real ﬁeld), we ﬁnd
mW = gv
2 , m Z =
√
g2 + g′2v
2 = mW
cos θW
, m A = 0. (6.60)
Miraculously, we ﬁnd massiveW and Z bosons, together with a massless photon. Moreover,
the theory predicts the ratio ofW and Z masses to be given bycos θW, in agreement with
experiment (mW = 80.2 and mZ = 91.2 GeV).59 Was it really a miracle? In many ways, no.
Once we ﬁxed the charges of the Higgs and of the fermions, we had no choice but to break
SU (2)× U(1) to electromagnetism (or not to break it at all). ThemW /mZ mass ratio
prediction is non-trivial, in that choosing a diﬀerent representation for the Higgs would
spoil it. Then again, choosing an arbitrary representation for the Higgs would not give the
right pattern of symmetry breaking. In the end, everything which appears miraculous can
be traced back to the choices of charges for the fermions and the Higgs. They are what they
are observed to be, but still the question remains of why Nature chose them that way. Why
for example, are all the hypercharges quantized in units of one-sixth (recall that it need not
be so; indeed, we could have chosen a charge ofπ for one of the fermions,a priori)? Could
it be that Naturehad to choose them that way, in the sense that the theory could not be
consistent otherwise? Questions like these drive us to look for theories of physics that go
beyond the Standard Model, in the hope that we may gain a deeper level of understanding
of why things are the way they are.
59Strictly speaking, the ratio disagrees with experiment, because it receives corrections from higher orders
in perturbation theory. But once these are taken into account everything ﬁts nicely.
– 54 –


## Page 57

6.10 Fermion Masses
We have explained how the gauge bosons get their masses by the Higgs mechanism, but
what about the quarks and leptons? Again, the answer is straightforward. Given a Higgs
ﬁeld transforming as a doublet ofSU (2) with hypercharge one-half, we can write down the
Yukawa couplings
L⊃− λuqLH cuR− λdqLHd R− λelLHe R + h.c. (6.61)
where H c≡ iσ2H∗ is an SU (2) doublet ﬁeld with hypercharge minus one-half.60 These
terms represent interactions, but when we plug in the Higgs VEV, lo and behold, we get
fermion masses
mu = λuv√
2 , m d = λdv√
2 , m e = λev√
2 . (6.62)
It just works.TM
6.11 Three Generations
We have described what happens for the ﬁrst generation of quarks and leptons. In fact
there are three generations (we already know about the muon and the various ﬂavours of
quarks) and it turns out that the extension of the theory just described gives an elegant
(and more to the point, correct) description of ﬂavour physics (namely transitions between
the generations). In particular, the Yukawa couplings in (6.61) can be complex, and this
is what gives rise toCP violation, once we have three generations. We don’t have time to
describe it here, but I encourage you to look it up.
6.12 The Standard Model and the Higgs boson
We have almost ﬁnished our description of the Standard Model. To recap, we show in Table
1 the diﬀerent ﬁelds and their representations under the SM gauge groupSU (3)× SU (2)×
U(1) (recall that SU (3) corresponds to QCD, or the strong nuclear force).
We have worked out the properties of all of the particles, but one: the Higgs boson.
What Higgs boson? Remember in the Abelian Higgs model that the Goldstone boson got
eaten by the gauge ﬁeld, but we were left with one massive scalar mode, corresponding to
ﬂuctuations in the radial direction in the complex plane of the ﬁeldφ. For the Higgs ﬁeld
H in the Standard Model, we have four real scalar degrees of freedom (sinceH is a complex
doublet); three of these get ‘eaten’ to form the longitudinal polarizations of theW±
µ and
Zµ. One scalar remains: the Higgs boson. We can work out its properties by going to the
unitary gauge, in which the three Goldstone bosons are manifestly eaten. In the SM, this
amounts to choosing
H(x) = 1√
2
(
0
v + h(x)
)
. (6.63)
60It is easy to see thatHc transforms with Y =− 1
2, since it involves the complex conjugate ofH. It is a
doublet of SU (2) because the complex conjugate ofSU (2) transforms as an anti-doublet ofSU (2), which
is equivalent to the doublet representation. Theiσ2is just the similarity transform that takes us from one
rep to the other. Go and look in the group theory book if you’re worried about it.
– 55 –


## Page 58

Field SU (3)c SU (2)L U(1)Y
g 8 1 0
W 1 3 0
B 1 1 0
qL = (uLdL)T 3 2 + 1
6
uR 3 1 + 2
3
dR 3 1 − 1
3
lL = (νLeL)T 1 2 − 1
2
eR 1 1 −1
H 1 2 + 1
2
T able 1. Fields of the Standard Model and theirSU (3)× SU (2)× U(1) representations
The Higgs boson, h(x), is a real scalar ﬁeld. It is not charged under electromagnetism (it
can’t be, since it is real). Its couplings to other ﬁelds can be worked out by replacingv
with v + h in our previous expressions. Thus, from (6.62), we ﬁnd a Yukawa coupling to
fermion i given by
L⊃− mi
v hψiψi. (6.64)
Similarly, from (6.59), we ﬁnd couplings to gauge bosons given by
L⊃ m2
W
(2h
v + h2
v2
)
W +
µ W−µ + m2
Z
2
(2h
v + h2
v2
)
ZµZµ. (6.65)
Finally, the Higgs boson has self interactions, coming from the potential
L⊃ + µ2
2 (v + h)2− λ
4 (v + h)4⊃− λv2h2− λvh3− λ
4 h4 =− m2
h
2 h2− m2
h
2v h3− m2
h
8v2 h4.
(6.66)
Thus m2
h = 2λv2, such that we know the value of the couplingλ once we know the mass of
the Higgs. The recent LHC measurement ofmh≃ 125 GeV thus ﬁxesλ≃ 0.13.
With these couplings worked out, we can roughly work out the phenomenology of
Higgs boson decays. The self interactions are not relevant here, because energy-momentum
conservation obviously prevents the Higgs boson decaying to two or three Higgs bosons!
For the same reason, if the Higgs is light, it will lie below the required mass threshold for
decay to pairs of heavier particles, such asW +W− or ZZ or top quarks (mt∼ 175 GeV, in
case you didn’t know). This consideration must be balanced against the fact that the Higgs
boson couplings to particles all grow with the mass of the particle. Thus, for a lightish
Higgs (above about 10 GeV), decays to bottom quark pairs will dominate (mb≃ 4.1 GeV).
But by the time the Higgs has become very heavy (mh ≳ 2mW), decays toW +W− and ZZ
must dominate. Interestingly enough, the crossover does not occur near the mass threshold
mh = 2mW ∼ 160 GeV, but somewhat below, nearermh≃ 140 GeV. The reason is that
QFT allows the Higgs boson to decay to aW +W− or ZZ pair in which one of the gauge
– 56 –


## Page 59

FIG. 2: Select Standard Model Higgs boson partial widths, as af u n c t i o no fm a s s ,MH .I n d i v i d u a l
partial widths are labeled, while the total width (sum of all partial widths, some minor ones not
shown) is the black curve. Widths calculated with hdecay [22].
The astute reader will have noticed by now that Fig. 2 contain sc u r v e sf o rH i g g sp a r t i a l
widths to massless ﬁnal states! (Have another look if you didn’t notice.) We kno wt h e
Higgs couples to particles proportional to their masses, so this requires some explanation.
Recall that loop-induced transitions can occur at higher or ders in perturbation theory. Such
interactions typically are important to calculate only whe nat r e e - l e v e li n t e r a c t i o nd o e s n ’ t
exist. They are responsible for rare decays of various meson s, for instance, and are in some
cases sensitive to new physics which may appear in the loop. H ere, we consider only SM
particles in the loop. Which ones are important? Recall also once again that the Higgs
boson couples proportional to particle mass. Thus, the top q uark and EW gauge bosons are
most important. For H → gg,t h e n ,t h a tm e a n so n l yt h et o pq u a r k ,w h i l ef o rH → γγ it is
both the top quark and W loops (there is no ZZ γ vertex). The H → gg expression (for the
Feynman diagram of Fig. 3) is [24]:
Γgg = α2
s GF M3
H
16
√
2 π3
⏐⏐⏐⏐
∑
i
τi
[
1+( 1 − τi)f (τi)
]⏐⏐⏐⏐
2
(3)
with τi = 4m2
f
M2
H
and f (τ )=
{[
sin−1 √
1/τ
]2
τ ≥ 1
−1
4
[
ln 1+√
1−τ
1−√
1−τ − iπ
]2
τ < 1 (4)
7
Figure 8. Higgs boson partial decay widths, from [9].
bosons is virtual, in that the mass-shell conditionE2 = p2 + m2 is not satisﬁed.61 The
virtual gauge boson then decays to real (on-shell) quarks or leptons by the usual gauge
interaction. The partial decays widths and branching ratios, as a function ofmh, are shown
in Figs. 8 and 9. Remarkably, at the pointmh = 125 GeV where the Higgs was found, we
see comparable branching ratios to a variety of ﬁnal states. This has the disadvantage of
making it very diﬃcult to discover the Higgs in the ﬁrst place, since the number of Higgs
decays in a single ﬁnal state is suppressed compared to the ﬁxed background of things that
look like the Higgs decaying that way, but are not. But it has the great advantage that it
makes it easy for us to make a variety of experimental tests that the Higgs boson that we
claim to have discovered really does have the properties predicted in the SM. So far, the
LHC data suggest one or two small anomalies (the rate of Higgs decays to photons is too
large by a factor of about two, but the statistical signiﬁcance is only around two sigma),
but otherwise things look pretty good.
There is one thing that may be bothering you in the Figures. They suggest that the
Higgs has a small coupling to both a pair of photonsγγ and to a pair of gluonsgg. How can
this be, when the Higgs carries neither colour nor electric charge? The answer is that loop
Feynman diagrams, like those in Fig. 10 generate such couplings. Though small, they are
very important for Higgs boson phenomenology at the LHC. Indeed, the LHC is a proton-
proton collider. Protons are mostly made of up and down quarks, but the coupling of the
Higgs boson to these is very small (it doesn’t even appear in the Figures we just showed).
But the proton also contains gluons, that bind the quarks together and these provide a
61If you want to prove this for yourself, draw the Feynman diagram and show that the resulting amplitude
is non-vanishing.
– 57 –


## Page 60

FIG. 4: Select Standard Model Higgs boson branching ratios a saf u n c t i o no fm a s s ,MH [22]. The
Higgs prefers to decay to the most massive possible ﬁnal stat e. The ratio of fermionic branching
ratios are proportional to fermion masses squared, modulo c olor factors and radiative corrections.
2. A brief word on statistics – the simple view
Now that we understand the basics of Higgs decay, and product ion in electron-positron
collisions, we should take a moment to consider statistics. The reason we must resort to
statistics is that particle detectors are imperfect instru ments. It is impossible to precisely
measure the energy of all outgoing particles in every collis ion. The calorimeters are sampling
devices, which means they don’t capture all the energy; rath er they’re calibrated to give
an accurate central value at large statistics, with some Gau ssian uncertainty about the
mean for any single event. Excess energy can also appear, due to cosmic rays, beam–
gas or beam secondary interactions. Quark ﬁnal states hadro nize, resulting in the true
ﬁnal state in the detector (a jet) being far more complicated and di ﬃcult even to identify
uniquely. The electronics can su ﬀer hiccups, and software always has bugs, leading to
imperfect analysis. Thus, we would never see two or three eve nts at precisely the Higgs
mass of, say, 122.6288... GeV, and pop the champagne. Rather ,w e ’ l lg e tad i s t r i b u t i o no f
masses and have to identify the central value and its associa ted uncertainty.
In any experiment, event counts are quantum rolls of the dice .F o r a s u ﬃcient number
9
Figure 9. Higgs boson branching ratios, from [9].
th
γ
γ
Figure 10. Feynman diagram with a loop of top quarks, contributing to the processh→ γγ.
way for us to produce the Higgs boson inpp collisions at the LHC. Similarly, the coupling
to photons is small, but a pair of photons has a much lower background (from non-Higgs
events) in LHC collisions than, say, a pair ofb-quarks. So, even if you are experimentally-
minded and think that theoretical physics is pointless, I hope you can appreciate that the
nitty-gritty of theoretical QFT calculations was absolutely essential to the success of the
LHC experiment. On a related note, I encourage you now to go back and work out the
various Feynman rules for interactions involving the Higgs boson.62
7 Renormalization
Congratulations! You now know (nearly) as much as anyone else about Nature, or at least
the underlying particle physics. The state of the art is ﬁnding out all about the properties
of the Higgs and you areau fait with it. Cock-a-hoop as we are, let’s take our hubris
to the next level and see if we can follow some of the theoretical speculation about what
62By way of an incentive: if you don’t, you might struggle when it comes to the exam ;-)
– 58 –


## Page 61

p p− k p
k
e e
Figure 11. Loop contribution to the self-energy of the electron.
+ + + . . . (7.3)
Figure 12. Contributions to the electron self-energy.
lies beyond the Standard Model. To do so, we need to delve a bit deeper into the seedy
underbelly of QFT.
7.1 Ultraviolet divergences in quantum ﬁeld theory
You are now in a position to write down the Feynman rules and compute the Feynman
diagram for any process you like. Should you do so, you will, most likely, quickly encounter
a problem. Most loop amplitudes that you calculate will be inﬁnite. As an example,
consider the one-loop correction to the electron propagator shown in Fig. 11. Referring
back to the Feynman rules, we ﬁnd
iM =
∫ d4k
(2π)4 u(−ieγµ)−igµν
k2
i(/p− /k− m)
(p− k)2− m2 (−ieγν)u. (7.1)
At large k, this goes like
∫
d4k /k
k4, which is linearly divergent. In fact, the integral is only
logarithmically divergent, because the integrand is odd underkµ→− kµ, but it is divergent
nevertheless.
These divergences crop up all over the place and they were a great source of insomnia
for our predecessors. Eventually, they came up with a ruse for getting rid of them. Here’s
how it works in the example above. Call the divergent amplitude iΣ and consider the
sequence of diagrams shown in Fig. 12. We can sum them up to get
(7.2)
– 59 –


## Page 62

i
/p− m + i
/p− m iΣ i
/p− m + i
/p− m iΣ i
/p− m iΣ i
/p− m + . . . (7.4)
= i
/p− m
(
1 + iΣ i
/p− m + . . .
)
(7.5)
= i
/p− m
(
1− iΣ i
/p− m
)−1
(7.6)
= i
/p− m− Σ . (7.7)
Thus Σ may be considered as an (inﬁnite) shift of the mass parameterm in the Lagrangian.
This would not pose a problem ifm itself were chosen to be inﬁnite, in just such a way that
m + Σ yields the measured electron mass of 511 keV.
This procedure of absorbing the divergences into the original parameters of the La-
grangian can only work if we are able to absorb all of the divergences in this way. Let’s
see if it has a chance of working. To do so, we need to do a bit of dimensional analysis. In
units where ℏ = c = 1, this is easy, because we only have a dimension of energy or mass.
So ﬁrst let’s ﬁgure out the dimensions of all the ﬁelds.
The action has the same dimensions asℏ, so is dimensionless in our units. Since the
4-momentum corresponds to∂µ in these units, space and time both have (mass) dimension
-1. The Lagrangian (density) must therefore have dimension 4, since
∫
d4xL yields the
dimensionless action. The ﬁeld dimensions can then be ﬁgured out from the kinetic terms.
Bosonic ﬁelds must have dimension one, since the kinetic term involves two derivatives.
Fermions on the other hand must have dimension three-halves. You can then check that
the mass parameters in the respective Lagrangians really do have dimensions of mass and
that the gauge couplings are dimensionless.
This dimensional analysis enables us to quickly work out the degree of divergence of
any Feynman diagram. We call it thesuperﬁcial degree of divergence, D, because it may
be that the real degree of divergence is smaller (cf. the log rather than linear divergence of
the one-loop electron self-energy diagram in QED that we wrote down above).
Consider a diagram withL loops, FI,E internal or external fermion propagators,BI,E
internal or external boson propagators, andV vertices. If we roll the plane of the diagram
into a sphere, the internal lines and loops make a convex polyhedron, for which Euler tells
us that the number of vertices minus edges plus faces equals two. In other words,
L = FI + BI− V + 1. (7.8)
Now let’s think about the vertices. Each one comes from a dimension four term in the
Lagrangian. If vertex j involves Fj and Bj fermionic and bosonic ﬁelds, together withPj
momenta, then its coupling constant has dimension
gj = 4− 3
2 Fj− Bj− Pj. (7.9)
– 60 –


## Page 63

Furthermore, since every internal propagator ends on two vertices and every external prop-
agator lands on one vertex, it must be that
∑
j
Fj = 2FI + FE,
∑
j
Bj = 2BI + BE, (7.10)
where we sum over all vertices in the diagram. From this mess, you can obtain the relation
(exercise)
D = 4− 3
2 FE− BE−
∑
j
gj. (7.11)
This relation is most instructive: it tells us the superﬁcial degree of divergence for ﬁxed
initial and ﬁnal states depends only on the dimensions of couplings that appear. Moreover,
if any coupling has negative mass dimension, we have no chance of carrying out the renor-
malization programme, since more and more divergences appear as we include more and
more vertices in diagrams. Conversely, renormalization might work for theories like QED
or the SM (where we only have couplings of positive or vanishing mass dimension), because
diagrams get less and less divergent as they get more complicated.
This is not the same as saying that it does work, however. To prove renormalizability
of the electroweak theory took a heroic eﬀort by ’t Hooft and Veltman. Heroic enough
to win them the Nobel prize, the real breakthrough being a clever choice of gauge by the
young ’t Hooft.
Our arguments also tell us immediately why gravity cannot be included straightfor-
wardly within the quantum gauge ﬁeld theory framework. The classical action for gravity
is the Einstein-Hilbert action
S = 1
M 2
P
∫
d4x
√
−detgµνRσ
σ, (7.12)
where g and R are the metric and Riemann tensors, respectively. Thisisa gauge theory (the
symmetry being diﬀeomorphism invariance), but the coupling constant 1
M 2
P
has negative
mass dimension. The theory cannot be perturbatively renormalizable.
7.2 Non-renormalizable interactions and eﬀective theories: the modern view
Even though the SM is renormalizable and the inﬁnities can be swept away, this procedure
hardly seems aesthetically attractive. Nowadays we have a rather diﬀerent view of renor-
malizability. The problems appear because we tried to deﬁne the theory up to arbitrarily
high energy (and this short distance) scales, way beyond those which we are able to probe
in our current experiments. We would not have to worry about inﬁnities at all if we im-
posed some large momentum cut-oﬀ,Λ, on the theory, beyond the reach of our experiments.
But since there are then no inﬁnities, even non-renormalizable theories make perfect sense,
provided we understand that they come with a cut-oﬀ,Λ. This is called aneﬀective ﬁeld
theory.
In fact, this should have been obvious all along and indeed it is the way we have
always done physics: we build a theory which works on the scales probed by our current
– 61 –


## Page 64

experiments, accepting that we may need to revise it once we are able to probe new scales.
QFT (which, via loop diagrams, prevents us from simply ignoring the eﬀect of physics
at other scales) merely brought this issue into focus. Moreover, even in quantum physics
we have long had concrete examples of this. Perhaps the best is Fermi’s theory of the
weak interaction, containing a four-fermion interaction to describeβ decay. A four-fermion
interaction has mass dimension six and so the coupling,GF has mass dimension minus two.
The theory, considered as a QFT, is non-renormalizable, but this presents no problems
provided that we do not ask questions about what happens at mass scales higher than the
cut-oﬀ, c. 100 GeV, which is set by the mass scale associated withGF. Moreover, the
cut-oﬀ that is present in Fermi’s description can be seen as a strong hint that something
interesting happens in weak interactions at scales around 100 GeV. As we have seen, that
is indeed what happens – we discover that the four-fermion eﬀective interaction arises from
the exchange ofW and Z gauge bosons having that mass. Given the complete electroweak
theory, we can go back to Fermi’s theory, by considering only energies below 100 GeV, for
which we can ‘integrate out’ theW and Z.63
If there is nothing wrong with non-renormalizable theories, then why is the Standard
Model renormalizable? A better way to phrase this is as follows. We could extend the
StandardModelbyaddingnon-renormalizableoperatorstoit, whilststillmaintaininggauge
invariance (we will do exactly that when we consider neutrino masses in the next Section).
The fact that the SM gives a good description of all physics seen so far translates into the
statement that the mass scale (a.k.a. the cut-oﬀ) associated with these higher-dimensional
operators must be very large, meaning that the new physics (beyond the SM) that they
provide an eﬀective description of must be a long way out of our reach. No one knows
why this must be the case and indeed there are strong (but indirect) arguments for why it
should not be the case. Unfortunately, so far, experiments like the LHC indicate that the
SM provides a very good description of physics at energy scales within reach.
8 Beyond the Standard Model
We now move on to consider some aspects of physics beyond the SM. With one exception,
this is speculative, in that we have no concrete experimental evidence for it. We start with
the exception.
8.1 Neutrino masses
The story of neutrino masses goes back several decades, beginning with the discovery in
the 1960s that the ﬂux of electron neutrinos from the sun was less than half of what was
predicted by models of the nuclear reactions that fuel the sun. One way to resolve the
deﬁcit is to postulate that neutrinos can undergo oscillations between the diﬀerent ﬂavours,
in much the same way as neutral mesons. In order for neutrino oscillations to be physical,
there must be some distinguishing feature between the diﬀerent neutrino generations. Since
63This procedure is called integrating out because in the path integral formalism of QFT it corresponds
to doing the path integral with respect to the ﬁeldsW and Z.
– 62 –


## Page 65

they have identical gauge couplings, the most obvious distinguishing feature is a neutrino
mass, which may diﬀer between the generations.
Despite many corroborating experimental hints, the hypothesis of solar neutrino os-
cillations into other ﬂavours was not conﬁrmed beyond doubt until 2001, by the Sudbury
Neutrino Observatory. Whilst we do not have a direct measurement of the masses (though
a bound on the sum of around an eV may be inferred from cosmological data), we do know
that the two mass-squared diﬀerences are around10−3 and 10−5 eV2.
Thechallengethen, istogiveatheoreticaldescriptionofneutrinomassesand, hopefully,
to explain their smallness (in comparison, the lightest charged particle, the electron, has
mass 511 keV). The renormalizable Standard Model cannot account for massive neutrinos.
However, it turns out that the Standard Model does provide an elegant description of
neutrino masses, when we consider it as a non-renormalizable, eﬀective ﬁeld theory.
Indeed, consider the Lorentz-invariant operators of dimension greater than four that
respect the SU (3)× SU (2)× U(1) gauge symmetry and hence could be added to the SM
Lagrangian. The low-energy eﬀects of the operators will be largest for the operators of
lowest dimension. The lowest dimension greater than four is ﬁve and we ﬁnd exactly one
dimension ﬁve operator that can be added to the Lagrangian. It takes the form
L⊃− 1
Λ(lT
LH cC(H c)T lL) + h. c. (8.1)
where 1
Λ is the coupling (written so that Λ has dimensions of mass) and where +h. c.
instructs us to add the Hermitian conjugate (so that the Lagrangian comes out to be real).
This is an interaction involving two Higgs ﬁelds and two lepton doublets, but when the
Higgs ﬁeld gets a VEV, we ﬁnd a Majorana mass term for the neutrino of the form (6.39):
L⊃− v2
2Λ νT
L CνL + h. c. (8.2)
The neutrino mass comes out to bem = v2
Λ, which is in itself very interesting: we can
explain the small mass of neutrinos∼ 10−1 eV ifΛ is very large,∼ 1014 GeV. Why is this
interesting? Recall from our discussion of eﬀective ﬁeld theories above thatΛ corresponds
to the scale at which the eﬀective theory breaks down and must be replaced by a more
complete description of the physics. The smallness of neutrino masses is indirectly telling
us that the SM could provide a good description of physics all the way up to a very high
scale of∼ 1014 GeV. In comparison, the LHC probes energies around103 GeV. Moreover,
our eﬀective ﬁeld theory approach tells that neutrino masses are expected to be the ﬁrst
sign of deviation from the SM that we observe, in the sense that they are generated by the
operator of lowest dimension: if all the higher-dimension operators are suppressed by the
same mass scale (which, by the way, they need not be), then the neutrino mass operator
above will have the largest eﬀect at the relatively low energies at which we perform our
experiments.
It is interesting to speculate what the new physics might be. One simple possibility
is to add a new particle to the SM called a right-handed neutrino. This is simply a right-
handed fermion which is completely neutral with respect to the SM gauge group. The most
– 63 –


## Page 66

general, renormalizable Lagrangian then includes the extra terms
L⊃ λνlLH cνR− M νT
RCνR + h. c. (8.3)
The ﬁrst term is simply a generalization of the Yukawa couplings (6.61) and the second
is a Majorana mass term (6.39). We can now identify two qualitatively diﬀerent scenarios
reproducingtheobservedsmallneutrinomasses. TheﬁrstwaywouldbetoallowtheYukawa
coupling to be of order unity; then a small neutrino mass could only be accomplished by
choosing the Majorana massM around∼ 1014GeV. Then, diagonalizing the mass matrix
for νL and νR one ﬁnds one light eigenstate with mass around 0.1 eV and one heavy state
around 1014 GeV. This is often called thesee-saw mechanism. We could then integrate out
the heavy state (which is mostlyνR) to obtain the eﬀective theory description containing
only νL given above. The second scenario is to imagine that the Majorana mass term is
forbidden. One could do this example by declaring that the theory should be invariant
under a global phase rotation of all leptons, includingνR. This corresponds to insisting
on conservation of lepton number and is enough to forbid the Majorana mass term.64
Then neutrino masses come from the Yukawa term alone, and both left- and right- handed
neutrinos are light. In fact, they are degenerate, since they together make up a Dirac
fermion. Notice that in this second picture we cannot integrate out a heavy neutrino to
obtain an eﬀective theory as in (8.1). This is an important caveat: the scaleΛ∼ 1014 GeV
indicated by (8.1) is only anupper boundfor the scale at which new physics should appear.
8.2 The gauge hierarchy problem
In our modern view of quantum ﬁeld theory as an eﬀective ﬁeld theory, non-renormalizable
operators are not a problem. We recognize that they represent the eﬀects of new physics
at high energy scales. They are suppressed by the scaleΛ of new physics. Provided thatΛ
is rather large, they give small contributions that we can take into account using the tools
of perturbation theory.
But this interpretation shows that there is now a problem with therenormalizable
operators. Indeed, in our enlightened understanding, we take the view that the physics
at our low scale is determined by the physics at higher scales, which corresponds to some
more fundamental theory. But then all mass scales in our current theory should be set by
the higher scale theory. This includes not only the operators of negative mass dimension,
but also the operators of positive mass dimension. Concretely, in the SM there is exactly
one coupling of positive mass dimension: the mass parameter,µ of the Higgs ﬁeld. Why
on Earth does this have a value of around 100 GeV when we believe that it is ultimately
determined by a more fundamental theory at a much higher scale? We certainly have
evidence for the existence of physics at higher scales: neutrino masses indicate new physics
at 1014 GeV and the mass scale associated with gravity is the Planck mass,1019 GeV.
This problem of how to explain the hierarchy between the scale of weak interactions
and other scales believed to exist in physics is called thegauge hierarchy problem. It is
64It is important to note that this is very diﬀerent from what happens in the SM. There we ﬁnd that
once we insist on the gauge symmetry, lepton (and baryon) numbers are automatically conserved by all
operators of dimension four or less. They are calledaccidental symmetries of the theory.
– 64 –


## Page 67

compounded by the fact that QFT has loops which are sensitive to arbitrarily high scales.
This may all sound rather abstract to you, but I assure you that the problem can be viewed
concretely. Take a theory with two scalar ﬁelds. One like the Higgs, should be set to be
light. Make the other one heavy. Then compute the corrections to the mass of the light
scalar from loop diagrams containing the heavy scalar. You will ﬁnd that the mass of the
light scalar gets lifted up to the mass of the heavy one.
Several beautiful solutions to this hierarchy problem have been put forward, involving
concepts likesupersymmetry, strong dynamics, and extra dimensions. They all involve rich
dynamics (usually in the form of many new particles) at the TeV scale. We are looking for
them at the LHC, but so far our searches have come up empty-handed.
8.3 Grand uniﬁcation
There is yet another compelling hint for physics beyond the SM. It turns out that one
consequence of renormalization is that the parameters of the theory must be interpreted as
being dependent on the scale at which the theory is probed. I’m afraid you will have to read
a QFT textbook to see why. It turns out that the QCD coupling gets smaller as the energy
scale goes up (this is why we are able to do QCD perturbation theory for understanding
LHC physics as the TeV scale, whilst needing non-perturbative insight in order to able to
prove conﬁnement of quarks into hadrons at the GeV scale), while the electroweak couplings
g and g′ get bigger. Remarkably, if one extrapolates far enough, one ﬁnds that all three
couplings are nearly65 equal66 at a very high scale,c. 1015 GeV. Could it be that, just as
electromagnetism and the weak force become the uniﬁed electroweak force at the 100 GeV
scale, all three forces become uniﬁed at1015 GeV?
The fact that the couplings seem to become equal is a hint that we could try to make all
three groups inSU (3)× SU (2)× U(1) subgroups of one big group, with a single coupling
constant. The group SU (5) is an obvious contender and in fact it is the smallest one.
How does SU (3)× SU (2)× U(1) ﬁt into SU (5)? Consider SU (5) in terms of its deﬁning
representation: 5 × 5 unitary matrices with unit determinant acting on 5-dimensional
vectors. We can get an SU (3) subgroup by considering the upper-left 3× 3 block and
we can get an independentSU (2) subgroup from the lower right 2× 2 block. There is
one more Hermitian, traceless generator that is orthogonal to the generators of these two
subgroups: it is T =
√
3
5diag(− 1
3 ,− 1
3 ,− 1
3 , 1
2 , 1
2), with the usual normalization. Our goal
will be to try to identify this with the hyperchargeU(1) in the SM. To do so, we ﬁrst have
to work out how the SM fermions ﬁt into reps ofSU (5). To do so, it is most convenient
to write the right-handed fermions of the SM as charge conjugates of left-handed fermions.
Then the multiplets areqL, uc
L, dc
L, l, ec
L, with the charges as given in Table 1, except that
we must take the conjugate reps for the multiplets with a ‘c’.
65Nearly enough to be impressive, but not quite. The discrepancy might be resolved by extra, supersym-
metric particles, however.
66At the moment, this is an trivial statement: the normalization ofg′ is arbitrary and can always be
chosen to make all three couplings meet at the same point. But we will soon be able to give real meaning
to it.
– 65 –


## Page 68

Before going further, let’s do a bit of basicSU (N) representation theory. The deﬁning,
or fundamental, representation is anN-dimensional vector, acted on byN× N matrices.
We can write the action asαi→ U i
j αj, with the indicesi, j enumerating theN components.
Given this rep, we can immediately ﬁnd another by taking the complex conjugate. This
is called the antifundamental rep. It is convenient to denote an object which transforms
according to the antifundamental with a downstairs index,βi. Why? The conjugate of
αi→ U i
j αj is α∗i→ U∗i
j α∗j = U†j
i α∗j. So if we deﬁne things that transform according to
the conjugate with a downstairs index, we can writeβi→ U†j
i βj. The beauty of this is that
αiβi→ αjU i
j U†k
i βk = αjδk
j βk = αkβk, where we usedU U† = 1. Thus when we contract
an upstairs index with a downstairs index, we get a singlet. This is, of course, much like
what happens withµ indices for Lorentz transformations. Note that the Kronecker delta,
δk
j, naturally has one up index and one down and it transforms asδl
i → U i
kδk
j U†j
l . But
U U† = 1 =⇒ δl
i→ δl
i and so we callδl
i an invariant tensorof SU (N). Note, furthermore,
that there is a second invariant tensor, namelyϵijk... (or ϵijk...) , the totally antisymmetric
tensor with N indices. Its invariance follows from the relationdet U = 1.
These two invariant tensors allow us to ﬁnd all the irrepsSU (N)from (tensor) products
of fundamental and antifundamental representations. The key observation is that tensors
which are symmetric or antisymmetric in their indices remain symmetric or antisymmetric
under the group action (exercise), so cannot transform into one another. So to reduce a
generic product rep into irreps, one can start by symmetrizing or antisymmetrizing the
indices. This doesn’t complete the process, because one can also contract indices using
either of the invariant tensors, which also produces objects which only transform among
themselves (exercise).
Let’s see how it works for some simple examples, reproducing some results which were
probably previously introduced to you as dogma. Start withSU (2), which is locally equiv-
alent to SO(3) and whose representation theory is known to you as ‘The theory of angular
momentum in quantum mechanics’. The fundamental rep is a 2-vector (a.k.a. spin-half);
call it αj. Via the invariant tensor ϵij this can also be thought of as an object with a
downstairs index,viz. ϵijαj, meaning that the doublet and anti-doublet areequivalent rep-
resentations (theϵij also gives rise to the peculiar minus signs that appear, usually without
explanation, in introductory QM courses). So all tensors can be thought of as having indices
upstairs, and it remains only to symmetrize (or antisymmetrize). Take the product of two
doublets for example. We decomposeαiβj = 1
2(α(iβj) + α[iβj]), where we have explicitly
(anti)symmetrized the indices. The symmetric object is a triplet irrep (it has(11), (22),
and (12) components), while the antisymmetric object is a singlet (having only a[12] com-
ponent). We write this decomposition as2× 2 = 3 + 1and you will recognize it from your
studies of the Helium (two-electron) atom.
The representation theory ofSU (3) is not much harder. The fundamental is a triplet
and the anti-triplet is inequivalent.67 The product of two triplets contains a symmetric
sextuplet and an antisymmetric part containing three states. We can use the invariant
67It is inequivalent, because we cannot convert one to the other usingϵij, which has been replaced by
ϵijk.
– 66 –


## Page 69

tensor ϵijk to write the latter asϵijk α[iβj], meaning that it is equivalent to an object with
one index downstairs,viz. an anti-triplet. Thus the decomposition is3× 3 = 6 + 3. On
the other hand, we cannot symmetrize the product of a 3 and a3, because the indices
are of diﬀerent type. The only thing we can do is to separate out a singlet obtained
by contracting the two indices with the invariant tensorδi
j. Thus the decomposition is
αiβj =
(
αiβj− 1
3 αkβkδi
j
)
+ 1
3 αkβkδi
j, or 3× 3 = 8 + 1. The 8 is the adjoint rep. Again,
you have probably seen this all before under the guise of ‘the eightfold way’.
For SU (5), things are much the same. The only reps we shall need are the smallest ones,
namely the (anti)fundamental 5(5) and the 10 which is obtained from the antisymmetric
product of two 5s.
Now let’s get back to grand uniﬁed theories. We’ll try to do the dumbest thing imag-
inable which is to try to ﬁt some of the SM particles into the fundamental ﬁve-dimensional
representation ofSU (5). I hope you can see that this breaks up into a piece (the ﬁrst three
entries of the vector) that transform like the fundamental (triplet) rep ofSU (3) and the
singlet of SU (2) and a piece (the last two entries of the vector) which does the opposite.
For this to work the last two entries would have to correspond tolL (since this is the only
SM multiplet which is a singlet ofSU (3) and a doublet ofSU (2)), in which case the hy-
percharge must be ﬁxed to beY =−
√
5
3 T. Then the hypercharge of the ﬁrst three entries
is + 1
3. This is just what we need fordc
L, except thatdc
L is a colour anti-triplet rather than
a triplet. But we can ﬁx it up by instead identifyingY = +
√
5
3 T and then identifying
(dc
L, lL) with theanti-fundamental rep of SU (5).68
What about the other SM fermions? The next smallest rep ofSU (5) is ten dimen-
sional. It can be formed by taking the product of two fundamentals and then keep-
ing only the antisymmetric part of the product. But since we now know that under
SU (5)→ SU (3)× SU (2)× U(1), 5→ (3, 1,− 1
3) + (1, 2, + 1
2), you can immediately de-
duce69 that 10→ (3, 2, + 1
6) + (3, 1,− 2
3) + (1, 1, +1). These are preciselyqL, uc
L, and ec
L.
That things ﬁt in this way is nothing short of miraculous. Let’s now justify our state-
ment about the couplings meeting at the high scale. TheSU (5) covariant derivative is
Dµ = ∂µ + igGUTAµ⊃ igGUT
(
W 3
µ T 3 + i
√
3
5 Y Bµ
)
, (8.4)
so uniﬁcation predicts that tan θW = g
g′ =
√
3
5 =⇒ sin2 θW = 3
8. This is the relation
which is observed to hold good (very nearly) at the uniﬁcation scale.
There is another GUT which is based on the groupSO(10). This is perhaps even more
remarkable, in that the ﬁfteen states of a single SM generation ﬁt into a 16 dimensional rep
(it is in fact a spinor) ofSO(10). You might be thinking that this doesn’t look so good,
but — wait for it — the sixteenth state is a SM gauge singlet and plays the rôle of a right
handed neutrino. It almost looks too good to be true.
68This discussion hinges on the group theoretical fact that a representation and its complex conjugate
are inequivalent, in general.
69At least you can if you know a bit of group theory, for example that the antisymmetric product of two
2s of SU (2) is a singlet and similarly that the antisymmetric product of two 3s ofSU (3) is a 3.
– 67 –


## Page 70

9 Afterword
Particle physics has had a tremendous winning streak. In a century or so, we have come
an enormously long way. These lecture notes are, in a sense, a condensation of that.
Despite the glorious successes of the past, it is fair to say that the golden age of
particle physics is happening right now. Not only have we just discovered the Higgs boson
(and are busily checking that it conforms to the predictions of the SM), but we have strong
indications that there should be physics beyond the SM and the LHC and other experiments
are comprehensively searching for it. So far, nothing has been found, but now the LHC is
being upgraded to run at even higher energies.
Who knows what lies around the corner? If your interest is piqued by what I have
discussed, then I wholeheartedly encourage you to begin a proper study of particle physics
in general, and gauge ﬁeld theory, in particular. Maybe it will be you who makes the next
big breakthrough ...
References
[1] F. Mandl and G. Shaw,Quantum Field Theory. Wiley, 2nd ed., 2010.
[2] A. Zee,Quantum ﬁeld theory in a nutshell. Princeton, 2nd ed., 2010.
[3] M. E. Peskin and D. V. Schroeder,An Introduction to quantum ﬁeld theory. Addison-Wesley,
1995.
[4] I. Aitchison and A. Hey,Gauge theories in particle physics: A practical introduction. Vol. 1:
From relativistic quantum mechanics to QED. IOP, 4th ed., 2012.
[5] I. Aitchison and A. Hey,Gauge theories in particle physics: A practical introduction. Vol. 2:
Non-Abelian gauge theories: QCD and the electroweak theory. IOP, 4th ed., 2012.
[6] L. Alvarez-Gaume and M. A. Vazquez-Mozo,An Invitation to Quantum Field Theory, vol. 839
of Lecture Notes in Physics. Springer, 2011.
[7] L. Alvarez-Gaume and M. A. Vazquez-Mozo,Introductory lectures on quantum ﬁeld theory,
hep-th/0510040.
[8] H. Georgi,Lie Algebras In Particle Physics: from Isospin To Uniﬁed Theories, vol. 54.
Frontiers in Physics, 2nd ed., 1999.
[9] D. Rainwater,Searching for the Higgs boson, hep-ph/0702124.
– 68 –
