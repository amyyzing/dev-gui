# A New Extension of the Kalman Filter to Nonlinear Simon J/. Julier Je/

Converted from: `Kalman Filter\Unscented Kalman Filter.pdf`


## Page 1

A New Extension of the Kalman Filter to Nonlinear
Systems
Simon J/. Julier Je/rey K/. Uhlmann
siju/@robots/.ox/.ac/.uk uhlmann/@robots/.ox/.ac/.uk
The Rob otics Researc h Group/, Departmen t of Engineering Science/, The Univ ersit y of Oxford
Oxford/, O X/1 /3PJ/, UK/, Phone/: /+/4/4/-/1/8/6/5/-/2/8/2/1/8/0/, F ax/: /+/4/4/-/1/8/6/5/-/2/7/3/9/0/8
ABSTRA CT
The Kalman /lter/(KF/) is one of the most widely used metho ds for trac king and estimation due to its simplicit y /,
optimalit y /, tractabilit y and robustness/. Ho w ev er/, the application of the KF to nonlinear systems can b e di/cult/.
The most common approac h is to use the Extended Kalman Filter /(EKF/) whic h simply linearises all nonlinear
mo dels so that the traditional linear Kalman /lter can b e applied/. Although the EKF /(in its man y forms/) is a
widely used /ltering strategy /, o v er thirt y y ears of exp erience with it has led to a general consensus within the
trac king and con trol comm unit y that it is di/cult to implemen t/, di/cult to tune/, and only reliable for systems
whic h are almost linear on the time scale of the up date in terv als/.
In this pap er a new linear estimator is dev elop ed and demonstrated/. Using the principle that a set of discretely
sampled p oin ts can b e used to parameterise mean and co v ariance/, the estimator yields p erformance equiv alen t to
the KF for linear systems y et generalises elegan tly to nonlinear systems without the linearisation steps required
b y the EKF/. W e sho w analytically that the exp ected p erformance of the new approac h is sup erior to that of the
EKF and/, in fact/, is directly comparable to that of the second order Gauss /lter/. The metho d is not restricted
to assuming that the distributions of noise sources are Gaussian/. W e argue that the ease of implemen tation and
more accurate estimation features of the new /lter recommend its use o v er the EKF in virtually all applications/.
Keyw ords/: Na vigation/, estimation/, non/-linear systems/, Kalman /ltering/, sampling/.
/1 INTR ODUCTION
Filtering and estimation are t w o of the most p erv asiv e to ols of engineering/. Whenev er the state of a system
m ust b e estimated from noisy sensor information/, some kind of state estimator is emplo y ed to fuse the data from
di/eren t sensors together to pro duce an accurate estimate of the true system state/. When the system dynamics
and observ ation mo dels are linear/, the minim um mean squared error /(MMSE/) estimate ma y b e computed using
the Kalman /lter /. Ho w ev er/, in most applications of in terest the system dynamics and observ ation equations are
nonlinear and suitable extensions to the Kalman /lter ha v e b een sough t/. It is w ell/-kno wn that the optimal solution
to the nonlinear /ltering problem requires that a complete description of the conditional probabilit y densit y is
main tained
/1/4
/. Unfortunately this exact description requires a p oten tially un b ounded n um b er of parameters and
a n um b er of sub optimal appro ximations ha v e b een prop osed
/6 /? /8 /; /1/3 /; /1/6 /; /2/1
/.


## Page 2

Probably the most widely used estimator for nonlinear systems is the extended Kalman /lter /(EKF/)
/2/0 /; /2/2
/.
The EKF applies the Kalman /lter to nonlinear systems b y simply linearising all the nonlinear mo dels so that
the traditional linear Kalman /lter equations can b e applied/. Ho w ev er/, in practice/, the use of the EKF has t w o
w ell/-kno wn dra wbac ks/:
/1/. Linearisation can pro duce highly unstable /lters if the assumptions of lo cal linearit y is violated/.
/2/. The deriv ation of the Jacobian matrices are non trivial in most applications and often lead to signi/can t
implemen tation di/culties/.
In this pap er w e deriv e a new linear estimator whic h yields p erformance equiv alen t to the Kalman /lter for
linear systems/, y et generalises elegan tly to nonlinear systems without the linearisation steps required b y the
EKF/. The fundamen tal comp onen t of this /lter is the unsc ente d tr ansformation whic h uses a set of appropriately
c hosen w eigh ted p oin ts to parameterise the means and co v ariances of probabilit y distributions/. W e argue that
the exp ected p erformance of the new approac h is sup erior to that of the EKF and/, in fact/, is directly comparable
to that of the second order Gauss /lter/. F urther/, the nature of the transform is suc h that the pro cess and
observ ation mo dels can b e treated as /\blac k b o xes/"/. It is not necessary to calculate Jacobians and so the
algorithm has sup erior implemen tation prop erties to the EKF/. W e demonstrate the di/erences in p erformance in
an example application/, and w e argue that the ease of implemen tation and more accurate estimation features of
the new /lter recommend its use o v er the EKF in virtually all applications/.
The structure of this pap er is as follo ws/. In Section /2 w e describ e the problem statemen t for applying a
Kalman /lter to nonlinear systems/. W e argue that the principle problem is the abilit y to predict the state of
the system/. Section /3 in tro duces the unscen ted transformation/. Its prop erties are analysed and a full /ltering
algorithm/, whic h includes the e/ects of pro cess noise/, is dev elop ed/. In Section /4 an example is presen ted/. Using
realistic data/, the comparison of the unscen ted /lter and EKF for the trac king of a reen try b o dy is considered/.
Conclusions are dra wn in Section /5/. A companion pap er
/1/0
/, extends the basic metho d and sho ws that judiciously
selecting additional p oin ts can lead to an y desired lev el of accuracy for an y giv en prior distribution/.
/2 ESTIMA TION IN NONLINEAR SYSTEMS
/2/./1 Problem Statemen t
W e wish to apply a Kalman /lter to a nonlinear discrete time system of the form
x /( k /+ /1/) /= f /[ x /( k /) /; u /( k /) /; v /( k /) /; k /] /; /(/1/)
z /( k /) /= h /[ x /( k /) /; u /( k /) /; k /] /+ w /( k /) /; /(/2/)
where x /( k /) is the n /-dimensional state of the system at timestep k /, u /( k /) is the input v ector/, v /( k /) is the q /-
dimensional state noise pro cess v ector due to disturbances and mo delling errors/, z /( k /) is the observ ation v ector
and w /( k /) is the measuremen t noise/. It is assumed that the noise v ectors v /( k /) and w /( k /)/, are zero/-mean and
E
/
v /( i /) v
T
/( j /)
/
/= /
ij
Q /( i /) /; E
/
w /( i /) w
T
/( j /)
/
/= /
ij
R /( i /) /; E
/
v /( i /) w
T
/( j /)
/
/= /0 /; /8 i/; j/:
The Kalman /lter propagates the /rst t w o momen ts of the distribution of x /( k /) recursiv ely and has a distinctiv e
/\predictor/-corrector/" structure/. Let
/^
x /( i j j /) b e the estimate of x /( i /) using the observ ation information information
up to and including time j /, Z
j
/= /[ z /( /1/) /; /: /: /: /; z /( j /)/]/. The co v ariance of this estimate is P /( i j j /)/. Giv en an estimate
/^
x /( k j k /)/, the /lter /rst predicts what the future state of the system will b e using the pro cess mo del/. Ideally /, the
predicted quan tities are giv en b y the exp ectations
/^
x /( k /+ /1 j k /) /= E
/
f /[ x /( k /) /; u /( k /) /; v /( k /) /; k /] j Z
k
/
/(/3/)
P /( k /+ /1 j k /) /= E
h
f x /( k /+ /1/) /?
/^
x /( k /+ /1 j k /) g f x /( k /+ /1/) /?
/^
x /( k /+ /1 j k /) g
T
j Z
k
i
/: /(/4/)


