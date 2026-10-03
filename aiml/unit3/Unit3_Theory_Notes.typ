// Typst Theory Notes - Artificial Intelligence & Machine Learning (Unit 3)
// Course Code: PCC-302-IT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[ARTIFICIAL INTELLIGENCE & ML — UNIT 3]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[ML Foundations & Supervised Learning]]
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 3: MACHINE LEARNING FOUNDATIONS & SUPERVISED LEARNING]
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
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 3 based on SPPU end-semester examination trends.

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
  [*ML Foundations & Paradigms*], [Mitchell's T-P-E framework, Supervised vs Unsupervised vs Semi-supervised vs RL, Scales of feature measurement, Hypothesis space, Version space, Inductive bias, VC-Dimension.], [High Priority \ (6-8 Marks Qs)],
  [*Linear & Multiple Regression*], [Hypothesis formulation, Ordinary Least Squares (OLS) Normal Equations, Batch/Stochastic Gradient Descent, Mean Squared Error cost function.], [High Priority \ (7-9 Marks Qs)],
  [*Regularization & Logistic Regression*], [Overfitting vs Underfitting, L2 Ridge vs L1 Lasso penalties, Logistic sigmoid function, Odds ratio, Logit, Cross-entropy loss, Multiclass (OvR, OvO).], [High Priority \ (8-10 Marks Qs)],
  [*k-Nearest Neighbors (k-NN)*], [Instance-based lazy learning, Distance metrics (Euclidean, Manhattan, Minkowski, Cosine), Choice of $k$, Weighted k-NN, Regression with k-NN.], [Medium-High Priority \ (6-8 Marks Qs)],
  [*Naive Bayes Classifier*], [Bayes' Theorem, Conditional independence assumption, Maximum A Posteriori (MAP), Prior/Likelihood/Posterior, Laplace Smoothing, NB variants.], [High Priority \ (6-8 Marks Qs)],
  [*Decision Tree Learning*], [Tree anatomy (Root, Internal, Leaf), ID3 Information Gain & Entropy, CART Gini Impurity, C4.5 Gain Ratio, Pre-pruning vs Post-pruning, Missing values.], [High Priority \ (8-12 Marks Qs)],
  [*Support Vector Machines (SVM)*], [Maximum margin hyperplanes, Support vectors, Hard vs Soft margin, Slack variables $xi_i$, Regularization $C$, Kernel Trick (Polynomial, RBF, Sigmoid).], [High Priority \ (8-10 Marks Qs)],
  [*Model Evaluation & Validation*], [Confusion Matrix (TP, TN, FP, FN), Precision, Recall, F1-Score, Specificity, ROC-AUC, Bias-Variance decomposition, K-Fold, LOOCV, Stratified CV.], [High Priority \ (8-10 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Machine Learning Foundations & Learning Paradigms

== Formal Definitions of Machine Learning
Machine Learning (ML) is a core subfield of Artificial Intelligence focused on developing computational algorithms that iteratively improve their task execution performance through automated statistical inference and experiential data, without requiring explicit rule-based hardcoding.

1. *Arthur Samuel's Definition (1959):* Field of study that gives computers the ability to learn without being explicitly programmed.
2. *Tom Mitchell's Operational Definition (1997):* A computer program is said to learn from experience $E$ with respect to some class of tasks $T$ and performance measure $P$, if its performance at tasks in $T$, as measured by $P$, improves with experience $E$.
   - *Task ($T$):* The specific operational objective to be accomplished (e.g., classifying whether an incoming email is spam or ham, predicting real-estate prices, medical diagnosis).
   - *Experience ($E$):* The historical training dataset or interaction log supplied to the algorithm (e.g., a collection of 50,000 labeled email messages).
   - *Performance Measure ($P$):* The quantitative metric used to assess the effectiveness of the learned model (e.g., classification accuracy, precision, mean squared error).

#figure-box(
  "Figure 3.1: Supervised Machine Learning Workflow and Generalization Pipeline",
  [
    #rect(stroke: 0.5pt + rgb("#94a3b8"), fill: rgb("#ffffff"), inset: 7pt, radius: 3pt)[
      #grid(
        columns: (1fr, auto, 1fr, auto, 1fr),
        align: horizon + center,
        [#text(weight: "bold", fill: rgb("#1e3a8a"))[Training Data]\ $(x_1, y_1), ..., (x_n, y_n)$],
        [#text(size: 14pt, fill: rgb("#2563eb"))[$arrow.r$]],
        [#text(weight: "bold", fill: rgb("#1e3a8a"))[Learning Algorithm]\ (Inductive Inference)],
        [#text(size: 14pt, fill: rgb("#2563eb"))[$arrow.r$]],
        [#text(weight: "bold", fill: rgb("#1e3a8a"))[Hypothesis Model]\ $h_theta(x) approx y$]
      )
    ]
    #v(4pt)
    #rect(stroke: 0.5pt + rgb("#94a3b8"), fill: rgb("#ffffff"), inset: 7pt, radius: 3pt)[
      #grid(
        columns: (1fr, auto, 1fr, auto, 1fr),
        align: horizon + center,
        [#text(weight: "bold", fill: rgb("#059669"))[Unseen Test Query]\ $x_"test"$],
        [#text(size: 14pt, fill: rgb("#059669"))[$arrow.r$]],
        [#text(weight: "bold", fill: rgb("#059669"))[Trained Model]\ $h(x_"test")$],
        [#text(size: 14pt, fill: rgb("#059669"))[$arrow.r$]],
        [#text(weight: "bold", fill: rgb("#059669"))[Predicted Output]\ $hat(y)_"test"$]
      )
    ]
  ]
)

== Comprehensive Taxonomy of Learning Paradigms
Machine learning systems are broadly categorized into four foundational learning paradigms based on the presence, nature, and feedback mechanism of supervision signals.

#table(
  columns: (1.2fr, 2fr, 2fr, 2fr, 2fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.even(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Supervised Learning]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Unsupervised Learning]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Semi-Supervised Learning]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Reinforcement Learning]*]
  ),
  [*Training Input*], [Fully labeled pairs $(x_i, y_i)$.], [Unlabeled features $x_i$ only.], [Small labeled set + large unlabeled set.], [State inputs from dynamic environment.],
  [*Primary Goal*], [Map inputs to known target outputs $f: X -> Y$.], [Discover intrinsic patterns, clusters, density.], [Leverage unlabeled data to boost boundary accuracy.], [Maximize cumulative scalar reward signal over time.],
  [*Feedback Type*], [Direct, instantaneous error signal per sample.], [No explicit feedback or external supervisor.], [Direct feedback on small labeled subset only.], [Delayed, evaluative scalar reward/penalty ($r_t$).],
  [*Core Tasks*], [Classification (discrete) & Regression (continuous).], [Clustering, Dimensionality Reduction, Association.], [Transductive learning, active learning pseudo-labeling.], [Control policies, game playing, robotic navigation.],
  [*Standard Algorithms*], [Linear Regression, Logistic, k-NN, Decision Trees, SVM.], [k-Means, Hierarchical, PCA, Apriori, GMM.], [Self-training, Label Propagation, Co-training.], [Q-Learning, SARSA, Deep Q-Networks (DQN), PPO.]
)

== Fundamental Concepts: Hypothesis Space, Version Space & Inductive Bias

1. *Hypothesis Space ($cal(H)$):* The set of all possible candidate functions or models $h in cal(H)$ that the learning algorithm can entertain to approximate the unknown true target function $c: X -> Y$.
2. *Target Concept ($c$):* The underlying true mapping $c(x)$ that generated the ground-truth labels in the domain.
3. *Consistent Hypothesis:* A hypothesis $h$ is consistent with a set of training examples $D$ if and only if $h(x) = c(x) = y$ for every sample $(x, y) in D$.
4. *Version Space ($V S_(cal(H), D)$):* The subset of all hypotheses in $cal(H)$ that are completely consistent with all training instances in dataset $D$:
   $ V S_(cal(H), D) = { h in cal(H) mid(|) forall (x, y) in D, h(x) = y } $
5. *Inductive Bias:* The set of explicit prior assumptions and preferences that a learner incorporates beyond the raw training data to generalize to previously unseen instances. Without inductive bias, a learner cannot extrapolate beyond observed samples (Futility of Bias-Free Learning).
   - *Restriction Bias (Language Bias):* Constraining the hypothesis space to a specific mathematical family (e.g., linear hyperplanes in Linear Regression/SVM).
   - *Preference Bias (Search Bias):* Preferring certain hypotheses over others within an unrestricted space (e.g., Occam's Razor in Decision Trees: preferring smaller trees with higher Information Gain).
6. *Vapnik-Chervonenkis (VC) Dimension:* A fundamental measure of the capacity or expressive richness of a space of hypotheses $cal(H)$. The VC dimension $"VC"(cal(H))$ is the maximum number of points $d$ that can be *shattered* (separated into all possible $2^d$ binary label assignments) by $cal(H)$.
   - For linear classifiers in $d$-dimensional Euclidean space $bb(R)^d$, $"VC"(cal(H)) = d + 1$.
   - VC dimension provides theoretical distribution-free bounds on the sample complexity needed for Probably Approximately Correct (PAC) generalization.

== Scales of Feature Measurement in Machine Learning
In machine learning feature engineering, variables are classified into four hierarchical measurement scales (Stevens' Taxonomy), which dictate admissible mathematical transformations:

#table(
  columns: (1.2fr, 1.8fr, 1.8fr, 2.2fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.even(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Scale]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Mathematical Properties]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Admissible Operations]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[ML Example & Encoding]*]
  ),
  [*Nominal*], [Categorical, discrete labels; identity only, no natural ordering.], [Equality ($=$ or $!=$, Mode). No arithmetic operations.], [Blood type (A, B, AB, O), City name. Encoded via One-Hot Encoding.],
  [*Ordinal*], [Ranked categories; ordered sequence with undefined interval distance.], [Comparison ($<$, $>$, Median, Percentiles). No addition.], [Education level (High School, BS, MS, PhD), Customer rating (1-5 stars). Encoded via Ordinal Encoding.],
  [*Interval*], [Quantitative numeric; meaningful partialerences, arbitrary/shifted zero.], [Addition and subtraction ($+$, $-$, Mean, Variance). No ratio multiplication.], [Temperature in Celsius/Fahrenheit, Calendar dates. Standard scaling applicable.],
  [*Ratio*], [Quantitative numeric; meaningful partialerences and true absolute zero.], [All arithmetic operations ($+$, $-$, $*$, $div$, Geometric Mean).], [Salary, Distance, Weight, Age, Revenue. Normalized via Min-Max or Standard scaling.]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/M2-Machine_Learning_By_Ethem_Alpaydin_.pdf#page=23")[Source: Alpaydin, Ch 1-2, p. 1-38] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/chapman-hall_crc-machine-learning-pattern-recognition-stephen-marsland-machine-learning_-an-algorithmic-perspective-second-edition-2014-chapman-and-hall_crc.pdf#page=22")[Source: Marsland, Ch 1-2, p. 1-25] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=685")[Source: Russell & Norvig, Ch 19, p. 671-693]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 2
// ==========================================
= Regression Models: Linear, Multivariate, Regularization & Logistic

== Simple Linear Regression
Simple Linear Regression models the linear functional relationship between a single independent scalar explanatory variable $x$ and a dependent continuous target response $y$.

1. *Hypothesis Formulation:*
   $ h_theta(x) = theta_0 + theta_1 x $
   where $theta_0$ is the intercept term (bias) and $theta_1$ is the slope coefficient (weight).
2. *Mean Squared Error (MSE) Cost Function:* The parameters are estimated by minimizing the residual sum of squared partialerences over $m$ training samples:
   $ J(theta_0, theta_1) = 1 / (2m) sum_(i=1)^m (h_theta(x^((i))) - y^((i)))^2 $
3. *Ordinary Least Squares (OLS) Closed-Form Normal Equations:*
   Setting partial derivatives $partial J / (partial theta_0) = 0$ and $partial J / (partial theta_1) = 0$ yields:
   $ theta_1 = (sum_(i=1)^m (x^((i)) - bar(x))(y^((i)) - bar(y))) / (sum_(i=1)^m (x^((i)) - bar(x))^2) = ("Cov"(x, y)) / ("Var"(x)) $
   $ theta_0 = bar(y) - theta_1 bar(x) $
4. *Gradient Descent Optimization Algorithm:* An iterative first-order optimization algorithm that updates parameters in the direction of steepest descent:
   $ theta_j := theta_j - alpha frac(partial, partial theta_j) J(theta_0, theta_1) = theta_j - alpha frac(1, m) sum_(i=1)^m (h_theta(x^((i))) - y^((i))) x_j^((i)) $
   where $alpha > 0$ is the *learning rate*. If $alpha$ is too small, convergence is slow; if $alpha$ is too large, gradient descent can overshoot the minimum and diverge.

== Multiple Linear Regression (Multivariate Model)
Multiple Linear Regression generalizes simple regression to $d$ explanatory input features $bold(x) = [x_1, x_2, ..., x_d]^T in bb(R)^d$:

1. *Vectorized Model Representation:*
   $ h_bold(theta)(bold(x)) = theta_0 + theta_1 x_1 + theta_2 x_2 + ... + theta_d x_d = bold(theta)^T bold(x) $
   where $bold(x) = [1, x_1, x_2, ..., x_d]^T$ (with dummy intercept feature $x_0 = 1$) and $bold(theta) = [theta_0, theta_1, ..., theta_d]^T$.
2. *Matrix-Vector Formulation:* For dataset of $m$ instances with design matrix $bold(X) in bb(R)^(m times (d+1))$ and target vector $bold(y) in bb(R)^m$:
   $ bold(X) = mat(1, x_11, ..., x_(1d); 1, x_21, ..., x_(2d); dots.v, dots.v, dots.down, dots.v; 1, x_(m 1), ..., x_(m d)), quad bold(y) = mat(y_1; y_2; dots.v; y_m), quad bold(theta) = mat(theta_0; theta_1; dots.v; theta_d) $
3. *Closed-Form Normal Equation Solution:*
   $ bold(theta) = (bold(X)^T bold(X))^(-1) bold(X)^T bold(y) $
   - Requires $(bold(X)^T bold(X))$ to be non-singular (invertible). Invertibility fails if features are linearly dependent (multicollinearity) or if $d > m$.
   - Computational complexity of matrix inversion is $cal(O)(d^3)$, making Gradient Descent preferred when $d > 10^4$.

== Regularization in Regression: Ridge vs. Lasso
When training models on high-dimensional data, unconstrained OLS often suffers from high variance (overfitting) and numerical instability. *Regularization* introduces a penalty term to the loss function to constrain coefficient magnitudes.

#figure-box(
  "Figure 3.2: Geometric Contours of L2 (Ridge) vs L1 (Lasso) Regularization",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 14pt,
      align: center,
      [
        #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 8pt, radius: 4pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"))[Ridge ($L_2$) Penalty: Spherical Constraint]\
          $sum theta_j^2 <= t$\
          #v(2pt)
          #text(size: 8.5pt, fill: rgb("#334155"))[Contour is smooth circle. Pulls weights towards zero asymptotically, but never exactly zero.]
        ]
      ],
      [
        #rect(stroke: 1pt + rgb("#b91c1c"), fill: rgb("#fef2f2"), inset: 8pt, radius: 4pt)[
          #text(weight: "bold", fill: rgb("#991b1b"))[Lasso ($L_1$) Penalty: Diamond Constraint]\
          $sum |theta_j| <= t$\
          #v(2pt)
          #text(size: 8.5pt, fill: rgb("#334155"))[Contour has sharp corners on axes. Drives non-informative coefficients strictly to 0 (Sparse Feature Selection).]
        ]
      ]
    )
  ]
)

