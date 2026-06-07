# CS229 Lecture Notes Tengyu Ma, Anand Avati, Kian Katanforoosh, and Andrew Ng

Converted from: `Machine Learning\Deep Learning.pdf`


## Page 1

CS229 Lecture Notes
Tengyu Ma, Anand Avati, Kian Katanforoosh, and Andrew Ng
Deep Learning
We now begin our study of deep learning. In this set of notes, we give an
overview of neural networks, discuss vectorization and discuss training neural
networks with backpropagation.
1 Supervised Learning with Non-linear Mod-
els
In the supervised learning setting (predicting y from the input x), suppose
our model/hypothesis is hθ(x). In the past lectures, we have considered the
cases whenhθ(x) =θ⊤x (in linear regression or logistic regression) orhθ(x) =
θ⊤φ(x) (whereφ(x) is the feature map). A commonality of these two models
is that they are linear in the parameters θ. Next we will consider learning
general family of models that are non-linear in both the parameters θ
and the inputs x. The most common non-linear models are neural networks,
which we will deﬁne staring from the next section. For this section, it suﬃces
to think hθ(x) as an abstract non-linear model. 1
Suppose{(x(i),y (i))}n
i=1 are the training examples. For simplicity, we start
with the case where y(i)∈ R and hθ(x)∈ R.
Cost/loss function. We deﬁne the least square cost function for the i-th
example (x(i),y (i)) as
J (i)(θ) = 1
2(hθ(x(i))−y(i))2 (1.1)
1If a concrete example is helpful, perhaps think about the model hθ(x) = θ2
1x2
1 +θ2
2x2
2 +
··· +θ2
dx2
d in this subsection, even though it’s not a neural network.
1


## Page 2

2
and deﬁne the mean-square cost function for the dataset as
J(θ) = 1
n
n∑
i=1
J (i)(θ) (1.2)
which is same as in linear regression except that we introduce a constant
1/n in front of the cost function to be consistent with the convention. Note
that multiplying the cost function with a scalar will not change the local
minima or global minima of the cost function. Also note that the underlying
parameterization for hθ(x) is diﬀerent from the case of linear regression,
even though the form of the cost function is the same mean-squared loss.
Throughout the notes, we use the words “loss” and “cost” interchangeably.
Optimizers (SGD). Commonly, people use gradient descent (GD), stochas-
tic gradient (SGD), or their variants to optimize the loss functionJ(θ). GD’s
update rule can be written as 2
θ :=θ−α∇θJ(θ) (1.3)
where α >0 is often referred to as the learning rate or step size. Next, we
introduce a version of the SGD (Algorithm 1), which is lightly diﬀerent from
that in the ﬁrst lecture notes.
Algorithm 1 Stochastic Gradient Descent
1: Hyperparameter: learning rate α, number of total iteration niter.
2: Initialize θ randomly.
3: for i = 1 to niter do
4: Sample j uniformly from{1,...,n }, and update θ by
θ :=θ−α∇θJ (j)(θ) (1.4)
Oftentimes computing the gradient of B examples simultaneously for the
parameter θ can be faster than computing B gradients separately due to
hardware parallelization. Therefore, a mini-batch version of SGD is most
commonly used in deep learning, as shown in Algorithm 2. There are also
other variants of the SGD or mini-batch SGD with slightly diﬀerent sampling
schemes.
2Recall that, as deﬁned in the previous lecture notes, we use the notation “ a := b” to
denote an operation (in a computer program) in which we set the value of a variable a
to be equal to the value of b. In other words, this operation overwrites a with the value
of b. In contrast, we will write “ a = b” when we are asserting a statement of fact, that
the value of a is equal to the value of b.


## Page 3

3
Algorithm 2 Mini-batch Stochastic Gradient Descent
1: Hyperparameters: learning rate α, batch size B, # iterations niter.
2: Initialize θ randomly
3: for i = 1 to niter do
4: Sample B examples j1,...,j B (without replacement) uniformly from
{1,...,n }, and update θ by
θ :=θ− α
B
B∑
k=1
∇θJ (jk)(θ) (1.5)
With these generic algorithms, a typical deep learning model is learned
with the following steps. 1. Deﬁne a neural network parametrization hθ(x),
which we will introduce in Section 2, and 2. write the backpropagation
algorithm to compute the gradient of the loss function J (j)(θ) eﬃciently,
which will be covered in Section 3, and 3. run SGD or mini-batch SGD (or
other gradient-based optimizers) with the loss function J(θ).
2 Neural Networks
Neural networks refer to broad type of non-linear models/parametrizations
hθ(x) that involve combinations of matrix multiplications and other entry-
wise non-linear operations. We will start small and slowly build up a neural
network, step by step.
A Neural Network with a Single Neuron. Recall the housing price
prediction problem from before: given the size of the house, we want to
predict the price. We will use it as a running example in this subsection.
Previously, we ﬁt a straight line to the graph of size vs. housing price.
Now, instead of ﬁtting a straight line, we wish to prevent negative housing
prices by setting the absolute minimum price as zero. This produces a “kink”
in the graph as shown in Figure 1. How do we represent such a function with
a single kink as hθ(x) with unknown parameter? (After doing so, we can
invoke the machinery in Section 1.)
We deﬁne a parameterized functionhθ(x) with inputx, parameterized by
θ, which outputs the price of the house y. Formally, hθ : x→ y. Perhaps
one of the simplest parametrization would be
hθ(x) = max(wx +b, 0), where θ = (w,b )∈ R2 (2.1)


