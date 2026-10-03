// Typst Theory Notes - Artificial Intelligence & Machine Learning (Unit 5)
// Course Code: PCC-302-IT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[ARTIFICIAL INTELLIGENCE & ML — UNIT 5]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Neural Networks, Deep Learning & Advanced AI]]
      )
      v(-4pt)
      line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
    }
  },
  footer: context {
    line(length: 100%, stroke: 0.5pt + rgb("#e2e8f0"))
    v(2pt)
    grid(
      columns: (1fr, 1fr),
      align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[SPPU TE IT (2024 Pattern)] #text(size: 8pt, fill: rgb("#64748b"))[ | PCC-302-IT]],
      align(right)[#text(size: 8pt, fill: rgb("#64748b"))[Page #counter(page).display() of #counter(page).final().first()]]
    )
  }
)

#set text(
  font: "Helvetica",
  size: 9.5pt,
  fill: rgb("#0f172a") // Deep high-contrast dark text
)

#set par(
  justify: true,
  leading: 0.65em
)

#set heading(numbering: "1.1")

// Styling headings - Royal Blue & Navy Scheme
#show heading: set text(fill: rgb("#0f172a"))
#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (left: 4pt + rgb("#1d4ed8")), // Royal Blue Accent
  inset: (left: 10pt, y: 7pt),
  fill: rgb("#eff6ff"), // Soft Blue background
  radius: (right: 4pt),
  text(fill: rgb("#0f172a"), size: 12.5pt, weight: "bold")[#it.body]
)

#show heading.where(level: 2): it => block(
  width: 100%,
  inset: (y: 5pt),
  text(fill: rgb("#2563eb"), size: 11pt, weight: "bold")[#it.body]
)

#show heading.where(level: 3): it => block(
  width: 100%,
  inset: (y: 3pt),
  text(fill: rgb("#0f172a"), size: 9.5pt, weight: "bold", style: "italic")[#it.body]
)

// Raw blocks custom styling
#show raw.where(block: true): it => rect(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: rgb("#f8fafc"),
  inset: 8pt,
  radius: 4pt,
  it
)

// Custom Alert block - Royal Blue High Contrast
#let alert(type, content) = {
  let colors = (
    "NOTE": (border: rgb("#1d4ed8"), bg: rgb("#eff6ff")),
    "TIP": (border: rgb("#059669"), bg: rgb("#ecfdf5")),
    "IMPORTANT": (border: rgb("#1e293b"), bg: rgb("#f1f5f9")),
    "WARNING": (border: rgb("#b91c1c"), bg: rgb("#fef2f2")),
    "EXAMPLE": (border: rgb("#2563eb"), bg: rgb("#eff6ff"))
  )
  let c = colors.at(type, default: (border: rgb("#1d4ed8"), bg: rgb("#eff6ff")))
  
  rect(
    width: 100%,
    stroke: (left: 4pt + c.border),
    fill: c.bg,
    inset: 9pt,
    radius: (right: 4pt),
    [
      #text(weight: "bold", fill: c.border)[#type:] \
      #v(2pt)
      #text(fill: rgb("#0f172a"))[#content]
    ]
  )
}

// Figure Block Styling for Standard Diagrams
#let figure-box(title, content) = {
  rect(
    width: 100%,
    stroke: 0.5pt + rgb("#cbd5e1"),
    fill: rgb("#f8fafc"),
    inset: 9pt,
    radius: 4pt,
    [
      #align(center)[
        #content
        #v(4pt)
        #text(size: 8.5pt, weight: "bold", fill: rgb("#475569"))[#title]
      ]
    ]
  )
}

// Title Header Page 1
#align(left)[
  #text(size: 9pt, fill: rgb("#1d4ed8"), weight: "bold")[ARTIFICIAL INTELLIGENCE & MACHINE LEARNING (TE IT - 2024 Pattern)] \
  #v(2pt)
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 5: NEURAL NETWORKS, DEEP LEARNING & ADVANCED AI]
]

#v(6pt)
#rect(
  width: 100%,
  stroke: 1pt + rgb("#1d4ed8"),
  fill: rgb("#eff6ff"),
  radius: 4pt,
  inset: 9pt,
  [
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 7pt,
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Pattern:] TE IT - 2024 Pattern (SPPU)],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Academic Term:] Semester V (2026)],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Status:] Publication-Grade Theory Guide],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Code:] PCC-302-IT]
    )
  ]
)

#v(6pt)
#line(length: 100%, stroke: 1.5pt + rgb("#1d4ed8"))
#v(6pt)

=== Syllabus Mapping & Unit Structure
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 5 based on SPPU end-semester examination trends.

