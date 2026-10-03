// Typst Theory Notes - Artificial Intelligence & Machine Learning (Unit 4)
// Course Code: PCC-302-IT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[ARTIFICIAL INTELLIGENCE & ML — UNIT 4]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Unsupervised Learning & Ensemble Methods]]
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 4: UNSUPERVISED LEARNING, ENSEMBLE METHODS & PREPROCESSING]
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
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 4 based on SPPU end-semester examination trends.

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
  [*Data Preprocessing & Cleaning*], [Data cleaning, Handling missing values (Statistical vs k-NN Imputation), Feature scaling (Min-Max, Standardization), `fit()` vs `transform()`, Data leakage prevention.], [High Priority \ (6-8 Marks Qs)],
  [*Feature Engineering & Reduction*], [Curse of Dimensionality, Filter/Wrapper/Embedded feature selection, Pearson Correlation Coefficient, Principal Component Analysis (PCA), Linear Discriminant Analysis (LDA).], [High Priority \ (8-10 Marks Qs)],
  [*Partitioning Clustering*], [Unsupervised clustering taxonomy, $k$-Means algorithm, Inertia / WCSS, Elbow method, Silhouette analysis, $k$-Medoids (PAM), Distance metrics.], [High Priority \ (8-10 Marks Qs)],
  [*Hierarchical Clustering*], [Agglomerative vs Divisive, Dendrograms, Linkage criteria (Single, Complete, Average, Ward's Linkage), Connectivity constraints.], [High Priority \ (6-8 Marks Qs)],
  [*Association Rule Mining*], [Market basket analysis, Support, Confidence, Lift, Apriori algorithm, Candidate generation and pruning.], [Medium-High Priority \ (6-8 Marks Qs)],
  [*Ensemble Learning & Bagging*], [Condorcet's Theorem, Bias-variance reduction, Bootstrap Aggregation (Bagging), Out-of-Bag (OOB) error, Random Forest (Random feature subspaces, Tree decorrelation).], [High Priority \ (8-10 Marks Qs)],
  [*Boosting & Stacking*], [Sequential sample reweighting, AdaBoost algorithm formulation, Gradient Boosted Trees (GBM), Stacked Generalization (Meta-learning, Blending, Out-of-fold cross validation).], [High Priority \ (8-10 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Data Preprocessing, Cleaning & Feature Engineering

== Data Preprocessing Workflow & Core Challenges
Real-world datasets gathered from sensors, transactional databases, and logs are inevitably dirty, incomplete, noisy, and unstandardized. Data preprocessing transforms raw, imperfect data into a structured mathematical representation suitable for machine learning algorithms.

1. *Incomplete Data (Missing Values):* Caused by sensor malfunctions, optional user survey fields, or database merge anomalies.
2. *Noisy Data (Errors & Outliers):* Caused by human data entry errors, transmission faults, or extreme anomalous events.
3. *Inconsistent & Redundant Data:* Discrepancies in naming conventions, duplicated entries, or highly correlated features (multicollinearity).
4. *Scale Disparities:* Numeric features measured on wildly partialering units (e.g., Annual Salary in thousands vs. Age in years), which causes distance-based models (k-NN, SVM, k-Means) to become biased toward large-magnitude features.

#figure-box(
  "Figure 4.1: Machine Learning Data Preprocessing and Feature Transformation Pipeline",
  [
    #rect(stroke: 0.5pt + rgb("#94a3b8"), fill: rgb("#ffffff"), inset: 7pt, radius: 3pt)[
      #grid(
        columns: (1fr, auto, 1fr, auto, 1fr, auto, 1fr),
        align: horizon + center,
        [#text(weight: "bold", fill: rgb("#1e3a8a"))[Raw Dataset]\ (Dirty/Missing)],
        [#text(size: 14pt, fill: rgb("#2563eb"))[$arrow.r$]],
        [#text(weight: "bold", fill: rgb("#1e3a8a"))[Data Cleaning]\ (Impute/Outliers)],
        [#text(size: 14pt, fill: rgb("#2563eb"))[$arrow.r$]],
        [#text(weight: "bold", fill: rgb("#1e3a8a"))[Feature Scaling]\ (Standard / Min-Max)],
        [#text(size: 14pt, fill: rgb("#2563eb"))[$arrow.r$]],
        [#text(weight: "bold", fill: rgb("#059669"))[Clean Feature Matrix]\ $bold(X) in bb(R)^(m times d)$]
      )
    ]
  ]
)

== Handling Missing Values in Datasets
Missing data mechanisms are statistically classified into *Missing Completely at Random (MCAR)*, *Missing at Random (MAR)*, and *Missing Not at Random (MNAR)*.

1. *Listwise Deletion (Row Deletion):* Dropping any observation that contains one or more missing feature values.
   - *Advantage:* Simple and avoids introducing synthetic imputation bias.
   - *Disadvantage:* Drastically reduces dataset sample size and discards valid information if missingness is widespread.
2. *Statistical Univariate Imputation:* Replacing missing values with central tendency statistics computed over observed entries:
   - *Mean Imputation:* Replaces missing values with feature mean $mu = 1/N sum x_i$ (suitable for normally distributed symmetric numeric data).
   - *Median Imputation:* Replaces missing values with 50th percentile (robust to extreme outliers and skewed distributions).
   - *Mode Imputation:* Replaces missing values with the most frequent category (mandatory for discrete nominal/categorical features).
3. *k-Nearest Neighbors (k-NN) Imputation:*
   - Identifies the $k$ most similar complete instances in the dataset based on available non-missing features using Euclidean or Gower's distance.
   - Imputes the missing attribute by calculating the mean or distance-weighted average among the $k$ identified neighbors:
     $ hat(x)_(i, j) = (sum_(n in N_k(i)) w_n dot x_(n, j)) / (sum_(n in N_k(i)) w_n), quad w_n = 1 / (d(bold(x)_i, bold(x)_n) + epsilon) $
   - *Advantage:* Captures multidimensional feature correlations far better than univariate mean/median imputation.
   - *Disadvantage:* Computationally expensive ($cal(O)(m times d)$) during inference on large-scale datasets.

#table(
  columns: (1.2fr, 2.2fr, 2.2fr, 2.2fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.even(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Technique]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Core Mechanism]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Key Advantages]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Primary Limitations]*]
  ),
  [*Listwise Deletion*], [Delete entire sample if any feature is null.], [Fast, preserves original feature distributions.], [Severe data loss, introduces bias if not MCAR.],
  [*Mean / Median*], [Replace nulls with column arithmetic mean/median.], [Fast, deterministic, preserves sample size.], [Distorts feature variance and inter-feature covariance.],
  [*Mode Imputation*], [Replace nulls with most frequent discrete class.], [Applicable to categorical and text attributes.], [Amplifies class dominance and reduces entropy.],
  [*k-NN Imputation*], [Impute using distance-weighted nearest neighbors.], [Preserves multi-attribute correlation patterns.], [High time complexity $cal(O)(m^2)$, sensitive to outliers.]
)

== Feature Scaling & Normalization
Feature scaling normalizes the dynamic range of independent variables to ensure equal gradient updates and distance calculations.

1. *Min-Max Normalization (Feature Scaling to Range $[0, 1]$):*
   $ x' = (x - x_min) / (x_max - x_min) $
   - Rescales all numeric values strictly into bounded interval $[0, 1]$ (or $[a, b]$).
   - Highly sensitive to outliers, as extreme values compress the vast majority of inlier data into a tiny sub-interval.
2. *Standardization ($Z$-Score Normalization):*
   $ z = (x - mu) / sigma $
   where $mu$ is the empirical sample mean and $sigma$ is the sample standard deviation.
   - Centers data around mean $mu = 0$ with unit variance $sigma^2 = 1$.
   - Does not bind features to a fixed minimum/maximum range, making it robust to outliers.
   - Mandatory for algorithms assuming Gaussian error distributions (Linear/Logistic Regression, PCA, SVM).

== Scikit-Learn API Design & Preventing Data Leakage
In production machine learning pipelines, preprocessing transformations are strictly divided into parameter estimation and application:

1. *`fit()` Method:* Computes and stores the internal transformation parameters (e.g., mean $mu$, standard deviation $sigma$, min, max) *strictly from the training dataset only*.
2. *`transform()` Method:* Applies the learned transformation parameters to scale or impute target feature matrices.
3. *`fit_transform()` Method:* Combines `fit()` and `transform()` in a single optimized pass on training data.
4. *Data Leakage Prevention Rule:* *NEVER* call `fit()` or `fit_transform()` on the test dataset. Doing so leaks test set distribution statistics into the model training pipeline, resulting in over-optimistic evaluation scores that fail in production deployment.
   $ bold(X)_"train_scaled" = "scaler"."fit_transform"(bold(X)_"train") $
   $ bold(X)_"test_scaled" = "scaler"."transform"(bold(X)_"test") $

== Feature Selection Techniques & Pearson Correlation
Feature selection reduces model complexity by selecting the most informative subset of original features without geometric alteration.

1. *Filter Methods:* Select features using statistical properties independent of model training:
   - *Pearson's Correlation Coefficient ($r$):* Measures linear bivariate association between continuous features $X$ and $Y$:
     $ r_(X, Y) = (sum_(i=1)^m (x_i - bar(x))(y_i - bar(y))) / (sqrt(sum_(i=1)^m (x_i - bar(x))^2) sqrt(sum_(i=1)^m (y_i - bar(y))^2)) $
     - Value ranges from $-1.0$ (perfect negative linear correlation) to $+1.0$ (perfect positive linear correlation), with $0$ indicating no linear correlation.
     - *Feature Filtering Strategy:* Retain features with high correlation to the target variable $Y$, and eliminate redundant features with high mutual inter-correlation ($|r| > 0.85$).
   - *Chi-Square ($chi^2$) Test:* Evaluates independence between categorical features and target class labels.
   - *ANOVA $F$-Test:* Tests variance partialerences of numeric features across multiple discrete classes.
2. *Wrapper Methods:* Use a predictive model as an evaluation engine to search feature combinations (e.g., *Forward Feature Selection*, *Backward Elimination*, *Recursive Feature Elimination - RFE*). Computationally expensive but highly accurate.
3. *Embedded Methods:* Perform feature selection automatically during model training (e.g., *Lasso $L_1$ Regression*, *Decision Tree Gini Importance*).

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/M2-Machine_Learning_By_Ethem_Alpaydin_.pdf#page=125")[Source: Alpaydin, Ch 6, p. 109-125] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/chapman-hall_crc-machine-learning-pattern-recognition-stephen-marsland-machine-learning_-an-algorithmic-perspective-second-edition-2014-chapman-and-hall_crc.pdf#page=145")[Source: Marsland, Ch 6, p. 129-148] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/Introduction to Machine Learning with Python ( PDFDrive.com )-min.pdf#page=145")[Source: Müller & Guido, Ch 3, p. 131-155]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 2
// ==========================================
= Dimensionality Reduction: PCA and LDA

== The Curse of Dimensionality
As the number of features (dimensions $d$) increases, the volume of the feature space grows exponentially ($V prop r^d$), causing the available training data points to become extremely sparse.

1. *Distance Concentration:* In high-dimensional spaces, the Euclidean distance between any two randomly chosen points converges to the same value ($lim_(d -> infinity) (d_max - d_min) / d_min = 0$), destroying distance-based discrimination in k-NN, SVM, and k-Means.
2. *Combinatorial Explosion & Overfitting:* High dimensions require exponentially more training samples to maintain sample density, leading to severe overfitting.
3. *Remedy:* Dimensionality reduction projects high-dimensional data $bb(R)^d$ into a lower-dimensional subspace $bb(R)^k$ ($k << d$) while preserving maximal statistical variance or class separability.

== Principal Component Analysis (PCA)
Principal Component Analysis is an *unsupervised linear dimensionality reduction technique* that finds orthogonal axes (Principal Components) along which data variance is maximized.

#figure-box(
  "Figure 4.2: PCA (Max Variance Projection) vs LDA (Max Class Separability Projection)",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 14pt,
      align: center,
      [
        #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 8pt, radius: 4pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"))[Principal Component Analysis (PCA)]\
          #v(2pt)
          #text(size: 8.5pt, fill: rgb("#334155"))[- *Unsupervised* (ignores class labels)\ - Finds axis $bold(w)_1$ maximizing data variance\ - Minimizes reconstruction error $||bold(x) - hat(bold(x))||^2$]
        ]
      ],
      [
        #rect(stroke: 1pt + rgb("#059669"), fill: rgb("#ecfdf5"), inset: 8pt, radius: 4pt)[
          #text(weight: "bold", fill: rgb("#065f46"))[Linear Discriminant Analysis (LDA)]\
          #v(2pt)
          #text(size: 8.5pt, fill: rgb("#334155"))[- *Supervised* (uses class labels)\ - Maximizes between-class variance ($bold(S)_B$)\ - Minimizes within-class variance ($bold(S)_W$)]
        ]
      ]
    )
  ]
)