## Page 4

4
Herehθ(x) returns a single value: (wx+b) or zero, whichever is greater. In
the context of neural networks, the function max{t, 0} is called a ReLU (pro-
nounced “ray-lu”), or rectiﬁed linear unit, and often denoted by ReLU( t) ≜
max{t, 0}.
Generally, a one-dimensional non-linear function that mapsR to R such as
ReLU is often referred to as anactivation function. The model hθ(x) is said
to have a single neuron partly because it has a single non-linear activation
function. (We will discuss more about why a non-linear activation is called
neuron.)
When the input x∈ Rd has multiple dimensions, a neural network with
a single neuron can be written as
hθ(x) = ReLU(w⊤x +b), where w∈ Rd, b∈ R, and θ = (w,b ) (2.2)
The term b is often referred to as the “bias”, and the vector w is referred
to as the weight vector. Such a neural network has 1 layer. (We will deﬁne
what multiple layers mean in the sequel.)
Stacking Neurons. A more complex neural network may take the single
neuron described above and “stack” them together such that one neuron
passes its output as input into the next neuron, resulting in a more complex
function.
Let us now deepen the housing prediction example. In addition to the size
of the house, suppose that you know the number of bedrooms, the zip code
and the wealth of the neighborhood. Building neural networks is analogous
to Lego bricks: you take individual bricks and stack them together to build
complex structures. The same applies to neural networks: we take individual
neurons and stack them together to create complex neural networks.
Given these features (size, number of bedrooms, zip code, and wealth),
we might then decide that the price of the house depends on the maximum
family size it can accommodate. Suppose the family size is a function of
the size of the house and number of bedrooms (see Figure 2). The zip code
may provide additional information such as how walkable the neighborhood
is (i.e., can you walk to the grocery store or do you need to drive everywhere).
Combining the zip code with the wealth of the neighborhood may predict
the quality of the local elementary school. Given these three derived features
(family size, walkable, school quality), we may conclude that the price of the
home ultimately depends on these three features.
Formally, the input to a neural network is a set of input features
x1,x 2,x 3,x 4. We denote the intermediate variables for “family size”, “walk-
able”, and “school quality” by a1,a 2,a 3 (these ai’s are often referred to as


## Page 5

5
500 1000 1500 2000 2500 3000 3500 4000 4500 5000
0
100
200
300
400
500
600
700
800
900
1000
housing prices
square feet
price (in $1000)
Figure 1: Housing prices with a “kink” in the graph.
Family Size
School Quality
Walkable
Size
# Bedrooms
Zip Code
Wealth
Price
y
Figure 2: Diagram of a small neural network for predicting housing prices.
“hidden units” or “hidden neurons”). We represent each of the ai’s as a neu-
ral network with a single neuron with a subset of x1,...,x 4 as inputs. Then
as in Figure 1, we will have the parameterization:
a1 = ReLU(θ1x1 +θ2x2 +θ3)
a2 = ReLU(θ4x3 +θ5)
a3 = ReLU(θ6x3 +θ7x4 +θ8)
where (θ1,··· ,θ 8) are parameters. Now we represent the ﬁnal output hθ(x)
as another linear function with a1,a 2,a 3 as inputs, and we get 3
hθ(x) =θ9a1 +θ10a2 +θ11a3 +θ12 (2.3)
3Typically, for multi-layer neural network, at the end, near the output, we don’t apply
ReLU, especially when the output is not necessarily a positive number.


## Page 6

