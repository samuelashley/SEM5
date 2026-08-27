// Typst Theory Notes - Theory of Computation (Unit 1 & Unit 2)
// Strictly Extracted from Class Notes & Slides by Prof. Sonal Kulkarni (IT)
// Course Code: PCC-303-ITT | SPPU TE IT (2024 Pattern)

#let accent-color = rgb("#0f172a")  // Dark Slate Accent
#let accent-border = rgb("#1e293b") // Slate Border
#let accent-light = rgb("#f1f5f9")  // Soft Slate Background
#let text-color = rgb("#0f172a")    // Deep Dark Text

#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 2.2cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: accent-border, weight: "bold")[THEORY OF COMPUTATION — UNIT 1 & 2 THEORY]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Prof. Sonal Kulkarni (IT) Class Materials]]
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
      align(left)[#text(size: 8pt, fill: accent-border, weight: "bold")[SPPU TE IT (2024 Pattern)] #text(size: 8pt, fill: rgb("#64748b"))[ | PCC-303-ITT]],
      align(right)[#text(size: 8pt, fill: rgb("#64748b"))[Page #counter(page).display() of #counter(page).final().first()]]
    )
  }
)

#set text(
  font: "Helvetica",
  size: 9.5pt,
  fill: text-color
)

#set par(
  justify: true,
  leading: 0.65em
)

#set heading(numbering: none)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (left: 4pt + accent-border),
  inset: (left: 10pt, y: 7pt),
  fill: accent-light,
  radius: (right: 4pt),
  text(fill: text-color, size: 12pt, weight: "bold")[#it.body]
)

#show heading.where(level: 2): it => block(
  width: 100%,
  inset: (y: 5pt),
  text(fill: rgb("#1e293b"), size: 10.5pt, weight: "bold")[#it.body]
)

#show heading.where(level: 3): it => block(
  width: 100%,
  inset: (y: 3pt),
  text(fill: text-color, size: 9.5pt, weight: "bold", style: "italic")[#it.body]
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

// Custom Alert block
#let alert(type, content) = {
  let colors = (
    "NOTE": (border: rgb("#1e293b"), bg: rgb("#f1f5f9")),
    "DEFINITION": (border: rgb("#0f172a"), bg: rgb("#f8fafc")),
    "RULE": (border: rgb("#059669"), bg: rgb("#ecfdf5")),
    "STEPS": (border: rgb("#2563eb"), bg: rgb("#eff6ff"))
  )
  let c = colors.at(type, default: (border: rgb("#1e293b"), bg: rgb("#f1f5f9")))
  
  rect(
    width: 100%,
    stroke: (left: 4pt + c.border),
    fill: c.bg,
    inset: 8pt,
    radius: (right: 4pt),
    [
      #text(weight: "bold", fill: c.border)[#type:] \
      #v(2pt)
      #text(fill: text-color)[#content]
    ]
  )
}

// Title Header Page 1
#align(left)[
  #text(size: 9pt, fill: rgb("#475569"), weight: "bold")[THEORY OF COMPUTATION (TE IT - 2024 Pattern)] \
  #v(2pt)
  #text(size: 16pt, fill: text-color, weight: "bold")[EXAM THEORY NOTES — UNIT 1 & UNIT 2]
]

