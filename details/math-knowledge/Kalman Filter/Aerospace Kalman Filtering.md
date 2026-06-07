# Fundamentals of Kalman Filtering and Estimation in Aerospace Engineering

Converted from: `Kalman Filter\Aerospace Kalman Filtering.pdf`


## Page 1

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Fundamentals of Kalman Filtering and
Estimation in Aerospace Engineering
Christopher D’Souza
chris.dsouza@nasa.gov
NASA / Johnson Space Center
Houston, Texas
20 March 2013
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 1 / 73


## Page 2

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Outline
Introduction and Background
Concepts from Probability Theory
Linear and Nonlinear Systems
Least Squares Estimation
The Kalman Filter
Stochastic Processes
The Kalman Filter Revealed
Implementation Considerations and Advanced Topics
The Extended Kalman Filter
Practical Considerations
Advanced Topics
Conclusions
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 2 / 73


## Page 3

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Introduction and Background
Concepts from Probability Theory
Linear and Nonlinear Systems
Least Squares Estimation
The Kalman Filter
Stochastic Processes
The Kalman Filter Revealed
Implementation Considerations and Advanced Topics
The Extended Kalman Filter
Practical Considerations
Advanced Topics
Conclusions
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 3 / 73


## Page 4

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Why Estimate?
• We estimate without even being conscious of it
• Anytime you walk down the hallway, you are estimating, your
eyes and ears are the sensors and your brain is the computer
• In its essence, estimation is nothing more than taking noisy
sensor data, ﬁltering the noise, and producing the ‘best’ state
of the vehicle
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 3 / 73


## Page 5

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


What Do We Estimate?
• As NASA engineers, we estimate a variety of things
• Position, Velocity, Attitude
• Mass
• Temperature
• Sensor parameters (biases)
• These quantities are usually referred to as the ‘states’ of the
system
• We use a variety of sensors to accomplish this task
• Inertial Measurement Units (IMUs)
• GPS Receivers (GPSRs)
• LIDARs
• Cameras
• These sensors are used to determine the states of the system
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 4 / 73


## Page 6

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


A Brief History of Estimation
• Estimation has its origins in the work of Gauss and his
innovation called ‘Least Squares’ Estimation
• He was interested in computing the orbits of asteroids and
comets given a set of observations
• Much of the work through WWI centered around extensions to
Least Squares Estimation
• In the interval between WWI and WWII, a number of
revolutionary contributions were made to sampling and
estimation theory
• Norbert Weiner and the Weiner Filter
• Claude Shannon and Sampling Theory
• Much of the work in the ﬁrst half of the Twentieth Century
focused on analog circuitry and the frequency domain
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 5 / 73


## Page 7

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Modern Estimation and Rudolf Kalman
• Everything changed with the conﬂuence of two events:
• The Cold War and the Space Race
• The Advent of the Digital Computer and Semiconductors
• A new paradigm was introduced: State Space Analysis
• Linear Systems and Modern Control Theory
• Estimation Theory
• Optimization Theory
• Rudolf Kalman proposes a new approach to linear systems
• Controllability and Observability
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 6 / 73


## Page 8

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Rudolf Kalman and His Filter
• In 1960 Kalman wrote a paper in an obscure ASME journal
entitled “A New Approach to Linear Filtering and Prediction
Problems” which might have died on the vine, except:
• In 1961, Stanley Schmidt of NASA Ames read the paper and
invited Kalman to give a seminar at Ames
• Schmidt recognized the importance of this new theory and
applied it to the problem of on-board navigation of a lunar
vehicle – after all this was the beginning of Apollo
• This became known as the ‘Kalman Filter’
• Kalman’s paper was rather obtuse in its nomenclature and
mathematics
• It took Schmidt’s exposition to show that this ﬁlter could be
easily mechanized and applied to a ’real’ problem
• The Kalman Filter became the basis for the on-board
navigation ﬁlter on the Apollo CSM and LM
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 7 / 73


## Page 9

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Types of Estimation
• There are basically two types of estimation: batch and
sequential
• Batch Estimation
• When sets of measurements taken over a period of time are
‘batched’ and processed together to estimate the state of a
vehicle at a given epoch
• This is usually the case in a ground navigation processor
• Sequential Estimation
• When measurements are processed as they are taken and the
state of the vehicle is updated as the measurements are
processed
• This is done in an on-board navigation system
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 8 / 73


## Page 10

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Types of Sensors
• Inertial Measurement Units (IMUs)
• GPS Recievers
• Magnetometers
• Optical Sensors
• Visible Cameras
• IR Cameras
• LIDARs (Scanning and Flash)
• RF sensors
• Radars (S-band and C-band)
• Range and Range-rate from Comm
• Altimeters
• Doppler Velocimeters
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 9 / 73


## Page 11

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Introduction and Background
Concepts from Probability Theory
Linear and Nonlinear Systems
Least Squares Estimation
The Kalman Filter
Stochastic Processes
The Kalman Filter Revealed
Implementation Considerations and Advanced Topics
The Extended Kalman Filter
Practical Considerations
Advanced Topics
Conclusions
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 10 / 73


## Page 12

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Why do we care about this probability stuff?
“Information: the negative reciprocal value of probability .”
Claude Shannon
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 10 / 73


## Page 13

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Concepts from Probability Theory
• A random variable is one whose ‘value’ is subject to
variations due to chance (randomness) – it does not have a
ﬁxed ‘value’; it can be discrete or continuous
• A coin toss: can be ‘heads’ or ‘tails’ – discrete
• The lifetime of a light bulb – continuous
• A probability density function (pdf), p(x), represents the
likelihood that x occurs
• Always non-negative
• Satisﬁes
∫ ∞
−∞
p(ξ) dξ = 1
• The expectation operator, E[f(x)], is deﬁned as
E [f(x)] =
∫ ∞
−∞
f(ξ) p(ξ) dξ
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 11 / 73