1. *Ridge Regression ($L_2$ Regularization / Tikhonov):*
   $ J_"Ridge"(bold(theta)) = 1 / (2m) sum_(i=1)^m (h_bold(theta)(bold(x)^((i))) - y^((i)))^2 + lambda sum_(j=1)^d theta_j^2 = "MSE" + lambda ||bold(theta)||_2^2 $
   - Analytical solution: $bold(theta) = (bold(X)^T bold(X) + lambda bold(I))^(-1) bold(X)^T bold(y)$ (always invertible for $lambda > 0$).
   - Shrinks collinear coefficients proportionally, mitigating multicollinearity.
2. *Lasso Regression ($L_1$ Regularization - Least Absolute Shrinkage and Selection Operator):*
   $ J_"Lasso"(bold(theta)) = 1 / (2m) sum_(i=1)^m (h_bold(theta)(bold(x)^((i))) - y^((i)))^2 + lambda sum_(j=1)^d |theta_j| = "MSE" + lambda ||bold(theta)||_1 $
   - Generates sparse models by zeroing out non-essential coefficients, acting as automated embedded feature selection.

#table(
  columns: (1.3fr, 1.9fr, 1.9fr, 1.9fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.even(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Ordinary Least Squares]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Ridge Regression ($L_2$)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lasso Regression ($L_1$)]*]
  ),
  [*Penalty Term*], [None ($lambda = 0$).], [$lambda sum_(j=1)^d theta_j^2$ (Squared Euclidean norm).], [$lambda sum_(j=1)^d |theta_j|$ (Manhattan norm).],
  [*Weight Shrinkage*], [Unbounded, prone to exploding on collinear data.], [Shrinks weights close to zero, never strictly zero.], [Shrinks weights strictly to zero (exact sparsity).],
  [*Feature Selection*], [No (retains all features).], [No (retains all features with reduced weights).], [Yes (acts as automatic feature selection).],
  [*Closed-Form Solution*], [$bold(theta) = (bold(X)^T bold(X))^(-1) bold(X)^T bold(y)$], [$bold(theta) = (bold(X)^T bold(X) + lambda bold(I))^(-1) bold(X)^T bold(y)$], [No analytical form; solved via coordinate descent.],
  [*Primary Use Case*], [Low dimensional data ($m >> d$) with no collinearity.], [Data with severe multicollinearity and dense weights.], [High-dimensional data where only few features matter.]
)

