// Typst Theory Notes - Artificial Intelligence & Machine Learning (Unit 1)
// Course Code: PCC-302-IT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[ARTIFICIAL INTELLIGENCE & ML — UNIT 1]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Introduction to AI & Intelligent Agents]]
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

// Styling headings - Royal Blue & Navy Scheme (Option 4)
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

// Title Header Page 1
#align(left)[
  #text(size: 9pt, fill: rgb("#1d4ed8"), weight: "bold")[ARTIFICIAL INTELLIGENCE & MACHINE LEARNING (TE IT - 2024 Pattern)] \
  #v(2pt)
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 1: INTRODUCTION TO AI AND INTELLIGENT AGENTS]
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
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 1.

#table(
  columns: (1.5fr, 3fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 7pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Syllabus Topic]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[In-Depth Exam Coverage]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Priority / Weightage]*]
  ),
  [*Intro to AI & Turing Test*], [Definitions of AI (4 quadrants), Foundations of AI, Turing Test & Total Turing Test requirements.], [High Priority \ (6-8 Marks Qs)],
  [*History & Types of AI*], [Evolution eras (Dartmouth 1956 to LLMs), Narrow AI (ANI) vs General AI (AGI) vs Super AI (ASI).], [Medium Priority \ (4-6 Marks Qs)],
  [*AI vs ML vs DL vs DS*], [Hierarchical relationships, feature engineering comparison, detailed parameter matrix.], [High Priority \ (6-8 Marks Qs)],
  [*Intelligent Agents & Rationality*], [Sensors, Actuators, Percept sequence $P^*$, Agent Function $f: P^* -> A$, Agent Program, Rationality vs Omniscience.], [High Priority \ (7-9 Marks Qs)],
  [*PEAS & Environment Types*], [PEAS framework for Taxi, Medical, Tutor, Spam, Vacuum. 7 Environment dimensions.], [High Priority \ (8-10 Marks Qs)],
  [*Types of Agent Architectures*], [Simple Reflex, Model-Based, Goal-Based, Utility-Based, Learning Agents (Critic, Learning/Performance Elements).], [High Priority \ (8-10 Marks Qs)],
  [*Applications & AI Ethics*], [Applications in Healthcare, Education, Finance, Agriculture, Industry 4.0. Bias, XAI, Alignment, Governance.], [Medium Priority \ (5-6 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Introduction to Artificial Intelligence and AIML

== Definitions of Artificial Intelligence
Artificial Intelligence (AI) is a multidisciplinary branch of computer science concerned with building smart machines capable of performing tasks that typically require human intelligence. Historically, researchers have categorized definitions of AI along two primary axes: *thought processes vs. behavior*, and *human performance vs. ideal performance (rationality)*.

Russell and Norvig organize these definitions into four distinct quadrants:

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.even(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 7pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Human-Centric Focus]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Rationality-Centric Focus]*]
  ),
  [ *Thinking Humanly* \ _"The exciting new effort to make computers think... machines with minds, in the full and literal sense." (Haugeland, 1985)_ \ Analyzes cognitive processing and internal thought mechanisms using cognitive science models. ],
  [ *Thinking Rationally* \ _"The study of mental faculties through the use of computational models." (Charniak & McDermott, 1985)_ \ Focuses on valid deductions, logic, syllogisms, and formal laws of thought. ],
  [ *Acting Humanly* \ _"The art of creating machines that perform functions that require intelligence when performed by people." (Kurzweil, 1990)_ \ Evaluates operational output against human behavior (e.g., Turing Test benchmark). ],
  [ *Acting Rationally* \ _"Computational Intelligence is the study of the design of intelligent agents." (Poole et al., 1998)_ \ Focuses on designing agents that operate to achieve the best outcome or best expected outcome. ]
)

== The Turing Test and the Total Turing Test
Proposed by Alan Turing in his landmark 1950 paper _"Computing Machinery and Intelligence"_, the *Turing Test* (originally termed the Imitation Game) was designed to provide an operational definition of intelligence.

A computer passes the test if a human interrogator, after posing written questions, cannot reliably tell whether the written responses came from a person or a computer.

To pass the standard Turing Test, a machine must possess four core capabilities:
1. *Natural Language Processing (NLP):* To communicate successfully in human languages.
2. *Knowledge Representation:* To store what it knows or hears.
3. *Automated Reasoning:* To use stored information to answer questions and draw new conclusions.
4. *Machine Learning:* To adapt to new circumstances and detect patterns.

