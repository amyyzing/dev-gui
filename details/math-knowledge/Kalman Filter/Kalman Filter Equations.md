# Kalman Filter Kalman Filter

Converted from: `Kalman Filter\Kalman Filter Equations.pdf`


## Page 1

Kalman Filter


## Page 2

Kalman Filter
Predict:
Update:
x k |k − 1
= F k x k − 1 |k − 1
+ B k u k
P k |k − 1
= F k P k − 1 |k − 1
F
T
k
+ Q
K = P k |k − 1
H
T
k
(H k P k |k − 1
H
T
k
+ R )
− 1
x k |k
= x k |k − 1
+ K (z k − H k x k |k − 1
)
P k |k
=( I − KH k )P k |k − 1


## Page 3

Gaussian (Normal) Distribution•Completely described by N(µ,!)–Mean µ–Standard deviation !,  variance ! 2
!
1
" 2 #
e
$ ( x$ µ )
2
/ 2"
2


## Page 4

The Central Limit Theorem•The sum of many random variables–with the same mean, but–with arbitrary conditional density functions,    converges to a Gaussian density function.•If a model omits many small unmodeledeffects, then the resulting error shouldconverge to a Gaussian density function.


## Page 5

Estimating a Value•Suppose there is a constant value x.–Distance to wall; angle to wall; etc.•At time t1, observe value z1 with variance•The optimal estimate is                  withvariance
!
"1
2
!
ˆ x (t1
)= z1
!
"1
2


## Page 6

A Second Observation•At time t2, observe value z2 with variance
!
" 2
2


## Page 7

Merged Evidence


## Page 8

Update Mean and Variance•Weighted average of estimates.•The weights come from the variances.–Smaller variance = more certainty
!
ˆ x (t
2
) = Az
1
+ Bz
2
!
ˆ x (t2
)=
" 2
2
" 1
2
+" 2
2
#
$
%
%
&
'
(
(
z1
+
"1
2
"1
2
+ " 2
2
#
$
%
%
&
'
(
(
z2
!
1
"
2
(t2
)
=
1
" 1
2
+
1
" 2
2
!
A + B = 1


## Page 9

From Weighted Averageto Predictor-Corrector•Weighted average:
•Predictor-corrector:
•This version can be applied “recursively”.
!
ˆ x (t
2
) = Az
1
+ Bz
2
= (1" K )z
1
+ K z
2
!
ˆ x (t
2
) = z
1
+ K (z
2
" z
1
)
!
= ˆ x (t
1
)+ K(z
2
" ˆ x (t
1
))


## Page 10

Predictor-Corrector•Update best estimate given new data
•Update variance:
!
ˆ x (t
2
) = ˆ x (t
1
)+ K (t
2
)(z
2
" ˆ x (t
1
))
!
K (t2
) =
" 1
2
" 1
2
+" 2
2
!
"
2
(t
2
) = "
2
(t
1
) # K (t
2
)"
2
(t
1
)
!
= (1 " K (t
2
)) #
2
(t
1
)


## Page 11

Static to Dynamic•Now suppose x changes according to
!
˙ x = F(x,u,")= u+" (N (0,#"
))


## Page 12

Dynamic Prediction•At t2 we know•At t3 after the change, before an observation.
•Next, we correct this prediction with theobservation at time t3.
!
ˆ x (t3
"
)= ˆ x (t2
)+ u[t3
" t2
]
!
"
2
(t3
#
)= "
2
(t2
)+ "$
2
[t3
# t2
]
!
ˆ x (t2
) "
2
(t2
)


## Page 13

Dynamic Correction•At time t3 we observe z3 with variance•Combine prediction with observation.
!
" 3
2
!
ˆ x (t
3
) = ˆ x (t
3
"
)+ K (t
3
)( z
3
" ˆ x (t
3
"
))
!
K (t3
) =
"
2
(t3
#
)
"
2
(t3
#
)+ " 3
2
!
"
2
(t
3
) = (1 # K (t
3
))"
2
(t
3
#
)


## Page 14

Qualitative Properties
•Suppose measurement noise         is large.–Then K(t3) approaches 0, and the measurementwill be mostly ignored.•Suppose prediction noise              is large.–Then K(t3) approaches 1, and the measurementwill dominate the estimate.
!
K (t3
) =
"
2
(t3
#
)
"
2
(t3
#
)+" 3
2
!
ˆ x (t3
)= ˆ x (t3
"
)+ K (t3
)( z3
" ˆ x (t3
"
))
!
"3
2
!
"
2
(t3
#
)


## Page 15

Kalman Filter•Takes a stream of observations, and adynamical model.•At each step, a weighted average between–prediction from the dynamical model–correction from the observation.•The Kalman gain K(t) is the weighting,–based on the variances            and•With time, K(t) and           tend to stabilize.
!
"
2
(t)
!
"#
2
!
"
2
(t)


## Page 16

