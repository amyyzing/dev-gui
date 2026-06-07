# Chapter /1/1 T utorial/: The Kalman Filter

Converted from: `Kalman Filter\Kalman Filter Tutorial.pdf`


## Page 1

Chapter /1/1
T utorial/: The Kalman Filter
T on y Lacey /.
/1/1/./1 In tro duction
The Kalman /#0Clter /#5B/1 /#5D has long b een regarded as the optimal solution to man y trac king and data prediction
tasks/, /#5B/2/#5D/. Its use in the analysis of visual motion has b een do cumen ted frequen tly /. The standard Kalman
/#0Clter deriv ation is giv en here as a tutorial exercise in the practical use of some of the statistical tec hniques
outlied in previous sections/. The /#0Clter is constructed as a mean squared error minimiser/, but an alternativ e
deriv ation of the /#0Clter is also pro vided sho wing ho w the /#0Clter relates to maxim um lik eliho o d statistics/.
Do cumen ting this deriv ation furnishes the reader with further insigh ti n to the statistical constructs within
the /#0Clter/.
The purp ose of /#0Cltering is to extract the required information from a signal/, ignoring ev erything else/.
Ho ww ell a /#0Clter p erforms this task can b e measured using a cost or loss function/. Indeed w em a y de/#0Cne
the goal of the /#0Clter to b e the minimisation of this loss function/.
/1/1/./2 Mean squared error
Man y signals can b e describ ed in the follo wing w a y/;
y
k
/= a
k
x
k
/+ n
k
/#28/1/1/./1/#29
where/; y
k
is the time dep enden t observ ed signal/, a
k
is a gain term/, x
k
is the information b earing signal
and n
k
is the additiv e noise/.
The o v erall ob jectiv e is to estimate x
k
/. The di/#0Berence b et w een the estimate of /^ x
k
and x
k
itself is termed
the error/;
f /#28 e
k
/#29 /= f /#28 x
k
/, /^x
k
/#29 /#28/1/1/./2/#29
The particular shap e of f /#28 e
k
/#29 is dep enden t up on the application/, ho w ev er it is clear that the function
should b e b oth p ositiv e and increase monotonically /#5B/3/#5D/. An error function whic h exhibits these c harac/-
teristics is the squared error function/;
f /#28 e
k
/#29 /= /#28 x
k
/, /^x
k
/#29
/2
/#28/1/1/./3/#29
/1/3/3


## Page 2