To pass the *Total Turing Test*, which includes physical signal interactions, the machine additionally requires:
5. *Computer Vision:* To perceive objects and physical environments.
6. *Robotics:* To manipulate objects and move around in the physical world.

== Foundations of Artificial Intelligence
AI is built upon centuries of intellectual contributions from diverse disciplines:
- *Philosophy (410 BCE–present):* Formalized logic, theories of mind (empiricism vs. rationalism), and the connection between knowledge and physical action.
- *Mathematics (800 CE–present):* Provided formal logic (Boole, Frege), algorithms & computability (Turing, Gödel), and probability theory (Bayes, Bernoulli, Laplace) for reasoning under uncertainty.
- *Economics (1776–present):* Introduced decision theory, utility theory, and game theory for utility maximization under constraints.
- *Neuroscience (1861–present):* Examined brain anatomy and neural processing, inspiring artificial neural networks.
- *Psychology & Cognitive Science (1879–present):* Formulated theories of human memory, perception, and cognitive modeling.
- *Computer Engineering (1940–present):* Provided high-speed computational hardware, memory structures, and software frameworks needed to execute AI algorithms.
- *Control Theory & Cybernetics (1948–present):* Created self-regulating feedback loops and objective-driven state control mechanisms.
- *Linguistics (1957–present):* Formulated computational linguistics, generative grammars, and syntax analysis for natural language processing.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=19")[Source: Russell & Norvig 4th Ed, Ch 1, p. 19-34]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))

// ==========================================
// SECTION 2
// ==========================================
= History and Evolution of Artificial Intelligence

The history of AI spans several distinct phases marked by breakthroughs, high expectations, periods of reduced funding (AI Winters), and algorithmic revivals.

