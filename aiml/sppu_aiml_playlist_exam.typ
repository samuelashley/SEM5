// Typst Playlist Mapping - Artificial Intelligence & Machine Learning
// Course Code: PCC-302-IT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[AI & MACHINE LEARNING — PLAYLIST MAPPING]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Gate Smashers Exam Guide]]
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
  fill: rgb("#0f172a")
)

#set par(
  justify: true,
  leading: 0.65em
)

#set heading(numbering: none)

// Styling headings - Royal Blue & Navy Scheme (Option 4)
#show heading: set text(fill: rgb("#0f172a"))
#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (left: 4pt + rgb("#1d4ed8")),
  inset: (left: 10pt, y: 7pt),
  fill: rgb("#eff6ff"),
  radius: (right: 4pt),
  text(fill: rgb("#0f172a"), size: 12.5pt, weight: "bold")[#it.body]
)

#show heading.where(level: 2): it => block(
  width: 100%,
  inset: (y: 5pt),
  text(fill: rgb("#2563eb"), size: 11pt, weight: "bold")[#it.body]
)

// Title Header Page 1
#align(left)[
  #text(size: 9pt, fill: rgb("#1d4ed8"), weight: "bold")[SPPU AI & MACHINE LEARNING EXAM-FOCUSED PLAYLIST MAPPING]   #v(2pt)
  #text(size: 16pt, fill: rgb("#0f172a"), weight: "bold")[Gate Smashers AI & ML Playlist Exam Mapping Guide]
]

#v(4pt)
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
      [#text(weight: "bold", fill: rgb("#0f172a"))[Document Type:] Exam Playlist Mapping],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Code:] PCC-302-IT]
    )
  ]
)

#v(4pt)
#line(length: 100%, stroke: 1.5pt + rgb("#1d4ed8"))
#v(4pt)

=== Introduction and Purpose
This document provides an exam-focused, structured mapping of the Gate Smashers Artificial Intelligence and Machine Learning YouTube playlists to the official SPPU TE IT (2024 Pattern) Artificial Intelligence & Machine Learning Syllabus (PCC-302-IT). It classifies 102 core lectures from both official playlists into the five syllabus units.

- *Artificial Intelligence Playlist:* #link("https://www.youtube.com/playlist?list=PLxCzCOWd7aiHGhOHV-nwb0HR5US5GFKFI")[Gate Smashers AI Playlist ↗]
- *Machine Learning Playlist:* #link("https://www.youtube.com/playlist?list=PLxCzCOWd7aiEXg5BV10k9THtjnS48yI-T")[Gate Smashers ML Playlist ↗]

#rect(
  width: 100%,
  stroke: (left: 4pt + rgb("#1d4ed8")),
  fill: rgb("#eff6ff"),
  inset: 8pt,
  radius: (right: 4pt),
  [
    *Exam Preparation Note:* Lectures highlighted in *bold* represent high-priority exam topics explicitly tested in SPPU end-semester exams and fully aligned with the unit-wise theory notes (such as Turing Test, A\* Search, Hill Climbing, Propositional/Predicate Logic, Linear/Logistic Regression, Decision Trees, SVM, k-Means, PCA, and Neural Networks). Focus on these lectures first for maximum marks!
  ]
)