#table(
  columns: (1.4fr, 3.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 7pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Syllabus Topic]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[In-Depth Exam Coverage]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Priority / Weightage]*]
  ),
  [*ANN & Perceptron Learning*], [Biological vs Artificial neurons, McCulloch-Pitts model, Rosenblatt's Perceptron, Perceptron Learning Algorithm, XOR linear inseparability limitation.], [High Priority \ (6-8 Marks Qs)],
  [*Activation Functions & MLP*], [Sigmoid, Tanh, ReLU, Leaky ReLU, Softmax, Multilayer Perceptron (MLP) architecture, Feedforward calculation, Weight initialization (Xavier, He).], [High Priority \ (8-10 Marks Qs)],
  [*Error Backpropagation*], [Backpropagation algorithm derivation using Chain Rule, Gradient Descent weight updates, Loss functions (MSE, Cross-Entropy), Momentum parameter.], [High Priority \ (8-10 Marks Qs)],
  [*Probabilistic Reasoning & BBN*], [Bayes' rule, Bayesian Belief Networks (BBN), Directed Acyclic Graphs (DAG), Conditional Probability Tables (CPTs), Markov Blanket, d-separation.], [High Priority \ (7-9 Marks Qs)],
  [*Sampling & Markov Models*], [Prior Sampling, Rejection Sampling, Likelihood Weighting, Markov Chains, Hidden Markov Models (HMM), Three Fundamental Problems (Forward, Viterbi, Baum-Welch).], [High Priority \ (8-10 Marks Qs)],
  [*Constraint Satisfaction (CSP)*], [Variables, Domains, Constraints, Map Coloring, Cryptarithmetic, AC-3 Arc Consistency, MRV, Degree, LCV heuristics, Branch & Bound 0/1 Knapsack.], [High Priority \ (8-10 Marks Qs)],
  [*Fuzzy Logic, NLP & LLMs*], [Fuzzy vs Crisp sets, Membership functions, Fuzzy operations, Mamdani FIS, NLP pipeline (TF-IDF, Embeddings), Transformer Self-Attention, Tokenization & LLMs.], [High Priority \ (8-10 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Artificial Neural Networks & Deep Learning Foundations

== Biological Inspiration vs. Artificial Neuron Architecture
Artificial Neural Networks (ANNs) are massively parallel distributed computational models inspired by the structural and functional biological neural networks in the human brain.

#figure-box(
  "Figure 5.1: Biological Neuron Anatomy vs Artificial Neuron Computational Model",
  [
    #grid(
      columns: (1fr, 1.3fr),
      gutter: 12pt,
      align: center,
      [
        #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 7pt, radius: 4pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"))[Biological Neuron]\
          #v(2pt)
          #align(left)[
            #text(size: 8pt, fill: rgb("#334155"))[
              - *Dendrites:* Receive electrochemical signals.\
              - *Soma (Cell Body):* Sums incoming signals.\
              - *Axon:* Transmits action potential spike.\
              - *Synaptic Terminals:* Modulates signal strength.
            ]
          ]
        ]
      ],
      [
        #rect(stroke: 1pt + rgb("#059669"), fill: rgb("#ecfdf5"), inset: 7pt, radius: 4pt)[
          #text(weight: "bold", fill: rgb("#065f46"))[Artificial Neuron (Perceptron)]\
          #v(2pt)
          #align(left)[
            #text(size: 8pt, fill: rgb("#334155"))[
              - *Input Signals ($x_1, ..., x_d$):* Feature attributes.\
              - *Weights ($w_1, ..., w_d$) & Bias ($b$):* Synaptic strengths.\
              - *Net Summation ($z = bold(w)^T bold(x) + b$):* Soma integrator.\
              - *Activation Function ($f(z)$):* Action threshold.
            ]
          ]
        ]
      ]
    )
  ]
)

== Foundational Neuron Models: McCulloch-Pitts & Rosenblatt's Perceptron

1. *McCulloch-Pitts (M-P) Neuron Model (1943):*
   - Earliest simplified mathematical abstraction of biological neurons.
   - Accepts binary boolean inputs $x_i in {0, 1}$ with two distinct input types: *Excitatory* ($+1$) and *Inhibitory* ($0$).
   - *Firing Rule:* If any inhibitory input is active, the neuron is inhibited ($y = 0$). Otherwise, it fires ($y = 1$) if the sum of excitatory inputs equals or exceeds a fixed preset threshold $theta$:
     $ y = cases(1 quad &"if " sum_(i=1)^d x_i >= theta " and no inhibitory input active", 0 quad &"otherwise") $
   - *Limitation:* Weights are fixed and equal; cannot learn autonomously from data.
2. *Rosenblatt's Perceptron (1958):*
   - Introduces learnable real-valued synaptic connection weights $bold(w) in bb(R)^d$ and an adjustable bias $b = -theta$:
     $ z = sum_(i=1)^d w_i x_i + b = bold(w)^T bold(x) + b $
     $ hat(y) = text("step")(z) = cases(1 quad &"if " bold(w)^T bold(x) + b >= 0, 0 quad &"if " bold(w)^T bold(x) + b < 0) $
3. *Perceptron Learning Algorithm & Weight Update Rule:*
   For each training sample $(bold(x)^((i)), y^((i)))$:
   - Compute model prediction $hat(y)^((i)) = text("step")(bold(w)^T bold(x)^((i)) + b)$.
   - Calculate error: $e^((i)) = y^((i)) - hat(y)^((i))$.
   - Update weights and bias proportionally to learning rate $eta in (0, 1]$:
     $ w_j := w_j + eta (y^((i)) - hat(y)^((i))) x_j^((i)) $
     $ b := b + eta (y^((i)) - hat(y)^((i))) $
