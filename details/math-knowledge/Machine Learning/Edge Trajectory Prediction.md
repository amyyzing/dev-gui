# Edge Trajectory Prediction

Source title: EdgeVTP: Exploration of Latency-efficient Trajectory Prediction for Edge-based Embedded Vision Applications

Converted from: `7.pdf`


## Page 1

EdgeVTP: Exploration of Latency-efficient Trajectory Prediction for Edge-based
Embedded Vision Applications
Seungjin Kim
University of Wyoming
skim27@uwyo.edu
Reza Jafarpourmarzouni
University of North Carolina at Charlotte
rjafarpo@charlotte.edu
Christopher Neff
North Carolina A&T State University
cgneff@ncat.edu
Hamed Tabkhi
University of North Carolina at Charlotte
htabkhiv@charlotte.edu
Vinit Amrutlal Katariya
University of Wyoming
vkatariy@uwyo.edu
Abstract
Vehicle trajectory prediction is central to highway percep-
tion, but deployment on roadside edge devices necessi-
tates bounded, deterministic end-to-end latency. We present
EdgeVTP , an embedded-first trajectory predictor that com-
bines interaction-aware graph modeling with a lightweight
transformer backbone and a one-shot curve decoder. By
predicting future motion as compact curve parameters (an-
chored at the last observed position) rather than horizon-
scaled autoregressive waypoints, EdgeVTP reduces decod-
ing overhead while producing smooth trajectories. To
keep runtime predictable in crowded scenes, we explic-
itly bound interaction complexity via a locality graph with
a hard neighbor cap. Across three highway benchmarks
and two Jetson-class platforms, EdgeVTP achieves the low-
est measured end-to-end latency under a protocol that in-
cludes graph construction and post-processing, while at-
taining state-of-the-art (SotA) prediction accuracy on two
of the three datasets and competitive error on other bench-
marks. Our code is available athttps://github.
com/SeungjinStevenKim/EdgeVTP.
1. Introduction
Roadside camera networks are increasingly used for real-
time highway safety monitoring, workzone safety, incident
detection, and traffic management [24, 29, 48, 49, 52, 59,
69, 72, 73]. A core capability in these systems is vehi-
cle trajectory prediction (VTP): forecasting the future mo-
tion of many interacting vehicles from noisy tracked ob-
servations [7, 40, 44, 55, 68, 74, 76, 78]. Compared to
urban driving, highway scenes exhibit long-range, high-
speed interactions (lane changes, merges, and stop-and-go
waves) and can encompass up to hundreds of interacting
agents in a single field of view, making multi-agent predic-
tion both accuracy-critical and computationally demanding
[26, 36, 39]. These challenges are amplified in surveillance-
based settings, where fixed-camera viewpoints introduce
perspective distortion and tracking noise, and where infer-
ence must often run continuously on near-roadway edge
platforms with tight power and memory budgets [64, 67].
Prior work has made substantial progress on highway
motion forecasting. Early approaches relied on recur-
rent encoder–decoder designs and explicit maneuver mod-
eling to capture multi-modality [38]. Maneuver-based
LSTMs and convolutional social pooling achieved strong
freeway performance by combining temporal modeling
with interaction-aware pooling and multi-modal decoding
[3, 19, 20, 45, 47]. More recent methods increasingly use
structured interaction modeling and attention mechanisms
[15, 40]. Graph neural networks and map-centric encoders
model actor-actor and actor–map relationships for improved
accuracy [22, 42], and probabilistic graph-structured pre-
dictors enable flexible multi-agent forecasting with hetero-
geneous inputs [61]. Transformer-based models further im-
prove long-range temporal reasoning, including highway-
surveillance benchmarks such as CHD with high-angle and
eye-level viewpoints [35, 50, 53, 63, 79].
Despite these advances, embedded deployment intro-
duces requirements that are often under-emphasized in
accuracy-driven studies: (i) predictable end-to-end (E2E)
runtime under dense traffic, (ii) tight memory and power
budgets, and (iii) latency constraints for streaming video
analytics and on-device decision loops [1, 6, 13, 33, 60,
64, 67]. In practice, dense scenes can increase end-to-end
This CVPR Workshop paper is the Open Access version, provided by the Computer Vision
Foundation. Except for this watermark, it is identical to the accepted version;
the final published version of the proceedings is available on IEEE Xplore.
3712


## Page 2

latency as interaction graphs grow, even when model-only
runtime appears acceptable [5]. A second bottleneck is de-
coding: autoregressive predictors incur inference cost that
scales with the prediction horizon and can accumulate er-
ror when predictions are fed back into the model, motivat-
ing non-autoregressive alternatives that generate future se-
quences in parallel [2, 58].
We present EdgeVTP, an embedded-first redesign of a
transformer-graph predictor for surveillance-based highway
trajectory prediction. EdgeVTP is designed to achieve a fa-
vorable trade-off between prediction accuracy and inference
latency by making three deployment-driven principles ex-
plicit: one-shot parametric trajectory generation, bounded
interaction complexity, and lightweight model design. First,
we replace step-wise autoregressive decoding with a one-
shot parametric head that regresses to a low-dimensional
manifold of control points and reconstructs dense future tra-
jectories via analytic evaluation, reducing sequential over-
head while producing smooth trajectories by construction.
Second, we sparsify the interaction graph using physically
motivated neighborhood construction (radius gating and
top-Kcapping) to upper-bound interaction complexity and
stabilize runtime as scene density increases. Third, we keep
temporal modeling lightweight and deployment-oriented by
using a compact temporal encoder and systematically slim-
ming the transformer (layers/heads/width) to reduce com-
pute and memory without sacrificing the ability to reason
over multi-agent interactions.
Experiments across surveillance highway benchmarks
and embedded platforms show that explicitly designing for
bounded interaction cost and one-shot decoding yields a
consistently better accuracy-latency trade-off under realis-
tic E2E measurement, including graph construction and tra-
jectory reconstruction. A key observation motivating our
design is that, on Jetson-class edge devices, the dominant
latency bottlenecks in transformer-graph VTP pipelines are
not the learned parameters but rather (i) scene-dependent
graph construction, whose cost grows with traffic density,
and (ii) autoregressive decoding, whose cost scales with the
prediction horizon. Standard model compression (pruning,
distillation, quantization) does not address either bottleneck
directly. EdgeVTP instead targets these two costs at the ar-
chitecture level.
Contributions.
• We introduce EdgeVTP, an embedded-first Surveillance-
based VTP (SVTP) architecture that frames roadside tra-
jectory prediction as an end-to-end accuracy–latency co-
design problem, making deployment constraints explicit
through bounded interaction graphs and one-shot curve
decoding.
• We expose interpretable operating-point knobs
(r, K,Residual)that span the accuracy–latency spec-
trum, and show that the preferred operating point
depends on surveillance viewpoint (CHD Eye-level vs.
High-angle).
• We establish an end-to-end latency protocol that in-
cludes graph construction and trajectory reconstruction,
and demonstrate consistent deployability gains: lowest
E2E latency on Jetson-class hardware among the com-
pared methods while achieving State-of-the-Art (CHD) or
competitive (NGSIM) prediction error.
2. Related Work
Vehicle trajectory prediction (VTP) has evolved from clas-
sical kinematic motion models to deep architectures that
model multi-agent interactions and long-range temporal de-
pendencies. In embedded vision deployments, however, the
dominant failure mode is often not average accuracy but un-
predictable E2E runtime under scene density shifts (e.g.,
rush-hour traffic), where interaction graphs become large
and decoding cost scales with the prediction horizon. Our
work targets this deployment gap by (i) enforcing bounded
interaction complexity and (ii) eliminating autoregressive
decoding via one-shot parametric curve prediction.
Surveillance-based VTP and Real-time Highway
Monitoring.Surveillance-based VTP (SVTP) differs from
egocentric forecasting due to fixed-camera viewpoints, per-
spective distortion, and noisier tracking signals [21, 49,
65, 69, 74]. In this setting, lightweight temporal model-
ing has been emphasized for real-time roadway monitor-
ing. DeepTrack introduced an embedded-friendly temporal
convolutional design for highway prediction and monitor-
ing under constrained compute budgets [34]. More recently,
VT-Former explored combining interaction modeling with
transformer-based decoding for highway surveillance pre-
diction [51, 53, 77]. These works motivate SVTP-specific
designs that remain robust to viewpoint effects while de-
livering predictable runtime under the practical constraints
of roadside deployments. Highway benchmarks such as
NGSIM [17, 18], CHD[35], HighD [36], exiD[46] are
used widely for SVTP application. Autonomous driving
benchmarks such as nuScenes [9], Waymo [66], Argoverse
[12, 75], Zenseact open dataset [4] also used for VTP but
are rarely used in fixed-camera surveillance settings, aside
from scenarios such as knowledge distillation.
Interaction Modeling: Social Pooling to Graph Neu-
ral Networks.Capturing inter-dependencies between vehi-
cles is essential for accurate VTP in dense highway traffic.
Convolutional Social Pooling (CSP) pioneered grid-based
interaction encoding via a convolutional pooling layer over
surrounding vehicles [19]. Subsequent work shifted toward
graph neural networks (GNNs), which represent agents as
nodes and interactions as edges, enabling structured mes-
sage passing on non-Euclidean relationships. GRIP demon-
strated graph-based interaction-aware trajectory prediction
in traffic scenarios [40], while Social-STGCNN showed
3713


