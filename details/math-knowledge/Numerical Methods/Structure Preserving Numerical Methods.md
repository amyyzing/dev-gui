# Structure Preserving Numerical Methods

Source title: Structure-preserving Numerical Methods

Converted from: `26.pdf`


## Page 1

Structure-preserving Numerical Methods
for Engineering Applications
Harsh A. Sharma
Dissertation submitted to the Faculty of the
Virginia Polytechnic Institute and State University
in partial fulfillment of the requirements for the degree of
Doctor of Philosophy
in
Aerospace Engineering
Mayuresh J. Patil, Chair
Craig A. Woolsey, Co-Chair
Taeyoung Lee
Shane Ross
Cornel Sultan
August 7, 2020
Blacksburg, Virginia
Keywords: Structure-preserving methods, Geometric numerical integration, Variational
integrators, Lie group methods
Copyright 2020, Harsh A. Sharma


## Page 2

Structure-preserving Numerical Methods
for Engineering Applications
Harsh A. Sharma
(ABSTRACT)
This dissertation develops a variety of structure-preserving algorithms for mechanical systems
with external forcing and also extends those methods to systems that evolve on non-Euclidean
manifolds. The dissertation is focused on numerical schemes derived from variational princi-
ples – schemes that are general enough to apply to a large class of engineering problems. A
theoretical framework that encapsulates variational integration for mechanical systems with
external forcing and time-dependence and which supports the extension of these methods to
systems that evolve on non-Euclidean manifolds is developed. An adaptive time step, energy-
preserving variational integrator is developed for mechanical systems with external forcing.
It is shown that these methods track the change in energy more accurately than their fixed
time step counterparts. This approach is also extended to rigid body systems evolving on Lie
groups where the resulting algorithms preserve the geometry of the configuration space in
addition to being symplectic as well as energy and momentum-preserving. The advantages
of structure-preservation in the numerical simulation are illustrated by various represen-
tative examples from engineering applications, which include limit cycle oscillations of an
aeroelastic system, dynamics of a neutrally buoyant underwater vehicle, and optimization
for spherical shape correlation and matching.


## Page 3

Structure-preserving Numerical Methods
for Engineering Applications
Harsh A. Sharma
(GENERAL AUDIENCE ABSTRACT)
Accurate numerical simulation of dynamical systems over long time horizons is essential in
applications ranging from particle physics to geophysical fluid flow to space hazard analysis.
In many of these applications, the governing physical equations derive from a variational
principle and their solutions exhibit physically meaningful invariants such as momentum,
energy, or vorticity. Unfortunately, most traditional numerical methods do not account for
the underlying geometric structure of the physical system, leading to simulation results that
may suggest nonphysical behavior. In this dissertation, tools from geometric mechanics and
computational methods are used to develop numerical integrators that respect the qualitative
features of the physical system. The research presented here focuses on numerical schemes
derived from variational principles– schemes that are general enough to apply to a large
class of engineering problems. Energy-preserving algorithms are developed for mechanical
systems by exploiting the underlying geometric properties. Numerical performance compar-
isons demonstrate that these algorithms provide almost exact energy preservation and lead to
more accurate prediction. The advantages of these methods in the numerical simulation are
illustrated by various representative examples from engineering applications, which include
limit cycle oscillations of an aeroelastic system, dynamics of a neutrally buoyant underwater
vehicle, and optimization for spherical shape correlation and matching.


## Page 4

Dedication
To my grandfather, Radheshyam Sharma
iv


## Page 5

Acknowledgments
It has been an honor and a privilege to work with my co-advisors, Dr. Mayuresh Patil
and Dr. Craig Woolsey. From my first year, both of them treated me as their colleague
and gave me an incredible amount of freedom to explore different research directions at my
own pace. In my third year, they also involved me with the proposal writing for NSF and
AFOSR funding which was a great learning experience and it is an opportunity for which I
owe them a tremendous debt of gratitude. In addition to their technical guidance, both of
them have greatly helped me in planning my future steps. Their mentoring has helped me
grow as both an academic and a person over these five years and the impact of the things I
have learned from them on my life is profound. I must also thank Dr. Shane Ross and Dr.
Cornel Sultan for their constructive feedback and suggestions during my committee meetings.
I am incredibly thankful to Dr. Taeyoung Lee for hosting me for research collaborations
at the George Washington University during Summer 2018 and Summer 2019. Aside from
contributing markedly to my doctoral research, I would also like to thank Dr. Lee for his
great hospitality. I cannot overstate my appreciation for his financial support which allowed
me to live lavishly in Washington DC. I would also like to thank Kanishke, Chao, Weixin,
Mahdis, Shankar, Harshvardhan, and Reza for making me a part of their lab group at GWU.
I must also thank Shubhodeep, Sourav, and Debjit for their support during my stay in DC.
I must also thank Dr. Jeff Borggaard for agreeing to mentor me for my MS in Mathemat-
ics. His expertise in numerical analysis helped me to give my research work a mathematical
flavor. Apart from our research collaboration, I also owe thanks to Dr. Borggaard for his
v


## Page 6

help with my postdoc search. I am also indebted to Dr. Joseph Schetz with whom I had the
honor of working as a GTA during my first three years. Apart from our work interactions,
Dr. Schetz has always been really kind to me with his coffee/lunch treats. I will always have
fond memories of visiting his house for a party and him giving me a ride to my home from
the airport.
I am grateful to Dr. Stephen Prince for allowing me to attend his classes and film screenings
during my PhD. Through his classes, I was able to fulfill my long-held wish of learning cin-
ema formally and I got to watch movies from greats like Kurosawa and Ford. I will always
cherish the memory of going to Hancock 100 on Tuesday evenings to see some of the greatest
movies of all time on the big screen, the way they are meant to be seen.
None of this would be possible without the support of my friends in Blacksburg. I am
incredibly thankful for the Blacksburg chapter of Association for India’s Development for
giving me the opportunity to immerse myself in helping generate funds for grassroots projects
in India. I am also grateful to the Bengali community in Blacksburg for treating me as one
of their own. I would also like to thank all the friends I made while playing cricket at vari-
ous basketball and tennis courts in Blacksburg. During these years I have enjoyed visits to
movies and sports with Abinash, Aniket, and Apratim. I will also miss hanging out with
these friends: Amrita, Rathsara, Jeena, Beth, Kelly, Aarushi, Pranav, Yash, Riya, Adbhut,
Shreya, and Varya. Atashi truly deserves separate credit for inviting me to innumerable
parties for all these years. I would like to acknowledge my fellow graduate students, Nick,
Karanpreet, Deva, Revati, Udit, Poorva, Agastya, Siddharth, and George, for making my
graduate experience that much more rich and pleasant. I must also thank my undergraduate
friends for their constant support, including my best friends Om, Kushan, Bansal, Akshit,
Saurabh, Malhar, Mohit, Atul, and Raj.
vi


## Page 7

I would not be where I am today without the love and support of my family and for that I
am sincerely grateful. First of all, I must thank my roommates Pawan, Aarash, Evan, Sheril,
Yixiao, Abe, and Anthony for their company during my doctoral study. I must thank my
brother Kalpan Sharma and my sister-in-law Rizu Raval for always having my back. My
father Apurva Sharma instilled his curiosity and passion for learning in me at a very young
age and this played a major part in my choice to pursue a PhD. Finally, I would like to
thank my mother Sangita Sharma for believing in me every step of the way.
vii


## Page 8

Contents
List of Figures xiv
List of Tables xix
1 Introduction 1
1.1 Background and Motivation . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
1.2 Research Objectives . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4
1.3 Summary of Contributions . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
1.4 Publications . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
2 Review of Literature 8
2.1 Geometric Structure Underlying Continuous Systems . . . . . . . . . . . . . 9
2.1.1 Basic Concepts . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
2.1.2 Lagrangian Mechanics . . . . . . . . . . . . . . . . . . . . . . . . . . 11
2.1.3 Variational Formulation of Different Problems . . . . . . . . . . . . . 14
2.2 Structure-preserving Methods . . . . . . . . . . . . . . . . . . . . . . . . . . 17
2.2.1 Symplectic Methods . . . . . . . . . . . . . . . . . . . . . . . . . . . 18
2.2.2 Variational Integrators . . . . . . . . . . . . . . . . . . . . . . . . . . 19
2.2.3 Energy-momentum Integrators . . . . . . . . . . . . . . . . . . . . . 27
viii


## Page 9

2.2.4 Discrete Gradient Methods . . . . . . . . . . . . . . . . . . . . . . . 31
2.2.5 Lie Group Methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . 32
2.3 Science and Engineering Applications . . . . . . . . . . . . . . . . . . . . . . 36
2.3.1 Celestial Mechanics and Dynamical Astronomy . . . . . . . . . . . . 36
2.3.2 Elastodynamics . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 37
2.3.3 Multibody Dynamics . . . . . . . . . . . . . . . . . . . . . . . . . . . 38
2.3.4 Fluid Dynamics . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 39
2.3.5 Optimal Control . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 41
3 Energy-preserving Variational Integrators 43
3.1 Background: Adaptive Time Step Variational Integrators . . . . . . . . . . . 44
3.1.1 Extended Lagrangian Mechanics . . . . . . . . . . . . . . . . . . . . 44
3.1.2 Energy-preserving Variational Integrators . . . . . . . . . . . . . . . 46
3.2 Modified Lagrange-d’Alembert Principle . . . . . . . . . . . . . . . . . . . . 49
3.3 Energy-preserving Variational Integrators . . . . . . . . . . . . . . . . . . . . 51
3.4 Numerical Examples . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 54
3.4.1 Conservative Example . . . . . . . . . . . . . . . . . . . . . . . . . . 54
3.4.2 Time-dependent Example . . . . . . . . . . . . . . . . . . . . . . . . 64
3.4.3 Dissipative Example . . . . . . . . . . . . . . . . . . . . . . . . . . . 68
3.5 Conclusions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 77
ix


## Page 10

4 One-step Variational and Galerkin Methods 79
4.1 Background . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 80
4.2 One-step Time-integration Methods . . . . . . . . . . . . . . . . . . . . . . . 82
4.2.1 Hermite Polynomials . . . . . . . . . . . . . . . . . . . . . . . . . . . 82
4.2.2 One-step Variational Methods . . . . . . . . . . . . . . . . . . . . . . 83
4.2.3 One-step Galerkin Methods . . . . . . . . . . . . . . . . . . . . . . . 85
4.2.4 Higher-order One-step Methods . . . . . . . . . . . . . . . . . . . . . 87
4.3 Numerical Results . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 88
4.3.1 Particle in a Double-well Potential . . . . . . . . . . . . . . . . . . . 89
4.3.2 Duffing Oscillator . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 91
4.3.3 Aeroelastic System . . . . . . . . . . . . . . . . . . . . . . . . . . . . 92
4.3.4 Symplectic Nature . . . . . . . . . . . . . . . . . . . . . . . . . . . . 95
4.4 Conclusions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 99
5 Energy-preserving Lie Group Variational Integrators on SO(3) 101
5.1 Extended Lagrangian Mechanics on SO(3) . . . . . . . . . . . . . . . . . . . 101
5.2 Adaptive Variational Integrator . . . . . . . . . . . . . . . . . . . . . . . . . 104
5.2.1 Extended Discrete Lagrangian Mechanics on SO(3) . . . . . . . . . . 105
5.2.2 Properties of Adaptive Lie Group Variational Integrator . . . . . . . 108
5.2.3 Computational Approach . . . . . . . . . . . . . . . . . . . . . . . . 109
x


## Page 11

5.3 Numerical Example of a 3D Pendulum . . . . . . . . . . . . . . . . . . . . . 110
5.3.1 Adaptive Variational Integrator . . . . . . . . . . . . . . . . . . . . . 111
5.3.2 Numerical Results . . . . . . . . . . . . . . . . . . . . . . . . . . . . 111
5.4 Conclusions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 115
6 Energy-preserving Lie Group Variational Integrators on SE(3) 117
6.1 Continuous Time Model . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 118
6.1.1 Extended Lagrangian Mechanics on SE(3) . . . . . . . . . . . . . . . 118
6.1.2 Equations of Motion . . . . . . . . . . . . . . . . . . . . . . . . . . . 122
6.2 Adaptive Variational Integrator . . . . . . . . . . . . . . . . . . . . . . . . . 123
6.2.1 Extended Discrete Lagrangian Mechanics on SE(3) . . . . . . . . . . 124
6.2.2 Numerical properties of the adaptive algorithm . . . . . . . . . . . . 128
6.2.3 Computational Approach . . . . . . . . . . . . . . . . . . . . . . . . 128
6.3 Numerical Results . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 129
6.4 Conclusions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 133
7 Symplectic Accelerated Optimization on SO(3) 134
7.1 Optimization on Rn . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 136
7.1.1 Gradient-Based Optimization Techniques . . . . . . . . . . . . . . . . 136
7.1.2 Dynamic System Interpretation . . . . . . . . . . . . . . . . . . . . . 138
7.1.3 Momentum Method as a Variational Integrator . . . . . . . . . . . . 139
xi


## Page 12

7.2 Optimization on SO(3) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 141
7.2.1 Mathematical Preliminaries . . . . . . . . . . . . . . . . . . . . . . . 141
7.2.2 Gradient-Based Optimization on SO(3) . . . . . . . . . . . . . . . . . 142
7.2.3 Dynamic System Interpretation . . . . . . . . . . . . . . . . . . . . . 144
7.2.4 Symplectic Accelerated Optimization on SO(3) . . . . . . . . . . . . 145
7.3 Numerical Examples . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 147
7.3.1 Trace Function . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 148
7.3.2 Spherical Shape Matching . . . . . . . . . . . . . . . . . . . . . . . . 150
7.4 Conclusions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 151
8 Performance Assessment of Energy-preserving, Adaptive Time Step Vari-
ational Integrators 153
8.1 Energy Behavior . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 155
8.2 Time Transformation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 156
8.3 Conclusions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 159
9 Conclusions 160
9.1 Summary . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 160
9.2 Future Work . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 162
9.2.1 Key Thrust Areas for Broader Use . . . . . . . . . . . . . . . . . . . 162
9.3 Specific Future Research Directions . . . . . . . . . . . . . . . . . . . . . . . 164
xii


## Page 13

Bibliography 166
xiii


## Page 14

List of Figures
2.1 The taxonomy of structure-preserving methods based on the qualitative fea-
tures they preserve for a mechanical system. . . . . . . . . . . . . . . . . . . 18
2.2 A cartoon illustrating the continuous time variational mechanics (left) versus
the discrete time variational mechanics (right). . . . . . . . . . . . . . . . . . 20
2.3 A cartoon illustrating the use of energy-momentum method where conser-
vation of energy is achieved by an implicit momentum-preserving projection
onto the surface of constant energy H . . . . . . . . . . . . . . . . . . . . . 29
2.4 A cartoon illustrating the use of a Lie group method (left) versus a conven-
tional method (right) in the case M = G. (The Lie algebra g is the tangent
space to G at the identity e ∈ G .) . . . . . . . . . . . . . . . . . . . . . . . . 33
2.5 GNI applications from literature . . . . . . . . . . . . . . . . . . . . . . . . . 41
3.1 Two initial conditions are studied for the particle in double-well potential.
An initial time step of h0 = 0.01 is used for the adaptive time step algorithm
in both cases. The fixed time step size is chosen such that number of total
time steps is same as the adaptive algorithm. Phase space trajectories for
both fixed time step and adaptive time step algorithms are compared to the
benchmark trajectory. The trajectories in each figure are indistinguishable
verifying the equations. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 55
xiv


## Page 15

3.2 Energy error plots for both fixed time step and adaptive time step algorithms
are compared for two different initial conditions. Each figure shows the supe-
rior energy performance of the adaptive time step algorithm. . . . . . . . . . 57
3.3 Trajectory error plots for both fixed time step and adaptive time step al-
gorithms are compared for two different initial conditions. Each figure, es-
pecially the highly nonlinear case (b), clearly shows the superior trajectory
performance of the adaptive time step algorithm. . . . . . . . . . . . . . . . 57
3.4 Adaptive time step versus iteration number for both initial conditions. . . . 58
3.5 In these plots, an initial time step of h0 = 0.1 is used for the adaptive time step
algorithm to study the effect of initial time step on the accuracy of discrete
trajectories. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 61
3.6 The energy error plots with an initial time step of h0 = 0 .1 for the adaptive
time step algorithm. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 63
3.7 The increase in condition number with decrease in initial time step for the
adaptive time step algorithm. . . . . . . . . . . . . . . . . . . . . . . . . . . 63
3.8 Three forcing frequency ratio values are studied for the forced harmonic oscil-
lator system. Discrete trajectories for both fixed time step and adaptive time
step variational integrators are plotted and compared with the analytical so-
lution for an initial time step h0 = 0.01 for the adaptive time step algorithm
and natural frequency ωn = 2 rad/s. . . . . . . . . . . . . . . . . . . . . . . 66
3.9 Energy error for fixed time step and adaptive time step variational integrators
are compared for three forcing frequencies. Analytical solution at the discrete
time instant is used to compute the continuous energy. . . . . . . . . . . . . 69
xv


## Page 16

3.10 Trajectory error for fixed and adaptive time step variational integrators for
the forced harmonic oscillator are compared for three forcing frequency values. 70
3.11 Adaptive time step versus the time for the time-dependent example. . . . . . 71
3.12 Three damping ratio values are studied for the spring mass damper system.
Discrete trajectories for both fixed time step and adaptive time step varia-
tional integrators are plotted and compared with the analytical solution. The
analytical solution is used to prescribe initial conditions for an initial time
step h0 = 0.01 for the adaptive time step and natural frequency ωn = 2 rad/s. 72
3.13 Energy error for fixed time step and adaptive time step variational integrators
are compared for three cases. Analytical solution at the discrete time instant
is used to compute the continuous energy. . . . . . . . . . . . . . . . . . . . 73
3.14 Trajectory error for fixed and adaptive time step variational integrators for
the damped harmonic oscillator are compared for three damping ratio values. 74
3.15 Adaptive time step versus the time for the dissipative example. . . . . . . . 75
4.1 Cubic Hermite polynomials plotted over one time-step. . . . . . . . . . . . . 83
4.2 Phase space trajectory comparison for fixed time-step h = 0.1 . . . . . . . . 90
4.3 The energy error comparison for the two trajectories . . . . . . . . . . . . . 90
4.4 Convergence analysis of temporal error in configuration, velocity and energy
for the nonlinear conservative system. . . . . . . . . . . . . . . . . . . . . . . 91
4.5 Duffing oscillator numerical simulation with α = −1, β = 2 time-step h = 0.1 93
4.6 Duffing oscillator numerical simulation with α = −1, β = 2 time-step h = 0.1 94
4.7 Sketch of a two degrees of freedom aeroelastic section model . . . . . . . . . 95
xvi


## Page 17

4.8 Subcritical LCO simulation using proposed one-step methods . . . . . . . . 96
4.9 Total energy of the aeroelastic system . . . . . . . . . . . . . . . . . . . . . . 97
4.10 Energy error comparison between one-step Galerkin and variational methods 98
5.1 Adaptive time step behavior for both cases . . . . . . . . . . . . . . . . . . . 112
5.2 Small perturbation from the hanging equilibrium. (Adaptive algorithm: solid.
Fixed algorithm: dashed) . . . . . . . . . . . . . . . . . . . . . . . . . . . . 114
5.3 Small perturbation from the inverted equilibrium. (Adaptive algorithm: solid.
Fixed algorithm: dashed) . . . . . . . . . . . . . . . . . . . . . . . . . . . . 115
5.4 Order with respect to energy and computational cost(Adaptive algorithm:
red, circle. Fixed algorithm: blue, cross) . . . . . . . . . . . . . . . . . . . . 115
6.1 Adaptive time step behavior for all cases . . . . . . . . . . . . . . . . . . . . 131
6.2 Energy behavior comparison (Adaptive algorithm: red, solid. Fixed algo-
rithm: blue, dotted) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 131
7.1 Convergence comparison between gradient descent (GD), accelerated gradient
descent (AGD) and symplectic accelerated gradient descent (SAGD) on SO(3)
for minimization of f (R) = −tr[X T R] . . . . . . . . . . . . . . . . . . . . . 149
7.2 Convergence comparison between AGD and GD on SO(3) for spherical shape
matching problem . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 149
7.3 Comparison of function and gradient value plots over iterations . . . . . . . 151
8.1 Discrete energy error results using VPA . . . . . . . . . . . . . . . . . . . . 156
xvii


## Page 18

8.2 adaptive time step behavior using VPA . . . . . . . . . . . . . . . . . . . . . 157
xviii


## Page 19

List of Tables
5.1 Fixed and Adaptive Algorithm Comparison for the 3D Pendulum . . . . . . 114
6.1 Fixed and Adaptive Algorithm Comparison for the Underwater Vehicle . . . 132
xix


## Page 20

Chapter 1
Introduction
1.1 Background and Motivation
Scientists at NASA’s Jet Propulsion Laboratory (JPL) [ 1] recently announced that 2002
AJ129, a Potentially Hazardous Asteroid (PHA), would fly safely past earth on February
4, 2018. Based on their long-time simulation results, they also predicted that the asteroid
has zero chance of colliding with Earth any time over next 100 years. At a dramatically
different space and time scale, conditions at the subatomic level in the Large Hadron Collider
(LHC) are being numerically simulated at a resolution of trillionths of a second to answer
fundamental questions about the cosmos [ 2]. Beyond astrodynamics and particle physics, the
study of ocean currents and atmospheric clouds in geophysical fluid dynamics, of energy and
momentum transfer processes in plasma physics, and of molecular dynamics with disparate
time scales also require very accurate long-time simulation. In many of these applications, the
governing physical equations derive from a variational principle and their solutions exhibit
physically meaningful invariants such as momentum, energy, or vorticity.
As modern challenges in engineering and science grow in complexity and dimension, the need
for sophisticated numerical methods to support model-based design and analysis also grows.
With increasing computational power, numerical solutions to increasingly sophisticated prob-
lems can be computed over longer time intervals, with millions of time integration steps. For
such problems, the qualitative properties of the integrator are critical to the accuracy of the
1


## Page 21

2 Chapter 1. Introduction
numerical simulation and reliability of long range predictions. In engineering applications,
numerical methods for studying dynamical systems are usually designed to give rapid and
robust numerical solutions with small overall error. Traditional numerical schemes do not
account explicitly for the qualitative features of the underlying physical system, however,
incurring error that may suggest nonphysical behavior.
The field of geometric numerical integration (GNI) is concerned with numerical methods that
respect the fundamental physics of a problem by preserving the geometric properties of the
governing differential equations. Using ideas from geometric mechanics and differential ge-
ometry, the field of GNI has produced a variety of numerical methods for simulating systems
described by ordinary differential equations (ODEs), which respect the qualitative features
of the dynamical system. GNI methods appeal to physicists, mathematicians, and engineers
for many reasons. For physicists, the geometric structure of a dynamical system reveals
essential, qualitative features in the system’s evolution – features that should appear in an
accurate simulation. For mathematicians, numerical methods based on discrete variational
principles may exhibit superior numerical stability and structure-preserving capabilities. For
engineers, these methods can advance model-based design and analysis by preserving fidelity
to the physical, continuous-time system, enabling, for example, more accurate predictions of
the energy transfer between subsystems.
Since the emergence of computational methods, fundamental properties such as accuracy,
stability, convergence and computational efficiency have been considered crucial for deciding
the utility of a numerical algorithm. Recently, various aspects of structure-preservation have
emerged as an important addition to these fundamental properties. One of the key ideas of
the structure-preserving approach is to treat the numerical method as a discrete dynamical
system which approximates the flow of the governing continuous differential equation instead
of focusing on numerical approximation of a single trajectory. Such an approach allows a


## Page 22

1.1. Background and Motivation 3
better understanding of the invariants and qualitative properties of the numerical method.
Mechanical systems, in particular, often exhibit physically meaningful invariants such as
momentum, energy, or vorticity; the behavior of these invariants in simulation provides an
important measure of accuracy. Most traditional numerical methods do not account for the
underlying geometric structure of the physical system, however, so these methods introduce
numerical dissipation and fail to preserve invariants of the system. A structure-preserving
numerical method, on the other hand, can ensure that qualitative features, such as invariants
of motion or the structure of the configuration space, are reflected in the simulation and they
can provide accurate numerical simulation over exponentially long times.
GNI emerged as a major thread in the development of numerical methods in the 1990s. The
field has grown steadily due to the efforts of mathematicians concerned with accurately sim-
ulating the behavior of solutions to differential equations, and thus with numerical methods
that respect the underlying problem structure. These methods have proven quite useful for
conservative Lagrangian/Hamiltonian systems; their numerical stability and accurate pre-
diction of the (constant) system energy make them useful tools for studying complicated
dynamical systems. In fact, research over the past two decades has produced GNI meth-
ods for finite-dimensional, time-invariant mechanical systems subject to conservative forcing
that are so accurate for long-time simulation that they are now used for benchmarking pur-
poses. Even for short-term simulations, it has been frequently observed that the structure-
preserving approach enjoys smaller errors per time step compared to traditional methods,
especially for problems involving finite-time singularities. Since its advent, the structure-
preserving approach has become the new benchmark in the simulation of ODEs, while also
making substantial progress in the numerical study of partial differential equations (PDEs).


## Page 23

4 Chapter 1. Introduction
1.2 Research Objectives
Advances in GNI methods for finite-dimensional, time-invariant mechanical systems subject
to conservative forcing have produced algorithms so accurate for long-time simulation that
they are now used for benchmarking purposes. There is a present need and opportunity,
however, to extend these techniques to time-varying systems subject to non-conservative
external forcing. The overarching goal of the current research is to develop and disseminate
new structure-preserving numerical methods for mechanical systems with external forcing
and time-dependence, which are often found in engineering applications. The specific objec-
tives supporting this goal are:
1. Construct geometric numerical integration schemes based on variational principles –
schemes that are general enough to apply to a large class of engineering problems –
and investigate the advantages of these tools in comparison with traditional numerical
methods.
2. Develop a theoretical framework which encapsulates variational integration for me-
chanical systems with external forcing and time-dependence and which supports the
extension of these methods to systems that are constrained or that evolve on non-
Euclidean manifolds.
3. Taking selected engineering problems with different qualitative features as case studies,
apply a variety of structure-preserving numerical methods and investigate their relative
performance using relevant metrics (e.g., energy error, computational cost, solvability,
numerical stability).


## Page 24

1.3. Summary of Contributions 5
1.3 Summary of Contributions
The main contributions of this dissertation are summarized as follows.
Chapter 2
• Basic differential geometry and geometric mechanics concepts are introduced from a
variational point of view.
• A review of various structure-preserving numerical methods is given which covers the
basics of variational integrators, energy-momentum integrators and Lie group methods
in an accessible way.
• A survey of engineering applications of structure-preserving methods is given for broader
use by practitioners.
Chapter 3:
• Energy-preserving, adaptive time step variational integrators for forced Lagrangian
systems are derived by discretizing the Lagrange-d’Alembert principle.
• Detailed numerical results with a condition number study are provided.
Chapter 4:
• Hermite polynomial based one-step variational and Galerkin methods are derived for
C1– continuous numerical integration of mechanical systems.


## Page 25

6 Chapter 1. Introduction
Chapter 5:
• Energy-preserving, adaptive time step Lie group variational integrators are derived for
rigid body attitude dynamics.
Chapter 6:
• Energy-preserving, adaptive time step Lie group variational integrators are derived for
rigid body motion in SE(3).
Chapter 7:
• Classical momentum method on Rn is demonstrated as a variational integrator of a
damped harmonic oscillator with a nonlinear potential.
• Symplectic accelerated gradient method on SO(3) is derived using the Lie group vari-
ational integrator framework.
Chapter 8:
• Backward stability of energy-preserving, adaptive time step variational integrators
is investigated by interpreting them as fixed time-step variational integrators on a
transformed space.
1.4 Publications
This dissertation draws upon the following papers that have or will be submitted for publi-
cation, but the contents from these papers have been modified to avoid repetition of material
and fit the general theme of this dissertation.


## Page 26

1.4. Publications 7
• Journal Paper: H. Sharma, J. Borggaard, M. Patil, C. Woolsey, “Performance As-
sessment of Energy-preserving, Adaptive Time Step Variational Integrators” for Jour-
nal of Geometric Mechanics (In preparation)
• Journal Paper: H. Sharma, M. Patil, C. Woolsey, “Hermite-based One-step Vari-
ational and Galerkin Methods for Mechanical Systems” for International Journal for
Numerical Methods in Engineering (In preparation)
• Journal Paper: H. Sharma, M. Patil, C. Woolsey, “A Review of Structure-preserving
Numerical Methods for Engineering Applications” , Computer Methods in Applied Me-
chanics and Engineering, Volume 366, 2020
• Journal Paper: H. Sharma, M. Patil, C. Woolsey, “Energy-preserving Variational
Integrators for Forced Lagrangian Systems” , Communications in Nonlinear Science
and Numerical Simulation, Volume 64, 2018, pp. 159-177
• Conference Proceedings: H. Sharma, T. Lee, M. Patil, C. Woolsey, “Symplectic
Accelerated Optimization on SO(3) with Lie Group Variational Integrators” , American
Control Conference, 2020 (Peer reviewed paper and presentation)
• Conference Proceedings: H. Sharma, M. Patil, C. Woolsey, “Energy-preserving,
Adaptive Time-Step Lie Group Variational Integrators for Rigid Body Motion in
SE(3)”, Conference on Decision and Control, 2019 (Peer reviewed paper and pre-
sentation)
• Conference Proceedings: H. Sharma, T. Lee, “Energy-preserving, Adaptive Time-
Step Lie Group Variational Integrators for the Attitude Dynamics of a Rigid Body” ,
American Control Conference, 2019 (Peer reviewed paper and presentation)


## Page 27

Chapter 2
Review of Literature
The main goal of this chapter is to encourage the broader use of structure-preserving numer-
ical methods in engineering applications by providing an overview of existing GNI methods
and their capabilities in an accessible way, while adding perspectives and application exam-
ples from the literature. In order to be able to use structure-preserving methods in practice,
it is necessary to understand their theoretical bases, numerical properties, limitations and
computational complexity. This chapter summarizes all these aspects as comprehensively
as possible without delving deep into the mathematical details. In the last two decades the
field of structure-preserving methods has grown considerably, with many points of view and
intricate subtleties. Since this work is intended to provide a gateway into the field for prac-
titioners, we have attempted to address the underlying principles and ideas in this survey,
rather than describing specific algorithms and their numerical implementation.
This chapter is organized as follows. In Section 2.1 we give an overview of the geometry
and qualitative features of continuous-time dynamical systems with special focus on La-
grangian/Hamiltonian mechanics and mechanical systems evolving on non-Euclidean man-
ifolds. The perspective taken here is to describe in broad brush strokes the different types
of qualitative features that can be preserved for mechanical systems found in engineering
problems. In Section 2.2 we provide a brief introduction to the formulation of a variety of
structure-preserving methods, including symplectic methods, variational integrators, energy-
momentum integrators, and Lie group methods. In Section 2.3 we give a selection of appli-
8


## Page 28

2.1. Geometric Structure Underlying Continuous Systems 9
cations from the literature, that may benefit from a structure-preserving approach based on
the requirements of a particular application.
2.1 Geometric Structure Underlying Continuous Sys-
tems
The geometric structure is a property of the governing differential equation which can be
defined independently of particular coordinate representations. The structure-preserving ap-
proach to numerical simulation views the numerical method as a discrete dynamical system
which inherits this geometric structure from the continuous system. Thus, for a better un-
derstanding of structure-preserving numerical schemes, we look at the continuous dynamical
systems, governing differential equations and their qualitative properties. Although a lot
of methods to be discussed in this chapter can be applied to a broader class of problems,
this work pays special attention to Lagrangian/Hamiltonian mechanical systems evolving on
manifolds as they are among the most important class of engineering systems in the context
of GNI.
2.1.1 Basic Concepts
The modern formulations of Lagrangian and Hamiltonian mechanics [ 3, 4, 5] utilize the
coordinate-free language of differential geometry [ 6, 7] to provide a unifying framework for
many disparate engineering systems. Apart from elegance and precise mathematical formu-
lation, use of differential geometry allows applications to mechanical systems evolving on
general manifolds. In this subsection we give a quick review of differential geometry con-
cepts used in the Lagrangian mechanics framework. We emphasize the fundamental concepts


## Page 29

10 Chapter 2. Review of Literature
required for the variational mechanics while suppressing the technical details.
The concept of a smooth manifold is central to the geometric treatment of classical mechanics
as it generalizes ideas developed on linear vector spaces to non-Euclidean spaces. Manifolds
naturally arise as the configuration spaces for a variety of engineering applications, especially
for mechanical systems with restrictions on the allowed motion due to physical constraints.
For example, the unit sphere S2 = {(x, y, z) ∈ R3| x2 + y2 + z2 = 1 } is the configuration
space of a spherical pendulum. The sphere S2 is a two-dimensional manifold embedded in
R3.
Mathematically, manifolds are topological spaces that are locally equivalent to Euclidean
spaces - such as Rn. In simple words, for each point on the n−dimensional manifold, the
points in the neighborhood can be labeled using n local coordinates. The important distinc-
tion from the vector spaces is that these coordinates are only valid in a small neighborhood
of each point and not globally on manifolds. For most of the mechanical systems evolving on
manifolds, the configuration manifolds are equipped with differentiable structure allowing
calculus on manifolds.
The Lagrangian and Hamiltonian mechanics formulations defined on vector spaces provide
local mathematical formulations of mechanics on manifolds using multiple coordinate maps.
From the Lagrangian mechanics perspective, there are two basic requirements for study-
ing the dynamics of mechanical systems. First, we need to identify the set of all possible
configurations of the system as the configuration manifold. The second requirement is to
develop a Lagrangian function which is a real-valued function defined on the state space.
For mechanical systems that are most commonly considered, the Lagrangian function is the
difference between the kinetic energy of the system and the potential energy of the system.
This Lagrangian function is then used in Hamilton’s principle to obtain Euler-Lagrange
equations. The Hamiltonian perspective on the other hand utilizes the phase space version


## Page 30

2.1. Geometric Structure Underlying Continuous Systems 11
of Hamilton’s principle to derive Hamilton’s equations.
Consider a mechanical system evolving on a configuration manifold Q. The tangent space
to Q at the configuration q ∈ Q is the set of all tangent vectors based at q, denoted by
TqQ. The dual space of TqQ, i.e. the set of all linear maps from TqQ to R, is called the
contangent space and is denoted by T ∗
q Q. For the path q(t) on the manifold Q, the velocity
˙q(t) at time t is a tangent vector to Q, based at the point q(t) ∈ Q. The tangent bundle
of Q, denoted by T Q, is the union of all of the tangent spaces to Q. The configuration
and velocity (q(t), ˙q(t)) belong to the tangent space to Q at q(t) and hence the state space
is represented by the tangent bundle T Q. On the other hand, the configuration and the
momentum (q(t), p(t)) belong to the cotangent space, and hence the phase space can be
identified with the collection of all the cotangent spaces to Q, namely the cotangent bundle
T ∗Q. Subsequently, the Lagrangian L : T Q → R is defined on the tangent bundle T Q
whereas the Hamiltonian H : T ∗Q → R is defined on the cotangent bundle T ∗Q.
It is important to recognise that this geometric formulation can be used to describe and
analyze dynamical systems globally without resorting to local coordinate maps that may lead
to singularities. In fact this representation is both efficient and advantageous for studying
qualitative properties of complex dynamical systems but has not been widely used by the
engineering community.
2.1.2 Lagrangian Mechanics
In the late seventeenth century, Newton’s laws of motion [ 8] provided a way to study the
dynamics for free point masses but this approach didn’t work that well for more complicated
mechanical systems such as rigid bodies or connected bodies. Lagrange [ 9, 10] came up
with an elegant way of computing the dynamics of general mechanical systems; he derived


## Page 31

12 Chapter 2. Review of Literature
a coordinate-invariant formulation of the equations of motion in terms of the Lagrangian.
A few decades later Hamilton [ 11, 12] simplified the structure of these equations using the
variational principle that bears his name. We closely follow [ 13] to revisit the variational
derivation of the Euler-Lagrange equations and their qualitative properties from the La-
grangian point of view.
Consider a time-invariant Lagrangian mechanical system with a finite-dimensional, smooth
configuration manifold Q, state space T Q, and Lagrangian L : T Q → R. Hamilton’s princi-
ple [ 14] states that: The motion of the system between two fixed points from ti to tf is such
that the action integral has a stationary value for the actual path of the motion. For a con-
servative Lagrangian system, Hamilton’s principle characterizes the path q(t) which passes
through q(ti) at t = ti and q(tf ) at t = tf as that which satisfies the following condition:
δB(q) = δ
Z tf
ti
L(q(t), ˙q(t)) dt =
Z tf
t0
 ∂L(q(t), ˙q(t))
∂q(t) · δq(t) + ∂L(q(t), ˙q(t))
∂ ˙q(t) · δ ˙q(t)

dt = 0
(2.1)
Using integration by parts and setting the variations at the endpoints equal to zero gives the
Euler-Lagrange equations
∂L(q(t), ˙q(t))
∂q − d
dt
 ∂L(q(t), ˙q(t))
∂ ˙q