4. *Perceptron Convergence Theorem & XOR Limitation (Minsky & Papert, 1969):*
   - *Convergence Theorem:* If the training dataset is *linearly separable*, the perceptron learning algorithm is mathematically guaranteed to converge to a separating hyperplane in a finite number of iterations.
   - *The XOR Limitation:* A single-layer perceptron can only compute linearly separable boolean functions (AND, OR, NAND, NOR). It is mathematically impossible for a single hyperplane to separate the non-linear XOR (Exclusive-OR) / XNOR function. Overcoming this limitation required *Multilayer Perceptrons (MLPs)* equipped with non-linear activation functions.

== Comprehensive Analysis of Neural Activation Functions
Activation functions introduce non-linearity into neural networks, enabling them to approximate arbitrary complex mathematical mappings (Universal Approximation Theorem).

#table(
  columns: (1.2fr, 1.8fr, 1.3fr, 1.7fr, 2fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.even(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 5.5pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Function]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Mathematical Formula]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Output Range]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Derivative ($f'(z)$)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Exam Properties & Pitfalls]*]
  ),
  [*Sigmoid*], [$sigma(z) = 1 / (1 + e^(-z))$], [$(0, 1)$], [$sigma(z)(1 - sigma(z))$], [Smooth, probabilistic output. Prone to *Vanishing Gradient* at extreme $|z|$; not zero-centered.],
  [*Tanh*], [$tanh(z) = (e^z - e^(-z)) / (e^z + e^(-z))$], [$(-1, +1)$], [$1 - tanh^2(z)$], [Zero-centered outputs. Still suffers from vanishing gradients for large $|z|$.],
  [*ReLU*], [$text("ReLU")(z) = max(0, z)$], [$[0, +infinity)$], [$cases(1 quad &"if " z > 0, 0 quad &"if " z <= 0)$], [Computationally efficient, prevents vanishing gradient for $z > 0$. Prone to *Dying ReLU* problem.],
  [*Leaky ReLU*], [$max(alpha z, z), quad alpha approx 0.01$], [$(-infinity, +infinity)$], [$cases(1 quad &"if " z > 0, alpha quad &"if " z <= 0)$], [Prevents dying ReLU by allowing a small constant non-zero gradient for $z < 0$.],
  [*Softmax*], [$sigma(bold(z))_i = (e^(z_i)) / (sum_(k=1)^K e^(z_k))$], [$(0, 1), sum = 1$], [$sigma_i (delta_(i j) - sigma_j)$], [Standard output layer for multiclass classification; normalizes logits into class probability distribution.]
)

== Multilayer Perceptron (MLP) & The Error Backpropagation Algorithm
A Multilayer Perceptron is a fully connected feedforward artificial neural network consisting of at least three layers: an *Input Layer*, one or more *Hidden Layers*, and an *Output Layer*.

#figure-box(
  "Figure 5.2: Multi-Layer Perceptron (MLP) Feedforward and Backpropagation Pathways",
  [
    #rect(stroke: 0.5pt + rgb("#94a3b8"), fill: rgb("#ffffff"), inset: 8pt, radius: 3pt)[
      #grid(
        columns: (1fr, auto, 1fr, auto, 1fr),
        align: horizon + center,
        [
          #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 6pt, radius: 3pt)[
            #text(weight: "bold", fill: rgb("#1e3a8a"))[Input Layer]\
            $bold(x) = [x_1, ..., x_d]^T$
          ]
        ],
        [
          #text(size: 11pt, weight: "bold", fill: rgb("#2563eb"))[Feedforward $arrow.r$] \
          #v(2pt)
          #text(size: 11pt, weight: "bold", fill: rgb("#b91c1c"))[$arrow.l$ Backprop]
        ],
        [
          #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 6pt, radius: 3pt)[
            #text(weight: "bold", fill: rgb("#1e3a8a"))[Hidden Layer(s)]\
            $a_j = f(sum w_(j i) x_i + b_j)$
          ]
        ],
        [
          #text(size: 11pt, weight: "bold", fill: rgb("#2563eb"))[Feedforward $arrow.r$] \
          #v(2pt)
          #text(size: 11pt, weight: "bold", fill: rgb("#b91c1c"))[$arrow.l$ Backprop]
        ],
        [
          #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 6pt, radius: 3pt)[
            #text(weight: "bold", fill: rgb("#1e3a8a"))[Output Layer]\
            $hat(y)_k = g(sum w_(k j) a_j + b_k)$
          ]
        ]
      )
    ]
  ]
)

1. *Forward Propagation Pass:*
   - Net input to hidden neuron $j$: $z_j = sum_i w_(j i) x_i + b_j$.
   - Activation of hidden neuron $j$: $a_j = f(z_j)$.
   - Net input to output neuron $k$: $z_k = sum_j w_(k j) a_j + b_k$.
   - Final predicted output: $hat(y)_k = g(z_k)$.
2. *Loss Function (Mean Squared Error or Cross-Entropy):*
   $ E = 1 / 2 sum_(k=1)^K (y_k - hat(y)_k)^2 $