## Page 3

When f /[ / /] and h /[ / /] are nonlinear/, the precise v alues of these statistics can only b e calculated if the distribution
of x /( k /)/, condition on Z
k
/, is kno wn/. Ho w ev er/, this distribution has no general form and a p oten tially un b ounded
n um b er of parameters are required/. In man y applications/, the distribution of x /( k /) is appro ximated so that only a
/nite and tractable n um b er of parameters need b e propagated/. It is con v en tionally assumed that the distribution
of x /( k /) is Gaussian for t w o reasons/. First/, the distribution is completely parameterised b y just the mean and
co v ariance/. Second/, giv en that only the /rst t w o momen ts are kno wn/, the Gaussian distribution is the least
informativ e
/3
/.
The estimate
/^
x /( k /+ /1 j k /+ /1 /) is giv en b y up dating the prediction with the curren t sensor measuremen t/. In
the Kalman /lter a linear up date rule is sp eci/ed and the w eigh ts are c hosen to minimise the mean squared error
of the estimate/. The up date rule is
/^
x /( k /+ /1 j k /+ /1 /) /=
/^
x /( k /+ /1 j k /) /+ W /( k /+ /1 /) / /( k /+ /1/) /;
P /( k /+ /1 j k /+ /1 /) /= P /( k /+ /1 j k /) /? W /( k /+ /1 /) P
/ /
/( k /+ /1 j k /) W
T
/( k /+ /1 /)
/ /( k /+ /1 /) /= z /( k /+ /1/) /?
/^
z /( k /+ /1 j k /)
W /( k /+ /1 /) /= P
x/
/( k /+ /1 j k /) P
/? /1
/ /
/( k /+ /1 j k /) /:
It is imp ortan t to note that these equations are only a function of the predicted v alues of the /rst t w o momen ts
of x /( k /) and z /( k /) /. Therefore/, the problem of applying the Kalman /lter to a nonlinear system is the abilit y to
predict the /rst t w o momen ts of x /( k /) and z /( k /) /. This problem is a sp eci/c case of a general problem /| to b e
able to calculate the statistics of a random v ariable whic h has undergone a nonlinear transformation/.
/2/./2 The T ransformation of Uncertain t y
The problem of predicting the future state or observ ation of the system can b e expressed in the follo wing
form/. Supp ose that x is a random v ariable with mean
/
x and co v ariance P
xx
/. A second random v ariable/, y is
related to x through the nonlinear function
y /= f /[ x /] /: /(/5/)
W e wish to calculate the mean
/
y and co v ariance P
y y
of y /.
The statistics of y are calculated b y /(i/) determining the densit y function of the transformed distribution and
/(ii/) ev aluating the statistics from that distribution/. In some sp ecial cases /(for example when f /[ / /] is linear/) exact/,
closed form solutions exist/. Ho w ev er/, suc h solutions do not exist in general and appro ximate metho ds m ust b e
used/. In this pap er w e adv o cate that the metho d should yield c onsistent statistics/. Ideally /, these should b e
e/cient and unbiase d /.
The transformed statistics are consisten t if the inequalit y
P
y y
/? E
h
f y /?
/
y g f y /?
/
y g
T
i
/ /0 /(/6/)
holds/. This condition is extremely imp ortan t for the v alidit y of the transformation metho d/. If the statistics are
not consisten t/, the v alue of P
y y
is under /-estimated/. If a Kalman /lter uses the inconsisten t set of statistics/, it
will place to o m uc h w eigh t on the information and under estimate the co v ariance/, raising the p ossibilit y that
the /lter will div erge/. By ensuring that the transformation is consisten t/, the /lter is guaran teed to b e consisten t
as w ell/. Ho w ev er/, consistency do es not necessary imply usefulness b ecause the calculated v alue of P
y y
migh t b e
greatly in excess of the actual mean squared error/. It is desirable that the transformation is e/cien t /| the v alue
of the left hand side of Equation /6 should b e minimised/. Finally /, it is desirable that the estimate is unbiase d or
/
y / E /[ y /]/.
The problem of dev eloping a consisten t/, e/cien t and un biased transformation pro cedure can b e examined b y
considering the T a ylor series expansion of Equation /5 ab out
/
x /. This series can b e expressed /(using rather informal


## Page 4

notation/) as/:
f /[ x /] /= f /[
/
x /+ /
/
/ x /]
/= f /[
/
x /] /+ r
r
r f /
/
/ x /+
/1
/2
r
r
r
/2
f /
/
/ x
/2
/+
/1
/3/!
r
r
r
/3
f /
/
/ x
/3
/+
/1
/4/!
r
r
r
/4
f /
/
/ x
/4
/+ / / /
/(/7/)
where /
/
/ x is a zero mean Gaussian v ariable with co v ariance P
xx
/, and r
r
r
n
f /
/
/ x
n
is the appropriate n th order term
in the m ultidimensional T a ylor Series/. T aking exp ectations/, it can b e sho wn that the transformed mean and
co v ariance are
/
y /= f /[
/
x /] /+
/1
/2
r
r
r
/2
f P
xx
/+
/1
/2
r
r
r
/4
f E
/
/
/
/ x
/4
/
/+ / / / /(/8/)
P
y y
/= r
r
r f P
xx
/( r
r
r f /)
T
/+
/1
/2 / /4/!
r
r
r
/2
f
/
E
/
/
/
/ x
/4
/
/? E
/
/
/
/ x
/2
P
y y
/
/? E
/
P
y y
/
/
/ x
/2
/
/+ P
/2
y y
/
/( r
r
r
/2
f /)
T
/+
/1
/3/!
r
r
r
/3
f E
/
/
/
/ x
/4
/
/( r
r
r f /)
T
/+ / / / /: /(/9/)
In other w ords/, the n th order term in the series for
/
x is a function of the n th order momen ts of x m ultiplied b y
the n th order deriv ativ es of f /[ / /] ev aluated at x /=
/
x /. If the momen ts and deriv ativ es can b e ev aluated correctly
up to the n th order/, the mean is correct up to the n th order as w ell/. Similar commen ts hold for the co v ariance
equation as w ell/, although the structure of eac h term is more complicated/. Since eac h term in the series is scaled
b y a progressiv ely smaller and smaller term/, the lo w est order terms in the series are lik ely to ha v e the greatest
impact/. Therefore/, the prediction pro cedure should b e concen trated on ev aluating the lo w er order terms/.
Linearisation assumes that the second and higher order terms of /
/
/ x in Equation /7 can b e neglected/. Under
this assumption/,
/
y /= f /[
/
x /] /; /(/1/0/)
P
y y
/= r
r
r f P
xx
/( r
r
r f /)
T
/: /(/1/1/)
Comparing these expressions with Equations /8 and /9/, it is clear that these appro ximations are accurate only if
the second and higher order terms in the mean and fourth and higher order terms in the co v ariance are negligible/.
Ho w ev er/, in man y practical situations linearisation in tro duces signi/can t biases or errors/. An extremely common
and imp ortan t problem is the transformation of information b et w een p olar and Cartesian co ordinate systems
/1/0 /; /1/5
/.
This is demonstrated b y the simple example giv en in the next subsection/.
/2/./3 Example
Supp ose a mobile rob ot detects b eacons in its en vironmen t using a range/-optimised sonar sensor/. The sensor
returns p olar information /(range r and b earing / /) and this is to b e con v erted to estimate to Cartesian co ordinates/.
The transformation is/:
/
x
y
/
/=
/
r cos /
r sin /
/
with r
r
r f /=
/
cos / /? r sin /
sin / r cos /
/
/:
The real lo cation of the target is /(/0 /; /1/)/. The di/cult y with this transformation arises from the ph ysical prop erties
of the sonar/. F airly go o d range accuracy /(with /2cm standard deviation/) is traded o/ to giv e a v ery p o or b earing
measuremen t /(standard deviation of /1/5
/
/)/. The large b earing uncertain t y causes the assumption of lo cal linearit y
to b e violated/.