= 0 (2.2)
Mechanical systems governed by equations ( 2.2) exhibit important qualitative features. For
autonomous Lagrangian systems i.e. no explicit time-dependence in the Lagrangian, the
energy is conserved along the solution trajectory. Second, by Noether’s theorem [ 15], there
exists an invariant of the motion corresponding to each symmetry that leaves the Lagrangian
invariant. Another interesting and useful property is that these Lagrangian mechanical sys-
tems conserve a skew-symmetric, bilinear form known as the symplectic Lagrangian form
along trajectories [ 3]. For mechanical systems with explicit time-dependence in the La-


## Page 32

2.1. Geometric Structure Underlying Continuous Systems 13
grangian, the governing equations and the qualitative features of the nonautonomous system
can be studied by utilizing the extended Lagrangian mechanics framework [ 13]. Unlike stan-
dard Lagrangian mechanics, the extended framework accounts for time variations in addition
to the configuration variable variations.
The governing equations ( 2.2) and their properties discussed above can also be derived from
the Hamiltonian point of view by considering Hamilton’s principle in phase space. Depend-
ing on the problem, some properties can be observed and understood from the Lagrangian
perspective and others are easier from the Hamiltonian perspective. For most engineering
applications, the Lagrangian is hyperregular and it is possible to obtain the governing equa-
tions in the Hamiltonian form from ( 2.2) via Legendre transformation. However, for some
applications such as interaction between point vortices [ 16], the Lagrangian is degenerate
and no corresponding Hamiltonian formulation exists. Apart from these two approaches,
the Hamilton-Jacobi viewpoint is also very important for developing structure-preserving
numerical methods. This theory describes the motion of the system by a characteristic func-
tion S that is the solution of a PDE, known as the Hamilton-Jacobi differential equation.
This approach is particularly useful in discovering invariants of the motion for mechanical
systems without solving the problem completely.
For an autonomous Lagrangian system with time-independent external forcing fL(q(t), ˙q(t)),
the Lagrange-d’Alembert principle characterizes trajectories q(t) ∈ Q as those satisfying
δ
Z tf
ti
L(q(t), ˙q(t)) dt +
Z tf
ti
fL(q(t), ˙q(t)) · δq dt = 0 (2.3)
where the second term accounts for the virtual work done by the external forces when the
path q(t) is varied by δq(t). Using integration by parts and setting the variations at the


## Page 33

14 Chapter 2. Review of Literature
endpoints equal to zero gives the forced Euler-Lagrange equations
∂L(q(t), ˙q(t))
∂q − d
dt
 ∂L(q(t), ˙q(t))
∂ ˙q

+ fL(q(t), ˙q(t)) = 0 (2.4)
Non-conservative external forcing fL violates the symplectic structure and the corresponding
Lagrangian system does not preserve the symplectic form. This external forcing will generally
break the symmetries of the Lagrangian and that will lead to the corresponding momentum
as well as the system energy not being conserved. In the special case that the forcing
is orthogonal to the symmetry, the corresponding conserved quantity can be derived from
the forced Noether’s theorem [ 13]. Although these forced mechanical systems do not, in
general, preserve the invariants or the symplectic form, the variational approach reveals
how the external forcing alters these properties over time. This is particularly important for
developing numerical methods that capture the evolution of energy or momentum accurately.
2.1.3 Variational Formulation of Different Problems
The variational methodology and the Lagrangian mechanics concepts discussed in Section
2.1.2 have been successfully extended to a variety of mechanical systems. In this subsection,
we summarize the qualitative features and the geometric properties of various classes of
mechanical problems that are important for engineering applications. To keep this treatise
as simple and direct as possible, we have skipped a lot of mathematical details and focused
mainly on the key ideas relevant to structure-preserving discretization. For a thorough expo-
sition, the interested reader may consult the standard textbooks [ 3, 4, 17] and the references
cited herein.


## Page 34

2.1. Geometric Structure Underlying Continuous Systems 15
Holonomic Constraints: The formulation can be extended to mechanical systems with
holonomic constraints, i.e. constraints on the configuration manifold, by the augmented
approach using the Lagrange multiplier theorem [ 17]. For a Lagrangian system with d holo-
nomic constraints ϕ : Q → Rd, the augmented Lagrangian ¯L is defined as ¯L(q(t), ˙q(t), λ(t)) =
L(q(t), ˙q(t))− < λ(t), ϕ(q(t)) >. The configuration q(t) ∈ Q along with the Lagrange mul-
tipliers λ(t) ∈ Rd extremize the action integral corresponding to the augmented Lagrangian
¯L(q(t), ˙q(t), λ(t)) which leads to constrained Euler-Lagrange equations [ 13].
Nonholonomic Constraints: The theory for mechanical systems with nonholonomic con-
straints [ 18], i.e. ϕ : T Q → R, uses theory of Ehresmann connections [ 19] to describe the
constraints. The basic idea is to consider a collection of linear subspaces Dq ⊂ TqQ for each
q(t) ∈ Q which together describe the velocities attainable by the system under the given con-
straints. The equations of motion for the mechanical system with nonholonomic constraints
are given by the Lagrange-d’Alembert principle where we apply ( 2.1) with variations of the
curve q(t) satisfying δq(t) ∈ D q(t). The governing equations for the nonholonomic system
feature a forcing term which involves the curvature of the connection.
Nonsmooth Problems: The variational approaches discussed so far do not apply directly
to nonsmooth problems, such as collision and fragmentation models. This is due to the lack
of smoothness of trajectories which prevents the use of differential calculus on manifolds. Us-
ing concepts from nonsmooth analysis and extended mechanics framework, the variational
approach can be generalized to the nonsmooth setting [ 20]. Similar to the time-dependent
Lagrangian case, the key idea is to treat both configuration variables and time as functions of
a fixed parameter space which makes the relevant space of configurations a smooth manifold.
Uncertainty: For mechanical systems with uncertainties, a stochastic action can be defined


## Page 35

16 Chapter 2. Review of Literature
based on the stochastic flow of randomly perturbed Hamiltonian systems. The stochastic
Hamiltonian systems [ 21] on manifolds extremize a stochastic action defined on the space
of manifold-valued semimartingales. Similar to the deterministic case, the stochastic flow is
also symplectic [ 22] and, by the stochastic Nother’s theorem [ 23], preserves the symmetries
as well.
Infinite-dimensional Systems: It is important to note that all the governing equations
and geometric properties discussed so far are only applicable to mechanical systems evolving
on finite-dimensional manifolds. For infinite-dimensional problems, the governing PDEs can
be derived thorugh a variational approach by using the covariant field theory [ 24] where
the dynamics is described in terms of finite-dimensional space of fields at a given event in
spacetime. The covariant analogue of the symplecticity property is the multisymplectic form
formula [ 25] and the covariant version of Noether’s theorem leads to conservation laws for
PDEs in the presence of symmetries.
Nonvariational Problems: An obvious limitation of the variational methodology is that
it can be only used for Lagrangian/Hamiltonian systems. Although all conservative [ 26] and
a wide variety of non-conservative problems can be modeled using the Lagrangian formalism,
it still excludes a lot of interesting systems, for example the problems found in fluid dynamics
and thermodynamics. The inverse problem of the calculus of variations [ 27] deals with the
existence and formulation of variational principles for systems of differential equations. The
method of formal Lagrangians [ 28] can embed certain nonvariational systems into a larger
system which admits a Lagrangian formulation. This approach extends the applicability
of Noether’s theorem [ 29] to a larger class of problems and is particularly useful for the
analysis of conservation laws of arbitrary nonvariational differential equations found in fluid
dynamics and plasma physics [ 30].


## Page 36

2.2. Structure-preserving Methods 17
2.2 Structure-preserving Methods
Traditional numerical integrators for studying dynamical systems usually take an initial
condition and move the dynamical system state in the direction specified by the governing
differential equations. This approach to numerical discretization ignores the qualitative prop-
erties of the continuous-time systems and hence may introduce spurious nonphysical effects
leading to incorrect results. On the other hand, GNI methods preserve the underlying geo-
metric structure and provide qualitatively correct numerical results. The philosophy behind
this structure-preserving approach is to identify geometric properties of the continuous-time
system and then design numerical methods which possess the same properties in the discrete
domain. We focus on mechanical integrators – numerical integration methods that preserve
some of the invariants of the mechanical system, such as, energy, momentum, or the sym-
plectic form. Other properties that can be important to preserve are phase-space volume,
continuous or discrete symmetries, time-reversibility, Casimirs, the correct physical form of
dissipation, etc.
In this section, we provide a brief introduction along with a summary of recent developments
in numerical integration of Lagrangian/Hamiltonian mechanical systems. Since our focus is
on Lagrangian/Hamiltonian systems, we first look at numerical methods which preserve the
symplecticity of the flow. In fact, most of the early developments in the field of GNI methods
were related to development of numerical integrators that preserved the symplectic nature
of the flow. We then look at the two most important classes of mechanical integrators: vari-
ational integrators and energy-momentum integrators. We also discuss Lie group methods
for mechanical systems evolving on manifolds.


## Page 37

18 Chapter 2. Review of Literature
Figure 2.1: The taxonomy of structure-preserving methods based on the qualitative features
they preserve for a mechanical system.
2.2.1 Symplectic Methods
As mentioned in Section 2.1.2, the symplectic property has geometric implications regarding
the way in which the Lagrangian flow acts on a set of initial conditions. In simple words,
symplecticity describes how all motions starting close to the actual motion are constrained in
relation to each other. Based on this observation, Vogelaere [ 31] first developed numerical in-
tegrators that preserved this symplectic property of Hamilton’s equations in 1950s. Although
the symplectic methods for Lagrangian/Hamiltonian problems have a long history with dif-
ferent approaches, modern efforts can be traced to the generating function based methods
of Feng et al [26] and Ruth [ 32] where they constructed symplectic methods by computing
approximate solutions of the Hamilton-Jacobi equation. Later, Lasagni [ 33], Sanz-Serna
[34], and Suris [ 35] showed that certain Runge-Kutta methods preserve symplecticity and
they constructed symplectic Runge-Kutta methods from different perspectives. Reich [ 36]
showed that the symplectic Runge-Kutta methods conserve the momentum for Hamiltonian
problems with linear symmetries.


## Page 38

2.2. Structure-preserving Methods 19
These methods preserve the symplectic nature of Hamiltonian systems, conserve the mo-
menta and reproduce the dynamic behavior accurately for a long time. The excellent long-
time behavior of the symplectic methods can be explained by backward error analysis where
instead of asking “What is the numerical error for our problem?”, the focus is on “Which
nearby problem is solved exactly by our method?” . Through backward error analysis of
Hamiltonian ODEs, Reich [ 37] showed that symplectic methods solve a nearby Hamiltonian
problem exactly. Thus, despite not conserving the energy of the system exactly, computed
trajectories from symplectic methods always remain close to the solution and the energy
error remains bounded for an exponentially long time.
Ge and Marsden [ 38] showed that a fixed time step numerical integrator cannot preserve
the symplectic form, momentum, and energy simultaneously for non-integrable systems.
Consequently, the structure-preserving fixed time step mechanical integrators can be divided
into two categories: (i) energy-momentum and (ii) symplectic-momentum integrators.
2.2.2 Variational Integrators
In comparison to symplectic methods based on the generating functions, variational inte-
grators constitute a more recent approach toward the structure-preserving discretizations
of Lagrangian/Hamiltonian mechanical systems. These methods utilize concepts from dis-
crete mechanics, a discrete analogue to continuous-time Lagrangian/Hamiltonian mechanics.
Due to their variational nature, these methods can be easily extended to non-conservative
mechanical systems by discretizing the Lagrange-d’Alembert principle. The basic idea is
to construct a discrete-time approximation of the action integral called the discrete action.
Stationary points of this discrete action give discrete-time trajectories of the mechanical
system.


## Page 39

20 Chapter 2. Review of Literature
Depending on the application, various authors have proposed different versions of discrete
mechanics. In fact, discrete-time versions of variational principles are of mathematical in-
terest in their own right. Based on the concept of a difference space, Maeda [ 39] presented
a discrete version of Hamilton’s principle and derived discrete Euler-Lagrange equations.
Using the same discretization, Maeda [ 40] later extended Noether’s theorem to the discrete
setting. Veselov [ 41, 42] pursued these ideas further in the context of integrable systems
and showed that these discrete-time systems preserve a symplectic form. Building on these
results, Moser and Veselov [ 43] presented discrete versions of several classical integrable
systems including the free rigid body system.
Based on these concepts, Marsden and West [ 44] developed a theory of discrete mechanics,
from both Lagrangian and Hamiltonian perspectives, and derived variational integrators
by considering the discrete analogue of variational principles. Although the derivation of
variational integrators from discrete variational principles was first given in [ 45], we closely
follow [ 44] to give a brief review of the construction of variational integrators from the
Lagrangian perspective. The idea behind variational integrators is simple: rather than
discretize the governing equations ( 2.2) or ( 4.2), one discretizes the underlying variational
principle ( 2.1) or ( 2.3).
Figure 2.2: A cartoon illustrating the continuous time variational mechanics (left) versus
the discrete time variational mechanics (right).
Consider a discrete Lagrangian system with configuration manifold Q and discrete state


## Page 40

2.2. Structure-preserving Methods 21
space Q × Q. For a fixed time step h = tf −ti
N , the discrete trajectory { qk }N
k=0 is defined
by the configuration of the system at the sequence of times { tk = ti + kh | k = 0 , ..., N} .
We introduce the discrete Lagrangian function Ld(qk, qk+1), an approximation of the action
integral along the curve from qk to qk+1, which approximates the integral of the Lagrangian
in the following sense
Ld(qk, qk+1) ≈
Z tk+1
tk
L(q(t), ˙q(t)) dt (2.5)
The discrete analogue of Hamilton’s principle seeks curves { qk }N
k=0 that satisfy
δ
N −1X
k=0
Ld(qk, qk+1) =
N −1X
k=0
 ∂Ld(qk, qk+1)
∂qk
· δqk + ∂Ld(qk, qk+1)
∂qk+1
· δqk+1

= 0 (2.6)
which gives the discrete Euler-Lagrange equations
D2Ld(qk−1, qk) + D1Ld(qk, qk+1) = 0 k = 1, ..., N − 1 (2.7)
where Di denotes differentiation with respect to the ith argument of the discrete Lagrangian
Ld. Given (qk−1, qk), the above equations can be solved to obtain (qk, qk+1). Thus, the
discrete Euler-Lagrange equations can be seen as a numerical integrator of ( 2.2) and these
equations can be implemented as a variational integrator for autonomous Lagrangian sys-
tems. Using the discrete Legendre transform, we can re-write the discrete Euler-Lagrange
equations in the Hamiltonian form as follows
− D1Ld(qk, qk+1) = pk (2.8)
pk+1 = D2Ld(qk, qk+1) (2.9)
where the discrete momentum pk converges to its continuous counterpart as the fixed time
step h approaches zero. Given (qk, pk), the above equations ( 2.8)-(2.9) can be solved to


## Page 41

22 Chapter 2. Review of Literature
obtain (qk+1, pk+1).
Since the governing discrete equations are derived from the discrete Lagrangian function, the
accuracy of trajectories depends on the order of approximation of the discrete Lagrangian.
Marsden and West [ 44] showed that a discrete Lagrangian of order r + 1 leads to a varia-
tional integrator of order r. Regardless of the choice of the discrete Lagrangian, the fixed
time step variational integrators are symplectic [ 46] and momentum-preserving [ 44, 47]. The
discrete Lagrangian system preserves a discrete symplectic form [ 45] and when the discrete
system has a symmetry, there is a corresponding conserved quantity at the discrete level.
While these fixed time step algorithms do not exactly preserve energy, backward error anal-
ysis [ 37, 48] shows that these methods, up to exponentially small errors, exactly integrate
a nearby Hamiltonian system. To be more precise, for a small enough fixed time step,
the discrete energy computed from the numerical integration will remain close to its initial
value for an exponentially long time [ 46, 49]. In practice, the energy error remains bounded
without exhibiting drift. As the fixed time step h decreases, the amplitude of energy er-
ror oscillations decrease and the discrete energy approaches the continuous system energy.
Because of their excellent long-time stability, these variational integrators – also known as
symplectic-momentum integrators – are ideal for long-time simulation of conservative dy-
namical systems.
Marsden and West [ 44] showed that the discrete Lagrangian function Ld(qk, qk+1) is a gen-
erating function for the discrete Lagrangian system. Thus, the discrete equations ( 2.8)-(2.9)
can be seen as a symplectic method with the corresponding discrete Lagrangian as the ap-
proximation to the continuous generating function. This way both symplectic methods and
variational integrators belong to the same class of structure-preserving methods but their
construction is very different. In contrast to symplectic methods, the variational approach
extends easily to non-conservative systems and has more theoretical appeal: the symplec-


## Page 42

2.2. Structure-preserving Methods 23
tic property as well as the conserved discrete quantities can be derived directly from the
variational nature of the algorithm as opposed to the trial and error method. In fact, the
variational approach has been useful in explaining the excellent numerical performance of
widely used integrators such as Newmark methods [ 50].
To introduce external forcing, we define two discrete forces f±
d : Q × Q → T ∗Q which
approximate the continuous-time force integral that appears in ( 2.3) over one time step in
the following sense
f+
d (qk, qk+1) · δqk+1 + f−
d (qk, qk+1) · δqk ≈
Z tk+1
tk
fL(q(t), ˙q(t)) · δq dt (2.10)
The discrete Lagrange-d’Alembert principle seeks curves { qk }N
k=0 that satisfy
δ
N −1X
k=0
Ld(qk, qk+1) +
N −1X
k=0
[f+
d (qk, qk+1) · δqk+1 + f−
d (qk, qk+1) · δqk] = 0 (2.11)
which yields the following variational integrator for forced Lagrangian systems:
− D1Ld(qk, qk+1) − f−
d (qk, qk+1) = pk (2.12)
pk+1 = D2Ld(qk, qk+1) + f+
d (qk, qk+1) (2.13)
For forced Lagrangian mechanical systems, variational integrators ( 2.12)-(2.13) have been
shown to exhibit better energy behavior than traditional numerical integrators [ 44, 50] for
weakly dissipative systems. Since the external forcing fL(q(t), ˙q(t)) modifies the symplectic
structure at every time step, unlike in the conservative case, there are no theoretical results
about long-time stable behavior. Despite the lack of theoretical guarantees, the numerical
results for a variety of dissipative and forced mechanical systems have demonstrated that


## Page 43

24 Chapter 2. Review of Literature
variational integrators track the change in energy more accurately compared to traditional
methods. Similar to the continuous case, if the discrete forcing is orthogonal to the symmetry
of the discrete Lagrangian then the corresponding momentum is conserved based on the
discrete forced Noether’s theorem [ 44].
The variational approach to derive mechanical integrators has been successfully extended to
a broad class of problems such as:
• Energy-preserving, adaptive time step variational integrators: The strong
negative result of Ge and Marsden [ 38] – that integrators with a fixed time step cannot
simultaneously preserve energy, the symplectic structure, and conserved quantities for
non-integrable systems – led Kane et al [51] to develop energy-preserving variational
integrators with adaptive time stepping for conservative systems. Marsden and West
[44] derived the same integrators through a variational approach for a more general case
of time-dependent Lagrangian systems. Instead of obtaining the adaptive time step by
imposing an additional equation, as in [ 51], they treated time as a discrete dynamic
variable [52] and derived governing discrete equations in the extended Lagrangian me-
chanics framework. These adaptive time step variational integrators are energy and
momentum conserving while also preserving the extended symplectic form. These
energy-preserving integrators require solving a coupled, nonlinear, ill-conditioned sys-
tem of equations at every time step and existence of solutions for these discrete trajec-
tories is still an open problem. Shibberu [ 53] has discussed the well-posedness of these
adaptive algorithms and suggested ways to regularize [ 54] the system of coupled nonlin-
ear discrete equations. Recently, Sharma et al [55] derived energy-preserving, adaptive
time step variational integrators for forced Lagrangian systems and showed that these
adaptive algorithms, for forced Lagrangian systems, capture change in energy more
accurately than fixed time step variational integrators.


## Page 44

2.2. Structure-preserving Methods 25
• Variational integrators for constrained mechanical systems: Marsden and
West extended the variational integrator framework to account for holonomic con-
straints [44] and these methods have been utilized in applications ranging from molec-
ular dynamics to planetary motion. Their extension to mechanical systems with non-
holonomic constraints remained a challenge for some time though. Equations of motion
for a nonholonomic system are derived from the Lagrange-d’Alembert principle which
means that the nonholonomic flow does not preserve the symplectic flow [ 56]. Cortes
and Martinez [ 57] obtained nonholonomic integrators by discretizing the Lagrange-
d’Alembert principle and they also extended adaptive time step variational integrators
to nonholonomic systems using the extended Lagrangian mechanics framework from
[44]. Kobilarov et al [58] developed nonholonomic integrators for mechanical systems
with symmetries and applied them to robotic car and snakeboard examples to demon-
strate the advantages compared to standard methods.
• Stochastic variational integrators: Based on the foundational work in the field
of stochastic geometric mechanics by Bismut [ 22], Milstein et al [59, 60] developed
mean-squared symplectic integrators for stochastic Hamiltonian systems and showed
that these integrators capture the correct energy behavior even in presence of dissipa-
tion. Bou-Rabee and Owhadi [ 23] discretized the variational principle for stochastic
mechanical systems on manifolds to derive stochastic variational integrators. Similar
to their deterministic counterparts, these algorithms are symplectic and satisfy the
discrete analogue of Noether’s theorem in presence of symmetries. Bou-Rabee and
Owhadi [61] also derived constrained, stochastic, variational, partitioned Runge-Kutta
methods for stochastic mechanical systems with holonomic constraints. Holm and
Tyranwoski [62] utilized the Galerkin type of discretization to derive a more general
class of stochastic variational integrators.


## Page 45

26 Chapter 2. Review of Literature
• Variational integrators for impact problems: Building on the nonsmooth vari-
ational mechanics principles, Fetecau et al [63] developed variational collision inte-
grators. In addition to the discrete trajectory points, this methodology introduces a
collision point and the corresponding collision time, which are solved variationally.
These algorithms retain the symplectic structure as well as the excellent energy be-
havior for nonsmooth cases. One of the drawbacks of this approach is that solving for
each individual collision becomes cumbersome in situations involving many bodies un-
dergoing collision sequences. For such complex multibody collisions, Johnson et al [64]
developed discontinuous variational integrators by incorporating incremental energy
minimization in the discrete mechanics framework.
• Hamiltonian variational integrators: As mentioned in Section 2.1.2, Lagrangian
and Hamiltonian dynamics are not equivalent when the system is not hyperregular.
For such cases, Lall and West [ 65] developed discrete Hamiltonian mechanics from
the Hamiltonian side, without recourse to the Lagrangian formulation. In contrast to
the Lagrangian approach to derive variational integrators, Leok et al [66] developed
Hamiltonian variational integrators from the Hamiltonian point of view by discretizing
the Hamiltonian. These Hamiltonian variational integrators are particularly useful for
mechanical systems with degenerate Hamiltonian, such as interacting point vortices.
In fact, Schmitt and Leok [ 67] investigated numerical properties of the Hamiltonian
variational integrators and showed that, even for the same approximation method, the
Lagrangian and Hamiltonian approach may lead to different symplectic-momentum
integrators.
• Multisymplectic variational integrators: Marsden et al [25] developed the geo-
metric foundations for variational integrators for variational PDEs. Using ideas from
multisymplectic geometry [ 68], they developed numerical methods that are multisym-


## Page 46

2.2. Structure-preserving Methods 27
plectic and preserve discrete momentum maps corresponding to symmetries. Lew et
al [69] developed asynchronous variational integrators for solid mechanics problems.
These asynchronous algorithms are based on the spacetime form of the discretized
Hamilton’s principle and allow the selection of independent time steps in each spatial
element. Recently Kraus and Maj [ 30] extended the variational integrator framework
to nonvariational PDEs by utilizing the method of formal Lagrangian.
2.2.3 Energy-momentum Integrators
Conventional numerical methods for ODEs when applied to Lagrangian/Hamiltonian sys-
tems conserve the total energy and momenta only up to the order of truncation error. These
invariants of motion capture important qualitative features of the long-term dynamics. Aside
from their physical significance, from a computational point of view conserved quantities of-
ten lead to enhanced numerical stability. For example, algorithmic conservation of energy
leads to unconditional stability for nonlinear structural dynamics [ 70]. In fact, the majority
of development on this topic was due to the discovery that numerical methods with uncon-
ditional stability for linear dynamics may lose this stability in the non-linear regime [ 71].
Energy-momentum integrators, in contrast to variational integrators (symplectic-momentum
integrators), are designed to preserve the momentum and total energy of the system simul-
taneously.
Labudde and Greenspan [ 72, 73, 74] developed discrete mechanics based on difference equa-
tions and developed energy-momentum conserving algorithms for particle mechanics prob-
lems. Simo et al [75, 76] developed a more general methodology to construct energy-
momentum integrators for a wide class of mechanical systems. We closely follow [ 76] to
explain the key idea behind these methods.


## Page 47

28 Chapter 2. Review of Literature
Consider a finite-dimensional mechanical system with configuration manifold Q and canon-
ical phase space T ∗Q. For the simple case of a separable Hamiltonian/Lagrangian system
with constant mass matrix M , kinetic energy K(p) = 1
2 pT M −1p, and potential energy V (q),
the governing equations of motion are given by
˙q = M −1p ˙p = −∇V (q) (2.14)
It is well-known that the system energy (i.e. the Hamiltonian H = K + V ) and momentum
J(q, p) (corresponding to symmetries) are conserved along the solution trajectory. Given
(qk, pk), the energy-momentum approach designs an approximation (qk+1, pk+1) such that
the system energy Hk+1 = Hk and momentum Jk+1 = Jk are conserved. The strategy
in the formulation of energy-momentum integrators is to first consider the class of exact
momentum conserving schemes and then enforce the additional constraint of exact energy
conservation. For the mechanical system described above, the family of exact momentum
conserving algorithms , with fixed time step h, given by
qk+1 = qk + hκ1M −1
αpk + (1 − α)pk+1

(2.15)
pk+1 = pk − hκ2∇V

αqk+1 + (1 − α)qk

(2.16)
exactly conserve the momentum J corresponding to the symmetry for arbitrary real-valued
functions κ1 and κ2 and scalar parameter α ∈ [0, 1]. For exact energy conservation, we enforce
the law of conservation of energy on the momentum conserving algorithm ( 2.15)-(2.16).
As discussed in [ 76], this constraint can be implemented via a number of different ways.
The projection methods fix the collocation parameter to α = 1
2 and obtain κ1 and κ2 such
that the energy constraint is satisfied. From a geometric point of view, the resulting energy-
momentum integrator can be seen as an implicit projection of the mid-point rule from the


## Page 48

2.2. Structure-preserving Methods 29
Figure 2.3: A cartoon illustrating the use of energy-momentum method where conservation
of energy is achieved by an implicit momentum-preserving projection onto the surface of
constant energy H
level set of conserved momentum onto the constant energy surface. The collocation methods,
on the other hand, fix the real valued constants κ1 = κ2 = 1 and solve the energy constraint
equation for the collocation parameter α ∈ [0, 1].
It is important to note that the energy-momentum approach requires solving an implicit
equation and the stability of these methods depends on the solvability of the energy equa-
tion. Assuming the energy equation is solvable, the resulting algorithms are exactly energy
and momentum preserving. In addition to the favorable conservation properties, these algo-
rithms are unconditionally stable in the nonlinear regime. Simo and Gonzalez [ 77] showed
that the unresolved high frequencies are controlled by exact energy conservation whereas
the symplectic-momentum approach can lead to instability in such cases. These numerical
properties make the energy-momentum integrators ideal for numerical simulation of highly
oscillatory mechanical systems. Since the early development of energy-momentum integra-
tors was based on the idea of modifying the midpoint rule, all of the energy-momentum


## Page 49

30 Chapter 2. Review of Literature
conserving algorithms were symmetric. Hairer et al [46] showed that the good long-time be-
havior of energy-momentum integrators was due to their reversibility and not the conserving
properties. They also numerically demonstrated that the non-symmetric energy-momentum
integrators do not exhibit good long-time behavior.
Betsch and Steinmann [ 78, 79] presented a unifying approach to derive energy-momentum
integrators by discretizing the weighted residual of Hamilton’s equations using continuous
Galerkin methods. Unlike the finite difference approach taken by Simo and colleagues,
they employed the finite element method for the temporal discretization process and devised
quadrature rules that lead to energy-momentum integrators. Betsch and Steinmann [ 80] also
extended this Galerkin-based approach to mechanical systems with holonomic constraints
by introducing the mixed Galerkin method based on mixed finite elements in time. Later,
Groß et al [81] modified the continuous Galerkin method and derived higher order energy-
momentum integrators for multi-dimensional mechanical systems.
For dynamic problems involving high frequency content such as constrained, flexible, multi-
body problems, the high frequency oscillations can lead to convergence issues for the energy-
momentum integrators due to their lack of high frequency numerical dissipation. Armero
and Petocz [ 82] introduced numerical dissipation in the energy-momentum integrators to
derive modified energy-momentum integrators. These energy decaying schemes eliminate
the energy associated with vibratory motions at high frequency while still preserving the
momentum. Instead of satisfying a discrete energy conservation law, the energy decaying
schemes are based on the energy decay inequality given by Hughes [ 83]. Kuhl and Crisfield
[84] proposed an alternate strategy based on controllable numerical dissipation to derive
generalized energy-momentum integrators. This generalization of the energy conserving/de-
caying algorithms allows larger time steps, due to numerical damping characteristics and
these algorithms are easier to extend to adaptive time-stepping.


## Page 50

2.2. Structure-preserving Methods 31
2.2.4 Discrete Gradient Methods
The construction of energy-momentum integrators is related to the concept of discrete gra-
dients. The discrete gradient method is a general technique for deriving integral-preserving
integrators. Gonzalez [ 85] introduced discrete Hamiltonian systems as formal abstractions
of conserving algorithms based on the idea of discrete directional derivatives. Using this
discrete derivative idea, McLachlan et al [86] developed the discrete gradient methods for
the more general case of dynamical stems with a Lyapunov function.
The discrete gradient methods are applicable to systems with differential equation ˙y =
A(y)∇H(y) where A(y) is a skew-symmetric matrix. For Lagrangian/ Hamiltonian mechan-
ical systems, the vector y = (q, p) belongs to the phase space with the constant symplectic
matrix J as the skew-symmetric matrix A(y) and the Hamiltonian of the system as the
energy function H(y). The discrete gradient methods are of the form
yk+1 = yk + h ¯A(yk+1,yk) ¯∇H(yk+1, yk) (2.17)
where ¯A(ˆy, y) is a skew-symmetric matrix for all ˆy, y, and ¯∇H(ˆy, y) is the discrete gradient
satisfying
¯∇H(ˆy, y)T (ˆy − y) = H(ˆy) − H(y) ¯∇H(y, y) = ∇H(y) (2.18)
These numerical methods are symmetric and are both energy- and momentum-preserving.
It has been shown that the projection method approach to derive energy-momentum in-
tegrators is a special case of discrete gradient methods. In fact, the symmetric nature of
discrete gradient methods played an important role in explaining the good long-time behav-
ior of energy-momentum integrators. For Hamiltonian systems with holonomic constraints,
Gonzalez [ 87] applied the discrete gradient approach to the governing differential algebraic
equations to derive energy-momentum integrators for constrained mechanical systems. Re-


## Page 51

32 Chapter 2. Review of Literature
cently, Celledoni [ 88] applied the discrete gradient approach to numerical integration of
nonholonomic systems. The resulting algorithms exhibit exact energy preservation while
ensuring the nonholonomic constraints are satisfied. For PDEs, McLachlan and Quispel [ 89]
showed that discrete gradient methods preserve energy conservation laws and conserve the
energy exactly when the symplectic structure is constant. Celledoni et al [90] applied these
methods to PDEs with constant dissipative structure and the numerical results demonstrated
that the algorithms capture the correct monotonic decrease in energy.
2.2.5 Lie Group Methods
In many engineering applications, the governing differential equations evolve on a non-
Euclidean manifold and there are two main numerical approaches for such problems, em-
bedded and intrinsic methods. In the first of these approaches, as the name suggests, one
embeds the manifold in Rn and applies a traditional numerical integration scheme. The
drawback of this approach is that, except in special cases, traditional numerical methods are
unlikely to provide solutions that remain exactly on the correct manifold. The alternative
approach uses intrinsic operations on the group to make sure the computed trajectories are
guaranteed to lie on the manifold.
A Lie group G is a group which is also a differentiable manifold, and for which the group
operation G × G → G and inverse operation are smooth maps. The tangent space g = TIG
at the identity of a Lie group G is closed under commutation of its elements making it an
algebra, the Lie algebra g of the Lie group G. For a differential equation on Lie group G,
the continuous trajectory remains on the Lie group for any initial condition on G and the
flow map of the system can be seen as group operation. For example, the attitude dynamics
of a rigid body can be described as differential equations on the special orthogonal group


## Page 52

2.2. Structure-preserving Methods 33
SO(3), the group of proper orthogonal linear transformations.
Consider a dynamical system whose configuration evolves on a differentiable manifold M
subject to the action of some Lie group G. Given an initial condition y0 ∈ M , rather than
ask “What is the the state y at time t?”, the Lie group approach asks an equivalent question
[91]: “What is the group action that takes the system from y0 to y(t)?” . Posing the question
in terms of the group action helps one relate it to the underlying Lie algebra, which is
a linear space. Thus, Lie group methods include an intrinsic and consistent strategy for
the parametrization of the nonlinear manifold M in their algorithmic structure. In simple
words: Instead of solving the original ODE on M, Lie group methods solve the corresponding
problem in the Lie algebra, ensuring that the solution remains on the manifold M.
Figure 2.4: A cartoon illustrating the use of a Lie group method (left) versus a conventional
method (right) in the case M = G. (The Lie algebra g is the tangent space to G at the
identity e ∈ G .)
For dynamical systems evolving on non-Euclidean manifolds, the governing differential equa-
tions are intimately connected to Lie groups. Although the mathematical properties of differ-


## Page 53

34 Chapter 2. Review of Literature
ential equations on manifolds were well understood already by early twentieth century, it is
only in last few decades that numerical methods utilizing these aspects have been developed.
Crouch and Grossman [ 92] wrote an influential paper on numerical integrators for ODEs
on manifolds where they computed the numerical solution by computing flows of vector
fields in the Lie algebra. Munthe-Kaas [ 93] constructed generalized Runge-Kutta methods
on general Lie groups, now known as the Runge-Kutta-Munthe-Kaas (RKMK) methods, and
then derived RKMK methods of arbitrarily high order [ 94] on homogeneous manifolds. The
essential aspects of Lie group methods can be reviewed in [ 95] and a recent survey paper by
Celledoni et al [96] covers the more recent developments and potential applications.
Although the Lie group methods are applicable to any dynamical system evolving on a man-
ifold, for this particular review, we focus on Lie group methods in the context of mechanical
systems. The energy-momentum or variational integrators developed for mechanical systems
evolving on vector spaces in general will not retain their conservation properties when applied
to systems with nonlinear configuration space of a non-Euclidean manifold. For engineering
applications, there are two important classes of conserving schemes for mechanical systems
evolving on non-Euclidean manifolds: variational (symplectic-momentum) integrators and
energy-momentum integrators.
Simo et al [76] extended the exact energy-momentum methods to classical rigid body dy-
namics for which the configuration manifold is the rotation group SO(3). They exploited
knowledge of the Lie group’s role in rigid body motion, using the exponential map from the
Lie algebra to the Lie group in order to numerically integrate the dynamic equations. Lewis
and Simo [ 97] developed energy-momentum and symplectic integrators for the general case
of Hamiltonian systems evolving on Lie groups i.e. nonlinear configuration spaces with a
group structure.
Bobenko and Suris [ 98] extended the discrete mechanics ideas in [ 43] to the Lie group setting.


## Page 54

2.2. Structure-preserving Methods 35
Variational integrators for the reduced dynamics of a mechanical system with a Lie group
symmetry were first derived by Marsden et al [99]. By incorporating ideas from Lie group
methods in the variational integrator framework, Leok [ 66] developed the general theory of
Lie group variational integrators. Lee et al [100, 101, 102] adapted the Lie group variational
integrators to rigid body dynamics applications. As the name “Lie group variational inte-
grator” suggests, these methods essentially combine the structure-preserving features of Lie
group methods and variational integrators. The resulting integrators are thus symplectic
and momentum-preserving and they preserve the structure of the configuration space. Lie
group variational integrators have recently been extended to the infinite-dimensional setting
of beam and plate dynamics by Demoures et al [103, 104, 105].
Lie group methods discussed so far, in addition to preserving the nonlinear configuration
space structure and momentum, conserve either the energy or the symplectic form. These Lie
group methods can not preserve all three elements - energy, momentum and symplectic form
- simultaneously. For the special case of a rigid body system, Lewis and Simo [ 97] presented a
strategy for deriving algorithms that preserve energy, momentum and symplectic form while
also making sure the computed trajectory lies on the correct manifold. Based on the strong
negative result for fixed step algorithms by Ge and Marsden [ 38], we know that this approach
does not work for the more general case of non-integrable systems. Recently, Sharma et al
[106, 107] developed the extended Lagrangian mechanics framework on SO(3) and SE(3),
and derived energy-preserving, adaptive time step Lie group variational integrators for rigid
body dynamics.


## Page 55