## Page 3

that spatio-temporal graph convolutions can provide in-
teraction modeling with strong efficiency characteristics
[28, 31, 47, 79]. For edge-centric cyber-physical systems,
Pishgu further studied GIN-style interaction modeling and
reported real-time performance on embedded platforms [5].
Graph attention mechanisms (e.g., GAT) provide adaptive
neighbor weighting, improving expressiveness when inter-
action strength varies across neighbors [71].
While these approaches improve interaction awareness,
many formulations implicitly allow interaction cost to grow
with scene density (e.g., fully-connected or high-degree
graphs). This is a key embedded challenge: dense scenes
can substantially degrade E2E latency in real-time monitor-
ing. On edge devices, this often shows up as latency in-
creasing sharply with agent count, even when average-case
runtime looks acceptable [5]. Our work directly addresses
this scaling issue by bounding neighborhood size (via ge-
ometric filtering and hard caps) to upper-bound interaction
complexity.
Spatio-Temporal Attention and Lightweight Se-
quence Modeling.Attention mechanisms have been used
to focus prediction on the most relevant historical states and
neighboring agents. STA-LSTM employs spatial and tem-
poral attention to quantify the influence of specific neigh-
bors and past steps, providing both accuracy gains and
interpretability via attention weights [3, 45]. In parallel,
SVTP-oriented hybrid designs (e.g., VT-Former) leverage
interaction-aware tokenization and transformer components
to model longer-range dependencies [53, 70, 81]. For em-
bedded deployment, these approaches highlight the need to
retain the benefits of attention while controlling compute
growth under dense traffic. Our design follows the same
principle, preserving interaction reasoning, while making
runtime more predictable through explicit bounds on the in-
teraction graph. Recent work has also explored lightweight
transformer designs for trajectory forecasting with reduced
overhead, e.g., hierarchical light transformer ensembles
[37].
Fast Decoding and Non-autoregressive Trajectory
Generation.A second embedded bottleneck is decoding:
many predictors generate future steps sequentially, leading
to inference cost that scales with the prediction horizon and
accumulating error when predictions are fed back into the
model. Recent work in trajectory prediction has explored
non-autoregressive decoding strategies that generate futures
in parallel [10, 27, 54, 80]. For example, TUTR unifies
social interaction and multimodal trajectory prediction in
a transformer encoder–decoder design and predicts diverse
trajectories in parallel, demonstrating that parallel decoding
can reduce test-time overhead compared to pipelines that
rely on expensive post-processing [28, 62]. PreTR similarly
leverages parallel decoding with learned queries to mitigate
exposure bias and reduce test-time computation [2].
Complementary to non-autoregressive decoding, com-
pact parametric decoding reduces step-wise cost by pre-
dicting a small parameter set and reconstructing dense tra-
jectories. Probabilistic B ´ezier curve formulations provide
a representative control-point-based approach for one-shot
multi-step prediction [32]. In the autonomous-driving set-
ting, Efficient Motion Prediction (EMP) further illustrates
that carefully chosen lightweight architectural components
can achieve strong accuracy with fast training and inference
[57]. Our work builds on this line of thinking for SVTP:
we remove iterative decoding entirely by predicting a small
set of curve parameters in one pass, enabling predictable
runtime on edge hardware.
Behavior-aware Forecasting under Embedded Con-
straints.A recent direction is to incorporate cognitive pri-
ors and behavioral insights to better handle intent uncer-
tainty. HLTP adopts a teacher–student framework inspired
by human visual processing and visual attention allocation
[43]. BAT introduces a behavior-aware model that inte-
grates traffic-psychology motivated cues to infer interac-
tions without manual behavior labeling [44]. These ap-
proaches can improve accuracy and robustness, but their
additional behavioral reasoning components and training
pipelines can increase system complexity. In contrast, our
focus is on deployment-facing efficiency: bounding interac-
tion cost and simplifying decoding, while remaining com-
patible with future integration of richer behavioral priors.
Embedded Efficiency and Deployment-oriented
Evaluation.Embedded VTP systems often rely on model
compression and hardware-aware optimization (e.g.,
distillation, pruning, and quantization) to reduce compute
and memory footprints. Knowledge distillation (KD) is a
widely used paradigm for transferring knowledge from a
larger teacher model to a compact student network [25, 30].
In embedded vision practice, latency-aware structured
pruning has been explicitly studied to align sparsity with
measured execution cost on target devices [8, 11, 16] .
Hardware/algorithm co-design for low-bit inference can
further reduce compute, as illustrated by EVW work on
binary-weight networks and dedicated inference engines
[14].
These techniques are complementary to our approach.
In many real-time SVTP deployments, worst-case latency
is frequently dominated by (i) scene-dependent interac-
tion density and (ii) decoding cost rather than raw param-
eter count alone. Accordingly, we focus on architecture-
level predictability (bounded graphs and one-shot decod-
ing), while treating compression methods as orthogonal im-
provements. Finally, EVW work on low-latency embedded
vision emphasizes that deployment claims should be sup-
ported by E2E measurements rather than forward-pass tim-
ing alone [56]. Our evaluation follows this deployment-first
perspective by timing the full inference pipeline on edge
3714


## Page 4