## Page 5

−0.3 −0.2 −0.1 0 0.1 0.2 0.3
0.9
0.92
0.94
0.96
0.98
1
1.02
1.04
True mean: x      EKF mean: o
Figure /1/: The mean and standard deviation el/-
lipses for the actual and linearised form of the
transformation/. The true mean is at / and the
uncertain t y ellipse is solid/. Linearisation calcu/-
lates the mean at / and the uncertain t y ellipse is
dashed/.
T o appreciate the errors whic h can b e caused b y
linearisation/, its v alues of the statistics of /( x/; y /) w ere
compared with those calculated b y the true statistics
whic h are calculated b y Mon te Carlo sim ulation/. Due
to the slo w con v ergence of random sampling metho ds/,
an extremely large n um b er of samples /(/3 /: /5 / /1/0
/6
/) w ere
used to ensure that accurate estimates of the true stat/-
istics w ere obtained/. The results are sho wn in Figure /1/.
This /gure sho ws the mean and /1 / con tours for whic h
are calculated b y eac h metho d/. The /1 / con tour is the
lo cus of p oin ts f y /: /( y /?
/
y /) P
/? /1
y
/( y /?
/
y /) /= /1 g and is a
graphical represen tation of the size and orien tation of
P
y y
/. As can b e seen/, the linearised transformation is
biased and inconsisten t/. This is most pronounced in
the range direction/, where linearisation estimates that
the p osition is /1m whereas in realit y it is /9/6/./7cm/. This
is extremely substan tial/. Linearisation errors e/ect/-
iv ely in tro duce an error whic h is o v er /1/./5 times the
standard deviation of the range measuremen t/. Since it
is a bias whic h arises from the transformation pro cess
itself/, the same error with the same sign will b e com/-
mitted eac h time a co ordinate transformation tak es
place/. Ev en if there w ere no bias/, the transformation
is inconsisten t/. Its ellipse is not long enough in the r direction/. In fact/, the nature of the inconsistency comp ounds
the problem of the biased/-ness/: not only is the estimate or r in error/, but also its estimated mean squared error
is m uc h smaller than the true v alue/.
In practice the inconsistency can b e resolv ed b y in tro ducing additional stabilising noise whic h increases the
size of the transformed co v ariance/. This is one p ossible of wh y EKFs are so di/cult to tune /| su/cien t noise
m ust b e in tro duced to o/set the defects of linearisation/. Ho w ev er/, in tro ducing stabilising noise is an undesirable
solution since the estimate remains biased and there is no general guaran tee that the transformed estimate remains
consisten t or e/cien t/. A more accurate prediction algorithm is required/.
/3 THE UNSCENTED TRANSF ORM
/3/./1 The Basic Idea
Transformation
Nonlinear
Figure /2/: The principle of the unscen ted trans/-
form/.
The unscen ted transformation is a new/, no v el
metho d for calculating the statistics of a random v ari/-
able whic h undergo es a nonlinear transformation/. It is
founded on the in tuition that it is e asier to appr oxim/-
ate a Gaussian distribution than it is to appr oximate
an arbitr ary nonline ar function or tr ansformation
/2/3
/.
The approac h is illustrated in Figure /2/. A set of p oin ts
/(or sigma p oints /) are c hosen so that their sample mean
and sample co v ariance are
/
x and P
xx
/. The nonlinear
function is applied to eac h p oin t in turn to yield a cloud
of transformed p oin ts and
/
y and P
y y
are the statist/-
ics of the transformed p oin ts/. Although this metho d
bares a sup er/cial resem blance to Mon te Carlo/-t yp e