6
where θ contains all the parameters (θ1,··· ,θ 12).
Now we represent the output as a quite complex function of x with pa-
rametersθ. Then you can use this parametrization hθ with the machinery of
Section 1 to learn the parameters θ.
Inspiration from Biological Neural Networks. As the name suggests,
artiﬁcial neural networks were inspired by biological neural networks. The
hidden units a1,...,a m correspond to the neurons in a biological neural net-
work, and the parameters θi’s correspond to the synapses. However, it’s
unclear how similar the modern deep artiﬁcial neural networks are to the bi-
ological ones. For example, perhaps not many neuroscientists think biological
neural networks could have 1000 layers, while some modern artiﬁcial neural
networks do (we will elaborate more on the notion of layers.) Moreover, it’s
an open question whether human brains update their neural networks in a
way similar to the way that computer scientists learn artiﬁcial neural net-
works (using backpropagation, which we will introduce in the next section.).
Two-layer Fully-Connected Neural Networks. We constructed the
neural network in equation (2.3) using a signiﬁcant amount of prior knowl-
edge/belief about how the “family size”, “walkable”, and “school quality” are
determined by the inputs. We implicitly assumed that we know the family
size is an important quantity to look at and that it can be determined by
only the “size” and “# bedrooms”. Such a prior knowledge might not be
available for other applications. It would be more ﬂexible and general to have
a generic parameterization. A simple way would be to write the intermediate
variablea1 as a function of all x1,...,x 4:
a1 = ReLU(w⊤
1x +b1), where w1∈ R4 and b1∈ R (2.4)
a2 = ReLU(w⊤
2x +b2), where w2∈ R4 and b2∈ R
a3 = ReLU(w⊤
3x +b3), where w3∈ R4 and b3∈ R
We still deﬁne hθ(x) using equation (2.3) with a1,a 2,a 3 being deﬁned
as above. Thus we have a so-called fully-connected neural network as
visualized in the dependency graph in Figure 2 because all the intermediate
variablesai’s depend on all the inputs xi’s.
For full generality, a two-layer fully-connected neural network with m
hidden units and d dimensional input x∈ Rd is deﬁned as
∀j∈ [1,...,m ], z j =w[1]
j
⊤
x +b[1]
j where w[1]
j ∈ Rd,b [1]
j ∈ R (2.5)


## Page 7

7
Figure 3: Diagram of a two-layer fully connected neural network. Each edge
from node xi to node aj indicates that aj depends on xi. The edge from xi
to aj is associated with the weight (w[1]
j )i which denotes the i-th coordinate
of the vector w[1]
j . The activation aj can be computed by taking the ReLUof
the weighted sum of xi’s with the weights being the weights associated with
the incoming edges, that is, aj = ReLU(∑m
i=1(w[1]
j )ixi).
aj = ReLU(zj),
a = [a1,...,a m]⊤∈ Rm
hθ(x) =w[2]⊤
a +b[2] where w[2]∈ Rm,b [2]∈ R, (2.6)
Note that by default the vectors in Rd are viewed as column vectors, and
in particulara is a column vector with componentsa1,a 2,...,a m. The indices
[1] and [2] are used to distinguish two sets of parameters: the w[1]
j ’s (each of
which is a vector in Rd) and w[2] (which is a vector in Rm). We will have
more of these later.
Vectorization. Before we introduce neural networks with more layers and
more complex structures, we will simplify the expressions for neural networks
with more matrix and vector notations. Another important motivation of
vectorization is the speed perspective in the implementation. In order to
implement a neural network eﬃciently, one must be careful when using for
loops. The most natural way to implement equation (2.5) in code is perhaps
to use a for loop. In practice, the dimensionalities of the inputs and hidden
units are high. As a result, code will run very slowly if you use for loops.


## Page 8

8
Leveraging the parallelism in GPUs is/was crucial for the progress of deep
learning.
This gave rise to vectorization. Instead of using for loops, vectorization
takes advantage of matrix algebra and highly optimized numerical linear
algebra packages (e.g., BLAS) to make neural network computations run
quickly. Before the deep learning era, a for loop may have been suﬃcient
on smaller datasets, but modern deep networks and state-of-the-art datasets
will be infeasible to run with for loops.
We vectorize the two-layer fully-connected neural network as below. We
deﬁne a weight matrix W [1] in Rm×d as the concatenation of all the vectors
w[1]
j ’s in the following way:
W [1] =


— w[1]
1
⊤
—
— w[1]
2
⊤
—
...
— w[1]
m
⊤
—


∈ Rm×d (2.7)
Now by the deﬁnition of matrix vector multiplication, we can write z =
[z1,...,z m]⊤∈ Rm as


z1
...
...
zm


  
z∈ Rm×1
=


— w[1]
1
⊤
—
— w[1]
2
⊤
—
...
— w[1]
m
⊤
—


  
W [1]∈ Rm×d


x1
x2
...
xd


  
x∈ Rd×1
+


b[1]
1
b[1]
2
...
b[1]
m


  
b[1]∈ Rm×1
(2.8)
Or succinctly,
z =W [1]x +b[1] (2.9)
We remark again that a vector in Rd in this notes, following the conventions
previously established, is automatically viewed as a column vector, and can
also be viewed as a d× 1 dimensional matrix. (Note that this is diﬀerent
from numpy where a vector is viewed as a row vector in broadcasting.)
Computing the activations a∈ Rm from z∈ Rm involves an element-
wise non-linear application of the ReLU function, which can be computed in
parallel eﬃciently. Overloading ReLU for element-wise application of ReLU