## Page 14

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Concepts from Probability Theory – Mean and Variance
• The mean (or ﬁrst moment) of a random variable x, denoted
by ¯x, is deﬁned as
¯x ∆= E [x] =
∫ ∞
−∞
ξ p(ξ) dξ
• The mean-square of a random variable x, E
[
x2
]
, is deﬁned
as
E
[
x2] ∆=
∫ ∞
−∞
ξ2 p(ξ) dξ
• The variance (or second moment) of a random variable x,
denoted byσ2
x, is
σ2
x
∆= E
[
[x− E(x)]2]
=
∫ ∞
−∞
(ξ− E(ξ))2 p(ξ) dξ
= E
[
x2]
− ¯x2
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 12 / 73


## Page 15

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Concepts from Probability Theory – Mean and Variance
of a Vector
• The mean of a random n−vector x, ¯x, is deﬁned as
¯x ∆= E [x] =
∫ ∞
−∞
···
∫ ∞
−∞
∫ ∞
−∞
ξ p(ξ) dξ
• The (co-)variance of random n−vector x, Px, is deﬁned as
Px
∆= E
[
[x− ¯x] [x− ¯x]T ]
=
∫ ∞
−∞
[
ξ− ¯ξ
] [
ξ− ¯ξ
]T
p(ξ) dξ
=

σ2
x1 σx1x2 ··· σx1xn
σx1x2 σ2
x2 ··· σx2xn
... ... ... ...
σx1xn σx2xn ··· σ2
xn

The covariance is geometrically represented by an error
ellipsoid.
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 13 / 73


## Page 16

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Concepts from Probability Theory –The Gaussian
Distribution
• The Gaussian probability distribution function , also called
the ‘Normal distribution’1 or a ‘bell curve’, is at the heart of
Kalman ﬁltering
• We assume that ‘our’ random variables have Gaussian pdfs
• We like to work with Gaussians because they are completely
characterized by their mean and covariance
• Linear combinations of Gaussians are Gaussian
• The Gaussian distribution of random n−vector x, with a mean
of ¯x and covariance Px, is deﬁned as
pg(x) = 1
(2π)n/2|Px|e−
(x−¯x)T P−1x (x−¯x)
2
1Physicist G. Lippman is reported to have said, ‘Everyone believes in the
normal approximation, the experimenters because they think it is a mathematical
theorem, the mathematicians because they think it is an experimental fact.’
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 14 / 73


## Page 17

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Concepts from Probability Theory –The Gaussian
Distribution
• We can show that
∫
Rn
1
(2π)n/2|Px|e−
(x−¯x)T P−1x (x−¯x)
2 dx = 1
• If a random process is generated
by a sum of other (non-Gaussian)
random processes, then, in the
limit, the combined distribution
approaches a Gaussian distribution
(The Central Limit Theorem)
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 15 / 73


## Page 18

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Introduction and Background
Concepts from Probability Theory
Linear and Nonlinear Systems
Least Squares Estimation
The Kalman Filter
Stochastic Processes
The Kalman Filter Revealed
Implementation Considerations and Advanced Topics
The Extended Kalman Filter
Practical Considerations
Advanced Topics
Conclusions
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 16 / 73


## Page 19

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Linear Systems
• A system is a mapping from input signals to output signals,
written as: w(t) = L(v(t))
• A system is linear if for all input signals v(t), v1(t), and v2(t)
and for all scalarsα,
• L is additive: L(v1(t) + v2(t)) = L(v1(t)) + L(v2(t))
• L is homogeneous: L(αv(t)) = αL(v(t))
• For a system to be linear, if 0 is an input, then 0 is an output:
L(0) = L(0· v(t)) = 0· L(v(t)) = 0
• If the system does not satisfy the above two properties, it is
said to be nonlinear
• If L(v(t)) = v(t) + 1, is this linear?
• It is not because for v(t) = 0, L(0) = 1 , 0
• Lesson: Some systems may look linear but they are not!
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 16 / 73


## Page 20

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Nonlinear Systems and the Linearization Process
• Despite the beauty associated with linear systems, the fact of
the matter is that we live in a nonlinear world.
• So, what do we do? We make these nonlinear systems into
linear systems by linearizing
• This is predicated on a Taylor series approximation which we
deploy as follows: Given a nonlinear system of the form:
˙X = f(X, t), we linearize about (or expand about) a nominal
trajectory, X⋆ (with ˙X⋆ = f(X⋆, t)), as
˙X(t) = f(X⋆, t) +
(∂f
∂X
)
X=X⋆
(X− X⋆) +···
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 17 / 73


## Page 21

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Nonlinear Systems and the State Transition Matrix
• If we let x(t) = X− X⋆ and let F(t) =
(∂f
∂X
)
X=X⋆, then we get
˙x = F(t)x with x(t0) = x0
• The solution of this equation is
x(t) = e
∫t
t0
F(τ) dτ
x0 = Φ(t, t0)x0
where Φ(t, t0) is the State Transition Matrix (STM) which
satisﬁes
˙Φ(t, t0) = F(t)Φ(t, t0) with Φ(t0, t0) = I
• The STM can be approximated (for F(t) = F = a constant) as
Φ(t, t0) = e
∫t
t0
F(τ) dτ
= eF(t−t0) = I + F(t− t0) + 1
2 F2(t− t0)2 +···
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 18 / 73