3. *Backward Propagation Pass (Derivation via Chain Rule):*
   - *Output Layer Weight Gradients:*
     $ frac(partial E, partial w_(k j)) = frac(partial E, partial hat(y)_k) dot frac(partial hat(y)_k, partial z_k) dot frac(partial z_k, partial w_(k j)) = - (y_k - hat(y)_k) dot g'(z_k) dot a_j = delta_k dot a_j $
     where the output error term is $delta_k = - (y_k - hat(y)_k) g'(z_k)$.
   - *Hidden Layer Weight Gradients:*
     $ frac(partial E, partial w_(j i)) = (sum_k frac(partial E, partial z_k) dot frac(partial z_k, partial a_j)) dot frac(partial a_j, partial z_j) dot frac(partial z_j, partial w_(j i)) = (sum_k delta_k w_(k j)) dot f'(z_j) dot x_i = delta_j dot x_i $
     where the hidden error term is $delta_j = (sum_k delta_k w_(k j)) f'(z_j)$.
4. *Weight and Bias Updates:*
   $ w_(k j) := w_(k j) - eta frac(partial E, partial w_(k j)) = w_(k j) - eta delta_k a_j $
   $ w_(j i) := w_(j i) - eta frac(partial E, partial w_(j i)) = w_(j i) - eta delta_j x_i $
5. *Weight Initialization Strategies:*
   - Initializing all weights to zero causes *symmetry breaking failure* (all hidden neurons compute identical gradients).
   - *Xavier (Glorot) Initialization:* $text("Var")(W) = 2 / (n_"in" + n_"out")$ (optimal for Sigmoid/Tanh).
   - *He Initialization:* $text("Var")(W) = 2 / (n_"in")$ (mandatory for ReLU/Leaky ReLU).

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=760")[Source: Russell & Norvig, Ch 21, p. 750-775] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/chapman-hall_crc-machine-learning-pattern-recognition-stephen-marsland-machine-learning_-an-algorithmic-perspective-second-edition-2014-chapman-and-hall_crc.pdf#page=55")[Source: Marsland, Ch 3-4, p. 45-98] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/M2-Machine_Learning_By_Ethem_Alpaydin_.pdf#page=245")[Source: Alpaydin, Ch 11, p. 237-270]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 2
// ==========================================
= Probabilistic Reasoning, Bayesian Networks & Markov Models

== Bayesian Belief Networks (BBN)
A Bayesian Belief Network is a probabilistic graphical model that represents a set of random variables and their conditional dependencies via a *Directed Acyclic Graph (DAG)*.

#figure-box(
  "Figure 5.3: Bayesian Belief Network Topology and Local Conditional Independence",
  [
    #rect(stroke: 0.5pt + rgb("#94a3b8"), fill: rgb("#ffffff"), inset: 8pt, radius: 3pt)[
      #grid(
        columns: (1fr, 1fr),
        gutter: 14pt,
        align: center,
        [
          #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 6pt, radius: 3pt)[
            #text(weight: "bold", fill: rgb("#1e3a8a"))[Burglary ($B$)] \
            #text(size: 7.5pt, fill: rgb("#475569"))[$P(B) = 0.001$]
          ]
          #v(4pt)
          #text(size: 11pt, fill: rgb("#2563eb"))[$arrow.b$]
          #v(4pt)
          #rect(stroke: 1.5pt + rgb("#1e3a8a"), fill: rgb("#eff6ff"), inset: 6pt, radius: 3pt)[
            #text(weight: "bold", fill: rgb("#1e3a8a"))[Alarm ($A$)] \
            #text(size: 7.5pt, fill: rgb("#475569"))[CPT: $P(A mid(|) B, E)$]
          ]
          #v(4pt)
          #grid(
            columns: (1fr, 1fr),
            gutter: 8pt,
            [
              #text(size: 10pt, fill: rgb("#2563eb"))[$arrow.bl$] \
              #rect(stroke: 1pt + rgb("#059669"), fill: rgb("#ecfdf5"), inset: 4pt)[#text(size: 7.5pt, weight: "bold", fill: rgb("#065f46"))[JohnCalls ($J$)]]
            ],
            [
              #text(size: 10pt, fill: rgb("#2563eb"))[$arrow.br$] \
              #rect(stroke: 1pt + rgb("#059669"), fill: rgb("#ecfdf5"), inset: 4pt)[#text(size: 7.5pt, weight: "bold", fill: rgb("#065f46"))[MaryCalls ($M$)]]
            ]
          )
        ],
        [
          #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 6pt, radius: 3pt)[
            #text(weight: "bold", fill: rgb("#1e3a8a"))[Earthquake ($E$)] \
            #text(size: 7.5pt, fill: rgb("#475569"))[$P(E) = 0.002$]
          ]
          #v(4pt)
          #text(size: 11pt, fill: rgb("#2563eb"))[$arrow.bl$]
          #v(16pt)
          #align(left)[
            #text(size: 8pt, fill: rgb("#334155"))[
              *Full Joint Factorization:*\
              $P(B, E, A, J, M) = P(B) P(E) P(A|B, E) P(J|A) P(M|A)$\
              *Markov Blanket:* Parents, children, and parents of children.
            ]
          ]
        ]
      )
    ]
  ]
)