hardware.
3. Method
We present EdgeVTP, an embedded-first model for vehi-
cle trajectory prediction in roadside highway surveillance.
EdgeVTP is built to deliver a favorable accuracy-latency
trade-off under E2E measurement, where runtime includes
interaction graph construction and trajectory reconstruction.
The design is guided by three principles: (i) one-shot fu-
ture generation to avoid horizon-scaled autoregressive de-
coding, (ii) bounded interaction complexity to stabilize run-
time in dense scenes, and (iii) compact model design to re-
duce compute and memory for edge deployment.
3.1. Problem Setup and Notation
We consider a traffic scene withNtracked vehicles at the
current (last observed) timet. The 2D position of vehiclei
at timeτisc τ
i ∈R 2. For each vehicle, we use an observed
history of lengthT in,C in
i (t)∈R Tin×2, containing positions
fromt−T in + 1tot. We also use per-step displacements
∆cτ
i =c τ
i −cτ−1
i , forming a temporal displacement history
∆Cin
i (t)∈R Tin×2 (with the first term padded for shape
consistency).
Given these observations, the goal is to predict the fu-
ture trajectory over a horizonTout,bCout
i (t)∈R Tout×2, corre-
sponding to positions fromt+ 1tot+T out. We denote the
ground-truth future asC out
i (t)and train the model to mini-
mize prediction error over the forecast horizon.
3.2. Edge Builder
As shown in Fig. 1, the Edge Builder constructs an interac-
tion graph at the current frametusing only the last observed
positions{c t
i}N
i=1. For each vehiclei, we first form a candi-
date neighbor set by radius gating: we retain vehicles whose
Euclidean distance toiis at mostrmeters. This removes
distant actors that are unlikely to affect short-horizon mo-
tion and reduces graph density.
To make runtime predictable on embedded hardware, we
then apply a hard top-Kcap. Among the radius candi-
dates, we keep only theKclosest neighbors for each ve-
hicle. We denote the resulting (capped) neighbor index list
for vehicleiasE t
i , i.e.,E t
i contains the indices of vehi-
cle that exchange messages withiat timet. This explicitly
bounds the number of incoming interaction edges per vehi-
cle, stabilizing message passing cost under varying traffic
density and providing a direct efficiency knob: smallerK
reduces edge count, intermediate activations, and memory
bandwidth pressure.
Aggregating all per-vehicle neighbor lists gives a di-
rected edge setE(t), consisting of pairs(i, j)for allj∈E t
i .
Neighbor selection is deterministic at inference time. Dur-
ing training, when more than K candidates exist within ra-
dius r during training, we sample K neighbors uniformly at
random from the radius-filtered set; inference always uses
the deterministic K-nearest selection. We ablate the ef-
fect of the interaction radiusrand neighbor capKon the
accuracy–latency trade-off in the supplementary material.
3.3. Encoder
Fig. 1 summarizes our encoder, which has two stages: a
temporal projection that maps each vehicle’sT in observed
history to a compact embedding, followed by a graph-based
interaction encoder that aggregates neighbor information
using the edge index from the Edge Builder.
Temporal encoding.For each vehiclei, we use two in-
put streams (Sec. 3.1): absolute positionsC in
i (t)∈R Tin×2
and displacements∆C in
i (t)∈R Tin×2.Figure 1 depicts these
histories asT in ×2sequences; for the temporal encoder we
flatten each stream and concatenate them into a single vec-
tor: :x cx
i = vec(C in
i (t))∈R 2Tin,x ∆
i = vec(∆C in
i (t))∈
R2Tin, andx real
i = [x cx
i ;x ∆
i ]∈R 4Tin. The temporal
encoder block applies a lightweight feed-forward projec-
tion to obtain an intermediate node embeddingh main
i =
ftemp(xreal
i ), implemented as a compact linear layer fol-
lowed by LeakyReLU for efficiency. To support residual
separation (the two side branches in Fig. 1), we optionally
compute stream-specific embeddingsh cx
i =f cx
temp(xcx
i )
andh ∆
i =f ∆
temp(x∆
i ), using the same lightweight projec-
tion structure.
Graph interaction encoding (GIE).Given the per-vehicle
neighbor index listE t
i (Sec. 3.2), we apply graph message
passing to aggregate information from interacting vehicles.
We compute a main interaction featurez main
i by applying
a GIE block toh main
i over the directed edges defined by
Et
i . When residual separation is enabled, we additionally
apply separate GIE blocks to the stream-specific embed-
dings to obtain branch interaction featuresz cx
i andz ∆
i . We
align these branch features to the main dimensionality using
a lightweight linear projectionProj(·)and fuse them with
learnable gatesαandβ(Fig.1 ):
zi =z main
i +αProj(z cx
i ) +βProj(z ∆
i ). (1)
The fused interaction featurez i is then converted to the se-
quence representation used by the Transformer decoder and
combined with the displacement stream to form the decoder
memory tokens. Here,αandβare learnable scalar resid-
ual weights (shared across vehicles and time) that weight
the two residual branches; we initializeα=β= 0.1and
learn them end-to-end so that the residual branches con-
tribute modestly at the start of training. These weights allow
the model to dynamically balance the influence of absolute
position vs. displacement streams.
3.4. Transformer Decoder
Memory construction.The encoder output (Eq. 1) is con-
verted to a sequence aligned with the input horizon and de-
3715


## Page 5

Encoder Block
t
t+1-Tin
t-Tin  Transformer
Decoder
One-shot
Curve Head
(Bezier)
Edge Builder
(radius filter,
top-𝐾 cap.)
Input (Tin)
Ciin
α
β Temporal
Encoder
zi
Eit
Predicted
Output (Tout)
Ĉiout
∆Ciin
Cit
∆Ciin
t
Eit
Ciin∆Ciinr

∆Ciin
Ciin
∆Ciin
Ciin
CiinCiin
∆Ciin∆Ciin
 Graph-based
Interaction
Encoder
 Graph-based
Interaction
Encoder
himainhi∆ hicx
zimain
Mi
∆Deciin
Figure 1.EdgeVTP overview.For each vehicle, we use observed absolute positionsC in
i (t)and displacements∆C in
i (t)overT in frames.
The Edge Builder forms a directed neighbor graph at timetusing a radiusrand top-Kcap, producing edge indicesE t
i . A temporal encoder
projects the motion history, and a Graph-based interaction encoder (GIE) aggregates neighbor information; branch features are fused via
optional learnable scalar residual weighting (α, β) to producezi (Optional branches are shown as orange arrows). To preserve local motion
fidelity while incorporating social context, we fuse interaction embeddings with raw displacement histories as decoder memory tokens
(Decin
i (t) = [∆C in
i (t) ;Z i(t)]). Then a compact Transformer decoder drives a one-shot degree-4 B ´ezier head that predicts four control
point offsets{∆P k}4
k=1 to define a 5-point degree-4 curve anchored atP 0 and samplesT out future positions to output bCout
i (t).
noted asZ i(t)(Fig. 1). We then concatenateZ i(t)with the
observed displacement history∆C in
i (t)along the feature
dimension to form the decoder input tokens:Dec in
i (t) =
[∆Cin
i (t) ;Z i(t)]. ThisT in-length sequenceDec in
i (t)is
passed to the Transformer decoder.
Lightweight decoding.We use a compact Transformer de-
coder (2 layers, 2 heads) that attends toDec in
i (t)and pro-
duces a single latent tokenM i(t)for prediction. We ab-
late the effect of decoder capacity (e.g., number of attention
heads) on accuracy and latency in the supplementary mate-
rial. Importantly, the decoder doesnotgenerate future steps
autoregressively; instead,M i(t)parameterizes the one-shot
degree-4 B´ezier head described in Sec. 3.5.
3.5. One-shot Degree-4 B´ezier Decoding
We replace horizon-scaled autoregressive decoding with a
one-shot, curve-parameterized prediction head. For each
vehiclei, we anchor the curve at the last observed position
P0 =c t
i. The Transformer decoder produces a single latent
tokenM i(t)(from previous Sec. 3.4), which a lightweight
linear head maps to four 2D control point offsets. These,
combined with the anchorP 0, define the set{P 0, . . . , P4},
defining the remaining control points of a degree-4 B ´ezier
curve:
Pk =P 0 + ∆Pk, k∈ {1,2,3,4}. (2)
Given the five control points{P 0, . . . ,P4}, we obtain the
predicted future trajectory by evaluating the B´ezier curve at
uniformly spaced parametersu s ∈[0,1]:
bc t+s
i =
4X
k=0
4
k

(1−u s)4−kuk
s Pk, s= 1, . . . , T out,
(3)
where us = s/Tout. Unless stated otherwise, we useT out =
25.
This formulation predicts a small set of control points
rather thanT out step-wise outputs, eliminating sequential
decoding and reducing output-layer computation and acti-
vation memory. At the same time, the global curve param-
eterization encourages temporally coherent (smooth) fore-
casts while remaining flexible enough to represent common
highway maneuvers.
3.6. Training Objective
The one-shot B ´ezier head (Sec. 3.5) yieldsT out = 25fu-
ture positions{bct+k
i }Tout
k=1 for each vehicle. We train using
a maskedℓ 2 loss in absolute space (maskm k
i accounts for
vehicle visibility), normalized by the total number of pre-
diction slotsN·T out.
Ltraj = 1
N·T out
NX
i=1
ToutX
k=1
mk
i