1. *Mathematical Derivation & Step-by-Step Algorithm:*
   - *Step 1 (Standardization):* Center data matrix $bold(X) in bb(R)^(m times d)$ so each feature has mean zero ($mu = 0$).
   - *Step 2 (Covariance Matrix Calculation):* Compute the $d times d$ sample covariance matrix $bold(Sigma)$:
     $ bold(Sigma) = 1 / (m - 1) bold(X)^T bold(X) $
   - *Step 3 (Eigenvalue Decomposition):* Solve the characteristic eigenvalue equation:
     $ bold(Sigma) bold(v)_j = lambda_j bold(v)_j $
     where $lambda_j$ is the $j$-th eigenvalue and $bold(v)_j$ is the corresponding $j$-th eigenvector (orthogonal principal component direction).
   - *Step 4 (Sorting & Component Selection):* Sort eigenvalues in descending order: $lambda_1 >= lambda_2 >= ... >= lambda_d$.
   - *Step 5 (Explained Variance Ratio):* Select top $k$ eigenvectors explaining target variance threshold (e.g., 95%):
     $ text("Explained Variance Ratio") = (sum_(j=1)^k lambda_j) / (sum_(j=1)^d lambda_j) >= 0.95 $
   - *Step 6 (Projection):* Form projection matrix $bold(W) = [bold(v)_1, bold(v)_2, ..., bold(v)_k] in bb(R)^(d times k)$ and transform data:
     $ bold(X)_"projected" = bold(X) bold(W) in bb(R)^(m times k) $
