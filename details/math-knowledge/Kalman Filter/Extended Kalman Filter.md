# 2.160 System Identification, Estimation, and Learning Lecture Notes No. 7

Converted from: `Kalman Filter\Extended Kalman Filter.pdf`


## Page 1

2.160 System Identification, Estimation, and Learning
Lecture Notes No. 7
March 6, 2006
4.9 Extended Kalman Filter
Process
Model
)
w
u
yv
+
_
y ˆ
In many practical problems, the process dynamics are nonlinear.
Dynamics
Kalman Gain &
Covariance Update
(Linearized
If the process is nonlinear but smooth, its linearized approximation may be used for
the process model.
Extension to non-linear system using linearization
Consider a non-linear, continuous system
( , , (x = t u x f ) + t w ) … n − dim ( 8 7 )
,y = t x h (() + t v ) … l − dim ( 8 8 )
f (.), and h(.) : known but non-linear, differentiable functions
u : input (deterministic forcing term; assumed zero)
w , v : uncorrelated process and measurement noises
( [ (E [ t w )] = 0 , t v E )] = 0
T T T() 0 t ≠ s v t v E (s )] =  ()E [ w t w (s )] =  [ () 0 t ≠ s E [ v t w (s )] = 0
Q t = s Q t = s
The original Kalman filter is not applicable to this class of non-linear systems.
1


## Page 2

Approach Linearize the non-linear system around the state that is either:
1) Pre-determined…linearized Kalman filter
e.g. a trajectory to track.
or
2) Estimated in real-time using on-line measurement
…Extended Kalman Filter
4.9.1 Linearized Kalman Filter
Actual Absence of Process Noise: w = 0
State jectory
j
x ∆ , Discrepancy
Process
track of
Tra
Nominal
Tra ectory
Desired Tra
Feedback control to keep
 the desired
trajectory
j.
Time
t x * () = a nominal trajectory in the state space satisfying the noise-less state equation:
* t x ( * ( ) ,() = t t x f ) ( 8 9 )
        a b s e n c e o f p r o c e s s n o i s e