## Page 6

metho ds/, there is an extremely imp ortan t and fundamen tal di/erence/. The samples are not dra wn at random
but rather according to a sp eci/c/, deterministic algorithm/. Since the problems of statistical con v ergence are not
an issue/, high order information ab out the distribution can b e captured using only a v ery small n um b er of p oin ts/.
The n /-dimensional random v ariable x with mean
/
x and co v ariance P
xx
is appro ximated b y /2 n /+ /1 w eigh ted
p oin ts giv en b y
X
/0
/=
/
x W
/0
/= //= /( n /+ / /)
X
i
/=
/
x /+
/
p
/( n /+ / /) P
xx
/
i
W
i
/= /1 /= /2/( n /+ / /)
X
i /+ n
/=
/
x /?
/
p
/( n /+ / /) P
xx
/
i
W
i /+ n
/= /1 /= /2/( n /+ / /)
/(/1/2/)
where / /2 /< /,
/
p
/( n /+ / /) P
xx
/
i
is the i th ro w or column of the matrix square ro ot of /( n /+ / /) P
xx
and W
i
is the
w eigh t whic h is asso ciated with the i th p oin t/. The transformation pro cedure is as follo ws/:
/1/. Instan tiate eac h p oin t through the function to yield the set of transformed sigma p oin ts/,
Y
i
/= f /[ X
i
/] /:
/2/. The mean is giv en b y the w eigh ted a v erage of the transformed p oin ts/,
/
y /=
/2 n
X
i /=/0
W
i
Y
i
/: /(/1/3/)
/3/. The co v ariance is the w eigh ted outer pro duct of the transformed p oin ts/,
P
y y
/=
/2 n
X
i /=/0
W
i
f Y
i
/?
/
y g f Y
i
/?
/
y g
T
/: /(/1/4/)
The prop erties of this algorithm ha v e b een studied in detail elsewhere
/9 /; /1/2
and w e presen t a summary of the
results here/:
/1/. Since the mean and co v ariance of x are captured precisely up to the second order/, the calculated v alues
of the mean and co v ariance of y are correct to the second order as w ell/. This means that the mean is
calculated to a higher order of accuracy than the EKF/, whereas the co v ariance is calculated to the same
order of accuracy /. Ho w ev er/, there are further p erformance b ene/ts/. Since the distribution of x is b eing
appro ximated rather than f /[ / /] /, its series expansion is not truncated at a particular order/. It can b e sho wn
that the unscen ted algorithm is able to partially incorp orate information from the higher orders/, leading to
ev en greater accuracy /.
/2/. The sigma p oin ts capture the same mean and co v ariance irresp ectiv e of the c hoice of matrix square ro ot
whic h is used/. Numerically e/cien t and stable metho ds suc h as the Cholesky decomp osition
/1/8
can b e used/.
/3/. The mean and co v ariance are calculated using standard v ector and matrix op erations/. This means that the
algorithm is suitable for any c hoice of pro cess mo del/, and implemen tation is extremely rapid b ecause it is
not necessary to ev aluate the Jacobians whic h are needed in an EKF/.
/4/. / pro vides an extra degree of freedom to /\/ne tune/" the higher order momen ts of the appro ximation/, and
can b e used to reduce the o v erall prediction errors/. When x /( k /) is assumed Gaussian/, a useful heuristic is to
select n /+ / /= /3/. If a di/eren t distribution is assumed for x /( k /) then a di/eren t c hoice of / migh t b e more
appropriate/.


## Page 7