#table(
  columns: (1.2fr, 2fr, 3fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 6.5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Era / Period]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Key Milestones]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Historical & Technical Significance]*]
  ),
  [ *1943–1956: Gestation & Birth* ], 
  [ McCulloch-Pitts Neuron (1943); Turing's paper (1950); Dartmouth Workshop (1956). ], 
  [ John McCarthy coined the term "Artificial Intelligence" at Dartmouth. Minsky, Rochester, and Shannon established AI as an independent field. ],

  [*1952–1969: Early Enthusiasm*], 
  [ Newell & Simon's Logic Theorist & General Problem Solver (GPS); Samuel's Checkers; LISP language. ], 
  [ Demonstrated symbolic reasoning and heuristic search. Computers solved geometric theorems and algebraic word problems. ],

  [*1966–1973: First AI Winter*], 
  [ Lighthill Report (1973); Minsky & Papert's _Perceptrons_ book (1969). ], 
  [ Combinatorial explosion hindered progress. Proof that single-layer perceptrons could not solve linearly non-separable problems (XOR gate) halted neural network funding. ],

  [*1969–1986: Expert Systems Boom*], 
  [ DENDRAL (molecular structure); MYCIN (blood infections); PROLOG & LISP machines. ], 
  [ Shifted focus from domain-independent search to domain-specific knowledge bases (Condition-Action production rules). Market grew to billions of dollars. ],

  [*1987–1993: Second AI Winter*], 
  [ Collapse of specialized LISP machine hardware market; failure of Fifth Generation Computer Systems project. ], 
  [ Expert systems proved expensive to maintain, fragile, and difficult to update, leading to major government and corporate budget cuts. ],

  [*1995–2010: Statistical ML & Big Data*], 
  [ IBM Deep Blue defeats Garry Kasparov (1997); Support Vector Machines (SVM); Probabilistic Graphical Models. ], 
  [ AI embraced rigorous mathematical and statistical methods, shifting from rule-based systems to data-driven probabilistic learning. ],

  [*2012–Present: Deep Learning & GenAI*], 
  [ AlexNet wins ImageNet (2012); AlphaGo (2016); Transformer Architecture (2017); LLMs (ChatGPT, Gemini). ], 
  [ GPUs, deep neural networks, and massive internet-scale data enabled breakthrough perception, natural language understanding, and generative intelligence. ]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=35")[Source: Russell & Norvig 4th Ed, Ch 1, p. 35-49]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))

// ==========================================
// SECTION 3
// ==========================================
= Types of Artificial Intelligence

AI systems are categorized based on their capabilities, versatility, and degree of autonomy into three distinct evolutionary tiers:

== 1. Artificial Narrow Intelligence (ANI) / Weak AI
ANI refers to AI systems designed and trained to perform a specific, single task or a narrow range of defined tasks. 
- *Characteristics:* Highly specialized, reactive, operating strictly within a pre-programmed or learned domain. ANI cannot transfer its intelligence or skills to an unlearned domain.
- *Current Status:* All existing operational AI systems today are ANI.
- *Examples:* Apple Siri, Google Translate, AlphaGo, recommendation engines (Netflix/Amazon), autonomous obstacle detection systems.

== 2. Artificial General Intelligence (AGI) / Strong AI
AGI refers to a theoretical AI system that possesses human-level cognitive capabilities across all operational domains.
- *Characteristics:* Ability to reason, plan, solve novel problems, abstract concepts, understand complex ideas, learn rapidly from experience, and transfer knowledge across unrelated domains.
- *Current Status:* Purely theoretical; actively researched under paradigms such as neuro-symbolic AI, cognitive architectures, and scalable transformer foundation models.

== 3. Artificial Super Intelligence (ASI)
ASI represents a hypothetical future stage where artificial intelligence surpasses human cognitive capabilities across every domain, including scientific creativity, general wisdom, social skills, and strategic planning.
- *Characteristics:* Self-improving recursive algorithms leading to an "intelligence explosion" (Technological Singularity).
- *Current Status:* Theoretical concept in AI safety and policy studies.

#table(
  columns: (1.5fr, 2fr, 2fr, 2fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 6.5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[ANI (Narrow AI)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[AGI (General AI)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[ASI (Super AI)]*]
  ),
  [ *Scope* ], [ Single, specialized task ], [ Multi-domain human equivalent ], [ Exceeds all human intelligence ],
  [ *Adaptability* ], [ Fails outside trained domain ], [ High domain transferability ], [ Autonomous self-evolution ],
  [ *Reasoning* ], [ Statistical pattern matching ], [ Abstract & common-sense reasoning ], [ Hyper-dimensional problem solving ],
  [ *Current Status* ], [ Fully Deployed & Operational ], [ Active Frontier Research ], [ Theoretical / Conceptual ]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=49")[Source: Russell & Norvig 4th Ed, Ch 1, p. 49-53]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))

// ==========================================
// SECTION 4
// ==========================================
= AI vs Machine Learning vs Deep Learning vs Data Science

Understanding the operational boundaries and overlapping scopes of AI, Machine Learning (ML), Deep Learning (DL), and Data Science (DS) is essential.

== Hierarchical Relationship
Mathematically and conceptually, these disciplines form a nested set structure:
$ text("Deep Learning (DL)") subset text("Machine Learning (ML)") subset text("Artificial Intelligence (AI)") $
Data Science is an interdisciplinary field that intersects with all three subsets while incorporating domain expertise, statistical analysis, and data engineering.

#align(center)[
  #block(
    fill: rgb("#eff6ff"),
    stroke: 1pt + rgb("#1d4ed8"),
    inset: 10pt,
    radius: 6pt,
    width: 90%
  )[
    #align(center)[
      #text(weight: "bold", size: 10.5pt, fill: rgb("#0f172a"))[Disciplines Relationship Blueprint] \
      #v(5pt)
      #rect(fill: rgb("#cbd5e1"), radius: 4pt, inset: 7pt, width: 95%)[
        *ARTIFICIAL INTELLIGENCE (AI)* — Broad field of smart, autonomous decision-making \
        #v(3pt)
        #rect(fill: rgb("#94a3b8"), radius: 4pt, inset: 7pt, width: 90%)[
          #text(fill: white)[*MACHINE LEARNING (ML)* — Learning patterns directly from data without explicit rules] \
          #v(3pt)
          #rect(fill: rgb("#0f172a"), radius: 4pt, inset: 7pt, width: 80%)[
            #text(fill: white)[*DEEP LEARNING (DL)* — Multi-layered neural network feature extraction]
          ]
        ]
      ] \
      #v(4pt)
      #text(size: 8.5pt, style: "italic", fill: rgb("#475569"))[
        *DATA SCIENCE* intersects all layers, combining Big Data pipeline engineering, visualization, and domain modeling.
      ]
    ]
  ]
]

== Comparative Analysis Matrix

