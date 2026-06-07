# Ecole Na tionale Supérieure des Mines de Saint-Etienne Numerical Methods

Converted from: `Numerical Methods\Numerical Methods.pdf`


## Page 1

Ecole Na tionale Supérieure des Mines de Saint-Etienne
Numerical Methods
for solving ODEs and PDEs
Document written by Olivier BONNEFOY
Mail : bonnefoy@emse.fr
Version : 1.4 of December 9, 2025
Student version


## Page 2

Latest version available here: http://www.emse.fr/~bonnefoy/Public/MetNum-EMSE.pdf
2


## Page 3

Contents
1 Discretization 1
1.1 Grid / mesh . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
1.1.1 Structured grids . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
1.1.2 Unstructured grids . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1
1.1.3 Grid renement . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 2
1.2 Finite Dierence Method (FDM) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1.2.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1.2.2 Central, Forward, and Backward Dierences . . . . . . . . . . . . . . . . . . . . . . . . 4
1.2.3 Upwind and downwind schemes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4
1.3 Temporal discretization . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
1.3.1 Explicit Methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
1.3.1.1 Forward Euler method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
1.3.1.2 Leapfrog method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
1.3.1.3 Runge-Kutta methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
1.3.1.4 Heun's method (Improved Euler) . . . . . . . . . . . . . . . . . . . . . . . . . 7
1.3.1.5 Strong Stability-Preserving (SSP) methods . . . . . . . . . . . . . . . . . . . 7
1.3.1.6 Velocity Verlet method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
1.3.2 Implicit Methods . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
1.3.2.1 Backward Euler method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
1.3.2.2 Crank-Nicolson Method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
1.3.2.3 Backward Dierentiation Formula (BDF) . . . . . . . . . . . . . . . . . . . . 8
1.3.2.4 Implicit Runge-Kutta Methods . . . . . . . . . . . . . . . . . . . . . . . . . . 8
1.4 Order of accuracy . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
1.4.1 Local Truncation Error . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
1.4.2 Global Truncation Error . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
1.4.3 Comparing orders of accuracy . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
2 Stability analysis 13
2.1 Convergence . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 13
2.2 Consistency . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 13
2.3 Stability . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14
2.4 Linear stability analysis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
2.4.1 General presentation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
2.4.2 Method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
2.4.3 Example . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
2.5 Stability regions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17
2.6 Dissipation and Dispersion . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 18
2.6.1 Numerical dissipation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 18
2.6.2 Numerical dispersion . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
i


## Page 4

Contents
3 Miscellaneous 21
3.1 Boundary Conditions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
3.1.1 Dirichlet boundary conditions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
3.1.2 Neumann boundary conditions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
3.1.3 Robin boundary conditions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
3.2 Computational Cost . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22
3.2.1 Complexity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22
3.2.2 Eciency . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22
4 Exercises 23
4.1 1D Advection-Diusion Equation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23
4.2 Von Neumann stability analysis of the Leapfrog scheme used for solving 2nd law of Newton . 25
ii


## Page 5

Chapter 1
Discretization
1.1 Grid / mesh
A grid (or mesh) is a discretization of the continuous domain of a Partial Dierential Equation (PDE).
The domain is divided into smaller sub-domains, typically called cells, elements, or control volumes, over
which the PDE is approximated using numerical methods.
The main goal of using a grid is to transform the continuous problem into a discrete problem that can be
solved numerically. The accuracy and eciency of the solution often depend on the type of grid and the
method used for discretization.
1.1.1 Structured grids
A structured grid is a grid in which the cells are organized in a regular, grid-like pattern. The indices of
the grid points (or cells) can be easily mapped using a simple Cartesian coordinate system.
 Uniform cartesian grid: a grid with equal spacing in all directions.
 Non-uniform cartesian grid: a grid where the spacing varies but maintains a regular structure.
Structured grids have the following characteristics:
 Advantages :
 Easier implementation due to regular connectivity.
 Simplied indexing and storage.
 Ecient for solving problems on simple geometries.
 Disadvantages :
 Not suitable for complex geometries or domains with irregular boundaries.
1.1.2 Unstructured grids
An unstructured grid is a grid where the cells are not arranged in a regular pattern. The grid can have
arbitrary connectivity, making it more exible in handling complex geometries. For example:
 Triangular or tetrahedral mesh: commonly used in two or three-dimensional problems, especially for
irregular domains.
 Hybrid mesh: a combination of dierent types of cells (e.g., triangles and quadrilaterals in 2D, or
tetrahedra and hexahedra in 3D).
1


## Page 6

Chapter 1. Discretization
Figure 1.1: Example of structured (left) and unstructured mesh (right). Source.
Unstructured grids have the following characteristics:
 Advantages :
 High exibility in tting complex geometries.
 Better suited for adaptive renement (where the grid is rened in regions requiring higher reso-
lution).
 Disadvantages :
 More complex data structures and indexing.
 Typically requires more computational resources due to irregularity.
Example: consider the problem of solving the temperature distribution in a complex-shaped object like
an aircraft wing. A structured grid might work well in simple regions of the wing but would struggle to
accurately represent the curved surfaces and ne details. An unstructured grid, possibly using triangular
or tetrahedral elements, would better t the contours of the wing, allowing for more accurate temperature
predictions near curved boundaries.
1.1.3 Grid renement
Grid renement is the process of increasing the resolution of the grid to improve the accuracy of numerical
solutions. This can be done globally or locally:
 Global renement : increasing grid resolution uniformly across the entire domain. Applied when the
solution requires high accuracy throughout.
 Local renement : enhancing the grid resolution in regions of interest while keeping the grid coarser
elsewhere. Useful for capturing detailed features where needed.
Various renement strategies exist:
 Uniform renement : divides each grid cell into smaller cells uniformly across the domain.
 Non-uniform renement : applies renement based on specic criteria such as error estimation or
gradients in the solution.
With the Adaptive Mesh Renement (AMR) , the grid is adjusted dynamically (every few timesteps)
based on the solution's behavior. It often renes the mesh where the solution is complex and coarsens it
where the solution is smooth.
2


## Page 7