/5/. Although / can b e p ositiv e or negativ e/, a negativ e c hoice of / can lead to a non/-p ositiv e semide/nite estimate
of P
y y
/. This problem is not uncommon for metho ds whic h appro ximate higher order momen ts or probabilit y
densit y distributions
/8 /; /1/6 /; /2/1
/. In this situation/, it is p ossible to use a mo di/e d form of the prediction algorithm/.
The mean is still calculated as b efore/, but the /\co v ariance/" is ev aluated ab out X
/0
/( k /+ /1 j k /) /: It can b e
sho wn that the mo di/ed form ensures p ositiv e semi/-de/niteness and/, in the limit as /( n /+ / /) /! /0/,
lim
/( n /+ / /) /! /0
/
y /= f /[
/
x /] /+
/1
/2
r
r
r
/2
f P
xx
/; lim
/( n /+ / /) /! /0
P
y y
/= r
r
r f P
xx
/( r
r
r f /)
T
/:
In other w ords/, the algorithm can b e made to p erform exactly lik e the second Order Gauss Filter/, but
without the need to calculate Jacobians or Hessians/.
−0.3 −0.2 −0.1 0 0.1 0.2 0.3
0.9
0.92
0.94
0.96
0.98
1
1.02
1.04
True mean: x      EKF mean: o       Kappa mean: +
Figure /3/: The unscen ted transform as applied to
the measuremen t example/.
The p erformance b ene/ts of using the unscen ted
transform can b e seen in Figure /3 whic h sho ws the
means and /1 / con tours determined b y the di/eren t
metho ds/. The true mean lies at / with a dotted co v/-
ariance con tour/. The p osition of the unscen ted mean
is indicated b y a /? and its con tour is solid/. The linear/-
ised mean is at / and used a dashed con tour/. As can b e
seen the unscen ted mean v alue is the same as the true
v alue /| on the scale of the graph/, the t w o p oin ts lie on
top of one another/. F urther/, the unscen ted transform
is consisten t /| in fact/, its con tour is sligh tly larger
than the true con tour in the r direction/.
Giv en its prop erties of sup erior estimation accuracy
and ease of implemen tation/, the unscen ted transform
is b etter suited than linearisation for /ltering applica/-
tions/. Indeed/, since it can predict the mean and co v ari/-
ance with second order accuracy /, an y /lter whic h uses
the unscen ted transform will ha v e the same p erform/-
ance as the T runcated Second Order Gauss Filter
/1
but
do es not require the deriv ation of Jacobians or Hessi/-
ans/. The next subsection examines the application of
the unscen ted transform to the /ltering problem and dev elops the unsc ente d /lter /.
/3/./2 The Unscen ted Filter
The transformation pro cesses whic h o ccur in a Kalman /lter consist of the follo wing steps/:
/ Predict the new state of the system
/^
x /( k /+ /1 j k /) and its asso ciated co v ariance P /( k /+ /1 j k /) /. This prediction
m ust tak e accoun t of the e/ects of pro cess noise/.
/ Predict the exp ected observ ation
/^
z /( k /+ /1 j k /) and the inno v ation co v ariance P
/ /
/( k /+ /1 j k /)/. This prediction
should include the e/ects of observ ation noise/.
/ Finally /, predict the cross/-correlation matrix P
xz
/( k /+ /1 j k /) /:
These steps can b e easily accommo dated b y sligh tly restructuring the state v ector and pro cess and observ ation
mo dels/. First/, the state v ector is augmen ted with the pro cess and noise terms to giv e an n
a
/= n /+ q dimensional


## Page 8

/1/. The set of sigma p oin ts are created b y applying Equation /1/2 to the augmen ted system giv en b y Equa/-
tion /1/5/.
/2/. The transformed set is giv en b y instan tiating eac h p oin t through the pro cess mo del/,
X
i
/( k /+ /1 j k /) /= f /[ X
a
i
/( k j k /) /; u /( k /) /; k /] /:
/3/. The predicted mean is computed as
/^
x /( k /+ /1 j k /) /=
/2 n
a
X
i /=/0
W
i
X
a
i
/( k /+ /1 j k /) /:
/4/. And the predicted co v ariance is computed as
P /( k /+ /1 j k /)
/2 n
a
X
i /=/0
W
i
f X
i
/( k /+ /1 j k /) /?
/^
x /( k /+ /1 j k /) g f X
i
/( k /+ /1 j k /) /?
/^
x /( k /+ /1 j k /) g
T
/5/. Instan tiate eac h of the prediction p oin ts through the observ ation mo del/,
Z
i
/( k /+ /1 j k /) /= h /[ X
i
/( k /+ /1 j k /) /; u /( k /) /; k /]
/6/. The predicted observ ation is calculated b y
/^
z /( k /+ /1 j k /) /=
/2 n
a
X
i /=/1
W
i
Z
i
/( k /+ /1 j k /) /:
/7/. Since the observ ation noise is additiv e and indep enden t/, the inno v ation co v ariance is
P
/ /
/( k /+ /1 j k /) /= R /( k /+ /1/) /+
/2 n
a
X
i /=/0
W
i
f Z
i
/( k j k /? /1/) /?
/^
z /( k /+ /1 j k /) g f Z
i
/( k j k /? /1 /) /?
/^
z /( k /+ /1 j k /) g
T
/8/. Finally the cross correlation matrix is determined b y
P
xz
/( k /+ /1 j k /) /=
/2 n
a
X
i /=/0
W
i
f X
i
/( k j k /? /1/) /?
/^
x /( k /+ /1 j k /) g f Z
i
/( k j k /? /1/) /?
/^
z /( k /+ /1 j k /) g
T
Bo x /3/./1/: The prediction algorithm using the unscen ted transform/.
v ector/,
x
a
/( k /) /=
/
x /( k /)
v /( k /)
/
/:
The pro cess mo del is rewritten as a function of x
a
/( k /)/,
x /( k /+ /1/) /= f /[ x
a
/( k /) /; u /( k /) /; k /]
and the unscen ted transform uses /2 n
a
/+ /1 sigma p oin ts whic h are dra wn from
/^
x
a
/( k j k /) /=
/
/^
x /( k j k /)
/0
q / /1
/
and P
a
/( k j k /) /=
/
P /( k j k /) P
xv
/( k j k /)
P
xv
/( k j k /) Q /( k /)
/
/: /(/1/5/)
The matrices on the leading diagonal are the co v ariances and o//-diagonal sub/-blo c ks are the correlations
b et w een the state errors and the pro cess noises/. Although this metho d requires the use of additional sigma
p oin ts/, it means that the e/ects of the pro cess noise /(in terms of its impact on the mean and co v ariance/) are
in tro duced with the same order of accuracy as the uncertain t y in the state/. The form ulation also means that


## Page 9