## Page 22

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


A Bit More About the State Transition Matrix
The State Transition Matrix (STM) is at the heart of practical
Kalman ﬁltering. In its essence it is deﬁned as
Φ(t, t0) ∆= ∂X(t)
∂X(t0)
As the name implies, it is used to ‘transition’ or move perturbations
of the state of a nonlinear system from one epoch to another, i.e.
x(t) = Φ(t, t0)x(t0) ⇐⇒
(
X(t)− X⋆(t)
)
= ∂X(t)
∂X(t0)
(
X(t0)− X⋆(t0)
)
In practical Kalman ﬁltering, we use a ﬁrst-order approximation2
Φ(t, t0)≈ I + F(t0) (t− t0) = I + ∂f(X, t)
∂X
⏐⏐⏐⏐⏐⏐X=X0
(t− t0)
2In cases of fast dynamics, we can approximate the STM to second-order as:
Φ(t, t0)≈ I + F(t0) (t− t0) + 1
2 F2(t0) (t− t0)2
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 19 / 73


## Page 23

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Introduction and Background
Concepts from Probability Theory
Linear and Nonlinear Systems
Least Squares Estimation
The Kalman Filter
Stochastic Processes
The Kalman Filter Revealed
Implementation Considerations and Advanced Topics
The Extended Kalman Filter
Practical Considerations
Advanced Topics
Conclusions
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 20 / 73


## Page 24

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


How do we Implement This?
“Never do a calculation unless you already know the answer.”
John Archibald Wheeler’s First Moral Principle
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 20 / 73


## Page 25

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Context of Least Squares Estimation
• Least Squares estimation has been a mainstay of engineering
and science since Gauss invented it to track Ceres circa 1794
• It has been used extensively for spacecraft state estimation,
particularly in ground-based navigation systems
• The Apollo program had an extensive ground station network
(MSFN/STDN) coupled with sophisticated ground-based
batch processors for tracking the CSM and LM
• A set of measurements (or several sets of measurements)
taken over many minutes and over several passes from
different ground stations would be ‘batched’ together to get a
spacecraft state at a particular epoch
• Least Squares estimation is predicated on ﬁnding a solution
which minimizes the square of the errors of the model
y = Hx + ϵ
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 21 / 73


## Page 26

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Least Squares Problem
The problem is as follows: given a set of observations, y, subject to
measurement errors (ϵ), ﬁnd the best solution, ˆx, which minimizes
the errors, i.e.
min J = 1
2 ϵT ϵ = 1
2 (y− Hx)T (y− Hx)
To do this we take the ﬁrst derivative ofJ with respect to x and set
it equal to zero as
∂J
∂x = ∂
∂x
[1
2 (y− Hx)T (y− Hx)
]
x=ˆx
=− (y− Hˆx)T H = 0
Therefore, the optimal solution, ˆx, is
ˆx =
(
HT H
)−1
HT y
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 22 / 73


## Page 27

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Weighted Least Squares (WLS) Problem
Suppose now we are given measurements y, whose error has a
measurement covariance of R. How can we get the best estimate,
ˆx which minmizes the errors weighted by the accuracy of the
measurement error (R−1)? The problem can be posed as
min J = 1
2 ϵT R−1ϵ = 1
2 (y− Hx)T R−1 (y− Hx)
Once again, we take the ﬁrst derivative of J with respect to x and
set it equal to zero as
∂J
∂x = ∂
∂x
[1
2 (y− Hx)T R−1 (y− Hx)
]
x=ˆx
=− (y− Hˆx)T R−1H = 0
Therefore, the optimal solution, ˆx, is
ˆx =
(
HT R−1H
)−1
HT R−1y
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 23 / 73


## Page 28

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The WLS Problem with A Priori Information
Suppose we need to ﬁnd the best estimate of the state, given
measurements y, with measurement error covariance R, but we
are also given an a priori estimate of the state, ¯x with covariance
¯P. This problem can be posed as
min J = 1
2 (y− Hx)T R−1 (y− Hx) + 1
2 (¯x− x)T ¯P−1 (¯x− x)
As before, we take the ﬁrst derivative of J with respect to x and set
it equal to zero as
∂J
∂x
⏐⏐⏐⏐⏐x=ˆx
=− (y− Hˆx)T R−1H− (¯x− ˆx)T ¯P−1 = 0
Therefore, the optimal solution, ˆx, is
ˆx =
(
HT R−1H + ¯P−1)−1 [
HT R−1y + ¯P−1¯x
]
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 24 / 73


## Page 29

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Nonlinear Batch Estimation
In general, the system of interest will be nonlinear of the form
Yk = h(Xk, tk ) + ϵk
How do we get the best estimate of the state X? Well, ﬁrst we
linearize about a nominal state X⋆
k (with xk
∆= Xk− X⋆
k ) as
Yk = h(X⋆
k + xk, tk ) + ϵk = h(X⋆
k ) + ∂h
∂X
⏐⏐⏐⏐⏐Xk =X⋆
k
(
Xk− X⋆
k
)
+··· + ϵk
Deﬁning ˜Hk
∆= ∂h
∂X
⏐⏐⏐Xk =X⋆
k
we get the following equation
yk = ˜Hk xk + ϵk
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 25 / 73


## Page 30

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Nonlinear Batch Estimation at an Epoch
In batch estimation, we are interested in estimating a state at an
epoch, say X0, with measurements taken after that epoch – say, at
tk. How can we obtain this? Well, we use the state transition matrix
as follows
Xk− X⋆
k = Φ(tk, t0)
(
Xk− X⋆
k
)
⇐⇒ xk = Φ(tk, t0)x0
so that we can map the measurements back to the epoch of
interest as
yk = ˜Hk Φ(tk, t0)x0 + ϵk = Hk x0 + ϵk
The least squares solution (over all the p measurements) is
ˆx0 =