(Consider derivation ∆ t x )
( * ( (t x ) = t x ) ∆ + t x ) ( 9 0 )
(  * ( (t x ) = t x ) ∆ + t x ) ( 9 1 )
Taylor expansion
*t x f ( ,() = x f ∆ + t x ),
(92)* ∂ f≅ t x f )+ * ∆ x x = x( , ∂ x
where
2


## Page 3

 ∂ f 1 ∂ f 1 " ∂ f 1 
∂ x 1 ∂ x 2 ∂ x 
 n
∂ f 2 % #  (93)∂ f n × n
* =∂ x 1  ∈ R Jacobian x = x∂ x  # % 
∂ f ∂ f 
n n  …
∂ x 1 ∂ xn  *  x = x
Combining (91) and (92)
  (x * ∆ + x = x f *, t ) + ∂ f
* ∆ x + t w ()x
	 ∂ x
↓
* x  from (89)
∂ f∆ x  = * ∆ x + t w ()x∂ x
∂ f n × n
* by t F ) ∈ R(Now replacing ∆ x by x and x∂ x
( ) (x  = x t F + t w ) ( 9 4 )
Similarly, from (88),
×( ) ( (y = x t H + t v ) t H ) = ∂ h
* ∈ R n l
x∂ x
(95)
y ∆ + y = t x h ) + * ( *, ∂ h
* ∆ x + v x∂ x
*
(Replacing y t H )
∆ y by y
( (Note that the above linearized system (94), (95) with t F ) and t H ) are in the same
form as that of the original Kalman filter: linear time-varying systems.
3


## Page 4

4.9.2 Extended Kalman Filter.
) ( j.
) (ˆ
) (* t x
Actual t x Tra
Estimated t x
Nominal (predetermined)
estimated
accurate.
With the measurement of the actual process, the
state  trajectory is deemed to be more
Use the state t x ˆ( ) estimated in
real-time for linearizing the dynamics
the Extended Kalman filter
∂f ˆ,x = x ˆ = F ( t x )∂x
∂h
x = x ˆ = H ( t x )time ˆ, (96)∂x
Namely, matrices F and H are evaluated at x = x ˆ , the estimated values of the state in
ˆ, ˆ,real time, rather than its nominal values. Note that F ( t x ) and H ( t x ) can not be
pre-computed in off-line.
For estimating the output, however, we do not have to use the linearized model; the
nonlinear output function, eq.(88), can be used:
ˆ( ( ˆ( ),t y ) = t t x h ) ( 9 7 )
Initial Conditions: x ˆ0
Initial Conditions: P 0
yMeasurement
Update State Estimate with
Compute Kalman Gain new measurement
( ( −1
ˆ( ˆ( ˆ( )] ), t K ) = t P )H T R t x ) = F t x ) + K [ y − h ( t t x
) (ˆState Estimate t x
Update the linearized model:
Riccati Differential Eq.
∂f ∂h , H =  −1P = FP + PF T − PH T R HP + GQGT F = ∂x x = x ˆ ∂x x = x ˆ
Extended Kalman Filter
A critical issue of this Extended Kalman Filter is instability. As estimated state x ˆ
deviates from the true state, the linearized model becomes inaccurate, which may lead
to an even larger error in state estimation. Care must be taken in implementing
extended Kalman Filter.
4


## Page 5

4.10 Implementation Issues
Kalman filters have been applied to di verse applications since early 60’s. Various
implementation techniques have also been developed. There are three known failure
scenarios in which Kalman filters do not work well:
a) Unobservable or nearly unobservable processes
b) Numerical instability
c) Blind spot
a) Poor observability
The above first issue can be checked with the well-known observability condition.
An alternative, more practical method is to examine the error covariance matrix P(t)
or Pt. If the process is poorly observable, the variance associated with some
unobservable state variables blow up.
If the process is poorly observable, one should change the sensors, or a new sensor
must be added.
b) Numerical instability
Asymmetric covariance: By definition, covariance matrices are symmetry, but
numerically they may become asymmetric, leading to divergence in recursive
computation. Suchan asymmetric covariance often comes from the computation of:
( 4 1 )P = (I − H K )Pt t t t t − 1
n× A A× nwhere Kt ∈ R and Ht ∈ R are not square matrices. Some round off errors yield
an asymmetric posteriori covariance P , although the a priori covariance P| ist t t− 1
symmetry. To resolve this problem, it is efficient to use Joseph’s form (40):
)P = ( I − P KH (I − KH )T + K KR T
t t t − 1 t
which is equivalent to (41), as discussed in Section 4.5.2. Note that both terms on the
right hand side are symmetric matrices.
U-D Factorization: Since the covariance matrix is a real, symmetric, positive-definite
matrix, it can be decomposed to the following U-D Factorization form:
TP = UDU
 d1 0 " 0   1 * " *    #   0 1 * *  ( 9 8 )
D = 

0
#
d2
 , U =  #% # % # 
   
 0 " " dn   0 " 0 1 
where matrix D is a diagonal matrix while matrix U is an upper triangular matrix.
5


## Page 6

This particular form assures the positive definiteness of the covariance matrix, and
implicitly preserves the symmetry of P. Furthermore, if the covariance update formula
of Kalman filter is converted to the on e in the diagonalized space using the upper
triangular matrix U, the dynamic range of computation reduces to 50 % of the original
formulation. See more details in Section 9.5 in Brown and Hwang’s textbook.
c) Blind spot
Consider another failure scenario: When both process noise and measurement noise
covariance matrices are deemed to be very small, the state estimation error-covariance
reduces quickly. This is clear from the Riccati differential equation (62):
 T T −1 TP = FP + PF − R PH HP + GQG
as well as from the covariance propagation and update formulae for discrete Kalman
Tfilter: Pt +1 t = A P A t
T + G Q G , and P = (I − H K )P t t −1 . This implies that the t t t t t t t t
Kalman gain diminishes quickly. Once the Kalman gain diminishes, the subsequent
observations are ignored. In other words, the Kalman filter is decoupled from the
sensors and the real process. This blind spot problem is often triggered by numerical
round off error in computing covariance matrices as well.
4.11 Relationship to Wiener Filter
Prior to Kalman’s work in the early 60’s, N. Wiener made a significant contribution to
the theory of minimum mean-square error filtering in the 40’s. You can see his picture
and accomplishments in the display posted at the Infinite Corridor. The table below
compares Kalman filter and Wiener filter:
Kalman Filter Wiener Filter
State space Frequency domain
Non-stationary Stationary
Continuous and discrete Continuous
Since Wiener filter can be seen as a special case of Kalman filter, the fomer can be
derived from the latter. Assume a stationary, time-invariance process, for which the
state estimation error covariance in Kalman filter reduces to:
dP(t P ) → P = const. = 0∞
dt
T T −1 T0 = FP∞ + F P − R H P HP∞ + GQG ( 6 7 )∞ ∞
Using this, the Kalman filter reduces to
xˆ = x F ˆ + K∞ ( y − x H ˆ) ( 9 8 )
where
6


## Page 7

∞K = −1
∞ R H P T . ( 9 9 )
Taking Laplace transform of (98),
) ( ) (ˆ) (ˆ) (ˆ s y K s x H K s x F s x s ∞∞ +− =
and using (99) yields:
) (][ ) (ˆ 11 1 s y R H P H R H P F sI s x TT ⋅+ − = −
∞
− −
∞ (100)
The above expression is equivalent to Wiener filter.
7