#v(4pt)
#rect(
  width: 100%,
  stroke: 1pt + accent-border,
  fill: accent-light,
  radius: 4pt,
  inset: 8pt,
  [
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 6pt,
      [#text(weight: "bold", fill: text-color)[Course Pattern:] TE IT - 2024 Pattern (SPPU)],
      [#text(weight: "bold", fill: text-color)[Academic Term:] Semester V (In-Sem Exam)],
      [#text(weight: "bold", fill: text-color)[Source Material:] Prof. Sonal Kulkarni (IT) Slides],
      [#text(weight: "bold", fill: text-color)[Course Code:] PCC-303-ITT]
    )
  ]
)

#v(4pt)
#line(length: 100%, stroke: 1.5pt + accent-border)
#v(4pt)

= UNIT 1: FINITE AUTOMATA

== 1.1 Deterministic Finite Automata (DFA)
- *Core Characteristics:*
  - In a DFA, there is *only one path/transition* for a given input from the current state to the next state.
  - A DFA *does not accept null moves* (it cannot change state without reading an input symbol).
  - A DFA can contain *multiple final states*.

- *Formal 5-Tuple Definition of DFA:*
  A Deterministic Finite Automaton (DFA) is defined as a collection of 5 tuples:
  $ M = (Q, Sigma, delta, q_0, F) $
  - $Q$: Finite set called *states*.
  - $Sigma$: Finite set called *alphabets* (input symbols).
  - $delta: Q times Sigma arrow.r Q$: *Transition function* (maps state and input symbol to a unique next state).
  - $q_0 in Q$: *Start or initial state*.
  - $F subset.eq Q$: Set of *final or accept states*.

- *Graphical Representation of DFA (State Diagram Digraphs):*
  - *Vertices:* Represent internal states.
  - *Arcs (Directed Edges):* Labeled with an input character to show state transitions.
  - *Start State:* Represented with an incoming arrow pointing from nowhere.
  - *Final State:* Represented by a *double circle*.

- *Trap State / Dead State:*
  - If a transition goes to a state from which the automaton can *never escape* and from which it *cannot reach any final state*, such a state is called a *trap state* or *dead state*.

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== 1.2 Non-Deterministic Finite Automata (NFA) & Epsilon ($epsilon$) Transitions
- *Core Characteristics of NFA:*
  - Finite automata are called NFA when there exist *many paths* for a specific input from the current state to the next state.
  - *Every NFA is not a DFA, but each NFA can be translated into an equivalent DFA.*
  - NFA differs from DFA by two key exceptions:
    1. It contains *multiple next states* for a single input symbol.
    2. It can contain *null ($epsilon$) transitions*.

- *Formal 5-Tuple Definition of NFA (NDFA):*
  $ M = (Q, Sigma, delta, q_0, F) $
  - $Q$: Finite set of states.
  - $Sigma$: Finite set of input symbols (alphabets).
  - $delta: Q times Sigma arrow.r 2^Q$: Transition function mapping to the *power set of $Q$* ($2^Q$), because transitions can occur to any combination/subset of $Q$ states.
  - $q_0 in Q$: Initial start state.
  - $F subset.eq Q$: Set of final states.

- *Epsilon ($epsilon$) Transition Function:*
  - $epsilon$-transitions make a machine non-deterministic.
  - When a machine enters a state with an $epsilon$-transition exiting it, the machine can choose to either stay in that state and await the next input symbol, or *immediately take the $epsilon$-transition to enter a new state without consuming any input symbol*.

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== 1.3 Difference Between DFA and NFA

#table(
  columns: (1fr, 2fr, 2fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5.5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[DFA (Deterministic)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[NFA (Non-Deterministic)]*]
  ),
  [*Epsilon Moves*], [DFA cannot use Epsilon ($epsilon$) transitions.], [NFA can use Epsilon ($epsilon$) transitions.],
  [*Machine Model*], [DFA can be understood as one machine.], [NFA can be understood as multiple state machines computing at the same time.],
  [*Next States*], [For each state and input symbol, there is exactly one possible next state.], [For each state and input symbol, can have zero, one, or more possible next states.],
  [*Construction*], [DFA is more difficult to construct.], [NFA is easier to construct.],
  [*Rejection Rule*], [DFA rejects the string in case it terminates in a state different from the accepting state.], [NFA rejects the string in the event of all branches dying or refusing the string.],
  [*Execution Time*], [Time needed for executing an input string is *less* (faster).], [Time needed for executing an input string is *more*.],
  [*Subset Relation*], [All DFA are NFA.], [Not all NFA are DFA.],
  [*Space Needed*], [DFA requires *more space* (more states).], [NFA requires *less space* than DFA.]
)

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== 1.4 Conversion from NFA to DFA (Subset Construction Steps)
#alert("STEPS", [
  *Step-by-Step Procedure:*
  - *Step 1:* Initially set $Q' = emptyset$.
  - *Step 2:* Add start state $q_0$ of NFA as $[q_0]$ to $Q'$. Then find the transitions from this start state for all input symbols.
  - *Step 3:* In $Q'$, find the possible set of states for each input symbol. If this generated set of states is not already present in $Q'$, add it to $Q'$.
  - *Step 4:* Repeat Step 3 for all newly added states until no new states are generated in the transition table.
  - *Step 5:* In the constructed DFA, the final states will be *all composite states that contain at least one final state of the NFA* ($F$).
])

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== 1.5 Finite Automata with Output: Moore and Mealy Machines
Moore and Mealy Machines are *Transducers* that produce outputs based on the input of the current state or previous state.