2. *Geometric Interpretation:* First principal component ($"PC"_1$) captures the direction of greatest data spread; second principal component ($"PC"_2$) is strictly orthogonal ($bold(v)_1^T bold(v)_2 = 0$) and captures the next highest variance.

== Linear Discriminant Analysis (LDA)
Linear Discriminant Analysis (Fisher's LDA) is a *supervised dimensionality reduction and classification technique* that finds a linear combination of features that maximizes class separation.

1. *Fisher's Criterion Formulation:*
   LDA seeks projection vector $bold(w)$ that maximizes the ratio of between-class scatter to within-class scatter:
   $ J(bold(w)) = (bold(w)^T bold(S)_B bold(w)) / (bold(w)^T bold(S)_W bold(w)) $
2. *Scatter Matrices Definitions:*
   - *Within-Class Scatter Matrix ($bold(S)_W$):* Measures dispersion of samples around their respective class centroids:
     $ bold(S)_W = sum_(c=1)^C sum_(bold(x) in D_c) (bold(x) - bold(mu)_c)(bold(x) - bold(mu)_c)^T $
   - *Between-Class Scatter Matrix ($bold(S)_B$):* Measures dispersion of class centroids around the global mean $bold(mu)$:
     $ bold(S)_B = sum_(c=1)^C N_c (bold(mu)_c - bold(mu))(bold(mu)_c - bold(mu))^T $
3. *Optimal Projection Solution:* Maximizing $J(bold(w))$ reduces to solving the generalized eigenvalue problem:
   $ bold(S)_W^(-1) bold(S)_B bold(w) = lambda bold(w) $
4. *Dimensionality Constraint:* Since $bold(S)_B$ is the sum of $C$ rank-1 matrices of which only $C-1$ are linearly independent, the rank of $bold(S)_B$ is at most $C-1$. Therefore, LDA can project data to at most $k <= C - 1$ dimensions (where $C$ is the number of distinct classes).

#table(
  columns: (1.3fr, 2.8fr, 2.8fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.even(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Principal Component Analysis (PCA)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Linear Discriminant Analysis (LDA)]*]
  ),
  [*Learning Paradigm*], [Unsupervised (ignores target class labels).], [Supervised (requires target class labels $y_i$).],
  [*Optimization Objective*], [Maximize total feature variance / minimize reconstruction error.], [Maximize between-class separability relative to within-class spread.],
  [*Mathematical Engine*], [Eigen decomposition of sample Covariance Matrix $bold(Sigma)$.], [Generalized eigen decomposition of $bold(S)_W^(-1) bold(S)_B$.],
  [*Maximum Dimensions*], [Up to original number of features $k <= d$.], [Strictly bounded by number of classes $k <= C - 1$.],
  [*Primary Application*], [Feature compression, noise filtering, data visualization.], [Supervised dimensionality reduction, pre-classification projection.]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/M2-Machine_Learning_By_Ethem_Alpaydin_.pdf#page=130")[Source: Alpaydin, Ch 6, p. 109-130] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/chapman-hall_crc-machine-learning-pattern-recognition-stephen-marsland-machine-learning_-an-algorithmic-perspective-second-edition-2014-chapman-and-hall_crc.pdf#page=150")[Source: Marsland, Ch 6, p. 129-152] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/Introduction to Machine Learning with Python ( PDFDrive.com )-min.pdf#page=150")[Source: Müller & Guido, Ch 3, p. 140-155]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 3