36 Chapter 2. Review of Literature
2.3 Science and Engineering Applications
The numerical methods covered in Section 2.2 have been successfully applied to a wide range
of problems in engineering. In this section, we give examples from the literature where these
structure-preserving methods have been utilized in physics, mechanics and dynamics.
2.3.1 Celestial Mechanics and Dynamical Astronomy
Celestial mechanics and dynamical astronomy apply the principles of classical mechanics
to solve problems concerning the motion of objects in space. These problems involve de-
termining long-term trajectories of bodies such as stars, planets, and asteroids as well as
computing spacecraft trajectories, from launch through atmospheric re-entry, including the
orbital maneuvers. Similarly, interplanetary trajectory and planetary protection applica-
tions also require accurate long-time numerical simulations. Symplectic methods due to
their symplectic and momentum-preserving nature along with long-time stability are ideal
for numerical simulation of such problems.
Based on the symplectic method proposed by Ruth [ 32], various symplectic algorithms for
canonical integration of Hamiltonian systems were proposed by Feng and Qin [ 108], Channell
and Scovel [ 109], and Forest and Routh [ 110]. Wisdom and Holman [ 111], building on the
previous work by Wisdom [ 112, 113], developed symplectic algorithms for N-body problems
with a large central mass such as planetary systems or satellite dynamics. Yoshida [ 114]
applied symplectic methods to study the motion of minor bodies in the solar system and the
long-term evolution of outer planets. These methods came to the attention of the celestial
mechanics [ 115] and dynamical astronomy [ 116] community in the early 1990s and have
now become the benchmark in the study of orbit propagation [ 117], close encounters [ 118],
asteroid [119, 120] dynamics, cometary orbits [ 121, 122], long-term formation flight dynamics


## Page 56

2.3. Science and Engineering Applications 37
[123] and N-body dynamics [ 111, 124].
Since the development of discrete mechanics and variational integrators, a variety of sym-
plectic algorithms, derived from the variational point of view, have been applied to celestial
mechanics, spacecraft dynamics and orbital propagation problems. Farr and Bertschinger
[125] developed adaptive variational integrators for N-body problems with superior sym-
plecticity and momentum preservation. Lee et al applied Lie group variational integrators
to study the complex dynamics of a tethered spacecraft system [ 126] and spacecraft with
imbalanced reaction wheels [ 127]. Hall and Leok [ 128] applied spectral variational integra-
tors to solar system simulation and obtained closed, extremely stable and precession free
orbits, even for large time steps. Recently, Palacios and Gurfil [ 129] developed variational
integrators for satellite relative orbit propagation including atmospheric drag.
2.3.2 Elastodynamics
Formulation of dynamic problems in nonlinear solid mechanics is built on energy and mo-
mentum conservation laws and these fundamental properties of the continuum dynamics
play a key role in many engineering applications. Customary temporal and spatial finite
difference/finite element discretizations of the continuum dynamics do not always inherit
the conservation properties. The construction of robust spacetime discretizations of these
problems has been a long-standing goal in the field of computational mechanics.
For nonlinear elastodynamics problems, especially stiff systems possessing high-frequency
contents, energy-momentum schemes are known to possess enhanced numerical stability
properties in the nonlinear regime [ 71]. In most of the applications, the semidiscrete equa-
tions resulting from a finite element discretization are viewed as a finite-dimensional Hamil-
tonian system with symmetry and are solved in time using energy-momentum integrators.


## Page 57

38 Chapter 2. Review of Literature
In the context of nonlinear elastodynamics, Simo and Tarnow [ 75] first developed numer-
ical methods for Saint Venant-Kirchhoff model and later, Simo and Gonazalez [ 130, 131]
extended these methods to the more general case of hyperelastic materials. Based on this
pioneering work, a variety of energy-momentum algorithms have been designed for structural
elements such as beams [ 132], plates [ 133] and shells [ 134].
Unlike the energy-momentum integrator applications, variational integrators use the space-
time approach for elastodynamics problems. Lew et al [69] developed asynchronous varia-
tional integrators (A VI) for nonlinear elastodynamics that permit independent time steps in
each spatial element. Based on this work, Lietz et al [103] developed A VIs for geometrically
exact beam and plate dynamics. Lew [ 135] used A VIs to study rotor blade dynamics and
contained detonation of a highly-explosive material. Kale and Lew [ 136] developed scalable
parallel A VI algorithms and applied them to study the interaction dynamics involved in
atomic force microscopy.
2.3.3 Multibody Dynamics
Multibody dynamics applications often involve a system consisting of rigid bodies and elastic
bodies undergoing large displacements and rotations and the numerical simulation of these
systems require advanced modeling strategies. Space discretization for these problems usu-
ally results in stiff, nonlinear, differential-algebraic equations and energy-momentum schemes
are well-suited for such nonlinear systems due to their algorithmic conservation and numer-
ical stability properties. A variety of energy preserving/decaying schemes were presented in
the late 1990s by a number of authors for multibody systems.
Ordern and Goicolea [ 137] utilized discrete gradient ideas to develop energy-momentum in-
tegrators for constrained dynamics of flexible multibody systems. Betsch and Lyndecker


## Page 58

2.3. Science and Engineering Applications 39
[138] developed energy-momentum integrators in the discrete null space setting for multi-
body dynamics and later Leyendecker et al [139] applied these methods to flexible multibody
dynamics. Based on the work by Betsch and Steinmann [ 140], Betsch and Uhlar [ 141] devel-
oped a rotationless formulation for energy-momentum conserving integration of multibody
systems. Uhlar and Betsch [ 142] extended this method to non-conservative systems and
applied it to a double wishbone suspension of a car.
Although the multibody dynamics field has mainly used energy-momentum integrators for
computational studies, recently some researchers have also used variational integrators and
Lie group methods in the context of multibody dynamics. Leyendecker et al [143] adapted
the discrete null space method to the discrete mechanics framework and applied the varia-
tional discrete null space method to a kinematic chain of rigid bodies and flexible multibody
systems. Leyendecker and Ober-Blöbaum [ 144] applied multirate variational integrators to
study constrained systems with dynamics on strongly varying time scales. For systems with
large displacements and rotations, various Lie group methods for complex flexible multibody
dynamics have been developed by Bruls et al [145, 146], Park and Chung [ 147], and Terze
et al [148].
2.3.4 Fluid Dynamics
Computational methods for fluid dynamics problems typically discretize the governing equa-
tions through finite volume, finite element or finite difference methods and are rarely designed
with structure preservation in mind, leading to spurious numerical artifacts such as energy
and circulation drift. In sharp contrast to these traditional methods, structure-preserving
methods based on the geometric nature of Euler fluids (adiabatic and inviscid) have recently
become popular in the context of numerical methods for fluid dynamics. Perot et al [149]


## Page 59

40 Chapter 2. Review of Literature
studied conservation properties of unstructured staggered mesh schemes and constructed
numerical methods that conserve kinetic energy, vorticity, and momentum in 2D. Elcott et
al [150] proposed numerically stable integrators for fluids that satisfy the discrete version of
Kelvin’s circulation theorem.
Based on the pioneering work by Arnold [ 151], Euler fluids have been extensively stud-
ied in the literature from the geometric-differential standpoint. Cotter et al [152] provided
multisymplectic formulation of fluid dynamics using the inverse map approach. In the vari-
ational description of fluid dynamics [ 153], the configuration space is defined as the volume-
preserving diffeomorphisms, and Kelvin’s circulation theorem is seen as a consequence of
Noether’s theorem associated with the particle relabeling symmetry. This variational for-
mulation provides a powerful framework to construct structure-preserving methods for fluid
dynamics.
Mullen et al [154] constructed time-reversible integrators that preserve energy for inviscid
fluids (or capture the correct energy decay for viscous fluids) and are particularly useful for
fluid animation by maintaining the liveliness of fluid motion without recourse to corrective
devices. Pavlov et al [155] derived fluid mechanics equations from Hamilton’s principle and
derived Lie group variational integrators for incompressible Euler fluids by constructing a
finite-dimensional approximation to the volume-preserving diffeomorphism group for the dis-
cretization. The resulting scheme exhibits energy conservation over long simulations, time
reversibility, and circulation preservation. Using similar ideas, Gawlik et al [156] derived
variational discretizations of continuum theories arising in fluid dynamics, magnetohydro-
dynamics (MHD), and the dynamics of complex fluids. Kraus and his colleagues [ 30] have
utilized the formal Lagrangian approach to develop variational integrators for a variety
of MHD models. Similarly, Desbrun et al [157] developed structure-preserving space-time
discretization schemes for rotating and/or stratified flows which are relevant for modeling


## Page 60

2.3. Science and Engineering Applications 41
large-scale atmospheric or oceanic flows. Recently, Bauer et al [158] have developed a frame-
work for geometric variational discretization of compressible fluids in the context of rotating
shallow water equations.
(a) Wheelbone suspension [ 142]
 (b) Tethered dynamics [ 127]
 (c) Rotor blade dynamics [ 69]
(d) Fluid flow animation [ 154]
 (e) Little dog robot [ 159]
Figure 2.5: GNI applications from literature
2.3.5 Optimal Control
The optimal control of a mechanical system is an important engineering problem in appli-
cation areas such space mission design, robotics and biomechanics. The numerical solution
to the optimal control problem involves the discretization of the infinite-dimensional opti-
mization problem and one has to repeatedly solve a sequence of nearby systems approxi-
mately. Using the discrete mechanics framework on the dynamic level in the optimal control
problem leads to structure-preserving time-stepping equations and these equations act as
equality constraints on the final finite-dimensional nonlinear optimization problem. Besides
the structure-preserving aspect, both optimal control and variational mechanics have their


## Page 61

42 Chapter 2. Review of Literature
roots in calculus of variations. Junge et al [160] exploited this connection and developed the
Discrete Mechanics and Optimal Control (DMOC) method, in which both the dynamics and
optimization are discretized variationally.
Building on this work, Ober-Blöbaum et al [161] showed that the DMOC approach is equiv-
alent to time discretization of Hamilton’s equations using a symplectic method and utlilized
the structure-preserving nature of discretization to provide proof of convergence. Leyen-
decker et al [162] formulated the dynamics subject to holonomic constraints and controls
by applying a constrained version of Lagrange-d’Alembert principle for the optimal con-
trol of constrained systems. Kobilarov and Sukhatme [ 163] applied the DMOC framework
to nonholomonic mechanical systems using nonholonomic variational integrators and later
Kobilarov et al [58] also extended the framework to mechanical systems with symmetries.
Manns and Mombaur [ 164] showed that the DMOC method offers competitive performance
for complex models with large degrees of freedom by taking advantage of the parallel com-
puter architecture.
Although the DMOC method is relatively new, since its introduction it has been utilized in a
variety of problems from diverse fields. In spaceflight mechanics, the DMOC method has been
applied to problems like low thrust orbital transfer [ 165], attitude maneuvers of spacecraft
[166] and formation flying satellites [ 160]. For robotics applications, the DMOC method has
been applied successfully to simultaneous path planning and trajectory optimization [ 167],
periodic gait optimization [ 168, 169] and robot planning [ 170] problems. Manchester et al
[159, 171] have developed trajectory optimization algorithms using the DMOC framework
and applied them in handling the contact constraints found in robot planning problems.
Apart from these, the DMOC method has also been used for problems like hybrid systems
control [172], vibration suppression control of a film [ 169], and image analysis [ 173].


## Page 62

Chapter 3
Energy-preserving Variational
Integrators
The purpose of this chapter is twofold. First, we develop variational integrators for time-
dependent Lagrangian systems with non-conservative forces based on the discretization of
the Lagrange-d’Alembert principle in extended phase space. We modify the Lagrange-
d’Alembert principle to include time variations in the extended phase space and derive the
extended forced Euler-Lagrange equations. We then present a discrete variational princi-
ple for time-dependent Lagrangian systems with forcing and derive extended forced discrete
Euler-Lagrange equations. We use the extended discrete mechanics formulation to construct
adaptive time step variational integrators for nonautonomous Lagrangian systems with forc-
ing that capture the rate of energy evolution accurately. Second, we consider three numerical
examples to understand the numerical properties of the adaptive time step variational in-
tegrators and compare the results with fixed time step variational integrators to illustrate
the advantages of using adaptive time-stepping in variational integrators. We also study the
effect of initial time step and initial conditions on the numerical performance of the adaptive
time step variational integrators.
This chapter is organized as follows. In Section 3.1, we review the basics of extended
Lagrangian mechanics and discrete mechanics. We also discretize Hamilton’s principle to
derive adaptive time step variational integrators. In Section 3.2, we modify the Lagrange-
43


## Page 63

44 Chapter 3. Energy-preserving Variational Integrators
d’Alembert principle in the extended phase space and derive extended forced Euler-Lagrange
equations. In Section 3.3, we derive the extended forced discrete Euler-Lagrange equations
and obtain adaptive time step variational integrators for time-dependent Lagrangian sys-
tems with forcing. In Section 3.4, we give numerical examples to understand the numerical
performance of the adaptive time step variational integrators. Finally, in Section 3.5 we
provide concluding remarks and suggest future research directions.
3.1 Background: Adaptive Time Step Variational In-
tegrators
In this section, we review the basics of Lagrangian mechanics and derivation of adaptive
time step variational integrators. Drawing on the work of Marsden et al [13, 44, 51], we first
derive equations of motion in continuous-time from the variational principle and then derive
variational integrators by considering the discretized variational principle in the discrete-time
domain. To this end, we first derive continuous-time Euler-Lagrange equations of motion
from Hamilton’s principle. After deriving equations of motion, we use concepts of discrete
mechanics developed in [ 44] to derive discrete Euler-Lagrange equations and then write them
in the time-marching form to obtain adaptive time step variational integrators for Lagrangian
systems.
3.1.1 Extended Lagrangian Mechanics
Hamilton’s principle of stationary action is one of the most fundamental results of classical
mechanics and is commonly used to derive equations of motion for a variety of systems.
The forces and interactions that govern the dynamical evolution of the system are easily


## Page 64

3.1. Background: Adaptive Time Step Variational Integrators 45
determined through Hamilton’s principle in a formulaic and elegant manner. Hamilton’s
principle [ 174] states that: The motion of the system between two fixed points from ti to tf
is such that the action integral has a stationary value for the actual path of the motion. In
order to derive the Euler-Lagrange equations via Hamilton’s principle, we start by defining
the configuration space, tangent space and path space.
Consider a time-dependent Lagrangian system with configuration manifold Q and time space
R. In the extended Lagrangian mechanics framework [ 44], we treat time as a dynamic
variable and define the extended configuration manifold ¯Q = R × Q; the corresponding state
space T ¯Q is R × T Q. The extended Lagrangian is L : R × T Q → R.
In the extended Lagrangian mechanics framework, t and q are both parametrized by an
independent variable a. The two components of a trajectory c are c(a) = ( ct(a), cq(a)). The
extended path space is
¯C =

c : [a0, af ] → ¯Q| c is a C 2 curve and c ′
t(a) > 0

(3.1)
For a given path c(a), the initial time is t0 = ct(a0) and the final time is tf = ct(af ). The
extended action ¯B : ¯C → R is
¯B =
Z tf
t0
L(t, q(t), ˙q(t))dt (3.2)
Since time is a dynamic variable in this framework, we substitute (t, q(t), ˙q(t)) =

ct(a), cq(a),
c′
q(a)
c′
t(a)

in the above equation to get
¯B =
Z af
a0
L

ct(a), cq(a), c′
q(a)
c′
t(a)

c′
t(a) da (3.3)


## Page 65

46 Chapter 3. Energy-preserving Variational Integrators
We compute variations of the action
δ ¯B =
Z af
a0
 ∂L
∂t δct + ∂L
∂q · δcq + ∂L
∂ ˙q ·
 δc′
q(a)
c′
t
− c′
qδc′
t(a)
(c′
t)2

c′
t(a)da +
Z af
a0
Lδc′
t(a) da (3.4)
Using integration by parts and setting the variations at the end points to zero gives
δ ¯B =
Z af
a0
 ∂L
∂q c′
t − d
da
∂L
∂ ˙q

· δcq(a)da +
Z af
a0
 ∂L
∂t c′
t + d
da
 ∂L
∂ ˙q · c′
q
c′
t
− L

δct(a) da (3.5)
Using dt = c′
t(a)da in the above expression gives two equations of motion. The first is the
Euler-Lagrange equation of motion
∂L
∂q − d
dt
 ∂L
∂ ˙q

= 0 (3.6)
which is the same as the equation obtained using the classical Lagrangian mechanics frame-
work. The second equation is
∂L
∂t + d
dt
 ∂L
∂ ˙q · ˙q − L

= 0 (3.7)
which describes how the energy of the system evolves with time.
3.1.2 Energy-preserving Variational Integrators
For the extended Lagrangian mechanics, we define the extended discrete state space ¯Q × ¯Q.
The extended discrete path space is
¯Cd = { c : { 0, ..., N} → ¯Q| ct(k + 1) > c t(k) f or all k } (3.8)


## Page 66

3.1. Background: Adaptive Time Step Variational Integrators 47
The extended discrete action map ¯Bd : ¯Cd → R is
¯Bd =
N −1X
k=0
Ld(tk, qk, tk+1, qk+1) (3.9)
where Ld : ¯Q × ¯Q → R is the extended discrete Lagrangian function which approximates
the action integral between two successive configurations. Taking variations of the extended
discrete action map gives
δ ¯Bd =
N −1X
k=1

D4Ld(tk−1, qk−1, tk, qk) + D2Ld(tk, qk, tk+1, qk+1)

· δqk
+
N −1X
k=1

D3Ld(tk−1, qk−1, tk, qk) + D1Ld(tk, qk, tk+1, qk+1)

δtk = 0 (3.10)
where Di denotes differentiation with respect to the ith argument of the discrete Lagrangian
Ld. Applying Hamilton’s principle of least action and setting variations at end points to zero
gives the extended discrete Euler-Lagrange equations
D4Ld(tk−1, qk−1, tk, qk) + D2Ld(tk, qk, tk+1, qk+1) = 0 (3.11)
D3Ld(tk−1, qk−1, tk, qk) + D1Ld(tk, qk, tk+1, qk+1) = 0 (3.12)
Given (tk−1, qk−1, tk, qk), the extended discrete Euler-Lagrange equations can be solved to
obtain qk+1 and tk+1. This extended discrete Lagrangian system can be seen as a numerical
integrator of the continuous-time nonautonomous Lagrangrian system with adaptive time
steps.


## Page 67

48 Chapter 3. Energy-preserving Variational Integrators
In the extended discrete mechanics framework, we define the discrete momentum pk by
pk = D4Ld(tk−1, qk−1, tk, qk) (3.13)
We also introduce the discrete energy
Ek = D3Ld(tk−1, qk−1, tk, qk) (3.14)
Using the discrete momentum and discrete energy definitions, we can re-write the extended
discrete Euler-Lagrange equations ( 3.11) and ( 3.12) in the following form
− D2Ld(tk, qk, tk+1, qk+1) = pk (3.15)
D1Ld(tk, qk, tk+1, qk+1) = Ek (3.16)
pk+1 = D4Ld(tk, qk, tk+1, qk+1) (3.17)
Ek+1 = −D3Ld(tk, qk, tk+1, qk+1) (3.18)
Given (tk, qk, pk, Ek), the coupled nonlinear equations ( 3.15) and ( 3.16) are solved implicitly
to obtain qk+1 and tk+1. The configuration qk+1 and time tk+1 are then used in ( 3.17) and
(3.18) to obtain (pk+1, Ek+1) explicitly. The extended discrete Euler-Lagrange equations
were first written in the time-marching form in [ 44] and are also known as symplectic-
energy-momentum integrators.


## Page 68

3.2. Modified Lagrange-d’Alembert Principle 49
3.2 Modified Lagrange-d’Alembert Principle
The extended discrete Euler-Lagrange equations derived in Section 3.1.2 can be used as
energy-preserving variational integrators for Lagrangian systems. In order to extend this
energy-preserving variational integrator framework to Lagrangian systems with external
forcing, we need to discretize the Lagrange-d’Alembert principle in the extended Lagrangian
mechanics framework. We first present the Lagrange- d’Alembert principle in extended
phase space for time-dependent Lagrangian systems with forcing by considering the varia-
tions with respect to time t. Using the extended Lagrangian mechanics framework, we derive
the extended Euler-Lagrange equations for time-dependent Lagrangian systems with forcing.
The Lagrange- d’Alembert principle modifies Hamilton’s principle of stationary action by
considering the virtual work done by the forces for a variation δq in the configuration variable
q. Since the standard Lagrangian mechanics framework treats time only as an independent
continuous parameter, it does not account for time variations in the Lagrange-d’Alembert
principle. Thus, we need to modify the Lagrange-d’Alembert principle in the extended
Lagrangian mechanics framework to account for time variations.
We modify the Lagrange-d’Alembert principle by adding an additional term in the variational
principle that accounts for virtual work done by the external force fL due to variations in
the time variable
δ
Z tf
t0
L(t, q(t), ˙q(t)) dt+
Z tf
t0
fL(t, q(t), ˙q(t))·δq dt−
Z tf
t0
fL(t, q(t), ˙q(t))·( ˙qδt) dt = 0 (3.19)
Using the extended Lagrangian mechanics framework discussed in Section 3.1.1 to derive the


## Page 69

50 Chapter 3. Energy-preserving Variational Integrators
equations of motion, we first re-write the modified Lagrange-d’Alembert principle
δ
Z af
a0
L

ct(a), cq(a), c′
q(a)
c′
t(a)

c′
t(a) da+
Z af
a0
fL

ct(a), cq(a), c′
q(a)
c′
t(a)

·(δcq− ˙qδct) c′t(a)da = 0
(3.20)
Taking variations of the discrete action with respect to both configuration q and time t gives
Z af
a0
 ∂L
∂t δct + ∂L
∂q · δcq + ∂L
∂ ˙q ·
 δc′
q(a)
c′
t
− c′
qδc′
t(a)
(c′
t)2

c′
t(a)da +
Z af
a0
Lδc′
t(a) da
+
Z af
a0
(fL · δcq) c′t(a)da −
Z af
a0
(fL · ˙q) δct c′t(a)da = 0 (3.21)
Using integration by parts and setting variations at the end points to zero gives
Z af
a0
 ∂L
∂q c′
t − d
da
∂L
∂ ˙q + fL

·δcq(a)da+
Z af
a0
 ∂L
∂t c′
t + d
da
 ∂L
∂ ˙q . c′
q
c′
t
− L

− fL · ˙q

δct(a) da = 0
(3.22)
Using dt = c′
t(a)da in the above expression gives two equations of motion for the forced time-
dependent Lagrangian system. The first equation is the well-known forced Euler-Lagrange
equation for a time-dependent system
∂L
∂q − d
dt
 ∂L
∂ ˙q

+ fL = 0 (3.23)
whereas the second equation is the energy evolution equation
∂L
∂t + d
dt
 ∂L
∂ ˙q ˙q − L

− fL · ˙q = 0 (3.24)
Thus, for the forced case, the energy evolution equation describes how the energy of the
Lagrangian system depends on the input power by the external force fL. If we consider an
associated curve q(t) satisfying the forced Euler-Lagrange equations and compute the energy


## Page 70

3.3. Energy-preserving Variational Integrators 51
evolution equation we get
∂L
∂t + d
dt
 ∂L
∂ ˙q . ˙q − L

− fL. ˙q = ∂L
∂t + d
dt
 ∂L
∂ ˙q

. ˙q + ∂L
∂ ˙q .¨q − dL
dt − fL. ˙q (3.25)
which after substituting d
dt

∂L
∂ ˙q

= ∂L
∂q + fL simplifies to
∂L
∂t + d
dt
 ∂L
∂ ˙q . ˙q − L

− fL. ˙q =
 ∂L
∂t +
 ∂L
∂q + fL

. ˙q + ∂L
∂ ˙q .¨q

− dL
dt − fL. ˙q = 0 (3.26)
which shows that (3.23) implies (3.24). Thus, for continuous-time forced Lagrangian systems,
the additional energy evolution equation obtained by taking the variation with respect to
time does not provide any new information concerning the forced Euler-Lagrange equations.
Remark 1. It should be noted that both ( 3.23) and ( 3.24) depend only on the associ-
ated curve q(t) and the time component ct(a) of the extended path cannot be determined
from the governing equations. Thus, the “velocity” of time, i.e. c′
t(a), is indeterminate in
the continuous-time formulation of time-dependent Lagrangian systems with forcing.
3.3 Energy-preserving Variational Integrators
In this section, we derive the extended discrete Euler-Lagrange equations for time-dependent
Lagrangian systems with forcing by discretizing the modified Lagrange-d’Alembert principle
given in Section 3.2. The key difference from the extended discrete Euler-Lagrange equations
derived in Section 3.1.2 is that we will have additional discrete terms accounting for the
virtual work done by the external forcing.
The modified Lagrange-d’Alembert principle presented in Section 3.2 has two continuous-


## Page 71

52 Chapter 3. Energy-preserving Variational Integrators
time force integrals in the variational principle. In order to derive the extended forced
discrete Euler-Lagrange equations, we define two discrete force terms f ±
d : ¯Q × ¯Q → T ∗ ¯Q
which approximate the virtual work done due to variations in q in the following sense
f +
d (tk, qk, tk+1, qk+1)·δqk+1+f −
d (tk, qk, tk+1, qk+1)·δqk ≈
Z tk+1
tk
fL(t, q(t), ˙q(t))·δq dt (3.27)
We also define two discrete power terms g±
d : ¯Q × ¯Q → R which approximate the virtual
work done due to time variations in the following sense
g+
d (tk, qk, tk+1, qk+1)δtk+1 + g−
d (tk, qk, tk+1, qk+1)δtk ≈
Z tk+1
tk
−fL(t, q(t), ˙q(t)) · ( ˙qδt) dt
(3.28)
For the time-dependent Lagrangian system with forcing, we seek discrete-time paths which
satisfy
δ
N −1X
k=0
Ld(tk, qk, tk+1, qk+1) +
N −1X
k=0
[f+
d (tk, qk, tk+1, qk+1) · δqk+1 + f−
d (tk, qk, tk+1, qk+1) · δqk]
+
N −1X
k=0
[g+
d (tk, qk, tk+1, qk+1)δtk+1 + g−
d (tk, qk, tk+1, qk+1)δtk] = 0 (3.29)
Setting all the variations at the endpoints equal to zero in ( 3.29) gives the extended forced
discrete Euler-Lagrange equations
D4Ld(tk−1, qk−1, tk, qk)+ D2Ld(tk, qk, tk+1, qk+1)+ f+
d (tk−1, qk−1, tk, qk)+ f−
d (tk, qk, tk+1, qk+1) = 0
(3.30)
D3Ld(tk−1, qk−1, tk, qk)+ D1Ld(tk, qk, tk+1, qk+1)+ g+
d (tk−1, qk−1, tk, qk)+ g−
d (tk, qk, tk+1, qk+1) = 0
(3.31)
We modify the definitions of the discrete momentum and energy to account for the effect of


## Page 72

3.3. Energy-preserving Variational Integrators 53
forcing
pk = D4Ld(tk−1, qk−1, tk, qk) + f+
d (tk−1, qk−1, tk, qk) (3.32)
Ek = −D3Ld(tk−1, qk−1, tk, qk) − g+
d (tk−1, qk−1, tk, qk) (3.33)
Using the modified discrete momentum and energy definitions ( 3.32) and (3.33), the extended
forced discrete Euler-Lagrange equations can be re-written in the following form
− D2Ld(tk, qk, tk+1, qk+1) − f−
d (tk, qk, tk+1, qk+1) = pk (3.34)
D1Ld(tk, qk, tk+1, qk+1) + g−
d (tk, qk, tk+1, qk+1) = Ek (3.35)
pk+1 = D4Ld(tk, qk, tk+1, qk+1) + f+
d (tk, qk, tk+1, qk+1) (3.36)
Ek+1 = −D3Ld(tk, qk, tk+1, qk+1) − g−
d (tk, qk, tk+1, qk+1) (3.37)
Given a time-dependent Lagrangian system with external forcing, the extended discrete La-
grangian system obtained by solving ( 3.34)-(3.37) can be used as an adaptive time step
variational integrator for the continuous-time system.
Remark 2. The modified discrete energy ( 3.33) has a contribution from the external forcing
which accounts for the virtual work done during the adaptive time step. Thus, the discrete
trajectory obtained by solving the extended discrete Euler-Lagrange equations preserves a
discrete quantity which is not the discrete analogue of the total energy of the Lagrangian
system. This detail becomes important when we simulate a dissipative Lagrangian system
with an adaptive time step variational integrator in Section 3.4.3


## Page 73

54 Chapter 3. Energy-preserving Variational Integrators
3.4 Numerical Examples
In this section, we implement the extended forced discrete Euler-Lagrange equations as nu-
merical integrators of continuous dynamical systems. We first consider a nonlinear conserva-
tive dynamical system studied in [ 51] and compare the fixed time step variational integrator
results with the corresponding results for the adaptive time step variational integrator. We
then study a forced harmonic oscillator, a time-dependent dynamical system, in order to in-
vestigate the numerical properties of the adaptive time step variational integrators for forced
systems. Finally, we simulate a damped harmonic oscillator to understand the numerical
performance of adaptive time step variational integrators for dissipative systems.
3.4.1 Conservative Example
We consider a particle in a double-well potential. The Lagrangian for this conservative one
degree of freedom dynamical system is
L(q, ˙q) = 1
2 m ˙q2 − V (q) (3.38)
where
V (q) = 1
2

q4 − q2
(3.39)
Fixed time step algorithm
For the fixed time step case, we choose a constant time step h. The discrete Lagrangian is
obtained using the midpoint rule
Ld(qk, qk+1) = hL
 qk + qk+1
2 , qk+1 − qk
h

(3.40)


## Page 74

3.4. Numerical Examples 55
The discrete momentum pk+1 is given by
pk+1 = m
 qk+1 − qk
h

+ h
  qk+1 + qk
4

−
 qk+1 + qk
2
3!
(3.41)
For given (qk, pk) at the kth time step, the implicit time-marching equation for the fixed time
step method is
m
 qk+1 − qk
h

− h
  qk+1 + qk
4

−
 qk+1 + qk
2
3!
= pk (3.42)
(a) q(0) = 0 .74, ˙q(0) = 0
 (b) q(0) = 0 .995, ˙q(0) = 0
Figure 3.1: Two initial conditions are studied for the particle in double-well potential. An
initial time step of h0 = 0 .01 is used for the adaptive time step algorithm in both cases.
The fixed time step size is chosen such that number of total time steps is same as the
adaptive algorithm. Phase space trajectories for both fixed time step and adaptive time step
algorithms are compared to the benchmark trajectory. The trajectories in each figure are
indistinguishable verifying the equations.


## Page 75

56 Chapter 3. Energy-preserving Variational Integrators
Adaptive time step algorithm
For the adaptive time step case, we have discrete time tk as an additional discrete variable.
We use the midpoint rule to obtain the discrete Lagrangian Ld
Ld(tk, qk, tk+1, qk+1) = ( tk+1−tk)
"
1
2 m
 qk+1 − qk
tk+1 − tk
2
− 1
2
  qk+1 + qk
2
4
−
 qk+1 + qk
2
2!#
(3.43)
The discrete momentum pk and discrete energy Ek are obtained by substituting the Ld
expression in ( 3.17) and ( 3.18)
pk+1 = m
 qk+1 − qk
tk+1 − tk

+ (tk+1 − tk)
  qk+1 + qk
4

−
 qk+1 + qk
2
3!
(3.44)
Ek+1 = 1
2 m
 qk+1 − qk
tk+1 − tk
2
+ 1
2
  qk+1 + qk
2
4
−
 qk+1 + qk
2
2!
(3.45)
The implicit time-marching equations for the adaptive time step algorithm are
m
 qk+1 − qk
tk+1 − tk

− (tk+1 − tk)
  qk+1 + qk
4

−
 qk+1 + qk
2
3!
= pk (3.46)
1
2 m
 qk+1 − qk
tk+1 − tk
2
+ 1
2
  qk+1 + qk
2
4
−
 qk+1 + qk
2
2!
= Ek (3.47)
Since the dynamical system being considered here is time-independent, we rewrite the time-
marching equations in terms of hk = (tk+1 − tk) and vk =

qk+1−qk
tk+1−tk

F (qk, pk, hk, vk) = mvk − hk
  vkhk + 2qk
4

−

qk + vkhk
2
3!
− pk = 0 (3.48)
G(qk, Ek, hk, vk) = 1
2 mv2
k + 1
2
 
qk + vkhk
2
4
−

qk + vkhk
2
2!
− Ek = 0 (3.49)


## Page 76

3.4. Numerical Examples 57
These time-marching equations are solved using Newton’s iterative method with the restric-
tion hk > 0 to obtain discrete trajectories in the extended space. This extended discrete
system can be used as a variational integrator for the continuous-time dynamical system.
(a) q(0) = 0 .74, ˙q(0) = 0
 (b) q(0) = 0 .995, ˙q(0) = 0
Figure 3.2: Energy error plots for both fixed time step and adaptive time step algorithms
are compared for two different initial conditions. Each figure shows the superior energy
performance of the adaptive time step algorithm.
(a) q(0) = 0 .74, ˙q(0) = 0
 (b) q(0) = 0 .995, ˙q(0) = 0
Figure 3.3: Trajectory error plots for both fixed time step and adaptive time step algorithms
are compared for two different initial conditions. Each figure, especially the highly nonlin-
ear case (b), clearly shows the superior trajectory performance of the adaptive time step
algorithm.
Remark 3. In [ 51], an alternative optimization method has been implemented where in-


## Page 77

58 Chapter 3. Energy-preserving Variational Integrators
stead of solving the nonlinear coupled equations ( 3.48) and ( 3.49), the following quantity is
minimized
[F (qk, pk, hk, vk)]2 + [G(qk, Ek, hk, vk)]2 (3.50)
over the variables vk and hk with the restriction hk > 0. The drawback of using this approach
is that numerically it violates the energy evolution equation and the underlying structure is
no longer preserved. In fact, due to this optimization approach, the energy plots given in
[51] do not clearly convey the advantage of energy-preserving variational integrators.
(a) q(0) = 0 .74, ˙q(0) = 0
 (b) q(0) = 0 .995, ˙q(0) = 0
Figure 3.4: Adaptive time step versus iteration number for both initial conditions.
Initial condition
We have considered two regions of phase space, similar to the numerical example in [ 51], to
understand numerical properties of the adaptive time step variational integrator for conser-
vative systems. Since our aim is to use these discrete trajectories as numerical integrators
for continuous dynamical systems, instead of starting with two discrete points we consider
a continuous-time dynamical system with given initial position q(0) and initial velocity ˙q(0)


## Page 78

3.4. Numerical Examples 59
and use the benchmark solution to obtain initial conditions for the adaptive time step vari-
ational integrator. Since the adaptive time step changes substantially from the initial time
step h0, for a fair comparison of trajectory accuracy and energy error, we have chosen the
fixed time step algorithm in such a way that both fixed and adaptive algorithms take same
number total time steps over the numerical simulation.
For a given set of initial conditions, i.e. (q(0), ˙q(0)), we first decide the initial time step h0
and then use the benchmark solution to compute discrete configuration q1 at time t1 = h0,
configuration at first time step. Thus, we have obtained two discrete points in the extended
state space (t0, q0) and (t1, q1) and using these two discrete points we can find discrete
momentum p1 and discrete energy E1. After obtaining (t1, q1, p1, E1), we can solve the time-
marching equations ( 3.34)-(3.37) to numerically simulate the dynamical system.
Results
The discrete trajectories for both fixed and adaptive time step algorithms are compared with
the benchmark solution in Figure 3.1. The position q = qk+qk+1
2 and velocity ˙q = qk+1−qk
hk
are computed from the discrete trajectories for both fixed and adaptive time step algorithms
and compared with continuous time q and ˙q. For both initial conditions, discrete trajectories
from the adaptive time step and fixed time step match the benchmark trajectory.
The energy error plots for both cases in Figure 3.2 show the superior energy behavior of adap-
tive time step variational integrators for conservative dynamical systems. Instead of using
the optimization approach discussed in Remark 3, we have obtained the discrete trajectories
by solving the nonlinear coupled equations exactly to preserve the underlying structure. The
energy error plots quantify the difference in energy accuracy for fixed time step and adaptive
time step method clearly. The energy-preserving performance was not evident in similar re-


## Page 79

60 Chapter 3. Energy-preserving Variational Integrators
sults given in [ 51] because of the optimization approach used to obtain discrete trajectories
instead of solving the implicit equations directly. The energy error comparison in Figure
3.2a shows that the adaptive time step method has energy error magnitude around 10−14
whereas the fixed time step method has energy error around 10−8. In Figure 3.2b the energy
error for fixed time step increases to 10−6 while the adaptive time step method shows nearly
exact energy preservation(of the order of computer precision minus the condition number
of the equations). Although the magnitude of energy error for fixed time step method is
bounded, the magnitude of energy error oscillations depends on where the trajectory lies
in the phase space. Thus, for areas in phase space where the magnitude of energy error
oscillations is substantial for fixed time step method, the adaptive time step method can be
used to preserve the energy of the system more accurately.
Trajectory error plots shown in Figure 3.3 demonstrate the improved accuracy achieved
by adaptive time step variational integrators for both cases. In Figure 3.3a both methods
exhibit nearly same accuracy with adaptive time step performing marginally better. The
trajectory error comparison in Figure 3.3b shows the superior performance of adaptive time
step variational integrators for long time simulation. Based on the accuracy results, we be-
lieve adaptive time step variational integrators can provide benefits for numerical simulation
of regions of phase space which show significant changes in the underlying physics.
Figure 3.4 shows how the adaptive time step oscillates for both cases. The adaptive time
step doesn’t increase substantially compared to the initial time step of h0 = 0.01 for the first
case in Figure 3.4a, while Figure 3.4b indicates the adaptive time step increases by 4 times
the initial time step for the second case. The amplitude of adaptive time step oscillations
depends on the region of phase space in which the discrete trajectory lies. The adaptive time
step algorithm computes the adaptive time step such that the discrete energy is conserved
exactly. There is no upper bound on the size of the adaptive time step, but very large adap-