p∑
i=1
HT
i R−1
i Hi + ¯P−1
0

−1 
p∑
i=1
HT
i R−1
i yi + ¯P−1
0 ¯x0
 = ˆX0− X⋆
0
This is called the normal equation.
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 26 / 73


## Page 31

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Nonlinear Batch Estimation Algorithm
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 27 / 73


## Page 32

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Batch Filter Example – Aircraft Tracking
Given a ground station tracking an
airplane, moving in a straight line at
a constant speed, with only bearing
measurements, we are interested in
knowing the speed of the airplane
and its position at the beginning of
the tracking pass (x0, y0, u0, v0). The
equations are
x(t) = u0(t− t0) + x0
y(t) = v0(t− t0) + y0
θ(t) = tan−1
[y(t)
x(t)
]
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 28 / 73


## Page 33

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Batch Filter Example – Aircraft Tracking (II)
The measurements are:
The initial guess is
X∗
0 =

985
105
−1.5
10

with initial covariance
P0 =

100 0 0 0
0 100 0 0
0 0 1 0
0 0 0 1

Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 29 / 73


## Page 34

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Batch Filter Example – Aircraft Tracking (III)
After 7 iterations the following results are obtained:
Parameter Truth Initial Guess Converged State
x0 1000 985 983.5336
y0 100 105 99.3470
u0 -3 -1.5 -2.9564
v0 12 10 11.7763
Lesson: The x−component is not readily observable. But that is
not surprising since angles do not provide information along the
line-of-sight.
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 30 / 73


## Page 35

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Something to remember
One must watch the convergence of a numerical code as carefully
as a father watching his four year old play near a busy road.
J. P . Boyd
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 31 / 73


## Page 36

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Introduction and Background
Concepts from Probability Theory
Linear and Nonlinear Systems
Least Squares Estimation
The Kalman Filter
Stochastic Processes
The Kalman Filter Revealed
Implementation Considerations and Advanced Topics
The Extended Kalman Filter
Practical Considerations
Advanced Topics
Conclusions
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 32 / 73


## Page 37

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Need for Careful Preparation
“Six months in the lab can save you a day in the library”
Albert Migliori, quoted by J. Maynard
in Physics Today 49, 27 (1996)
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 32 / 73


## Page 38

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Stochastic Processes – The Linear First-Order
Differential Equation
• Let us look at a ﬁrst-order differential equation for x(t), given
f(t), g(t), w(t) and x0 as
˙x(t) = f(t)x(t) + g(t)w(t) with x(t0) = x0
• The solution of this equation is
x(t) = e
∫t
t0
f(τ)dτ
x0 +
∫ t
t0
e
∫t
ξ f(τ)dτg(ξ)w(ξ)dξ
• Suppose now we deﬁneφ(t, t0) ∆= e
∫t
t0
f(τ)dτ
, we can write the
above solution as
x(t) = φ(t, t0)x0 +
∫ t
t0
φ(t,ξ )g(ξ)w(ξ)dξ
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 33 / 73


## Page 39

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Mean of a Linear First-Order Stochastic Process
• Given a ﬁrst-order stochastic process,χ(t), with constant f
and g and white noise, w(t), which is represented as
˙χ(t) = fχ(t) + g w(t) with χ(t0) = χ0
and the mean and covariance of w(t) expressed as
E[w(t)] = 0 and E[w(t)w(τ)] = qδ(t−τ)
• The mean of the process, ¯χ(t) is
¯χ(t) = E[χ(t)] = e
∫t
t0
f dτ
¯χ0 +
∫ t
t0
e
∫t
ξ f dτg(ξ)E[w(ξ)]dξ
= e
∫t
t0
f dτ
¯χ0
= ef(t−t0)¯χ0
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 34 / 73


## Page 40

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Stochastic Processes – The Mean-Square and
Covariance of a Linear First-Order Stochastic Process
• The mean-square of the linear ﬁrst-order stochastic process,
χ(t) is
E[χ2(t)] = e2f(t−t0)E [χ(t0)χ(t0)] + q
2f
[
1− e2f(t−t0)]
= φ2(t, t0)E [χ(t0)χ(t0)] + q
2f
[
1−φ2(t, t0)
]
• The covariance ofχ(t), Pχχ(t), is expressed as
Pχχ(t) = E
[
(χ(t)− ¯χ(t))2]
= E[χ2(t)]− ¯χ2(t)
= φ2(t, t0)Pχχ(t0) + q
2f
[
1−φ2(t, t0)
]
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 35 / 73


## Page 41

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Stochastic Processes – The Vector First-Order
Differential Equation
A ﬁrst-order vector differential equation for x(t), given x(t0) and
white noise with E(w(t)) = 0, and E(w(t)w(τT )) = Qδ(t−τ), is
˙x(t) = F(t)x(t) + G(t)w(t)
The solution of this equation is
x(t) = Φ(t, t0)x(t0) +
∫ t
t0
Φ(t,ξ )G(ξ)w(ξ)dξ
where Φ(t, t0) satisﬁes the following equation
˙Φ(t, t0) = F(t)Φ(t, t0), with Φ(t0, t0) = I
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 36 / 73