== Logistic Regression for Binary Classification
Despite its name, Logistic Regression is a fundamental linear model for *binary classification* that models the conditional probability $P(Y=1 mid(|) bold(x))$.

1. *Odds Ratio and Logit Transformation:*
   - *Odds:* Ratio of the probability of occurrence to non-occurrence: $"Odds" = p / (1 - p)$.
   - *Logit Function (Log-Odds):* Maps probabilities from $(0, 1)$ to $(-infinity, +infinity)$:
     $ "logit"(p) = ln(p / (1 - p)) = bold(theta)^T bold(x) = theta_0 + theta_1 x_1 + ... + theta_d x_d $
2. *Sigmoid (Logistic) Activation Function:* Inverting the logit yields the hypothesis function:
   $ h_bold(theta)(bold(x)) = sigma(bold(theta)^T bold(x)) = 1 / (1 + e^(-bold(theta)^T bold(x))) $
   - Output range: $0 < h_bold(theta)(bold(x)) < 1$, representing $P(y=1 mid(|) bold(x); bold(theta))$.
   - Derivative property: $sigma'(z) = sigma(z)(1 - sigma(z))$.
3. *Decision Boundary:* For threshold $p = 0.5$:
   $ hat(y) = cases(1 quad &"if " bold(theta)^T bold(x) >= 0, 0 quad &"if " bold(theta)^T bold(x) < 0) $