// ==========================================
= Unsupervised Clustering & Association Rule Mining

== Taxonomy of Clustering Algorithms
Clustering is the unsupervised grouping of unlabeled objects into clusters such that objects within the same cluster possess high intra-cluster similarity, while objects across partialering clusters exhibit high inter-cluster dissimilarity.

1. *Partitioning Methods:* Construct $K$ disjoint partitions directly from data (e.g., $k$-Means, $k$-Medoids / PAM).
2. *Hierarchical Methods:* Create a nested decomposition of instances represented as a tree hierarchy (e.g., Agglomerative, Divisive).
3. *Density-Based Methods:* Form clusters based on spatial data density, discovering arbitrary-shaped clusters and filtering noise (e.g., DBSCAN, OPTICS).
4. *Model-Based / Grid-Based Methods:* Assume data is generated from a mixture of underlying probability distributions (e.g., Gaussian Mixture Models - GMM via EM algorithm).

== The $k$-Means Clustering Algorithm
$k$-Means is an iterative centroid-based partitional clustering algorithm that partitions $m$ observations into $k$ clusters.

#figure-box(
  "Figure 4.3: Iterative Centroid Convergence and Voronoi Partitioning in k-Means",
  [
    #rect(stroke: 0.5pt + rgb("#94a3b8"), fill: rgb("#ffffff"), inset: 7pt, radius: 3pt)[
      #grid(
        columns: (1fr, auto, 1fr, auto, 1fr),
        align: horizon + center,
        [#text(weight: "bold", fill: rgb("#1e3a8a"))[Initialize $k$ Centroids]\ $bold(mu)_1, ..., bold(mu)_k$ (Random / $k$-means++)],
        [#text(size: 14pt, fill: rgb("#2563eb"))[$arrow.r$]],
        [#text(weight: "bold", fill: rgb("#1e3a8a"))[Assignment Step]\ Assign each $bold(x)_i$ to nearest $bold(mu)_k$],
        [#text(size: 14pt, fill: rgb("#2563eb"))[$arrow.r$]],
        [#text(weight: "bold", fill: rgb("#1e3a8a"))[Update Step]\ $bold(mu)_k := 1 / |C_k| sum_(bold(x) in C_k) bold(x)$]
      )
    ]
  ]
)

1. *Objective Function (Within-Cluster Sum of Squares / Inertia):*
   $ J = sum_(k=1)^K sum_(bold(x)_i in C_k) ||bold(x)_i - bold(mu)_k||^2 $
   where $bold(mu)_k$ is the mathematical centroid (mean) of cluster $C_k$.
2. *Lloyd's Iterative Algorithm:*
   - *Initialization:* Select $k$ initial cluster centroids $bold(mu)_1, bold(mu)_2, ..., bold(mu)_k$ in feature space.
   - *Step 1 (Assignment Step):* Assign each observation $bold(x)_i$ to its nearest centroid according to Euclidean distance:
     $ c^((i)) = arg min_k ||bold(x)_i - bold(mu)_k||^2 $
   - *Step 2 (Update Step):* Recompute the centroid of each cluster as the arithmetic mean of all assigned points:
     $ bold(mu)_k = 1 / (|C_k|) sum_(i in C_k) bold(x)_i $
   - *Step 3 (Convergence Check):* Repeat Steps 1 and 2 until centroid positions stabilize ($||bold(mu)_k^((t+1)) - bold(mu)_k^((t))|| < epsilon$), point assignments cease changing, or maximum iterations are reached.
3. *Determining Optimal $k$:*
   - *Elbow Method:* Plots inertia $J$ against values of $k$. The "elbow" bend represents the point of diminishing marginal returns.
   - *Silhouette Coefficient ($s_i$):* Combines mean intra-cluster distance ($a_i$) with mean nearest-cluster distance ($b_i$):
     $ s_i = (b_i - a_i) / (max(a_i, b_i)) $
     - Value ranges from $-1.0$ (incorrect clustering) to $+1.0$ (highly dense and well-separated clusters), with $0$ indicating overlapping clusters.
4. *Limitations of Standard $k$-Means:*
   - Assumes spherical, equal-variance clusters; fails on elongated, concentric, or irregular manifold shapes.
   - Highly sensitive to initial random centroid placement (can get trapped in poor local optima; mitigated by *$k$-Means++*).
   - Sensitive to extreme outliers because the arithmetic mean is pulled by anomalous values.

== The $k$-Medoids Clustering Algorithm (PAM)
$k$-Medoids is a partitional clustering algorithm that selects *actual data points as cluster exemplars (medoids)* rather than virtual arithmetic means.

1. *Partitioning Around Medoids (PAM) Algorithm:*
   - Initialize $k$ actual data points as medoids.
   - Assign each non-medoid point to the closest medoid using Manhattan or arbitrary distance metrics.
   - For each medoid $m$ and each non-medoid point $p$: swap $m$ and $p$ and calculate the total cost variation ($Delta S$). If $Delta S < 0$, keep the swap.
2. *Key Advantage:* Extreme robustness to noise and outliers because medoids are central actual members rather than outlier-sensitive arithmetic means.

#table(
  columns: (1.3fr, 2.8fr, 2.8fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.even(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[k-Means Clustering]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[k-Medoids Clustering (PAM)]*]
  ),
  [*Center Representation*], [Arithmetic mean (virtual centroid point).], [Actual exemplar data point (medoid).],
  [*Distance Metric*], [Strictly Euclidean distance (squared error minimization).], [Flexible (Manhattan, Minkowski, Cosine, arbitrary).],
  [*Sensitivity to Outliers*], [High (extreme outliers distort arithmetic means).], [Low (highly robust; outliers rarely chosen as medoids).],
  [*Computational Complexity*], [$cal(O)(t k m d)$ (Linear and scalable to huge datasets).], [$cal(O)(t k (m - k)^2)$ (Computationally heavy for large $m$).]
)

== Hierarchical Clustering & Linkage Metrics
Hierarchical clustering builds a nested hierarchy of clusters visualized as a tree structure called a *Dendrogram*.

#figure-box(
  "Figure 4.4: Agglomerative Hierarchical Clustering Dendrogram and Tree Cutting",
  [
    #rect(stroke: 0.5pt + rgb("#94a3b8"), fill: rgb("#ffffff"), inset: 8pt, radius: 3pt)[
      #align(center)[
        #text(size: 8.5pt, weight: "bold", fill: rgb("#1e3a8a"))[Root Cluster: All Data Unified ({A, B, C, D, E})] \
        #v(2pt)
        #line(length: 60%, stroke: 1pt + rgb("#2563eb"))
        #v(2pt)
        #grid(
          columns: (1fr, 1fr),
          [#text(size: 8pt, fill: rgb("#0f172a"))[Branch 1: {A, B}]],
          [#text(size: 8pt, fill: rgb("#0f172a"))[Branch 2: {C, D, E}]]
        )
        #v(4pt)
        #rect(fill: rgb("#fef2f2"), stroke: 0.5pt + rgb("#dc2626"), inset: 3pt)[
          #text(size: 7.5pt, weight: "bold", fill: rgb("#991b1b"))[Horizontal Distance Cut Threshold $arrow.r$ Determines Final Number of Clusters]
        ]
      ]
    ]
  ]
)