1. *Topological Semantics & Joint Probability Factorization:*
   - Each node represents a random variable $X_i$.
   - Each directed edge $X_i -> X_j$ represents direct causal influence ($X_i$ is a parent of $X_j$).
   - Each node contains a *Conditional Probability Table (CPT)* specifying $P(X_i mid(|) text("Parents")(X_i))$.
   - *Chain Rule of Bayesian Networks:* The complete joint probability distribution over all $n$ variables factors into the product of local conditional distributions:
     $ P(X_1, X_2, ..., X_n) = product_(i=1)^n P(X_i mid(|) text("Parents")(X_i)) $
2. *Conditional Independence & The Markov Blanket:*
   - A node $X$ is conditionally independent of all non-descendants given its parents.
   - *Markov Blanket:* Consists of a node's *parents*, *children*, and *children's other parents*. A node is conditionally independent of all other nodes in the entire network given its Markov Blanket.

== Approximate Inference via Stochastic Sampling Algorithms
Exact inference in general Bayesian networks is NP-hard. Approximate inference uses Monte Carlo stochastic simulation to generate empirical samples from the joint distribution.

#table(
  columns: (1.2fr, 2.2fr, 2.3fr, 2.3fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.even(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Sampling Method]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Generation Mechanism]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Key Advantages]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Primary Limitations]*]
  ),
  [*Prior Sampling*], [Samples variables in topological order according to prior/conditional CPTs.], [Simple, fast, generates unconditional distribution.], [Cannot condition on observed evidence without filtering.],
  [*Rejection Sampling*], [Generates prior samples; rejects any sample inconsistent with evidence $bold(e)$.], [Produces exact posterior distribution $P(X mid(|) bold(e))$.], [Fraction of accepted samples drops exponentially with evidence size.],
  [*Likelihood Weighting*], [Fixes evidence variables to observed values; weights each sample by likelihood $w = product P(e_i | text("Parents"))$.], [Zero wasted samples; all generated samples are retained.], [Weight collapse occurs if evidence variables occur late in graph.],
  [*Gibbs Sampling (MCMC)*], [Markov Chain Monte Carlo: iteratively resamples non-evidence variables conditioned on their Markov Blankets.], [Scalable to large networks with numerous evidence variables.], [Samples are temporally correlated; requires initial burn-in period.]
)

== Markov Models & Hidden Markov Models (HMM)
A Markov Model represents dynamic systems where state changes over discrete time steps $t$.

#figure-box(
  "Figure 5.4: Hidden Markov Model (HMM) Architecture (Latent States and Observed Emissions)",
  [
    #rect(stroke: 0.5pt + rgb("#94a3b8"), fill: rgb("#ffffff"), inset: 8pt, radius: 3pt)[
      #grid(
        columns: (1fr, auto, 1fr, auto, 1fr),
        align: horizon + center,
        [
          #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 5pt, radius: 3pt)[
            #text(weight: "bold", fill: rgb("#1e3a8a"))[Hidden State $S_(t-1)$]
          ] \
          #v(2pt)
          #text(size: 11pt, fill: rgb("#059669"))[$arrow.b$ Emission] \
          #rect(stroke: 1pt + rgb("#059669"), fill: rgb("#ecfdf5"), inset: 4pt)[#text(size: 8pt, weight: "bold", fill: rgb("#065f46"))[Obs $O_(t-1)$]]
        ],
        [#text(size: 14pt, fill: rgb("#2563eb"))[$arrow.r$\ $A$]],
        [
          #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 5pt, radius: 3pt)[
            #text(weight: "bold", fill: rgb("#1e3a8a"))[Hidden State $S_t$]
          ] \
          #v(2pt)
          #text(size: 11pt, fill: rgb("#059669"))[$arrow.b$ Emission] \
          #rect(stroke: 1pt + rgb("#059669"), fill: rgb("#ecfdf5"), inset: 4pt)[#text(size: 8pt, weight: "bold", fill: rgb("#065f46"))[Obs $O_t$]]
        ],
        [#text(size: 14pt, fill: rgb("#2563eb"))[$arrow.r$\ $A$]],
        [
          #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 5pt, radius: 3pt)[
            #text(weight: "bold", fill: rgb("#1e3a8a"))[Hidden State $S_(t+1)$]
          ] \
          #v(2pt)
          #text(size: 11pt, fill: rgb("#059669"))[$arrow.b$ Emission] \
          #rect(stroke: 1pt + rgb("#059669"), fill: rgb("#ecfdf5"), inset: 4pt)[#text(size: 8pt, weight: "bold", fill: rgb("#065f46"))[Obs $O_(t+1)$]]
        ]
      )
    ]
  ]
)

1. *First-Order Markov Property & Stationary Assumption:*
   - *Markov Assumption:* Future state depends solely on the immediate current state:
     $ P(S_(t+1) mid(|) S_t, S_(t-1), ..., S_1) = P(S_(t+1) mid(|) S_t) $
   - *Stationary Transition Probabilities:* $P(S_(t+1) = j mid(|) S_t = i) = A_(i j)$ is constant over time.