Since it is necessary to consider the abilit y of the /#0Clter to predict man y data o v er a p erio d of time a more
meaningful metric is the exp ected v alue of the error function/;
l ossf unction /= E /#28 f /#28 e
k
/#29/#29 /#28/1/1/./4/#29
This results in the me an squar e d err or /#28MSE/#29 function/;
/#0F /#28 t /#29 /= E
/,
e
/2
k
/#01
/#28/1/1/./5/#29
/1/1/./3 Maxim um lik eliho o d
The ab o v e deriv ation of mean squared error/, although in tuitiv e is somewhat heuristic/. A more rigorous
deriv ation can b e dev elop ed using maximum likeliho o d statistics /. This is ac hiev ed b y rede/#0Cning the goal
of the /#0Clter to /#0Cnding the /^x whic h maximises the probabilit y or lik eliho o d of y /. That is/;
max /#5B P /#28 y j /^x /#29/#5D /#28/1/1/./6/#29
Assuming that the additiv e random noise is Gaussian distributed with a standard deviation of /#1B
k
giv es/;
P /#28 y
k
j /^x
k
/#29 /= K
k
exp /,
/#12
/#28 y
k
/, a
k
/^x
k
/#29
/2
/2 /#1B
/2
k
/#13
/#28/1/1/./7/#29
where K
k
is a normalisation constan t/. The maxim um lik eliho o d function of this is/;
P /#28 y j /^x /#29 /=
Y
k
K
k
exp /,
/#12
/#28 y
k
/, a
k
/^x
k
/#29
/2
/2 /#1B
/2
k
/#13
/#28/1/1/./8/#29
Whic h leads to/;
lo g P /#28 y j /^x /#29 /= /,
/1
/2
X
k
/#12
/#28 y
k
/, a
k
/^x
k
/#29
/2
/#1B
/2
k
/#13
/+ constant /#28/1/1/./9/#29
The driving function of equation /1/1/./9 is the MSE/, whic h ma y be maximised b y the v ariation of /^x
k
/.
Therefore the mean squared error function is applicable when the exp ected v ariation of y
k
is b est mo delled
as a Gaussian distribution/. In suc h a case the MSE serv es to pro vide the v alue of /^x
k
whic h maximises
the lik eliho o d of the signal y
k
/.
In the follo wing deriv ation the optimal /#0Clter is de/#0Cned as b eing that /#0Clter/, from the set of all p ossible
/#0Clters whic h minimises the mean squared error/.
/1/1/./4 Kalman Filter Deriv ation
Before going on to discuss the Kalman /#0Clter the w ork of Norb ert Wiener /#5B/4/#5D/, should /#0Crst b e ac kno wledged
/. Wiener describ ed an optimal /#0Cnite impulse r esp onse /#28FIR/#29 /#0Clter in the mean squared error sense/. His
solution will not b e discussed here ev en though it has m uc h in common with the Kalman /#0Clter/. Su/#0Ece to
sa y that his solution uses b oth the auto correlation and the cross correlation of the receiv ed signal with
the original data/, in order to deriv e an impulse resp onse for the /#0Clter/.
Kalman also presen ted a prescription of the optimal MSE /#0Clter/. Ho w ev er Kalman/'s prescription has
some adv an tages o v er W einer/'s/; it sidesteps the need to determine the impulse resp onse of the /#0Clter/,
something whic h is p o orly suited to n umerical computation/. Kalman describ ed his /#0Clter using state
/1/3/4


## Page 3

space tec hniques/, whic h unlik e Wiener/'s p erscription/, enables the /#0Clter to b e used as either a smo other/, a
/#0Clter or a predictor/. The latter of these three/, the abilit y of the Kalman /#0Clter to b e used to predict data
has pro v en to b e a v ery useful function/. It has lead to the Kalman /#0Clter b eing applied to a wide range of
trac king and na vigation problems/. De/#0Cning the /#0Clter in terms of state space metho ds also simpli/#0Ces the
implemen tation of the /#0Clter in the discrete domain/, another reason for its widespread app eal/.
/1/1/./5 State space deriv ation
Assume that w ew an tt ok n o w the v alue of a v ariable within a pro cess of the form/;
x
k /+/1
/= /#08 x
k
/+ w
k
/#28/1/1/./1/0/#29
where/; x
k
is the state v ector of the pro cess at time k /, /#28nx/1/#29/; /#08 is the state transition matrix of the pro cess
from the state at k to the state at k /+ /1/, and is assumed stationary o v er time/, /#28nxm/#29/; w
k
is the asso ciated
white noise pro cess with kno wn co v ariance/, /#28nx/1/#29/.
Observ ations on this v ariable can b e mo delled in the form/;
z
k
/= Hx
k
/+ v
k
/#28/1/1/./1/1/#29
where/; z
k
is the actual measuremen to f x at time k/, /#28mx/1/#29/; H is the noiseless connection b et w een the
state v ector and the measuremen tv ector/, and is assumed stationary o v er time /#28mxn/#29/; v
k
is the asso ciated
measuremen t error/. This is again assumed to b e a white noise pro cess with kno wn co v ariance and has
zero cross/-correlation with the pro cess noise/, /#28mx/1/#29/.
As w as sho wn in section /?/? for the minimisation of the MSE to yield the optimal /#0Clter it m ust be
p ossible to correctly mo del the system errors using Gaussian distributions/. The co v ariances of the t w o
noise mo dels are assumed stationary o v er time and are giv en b y/;
Q /= E
/#02
w
k
w
T
k
/#03
/#28/1/1/./1/2/#29
R /= E
/#02
v
k
v
T
k
/#03
/#28/1/1/./1/3/#29
The mean squared error is giv en b y /1/1/./5/. This is equiv alen t to/;
E
/#02
e
k
e
T
k
/#03
/= P
k
/#28/1/1/./1/4/#29
where/; P
k
is the error co v ariance matrix at time k /, /#28nxn/#29/.
Equation /1/1/./1/4 ma y b e expanded to giv e/;
P
k
/= E
/#02
e
k
e
T
k
/#03
/= E
h
/#28 x
k
/, /^x
k
/#29/#28 x
k
/, /^x
k
/#29
T
i
/#28/1/1/./1/5/#29
Assuming the prior estimate of /^ x
k
is called /^ x
/0
k
/, and w as gained b y kno wledge of the system/. It p osible to
write an up date equation for the new estimate/, com bing the old estimate with measuremen t data th us/;
/^x
k
/= /^x
/0
k
/+ K
k
/#28 z
k
/, H /^x
/0
k
/#29 /#28/1/1/./1/6/#29
where/; K
k
is the Kalman gain/, whic h will b e deriv ed shortly /. The term z
k
/, H /^x
/0
k
in eqn/. /1/1/./1/6 is kno wn
as the innovation or me asur ement r esidual /;
i
k
/= z
k
/, H /^x
k
/#28/1/1/./1/7/#29
/1/3/5