1. *Agglomerative (Bottom-Up) vs. Divisive (Top-Down):*
   - *Agglomerative:* Starts with $m$ singleton clusters; iteratively merges the two closest clusters until 1 unified cluster remains ($cal(O)(m^3)$ or $cal(O)(m^2 log m)$).
   - *Divisive:* Starts with 1 all-inclusive root cluster; recursively splits clusters top-down.
2. *Linkage Criteria (Inter-Cluster Distance Measures):*
   - *Single Linkage (MIN / Nearest Neighbor):* Distance between the two closest points across clusters:
     $ d_"Single"(A, B) = min_(bold(x) in A, bold(z) in B) d(bold(x), bold(z)) $
     - *Characteristic:* Handles non-elliptical shapes well; highly susceptible to the *chaining effect* (forming long straggly clusters connected by single noise points).
   - *Complete Linkage (MAX / Farthest Neighbor):* Distance between the two most distant points:
     $ d_"Complete"(A, B) = max_(bold(x) in A, bold(z) in B) d(bold(x), bold(z)) $
     - *Characteristic:* Highly robust to chaining; forces compact, spherical clusters of equal diameter.
   - *Average Linkage (UPGMA):* Average distance between all pairwise combinations:
     $ d_"Average"(A, B) = 1 / (|A| dot |B|) sum_(bold(x) in A) sum_(bold(z) in B) d(bold(x), bold(z)) $
   - *Ward's Linkage (Minimum Variance):* Merges cluster pair that minimizes the total within-cluster variance increase (minimum increase in SSE).