1.2. Finite Dierence Method (FDM)
Figure 1.2: Global renement: all elements are reduced, whatever their position in the domain. Source.
Figure 1.3: Local renement: elements are reduced where a strong gradient exists (here stress). Source.
Example: for solving the heat equation in a domain with a sharp temperature gradient near a boundary, a
uniform grid might not capture this gradient accurately. By applying local renement around the boundary,
the grid can better represent the temperature changes, resulting in more accurate solutions.
1.2 Finite Dierence Method (FDM)
1.2.1 Introduction
The Finite Dierence Method (FDM) is a numerical technique used to approximate solutions to dif-
ferential equations by replacing derivatives with nite dierences. This approach is widely used due to its
simplicity and eectiveness for solving PDEs.
Notation : for a PDE involving the function u(x, t), the value of u at location xi and at time step tn is
usually noted un
i .
Key Steps:
1. Discretize the domain: divide the domain into a grid or mesh.
2. Approximate derivatives: use nite dierences to approximate the derivatives at each grid point.
Examples:
 First-order forward dierence: ∂u
∂x ≈ ui+1−ui
∆x
3


## Page 8

Chapter 1. Discretization
 Second-order central dierence: ∂2u
∂x2 ≈ ui+1−2ui+ui−1
(∆x)2
3. Formulate algebraic equations: replace the PDE with a system of linear or nonlinear equations based
on the approximations.
1.2.2 Central, Forward, and Backward Dierences
Finite dierence approximations involve dierent ways of approximating derivatives using the values of
the function at discrete points. Here are the main types for rst-order and second-order derivatives:
 F orward dierence : uses the value at the current point and the next point to approximate the
derivative.
∂u
∂x ≈ ui+1 − ui
∆x and ∂2u
∂x2 ≈ ui+2 − 2ui+1 + ui
(∆x)2
 Backward dierence : uses the value at the current point and the previous point to approximate the
derivative.
∂u
∂x ≈ ui − ui−1
∆x and ∂2u
∂x2 ≈ ui − 2ui−1 + ui−2
(∆x)2
 Central dierence : uses the values at the points on either side of the current point for a more
accurate approximation.
∂u
∂x ≈ ui+1 − ui−1
2∆x and ∂2u
∂x2 ≈ ui+1 − 2ui + ui−1
(∆x)2
Here is an illustration:
Figure 1.4: Among the three ways to compute the rst derivative at point x, the central dierence is most
accurate. Source.
1.2.3 Upwind and downwind schemes
The upwind/downwind denomination is relevant when the PDE contains an advection term, that is to say
when a uid is moving.
The upwind or upstream side of a node refers to the side where the uid is coming from, whereas the
downwind or downstream side of a node refers to the side where the uid is owing to. As illustrated on
4


## Page 9

1.2. Finite Dierence Method (FDM)
Fig. 1.5, since the uid velocity may change its direction from one node to another, the upwind side is node-
specic and time-specic. Hence, the numerical scheme (i.e. the dierentiation operator) is node-specic
and time-specic.
Figure 1.5: Top image: the uid velocity c is positive (directed towards positive x), the upwind region is
on the left and the downwind region is on the right. Bottom image: the uid velocity is negative (directed
towards negative x), the upwind region is on the right and the downwind region is on the left. Source.
A scheme is said to be "upwind" when the spatial dierences are skewed in the "upwind" direction, i.e., the
direction from which the advecting ow originates.
Consider the following 1D advection equation:
∂u
∂t + c. ∂u
∂x = 0 with the initial condition u(x, 0) = exp

− x2
2σ2

The exact solution is a Gaussian prole that shifts with time due to advection:
u(x, t) = exp

−(x − ct)2
2σ2

(1.1)
When the velocity c is positive (resp. negative), the Gaussian prole shifts to the right (resp. left) at a
constant speed. We will now discretize this PDE using a Forward Euler in Time time-marching method and
two dierent spatial schemes.
The rst-order centered spatial dierence scheme is:
un+1
i − un
i
∆t + c. un
i+1 − un
i−1
2∆x = 0
5


## Page 10

Chapter 1. Discretization
The rst-order upwind spatial dierence scheme is:



un+1
i − un
i
∆t + c. un
i − un
i−1
∆x = 0 if c > 0
un+1
i − un
i
∆t + c. un
i+1 − un
i
∆x = 0 if c < 0
1.3 Temporal discretization
Time-stepping methods involve techniques to advance the solution of a PDE from one time step to the
next. These methods are crucial in numerical simulations to handle the temporal component of the problem.
Given a time-dependent PDE, the goal is to advance the solution from time tn to tn+1 using a time step
∆t = tn+1 − tn.
Assume the PDE can be written in the form:
∂u(t)
∂t = f(u(t)),
where u(t) is the unknown function of time, and f(u(t)) represents the spatial derivatives and any other
terms that do not involve time derivatives. We note un = u(tn) and un+1 = u(tn+1).
Two families of scheme exist: explicit methods, which are implemented in direct solvers and implicit meth-
ods, which are implemented in iterative solvers. They are described in more details below.
1.3.1 Explicit Methods
The time-stepping scheme is said to be explicit when the solution at the next time step is expressed explic-
itly in terms of known values at the current and previous time steps.
Explicit time-stepping schemes vary in complexity and accuracy. The choice of scheme depends on the spe-
cic requirements of the problem, such as accuracy, computational cost, and stability. While simple methods
like Forward Euler are easy to implement, more advanced methods like Runge-Kutta, SSP schemes, and the
Velocity Verlet method oer greater accuracy and stability, making them suitable for more complex and sti
problems.
Direct solvers are used to implement explicit methods. These solvers attempt to nd the exact solution.
1.3.1.1 F orward Euler method
The F orward Euler method is the simplest explicit time-stepping scheme. It is a rst-order method:
un+1 = un + ∆t · f(tn, un)
Here, un is the solution at the current time step tn, and un+1 is the solution at the next time step tn+1 =
tn + ∆t. The function f(tn, un) represents the right-hand side of the dierential equation. The Forward
Euler method may require prohibitively small time steps for stability.
1.3.1.2 Leapfrog method
The Leapfrog method is a second-order explicit time-stepping scheme that is particularly well-suited for
oscillatory problems. It uses information from two previous time steps to compute the solution at the next
time step:
un+1 = un−1 + 2∆t · f(tn, un)
This method "leaps" over the intermediate step, hence the name "leapfrog."
6


## Page 11

1.3. T emporal discretization
1.3.1.3 Runge-Kutta methods
Runge-Kutta methods are a family of higher-order explicit methods that achieve greater accuracy by
evaluating the derivative multiple times within each time step. The most common is the classical fourth-
order Runge-Kutta method (RK4):
k1 = ∆t · f(tn, un)
k2 = ∆t · f