correlated noise sources /(whic h can arise in Sc hmidt/-Kalman /lters
/1/9
/) can b e implemen ted extremely easily /. The
expression for the unscen ted transform is giv en b y the equations in Bo x /3/./1/.
V arious extensions and mo di/cations can b e made to this basic metho d to tak e accoun t of sp eci/c details of
a giv en application/. F or example/, if the observ ation noise is in tro duced in a nonlinear fashion/, or is correlated
with pro cess and//or observ ation noise/, then the augmen ted v ector is expanded to include the observ ation terms/.
This section has dev elop ed the unscen ted transform so that it can b e used in /ltering and trac king applications/.
The next section demonstrates its b ene/ts o v er the EKF for a sample application/.
/4 EXAMPLE APPLICA TION
6350 6400 6450 6500
−200
−100
0
100
200
300
400
500
x1 (km)
x2 (km)
Figure /4/: The reen try problem/. The dashed line
is the sample v ehicle tra jectory and the solid line
is a p ortion of the Earth/'s surface/. The p osition
of the radar is mark ed b y a / /.
In this section w e consider the problem whic h is il/-
lustrated in Figure /4/: a v ehicle en ters the atmosphere
at high altitude and at a v ery high sp eed/. The p osition
of the b o dy is to b e trac k ed b y a radar whic h accurately
measures range and b earing/. This t yp e of problem has
b een iden ti/ed b y a n um b er of authors
/1 /; /2 /; /5 /; /1/7
as b eing
particularly stressful for /lters and trac k ers b ecause of
the strong nonlinearities exhibited b y the forces whic h
act on the v ehicle/. There are three t yp es of forces
whic h act/. The most dominan t is aero dynamic drag/,
whic h is a function of v ehicle sp eed and has a substan/-
tial nonlinear v ariation in altitude/. The second t yp e of
force is gra vit y whic h accelerates the v ehicle to w ards
the cen tre of the earth/. The /nal forces are random
bu/eting terms/. The e/ect of these forces giv es a tra/-
jectory of the form sho wn in Figure /4/: initially the
tra jectory is almost ballistic but as the densit y of the
atmosphere increases/, drag e/ects b ecome imp ortan t
and the v ehicle rapidly decelerates un til its motion is
almost v ertical/. The trac king problem is made more
di/cult b y the fact that the drag prop erties of the
v ehicle migh t b e only v ery crudely kno wn/.
In summary /, the trac king system should b e able to
trac k an ob ject whic h exp eriences a set of complicated/, highly nonlinear forces/. These dep end on the curren t
p osition and v elo cit y of the v ehicle as w ell as on certain c haracteristics whic h are not kno wn precisely /. The /lter/'s
state space consists of the p osition of the b o dy /( x
/1
and x
/2
/)/, its v elo cit y /( x
/3
and x
/4
/) and a parameter of its
aero dynamic prop erties /( x
/5
/)/. The v ehicle state dynamics are
/_x
/1
/( k /) /= x
/3
/( k /)
/_x
/2
/( k /) /= x
/4
/( k /)
/_x
/3
/( k /) /= D /( k /) x
/3
/( k /) /+ G /( k /) x
/1
/( k /) /+ v
/1
/( k /)
/_x
/4
/( k /) /= D /( k /) x
/4
/( k /) /+ G /( k /) x
/2
/( k /) /+ v
/2
/( k /)
/_x
/5
/( k /) /= v
/3
/( k /)
/(/1/6/)
where D /( k /) is the drag/-related force term/, G /( k /) is the gra vit y/-related force term and v
/
/( k /) are the pro cess noise
terms/. De/ning R /( k /) /=
p
x
/2
/1
/( k /) /+ x
/2
/2
/( k /) as the distance from the cen tre of the Earth and V /( k /) /=
p
x
/2
/3
/( k /) /+ x
/2
/4
/( k /)


## Page 10

as absolute v ehicle sp eed then the drag and gra vitational terms are
D /( k /) /= /? / /( k /) exp
/
/[ R
/0
/? R /( k /)/]
H
/0
/
V /( k /) /; G /( k /) /= /?
Gm
/0
r
/3
/( k /)
and / /( k /) /= /
/0
exp x
/5
/( k /) /:
F or this example the parameter v alues are /
/0
/= /? /0 /: /5/9/7/8/3/, H
/0
/= /1/3 /: /4/0/6/, Gm
/0
/= /3 /: /9/8/6/0 / /1/0
/5
and R
/0
/= /6/3/7/4 and
re/
ect t ypical en vironmen tal and v ehicle c haracteristics
/2
/. The parameterisation of the ballistic co e/cien t/, / /( k /)/,
re/
ects the uncertain t y in v ehicle c haracteristics
/5
/. /
/0
is the ballistic co e/cien t of a /\t ypical v ehicle/" and it is
scaled b y exp x
/5
/( k /) to ensure that its v alue is alw a ys p ositiv e/. This is vital for /lter stabilit y /.
The motion of the v ehicle is measured b y a radar whic h is lo cated at /( x
r
/; y
r
/)/. It is able to measure range r
and b earing / at a frequency of /1/0Hz/, where
r
r
/( k /) /=
p
/( x
/1
/( k /) /? x
r
/)
/2
/+ /( x
/2
/( k /) /? y
r
/)
/2
/+ w
/1
/( k /)
/ /( k /) /= tan
/? /1
/
x
/2
/( k /) /? y
r
x
/1
/( k /) /? x
r
/
/+ w
/2
/( k /)
w
/1
/( k /) and w
/2
/( k /) are zero mean uncorrelated noise pro cesses with v ariances of /1m and /1/7mrad resp ectiv ely
/4
/. The
high up date rate and extreme accuracy of the sensor means that a large quan tit y of extremely high qualit y data is
a v ailable for the /lter/. The b earing uncertain t y is su/cien tly that the EKF is able to predict the sensor readings
accurately with v ery little bias/.
The true initial conditions for the v ehicle are
x /(/0/) /=
/0
B
B
B
B
/@
/6/5/0/0 /: /4
/3/4/9 /: /1/4
/? /1 /: /8/0/9/3
/? /6 /: /7/9/6/7
/0 /: /6/9/3/2
/1
C
C
C
C
A
and P /(/0/) /=
/2
/6
/6
/6
/6
/4
/1/0
/? /6
/0 /0 /0 /0
/0 /1/0
/? /6
/0 /0 /0
/0 /0 /1/0
/? /6
/0 /0
/0 /0 /0 /1/0
/? /6
/0
/0 /0 /0 /0 /0
/3
/7
/7
/7
/7
/5
/:
In other w ords/, the v ehicle/'s co e/cien t is t wice the nominal co e/cien t/.
The v ehicle is bu/eted b y random accelerations/,
Q /( k /) /=
/2
/4
/2 /: /4/0/6/4 / /1/0
/? /5
/0 /0
/0 /2 /: /4/0/6/4 / /1/0
/? /5
/0
/0 /0 /0
/3
/5
The initial conditions assumed b y the /lter are/,
/^
x /(/0 j /0/) /=
/0
B
B
B
B
/@
/6/5/0/0 /: /4
/3/4/9 /: /1/4
/? /1 /: /8/0/9/3
/? /6 /: /7/9/6/7
/0
/1
C
C
C
C
A
and P /(/0 j /0/) /=
/2
/6
/6
/6
/6
/4
/1/0
/? /6
/0 /0 /0 /0
/0 /1/0
/? /6
/0 /0 /0
/0 /0 /1/0
/? /6
/0 /0
/0 /0 /0 /1/0
/? /6
/0
/0 /0 /0 /0 /1
/3
/7
/7
/7
/7
/5
/:
The /lter uses the nominal initial condition and/, to o/set for the uncertain t y /, the v ariance on this initial estimate
is /1/.
Both /lters w ere implemen ted in discrete time and observ ations w ere tak en at a frequency of /1/0Hz/. Ho w ev er/,
due to the in tense nonlinearities of the v ehicle dynamics equations/, the Euler appro ximation of Equation /1/6 w as
only v alid for small time steps/. The in tegration step w as set to b e /5/0ms whic h mean t that t w o predictions w ere