#table(
  columns: (1.2fr, 1.5fr, 1.5fr, 1.5fr, 1.5fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 5.5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Artificial Intelligence]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Machine Learning]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Deep Learning]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Data Science]*]
  ),
  [ *Primary Goal* ], [ Simulate human-like intelligence & decisions ], [ Learn predictive models from data ], [ Automatically extract representations via neural nets ], [ Extract actionable business insights from data ],
  [ *Approach* ], [ Symbolic rules, logic, heuristics, search, ML ], [ Statistical algorithms & mathematical optimization ], [ Deep multi-layer Artificial Neural Networks (ANN) ], [ Data cleaning, ETL, exploratory analysis, stats, ML ],
  [ *Feature Engineering* ], [ Hand-crafted rule systems & knowledge bases ], [ Manual feature selection & engineering required ], [ Automatic end-to-end representation learning ], [ Feature extraction based on domain context ],
  [ *Data Requirement* ], [ Can work with explicit logic/rules (no data) ], [ Medium-to-large structured datasets ], [ Massive unstructured datasets (Text, Image, Video) ], [ Works with structured, semi-structured & raw data ],
  [ *Hardware* ], [ Standard CPU / Microcontrollers ], [ Standard CPU / Multi-core processors ], [ Requires specialized GPUs / TPUs / Accelerators ], [ Distributed compute clusters (Spark, Hadoop) ],
  [ *Interpretability* ], [ High (in rule-based expert systems) ], [ Moderate (Decision Trees, Linear Models) ], [ Low ("Black Box" non-linear representations) ], [ High (Statistical metrics & visual reports) ]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/M2-Machine_Learning_By_Ethem_Alpaydin_.pdf#page=1")[Source: Alpaydin 3rd Ed, Ch 1, p. 1-15] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/chapman-hall_crc-machine-learning-pattern-recognition-stephen-marsland-machine-learning_-an-algorithmic-perspective-second-edition-2014-chapman-and-hall_crc.pdf#page=3")[Source: Marsland 2nd Ed, Ch 1, p. 3-12]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))

// ==========================================
// SECTION 5
// ==========================================
= Intelligent Agents

== Definition of an Agent
An *Agent* is anything that can be viewed as perceiving its environment through *sensors* and acting upon that environment through *actuators*.

- *Sensors:* Physical mechanisms (cameras, infrared range finders, sonar) or software inputs (keystrokes, network packets, file streams) that capture environment state.
- *Actuators:* Physical mechanisms (wheels, robotic arms, display screens) or software outputs (writing file packets, executing API calls) that alter the environment.
- *Percept:* The agent's perceptual inputs at any given instant.
- *Percept Sequence:* The complete history of everything the agent has ever perceived:
  $ P^* = (p_1, p_2, p_3, dots, p_t) $

== Agent Function vs. Agent Program
- *Agent Function ($f$):* An abstract mathematical function mapping any given percept sequence to an action:
  $ f: P^* -> A $
- *Agent Program:* The concrete implementation of the agent function running on a physical computational architecture:
  $ text("Agent") = text("Architecture") + text("Program") $

#alert("EXAMPLE", [
  *Vacuum-Cleaner World Percept Sequence & Action Mapping:*
  Consider a simple two-location vacuum environment (Locations $A$ and $B$).
  - Percepts: $[text("Location"), text("Status")]$ where Status is $text("Clean")$ or $text("Dirty")$.
  - Actions: $text("Right")$, $text("Left")$, $text("Suck")$, $text("No-Op")$.

  *Sample Agent Function $f(P^*)$ Table:*
  #table(
    columns: (2.5fr, 1.5fr),
    inset: 5pt,
    fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else { none },
    table.header(
      [*#text(fill: rgb("#ffffff"), weight: "bold")[Percept Sequence $P^*$]*],
      [*#text(fill: rgb("#ffffff"), weight: "bold")[Action $A$]*]
    ),
    [$([A, text("Clean")])$], [$text("Right")$],
    [$([A, text("Dirty")])$], [$text("Suck")$],
    [$([A, text("Clean")], [B, text("Dirty")])$], [$text("Suck")$],
    [$([A, text("Clean")], [B, text("Clean")])$], [$text("Left")$]
  )
])

== The Concept of Rationality
A *Rational Agent* is one that selects an action that is expected to maximize its performance measure, given the evidence provided by the percept sequence and whatever built-in knowledge the agent has.