== Association Rule Mining & The Apriori Algorithm
Association Rule Mining discovers interesting relational dependencies and co-occurrence patterns among items in transactional databases.

1. *Core Association Metrics:* For rule $X arrow.r Y$ where itemsets $X, Y subset.eq I$ and $X inter Y = emptyset$:
   - *Support:* Frequency of occurrence of itemset in database:
     $ text("Support")(X arrow.r Y) = P(X union Y) = (text("Transactions containing ") X union Y) / (text("Total Transactions ") N) $
   - *Confidence:* Conditional probability that a transaction contains $Y$ given it contains $X$:
     $ text("Confidence")(X arrow.r Y) = P(Y mid(|) X) = (text("Support")(X union Y)) / (text("Support")(X)) $
   - *Lift:* Measures the strength of a rule over random co-occurrence independence:
     $ text("Lift")(X arrow.r Y) = (text("Confidence")(X arrow.r Y)) / (text("Support")(Y)) = (P(X union Y)) / (P(X) dot P(Y)) $
     - $text("Lift") > 1.0$: Positive correlation (items appear together more often than chance).
     - $text("Lift") = 1.0$: Statistical independence.
     - $text("Lift") < 1.0$: Negative correlation (substitution effect).
2. *The Apriori Algorithm & Downward Closure Property:*
   - *Apriori Principle:* Any subset of a frequent itemset must also be frequent ($forall S subset.eq X$, if $text("Support")(X) >= text("min_sup")$, then $text("Support")(S) >= text("min_sup")$).
   - *Pruning Property:* If an itemset is infrequent, all of its supersets are immediately pruned without database scanning.
   - *Level-wise Iteration:* Generates candidate $k$-itemsets ($C_k$) from frequent $(k-1)$-itemsets ($L_(k-1)$), prunes infrequent candidates, and scans database until no larger frequent itemsets can be formed.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/M2-Machine_Learning_By_Ethem_Alpaydin_.pdf#page=155")[Source: Alpaydin, Ch 7, p. 137-160] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/chapman-hall_crc-machine-learning-pattern-recognition-stephen-marsland-machine-learning_-an-algorithmic-perspective-second-edition-2014-chapman-and-hall_crc.pdf#page=295")[Source: Marsland, Ch 14, p. 281-305] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/Introduction to Machine Learning with Python ( PDFDrive.com )-min.pdf#page=175")[Source: Müller & Guido, Ch 3, p. 165-200]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 4