4. *Binary Cross-Entropy (Log-Loss) Cost Function:* Mean squared error produces non-convex landscape for logistic regression; cross-entropy guarantees convexity:
   $ J(bold(theta)) = - 1 / m sum_(i=1)^m [y^((i)) ln(h_bold(theta)(bold(x)^((i)))) + (1 - y^((i))) ln(1 - h_bold(theta)(bold(x)^((i))))] $
5. *Parameter Update Rule:*
   $ theta_j := theta_j - alpha frac(1, m) sum_(i=1)^m (h_bold(theta)(bold(x)^((i))) - y^((i))) x_j^((i)) $
6. *Multiclass Classification Extensions:*
   - *One-vs-Rest (OvR / One-vs-All):* For $K$ classes, train $K$ separate binary classifiers where class $k$ is positive and all other $K-1$ classes are negative. Prediction: $hat(y) = arg max_k h_bold(theta)^((k))(bold(x))$.
   - *One-vs-One (OvO):* Train $K(K-1)/2$ binary classifiers for every pair of classes $(j, k)$. Prediction by majority voting among all pairwise classifiers.

#table(
  columns: (1.3fr, 2.8fr, 2.8fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.even(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Linear Regression]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Logistic Regression]*]
  ),
  [*Output Nature*], [Continuous numeric values ($y in bb(R)$).], [Discrete categorical probabilities ($p in [0, 1]$).],
  [*Hypothesis Function*], [$h_bold(theta)(bold(x)) = bold(theta)^T bold(x)$ (Linear equation).], [$h_bold(theta)(bold(x)) = 1 / (1 + e^(-bold(theta)^T bold(x)))$ (Sigmoid).],
  [*Cost Function*], [Mean Squared Error (MSE / Residual Sum of Squares).], [Binary Cross-Entropy Loss (Log-Loss).],
  [*Underlying Goal*], [Fit the optimal line/hyperplane minimizing distance to points.], [Find the optimal decision hyperplane separating classes.],
  [*Thresholding*], [Not required (direct quantitative prediction).], [Required (e.g., threshold $>= 0.5 arrow.r$ Class 1, else 0).]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/M2-Machine_Learning_By_Ethem_Alpaydin_.pdf#page=115")[Source: Alpaydin, Ch 5 & 10, p. 103-108, 228-235] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/chapman-hall_crc-machine-learning-pattern-recognition-stephen-marsland-machine-learning_-an-algorithmic-perspective-second-edition-2014-chapman-and-hall_crc.pdf#page=76")[Source: Marsland, Ch 3, p. 64-70] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=708")[Source: Russell & Norvig, Ch 19, p. 694-706]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 3
// ==========================================
= Classification Algorithms: k-NN, Naive Bayes, Decision Trees & SVM

== k-Nearest Neighbors (k-NN)
k-Nearest Neighbors is a non-parametric, *lazy learning (instance-based)* algorithm that defers all generalization computation until a query instance is presented.

1. *Algorithm Mechanics:*
   - Store all $m$ training instances $(bold(x)^((i)), y^((i)))$.
   - Given a query test sample $bold(x)_q$, compute distance $d(bold(x)_q, bold(x)^((i)))$ to all training points.
   - Select the $k$ training points with smallest distances ($N_k(bold(x)_q)$).
   - *Classification Decision:* Majority voting among the $k$ neighbors:
     $ hat(y) = arg max_(c in C) sum_(i in N_k(bold(x)_q)) bb(I)(y^((i)) = c) $
   - *Distance-Weighted Classification:* Closer neighbors contribute higher voting weight:
     $ w_i = 1 / (d(bold(x)_q, bold(x)^((i)))^2 + epsilon), quad hat(y) = arg max_(c in C) sum_(i in N_k(bold(x)_q)) w_i dot bb(I)(y^((i)) = c) $
   - *k-NN Regression:* Output the arithmetic or distance-weighted mean:
     $ hat(y) = 1 / k sum_(i in N_k(bold(x)_q)) y^((i)) quad "or" quad hat(y) = (sum w_i y^((i))) / (sum w_i) $
2. *Common Distance Metrics in Feature Space:*
   - *Euclidean Distance ($L_2$ norm):* $d(bold(x), bold(z)) = sqrt(sum_(j=1)^d (x_j - z_j)^2)$
   - *Manhattan Distance ($L_1$ norm / City Block):* $d(bold(x), bold(z)) = sum_(j=1)^d |x_j - z_j|$
   - *Minkowski Distance ($L_p$ generalized norm):* $d(bold(x), bold(z)) = (sum_(j=1)^d |x_j - z_j|^p)^(1/p)$ ($p=1$ Manhattan, $p=2$ Euclidean).
   - *Cosine Similarity / Distance:* $"CosSim"(bold(x), bold(z)) = (bold(x) dot bold(z)) / (||bold(x)|| dot ||bold(z)||)$, $d_"cosine" = 1 - "CosSim"$.