tn + ∆t
2 , un + k1
2

k3 = ∆t · f

tn + ∆t
2 , un + k2
2

k4 = ∆t · f(tn + ∆t, un + k3)
un+1 = un + 1
6(k1 + 2k2 + 2k3 + k4)
The RK4 method is a standard choice for many applications due to its balance of accuracy and computational
cost.
1.3.1.4 Heun's method (Improved Euler)
Heun's method is a second-order Runge-Kutta method, also known as the improved Euler method or
Runge-Kutta 2 (RK2) method. It is more accurate than the Forward Euler method and less computationally
intensive than RK4:
k1 = ∆t · f(tn, un)
k2 = ∆t · f(tn + ∆t, un + k1)
un+1 = un + 1
2(k1 + k2)
Heun's method provides a compromise between the simplicity of the Euler method and the accuracy of
higher-order schemes.
1.3.1.5 Strong Stability-Preserving (SSP) methods
SSP methods are designed for solving hyperbolic PDEs where maintaining the stability of the numerical
solution is critical. These methods are explicit and can be of higher order while preserving the non-oscillatory
nature of the solution. Example of the SSP RK3:
u(1) = un + ∆t · f(tn, un)
u(2) = 3
4 un + 1
4

u(1) + ∆t · f(tn + ∆t, u(1))

un+1 = 1
3 un + 2
3

u(2) + ∆t · f(tn + ∆t
2 , u(2))

SSP methods are especially useful in cases where high stability is required.
1.3.1.6 V elocity V erlet method
The V elocity V erlet method is a second-order scheme commonly used in molecular dynamics simulations.
It provides an accurate way to integrate Newton's equations of motion, oering a good balance between
accuracy and computational eciency:
un+1 = un + ∆t · vn + 1
2∆t2 · an
vn+1 = vn + 1
2∆t · (an + an+1)
Here, u represents the position, v the velocity, and a the acceleration. The method calculates the new
position using the current velocity and acceleration, and then updates the velocity using the average of the
current and next accelerations.
7


## Page 12

Chapter 1. Discretization
1.3.2 Implicit Methods
Time-stepping methods are said implicit when the solution at the next time step involves solving a system
of equations, as it depends on both the current and next time steps. Implicit methods are often favored
for their stability properties, particularly in sti problems. Below are some of the common implicit time-
stepping schemes.
Iterative solvers are used to implement implicit methods. They are essential for solving large systems of
linear equations, especially when the matrix is sparse or when exact solutions are computationally infeasible.
Unlike direct solvers, which attempt to nd the exact solution, iterative solvers generate a sequence of
approximations that converge to the true solution. The convergence of iterative solvers is typically assessed
using residuals, which measure how close the current solution is to satisfying the system of equations. The
iteration process continues until the norm of the residuals falls below a predened tolerance level, indicating
that the solution has converged. The convergence plot of a specic iterative solver shows how the error
decreases with each iteration.
1.3.2.1 Backward Euler method
The Backward Euler method evaluates the function at the next time step:
un+1 − un
∆t = f(tn+1, un+1)
Rearranging to solve for un+1:
un+1 = un + ∆t · f(tn+1, un+1)
Advantages: unconditionally stable for linear problems, suitable for sti equations.
Disadvantages: often requires the use of iterative methods, such as Newton's method, to solve for un+1,
as f(un+1) is typically non linear.
1.3.2.2 Crank-Nicolson Method
This method averages the Forward and Backward Euler methods:
un+1 − un
∆t = 1
2

f(tn, un) + f(tn+1, un+1)

or equivalently:
un+1 = un + ∆t
2

f(tn, un) + f(tn+1, un+1)

Advantages: Second-order accurate, stable.
Disadvantages: Requires solving a nonlinear system at each time step.
1.3.2.3 Backward Dierentiation F ormula (BDF)
The BDF methods are a family of implicit multi-step methods. The second-order BDF (BDF2) is given by:
3un+1 − 4un + un−1
2∆t = f(tn+1, un+1)
Advantages: Good stability, can achieve higher accuracy.
Disadvantages: Requires solving more complex equations for higher-order schemes.
1.3.2.4 Implicit Runge-Kutta Methods
An example is the Implicit Midpoint Rule:
un+1 = un + ∆t · f

tn + ∆t
2 , un + un+1
2

Advantages: High accuracy and stability.
Disadvantages: Solving the implicit equations can be computationally expensive.
8


## Page 13

1.4. Order of accuracy
1.4 Order of accuracy
In this section, the dierent errors are dened. Then, the order of accuracy of the numerical scheme is
presented.
Round-o errors occur due to the nite precision of computer arithmetic. When numbers are rounded to
t within the available precision (8 bits, 16 bits, ...), small errors are introduced that can accumulate over
computations. These errors can aect the accuracy and stability of numerical solutions.
T runcation errors arise when an innite series is approximated by a nite series. In numerical methods,
this occurs when derivatives are approximated by nite dierences, leading to discrepancies between the
exact and approximate solutions.
Since a careful analysis of roundo error is beyond the scope of this book, we will consider only truncation
errors
1.4.1 Local Truncation Error
The Local T runcation Error (LTE) of a numerical method is the error introduced in a single step of the
method due to the approximation of the dierential equation. It measures the dierence between the exact
solution and the numerical solution after one time step, assuming the initial value is exact.
The local truncation error, sometimes called "discretization error per timestep", is used to evaluate the order
of accuracy of a given numerical scheme, which describes how the error decreases as the step size is reduced.
It can apply to space step size or time step size equivalently.
Let us recall the dierence between two dierent notations:
■ y(tn) designates the exact value of the function y(t) at time tn = n.∆t
■ yn designates the numerical approximation of the exact value at time tn
By denition, the local truncation error τn+1 is the dierence between y(tn+1) which is the exact value
of y at time tn+1 = (n + 1) .∆t and yn+1 which is the approximate value obtained with a given numerical
integration scheme with the assumption that the numerical value yn at timestep tn is exactly equal to
the theoretical value y(tn):
τn+1 ≡ y(tn+1) − yn+1 assuming y(tn) = yn (1.2)
Example. Consider a generic rst-order ordinary dierential equation (ODE):
dy
dt = f(t, y), y (t0) = y0.
Let us expand the function y around tn in a Taylor series:
y(tn+1) = y(tn + ∆t) = y(tn) + ∆t
1!
dy
dt