## Page 9

9
(meaning, for a vector t∈ Rd, ReLU(t) is a vector such that ReLU( t)i =
ReLU(ti)), we have
a = ReLU(z) (2.10)
DeﬁneW [2] = [w[2]⊤
]∈ R1×m similarly. Then, the model in equation (2.6)
can be summarized as
a = ReLU(W [1]x +b[1])
hθ(x) =W [2]a +b[2] (2.11)
Here θ consists of W [1],W [2] (often referred to as the weight matrices) and
b[1],b [2] (referred to as the biases). The collection of W [1],b [1] is referred to as
the ﬁrst layer, andW [2],b [2] the second layer. The activationa is referred to as
the hidden layer. A two-layer neural network is also called one-hidden-layer
neural network.
Multi-layer fully-connected neural networks. With this succinct no-
tations, we can stack more layers to get a deeper fully-connected neu-
ral network. Let r be the number of layers (weight matrices). Let
W [1],...,W [r],b [1],...,b [r] be the weight matrices and biases of all the layers.
Then a multi-layer neural network can be written as
a[1] = ReLU(W [1]x +b[1])
a[2] = ReLU(W [2]a[1] +b[2])
···
a[r−1] = ReLU(W [r−1]a[r−2] +b[r−1])
hθ(x) =W [r]a[r−1] +b[r] (2.12)
We note that the weight matrices and biases need to have compatible
dimensions for the equations above to make sense. If a[k] has dimension mk,
then the weight matrixW [k] should be of dimension mk×mk−1, and the bias
b[k]∈ Rmk. Moreover, W [1]∈ Rm1×d and W [r]∈ R1×mr−1.
The total number of neurons in the network is m1 +··· +mr, and the
total number of parameters in this network is (d + 1)m1 + (m1 + 1)m2 +··· +
(mr−1 + 1)mr.
Sometimes for notational consistency we also write a[0] = x, and a[r] =
hθ(x). Then we have simple recursion that
a[k] = ReLU(W [k]a[k−1] +b[k]),∀k = 1,...,r − 1 (2.13)


## Page 10

10
Note that this would have be true for k = r if there were an additional
ReLU in equation (2.12), but often people like to make the last layer linear
(aka without a ReLU) so that negative outputs are possible and it’s easier
to interpret the last layer as a linear model. (More on the interpretability at
the “connection to kernel method” paragraph of this section.)
Other activation functions. The activation function ReLU can be re-
placed by many other non-linear function σ(·) that maps R to R such as
σ(z) = 1
1 +e−z (sigmoid) (2.14)
σ(z) = ez−e−z
ez +e−z (tanh) (2.15)
Why do we not use the identity function for σ(z)? That is, why
not use σ(z) = z? Assume for sake of argument that b[1] and b[2] are zeros.
Suppose σ(z) =z, then for two-layer neural network, we have that
hθ(x) =W [2]a[1] (2.16)
=W [2]σ(z[1]) by deﬁnition (2.17)
=W [2]z[1] since σ(z) =z (2.18)
=W [2]W [1]x from Equation (2.8) (2.19)
= ˜Wx where ˜W =W [2]W [1] (2.20)
Notice how W [2]W [1] collapsed into ˜W .
This is because applying a linear function to another linear function will
result in a linear function over the original input (i.e., you can construct a ˜W
such that ˜Wx =W [2]W [1]x). This loses much of the representational power
of the neural network as often times the output we are trying to predict
has a non-linear relationship with the inputs. Without non-linear activation
functions, the neural network will simply perform linear regression.
Connection to the Kernel Method. In the previous lectures, we covered
the concept of feature maps. Recall that the main motivation for feature
maps is to represent functions that are non-linear in the input x byθ⊤φ(x),
where θ are the parameters and φ(x), the feature map, is a handcrafted
function non-linear in the raw input x. The performance of the learning
algorithms can signiﬁcantly depends on the choice of the feature map φ(x).
Oftentimes people use domain knowledge to design the feature mapφ(x) that


## Page 11