## Page 42

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Mean and Mean-Square of a Linear, Vector Process
The mean of the stochastic process ˙x(t) = F(t)x(t) + G(t)w(t) is
¯x(t) = E[x(t)] = Φ(t, t0)E[x(t0)] +
∫ t
t0
Φ(t,ξ )G(ξ)E[w(ξ)]dξ
= Φ(t, t0)¯x(t0)
The mean-square of the process (with E[x(t0)wT (t)] = 0) is
E[x(t)xT (t)] = E
{[
Φ(t, t0)x(t0) +
∫ t
t0
Φ(t,ξ )G(ξ)w(ξ)dξ
]
×
[
Φ(t, t0)x(t0) +
∫ t
t0
Φ(t,χ )G(ξ)w(χ)dχ
]}
= Φ(t, t0)E[x(t0)xT (t0)]ΦT (t, t0)
+
∫ t
t0
Φ(t,ξ )G(ξ) Q GT (ξ)ΦT (t,ξ ) dξ
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 37 / 73


## Page 43

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Covariance of a Linear, Vector Process
The covariance of x(t), Pxx(t), given Pxx(t0), is expressed as
Pxx(t) = E
[
(x(t)− ¯x(t)) (x(t)− ¯x(t))T ]
= E[x(t)xT (t)]− ¯x(t)¯xT (t)
= Φ(t, t0)Pxx(t0)ΦT (t, t0)
+
∫ t
t0
Φ(t,ξ )G(ξ) Q GT (ξ)ΦT (t,ξ ) dξ
The differential equation for Pxx(t) can be found to be
˙Pxx(t) = F(t)Pxx(t) + Pxx(t)FT (t) + G(t) Q GT (t)
In the above development we have made use ofthe Sifting
Property of the Dirac Delta,δ(t−τ), expressed as
∫ ∞
−∞
f(ξ)δ(t−ξ)dξ = f(t)
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 38 / 73


## Page 44

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


A Discrete Linear, Vector Process
Given the continuous process (˙x(t) = F(t)x(t) + G(t)w(t)), whose
solution is
x(tk ) = Φ(tk, tk−1)x(tk−1) +
∫ tk
tk−1
Φ(t,ξ )G(ξ)w(ξ)dξ
the discrete stochastic analog process is
xk = Φ(tk, tk−1)xk−1 + wk, with wk
∆=
∫ tk
tk−1
Φ(t,ξ )G(ξ)w(ξ)dξ
whose mean is
¯xk = Φ(tk, tk−1)¯xk−1
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 39 / 73


## Page 45

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Covariance of a Discrete Linear, Vector Process
Likewise, the continuous-time solution for the covariance was
Pxx(tk ) = Φ(tk, t0)Pxx(t0)ΦT (tk, t0)
+
∫ t
t0
Φ(tk,ξ )G(ξ) Q GT (ξ)ΦT (tk,ξ ) dξ
whose discrete analog is
Pxxk = Φ(tk, tk−1)Pxxk−1ΦT (tk, tk−1) + Qk
where
Qk
∆=
∫ t
t0
Φ(tk,ξ )G(ξ) Q GT (ξ)ΦT (tk,ξ ) dξ
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 40 / 73


## Page 46

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Introduction and Background
Concepts from Probability Theory
Linear and Nonlinear Systems
Least Squares Estimation
The Kalman Filter
Stochastic Processes
The Kalman Filter Revealed
Implementation Considerations and Advanced Topics
The Extended Kalman Filter
Practical Considerations
Advanced Topics
Conclusions
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 41 / 73


## Page 47

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Practical Considerations
“There is nothing more practical than a good theory”
Albert Einstein
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 41 / 73


## Page 48

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Context of the Kalman Filter
• With the advent of the digital computer and modern control,
the following question arose: Can we recursively estimate the
state of a vehicle as measurements become available?
• In 1961 Rudolf Kalman came up with just such a methodology
to compute an optimal state given linear measurements and a
linear system
• The resulting Kalman ﬁlter is an globally optimal linear,
model-based estimator driven by Gaussian, white noise which
has two steps
• Propagation: the state and covariance are propagated from
one epoch to the next by integrating model-based dynamics
• Update: the state and covariance are optimally updated with
measurements
• We begin with the same equation as before
yk = Hk xk + ϵk with E(ϵk ) = 0, E(ϵk ϵT
k ) = Rk
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 42 / 73


## Page 49

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


What does a Kalman Filter do?
• Fundamentally, a Kalman ﬁlter is nothing more than a
predictor (which we call the ‘propagation’ phase) followed by a
corrector (which we call the ‘update’ phase)
• We use the dynamics (i.e. Newton’s Laws) to predict the state
at the time of a measurement
• The measurements are then used to correct or update the
predicted state.
• It does this in an “optimal” fashion
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 43 / 73


## Page 50

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Prediction
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 44 / 73


## Page 51

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Measurement
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 45 / 73


## Page 52

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Compute Residual
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 46 / 73


## Page 53

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Correction
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 47 / 73


## Page 54

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Derivation of the Kalman Filter (I)
Let ˆx−
k be an unbiased a priori estimate (the prediction) of xk with
covariance P−
k so that the a priori estimate error, e−
k is
e−
k = xk− ˆx−
k with E(e−
k ) = 0, E(e−
k e−T
k ) = P−
k
We hypothesize an unbiased linear update (the correction) to xk,
called ˆx+
k , as follows (with Kk as yet unknown)
ˆx+
k = ˆx−
k + Kk
(
yk− Hk ˆx−
k
)
whose a posteriori error, e+
k , is
e+
k = xk− ˆx+
k = e−
k− Kk (Hk e−
k + ϵk ) = (Ik− Kk Hk )e−
k− Kk ϵ
If e−
k and ϵk are uncorrelated, then the a posteriori covariance is
P+
k = E(e+
k e+T
k ) = (I− Kk Hk )P−
k (I− Kk Hk )T + Kk Rk KT
k
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 48 / 73