tn
+ ∆t2
2!
d2y
dt2

tn
+ O

∆t3
= yn + ∆t
1!
dy
dt

tn
+ ∆t2
2!
d2y
dt2

tn
+ O

∆t3
since y(tn) = yn
= yn + ∆t
1! f(tn) + ∆t2
2!
d f
dt

tn
+ O

∆t3
since dy
dt = f
If the temporal derivative is approximated by an (explicit) Forward Euler scheme, the ODE becomes:
yn+1 − yn
∆t = f(tn)
9


## Page 14

Chapter 1. Discretization
Hence:
yn+1 = yn + f(tn).∆t
Now, it is possible to compute the local truncation error:
τn+1 ≡ y(tn+1) − yn+1
=
"
yn + ∆t
1! f(tn) + ∆t2
2!
d f
dt

tn
+ O

∆t3
#
− [yn + f(tn).∆t]
= ∆t2
2!
d f
dt

tn
+ O

∆t3
= O

∆t2
The gure 1.6 illustrates the concept of local error.
Figure 1.6: Illustration of local and global errors for a Forward Euler integration scheme.
1.4.2 Global Truncation Error
The Global T runcation Error (GTE) in a numerical method is the cumulative error that arises after
multiple steps in the numerical approximation of a dierential equation. Unlike the Local Truncation Error
(LTE), which measures the error introduced in a single step assuming the initial value is exact, the GTE
accounts for the accumulation of errors over all previous steps in the method.
Mathematically, if y(t) is the exact solution of an ordinary dierential equation (ODE), and yn is the
numerical approximation at time tn, the Global Truncation Error at time tn is dened as:
GTE at tn: g(tn) = y(tn) − yn
The GTE depends on both the local truncation error and the stability of the numerical method used. For
a numerical method with a local truncation error of order τn = O(∆tp+1), the global truncation error after
n = T
∆t steps is typically:
gn = n.τn
hence:
gn = T
∆t .τn = O(∆tp)
A numerical scheme is said to be of order p or to have a global order of approximation equal to p when the
global error is proportional to the p-th power of the timestep ∆t.
The usual method to compute the GTE is as follows:
10


## Page 15

1.4. Order of accuracy
1. solve the ODE exactly (if possible) to obtain the exact solution y(t).
2. perform the numerical method to obtain the approximate solution yn at each time step tn.
3. calculate the GTE at each time step as y(tn) − yn.
If an exact solution is not available, compare the numerical solution with a reference solution obtained with
a much smaller time step ∆t.
Example: Global T runcation Error in the F orward Euler Method. Consider the ODE:
dy
dt = −ky with y(0) = y0
where k is a positive constant. The exact solution is:
y(t) = y0.e−kt
The exact solution at time tn = n∆t is:
y(tn) = y0.e−ktn = y0.e−kn∆t
The Forward Euler method approximates the solution at each time step as:
yn+1 = yn + ∆t · f(tn, yn) = yn − k∆t · yn = yn(1 − k∆t)
Starting from the initial condition y0 = y(0) = y0, the solution at time tn is:
yn = y0(1 − k∆t)n
The Global Truncation Error at time tn is:
GTE = y(tn) − yn = y0.e−kn∆t − y0.(1 − k∆t)n
For small ∆t, using the approximation (1 − k∆t)n ≈ e−kn∆t, the GTE can be approximated by:
GTE ≈ y0.

e−kn∆t − (1 − k∆t)n
This shows that the GTE accumulates over time, and its magnitude is inuenced by both the time step ∆t
and the number of steps n. In this specic example, the error is rst increasing, then decreasing with n.
This may be illustrated by a diagram plotting the error growth over time.
1.4.3 Comparing orders of accuracy
The order of accuracy , also called order of convergence of a numerical method describes how the local
truncation error (LTE) decreases as the time step ∆t or grid spacing ∆x is reduced. For a method of order
p, the error decreases proportionally to (∆x)p where ∆x is the grid spacing.
Hence, in a rst-order method the LTE decreases linearly with the step size. We say that this method
is in O(∆t). In a second-order method , it decreases quadratically ("faster"). The method is then in
O((∆t)2).
Comparing the orders of accuracy involves evaluating how dierent numerical schemes perform in terms
of error reduction as the grid is rened. This comparison helps in:
■ understanding how the accuracy of a numerical method improves with ner discretization (= with
increasing computational eort)
■ selecting the appropriate numerical method based on the required accuracy and computational re-
sources
11


## Page 16

Chapter 1. Discretization
Usually, numerical schemes are compared by plotting the LTE as a function of the grid size. In a log-log
plot, the asymptotic slope is equal to the order of accuracy of the numerical method.
Additional comments:
■ to examine spatial errors, pick a very small time step and rene the grid spacing. Vice-versa, to
examine temporal errors, pick a very small grid resolution and rene in time.
■ ...
Figure 1.7: Comparison of the order of accuracy for standard and accelerated Runge-Kutta numerical
schemes. Source.
12


## Page 17

Chapter 2
Stability analysis
2.1 Convergence
Convergence is achieved when a numerical method provides increasingly accurate approximations to the
true solution as the grid resolution improves. The convergence of the numerical method is often represented
by a Convergence Plot , which is a graphical representation showing how the error decreases as the grid is
rened.
The Lax Equivalence Theorem is a fundamental result in numerical analysis that relates consistency,
stability, and convergence of numerical schemes for linear partial dierential equations (PDEs). Loosely
speaking, it states: For a linear initial value problem, if a numerical scheme is consistent (i.e., the dis-
cretized equations approximate the PDE well) and stable (i.e., errors do not grow unboundedly), then the
scheme is also convergent (i.e., the solution of the scheme approaches the true solution as the grid spacing
goes to zero). .
In brief, a method must be consistent and stable to ensure that it converges to the correct solution. Note
that the consistency is more dicult to prove than stability.
2.2 Consistency
A numerical scheme is consistent if the discretized equations converge to the original partial dierential
equation (PDE) as the grid spacing (both in time and space) tends to zero.
Hereafter, we will explain the method to check the consistency of a numerical scheme using the Forward-Time
Central-Space (FTCS) scheme for the 1D linear advection equation as an example:
∂u
∂t + c ∂u
∂x = 0, (2.1)
where u(x, t) is the quantity being advected, and c is the constant advection speed. The FTCS scheme is
given by:
un+1
j − un
j
∆t + c un
j+1 − un
j−1
2∆x = 0, (2.2)
where:
 un
