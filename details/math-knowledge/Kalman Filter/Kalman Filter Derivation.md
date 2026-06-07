# Ramsey Faragher[lecture NOTES] Understanding the Basis of the Kalman Filter

Converted from: `Kalman Filter\Kalman Filter Derivation.pdf`


## Page 1

IEEE SIGNAL PROCESSING MAGAZINE   [128]   SEPTEMBER 2012 1053-5888/12/$31.00©2012IEEE
Ramsey Faragher[lecture NOTES]
Understanding the Basis of the Kalman Filter
Via a Simple and Intuitive Derivation
T
his article provides a simple
and intuitive derivation of
the Kalman filter, with the
aim of teaching this useful
tool to students from disci-
plines that do not require a strong
mathematical background. The most
complicated level of mathematics
required to understand this derivation is
the ability to multiply two Gaussian
functions together and reduce the result
to a compact form.
The Kalman filter is over 50 years old
but is still one of the most important
and common data fusion algorithms in
use today. Named after Rudolf E.
Kálmán, the great success of the
Kalman filter is due to its small compu-
tational requirement, elegant recursive
properties, and its status as the optimal
estimator for one-dimensional linear
systems with Gaussian error statistics
[1] . Typical uses of the Kalman filter
include smoothing noisy data and pro-
viding estimates of parameters of inter-
est. Applications include global
positioning system receivers, phase-
locked loops in radio equipment,
smoothing the output from laptop
trackpads, and many more.
From a theoretical standpoint, the
Kalman filter is an algorithm permitting
exact inference in a linear dynamical
system, which is a Bayesian model simi-
lar to a hidden Markov model but where
the state space of the latent variables is
continuous and where all latent and
observed variables have a Gaussian dis-
tribution (often a multivariate Gaussian
distribution). The aim of this lecture
note is to permit people who find this
description confusing or terrifying to
understand the basis of the Kalman fil-
ter via a simple and intuitive derivation.
RELEVANCE
The Kalman filter [2] (and its variants
such as the extended Kalman filter [3]
and unscented Kalman filter [4]) is
one of the most celebrated and popu-
lar data fusion algorithms in the field
of information processing. The most
famous early use of the Kalman filter
was in the Apollo navigation computer
that took Neil Armstrong to the moon,
and (most importantly) brought him
back. Today, Kalman filters are at work
in every satellite navigation device,
every smart phone, and many com-
puter games.
The Kalman filter is typically derived
using vector algebra as a minimum
mean squared estimator [5], an
approach suitable for students confident
in mathematics but not one that is easy
to grasp for students in disciplines that
do not require strong mathematics. The
Kalman filter is derived here from first
principles considering a simple physical
example exploiting a key property of the
Gaussian distribution—specifically the
property that the product of two
Gaussian distributions is another
Gaussian distribution.
PREREQUISITES
This article is not designed to be a thor-
ough tutorial for a brand-new student to
the Kalman filter, in the interests of
being concise, but instead aims to pro-
vide tutors with a simple method of
teaching the concepts of the Kalman fil-
ter to students who are not strong
mathematicians. The reader is expected
to be familiar with vector notation and
terminology associated with Kalman fil-
tering such as the state vector and cova-
riance matrix. This article is aimed at
those who need to teach the Kalman fil-
ter to others in a simple and intuitive
manner, or for those who already have
some experience with the Kalman filter
but may not fully understand its founda-
tions. This article is not intended to be a
thorough and standalone education tool
for the complete novice, as that would
require a chapter, rather than a few
pages, to convey.
PROBLEM STATEMENT
The Kalman filter model assumes that
the state of a system at a time t evolved
from the prior state at time t-1 accord-
ing to the equation

xF x B u wtt t t tt 1=+ + - , (1  )
where
 ■ xt is the state vector containing
the terms of interest for the system
(e.g., position, velocity, heading) at
time t
 ■ ut is the vector containing any
control inputs (steering angle, throt-
tle setting, braking force)
 ■ Ft is the state transition matrix
which applies the effect of each sys-
tem state parameter at time t-1 on
the system state at time t (e.g., the
position and velocity at time t-1
both affect the position at time t)
 ■ Bt is the control input matrix
which applies the effect of each
 Digital Object Identifier 10.1109/MSP .2012.2203621
 Date of publication: 20 August 2012