Simpliﬁcations•We have only discussed a one-dimensionalsystem.–Most applications are higher dimensional.•We have assumed the state variable isobservable.–In general, sense data give indirect evidence.
•We will discuss the more complex case next.
!
˙ x = F(x,u,"1
)= u + "1
!
z = G (x,"2
) = x +"2


## Page 17

Up To Higher Dimensions•Our previous Kalman Filter discussion wasof a simple one-dimensional model.•Now we go up to higher dimensions:–State vector:–Sense vector:–Motor vector:•First, a little statistics.
!
x " #
n
!
z " #
m
!
u " #
l


## Page 18

Expectations•Let x be a random variable.•The expected value E[x] is the mean:
–The probability-weighted mean of all possiblevalues.  The sample mean approaches it.•Expected value of a vector x is by component.!
E[x]=xp(x)dx"#x =1Nxi1
N$

!
E[x]= x =[x 1
,L x n
]
T


## Page 19

Variance and Covariance•The variance is E[ (x-E[x])2 ]
•Covariance matrix is E[ (x-E[x])(x-E[x])T ]
–Divide by N!1 to make the sample variance anunbiased estimator for the population variance.
!
"
2
= E[(x# x )
2
]=
1
N
(xi
# x )
2
1
N
$
!
Cij
=
1
N
(xik
" x i
)( xjk
" x j
)
k=1
N
#


## Page 20

Biased and Unbiased Estimators•Strictly speaking, the sample variance
   is a biased estimate of the populationvariance.  An unbiased estimator is:
•But:  “If the difference between N and N!1ever matters to you, then you are probablyup to no good anyway …”  [Press, et al]
!
"
2
= E[(x# x )
2
]=
1
N
(xi
# x )
2
1
N
$
!
s2=1N"1(xi"x )2
1
N#


## Page 21

Covariance Matrix•Along the diagonal, Cii are variances.•Off-diagonal Cij are essentially correlations.

!
C1,1="12 C1,2 C1,N
C2,1 C2,2="22
OMCN,1 LCN,N="N2
#
$
% % % %
&
'
( ( ( (


## Page 22

Independent Variation•x and y areGaussian randomvariables  (N=100)•Generated with!x=1    !y=3•Covariance matrix:
!
Cxy=0.900.440.448.82" # $ % & '


## Page 23

Dependent Variation•c and d are randomvariables.•Generated withc=x+y     d=x-y•Covariance matrix:
!
Ccd=10.62"7.93"7.938.84# $ % & ' (


## Page 24

Discrete Kalman Filter•Estimate the state               of a linearstochastic difference equation–process noise w is drawn from N(0,Q), withcovariance matrix Q.•with a measurement–measurement noise v is drawn from N(0,R), withcovariance matrix R.•A, Q are nxn.  B is nxl. R is mxm.  H is mxn.
!
xk
= A xk"1
+ B uk
+ w k"1
!
x " #
n
!
z " #
m
!
zk
= H x k
+ vk


## Page 25

Estimates and Errors•             is the estimated state at time-step k.•              after prediction, before observation.•Errors:•Error covariance matrices:
•Kalman Filter’s task is to update
!
ˆ x k
" #
n
!
ˆ x k
"
# $
n
!
ek
"
= xk
" ˆ x k
"
ek
= xk
" ˆ x k
!
Pk
"
= E [ek
"
ek
"
T
]
Pk
= E[ek
ek
T
]
!
ˆ x k
Pk


## Page 26

Time Update (Predictor)•Update expected value of x•Update error covariance matrix P
•Previous statements were simpliﬁedversions of the same idea:
!
ˆ x k
"
= Aˆ x k"1
+ Buk
!
Pk
"
= AP k"1
A
T
+ Q
!
ˆ x (t3
"
)= ˆ x (t2
)+ u[t3
" t2
]
!
"
2
(t3
#
)= "
2
(t2
)+ "$
2
[t3
# t2
]


## Page 27

Measurement Update (Corrector)•Update expected value–innovation is•Update error covariance matrix•Compare with previous form
!
ˆ x k
= ˆ x k
"
+ K k
(zk
" H ˆ x k
"
)
!
zk
" H ˆ x k
"
!
Pk
= (I" K k
H )Pk
"
!
ˆ x (t
3
) = ˆ x (t
3
"
)+ K (t
3
)( z
3
" ˆ x (t
3
"
))
!
"
2
(t
3
) = (1 # K (t
3
))"
2
(t
3
#
)


## Page 28

The Kalman Gain•The optimal Kalman gain Kk is
•Compare with previous form
!
K k
= Pk
"
H
T
(H Pk
"
H
T
+ R)
"1
!
=
Pk
"
H
T
H Pk
"
H
T
+ R
!
K (t3
) =
"
2
(t3
#
)
"
2
(t3
#
)+ " 3
2


## Page 29

Extended Kalman Filter•Suppose the state-evolution andmeasurement equations are non-linear:
–process noise w is drawn from N(0,Q), withcovariance matrix Q.–measurement noise v is drawn from N(0,R),with covariance matrix R.
!
xk
= f(xk"1
,uk
)+ w k"1
!
zk
= h(x k
)+ vk


## Page 30

The Jacobian Matrix•For a scalar function y=f(x),•For a vector function y=f(x),
!
"y = # f (x)"x

!
"y = J"x =
"y1
M
"yn
#
$
%
%
%
&
'
(
(
(
=
)f1
)x1
(x) L
)f1
)xn
(x)
M M
)fn
)x1
(x) L
)fn
)xn
(x)
#
$
%
%
%
%
%
%
&
'
(
(
(
(
(
(
*
"x1
M
"xn
#
$
%
%
%
&
'
(
(
(


## Page 31

Linearize the Non-Linear•Let A be the Jacobian of f with respect to x.
•Let H be the Jacobian of h with respect to x.
•Then the Kalman Filter equations arealmost the same as before!
!
A ij
=
"fi
"x j
(xk#1
,uk
)
!
H ij
=
"hi
"x j
(x k
)


## Page 32

EKF Update Equations•Predictor step:
•Kalman gain:•Corrector step:
!
ˆ x k
"
= f(ˆ x k"1
,uk
)
!
Pk
"
= AP k"1
A
T
+ Q
!
K k
= Pk
"
H
T
(H Pk
"
H
T
+ R)
"1
!
ˆ x k
= ˆ x k
"
+ K k
(zk
" h (ˆ x k
"
))
!
Pk
= (I" K k
H )Pk
"


## Page 33

Linearized Motion Model
for a Robot
R
X
Y
ω
xy
G
v


## Page 34

Linearized Motion Model
for a Robot
R
X
Y
ω
xy
G
v
From a robot-centric
perspective, the
velocities look like this:


## Page 35

Linearized Motion Model
for a Robot
R
X
Y
ω
xy
G
v
From a robot-centric
perspective, the
velocities look like this:
From the global
perspective, the
velocities look like this:


## Page 36

Linearized Motion Model
for a Robot
R
X
Y
ω
xy
G
v
From a robot-centric
perspective, the
velocities look like this:
From the global
perspective, the
velocities look like this:
The discrete time state
estimate (including noise)
looks like this:


## Page 37

Linearized Motion Model
for a Robot
R
X
Y
ω
xy
G
v
From a robot-centric
perspective, the
velocities look like this:
From the global
perspective, the
velocities look like this:
The discrete time state
estimate (including noise)
looks like this:
Problem!  We don’t know
linear and rotational velocity
errors.  The state estimate
will rapidly diverge if this is
the only source of
information!


## Page 38

Linearized Motion Model
for a Robot
Now, we have to compute the covariance matrix propagation
equations.


## Page 39

Linearized Motion Model
for a Robot
The indirect Kalman filter derives the pose equations from the
estimated error of the state:
Now, we have to compute the covariance matrix propagation
equations.


## Page 40

Linearized Motion Model
for a Robot
The indirect Kalman filter derives the pose equations from the
estimated error of the state:
In order to linearize the system, the following small-angle
assumptions are made:
Now, we have to compute the covariance matrix propagation
equations.


## Page 41

Linearized Motion Model
for a Robot
From the error-state propagation equation, we can obtain the
State propagation and noise input functions F and G :
From these values, we can easily compute the standard
covariance propagation equation:


## Page 42

Sensor Model for a Robot with
a Perfect Map
R
X
Y
xy
G
L
z


## Page 43

Sensor Model for a Robot with
a Perfect Map
R
X
Y
xy
G
L
z
From the robot, the
measurement looks
like this:


## Page 44

Sensor Model for a Robot with
a Perfect Map
R
X
Y
xy
G
L
z
From the robot, the
measurement looks
like this:
From a global
perspective, the
measurement looks
like:


## Page 45

Sensor Model for a Robot with
a Perfect Map
R
X
Y
xy
G
L
z
From the robot, the
measurement looks
like this:
From a global
perspective, the
measurement looks
like:
The measurement equation is nonlinear and must also be linearized!


## Page 46

Sensor Model for a Robot with
a Perfect Map
Now, we have to compute the linearized sensor function.  Once
again, we make use of the indirect Kalman filter where the error
in the reading must be estimated.


## Page 47

Sensor Model for a Robot with
a Perfect Map
Now, we have to compute the linearized sensor function.  Once
again, we make use of the indirect Kalman filter where the error
in the reading must be estimated.
In order to linearize the system, the following small-angle
assumptions are made:


## Page 48

Sensor Model for a Robot with
a Perfect Map
Now, we have to compute the linearized sensor function.  Once
again, we make use of the indirect Kalman filter where the error
in the reading must be estimated.
In order to linearize the system, the following small-angle
assumptions are made:
The final expression for the error in the sensor reading is:


## Page 49

Slides
•Slides were taken from:
•http://www.cs.utexas.edu/~pstone/Courses/
395Tfall05/resources/
•www.cs.cmu.edu/~robosoccer/cmrobobits/
lectures/Kalman.ppt