## Page 80

3.4. Numerical Examples 61
tive time step values make the discretization assumption made in ( 3.43) erroneous leading
to inaccurate discrete trajectories.
Remark 4. It is important to understand that adaptive time step variational integra-
tors are fundamentally different from traditional adaptive time-stepping numerical methods
which compute the adaptive time step size based on some error criteria. Adaptive time step
variational integrators treat time as a discrete dynamic variable and the adaptive time step
is computed by solving the extended discrete Euler-Lagrange equations. Thus, the adaptive
time step is coupled with the dynamics of the system whereas, for most of the the adaptive
time-stepping numerical methods, the step size computation and dynamics of the system are
independent of each other.
(a) q(0) = 0 .74, ˙q(0) = 0
 (b) q(0) = 0 .995, ˙q(0) = 0
Figure 3.5: In these plots, an initial time step of h0 = 0.1 is used for the adaptive time step
algorithm to study the effect of initial time step on the accuracy of discrete trajectories.
Effect of initial time step
From the discrete energy definition it is clear that the initial time step value plays an impor-
tant role in the adaptive time step algorithm. We study the effect of initial time step on the
phase space and energy error plots by simulating the two cases considered in the previous


## Page 81

62 Chapter 3. Energy-preserving Variational Integrators
subsection but with a larger initial time step h0 = 0.1 for the adaptive time step. The fixed
time step size is chosen such that number of total time steps is same for both fixed and
adaptive time step algorithm.
The phase space trajectories shown in Figure 3.5 show that even with an initial time step of
h0 = 0.1 discrete trajectories from both fixed and adaptive time step show good agreement
with the benchmark solution. In Figure 3.5a, the discrete trajectories lie on top of the bench-
mark solution for the first set of initial conditions. In Figure 3.5b, the fixed and adaptive
time step discrete trajectories give slightly inaccurate results near the turning point. The
discrete energy error plots in Figure 3.6 show that for fixed time step variational integrators,
the discrete energy errors increase with increase in the time step size but for the adaptive
time step variational integrators, increasing the time step size leads to accurate discrete
energy behavior. In fact, the accuracy of energy preservation is slightly better for this case.
This unexpected behavior is due to the ill-conditioned nature of the implicit extended dis-
crete Euler-Lagrange equations, which become more ill-conditioned for smaller time steps.
The plots of condition number in Figure 3.7 show that the implicit equations become more
ill-conditioned as the initial time step value is decreased. Thus, numerical computations
with finite precision will lead to higher errors in the solution.
It is important to note that for a conservative system, the continuous-time trajectory pre-
serves the continuous energy which is different from the discrete energy that adaptive time
step variational integrators are constructed to preserve. This explains why, despite the su-
perior energy behavior in Figure 3.6b compared to Figure 3.2b, the discrete trajectory in
Figure 3.5b is less accurate than the discrete trajectory in Figure 3.1b. We know that as
the time step value tends to zero the discrete energy and continuous energy become equal
but the condition number analysis and the energy error plots reveal that smaller initial time
steps for adaptive time variational integrators lead to ill-conditioning and finite precision


## Page 82

3.4. Numerical Examples 63
errors in energy. Thus, there is a trade-off between preserving discrete energy and ensuring
overall trajectory accuracy when choosing an initial time step for the adaptive time step
variational integrators.
(a) q(0) = 0 .74, ˙q(0) = 0
 (b) q(0) = 0 .995, ˙q(0) = 0
Figure 3.6: The energy error plots with an initial time step of h0 = 0.1 for the adaptive time
step algorithm.
(a) q(0) = 0 .74, ˙q(0) = 0
 (b) q(0) = 0 .995, ˙q(0) = 0
Figure 3.7: The increase in condition number with decrease in initial time step for the
adaptive time step algorithm.
Remark 5. The discrete energy error plotted in Figure 3.2 and Figure 3.6 is different from
our traditional idea of energy error. We usually define energy error as the difference be-
tween the energy of the continuous-time system and the energy obtained from the discrete


## Page 83

64 Chapter 3. Energy-preserving Variational Integrators
trajectories. This traditional energy error can be broken down into discrete energy error and
discretization error. The discrete energy error is the error in preserving the discrete energy
of the extended discrete Lagrangian system. The discretization error is the error incurred
by discretizing a continuous-time system. Thus, the discretization error is the difference
between the continuous energy and the discrete energy that our integrators aim to preserve,
whereas the discrete energy error is the error between the true and computed discrete energy.
Remark 6. For a conservative system, we expect discrete energy to be constant and thus
the discretization error is also constant. Since this constant discretization error is orders of
magnitude larger than the discrete energy error, traditional energy error plots do not show
the advantages of using adaptive time-stepping. We evaluate the performance of variational
integrators by comparing how well these integrators preserve the discrete energy.
3.4.2 Time-dependent Example
We consider a forced harmonic oscillator to study the numerical performance of the adaptive
time step variational integrator for forced Lagrangian systems with explicit time-dependence.
The (continuous) Lagrangian for the single degree of freedom system is
L(q, ˙q) = 1
2 m ˙q2 − 1
2 kq 2 (3.51)
and the external forcing is
f = F0cos(ωF t) (3.52)
where m is the mass, k is the stiffness, F0 is the magnitude of the force and ωF is the forcing
frequency. For discretization, we use the midpoint rule to obtain the discrete Lagrangian Ld
Ld(tk, qk, tk+1, qk+1) = ( tk+1 − tk) L
 qk + qk+1
2 , qk+1 − qk
tk+1 − tk

(3.53)


## Page 84

3.4. Numerical Examples 65
Similarly, we can write the discrete force f ±
d as
f ±
d = 1
2 F0(tk+1 − tk)cos
 ωF (tk+1 + tk)
2

(3.54)
and the corresponding power term g±
d as
g±
d = −f ±
d
 qk+1 − qk
tk+1 − tk

= − 1
2 F0(tk+1 − tk)cos
 ωF (tk+1 + tk)
2
 qk+1 − qk
tk+1 − tk

(3.55)
The discrete momentum pk+1 and discrete energy Ek+1 expressions are
pk+1 = D4Ld(tk, qk, tk+1, qk+1) + f +
d
= m
 qk+1 − qk
tk+1 − tk

− k(tk+1 − tk)
 qk + qk+1
4

+ F0(tk+1 − tk)
2 cos
 ωF (tk+1 + tk)
2

(3.56)
Ek+1 = −D3Ld(tk, qk, tk+1, qk+1) − g+
d
= 1
2 m
 qk+1 − qk
tk+1 − tk
2
+ 1
2 k
 qk + qk+1
2
2
+ F0
2 cos
 ωF (tk+1 + tk)
2

(qk+1 − qk)
(3.57)
For given (tk, qk, Ek, pk), the time-marching implicit equations for the forced harmonic oscilla-
tor are obtained by substituting the discrete Lagrangian ( 3.53) and discrete force expressions
(3.54)-(3.55) into ( 3.34) and ( 3.35)
m
 qk+1 + qk
tk+1 − tk

+ k(tk+1 − tk)
 qk+1 + qk
4

+ F0(tk+1 − tk)
2 cos
 ωF (tk+1 + tk)
2

= pk (3.58)
1
2 m
 qk+1 − qk
tk+1 − tk
2
+ 1
2 k
 qk+1 + qk
2
2
− F0
2 cos
 ωF (tk+1 + tk)
2

(qk+1 − qk) = Ek (3.59)


## Page 85

66 Chapter 3. Energy-preserving Variational Integrators
We re-write the above two coupled nonlinear equations in terms of the kth adaptive time
step hk = tk+1 − tk and vk =

qk+1−qk
tk+1−tk

F (qk, tk, pk, hk, vk) = mvk + khk
4 (2qk + hkvk) + F0hk
2 cos

ωF

tk + hk
2

− pk = 0 (3.60)
G(qk, tk, Ek, hk, vk) = 1
2 mv2
k + 1
2 k

qk + hkvk
2
2
− F0hkvk
2 cos

ωF

tk + hk
2

− Ek = 0
(3.61)
(a) σ = 0.1
 (b) σ = 0.5
(c) σ = 5
Figure 3.8: Three forcing frequency ratio values are studied for the forced harmonic oscillator
system. Discrete trajectories for both fixed time step and adaptive time step variational
integrators are plotted and compared with the analytical solution for an initial time step
h0 = 0.01 for the adaptive time step algorithm and natural frequency ωn = 2 rad/s.


## Page 86

3.4. Numerical Examples 67
Results
We have studied the forced harmonic oscillator for three values of the forcing frequency ratio
σ = ωF
ωn
for ωn =
q
k
m = 2 rad/s to understand the numerical performance of adaptive
time step variational integrators for systems with explicit time-dependence. The discrete
trajectories from both fixed and adaptive time step variational integrators are compared in
Figure 3.8 and both discrete trajectories agree favorably with the analytical solution for all
three cases.
Energy error plots for all three cases in Figure 3.9 show the superior energy behavior of
adaptive time step variational integrators for systems with explicit time-dependence. The
energy error comparison in Figure 3.9a shows that the adaptive time step method has energy
error magnitude around 10−4 whereas the fixed time step method has energy error around
10−2. In Figure 3.9b and Figure 3.9c the energy error for fixed time step increases to
10−1 with increase in forcing frequency while the adaptive time step method still shows an
energy error around 10−4. Thus, adaptive time step method predict change in energy more
accurately than fixed time step methods for systems with explicit time-dependence and can
be used to numerically simulate nonautonomous oscillatory systems with external forcing.
The trajectory error plots in Figure 3.10 show how both adaptive and fixed time step integra-
tors have similar accuracy for low forcing frequencies but, as the forcing frequency increases,
the fixed time step variational integrators show better trajectory accuracy. These trajectory
error results in Figure 3.10 are contrary to the trend of superior trajectory performance ob-
served for conservative example in Figure 3.3. In Figure 3.10a both fixed and adaptive time
step variational integrators show same trajectory error. The comparison in Figure 3.10b and
Figure 3.10c show how adaptive time step variational integrators start with more accurate
trajectory but, as we march forward in time, the fixed time step variational integrator ex-


## Page 87

68 Chapter 3. Energy-preserving Variational Integrators
hibits lower trajectory error, especially in the case of σ = 5 . This can be understood if we
look at the time step adaptation.
Figure 3.11 shows the change in adaptive time step over the simulation time for different
forcing frequencies. For all three cases, the adaptive time step starts from h0 = 0 .01 but
oscillates significantly for higher σ. σ = 0 .1 leads to a time step range of 0.0095 − 0.0105
which increases to 0.007 − 0.022 for σ = 5 . Figure 3.11c shows the adaptive time step for
σ = 5 quickly rise to double its initial time step h0 = 0.01 and the trajectory error (see Figure
3.10c)also rises sharply during the increase in adaptive time step. Since the adaptive time
step algorithm captures the flux of energy over an oscillation accurately , the error comes
back to zero in every oscillation and hence the trajectory does deviate from the analytical
trajectories in Figure 3.10c.
3.4.3 Dissipative Example
We consider a damped harmonic oscillator in order to better understand the numerical
behavior of the adaptive time step variational integrator for forced Lagrangian systems.
Similar to the time-dependent example, the Lagrangian is given by ( 3.51) and the dissipative
force is
f = −c ˙q (3.62)
where c is the damping parameter of the single degree of freedom system. For the discrete
Lagrangian Ld, we use the midpoint rule which gives
Ld(tk, qk, tk+1, qk+1) = ( tk+1 − tk) L
 qk + qk+1
2 , qk+1 − qk
tk+1 − tk

(3.63)


## Page 88

3.4. Numerical Examples 69
(a) σ = 0.1
 (b) σ = 0.5
(c) σ = 5
Figure 3.9: Energy error for fixed time step and adaptive time step variational integrators
are compared for three forcing frequencies. Analytical solution at the discrete time instant
is used to compute the continuous energy.
Similarly, we can write the discrete force f ±
d as
f ±
d = − 1
2 c(tk+1 − tk)
 qk+1 − qk
tk+1 − tk

(3.64)
and the corresponding power term g±
d is
g±
d = −f ±
d
 qk+1 − qk
tk+1 − tk

= 1
2 c(tk+1 − tk)
 qk+1 − qk
tk+1 − tk
2
(3.65)


## Page 89

70 Chapter 3. Energy-preserving Variational Integrators
(a) σ = 0.1
 (b) σ = 0.5
(c) σ = 5
Figure 3.10: Trajectory error for fixed and adaptive time step variational integrators for the
forced harmonic oscillator are compared for three forcing frequency values.
The discrete momentum pk+1 and discrete energy Ek+1 expressions are
pk+1 = D4Ld(tk, qk, tk+1, qk+1) + f +
d
= m
 qk+1 − qk
tk+1 − tk

− k(tk+1 − tk)
 qk + qk+1
4

− c
 qk+1 − qk
2
 (3.66)
Ek+1 = −D3Ld(tk, qk, tk+1, qk+1) − g+
d
= 1
2 m
 qk+1 − qk
tk+1 − tk
2
+ 1
2 k
 qk + qk+1
2
2
− c
2
 (qk+1 − qk)2
tk+1 − tk
 (3.67)
For given (tk, qk, Ek, pk), the time-marching implicit equations are obtained by substituting


## Page 90

3.4. Numerical Examples 71
(a) σ = 0.1
 (b) σ = 0.5
(c) σ = 5
Figure 3.11: Adaptive time step versus the time for the time-dependent example.
the discrete Lagrangian and discrete force expressions into ( 3.34) and ( 3.35)
m
 qk+1 + qk
tk+1 − tk

+ k(tk+1 − tk)
 qk+1 + qk
4

− c(tk+1 − tk)
 qk+1 − qk
2

= pk (3.68)
1
2 m
 qk+1 − qk
tk+1 − tk
2
+ 1
2 c(tk+1 − tk)
 qk+1 − qk
tk+1 − tk
2
+ 1
2 k
 qk+1 + qk
2
2
= Ek (3.69)
The above two coupled nonlinear equations in qk+1 and tk+1 are solved with the restriction
tk+1 > t k and substituted in ( 3.66) and ( 3.67) to obtain the discrete momentum pk+1 and
discrete energy Ek+1 for the next step. We re-write the above time-marching equations in


## Page 91

72 Chapter 3. Energy-preserving Variational Integrators
(a) ζ = 0.001
 (b) ζ = 0.005
(c) ζ = 0.01
Figure 3.12: Three damping ratio values are studied for the spring mass damper system.
Discrete trajectories for both fixed time step and adaptive time step variational integrators
are plotted and compared with the analytical solution. The analytical solution is used to
prescribe initial conditions for an initial time step h0 = 0.01 for the adaptive time step and
natural frequency ωn = 2 rad/s.
terms of hk = tk+1 − tk and vk =

qk+1−qk
tk+1−tk

F (qk, pk, hk, vk) = mvk + hk
4 (2qk + hkvk) + 1
2 chkvk − pk = 0 (3.70)
G(qk, Ek, hk, vk) = 1
2 mv2
k + 1
2 chkv2
k + 1
2 k

qk + hkvk
2
2
− Ek = 0 (3.71)
Remark 7. Since the Lagrangian and the forcing for this example are both time-independent,
we can simplify the implicit equations by replacing tk+1 − tk by the kth adaptive time step
hk as shown above. For time-dependent mechanical systems with either time-dependent
Lagrangian or time-dependent forcing, this simplification cannot be made and discrete time
terms can not be eliminated from the implicit equations, as shown in forced harmonic oscil-


## Page 92

3.4. Numerical Examples 73
lator numerical example in Section 3.4.2.
(a) ζ = 0.001
 (b) ζ = 0.005
(c) ζ = 0.01
Figure 3.13: Energy error for fixed time step and adaptive time step variational integrators
are compared for three cases. Analytical solution at the discrete time instant is used to
compute the continuous energy.
Results
We have studied the damped simple harmonic oscillator for three small damping values
of the damping ratio ζ = c
2
√
km for a single natural frequency ωn =
q
k
m = 2 rad/s to
understand the numerical properties of adaptive time step variational integrators derived for
forced systems in Section 3.3. Just like the conservative case, our aim is to simulate the
continuous-time dynamical system using discrete trajectories obtained from the adaptive
time step variational integrator. The discrete trajectories from both fixed and adaptive time


## Page 93

74 Chapter 3. Energy-preserving Variational Integrators
(a) ζ = 0.001
 (b) ζ = 0.005
(c) ζ = 0.01
Figure 3.14: Trajectory error for fixed and adaptive time step variational integrators for the
damped harmonic oscillator are compared for three damping ratio values.
step algorithms are compared in Figure 3.12. Both are nearly indistinguishable from the
analytical solution for all three cases.
The energy error plots in Figure 3.13 show how both adaptive and fixed time step variational
integrators start with same energy accuracy for all three cases with adaptive time step
performing better initially. As we march forward in time, the fixed time step variational
integrator outperforms the adaptive time step variational integrator. The amplitude of the
energy error oscillations for the fixed time step algorithm decreases faster than it does for the
adaptive time step algorithm which suggests that for long-time simulations the energy behavior
of fixed time step variational integrator is better than the adaptive time step variational


## Page 94

3.4. Numerical Examples 75
Figure 3.15: Adaptive time step versus the time for the dissipative example.
integrator. This is contrary to what we expected because the adaptive step variational
integrator solves an additional discrete energy evolution equation to capture the change in
energy of the forced system accurately.
These unexpected results can be understood by looking at the two components of the energy
error discussed in the Remark 5. Due to exact preservation of discrete energy, the discrete
energy error for adaptive time step variational integrators is orders of magnitude lower than
it is for the fixed time step variational integrator. Unlike the conservative system example
considered in Section 3.4.1, the continuous energy and the corresponding discrete energy,
for this dissipative system, are not constant. Thus, the energy errors are computed by
comparing the continuous energy with the discrete counterpart. The discrete energy for
forced Lagrangian systems has terms accounting for virtual work done by the external force
during the adaptive time step and hence the adaptive time step variational integrators are
preserving a discrete quantity which is not analogous to the continuous time energy. Since
the difference between continuous and discrete energy is orders of magnitude larger than


## Page 95

76 Chapter 3. Energy-preserving Variational Integrators
the discrete energy error of the variational integrator, the resulting energy error plots do not
reflect the advantage of using adaptive variational integrators over fixed time step variational
integrators.
Another reason behind the higher energy error for adaptive time step variational integrators
is the monotonically increasing adaptive time step shown in Figure 3.15. The velocity ap-
proximation ˙q ≈ qk+1−qk
hk
used in computing the discrete energy becomes more inaccurate as
the adaptive time step increases. As we go forward in time, the adaptive time step hk keeps
on increasing leading to higher energy error for adaptive time step variational integrators.
Thus, the magnitude of energy error for adaptive time does not decrease as quickly as it
does for fixed time step variational integrators.
We believe the lower order midpoint approximation used for the discrete power term in ( 3.65)
is the reason behind monotonically increasing adaptive time step which leads to inaccurate
energy behavior in Figure 3.13. The discrete power terms g±
d approximate the total work
done due to time variations over an adaptive time step. Since the external forcing ( 3.62)
is linearly proportional to the velocity ˙q, the integrand in ( 3.28) will be second order in ˙q.
The discrete power terms g±
d in ( 3.65) approximate the integral by assuming the integrand
value is constant over the adaptive time step and is equal to the value of the integrand
at the midpoint tk+tk+1
2 . For cases where the integrand is linear in ˙q, like in ( 3.55), the
midpoint approximation works quite well yielding bounded time adaptive time steps. For
the dissipative case the midpoint approximation does not capture the work done accurately
resulting in increasing adaptive time step. In future, we plan to employ a higher order
approximation for discrete power terms and study its effect on the adaptive time step and
energy performance.
The trajectory error plots for three cases in Figure 3.14 show the superior trajectory accuracy
of adaptive time step variational integrators for dissipative systems. Due to the discretization


## Page 96

3.5. Conclusions 77
error and changing discrete error, the increase in accuracy is not as significant as in Figure
3.3. The comparison in Figure 3.14a shows that both fixed and adaptive algorithms have
almost same accuracy with adaptive method being marginally better. With increase in
damping ratio, Figure 3.14b and Figure 3.14c exhibit the improved accuracy achieved by
adaptive time step variational integrators. But again by the end, the accuracy of fixed time
algorithm becomes similar as the adaptive time step increases.
In Figure 3.15 the adaptive time step evolution over time for all three damping parameter
values is plotted. For all three cases, the adaptive time step was found to be monotonically
increasing. This is not good for a numerical algorithm as eventually it would lead to numer-
ical instability. We have also studied the damped harmonic oscillator system for negative
damping parameter values and the results for those systems showed a uniformly decreas-
ing adaptive time step. Thus, there seems to be some inverse relation between the rate of
change of energy and the rate of change of the adaptive time step. Again, a higher order
approximation of discrete power terms should be investigated to alleviate this adaptation.
3.5 Conclusions
We have presented adaptive time step variational integrators for time-dependent mechanical
systems with forcing. We have incorporated forcing into the extended discrete mechanics
framework so that the resulting discrete trajectories can be used as numerical integrators
for Lagrangian systems with forcing. We first presented the Lagrange-d’Alembert principle
in the extended Lagrangian mechanics framework and then derived the extended forced
discrete Euler-Lagrange equations from the discrete Lagrange-d’Alembert principle. We
demonstrated a general method to construct adaptive time step variational integrators for
systems with time-dependent forcing through a forced harmonic oscillator example. The


## Page 97

78 Chapter 3. Energy-preserving Variational Integrators
results from the numerical example showed that the adaptive time step algorithm predicts
the change in the energy of the nonautonomus system more accurately than the fixed time
step method.
We have also presented results for a nonlinear conservative system by solving the discrete
equations exactly, as opposed to the optimization approach suggested in [ 51]. The energy
error results show the advantage of solving discrete equations exactly for adaptive time
step variational integrators. We have studied the effect of initial time step on energy error
and phase space trajectories and also shown how the discrete equations become more ill-
conditioned as the initial time step becomes smaller.
For the damped harmonic oscillator example, contrary to expectation, the fixed time step
variational integrator outperforms the adaptive time step variational integrator in energy
performance. The adaptive time step for the dissipative system was found to be mono-
tonically increasing which makes the algorithm unsuitable for long-time simulation. We
believe the lower order approximation used in discrete power term is the reason behind this
unexpected behavior.


## Page 98

Chapter 4
One-step Variational and Galerkin
Methods
The purpose of this chapter is twofold. First, we derive Hermite polynomial based C1–
continuous numerical integrators for mechanical systems from two different approaches. For
the variational methods, we discretize the variational principle over a single fixed time-step
and then use the discrete mechanics framework to develop variational methods. We also use
Galerkin’s method of weighted residuals of the governing equations over a single fixed time-
step to develop one-step Galerkin methods. Second, we study the numerical performance of
the developed methods for three different classes of mechanical systems. We also investigate
the numerical properties such as symplecticity and energy performance for both methods.
This chapter is organized as follows. In Section 4.1, we review the basic concepts from
variational integrators and Galerkin methods used later in this work. In Section 4.2 we
present Hermite polynomial based one-step variational and Galerkin methods. First, we
introduce cubic Hermite polynomials used for time-discretization in this work. In Section
4.2.2 we utilize the discrete mechanics approach to derive the one-step variational methods
for mechanical systems with external forcing. We then use the Galerkin approach to derive
one-step Galerkin methods. In Section 4.3 we study three numerical examples to understand
the numerical performance of the proposed one-step methods. Finally, in Section 4.4 we
provide concluding remarks and suggest future directions for this work.
79


## Page 99

80 Chapter 4. One-step Variational and Galerkin Methods
4.1 Background
The numerical integration of mechanical systems can be approached in different ways. Tra-
ditional methods apply time-discretization directly to the governing equations of motion to
obtain time-integration algorithms. Unfortunately, this approach does not account for the
qualitative properties of the dynamical system. In this section, we review the basic concepts
from variational mechanics and Galerkin methods used in the development of our one-step
variational and Galerkin methods.
Consider a time-invariant Lagrangian mechanical system with a finite-dimensional, smooth
configuration manifold Q, state space T Q, and Lagrangian L : T Q → R. For such an
autonomous Lagrangian system with time-independent external forcing fL(q(t), ˙q(t)), the
Lagrange-d’Alembert principle characterizes trajectories q(t) as those satisfying
δ
Z tf
ti
L(q(t), ˙q(t)) dt +
Z tf
ti
fL(q(t), ˙q(t)) · δq dt = 0 (4.1)
where the first term considers the variation of the action integral and the second term
accounts for the virtual work done by the external forces when the path q(t) is varied by
δq(t). Using integration by parts and setting the variations at the endpoints equal to zero
gives the forced Euler-Lagrange equations
Meq = ∂L(q(t), ˙q(t))
∂q − d
dt
 ∂L(q(t), ˙q(t))
∂ ˙q

+ fL(q(t), ˙q(t)) = 0 (4.2)
where Meq denotes equations of motion written in a residual form. For a general mechanical
system with a separable Lagrangian of the form L(q(t), ˙q(t)) = 1
2 ˙q(t)T M ˙q(t) − U (q), the


## Page 100

4.1. Background 81
equations of motion are given by
Meq = M d2q
dt2 + ∂U (q)
∂q − fL(q(t), ˙q(t)) = 0 (4.3)
where M is the mass matrix and U (q) is the potential energy of the mechanical system.
Galerkin methods are a class of methods used for converting continuous differential equation
problems to discrete problems. The basic idea behind these methods is to seek approximate
solutions to the differential equation in a finite-dimensional space spanned by a set of basis
functions, i.e. q ≈ PN
i=1 qiΦi(t). For a finite number of basis functions, the Galerkin
methods lead to a system of equations with finite number of unknowns. Although the
Galerkin methods can be used for a wide variety of computational methods, we are only
interested in using ideas from Galerkin methods to develop one-step numerical integrators
for mechanical systems. For an ODE written in the residual form given by R, the Galerkin
method solves the following discrete problem
(R(q), wi) = 0 , i = 1, 2, ..., N (4.4)
where (·, ·) is the inner product on the corresponding Hilbert space and wi are different
test functions. Depending on the choice of test functions, these methods can be classified
into different methods such as Bubnov-Galerkin, Petrov-Galerkin, collocation methods, least
squares method. For this work, we use Petrov-Galerkin method where the test functions are
different from the basis functions.


## Page 101

82 Chapter 4. One-step Variational and Galerkin Methods
4.2 One-step Time-integration Methods
The structural dynamics community has used time finite elements to derive numerical inte-
grators from the variational principle since the late 1960s. Argryis and Scharpf [ 175] used
cubic Hermite shape functions to formulate time finite elements and discretize Hamilton’s
principle to obtain numerical integrators for the initial value problems. Unlike the discrete
mechanics approach, the finite elements approach only considers the variational principle
over one time-step. Using Hermite polynomials for the configuration leads to C1–continuous
trajectories. Recently, Leok and Shingel [ 176] used Hermite polynomials in the discrete
mechanics setting to derive variational integrators that approximate time derivatives of the
trajectory with accuracy. Apart from their accuracy and computational stability, discretiza-
tion using Hermite polynomials also leads to numerical methods that are compliant to control
analysis since they naturally yield configuration states and velocities.
4.2.1 Hermite Polynomials
We discretize the continuous trajectory over one time-step using cubic Hermite polynomials
q(t) ≈ qd(t) = q0N1(t) + v0N2(t) + q1N3(t) + v1N4(t) (4.5)
where qd(t) is the discrete approximation and the Hermite polynomials are given by
N1(t) = 2
 t
h
3
− 3
 t
h
2
+ 1, N3(t) = −2
 t
h
3
+ 3
 t
h
2
,
N2(t) = h
" t
h
3
− 2
 t
h
2
+
 t
h
#
, N4(t) = h
" t
h
3
−
 t
h
2#
(4.6)


## Page 102

4.2. One-step Time-integration Methods 83
where h is the fixed time step. From the above expressions, it is clear that at initial time
t = 0, we have N1(0) = 1 along with N2(0) = N3(0) = N4(0) = 0 which leads to qd(0) = q0.
Similarly, we also have ˙qd(0) = v0, qd(h) = q1 and ˙qd(h) = v1. Using piecewise Hermite
polynomials for discretization in the one-step approach leads to numerical solutions that are
C1– continuous.
Figure 4.1: Cubic Hermite polynomials plotted over one time-step.
4.2.2 One-step Variational Methods
Unlike the discrete mechanics framework developed by Marsden et al [44], we only consider
the variational principle over one time-step h and derive one-step numerical integrators from
the discretized variational principle.
We use qd(t) from ( 4.5) to obtain a discrete Lagrangian which approximates the action


## Page 103

84 Chapter 4. One-step Variational and Galerkin Methods
integral in the following sense
Ld(q0, v0, q1, v1) =
Z h
0
L(qd, ˙qd) dt ≈
Z h
0
L(q, ˙q) dt (4.7)
Thus, we have used a cubic polynomial to obtain the discrete Lagrangian in terms of the
configuration and velocity at the endpoints. We introduce discrete forces corresponding to
displacement and velocity variations to approximate the virtual work
Z h
0
fL(q(t), ˙q(t)) · δq dt ≈
Z h
0
fL(qd(t), ˙qd(t)) · δqd dt
= f+
d (q0, v0, q1, v1) · δq1 + f−
d (q0, v0, q1, v1) · δq0
+ g+
d (q0, v0, q1, v1) · δv1 + g−
d (q0, v0, q1, v1) · δv0 (4.8)
Using δqd(t) = δq0N1(t) +δv0N2(t) +δq1N3(t) +δv1N4(t), we can obtain the discrete forces
f±
d corresponding to displacement variations
f+
d (q0, v0, q1, v1) =
Z h
0
fL(qd(t), ˙qd(t)) N3(t) dt (4.9)
f−
d (q0, v0, q1, v1) =
Z h
0
fL(qd(t), ˙qd(t)) N1(t) dt (4.10)
and discrete forces g±
d corresponding to velocity variations
g+
d (q0, v0, q1, v1) =
Z h
0
fL(qd(t), ˙qd(t)) N4(t) dt (4.11)
g−
d (q0, v0, q1, v1) =
Z h
0
fL(qd(t), ˙qd(t)) N2(t) dt (4.12)
The discrete Lagrange-d’Alembert principle using one-step variational approach seeks curves


## Page 104

4.2. One-step Time-integration Methods 85
qd(t) = { q0, v0, q1, v1 } that satisfy
δLd(q0, v0, q1, v1) + [f+
d (q0, v0, q1, v1) · δq1 + f−
d (q0, v0, q1, v1) · δq0]
+ [g+
d (q0, v0, q1, v1) · δv1 + g−
d (q0, v0, q1, v1) · δv0] = 0
which gives
 ∂Ld
∂q0
+ f−
d (q0, v0, q1, v1)

· δq0 +
 ∂Ld
∂v0
+ g−
d (q0, v0, q1, v1)

· δv0
+
 ∂Ld
∂q1
+ f+
d (q0, v0, q1, v1)

· δq1 +
 ∂Ld
∂v1
+ g+
d (q0, v0, q1, v1)

· δv1 = 0
where Ld := Ld(q0, v0, q1, v1). Setting variations at endpoints to zero, i.e. δq0 = δq1 = 0,
gives
∂Ld
∂v0
(q0, v0, q1, v1) + g−
d (q0, v0, q1, v1) = 0 (4.13)
∂Ld
∂v1
(q0, v0, q1, v1) + g+
d (q0, v0, q1, v1) = 0 (4.14)
Given (q0, v0), these two coupled nonlinear equations can be solved to obtain (q1, v1). Thus,
for Lagrangian systems with external forcing the one-step variational approach can be used
to derive numerical integrators that are continuous in both configuration and velocities.
4.2.3 One-step Galerkin Methods
In this subsection, we consider the Galerkin method of weighted residuals to obtain numerical
integrators for mechanical systems with external forcing. For a given system of equations
we first write it in the residual form R(t, q, dq
dt , ..., dnq
dtn ) and this continuous system of ODEs


## Page 105

86 Chapter 4. One-step Variational and Galerkin Methods
is transformed into following discrete equations

R(t, qd, dqd
dt , ..., dnqd
dtn ), wi

= 0, i = 1, 2, ..., N (4.15)
where qd(t) is the assumed solution form and wi are test functions. For our study, we
focus on time-integration of mechanical problems with R = Meq(q, ˙q, ¨q) where Meq are
the equations of motion for the mechanical system. Similar to the variational approach
discussed in previous section, we use cubic Hermite polynomials as solution functions for
approximating the continuous solution over one time-step. Our goal is to use the Petrov-
Galerkin approach to derive one-step methods so we consider the following shifted Legendre
polynomials as test functions
P0(t) = 1 , P 1(t) = 1
h (2t − h) (4.16)
Given (q0, v0), the one-step Galerkin method yields
Z h
0
Meq(qd) (1) dt = 0
Z h
0
Meq(qd)
 1
h (2t − h)

dt = 0
Given (q0, v0), these two coupled nonlinear equations can be solved to obtain the configura-
tion q1 and velocity v1 at the next time-step. Just like the variational approach, this system
of nonlinear equations can be used as a one-step numerical integrator.


## Page 106

4.2. One-step Time-integration Methods 87
4.2.4 Higher-order One-step Methods
In this subsection, we demonstrate how to derive one-step methods with higher-order Hermite
polynomials. The one-step methods presented so far have been based on cubic Hermite
polynomials which lead to numerical integrators that are continuous in both configuration
and velocities. For discretization using higher-order Hermite polynomials, we consider the
following discrete trajectory over one time-step
qd(t) =
n−1X
j=0

q(j)
0 Hn,j(t) + q(j)
1 Hn,j(h − t)

(4.17)
where we have written the discrete trajectory in terms of Hermite basis functions and values
of q(t) and its derivatives q(j)(t) at endpoints. The Hermite basis functions are
Hn,j(t) = tj
j!

1 − t
h
n n−j−1X
s=0
0
B@
n + s − 1
s
1
CA
 t
h
s
(4.18)
Thus, the discrete trajectory qd is represented by 2n − 1 degree polynomial which satisfies
q(j)(0) = q(j)
d (0) q(j)(h) = q(j)
d (h) j = 0, ..., n − 1 (4.19)
It is clear from the above expression that for n = 1, the discrete trajectory simply reduces to
a linear interpolant between endpoints q0 and q1. For n = 2 , the discrete trajectory is the
cubic interpolant discussed in Section 4.2.1. For discretization using higher-order Hermite
polynomials with n ≥ 3, the discrete trajectory qd over the fixed time-step is represented
by 2n − 1 degree polynomials with 2n unknown coefficients. For an initial condition of the
form (q0, v0), the numerical integration problem reduces to solving for the remaining 2n − 2
coefficients. The first n − 2 coefficients are qj(0) for j = 2, · · · , n − 1 and the other n coef-


## Page 107

88 Chapter 4. One-step Variational and Galerkin Methods
ficients are qj(h) for j = 0, · · · , n − 1.
Variational Approach: For conservative Lagrangian systems, the discrete Hamilton’s prin-
ciple after setting the configuration variations at the endpoints to zero (i.e. δq0 = δq1 = 0)
leads to the following discrete equations
∂Ld
∂q(j)(0) = ∂Ld
∂q(j)(h) = 0 j = 1, · · · , n − 1 (4.20)
Thus, solving these 2n − 2 coupled nonlinear equations gives the 2n − 2 coefficients and this
one-step method can be seen as a numerical integrator from (q0, v0) to (q1, v1) with a 2n − 1
degree Hermite piecewise polynomial interpolating the configuration over every fixed time-
step. This approach can be extended to Lagrangian systems with forcing by discretizing the
Lagrange-d’Alembert principle.
Galerkin Approach: One-step Galerkin methods with discretization using higher-order
Hermite polynomials involve the use of shifted Legendre polynomials up to order 2n − 2 as
test functions. Given (q0, v0), the governing discrete equations are given by
Z h
0
Meq(qd)Pj(t) dt = 0 j = 0, · · · , 2n − 3 (4.21)
where Pj(t) are shifted Legendre polynomials of degree j.
4.3 Numerical Results
In this section, we consider three examples to study the numerical performance of the pro-
posed Galerkin and variational one-step methods. We first consider a nonlinear conservative


## Page 108

4.3. Numerical Results 89
system to demonstrate the good energy performance of the proposed methods. We also
present an order analysis study to understand the convergence behavior of one-step vari-
ational and Galerkin methods. We then consider the Duffing oscillator to investigate the
numerical behavior of the proposed one-step methods in the presence of dissipative forces.
Finally, we consider a nonlinear aeroelastic system to study how the proposed methods
perform for a coupled nonlinear dynamical system.
4.3.1 Particle in a Double-well Potential
In this subsection, we apply the proposed methods to a particle in a double-well potential
with Lagrangian
L(q, ˙q) = 1
2 m ˙q2 − 1
2