3. *Effect of Hyperparameter $k$:*
   - Small $k$ (e.g., $k=1$): Extremely complex decision boundary, highly sensitive to noise, low bias, high variance (*Overfitting*).
   - Large $k$ (e.g., $k=m$): Oversimplified decision boundary (predicts dominant majority class), high bias, low variance (*Underfitting*).
   - Optimal $k$ is typically an odd number (to prevent ties in binary classification) selected via cross-validation.
4. *Curse of Dimensionality:* In high-dimensional spaces ($d >> 1$), sample volume grows exponentially, making all points equidistant from each other and rendering standard distance metrics non-discriminative.

== Naive Bayes Classifier
Naive Bayes is a probabilistic generative classifier grounded in *Bayes' Theorem* combined with the *naive conditional independence assumption*.

1. *Bayes' Theorem Formulation:*
   $ P(Y = c mid(|) bold(x)) = (P(bold(x) mid(|) Y = c) dot P(Y = c)) / (P(bold(x))) = (P(x_1, x_2, ..., x_d mid(|) c) dot P(c)) / (P(x_1, x_2, ..., x_d)) $
   - *Posterior Probability $P(Y = c mid(|) bold(x))$:* Probability of class $c$ given feature vector $bold(x)$.
   - *Prior Probability $P(Y = c)$:* Baseline probability of class $c$ in the training corpus ($P(c) = N_c / N$).
   - *Likelihood $P(bold(x) mid(|) Y = c)$:* Probability of observing feature vector $bold(x)$ within class $c$.
   - *Evidence $P(bold(x))$:* Normalizing marginal probability constant across all classes ($sum_k P(bold(x) mid(|) c_k) P(c_k)$).
2. *Class-Conditional Independence Assumption:* Assumes that each feature $x_j$ is conditionally independent of every other feature $x_k$ given class $c$:
   $ P(bold(x) mid(|) c) = P(x_1, x_2, ..., x_d mid(|) c) = product_(j=1)^d P(x_j mid(|) c) $
3. *Maximum A Posteriori (MAP) Decision Rule:*
   $ hat(y) = arg max_(c in C) [ P(c) product_(j=1)^d P(x_j mid(|) c) ] $
   In computational implementations, log-probabilities are summed to prevent numerical floating-point underflow:
   $ hat(y) = arg max_(c in C) [ ln P(c) + sum_(j=1)^d ln P(x_j mid(|) c) ] $
4. *Zero-Frequency Problem & Laplace (Additive) Smoothing:*
   If a feature value $x_j$ never co-occurs with class $c$ in the training data, $P(x_j mid(|) c) = 0$, causing the entire product to collapse to zero. *Laplace Smoothing* adds pseudo-counts:
   $ hat(P)(x_j = v mid(|) c) = (N_(c, v) + alpha) / (N_c + alpha dot |V|) $
   where $|V|$ is the feature vocabulary size and $alpha = 1$ is Laplace smoothing parameter ($alpha < 1$ is Lidstone smoothing).
5. *Common Naive Bayes Variants:*
   - *Gaussian Naive Bayes:* Continuous real-valued features modeled via normal distribution: $P(x_j mid(|) c) = 1 / (sqrt(2 pi sigma_(c, j)^2)) exp(- (x_j - mu_(c, j))^2 / (2 sigma_(c, j)^2))$.
   - *Multinomial Naive Bayes:* Discrete word counts / term frequencies (e.g., text categorization, spam filtering).
   - *Bernoulli Naive Bayes:* Binary boolean feature occurrences ($0$ or $1$) (e.g., presence or absence of keywords).

== Decision Tree Learning (ID3, CART & C4.5)
A Decision Tree is a hierarchical non-parametric model that recursively partitions the feature space into axis-aligned hyper-rectangles using greedy heuristic splitting.

#figure-box(
  "Figure 3.3: Decision Tree Architecture and Hierarchical Feature Partitioning",
  [
    #grid(
      columns: (1fr),
      align: center,
      [
        #rect(stroke: 1.5pt + rgb("#1e3a8a"), fill: rgb("#eff6ff"), inset: 6pt, radius: 4pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"))[Root Node: Feature $X_1 <= theta_1$?]
        ]
        #grid(
          columns: (1fr, 1fr),
          gutter: 30pt,
          [
            #text(size: 8pt, weight: "bold", fill: rgb("#2563eb"))[True $arrow.b$] \
            #rect(stroke: 1pt + rgb("#2563eb"), fill: rgb("#ffffff"), inset: 5pt, radius: 3pt)[
              #text(weight: "bold", fill: rgb("#2563eb"))[Internal Node: $X_2 <= theta_2$?]
            ] \
            #grid(
              columns: (1fr, 1fr),
              gutter: 10pt,
              [
                #text(size: 7.5pt, weight: "bold", fill: rgb("#059669"))[Yes $arrow.b$] \
                #rect(fill: rgb("#dcfce7"), stroke: 0.5pt + rgb("#059669"), inset: 4pt, radius: 2pt)[#text(size: 8pt, weight: "bold", fill: rgb("#065f46"))[Leaf: Class A]]
              ],
              [
                #text(size: 7.5pt, weight: "bold", fill: rgb("#dc2626"))[No $arrow.b$] \
                #rect(fill: rgb("#fee2e2"), stroke: 0.5pt + rgb("#dc2626"), inset: 4pt, radius: 2pt)[#text(size: 8pt, weight: "bold", fill: rgb("#991b1b"))[Leaf: Class B]]
              ]
            )
          ],
          [
            #text(size: 8pt, weight: "bold", fill: rgb("#2563eb"))[False $arrow.b$] \
            #rect(fill: rgb("#dcfce7"), stroke: 0.5pt + rgb("#059669"), inset: 5pt, radius: 2pt)[
              #text(weight: "bold", fill: rgb("#065f46"))[Leaf: Class A]
            ]
          ]
        )
      ]
    )
  ]
)

1. *Decision Tree Terminology:*
   - *Root Node:* The topmost decision node containing the full undivided dataset.
   - *Internal (Decision) Node:* Intermediate test condition on a specific feature.
   - *Branch (Edge):* Outcome path corresponding to a feature test.
   - *Leaf (Terminal) Node:* Node holding the final class prediction or continuous value.