// ==========================================
= Ensemble Learning: Bagging, Random Forest, Boosting & Stacking

== Foundational Concepts of Ensemble Learning
Ensemble learning combines the predictions of multiple individual base estimators (weak learners) to produce a unified meta-model with superior generalization, robustness, and stability.

1. *Condorcet's Jury Theorem:* If each individual base classifier operates with an independent probability $p > 0.5$ of being correct, the cumulative probability that a majority vote of $M$ diverse classifiers is correct approaches $1.0$ as $M -> infinity$.
2. *Base Learners:*
   - *Weak Learner:* An algorithm that performs only slightly better than random guessing (e.g., shallow decision trees / decision stumps with accuracy $approx 55\%$).
   - *Strong Learner:* An algorithm with arbitrarily high accuracy achieved through ensemble combination.
3. *Homogeneous vs. Heterogeneous Ensembles:*
   - *Homogeneous:* Employs identical base algorithm across all learners with varying data subsets (e.g., Random Forest using Decision Trees).
   - *Heterogeneous:* Combines fundamentally partialering model architectures (e.g., Stacking k-NN, Logistic Regression, and SVM).

#figure-box(
  "Figure 4.5: Ensemble Learning Architectures (Bagging vs Boosting vs Stacking)",
  [
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 10pt,
      [
        #rect(stroke: 1pt + rgb("#1d4ed8"), fill: rgb("#eff6ff"), inset: 6pt, radius: 3pt)[
          #text(weight: "bold", fill: rgb("#1e3a8a"))[Bagging (Parallel)]\
          #v(2pt)
          #text(size: 7.5pt, fill: rgb("#334155"))[- Bootstrap data samples\ - Train trees in parallel\ - Majority vote / Average\ - *Reduces Variance*]
        ]
      ],
      [
        #rect(stroke: 1pt + rgb("#b91c1c"), fill: rgb("#fef2f2"), inset: 6pt, radius: 3pt)[
          #text(weight: "bold", fill: rgb("#991b1b"))[Boosting (Sequential)]\
          #v(2pt)
          #text(size: 7.5pt, fill: rgb("#334155"))[- Train models sequentially\ - Reweight misclassified data\ - Weighted vote combination\ - *Reduces Bias*]
        ]
      ],
      [
        #rect(stroke: 1pt + rgb("#059669"), fill: rgb("#ecfdf5"), inset: 6pt, radius: 3pt)[
          #text(weight: "bold", fill: rgb("#065f46"))[Stacking (Meta-Model)]\
          #v(2pt)
          #text(size: 7.5pt, fill: rgb("#334155"))[- Train diverse Level-0 models\ - Level-0 outputs form Level-1 data\ - Level-1 model meta-learns\ - *Reduces Bias & Variance*]
        ]
      ]
    )
  ]
)

== Bootstrap Aggregating (Bagging) & Random Forest

1. *Bagging (Bootstrap Aggregation):*
   - Generates $B$ distinct training sets of size $m$ by sampling from original dataset $D$ *uniformly with replacement* (Bootstrap Sampling).
   - Each bootstrap sample contains approximately $1 - 1/e approx 63.2\%$ of original instances; the remaining $36.8\%$ form the *Out-of-Bag (OOB)* validation set.
   - Trains an independent base estimator $h_b(bold(x))$ on each bootstrap set in parallel.
   - Aggregates final predictions via majority voting (classification) or simple averaging (regression):
     $ hat(y) = 1 / B sum_(b=1)^B h_b(bold(x)) $
   - *Primary Impact:* Drastically reduces model *variance* without increasing bias.
2. *Random Forest Algorithm:*
   Random Forest enhances Bagging by introducing *Random Feature Subspace Sampling (Feature Bagging)* to de-correlate individual decision trees:
   - At each split candidate node in a tree, randomly select a subset of $k$ features from total $d$ features (standard default: $k = sqrt(d)$ for classification, $k = d/3$ for regression).
   - Split node using only the best feature from the chosen $k$-feature subset.
   - Fully grown trees without pruning have low bias; averaging across de-correlated trees minimizes ensemble variance:
     $ text("Var")("Ensemble") = rho sigma^2 + (1 - rho) / B sigma^2 $
     where $rho$ is pairwise tree correlation. As $rho -> 0$, ensemble variance approaches $0$.