bct+k
i −c t+k
i


2
2. (4)
Design for embedded deployment.The EdgeVTP ar-
chitecture is explicitly designed to maintain low and
predictable end-to-end latency in dense traffic scenarios.
Bounded interaction graphs (radius gating with an optional
top-Kcap) limit message passing cost under dense traf-
fic, while a compact decoder keeps attention and activation
memory small. Finally, one-shot B ´ezier decoding removes
horizon-scaled autoregressive steps in favor of a single de-
coder pass followed by analytic curve evaluation. Together,
these choices reduce compute and memory footprints while
preserving interaction-aware forecasting.
3716


## Page 6

4. Experimental Setup
Datasets and protocol.We evaluate on three surveillance
highway settings: NGSIM and CHD under two camera
viewpoints (High-angle and Eye-level). NGSIM features
dense highway interactions, while CHD complements it
with viewpoint and scene-geometry variation that stresses
robustness to perspective distortion and tracking noise.
Each sample consists of an observed history ofT in = 15
steps and a prediction horizon ofT out = 25steps. To ensure
a consistent temporal window across datasets, we resample
sequences to a common rate (5 Hz), corresponding to 3 s of
observation and 5 s of prediction. We follow the standard
dataset splits and evaluation protocol used in prior work for
each benchmark.
Model configuration and operating points.Unless stated
otherwise, EdgeVTP uses a lightweight temporal projection
(single FC with LeakyReLU) followed by a GIN-based in-
teraction encoder, a compact Transformer decoder (2 lay-
ers, 2 heads), and one-shot degree-4 B ´ezier decoding that
predicts four control-point offsets and analytically recon-
structsT out future positions (Sec. 3.5). For graph construc-
tion (Sec. 3.2), we apply radius gating with a hard top-
Kneighbor cap; during training, we optionally random-
sample within the radius as regularization while preserv-
ing the same test-time compute budget. From a sweep over
(r, K)and residual separation, we select three representa-
tive operating points (Table 3 obtained from ablation study
presented in the supplementary material) that we report con-
sistently across the paper; the complete sweep is provided
in the supplementary material.
Training details and hardware.Unless stated otherwise,
training and evaluation are performed on NVIDIA H100
GPUs. We train for 80 epochs using Adam with learning
rate1×10 −2 and weight decay5×10 −4. We use a multi-
step schedule with milestones at epochs 40/60/70 and de-
cay factor 0.1. The batch size is 16 and dropout is 0.2. Our
primary objective is a maskedℓ 2 loss in absolute position
space (Sec. 3.6).
Metrics and latency measurement.We report ADE (aver-
age displacement error) and FDE (final displacement error),
along with horizon-specific RMSE at 1-5 seconds (com-
puted at 5 Hz). Errors are reported in meters on NGSIM
and in pixels on CHD, following each dataset protocol. We
measure latency with batch size 1 and report E2E runtime,
which includes graph construction (Edge Builder), model
inference, and post-processing (trajectory reconstruction).
We run a warm-up phase (50 runs) and report mean latency
over repeated inference on the NGSIM test set under a fixed
deployment configuration. Latency is measured using Py-
Torch FP32 inference with synchronization for timing. To
reduce measurement noise, we keep the software stack and
precision fixed, disable data loader workers during timing
(num workers=0), fix CPU threading, and avoid logging
or metric computation inside the timed region. We use
H100 timings to analyze relative compute scaling under a
controlled stack, and we report embedded-device latency
separately on Jetson platforms.
5. Results
We evaluate EdgeVTP under two coupled objectives central
to embedded deployment: prediction quality and deploya-
bility. We report prediction errors (ADE/FDE and horizon
RMSE), parameter count, and E2E latency (batch size 1)
on NGSIM (meters) and CHD under two surveillance view-
points (pixels), following each dataset protocol.
Table 1. CHD Eye-level: comparison to established baselines on
the CHD benchmark [35]. Errors in pixels (lower is better).
RMSE
Model ADE FDE 1s 2s 3s 4s 5s
S-STGCNN [47] 24.33 95.224.32 9.15 15.93 29.05 68.32
GRIP++ [41] 44.27 129.58 4.42 12.86 24.31 35.04 145.17
Pishgu [5] 37.99 123.69 4.98 13.58 26.61 50.31 106.45
VT-FormerLH[53] 34.88 100.59 6.71 17.24 28.70 45.86 82.00
VT-FormerM H[53] 27.44 85.45 5.19 12.90 21.38 35.09 68.60
VT-FormerSH[53] 21.86 66.28 5.42 12.69 18.81 26.67 53.05
EdgeVTPLat 27.53 84.62 7.50 15.90 27.78 48.82 94.64
EdgeVTPTF 19.24 56.55 6.21 12.35 19.59 31.26 60.79
EdgeVTPError 29.65 98.04 7.64 16.07 28.86 54.20 112.25
CHD: robustness across viewpoints.We report three
EdgeVTP operating points: EdgeVTP Lat (latency-focused),
EdgeVTPTF (balanced), and EdgeVTP Error (accuracy-
focused), selected via an NGSIM ablation sweep.
Tables 1 and 2 report results on CHD Eye-level and
High-angle splits, respectively (pixels). A key observation
is that the preferred operating point depends on viewpoint:
the balanced configuration performs best on Eye-level
scenes, while the accuracy-focused configuration performs
best under the overhead High-angle viewpoint. Across both
splits, EdgeVTP improves over other transformer-based
baselines and remains competitive with the strongest pub-
lished methods, indicating that the embedded-oriented de-
sign transfers beyond the dataset used for operating-point
selection. For CHD, we apply the same radius gating in the
dataset coordinate system (i.e., r is in pixels).
Ablation-guided operating points.EdgeVTP exposes ex-
plicit deployment knobs through the Edge Builder (interac-
tion radiusrand neighbor capK) and an optional residual
refinement path. We sweep these choices on NGSIM as
discussed previously in this section to select three represen-
tative operating points that we use consistently across all
benchmarks. Table 3 summarizes these variants. The full
sweep is reported in the supplementary material and shows
the resulting accuracy-latency trade-off. Our profiling re-
veals that pipeline overhead, including graph construction,
3717


## Page 7