2. *Splitting Criteria:*
   - *Shannon Entropy ($H(S)$):* Measure of impurity or disorder in sample set $S$ containing proportions $p_i$ of class $i$:
     $ H(S) = - sum_(i=1)^C p_i log_2 (p_i) $
     - Pure node ($p_1 = 1$): $H(S) = 0$. Maximum impurity (binary equal split $p_1=0.5, p_2=0.5$): $H(S) = 1.0$.
   - *Information Gain (ID3 Algorithm):* Expected reduction in entropy caused by partitioning on attribute $A$:
     $ "Gain"(S, A) = H(S) - sum_(v in "Values"(A)) (|S_v| / |S|) H(S_v) $
     - *Limitation:* Heavily biased toward attributes with many distinct values (e.g., CustomerID, Date).
   - *Gain Ratio (C4.5 Algorithm):* Normalizes Information Gain by Split Information to penalize multi-valued attributes:
     $ "SplitInfo"_A(S) = - sum_(v in "Values"(A)) (|S_v| / |S|) log_2 (|S_v| / |S|), quad "GainRatio"(S, A) = ("Gain"(S, A)) / ("SplitInfo"_A(S)) $
   - *Gini Impurity (CART Algorithm - Classification and Regression Trees):* Measures the probability of misclassifying a randomly chosen element:
     $ "Gini"(S) = 1 - sum_(i=1)^C p_i^2 $
     - Pure node: $"Gini" = 0$. Maximum binary impurity: $"Gini" = 0.5$.
     - Computationally faster than Entropy because it avoids logarithmic operations.
3. *Tree Pruning (Mitigating Overfitting):*
   - *Pre-Pruning (Early Stopping):* Stop growing tree if sample count falls below threshold (`min_samples_split`), maximum depth is reached (`max_depth`), or impurity drop is below $epsilon$.
   - *Post-Pruning (Cost-Complexity Pruning):* Grow full tree until leaves are pure, then iteratively collapse non-essential subtrees minimizing cost: $R_alpha(T) = R(T) + alpha |T|$.
4. *Handling Missing Values:* Impute with modal/mean value within the partition or distribute sample fractionally across all sub-branches proportionally to child frequencies.

== Support Vector Machines (SVM)
Support Vector Machine is a supervised maximum-margin classifier that constructs an optimal separating hyperplane in a high-dimensional feature space.

#figure-box(
  "Figure 3.4: Support Vector Machine Maximum Margin Geometry and Support Vectors",
  [
    #rect(stroke: 0.5pt + rgb("#94a3b8"), fill: rgb("#ffffff"), inset: 8pt, radius: 3pt)[
      #grid(
        columns: (1fr, 1.4fr, 1fr),
        align: horizon + center,
        [
          #text(weight: "bold", fill: rgb("#1d4ed8"))[Positive Hyperplane]\
          $bold(w)^T bold(x) + b = +1$ \
          #text(size: 8pt, fill: rgb("#475569"))[(Positive Support Vectors $circle.filled$)]
        ],
        [
          #rect(stroke: 1pt + rgb("#0f172a"), fill: rgb("#eff6ff"), inset: 6pt, radius: 2pt)[
            #text(weight: "bold", fill: rgb("#0f172a"))[Optimal Decision Boundary]\
            $bold(w)^T bold(x) + b = 0$ \
            #text(size: 8pt, weight: "bold", fill: rgb("#1e3a8a"))[Margin Width $gamma = 2 / (||bold(w)||)$]
          ]
        ],
        [
          #text(weight: "bold", fill: rgb("#b91c1c"))[Negative Hyperplane]\
          $bold(w)^T bold(x) + b = -1$ \
          #text(size: 8pt, fill: rgb("#475569"))[(Negative Support Vectors $square.filled$)]
        ]
      )
    ]
  ]
)

1. *Hyperplane and Functional Margin:*
   - Decision Hyperplane: $bold(w)^T bold(x) + b = 0$ where $bold(w)$ is the normal weight vector and $b$ is the bias offset.
   - For linearly separable classes $y_i in {-1, +1}$:
     $ cases(bold(w)^T bold(x)^((i)) + b >= +1 quad &"for " y^((i)) = +1, bold(w)^T bold(x)^((i)) + b <= -1 quad &"for " y^((i)) = -1) arrow.r.double y^((i))(bold(w)^T bold(x)^((i)) + b) >= 1 $
2. *Geometric Margin and Hard-Margin Optimization:*
   - Total geometric margin between bounding hyperplanes is $gamma = 2 / (||bold(w)||)$.
   - Maximizing margin $2 / (||bold(w)||)$ is equivalent to solving the convex quadratic optimization problem:
     $ min_(bold(w), b) 1 / 2 ||bold(w)||^2 quad text("subject to") quad y^((i))(bold(w)^T bold(x)^((i)) + b) >= 1, quad forall i = 1, ..., m $
3. *Support Vectors:* The subset of training instances that lie exactly on the marginal bounding hyperplanes ($y^((i))(bold(w)^T bold(x)^((i)) + b) = 1$). All other data points can be deleted without altering the decision boundary.
4. *Soft-Margin SVM (Non-Separable Data & Slack Variables):*
   To handle non-linearly separable or noisy distributions, slack variables $xi_i >= 0$ allow margin violations:
   $ min_(bold(w), b, bold(xi)) 1 / 2 ||bold(w)||^2 + C sum_(i=1)^m xi_i quad text("subject to") quad y^((i))(bold(w)^T bold(x)^((i)) + b) >= 1 - xi_i, quad xi_i >= 0 $
   - *Regularization Parameter $C$:* Governs the trade-off between maximizing margin width and minimizing training classification errors.
     - Large $C$: Strict penalty on errors, narrow margin, low bias, high variance (*Overfitting risk*).
     - Small $C$: Tolerates margin violations, wide margin, high bias, low variance (*Underfitting risk*).