THE KALMAN FILTER IS
OVER 50 YEARS OLD BUT
IS STILL ONE OF THE MOST
IMPORTANT AND COMMON
DATA FUSION ALGORITHMS
IN USE TODAY.


## Page 2

IEEE SIGNAL PROCESSING MAGAZINE   [129]   SEPTEMBER 2012
 control input parameter in the
 vector ut on the state vector (e.g.,
applies the effect of the throttle set-
ting on the system velocity and
position)
 ■ wt is the vector containing the
process noise terms for each parame-
ter in the state vector. The process
noise is assumed to be drawn from a
zero mean multivariate normal
 distribution with covariance given by
the covariance matrix Q
t.
Measurements of the system can also
be performed, according to the model
  Hx vztt t t=+ , (2)
where
 ■ zt is the vector of measurements
 ■ Ht is the transformation matrix
that maps the state vector parame-
ters into the measurement domain
 ■ vt is the vector containing the
measurement noise terms for each
observation in the measurement vec-
tor. Like the process noise, the mea-
surement noise is assumed to be zero
mean Gaussian white noise with
covariance R
t.
In the derivation that follows, we will
consider a simple one-dimensional track-
ing problem, particularly that of a train
moving along a railway line (see
Figure  1). We can therefore consider
some example vectors and matrices in
this problem. The state vector x
t contains
the position and velocity of the train
  x x
x
t
t
t
= o; E.
The train driver may apply a braking or
accelerating input to the system, which
we will consider here as a function of an
applied force ft and the mass of the train
m. Such control information is stored
within the control vector ut
 u m
f
t
t= .
The relationship between the force
applied via the brake or throttle during
the time period ∆ t (the time elapsed
between time epochs t-1 and t) and the
position and velocity of the train is given
by the following equations:

() ()xx x t m
ft
2
tt t
t
11
2
# T T=+ +-- o
 xx m
ft
tt
t
1
T=+ -oo  .
These linear equations can be written in
matrix form as
 ()x
x
t x
x
t
t
m
f1
01 2
t
t
t
t
t1
1
2T
T
T=+
-
-oo;; ;
>
EE E
H .
And so by comparison with (1), we can
see for this example that

tT
FB ()t t1
01 andtt
2T T==
2
;
>
E
H .
The true state of the system xt cannot be
directly observed, and the Kalman filter
provides an algorithm to determine an
estimate
xtt  by combining models of the
system and noisy measurements of cer-
tain parameters or linear functions of
parameters. The estimates of the param-
eters of interest in the state vector are
therefore now provided by probability
density functions (pdfs), rather than dis-
crete values. The Kalman filter is based
on Gaussian pdfs, as will become clear
following the derivation outlined below
in the “Solutions” section. To fully
describe the Gaussian functions, we
need to know their variances and covari-
ances, and these are stored in the covari-
ance matrix P
t. The terms along the
main diagonal of Pt are the variances
associated with the corresponding terms
in the state vector. The off-diagonal
terms of P
t provide the covariances
between terms in the state vector. In the
case of a well-modeled, one-dimensional
linear system with measurement errors
drawn from a zero-mean Gaussian distri-
bution, the Kalman filter has been
shown to be the optimal estimator [1].
In the remainder of this article, we will
derive the Kalman filter equations that
allow us to recursively calculate
xtt  by
combining prior knowledge, predictions
from systems models, and noisy mea-
surements.
The Kalman filter algorithm involves
two stages: prediction and measure-
ment update. The standard Kalman fil-
ter equations for the prediction stage are

xF x B utt t t t t t11 1=+;; -- -tt  (3)
 PF P F Qtt t t t t t11 1
T=+;; -- - , (4)
where Qt is the process noise covariance
matrix associated with noisy control
inputs. Equation (3) was derived explic-
itly in the discussion above. We can
derive (4) as follows. The variance asso-
ciated with the prediction
xtt 1; -t  of an
unknown true value xt  is given by
 [( ) ( ) ]Px x x xE,tt t tt t tt
T
11 1=- -;; ;-- - tt
and taking the difference between (3)
and (1) gives
Prediction (Estimate)
Measurement (Noisy)
0 r
[FIG1] This figure shows the one-dim ensional system under consideration.


## Page 3

IEEE SIGNAL PROCESSING MAGAZINE   [130]   SEPTEMBER 2012
[lecture NOTES] continued
 ()xx F x x wtt t t t t t 11 1-= - +;; -- -tt