Table 2. CHD High-angle: comparison to established baselines on
the CHD benchmark [35]. Errors in pixels (lower is better).
RMSE
Model ADE FDE 1s 2s 3s 4s 5s
S-STGCNN [47] 31.87 98.469.74 21.83 29.01 42.34 82.14
GRIP++ [41] 36.32 100.89 3.40 6.67 14.32 28.02 123.04
Pishgu [5] 18.33 61.92 4.04 7.48 13.99 24.30 51.51
VT-FormerLH[53] 25.95 87.21 7.60 17.35 22.90 27.97 66.39
VT-FormerM H[53] 25.90 87.90 6.40 14.62 20.56 29.44 70.05
VT-FormerSH[53] 25.33 88.99 5.67 12.96 19.12 29.83 70.72
EdgeVTPLat 22.04 74.04 5.77 12.36 21.42 37.41 82.83
EdgeVTPTF 18.77 60.04 5.61 11.48 19.10 31.99 68.14
EdgeVTPError 15.23 52.28 4.38 8.71 14.55 26.01 59.50
0 1 2 3 4 5 10 15 20 25 30 35
End to End Latency (ms)
0
1
2
3
4ADE (m)
VT-Former-LH
VT-Former-MH
VT-Former-SH
STA-LSTM
EdgeVTPLat
EdgeVTPTF
EdgeVTPError
Figure 2. Accuracy–latency trade-off on NGSIM. Each point rep-
resents a model evaluated on the NGSIM dataset. The ideal op-
erating region is the bottom-left (closer to origin is better). High-
lighted points indicate the three operating points used in the main
paper: EdgeVTP Lat (latency-focused), EdgeVTP TF (balanced),
and EdgeVTP Error (accuracy-focused). All points report E2E la-
tency under the protocol in Section 4
accounts for 25-35% of total E2E runtime on edge hard-
ware, justifying our focus on architectural predictability.
NGSIM: comparison to prior methods.Table 4 com-
pares EdgeVTP to representative trajectory predictors on
NGSIM (meters) while also reporting E2E latency when
available. Across baselines, strong accuracy often comes
with higher runtime, particularly for heavier transformer-
centric pipelines. In contrast, EdgeVTP provides a prac-
tical accuracy-latency trade-off: the latency-focused oper-
ating point achieves the fastest E2E inference, while the
balanced and accuracy-focused variants improve prediction
Table 3. Ablation-selected EdgeVTP operating points on NGSIM
(meters). Full ablation sweep is reported in the supplementary
material.
Variantr KResidual ADE FDE E2E (ms)
EdgeVTPLat 20m 16 No 2.13 4.933.17
EdgeVTPTF 20m 16 Yes 1.89 4.37 4.30
EdgeVTPError 30m 16 Yes1.854.25 4.58
2 3 4 5 6
End to End Latency (ms)
0
1
2
3
4
5ADE (m)
1
2
EdgeVTPLat (3)
4
5
6
7
8
9
10
11
EdgeVTPTF (12)
13 14
EdgeVTPError (15)
16
17
Figure 3. Accuracy–latency trade-off on NGSIM across the
EdgeVTP ablation sweep. Each point corresponds to one configu-
ration (extensive ablation results are covered in supplementary ma-
terial). Highlighted points indicate the three operating points used
in the main paper: EdgeVTP Lat (latency-focused), EdgeVTP TF
(balanced), and EdgeVTP Error (accuracy-focused). All points re-
port E2E latency under the protocol in Section 4
quality with only modest additional runtime. These results
support the central goal of EdgeVTP: enabling interaction-
aware forecasting under realistic E2E measurement. For Ta-
ble 4, entries marked * use E2E latencies reported by the
cited papers (protocols/hardware may differ). All unstarred
E2E latencies are measured by us on NVIDIA H100 using
the unified protocol in Section 4.
Jetson latency.Table 5 reports batch size 1 E2E latency on
Jetson Nano (5W/10W) and Jetson Xavier NX (10W 2-core
/ 20W 6-core). Across devices and power modes, EdgeVTP
operates in the tens-of-milliseconds regime, while the VT-
Former baseline is substantially slower. The three EdgeVTP
operating points offer a clear latency/accuracy spectrum,
enabling flexible selection under different power and frame-
time budgets.
Qualitative results and failure modes.Figure 4 visualizes
typical predictions on NGSIM. We observe successful cases
where the model closely matches the ground truth over the
full horizon, as well as two common failure modes: (i) lat-
eral offset errors (correct trend but shifted laterally), and
(ii) maneuver ambiguity near turns or lane changes, where
multiple futures remain plausible from short history alone.
These cases motivate future extensions with additional in-
tent cues (e.g., longer context or map topology) while pre-
serving the embedded constraints.
3718


## Page 8

Table 4. Results comparison on the NGSIM datasets[17, 18]. Errors in meters; E2E latency is batch=1 when available (lower is better).
Missing entries are denoted by–. ∗ represents models with latencies obtained from literature.
Model ADE FDE 1s 2s 3s 4s 5s A VG Params (K) E2E (ms)
Pishgu∗ [5] 2.44 5.39 0.60 1.77 3.09 4.55 6.15 3.232 132 3.50
iNATran∗ [15]– – 0.39 0.96 1.61 2.42 3.43 1.762–20.92
DTBP∗ [23]– – 1.18 2.83 4.22 5.82– 3.5125–62.00
CS-LSTM∗ [19] 2.29 3.34 0.61 1.27 2.09 3.10 4.37 2.288 191 3.61
STA-LSTM [45] 1.89 3.16 0.37 0.98 1.17 2.63 3.78 1.786 124 5.01
DeepTrack [34] 2.01 3.21 0.47 1.08 1.83 2.75 3.89 2.004 109–
VT-FormerLH [53] 2.53 5.51 0.46 1.33 2.35 3.50 4.80 2.488 155 31.69
VT-FormerM H[53] 2.24 5.15 0.37 1.13 2.10 3.26 4.62 2.296 141 26.86
VT-FormerSH [53] 2.10 4.91 0.30 0.99 1.90 3.00 4.31 2.10 132 23.69
EdgeVTPLat 2.13 4.93 0.59 1.40 2.42 3.63 5.01 2.61 134.5 3.17
EdgeVTPTF 1.89 4.37 0.56 1.26 2.15 3.24 4.52 2.35 145.9 4.30
EdgeVTPError 1.85 4.25 0.60 1.31 2.19 3.25 4.51 2.37 145.9 4.58
Table 5. E2E latency on Jetson devices (batch=1), reported in ms
(lower is better). We evaluate Jetson Nano under 10W/5W and
Jetson Xavier NX under 10W (2-core) and 20W (6-core) power
modes.
Jetson Nano Jetson Xavier NX
Model 10W 5W 10W (2-core) 20W (6-core)
VT-FormerLH[53] 1034.26 1669.51 416.66 400.95
STA-LSTM [45] 51.82 102.85 29.49 30.64
EdgeVTPLat 27.87 48.46 14.06 11.85
EdgeVTPTF 38.27 66.46 19.10 16.21
EdgeVTPError 37.36 65.52 19.07 16.23
6. Discussion and Conclusion
EdgeVTP addresses fixed-camera highway trajectory pre-
diction under embedded constraints, where end-to-end la-
tency must stay low and stable even as traffic density in-
creases. Our results suggest that for Jetson-class deploy-
ment, end-to-end runtime is driven primarily by scene-
dependent interaction construction and horizon-scaled de-
coding overhead, rather than parameter count alone.
Bounding the interaction graph with radius gating and a
hard top-Kcap, together with one-shot B ´ezier decoding,
improves the accuracy–latency trade-off under an end-to-
end protocol that includes graph construction and trajec-
tory reconstruction. The best operating point varies with
viewpoint: on CHD, EdgeVTP achieves the SotA accuracy
among the listed methods on both splits, with EdgeVTP TF
best on Eye-level and EdgeVTP Error best on High-angle
[35]. On NGSIM, EdgeVTP achieves the lowest measured
end-to-end latency among the compared methods while re-
maining competitive in prediction error.
Conclusion.We presented EdgeVTP, an embedded-first
predictor for roadside surveillance that combines bounded
interaction graphs with one-shot degree-4 B ´ezier decod-
ing. Across CHD, it achieves the best accuracy and low-
est latency among the listed methods, and on NGSIM it
achieves the lowest measured end-to-end latency among the
compared methods while maintaining competitive accuracy.
These results show that making deployment constraints ex-
plicit in the architecture can yield practical trajectory pre-
diction for continuous edge-based highway monitoring.
(a) Success Case
(b) Failure Case (Turning)
(c) Failure Case (Offset)
Figure 4. Qualitative results on NGSIM. Observed history is red,
predictions are orange, ground truth is teal, and neighbors are gray.
3719


## Page 9

