# Differential Forms Short Notes

Source title: 7. Differential Forms

Converted from: `15.pdf`


## Page 1

Copyright (c) Jan 2020 Jed Chapin
7. Differential Forms
We continue with the theme of local linearity. You are familiar with expressing
derivatives like dy
dx . The derivative expresses what the slope of a curve would
be if it were a strait line. In this context, expressions like dy by itself do not have
a clear meaning because of its infinitesimal intent. In many areas of mathematics
and physics we write expressions like dy
dx=f x as dy=f x dx , because it
guides our infinitesimal thinking, even though it is not a traditional limit. This
issue continues when we consider multiple variables in situations like polar
coordinates dx=cos dr−r sin d .  Ultimately these differential expressions
express local linearity.
So,  y=f x x  dy=f x dx says that Δ y is linearly dependent on Δ x
with linearity “constant” f(x) at small scales.
Integration and Changing Variables
We first encounter differential forms in the context of integration. Let's return to
elementary calculus and recall a typical application of the substitution method for
evaluating single variable integrals:
∫
0
R
 R2
−x2
dx=∫
/2
0
−R2
sin2
d using x=R cos dx=−R sin d
We will describe differential forms as tensor fields. Application of transition rules
between charts is analogous to changing variables when integrating.
Consider attempting to use integration by substitution for an integrand with two
variables like this polar coordinate example:
x=r cos y=r sin with dx=cos dr−r sin d , dy=sin drr cos d
We might try:
∬ f x, y dxdy=∬ f r cos ,r sin [cos dr−r sin  d][sin drr cos d] ?
We could have a problem.
We will see how to handle multiple variable differential forms like dx dy. In this
particular example we hope to end up with dxdy=r dr dθ . Most people arrive
at this result through geometrical insight involving circular sectors. We will show
a general method of changing any number of integration variables without
requiring specific geometrical insight.
1


## Page 2

Copyright (c) Jan 2020 Jed Chapin
Differential Forms and Surface Integration
We will examine differential forms with two variables. To this end we will consider
surface integration. We will see why we view a differential form in two variables
as a bilinear functional operating on pairs of vectors.
Consider integrand expressions like f  x, y dx d y over a region. We will denote
the integrand as: =f  x, y dx∧dy . At first, this appears to just be a change
of notation. We will see that the expression dx∧dy (spoken as dx wedge dy)
expresses a bilinear functional.
Consider the small rectangular shaped increments of area involved with
integration, in terms of their spanning vectors.  Integration involves a limiting sum
like: ∑ f  x, y  x y∫ f  x, y dxd y
Each rectangular increment is pinned at one corner to the origin of the local
coordinate system. With this pinned leaf picture in mind, we rewrite the above
sum as: ∑ f  x, y det  x x ,  y y
We can view the expression f  x, y det  x x ,  y y=   x x ,  y y as a
bilinear functional operating on pairs of small but finite vectors in the local
coordinate system.
We call =f  x, y dx∧dy a differential form. It is a special bilinear functional
(doubly covariant tensor field) that we define in terms of the area spanned by the
vectors. In our example, the region to be integrated was divided into increments
that are spanned by vectors aligned with the local coordinate system. The wedge
part of the notation expresses the variables involved. The f(x,y) part assigns the
local weight to the integration increment.
The same differential form can be applied to any dissection of the region into
approximate parallelograms, each spanned by vectors  u and  v and we
can write:
∫ f  x, y dx∧dy≈∑ f  x, y  dx∧dy  u ,  v=∑ f  x, y det  u ,  v
where  u and  v are expressed in terms of the basis x and y .
So the expression dx∧dy does not directly express an infinitesimal concept,
but it guides the linear limiting process on arbitrarily small increments
As a consequence of its relationship to the determinant, the order of the
variables in the expression dx∧dy expresses a 2-d orientation. In particular,
dy∧dx=−dx∧dy . This skew symmetry results from swapping columns in the
determinant. Skew symmetry of differential forms corresponds to the alternating
nature of determinants.
2