q4 − q2
(4.22)
The Euler-Lagrange equation for this conservative system is given by
m¨q − q + 2q3 = 0 (4.23)
We have compared the numerical results for m = 1 and fixed time-step h = 0 .1 for two
initial conditions. The phase portrait comparisons in Figure 7.3 show how both variational
and Galerkin methods agree with the benchmark solution for both initial conditions. The
corresponding energy error plots in Figure 4.3 demonstrate the bounded energy error for
both one-step methods. For both cases, the energy performance for the Galerkin method is
substantially better than for the variational method. The energy error comparison in Figure
4.3a shows that the one-step variational method has energy error magnitude around 10−7
whereas the Galerkin method has energy error around 10−10. Similarly, in Figure 4.3b the
variational method has energy error magnitude around 10−5 and the Galerkin method has
energy error around 10−8.


## Page 109

90 Chapter 4. One-step Variational and Galerkin Methods
0.66 0.67 0.68 0.69 0.7 0.71 0.72 0.73 0.74 0.75 0.76
-0.05
0
0.05
 One-step Variational
 One-step Galerkin
 Benchmark
(a) q(0) = 0 .74, ˙q(0) = 0
0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1
-0.5
0
0.5
 One-step Variational
 One-step Galerkin
 Benchmark (b) q(0) = 0 .995, ˙q(0) = 0
Figure 4.2: Phase space trajectory comparison for fixed time-step h = 0.1
0 2 4 6 8 10 12 14 16 18 20
Time
10-14
10-12
10-10
10-8
10-6
Energy Error
 One-step Variational
 One-step Galerkin
(a) q(0) = 0 .74, ˙q(0) = 0
0 2 4 6 8 10 12 14 16 18 20
Time
10-10
10-8
10-6
10-4
Energy Error
 One-step Variational
 One-step Galerkin (b) q(0) = 0 .995, ˙q(0) = 0
Figure 4.3: The energy error comparison for the two trajectories
In Figure 4.4, we have studied the numerical behavior of these algorithms for different
fixed time-step values to understand how the configuration, velocity and energy error values
decrease with decrease in the step size. We have also performed the convergence analysis for
variational integrators derived from the discrete mechanics framework to understand how
they compare to the proposed one-step methods. Since both one-step methods proposed
in this work require the solution of two coupled nonlinear equations at each time-step, we
have implemented variational integrators that require solving the same number of nonlinear
equations. Thus, we have considered a quadratic trajectory over one time-step in the discrete
mechanics framework by introducing an interior point and the resulting variational integrator
leads to two coupled nonlinear implicit equations at each time-step.
The configuration and velocity convergence plots in Figure 4.8a and Figure 4.8b show that
the one-step variational method has second order convergence whereas both the variational


## Page 110

4.3. Numerical Results 91
integrator and the one-step Galerkin method have fourth order convergence. For the en-
ergy error, both the one-step variational and the variational integrator show second order
convergence, and the one-step Galerkin method shows fourth order convergence. Thus, the
one-step Galerkin approach gives better trajectory and energy performance than both the
one-step variational method and the variational integrator.
10-3 10-2 10-1 100
Time step h (in log scale)
10-20
10-15
10-10
10-5
100
Trajectory error (in log scale)
 Variational Integrators
 One-step Variational
 One-step Galerkin
Slope 4
Slope 2
(a) Maximum trajectory error
10-3 10-2 10-1 100
Time step h (in log scale)
10-20
10-15
10-10
10-5
100
Velocity error (in log scale)
 Variational Integrators
 One-step Variational
 One-step Galerkin
Slope 4
Slope 2 (b) Maximum velocity error
10-3 10-2 10-1 100
Time step h (in log scale)
10-15
10-10
10-5
100
Energy error (in log scale)
 Variational Integrators
 One-step Variational
 One-step Galerkin
 Slope 4
 Slope 2
(c) Maximum energy error
Figure 4.4: Convergence analysis of temporal error in configuration, velocity and energy for
the nonlinear conservative system.
4.3.2 Duffing Oscillator
In this subsection, we study the numerical performance of these algorithms in the presence
of dissipation. The governing second-order, nonlinear differential equation for the Duffing
oscillator is given by
¨x + δ ˙x + αx + βx3 = 0 (4.24)


## Page 111

92 Chapter 4. One-step Variational and Galerkin Methods
where x(t) is the displacement at time t, δ is the linear damping, α is the linear stiffness, and
β is the nonlinear stiffness coefficient. The Lagrangian and external forcing for this system
are given by
L(x, ˙x) = 1
2 ˙x2 − 1
2 αx2 − 1
4 βx4, f ( ˙x, t) = −δ ˙x (4.25)
We have fixed the stiffness parameters to α = 1 and β = 0 .5 and studied this dissipative
nonlinear dynamical system for three cases, i.e. δ = 0 .025, 0.05, 0.1. With these specific
parameter values, the Duffing oscillator can be thought of as the double-well potential system
with dissipation. The numerically computed trajectories from both one-step methods are
compared with the benchmark solution in Figure 4.5. The plots in Figure 4.5 demonstrate
that both methods are able to capture the dissipation effect accurately. In fact, the discrete
trajectories are indistinguishable from the benchmark solution for all three cases.
The energy error plots in Figure 4.6 compare the energy performance for both one-step
methods and the Galerkin approach outperforms the variational approach in all three cases.
For all three cases, the energy error for the one-step variational method starts around 10−4
whereas the one-step Galerkin methods exhibit energy error around 10−6. The energy error
for both methods decreases over the time due to the presence of dissipative forces and the
rate of decrease in energy error increases with increase in the value of the damping parameter
δ. This decrease in energy error is seen clearly in Figure 4.6b and Figure 4.6c for higher δ
values.
4.3.3 Aeroelastic System
In this subsection, we consider open-loop behavior of the nonlinear aeroelastic system studied
by Shukla and Patil [ 177]. As shown in Figure 4.7, the model contains a flat plate supported
by a linear spring in the plunge degree of freedom and cubic nonlinear spring in the pitch


## Page 112

4.3. Numerical Results 93
0 10 20 30 40 50 60 70 80
Time
-1.5
-1
-0.5
0
0.5
1
1.5 Configuration x(t)
One-step Variational
One-step Galerkin
Benchmark
(a) δ = 0.025
0 10 20 30 40 50 60 70 80
Time t
-1.5
-1
-0.5
0
0.5
1
1.5Configuration x(t)
One-step Variational
One-step Galerkin
Benchmark (b) δ = 0.05
0 10 20 30 40 50 60 70 80
Time
-1.5
-1
-0.5
0
0.5
1
1.5 Configuration x(t)
One-step Variational
One-step Galerkin
Benchmark
(c) δ = 0.1
Figure 4.5: Duffing oscillator numerical simulation with α = −1, β = 2 time-step h = 0.1
degree of freedom. The flat plate is free to move up and down along the plunge degree of
freedom and rotate about the pitch degree of freedom. The Lagrangian for this system is
given by
L(h, ˙h, α, ˙α) = mT ˙h2 + Iα ˙α2 + mW xα ˙h ˙α − 1
2 khh2 − 1
2 kα0α2 − 1
3 kα1α3 − 1
4 kα2α4 (4.26)
where mW is the mass of the wing and mT is the total mass of the aeroelastic system. Iα
represents the moment of inertia about the elastic axis. The terms kh and kα{0,1,2} are the
stiffness functions along the plunge and pitch degrees of freedom respectively. The external
nonconservative forces are given by
fh = −ch ˙h + ρU 2bCLααef f (4.27)


## Page 113

94 Chapter 4. One-step Variational and Galerkin Methods
0 10 20 30 40 50 60 70 80
Time
10-10
10-8
10-6
10-4
10-2
Energy Error
One-step Variational
One-step Galerkin
(a) δ = 0.025
0 10 20 30 40 50 60 70 80
Time
10-10
10-8
10-6
10-4
10-2
Energy Error
One-step Variational
One-step Galerkin (b) δ = 0.05
0 10 20 30 40 50 60 70 80
Time
10-10
10-8
10-6
10-4
10-2
Energy Error
One-step Variational
One-step Galerkin
(c) δ = 0.1
Figure 4.6: Duffing oscillator numerical simulation with α = −1, β = 2 time-step h = 0.1
fα = −cα ˙α + ρU 2b2CMααef f (4.28)
where ch and cα are damping coefficients, CLα and CMα are the derivatives of the lift and
moment coefficients, and αef f =

α +
˙h
U +
 1
2 − a

b ˙α
U

is the effective angle of attack. The
equations of motion for this aeroelastic system are given by
mT ¨h + mW xαb¨α + ch ˙h + khh − ρU 2bCLααef f = 0 (4.29)
Iα ¨α + mW xαb¨h + cα ˙α + kα(α)α + ρU 2b2CMααef f = 0 (4.30)
where k(α) = kα0 + kα1α + kα2α2.
We have studied the dynamic behavior of the nonlinear aeroelastic system for initial con-
ditions (h0, ˙h0, α0, ˙α0) = (0 .01, 0, 0.1, 0) at freestream velocity U = 0 .9Uf where Uf is the


## Page 114

4.3. Numerical Results 95
Figure 4.7: Sketch of a two degrees of freedom aeroelastic section model
linear flutter velocity. The phase space plots given in Figure 4.8 clearly demonstrate how
both one-step methods capture the subcritical limit cycle oscillations (LCOs) accurately.
The energy plot in Figure 4.9 shows how the total energy of the aeroelastic system evolves
over time. Initially there is a sharp decrease in energy followed by an increase, and eventually
when the system exhibits periodic motion with constant amplitude the total energy oscillates
around a fixed value. As shown in Figure 4.9, both one-step methods track the change in
energy accurately for the nonlinear aeroelastic system. The energy error comparison in
Figure 4.10 demonstrates how the Galerkin approach has better energy behavior than the
one-step variational approach. The one-step variational method has energy error magnitude
around 10−4 whereas the Galerkin method has energy error around 10−6.
4.3.4 Symplectic Nature
As mentioned in Section 4.2.2, the variational approach to one-step methods only considers
the action integral over one time-step whereas the variational integrators consider the action
integral over a finite number of fixed time-steps. We know that variational integrators


## Page 115

96 Chapter 4. One-step Variational and Galerkin Methods
(a) Plunge response (One-step Galerkin)
 (b) Plunge response (One-step variational)
(c) Pitch response (One-step Galerkin)
 (d) Pitch response (One-step variational)
Figure 4.8: Subcritical LCO simulation using proposed one-step methods
derived from the latter approach yield numerical algorithms that automatically preserve
the canonical symplectic form. For a Hamiltonian system with Hamiltonian H(p, q), the
symplectic flow map ϕt(p0, q0) = ( p(t), q(t)) satisfies the following condition
 ∂ϕt
∂y0
T
J
 ∂ϕt
∂y0

= J (4.31)
where y0 = ( p0, q0) and J =
2
64
0 I
−I 0
3
75 is the symplectic matrix. Similar to this con-
dition, a given one-step method ϕh : ( pk, qk) → (pk+1, qk+1) is symplectic if it satisfies


## Page 116

4.3. Numerical Results 97
0 1 2 3 4 5 6 7 8 9 10
Time
0.08
0.1
0.12
0.14
0.16
0.18
0.2
0.22
0.24Energy
One-step Galerkin
One-step Variational
Benchmark
Figure 4.9: Total energy of the aeroelastic system

∂ϕh
∂yk
T
J

∂ϕh
∂yk

= J for yk = ( pk, qk). The key step in this process is to compute the
following Jacobian matrix
∂ϕh
∂yk
=
2
64
∂pk+1(pk,qk)
∂pk
∂pk+1(pk,qk)
∂qk
∂qk+1(pk,qk)
∂pk
∂qk+1(pk,qk)
∂qk
3
75 (4.32)
Since both proposed methods are generally implicit, the computation for the Jacobian matrix
involves differentiating the governing discrete equations and then solving a system of linear
equations for the entries in the Jacobian matrix. We study the symplectic nature of the
one-step algorithms for both linear and nonlinear conservative systems. It is important to
note that the one-step methods developed in this chapter are formulated on the state space.
In order to check the condition for symplecticity, we need to define pk = mvk to write these
algorithms on phase space. Instead of writing the algorithms on phase space, we pick m = 1
to simplify the expressions.
First, we check the condition for the simple harmonic oscillator with L(q, ˙q) = 1
2 ˙q2 − 1
2 q2


## Page 117

98 Chapter 4. One-step Variational and Galerkin Methods
0 1 2 3 4 5 6 7 8 9 10
Time
10-10
10-8
10-6
10-4
10-2
Energy error (in log scale)  One-step Galerkin
 One-step Variational
Figure 4.10: Energy error comparison between one-step Galerkin and variational methods
where q(t) is the displacement. For a fixed time-step h, the Jacobians for one-step methods
are given by
∂ϕh,V
∂yk
=
2
64
(44h5+143h4−700h3+189h2+1176h−882)
(7h(h4+9h2+210))
(8h5+33h4−224h3−217h2+1568h+294)
(7(h4+9h2+210))
−(66h5+169h4−434h3+1092h2+588h+1764)
(14h(h4+9h2+210))
−(12h5+39h4−224h3−56h2+784h−588)
(14h(h4+9h2+210))
3
75
∂ϕh,G
∂yk
=
2
64
−(2(−h4+30h2+22h2−120))
h4+16h2+240
(h(h4−60h2−72h2+720+720))
6(h4+16h2+240)
−(h(h4−60h2−70h2+600+600))
5(h4+16h2+240)
−(h6−120h4−120h4+2640h2+3600h2−14400)
60(h4+16h2+240)
3
75
For this linear dynamical system, Jacobians from both variational and Galerkin one-step
methods satisfy the condition for symplecticity. For a general mechanical system with a
nonlinear potential energy U (q) and Lagrangian L = 1
2 m ˙q2 − U (q), we find that none of the
one-step methods satisfy the required condition for symplecticity. It is important to note that
the above condition is only to check whether the algorithms preserve the canonical symplectic
form. In fact, at present, one can only check whether a given integration scheme exhibits a
specific symplectic structure; one cannot determine whether any such symplectic structure


## Page 118

4.4. Conclusions 99
exists, in general. In the past, some of the well-known methods such as Newmark methods
have been shown to preserve a noncanonical symplectic form via nonlinear transformations
but it is not generally known how to test for the existence of a noncanonical symplectic form
for a given algorithm.
4.4 Conclusions
In this chapter we have developed Hermite polynomial based one-step variational and Galerkin
methods for mechanical systems with external forcing. We have utilized cubic Hermite poly-
nomials over one time-step for discretization and the resulting numerical algorithms are
continuous in both configuration and velocity. We showed that both one-step methods are
symplectic for linear dynamical systems but they do not preserve the canonical symplectic
form for general nonlinear dynamical systems. We also demonstrated an approach to obtain
one-step methods using higher-order Hermite polynomials.
We have studied the numerical behavior of these algorithms through three different numeri-
cal examples. The energy performance and convergence analysis results for the conservative
example showed how both one-step methods achieve superior numerical performance by ob-
taining C1–continuous trajectories. We have also presented results for a dissipative system
and the numerical plots show that both one-step methods capture the effect of the dissipative
forces accurately over exponentially long time intervals. Finally, numerical studies for the
coupled aeroelastic system show how both one-step methods capture the limit cycle oscilla-
tions accurately. The numerical results from all three examples showed that the Galerkin
approach has significantly better energy behavior. We believe the discrete equation corre-
sponding to the constant test function is the reason behind the superior energy performance
of the Galerkin method.


## Page 119

100 Chapter 4. One-step Variational and Galerkin Methods
In future work, we would like to investigate the connection between the one-step Galerkin
methods and energy-momentum integrators. It would also be desirable to apply these one-
step methods to discretizations of infinite-dimensional systems.


## Page 120

Chapter 5
Energy-preserving Lie Group
Variational Integrators on SO(3)
The goal of this chapter is to develop energy-preserving Lie group variational integrators for
attitude dynamics of a rigid body. First, we derive the equations of motion for a rigid body
and then use the extended discrete mechanics framework to construct energy-preserving
adaptive time step Lie group variational integrators. This integrator is used to study the
dynamics of a 3D pendulum under the influence of gravity and illustrate the advantages of
using adaptive time-stepping in Lie group variational integrators.
This chapter is organized as follows. In Section 5.1, we utilize concepts from extended La-
grangian mechanics to derive continuous-time equations of motion for rigid body attitude
dynamics. In Section 5.2 we derive energy-preserving, adaptive time step Lie group varia-
tional integrator. In Section 5.3 we study the dynamics of an uncontrolled 3D pendulum
moving under the effect of gravity. Finally, in Section 5.4 we provide concluding remarks
for this work.
5.1 Extended Lagrangian Mechanics on SO(3)
We consider attitude dynamics of a rigid body in presence of attitude dependent potential.
We derive the governing equations from Hamilton’s principle for a rigid body system with
101


## Page 121

102 Chapter 5. Energy-preserving Lie Group Variational Integrators on SO(3)
the following Lagrangian
L(R, ω) = 1
2 ωT Jω − U (R) = 1
2 tr

S(ω)JdS(ω)T
− U (R), (5.1)
where Jd = 1
2 tr[J]I3×3 − J and S(·) : R3 → R3×3 maps a vector to a skew-symmetric matrix
such that S(x)y = x × y for x, y ∈ R3.
For a Lagrangian system evolving on Q = SO(3) and time space R, the extended configura-
tion manifold is ¯Q = R×SO(3). In the extended Lagrangian mechanics framework, the state
space T ¯Q = R × T SO(3) is represented by time t, rotation matrix R and angular velocity ω.
These three variables are parametrized by an independent variable a. For a given path c(a),
the initial time is t0 = t(a0) and the final time is tf = t(af ). The extended action ¯B is
¯B =
Z tf
t0
L(t, R, ω)dt =
Z af
a0
L(t(a), R(a), ω(a)) t′(a) da, (5.2)
where t′(a) = dt(a)
da denotes the derivative with respect to independent variable a. For deriving
governing equations we consider the following variation
Rϵ(a) = R(a)eϵη(a), t ϵ(a) = t(a) + ϵδt(a), (5.3)
where ϵ ∈ R and η(a) ∈ so(3) defines a variation in the Lie algebra of skew symmetric
rotation matrices that vanishes at the endpoints. Hence,
δR = dRϵ
dϵ

ϵ=0
= R(a)η(a). (5.4)
Using the kinematic relationship ˙R(a) = R(a)S(ω) the variation of the angular velocity ωϵ


## Page 122

5.1. Extended Lagrangian Mechanics on SO(3) 103
can be computed by
S(ωϵ) = RϵT
(a) ˙Rϵ(a) = RϵT
(a)
 Rϵ′
(a)
tϵ′
(a)

= e−ϵη(a)RT (a)
 R′(a)eϵη(a) + ϵR(a)eϵη(a)η′(a)
t′(a) + ϵδt′(a)

, (5.5)
which after neglecting second order terms simplifies to
S(ωϵ) = e−ϵη(a)S(ω)eϵη(a) + ϵη′(a)
t′(a) + ϵδt′(a)
=

1 − ϵ δt′(a)
t′(a)

(S(ω) + ϵ( ˙η + S(ω)η − ηS(ω))) . (5.6)
Thus, we have
S(ωϵ) = S(ω) + ϵ

˙η + S(ω)η − ηS(ω) − S(ω) δt′(a)
t′(a)

. (5.7)
From Hamilton’s principle we know that variation of the action integral is zero, i.e. δ ¯B = 0.
Taking variation of ( 5.2) yields
δ ¯B =
Z af
a0
1
2 tr [− ˙ηS(Jω ) + ηS(ω × Jω )] t′(a)da
+
Z af
a0
 1
2 ωT Jω − U (R)

− tr

S(ω)JdS(ω)T
δt′(a) da
+
Z af
a0
tr

ηRT ∂U
∂R

t′(a)da, (5.8)


## Page 123

104 Chapter 5. Energy-preserving Lie Group Variational Integrators on SO(3)
which after setting variations at endpoints to zero yields
δ ¯B =
Z tf
t0
1
2 tr

η

S(J ˙ω + ω × Jω ) + 2RT ∂U
∂R

dt
+
Z tf
t0
 d
dt

ωT Jω −
 1
2 ωT Jω − U (R)

δt dt, (5.9)
and gives the following governing equations. The first is the equation of motion for a rigid
body evolving on SO(3) in Lagrangian form
J ˙ω + ω × Jω = ∂U T
∂R R − RT ∂U
∂R , (5.10)
which is the same as the equation obtained using the classical Lagrangian mechanics frame-
work. The second equation is
d
dt
 1
2 ωT Jω + U (R)

= 0, (5.11)
which indicates that the total energy of the rigid body system is a constant.
5.2 Adaptive Variational Integrator
Adaptive time step Lie group variational integrators are obtained by discretizing Hamilton’s
principle in the extended phase space. In this section extended discrete equations of motion
for a rigid body are derived using ideas from extended discrete mechanics and Lie group
methods.


## Page 124

5.2. Adaptive Variational Integrator 105
5.2.1 Extended Discrete Lagrangian Mechanics on SO(3)
In the extended discrete Lagrangian mechanics framework time tk is treated as a discrete
dynamic variable. For the extended discrete mechanics of the rigid body, let Rk ∈ SO(3)
denote the attitude of the rigid body at time tk. We define Fk ∈ SO(3) such that Rk+1 =
RkFk. Using the kinematic relationship ˙R = RS(ω) we approximate S(ωk) by
S(ωk) = RT
k ˙Rk ≈ RT
k
 Rk+1 − Rk
tk+1 − tk

= 1
hk
(Fk − I3×3), (5.12)
where hk = tk+1 − tk is the kth adaptive time step.
We discretize the continuous time action integral ( 5.2) using the extended discrete action
¯Bd =
N −1X
k=0
Ld(tk, Rk, tk+1, Rk+1), (5.13)
where Ld : ¯Q × ¯Q → R is the extended discrete Lagrangian function which approximates the
action integral between two successive configurations. For the rigid body system we consider
the extended discrete Lagrangian Ld
Ld(tk, Rk, tk+1, Rk+1) ≃ hk
 L(tk, Rk, ωk) + L(tk+1, Rk+1, ωk)
2

= 1
hk
tr [(I3×3 − Fk)Jd] − hk
2 U (Rk) − hk
2 U (Rk+1). (5.14)
Just like the continuous case, the variations in Rk and tk can be expressed as follows
Rϵ
k = Rkeϵηk, t ϵ
k = tk + ϵδtk. (5.15)


## Page 125

106 Chapter 5. Energy-preserving Lie Group Variational Integrators on SO(3)
From Fk = RT
k Rk+1 and hk = tk+1 − tk, F ϵ
k and hϵ
k are
F ϵ
k = RϵT
k Rϵ
k+1 = e−ϵηkFkeϵηk+1, h ϵ
k = hk + ϵ(δtk+1 − δtk). (5.16)
Using above expressions we can write
¯Bϵ
d =
N −1X
k=0
1
hϵ
k
tr

(I3×3 − e−ϵηkFkeϵηk+1)Jd

−
N −1X
k=0
hϵ
k
2 U (Rkeϵηk) + hϵ
k
2 U (Rk+1eϵηk+1)

. (5.17)
Taking variations of the extended discrete action gives
δ ¯Bd =
N −1X
k=0
1
hk
tr [(ηkFk − Fkηk+1)Jd]
+
N −1X
k=0
hk
2 tr

ηkRT
k
∂U
∂Rk
+ ηk+1RT
k+1
∂U
∂Rk+1

−
N −1X
k=0
(δtk+1 − δtk)
h2
k
tr [(I3×3 − Fk)Jd]
−
N −1X
k=0
δtk+1
U (Rk) + U (Rk+1)
2 +
N −1X
k=0
δtk
U (Rk) + U (Rk+1)
2 . (5.18)
Applying discrete Hamilton’s principle, i.e. δ ¯Bd = 0 and setting variations at end points to
zero gives
N −1X
k=1
tr

ηk
 1
hk
FkJd − 1
hk−1
JdFk−1 + hk + hk−1
2 RT
k
∂U
∂Rk

+
N −1X
k=1
 1
h2
k
tr [(I3×3 − Fk)Jd] + U (Rk+1) + U (Rk)
2

δtk
−
 1
h2
k−1
tr [(I3×3 − Fk−1)Jd] + U (Rk) + U (Rk−1)
2

δtk = 0, (5.19)


## Page 126

5.2. Adaptive Variational Integrator 107
which lead to the extended discrete equations of motion for the rigid body system evolving
on SO(3) in Lagrangian form:
1
hk

FkJd − JdF T
k

− 1
hk−1

JdFk−1 − F T
k−1Jd

= hk + hk−1
2
 ∂U
∂Rk
T
Rk − RT
k
∂U
∂Rk

, (5.20)
1
h2
k
tr [(I3×3 − Fk)Jd] + U (Rk+1) + U (Rk)
2
= 1
h2
k−1
tr [(I3×3 − Fk−1)Jd] + U (Rk) + U (Rk−1)
2 , (5.21)
Rk+1 = RkFk. (5.22)
Given (hk−1, Rk−1, Fk−1, Rk), the extended discrete equations of motion can be solved to
obtain Fk, Rk+1 and hk. This extended discrete Lagrangian system can be seen as a numerical
integrator of the continuous time rigid body system on SO(3) with adaptive time steps.
In the extended discrete mechanics framework, we define the discrete momentum Πk by
Πk = D4Ld(tk−1, Rk−1, tk, Rk), (5.23)
where Di denotes differentiation with respect to the ith argument of the discrete Lagrangian
Ld . We also introduce the discrete energy
Ek = D3Ld(tk−1, Rk−1, tk, Rk). (5.24)
Using the discrete momentum and discrete energy definitions, we can re-write the extended


## Page 127

108 Chapter 5. Energy-preserving Lie Group Variational Integrators on SO(3)
discrete equations of motion ( 5.20) and ( 5.21) in the Hamiltonian form as
FkJd − JdF T
k = hkS(Πk + hk
2 Mk), (5.25)
1
h2
k
tr [(I3×3 − Fk)Jd] + U (Rk+1) + U (Rk)
2 = Ek, (5.26)
Rk+1 = RkFk, (5.27)
Πk+1 = F T
k Πk + hk
2 F T
k Mk + hk
2 Mk+1, (5.28)
Ek+1 = 1
h2
k
tr [(I3×3 − Fk)Jd] + U (Rk+1) + U (Rk)
2 , (5.29)
where Mk ∈ R3 is defined such that S(Mk) = ∂U
∂Rk
T
Rk − RT
k
∂U
∂Rk
. Given (Πk, Rk, Ek), the
coupled nonlinear equations ( 5.25),(5.26) and ( 5.27) are solved implicitly to obtain Fk,Rk+1
and hk. The configuration Fk and Rk+1 along with the time step hk are then used in ( 5.28)
and ( 5.29) to obtain (Πk+1, Ek+1) explicitly.
5.2.2 Properties of Adaptive Lie Group Variational Integrator
Due to the variational nature of their derivation, adaptive time step variational integrators
have been shown to preserve the extended symplectic form and extended discrete Noether’s
theorem [ 44]. By choosing an extended discrete Lagrangian ( 5.14) that inherits all the
symmetries of the continuous Lagrangian, all the conserved momenta of the continuous time
dynamics are preserved in the discrete dynamics. In fact, since our rigid body system is
an autonomous Lagrangian system, the time-symmetry of the discrete Lagrangian leads to
conservation of discrete energy ( 5.24).
At every time step, the rotation matrix Rk is updated by Rk+1 = RkFk where we have
defined Fk ∈ SO(3). Since the Lie group SO(3) is closed under matrix multiplication, the
updated matrix Rk+1 remains on SO(3). Thus, the adaptive time step Lie group variational


## Page 128

5.2. Adaptive Variational Integrator 109
integrator (5.25)-(5.29) preserves symplectic form, energy and momentum and also preserves
the geometric features of configuration space.
5.2.3 Computational Approach
It is important to note that unlike the fixed time step case the governing discrete nonlinear
equations are coupled in Fk and tk+1. Instead of solving both equations simultaneously, we
take the sequential approach of first solving the discrete momentum equation ( 5.25) followed
by solving the discrete energy equation ( 5.26). In order to make sure Fk obtained from the
discrete momentum equation lies on SO(3), we use the Cayley transformation to transform
the matrix equation to an equivalent vector equation. The implicit equation ( 5.25) has the
following structure
F (i)
k Jd − Jd(F (i)
k )T = S(g(i)
k ), (5.30)
where g(i)
k = Π k +
h(i)
k
2 Mk ∈ R3 with (F (i)
k , h(i)
k ) being the solution after ith sequential iteration.
We express F (i)
k in terms of a vector f (i)
k using the Cayley transformation
F (i)
k =

I3×3 + S(f (i)
k )

I3×3 − S(f (i)
k )
−1
, (5.31)
which transforms the discrete momentum equation to the following vector equation
GCay (f (i)
k ) = g(i)
k + g(i)
k × f (i)
k + ((g(i)
k )T f (i)
k )f (i)
k − 2Jf (i)
k = 0. (5.32)
The above equation is solved using the Newton method
f (i)
kj+1 = f (i)
kj − ∇GCay (f (i)
kj )−1GCay (f (i)
kj ), (5.33)


## Page 129

110 Chapter 5. Energy-preserving Lie Group Variational Integrators on SO(3)
where
∇GCay (f (i)
kj ) = S(g(i)
k ) − 2J + ((g(i)
k )T f (i)
k )I3×3 + (f (i)
k (g(i)
k )T ). (5.34)
The solution obtained from Newton method is then used to solve ( 5.26) for h(i)
k using
h(i)
k =
vuuuut
tr
h
(I3×3 − F (i)
k )Jd
i
Ek −

U (R(i)
k+1)+U (Rk)
2
 , (5.35)
where F (i)
k is the Fk solution obtained after ith sequential iteration and R(i)
k+1 = RkF (i)
k .
5.3 Numerical Example of a 3D Pendulum
We apply the adaptive time step Lie group variational integrator developed in this chapter
to study the dynamics of an uncontrolled 3D pendulum, a rigid asymmetric body supported
by a frictionless pivot acting under the influence of gravity [ 100]. The potential due to the
gravitational force, acting in the vertical or e3 direction, is given by
U = −mgeT
3 Rρ, (5.36)
where ρ ∈ R3 is the vector from the pivot to the center of mass of the body expressed in the
body fixed frame.


## Page 130

5.3. Numerical Example of a 3D Pendulum 111
5.3.1 Adaptive Variational Integrator
For the motion of 3D pendulum under the influence of gravity, the governing discrete equa-
tions are given by
FkJd − JdF T
k = hkS(Πk) + h2
k
2 mg

RT
k e3ρT − ρeT
3 Rk

, (5.37)
1
h2
k
tr [(I3×3 − Fk)Jd] − mgeT
3
Rk+1 + Rk
2 ρ = Ek, (5.38)
Rk+1 = RkFk, (5.39)
Πk+1 = F T
k Πk + hk
2 F T
k mg

ρ × RT
k e3

+ hk
2 mg

ρ × RT
k+1e3

, (5.40)
Ek+1 = 1
h2
k
tr [(I3×3 − Fk)Jd] − mgeT
3
Rk+1 + Rk
2 ρ. (5.41)
Left multiplying both sides of ( 5.40) by Rk+1 and using the definition of Fk = RT
k+1Rk
Rk+1Πk − RkΠk = hk
2 mg

Rk

ρ × RT
k e3

+ Rk+1

ρ × RT
k+1e3

(5.42)
If we take dot product of the above equation with e3, the right hand side of the goes to
zero, which means that our integrator conserves eT
3 RkΠk which is the discrete analogue of
the vertical component of the angular momentum. In fact, the left hand side of ( 5.38) and
right hand side of ( 5.41) are same i.e. Ek+1 = Ek, which means that at every time step our
integrator conserves the discrete energy Ek.
5.3.2 Numerical Results
In this subsection, we implement adaptive Lie group variational integrator for the 3D pen-
dulum to study the uncontrolled dynamics. We consider the 3D pendulum parameters and
initial conditions first studied in [ 100] and compare the fixed time step Lie group variational


## Page 131

112 Chapter 5. Energy-preserving Lie Group Variational Integrators on SO(3)
integrator results with the results from the adaptive time step Lie group variational integra-
tor to demonstrate the superior numerical performance of the adaptive algorithm. The mass
properties of the 3D pendulum are
J = diag[1, 2.8, 2]kgm2, m = 1kg, ρ = [0, 0, 1]m. (5.43)
We present results for the following two initial conditions.
1. Small perturbation from the hanging equilibrium
R0 = I3×3, ω 0 = [0.5, −0.5, 0.4]rad/s. (5.44)
2. Small perturbation from the inverted equilibrium
R0 = diag[−1, 1, −1], ω 0 = [0.5, −0.5, 0.4]rad/s. (5.45)
0 0.5 1 1.5 2 2.5 3
Iteration number k 104
0.97
0.98
0.99
1
1.01
1.02
1.03
Adaptive time step h k
10-3
 Small perturbation from hanging equilibrium
 Small perturbation from inverted equilibrium
Figure 5.1: Adaptive time step behavior for both cases
For both cases, results from the adaptive algorithm for an initial time step of h0 = 0.001 are
compared with results from the fixed algorithm for a fixed step size of h = 0.001. Numerical
results for the first case are presented in Fig. 5.2, where Fig. 5.2a shows that time history
of the angular velocity for both algorithms are indistinguishable, and Fig. 5.2b compares


## Page 132

5.3. Numerical Example of a 3D Pendulum 113
the error in conserved quantities for both algorithms. The discrete energy error plot for the
first case shows that the adaptive time step algorithm has nearly exact energy preservation
whereas the fixed time step method has energy error around 10−7. The other two plots in
the Fig. 5.2b show that adaptive time step variational integrator preserves the first integrals
and the structure of the configuration space with the same accuracy as the fixed time step
variational integrator.
For the second case, the angular velocities in Fig. 5.3a are irregular, with the time histories
not matching for both algorithms. In Fig. 5.3b, energy error for the fixed time step algorithm
increases to 10−4 for the fixed time step algorithm as compared to 10−12 for the adaptive
time step algorithm. The angular momentum and orthogonality error plots for the second
case show a numerical performance similar to the first case.
Fig. 5.1 shows how the adaptive time step behaves differently for both cases. The adaptive
time step hk doesn’t decrease or increase substantially from the initial time step of h0 = 0.001
over the 3000 iterations. For the case with dynamics around the hanging equilibrium, the
adaptive time step is found to be decreasing whereas it increases irregularly for the second
case with chaotic behavior.
We have done an order analysis comparison between the fixed and adaptive time step vari-
ational integrators for different time step values to understand the effect of the time step
on the mean energy error and computational time. For the first case, in Fig. 5.4 we have
varied the time step from 0.001 to 0.1 to understand how the mean energy error and CPU
time change. Fig. 5.4a shows a second order convergence for the mean energy error for
decreasing time step whereas the mean energy error remains at the machine level accuracy
for the adaptive algorithm due to its energy-preserving nature. In Fig. 5.4b CPU time for
both algorithms converge with the same order with adaptive algorithm being 2-5 times more
expensive due to the additional discrete energy equation solved at every iteration.


## Page 133

114 Chapter 5. Energy-preserving Lie Group Variational Integrators on SO(3)
Table 5.1: Fixed and Adaptive Algorithm Comparison for the 3D Pendulum
Method Time step Mean|∆E| CPU time Mean||I − RTR||
Adaptive 10−4 2.3 × 10−13 72.5 1.2 × 10−12
Algorithm 4 × 10−3 1.6 × 10−13 18.0 6.7 × 10−14
10−3 1.7 × 10−13 7.5 2.6 × 10−14
Fixed 10−4 1.7 × 10−7 48.8 4.1 × 10−13
Algorithm 4 × 10−3 3.1 × 10−6 12.1 3.9 × 10−14
10−3 1.7 × 10−5 5.2 2.0 × 10−14
In Table 5.1 we have compared numerical performance of fixed and adaptive algorithms
for the second case to demonstrate that adaptive algorithms are able to achieve orders of
magnitude better energy behavior with less CPU time. For example, the adaptive algorithm
achieves mean energy error around 10−13 with an initial step size of 0.001 and CPU time
of 7.5. On the other hand, the fixed time step algorithm with a smaller step size of 0.0001
and CPU time of 48.8 is only able to achieve mean energy error of around 10−7. Thus, the
adaptive algorithm gives orders of magnitude better energy performance with only 1/6th of
CPU time.
0 5 10 15 20 25 30
-1
0
1
0 5 10 15 20 25 30
-1
0
1
0 5 10 15 20 25 30
Time
0.2
0.4
0.6
(a) Angular velocity comparison
0 5 10 15 20 25 3010-20
10-10
100
 Ek error
0 5 10 15 20 25 3010-16
10-14
10-12
e3
TR  error
0 5 10 15 20 25 30
Time
10-20
10-15
10-10 (b) Error in conserved quantities
Figure 5.2: Small perturbation from the hanging equilibrium. (Adaptive algorithm: solid.
Fixed algorithm: dashed)


## Page 134

5.4. Conclusions 115
0 5 10 15 20 25 30
-10
0
10
0 5 10 15 20 25 30
-5
0
5
0 5 10 15 20 25 30
Time
-5
0
5
(a) Angular velocity comparison
0 5 10 15 20 25 3010-20
10-10
100
 Ek error