References
[1] Nvidia tensorrt documentation.https : / / docs .
nvidia.com/deeplearning/tensorrt/latest/
index.html. Accessed 2026-03-04. 1
[2] Lina Achaji, Thierno Barry, Thibault Fouqueray, Julien
Moreau, Francois Aioun, and Francois Charpillet. Pretr:
Spatio-temporal non-autoregressive trajectory prediction
transformer.arXiv preprint arXiv:2203.09293, 2022. 2, 3
[3] Alexandre Alahi, Kratarth Goel, Vignesh Ramanathan,
Alexandre Robicquet, Li Fei-Fei, and Silvio Savarese. So-
cial lstm: Human trajectory prediction in crowded spaces. In
Proceedings of the IEEE conference on computer vision and
pattern recognition, pages 961–971, 2016. 1, 3
[4] Mina Alibeigi, William Ljungbergh, Adam Tonderski, Georg
Hess, Adam Lilja, Carl Lindstr ¨om, Daria Motorniuk, Jun-
sheng Fu, Jenny Widahl, and Christoffer Petersson. Zenseact
open dataset: A large-scale and diverse multimodal dataset
for autonomous driving. InProceedings of the IEEE/CVF
International Conference on Computer Vision, pages 20178–
20188, 2023. 2
[5] Ghazal Alinezhad Noghre, Vinit Katariya, Armin
Danesh Pazho, Christopher Neff, and Hamed Tabkhi.
Pishgu: Universal path prediction network architecture for
real-time cyber-physical edge systems. InProceedings of
the ACM/IEEE 14th International Conference on Cyber-
Physical Systems (with CPS-IoT Week 2023), pages 88–97,
2023. 2, 3, 6, 7, 8
[6] Senyo Apewokin, Brian Valentine, Jee Choi, Linda Wills,
and Scott Wills. Real-time adaptive background modeling
for multicore embedded systems.Journal of Signal Process-
ing Systems, 62:65–76, 2011. 1
[7] Inhwan Bae, Junoh Lee, and Hae-Gon Jeon. Can Language
Beat Numerical Regression? Language-Based Multimodal
Trajectory Prediction . In2024 IEEE/CVF Conference on
Computer Vision and Pattern Recognition (CVPR), pages
753–766, Los Alamitos, CA, USA, 2024. IEEE Computer
Society. 1
[8] Asma Belhadi, Youcef Djenouri, and Ahmed Nabil Bel-
bachir. Lightprune: Latency-aware structured pruning for ef-
ficient deep inference on embedded devices. InProceedings
of the IEEE/CVF International Conference on Computer Vi-
sion (ICCV) Workshops, pages 1688–1697, 2025. 3
[9] Holger Caesar, Varun Bankiti, Alex H Lang, Sourabh V ora,
Venice Erin Liong, Qiang Xu, Anush Krishnan, Yu Pan, Gi-
ancarlo Baldan, and Oscar Beijbom. nuscenes: A multi-
modal dataset for autonomous driving. InProceedings of
the IEEE/CVF conference on computer vision and pattern
recognition, pages 11621–11631, 2020. 2
[10] Yuning Chai, Benjamin Sapp, Mayank Bansal, and Dragomir
Anguelov. Multipath: Multiple probabilistic anchor tra-
jectory hypotheses for behavior prediction.arXiv preprint
arXiv:1910.05449, 2020. 3
[11] Adwait Chandorkar, Hasan Tercan, and Tobias Meisen. Re-
thinking backbone design for lightweight 3d object detection
in lidar. InProceedings of the IEEE/CVF International Con-
ference on Computer Vision (ICCV) Workshops, pages 1698–
1706, 2025. 3
[12] Ming-Fang Chang, John Lambert, Patsorn Sangkloy, Jag-
jeet Singh, Slawomir Bak, Andrew Hartnett, De Wang, Peter
Carr, Simon Lucey, Deva Ramanan, et al. Argoverse: 3d
tracking and forecasting with rich maps. InProceedings of
the IEEE/CVF conference on computer vision and pattern
recognition, pages 8748–8757, 2019. 2
[13] Tianqi Chen, Thierry Moreau, et al. Tvm: An auto-
mated end-to-end optimizing compiler for deep learning. In
USENIX Symposium on Operating Systems Design and Im-
plementation (OSDI), 2018. 1
[14] Tse-Wei Chen, Wei Tao, Dongyue Zhao, Kazuhiro Mima,
Tadayuki Ito, Kinya Osa, and Masami Kato. Dedicated
inference engine and binary-weight neural networks for
lightweight instance segmentation. InProceedings of the
IEEE/CVF Conference on Computer Vision and Pattern
Recognition (CVPR) Workshops, pages 2101–2110, 2024. 3
[15] Xiaobo Chen, Huanjia Zhang, Feng Zhao, Yingfeng Cai, Hai
Wang, and Qiaolin Ye. Vehicle trajectory prediction based on
intention-aware non-autoregressive transformer with multi-
attention learning for internet of vehicles.IEEE Transactions
on Instrumentation and Measurement, 71:1–12, 2022. 1, 8
[16] Cevahir Cigla, Rohan Thakker, and Larry Matthies. Onboard
stereo vision for drone pursuit or sense and avoid. InPro-
ceedings of the IEEE Conference on Computer Vision and
Pattern Recognition (CVPR) Workshops, 2018. 3
[17] James Colyar and John Halkias. Next generation simula-
tion (NGSIM), Interstate 80 freeway dataset. FHW A-HRT-
06-137, 2006. 2, 8
[18] James Colyar and John Halkias. Next generation simulation
(NGSIM), US Highway-101 dataset. FHW A-HRT-07-030.,
2007. 2, 8
[19] Nachiket Deo and Mohan M. Trivedi. Convolutional social
pooling for vehicle trajectory prediction. InProceedings of
the IEEE/CVF Conference on Computer Vision and Pattern
Recognition Workshops (CVPRW), 2018. 1, 2, 8
[20] Nachiket Deo and Mohan M. Trivedi. Multi-modal trajec-
tory prediction of surrounding vehicles with maneuver based
lstms.arXiv preprint arXiv:1805.05499, 2018. 1
[21] Mark ´eta Dubsk ´a, Jakub Sochor, and Adam Herout. Auto-
matic camera calibration for traffic understanding. InPro-
ceedings of the British Machine Vision Conference (BMVC),
2014. 2
[22] Jiyang Gao, Chen Sun, Hang Zhao, Yi Shen, Dragomir
Anguelov, Congcong Li, and Cordelia Schmid. Vectornet:
Encoding hd maps and agent dynamics from vectorized rep-
resentation. InProceedings of the IEEE/CVF Conference on
Computer Vision and Pattern Recognition (CVPR), 2020. 1
[23] Kai Gao, Xunhao Li, Bin Chen, Lin Hu, Jian Liu, Ronghua
Du, and Yongfu Li. Dual transformer based prediction for
lane change intentions and trajectories in mixed traffic envi-
ronment.IEEE Transactions on Intelligent Transportation
Systems, 24(6):6203–6216, 2023. 8
[24] Panagiotis Giannakeris, Vagia Kaltsa, Konstantinos Avgeri-
nakis, Alexia Briassouli, Stefanos Vrochidis, and Ioannis
Kompatsiaris. Speed estimation and abnormality detection
from surveillance cameras. InProceedings of the IEEE Con-
ference on Computer Vision and Pattern Recognition Work-
shops, pages 93–99, 2018. 1
3720


## Page 10