[( ( )
)( ( )
)]
PF x x
Fx x
E
w
w
tt t t t
tt t t
t
T
11 1 1
11 1
&
#
=-
+-
+
;;
;
-- - -
-- -
t
t
[( )
() ]
[(
)]
[
]
[] .
Fx x
xx
FF x
xw
wx
xF
ww
E
E
E
E
tt t
tt t
t
tt t
tt
tt
t t
11 1
11 1
1
11
1
11
T
T
T
TT
T
#
#
=-
-
+
-
+
-
+
;
;
;
;
-- -
-- -
-
--
-
--
t
t
t
t
Noting that the state estimation errors
and process noise are uncorrelated
 [( ) ]
()
Ex x w
Ew x x 0
tt t t
T
tt tt
T
11 1
11 1
-
=-=
;
;
-- -
-- -
t
t6 @

[( ) (
)] [ ]
.
PF x x x
xF w w
PF P F Q
E
E
tt t t t t
tt t t
tt t t t
11 1 1 1
11
11 1
TT T
T
&
&
=-
-+
=+
;;
;
;;
-- - - -
--
-- -
t
t
The measurement update equations are
given by
 xH x )(xK z tt ttt tt tt 11=+ -;; ; --tt t  (5)
 PP K H Ptt tt t t 1 tt 1=-;; - ; - , (6)
where
  KPH H P HR () .TT
tt t t tt t t t11
1=+ ;; --
-  (7)
In the remainder of this article, we will
derive the measurement update equa-
tions [(5)–(7)] from first principles.
SOLUTIONS
The Kalman filter will be derived here
by considering a simple one-dimension-
al tracking problem, specifically that of
a train is moving along a railway line. At
every measurement epoch we wish to
know the best possible estimate of the
location of the train (or more precisely,
the location of the radio antenna mount-
ed on the train roof). Information is avail-
able from two sources: 1) predictions
based on the last known position and
velocity of the train and 2) measurements
from a radio ranging system deployed at
the track side. The information from the
predictions and measurements are com-
bined to provide the best possible estimate
of the location of the train. The system is
shown graphically in Figure 1.
The initial state of the system (at
time t = 0 s) is known to a reasonable
accuracy, as shown in Figure 2. The
location of the train is given by a
Gaussian pdf. At the next time epoch
()t 1s= , we can estimate the new posi-
tion of the train, based on known limita-
tions such as its position and velocity at
t = 0, its maximum possible acceleration
and deceleration, etc. In practice, we may
have some knowledge of the control
inputs on the brake or accelerator by the
driver. In any case, we have a prediction of
the new position of the train, represented
in Figure 3 by a new Gaussian pdf with a
new mean and variance. Mathematically
this step is represented by (1). The vari-
ance has increased [see (2)], representing
our reduced certainty in the accuracy of
our position estimate compared to t = 0,
due to the uncertainty associated with any
process noise from accelerations or decel-
erations undertaken from time t = 0 to
time t = 1.
[FIG2] The initial  knowledge of the system at time t = 0. The red Gaussian distribution represents the pdf providing the initial
confidence in the estimate of the position of the train. The arrow pointing to the right represents the known initial velocity of
the train.
??????
Prediction (Estimate)
[FIG3] Here, the predict ion of the location of the train at time t = 1 and the level of uncertainty in that prediction is shown. The
confidence in the knowledge of the position of the train has decreased, as we are not certain if the train has undergone any
accelerations or decelerations in the intervening period from t = 0 to t = 1.
THE BEST ESTIMATE
WE CAN MAKE OF THE
LOCATION OF THE TRAIN IS
PROVIDED BY COMBINING
OUR KNOWLEDGE FROM
THE PREDICTION AND THE
MEASUREMENT.


## Page 4

IEEE SIGNAL PROCESSING MAGAZINE   [131]   SEPTEMBER 2012
At t = 1, we also make a measure-
ment of the location of the train using
the radio positioning system, and this is
represented by the blue Gaussian pdf in
Figure 4. The best estimate we can make
of the location of the train is provided by
combining our knowledge from the pre-
diction and the measurement. This is
achieved by multiplying the two corre-
sponding pdfs together. This is repre-
sented by the green pdf in Figure 5.
A key property of the Gaussian function
is exploited at this point: the product of two
Gaussian functions is another Gaussian
function. This is critical as it permits an
endless number of Gaussian pdfs to be
multiplied over time, but the resulting
function does not increase in complexity or
number of terms; after each time epoch the
new pdf is fully  represented by a Gaussian
function. This  is the key to the elegant
recursive properties of the Kalman filter.
The stages described above in the fig-
ures are now considered again mathe-
matically to derive the Kalman filter
measurement update equations.
The prediction pdf represented by
the red Gaussian function in Figure 3 is
given by the equation
 ()yr e