5. *The Kernel Trick (Non-Linear SVM):*
   When data is non-linearly separable in input space $bb(R)^d$, map it to higher-dimensional feature space $Phi(bold(x))$ where it becomes linearly separable.
   *Mercer's Theorem* allows computing inner products in high-dimensional space without explicitly evaluating $Phi(bold(x))$:
   $ K(bold(x), bold(z)) = chevron.l Phi(bold(x)), Phi(bold(z)) chevron.r $
   - *Linear Kernel:* $K(bold(x), bold(z)) = bold(x)^T bold(z)$
   - *Polynomial Kernel:* $K(bold(x), bold(z)) = (bold(x)^T bold(z) + c)^d$
   - *Radial Basis Function (RBF / Gaussian Kernel):* $K(bold(x), bold(z)) = exp(- gamma ||bold(x) - bold(z)||^2)$ where $gamma = 1 / (2 sigma^2)$. Maps data to infinite-dimensional Hilbert space.
   - *Sigmoid Kernel:* $K(bold(x), bold(z)) = tanh(alpha bold(x)^T bold(z) + c)$

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/M2-Machine_Learning_By_Ethem_Alpaydin_.pdf#page=180")[Source: Alpaydin, Ch 8, 9, 13, p. 168-195, 318-335] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/chapman-hall_crc-machine-learning-pattern-recognition-stephen-marsland-machine-learning_-an-algorithmic-perspective-second-edition-2014-chapman-and-hall_crc.pdf#page=181")[Source: Marsland, Ch 8 & 12, p. 169-188, 249-265] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=722")[Source: Russell & Norvig, Ch 19, p. 707-720]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 4
// ==========================================
= Model Evaluation, Validation & Diagnostic Techniques

== Confusion Matrix & Classification Performance Metrics
For binary classification, model predictions against actual ground-truth labels are tabulated in a $2 times 2$ *Confusion Matrix*:

#table(
  columns: (1.5fr, 2.2fr, 2.2fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.even(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 7pt,
  align: horizon + center,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Actual / Predicted]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Predicted Positive ($hat(Y)=1$)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Predicted Negative ($hat(Y)=0$)]*]
  ),
  [*Actual Positive ($Y=1$)*], [*True Positive (TP)* \ Correctly identified positive], [*False Negative (FN)* \ Type II Error (Miss)],
  [*Actual Negative ($Y=0$)*], [*False Positive (FP)* \ Type I Error (False Alarm)], [*True Negative (TN)* \ Correctly identified negative]
)

1. *Classification Accuracy:* Proportion of total correct predictions:
   $ "Accuracy" = ("TP" + "TN") / ("TP" + "TN" + "FP" + "FN") $
   - *Accuracy Paradox:* On imbalanced datasets (e.g., 99% negative, 1% positive), a trivial model predicting negative always achieves 99% accuracy while failing entirely on positive instances.
2. *Precision (Positive Predictive Value):* Exactness of positive predictions:
   $ "Precision" = "TP" / ("TP" + "FP") $
   - High precision is critical when False Positives are catastrophic (e.g., Spam filtering, YouTube video demonetization).
3. *Recall (Sensitivity / True Positive Rate - TPR):* Completeness of positive identification:
   $ "Recall" = "TP" / ("TP" + "FN") $
   - High recall is critical when False Negatives are catastrophic (e.g., Malignant tumor detection, Earthquake warning).
4. *Specificity (True Negative Rate - TNR):*
   $ "Specificity" = "TN" / ("TN" + "FP") $
5. *F1-Score:* Harmonic mean of precision and recall, balancing both metrics on imbalanced data:
   $ F_1 = 2 dot ("Precision" dot "Recall") / ("Precision" + "Recall") = (2 dot "TP") / (2 dot "TP" + "FP" + "FN") $
6. *Receiver Operating Characteristic (ROC) & AUC:*
   - *ROC Curve:* Plots True Positive Rate ($"TPR" = "Recall"$) on Y-axis against False Positive Rate ($"FPR" = 1 - "Specificity" = "FP" / ("TN" + "FP")$) on X-axis across all discrimination thresholds.
   - *Area Under Curve (AUC):* Aggregate ranking measure between $0.5$ (random guess) and $1.0$ (perfect discrimination).

== Regression Evaluation Metrics

1. *Mean Absolute Error (MAE):* Average magnitude of absolute errors:
   $ "MAE" = 1 / m sum_(i=1)^m |y^((i)) - hat(y)^((i))| $
   - Linear penalty; robust to extreme outliers.
2. *Mean Squared Error (MSE):* Average squared error penalty:
   $ "MSE" = 1 / m sum_(i=1)^m (y^((i)) - hat(y)^((i)))^2 $
   - Quadratically penalizes large errors; sensitive to outliers.
3. *Root Mean Squared Error (RMSE):* Square root of MSE; expressed in the identical units of target variable $y$:
   $ "RMSE" = sqrt(1 / m sum_(i=1)^m (y^((i)) - hat(y)^((i)))^2) $
4. *Coefficient of Determination ($R^2$ Score):* Proportion of target variance explained by inputs:
   $ R^2 = 1 - (sum_(i=1)^m (y^((i)) - hat(y)^((i)))^2) / (sum_(i=1)^m (y^((i)) - bar(y))^2) = 1 - ("SS"_"res") / ("SS"_"tot") $
   - $R^2 = 1.0$: Perfect fit. $R^2 = 0.0$: Equivalent to baseline mean predictor. $R^2 < 0$: Model performs worse than the sample mean.

== Bias-Variance Decomposition & Overfitting/Underfitting
The generalization error of any supervised learning model decomposes into three distinct mathematical components:

$ "Expected Generalization Error" = "Bias"[hat(f)(x)]^2 + "Var"[hat(f)(x)] + sigma^2 $

#figure-box(
  "Figure 3.5: Bias-Variance Tradeoff vs Model Complexity and Diagnostic Signatures",
  [
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 10pt,
      [
        #rect(stroke: 1pt + rgb("#b91c1c"), fill: rgb("#fef2f2"), inset: 6pt, radius: 3pt)[
          #text(weight: "bold", fill: rgb("#991b1b"))[Underfitting (High Bias)]\
          #v(2pt)
          #text(size: 8pt, fill: rgb("#334155"))[- High Training Error\ - High Validation Error\ - Model too simplistic\ - Remedy: Add features, increase model capacity]
        ]
      ],
      [
        #rect(stroke: 1pt + rgb("#059669"), fill: rgb("#ecfdf5"), inset: 6pt, radius: 3pt)[
          #text(weight: "bold", fill: rgb("#065f46"))[Optimal Balance]\
          #v(2pt)
          #text(size: 8pt, fill: rgb("#334155"))[- Low Training Error\ - Low Validation Error\ - Minimal Generalization Gap\ - Goal of Model Selection]
        ]
      ],
      [
        #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 6pt, radius: 3pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"))[Overfitting (High Variance)]\
          #v(2pt)
          #text(size: 8pt, fill: rgb("#334155"))[- Very Low Training Error\ - High Validation Error\ - Model memorizes noise\ - Remedy: Regularization, more data, pruning]
        ]
      ]
    )
  ]
)