2. *Hidden Markov Model (HMM) Formal Definition:*
   An HMM is a bivariate stochastic process where the underlying state sequence $S_1, S_2, ...$ is hidden (latent), but emits observable tokens $O_1, O_2, ...$:
   - *Hidden State Space:* $S = {s_1, s_2, ..., s_N}$.
   - *Observation Vocabulary:* $V = {v_1, v_2, ..., v_M}$.
   - *State Transition Probability Matrix ($bold(A)$):* $A_(i j) = P(S_(t+1) = s_j mid(|) S_t = s_i)$.
   - *Observation Emission Probability Matrix ($bold(B)$):* $B_(j k) = P(O_t = v_k mid(|) S_t = s_j)$.
   - *Initial State Probability Distribution ($bold(pi)$):* $pi_i = P(S_1 = s_i)$.
   - Full HMM Model Parameter Set: $lambda = (bold(A), bold(B), bold(pi))$.
3. *The Three Fundamental Canonical Problems of HMM:*
   - *Problem 1 (Evaluation / Likelihood):* Given model $lambda$ and observation sequence $O = (O_1, ..., O_T)$, compute probability $P(O mid(|) lambda)$. Solved via the *Forward-Backward Algorithm* ($cal(O)(N^2 T)$).
   - *Problem 2 (Decoding):* Given model $lambda$ and observations $O$, find the single most likely hidden state sequence $S^* = (S_1^*, ..., S_T^*)$. Solved dynamically via the *Viterbi Algorithm* ($cal(O)(N^2 T)$).
   - *Problem 3 (Learning / Parameter Estimation):* Given observation sequences $O$, adjust parameters $lambda = (bold(A), bold(B), bold(pi))$ to maximize $P(O mid(|) lambda)$. Solved via the *Baum-Welch Algorithm (Expectation-Maximization - EM)*.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=445")[Source: Russell & Norvig, Ch 13-14, p. 432-515] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/chapman-hall_crc-machine-learning-pattern-recognition-stephen-marsland-machine-learning_-an-algorithmic-perspective-second-edition-2014-chapman-and-hall_crc.pdf#page=330")[Source: Marsland, Ch 16, p. 322-350] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/M2-Machine_Learning_By_Ethem_Alpaydin_.pdf#page=380")[Source: Alpaydin, Ch 14-15, p. 341-395]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 3
// ==========================================
= Constraint Satisfaction Problems & Evolutionary Search

== Formal Definition of Constraint Satisfaction Problems (CSP)
A Constraint Satisfaction Problem represents a problem state not as an opaque black-box, but as a structured set of variables with discrete constraint relationships.

#figure-box(
  "Figure 5.5: Map Coloring Constraint Satisfaction Graph and Constraint Propagation",
  [
    #rect(stroke: 0.5pt + rgb("#94a3b8"), fill: rgb("#ffffff"), inset: 8pt, radius: 3pt)[
      #grid(
        columns: (1.2fr, 1.8fr),
        gutter: 14pt,
        align: horizon + center,
        [
          #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 6pt, radius: 3pt)[
            #text(weight: "bold", fill: rgb("#1e3a8a"))[Variables ($V$): Regions]\
            ${"WA", "NT", "SA", "Q", "NSW", "V", "T"}$\
            #v(2pt)
            #text(weight: "bold", fill: rgb("#059669"))[Domain ($D$): Colors]\
            ${"Red", "Green", "Blue"}$
          ]
        ],
        [
          #rect(stroke: 1pt + rgb("#b91c1c"), fill: rgb("#fef2f2"), inset: 6pt, radius: 3pt)[
            #text(weight: "bold", fill: rgb("#991b1b"))[Constraints ($C$): Adjacency]\
            $forall (X_i, X_j) text(" adjacent"), text("Color")(X_i) != text("Color")(X_j)$\
            #v(2pt)
            #text(size: 8pt, fill: rgb("#334155"))[Constraint Graph: Nodes are variables, edges represent inequality constraints.]
          ]
        ]
      )
    ]
  ]
)

1. *Formal Triplet Definition:* A CSP is defined as a tuple $chevron.l V, D, C chevron.r$:
   - *Variables ($V$):* Set of $n$ variables $V = {X_1, X_2, ..., X_n}$.
   - *Domains ($D$):* Set of domains $D = {D_1, D_2, ..., D_n}$, where each $D_i$ lists allowed values for $X_i$.
   - *Constraints ($C$):* Set of constraint relations $C = {C_1, C_2, ..., C_m}$, where each $C_i = chevron.l "scope", "relation" chevron.r$.
2. *Classic CSP Applications:*
   - *Map Coloring:* Color geographic territories using $k$ colors such that no adjacent regions share the same color.
   - *Cryptarithmetic Puzzles:* Assign unique digits $\{0, ..., 9\}$ to letters (e.g., $text("SEND") + text("MORE") = text("MONEY")$).
   - *$N$-Queens Problem:* Place $N$ non-attacking queens on an $N times N$ chessboard.

== Constraint Propagation & The AC-3 Arc Consistency Algorithm
Constraint propagation interleaves domain reduction with search, pruning illegal domain values before branching.

1. *Arc Consistency (2-Consistency):*
   A directed arc $(X_i, X_j)$ is *arc-consistent* if for every value $x in D_i$, there exists some value $y in D_j$ that satisfies the binary constraint between $X_i$ and $X_j$.