0 5 10 15 20 25 3010-16
10-14
10-12
e3
TR  error
0 5 10 15 20 25 30
Time
10-20
10-15
10-10 (b) Error in conserved quantities
Figure 5.3: Small perturbation from the inverted equilibrium. (Adaptive algorithm: solid.
Fixed algorithm: dashed)
10-3 10-2 10-1
Step size
10-20
10-15
10-10
10-5
100
Mean |  E |
(a) Mean energy error
10-3 10-2 10-1
Step size
10-1
100
101
102
CPU time (b) Computational cost
10-1 100 101
CPU time
10-10
100
Mean |  E | (c) Energy error vs CPU time
Figure 5.4: Order with respect to energy and computational cost(Adaptive algorithm: red,
circle. Fixed algorithm: blue, cross)
5.4 Conclusions
In this chapter, we present adaptive time step variational integrators for attitude dynam-
ics of a rigid body under the influence of attitude dependent potential. By developing the
extended Lagrangian mechanics framework on SO(3), we derive extended equations of mo-
tion for the rigid body system in continuous time. To derive energy-preserving variational
integrators, we use concepts from extended discrete mechanics, where in addition to the
configuration variables time is also considered a discrete dynamic variable. The govern-


## Page 135

116 Chapter 5. Energy-preserving Lie Group Variational Integrators on SO(3)
ing discrete equations are obtained from the discrete Hamilton’s principle in the extended
phase space, and resulting adaptive algorithm preserves the discrete energy in addition to
the symplectic and momentum preservation properties characteristic of the fixed time step
variational integrators.
The resulting adaptive time step Lie group variational integrator is used to study the dynam-
ics of uncontrolled 3D pendulum in presence of gravity. The adaptive time step algorithm
exhibits superior energy performance in both cases compared to the fixed time step al-
gorithm while maintaining the same level of accuracy for orthogonality error and angular
momentum conservation. The order analysis results show that, despite solving an additional
nonlinear equation at each time step, the adaptive algorithm takes - due to its superior
energy performance- less computation time than the fixed time step Lie group variational
integrator to achieve same level of energy accuracy.


## Page 136

Chapter 6
Energy-preserving Lie Group
Variational Integrators on SE(3)
The goal of this chapter is to develop adaptive time step Lie group variational integrators for
simultaneously rotating and translating rigid body motion. First, we derive the continuous
time equations of motion for a rigid body in SE(3) using extended Lagrangian mechanics.
We then use the extended discrete mechanics framework to construct adaptive time step
variational integrators from the discretized variational principle. This integrator is used to
study the dynamics of an underwater vehicle. The results demonstrate the superior energy
performance of adaptive time step Lie group variational integrators compared to their fixed
time step counterpart.
This chapter is organized as follows. In Section 6.1, we utilize concepts from extended La-
grangian mechanics to derive continuous-time equations of motion for rigid body motion in
SE(3). In Section 6.2 we derive energy-preserving, adaptive time step Lie group variational
integrator. In Section 6.3 we study the dynamics of a neutrally buoyant conservative under-
water. Finally, in Section 6.4 we provide concluding remarks and suggest future directions
for this work.
117


## Page 137

118 Chapter 6. Energy-preserving Lie Group Variational Integrators on SE(3)
6.1 Continuous Time Model
A rigid body that is simultaneously translating and rotating is said to undergo Euclidean
motion. For describing this Euclidean motion, we arbitrarily select an inertial frame and a
body fixed frame in the rigid body such that the origin is at the center of mass of the rigid
body. The configuration space of a rotating and translating rigid body in three dimensions is
the Lie group SE(3) and we represent the configuration (R, x) ∈ SE(3) by the homogeneous
matrix G =
2
64
R x
0 1
3
75 where R ∈ SO(3) is the rotation matrix and x ∈ R3 is the position of
the center of mass in inertial frame. The rotational and translational kinematics for a rigid
body are described by (R, x, ˙R, ˙x) ∈ TSE(3). The rotational and translational kinematics
equations can be written as
˙G =
2
64
˙R ˙x
0 0
3
75 =
2
64
R x
0 1
3
75
2
64
S(ω) v
0 0
3
75 = GV, (6.1)
where ω, v ∈ R3 are the angular and translational velocity vectors in the body-fixed frame
and V is an element of the Lie algebra se(3). S(·) : R3 → R3×3 maps a vector to a skew-
symmetric matrix such that S(x)y = x × y for x, y ∈ R3.
6.1.1 Extended Lagrangian Mechanics on SE(3)
Consider a time-dependent Lagrangian system evolving on Q = SE(3) and time space R.
In the extended Lagrangian mechanics framework, time t, configuration G and velocity V
are parameterized by an independent variable a. For a given path c(a), the initial time is


## Page 138

6.1. Continuous Time Model 119
t0 = t(a0) and the final time is tf = t(af ). The extended action ¯B is
¯B =
Z tf
t0
L(t, G, V )dt =
Z af
a0
L(t(a), G(a), V (a)) t′(a) da, (6.2)
where (·)′ = d
da (·) denotes the derivative with respect to independent variable a. We consider
the following admissible variations
Gϵ(a) = G(a)eϵΓ(a), t ϵ(a) = t(a) + ϵδt(a), (6.3)
where Γ is an admissible differentiable curve on se(3). Using the isomorphism S : R3 × R3 →
se(3) we define Γ = S(η, χ) =
2
64
S(η) χ
0 0
3
75 with the variations η, χ ∈ R3 vanishing at t0 and
tf . Using the Gϵ definition, we get
δG = dGϵ
dϵ

ϵ=0
= G(a)Γ(a) =
2
64
RS(η) Rχ
0 0
3
75 . (6.4)
We obtain ˙Gϵ from the Gϵ and tϵ definitions ( 6.3)
˙Gϵ =
dGϵ
da
dtϵ
da
= G′(a)eϵΓ(a) + ϵG(a)eϵΓ(a)Γ′(a)
t′(a)

1 + ϵ δt′(a)
t′(a)
 . (6.5)
Using the binomial expansion for the denominator gives
˙Gϵ =
dGϵ
da
dtϵ
da
= G′(a)eϵΓ(a) + ϵG(a)eϵΓ(a)Γ′(a)
t′(a)

1 + ϵ δt′(a)
t′(a)

=

˙G(a)eϵΓ(a) + ϵG(a)eϵΓ(a) ˙Γ(a)

1 − ϵ δt′(a)
t′(a) + O(ϵ2)

= ˙GeϵΓ + ϵGeϵΓ ˙Γ − ϵ ˙GeϵΓ δt′
t′ + O(ϵ2). (6.6)


## Page 139

120 Chapter 6. Energy-preserving Lie Group Variational Integrators on SE(3)
From ˙Gϵ and kinematic equation ( 6.1), we obtain δ ˙G
δ ˙G = d ˙Gϵ
dϵ

ϵ=0
= ˙GΓ + G ˙Γ − ˙G δt′
t′ = G

V Γ + ˙Γ − V δt′
t′

. (6.7)
Taking variations of the kinematic equation ( 6.1)
δ ˙G = δGV + GδV = GΓV + GδV, (6.8)
and equating it with δ ˙G from ( 6.7) gives δV
δV = V Γ − ΓV + ˙Γ − V δt′(a)
t′(a) . (6.9)
Using S(a × b) = S(a)S(b) − S(b)S(a), we simplify
V Γ − ΓV =
2
64
S(ω × η) S(ω)χ − S(η)v
0 0
3
75
= S
0
B@
2
64
S(ω) 0
S(v) S(ω)
3
75
2
64
η
χ
3
75
1
CA , (6.10)
which gives
δV = S
0
B@
2
64
S(ω) 0
S(v) S(ω)
3
75
2
64
η
χ
3
75
1
CA + ˙Γ − V δt′(a)
t′(a) . (6.11)
Taking variations of the extended action
δ ¯B =
Z af
a0
 ∂L
∂G · δG + ∂L
∂V · δV + ∂L
∂t · δt

t′(a)da
+
Z af
a0
L δt ′(a) da. (6.12)


## Page 140

6.1. Continuous Time Model 121
Using (δR, δx) = R(S(η), χ), we compute
∂L
∂R · δR =
3X
i=1
∂L
∂ri
· δri = −
3X
i=1
S(ri) ∂L
∂ri
· η, (6.13)
where ri is the i-th column of RT for i = 1, 2, 3. Thus,
Z af
a0
 ∂L
∂G · δG

t′(a) da =
Z tf
t0
 ∂L
∂R · δR + ∂L
∂x · Rχ

dt
=
Z tf
t0
S
0
B@
2
64
−P3
i=1 S(ri) ∂L
∂ri
RT ∂L
∂x
3
75
1
CA · Γ dt. (6.14)
Similarly
∂L
∂V · δV = S
 ∂L
∂ω , ∂L
∂v

·

V Γ − ΓV + ˙Γ − V δt′(a)
t′(a)

= S
0
B@
2
64
−S(ω) −S(v)
0 −S(ω)
3
75
2
64
∂L
∂ω
∂L
∂v
3
75
1
CA · Γ
+ ∂L
∂V ·

˙Γ − V δt′(a)
t′(a)

. (6.15)
From Hamilton’s principle we know that for the actual path of the motion δ ¯B = 0. Substi-
tuting all the computed terms in ( 6.12) and using integration by parts gives
Z tf
t0
S
0
B@
2
64
−S(ω) −S(v)
0 −S(ω)
3
75
2
64
∂L
∂ω
∂L
∂v
3
75 +
2
64
−P3
i=1 S(ri) ∂L
∂ri
RT ∂L
∂x
3
75
1
CA · Γdt
 ∂L
∂V · Γ − ∂L
∂V · V δt
tf
t0
+
Z tf
t0
− d
dt
2
64
∂L
∂ω
∂L
∂v
3
75 · Γdt
+
Z tf
t0
 ∂L
∂t + d
dt
 ∂L
∂ω · ω + ∂L
∂v · v − L

δtdt = 0. (6.16)


## Page 141

122 Chapter 6. Energy-preserving Lie Group Variational Integrators on SE(3)
Setting the variations at endpoints to zero leads us to the governing equations in the extended
mechanics framework. Equations of motion for a rigid body evolving on SE(3) are
d
dt
2
64
∂L
∂ω
∂L
∂v
3
75 +
2
64
S(ω) S(v)
0 S(ω)
3
75
2
64
∂L
∂ω
∂L
∂v
3
75 −
2
64
−P3
i=1 S(ri) ∂L
∂ri
RT ∂L
∂x
3
75 = 0. (6.17)
The second equation is the energy evolution equation
∂L
∂t + d
dt
 ∂L
∂ω · ω + ∂L
∂v · v − L

= 0, (6.18)
which describes how the energy of the rigid body system evolves with time.
6.1.2 Equations of Motion
We consider the special case with the following Lagrangian for the motion of a rigid body in
SE (3)
L(x, v, R, ω) = 1
2 vT M v + 1
2 ωT Jω − U (x, R)
= 1
2 vT M v + 1
2 tr

S(ω)JdS(ω)T
− U (x, R), (6.19)
where J is the standard inertia matrix, Jd = 1
2 tr[J]I3×3 −J is the nonstandard inertia matrix
and M is the mass matrix for the body. The governing extended equations of motion are
M ˙v + ω × M v + RT ∂U (G)
∂x = 0, (6.20)
J ˙ω + ω × Jω + v × M v + RT ∂U (G)
∂R − ∂U (G)
∂R
T
R = 0, (6.21)


## Page 142

6.2. Adaptive Variational Integrator 123
d
dt
 1
2 vT M v + 1
2 ωT Jω + U (x, R)

= 0. (6.22)
We know that the linear and angular momenta of the rigid body are given by γ = M v ∈ R3
and Π = Jω ∈ R3 in the body fixed frame. The extended equations of motion in the
Hamiltonian form are
˙γ + Rω × RT γ + ∂U (G)
∂x = 0, (6.23)
˙Π + ω × Π + v × RT γ + RT ∂U (G)
∂R − ∂U (G)
∂R
T
R = 0, (6.24)
d
dt
 1
2 γT RM −1RT γ + 1
2 ΠT J −1Π + U (x, R)

= 0. (6.25)
These linear and angular momenta are related to the momenta conjugate to ˙x and R, P ˙x ∈ R3
and P ˙R ∈ R3×3, by
P ˙x = Rγ, P ˙R − P T
˙R = S(Π). (6.26)
6.2 Adaptive Variational Integrator
In this section adaptive time step Lie group variational integrators for rigid body motion in
SE(3) are obtained by discretizing Hamilton’s principle. Using ideas from extended discrete
mechanics and Lie group methods, extended discrete equations of motion are derived in both
Lagrangian and Hamiltonian form.


## Page 143

124 Chapter 6. Energy-preserving Lie Group Variational Integrators on SE(3)
6.2.1 Extended Discrete Lagrangian Mechanics on SE(3)
In the discrete domain, we treat the time tk as a discrete dynamic variable. By discretizing
the kinematic relation ˙R = RS(ω), we obtain
Rk+1 − Rk
hk
= RkS(ωk), (6.27)
where hk = tk+1 −tk. We define Fk ∈ SO(3) such that Rk+1 = RkFk. This gives the following
approximation to S(ωk)
S(ωk) ≈ 1
hk
(Fk − I3×3) . (6.28)
Similarly discretizing the kinematic relation ˙x = Rv gives
xk+1 = hkRkvk + xk. (6.29)
We define the extended discrete Lagrangian Ld : ¯Q × ¯Q → R and discretize the extended
action
¯Bd =
N −1X
k=0
Ld(tk, xk, Rk, tk+1, xk+1, Rk+1). (6.30)
For the rigid body system, we consider
Ld ≃ hk
 L(tk, Rk, xk, vk, ωk) + L(tk+1, Rk+1, xk+1, vk, ωk)
2

= 1
hk
tr [(I3×3 − Fk)Jd] + hk
2 vT
k M vk − hk
2 (Uk + Uk+1) , (6.31)
where Uk := U (xk, Rk). We consider the following variations
Gϵ
k = GkeϵΓk, t ϵ
k = tk + ϵδtk. (6.32)


## Page 144

6.2. Adaptive Variational Integrator 125
The variation of Fk = RT
k Rk+1 using δRk = RkS(ηk) yields
δFk = −S(ηk)Fk + FkS(ηk+1). (6.33)
Similarly variation of vk =
RT
k
hk
(xk+1 − xk) gives
δvk = RT
k
hk
(δxk+1 − δxk) − S(ηk)vk − RT
k
h2
k
(xk+1 − xk)δhk. (6.34)
If we consider the variation of the kinetic energy term we get
δ
 1
hk
tr [(I3×3 − Fk)Jd] + hk
2 vT
k M vk

= δhk
2 vT
k M vk+
1
hk
tr [(S(ηk)Fk − FkS(ηk+1))Jd] − δhk
h2
k
tr [(I3×3 − Fk)Jd]
+ vT
k M

RT
k (δxk+1 − δxk) − hkS(ηk)vk − vkδhk

. (6.35)
Similarly variation of the potential energy term gives
δ

− hk
2 (Uk + Uk+1)

= − δhk
2 (Uk + Uk+1)
− hk
2
k+1X
j=k
 ∂Uj
∂Rj
· δRj + ∂Uj
∂xj
T
δxj

, (6.36)
where ∂U
∂R ·δR = ∂U
∂R[ij]
δR[ij]. Using δR = RS(η) and the identity ∂U
∂R RS(η) = −tr

S(η)RT ∂U
∂R

we get
δ

− hk
2 (Uk + Uk+1)

= − δtk+1 − δtk
2
k+1X
j=k
(Uj)
− hk
2
k+1X
j=k

−tr

S(ηj)RT
j
∂Uj
∂Rj

+ ∂Uj
∂xj
T
δxj

. (6.37)


## Page 145

126 Chapter 6. Energy-preserving Lie Group Variational Integrators on SE(3)
Setting δ ¯Bd and variations at endpoints to zero gives
0 =
N −1X
k=1

vT
k−1M RT
k−1 − vT
k M RT
k − hk + hk−1
2
∂Uk
∂xk
T
δxk
+
N −1X
k=1
tr

S(ηk)
 1
hk
FkJd − 1
hk−1
JdFk−1

−
N −1X
k=1
tr

S(ηk)

hkvkvT
k M − hk + hk−1
2 RT
k
∂Uk
∂Rk

+
N −1X
k=1
 tr[(I3×3 − Fk)Jd]
h2
k
+ vT
k M vk
2 + Uk + Uk+1
2

δtk
−
N −1X
k=1
 tr[(I3×3 − Fk−1)Jd]
h2
k−1
− vT
k−1M vk−1
2 − Uk + Uk−1
2

δtk. (6.38)
The above equation should be satisfied for all admissible variations ηk, δxk and δtk, and since
S(ηk) is skew-symmetric, the governing extended discrete equations on SE(3) in Lagrangian
form are
1
hk

FkJd − JdF T
k

− 1
hk−1

JdFk−1 − F T
k−1Jd

= hk

vkvT
k M − M vkvT
k

+ hk + hk−1
2
 ∂Uk
∂Rk
T
Rk − RT
k
∂Uk
∂Rk

, (6.39)
M vk + hk + hk−1
2 RT
k
∂Uk
∂xk
= F T
k−1M vk−1, (6.40)
1
h2
k
tr[(I3×3 − Fk)Jd] + vT
k M vk
2 + Uk + Uk+1
2 =
1
h2
k−1
tr[(I3×3 − Fk−1)Jd] + vT
k−1M vk−1
2 + Uk + Uk−1
2 , (6.41)
xk+1 = xk + (hkRkvk), (6.42)


## Page 146

6.2. Adaptive Variational Integrator 127
Rk+1 = RkFk. (6.43)
Given (hk−1, xk, vk−1, Rk, Fk−1), above equations can be solved to obtain (hk, xk+1, vk, Rk+1, Fk).
Using the discrete Legendre transform, we can re-write the governing discrete equations in
the Hamiltonian form
1
hk
(FkJd − JdF T
k ) − hk
2 S(Mk) − hk(vkvT
k M − M vkvT
k ) = S(Πk), (6.44)
M vk + hk
2 RT
k
∂Uk
∂xk
= RT
k γk, (6.45)
Rk+1 = RkFk, (6.46)
xk+1 = xk + (hkRkvk), (6.47)
1
h2
k
tr[(I3×3 − Fk)Jd] + vT
k M vk
2 + Uk + Uk+1
2 = Ek, (6.48)
γk+1 = RkM vk − hk
2
∂Uk+1
∂xk+1
, (6.49)
S(Πk+1) = 1
hk
(JdFk − F T
k Jd) + hk
2 S(Mk+1), (6.50)
Ek+1 = 1
h2
k
tr[(I3×3 − Fk)Jd] + vT
k M vk
2 + Uk + Uk+1
2 , (6.51)
where Mk ∈ R3 is defined such that S(Mk) = ∂U
∂Rk
T
Rk−RT
k
∂U
∂Rk
. Given (hk−1, xk, Rk, γk, Πk, Ek),
the coupled implicit equations ( 6.44)-(6.48) are solved to obtain ( Fk, vk, hk, xk+1, Rk+1) which
are used in the explicit equations ( 6.49)-(6.51) to obtain discrete momenta (γk+1, Πk+1) and
discrete energy Ek+1.


## Page 147

128 Chapter 6. Energy-preserving Lie Group Variational Integrators on SE(3)
6.2.2 Numerical properties of the adaptive algorithm
Adaptive time step variational integrators preserve the extended symplectic form and exhibit
a discrete analogue of Noether’s theorem [ 44] that leads to conservation of the discrete
momentum in presence of symmetries. Our choice of the discrete Lagrangian ( 6.31) inherits
all the symmetries of the continuous Lagrangian, therefore the adaptive algorithm preserves
all the conserved momenta of the continuous time system in the numerical simulation. The
discrete energy equation ( 6.41) ensures that the adaptive time step is chosen such that the
energy is conserved in the discrete dynamics.
Since we have defined Fk ∈ SO(3) and the Lie group SO(3) is closed under matrix multiplica-
tion, the rotational configuration at the next time lies on SO(3) i.e. Rk+1 = RkFk ∈ SO(3).
This way the configuration of the rigid body (Rk, xk) automatically remains on SE(3). Thus,
in addition to being symplectic as well as energy and momentum-conserving, the adaptive
time step Lie group variational integrator also preserves the geometry of the nonlinear con-
figuration space.
6.2.3 Computational Approach
Based on the structure of the coupled implicit discrete equations ( 6.44)-(6.48), we suggest
a computational approach for solving these equations sequentially instead of solving all
equations simultaneously. Given (hk−1, xk, Rk, γk, Πk, Ek) and an initial guess h(0)
k = hk−1
for the adaptive time step hk, we start by solving the explicit discrete equation ( 6.45) to
obtain v(i)
k which is used to solve ( 6.44) for F (i)
k . The implicit discrete equation ( 6.44) can
be re-written as
F (i)
k Jd − Jd(F (i)
k )T = S(g(i)
k ), (6.52)


## Page 148

6.3. Numerical Results 129
where S(g(i)
k ) = S(Πk +
h(i)
k
2 Mk) + h(i)
k (v(i)
k (v(i)
k )T M − M v(i)
k (v(i)
k )T ). To make sure Fk lies on
SO(3), we express it as the exponential of an element of its Lie algebra S(f ) ∈ so(3) for
some f ∈ R3. We use the Cayley transformation
F (i)
k =

I3×3 + S(f (i)
k )

I3×3 − S(f (i)
k )
−1
, (6.53)
to transform the matrix equation ( 6.52) to the following equivalent vector equation
GCay (f (i)
k ) = g(i)
k + g(i)
k × f (i)
k + ((g(i)
k )T f (i)
k )f (i)
k − 2Jf (i)
k = 0. (6.54)
This vector equation is solved using the Newton method to obtain f (i)
k which yields F (i)
k .
This F (i)
k along with v(i)
k is substituted in the discrete kinematic relations ( 6.46) and ( 6.47)
to obtain (x(i)
k+1, R(i)
k+1). Finally, we solve the discrete energy equation ( 6.48) for h(i)
k using
h(i)
k =
vuut tr[(I3×3 − F (i)
k )Jd]
Ek −
v(i)
k
T M v(i)
k
2 −
Uk+U (i)
(k+1)
2
. (6.55)
6.3 Numerical Results
This section presents numerical simulation results for a conservative underwater vehicle. We
assume that dissipative forces are negligible and the mass is uniformly distributed. Under
these assumptions, the underwater vehicle can be modeled as a rigid body immersed in an
infinite volume of ideal fluid. In this numerical study, we use the mass and inertia parameters
first studied in [ 178]. Since the center of buoyancy and center of gravity are coincident for a
uniform rigid body, the kinetic energy is given by
T = 1
2 vT M v + 1
2 ωT Jω. (6.56)


## Page 149

130 Chapter 6. Energy-preserving Lie Group Variational Integrators on SE(3)
The mass is m = 123.8 kg whereas the mass and inertia matrices are
M = m I + diag[65, 70, 75] kg, J = diag[5.46, 5.29, 5.72] kgm2, (6.57)
where the added masses are included in the mass matrix. The potential energy due to the
gravity, acting in the vertical or e3 direction (same as the positive b3 body axis), is given by
U = −(m − ρV)gx3, (6.58)
where m is the mass of the vehicle, ρ is the density of water, g is the gravitational acceleration,
V is the volume occupied by the vehicle. The weight of displaced water is ρVg = 1215.8 N.
We have considered the following three initial conditions
1. R0 = exp(S([1, 2, 3]T ))
x0 = (0, 0, 10)T m
ω0 = (1.5, 1.0, 0.5)T s−1
v0 = RT
0 (0.1, −0.2, 0.1)T ms−1,
2. R0 = exp(S([1, 2, 3]T ))
x0 = (0, 0, 10)T m
ω0 = (1.5, 1.0, 0.5)T s−1
v0 = RT
0 (0.1, 0.15, 0.1)T ms−1,
3. R0 = exp(S([3, 2, 3]T ))
x0 = (0, 0, 10)T m
ω0 = (1.0, 1.5, 0.5)T s−1
v0 = RT
0 (0.1, 0.15, 0.1)T ms−1.


## Page 150

6.3. Numerical Results 131
0 2 4 6 8 10 12 14 16 18 20
Time
0.998
0.999
1
1.001
1.002
1.003
1.004
1.005
1.006
Adaptive time step ratio h k/h0
First case
Second case
Third case
Figure 6.1: Adaptive time step behavior for all cases
0 5 10 15 20
Time
10-15
10-10
10-5
100
Energy error
(a) First case
0 5 10 15 20
Time
10-15
10-10
10-5
100
Energy error (b) Second case
0 5 10 15 20
Time
10-15
10-10
10-5
100
Energy error (c) Third case
Figure 6.2: Energy behavior comparison (Adaptive algorithm: red, solid. Fixed algorithm:
blue, dotted)
For all the cases, results from the adaptive algorithm for an initial time step of h0 = 0 .01
are compared with results from the fixed algorithm for a fixed step size of h = 0.01. Energy
error comparison between fixed and adaptive time step Lie group variational integrator for
the three cases are presented in Fig. 6.2. The discrete energy error plot comparison for all
cases show that the adaptive time step algorithm has energy error around 10−13 whereas
the fixed time step method has energy error around 10−3. As expected, the fixed time step
integrator does not conserve energy exactly but because of its symplecticity the energy error
remains bounded. On the other hand, adaptive time-stepping allows our method to conserve
momentum, energy and symplectic structure while staying on the configuration manifold.
In Fig. 6.1, we have plotted the ratio of the adaptive time step hk and the initial time step h0
for all three cases. The adaptive time step hk behavior for this numerical example suggests
that adaptive time step hk remains bounded and doesn’t decrease or increase substantially


## Page 151

132 Chapter 6. Energy-preserving Lie Group Variational Integrators on SE(3)
from the initial time step of h0. This implies that our approximations of vk and ωk, which
depend on hk, remain sufficiently accurate. Since time is treated as a dynamic variable
in this framework, we know the adaptive time step hk is intimately connected with the
dynamics. Unlike the one or two degree of freedom examples considered in [ 51] and [ 55], the
state space for our numerical example is 12 dimensional and this multi-dimensional nature
of the problem makes it difficult to relate increase or decrease in adaptive time step to the
dynamics.
We have also studied the mean energy error and the CPU time for the first case for three
different initial time steps. As shown in Table 6.1, for all three initial time steps, the
mean energy error for adaptive algorithm remains around 10−13 whereas for fixed time step
algorithm the mean energy error increases with increase in the step size. The CPU time for
for adaptive algorithm is 2-4 times more than the fixed time step algorithm. Though it is
clear that if energy conservation is critical, we can use the adaptive algorithm to get energy
preserving solutions for high initial step size and low computational effort.
Table 6.1: Fixed and Adaptive Algorithm Comparison for the Underwater Vehicle
Method Time step Mean|∆E| CPU time
Adaptive 10−4 8.2 ×10−13 54.8
Algorithm 10−3 1.5 ×10−13 7.05
10−2 3.1 ×10−14 3.08
Fixed 10−4 4.0 ×10−6 25.7
Algorithm 10−3 4.7 ×10−5 2.88
10−2 4.8 ×10−4 0.86


## Page 152

6.4. Conclusions 133
6.4 Conclusions
We have derived adaptive time step variational integrators for rigid body undergoing Eu-
clidean motion. By developing the extended Lagrangian mechanics framework for mechanical
systems evolving on SE(3), we derive extended equations of motion for the rigid body system
in continuous time. Using concepts from extended discrete mechanics, we discretize Hamil-
ton’s principle and derive the extended discrete equations of motion. The adaptive time step
Lie group variational integrators are derived in both Lagrangian and Hamiltonian forms.
The presented adaptive method is symplectic as well as energy and momentum-preserving
while also preserving the geometry of the configuration space.
The resulting adaptive time step Lie group variational integrator is used to numerically
study the motion of a conservative underwater vehicle in the presence of an attitude and
position dependent potential. The simulation results demonstrate that adaptive time step
algorithm exhibits superior energy performance for all three cases as compared to the fixed
time step algorithm. The numerical study for different time steps show that, for smaller
time step values adaptive algorithms are able to achieve significantly better energy behavior
compared to their fixed time step algorithms for a similar computational cost. These adaptive
time step Lie group variational integrators can be useful for applications where accurate
energy prediction is essential to the dynamics or for simulating the dynamics at a lower
computational cost using relatively large time steps without violating the geometric structure
and invariants of motion.


## Page 153

Chapter 7
Symplectic Accelerated Optimization
on SO(3)
A lot of problems in the field of machine learning, robotics or statistics can be formulated
as an optimization problem
x∗ = arg min
x∈X
f (x), (7.1)
where f : X → R is a differentiable function. In most of these optimization problems, the
unknown parameter x is assumed to lie in a vector space, i.e., X ⊆ Rd. However, a lot
of interesting problems in robotics or computer vision involve optimizing a scalar function
defined on set of rigid rotations. For example, robotic mapping problems [ 179] often require
finding the optimal rotation matrices on the special orthogonal group SO(3) for solving the
non-convex optimization problem in simultaneous localization and mapping.
For optimization on Rn, one of the most popular algorithms is the gradient descent technique.
This algorithm is easy to implement and it scales well to large problem sizes. However, the
convergence rate can be low. The gradient descent method achieves O( 1
n ) convergence for
general convex functions, where n is the number of iterations. Polyak [ 180] achieved faster
convergence by introducing momentum terms at each iteration. Later, Nesterov [ 181] used
successive gradients to achieve O( 1
n2 ) convergence for general convex functions. Both of these
accelerated gradient methods have gained popularity because of their ability to attain best
134


## Page 154

135
worst-case complexity bounds. For optimization on non-Euclidean manifolds, the traditional
optimization methods often employ projection or Lagrange multipliers after each iteration
to ensure that the trajectories lie on the correct manifold.
Taylor and Kriegman [ 182] used local parametrizations instead of single global parametriza-
tions for minimization on SO(3). Plumbley [ 183] incorporated ideas from Lie group methods
to develop optimization algorithms for problems with orthogonality constraints. Abrudan et
al [184] utilized Riemannian geometry to develop optimization algorithms on the Lie group
of unitary matrices. Recently, Zhang and Sra [ 185] developed accelerated gradient methods
on Riemannian manifolds.
Recently, a promising research direction has emerged by relating continuous dynamical sys-
tems and their governing differential equations to optimization algorithms. Using well-
established results from the theory of ordinary differential equations (ODE), this approach
provides a clear interpretation of optimization algorithms and their continuous approxi-
mations. Su et al [186] developed a framework for continuous approximation analysis of
optimization algorithms and derived a second-order ODE corresponding to Nesterov’s accel-
erated gradient method under the limit of infinitesimal time step. Building on this work,
Wibisono et al [187] studied a more general class of ODE and corresponding accelerated
gradient methods by the Bregman Lagrangian framework. Yang et el. [ 188] developed a
unified framework to understand these optimization algorithms and provided a link to the
physical systems behind these methods. Instead of starting with an optimization algorithm
to derive an ODE via vanishing step size arguments, Muehlebach and Jordan [ 189] provided
a different perspective by deriving Nesterov’s accelerated gradient method by discretizing a
second-order ODE with curvature dependent damping. Recently, Franca et al [190] devel-
oped conformal symplectic optimization algorithms which preserve the underlying symplectic
geometry.


## Page 155

136 Chapter 7. Symplectic Accelerated Optimization on SO(3)
In this chapter, we present an accelerated gradient method for optimization on the special
orthogonal group SO(3). First, we show that the classical momentum method on the Eu-
clidean space can be constructed by utilizing the variational integrator [ 44] to the continuous
approximation analysis of [ 186]. Next, in parallel to these results, it is shown that the gradi-
ent descent flow on SO(3) is also represented by the attitude dynamics of a rigid body. We
discretize it with a Lie group variational integrator [ 100, 191], which preserves the symplec-
ticity of Hamiltonian mechanics and Lie group structures of the configuration manifold, to
construct a symplectic accelerated gradient method for optimization on SO(3). Finally, we
apply the proposed accelerated gradient methods for two optimization problems on SO(3) to
illustrate the acceleration achieved by our methods compared to the conventional gradient
descent.
7.1 Optimization on Rn
We first formulate the optimization problem on Rn and review the existing gradient-based
optimization methods. We then use ideas from unified continuous approximation analysis to
connect the optimization algorithms to continuous physical systems. Finally, we show how
discrete mechanics and variational integrators framework can be used to derive the classical
momentum method from a nonlinear generalization of a damped harmonic oscillator.
7.1.1 Gradient-Based Optimization Techniques
Consider the following minimization problem
q∗ = arg min
q∈Rn
f (q), (7.2)


## Page 156

7.1. Optimization on Rn 137
for a real valued scalar function f : Rn → R.
We present a brief review of existing gradient-based optimization techniques for the mini-
mization problem on Rn formulated above.
1. Gradient descent method : a gradient descent method is a first order optimization
algorithm used for searching the minimum of a objective function. For objective func-
tion f : Rn → R, this algorithm searches for the local minimum by taking steps along
the negative of the gradient direction. The gradient descent method is given by
qk+1 = qk − ϵ∇f (qk), (7.3)
for ϵ > 0.
2. Classical momentum method : a gradient descent with additional momentum
terms, also known as classical momentum method, is given by
pk+1 = µpk − ϵ∇f (qk), (7.4)
qk+1 = qk + pk+1, (7.5)
where µ ∈ (0, 1) is the momentum factor, ϵ > 0 is the stepsize or the learning rate.
This reduces to the above gradient descent when µ = 0.
3. Nesterov’s accelerated gradient : the Nesterov’s accelerated gradient method is
constructed by evaluating the gradient of the above momentum method at a predicted


## Page 157

138 Chapter 7. Symplectic Accelerated Optimization on SO(3)
point as follows.
pk+1 = µpk − ϵ∇f (qk + µpk), (7.6)
qk+1 = qk + pk+1. (7.7)
7.1.2 Dynamic System Interpretation
We now use the continuous approximation analysis approach [ 186], to derive a continuous
dynamical system corresponding to the classical momentum method. First we eliminate the
momentum variables by substituting pk+1 from ( 7.5) into ( 7.4) to obtain
(qk+1 − qk) − µ(qk − qk−1) + ϵ∇f (qk) = 0 . (7.8)
Let t = kh for a stepsize h. Using the following Taylor series expansions
qk+1 − qk = h ˙q(t) + h2
2 ¨q(t) + o(h3),
qk − qk−1 = h ˙q(t) − h2
2 ¨q(t) + o(h3),
equation ( 7.8) is converted into the following continuous differential equation:
(1 + µ)h2
2ϵ ¨q(t) + (1 − µ)h
ϵ ˙q(t) + ∇f (q(t)) + O(h) = 0 . (7.9)
If we consider the limit of h → 0, then the above equation can be seen as the equation of
motion for a spring-mass-damper system,
m¨q(t) + c ˙q(t) + ∇f (q(t)) = 0 , (7.10)


## Page 158

7.1. Optimization on Rn 139
with the mass parameter m = (1+µ)h2
2ϵ and the damping parameter c = (1−µ)h
ϵ . Both of these
parameters are finite for h, ϵ → 0.
Gradient descent method The above reduces to the gradient descent method by taking
µ = 0 and h = o(ϵ), which lead to m = 0 and c = c0. Thus, the continuous dynamical
system corresponding to the gradient descent method is the following first order ODE,
˙q(t) + 1
c ∇f (q(t)) = 0 . (7.11)
Nesterov’s accelerated gradient method For Nesterov’s method, take µ = o(√ϵ) and
h = o(ϵ) to yield m = m0 and c = c0
t . Thus, the continuous dynamical system corresponding
to the Nesterov’s method is
¨q(t) + c0
m0
˙q(t)
t + 1
m0
∇f (q(t)) = 0 , (7.12)
which shows that the damping coefficient is reduced over time.
7.1.3 Momentum Method as a Variational Integrator
Now we show that the classical momentum method can be constructed as a variational inte-
grator. Motivated by ( 7.10), we consider a Lagrangian system with the following Lagrangian
and the forcing term:
L(q, ˙q) = ˙q2
2 − ηf (q), (7.13)
fL(q, ˙q) = −γ ˙q (7.14)


## Page 159

140 Chapter 7. Symplectic Accelerated Optimization on SO(3)
for η, γ > 0.
We derive a variational integrators for the Lagrangian system described above. Use the
rectangle rule for the discrete Lagrangian to obtain
Ld(qk, qk+1) = h
"
1
2
 qk+1 − qk
h
2
− ηf (qk)
#
, (7.15)
along with the following discrete forces
f +
d (qk, qk+1) = 0 , f −
d (qk, qk+1) = −γ(qk+1 − qk). (7.16)
Substituting these into forced discrete Euler-Lagrange equations
pk = qk+1 − qk
h + hη∇f (qk) + γ(qk+1 − qk),
pk+1 = qk+1 − qk
h .
Rearranging these,
pk+1 = 1
1 + γh pk − η
1 + γh ∇f (qk), (7.17)
qk+1 = qk + hpk+1. (7.18)
Setting h = 1 , the above variational integrator is equivalent to the classical momentum
method, ( 7.4)–(7.5), with the momentum factor µ = 1
1+γ ∈ (0, 1) and the step size ϵ =
η
1+γ > 0.


## Page 160

