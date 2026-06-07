# Lecture 09 transformations,  twists, screws, and wrenches

Converted from: `Robotics\Transforms Twists and Screws.pdf`


## Page 1

Lecture 09
transformations,
twists, screws, and wrenches
Katie DC
Sept. 26, 2019
Modern Robotics Ch. 3.3-3.4


## Page 2

Admin
• Reflections due on 9/29
• HW5 due on Friday 10/4
• Next guest lecture is on Thursday 10/10
• The reflection is due on Sunday 10/13 – can stagger if preferred?
• PL gradebook coming your way soon!


## Page 3

Who is Michael Chasles?
• Rodrigues and Chasles took the entrance exam to
Polytechnique/Normale at the same time, finishing first and
second respectively
• Rodrigues did not use it and elected to go to La Sorbonne
• We’ll talk about screw theory today
• The proof that a spatial displacement can be decomposed into a
rotation and slide around and along a line is attributed to the
astronomer and mathematician Giulio Mozzi (1763),
• In Italy, the screw axis is traditionally called asse di Mozzi
• However, most textbooks refer to a subsequent similar work by
Michel Chasles dating 1830
• Several other scholars/contemporaries of M. Chasles obtained
the same or similar results around that time, including G.
Giorgini, Cauchy, Poinsot, Poisson, and Rodrigues.


## Page 4

Homogeneous Transformations: SE(3)
The special Euclidean group 𝑺𝑬(𝟑) is the set of 4 × 4 matrices
of the form:
𝑇 = 𝑇 𝑅, 𝑝 = 𝑅 𝑝
0 1
• The inverse of 𝑇 is 𝑇−1 = 𝑅⊤ −𝑅⊤𝑝
0 1 ∈ 𝑆𝐸(3)
• If 𝑇1 and 𝑇2 ∈ 𝑆𝐸(3), then 𝑇1𝑇2 ∈ 𝑆𝐸(3)
• 𝑇 satisfies: 𝑇𝑥 − 𝑇𝑦 = 𝑥 − 𝑦 and
𝑇𝑥 − 𝑇𝑧 ⊤ 𝑇𝑦 − 𝑇𝑧 = 𝑥 − 𝑧 ⊤ 𝑦 − 𝑧


## Page 5

Representing a configuration with SE(3)
• Each frame can represent a body
frame in a multi-link mechanism
• Recall:
𝑇𝑎𝑏𝑇𝑏𝑐 = 𝑇𝑎𝑐
𝑇𝑎𝑏𝑣𝑏 = 𝑣𝑎


## Page 6

Displacing Frames


## Page 7

Example Displacement


## Page 8

Activity! Mobile arm example.
• Robot arm mounted on wheeled platform.
Camera fixed to ceiling.
• {b} is body frame, {c} end-effector frame,
{e} frame of object, and {a} is fixed frame.
• We assume the camera position in {a} is given.
• From camera measurements, you can evaluate
the position of the body and the object in the
camera frame.
• Since we designed our robot and have joint-angle
estimates, we can obtain the end-effector position
and orientation in the body frame.
• To pick up the object, we need the object position
and orientation in the frame of our end-effector.


## Page 9

Moving Frames: linear and angular velocity


## Page 10

Linear and angular velocity in ref. frame


## Page 11

Physical interpretation of vs
• Assume that a very large rigid body is
attached to the frame {b}, and is large
enough to contain the origin of {s}.
• What is the velocity of the point of
this body as the origin of {s}?
• There are two components:
• ሶ𝑝: the motion of the body
• 𝜔𝑠 × −𝑝 : the rotation of the body


## Page 12

Twists


## Page 13

Screw motions


## Page 14

2D Screw Motions
• Any rigid motion in the plane can be represented by a rotation around
a well-chosen center
• We can encode it with (𝛽, 𝑠𝑥, 𝑠𝑦), where (𝑠𝑥, 𝑠𝑦) is the position of the
center of the rotation, and 𝛽 the angle
• Recall that the angular velocity 𝜔 can be viewed as ෝ𝜔 ሶ𝜃, where ෝ𝜔 is
the unit rotation axis and ሶ𝜃 is the rate of rotation
• A twist 𝒱 can be interpreted in terms of a screw axis 𝒮 and a velocity
ሶ𝜃 about that axis


## Page 15

Screw motions in 3D
𝑞 ∈ ℝ3 is any point along the axis
Ƹ𝑠 is a unit vector in the direction of the axis
ℎ is the screw pitch, which is the ratio between the linear and angular
speed along axis
We write this as 𝒮 = 𝑞, Ƹ𝑠, ℎ
Chasles-Mozzi Theorem:
Any displacement in 3D can be
represented by a rotation and
translation about the same axis,
referred to as a screw motion


## Page 16

Screw motions and Twists


## Page 17

Screw axis


## Page 18

Exponential Coordinates for Rigid Body Motions


## Page 19

Exponential Coordinates for Rigid Body Motions


## Page 20

Logarithm of rigid body motions


## Page 21

Wrenches
• Let {a} be a ref. frame and 𝑟𝑎 a point in a rigid body
• Suppose we have a force acting on the body at point 𝑟𝑎, represented
by vector 𝑓𝑎 ∈ ℝ3
• This force creates a torque or moment:
𝑚𝑎 = 𝑟𝑎 × 𝑓𝑎 ∈ ℝ3
• We introduce a spatial force or wrench: ℱ𝑎 ≔ 𝑚𝑎
𝑓𝑎


## Page 22

Wrenches in two frames