## Page 4

Substitution of /1/1/./1/1 in to /1/1/./1/6 giv es/;
/^x
k
/= /^x
/0
k
/+ K
k
/#28 Hx
k
/+ v
k
/, H /^x
/0
k
/#29 /#28/1/1/./1/8/#29
Substituting /1/1/./1/8 in to /1/1/./1/5 giv es/;
P
k
/= E /#5B/#5B/#28 I /, K
k
H /#29/#28 x
k
/, /^x
/0
k
/#29 /, K
k
v
k
/#5D
/#5B/#28 I /, K
k
H /#29/#28 x
k
/, /^x
/0
k
/#29 /, K
k
v
k
/#5D
T
i
/#28/1/1/./1/9/#29
A t this p oin t it is noted that x
k
/, /^x
/0
k
is the error of the prior estimate/. It is clear that this is uncorrelated
with the measuremen t noise and therefore the exp ectation ma y b e re/-written as/;
P
k
/= /#28 I /, K
k
H /#29 E
h
/#28 x
k
/, /^x
/0
k
/#29/#28 x
k
/, /^x
/0
k
/#29
T
i
/#28 I /, K
k
H /#29
/+ K
k
E
/#02
v
k
v
T
k
/#03
K
T
k
/#28/1/1/./2/0/#29
Substituting equations /1/1/./1/3 and /1/1/./1/5 in to /1/1/./1/9 giv es/;
P
k
/= /#28 I /, K
k
H /#29 P
/0
k
/#28 I /, K
k
H /#29
T
/+ K
k
RK
T
k
/#28/1/1/./2/1/#29
where P
/0
k
is the prior estimate of P
k
/.
Equation /1/1/./2/1 is the error co v ariance up date equation/. The diagonal of the co v ariance matrix con tains
the mean squared errors as sho wn/;
P
kk
/=
/2
/4
E
/#02
e
k /, /1
e
T
k /, /1
/#03
E
/#02
e
k
e
T
k /, /1
/#03
E
/#02
e
k /+/1
e
T
k /, /1
/#03
E
/#02
e
k /, /1
e
T
k
/#03
E
/#02
e
k
e
T
k
/#03
E
/#02
e
k /+/1
e
T
k
/#03
E
/#02
e
k /, /1
e
T
k /+/1
/#03
E
/#02
e
k
e
T
k /+/1
/#03
E
/#02
e
k /+/1
e
T
k /+/1
/#03
/3
/5
/#28/1/1/./2/2/#29
The sum of the diagonal elemen ts of a matrix is the tr ac e of a matrix/. In the case of the error co v ariance
matrix the trace is the sum of the mean squared errors/. Therefore the mean squared error ma y be
minimised b y minimising the trace of P
k
whic h in turn will minimise the trace of P
kk
/.
The trace of P
k
is /#0Crst di/#0Beren tiated with resp ect to K
k
and the result set to zero in order to /#0Cnd the
conditions of this minim um/.
Expansion of /1/1/./2/1 giv es/;
P
k
/= P
/0
k
/, K
k
HP
/0
k
/, P
/0
k
H
T
K
T
k
/+ K
k
/,
HP
/0
k
H
T
/+ R
/#01
K
T
k
/#28/1/1/./2/3/#29
Note that the trace of a matrix is equal to the trace of its transp ose/, therefore it ma y written as/;
T /#5B P
k
/#5D /= T /#5B P
/0
k
/#5D /, /2 T /#5B K
k
HP
/0
k
/#5D /+ T
/#02
K
k
/,
HP
/0
k
H
T
/+ R
/#01
K
T
k
/#03
/#28/1/1/./2/4/#29
where/; T /#5B P
k
/#5D is the trace of the matrix P
k
/.
Di/#0Beren tiating with resp ect to K
k
giv es/;
dT /#5B P
k
/#5D
dK
k
/= /, /2/#28 HP
/0
k
/#29
T
/+ /2 K
k
/,
HP
/0
k
H
T
/+ R
/#01
/#28/1/1/./2/5/#29
Setting to zero and re/-arranging giv es/;
/1/3/6