7.2. Optimization on SO(3) 141
7.2 Optimization on SO(3)
In this section, we present a gradient-based optimization method on SO(3). Similar to
the previous section, we first formulate the optimization problem on SO(3) and review a
gradient descent method on SO(3). We use the continuous approximation analysis to derive
the continuous ODE on SO(3) corresponding to this gradient descent. This is discretized by
a Lie group variational integrator to construct a symplectic accelerated optimization scheme
on SO(3).
7.2.1 Mathematical Preliminaries
The special orthogonal group is defined by
SO(3) = {R ∈ R3×3|RT R = I3×3, det(R) = +1 }.
The Lie algebra of SO(3), denoted by so(3), is the set of all 3 × 3 skew-symmetric matrices,
i.e.,
so(3) = {ξ ∈ R3×3|ξT = −ξ}.
The hat map ∧ : R3 → R3 is defined such that ˆxy = x × y for any x, y ∈ R3. The inverse of
the hat map is denoted by the vee map ∨ : so(3) → R3.
The tangent space of SO(3) at R ∈ SO(3) is given by TRSO(3) = {V ∈ R3×3|RT V + V T R =
0}. It is isomorphic to R3 via left trivialization by setting Vi = Rˆvi for i ∈ { 1, 2} and
⟨V1, V2⟩ = vT
1 v2 for any V1, V2 ∈ TRSO(3). Also, SO(3) is locally diffeomorphic to R3 from


## Page 161

142 Chapter 7. Symplectic Accelerated Optimization on SO(3)
the exponential map:
exp ˆη = I3×3 + sin ∥η∥ˆa + (1 − cos ∥η∥)ˆa2,
for the unit vector defined as a = η
∥η∥ ∈ R3.
7.2.2 Gradient-Based Optimization on SO(3)
For a scalar function defined on the special orthogonal group SO(3), i.e. f : SO(3) → R, the
optimization problem is formulated as
R∗ = arg min
R∈SO(3)
f (R). (7.19)
The gradient descent method on SO(3) is constructed as follows. Using the left trivialization,
the infinitesimal variation of f at R along δR = Rˆη for η ∈ R3 is given by
δf (R) = d
dϵ

ϵ=0
f (R exp(ϵˆη)). (7.20)
Let ∂f
∂R ∈ R3×3 be defined such that
 ∂f (R)
∂R

ij
= ∂f (R)
∂[R]ij
,
for i, j ∈ { 1, . . .3}, where [·]ij denotes the i, j-th element of a matrix. Since exp (ϵˆη) =
I3×3 + ϵˆη + O(ϵ2), ( 7.20) can be rewritten as
δf (R) = tr
"
∂f (R)
∂R
T
Rˆη
#
.


## Page 162

7.2. Optimization on SO(3) 143
Using the identity, tr [Aˆx] = xT (AT − A)∨ for any x ∈ R3 and A ∈ R3×3, it is rewritten as
δf (R) = ηT ∇Lf (R), (7.21)
where ∇Lf (R) ∈ R3 is defined as
∇Lf (R) =

RT ∂f (R)
∂R − ∂f (R)
∂R
T
R
!∨
, (7.22)
which is defined as the left trivialized gradient of f (R).
Consequently, the gradient descent algorithm on SO(3) is given by
Rk+1 = Rk exp(−α∇Lf (R)), (7.23)
for α > 0, which is comparable to ( 7.3).
Analogous to ( 7.4)–(7.5), an accelerated, momentum method on SO(3) can be written as
Rk+1 = Rk exp( ˆΩk+1), (7.24)
Ωk+1 = µΩk − ϵ∇Lf (Rk). (7.25)
Similar to the classical momentum method ( 7.4)-(7.5), this accelerated gradient method on
SO(3) also uses momentum terms to update the rotation matrix Rk with acceleration. The
key difference between these methods is how the variable is updated. In contrast to the
optimization on Rn, here the rotation matrix is updated by the group operation, i.e., the
matrix multiplication with the exponential map, to ensure that the updated matrix, namely
Rk+1 also lie on SO(3).


## Page 163

144 Chapter 7. Symplectic Accelerated Optimization on SO(3)
7.2.3 Dynamic System Interpretation
We apply continuous approximation analysis to derive the continuous ODE corresponding
to the above accelerated gradient method. Using Taylor series expansions for Rk+1, Ωk+1 and
exp( ˆΩk+1) in ( 7.24)-(7.25) along with t = kh,
Rk + h ˙R(t) + o(h2) = Rk(I + h ˆΩk) + o(h2),
Ωk + h ˙Ω(t) + o(h2) = µΩk − ϵ∇Lf (Rk).
Substituting these back to ( 7.24)–(7.25),
˙R = R ˆΩ, (7.26)
˙Ω =
 µ − 1
h

Ω −
 ϵ
h

∇Lf (R). (7.27)
The first equation is the same as the kinematic equation for rigid body dynamics. The next
equation describes how the angular momentum changes over time.
Gradient descent Next, by setting µ = 0, ( 7.27) reduces to
h ˙Ω = −Ω − ϵ∇f (R). (7.28)
Further, h → 0 gives Ω = −ϵ∇Lf (R). Substituting, we obtain
˙R = R(−ϵ∇Lf (R))∧, (7.29)
which is the continuous ODE corresponding to the gradient descent method on SO(3).
Similar with the spring-mass-damper case discussed in Section 7.1.2, we study the connection


## Page 164

7.2. Optimization on SO(3) 145
between the continuous system of ( 7.27) and the attitude dynamics of a rigid body. We
consider the Lagrangian formulation for the attitude dynamics of a rigid body under the
influence of a potential energy f (R) and a linear dissipation. The Lagrangian and the
external moment from dissipation for such a system are chosen as
L(R, Ω) = 1
2 ΩT JΩ − ηf (R), (7.30)
τ (R, Ω) = −γΩ, (7.31)
for a symmetric, positive-definite inertia matrix J ∈ R3×3 and η > 0. From the Lagrange-
d’Alembert principle, the corresponding Euler-Lagrange equation is given by
J ˙Ω + Ω × JΩ = −η∇Lf (R) − γΩ, (7.32)
which along with the rotational kinematic equations ˙R = R ˆΩ.
If J = hI3×3, the cross term vanishes, i.e., Ω × JΩ = 0 . Therefore, the above equation
reduces to ( 7.27), with η = ϵ and γ = 1 − µ. Thus, the continuous system corresponding to
the accelerated gradient method ( 7.24)–(7.25) is a Lagrangian system with linear dissipation
and it can be interpreted as the attitude dynamics of a rigid body evolving on SO(3).
7.2.4 Symplectic Accelerated Optimization on SO(3)
In this subsection we discretize the continuous Lagrangian system ( 7.30) using Lie group
variational integrators to derive a symplectic, accelerated gradient methods on SO(3).
In geometric numerical integration, Lie group methods [ 95] are a class of structure-preserving
numerical methods that conserve the Lie group structures. This is achieved by utilizing the
group operation to update group elements. These Lie group methods were first adopted in


## Page 165

146 Chapter 7. Symplectic Accelerated Optimization on SO(3)
the variational integrators framework in [ 192] to integrate the structure-preserving aspects
of Lie-group methods and variational integrators. This is applied to the rigid body dynamics
in [191]. They exhibit the desirable symplectic, momentum-preserving features of variational
integrators, while preserving the group structures. The basics of variational integrators and
Lie group methods can be reviewed in [ 193].
Similar with [ 191], let the discrete Lagrangian corresponding to ( 7.30) be
Ld(Rk, Fk) = 1
h tr[(I3×3 − Fk)Jd] − hηf (Rk+1),
with the discrete toques
τ +
d = 0, τ −
d = hτ (Rk, Ωk),
Here, Fk ∈ SO(3) is defined as the relative attitude change between two steps, i.e., Fk =
RT
k Rk+1.
The corresponding discrete Euler-Lagrange equations are given by
h(JΩk + hτk)∧ = FkJd − JdF T
k , (7.33)
Rk+1 = RkFk, (7.34)
JΩk+1 = F T
k (JΩk + hτk) − hη∇Lf (Rk+1). (7.35)
where Jd = 1
2 tr[J]I3×3 − J ∈ R3×3.
Given (Rk, Ωk), the implicit equation ( 7.33) is solved for Fk, and then the updated position
Rk+1 and the angular velocity Ωk+1 are obtained from the explicit equations ( 7.34) and
(7.35), respectively. Thees yield a discrete flow (Rk, Ωk) → (Rk+1, Ωk+1) for accelerated
optimization. At ( 7.34), Rk+1 is constructed by the product of two rotation matrices. As
such, Rk+1 is guaranteed to be on SO(3) up to round-off errors.


## Page 166

7.3. Numerical Examples 147
The implicit equation ( 7.33) can be solved by a numerical iteration on R3. However, as
discussed above, we can set the inertia matrix as a diagonal matrix J = jI3×3 for any j ∈ R.
Then, ( 7.33) reduces to
h(jΩk + hτk)∧ = j
2 (Fk − F T
k ),
which yields an explicit solution of
Fk = exp( sin−1 ∥hgk∥
∥gk∥ gk), (7.36)
with gk = Ω k + h
j τk = (1 − γh
j )Ωk.
Also, ( 7.35) is rewritten as
Ωk+1 = (1 − γh
j )F T
k Ωk − hη
j ∇Lf (Rk+1). (7.37)
In short, the proposed symplectic accelerated gradient descent scheme on SO(3) is composed
of ( 7.34), ( 7.36), and ( 7.37). As constructed as a Lie group variational integrator, this
preserves the symplectic structure underlying the Lagrangian system evolving on SO(3), and
it ensures that the optimized rotation matrix remains on SO(3).
7.3 Numerical Examples
In this section, we consider two numerical examples to evaluate the numerical performance
of the proposed accelerated gradient methods. We have compared gradient descent (GD)
(7.23), accelerated gradient descent (AGD) ( 7.24)-(7.25) and symplectic accelerated gradient
descent (SAGD) ( 7.34)-(7.37).


## Page 167

148 Chapter 7. Symplectic Accelerated Optimization on SO(3)
7.3.1 Trace Function
In this subsection, we study the numerical performance of our proposed accelerated gradient
methods for minimization of f (R) = −tr[X T R] for a given matrix X ∈ R3×3. This appears
in the attitude determination from vector measurements, and it has the following analytic
solution. The optimal rotation matrix is given by R∗ = U V T where U, V ∈ SO(3) are
obtained from the proper singular value decomposition of X given by X = U SV T with a
diagonal matrix S ∈ R3×3 [194].
We choose
X =
2
66664
45 1 0
0 20 0
0 0 2
3
77775
. (7.38)
The corresponding optimization results are illustrated at Figure 7.1, which shows that the
proposed SAGD algorithm achieves faster convergence than both AGD and GD algorithms
on SO(3). The step size α for GD has been tuned to find the optimal α = 0 .024. Based
on that α, we set h = ϵ =
√
0.024 along with µ = 0 .05 for AGD algorithm which leads to
faster convergence compared to GD. Finally, using j = h =
√
0.125, ϵ = 2 h and γ = 0 .9090
we achieve faster convergence than both AGD and GD algorithms.
We have studied the numerical performance of this choice of accelerated optimization pa-
rameters for a variety of X and SAGD performs better than AGD and GD for all those
cases. Depending on the particular case, these parameters can be tuned slightly to improve
the convergence even further but that may introduce oscillations.


## Page 168

7.3. Numerical Examples 149
100 101 102
Iterations
10-15
10-10
10-5
100
105
 |f -f*|
 GD: =0.024
 AGD: h= =0.1549 and =0.05
 SAGD: h=0.3536, =0.7071 and =2.5710
Figure 7.1: Convergence comparison between gradient descent (GD), accelerated gradient
descent (AGD) and symplectic accelerated gradient descent (SAGD) on SO(3) for minimiza-
tion of f (R) = −tr[X T R]
100 101 102
Iterations
10-3
10-2
10-1
100
101
102
| f - f* |
Accelerated Gradient Descent
Gradient Descent
Figure 7.2: Convergence comparison between AGD and GD on SO(3) for spherical shape
matching problem


## Page 169

150 Chapter 7. Symplectic Accelerated Optimization on SO(3)
7.3.2 Spherical Shape Matching
In this subsection, we apply GD and AGD for spherical shape correlation and matching
considered in [ 195]. We consider an object (without holes) embedded in R3 whose shape can
be described by deforming the sphere. Specifically, let f (x) : S2 → R represent the shape,
as the elevation for each direction x on the unit-sphere S2 = {x ∈ R3 | ∥x∥ = 1 }. Also, let
g(x) : S2 → R denote the shape function when the object is rotated.
The spherical shape matching problem involves finding the rotation matrix R ∈ SO(3) that
minimizes the discrepancy between g(x) and f (x) rotated by R, i.e.
J (R) = 1
2 ∥g(x) − f (RT x)∥2
S2,
where ∥ · ∥S2 denote the norm for the functions defined on S2. By expanding the norm,
J (R) = 1
2 ∥g(x)∥2
S2 + 1
2 ∥f (x)∥2
S2 −

g(x), f(RT x)

S2 ,
The objective is to find the true rotation matrix R that minimizes the cost function J (R),
or equivalently, maximizes the measure of correlation function C(R) =

g(x), f(RT x)

S2.
A computational approach to evaluate the correlation function has been proposed in [ 195]
using harmonic analysis on SO(3), with a numerical example for an Earth elevation map.
Here, we adopt the same numerical example for spherical shape matching of the Earth
elevation map. But, we implement the presented AGD. For the numerical comparison, we
have used α = 0.0002 for GD and µ = 0.15 along with h =
p
(αoptimal) and ϵ = 1.2
p
(αoptimal)
for AGD algorithm. The comparison between the gradient descent and accelerated gradient
method in Figure 7.2 demonstrates how the AGD converges in fewer iterations. In Figure
7.2, we have shown how the correlation function and its gradient evolve over the iterations.


## Page 170

7.4. Conclusions 151
Both plots show how for the first few iterations both methods give similar updates but as
the number of iterations increases, effects of the additional momentum term become visible
which results in faster convergence.
0 20 40 60 80 100 120 140
Iterations
70
80
90
100
110
120
130
140
150C(R)
Accelerated Gradient Descent
Gradient Descent
(a) Function value
0 20 40 60 80 100 120 140
Iteration
10-5
100
 || C(R) || Accelerated Gradient Descent
Gradient Descent (b) Gradient
Figure 7.3: Comparison of function and gradient value plots over iterations
7.4 Conclusions
We have presented accelerated gradient methods for optimization on SO(3). Similar to the
classical momentum method on Rn, we include additional momentum term in the standard
gradient descent on SO(3) to achieve faster convergence. Using continuous approximation
analysis tools, first we derived the continuous system corresponding to classical momentum
on Rn and then discretized the continuous system using variational integrators to show
that classical momentum method on Rn is a structure-preserving method. We also derived
the continuous systems corresponding to both gradient descent and proposed accelerated
gradient method on SO(3) and demonstrated that the continuous system is a Lagrangian
rigid body system evolving on SO(3) under the influence of potential forcing and dissipation.
We discretized the continuous time system on SO(3) using the Lie group variational integrator
framework and presented the symplectic accelerated gradient method.


## Page 171

152 Chapter 7. Symplectic Accelerated Optimization on SO(3)
The proposed algorithms are used to numerically study two optimization problems on SO(3).
First, we have applied these methods to solve the benchmark problem of a trace function
to demonstrate that the symplectic accelerated gradient method converges faster than both
accelerated gradient descent and gradient descent on SO(3). We have also applied accelerated
gradient descent to the spherical shape matching of earth elevation map and the numerical
results show that the accelerated gradient method outperforms the gradient descent method.
For future works, we plan to study how the different choice of the discrete Lagrangian yield
a different form of optimization schemes.


## Page 172

Chapter 8
Performance Assessment of
Energy-preserving, Adaptive Time
Step Variational Integrators
The main goal of this chapter is to understand the numerical performance of energy-preserving,
adaptive time step variational integrators. First, we focus on the discrete energy error be-
havior from a computational perspective. We obtain a conservative bound on the discrete
energy error based on the error propagation from the residual of the discrete energy equation
and compare the energy performance of the adaptive algorithm with fixed time-step varia-
tional integrators. We then use variable precision arithmetic in the adaptive algorithm to
show how the energy performance can be further improved by using more significant digits
in the computation. Motivated by this improvement in energy performance, we approach
the problem from a theoretical perspective by investigating the stability of the adaptive al-
gorithm. We first use time-transformation to represent the adaptive algorithm as the fixed
time-step algorithm and then apply backward error analysis tools in the transformed setting.
The early development of backward error analysis in 1960s was motivated by numerical lin-
ear algebra applications and it was mainly used as a tool for evaluating the propagation
of rounding errors in matrix algorithms. Although Wilkinson [ 196] first used it in the con-
text of eigenvalue problems, the underlying idea of backward error analysis has been also
153


## Page 173

154
Chapter 8. Performance Assessment of Energy-preserving, Adaptive Time Step Variational
Integrators
applied to numerical integrators for dynamical systems. Truncation errors introduced by
the numerical integrator play the same role as rounding errors do in the numerical linear
algebra setting. The focus in the backward error analysis of a numerical integrator is the
question: what dynamical system does the numerical integrator solve? Thus, instead of
studying the difference between the trajectories obtained using the numerical integrator and
the exact solution, we look for a nearby dynamical system which would be solved exactly
by the numerical integrator. For dynamical systems with underlying geometric structure,
we would like the modified system to also possess similar features. The existence of such a
nearby dynamical system has direct implications for the accurate long-time behavior of the
long-time simulation.
Sanz-Serna [ 197] first applied tools from backward error analysis to symplectic integrators
and showed that numerical trajectories from symplectic integrators can be interpreted as
the exact solution of a perturbed Hamiltonian system. Reich [ 37] used a recursive definition
of modified vector fields to provide a unifying framework for the backward error analysis of
GNI methods. Hairer [ 198] developed variable time-step symplectic integrators and proved
backward stability of the adaptive algorithm by using time transformations. Recently, Ver-
meeran [ 199] studied the backward stability of variational integrators from the Lagrangian
perspective.
This chapter is organized as follows. In Section 8.1, we study the energy behavior of the
adaptive algorithm and the effect of variable precision arithmetic on the conservation prop-
erties. In Section 8.2, we present a time transformation to interpret the adaptive algorithm
as a fixed time-step variational integrator in the transformed setting. Finally, in Section
8.3, we provide concluding remarks and discuss remaining challenges in the backward error
analysis of adaptive algorithms.


## Page 174

8.1. Energy Behavior 155
8.1 Energy Behavior
As shown in Section 3.1.2, the extended discrete equations for the adaptive time step vari-
ational integrators conserve the discrete energy Ek exactly. Unfortunately, numerically the
discrete energy equation is not solved exactly and the residual from this equation builds up
as the iterations increase. Such a build up of discrete energy error might lead to a sub-
stantial enough energy error and that can defeat the purpose of the adaptive time-stepping
algorithm. Thus, we need to investigate the long-term behavior of energy error.
For a given initial configuration (t0, q0, p0, E0), the discrete energy Ek after k adaptive time
steps can be written as
Ek = E0 +
kX
i=1
(Ei − Ei−1) (8.1)
We can use this expression to obtain a conservative bound on the discrete energy error
|Ek − E0| ≤
kX
i=1
|Ek − Ek−1| ≤ k max
i
|Ei − Ei−1| (8.2)
where max i |Ei − Ei−1| is the maximum discrete energy error introduced in one iteration
during the whole numerical simulation. Using this conservative bound, we can compare the
energy behavior of fixed time-step variational integrators with the worst case scenario for
the adaptive algorithm. For example, if we consider an example where the fixed time-step
algorithm exhibits discrete energy error around 10−6 then the adaptive algorithm, with 10−18
accuracy in solving discrete energy equation, will exhibit better energy performance for 1012
steps
k = 10−6
maxi |Ei − Ei−1| = 10−6
10−18 = 10 12 steps (8.3)
It is important to note that the discrete energy error bound in ( 8.2) is very conservative
because it assumes the worst case scenario where at each time-step the energy error is of the


## Page 175

156
Chapter 8. Performance Assessment of Energy-preserving, Adaptive Time Step Variational
Integrators
same sign and maximum magnitude. The numerical results for a particle in a double-well
potential example shows how using Variable Precision Arithmetic (VPA) with 32 significant
digits results in exactly zero discrete energy error. The adaptive time step behavior also
matches with previous results. Based on these results, we have shown how increasing the
precision can lead to nearly exact energy behavior. It is important to note that using VPA
makes the adaptive algorithm computationally prohibitive. The key takeaway from these
results obtained using VPA is that, if solved with enough precision, the adaptive algorithm
can conserve the discrete energy. This also points to the importance of studying the numerical
stability of the adaptive algorithm.
0 0.5 1 1.5 2 2.5
Time
-1
-0.5
0
0.5
1
Discrete Energy Error
(a) q(0) = 0 .74, ˙q(0) = 0
0 1 2 3 4 5 6 7
Time
-1
-0.5
0
0.5
1
Discrete Energy Error (b) q(0) = 0 .995, ˙q(0) = 0
Figure 8.1: Discrete energy error results using VPA
8.2 Time Transformation
In this section, we introduce a time-transformation from the physical time t to a fictitious
time a and represent the energy-preserving, adaptive time step variational integrator as
a fixed time-step variational integrator in the transformed setting. Using ideas from the
extended Lagrangian mechanics, we interpret the parameterization of t = t(a) in terms of
the independent variable a as a time transformation. For such a time transformation, i.e.
t → a, the configuration in the transformed setting is given by ¯q(a) = ( q(a), t(a)). For this


## Page 176

8.2. Time Transformation 157
0 5 10 15 20 25
Time Step k
0.1
0.101
0.102
0.103
0.104
0.105
0.106
0.107
Adaptive Time Step hk
 Without VPA
 VPA
(a) q(0) = 0 .74, ˙q(0) = 0
0 5 10 15 20 25 30 35 40
Time Step k
0.1
0.15
0.2
0.25
0.3
0.35
0.4
0.45
Adaptive Time Step hk
Without VPA
VPA (b) q(0) = 0 .995, ˙q(0) = 0
Figure 8.2: adaptive time step behavior using VPA
transformation, we introduce
¯L((¯q(a), ¯q′(a))) = t′(a)L(q(t), ˙q(t)) = t′(a)L

q(a), q′(a)
t′(a)

(8.4)
where we have used ˙q(t) = q′(a)
t′(a) . The Euler-Lagrange equations in the transformed setting
are
∂ ¯L
∂q − d
da
 ∂ ¯L
∂q ′

= t′(a) ∂L
∂q − d
da

t′(a) ∂L
∂ ˙q
1
t′(a)

= t′(a)
 ∂L
∂ ˙q − d
dt
 ∂L
∂ ˙q

= 0 (8.5)
∂ ¯L
∂t − d
da
 ∂ ¯L
∂t′

= − d
da

L

q(a), q′(a)
t′(a)

+ t′(a) ∂L
∂ ˙q (− ˙q
t′(a) )

= t′(a) d
dt
 ∂L
∂ ˙q · ˙q − L

= 0
(8.6)
Thus, the Euler-Lagrange equations in the transformed setting lead to the original Euler-
Lagrange equation along with the redundant energy equation. Although, these equations are
the same as the extended Euler-Lagrange equations, it is important to understand the above
equations as Euler-Lagrange equations in the transformed setting. This interpretation will
play a key role in the following Lemma about the equivalence of trajectories of the original


## Page 177

158
Chapter 8. Performance Assessment of Energy-preserving, Adaptive Time Step Variational
Integrators
Lagrangian system and the transformed system.
Lemma 1: Let (q(t), ˙q(t)) and (¯q(a), ˙¯q(a)) be the solutions to the Euler-Lagrange equations
corresponding to the physical Lagrangian L and the extended Lagrangian ¯L respectively.
Then,
¯q(T ) = q(α(T ))
where α(T ) =
R T
0 t′(a)da.
Proof: This follows from the fact that ¯q(T ) and q(α(T )) satisfy the original Euler-Lagrange
equation with same initial conditions.
Consider a discrete trajectory on the extended space with ∆a = ak+1 − ak. The discrete
extended action ¯Sd approximates the action integral
¯Sd =
NX
i=1
¯Ld(¯qk, ¯qk+1) ≈
Z af
a0
¯L(¯q(a), ˙¯q(a))da (8.7)
where ¯qk = (qk, tk) and the extended discrete Lagrangian is given by
¯Ld = ∆a

¯L
 ¯qk + ¯qk+1
2 , ¯qk+1 − ¯qk
∆a

≈
Z ak+1
ak
¯L(¯q(a), ¯q′(a)) da (8.8)
The resulting discrete Euler-Lagrange equations are given by
∂ ¯Ld(¯qk−1, ¯qk)
∂qk
+ ∂ ¯Ld(¯qk, ¯qk+1)
∂qk
= 0 (8.9)
∂ ¯Ld(¯qk−1, ¯qk)
∂tk
+ ∂ ¯Ld(¯qk, ¯qk+1)
∂tk
= 0 (8.10)
These variational integrators with a fixed time-step ∆a in the transformed setting are equiv-
alent to the energy-preserving, adaptive time step variational integrators. This equivalence


## Page 178

8.3. Conclusions 159
will allow us to apply established results from backward error analysis of fixed time-step
variational integrators.
8.3 Conclusions
We have presented a performance assessment of energy-preserving, adaptive time step varia-
tional integrators in this chapter. From the extended discrete Euler-Lagrange equations, we
obtained a conservative bound on the discrete energy error. We also implemented adaptive
algorithm using VPA to demonstrate exact discrete energy conservation. Motivated by these
numerical results, we proposed a time transformation approach to investigate the numeri-
cal stability of the adaptive algorithm. Using equivalence of trajectories, we derived the
energy-preserving, adaptive time step variational integrators as fixed time-step variational
integrators in the transformed setting.
The interpretation of the adaptive algorithm as a fixed time-step algorithm in a transfomed
setting will allow us to use results from backward error analysis results from Vermeeren
[199]. Apart from the adaptive nature of the algorithm, backward error analysis of energy-
preserving, adaptive time step variational integrators has two challenges. First, these algo-
rithms are derived from Lagrangian perspective and hence, the governing Euler-Lagrange
equations are second-order. The second challenge is the unique nature of the adaptive al-
gorithm where the time transformation map t(a) is not explicitly given. In future work,
we plan to build on the work presented in this chapter to tackle these two challenges and
investigate the backward stability of the adaptive algorithm.


## Page 179

Chapter 9
Conclusions
9.1 Summary
In summary, this dissertation develops a variety of structure-preserving algorithms for me-
chanical systems. The key idea is to derive energy-preserving, adaptive time step variational
integrators from discretized variational principles in the extended Lagrangian mechanics
framework. These methods are applied to a variety of Lagrangian/Hamiltonian dynamical
systems.
A review of structure-preserving methods and their engineering applications has been pre-
sented in Chapter 2. We have provided an overview of existing GNI methods and their
capabilities in an accessible way, while adding perspectives and application examples from
the literature. This survey is intended to provide a gateway into the field for practitioners.
Energy-preserving variational integrators for forced Lagrangian systems are presented in
Chapter 3. We presented the Lagrange-d’Alembert principle in the extended phase space
and derived adaptive time step, energy-preserving variational integrators for time-dependent
Lagrangian systems with non-conservative forcing. In Chapter 4, we have used Hermite poly-
nomials to derive one-step variational and Galerkin methods. In addition to their excellent
energy behavior, these one-step methods are continuous in both configuration and velocity
which makes them compliant to control analysis.
160


## Page 180

9.1. Summary 161
The energy-preserving, adaptive time step variational integrators have been extended to
rigid body systems evolving on SO(3) and SE(3) in Chapter 5 and Chapter 6, respectively.
These adaptive algorithms are symplectic as well as energy and momentum-preserving while
also preserving the geometry of the configuration space. The numerical studies from these
chapters demonstrate that, for smaller time step values adaptive algorithms are able to
achieve significantly better energy behavior compared to their fixed time step algorithms for
a similar computational cost.
In Chapter 7, discrete mechanics and Lie group variational integrators are used to develop
accelerated gradient methods on SO(3). Using continuous approximation analysis, we have
shown the connection between accelerated gradient methods and continuous dynamical sys-
tems and demonstrated that the classical momentum method on Rn is a variational inte-
grator. We also derived the continuous systems corresponding to both gradient descent and
the proposed accelerated gradient method on SO(3) and demonstrated that the continuous
system is a Lagrangian rigid body system evolving on SO(3) under the influence of potential
forcing and dissipation. We discretized the continuous time system on SO(3) using the Lie
group variational integrator framework and presented the symplectic accelerated gradient
method on SO(3).
In Chapter 8, the numerical performance of energy-preserving, adaptive time step varia-
tional integrators is studied from both numerical and theoretical point of views. Using the
residual from discrete energy equation, a conservative bound on the discrete energy error
was obtained. By considering variable precision arithmetic (VPA) in computations, almost
exact energy conservation was achieved. The numerical stability of the adaptive algorithm
was studied by representing it as a fixed time step algorithm in a transformed setting.


## Page 181

162 Chapter 9. Conclusions
9.2 Future Work
Based on the work presented in this dissertation, we have divided the future work section
in two categories. Based on our literature review in Chapter 2, we first discuss key future
thrust areas for broader use of structure-preserving methods in engineering applications. We
then talk about specific future research directions related to our original research work.
9.2.1 Key Thrust Areas for Broader Use
Based on the literature review, we find that prior research efforts in the field of geometric
numerical integration have demonstrated the advantage of structure-preserving integration
methods largely through comparison with traditional integrators (e.g., the non-structure-
preserving Runge-Kutta method) for “toy” problems. While this approach is useful to
demonstrate the advantages of structure-preservation, it does not provide a fair assessment
for practitioners.
We believe more work is needed on the applications of structure-preserving methods with
a focus on large-scale systems from specific engineering applications. Furthermore, it is of
interest to know how these methods compare with traditional methods in terms of the com-
putational cost. Recently, Johnson and Murphey [ 200] utilized the tree-based structure to
develop scalable variational integrators. Using ideas from the recursive Newton-Euler algo-
rithm and articulated body algorithm, Lee et al [201] developed a linear-time variational
integrator for multibody systems, and Fan et al [202] developed linear-time higher order
variational integrators. A key topic related to this is the issue of solvability of geometric
methods as most of these methods for nonlinear systems are implicit and require the so-
lution of a system of nonlinear equations at every iteration. The connection between time
step selection and solvability of implicit methods has not received enough attention in the


## Page 182

9.2. Future Work 163
context of structure-preserving methods. Kobilarov [ 203] studied the solvability of geomet-
ric integrators and developed bounds on the fixed time step which guarantee convergence
of the root-finding problem of the system of nonlinear equations. Future work along these
directions will play a key role in broader use of structure-preserving methods for engineering
applications.
From the reviewed literature, we also find that the majority of research published in the field
of geometric numerical integration compares the results of proposed/developed structure-
preserving methods with traditional methods that are not designed to respect the underly-
ing geometric structure. In the growing literature on structure-preserving methods, apart
from few exceptions [ 77, 204, 205], there is very little work focusing on comparison between
different classes of structure-preserving methods. For example, both variational (symplectic-
momentum) and energy-momentum integrators respect the qualitative features of mechan-
ical systems. On one hand, energy conservation guarantees, a priori, that the numerical
solution is restricted to a codimension 1 submanifold of the configuration manifold whereas
variational integrators through symplectic structure preservation, ensure a more global and
multi-dimensional behavior. From an engineering perspective, this points to a very important
question: For a given mechanical system, should one use variational (symplectic-momentum)
or energy-momentum methods to numerically simulate it? In order to answer this question,
a detailed comparison of the numerical performance of both methods for benchmark prob-
lems from various types of mechanical systems is required. We believe research work in this
direction will help practitioners understand which class of structure-preserving numerical
methods is best suited to a given mechanical system.
Finally, most of the mechanical systems in engineering applications are subject to non-
conservative external forcing. It is of interest to understand which class of methods performs
better for non-conservative systems where the external forcing drives the dynamics such


## Page 183

164 Chapter 9. Conclusions
as highly oscillatory systems found in biolocomotion or aeroelasticity applications. Also of
interest is the extent to which the long-time stability advantages of structure preservation for
conservative dynamical systems can carry over to mechanical systems with external forcing.
Most of the research so far has been done for PDEs with variational structure [ 25, 49]. Going
further the research challenge is to consider nonvariational PDEs [ 30] and develop/extend
structure-preserving algorithms for a wider class of PDEs.
9.3 Specific Future Research Directions
• Energy-preserving, adaptive time step variational integrator Despite their
excellent conservation properties, the utility of energy-preserving, adaptive time step
variational integrators for engineering applications is still an open question due to the
difficulties associated with their numerical implementation. These adaptive algorithms
require solving a coupled nonlinear implicit system of equations at every time step to
update the configuration variables and time variable. Unlike traditional adaptive al-
gorithms, the adaptive time step computation in these methods is inherently coupled
with the discrete dynamics. In fact, existence of solutions for these discrete trajec-
tories is not always guaranteed. Shibberu [ 53] has discussed the well-posedness of
these adaptive algorithms and identified points in the extended state space where the
adaptive algorithm has no solutions. Even for the points with existence of solution,
the governing update equations are ill-conditioned. Due to the ill-conditioned nature,
discrete energy error is introduced at every iteration which can lead to inaccurate nu-
merical behavior in long-time simulations. Due to these various challenges involved
with numerical simulation using energy-preserving, adaptive time step variational in-
tegrators, the numerical properties of these algorithms needs to be investigated from


## Page 184

9.3. Specific Future Research Directions 165
an analysis point of view. Backward error analysis of these algorithms will be helpful
in understanding the long-time behavior of energy error. Apart from the numerical
stability, it would also be interesting to develop variational order analysis framework
for these algorithms.
• Optimal control: Based on the discrete variational principles, the Discrete Mechanics
and Optimal Control (DMOC) framework is used for optimal control of mechanical
systems. It would be natural to utilize the energy-preserving, adaptive time step
variational integrators developed in the DMOC setting for path following problems.
Since a lot of these problems evolve on Lie groups, this would also involve extending the
energy-preserving, adaptive time step Lie group variational integrators to mechanical
systems with external control forcing. These algorithms can be derived by discretizing
the Lagrange-d’Alembert principle on Lie groups in the extended Lagrangian mechanics
setting.
• Optimization: With growing interest in machine learning and robotics applications,
there is a need to develop understanding about optimization algorithms. Apart from
the classical momentum method studied in Chapter 7, it would be interesting to study
the Nesterov’s accelerated gradient method from a dynamical systems perspective.
Better understanding of Nesterov’s accelerated gradient method from this approach
can be particularly useful for developing Nesterov-like accelerated gradient methods
on nonlinear manifolds.


## Page 185

Bibliography
[1] Asteroid 2002 AJ129 to fly safely past earth february 4. https://www.jpl.nasa.gov/
news/news.php?feature=7042. Accessed: 2018-01-21.
[2] Dennis Overbye. Yearning for new physics at cern, in a post-higgs way. The New York
Times, June 2017.
[3] Jerrold E Marsden and Tudor S Ratiu. Introduction to Mechanics and Symmetry:
A Basic Exposition of Classical Mechanical Systems , volume 17. Springer Science &
Business Media, 2013.
[4] Darryl D Holm, Tanya Schmah, and Cristina Stoica. Geometric Mechanics and Sym-
metry: From Finite to Infinite Dimensions , volume 12. Oxford University Press, 2009.
[5] Taeyoung Lee, Melvin Leok, and N Harris McClamroch. Global Formulations of La-
grangian and Hamiltonian Dynamics on Manifolds . Springer, 2017.
[6] Brian F Doolin and Clyde F Martin. Introduction to Differential Geometry for Engi-
neers. Courier Corporation, 2013.
[7] William M Boothby. An Introduction to Differentiable Manifolds and Riemannian
Geometry, volume 120. Academic press, 1986.
[8] Isaac Newton. Philosophiae Naturalis Principia Mathematica, volume 1. G. Brookman,
1833.
[9] J L Lagrange. Application de la méthode exposée dans le mémoire précédent à la
solution des problèmes de dynamique différents. Œuvres de Lagrange (1867–1892) ,
1:151–316, 1762.
166


## Page 186

BIBLIOGRAPHY 167
[10] Joseph Louis Lagrange. Mécanique Analytique, volume 1. Mallet-Bachelier, 1853.
[11] Sir William Rowan Hamilton. On a General Method in Dynamics . Richard Taylor,
1834.
[12] William Rowan Hamilton. Vii. second essay on a general method in dynamics. Philo-
sophical Transactions of the Royal Society of London , 125:95–144, 1835.
[13] Jerrold E Marsden, Sergey Pekarsky, Steve Shkoller, and Matthew West. Variational
methods, multisymplectic geometry and continuum mechanics. Journal of Geometry
and Physics , 38(3-4):253–284, 2001.
[14] H. Goldstein. Classical Mechanics. Reading, MA: Addison-Wesley, 1980. 672 pages.
[15] Emmy Noether. Invariante variations probleme, nachr. ges. wiss. Gottingen Math.-
Phys. Kl. , pages 235–257, 1918.
[16] Paul K Newton. The N-vortex Problem: Analytical Techniques , volume 145. Springer
Science & Business Media, 2013.
[17] Ralph Abraham and Jerrold E Marsden. Foundations of Mechanics , volume 36. Ben-
jamin/Cummings Publishing Company Reading, Massachusetts, 1978.
[18] Anthony M Bloch, P S Krishnaprasad, Jerrold E Marsden, and Richard M Murray.
Nonholonomic mechanical systems with symmetry. Archive for Rational Mechanics
and Analysis , 136(1):21–99, 1996.
[19] Jerrold E Marsden, Richard Montgomery, and Tudor S Ratiu. Reduction, Symmetry,
and Phases in Mechanics , volume 436. American Mathematical Soc., 1990.