## Page 55

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Derivation of the Kalman Filter (II)
So far we haven’t said anything about Kk. We now choose Kk to
minimize the a posteriori error as1
min J = 1
2E
[
e+T
k e+
k
]
= 1
2 tr
{
E
[
e+T
k e+
k
]}
= 1
2E
{
tr
[
e+T
k e+
k
]}
= 1
2E
{
tr
[
e+
k e+T
k
]}
= 1
2 tr
{
E
[
e+
k e+T
k
]}
= 1
2 tr
(
P+
k
)
so we obtain K by2
∂
∂Kk
tr
(
P+
k
)
= ∂
∂Kk
tr
[
(I− Kk Hk )P−
k (I− Kk Hk )T + Kk Rk KT
k
]
= 0
1The cyclic invariance property of the trace is: tr(ABC) = tr(BCA) = tr(CAB)
2Recalling that
∂
∂X tr(AXBXT ) = AT XBT + AXB; ∂
∂X tr(AXB) = AT BT ; ∂
∂X tr(AXT B) = BA
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 49 / 73


## Page 56

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Derivation of the Kalman Filter (III)
This results in the following condition
−P−
k HT
k− P−
k HT
k + Kkopt
(
Hk P−
k HT
k + Rk
)T
+ Kkopt
(
Hk Pk HT
k + Rk
)
= 0
which gives
Kkopt = P−
k HT
k
(
Hk P−
k HT
k + Rk
)−1
and substituting into the equation2 for P+we get
P+
k = P−
k− P−
k HT
k
(
Hk P−
k HT
k + Rk
)−1
Hk P−
k =
(
I− Kkopt Hk
)
P−
k
so the state update is
ˆx+
k = ˆx−
k + Kkopt
(
yk− Hk ˆx−
k
)
2Recall that P+ = (I− KH)P−(I− KH)T + KRKT
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 50 / 73


## Page 57

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Kalman Filter Revealed
Given the dynamics and the measurements
xk = Φ(tk, tk−1)xk−1 + Γk wk, with E(wk ) = 0, E(wk wT
j ) = Qkδkj
yk = Hk xk + ϵk, with E(ϵk ) = 0, E(ϵk ϵT
j ) = Rkδkj
The Kalman Filter contains the following phases:
Propagation – the Covariance Increases
ˆx−
k = Φ(tk, tk−1)ˆx+
k−1
P−
k = Φ(tk, tk−1)P+
k−1ΦT (tk, tk−1) + Γk Qk ΓT
k
Update – the Covariance Decreases
Kkopt = P−
k HT
k
(
Hk P−
k HT
k + Rk
)−1
ˆx+
k = ˆx−
k + Kkopt
(
yk− Hk ˆx−
k
)
P+
k =
(
I− Kkopt Hk
)
P−
k =
(
I− Kkopt Hk
)
P−
k
(
I− Kkopt Hk
)T
+ Kkopt Rk KT
kopt
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 51 / 73


## Page 58

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


A Kalman Filter Example
Given a spring-mass-damper system governed by the following
equation
¨r(t) =−0.001r(t)− 0.005˙r(t) + w(t)
the system can be written (in ﬁrst-order discrete form,
xk = Φ(tk, tk−1)xk−1 + Γk wk) as
[
r(tk )
˙r(tk )
]
= exp
{[
0 1
−0.001 −0.005
]
∆t
} [
r(tk−1)
˙r(tk−1)
]
+
[
0
1
]
wk
with measurements
yk = r(tk ) +ϵk with E[ϵk ] = 0, E[ϵjϵk ] = 0.0012δjk
and
P0 =
[
1 0
0 0 .12
]
and Q = 0.0052
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 52 / 73


## Page 59

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


A Kalman Filter Example (II)
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 53 / 73


## Page 60

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


A Kalman Filter Example (III)
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 54 / 73


## Page 61

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Introduction and Background
Concepts from Probability Theory
Linear and Nonlinear Systems
Least Squares Estimation
The Kalman Filter
Stochastic Processes
The Kalman Filter Revealed
Implementation Considerations and Advanced Topics
The Extended Kalman Filter
Practical Considerations
Advanced Topics
Conclusions
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 55 / 73


## Page 62

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Practical Considerations
“A computation is a temptation that should be resisted a long as
possible ”
John Boyd (paraphrasing T.S. Eliot) , 2000
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 55 / 73


## Page 63

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Extended Kalman Filter
Since we live in a nonlinear and non-Gaussian world, can we ﬁt the
Kalman ﬁlter paradigm into the ‘real’ world? Being engineers,
when all else fails, we linearize.
ˆXk = X⋆
k + ˆxk
This process results in an algorithm called the Extended Kalman
ﬁlter (EKF). However all guarantees of stability and optimality are
lost. The EKF is a conditional mean estimator with dynamics
truncated after ﬁrst-order by deterministically linearizing about the
conditional mean.
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 56 / 73


## Page 64

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Development of the Extended Kalman Filter (I)
Begin with the nonlinear state equation
˙X(t) = f(X, t) + w(t) with E[w(t)] = 0, E[w(t)w(τ)] = Qδ(t−τ)
whose solution, given X(tk−1) is
X(t) = X(tk−1) +
∫ t
tk−1
f(X,ξ )dξ +
∫ t
tk−1
w(ξ)dξ
We expand f(X, t) in a Taylor series about ˆX = E(X) as
˙X(t) = f(ˆX, t) + ∂f
∂X
⏐⏐⏐⏐⏐X=ˆX
(
X− ˆX
)
+··· + w(t)
so that ˙ˆX(t), neglecting higher than ﬁrst-order terms,
˙ˆX(t) = f(ˆX, t)
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 57 / 73