j is the numerical solution at position xj and time tn,
 ∆t is the time step,
 ∆x is the spatial step.
13


## Page 18

Chapter 2. Stability analysis
Consistency analysis. To check the consistency of the FTCS scheme, we compare it with the Taylor
series expansion of the exact solution.
Step 1: T aylor Expansion of the Exact Solution The exact solution u(xj, tn) can be expanded in a
Taylor series around (xj, tn):
un+1
j = un
j + ∆t ∂un
j
∂t + O(∆t2)
un
j+1 = un
j + ∆x ∂un
j
∂x + ∆x2
2!
∂2un
j
∂x2 + O(∆x3)
un
j−1 = un
j − ∆x ∂un
j
∂x + ∆x2
2!
∂2un
j
∂x2 + O(∆x3)
Step 2: Substitute T aylor series into the scheme. Substituting the Taylor series expansions into the
FTCS scheme gives:
un
j + ∆t
∂un
j
∂t . + O(∆t2) − un
j
∆t
+c

un
j + ∆x
∂un
j
∂x + ∆x2
2
∂2un
j
∂x2 + O(∆x3)

−

un
j − ∆x
∂un
j
∂x + ∆x2
2
∂2un
j
∂x2 + O(∆x3)

2∆x = 0
Simplifying (red and blue cancel out), we obtain:
∂un
j
∂t + c ∂un
j
∂x + O(∆t) + O(∆x2) = 0 (2.3)
Step 3: Interpretation The resulting equation 2.3 shows that the FTCS scheme approximates the original
PDE up to rst order in ∆t and second order in ∆x. As ∆t and ∆x approach zero, the error terms O(∆t)
and O(∆x2) vanish, and the numerical scheme converges to the original PDE. This conrms that the FTCS
scheme is consistent with the 1D linear advection equation.
Conclusion. Consistency is a critical aspect of numerical schemes, ensuring that the scheme correctly
approximates the original PDE as the grid is rened. The FTCS scheme, as shown, is consistent with the 1D
linear advection equation, making it a valid approach for solving such problems, though its stability must
also be checked to ensure reliable results.
2.3 Stability
A numerical method is stable if errors introduced at each step of the computation do not amplify exponen-
tially. This property is desired since it guarantees that the numerical results is reliable (with a controlled
error) over extended periods of time.
A numerical scheme is:
■ conditionally stable if its stability depends on the choice of the time step size ∆t and possibly other
parameters like the spatial step size ∆x. This means that the time step ∆t must satisfy a specic
condition to ensure stability. If the condition is violated, the numerical solution may become unstable,
leading to unbounded growth of errors
■ unconditionally stable if it remains stable for any choice of time step ∆t. In other words, stability is
guaranteed regardless of the size of ∆t, which makes unconditionally stable schemes particularly useful
for sti problems where small time steps may be impractical
■ unconditionally unstable if it is unstable whatever the (space or time) step size
14


## Page 19