- *1. Moore Machine:*
  - A finite state machine where the *output value depends only on the present state*.
  - Defined as a 6-tuple: $M = (Q, q_0, Sigma, O, delta, lambda)$
    - $Q$: Finite set of states.
    - $q_0$: Initial state.
    - $Sigma$: Input alphabet.
    - $O$: Output alphabet.
    - $delta: Q times Sigma arrow.r Q$: Transition function.
    - $lambda: Q arrow.r O$: Output function mapping *state to output*.

- *2. Mealy Machine:*
  - A finite state machine where the *output value depends on both the present state and current input symbol*.
  - Defined as a 6-tuple: $M = (Q, q_0, Sigma, O, delta, lambda')$
    - $Q, q_0, Sigma, O, delta$: Same as Moore machine.
    - $lambda': Q times Sigma arrow.r O$: Output function mapping *(state, input symbol) to output*.

- *3. Difference Between Moore and Mealy Machine:*

#table(
  columns: (1.1fr, 2fr, 2fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5.5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Difference]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Mealy Machine]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Moore Machine]*]
  ),
  [*Output Dependency*], [Output depends on both the current state and the current input.], [Output depends solely on the current state, regardless of the input.],
  [*Output Association*], [Output is associated with the *transition between states* (on the arrow).], [Output is associated with the *states themselves* (inside the state circle).],
  [*Generality*], [More general and can represent a wider range of behaviors.], [Less general than Mealy machines.],
  [*Implementation*], [Can be more complex to design and implement in some cases.], [Generally simpler to design and implement.],
  [*Output Changes*], [Output can change when either the state changes or the input changes (while in the same state).], [Output can only change when the state changes.]
)

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== 1.6 Inter-Conversion: Moore and Mealy Machines
- *Moore to Mealy Conversion:*
  - *Rule:* Put the output of the *DESTINATION state* directly onto the transition arrow in the Mealy machine.
  - *Example:* If in Moore machine $A arrow.r^b B$ and state $B$ has output $1$ ($lambda(B) = 1$), then in Mealy machine the transition becomes $A arrow.r^(b/1) B$.
  - *State Count:* Number of states remains the same ($|Q_"Moore"| = |Q_"Mealy"|$).

- *Mealy to Moore Conversion:*
  - *Rule (State Splitting):*
    - Inspect the incident (incoming) edges for each state:
    - If a state has incoming edges with *only one output* (e.g., all incoming edges have output 0), do *not* split the state.
    - If a state has incoming edges with *different outputs* (e.g., outputs 0 and 1), *split the state* into two states: $q_(20)$ (with output 0) and $q_(21)$ (with output 1).
  - *State Count:* Number of states *increases* in Mealy $arrow.r$ Moore conversion.

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== 1.7 Conversion from NFA with $epsilon$ to DFA
#alert("STEPS", [
  *Step-by-Step Procedure:*
  - *Step 1:* Take the $epsilon$-closure of the starting state of NFA as the starting state of DFA ($A = epsilon-op("CLOSURE")(q_0)$).
  - *Step 2:* Find the states for each input symbol that can be traversed from the present state: compute the union of transitions and their $epsilon$-closures:
    $ delta'(A, a) = epsilon-op("CLOSURE")(delta(A, a)) $
  - *Step 3:* If a new composite state is found, add it as a current state in DFA and repeat Step 2.
  - *Step 4:* Repeat Step 2 and Step 3 until there are no new states generated in the transition table.
  - *Step 5:* Mark all states of DFA that contain any final state of the NFA as *final states*.
])