## Page 5

/#28 HP
/0
k
/#29
T
/= K
k
/,
HP
/0
k
H
T
/+ R
/#01
/#28/1/1/./2/6/#29
No w solving for K
k
giv es/;
K
k
/= P
/0
k
H
T
/,
HP
/0
k
H
T
/+ R
/#01
/, /1
/#28/1/1/./2/7/#29
Equation /1/1/./2/7 is the Kalman gain equation/. The inno v ation/, i
k
de/#0Cned in eqn/. /1/1/./1/7 has an asso ciated
measuremen t prediction co v ariance/. This is de/#0Cned as/;
S
k
/= HP
/0
k
H
T
/+ R /#28/1/1/./2/8/#29
Finally /, substitution of equation /1/1/./2/7 in to /1/1/./2/3 giv es/;
P
k
/= P
/0
k
/, P
/0
k
H
T
/,
HP
/0
k
H
T
/+ R
/#01
/, /1
HP
/0
k
/= P
/0
k
/, K
k
HP
/0
k
/= /#28 I /, K
k
H /#29 P
/0
k
/#28/1/1/./2/9/#29
Equation /1/1/./2/9 is the up date equation for the error co v ariance matrix with optimal gain/. The three
equations /1/1/./1/6/, /1/1/./2/7/, and /1/1/./2/9 dev elop an estimate of the v ariable x
k
/. State pro jection is ac hiev ed
using/;
/^x
/0
k /+/1
/= /#08/^ x
k
/#28/1/1/./3/0/#29
T o complete the recursion it is necessary to /#0Cnd an equation whic h pro jects the error co v ariance matrix
in to the next time in terv al/, k /+/1 /. This is ac hiev ed b y /#0Crst forming an expressions for the prior error/;
e
/0
k /+/1
/= x
k /+/1
/, /^x
/0
k /+/1
/= /#28/#08 x
k
/+ w
k
/#29 /, /#08/^ x
k
/= /#08 e
k
/+ w
k
/#28/1/1/./3/1/#29
Extending equation /1/1/./1/5 to time k /+/1 /;
P
/0
k /+/1
/= E
/#02
e
/0
k /+/1
e
T /0
k /+/1
/#03
/= E
h
/#28/#08 e
k
/+ w
k
/#29/#28 /#08 e
k
/+ w
k
/#29
T
i
/#28/1/1/./3/2/#29
Note that e
k
and w
k
ha v e zero cross/-correlation b ecause the noise w
k
actually accum ulates b et w een k
and k /+ /1 whereas the error e
k
is the error up un til time k /. Therefore/;
P
/0
k /+/1
/= E
/#02
e
/0
k /+/1
e
T /0
k /+/1
/#03
/= E
h
/#08 e
k
/#28/#08 e
k
/#29
T
i
/+ E
/#02
w
k
w
T
k
/#03
/= /#08 P
k
/#08
T
/+ Q /#28/1/1/./3/3/#29
This completes the recursiv e /#0Clter/. The algorithmic lo op is summarised in the diagram of /#0Cgure /1/1/./5/.
/1/3/7