[25] Jianping Gou, Baosheng Yu, Stephen J. Maybank, and
Dacheng Tao. Knowledge distillation: A survey.Interna-
tional Journal of Computer Vision, 129(6):1789–1819, 2021.
3
[26] Daniel Grimm, Ahmed Abouelazm, and J Marius Z ¨ollner.
Goal-based trajectory prediction for improved cross-dataset
generalization.arXiv preprint arXiv:2507.18196, 2025. 1
[27] Junru Gu, Chen Sun, and Hang Zhao. Densetnt: End-to-end
trajectory prediction from dense goal sets. InProceedings of
the IEEE/CVF International Conference on Computer Vision
(ICCV), 2021. 3
[28] Agrim Gupta, Justin Johnson, Li Fei-Fei, Silvio Savarese,
and Alexandre Alahi. Social gan: Socially acceptable tra-
jectories with generative adversarial networks. InProceed-
ings of the IEEE conference on computer vision and pattern
recognition, pages 2255–2264, 2018. 3
[29] Muhammad Hasanujjaman, Mostafa Zaman Chowdhury,
and Yeong Min Jang. Sensor fusion in autonomous vehicle
with traffic surveillance camera system: detection, localiza-
tion, and ai networking.Sensors, 23(6):3335, 2023. 1
[30] Geoffrey Hinton, Oriol Vinyals, and Jeff Dean. Distill-
ing the knowledge in a neural network.arXiv preprint
arXiv:1503.02531, 2015. 3
[31] Yizhou Huang, Yihua Cheng, and Kezhi Wang. Trajectory
mamba: Efficient attention-mamba forecasting model based
on selective ssm. InProceedings of the Computer Vision and
Pattern Recognition Conference, pages 12058–12067, 2025.
3
[32] Ronny Hug, Wolfgang H ¨ubner, and Michael Arens. Intro-
ducing probabilistic b ´ezier curves for N-step sequence pre-
diction. InProceedings of the AAAI Conference on Artificial
Intelligence, pages 10162–10169, 2020. 3
[33] E. Jeong, J. Kim, and S. Ha. Tensorrt-based framework and
optimization methodology for deep learning inference on jet-
son boards.ACM Transactions on Embedded Computing
Systems, 2022. 1
[34] Vinit Katariya, Mohammadreza Baharani, Nichole Mor-
ris, Omidreza Shoghli, and Hamed Tabkhi. Deeptrack:
Lightweight deep learning for vehicle trajectory prediction
in highways.IEEE Transactions on Intelligent Transporta-
tion Systems, 23(10):18927–18936, 2022. 2, 8
[35] Vinit Katariya, Ghazal Alinezhad Noghre, Armin Danesh
Pazho, and Hamed Tabkhi. A pov-based highway vehicle
trajectory dataset and prediction architecture.IEEE Transac-
tions on Intelligent Transportation Systems, 25(10):13136–
13146, 2024. 1, 2, 6, 7, 8
[36] Robert Krajewski, Julian Bock, Laurent Kloeker, and Lutz
Eckstein. The highd dataset: A drone dataset of natural-
istic vehicle trajectories on german highways for valida-
tion of highly automated driving systems. In2018 21st in-
ternational conference on intelligent transportation systems
(ITSC), pages 2118–2125. IEEE, 2018. 1, 2
[37] Adrien Lafage, Mathieu Barbier, Gianni Franchi, and David
Filliat. Hierarchical light transformer ensembles for multi-
modal trajectory forecasting. InIEEE/CVF Winter Confer-
ence on Applications of Computer Vision (WACV), 2025. 3
[38] Namhoon Lee, Wongun Choi, Paul Vernaza, Christopher B.
Choy, Philip H. S. Torr, and Manmohan Chandraker. Desire:
Distant future prediction in dynamic scenes with interacting
agents. InProceedings of the IEEE Conference on Computer
Vision and Pattern Recognition (CVPR), 2017. 1
[39] Xiaopeng Li, Jianxun Cui, Shi An, and Mohsen Parsafard.
Stop-and-go traffic analysis: Theoretical properties, environ-
mental impacts and oscillation mitigation.Transportation
Research Part B: Methodological, 70:319–339, 2014. 1
[40] Xin Li, Xiaowen Ying, and Mooi Choo Chuah. Grip: Graph-
based interaction-aware trajectory prediction. In2019 IEEE
Intelligent Transportation Systems Conference (ITSC), pages
3960–3966, 2019. 1, 2
[41] Xin Li, Xiaowen Ying, and Mooi Choo Chuah. Grip++: En-
hanced graph-based interaction-aware trajectory prediction
for autonomous driving.arXiv preprint arXiv:1907.07792,
2019. 6, 7
[42] Ming Liang, Bin Yang, Rui Hu, Yun Chen, Renjie Liao, Song
Feng, and Raquel Urtasun. Learning lane graph representa-
tions for motion forecasting. InEuropean Conference on
Computer Vision (ECCV), 2020. 1
[43] Haicheng Liao, Yongkang Li, Zhenning Li, Chengyue Wang,
Zhiyong Cui, Shengbo Eben Li, and Chengzhong Xu.
A cognitive-based trajectory prediction approach for au-
tonomous driving.IEEE Transactions on Intelligent Vehi-
cles, 2024. Early Access. 3
[44] Haicheng Liao, Zhenning Li, Huanming Shen, Wenxuan
Zeng, Dongping Liao, Guofa Li, and Chengzhong Xu.
Bat: Behavior-aware human-like trajectory prediction for au-
tonomous driving. InProceedings of the AAAI Conference
on Artificial Intelligence, pages 10332–10340, 2024. 1, 3
[45] Lei Lin, Weizi Li, Huikun Bi, and Lingqiao Qin. Vehicle
trajectory prediction using lstms with spatial-temporal atten-
tion mechanisms.IEEE Intelligent Transportation Systems
Magazine, 2021. 1, 3, 8
[46] Tobias Moers, Lennart Vater, Robert Krajewski, Julian Bock,
Adrian Zlocki, and Lutz Eckstein. The exid dataset: A real-
world trajectory dataset of highly interactive highway sce-
narios in germany. In2022 IEEE Intelligent Vehicles Sympo-
sium (IV), pages 958–964. IEEE, 2022. 2
[47] Abduallah A. Mohamed, Kun Qian, Mohamed Elhoseiny,
and Christian G. Claudel. Social-stgcnn: A social spatio-
temporal graph convolutional neural network for human tra-
jectory prediction. InProceedings of the IEEE/CVF Confer-
ence on Computer Vision and Pattern Recognition (CVPR),
pages 14412–14420, 2020. 1, 3, 6, 7
[48] Milind Naphade, Zheng Tang, Ming-Ching Chang, et al. The
2019 ai city challenge. InProceedings of the IEEE/CVF
Conference on Computer Vision and Pattern Recognition
Workshops (CVPRW), 2019. 1
[49] Milind Naphade, Shuo Wang, David Anastasiu, Zheng Tang,
Ming-Ching Chang, Xiaodong Yang, Liang Zheng, Anuj
Sharma, Rama Chellappa, and Pranamesh Chakraborty. The
4th ai city challenge. InProceedings of the IEEE/CVF Con-
ference on Computer Vision and Pattern Recognition Work-
shops (CVPRW), 2020. 1, 2
[50] Nigamaa Nayakanti, Rami Al-Rfou, Aurick Zhou, Kratarth
Goel, Khaled S. Refaat, and Benjamin Sapp. Wayformer:
Motion forecasting via simple & efficient attention networks.
arXiv preprint arXiv:2207.05844, 2022. 1
3721


## Page 11