#v(4pt)
=== Quick Statistics:
- *Total Mapped Playlist Videos:* 102 (Total Duration: 16h 44m)
- *Unit 1 (Introduction to AI and Intelligent Agents):* 11 Videos (1h 28m)
- *Unit 2 (Problem Solving, Search & Knowledge Representation):* 26 Videos (4h 34m)
- *Unit 3 (Machine Learning Foundations & Supervised Learning):* 21 Videos (3h 36m)
- *Unit 4 (Unsupervised Learning, Ensemble Methods & Preprocessing):* 20 Videos (2h 46m)
- *Unit 5 (Neural Networks, Deep Learning & Advanced AI):* 24 Videos (4h 18m)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 1: Introduction to AI and Intelligent Agents (1h 28m)
_Syllabus Topics Covered: Definitions of AI, Turing Test, History & Evolution, ANI/AGI/ASI, AI vs ML vs DL vs DS, Intelligent Agents (Sensors, Actuators, Percept sequence), Rationality, PEAS Framework, 7 Environment dimensions, 5 Agent Architectures, Applications & Ethics._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [Lec-1: Artificial Intelligence Syllabus Discussion and Analysis  for NTA UGC NET], [11:26], [#link("https://www.youtube.com/watch?v=uB3i-qV6VdM")[Play ↗]],
  [Lec-2: What's the FUTURE of Artificial Intelligence in 2025], [4:30], [#link("https://www.youtube.com/watch?v=gm5DcqzZ3f4")[Play ↗]],
  [*Lec-3: What is Artificial Intelligence | Learn AI with Real Life Examples | Can Machine Think??*], [8:31], [#link("https://www.youtube.com/watch?v=s-s9ilkMVj8")[Play ↗]],
  [*Lec-28: Introduction to Intelligent Agents and their types with Example in Artificial Intelligence*], [11:10], [#link("https://www.youtube.com/watch?v=BkedAnQfJ_U")[Play ↗]],
  [*Lec-29: Simple Reflex Agent in Artificial Intelligence with Example | Artificial Intelligence*], [9:04], [#link("https://www.youtube.com/watch?v=KZFfbebQPAU")[Play ↗]],
  [*Lec-30: Model Based Reflex Agent in Artificial Intelligence in HINDI with Real Life Examples*], [7:15], [#link("https://www.youtube.com/watch?v=xKxh3fQwU8E")[Play ↗]],
  [*Lec-31: Goal Based Agents in Artificial Intelligence with real life examples in HINDI*], [5:28], [#link("https://www.youtube.com/watch?v=HsdiMkKnNLk")[Play ↗]],
  [*Lec-32: Utility Based Agents in Artificial Intelligence in Hindi with real life examples*], [5:35], [#link("https://www.youtube.com/watch?v=e-egxFtAF_4")[Play ↗]],
  [*Lec-37: Supervised, Unsupervised and Reinforcement Learning in Artificial Intelligence in Hindi*], [9:28], [#link("https://www.youtube.com/watch?v=4dwsSz_fNSQ")[Play ↗]],
  [*Lec-1: Introduction to Data Science & ML | Roadmap to Learn Data Science & ML*], [8:24], [#link("https://www.youtube.com/watch?v=kz184QIO4ZQ")[Play ↗]],
  [*Lec-23: Supervised vs Unsupervised learning with real life example*], [7:31], [#link("https://www.youtube.com/watch?v=fM8XdC1EweU")[Play ↗]],
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 2: Problem Solving, Search and Knowledge Representation (4h 34m)
_Syllabus Topics Covered: Problem Formulation, State Space, 8-Puzzle, Uninformed Search (BFS, DFS, UCS), Informed Search (Heuristics, Greedy Best-First, A\* Search, Admissibility & Consistency), Local Search & Hill Climbing (Local Maxima, Ridges, Plateaux), Knowledge Representation, Propositional & Predicate Logic (Quantifiers, WFF), Forward & Backward Chaining, Expert Systems._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [*Lec-4: What is State Space Search | Introduction to Problem Solving in Artificial Intelligence*], [10:47], [#link("https://www.youtube.com/watch?v=E5jVBqe59EE")[Play ↗]],
  [*Lec-5: Uninformed Vs Informed Search in Artificial Intelligence with Example*], [8:17], [#link("https://www.youtube.com/watch?v=gZpUcsB9TFc")[Play ↗]],
  [Lec-6: Informed vs Uninformed vs Adversarial Search With Examples | Artificial Intelligence], [6:23], [#link("https://www.youtube.com/watch?v=YatDNnaJ1TU")[Play ↗]],
  [*Lec-7: Breadth First Search (BFS) with example | Uninformed Search | Artificial Intelligence*], [12:57], [#link("https://www.youtube.com/watch?v=qul0f79gxGs")[Play ↗]],
  [*Lec-8: Depth First Search (DFS) with example | Uninformed Search | Artificial Intelligence*], [9:13], [#link("https://www.youtube.com/watch?v=f8luGFRtshY")[Play ↗]],
  [*Lec-9: Time & Space Complexity of BFS and DFS | Artificial Intelligence*], [7:58], [#link("https://www.youtube.com/watch?v=_Ky9w2zF8JM")[Play ↗]],
  [Lec-10: Bidirectional Search Algorithm in Artificial Intelligence in Hindi with Real Life Examples], [8:47], [#link("https://www.youtube.com/watch?v=rEema9uQ02c")[Play ↗]],
  [*Lec-11: Best First Search Algorithm | How it Works | All Imp Points(Pros & Cons)*], [14:41], [#link("https://www.youtube.com/watch?v=7ffDUDjwz5E")[Play ↗]],
  [Lec-12: Depth-Limited Search (DLS) Explained | Uninformed Search in AI], [13:11], [#link("https://www.youtube.com/watch?v=jbw6nWFWxDk")[Play ↗]],
  [Lec-13: Iterative Deepening Depth-First Search (IDDFS) | Artificial Intelligence], [5:11], [#link("https://www.youtube.com/watch?v=0-vP781wblQ")[Play ↗]],
  [*Lec-14: 8-Puzzle Problem in Artificial Intelligence without Heuristic | All Imp Points | Must Watch*], [11:05], [#link("https://www.youtube.com/watch?v=_CrEYrcImv0")[Play ↗]],
  [*Lec-15: What is Heuristic in AI | Why we use Heuristic | How to Calculate Heuristic | Must Watch*], [12:57], [#link("https://www.youtube.com/watch?v=5F9YzkpnaRw")[Play ↗]],
  [*Lec-16: How to Solve 8-Puzzle Problem with Heuristic(Informed Search) in Artificial Intelligence*], [11:07], [#link("https://www.youtube.com/watch?v=nmWGhb9E4es")[Play ↗]],
  [Lec-17: Generate and Test Search in Artificial Intelligence with Examples | Heuristic Search], [7:58], [#link("https://www.youtube.com/watch?v=h-AfcPvpld4")[Play ↗]],
  [Lec-18: Beam Search Algorithm | All Imp Points | Heuristic Search Techniques], [12:02], [#link("https://www.youtube.com/watch?v=jhoXO1XF6Fk")[Play ↗]],
  [*Lec-19: Hill Climbing Algorithm in Artificial Intelligence with Real Life Examples| Heuristic Search*], [10:14], [#link("https://www.youtube.com/watch?v=3SiWtAnUROs")[Play ↗]],
  [*Lec-20: A\* algorithm in AI (artificial intelligence) in HINDI | A\* algorithm with example*], [14:34], [#link("https://www.youtube.com/watch?v=tvAh0JZF2YE")[Play ↗]],
  [*Lec-21: How to Proof A\* Admissible| Underestimation & Overestimation of A\* in Hindi*], [12:25], [#link("https://www.youtube.com/watch?v=xz1Nq6cZejI")[Play ↗]],
  [Lec-22: AO\* algorithm in AI (artificial intelligence) in HINDI | AO\* algorithm with example], [13:24], [#link("https://www.youtube.com/watch?v=u_TE42-uWD0")[Play ↗]],
  [*Lec-26: Knowledge Representation and Reasoning | Logic, Semantic Net, Frames etc.*], [7:44], [#link("https://www.youtube.com/watch?v=9iN3O_oL2ac")[Play ↗]],
  [*Lec-27: Propositional Logic in Artificial Intelligence | Knowledge Representation | All Imp Points*], [12:20], [#link("https://www.youtube.com/watch?v=6490tKrGEic")[Play ↗]],
  [*Lec-43: Propositional Logic | Artificial Intelligence*], [11:47], [#link("https://www.youtube.com/watch?v=519FvcUQqYU")[Play ↗]],
  [*Lec-44: Predicate Logic | Artificial Intelligence*], [10:11], [#link("https://www.youtube.com/watch?v=FpGeg27Ffk8")[Play ↗]],
  [*Lec-45: How to write First order/Predicate logic | Artificial Intelligence*], [9:24], [#link("https://www.youtube.com/watch?v=Aw3EOSr64j0")[Play ↗]],
  [Lec-46: Negation of Quantifiers | Predicate Logic | Logic with Certainty | Artificial Intelligence], [7:05], [#link("https://www.youtube.com/watch?v=XYfTz5gziBk")[Play ↗]],
  [*Lec-47: Questions on Propositional & Predicate logic | How to Solve Problems in Logic*], [12:46], [#link("https://www.youtube.com/watch?v=TD7DilUtUvE")[Play ↗]],
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 3: Machine Learning Foundations & Supervised Learning (3h 36m)
_Syllabus Topics Covered: Supervised vs Unsupervised Learning, Regression Models (Linear, Multiple, Ridge, Lasso, Logistic), Classification Algorithms (kNN, Naive Bayes, Decision Trees ID3, SVMs), Model Evaluation Metrics (MSE, Bias-Variance Tradeoff, Overfitting/Underfitting), Cross-Validation (K-Fold, LOOCV)._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [*Lec-2: Supervised Learning Algorithms | Machine Learning*], [8:50], [#link("https://www.youtube.com/watch?v=LKlOH8OLLcw")[Play ↗]],
  [*Lec-3: Introduction to Regression with Real Life Examples*], [7:19], [#link("https://www.youtube.com/watch?v=cHT-qLnRm0E")[Play ↗]],
  [*Lec-4: Linear Regression📈 with Real life examples & Calculations | Easiest Explanation*], [11:01], [#link("https://www.youtube.com/watch?v=zUQr6HAAKp4")[Play ↗]],
  [*Lec-5: Logistic Regression with Simplest & Easiest Example | Machine Learning*], [10:01], [#link("https://www.youtube.com/watch?v=r8OjlgWpAI0")[Play ↗]],
  [*Lec-6: Linear Regression Vs. Logistic Regression | Supervised Learning | Machine Learning*], [4:37], [#link("https://www.youtube.com/watch?v=BVP1EDKb6_g")[Play ↗]],
  [*Lec-7: kNN Classification with Real Life Example | Movie Imdb Example | Supervised Learning*], [10:13], [#link("https://www.youtube.com/watch?v=O1nWXTXcCwI")[Play ↗]],
  [*Lec-8: Naive Bayes Classification Full Explanation with examples | Supervised Learning*], [13:31], [#link("https://www.youtube.com/watch?v=GBMMtXRiQX0")[Play ↗]],
  [*Lec-9: Introduction to Decision Tree 🌲 with Real life examples*], [6:07], [#link("https://www.youtube.com/watch?v=mvveVcbHynE")[Play ↗]],
  [*Lec-10: Decision Tree 🌲 ID3 Algorithm with Example & Calculations 🧮*], [16:38], [#link("https://www.youtube.com/watch?v=CWzpomtLqqs")[Play ↗]],
  [Lec-19: kNN for Classified & Regression with Easiest Explanation | Machine Learning 🤖🙇], [7:21], [#link("https://www.youtube.com/watch?v=zqQ_pi6j2jE")[Play ↗]],
  [*Lec-26: Cross Validation in Machine Learning with Examples*], [6:51], [#link("https://www.youtube.com/watch?v=v6DtYYafrWQ")[Play ↗]],
  [*Lec-28: kNN(k Nearest Neighbour) Numerical Example | Supervised Learning | Machine Learning*], [9:09], [#link("https://www.youtube.com/watch?v=mjoAoX--2fg")[Play ↗]],
  [*Lec-29: Decision Tree 🌳 Example | Calculate Entropy, Information ℹ️ Gain | Supervised Learning*], [6:57], [#link("https://www.youtube.com/watch?v=DnhVLfjlGXE")[Play ↗]],
  [*Lec-37: Ridge and Lasso Regression | Machine Learning*], [14:10], [#link("https://www.youtube.com/watch?v=9hU2RZ_Y3DA")[Play ↗]],
  [*Lec-38: Mean Squared Error (MSE) | Machine learning*], [9:53], [#link("https://www.youtube.com/watch?v=nuVFE_KaEz4")[Play ↗]],
  [*Lec-39: Multiple Linear Regression (MLR) | Machine Learning*], [12:48], [#link("https://www.youtube.com/watch?v=5nJHkOePfcA")[Play ↗]],
  [*Lec-40: Support Vector Machines (SVMs) | Machine Learning*], [10:23], [#link("https://www.youtube.com/watch?v=NDqACjz5j8g")[Play ↗]],
  [*Lec-41: Numerical Explanation on SVM | How Support Vector Machine Algorithm Works*], [16:07], [#link("https://www.youtube.com/watch?v=BpcDcvARbUQ")[Play ↗]],
  [*Lec-43: Bias & Variance Tradeoff Explained: How to Fix Overfitting & Underfitting?*], [14:44], [#link("https://www.youtube.com/watch?v=O-qONAxkvK0")[Play ↗]],
  [*Lec-44: K-Fold Cross Validation in Machine Learning*], [9:52], [#link("https://www.youtube.com/watch?v=tYMMgwp3D10")[Play ↗]],
  [Lec-45: Leave-One-Out Cross Validation (LOOCV) Explained with Example | Machine Learning], [9:36], [#link("https://www.youtube.com/watch?v=4tIrEho8UJo")[Play ↗]],
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 4: Unsupervised Learning, Ensemble Methods & Preprocessing (2h 46m)
_Syllabus Topics Covered: Clustering Algorithms (k-Means, k-Medoids, Agglomerative & Divisive Hierarchical Clustering, Single/Complete Linkage), Ensemble Learning (Bagging, Random Forest, Boosting, Stacking), Feature Engineering & Dimensionality Reduction (PCA, LDA, Pearson Correlation), Data Preprocessing (Missing value imputation, kNN imputation, Fit/Transform)._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [*Lec-12: Introduction to Ensemble Learning with Real Life Examples | Machine⚙️ Learning*], [5:58], [#link("https://www.youtube.com/watch?v=qQjOWmf8I_I")[Play ↗]],
  [*Lec-13: K-mean Clustering with Numerical Example | Unsupervised Learning | Machine🖥️ Learning 🙇‍♂️🙇*], [7:51], [#link("https://www.youtube.com/watch?v=5FpsGnkbEpM")[Play ↗]],
  [*Lec-14: Hierarchical Clustering | Agglomerative vs Divisive with examples*], [6:06], [#link("https://www.youtube.com/watch?v=zxQF8Rmpk1M")[Play ↗]],
  [Lec-15: Single Linkage Clustering | Agglomerative Clustering | Hierarchical Clustering], [6:16], [#link("https://www.youtube.com/watch?v=pbTQQCA9Xs0")[Play ↗]],
  [Lec-16: Complete Linkage⛓️ Clustering with Example | Clustering in Unsupervised Learning | ML], [9:05], [#link("https://www.youtube.com/watch?v=Ufzq9oLhzX0")[Play ↗]],
  [*Lec-17: K-medoids Clustering with Numerical Example | Machine Learning*], [11:53], [#link("https://www.youtube.com/watch?v=FosEwkYIGmU")[Play ↗]],
  [*Lec-18: Random Forest 🌳 in Machine Learning 🧑‍💻👩‍💻*], [8:33], [#link("https://www.youtube.com/watch?v=DXqxXe3rep0")[Play ↗]],
  [*Lec-22: Bagging/Bootstrap Aggregating in Machine Learning with examples*], [4:56], [#link("https://www.youtube.com/watch?v=Oq27arfMwA0")[Play ↗]],
  [*Lec-24: How Weights are Increased in Boosting | Ensemble Learning*], [6:48], [#link("https://www.youtube.com/watch?v=nr7gNJ95geI")[Play ↗]],
  [*Lec-25: BAGGING vs. BOOSTING vs STACKING in Ensemble Learning | Machine Learning*], [6:22], [#link("https://www.youtube.com/watch?v=j9jGLwPa6_E")[Play ↗]],
  [*Lec-27: Pearson's Correlation Coefficient | Supervised Learning | Data Science & Machine Learning*], [7:38], [#link("https://www.youtube.com/watch?v=9Zzqb82lkcU")[Play ↗]],
  [Lec-30: Single Linkage Clustering Example | Unsupervised Learning | Machine Learning], [6:52], [#link("https://www.youtube.com/watch?v=CcPzgFFE_pY")[Play ↗]],
  [*Lec-32: What is Data Preprocessing & Data Cleaning | Various Techniques with Example*], [5:53], [#link("https://www.youtube.com/watch?v=tDu_KIlXaB0")[Play ↗]],
  [*Lec-33: How to Deal with Missing Values in DataSet | Data Preprocessing & Data Cleaning*], [9:27], [#link("https://www.youtube.com/watch?v=KfC7VfDfn8I")[Play ↗]],
  [*Lec-34: kNN Imputation with Examples | Data Preprocessing and Data Cleaning 🧹*], [7:51], [#link("https://www.youtube.com/watch?v=bRWNJjzrZ-w")[Play ↗]],
  [Lec-35: Fit() & Transform() Method | Data Preprocessing | Machine Learning], [6:36], [#link("https://www.youtube.com/watch?v=f3n-SZzPu7U")[Play ↗]],
  [*Lec-36: Feature Extraction in Data preprocessing | Machine Learning*], [9:21], [#link("https://www.youtube.com/watch?v=lzWcVVCXMfo")[Play ↗]],
  [*Lec-42: Linear Discriminant Analysis (LDA) | Machine Learning*], [13:21], [#link("https://www.youtube.com/watch?v=9LO-bj1jyz4")[Play ↗]],
  [*Lec-46: Principal Component Analysis (PCA) Explained | Machine Learning*], [14:06], [#link("https://www.youtube.com/watch?v=Dv-Kk7PDEas")[Play ↗]],
  [Lec-47: How to update cost in K-Medoid Clustering | Machine Learning], [12:05], [#link("https://www.youtube.com/watch?v=eZEifQcy7X8")[Play ↗]],
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 5: Neural Networks, Deep Learning & Advanced AI (4h 18m)
_Syllabus Topics Covered: Artificial Neural Networks (Single Layer Perceptron, Multilayer Perceptron MLP), Fuzzy Logic & NLP, Constraint Satisfaction Problems (CSP, Backtracking, Branch & Bound, 0/1 Knapsack), Probabilistic Reasoning under Uncertainty (Bayesian Networks, Likelihood Weight Sampling, Rejection Sampling, Markov Models, Hidden Markov Models HMM), Modern LLMs & Transformer Parameters._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [Lec-33: Fuzzy Logic in Artificial Intelligence with Example | Artificial Intelligence], [13:03], [#link("https://www.youtube.com/watch?v=vof2vhfqoBo")[Play ↗]],
  [Lec-34: Various Operations in Fuzzy Logic with Example | Union, Intersection, Complement etc.], [13:02], [#link("https://www.youtube.com/watch?v=o-2O4fmIu3E")[Play ↗]],
  [*Lec-35: Introduction to Neural Networks with Example in HINDI | Artificial Intelligence*], [11:20], [#link("https://www.youtube.com/watch?v=EYeF2e2IKEo")[Play ↗]],
  [*Lec-36: Natural Language Processing in Artificial Intelligence in Hindi | NLP with Demo and Examples*], [17:18], [#link("https://www.youtube.com/watch?v=bPpwZxasJo0")[Play ↗]],
  [Lec-38: Genetic Algorithm in Artificial Intelligence | Simplest Explanation with real life examples], [12:24], [#link("https://www.youtube.com/watch?v=96-u9s6D16k")[Play ↗]],
  [*Lec-39: What is Constraint Satisfaction | Constraint Satisfaction Problem (CSP) in AI with Example*], [8:11], [#link("https://www.youtube.com/watch?v=AgyCSmDVk5s")[Play ↗]],
  [*Lec-40: How Constraint Satisfaction Algorithm Works | Explained with Interesting Example | AI*], [10:40], [#link("https://www.youtube.com/watch?v=udOfKqeLVSg")[Play ↗]],
  [*Lec-41: Branch & Bound Algorithm with Example | Easiest Explanation of B&B with example*], [13:13], [#link("https://www.youtube.com/watch?v=XZbrmetb9VE")[Play ↗]],
  [*Lec-42 : 0/1 Knapsack using Branch and Bound with example*], [11:20], [#link("https://www.youtube.com/watch?v=CwM-Mv0Bm4Y")[Play ↗]],
  [*Lec-48: Bayes Theorem & Total Probability with Examples*], [7:16], [#link("https://www.youtube.com/watch?v=SktJqrYereQ")[Play ↗]],
  [*Lec-49 : Network with Examples | Easiest Explanation*], [9:54], [#link("https://www.youtube.com/watch?v=DVnubVOjZtg")[Play ↗]],
  [*Lec-50: Question on Bayesian Network | Artificial Intelligence*], [7:47], [#link("https://www.youtube.com/watch?v=xDyMuT9BliI")[Play ↗]],
  [*Lec-51: Bayesian Network Numerical Example \#gate2025preparation*], [7:10], [#link("https://www.youtube.com/watch?v=zLlKc8AePIQ")[Play ↗]],
  [Lec-52: Probabilistic Inference | Sampling | Artificial Intelligence], [8:06], [#link("https://www.youtube.com/watch?v=kGlR6gBIjTk")[Play ↗]],
  [*Lec-53: Likelihood Weight Sampling | Inference through Sampling | Uncertainty in Artificial*], [9:08], [#link("https://www.youtube.com/watch?v=D4x0NB5cKGE")[Play ↗]],
  [Lec-54: Question on Likelihood Sampling | Probabilistic Inference | Sampling | Artificial], [8:07], [#link("https://www.youtube.com/watch?v=kWyFuJWGYdc")[Play ↗]],
  [Lec-55: Rejection Sampling | Probabilistic Inference | Sampling | Artificial Intelligence], [6:29], [#link("https://www.youtube.com/watch?v=ilmJD8tRg-Q")[Play ↗]],
  [*Lec-56: Reasoning under Uncertainty in Artificial Intelligence*], [8:28], [#link("https://www.youtube.com/watch?v=MIf5shIfsj8")[Play ↗]],
  [*Lec-57: Uncertainty probabilistic inference (Markov Model) | Artificial Intelligence*], [14:15], [#link("https://www.youtube.com/watch?v=6eKQnSf7atA")[Play ↗]],
  [*Lec-58: Introduction to Hidden Markov Model | Artificial Intelligence*], [13:49], [#link("https://www.youtube.com/watch?v=GIuaPCWXy0Q")[Play ↗]],
  [*Lec-31: Token & Parameters in LLama3 META Models | 8B & 70B Parameters Model | GPT model*], [7:09], [#link("https://www.youtube.com/watch?v=UcFhiOtNHsQ")[Play ↗]],
  [*Lec-48: Perceptron Learning in ANN | Single Layer Perceptron Model*], [15:04], [#link("https://www.youtube.com/watch?v=rvxd13IHx1Y")[Play ↗]],
  [*Lec-49: What is Multilayer Perceptron (MLP)? | How It Works in Machine Learning*], [12:56], [#link("https://www.youtube.com/watch?v=BPOl4_vN3IM")[Play ↗]],
  [*Lec-50: Single Layer Neural Network | Machine Learning*], [12:03], [#link("https://www.youtube.com/watch?v=qjMmMmwTOKI")[Play ↗]],
)
