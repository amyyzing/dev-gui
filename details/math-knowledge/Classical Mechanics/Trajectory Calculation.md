# Trajectory Calculation

Source title: Trajectory Calculation

Converted from: `1.pdf`


## Page 1

�
V
Trajectory Calculation
Lab 2 Lecture Notes
Nomenclature
t time ρ air density
h altitude g gravitational acceleration
V velocity, positive up wards m mass
F total force, positiv e upwards CD drag coeﬃcient
D aerodynamic drag A drag reference area
˙( ) time derivative ( = d( )/dt ) i time index
Trajectory equations
The vertical trajectory of a rocket is described by the altitude and velocity, h(t), V (t), which
are functions of time. These are called state variables of the rocket. Figure 1 shows plots of
these functions for a typical ballistic trajectory. In this case, the initial values for the two
state variables h0 and V0 are prescribed.
h0
h
t
V0
t
V
h
Figure 1: Time traces of altitude and velocity for a ballistic rocket trajectory.
The trajectories are governed by Ordinary Diﬀerential Equations (ODEs) which give the
time rate of change of each state variable. These are obtained from the deﬁnition of velocity,
and from Newton’s 2nd Law.
h˙ = V (1)
V˙ = F/m (2)
Here, F is the total force on the rocket. For the ballistic case with no thrust, F consists only
of the gravity force and the aerodynamic drag force.
− mg − D , if V > 0 F = (3) − mg + D , if V < 0
The two cases in (3) are required because F is deﬁned positive up, so the drag D can subtract
or add to F depending in the sign of V . In contrast, the gravity force contribution − mg is
always negative.
1


## Page 2

A convenient way to express the drag is
1 D = ρV 2 CD A (4) 2
The reference area A used to deﬁne the drag coeﬃcient CD is arbitrary, but a good choice is
the rocket’s frontal area. Although CD in general depends on the Reynolds number, it can
be often assumed to be constant throughout the ballistic ﬂight. Typical values of CD vary
from 0.1 for a well streamlined body, to 1.0 or more for an unstreamlined or bluﬀ body.
With the above total force and drag expressions, the governing ODEs are written as follows.
h˙ = V (5)
V˙ = − g − 1 CD A ρV |V | (6) 2 m
By replacing V 2 with V |V |, the drag contribution now has the correct sign for both the
V > 0 and V < 0 cases.
Numerical Integration
In the presence of drag, or CD > 0, the equation system (5),(6) cannot be integrated analyt­
ically. We must therefore resort to numerical integration.
Discretization
Before numerically integrating equations (5) and (6), we must ﬁrst discretize them. We
replace the continuous time variable t with a time index indicated by the subscript i, so that
the state variables h,V , are deﬁned only at discrete times t0, t 1, t 2 . . . t i . . .
t → ti
h(t) → hi
V (t) → Vi
h
V
t
t
0 1 2
hi
Vi
itt t t ...
0 1 2 itt t t ...
Figure 2: Continuous time traces approximated by discrete time traces.
2


## Page 3

� �
The governing ODEs (5) and (6) can then be used to determine the discrete rates at each
time level.
h˙ i = Vi (7)
V˙i
1 CD A = − g − ρV i|Vi| (8) 2 m
As shown in Figure 3, the rates can also be approximately related to the changes between
two successive times.
h˙ i
dh Δ h h i+1 − hi = ≃ = (9) dt Δ t t i+1 − ti
V˙i
dV Δ V V i+1 − Vi = ≃ = (10) dt Δ t t i+1 − ti
Equating (7) with (9), and (8) with (10), gives the following diﬀerence equations governing
the discrete state variables.
hi+1 − hi = Vi (11)
V
ti+1 − ti
i+1 − Vi 1 CD A = − g − ρV i|Vi| (12) ti+1 − ti 2 m
i i +1t t
i
i
+1
h
h
ih
.
hΔ
Δt
Figure 3: Time rate h˙ approximated with ﬁnite diﬀerence Δ h/ Δ t.
Time stepping (time integration)
Time stepping is the successive application of the diﬀerence equations (11),(12) to generate
the sequence of state variables hi,Vi. To start the process, it is necessary to ﬁrst specify
initial conditions , just like in the continuous case. These initial conditions are simply the
state variable values h0,V0 corresponding to the ﬁrst time index i = 0. Then, given the values
at any i, we can compute values at i+1 by rearranging equations (11) and (12).
hi+1 = hi + Vi (ti+1 − ti) (13)
1 CD A Vi+1 = Vi + − g − ρV i|Vi| (ti+1 − ti) (14) 2 m
Equations (13) and (14) are an example of Forward Euler Integration.
3


## Page 4

i t h V
0
1
i
i +1
input data
formula
...
h V0 0
2
(13) (14)(15)
0
...
Figure 4: Spreadsheet for time stepping. Arrows show functional dependencies.
Numerical implementation
A spreadsheet provides a fairly simple means to implement the time stepping equations (13)
and (14). Such a spreadsheet program is illustrated in Figure 4. The time ti+1 in equations
(13) and (14) is most conveniently deﬁned from ti and a speciﬁed time step , denoted by Δ t.
ti+1 = ti + Δ t (15)
It is most convenient to make this Δ t to have the same value for all time indices i, so that
equation (15) can be coded into the spreadsheet to compute each time value ti+1, as indicated
in Figure 4. This is much easier than typing in each ti value by hand.
More spreadsheet rows can be added to advance the calculation in time for as long as needed.
Typically there will be some termination criteria, which will depend on the case at hand.
For the rocket, suitable termination criteria might be any of the following.
hi+1 < h0 rocket fell back to earth
hi+1 < hi rocket has started to descend
Vi+1 < 0 rocket has started to descend
Accuracy
The discrete sequences hi, Vi are only approximations to the true analytic solutions h(t),
V (t) of the governing ODEs. We can deﬁne discretization errors as
Ehi = hi − h(ti) (16)
EVi = Vi − V (ti) (17)
although h(t) and V (t) may or may not be available. A discretization method which is
consistent with the continuous ODEs has the property that
|E| → 0 as Δ t → 0
The method described above is in fact consistent, so that we can make the errors arbitrarily
small just by making Δ t suﬃciently small.
4