[51] Jiquan Ngiam, Benjamin Caine, Vijay Vasudevan, Zheng-
dong Zhang, Hao-Tien Lewis Chiang, Jeffrey Ling, Rebecca
Roelofs, Alex Bewley, Chenxi Liu, Ashish Venugopal, et al.
Scene transformer: A unified architecture for predicting mul-
tiple agent trajectories.arXiv preprint arXiv:2106.08417,
2021. 2
[52] Burak Ozer and Marilyn Wolf. A train station surveillance
system: Challenges and solutions. InProceedings of the
IEEE Conference on Computer Vision and Pattern Recog-
nition (CVPR) Workshops, 2014. 1
[53] Armin Danesh Pazho, Ghazal Alinezhad Noghre, Vinit
Katariya, and Hamed Tabkhi. Vt-former: An exploratory
study on vehicle trajectory prediction for highway surveil-
lance through graph isomorphism and transformer. InPro-
ceedings of the IEEE/CVF Conference on Computer Vision
and Pattern Recognition Workshops (CVPRW), 2024. 1, 2,
3, 6, 7, 8
[54] Tung Phan-Minh, Elena Corina Grigore, Freddy A Boulton,
Oscar Beijbom, and Eric M Wolff. Covernet: Multimodal
behavior prediction using trajectory sets. InProceedings of
the IEEE/CVF conference on computer vision and pattern
recognition, pages 14074–14083, 2020. 3
[55] Mozhgan Pourkeshavarz, Junrui Zhang, and Amir Rasouli.
Cadet: a causal disentanglement approach for robust trajec-
tory prediction in autonomous driving. InProceedings of
the IEEE/CVF Conference on Computer Vision and Pattern
Recognition, pages 14874–14884, 2024. 1
[56] Omkar Prabhune, Tianen Chen, and Younghyun Kim.
Content-aware input scaling and deep learning computation
offloading for low-latency embedded vision. InProceed-
ings of the IEEE/CVF Conference on Computer Vision and
Pattern Recognition (CVPR) Workshops, pages 2218–2226,
2024. 3
[57] Alexander Prutsch, Horst Bischof, and Horst Possegger. Ef-
ficient motion prediction: A lightweight & accurate trajec-
tory prediction model with fast training and inference speed.
In2024 IEEE/RSJ International Conference on Intelligent
Robots and Systems (IROS), pages 9411–9417, 2024. 3
[58] Mengshi Qi, Jie Qin, Yu Wu, and Yi Yang. Imitative non-
autoregressive modeling for trajectory forecasting and im-
putation. InProceedings of the IEEE/CVF Conference on
Computer Vision and Pattern Recognition (CVPR), 2020. 2
[59] Mei Qiu, Lauren Christopher, Stanley Yung-Ping Chien, and
Yaobin Chen. Intelligent highway adaptive lane learning sys-
tem in multiple rois of surveillance camera video.IEEE
Transactions on Intelligent Transportation Systems, 25(8):
8591–8601, 2024. 1
[60] Vijay Janapa Reddi et al. Mlperf inference benchmark. In
Proceedings of the ACM/IEEE 47th Annual International
Symposium on Computer Architecture (ISCA), 2020. 1
[61] Tim Salzmann, Boris Ivanovic, Punarjay Chakravarty, and
Marco Pavone. Trajectron++: Dynamically-feasible trajec-
tory forecasting with heterogeneous data. InEuropean Con-
ference on Computer Vision (ECCV), 2020. 1
[62] Liushuai Shi, Le Wang, Sanping Zhou, and Gang Hua. Tra-
jectory unified transformer for pedestrian trajectory predic-
tion. InProceedings of the IEEE/CVF International Confer-
ence on Computer Vision (ICCV), pages 9675–9684, 2023.
3
[63] Shaoshuai Shi, Li Jiang, Dengxin Dai, and Bernt Schiele.
Motion transformer with global intention localization and lo-
cal movement refinement.arXiv preprint arXiv:2209.13508,
2022. 1
[64] Raghubir Singh and Sukhpal Singh Gill. Edge ai: A sur-
vey.Internet of Things and Cyber-Physical Systems, 3:71–
92, 2023. 1
[65] Jakub Sochor, Roman Jur ´anek, and Adam Herout. Traffic
surveillance camera calibration by 3d model bounding box
alignment for accurate vehicle speed measurement.arXiv
preprint arXiv:1702.06451, 2017. 2
[66] Pei Sun, Henrik Kretzschmar, Xerxes Dotiwalla, Aurelien
Chouard, Vijaysai Patnaik, Paul Tsui, James Guo, Yin Zhou,
Yuning Chai, Benjamin Caine, et al. Scalability in perception
for autonomous driving: Waymo open dataset. InProceed-
ings of the IEEE/CVF conference on computer vision and
pattern recognition, pages 2446–2454, 2020. 2
[67] Tushar Prasanna Swaminathan, Christopher Silver, and
Thangarajah Akilan. Benchmarking deep learning models
on nvidia jetson nano for real-time systems: An empirical
investigation.arXiv preprint arXiv:2406.17749, 2024. 1
[68] Xiaolong Tang, Meina Kan, Shiguang Shan, Zhilong Ji, Jin-
feng Bai, and Xilin Chen. Hpnet: Dynamic trajectory fore-
casting with historical prediction attention. InProceedings
of the IEEE/CVF conference on computer vision and pattern
recognition, pages 15261–15270, 2024. 1
[69] Zheng Tang, Milind Naphade, Ming-Yu Liu, Xiaodong
Yang, Stan Birchfield, Shuo Wang, Ratnesh Kumar, David
Anastasiu, and Jenq-Neng Hwang. Cityflow: A city-scale
benchmark for multi-target multi-camera vehicle tracking
and re-identification. InProceedings of the IEEE/CVF
Conference on Computer Vision and Pattern Recognition
(CVPR), 2019. 1, 2
[70] Ashish Vaswani, Noam Shazeer, Niki Parmar, Jakob Uszko-
reit, Llion Jones, Aidan N Gomez, Łukasz Kaiser, and Illia
Polosukhin. Attention is all you need.Advances in neural
information processing systems, 30, 2017. 3
[71] Petar Veli ˇckovi´c, Guillem Cucurull, Arantxa Casanova,
Adriana Romero, Pietro Li `o, and Yoshua Bengio. Graph at-
tention networks. InInternational Conference on Learning
Representations (ICLR), 2018. Poster. 3
[72] Aayush Atul Verma, Bharatesh Chakravarthi, Arpitsinh
Vaghela, Hua Wei, and Yezhou Yang. etram: Event-based
traffic monitoring dataset. InProceedings of the IEEE/CVF
conference on computer vision and pattern recognition,
pages 22637–22646, 2024. 1
[73] JiaYi Wei, JianFei Zhao, YanYun Zhao, and ZhiCheng
Zhao. Unsupervised anomaly detection for traffic surveil-
lance based on background modeling. InProceedings of the
IEEE conference on computer vision and pattern recognition
workshops, pages 129–136, 2018. 1
[74] Longyin Wen, Dawei Du, Zhaowei Cai, Zhen Lei, Ming-
Ching Chang, Honggang Qi, Jongwoo Lim, Ming-Hsuan
Yang, and Siwei Lyu. Ua-detrac: A new benchmark and
protocol for multi-object detection and tracking.Computer
Vision and Image Understanding, 193:102907, 2020. 1, 2
3722


## Page 12

[75] Benjamin Wilson, William Qi, Tanmay Agarwal, John
Lambert, Jagjeet Singh, Siddhesh Khandelwal, Bowen
Pan, Ratnesh Kumar, Andrew Hartnett, Jhony Kaesemodel
Pontes, et al. Argoverse 2: Next generation datasets for
self-driving perception and forecasting.arXiv preprint
arXiv:2301.00493, 2023. 2
[76] Yi Xu and Yun Fu. Adapting to length shift: Flexilength
network for trajectory prediction. InProceedings of the
IEEE/CVF Conference on Computer Vision and Pattern
Recognition, pages 15226–15237, 2024. 1
[77] Ye Yuan, Xinshuo Weng, Yanglan Ou, and Kris M Kitani.
Agentformer: Agent-aware transformers for socio-temporal
multi-agent forecasting. InProceedings of the IEEE/CVF
international conference on computer vision, pages 9813–
9823, 2021. 2
[78] Haichao Zhang, Yi Xu, Hongsheng Lu, Takayuki Shimizu,
and Yun Fu. Oostraj: Out-of-sight trajectory prediction
with vision-positioning denoising. InProceedings of the
IEEE/CVF Conference on Computer Vision and Pattern
Recognition, pages 14802–14811, 2024. 1
[79] Zhejun Zhang, Alexander Liniger, Christos Sakaridis, Fisher
Yu, and Luc Van Gool. Real-time motion prediction via het-
erogeneous polyline transformer with relative pose encod-
ing. InAdvances in Neural Information Processing Systems
(NeurIPS), 2023. 1, 3
[80] Hang Zhao et al. Tnt: Target-driven trajectory prediction.
arXiv preprint arXiv:2008.08294, 2020. 3
[81] Zikang Zhou, Luyao Ye, Jianping Wang, Kui Wu, and Ke-
jie Lu. Hivt: Hierarchical vector transformer for multi-agent
motion prediction. InProceedings of the IEEE/CVF con-
ference on computer vision and pattern recognition, pages
8823–8833, 2022. 3
3723