3. *Feature Importance Metrics:*
   - *Mean Decrease in Impurity (MDI / Gini Importance):* Total Gini impurity reduction brought by a feature across all trees.
   - *Permutation Importance (Mean Decrease Accuracy - MDA):* Measures drop in OOB score when feature values are randomly shuffled.

== Boosting Algorithms: AdaBoost & Gradient Boosting
Boosting builds an ensemble sequentially, where each new weak learner is explicitly trained to correct the residual errors made by preceding models.

1. *AdaBoost (Adaptive Boosting) Formulation:*
   - *Step 1:* Initialize sample weights uniformly: $w_i^((1)) = 1 / m$ for all $i = 1, ..., m$.
   - *Step 2:* For iteration $t = 1$ to $T$:
     - Train base classifier $h_t(bold(x))$ using sample weights $bold(w)^((t))$.
     - Compute weighted training error rate:
       $ epsilon_t = sum_(i=1)^m w_i^((t)) dot bb(I)(h_t(bold(x)^((i))) != y^((i))) $
     - Calculate classifier importance weight $alpha_t$:
       $ alpha_t = 1 / 2 ln((1 - epsilon_t) / epsilon_t) $
     - Update sample weights: increases weights of misclassified instances, decreases weights of correctly classified instances:
       $ w_i^((t+1)) = (w_i^((t)) exp(- alpha_t y^((i)) h_t(bold(x)^((i))))) / (Z_t) $
       where $Z_t$ is a normalization factor ensuring $sum w_i^((t+1)) = 1$.
   - *Step 3 (Final Output):* Compute weighted sign majority:
     $ H(bold(x)) = text("sign")(sum_(t=1)^T alpha_t h_t(bold(x))) $
2. *Gradient Boosting Machines (GBM):*
   - Fits each new base model directly to the *pseudo-residuals (negative gradient of loss function)* of previous ensemble:
     $ r_(i, t) = - [ frac(partial L(y_i, f(bold(x)_i)), partial f(bold(x)_i)) ]_(f(bold(x)) = f_(t-1)(bold(x))) $
   - State-of-the-art scalable implementations include *XGBoost* (incorporates second-order Taylor expansion and tree complexity regularization), *LightGBM* (histogram-based bucketing and leaf-wise tree growth), and *CatBoost* (native categorical feature handling).

== Stacked Generalization (Stacking)
Stacking is a meta-learning ensemble technique where predictions of heterogeneous base models are used as training features for a meta-classifier.

1. *Two-Tier Architecture:*
   - *Level-0 (Base Estimators):* Diverse algorithms (e.g., Random Forest, SVM, k-NN, Logistic Regression) trained on the original dataset.
   - *Level-1 (Meta-Learner):* A secondary model (typically Logistic Regression or Ridge) trained on the prediction matrix of Level-0 models.
2. *Out-of-Fold (OOF) Prediction Pipeline:* To prevent catastrophic target leakage into Level-1, Level-0 predictions are generated strictly using $K$-Fold Cross Validation: Level-1 features for fold $k$ are predicted by models trained on the other $K-1$ folds.

#table(
  columns: (1.2fr, 2.1fr, 2.1fr, 2.1fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.even(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Bagging (e.g., Random Forest)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Boosting (e.g., AdaBoost/GBM)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Stacking (Meta-Learner)]*]
  ),
  [*Training Scheme*], [Parallel and independent.], [Sequential and dependent on errors.], [Two-tiered (Base models then Meta-model).],
  [*Base Learners*], [Homogeneous high-variance models (Deep Trees).], [Homogeneous high-bias models (Shallow Trees).], [Heterogeneous diverse model families (SVM, Trees, kNN).],
  [*Aggregation Method*], [Simple majority vote / arithmetic average.], [Weighted majority vote according to $alpha_t$.], [Meta-model learns optimal combination weights.],
  [*Primary Error Goal*], [Variance reduction (eliminates overfitting).], [Bias reduction (builds high accuracy from weak rules).], [Both Bias & Variance reduction via diverse architectures.],
  [*Parallelizability*], [High (each tree trains independently).], [Low (inherently sequential iteration).], [High at Level-0, sequential at Level-1.]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/M2-Machine_Learning_By_Ethem_Alpaydin_.pdf#page=430")[Source: Alpaydin, Ch 17, p. 419-446] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/chapman-hall_crc-machine-learning-pattern-recognition-stephen-marsland-machine-learning_-an-algorithmic-perspective-second-edition-2014-chapman-and-hall_crc.pdf#page=280")[Source: Marsland, Ch 13, p. 267-280] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/Introduction to Machine Learning with Python ( PDFDrive.com )-min.pdf#page=95")[Source: Müller & Guido, Ch 2, p. 83-92] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=740")[Source: Russell & Norvig, Ch 19, p. 726-735]