## Page 187

168 BIBLIOGRAPHY
[20] Razvan C Fetecau, Jerrold E Marsden, Michael Ortiz, and Matthew West. Nonsmooth
Lagrangian mechanics and variational collision integrators. SIAM Journal on Applied
Dynamical Systems , 2(3):381–416, 2003.
[21] Joan-Andreu Lázaro-Camí and Juan-Pablo Ortega. Stochastic Hamiltonian dynamical
systems. arXiv preprint math/0702787 , 2007.
[22] Jean-Michel Bismut. Mécanique aléatoire. In Ecole d’Eté de Probabilités de Saint-Flour
X-1980, pages 1–100. Springer, 1982.
[23] Nawaf Bou-Rabee and Houman Owhadi. Stochastic variational integrators. IMA
Journal of Numerical Analysis , 29(2):421–443, 2009.
[24] MJ Gotay, J Isenberg, JE Marsden, and R Montgomery. Momentum maps and classical
fields, part i, covariant field theory (2004). arXiv preprint physics/9801019 .
[25] Jerrold E Marsden, George W Patrick, and Steve Shkoller. Multisymplectic geometry,
variational integrators, and nonlinear pdes. Communications in Mathematical Physics ,
199(2):351–395, 1998.
[26] Kang Feng and Mengzhao Qin. Symplectic Geometric Algorithms for Hamiltonian
Systems. Springer, 2010.
[27] Robert W Atherton and George M Homsy. On the existence and formulation of vari-
ational principles for nonlinear differential equations. Studies in Applied Mathematics ,
54:31–60, 1975.
[28] Nail H Ibragimov. Integrating factors, adjoint equations and Lagrangians. Journal of
Mathematical Analysis and Applications , 318(2):742–757, 2006.
[29] Nail H Ibragimov. A new conservation theorem. Journal of Mathematical Analysis
and Applications, 333(1):311–328, 2007.


## Page 188

BIBLIOGRAPHY 169
[30] Michael Kraus and Omar Maj. Variational integrators for nonvariational partial dif-
ferential equations. Physica D: Nonlinear Phenomena , 310:37–71, 2015.
[31] Rene De Vogelaere. Methods of integration which preserve the contact transformation
property of the Hamilton equations. Technical report (University of Notre Dame. Dept.
of Mathematics) , 1956.
[32] Ronald D Ruth. A canonical integration technique. IEEE Trans. Nucl. Sci., 30(CERN-
LEP-TH-83-14):2669–2671, 1983.
[33] FM Lasagni. Canonical runge-kutta methods. Zeitschrift für Angewandte Mathematik
und Physik (ZAMP) , 39(6):952–953, 1988.
[34] JM Sanz-Serna. Runge-Kutta schemes for Hamiltonian systems. BIT Numerical Math-
ematics, 28(4):877–883, 1988.
[35] Yu B Suris. On the conservation of the symplectic structure in the numerical solution
of Hamiltonian systems. Numerical Solution of Ordinary Differential Equations , pages
148–160, 1988.
[36] Sebastian Reich. Momentum conserving symplectic integrators. Physica D: Nonlinear
Phenomena, 76(4):375–383, 1994.
[37] Sebastian Reich. Backward error analysis for numerical integrators. SIAM Journal on
Numerical Analysis, 36(5):1549–1570, 1999.
[38] Zhong Ge and Jerrold E Marsden. Lie–Poisson integrators and Lie–Poisson Hamilton–
jacobi theory. Phys. Lett. A , 133:134–139, 1988.
[39] Shigeru Maeda. Lagrangian formulation of discrete systems and concept of difference
space. Math. Japonica, 27:345–356, 1982.


## Page 189

170 BIBLIOGRAPHY
[40] Shigeru Maeda. Extension of discrete noether theorem. Math. Japonica, 26(1):85–90,
1981.
[41] Alexander P Veselov. Integrable discrete-time systems and difference operators. Func-
tional Analysis and its Applications , 22(2):83–93, 1988.
[42] Alexander P Veselov. Integrable Lagrangian correspondences and the factorization of
matrix polynomials. Functional Analysis and Its Applications , 25(2):112–122, 1991.
[43] Jürgen Moser and Alexander P Veselov. Discrete versions of some classical integrable
systems and factorization of matrix polynomials. Communications in Mathematical
Physics, 139(2):217–243, 1991.
[44] Jerrold E Marsden and Matthew West. Discrete mechanics and variational integrators.
Acta Numerica, 10:357–514, 2001.
[45] Jeffrey M Wendlandt and Jerrold E Marsden. Mechanical integrators derived from
a discrete variational principle. Physica D: Nonlinear Phenomena , 106(3-4):223–246,
1997.
[46] Ernst Hairer, Christian Lubich, and Gerhard Wanner. Geometric Numerical Integra-
tion: Structure-preserving Algorithms for Ordinary Differential Equations , volume 31.
Springer Science & Business Media, 2006.
[47] A J Lew, J E Marsden, M Ortiz, and M West. Variational time integrators. Interna-
tional Journal for Numerical Methods in Engineering , 60(1):153–212, 2004.
[48] Ernst Hairer and Christian Lubich. The life-span of backward error analysis for nu-
merical integrators. Numerische Mathematik , 76(4):441–462, 1997.
[49] Benedict Leimkuhler and Sebastian Reich. Simulating Hamiltonian Dynamics , vol-
ume 14. Cambridge university press, 2004.


## Page 190

BIBLIOGRAPHY 171
[50] Couro Kane, Jerrold E Marsden, Michael Ortiz, and Matthew West. Variational inte-
grators and the Newmark algorithm for conservative and dissipative mechanical sys-
tems. International Journal for Numerical Methods in Engineering , 49(10):1295–1325,
2000.
[51] C Kane, Jerrold E Marsden, and Michael Ortiz. Symplectic-energy-momentum pre-
serving variational integrators. Journal of mathematical physics , 40(7):3353–3371,
1999.
[52] Tsung-Dao Lee. Can time be a discrete dynamical variable? Physics Letters B , 122(3-
4):217–220, 1983.
[53] Y. Shibberu. Is symplectic-energy-momentum integration well-posed? 2006.
arXiv:math-ph/0608016.
[54] Yosi Shibberu. How to regularize a symplectic-energy-momentum integrator. arXiv
preprint math/0507483 , 2005.
[55] Harsh Sharma, Mayuresh Patil, and Craig Woolsey. Energy-preserving variational
integrators for forced Lagrangian systems. Communications in Nonlinear Science and
Numerical Simulation , 64:159–177, 2018.
[56] Anthony M Bloch, John Baillieul, Peter E Crouch, Jerrold E Marsden, Dmitry Zenkov,
Perinkulam Sambamurthy Krishnaprasad, and Richard M Murray. Nonholonomic Me-
chanics and Control , volume 24. Springer, 2003.
[57] Jorge Cortés. Energy conserving nonholonomic integrators. arXiv preprint
math/0209314, 2002.
[58] Marin Kobilarov, Jerrold E Marsden, and Gaurav S Sukhatme. Geometric discretiza-


## Page 191

172 BIBLIOGRAPHY
tion of nonholonomic systems with symmetries. Discrete and Continuous Dynamical
Systems Series S , 3(1):61–84, 2010.
[59] Grigori N Milstein, Yu M Repin, and Michael V Tretyakov. Numerical methods for
stochastic systems preserving symplectic structure. SIAM Journal on Numerical Anal-
ysis, 40(4):1583–1604, 2002.
[60] Grigori N Milstein, Yu M Repin, and Michael V Tretyakov. Symplectic integration
of Hamiltonian systems with additive noise. SIAM Journal on Numerical Analysis ,
39(6):2066–2088, 2002.
[61] Nawaf Bou-Rabee and Houman Owhadi. Stochastic variational partitioned Runge-
Kutta integrators for constrained systems. arXiv preprint arXiv:0709.2222 , 2007.
[62] Darryl D Holm and Tomasz M Tyranowski. Stochastic discrete Hamiltonian variational
integrators. BIT Numerical Mathematics , 58(4):1009–1048, 2018.
[63] R C Fetecau, Jerrold E Marsden, and M West. Variational multisymplectic formula-
tions of nonsmooth continuum mechanics. In Perspectives and problems in nolinear
science, pages 229–261. Springer, 2003.
[64] Gwen Johnson, Sigrid Leyendecker, and Michael Ortiz. Discontinuous variational time
integrators for complex multibody collisions. International Journal for Numerical
Methods in Engineering , 100(12):871–913, 2014.
[65] S Lall and Matthew West. Discrete variational Hamiltonian mechanics. Journal of
Physics A: Mathematical and general , 39(19):5509, 2006.
[66] Melvin Leok and Jingjing Zhang. Discrete Hamiltonian variational integrators. IMA
Journal of Numerical Analysis , 31(4):1497–1532, 2010.


## Page 192

BIBLIOGRAPHY 173
[67] Jeremy M Schmitt and Melvin Leok. Properties of Hamiltonian variational integrators.
IMA Journal of Numerical Analysis , 38(1):377–398, 2017.
[68] Mark J Gotay, James Isenberg, Jerrold E Marsden, and Richard Montgomery. Mo-
mentum maps and classical relativistic fields. part i: Covariant field theory. arXiv
preprint physics/9801019, 1998.
[69] Adrian J Lew, Jerrold E Marsden, Michael Ortiz, and Matthew West. Asynchronous
variational integrators. Archive for Rational Mechanics and Analysis , 167(2):85–146,
2003.
[70] T Belytschko and DF Schoeberle. On the unconditional stability of an implicit algo-
rithm for nonlinear structural dynamics. Journal of Applied Mechanics , 42(4):865–869,
1975.
[71] O Gonzalez and Juan C Simo. On the stability of symplectic and energy-momentum
algorithms for non-linear Hamiltonian systems with symmetry. Computer Methods in
Applied Mechanics and Engineering , 134(3-4):197–222, 1996.
[72] Robert A LaBudde and Donald Greenspan. Discrete mechanics—a general treatment.
Journal of Computational Physics , 15(2):134–167, 1974.
[73] Robert A LaBudde and Donald Greenspan. Energy and momentum conserving meth-
ods of arbitrary order for the numerical integration of equations of motion. Numerische
Mathematik, 25(4):323–346, 1975.
[74] Robert A LaBudde and Donald Greenspan. Energy and momentum conserving meth-
ods of arbitrary order for the numerical integration of equations of motion. Numerische
Mathematik, 26(1):1–16, 1976.


## Page 193

174 BIBLIOGRAPHY
[75] J C Simo and Nils Tarnow. The discrete energy-momentum method. conserving al-
gorithms for nonlinear elastodynamics. Zeitschrift für angewandte Mathematik und
Physik (ZAMP) , 43(5):757–792, 1992.
[76] Juan C Simo, N Tarnow, and K K Wong. Exact energy-momentum conserving algo-
rithms and symplectic schemes for nonlinear dynamics. Computer Methods in Applied
Mechanics and Engineering , 100(1):63–116, 1992.
[77] J C Simo and O Gonzalez. Assessment of energy-momentum and symplectic schemes
for stiff dynamical systems. In American Society of Mechanical Engineers, ASME
Winter Annual Meeting, New Orleans, Louisiana , 1993.
[78] P Betsch and P Steinmann. Conservation properties of a time FE method. part i: time-
stepping schemes for N-body problems. International Journal for Numerical Methods
in Engineering , 49(5):599–638, 2000.
[79] P Betsch and P Steinmann. Conservation properties of a time FE method—part
ii: Time-stepping schemes for non-linear elastodynamics. International Journal for
Numerical Methods in Engineering , 50(8):1931–1955, 2001.
[80] P Betsch and P Steinmann. Conservation properties of a time FE method—part iii:
mechanical systems with holonomic constraints. International Journal for Numerical
Methods in Engineering , 53(10):2271–2304, 2002.
[81] M Groß, P Betsch, and P Steinmann. Conservation properties of a time FE method.
part iv: Higher order energy and momentum conserving schemes. International Journal
for Numerical Methods in Engineering , 63(13):1849–1897, 2005.
[82] Francisco Armero and Eva Petőcz. A new dissipative time-stepping algorithm for


## Page 194

BIBLIOGRAPHY 175
frictional contact problems: formulation and analysis. Computer Methods in Applied
Mechanics and Engineering , 179(1-2):151–178, 1999.
[83] Thomas JR Hughes. Analysis of transient algorithms with particular reference to
stability behavior. In Comput Methods for Transient Anal , pages 67–155. North-
Holland Comput Methods in Mech. v 1 Amsterdam, Neth and, 1983.
[84] Detlef Kuhl and Ekkehard Ramm. Generalized energy–momentum method for non-
linear adaptive shell dynamics. Computer Methods in Applied Mechanics and Engi-
neering, 178(3-4):343–366, 1999.
[85] Oscar Gonzalez. Time integration and discrete Hamiltonian systems. Journal of Non-
linear Science, 6(5):449, 1996.
[86] Robert I McLachlan, GR W Quispel, and Nicolas Robidoux. Geometric integration us-
ing discrete gradients. Philosophical Transactions of the Royal Society of London. Se-
ries A: Mathematical, Physical and Engineering Sciences , 357(1754):1021–1045, 1999.
[87] Oscar Gonzalez. Mechanical systems subject to holonomic constraints: Differential–
algebraic formulations and conservative integration. Physica D: Nonlinear Phenomena,
132(1-2):165–174, 1999.
[88] Elena Celledoni, Marta Farré Puiggalí, Eirik Hoel Høiseth, and David Martín de Diego.
Energy-preserving integrators applied to nonholonomic systems. Journal of Nonlinear
Science, pages 1–40, 2016.
[89] Robert I McLachlan and GR W Quispel. Discrete gradient methods have an energy
conservation law. arXiv preprint arXiv:1302.4513 , 2013.
[90] Elena Celledoni, Volker Grimm, Robert I McLachlan, DI McLaren, D O’Neale, Brynjulf
Owren, and GR W Quispel. Preserving energy resp. dissipation in numerical pdes using


## Page 195

176 BIBLIOGRAPHY
the “average vector field” method. Journal of Computational Physics , 231(20):6770–
6789, 2012.
[91] A Iserles and GR W Quispel. Why geometric numerical integration? arXiv preprint
arXiv:1602.07755, 2015.
[92] Peter E Crouch and R Grossman. Numerical integration of ordinary differential equa-
tions on manifolds. Journal of Nonlinear Science , 3(1):1–33, 1993.
[93] Hans Z Munthe-Kaas. Runge-kutta methods on Lie groups. BIT Numerical Mathe-
matics, 38(1):92–111, 1998.
[94] Hans Z Munthe-Kaas. High order runge-kutta methods on manifolds. Applied Numer-
ical Mathematics, 29(1):115–127, 1999.
[95] Arieh Iserles, Hans Z Munthe-Kaas, Syvert P Nørsett, and Antonella Zanna. Lie-group
methods. Acta numerica, 9:215–365, 2000.
[96] Elena Celledoni, Håkon Marthinsen, and Brynjulf Owren. An introduction to Lie
group integrators–basics, new developments and applications. Journal of Computa-
tional Physics , 257:1040–1061, 2014.
[97] Debra Lewis and Juan Carlos Simo. Conserving algorithms for the dynamics of Hamil-
tonian systems on Lie groups. Journal of Nonlinear Science , 4(1):253–299, 1994.
[98] Aleksandr I Bobenko and Yu B Suris. Discrete time Lagrangian mechanics on Lie
groups, with an application to the Lagrange top. Communications in mathematical
physics, 204(1):147–188, 1999.
[99] Jerrold E Marsden, Sergey Pekarsky, and Steve Shkoller. Discrete Euler-Poincaré and
Lie-Poisson equations. Nonlinearity, 12(6):1647, 1999.


## Page 196

BIBLIOGRAPHY 177
[100] Taeyoung Lee, N Harris McClamroch, and Melvin Leok. A Lie group variational inte-
grator for the attitude dynamics of a rigid body with applications to the 3d pendulum.
In Proceedings of 2005 IEEE Conference on Control Applications , pages 962–967, Aug.
2005.
[101] Taeyoung Lee, Melvin Leok, and N Harris McClamroch. Lie group variational in-
tegrators for the full body problem. Computer Methods in Applied Mechanics and
Engineering, 196(29):2907–2924, 2007.
[102] Taeyoung Lee, Melvin Leok, and N Harris McClamroch. Lagrangian mechanics and
variational integrators on two-spheres. International Journal for Numerical Methods
in Engineering , 79(9):1147–1174, 2009.
[103] François Demoures. Lie group and Lie algebra variational integrators for flexible beam
and plate in R3 [Ph.D.thesis]. PhD thesis, École Polytechnique Fédéralge de Lausanne,
2012.
[104] François Demoures, François Gay-Balmaz, Marin Kobilarov, and Tudor S Ratiu. Mul-
tisymplectic Lie group variational integrator for a geometrically exact beam in R3.
Communications in Nonlinear Science and Numerical Simulation , 19(10):3492–3512,
2014.
[105] François Demoures, François Gay-Balmaz, Sigrid Leyendecker, Sina Ober-Blöbaum,
Tudor S Ratiu, and Yves Weinand. Discrete variational Lie group formulation of
geometrically exact beam dynamics. Numerische Mathematik , 130(1):73–123, 2015.
[106] Harsh Sharma and Taeyoung Lee. Energy-preserving, adaptive time-step Lie group
variational integrators for the attitude dynamics of a rigid body. In 2019 American
Control Conference (ACC) , pages 5487–5492. IEEE, 2019.


## Page 197

178 BIBLIOGRAPHY
[107] Harsh Sharma, Mayuresh Patil, and Craig Woolsey. Energy-preserving, adaptive time-
step Lie group variational integrators for rigid body motion in SE(3). In 2019 58th
IEEE Conference on Decision and Control (accepted) . IEEE, 2019.
[108] Kang Feng and Meng-zhao Qin. The symplectic methods for the computation of
Hamiltonian equations. In Numerical methods for partial differential equations , pages
1–37. Springer, 1987.
[109] Paul J Channell and Clint Scovel. Symplectic integration of Hamiltonian systems.
Nonlinearity, 3(2):231, 1990.
[110] Etienne Forest and Ronald D Ruth. Fourth-order symplectic integration. Physica D:
Nonlinear Phenomena, 43(1):105–117, 1990.
[111] Jack Wisdom and Matthew Holman. Symplectic maps for the n-body problem. The
Astronomical Journal, 102:1528–1538, 1991.
[112] Jack Wisdom. The origin of the Kirkwood gaps-a mapping for asteroidal motion near
the 3/1 commensurability. The Astronomical Journal , 87:577–593, 1982.
[113] Jack Wisdom. Chaotic behavior and the origin of the 3/1 Kirkwood gap. Icarus,
56(1):51–74, 1983.
[114] Haruo Yoshida. Recent progress in the theory and application of symplectic integrators.
In Qualitative and Quantitative Behaviour of Planetary Systems , pages 27–43. Springer,
1993.
[115] Brett Gladman, Martin Duncan, and Jeff Candy. Symplectic integrators for long-term
integrations in celestial mechanics. Celestial Mechanics and Dynamical Astronomy ,
52(3):221–240, 1991.


## Page 198

BIBLIOGRAPHY 179
[116] Hiroshi Kinoshita, Haruo Yoshida, and Hiroshi Nakai. Symplectic integrators and their
application to dynamical astronomy. Celestial Mechanics and Dynamical Astronomy ,
50(1):59–71, 1990.
[117] E Imre and PL Palmer. High-precision, symplectic numerical, relative orbit propaga-
tion. Journal of guidance, control, and dynamics , 30(4):965–973, 2007.
[118] John E Chambers. A hybrid symplectic integrator that permits close encounters be-
tween massive bodies. Monthly Notices of the Royal Astronomical Society , 304(4):793–
799, 1999.
[119] F Varadi, CM De la Barre, WM Kaula, and M Ghil. Singularly weighted symplec-
tic forms and applications to asteroid motion. Celestial Mechanics and Dynamical
Astronomy, 62(1):23–41, 1995.
[120] Lin Liu, Jiang-hui Ji, and Xin-hao Liao. A numerical study of the orbits of near earth
asteroids with symplectic algorithm. Chinese Astronomy and Astrophysics , 23(1):108–
119, 1999.
[121] Harold F Levison and Martin J Duncan. The long-term dynamical behavior of short-
period comets. Icarus, 108(1):18–36, 1994.
[122] Vacheslav Emel’yanenko. An explicit symplectic integrator for cometary orbits. Ce-
lestial Mechanics and Dynamical Astronomy , 84(4):331–341, 2002.
[123] Yuichi Tsuda and Daniel J Scheeres. Computation and applications of an orbital dy-
namics symplectic state transition matrix. Journal of guidance, control, and dynamics ,
32(4):1111–1123, 2009.
[124] J Wisdom, M Holman, and J Touma. Symplectic correctors. Integration Algorithms
and Classical Mechanics , 10:217–244, 1996.


## Page 199

180 BIBLIOGRAPHY
[125] Will M Farr and Edmund Bertschinger. Variational integrators for the gravitational
N-body problem. The Astrophysical Journal , 663(2):1420, 2007.
[126] Taeyoung Lee, Melvin Leok, and N Harris McClamroch. High-fidelity numerical sim-
ulation of complex dynamics of tethered spacecraft. Acta Astronautica, 99:215–230,
2014.
[127] Taeyoung Lee and Frederick Leve. Lagrangian mechanics and Lie group variational
integrators for spacecraft with imbalanced reaction wheels. In 2014 American Control
Conference, pages 3122–3127. IEEE, 2014.
[128] James Hall and Melvin Leok. Spectral variational integrators. Numerische Mathematik,
130(4):681–740, 2015.
[129] Leonel Palacios and Pini Gurfil. Variational and symplectic integrators for satellite rel-
ative orbit propagation including drag. Celestial Mechanics and Dynamical Astronomy,
130(4):31, 2018.
[130] JC Simo and O Gonzalez. Recent results on the numerical integration of infinite-
dimensional Hamiltonian systems. Recent Developments in Finite Element Analysis.
CIMNE, Barcelona, Spain , pages 255–271, 1994.
[131] Oscar Gonzalez. Exact energy and momentum conserving algorithms for general mod-
els in nonlinear elasticity. Computer Methods in Applied Mechanics and Engineering ,
190(13-14):1763–1783, 2000.
[132] S Leyendecker, P Betsch, and P Steinmann. Objective energy–momentum conserving
integration for the constrained dynamics of geometrically exact beams. Computer
Methods in Applied Mechanics and Engineering , 195(19-22):2313–2333, 2006.


## Page 200

BIBLIOGRAPHY 181
[133] Mirza Muhammad Irfan Baig and Klaus-Jürgen Bathe. On direct time integration
in large deformation dynamic analysis. In Third MIT Conference on Computational
Fluid and Solid Mechanics, Boston, MA, June , pages 14–17, 2005.
[134] C Sansour, P Wriggers, and J Sansour. Nonlinear dynamics of shells: theory, finite
element formulation, and integration schemes. Nonlinear Dynamics , 13(3):279–305,
1997.
[135] Adrian Jose Lew. Variational time integrators in computational solid mechanics [Ph.D.
thesis]. PhD thesis, California Institute of Technology, 2003.
[136] Kedar G Kale and Adrian J Lew. Parallel asynchronous variational integrators. In-
ternational Journal for Numerical Methods in Engineering , 70(3):291–321, 2007.
[137] Juan C GarcÍa Orden and José M Goicolea. Conserving properties in constrained
dynamics of flexible multibody systems. Multibody System Dynamics , 4(2-3):225–244,
2000.
[138] Peter Betsch and Sigrid Leyendecker. The discrete null space method for the energy
consistent integration of constrained mechanical systems. part ii: Multibody dynamics.
International journal for numerical methods in engineering , 67(4):499–552, 2006.
[139] Sigrid Leyendecker, Peter Betsch, and Paul Steinmann. The discrete null space method
for the energy-consistent integration of constrained mechanical systems. part iii: Flex-
ible multibody dynamics. Multibody System Dynamics , 19(1-2):45–72, 2008.
[140] P Betsch and P Steinmann. Constrained integration of rigid body dynamics. Computer
Methods in Applied Mechanics and Engineering , 191(3-5):467–488, 2001.
[141] Peter Betsch and Stefan Uhlar. Energy-momentum conserving integration of multibody
dynamics. Multibody System Dynamics , 17(4):243–289, 2007.


## Page 201

182 BIBLIOGRAPHY
[142] Stefan Uhlar and Peter Betsch. On the derivation of energy consistent time stepping
schemes for friction afflicted multibody systems. Computers & Structures , 88(11-
12):737–754, 2010.
[143] Sigrid Leyendecker, Jerrold E Marsden, and Michael Ortiz. Variational integrators for
constrained dynamical systems. ZAMM-Journal of Applied Mathematics and Mechan-
ics, 88(9):677–708, 2008.
[144] Sigrid Leyendecker and Sina Ober-Blöbaum. A variational approach to multirate in-
tegration for constrained systems. In Multibody dynamics , pages 97–121. Springer,
2013.
[145] Olivier Brüls and Alberto Cardona. On the use of Lie group time integrators in
multibody dynamics. Journal of Computational and Nonlinear Dynamics , 5(3):031002,
2010.
[146] Olivier Brüls, Alberto Cardona, and Martin Arnold. Lie group generalized- α time in-
tegration of constrained flexible multibody systems. Mechanism and Machine Theory ,
48:121–137, 2012.
[147] Jonghoon Park and Wan-Kyun Chung. Geometric integration on euclidean group
with application to articulated multibody systems. IEEE Transactions on Robotics ,
21(5):850–863, 2005.
[148] Zdravko Terze, Andreas Müller, and Dario Zlatar. Lie-group integration method for
constrained multibody systems in state space. Multibody system dynamics , 34(3):275–
305, 2015.
[149] Blair Perot. Conservation properties of unstructured staggered mesh schemes. Journal
of Computational Physics , 159(1):58–89, 2000.


## Page 202

BIBLIOGRAPHY 183
[150] Sharif Elcott, Yiying Tong, Eva Kanso, Peter Schröder, and Mathieu Desbrun. Sta-
ble, circulation-preserving, simplicial fluids. ACM Transactions on Graphics (TOG) ,
26(1):4, 2007.
[151] Vladimir Arnold. Sur la géométrie différentielle des groupes de Lie de dimension infinie
et ses applications à l’hydrodynamique des fluides parfaits. In Annales de l’institut
Fourier, volume 16, pages 319–361, 1966.
[152] Colin J Cotter, Darryl D Holm, and Peter E Hydon. Multisymplectic formulation of
fluid dynamics using the inverse map. Proceedings of the Royal Society A: Mathemat-
ical, Physical and Engineering Sciences , 463(2086):2671–2687, 2007.
[153] Jerrold E Marsden, David G Ebin, and Arthur E Fischer. Diffeomorphism groups,
hydrodynamics and relativity. Canadian Mathematical Congress, 1972.
[154] Patrick Mullen, Keenan Crane, Dmitry Pavlov, Yiying Tong, and Mathieu Desbrun.
Energy-preserving integrators for fluid animation. ACM Transactions on Graphics
(TOG), 28(3):38, 2009.
[155] Dmitry Pavlov, Patrick Mullen, Yiying Tong, Eva Kanso, Jerrold E Marsden, and
Mathieu Desbrun. Structure-preserving discretization of incompressible fluids. Physica
D: Nonlinear Phenomena , 240(6):443–458, 2011.
[156] Evans S Gawlik, Patrick Mullen, Dmitry Pavlov, Jerrold E Marsden, and Mathieu
Desbrun. Geometric, variational discretization of continuum theories. Physica D:
Nonlinear Phenomena, 240(21):1724–1760, 2011.
[157] Mathieu Desbrun, Evan S Gawlik, François Gay-Balmaz, and Vladimir Zeitlin. Varia-
tional discretization for rotating stratified fluids. Discrete and Continuous Dynamical
Systems, 34(2):477–509, 2013.


## Page 203

184 BIBLIOGRAPHY
[158] Werner Bauer and François Gay-Balmaz. Towards a geometric variational discretiza-
tion of compressible fluids: the rotating shallow water equations. arXiv preprint
arXiv:1711.10617, 2017.
[159] Zachary Manchester, Neel Doshi, Robert J Wood, and Scott Kuindersma. Contact-
implicit trajectory optimization using variational integrators. The International Jour-
nal of Robotics Research , page 0278364919849235, 2019.
[160] Oliver Junge, Jerrold E Marsden, and Sina Ober-Blöbaum. Discrete mechanics and
optimal control. IF AC Proceedings Volumes, 38(1):538–543, 2005.
[161] Sina Ober-Blöbaum, Oliver Junge, and Jerrold E Marsden. Discrete mechanics and op-
timal control: an analysis. ESAIM: Control, Optimisation and Calculus of Variations ,
17(2):322–352, 2011.
[162] Sigrid Leyendecker, Sina Ober-Blöbaum, Jerrold E Marsden, and Michael Ortiz. Dis-
crete mechanics and optimal control for constrained systems. Optimal Control Appli-
cations and Methods , 31(6):505–528, 2010.
[163] Marin Kobilarov and Gaurav Sukhatme. Optimal control using nonholonomic integra-
tors. In Proceedings 2007 IEEE International Conference on Robotics and Automation ,
pages 1832–1837. IEEE, 2007.
[164] Paul Manns and Katja Mombaur. Towards discrete mechanics and optimal control for
complex models. IF AC-PapersOnLine, 50(1):4812–4818, 2017.
[165] Oliver Junge, Jerrold E Marsden, and Sina Ober-Blobaum. Optimal reconfiguration
of formation flying spacecraft—a decentralized approach. In Proceedings of the 45th
IEEE Conference on Decision and Control , pages 5210–5215. IEEE, 2006.


## Page 204

BIBLIOGRAPHY 185
[166] Taeyoung Lee, N Harris McClamroch, and Melvin Leok. Attitude maneuvers of a rigid
spacecraft in a circular orbit. In 2006 American Control Conference, pages 1742–1747.
IEEE, 2006.
[167] Zeeshan Shareef and Ansgar Trächtler. Simultaneous path planning and trajectory
optimization for robotic manipulators using discrete mechanics and optimal control.
Robotica, 34(6):1322–1334, 2016.
[168] David Pekarek, Aaron D Ames, and Jerrold E Marsden. Discrete mechanics and
optimal control applied to the compass gait biped. In 2007 46th IEEE Conference on
Decision and Control , pages 5376–5382. IEEE, 2007.
[169] Tatsuya Kai and Kouhei Yamaki. Development of discrete mechanics for 2-dimensional
distributed parameter mechanical systems and its application to vibration suppression
control of a film. In Proc. International Symposium of Nonlinear Theory and Its
Application 2016, pages 638–641, 2016.
[170] Zeeshan Shareef and Ansgar Trächtler. Optimal trajectory planning for robotic ma-
nipulators using discrete mechanics and optimal control. In 2014 IEEE Conference on
Control Applications (CCA) , pages 240–245. IEEE, 2014.
[171] Zachary Manchester and Scott Kuindersma. Variational contact-implicit trajectory
optimization. In International Symposium on Robotics Research (ISRR), Puerto Varas,
Chile, 2017.
[172] Dominik Kern and Michael Groß. Variational integrators and optimal control for a
hybrid pendulum-on-cart-system. PAMM, 18(1):e201800088, 2018.
[173] Robert I McLachlan and Stephen Marsland. Discrete mechanics and optimal control
for image registration. Anziam Journal, 48:1–16, 2006.


## Page 205

186 BIBLIOGRAPHY
[174] Herbert Goldstein, Charles Poole, and John Safko. Classical mechanics, 2002.
[175] J Argyris and D Scharpf. Finite elements in time and space. The Aeronautical Journal,
73(708):1041–1044, 1969.
[176] Melvin Leok and Tatiana Shingel. Prolongation–collocation variational integrators.
IMA Journal of Numerical Analysis , 32(3):1194–1216, 2011.
[177] Himanshu Shukla and Mayuresh J Patil. Nonlinear state feedback control design to
eliminate subcritical limit cycle oscillations in aeroelastic systems. Nonlinear Dynam-
ics, 88(3):1599–1614, 2017.
[178] Nikolaj Nordkvist and Amit K Sanyal. A Lie group variational integrator for rigid
body motion in se (3) with applications to underwater vehicle dynamics. In Decision
and Control (CDC), 2010 49th IEEE Conference on , pages 5414–5419. IEEE, 2010.
[179] Luca Carlone, Roberto Tron, Kostas Daniilidis, and Frank Dellaert. Initialization
techniques for 3d slam: a survey on rotation estimation and its use in pose graph opti-
mization. In 2015 IEEE international conference on robotics and automation (ICRA) ,
pages 4597–4604. IEEE, 2015.
[180] Boris T Polyak. Some methods of speeding up the convergence of iteration methods.
USSR Computational Mathematics and Mathematical Physics , 4(5):1–17, 1964.
[181] Yurii E Nesterov. A method for solving the convex programming problem with con-
vergence rate o (1/k^ 2). In Dokl. akad. nauk Sssr , volume 269, pages 543–547, 1983.
[182] Camillo J Taylor and David J Kriegman. Minimization on the Lie group so (3) and
related manifolds. Yale University, 16(155):6, 1994.


## Page 206

BIBLIOGRAPHY 187
[183] Mark D Plumbley. Lie group methods for optimization with orthogonality constraints.
In International Conference on Independent Component Analysis and Signal Separa-
tion, pages 1245–1252. Springer, 2004.
[184] Traian E Abrudan, Jan Eriksson, and Visa Koivunen. Steepest descent algorithms for
optimization under unitary matrix constraint. IEEE Transactions on Signal Processing,
56(3):1134–1147, 2008.
[185] Hongyi Zhang and Suvrit Sra. Towards riemannian accelerated gradient methods.
arXiv preprint arXiv:1806.02812 , 2018.
[186] Weijie Su, Stephen Boyd, and Emmanuel Candes. A differential equation for modeling
nesterov’s accelerated gradient method: Theory and insights. In Advances in Neural
Information Processing Systems , pages 2510–2518, 2014.
[187] Andre Wibisono, Ashia C Wilson, and Michael I Jordan. A variational perspective on
accelerated methods in optimization. proceedings of the National Academy of Sciences ,
113(47):E7351–E7358, 2016.
[188] Lin Yang, Raman Arora, Tuo Zhao, et al. The physical systems behind optimization
algorithms. In Advances in Neural Information Processing Systems , pages 4372–4381,
2018.
[189] Michael Muehlebach and Michael I Jordan. A dynamical systems perspective on nes-
terov acceleration. arXiv preprint arXiv:1905.07436 , 2019.
[190] Guilherme França, Jeremias Sulam, Daniel P Robinson, and René Vidal. Conformal
symplectic and relativistic optimization. arXiv preprint arXiv:1903.04100 , 2019.
[191] T. Lee, M. Leok, and N. H. McClamroch. Lie group variational integrators for the full


## Page 207

188 BIBLIOGRAPHY
body problem. Computer Methods in Applied Mechanics and Engineering , 196:2907–
2924, May 2007.
[192] Melvin Leok. Foundations of computational geometric mechanics . PhD thesis, Cali-
fornia Institute of Technology, 2004.
[193] Harsh Sharma, Mayuresh Patil, and Craig Woolsey. A review of structure-preserving
numerical methods for engineering applications. Computer Methods in Applied Me-
chanics and Engineering , 366:113067, 2020.
[194] M. D. Shuster and S. D. Oh. Three-axis attitude determination from vector observa-
tions. Journal of Guidance Control and Dynamics , 4(1):70–77, 1981.
[195] Taeyoung Lee. Real harmonic analysis on the special orthogonal group. arXiv preprint
arXiv:1809.10533, 2018.
[196] James H Wilkinson. Error analysis of floating-point computation. Numerische Math-
ematik, 2(1):319–340, 1960.
[197] JM Sanz-Serna. Backward error analysis of symplectic integrators. Fields Inst. Comm ,
10:193–205, 1996.
[198] Ernst Hairer. Variable time step integration with symplectic methods. Applied Nu-
merical Mathematics , 25(2-3):219–227, 1997.
[199] Mats Vermeeren. Modified equations for variational integrators. Numerische Mathe-
matik, 137(4):1001–1037, 2017.
[200] Elliot R Johnson and Todd D Murphey. Scalable variational integrators for constrained
mechanical systems in generalized coordinates. IEEE Transactions on Robotics ,
25(6):1249–1261, 2009.


## Page 208

BIBLIOGRAPHY 189
[201] Jeongseok Lee, C Karen Liu, Frank C Park, and Siddhartha S Srinivasa. A linear-time
variational integrator for multibody systems. arXiv preprint arXiv:1609.02898 , 2016.
[202] Taosha Fan, Jarvis Schultz, and Todd D Murphey. Efficient computation of higher-
order variational integrators in robotic simulation and trajectory optimization. arXiv
preprint arXiv:1904.12756, 2019.
[203] Marin Kobilarov. Solvability of geometric integrators for multi-body systems. In
Multibody Dynamics, pages 145–174. Springer, 2014.
[204] S Leyendecker, P Betsch, and P Steinmann. Energy-conserving integration of con-
strained Hamiltonian systems–a comparison of approaches. Computational Mechanics,
33(3):174–185, 2004.
[205] Peter Betsch, Christian Hesch, Nicolas Sänger, and Stefan Uhlar. Variational inte-
grators and energy-momentum schemes for flexible multibody dynamics. Journal of
Computational and Nonlinear Dynamics , 5(3):031001/1–031001/11, 2010.