## Page 65

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Development of the Extended Kalman Filter (II)
Recalling the deﬁnition of P
(
∆= E
[
(X− ˆX)(X− ˆX)T
] )
, we ﬁnd that
˙P(t) = F(t)P(t) + P(t)FT (t) + Q where F ∆= ∂f
∂X
⏐⏐⏐⏐⏐X=ˆX
which can be integrated as
P(tk ) = Φ(tk, tk−1)P(tk−1)ΦT (tk, tk−1) + Qk
with Φ(tk−1, tk−1) = I and
˙Φ(t, tk−1) = F(t)Φ(t, tk−1), and Qk =
∫ tk
tk−1
Φ(tk,ξ ) Q ΦT (tk,ξ )dξ
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 58 / 73


## Page 66

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Development of the Extended Kalman Filter (III)
Likewise, the measurement equation can be expanded in a Taylor
series about ˆX−
k , the a priori state, as
Yk = h(Xk ) + ϵk = h(ˆX−
k ) + ∂h
∂Xk
⏐⏐⏐⏐⏐Xk =ˆX−
k
(
Xk− ˆX−
k
)
+··· + ϵk
In the EKF development, we truncate the Taylor series after
ﬁrst-order. As in the Kalman ﬁlter development, we minimize the
trace of the a posteriori covariance and this results in
Kk (ˆX−
k ) = P−
k HT
k (ˆX−
k )
[
Hk (ˆX−
k ) P−
k HT
k (ˆX−
k ) + Rk
]−1
P+
k =
[
I− Kk (ˆX−
k )HT
k (ˆX−
k )
]
P−
k
ˆX+
k = ˆX−
k + Kk (ˆX−
k )
[
Yk− hk (ˆX−
k )
]
Hk (ˆX−
k ) = ∂h
∂Xk
⏐⏐⏐⏐⏐Xk =ˆX−
k
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 59 / 73


## Page 67

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


The Extended Kalman Filter (EKF) Algorithm
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 60 / 73


## Page 68

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Introduction and Background
Concepts from Probability Theory
Linear and Nonlinear Systems
Least Squares Estimation
The Kalman Filter
Stochastic Processes
The Kalman Filter Revealed
Implementation Considerations and Advanced Topics
The Extended Kalman Filter
Practical Considerations
Advanced Topics
Conclusions
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 61 / 73


## Page 69

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Practical Considerations
“In theory, there is no difference between theory and practice, but
in practice there is”
John Junkins, 2012
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 61 / 73


## Page 70

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Practical Matters – Processing Multiple Measurements
• In general, more than one measurement will arrive at the
same time
• Usually the measurements are uncorrelated and hence they
can be processed one-at-a-time
• However, even if they are correlated, they can usually be
treated as if they were uncorrelated – by increasing the
measurement noise variance
• If the measurements are processed one-at-a-time, then
Kk = P−
k HT
k
(
Hk P−
k HT
k + Rk
)−1
=
P−
k HT
k
Hk P−
k HT
k + Rk
• Thus there is no need for a matrix inverse – we can use scalar
division
• This greatly reduces the computational throughput, not to
mention software complexity
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 62 / 73


## Page 71

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Practical Matters – Processing Non-Gaussian
Measurements
• The Kalman Filter is predicated on measurements whose
errors are Gaussian
• However, real-world sensors seldom have error
characteristics that are Gaussian
• Real sensors have (signiﬁcant) biases
• Real sensors have signiﬁcant skewness (third moment) and
kurtosis (fourth moment)
• A great deal of information is contained in the tails of the
distribution
• Signiﬁcant sensor testing needs to be performed to fully
characterize a sensor and determine its error characteristics
• Measurement editing is performed on the innovations process
(ηik = Yik− hi(ˆX−
k ) with variance Vik = Hik P−
k HT
ik
+ Rik )
• Don’t edit out measurements that are greater than 3Vik
• We process measurements that are up to 6Vik
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 63 / 73


## Page 72

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Practical Matters – Dealing with Measurement Latency
• Measurements aren’t so polite as to be time-tagged or to
arrive at the major cycle of the navigation ﬁlter (tk)
• Therefore, we need to process the measurements at the time
they are taken, assuming that the measurements are not too
latent
• Provided they are less than (say) 3 seconds latent
• The state is propagated back to the measurement time using,
say, a ﬁrst-order integrator
Xm = Xk + f(Xk )∆t + ∂f
∂X(Xk )f(Xk )∆t2
• The measurement partial mapping is done in much the same
way as it was done in ’batch estimation’
• Map the measurement sensitivity matrix at the time of the
measurement(H(Xm)) to the ﬁlter time (tk) using the state
transition matrix, Φ(tm, tk ).
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 64 / 73


## Page 73

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Practical Matters – Measurement Underweighting
• Sometimes, when accurate measurements are introduced to
a state which isn’t all that accurate, ﬁlter instability results
• There are several ways to handle this
• Second-order Kalman Filters
• Sigma Point Kalman Filters
• Measurement Underweighting
• Since Apollo, measurement underweighting has been used
extensively
• What underweighting does is it slows down the rate that the
measurements decrease the covariance
• It approximates the second-order correction to the covariance
matrix
• Underweighting is typically implemented as
Kk = P−
k HT
k
(
(1 +α)Hk P−
k HT
k + Rk
)−1
• The scalarα is a ‘tuning’ parameter used to get good ﬁlter
performance
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 65 / 73