2
1;,
()r
11 1
1
2 2 1
2
1 2
_
r
nv
v
v
n- -
. (8)
The measurement pdf represented by
the blue Gaussian function in Figure 4
is given by
 ()yr e
2
1;,
()r
22 2
2
2 2 2
2
2 2
_v
r
n
v
v
n- -
. (9)
The information provided by these two pdfs
is fused by multiplying the two  together,
i.e., considering the prediction and the
measurement together (see Figure 5). The
new pdf representing the fusion of the
information from the prediction and mea-
surement, and our best current estimate of
the system, is therefore given by the prod-
uct of these two Gaussian functions
(, )
.
yr
e
,
2
1
2
1
2
1
;,
() ()
((
r r
rr
1122
1
2 2
2
2 2
1
2
2
2 22
fused
))
1
2
1 2
2
2
2 2
1
2
1
2
2
222
rr
r
nvnv
vv
vv
=
v
n
v
n
v
n
v
n
- - - -
- - + -
ee #=
eo


(10)
The quadratic terms in this new
function can expanded and then the
whole expression rewritten in Gaussian
form
()r n-
()
2
yr
1
;,
2 2
fused fused fused
fused
2
2
fused
fused
r
nv
v
v
-
e= , (11)
where

()
1
2
2
2
1 2
2
2 1
2
1
1
2
2
2
1
2
21
fusedn
vv
nv nv
n
vv
vn n
= +
+
=+ +
-

(12)
and
 2
1
2
2
2
1
2
2
2
1
2
1
2
2
2
1
4
fusedv
vv
vv v
vv
v= + =- + .
 (13)
These last two equations represent the
measurement update steps of the
Kalman filter algorithm, as will be
shown explicitly below. However, to
present a more general case, we need to
consider an extension to this example.
In the example above, it was assumed
that the predictions and measurements
were made in the same coordinate frame
and in the same units. This has resulted
in a particularly concise pair of
??????
Measurement (Noisy)
Prediction (Estimate)
[FIG4] Shows the measur ement of the location of the train at time t = 1 and the level of uncertainty in that noisy measurement,
represented by the blue Gaussian pdf. The combined knowledge of this system is provided by multiplying these two pdfs
together. ???
Measurement (Noisy)
Prediction (Estimate)
[FIG5] Shows the new pdf (green) generated by multiplying the pdfs associated with the prediction and measurement of the
train’s location at time t = 1. This new pdf provides the best estimate of the location of the train, by fusing the data from the
prediction and the measurement.
A KEY PROPERTY OF THE
GAUSSIAN FUNCTION IS
EXPLOITED AT THIS POINT:
THE PRODUCT OF TWO
GAUSSIAN FUNCTIONS
IS ANOTHER GAUSSIAN
FUNCTION.


## Page 5

IEEE SIGNAL PROCESSING MAGAZINE   [132]   SEPTEMBER 2012
[lecture NOTES] continued
 equations representing the prediction
and measurement update stages. It is
 important to note however that in reality
a function is usually required to map
predictions and measurements into the
same domain. In a more realistic exten-
sion to our example, the position of the
train will be  predicted directly as a new
distance along the railway line in units of
meters, but the time of flight measure-
ments are recorded in units of seconds.
To allow the prediction and measure-
ment pdfs to be multiplied together, one
must be converted into the domain of
the other, and it is standard practice to
map the predictions into the measure-
ment domain via the transformation
matrix H
t.
We now revisit (8) and (9) and, instead
of allowing y1 and y2 to both represent val-
ues in meters along the railway track, we
consider the distribution y
2 to represent
the time of flight in seconds for a radio
signal propagating from a transmitter
positioned at x = 0 to the antenna on the
train. The spatial prediction pdf y
1 is con-
verted into the measurement domain by
scaling the function by c, the speed of
light. Equations (8) and (9) therefore must
be rewritten as