Rationality at any given time depends on four factors:
1. The *Performance Measure* that defines the criterion of success.
2. The agent's *Prior Knowledge* of the environment.
3. The *Actions* that the agent can perform.
4. The agent's *Percept Sequence* to date.

#alert("IMPORTANT", [
  *Rationality vs. Omniscience:*
  - An _omniscient agent_ knows the _actual_ outcome of its actions and can act accordingly; omniscience is impossible in reality.
  - A _rational agent_ makes the _optimal decision based on expected outcomes_ given its current information and bounded processing capabilities. Rationality encourages *information gathering*, *exploration*, and *learning* (autonomy).
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=54")[Source: Russell & Norvig 4th Ed, Ch 2, p. 54-60]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))

// ==========================================
// SECTION 6
// ==========================================
= Agent Environment and PEAS Representation

== The PEAS Framework
To design a rational agent, the task environment must be formally specified using the *PEAS* framework:
- *Performance Measure:* Quantitative metric evaluating agent success.
- *Environment:* External world/medium in which the agent operates.
- *Actuators:* Output devices/mechanisms used to execute actions.
- *Sensors:* Input devices/mechanisms used to perceive the environment.

#table(
  columns: (1.3fr, 1.6fr, 1.6fr, 1.5fr, 1.5fr),
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: (x, y) => if y == 0 { rgb("#1e3a8a") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  inset: 5.5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Agent Type]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Performance Measure]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Environment]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Actuators]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Sensors]*]
  ),
  [ *Automated Taxi Driver* ], [ Safety, speed, legal drive, profit, passenger comfort ], [ City streets, traffic, pedestrians, weather, roadwork ], [ Steering wheel, accelerator, brake, horn, display ], [ Cameras, LiDAR, radar, GPS, speedometer, accelerometer ],
  [ *Medical Diagnostic System* ], [ Healthy patient, minimized costs, legal liability compliance ], [ Patient, hospital staff, laboratory test feeds ], [ Display screen (diagnosis, prescriptions, test orders) ], [ Keyboard/touchscreen (symptom & lab data inputs) ],
  [ *Interactive English Tutor* ], [ Student test score maximization, engagement, speed ], [ Student population, learning management platform ], [ On-screen text, audio output, exercise recommendations ], [ Keyboard, microphone, response time tracker ],
  [ *Spam Email Classifier* ], [ High precision/recall, zero false positive spam flags ], [ Email server stream, user inbox, user flags ], [ Move to spam folder, mark safe, flag user ], [ Header parser, body text extractor, IP lookup ],
  [ *Vacuum Cleaner Agent* ], [ Cleanliness level, battery efficiency, time taken, low noise ], [ Floor tiles, carpet, dirt, obstacles, walls ], [ Drive wheels, suction motor, brush assembly ], [ Dirt detection sensor, bump sensor, cliff sensor ]
)

== Environment Properties (7 Dimensions)
The nature of the task environment directly dictates the complexity of the agent architecture:

1. *Fully Observable vs. Partially Observable (vs. Unobservable):*
   - _Fully Observable:_ Sensors detect the complete state of the environment at any given point in time (e.g., Chess).
   - _Partially Observable:_ Sensors have noisy, incomplete, or missing state information (e.g., Automated Taxi, Poker).

2. *Single-Agent vs. Multi-Agent:*
   - _Single-Agent:_ Agent operates alone without other decision-makers (e.g., Sudoku solver).
   - _Multi-Agent:_ Environment contains other agents acting competitively (Chess) or cooperatively (Taxi navigation).

3. *Deterministic vs. Nondeterministic (Stochastic):*
   - _Deterministic:_ The next environment state is completely determined by the current state and the executed action (e.g., Chess).
   - _Nondeterministic / Stochastic:_ Randomness or unknown external events make the next state uncertain (e.g., Driving in traffic).

4. *Episodic vs. Sequential:*
   - _Episodic:_ Agent's experience is divided into independent atomic episodes; actions in one episode do not affect future episodes (e.g., Defective part classification).
   - _Sequential:_ Current decisions affect all future decisions and states (e.g., Chess, Driving).

5. *Static vs. Dynamic (vs. Semidynamic):*
   - _Static:_ Environment does not change while the agent is deliberating (e.g., Crossword puzzle).
   - _Dynamic:_ Environment continuously changes while the agent thinks (e.g., Taxi driving).
   - _Semidynamic:_ Environment does not change with time, but the agent's performance score decreases with time (e.g., Timed chess).