## Page 74

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Practical Matters – Filter Tuning (I)
• Regardless of how you slice it, tuning a navigation ﬁlter is an
‘art’
• There are (at least) two sets of ‘knobs’ one can turn to tune a
ﬁlter
• Process Noise (also called ‘State Noise’ or ‘Plant Noise’), Q,
the noise on the state dynamics
• Measurement Noise, R
• Filter tuning is performed in the context of Monte Carlo
simulations (1000’s of runs)
• FIlter designers begin with the expected noise parameters
• Process Noise – the size of the neglected dynamics (e.g. a
truncated gravity ﬁeld)
• Measurement Noise – the sensor manufacturer’s noise
speciﬁcations
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 66 / 73


## Page 75

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Practical Matters – Filter Tuning (II)
• Sensor parameters (such as bias) are modeled as zero-mean
Gauss-Markov parameters, xp, which have two ‘tuning’
parameters
• The Steady State Variance (Ppss)
• The Time Constant (τ)
d
dt xp = − 1
τp
xp + wp, where E[wp(t)wp(τ)] = Qpδ(t−τ)
Qp = 2Ppss
τp
• All of these are ‘tuned’ in the Monte Carlo environment so that
• The state error remains mostly within the 3-σ bounds of the
ﬁlter covariance
• The ﬁlter covariance represents the computed sample
covariance
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 67 / 73


## Page 76

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Practical Matters – Filter Tuning (III)
• Sometimes the ﬁlter designer inadvertently chooses a process
noise such that the covariance of the state gets too small
• When this happens, the ﬁlter thinks it is very sure of itself – it
is smug
• The end result is that the ﬁlter starts rejecting measurements
• Never a good thing
• The solution to this problem is to inject enough process noise
to keep the ﬁlter ‘open’
• This allows the ﬁlter to process measurements appropriately
• There are several spacecraft which have experienced
problems because the designers have chosen incorrect (too
small) process noise
• Of course, this is nothing more than the classic tension
between ‘stability’ and ‘performance’
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 68 / 73


## Page 77

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Practical Matters – Invariance to Measurement Ordering
• Because of its nonlinear foundation, the performance of an
EKF can be highly dependent on the order in which
measurements are processed
• For example, if a system processes range and bearing
measurements, the performance of the EKF will be different if
the range is processed ﬁrst versus if the bearing were
processed ﬁrst
• To remedy this, on Orion we employ a hybrid linear/EKF
formulation
• The state and covariance updates are accumulated in delta
state and covariance variables
• The state and covariance are updated only after all the
measurements are processed
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 69 / 73


## Page 78

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Introduction and Background
Concepts from Probability Theory
Linear and Nonlinear Systems
Least Squares Estimation
The Kalman Filter
Stochastic Processes
The Kalman Filter Revealed
Implementation Considerations and Advanced Topics
The Extended Kalman Filter
Practical Considerations
Advanced Topics
Conclusions
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 70 / 73


## Page 79

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Advanced Topics
• The Kalman-Bucy Filter
• The Schmidt-Kalman Consider Filter
• The Kalman Smoother
• Square Root and Matrix Factorization Techniques
• Potter Square Root Filter (Apollo)
• UDU Filter (Orion)
• Nonlinear Filters
• Second-Order Kalman Filters
• Sigma Point Kalman Filters
• Particle Filters
• Entropy Based / Bayesian Inference Filters
• Linear Covariance Analysis
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 70 / 73


## Page 80

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Introduction and Background
Concepts from Probability Theory
Linear and Nonlinear Systems
Least Squares Estimation
The Kalman Filter
Stochastic Processes
The Kalman Filter Revealed
Implementation Considerations and Advanced Topics
The Extended Kalman Filter
Practical Considerations
Advanced Topics
Conclusions
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 71 / 73


## Page 81

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


Conclusions
• Kalman Filtering and Least Squares Estimation are at the
heart of the spacecraft navigation
• Ground-based navigation
• On-board navigation
• Its purpose is to obtain the ‘best’ state of the vehicle given a
set of measurements and subject to the computational
constraints of ﬂight software
• It requires ﬂuency with several disciplines within engineering
and mathematics
• Statistics
• Numerical Algorithms and Analysis
• Linear and Nonlinear Analysis
• Sensor Hardware
• Challenges abound
• Increase demands on throughput
• Image-based sensors
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 71 / 73


## Page 82

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


To put things in perspective
“I never, never want to be a pioneer . . . Its always best to come in
second, when you can look at all the mistakes the pioneers made
and then take advantage of them.”
Seymour Cray
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 72 / 73


## Page 83

Introduction and Background
Least Squares Estimation
The Kalman Filter
Implementation Considerations and Advanced Topics
NASA / Johnson Space Center


References
• Maybeck, P .S.Stochastic Models, Estimation, and Control,
Volumes 1-3, Academic Press, 1982.
• Gelb, A. E. (ed.), Applied Optimal Estimation, MIT Press,
1974.
• Brown, R.G., and Hwang, P .Y .C.,Introduction to Random
Signals and Applied Kalman Filtering, John Wiley, 1992.
• Simon, D., Optimal State Estimation: Kalman, H-inﬁnity, and
Nonlinear Approaches, John WIley, 2006.
• Tapley, B., Schutz, B., and Born, G.,Statistical Orbit
Determination, Elsevier Inc, 2004.
• Zanetti, R., DeMars, K, and Bishop, R., “Underweighting
Nonlinear Measurements,” Journal of Guidance, Control, and
Dynamics, Vol. 33, No. 5, September-October 2010.
Christopher D’Souza March 2013 Fundamentals of Kalman Filtering and Estimation 73 / 73