## Page 11

0 20 40 60 80 100 120 140 160 180 200
10
−7
10
−6
10
−5
10
−4
10
−3
10
−2
10
−1
10
0
Mean squared error and variance of x1
Time s
Position variance km2
/(a/) Results for x
/1
/.
0 20 40 60 80 100 120 140 160 180 200
10
−6
10
−5
10
−4
10
−3
Mean squared error and variance of x3
Time s
Velocity variance (km/s)2
/(b/) Results for x
/3
/.
0 20 40 60 80 100 120 140 160 180 200
10
−5
10
−4
10
−3
10
−2
10
−1
10
0
Mean squared error and variance of x5
Time s
Coefficient variance
/(c/) Results for x
/5
/.
Figure /5/: The mean squared errors and estimated co v ariances calculated b y an EKF and an
unscen ted /lter/. In all the graphs/, the solid line is the mean squared error calculated b y the EKF/,
and the dotted line is its estimated co v ariance/. The dashed line is the unscen ted mean squared
error and the dot/-dashed line its estimated co v ariance/.
made p er up date/. F or the unscen ted /lter/, eac h sigma p oin t w as applied through the dynamics equations t wice/.
F or the EKF/, it w as necessary to p erform an initial prediction step and re/-linearise b efore the second step/.
The p erformance of eac h /lter is sho wn in Figure /5/. This /gure plots the estimated mean squared estimation
error /(the diagonal elemen ts of P /( k j k /)/) against actual mean squared estimation error /(whic h is ev aluated using
/1/0/0 Mon te Carlo sim ulations/)/. Only x
/1
/, x
/3
and x
/5
are sho wn /| the results for x
/2
are similar to x
/1
/, and x
/4
is the
same as that for x
/3
/. In all cases it can b e seen that the unscen ted /lter estimates its mean squared error v ery
accurately /, and it is p ossible to b e con/den t with the /lter estimates/. The EKF/, ho w ev er/, is highly inconsisten t/:
the p eak mean squared error in x
/1
is /0 /: /4km
/2
/, whereas its estimated co v ariance is o v er one h undred times smaller/.
Similarly /, the p eak mean squared v elo cit y error is /3 /: /4 / /1/0
/? /4
km
/2
s
/? /2
whic h is o v er /5 times the true mean squared
error/. Finally /, it can b e seen that x
/5
is highly biased/, and this bias only slo wly decreases o v er time/. This p o or
p erformance is the direct result of linearisation errors/.
/5 CONCLUSIONS
In this pap er w e ha v e argued that the principle di/cult y for applying the Kalman /lter to nonlinear systems is
the need to consisten tly predict the new state and observ ation of the system/. W e ha v e in tro duced a new /ltering
algorithm/, called the unscen ted /lter/. By virtue of the unscen ted transformation/, this algorithm has t w o great
adv an tages o v er the EKF/. First/, it is able to predict the state of the system more accurately /. Second/, it is m uc h
less di/cult to implemen t/. The b ene/ts of the algorithm w ere demonstrated in a realistic example/.
This pap er has considered one sp eci/c form of the unscen ted transform for one particular set of assumptions/.
In a companion pap er
/1/1
/, w e extend the dev elopmen t of the unscen ted transform and yield a general framew ork for
its deriv ation and application/. It is sho wn that the n um b er of sigma p oin ts can b e extended to yield a /lter whic h
matc hes momen ts up to the fourth order/. This higher order extension e/ectiv ely de/-biases almost all common
nonlinear co ordinate transformations/.


## Page 12