6. *Discrete vs. Continuous:*
   - _Discrete:_ Environment states, time steps, perceptions, and actions are finite and distinct (e.g., Chess).
   - _Continuous:_ States and actions vary smoothly over continuous physical spectrums (e.g., Taxi steering angle, velocity).

7. *Known vs. Unknown:*
   - _Known:_ The physical/environmental rules governing outcomes are fully known to the agent.
   - _Unknown:_ The agent must learn the physics/rules of the environment to make decisions.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=60")[Source: Russell & Norvig 4th Ed, Ch 2, p. 60-67]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))

// ==========================================
// SECTION 7
// ==========================================
= Types of Agent Architectures

Agent programs are classified into five fundamental structural architectures based on their internal reasoning mechanisms:

== 1. Simple Reflex Agents
Simple Reflex Agents select actions based *only* on the current percept, ignoring the rest of the percept history. They operate using *Condition-Action Rules* (IF-THEN statements).

- *Mathematical Mapping:* $f(p) = text("Rule-Action")(text("Rule-Match")(text("Current-State")))$
- *Limitations:* Only works if the environment is *fully observable*. In partially observable environments, infinite loops are common.

#align(center)[
  #rect(fill: rgb("#f8fafc"), stroke: 0.75pt + rgb("#475569"), inset: 9pt, radius: 4pt, width: 85%)[
    #text(weight: "bold", fill: rgb("#0f172a"))[Simple Reflex Agent Architecture] \
    #v(3pt)
    `Environment` $->$ `Sensors` $->$ `What the world is like now` $->$ `Condition-Action Rules` $->$ `What action I should do now` $->$ `Actuators` $->$ `Environment`
  ]
]

== 2. Model-Based Reflex Agents
Model-Based Reflex Agents handle *partial observability* by maintaining an *internal state* that tracks unobserved aspects of the current world state.

- *Required Models:*
  1. _Transition Model (How the world evolves):_ How the environment changes independently and in response to agent actions: $P(s_t mid s_(t-1), a_(t-1))$.
  2. _Sensor Model (How the world reflects in percepts):_ How environment states translate to sensor readings: $P(e_t mid s_t)$.

#align(center)[
  #rect(fill: rgb("#f8fafc"), stroke: 0.75pt + rgb("#475569"), inset: 9pt, radius: 4pt, width: 85%)[
    #text(weight: "bold", fill: rgb("#0f172a"))[Model-Based Reflex Agent Architecture] \
    #v(3pt)
    `Sensors` $->$ `Internal State` $+$ `How world evolves` $+$ `What my actions do` $->$ `What world is like now` $->$ `Condition-Action Rules` $->$ `Actuators`
  ]
]

== 3. Goal-Based Agents
Goal-Based Agents combine internal state tracking with explicit *Goal Information* describing desirable situations.

- *Reasoning Mechanism:* The agent evaluates future sequences of actions to determine if they lead to the specified goal state ($G$). It integrates *Search* and *Planning* algorithms.
- *Advantage:* Flexible; if the goal changes (e.g., new navigation destination), the agent re-plans automatically without rewriting rule bases.

#align(center)[
  #rect(fill: rgb("#f8fafc"), stroke: 0.75pt + rgb("#475569"), inset: 9pt, radius: 4pt, width: 85%)[
    #text(weight: "bold", fill: rgb("#0f172a"))[Goal-Based Agent Architecture] \
    #v(3pt)
    `Sensors` $->$ `State` $+$ `World Evolution Model` $->$ `What it will be like if I do Action X` $+$ `Goals` $->$ `Select Action achieving Goal` $->$ `Actuators`
  ]
]

== 4. Utility-Based Agents
Goal-based agents distinguish only between goal states and non-goal states. *Utility-Based Agents* use a continuous *Utility Function* ($U: S -> RR$) mapping environment states to real numbers, measuring the degree of "happiness" or desirability.

- *Decision Standard:* Maximizes *Expected Utility* under uncertainty:
  $ EE[U(s')] = sum_(s') P(s' mid s, a) U(s') $
- *Advantages:* Trades off competing goals (e.g., speed vs. safety in driving) and handles stochastic environments rationally.

#align(center)[
  #rect(fill: rgb("#f8fafc"), stroke: 0.75pt + rgb("#475569"), inset: 9pt, radius: 4pt, width: 85%)[
    #text(weight: "bold", fill: rgb("#0f172a"))[Utility-Based Agent Architecture] \
    #v(3pt)
    `Sensors` $->$ `State` $->$ `What world will be like` $+$ `Utility Function` $->$ `Select Action Maximizing Expected Utility` $->$ `Actuators`
  ]
]