2. *The AC-3 Algorithm:*
   - Initialize queue $Q$ with all directed arcs in the CSP graph.
   - While $Q$ is non-empty:
     - Pop arc $(X_i, X_j)$ from $Q$.
     - If `Remove-Inconsistent-Values`($X_i, X_j$) removes any value from $D_i$:
       - If $D_i$ becomes empty, return *Failure* (no solution exists).
       - Insert all neighbor arcs $(X_k, X_i)$ where $X_k != X_j$ back into $Q$.
   - Time complexity: $cal(O)(c d^3)$ where $c$ is number of binary constraints and $d$ is maximum domain size.

== Backtracking Search Heuristics
Backtracking Search is depth-first search that chooses values for one variable at a time and backtracks when a variable has no legal values.

1. *Minimum Remaining Values (MRV / "Fail-First" Heuristic):*
   - Choose the variable with the fewest legal values remaining in its domain.
2. *Degree Heuristic:*
   - Tie-breaker for MRV: Choose the variable with the most constraints on remaining unassigned variables.
3. *Least Constraining Value (LCV / "Fail-Last" Heuristic):*
   - Given a variable, choose the value that rules out the fewest choices for neighboring variables in the constraint graph.
4. *Forward Checking:* Whenever variable $X$ is assigned, delete all inconsistent values from the domains of neighboring unassigned variables.

== Branch and Bound Algorithm & 0/1 Knapsack Problem
Branch and Bound is an exact combinatorial optimization paradigm that prunes state-space subtrees whose optimistic upper bounds are lower than the best known feasible solution.

1. *Algorithm Mechanics:*
   - Maintain global best lower bound ($text("LB")$) on the optimal solution.
   - Expand active node $u$; calculate upper bound $text("UB"(u))$ using greedy continuous relaxation.
   - If $text("UB"(u)) <= text("LB")$, *prune node $u$ immediately* (it cannot contain a better solution).
2. *Application to 0/1 Knapsack Problem:*
   - Sort items in descending order of profit-to-weight ratio $p_i / w_i$.
   - Construct binary state tree (Include item $i$ vs. Exclude item $i$).
   - Compute upper bound at node $u$ using Fractional Knapsack relaxation:
     $ text("UB") = text("current\_profit") + sum_(i text(" fit")) p_i + (W_"remaining") dot (p_(k+1) / w_(k+1)) $

== Genetic Algorithms (Evolutionary Optimization)
Genetic Algorithms are stochastic global search meta-heuristics inspired by Darwinian natural selection.

1. *Chromosome Encoding:* Candidate solutions represented as bitstrings, permutations, or real-valued vectors.
2. *Fitness Function:* Quantitative metric assessing survival quality of individual chromosome.
3. *Genetic Operators:*
   - *Selection:* Chooses parent individuals biased by fitness (*Roulette Wheel Selection* $P_i = f_i / sum f_j$, *Tournament Selection*).
   - *Crossover (Recombination):* Exchanges genetic substrings between parent pairs at single or multiple crossover points.
   - *Mutation:* Randomly flips bits with small probability $p_m approx 0.01$ to maintain population diversity and prevent premature convergence.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=170")[Source: Russell & Norvig, Ch 5, p. 161-190] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/chapman-hall_crc-machine-learning-pattern-recognition-stephen-marsland-machine-learning_-an-algorithmic-perspective-second-edition-2014-chapman-and-hall_crc.pdf#page=215")[Source: Marsland, Ch 10, p. 209-225]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 4
// ==========================================
= Advanced AI: Fuzzy Logic, NLP Pipeline & Modern Transformers

== Fuzzy Logic Systems
Fuzzy Logic extends classical Boolean logic to accommodate partial truth values between $0$ (completely false) and $1$ (completely true), modeling real-world linguistic vagueness.

#table(
  columns: (1.3fr, 2.8fr, 2.8fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.even(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Classical (Crisp) Sets]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Fuzzy Sets]*]
  ),
  [*Membership Valuation*], [Binary strict: $mu_A(x) in {0, 1}$ (Member or Non-member).], [Continuous continuum: $mu_A(x) in [0, 1]$ (Degree of truth).],
  [*Boundary Nature*], [Crisp, sharp, unambiguous step threshold.], [Gradual, smooth, overlapping transitions.],
  [*Core Operators*], [Boolean Algebra (AND, OR, NOT).], [Zadeh Operators ($min, max, 1 - mu_A$).],
  [*Excluded Middle Law*], [Holds strictly ($A union overline(A) = U, A inter overline(A) = emptyset$).], [Violated ($A union overline(A) != U, A inter overline(A) != emptyset$).]
)

1. *Fuzzy Set Operations (Zadeh Triplet):*
   - *Fuzzy Union ($A union B$):* $mu_(A union B)(x) = max(mu_A(x), mu_B(x))$
   - *Fuzzy Intersection ($A inter B$):* $mu_(A inter B)(x) = min(mu_A(x), mu_B(x))$
   - *Fuzzy Complement ($overline(A)$):* $mu_(overline(A))(x) = 1 - mu_A(x)$