1. *Bias Error ($"Bias"^2$):* Error resulting from erroneous or oversimplified assumptions in the learning algorithm. High bias causes the model to miss underlying trends (*Underfitting*).
2. *Variance Error ($"Variance"$):* Error resulting from extreme sensitivity to small fluctuations in the training dataset. High variance causes the model to fit random noise (*Overfitting*).
3. *Irreducible Error ($sigma^2$):* Inherent noise and unobserved variables in the data-generating distribution that no model can eliminate.

== Cross-Validation & Resampling Strategies

#figure-box(
  "Figure 3.6: K-Fold Cross-Validation Scheme (5-Fold Iterative Partitioning)",
  [
    #rect(stroke: 0.5pt + rgb("#94a3b8"), fill: rgb("#ffffff"), inset: 6pt, radius: 3pt)[
      #grid(
        columns: (1fr),
        row-gutter: 4pt,
        align: center,
        [#grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), gutter: 4pt,
          rect(fill: rgb("#fee2e2"), inset: 4pt)[#text(size: 7.5pt, weight: "bold", fill: rgb("#991b1b"))[Fold 1 (Val)]],
          rect(fill: rgb("#eff6ff"), inset: 4pt)[#text(size: 7.5pt, fill: rgb("#1e3a8a"))[Fold 2 (Train)]],
          rect(fill: rgb("#eff6ff"), inset: 4pt)[#text(size: 7.5pt, fill: rgb("#1e3a8a"))[Fold 3 (Train)]],
          rect(fill: rgb("#eff6ff"), inset: 4pt)[#text(size: 7.5pt, fill: rgb("#1e3a8a"))[Fold 4 (Train)]],
          rect(fill: rgb("#eff6ff"), inset: 4pt)[#text(size: 7.5pt, fill: rgb("#1e3a8a"))[Fold 5 (Train)]]
        )],
        [#grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), gutter: 4pt,
          rect(fill: rgb("#eff6ff"), inset: 4pt)[#text(size: 7.5pt, fill: rgb("#1e3a8a"))[Fold 1 (Train)]],
          rect(fill: rgb("#fee2e2"), inset: 4pt)[#text(size: 7.5pt, weight: "bold", fill: rgb("#991b1b"))[Fold 2 (Val)]],
          rect(fill: rgb("#eff6ff"), inset: 4pt)[#text(size: 7.5pt, fill: rgb("#1e3a8a"))[Fold 3 (Train)]],
          rect(fill: rgb("#eff6ff"), inset: 4pt)[#text(size: 7.5pt, fill: rgb("#1e3a8a"))[Fold 4 (Train)]],
          rect(fill: rgb("#eff6ff"), inset: 4pt)[#text(size: 7.5pt, fill: rgb("#1e3a8a"))[Fold 5 (Train)]]
        )],
        [#grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), gutter: 4pt,
          rect(fill: rgb("#eff6ff"), inset: 4pt)[#text(size: 7.5pt, fill: rgb("#1e3a8a"))[Fold 1 (Train)]],
          rect(fill: rgb("#eff6ff"), inset: 4pt)[#text(size: 7.5pt, fill: rgb("#1e3a8a"))[Fold 2 (Train)]],
          rect(fill: rgb("#eff6ff"), inset: 4pt)[#text(size: 7.5pt, fill: rgb("#1e3a8a"))[Fold 3 (Train)]],
          rect(fill: rgb("#eff6ff"), inset: 4pt)[#text(size: 7.5pt, fill: rgb("#1e3a8a"))[Fold 4 (Train)]],
          rect(fill: rgb("#fee2e2"), inset: 4pt)[#text(size: 7.5pt, weight: "bold", fill: rgb("#991b1b"))[Fold 5 (Val)]]
        )]
      )
    ]
  ]
)

1. *Holdout Validation Method:*
   - Split dataset randomly into *Training Set* (e.g., 70%), *Validation Set* (e.g., 15% for hyperparameter tuning), and *Test Set* (e.g., 15% for final evaluation).
   - High variance in evaluation if the dataset is small or if unrepresentative samples fall into the test split.
2. *K-Fold Cross-Validation:*
   - Split training dataset randomly into $K$ equal-sized disjoint partitions (folds).
   - Iterate $K$ times: train on $K-1$ folds and validate on the remaining single fold.
   - Aggregate overall performance estimate: $"CV"_((K)) = 1 / K sum_(k=1)^K "Score"_k$. Typical values: $K=5$ or $K=10$.
3. *Stratified K-Fold Cross-Validation:*
   - Guarantees that each fold preserves the identical percentage ratio of target class labels as the original complete dataset. Essential for imbalanced classification tasks.
4. *Leave-One-Out Cross-Validation (LOOCV):*
   - Extreme case of K-Fold where $K = m$ (number of total instances).
   - In each of $m$ iterations, train on $m-1$ points and test on exactly 1 point.
   - Deterministic (no random split variance) and nearly unbiased, but computationally expensive for large datasets ($cal(O)(m)$ model fits).

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/M2-Machine_Learning_By_Ethem_Alpaydin_.pdf#page=501")[Source: Alpaydin, Ch 19, p. 486-495] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/chapman-hall_crc-machine-learning-pattern-recognition-stephen-marsland-machine-learning_-an-algorithmic-perspective-second-edition-2014-chapman-and-hall_crc.pdf#page=45")[Source: Marsland, Ch 2, p. 35-42] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/Introduction to Machine Learning with Python ( PDFDrive.com )-min.pdf#page=262")[Source: Müller & Guido, Ch 5, p. 252-305]