11
suits the particular applications. The process of choosing the feature maps
is often referred to as feature engineering .
We can view deep learning as a way to automatically learn the right
feature map (sometimes also referred to as “the representation”) as follows.
Suppose we denote byβ the collection of the parameters in a fully-connected
neural networks (equation (2.12)) except those in the last layer. Then we
can abstract right a[r−1] as a function of the input x and the parameters in
β: a[r−1] =φβ(x). Now we can write the model as
hθ(x) =W [r]φβ(x) +b[r] (2.21)
Whenβ is ﬁxed, thenφβ(·) can viewed as a feature map, and therefore hθ(x)
is just a linear model over the features φβ(x). However, we will train the
neural networks, both the parameters in β and the parameters W [r],b [r] are
optimized, and therefore we are not learning a linear model in the feature
space, but also learning a good feature map φβ(·) itself so that it’s possi-
ble to predict accurately with a linear model on top of the feature map.
Therefore, deep learning tends to depend less on the domain knowledge of
the particular applications and requires often less feature engineering. The
penultimate layera[r] is often (informally) referred to as the learned features
or representations in the context of deep learning.
In the example of house price prediction, a fully-connected neural network
does not need us to specify the intermediate quantity such “family size”, and
may automatically discover some useful features in the last penultimate layer
(the activation a[r−1]), and use them to linearly predict the housing price.
Often the feature map / representation obtained from one datasets (that is,
the function φβ(·) can be also useful for other datasets, which indicates they
contain essential information about the data. However, oftentimes, the neural
network will discover complex features which are very useful for predicting
the output but may be diﬃcult for a human to understand or interpret. This
is why some people refer to neural networks as a black box , as it can be
diﬃcult to understand the features it has discovered.
3 Backpropagation
In this section, we introduce backpropgation or auto-diﬀerentiation, which
computes the gradient of the loss ∇J (j)(θ) eﬃciently. We will start with an
informal theorem that states that as long as a real-valued function f can be
eﬃciently computed/evaluated by a diﬀerentiable network or circuit, then its


## Page 12

12
gradient can be eﬃciently computed in a similar time. We will then show
how to do this concretely for fully-connected neural networks.
Because the formality of the general theorem is not the main focus here,
we will introduce the terms with informal deﬁnitions. By a diﬀerentiable
circuit or a diﬀerentiable network, we mean a composition of a sequence of
diﬀerentiable arithmetic operations (additions, subtraction, multiplication,
divisions, etc) and elementary diﬀerentiable functions (ReLU, exp, log, sin,
cos, etc.). Let the size of the circuit be the total number of such operations
and elementary functions. We assume that each of the operations and func-
tions, and their derivatives or partial derivatives ecan be computed in O(1)
time in the computer.
Theorem 3.1: [backpropagation or auto-diﬀerentiation, informally stated]
Suppose a diﬀerentiable circuit of size N computes a real-valued function
f : Rℓ→ R. Then, the gradient ∇f can be computed in time O(N), by a
circuit of size O(N).4
We note that the loss function J (j)(θ) for j-th example can be indeed
computed by a sequence of operations and functions involving additions,
subtraction, multiplications, and non-linear activations. Thus the theorem
suggests that we should be able to compute the ∇J (j)(θ) in a similar time
to that for computing J (j)(θ) itself. This does not only apply to the fully-
connected neural network introduced in the Section 2, but also many other
types of neural networks.
In the rest of the section, we will showcase how to compute the gradient of
the loss eﬃciently for fully-connected neural networks using backpropagation.
Even though auto-diﬀerentiation or backpropagation is implemented in all
the deep learning packages such as tensorﬂow and pytorch, understanding it
is very helpful for gaining insights into the working of deep learning.
3.1 Preliminary: chain rule
We ﬁrst recall the chain rule in calculus. Suppose the variable J depends on
the variables θ1,...,θ p via the intermediate variable g1,...,g k:
gj =gj(θ1,...,θ p),∀j∈{ 1,··· ,k} (3.1)
4We note if the output of the functionf does not depend on some of the input coordinates,
then we set by default the gradient w.r.t that coordinate to zero. Setting to zero does
not count towards the total runtime here in our accounting scheme. This is why when
N≤ℓ, we can compute the gradient in O(N) time, which might be potentially even less
than ℓ.


## Page 13

13
J =J(g1,...,g k) (3.2)
Here we overload the meaning of gj’s: they denote both the intermediate
variables but also the functions used to compute the intermediate variables.
Then, by the chain rule, we have that ∀i,
∂J
∂θi
=
k∑
j=1
∂J
∂gj
∂gj
∂θi
(3.3)
For the ease of invoking the chain rule in the following subsections in various
ways, we will call J the output variable, g1,...,g k intermediate variables,
and θ1,...,θ p the input variable in the chain rule.
3.2 One-neuron neural networks
Simplifying notations: In the rest of the section, we will consider a
generic input x and compute the gradient of hθ(x) w.r.t θ. For simplicity,
we use o as a shorthand for hθ(x) (o stands for output). For simplicity, with
slight abuse of notation, we use J = 1
2(y−o)2 to denote the loss function.
(Note that this overrides the deﬁnition of J as the total loss in Section 1.)
Our goal is to compute the derivative of J w.r.t the parameter θ.
We ﬁrst consider the neural network with one neuron deﬁned in equa-
tion (2.2). Recall that we compute the loss function via the following se-
quential steps:
z =w⊤x +b (3.4)
o = ReLU(z) (3.5)
J = 1
2(y−o)2 (3.6)
By the chain rule withJ as the output variable,o as the intermediate variable,
and wi the input variable, we have that
∂J
∂wi
= ∂J
∂o· ∂o
∂wi
(3.7)
Invoking the chain rule with o as the output variable, z as the intermediate
variable, and wi the input variable, we have that
∂o
∂wi
= ∂o
∂z· ∂z
∂wi


## Page 14

14
Combining the equation above with equation (3.7), we have
∂J
∂wi
= ∂J
∂o· ∂o
∂z· ∂z
∂wi
= (o−y)· 1{z≥ 0}· xi
(because ∂J
∂o = (o−y) and ∂o
∂z = 1{z≥ 0} and ∂z
∂wi
=xi)
Here, the key is that we reduce the computation of ∂J
∂wi
to the computa-
tion of three simpler more “local” objects ∂J
∂o, ∂o
∂z , and ∂z
∂wi
, which are much
simpler to compute because J directly depends on o via equation (3.6), o
directly depends on a via equation (3.5), and z directly depends on wi via
equation (3.4). Note that in a vectorized form, we can also write
∇wJ = (o−y)· 1{z≥ 0}· x
Similarly, we compute the gradient w.r.t b by
∂J
∂b = ∂J
∂o· ∂o
∂z· ∂z
∂b = (o−y)· 1{z≥ 0}
(because ∂J
∂o = (o−y) and ∂o
∂z = 1{z≥ 0} and ∂z
∂b = 1)
3.3 Two-layer neural networks: a low-level unpacked
computation
Note: this subsection derives the derivatives with low-level notations to
help you build up intuition on backpropagation. If you are looking for a
clean formula, or you are familiar with matrix derivatives, then feel free to
jump to the next subsection directly.
Now we consider the two-layer neural network deﬁned in equation (2.6).
We compute the loss J by following sequence of operations
∀j∈ [1,...,m ], z j =w[1]
j
⊤
x +b[1]
j where w[1]
j ∈ Rd,b [1]
j
aj = ReLU(zj),
a = [a1,...,a m]⊤∈ Rm
o =w[2]⊤
a +b[2] where w[2]∈ Rm,b [2]∈ R
J = 1
2(y−o)2 (3.8)
We will use (w[2])ℓ to denote theℓ-th coordinate of w[2], and (w[1]
j )ℓ to denote
the ℓ-coordinate of w[1]
j . (We will avoid using these cumbersome notations
once we ﬁgure out how to write everything in matrix and vector forms.)


## Page 15

15
By invoking chain rule with J as the output variable, o as intermediate
variable, and (w[2])ℓ as the input variable, we have
∂J
∂(w[2])ℓ
= ∂J
∂o
∂o
∂(w[2])ℓ
= (o−y) ∂o
∂(w[2])ℓ
= (o−y)aℓ
It’s more challenging to compute ∂J
∂(w[1]
j )ℓ
. Towards computing it, we ﬁrst
invoke the chain rule with J as the output variable, zj as the intermediate
variable, and (w[1]
j )ℓ as the input variable.
∂J
∂(w[1]
j )ℓ
= ∂J
∂zj
· ∂zj
∂(w[1]
j )ℓ
= ∂J
∂zj
·xℓ (becaues ∂zj
∂(w[1]
j )ℓ
=xℓ.)
Thus, it suﬃces to compute the ∂J
∂zj
. We invoke the chain rule with J as the
output variable,aj as the intermediate variable, andzj as the input variable,
∂J
∂zj
= ∂J
∂aj
∂aj
∂zj
= ∂J
∂aj
1{zj≥ 0}
Now it suﬃces to compute ∂J
∂aj
, and we invoke the chain rule with J as the
output variable,o as the intermediate variable, and aj as the input variable,
∂J
∂aj
= ∂J
∂o
∂o
∂aj
= (o−y)· (w[2])j
Now combining the equations above, we obtain
∂J
∂(w[1]
j )ℓ
= (o−y)· (w[2])j1{zj≥ 0}xℓ
Next we gauge the runtime of computing these partial derivatives. Let p
denotes the total number of parameters in the network. We note thatp≥md


## Page 16

16
where m is the number of hidden units and d is the input dimension. For
every j and ℓ, to compute ∂J
∂(w[1]
j )ℓ
, apparently we need to compute at least
the output o, which takes at least p≥md operations. Therefore at the ﬁrst
glance computing a single gradient takes at leastmd time, and the total time
to compute the derivatives w.r.t to all the parameters is at least (md)2, which
is ineﬃcient.
However, the key of the backpropagation is that for diﬀerent choices of ℓ,
the formulas above for computing ∂J
∂(w[1]
j )ℓ
share many terms, such as, (o−y),
(w[2])j and 1{zj≥ 0}. This suggests that we can re-organize the computation
to leverage the shared computation.
It turns out the crucial shared quantities in these formulas are ∂J
∂o ,
∂J
∂z1
,..., ∂J
∂zm
. We now write the following formulas to compute the gradi-
ents eﬃciently in Algorithm 3.
Algorithm 3 Backpropagation for two-layer neural networks
1: Compute the values ofz1,...,z m,a1,...,a m ando as in the deﬁnition of
neural network (equation (3.8)).
2: Compute ∂J
∂o = (o−y).
3: Compute ∂J
∂zj
for j = 1,...,m by
∂J
∂zj
= ∂J
∂o
∂o
∂aj
∂aj
∂zj
= ∂J
∂o· (w[2])j· 1{zj≥ 0} (3.9)
4: Compute ∂J
∂(w[1]
j )ℓ
, ∂J
∂b[1]
j
, ∂J
∂(w[2])j
, and ∂J
∂b[2] by
∂J
∂(w[1]
j )ℓ
= ∂J
∂zj
· ∂zj
∂(w[1]
j )ℓ
= ∂J
∂zj
·xℓ
∂J
∂b[1]
j
= ∂J
∂zj
· ∂zj
∂b[1]
j
= ∂J
∂zj
∂J
∂(w[2])j
= ∂J
∂o
∂o
∂(w[2])j
= ∂J
∂o·aj
∂J
∂b[2] = ∂J
∂o
∂o
∂b[2] = ∂J
∂o


## Page 17

17
3.4 Two-layer neural network with vector notation
As we have done before in the deﬁnition of neural networks, the equations for
backpropagation becomes much cleaner with proper matrix notation. Here
we state the algorithm ﬁrst and also provide a cleaner proof via matrix cal-
culus.
Let
δ[2] ≜ ∂J
∂o ∈ R
δ[1] ≜ ∂J
∂z ∈ Rm (3.10)
Here we note that when A is a real-valued variable, 5 and B is a vector or
matrix variable, then ∂A
∂B denotes the collection of the partial derivatives with
the same shape as B.6 In other words, if B is a matrix of dimension m×d,
then ∂A
∂B is a matrix in Rm×d with ∂A
∂Bij
as the ijth-entry. Let v⊙w denote
the entry-wise product of two vectors v and w of the same dimension. Now
we are ready to describe backpropagation in Algorithm 4.
Algorithm 4 Back-propagation for two-layer neural networks in vectorized
notations..
1: Compute the values of z∈ Rm, a∈ Rm, and o
2: Compute δ[2] = (o−y)∈ R
3: Compute δ[1] = (o−y)·W [2]⊤
⊙ 1{z≥ 0}∈ Rm×1
4: Compute
∂J
∂W [2] =δ[2]a⊤∈ R1×m
∂J
∂b[2] =δ[2]∈ R
∂J
∂W [1] =δ[1]x⊤∈ Rm×d
∂J
∂b[1] =δ[1]∈ Rm
5We will avoid using the notation ∂A
∂B for A that is not a real-valued variable.
6If you are familiar with the notion of total derivatives, we note that the dimensionality
here is diﬀerent from that for total derivatives.


## Page 18

18
Derivation using the chain rule for matrix multiplication. To
have a succinct derivation of the backpropagation algorithm in Algorithm 4
without working with the complex indices, we state the extensions of the
chain rule in vectorized notations. It requires more knowledge of matrix
calculus to state the most general result, and therefore we will introduce
a few special cases that are most relevant for deep learning. Suppose J
is a real-valued output variable, z ∈ Rm is the intermediate variable and
W∈ Rm×d,u∈ Rd are the input variables. Suppose they satisfy:
z =Wu +b, where W∈ Rm×d
J =J(z) (3.11)
Then we can compute ∂J
∂u and ∂J
∂W by:
∂J
∂u =W ⊤∂J
∂z (3.12)
∂J
∂W = ∂J
∂z·u⊤ (3.13)
∂J
∂b = ∂J
∂z (3.14)
We can verify the dimensionality is indeed compatible because ∂J
∂z ∈ Rm,
W ⊤∈ Rd×m, ∂J
∂u∈ Rd, ∂J
∂W ∈ Rm×d, u⊤∈ R1×d.
Here the chain rule in equation (3.12) only works for the special cases
where z =Wu . Another useful case is the following:
a =σ(z), where σ is an element-wise activation, z,a∈ Rd
J =J(a)
Then, we have that
∂J
∂z = ∂J
∂a⊙σ′(z) (3.15)
where σ′(·) is the element-wise derivative of the activation function σ, and
⊙ is element-wise product of two vectors of the same dimensionality.
Using equation (3.12), (3.13),and (3.15), we can verify the correctness of
Algorithm 4. Indeed, using the notations in the two-layer neural network
∂J
∂z = ∂J
∂a⊙ ReLU′(z) ( by invoking equation (3.15) with setting
J ←J, a ←a, z ←a, σ ← ReLU. )


## Page 19

19
= (o−y)W [2]⊤
⊙ ReLU′(z) ( by invoking equation (3.12) with setting
J ←J, z ←o, W ←W [2], u ←a, b ←b[2])
Therefore, δ[1] = ∂J
∂z , and we verify the correctness of Line 3 in Algorithm 4.
Similarly, let’s verify the third equation in Line 4,
∂J
∂W [1] = ∂J
∂z·x⊤ ( by invoking equation (3.13) with setting
J ←J, z ←z, W ←W [1], u ←x, b ←b[1])
=δ[1]x⊤ (because we have proved δ[1] = ∂J
∂z )
3.5 Multi-layer neural networks
In this section, we will derive the backpropagation algorithms for the model
deﬁned in (2.12). Recall that we have
a[1] = ReLU(W [1]x +b[1])
a[2] = ReLU(W [2]a[1] +b[2])
···
a[r−1] = ReLU(W [r−1]a[r−2] +b[r−1])
a[r] =z[r] =W [r]a[r−1] +b[r]
J = 1
2(a[r]−y)2
Here we deﬁne both a[r] and z[r] as hθ(x) for notational simplicity.
Deﬁne
δ[k] = ∂J
∂z [k] (3.16)
The backpropagation algorithm computes δ[k]’s from k = r to 1, and
computes ∂J
∂W [k] from δ[k] as described in Algorithm 5.
4 Vectorization Over Training Examples
As we discussed in Section 1, in the implementation of neural networks, we
will leverage the parallelism across the multiple examples. This means that
we will need to write the forward pass (the evaluation of the outputs) of
the neural network and the backward pass (backpropagation) for multiple
training examples in matrix notation.


## Page 20

20
Algorithm 5 Back-propagation for multi-layer neural networks..
1: Compute and store the values of a[k]’s and z[k]’s for k = 1,...,r − 1, and
J. ⊿ This is often called the “forward pass”
2: Compute δ[r] = ∂J
∂z [r] = (z[r]−o).
3: for k =r− 1 to 1 do
4: Compute
δ[k] = ∂J
∂z [k] =
(
W [k+1]⊤
δ[k+1]
)
⊙ ReLU′(z[k])
5: Compute
∂J
∂W [k+1] =δ[k+1]a[k]⊤
∂J
∂b[k+1] =δ[k+1]
The basic idea. The basic idea is simple. Suppose you have a training
set with three examples x(1),x (2),x (3). The ﬁrst-layer activations for each
example are as follows:
z[1](1) =W [1]x(1) +b[1]
z[1](2) =W [1]x(2) +b[1]
z[1](3) =W [1]x(3) +b[1]
Note the diﬀerence between square brackets [·], which refer to the layer num-
ber, and parenthesis (·), which refer to the training example number. In-
tuitively, one would implement this using a for loop. It turns out, we can
vectorize these operations as well. First, deﬁne:
X =


| | |
x(1) x(2) x(3)
| | |

∈ Rd×3 (4.1)
Note that we are stacking training examples in columns and not rows. We
can then combine this into a single uniﬁed formulation:
Z [1] =


| | |
z[1](1) z[1](2) z[1](3)
| | |

 =W [1]X +b[1] (4.2)


## Page 21

21
You may notice that we are attempting to add b[1] ∈ R4×1 to W [1]X ∈
R4×3. Strictly following the rules of linear algebra, this is not allowed. In
practice however, this addition is performed using broadcasting. We create
an intermediate ˜b[1]∈ R4×3:
˜b[1] =


| | |
b[1] b[1] b[1]
| | |

 (4.3)
We can then perform the computation: Z [1] =W [1]X + ˜b[1]. Often times, it
is not necessary to explicitly construct ˜b[1]. By inspecting the dimensions in
(4.2), you can assume b[1]∈ R4×1 is correctly broadcast to W [1]X∈ R4×3.
The matricization approach as above can easily generalize to multiple
layers, with one subtlety though, as discussed below.
Complications/Subtlety in the Implementation. All the deep learn-
ing packages or implementations put the data points in the rows of a data
matrix. (If the data point itself is a matrix or tensor, then the data are con-
centrated along the zero-th dimension.) However, most of the deep learning
papers use a similar notation to these notes where the data points are treated
as column vectors.7 There is a simple conversion to deal with the mismatch:
in the implementation, all the columns become row vectors, row vectors be-
come column vectors, all the matrices are transposed, and the orders of the
matrix multiplications are ﬂipped. In the example above, using the row ma-
jor convention, the data matrix is X∈ R3×d, the ﬁrst layer weight matrix
has dimensionality d×m (instead of m×d as in the two layer neural net
section), and the bias vector b[1]∈ R1×m. The computation for the hidden
activation becomes
Z [1] =XW [1] +b[1]∈ R3×m (4.4)
7The instructor suspects that this is mostly because in mathematics we naturally multiply
a matrix to a vector on the left hand side.