REFERENCES
/[/1/] M/. A thans/, R/. P /. Wishner and A/. Bertolini/. Sub optimal state estimation for con tin uous/-time nonlinear systems from
discrete noisy measuremen ts/. IEEE T r ansactions on A utomatic Contr ol /, T A C/-/1/3/(/6/)/:/5/0/4/{/5/1/8/, Octob er /1/9/6/8/.
/[/2/] J/. W/. Austin and C/. T/. Leondes/. Statistically Linearized Estimation of Reen try T ra jectories/. IEEE T r ansactions on
A er osp ac e and Ele ctr onic Systems /, AES/-/1/7/(/1/)/:/5/4/{/6/1/, Jan uary /1/9/8/1/.
/[/3/] D/. E/. Catlin/. Estimation/, con trol and the discrete k alman /lter/. In Applie d Mathematic al Scienc es /7/1 /, page /8/4/.
Springer/-V erlag/, /1/9/8/9/.
/[/4/] C/. B/. Chang/, R/. H/. Whiting and M/. A thans/. On the State and P arameter Estimation for Maneuv ering Reen try
V ehicles/. IEEE T r ansactions on A utomatic Contr ol /, A C/-/2/2/:/9/9/{/1/0/5/, F ebruary /1/9/7/7/.
/[/5/] P /. J/. Costa/. Adaptiv e Mo del Arc hitecture and Extended Kalman/-Bucy Filters/. IEEE T r ansactions on A er osp ac e and
Ele ctr onic Systems /, AES/-/3/0/(/2/)/:/5/2/5/{/5/3/3/, April /1/9/9/4/.
/[/6/] F/. E/. Daum/. New exact nonlinear /lters/. In J/. C/. Spall/, editor/, Bayesian A nalysis of Time Series and Dynamic
Mo dels /, c hapter /8/, pages /1/9/9/{/2/2/6/. Marcel Drekk er/, Inc/./, /1/9/8/8/.
/[/7/] N/. J/. Gordon/, D/. J/. Salmond and A/. F/. M/. Smith/. No v el Approac h to Nonlinear//non/-Gaussian Ba y esian State
Estimation/. IEE Pr o c e e dings/-F /, /1/4/0/(/2/)/:/1/0/7/{/1/1/3/, April /1/9/9/3/.
/[/8/] A/. H/. Jazwinski/. Sto chastic Pr o c esses and Filtering The ory /. Academic Press/, /1/9/7/0/.
/[/9/] S/. J/. Julier and J/. K/. Uhlmann/. A General Metho d for Appro ximating Nonlinear T ransformations of Probabilit y
Distributions/. WWW http/:////www/.robots/.ox/.ac/.uk///~s iju /, /8///1/9/9/4/.
/[/1/0/] S/. J/. Julier and J/. K/. Uhlmann/. A Consisten t/, Debiased Metho d for Con v erting Bet w een P olar and Cartesian
Co ordinate Systems/. In The Pr o c e e dings of A er oSense/: The /1/1th International Symp osium on A er osp ac e//Defense
Sensing/, Simulation and Contr ols/, Orlando/, Florida /. SPIE/, /1/9/9/7/. Acquisition/, T rac king and P oin ting XI/.
/[/1/1/] S/. J/. Julier/, J/. K/. Uhlmann and H/. F/. Durran t/-Wh yte/. A New Approac h for Filtering Nonlinear Systems/. In The
Pr o c e e dings of the A meric an Contr ol Confer enc e/, Se attle/, Washington/. /, pages /1/6/2/8/{/1/6/3/2/, /1/9/9/5/.
/[/1/2/] S/. J/. Julier/, J/. K/. Uhlmann and H/. F/. Durran t/-Wh yte/. A New Approac h for the Nonlinear T ransformation of Means
and Co v ariances in Linear Filters/. IEEE T r ansactions on A utomatic Contr ol /, /1/9/9/6/.
/[/1/3/] H/. J/. Kushner/. Appro ximations to optimal nonlinear /lters/. IEEE T r ansactions on A utomatic Contr ol /, A C/-/1/2/(/5/)/:/5/4/6/{
/5/5/6/, Octob er /1/9/6/7/.
/[/1/4/] H/. J/. Kushner/. Dynamical equations for optim um non/-linear /ltering/. Journal of Di/er ential Equations /, /3/:/1/7/9/{/1/9/0/,
/1/9/6/7/.
/[/1/5/] D/. Lerro and Y/. K/. Bar/-Shalom/. T rac king with Debiased Consisten t Con v erted Measuremen ts vs/. EKF/. IEEE
T r ansactions on A er osp ac e and Ele ctr onics Systems /, AES/-/2/9/(/3/)/:/1/0/1/5/{/1/0/2/2/, July /1/9/9/3/.
/[/1/6/] P /. S/. Ma yb ec k/. Sto chastic Mo dels/, Estimation/, and Contr ol /, v olume /2/. Academic Press/, /1/9/8/2/.
/[/1/7/] R/. K/. Mehra/. A Comparison of Sev eral Nonlinear Filters for Reen try V ehicle T rac king/. IEEE T r ansactions on
A utomatic Contr ol /, A C/-/1/6/(/4/)/:/3/0/7/{/3/1/9/, August /1/9/7/1/.
/[/1/8/] W/. H/. Press/, S/. A/. T euk olsky /, W/. T/. V etterling and B/. P /. Flannery/. Numeric al R e cip es in C/: The A rt of Scienti/c
Computing /. Cam bridge Univ ersit y Press/, /2 edition/, /1/9/9/2/.
/[/1/9/] S/. F/. Sc hmidt/. Applications of state space metho ds to na vigation problems/. In C/. T/. Leondes/, editor/, A dvanc e d
Contr ol Systems /, v olume /3/, pages /2/9/3/{/3/4/0/. Academic Press/, /1/9/6/6/.
/[/2/0/] H/. W/. Sorenson/, editor/. Kalman /ltering/: the ory and applic ation /. IEEE/, /1/9/8/5/.
/[/2/1/] H/. W/. Sorenson and A/. R/. Stubb erud/. Non/-linear /ltering b y appro ximation of the a p osteriori densit y /. International
Journal of Contr ol /, /8/(/1/)/:/3/3/{/5/1/, /1/9/6/8/.
/[/2/2/] J/. K/. Uhlmann/. Algorithms for m ultiple target trac king/. A meric an Scientist /, /8/0/(/2/)/:/1/2/8/{/1/4/1/, /1/9/9/2/.
/[/2/3/] J/. K/. Uhlmann/. Sim ultaneous map building and lo calization for real time applications/. T ec hnical rep ort/, Univ ersit y
of Oxford/, /1/9/9/4/. T ransfer thesis/.