## Page 6

Kalman Gain
Update Estimate
Update Covariance
Project into k+1
Projected Estimates
Initial Estimates
Updated State Estimates
Measurements
Description Equation
Kalman Gain K
k
/= P
/0
k
H
T
/#10
HP
/0
k
H
T
/+ R
/#11
/, /1
Up date Estimate /^x
k
/= /^x
/0
k
/+ K
k
/#28 z
k
/, H /^x
/0
k
/#29
Up date Co v ariance P
k
/= /#28 I /, K
k
H /#29 P
/0
k
Pro ject in to k /+/1 /^x
/0
k /+/1
/= /#08/^ x
k
P
k /+/1
/= /#08 P
k
/#08
T
/+ Q
Figure /1/1/./1/: Kalman Filter Recursiv e Algorithm
/1/1/./6 The Kalman /#0Clter as a c hi/-square merit function
The ob jectiv e of the Kalman /#0Clter is to minimise the mean squared error b et w een the actual and estimated
data/. Th us it pro vides the b est estimate of the data in the mean squared error sense/. This b eing the
case it should be p ossible to sho w that the Kalman /#0Clter has m uc h in common with the chi/-squar e /.
The c hi/-square merit function is a maxim um lik eliho o d function/, and w as deriv ed earlier/, equation /1/1/./9/.
It is t ypically used as a criteria to /#0Ct a set of mo del parameters to a mo del a pro cess kno wn as le ast
squar es /#0Ctting/. The Kalman /#0Clter is commonly kno wn as a r e cursive le ast squar es /#28RLS/#29 /#0Ctter/. Dra wing
similaritie s to the c hi/-square merit function will giv e a di/#0Beren t p ersp ectiv e on what the Kalman /#0Clter is
doing/.
The c hi/-square merit function is/;
/#1F
/2
/=
k
X
i /=/1
/#14
z
i
/, h /#28 a
i
/;x /#29
/#1B
i
/#15
/2
/#28/1/1/./3/4/#29
where/; z
i
is the measured v alue/; h
i
is the data mo del with parameters x /, assumed linear in a /; /#1B
i
is the
v ariance asso ciated with the measured v alue/.
The optimal set of parameters can then b e de/#0Cned as that whic h minimises the ab o v e function/. Expanding
out the v ariance giv es/;
/1/3/8


## Page 7