2. *Fuzzy Inference System (FIS - Mamdani Architecture):*
   - *Fuzzification:* Transforms crisp numeric input into fuzzy linguistic membership degrees.
   - *Rule Base:* Collection of IF-THEN linguistic rules (e.g., *IF* Temperature is High *AND* Humidity is High *THEN* Fan Speed is Fast).
   - *Aggregation:* Combines output fuzzy sets across all active rules using max operator.
   - *Defuzzification (Centroid Method):* Converts aggregate fuzzy area into crisp control output:
     $ z^* = (integral z dot mu_C(z) dif z) / (integral mu_C(z) dif z) quad "or" quad z^* = (sum z_i dot mu_C(z_i)) / (sum mu_C(z_i)) $

== Natural Language Processing (NLP) Pipeline & Text Embeddings
NLP bridges human natural linguistic communication and machine mathematical processing through multi-stage computational pipelines:

1. *Preprocessing Pipeline:*
   - *Tokenization:* Segmenting raw text corpus into discrete lexical tokens (words or subwords via Byte-Pair Encoding - BPE).
   - *Normalization:* Case folding, punctuation removal, and stop-word filtering (removing non-informative words like *is, the, at*).
   - *Stemming vs. Lemmatization:*
     - *Stemming:* Crude heuristic rule-based suffix stripping (Porter Stemmer; converts *running* $\to$ *run*, *studies* $\to$ *studi*).
     - *Lemmatization:* Full morphological vocabulary analysis using WordNet to reduce word to its valid base dictionary lemma (*better* $\to$ *good*).
2. *Vectorization & Embeddings:*
   - *Term Frequency-Inverse Document Frequency (TF-IDF):*
     $ text("TF-IDF")(t, d, D) = text("TF")(t, d) dot ln(N / (|{d in D mid(|) t in d}|)) $
     - Balances local term occurrence frequency against corpus-wide inverse rarity.
   - *Dense Word Embeddings (Word2Vec / GloVe):* Maps semantic words into dense, continuous vector spaces $bb(R)^d$ ($d approx 300$) where cosine distance captures semantic similarity and linear arithmetic encodes relations ($bold(v)_"King" - bold(v)_"Man" + bold(v)_"Woman" approx bold(v)_"Queen"$).

== Large Language Models (LLMs) & Transformer Foundations

#figure-box(
  "Figure 5.6: Transformer Self-Attention Architecture and Scaled Dot-Product Flow",
  [
    #rect(stroke: 0.5pt + rgb("#94a3b8"), fill: rgb("#ffffff"), inset: 8pt, radius: 3pt)[
      #grid(
        columns: (1.2fr, 1.8fr),
        gutter: 14pt,
        align: horizon + center,
        [
          #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 6pt, radius: 3pt)[
            #text(weight: "bold", fill: rgb("#1e3a8a"))[Input Vectors]\
            Query ($bold(Q)$), Key ($bold(K)$), Value ($bold(V)$)\
            #v(2pt)
            #text(size: 8pt, fill: rgb("#334155"))[Linear Projections from Embeddings]
          ]
        ],
        [
          #rect(stroke: 1pt + rgb("#059669"), fill: rgb("#ecfdf5"), inset: 6pt, radius: 3pt)[
            #text(weight: "bold", fill: rgb("#065f46"))[Scaled Dot-Product Self-Attention]\
            $text("Attention")(bold(Q), bold(K), bold(V)) = text("softmax")((bold(Q) bold(K)^T) / sqrt(d_k)) bold(V)$\
            #v(2pt)
            #text(size: 7.5pt, fill: rgb("#334155"))[Captures long-range dependencies in $cal(O)(1)$ sequential steps.]
          ]
        ]
      )
    ]
  ]
)

1. *The Self-Attention Mechanism (Vaswani et al., 2017):*
   Computes dynamic contextual relevance between every pair of tokens in a sequence simultaneously:
   $ text("Attention")(bold(Q), bold(K), bold(V)) = text("softmax")((bold(Q) bold(K)^T) / sqrt(d_k)) bold(V) $
   - $bold(Q) in bb(R)^(n times d_k)$ (Query Matrix), $bold(K) in bb(R)^(n times d_k)$ (Key Matrix), $bold(V) in bb(R)^(n times d_v)$ (Value Matrix).
   - Scaling factor $1 / sqrt(d_k)$ prevents dot-product values from exploding into vanishing softmax gradient regions.
2. *Multi-Head Attention:* Runs $h$ self-attention mechanisms in parallel across projected sub-spaces, allowing the model to jointly attend to information from different representation aspects.
3. *Tokens vs. Model Parameters in Modern LLMs:*
   - *Tokens:* Basic atomic units of text processed by LLM subword tokenizers ($1000 text(" words") approx 1333 text(" tokens")$).
   - *Parameters:* Learnable synaptic weights in the transformer matrices. For instance, *LLaMA-3 8B* contains 8 billion parameters, while *LLaMA-3 70B* incorporates 70 billion parameters, requiring higher compute and quantization for inference.
   - *Fine-Tuning vs. Retrieval-Augmented Generation (RAG):* Fine-tuning updates internal model parameter weights; RAG dynamically retrieves authoritative external vector context into the prompt window without modifying weights.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=835")[Source: Russell & Norvig, Ch 21-23, p. 770-865] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/chapman-hall_crc-machine-learning-pattern-recognition-stephen-marsland-machine-learning_-an-algorithmic-perspective-second-edition-2014-chapman-and-hall_crc.pdf#page=105")[Source: Marsland, Ch 4, p. 71-105]