#v(8pt)
#line(length: 100%, stroke: 1.5pt + accent-border)
#v(8pt)

= UNIT 2: REGULAR EXPRESSIONS AND LANGUAGES

== 2.1 Regular Expressions Fundamentals & Regular Languages
- *Definition:*
  - The language accepted by finite automata can be easily described by simple algebraic expressions called *Regular Expressions (RE)*. It is the most effective way to represent any language.
  - The languages accepted by some regular expression are referred to as *Regular Languages*.
  - A regular expression can also be described as a sequence of patterns that defines a string.
  - Regular expressions are used to match character combinations in strings (used in string searching algorithms).

- *Basic Notations:*
  - In a regular expression, $x^*$ (Kleene star) means *zero or more occurrences* of $x$. It generates:
    $ x^* = {epsilon, x, x x, x x x, x x x x, dots} $
  - In a regular expression, $x^+$ (Positive closure) means *one or more occurrences* of $x$. It generates:
    $ x^+ = {x, x x, x x x, x x x x, dots} $

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== 2.2 Operations on Regular Languages and Expressions
1. *Language Denoted by RE:* If $X$ is an RE over a language, $L(X)$ represents the language denoted by $X$.
2. *Union ($X + Y$ or $X union Y$):*
   - *Intuition:* "I want Breakfast OR Lunch!" $==>$ Give anything from Breakfast menu OR Lunch menu.
   - *Meaning:* $L(X+Y) = L(X) union L(Y)$ (either $X$, or $Y$, or both).
   - *Formal Set Definition:* $A union B = {x mid x in A "or" x in B}$.
3. *Concatenation ($X Y$ or $X dot.c Y$):*
   - *Intuition:* "First Tea $==>$ then Biscuit."
   - *Meaning:* $L(X Y) = L(X) L(Y)$ (first $X$, followed by $Y$).
   - *Formal Set Definition:* $A dot.c B = {x dot.c y mid x in A "and" y in B}$.
4. *Kleene Star ($X^*$):*
   - *Intuition:* "Give me Tea zero or more times."
   - *Meaning:* $X^*$ means $X$ can come 0 times, 1 time, 2 times, 3 times, ...
   - *Formal Set Definition:* $A^* = {x_1 x_2 dots x_k mid k >= 0 "and" x_i in A}$.

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== 2.3 Arden's Theorem
- *Theorem Statement:*
  #rect(
    width: 100%,
    stroke: (left: 3.5pt + accent-border),
    fill: rgb("#f8fafc"),
    inset: 7pt,
    [
      #text(weight: "bold")[Arden's Theorem:] \
      _If $P$ and $Q$ are two regular expressions over $Sigma$, and if $P$ does not contain $epsilon$, then the following equation in $R$ given by:_
      $ R = Q + R P $
      _has a unique solution, i.e.,_
      $ R = Q P^* $
    ]
  )
  *Meaning:* Whenever we obtain any state equation in the form $R = Q + R P$, we can directly replace it with $R = Q P^*$.

- *Mathematical Explanation / Step-by-Step Derivation:*
  $ R = Q + R P $
  Substituting $R = Q + R P$ into itself:
  $ R = Q + (Q + R P) P = Q + Q P + R P^2 $
  Substituting again:
  $ R = Q + Q P + (Q + R P) P^2 = Q + Q P + Q P^2 + R P^3 $
  In general, factoring out $Q$:
  $ R = Q (P^0 + P^1 + P^2 + P^3 + dots) = Q P^* $