== 5. Learning Agents
Learning Agents operate in initially unknown environments and improve their performance over time. A Learning Agent is divided into four conceptual components:

1. *Critic:* Evaluates the agent's behavior against an external performance standard and provides feedback.
2. *Learning Element:* Responsible for making improvements based on feedback from the critic.
3. *Performance Element:* Responsible for selecting external actions (corresponds to the entire agent in previous architectures).
4. *Problem Generator:* Suggests exploratory actions that lead to new experiences rather than adhering strictly to known sub-optimal paths.

#align(center)[
  #rect(fill: rgb("#f8fafc"), stroke: 0.75pt + rgb("#475569"), inset: 9pt, radius: 4pt, width: 90%)[
    #text(weight: "bold", fill: rgb("#0f172a"))[Learning Agent Structural Breakdown] \
    #v(3pt)
    `Sensors` $->$ `Critic` (Feedback) $->$ `Learning Element` (Learning Goals) $->$ `Problem Generator` $->$ `Performance Element` $->$ `Actuators`
  ]
]

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=67")[Source: Russell & Norvig 4th Ed, Ch 2, p. 67-78]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))

// ==========================================
// SECTION 8
// ==========================================
= Applications of Artificial Intelligence in Key Domains

== 1. Healthcare
- *Computer-Aided Diagnosis (CAD):* Deep Convolutional Neural Networks (CNNs) detect malignant tumors in MRI, CT scans, and X-rays with expert-level precision.
- *Precision & Personalized Medicine:* Genomic data analysis models tailor drug treatment protocols based on individual patient genetic profiles.
- *Robotic Surgery:* Systems like the da Vinci Surgical System assist surgeons with micro-precision manipulations.

== 2. Education
- *Intelligent Tutoring Systems (ITS):* Platforms adapt difficulty and explanations based on real-time student performance metrics.
- *Automated Grading:* Natural Language Processing (NLP) models grade short answer essays and detect code plagiarism automatically.

== 3. Finance
- *Algorithmic High-Frequency Trading:* Predictive models execute stock trades at microsecond intervals based on market indicators.
- *Fraud Detection:* Anomaly detection models evaluate credit card transactions in real time to intercept unauthorized payments.

== 4. Agriculture
- *Precision Farming & Crop Health:* Computer vision systems mounted on drones detect weed infestations, nitrogen deficiencies, and soil moisture levels.
- *Autonomous Harvesters & Yield Prediction:* Computer vision-guided agricultural robots harvest delicate crops without damage.

== 5. Industry 4.0 & Smart Manufacturing
- *Predictive Maintenance:* IoT sensor streams coupled with time-series ML models forecast machine equipment failures before breakdowns occur.
- *Digital Twins:* Virtual simulation replicas of physical factories optimize assembly workflows and material handling.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=45")[Source: Russell & Norvig 4th Ed, Ch 1, p. 45-48]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))

// ==========================================
// SECTION 9
// ==========================================
= Challenges and Future of Artificial Intelligence

== 1. Ethical Considerations, Bias, and Fairness
- *Algorithmic Bias:* Machine learning models trained on historically biased data perpetuate discrimination in loan approvals, hiring tools, and judicial sentencing.
- *Data Privacy:* Massive data scraping for foundation models raises severe concerns regarding consent and personal information security.

== 2. Interpretability and Explainable AI (XAI)
- *The "Black Box" Problem:* Deep neural networks provide high accuracy but lack transparent decision pathways. XAI methods (e.g., LIME, SHAP) aim to make AI decisions interpretable in high-stakes domains such as healthcare and law.

== 3. The AI Alignment Problem
- *Goal Misalignment:* Ensuring that superintelligent or highly autonomous AI systems act in accordance with human ethical principles, safety guidelines, and intended outcomes rather than unintended proxy reward functions.

== 4. Economic & Societal Impact
- *Workforce Automation:* AI automation poses potential risks of workforce displacement while simultaneously creating demand for specialized data engineering and AI safety roles.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/.studymaterial/aiml/efdd4d1d4c2087fe1cbe03d9ced67f34.pdf#page=49")[Source: Russell & Norvig 4th Ed, Ch 1, p. 49-53]