()ys c e
2
1;,,
C
c
s c
11 1 2 21
1 2
1 2
_
r
nv v v
n
-
-
^
`
c
h
j
m
 (14)
and
 ()ys e
2
1;,
s
22 2
2
2 2 2
2
2 2
_
r
nv
v
v
n- -^h
,
 (15)
where both distributions are now defined
in the measurement domain, radio sig-
nals propagate along the time “ s” axis,
and the measurement unit is the second.
Following the derivation as before
we now find

cc
c
cc1
1 2
2
2
1 2
2
1
fused
v
nn
v
v n n
=+
+
-
`
` c
j
j m
.
c
c
c
1
1 2
2
2
1
2
2
1
fused& $nn v v
v
n n=+
+
-
J
L
K
K
KK
`
c
N
P
O
O
OO
j
m
 (16)
Substituting Hc 1=  and ()KH 1
2v=
H2 2
2
2
1vv+^h  results in
  KH12 1fused $nn n n=+ - ^h . (17)
Similarly the fused variance estimate
becomes
 c c
c
c
2
2
1 2
1 2
2
2
1 4
fusedv v
v v
v
=-
+
`
`
`
j
j
j

c
c
c1
2
1
2
2
2
1
2
1
2
2fused& vv v v
v
v=-
+
J
L
K
K
KK
`
N
P
O
O
OO
j
.
 KH1
2
1
2vv=-  (18)
We can now compare certain terms
resulting from this scalar derivation
with the standard vectors and matrices
used in the Kalman filter algorithm:
 ■ xttfused "n ;t : the state vector fol-
lowing data fusion
 ■ xtt11"n -;t : the state vector before
data fusion, i.e., the prediction
 ■ Ptt
2
fused "v ; : the covariance matrix
(confidence) following data fusion
 ■ Ptt11
2 "v -; : the covariance matrix
(confidence) before data fusion
 ■ zt2 "n : the measurement vector
 ■ Rt2
2 "v : the uncertainty matrix
associated with a noisy set of mea-
surements
 ■ HH t" : the transformation matrix
used to map state vector parameters
into the measurement domain
 ■  KK H
H
t2
1
2
2
2
1
2
"
vv
v= +
PH H PH R()TT
tt t tt t t t11
1=+ ;; --
- :
the Kalman gain.
It is now easy to see how the stan-
dard Kalman filter equations relate to
(17) and (18) derived above:

H
H H1 2
1
2
2
2
1
2
21fused $nn
vv
v nn=+ + -e ^o h
xx K z H xtt tt t t t tt 11" =+=;; ; --tt t ^h
 H
H H2
1
2
2
1
2
2
2
1
2
1
2
fusedvv
vv
v v=- +eo
 PP K H Ptt tt t t tt 11" =-;; ; -- .
CONCLUSIONS
The Kalman filter can be taught using a
simple derivation involving scalar math-
ematics, basic algebraic manipulations,
and an easy-to-follow thought experi-
ment. This approach should permit stu-
dents lacking a strong mathematical
interest to understand the core mathe-
matics underlying the Kalman filter in
an intuitive manner and to understand
that the recursive property of the filter
are provided by the unique multiplica-
tive property of the Gaussian function.
AUTHOR
Ramsey Faragher  (ramsey@cantab.net)
is a principal scientist at the BAE
Systems Advanced Technology Centre,
United Kingdom.
REFERENCES
[1] B. D. O. Anderson and J. B. Moore, Optimal
Filtering. New York: Dover, 2005.
[2] R. E. Kalman, “A new approach to linear filtering
and prediction problems,” J. Basic Eng., vol. 82, no.
1, pp. 35–45, Mar. 1960.
[3] P. D. Groves, Principles of GNSS, Inertial, and
Multisensor Integrated Navigation Systems .
Norwood, MA: Artech House, 2008.
[4] S. J. Julier and J. K. Uhlmann, “Unscented filter-
ing and nonlinear estimation,” Proc. IEEE , vol. 92,
no. 3, pp. 401–422, 2004.
[5] J. Bibby and H. Toutenburg, Prediction and
Improved Estimation in Linear Models . New York:
Wiley, 1977. [ SP]
THE KALMAN FILTER CAN
BE TAUGHT USING A SIMPLE
DERIVATION INVOLVING
SCALAR MATHEMATICS,
BASIC ALGEBRAIC
MANIPULATIONS, AND
AN EASY-TO-FOLLOW
THOUGHT EXPERIMENT.