/#1F
/2
/=
k
X
i /=/1
/1
/#1B
i
/#1B
i
/#5B z
i
/, h /#28 a
i
/;x /#29/#5D
/2
/#28/1/1/./3/5/#29
Represen ting the c hi/-square in v ector form and using notation from the earlier Kalman deriv ation/;
/#1F
/2
k
/= /#5B z
k
/, h /#28 a/; x
k
/#29/#5D R
/, /1
/#5B z
k
/, h /#28 a/; x
k
/#29/#5D
T
/#28/1/1/./3/6/#29
where/; R
/, /1
is the matrix of in v erse squared v ariances/, i/.e/. /1 /=/#1B
i
/#1B
i
/.
The ab o v e merit function is the merit function asso ciated with the latest/, k th/, measuremen t and pro vides
a measure of ho w accurately the mo del predicted this measuremen t/. Giv en that the in v erse mo del
co v ariance matrix is kno wn up to time k /, the merit function up to time k ma y b e re/-written as/;
/#1F
/2
k /, /1
/= /#28 x
k /, /1
/, /^x
k /, /1
/#29 P
/0/, /1
k /, /1
/#28 x
k /, /1
/, /^x
k /, /1
/#29
T
/#28/1/1/./3/7/#29
T o com bine the new data with the previous/, /#0Ctting the mo del parameters so as to minimise the o v erall
c hi/-square function/, the merit function b ecomes the summation of the t w o/;
/#1F
/2
/= /#28 x
k /, /1
/, /^x
k /, /1
/#29 P
/0/, /1
k /, /1
/#28 x
k /, /1
/, /^x
k /, /1
/#29
T
/+ /#5B z
k
/, h /#28 a/; x
k
/#29/#5D R
/, /1
/#5B z
k
/, h /#28 a/; x
k
/#29/#5D
T
/#28/1/1/./3/8/#29
Where the /#0Crst deriv ativ e of this is giv en b y/;
d/#1F
/2
dx
/= /2 P
/0/, /1
k /, /1
/#28 x
k /, /1
/, /^x
k /, /1
/#29 /, /2 r
x
h /#28 a/; x
k
/#29
T
R
/, /1
/#5B z
k
/, h /#28 a/; x
k
/#29/#5D /#28/1/1/./3/9/#29
The mo del function h /#28 a/; x
k
/#29 with parameters /#0Ctted from information to date/, ma y b e considered as/;
h /#28 a/; x
k
/#29 /= h /#28 a/; /#28/^ x
k
/+ /#01 x
k
/#29/#29 /#28/1/1/./4/0/#29
where /#01 x
k
/= x
k
/, /^x
k
/. The T a ylor series expansion of the mo del function to /#0Crst order is/;
h /#28/^ x
k
/+ /#01 x /#29 /= h /#28/^ x
k
/#29 /+ /#01 x r
x
h /#28/^ x
k
/#29 /#28/1/1/./4/1/#29
Substituting this result in to the deriv ativ e equation /1/1/./3/9 giv es/;
d/#1F
/2
dx
/= /2 P
/0/, /1
k
/#28 x
k
/, /^x
k
/#29
/, /2 r
x
h /#28 a/; /^x
k
/#29
T
R
/, /1
/#5B z
k
/, h /#28 a/; /^x
k
/#29 /, /#28 x
k
/, /^x
k
/#29 r
x
h /#28 a/; /^x
k
k
/#29/#5D /#28/1/1/./4/2/#29
It is assumed that the estimated mo del parameters are a close appro ximation to the actual mo del param/-
eters/. Therefore it ma y b e assumed that the deriv ativ es of the actual mo del and the estimated mo del are
the same/. F urther/, for a system whic h is linear in a the mo del deriv ativ e is constan t and ma y b e written
as/;
r
x
h /#28 a/; x
k
/#29 /= r
x
h /#28 a/; /^x
k
/#29 /= H /#28/1/1/./4/3/#29
Substituting this in to equation /1/1/./3/9 giv es/;
d/#1F
/2
dx
/= /2 P
/0/, /1
k
/#01 x
k
/+ /2 H
T
R
/, /1
H /#01 x
k
/, /2 H
T
R
/, /1
/#5B z
k
/, h /#28 a/; /^x
k
/#29/#5D /#28/1/1/./4/4/#29
/1/3/9


## Page 8