2.4. Linear stability analysis
2.4 Linear stability analysis
2.4.1 General presentation
The linear stability analysis (also known as von Neumann stability analysis or Fourier stability analysis)
is a technique used to assess the stability of numerical schemes, particularly for solving partial dierential
equations (PDEs).
Many physical systems are described by linear PDEs. Linear equations allow us to use the principle of
superposition , which states that any solution can be written as a sum of simpler solutions. One common
method is the decomposition of a function in a sum of Fourier modes. A F ourier mode refers to a
sinusoidal function that represents a particular frequency component of a solution. When we decompose a
function (here, the numerical solution to a PDE) into Fourier modes, we express it as a sum of sine and cosine
functions (or equivalently, as complex exponentials using Euler's formula 1 ). Each mode is characterized by
a wave number k [m −1] or equivalently by a wave length λ = 2π
k [m].
When we analyze the stability of a numerical scheme, we often start by applying it to a single Fourier mode
as a trial solution. The reasoning is as follows:
■ a Fourier mode represents a fundamental building block of any solution
■ if the numerical scheme is stable for every possible Fourier mode (i.e., every wavenumber k), it will be
stable for any general solution composed of these modes. This is the consequence of the principle of
superposition.
2.4.2 Method
Below is the general method to follow.
1. Linearization of the numerical scheme. If the numerical scheme is nonlinear, linearize it around
the exact solution or a steady state.
2. Decomposition in F ourier modes.
■ for a continuous function:
U(x,t) =
Z ∞
−∞
ˆu(k,t). exp (ikx) .dk
A F ourier mode is a complex-valued function characterised by its wave number k ∈ R. The
scalar pre-exponential factor ˆu(k,t) is called the amplitude (or Fourier coecient).
■ for a discrete function:
un
j =
X
k
ˆun
(k).eik.xj
where n indexes the time step tn = n.∆t and j indexes the spatial point xj = j.∆x 2 . The
pre-exponential factor ˆun(k) is the amplitude of the k-th mode with k ∈ Z.
3. Determine the amplication factor G(k). By computing the ratio of the amplitude of the Fourier
mode at the next time step to its amplitude at the current time step:
G(k) ≡
ˆun+1
(k)
ˆun
(k)
1 Euler formula states that exp (ix) = cos x + i. sin x with i2 = −1.
2 Here, the index j is preferred over i for space discretization to avoid confusion with the imaginary number i.
15


## Page 20

Chapter 2. Stability analysis
4. Analyze stability: When applying a numerical scheme to a Fourier mode, we can track how the
amplitude ˆu(k)n evolves over time. Whether the mode grows or decays from one time step tn to the
next tn+1 is simply given by the amplication factor G(k). To ensure that the numerical scheme is
stable, we require that the amplitude of all F ourier modes does not grow over time without bound.
Otherwise, if one and only mode diverges, then the complete solution, which contained this mode, will
diverge also. Three situations may arise:
 Stable scheme (error decay or bounded error): if |G(k)| < 1 for all wavenumbers k.
 Conditionally stable scheme: if |G(k)| > 1 for certain values of wavenumber, typically for
specic ranges of the time step ∆t or the spatial step ∆x
 Unstable scheme: if |G(k)| < 1 for any k
Courant and F ourier numbers. Very often the stability conditions involve ∆x and ∆t and can be recast
to make some dimensionless numbers appear:
■ Courant number : Cr = c
∆x/∆t where c is a velocity. In 2D, we take Cr = cx
∆x/∆t + cy
∆y/∆t .
■ F ourier number : F o = D
(∆x)2/∆t where D is a diusion coecient
2.4.3 Example
Consider the one-dimensional heat equation:
∂u
∂t = α ∂2u
∂x2 ,
where α is the thermal diusivity [m 2.s −1]. Integration with a Forward Euler in time and Central Dierence
in space numerical scheme gives:
un+1
j − un
j
∆t = α un
j+1 − 2un
j + un
j−1
(∆x)2 .
Rearranging, we obtain:
un+1
j = un
j + F o(un
j+1 − 2un
j + un
j−1),
where F o ≡ α
(∆x)2/∆t . Now, assume a solution of the form un
j = ˆuneik.j∆x. Substituting into the numerical
scheme, we get:
ˆun+1eik.j∆x = ˆuneik.j∆x + F o.ˆun

eik.(j+1)∆x − 2eik.j∆x + eik.(j−1)∆x

.
Division of the above expression by ˆuneik.j∆x leads to:
G(k) = 1 + λ

eik∆x + e−ik∆x − 2

.
Using Euler's formula, eik∆x + e−ik∆x = 2 cos(k∆x), we have:
G(k) = 1 + 2F o.(cos(k∆x) − 1).
With cos 2θ = 1 − 2 sin2 θ, this simplies further to:
G(k) = 1 − 4F o.sin2
 k∆x
2

.
Since 0 ⩽ sin2 k∆x
2

⩽ 1, we have:
Gmin = 1 − 4.F o and Gmax = 1
16


## Page 21

2.5. Stability regions
The numerical scheme is stable if −1 ⩽ G(k) ⩽ 1 for all k or, equivalently, Gmin ⩾ −1 and Gmax ⩽ 1. The
rst condition is equivalent to 1 − 4.F o ⩾ −1 ⇔ F o ⩽ 1
2 and the second is respected whatever the value of
F o. Therefore, the Forward Euler method is conditionally stable, with the stability condition given by:
F o ⩽ 1
2 or ∆t ⩽ ∆x2
2α
If you violate this, some Fourier modes will grow and the method is unstable.
2.5 Stability regions
Two graphical representations are frequently encountered to help visualizing how dierent modes behave:
 1D plot: |G(k)| can be represented graphically for various wave numbers k
 2D plot: multiple lines, each with a given value of G, can be plot in the complex plane, where the x-axis
is Re(G(k)), the real part of the amplication factor and the y-axis is the imaginary part Im(G(k))
Fig. 2.1 shows the stability region for various explicit Runge-Kutta integration schemes. The solved equa-
tion is y′(x) = λ.y(x), y(0) = 1 and h = ∆x. Note that RK0 is the same as the Euler method. This plot
emphasizes the interest of using Runge-Kutta 4.
Figure 2.1: Comparison of the stability region for various numerical schemes. Source.
17


## Page 22

Chapter 2. Stability analysis
2.6 Dissipation and Dispersion
In numerical analysis, especially when solving partial dierential equations (PDEs), it is important to un-
derstand the eects that a numerical scheme may introduce into the solution. Two common artifacts are
numerical dissipation and numerical dispersion . While both phenomena arise due to discretization,
they have distinct eects on the numerical solution.
In brief, numerical dissipation leads to a reduction in the amplitude of the solution over time, whereas
numerical dispersion causes dierent frequency components of a wave to propagate at dierent speeds,
leading to phase or wave speed errors and distortion of the wave shape.
2.6.1 Numerical dissipation
Numerical dissipation (or numerical diusion) refers to the articial damping of the amplitude of the
solution as it evolves over time. This eect causes the numerical solution to lose energy, typically resulting
in a smoothing of sharp gradients or features. It is analogous to physical diusion, where energy or quantity
spreads out over time.
Below is the example of the 1D linear advection equation:
∂u
∂t + c ∂u
∂x = 0 (2.4)
where u(x, t) is the quantity being advected, and c is the constant advection speed.
Exact Solution. For a given initial condition u(x, 0) = f(x), the exact solution is:
u(x, t) = f(x − ct) (2.5)
This solution simply translates the initial condition f(x) to the right with speed c, without any change in
shape or amplitude.
Numerical Approximation. Let's approximate the derivative ∂u
∂x using a rst-order upwind nite dier-
ence scheme: ∂u
∂x ≈ uj − uj−1
∆x (2.6)
where uj = u(xj, t) and ∆x is the spatial step size. Substituting this into the advection equation and using
a forward dierence in time, we obtain the numerical scheme:
un+1
j = un
j − c∆t
∆x

un
j − un
j−1

, (2.7)
where un
j is the numerical solution at grid point j and time step n.
Analysis of numerical dissipation. The term c∆t
∆x

un
j − un
j−1

introduces numerical dissipation into the
solution. To see this, consider a Fourier mode of the form:
un
j = Aneikxj (2.8)
where A is the amplitude and k is the wavenumber. Substituting this into the numerical scheme, we get:
An+1 = An

1 − c∆t
∆x

1 − e−ik∆x
(2.9)
Expanding e−ik∆x using a Taylor series, we obtain:
An+1 = An

1 − c∆t
∆x

ik∆x − (k∆x)2
2

(2.10)
The imaginary part ik∆x corresponds to the correct advection, but the real part − c∆t
2 (k∆x)2 introduces a
damping factor, reducing the amplitude |A| over time. This damping is the numerical dissipation.
18


## Page 23

2.6. Dissipation and Dispersion
Conclusion. Numerical dissipation is an inherent artifact in many numerical schemes, especially those with
low-order accuracy. It results in the articial damping of waves, leading to a loss of energy or amplitude
that does not occur in the exact solution. Understanding and minimizing numerical dissipation is crucial for
accurate numerical simulations. Indeed, while numerical dissipation can enhance stability, it can also reduce
the accuracy of the numerical solution, especially in problems where preserving high-frequency components
is important.
2.6.2 Numerical dispersion
Numerical dispersion refers to the articial alteration of the wave speed as a function of the wavenumber,
introduced by the numerical scheme. This causes dierent frequency components of a wave to propagate at
dierent speeds, leading to a distortion of the wave shape over time. Unlike dissipation, dispersion does not
reduce the amplitude of the solution, but it aects the phase accuracy.
Let us use the rst-order upwind (FTBS) scheme for the numerical solution of the 1D linear advection
equation:
un+1
j = un
j − c∆t
∆x

un
j − un
j−1

(2.11)
where c∆t
∆x is the Courant number.
F ourier Mode Analysis. Assume a Fourier mode solution of the form:
un
j = ˆu(k, n)eikxj (2.12)
where ˆu(k, n) is the amplitude of the Fourier mode, and k is the wavenumber. Substituting this into the
FTBS scheme gives the amplication factor:
G(k) = 1 − c∆t
∆x

1 − e−ik∆x
(2.13)
Calculation of numerical phase speed. The phase speed cnum is:
cnum (k) = |ωnum |(k)
k (2.14)
where the algebraic angular frequency ωnum is related to the phase shift θ(k) by:
ωnum (k) = θ(k)
∆t (2.15)
Since the amplication factor G(k) can be written as:
G(k) = |G(k)|eiθ(k) (2.16)
the phase shift per time step is:
θ(k) = arg (G(k)) = arctan
 Im (G(k))
Re (G(k))

(2.17)
We can expand G(k) using Euler's formula as:
G(k) = 1 − c∆t
∆x (1 − cos(k∆x) + i sin(k∆x)) (2.18)
Hence, the imaginary and real parts of the amplication factor are:
Im (G(k)) = − c∆t
∆x sin(k∆x) (2.19)
19


## Page 24

Chapter 2. Stability analysis
and
Re (G(k)) = 1 − c∆t
∆x (1 − cos(k∆x)) (2.20)
For small z, we have the approximation 1 − cos z ≈ z2
2 . So, for small ∆x, we have:
Re (G(k)) ≈ 1 − c.k2.∆t.∆x
2 ≈ 1 (2.21)
By consequence, we have:
θ(k) = arg (G(k)) = arctan

− c∆t
∆x sin(k∆x)

(2.22)
For small ϕ, we have arctan ϕ ≈ ϕ. So, for small ∆t, we have:
θ(k) ≈ − c∆t
∆x sin(k∆x) (2.23)
Hence, the phase speed:
cnum (k) = |ωnum (k)|
k = c.sin(k∆x)
k.∆x (2.24)
Interpretation. The expression for cnum (k) shows that the numerical phase speed diers from the true
physical speed c due to the term sin(k∆x)
k∆x . This dierence is what causes numerical dispersion: dierent
Fourier modes (dierent k values) propagate at dierent speeds, leading to a distortion of the wave as it
propagates.
20


## Page 25

Chapter 3
Miscellaneous
3.1 Boundary Conditions
The choice and implementation of boundary conditions can signicantly impact the stability and accuracy
of the numerical solution. Incorrect implementation can lead to instability or inaccurate results.
3.1.1 Dirichlet boundary conditions
Fixed V alue Boundaries Dirichlet boundary conditions specify the value of the solution at the boundary
of the domain.
Example. For a 1D advection-diusion equation with Dirichlet boundary conditions:
u(0, t) = u0 and u(L, t) = uL
where u0 and uL are the prescribed boundary values at x = 0 and x = L, respectively.
3.1.2 Neumann boundary conditions
Fixed Derivative Boundaries Neumann boundary conditions specify the value of the derivative (ux)
at the boundary.
Example. For a 1D advection-diusion equation with Neumann boundary conditions:
∂u
∂x

x=0
= ϕ0 and ∂u
∂x

x=L
= ϕL
where ϕ0 and ϕL are the prescribed derivative values at x = 0 and x = L, respectively.
3.1.3 Robin boundary conditions
Robin boundary conditions are a linear combination of Dirichlet and Neumann conditions. They specify
a combination of the value of the solution and its derivative at the boundary.
Example. For a 1D advection-diusion equation with Robin boundary conditions:
α ∂u
∂x + βu = γ at x = 0 and x = L
where α, β, and γ are parameters dening the boundary condition.
21


## Page 26

Chapter 3. Miscellaneous
3.2 Computational Cost
3.2.1 Complexity
Computational complexity refers to the amount of computational resources (time and space) required
by an algorithm. For numerical methods, it is crucial to understand how the complexity scales with the
problem size.
As an example, for a 1D advection-diusion problem, the complexity might dier based on the method used.
For instance, a nite dierence method may have a complexity of:
O(N · M)
where N is the number of spatial grid points and M is the number of time steps.
3.2.2 Eciency
Choosing a numerical method involves balancing accuracy with computational cost. More accurate methods
may require more computational resources.
The eciency of a method can be evaluated based on the cost per accuracy unit, which might be expressed
as:
Eciency = Accuracy
Cost
22


## Page 27

Chapter 4
Exercises
4.1 1D Advection-Diusion Equation
The 1D advection-diusion equation is a partial dierential equation that models the transport and spreading
of a quantity (such as heat or a pollutant) in a one-dimensional domain. It combines advection (transport)
and diusion (spreading) eects. The general form of the equation is:
∂u
∂t + c ∂u
∂x = D ∂2u
∂x2 (4.1)
where:
 u(x, t) is the quantity being advected and diused (example: temperature [K])
 c is the advection speed [m.s −1]
 D is the diusion coecient [m 2.s −1]
 ∂u
∂t is the time derivative of u
 ∂u
∂x is the spatial derivative for advection
 ∂2u
∂x2 is the spatial derivative for diusion
For the initial condition u(x, 0), we choose a Gaussian distribution centered at x = 0 with an initial width
σ0:
u(x, 0) = exp

− x2
2σ2
0

The spatial domain is considered as innite or large enough that boundary eects are negligible.
The exact solution for the 1D advection-diusion equation with a Gaussian initial condition is a Gaussian
prole that shifts with time due to advection and broadens due to diusion:
u(x, t) = σ0
σ(t)
. exp

−(x − ct)2
2σ2
(t)
!
with σ(t) = σ0.
s
1 + 2Dt
σ2
0
The term ct in the exponent represents the shift (expressed in [m]) of the Gaussian prole to the right (or
left if c is negative) at a constant speed c after time t.
The width of the Gaussian σ(t) =
p
σ2
0 + 2Dt increases due to diusion and leads to the spreading of the
Gaussian prole over time.
23


## Page 28

Chapter 4. Exercises
Question 1: Discretization. To solve this PDE numerically using the Finite Dierence Method (FDM),
we discretize both the spatial and temporal domains. Here, un
i denotes the solution at position xi and time tn.
We divide the time domain into a grid. Let tn be the grid point with spacing ∆t:
tn = t0 + n∆t where n = 0, 1, 2, . . . , N
Similarly, we divide the spatial domain into a grid. Let xi be the grid points with spacing ∆x:
xi = x0 + i∆x where i = 0, 1, 2, . . . , I
Approximate the temporal derivative with a Forward Euler scheme, the spatial derivatives by a central
dierence scheme and write the resulting discretized version of the 1D advection-diusion equation 4.1.
Let's designate the discretized version by equation A ?? .
Question 2: Local truncation error and order of accuracy . The local truncation error τ n
i is the
error made in a single step of the numerical scheme. It is computed by substituting the exact solution into
the numerical scheme and then subtracting the exact PDE.
Use the Taylor series expansion around un
i to give expressions of un+1
i , un
i+1 and un
i−1. In these expressions,
you will nd partial derivatives of un
i . Substitute these expressions in the discretized PDE (Equation A - ?? )
obtained in previous question. Simplify to get an expression (designated by Equation B - ?? ) linking partial
derivatives of un
i , ∆t and ∆x. Then, considering the fact that un
i satises exactly the advection-diusion
PDE (equation 4.1) if this is the exact solution, compute the local truncation error τ n
i .
Question 3: V on Neumann stability analysis. The von Neumann stability analysis involves analyzing
the behavior of errors in numerical solutions by examining the amplication factor G. It helps determining
whether the numerical scheme will amplify or dampen errors over time.
Let us dene the amplication factor G as:
G ≡
ˆun+1
(k)
ˆun
(k)
where k is the wave number of the Fourier mode:
un
j = ˆun
(k).eikxj with xj = j.∆x
To ensure stability, we need to have:
|G| ⩽ 1 or equivalently |G|2 ⩽ 1
with:
|G|2 = (Re (G))2 + (Im (G))2
By considering a Fourier mode k, rewrite Equation A - ?? to obtain an expression of the amplication factor
G. Then, using Euler formula to transform complex exponentials, give the expressions of the real and imag-
inary parts of G as a function of simple trigonometric functions.
It is clear that the solution is unstable if |Re (G)| > 1 or |Im (G)| > 1. In other words, to have a stable
scheme, it is necessary (but not sucient) to have:
|Re (G)| ⩽ 1 and |Im (G)| ⩽ 1 for all wavenumber k
Rewrite each of the two necessary conditions in terms of timsestep ∆t and grid spacing ∆x. For a grid
spacing ∆x = 10−3 m, what is the maximum time step to use when c = 1 m.s −1 and diusion is D = 2.10−5
m 2.s −1 ?
24


## Page 29

4.2. V on Neumann stability analysis of the Leapfrog scheme used for solving 2nd law of
Newton
4.2 Von Neumann stability analysis of the Leapfrog scheme used
for solving 2nd law of Newton
Consider a particle of mass m, position x, velocity v submitted to a force F(x,v). We aim at computing its
trajectory thanks to the second equation of Newton:
ma = F with F = kx − g.v and v = dx
dt and a = dv
dt
where k is the stiness and g the damping coecient. We discretize the time with tn = n∆t. The leapfrog
algorithm is following:
xn+1 = xn + vn+1/2.∆t
an+1 = 1
m .

k.xn+1 − g.vn+1/2

vn+3/2 = vn+1/2 + an+1.∆t
The von Neumann stability analysis involves analyzing the behavior of errors in numerical solutions by
examining the amplication factor G. It helps determining whether the numerical scheme will amplify or
dampen errors over time.
Let us study the behavior of the Fourier modes:
xn = ˆx(ω).eiωn.∆t
vn = ˆv(ω).eiωn∆t
where ˆx(ω) and ˆv(ω) are the complex amplitude for the frequency ω. As a consequence, we have:
xn+1 = ˆx(ω).eiω(n+1)∆t
vn+1/2 = ˆv(ω).eiω(n+1/2)∆t
vn+3/2 = ˆv(ω).eiω(n+3/2)∆t
and
ˆx(ω).eiω(n+1)∆t = ˆx(ω).eiωn.∆t + ˆv(ω).∆t.eiω(n+1/2)∆t
ˆv(ω).eiω(n+3/2)∆t = ˆv(ω).eiω(n+1/2)∆t + ∆t
m .

k.ˆx(ω).eiω(n+1)∆t − g.ˆv(ω).eiω(n+1/2)∆t

Dividing the rst equation by eiωn.∆t and the second equation by eiω(n+1/2).∆t leads to:
ˆx(ω).eiω∆t = ˆx(ω) + ˆv(ω).∆t.eiω(1/2)∆t
ˆv(ω).eiω∆t = ˆv(ω) + ∆t
m .

k.ˆx(ω).eiω(1/2)∆t − g.ˆv(ω)

The rst equation can be recast to express ˆx(ω) and this new expression can be injected in the second
equation. After division by ˆv(ω), we have:
ˆx(ω) = ˆv(ω).∆t. eiω(1/2)∆t
eiω∆t − 1
eiω∆t = 1 + ∆t
m .

k.∆t. eiω∆t
eiω∆t − 1 − g

Let us dene the (complex) amplication factor G as:
G ≡ xn+1
xn
⇒ G = eiω∆t
25


## Page 30

Chapter 4. Exercises
Hence, for the leapfrog algorithm, we have:
G = 1 + ∆t
m .

k.∆t. G
G − 1 − g

or equivalently:
G = 1 + ∆t
m .

k.∆t. eiω∆t/2
eiω∆t/2 − e−iω∆t/2 − g

Using Euler's formula eiθ = cos θ + i sin θ, we get:
G = 1 + ∆t
m .

k.∆t.cos ω∆t
2 + i sin ω∆t
2
2i sin ω∆t
2
− g
!
that is to say:
G = 1 + k.∆t2
2m .

1 − i.cotan ω∆t
2

− g.∆t
m
or
G = 1 + k.∆t2
2m − g.∆t
m − i. k.∆t2
2m .cotan ω∆t
2
To ensure stability, we need to have:
|G| ⩽ 1 or equivalently |G|2 ⩽ 1
with:
|G|2 = (Re (G))2 + (Im (G))2
26