- *Rules for Writing Equations from Finite Automata:*
  - For initial state (e.g. $A$ or $q_1$), add $+ epsilon$ to the equation (since $epsilon$-move represents starting at initial state).
  - Dead states / trap states do not need equations because they cannot reach accepting states.
  - Final regular expression is the union/equation for the final accepting state(s).

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== 2.4 Conversion of RE to FA using Direct Method
The *Direct Method* builds a small Finite Automaton directly matching the structure and pattern of the regular expression:

#table(
  columns: (1.2fr, 1.4fr, 2.4fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5.5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Operation]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[RE Pattern]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[FA Construction Structure]*]
  ),
  [*One Symbol*], [$R E = a$], [$q_0 arrow.r^a q_1$ (Single transition on symbol $a$ to final state).],
  [*Sequence*], [$R E = a b$], [$q_0 arrow.r^a q_1 arrow.r^b q_2$ (Sequential transitions on $a$ then $b$).],
  [*Choice (Union)*], [$R E = a + b$], [Two parallel branching paths from $q_0$ on $a$ and $b$ to final state $q_1$.],
  [*Zero or more a's*], [$R E = a^*$], [Start state $q_0$ is final with self-loop on $a$: $q_0 arrow.r^a q_0$.],
  [*Zero or more a, b's*], [$R E = (a + b)^*$], [Start state $q_0$ is final with self-loops on $a$ and $b$.]
)

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== 2.5 Pumping Lemma for Regular Languages
- *Purpose of Pumping Lemma:*
  - Pumping Lemma is used to *prove that a language is NOT REGULAR*.
  - *It CANNOT be used to prove that a language is Regular.*

- *Statement of Pumping Lemma:*
  If $A$ is a Regular Language, then $A$ has a *Pumping Length '$p$'* such that any string '$s$' where $|s| >= p$ may be divided into 3 parts $s = x y z$ such that the following 3 conditions must be true:
  1. $x y^i z in A$ for every $i >= 0$
  2. $|y| > 0$
  3. $|x y| <= p$

- *Proof by Contradiction Method (Step-by-Step Algorithm):*
  1. *Assume* that language $A$ is Regular.
  2. It must have a pumping length (say $p$).
  3. All strings longer than $p$ can be pumped ($|s| >= p$).
  4. Now find/choose a clever test string '$s$' in $A$ such that $|s| >= p$.
  5. Divide $s$ into $x y z$.
  6. Show that $x y^i z in.not A$ for some $i$.
  7. Consider all ways that $s$ can be divided into $x y z$ satisfying $|y| > 0$ and $|x y| <= p$.
  8. Show that *none of these can satisfy all 3 pumping conditions at the same time*.
  9. String $s$ cannot be pumped $==>$ *CONTRADICTION*.
  10. Therefore, language $A$ is *NOT Regular*.

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== 2.6 The 12 Standard Identities of Regular Expressions

#table(
  columns: (1fr, 2.5fr, 1fr, 2.5fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5.5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[No.]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Identity]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[No.]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Identity]*]
  ),
  [1.], [$emptyset + R = R$], [7.], [$R R^* = R^* R$],
  [2.], [$emptyset R = R emptyset = emptyset$], [8.], [$(R^*)^* = R^*$],
  [3.], [$epsilon R = R epsilon = R$], [9.], [$epsilon + R R^* = epsilon + R^* R = R^*$],
  [4.], [$epsilon^* = epsilon$ and $emptyset^* = epsilon$], [10.], [$(P Q)^* P = P (Q P)^*$],
  [5.], [$R + R = R$], [11.], [$(P + Q)^* = (P^* Q^*)^* = (P^* + Q^*)^*$],
  [6.], [$R^* R^* = R^*$], [12.], [$(P + Q) R = P R + Q R$ and $R(P + Q) = R P + R Q$]
)