Re/-arranging giv es/;
d/#1F
/2
dx
/= /2
/#02
P
/0/, /1
k
/+ H
T
R
/, /1
H
/#03
/#01 x
k
/, /2 H
T
R
/, /1
/#5B z
k
/, h /#28 a/; /^x
k
/#29/#5D /#28/1/1/./4/5/#29
F or a minim um the deriv ativ e is zero/, rearrange in terms of /#01 x
k
giv es/;
/#01 x
k
/=
/#02
P
/0/, /1
k
/+ H
T
R
/, /1
H
/#03
/, /1
H
T
R
/, /1
/#5B z
k
/, h /#28 a/; /^x
k
/#29/#5D /#28/1/1/./4/6/#29
x /= /^x
k
/+
/#02
P
/0/, /1
k
/+ H
T
R
/, /1
H
/#03
/, /1
H
T
R
/, /1
/#5B z
k
/, h /#28 a/; /^x /#29/#5D /#28/1/1/./4/7/#29
Comparison of equation /1/1/./4/7 to /1/1/./1/6 allo ws the gain/, K
k
to b e iden ti/#0Ced as/;
K
k
/=
/#02
P
/0/, /1
k
/+ H
T
R
/, /1
H
/#03
/, /1
H
T
R
/, /1
/#28/1/1/./4/8/#29
Giving a parameter up date equation of the form/;
x
k
/= /^x
k
/+ K
k
/#5B z
k
/, h /#28 a/; /^x
k
/#29/#5D /#28/1/1/./4/9/#29
Equation /1/1/./4/9 is iden tical to /1/1/./1/6 and describ es the impro v emen t of the parameter estimate using the
error b et w een measured and mo del pro jected v alues/.
/1/1/./7 Mo del co v ariance up date
The mo del parameter co v ariance has b een considered in its in v erted form where it is kno wn as the
information matrix
/1
/. It is p ossible to form ulate an alternativ e up date equation for the co v ariance matrix
using standard error prop ogation/;
P
/, /1
k
/= P
/0/, /1
k
/+ HR
/, /1
H
T
/#28/1/1/./5/0/#29
It is p ossible to sho w that the co v ariance up dates of equation /1/1/./5/0 and equation /1/1/./2/9 are equiv alen t/.
This ma yb e a c hiev ed using the iden tit y P
k
/#02 P
/, /1
k
/= I /. The original/, eqn /1/1/./2/9 and alternativ e/, eqn /1/1/./5/0
forms of the co v ariance up date equations are/;
P
k
/= /#28 I /, K
k
H /#29 P
/0
k
and P
/, /1
k
/= P
/0/, /1
k
/+ HR
/, /1
H
T
Therefore/;
/#28 I /, K
k
H /#29 P
/0
k
/#02 P
/0/, /1
k
/+ HR
/, /1
H
T
/= I /#28/1/1/./5/1/#29
Substituting for K
k
giv es/;
h
P
/0
k
/, P
/0
k
H
T
/,
HP
/0
k
H
T
/+ R
/#01
/, /1
HP
/0
k
i
/#02
P
/0/, /1
k
/+ H
T
R
/, /1
H
/#03
/= I /, P
/0
k
H
T
h
/,
HP
/0
k
H
T
/+ R
/#01
/, /1
/, R
/, /1
/+
/,
HP
/0
k
H
T
/+ R
/#01
/, /1
HP
/0
k
H
T
R
/, /1
i
H
/= I /, P
/0
k
H
T
h
/,
HP
/0
k
H
T
/+ R
/#01
/, /1
/,
I /+ HP
/0
k
H
T
R
/, /1
/#01
/, R
/, /1
i
H
/= I /, P
/0
k
H
T
/#02
R
/, /1
/, R
/, /1
/#03
H
/= I /#28/1/1/./5/2/#29
/1
when the Kalman /#0Clter is built around the information matrix it is kno wn as the information /#0Clter
/1/4/0
