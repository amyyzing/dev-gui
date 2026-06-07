# MIT OpenCourseWare

Converted from: `Calculus III\Divergence Theorem.pdf`


## Page 1

MIT OpenCourseWare
http://ocw.mit.edu



18.02 Multivariable Calculus
Fall 2007



For information about citing these materials or our Terms of Use, visit: http://ocw.mit.edu/terms.


## Page 2

� �
��
���
18.02 Lecture 29.  –  T ue, Nov 20, 2007
�� ���
Recall statement of divergence theorem: S F dS� = D div F dV .·
Del operator. � = �∂/∂x,∂/∂y,∂/∂z� (symbolic notation!)
� f = �∂f /∂x,∂f /∂y,∂f /∂z� = gradient.
� · F = �∂/∂x,∂/∂y,∂/∂z�·�P,Q,R� = Px + Qy + Rz = divergence.
Physical interpretation. div F = source rate = ﬂux generated per unit volume. Imagine
an incompressible ﬂuid ﬂow (i.e. a given mass occupies a ﬁxed volume) with velocity F, then��� ��
div F dV = F nˆ dS = ﬂux through S is the net amount leaving D per unit time = total D S ·
amount of sources (minus sinks) in D.
�� ���
Proof of divergence theorem. To show S �P,Q,R�· dS� = (Px + Qy + Rz ) dV , we can �� ��� D
separate into sum over components and just show S Rkˆ dS� = D Rz dV & same for P and Q.·
If the region D is vertically simple, i.e. top and bottom surfaces are graphs, z1(x,y) ≤ z ≤
z2(x,y), with (x,y) in some region U of xy-plane: r.h.s. is
��� �� � �� � z2(x,y) �
Rz dV = Rz dz dx dy = (R(x,y,z2(x,y)) − R(x,y,z1(x,y)) dx dy.
D U z1(x,y) U
Flux through top: dS� = �−∂z2/∂x, − ∂z2/∂y, 1�dx dy, so
��
Rkˆ dS� =
��
R(x,y,z2(x,y)) dx dy. top ·
Bottom: dS� = −�− ∂z1/∂x, − ∂z1/∂y, 1�dx dy, so
��
Rkˆ dS� =
��
− R(x,y,z1(x,y)) dx dy. bottom ·
Sides: sides are vertical, nˆ is horizontal, F is vertical so ﬂux = 0.
Given any region D, decompose it into vertically simple pieces (illustrated for a donut). Then
��� ��
= sum of pieces (clear), and = sum of pieces since the internal boundaries cancel each D S
other.
Diﬀusion equation: governs motion of smoke in (immobile) air (dye in solution, ...)
∂u ∂2u ∂2u ∂2uThe equation is: ∂t = k� 2u = k ∂x2 + ∂y2 + ∂z2 ,
where u(x,y,z,t) = concentration of smoke; we’ll also introduce F = ﬂow of the smoke. It’s also
the heat equation (u = temperature).
Equation uses two inputs:
1) Physics: F = − k� u (ﬂow goes from highest to lowest concentration, faster if concentration
changes more abruptly).
2) Flux and quantity of smoke are related: if D bounded by closed surface S, then S F nˆ dS = ��� ·
d u dV . (ﬂux out of D = - variation of total amount of smoke inside D)dt D−
���
By diﬀerentiation under integral sign, the r.h.s. is − ∂ u dV  explained in terms of D ∂t
integral as a sum of u(xi,yi,zi,t)ΔV i and derivative of sum is sum of derivatives) and by divergence
theorem the l.h.s. is D div F dV . Dividing by volume of D, we get
(This can be
��� ��� 1 ∂u 1 − vol(D) D ∂t dV = vol(D) D
div F dV.
Same average values over any region; taking limit as D shrinks to a point, get ∂u/∂t = − div F.
Combining, we get the diﬀusion equation: ∂u/∂t = − div F = +kdiv (� u) = k� 2u.
1