## Page 3

Copyright (c) Jan 2020 Jed Chapin
In general, we express an integrand in terms of a field of bilinear functionals (or
multi-linear functionals). We can use tensor methods to go between charts. The
skew symmetric property of the determinant operation gives a way to express
orientation.
In our context we define a differential form to be a skew symmetric multilinear
functional field. It must be a multiply covariant tensor field so that its transformed
version yields the same result when applied to a list of transformed vectors.
We identify the order of a differential form by noting the number of vectors that it
acts on. For example:
  u,v=dx∧dyu,v is a 2-form
  v=f x, y,z dy v is a 1-form
 =g x,y, z =g x, y,z is a 0-form
The dimension of the underlying vector space limits the set of differential forms.
There are no 4-forms on the space of 3-d vectors.
Also, the skew symmetry condition also restricts the set of multi-linear functionals
that can be differential forms. In the case of n-forms on the space of n-d vectors,
the only n-forms are multiples of the determinant. For an n-d vector space, the k-
forms with 1<k<n are a little more complicated.
Wedge Notation and Differential Forms on 3-d space
Consider 3-d Cartesian space. We take the expression =dx1
∧dx2
∧dx3 to be
the determinant operation on three vectors. Still within 3-d Cartesian  space, the
expression   u,v=dx∧dyu,v signifies the area spanned by u and v
after projection onto the xy-plane. Note  that dx∧dx u,v=0 because the xx-
plane is degenerate. Similarly dx u is the length of u after projection onto the
x-axis. The variables in a wedge product designate the subspace supporting it.
We can still use the 3x3 determinant to calculate k-forms with k <3 by inserting
dummy standard basis vectors into the determinant expression. For example, if
=dx1
∧dx2 then   u , v=det u , v , x3 .
Similarly  dx2
∧dx3  u , v=det  x1 , u , v . Note that  dx2
∧dx3  u , v=0 if u
or v is orthogonal to the  x2, x3 plane. We continue the scheme with a 1-form
acting on a single vector  dx2 u=det x1 , u , x3=u2
, so that dx2  is the
functional that extracts the second coordinate.
We looked at wedge products of basic forms like dx∧dy and ( dx∧dy)∧dz .
We extend the algebra of the wedge product via linearity, the distributive law and
skew symmetry (like vector cross product).

3


## Page 4

Copyright (c) Jan 2020 Jed Chapin
Coordinate Transformations and 1-Forms
We have expressed the concept of differential forms in terms of tensors and can
extend the concept to Riemannian manifolds. A 1-form is another name for a
covector field. In differential form notation, the coefficients of dx, dy, and dz are
the components of each covector.
Suppose we have a coordinate transformation like x u and we wish to
transform a 1-form like dxi .This is another notation for the particular functional
(covector) that extracts the ith component from a vector. When changing from
the x coordinate system to the u coordinate system, we apply the rule for a
covariant tensor. When this is expressed in differential form notation, we get:
dxi
 ∂ xi
∂ uk duk
This has the same appearance as the familiar integral calculus infinitesimal
expression after changing variables.
If we apply this to polar coordinates, we get differential form expressions:
dx= ∂ x
∂r dr∂ x
∂ d=cos dr−r sin  d (remember to sum !)
and dy= ∂y
∂r dr∂ y
∂ d=sin drr cos d
Here equality means, giving the same result when applied to a transformed
vector. We can see how these covector expressions show local linearity with
dx
 x
 y=cos dr
 r
 −r sin d 
 r
 
for any pair of corresponding vectors 
 x
 y and 
 r
  in the respective
coordinate systems.
When we apply the component picking features of dx, dr, and d , we get
 x=cos  r−r sin  .We will use this later
So, we have expressed infinitesimal concepts in terms of local linearity. These
ideas will be clearer when we revisit dx dy  r dr d
4
