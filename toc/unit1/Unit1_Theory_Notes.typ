// Typst Theory Notes - Theory of Computation (Unit 1)
// Course Code: PCC-303-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[THEORY OF COMPUTATION — UNIT 1]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Finite Automata & Transducers]]
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
      align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[SPPU TE IT (2024 Pattern)] #text(size: 8pt, fill: rgb("#64748b"))[ | PCC-303-ITT]],
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

// Styling headings - Option 5: Dark Slate & Steel Scheme
#show heading: set text(fill: rgb("#0f172a"))
#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (left: 4pt + rgb("#1e293b")), // Dark Slate Accent
  inset: (left: 10pt, y: 7pt),
  fill: rgb("#f1f5f9"), // Soft Slate background
  radius: (right: 4pt),
  text(fill: rgb("#0f172a"), size: 12.5pt, weight: "bold")[#it.body]
)

#show heading.where(level: 2): it => block(
  width: 100%,
  inset: (y: 5pt),
  text(fill: rgb("#334155"), size: 11pt, weight: "bold")[#it.body]
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

// Custom Alert block - Dark Slate & Steel High Contrast
#let alert(type, content) = {
  let colors = (
    "NOTE": (border: rgb("#1e293b"), bg: rgb("#f1f5f9")),
    "TIP": (border: rgb("#059669"), bg: rgb("#ecfdf5")),
    "IMPORTANT": (border: rgb("#0f172a"), bg: rgb("#e2e8f0")),
    "WARNING": (border: rgb("#b91c1c"), bg: rgb("#fef2f2")),
    "DEFINITION": (border: rgb("#334155"), bg: rgb("#f8fafc"))
  )
  let c = colors.at(type, default: (border: rgb("#1e293b"), bg: rgb("#f1f5f9")))
  
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
  #text(size: 9pt, fill: rgb("#334155"), weight: "bold")[THEORY OF COMPUTATION (TE IT - 2024 Pattern)] \
  #v(2pt)
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 1: FINITE AUTOMATA]
]

#v(6pt)
#rect(
  width: 100%,
  stroke: 1pt + rgb("#1e293b"),
  fill: rgb("#f1f5f9"),
  radius: 4pt,
  inset: 9pt,
  [
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 7pt,
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Pattern:] TE IT - 2024 Pattern (SPPU)],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Academic Term:] Semester V (2026)],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Status:] Comprehensive Master Theory Guide],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Code:] PCC-303-ITT]
    )
  ]
)

#v(6pt)
#line(length: 100%, stroke: 1.5pt + rgb("#1e293b"))
#v(6pt)

=== Syllabus Mapping & Unit Structure
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 1.

#table(
  columns: (1.5fr, 3fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#1e293b") } else if calc.odd(y) { rgb("#f1f5f9") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 7pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Syllabus Topic]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[In-Depth Exam Coverage]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Priority / Weightage]*]
  ),
  [*Basic Concepts*], [Symbols, Alphabet ($Sigma$), Strings ($w$), String Length ($|w|$), Empty String ($epsilon$), Formal Languages ($L$), Operations on Strings & Languages, Kleene Star ($Sigma^*$), Positive Closure ($Sigma^+$).], [High Priority \ (4-6 Marks Qs)],
  [*Finite Automata (FA)*], [Formal 5-tuple definition ($Q, Sigma, delta, q_0, F$), State Transition Diagrams & Tables, Extended Transition Function ($hat(delta)$), Language acceptance by FA.], [High Priority \ (6-8 Marks Qs)],
  [*NFA & $epsilon$-NFA*], [Definition of NFA, Transition function to power set $P(Q)$, NFA with $epsilon$-moves ($epsilon$-NFA), $epsilon$-closure computation algorithms.], [High Priority \ (6-8 Marks Qs)],
  [*Inter-Conversions of FA*], [Conversion of $epsilon$-NFA to NFA (Eliminating $epsilon$-moves), Conversion of NFA to DFA (Subset / Power Set Construction), Conversion of $epsilon$-NFA directly to DFA.], [High Priority \ (8-10 Marks Qs)],
  [*Minimization & Equivalence*], [Equivalence vs. Distinguishability of states ($p equiv q$), Table-Filling Algorithm (Myhill-Nerode Theorem), Equivalence of two FAs.], [High Priority \ (8-10 Marks Qs)],
  [*Output Machines (Transducers)*], [Moore Machine (6-tuple, state output, length $n+1$), Mealy Machine (6-tuple, transition output, length $n$), Inter-conversions (Moore $arrow.l.r$ Mealy).], [High Priority \ (8-10 Marks Qs)],
  [*Applications of FA*], [Lexical Analyzer design in compiler construction (`lex`/`flex`), Pattern matching & string searching (KMP algorithm), Hardware logic controllers.], [Medium Priority \ (4-6 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Basic Concepts and Mathematical Foundations

== Symbols, Alphabet, Strings, and Formal Languages
Automata theory is built upon formal mathematical structures representing discrete computation systems.

#alert("DEFINITION", [
  1. *Symbol*: An indivisible atomic entity (character, digit, or sign). Examples include $a, b, 0, 1, +$.
  2. *Alphabet ($Sigma$)*: A finite, non-empty set of symbols.
     - Binary Alphabet: $Sigma = \{0, 1\}$
     - English Alphabet: $Sigma = \{a, b, c, ..., z\}$
  3. *String (Word)*: A finite sequence of symbols chosen from an alphabet $Sigma$.
     - String length $|w|$ denotes the total number of symbol occurrences in string $w$.
     - Empty String ($epsilon$ or $lambda$): The string containing zero symbols, with length $|epsilon| = 0$.
  4. *Formal Language ($L$)*: A set of strings formed from symbols of a given alphabet $Sigma$, such that $L subset.eq Sigma^*$.
])

== Operations on Strings and Languages
Given an alphabet $Sigma$, string operations form the operational substrate of state transitions:

1. *String Concatenation*: For $w_1 = a b$ and $w_2 = c d$, $w_1 w_2 = a b c d$. Length identity: $|w_1 w_2| = |w_1| + |w_2|$.
2. *Identity Element*: For any string $w$, $w epsilon = epsilon w = w$.
3. *String Powers*: $w^0 = epsilon$, $w^1 = w$, $w^{k} = w w^{k-1}$.
4. *Prefix and Suffix*:
   - A string $x$ is a *prefix* of $w$ if there exists $y$ such that $w = x y$.
   - A string $y$ is a *suffix* of $w$ if there exists $x$ such that $w = x y$.
5. *Kleene Star Closure ($Sigma^*$)*: The set of all finite strings of any length over $Sigma$, including the empty string $epsilon$:
   $ Sigma^* = Sigma^0 union Sigma^1 union Sigma^2 union ... = union_(i=0)^(infinity) Sigma^i $
6. *Positive Closure ($Sigma^+$)*: The set of all non-empty strings over $Sigma$:
   $ Sigma^+ = Sigma^1 union Sigma^2 union ... = union_(i=1)^(infinity) Sigma^i = Sigma^* minus \{epsilon\} $

#alert("NOTE", [
  - If $|Sigma| = k$, then the total number of distinct strings of length $n$ over $Sigma$ is $k^n$.
  - $Sigma^*$ is countably infinite, whereas any individual string $w in Sigma^*$ is finite in length.
  - A language $L$ over $Sigma$ can be empty ($L = ø$), finite ($L = \{00, 11\}$), or infinite ($L = \{a^n b^n : n >= 0\}$).
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=43")[Source: Hopcroft et al., Ch 1, pp. 43–45] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/Sipser_Introduction.to.the.Theory.of.Computation.3E.pdf#page=43")[Source: Sipser, Ch 0, pp. 43–45]

#v(12pt)

// ==========================================
// SECTION 2
// ==========================================
= Finite Automata (FA) Models

A Finite State Machine (FSM) or Finite Automaton is a mathematical model of a system with discrete inputs, outputs, and a finite internal state memory.

== Formal 5-Tuple Definition of a Deterministic Finite Automaton (DFA)

#alert("DEFINITION", [
  A Deterministic Finite Automaton $M$ is defined as a 5-tuple:
  $ M = (Q, Sigma, delta, q_0, F) $
  where:
  1. $Q$ is a finite, non-empty set of *states*.
  2. $Sigma$ is a finite, non-empty set of *input symbols* (alphabet).
  3. $delta: Q times Sigma -> Q$ is the total *transition function*, mapping a state and input symbol to a unique next state.
  4. $q_0 in Q$ is the designated *initial state* (start state).
  5. $F subset.eq Q$ is the set of *final states* (accepting states).
])

== Transition Representations: Diagram and Table

An automaton can be represented equivalently via state transition diagrams or transition tables.

1. *State Transition Diagram*: A directed graph where:
   - Vertices represent states $q in Q$.
   - Directed edges labeled with $a in Sigma$ represent transitions $delta(q, a) = q'$.
   - The initial state $q_0$ is indicated by an incoming arrow pointing from nowhere.
   - Final states $F$ are indicated by double concentric circles.
2. *State Transition Table*: A tabular layout where rows correspond to states and columns correspond to input symbols. The initial state is prefixed with $->$ and final states with $*$.

== Extended Transition Function ($hat(delta)$)

To formalize how a DFA processes entire strings rather than single symbols, we extend $delta$ to $hat(delta) : Q times Sigma^* -> Q$ recursively:

- *Base Case*: 
  $ hat(delta)(q, epsilon) = q $
- *Inductive Step*: For any string $w in Sigma^*$ and symbol $a in Sigma$:
  $ hat(delta)(q, w a) = delta(hat(delta)(q, w), a) $

#alert("IMPORTANT", [
  *Language Accepted by a DFA*:
  The language $L(M)$ accepted by a DFA $M = (Q, Sigma, delta, q_0, F)$ is defined as the set of all strings in $Sigma^*$ that drive the automaton from initial state $q_0$ to some final state in $F$:
  $ L(M) = \{ w in Sigma^* : hat(delta)(q_0, w) in F \} $
  A string $w$ is *rejected* if $hat(delta)(q_0, w) !in F$.
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=46")[Source: Hopcroft et al., Ch 2, pp. 46–54] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/Sipser_Introduction.to.the.Theory.of.Computation.3E.pdf#page=46")[Source: Sipser, Ch 1, pp. 46–52]

#v(12pt)

// ==========================================
// SECTION 3
// ==========================================
= Classification & Conversions of Finite Automata

Finite Automata are categorized based on non-determinism and transition rules.

== Nondeterministic Finite Automata (NFA)

#alert("DEFINITION", [
  A Nondeterministic Finite Automaton $M$ is defined as a 5-tuple:
  $ M = (Q, Sigma, delta, q_0, F) $
  where $Q, Sigma, q_0, F$ are as defined for a DFA, but the transition function $delta$ maps to the power set of states:
  $ delta: Q times Sigma -> P(Q) quad text("(where ") P(Q) text(" is the set of all subsets of ") Q text(")") $
])

*Extended Transition Function for NFA ($hat(delta)$)*:
- *Base Case*: $hat(delta)(q, epsilon) = \{q\}$
- *Inductive Step*: For $w in Sigma^*$ and $a in Sigma$:
  $ hat(delta)(q, w a) = union_(p in hat(delta)(q, w)) delta(p, a) $

== NFA with $epsilon$-moves ($epsilon$-NFA)

An $epsilon$-NFA allows transitions without consuming input symbols (spontaneous moves):
$ delta: Q times (Sigma union \{epsilon\}) -> P(Q) $

#alert("DEFINITION", [
  For any state $q in Q$, $text("Epsilon-Closure")(q)$ or $epsilon"-closure"(q)$ is the set of all states reachable from $q$ by taking zero or more $epsilon$-transitions.
  
  *Recursive Calculation Algorithm*:
  1. Base: $q in epsilon"-closure"(q)$.
  2. Induction: If $p in epsilon"-closure"(q)$ and $r in delta(p, epsilon)$, then $r in epsilon"-closure"(q)$.
  
  For a set of states $S subset.eq Q$:
  $ epsilon"-closure"(S) = union_(q in S) epsilon"-closure"(q) $
])

== Conversion Algorithms

=== Algorithm 1: Conversion of $epsilon$-NFA to NFA (Eliminating $epsilon$-moves)
Given an $epsilon$-NFA $M = (Q, Sigma, delta, q_0, F)$, construct an equivalent NFA $M' = (Q, Sigma, delta', q_0, F')$:
1. Compute $epsilon"-closure"(q)$ for every state $q in Q$.
2. Define the new transition function $delta'$ for state $q$ and symbol $a in Sigma$:
   $ delta'(q, a) = epsilon"-closure"(delta(epsilon"-closure"(q), a)) $
3. Update the set of final states $F'$:
   $ F' = \{ q in Q : epsilon"-closure"(q) inter F != ø \} $

=== Algorithm 2: Conversion of NFA to DFA (Subset Construction / Power Set Construction)
Given NFA $M_N = (Q_N, Sigma, delta_N, q_0, F_N)$, construct DFA $M_D = (Q_D, Sigma, delta_D, q_0^D, F_D)$:
1. Set the initial state of DFA: $q_0^D = \{q_0\}$. Add $\{q_0\}$ to $Q_D$ as an unprocessed state set.
2. While there exist unprocessed state sets $S in Q_D$:
   - For each input symbol $a in Sigma$:
     - Compute $S' = union_(q in S) delta_N(q, a)$.
     - Set $delta_D(S, a) = S'$.
     - If $S' !in Q_D$ and $S' != ø$, add $S'$ to $Q_D$ as an unprocessed state set.
3. Define DFA final states $F_D = \{ S in Q_D : S inter F_N != ø \}$.

=== Algorithm 3: Direct Conversion of $epsilon$-NFA to DFA
1. Start with initial DFA state $q_0^D = epsilon"-closure"(q_0)$.
2. For each state subset $S in Q_D$ and symbol $a in Sigma$:
   $ delta_D(S, a) = epsilon"-closure"(union_(q in S) delta(q, a)) $
3. Repeat until no new state subsets are discovered. Set $F_D = \{ S in Q_D : S inter F != ø \}$.

#alert("IMPORTANT", [
  *Equivalence Theorem*: DFA, NFA, and $epsilon$-NFA are equivalent in language recognition power. Every NFA and $epsilon$-NFA can be converted to an equivalent DFA recognizing the exact same language $L$.
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=55")[Source: Hopcroft et al., Ch 2, pp. 55–80] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=88")[Source: KLP Mishra, Ch 3, pp. 88–97]

#v(12pt)

// ==========================================
// SECTION 4
// ==========================================
= Minimization & Equivalence of Finite Automata

Minimization converts a DFA into an equivalent DFA with the minimum possible number of states.

== State Equivalence and Distinguishability

#alert("DEFINITION", [
  1. *Equivalent States*: Two states $p, q in Q$ of a DFA are *equivalent* ($p equiv q$) if for all strings $w in Sigma^*$:
     $ hat(delta)(p, w) in F <==> hat(delta)(q, w) in F $
  2. *Distinguishable States*: If there exists at least one string $w in Sigma^*$ such that one of $hat(delta)(p, w), hat(delta)(q, w)$ is in $F$ and the other is not, then states $p$ and $q$ are *distinguishable* (denoted $p cancel(equiv) q$).
  3. *$k$-Distinguishability*: States $p$ and $q$ are $k$-distinguishable if they can be distinguished by a string $w$ of length $|w| <= k$.
])

== DFA Minimization Algorithm (Table-Filling Method / Myhill-Nerode Theorem)

1. *Unreachable State Elimination*: Remove all states that cannot be reached from the initial state $q_0$ via any path.
2. *Table Initialization*: Construct a triangular table for all pairs $(p, q)$ with $p != q$.
3. *Base Step*: Mark all pairs $(p, q)$ where $p in F$ and $q !in F$ (or vice versa) as distinguishable (check mark $X$).
4. *Inductive Step*: For each unmarked pair $(p, q)$ and each symbol $a in Sigma$:
   - Find $p' = delta(p, a)$ and $q' = delta(q, a)$.
   - If pair $(p', q')$ is already marked distinguishable, then mark $(p, q)$ as distinguishable.
   - Repeat this process until an entire pass produces no new marked pairs.
5. *State Merger*: Group all remaining unmarked state pairs into equivalence classes using transitivity. Construct the minimized DFA where each equivalence class forms a single combined state.

== Testing Equivalence of Two Finite Automata

To test whether two DFAs $M_1$ and $M_2$ are equivalent ($L(M_1) = L(M_2)$):
1. Combine $M_1$ and $M_2$ into a single merged transition table (renaming states to avoid collisions).
2. Run the Table-Filling Algorithm on state pairs.
3. If initial states $q_{01}$ and $q_{02}$ are found to be *equivalent*, then $M_1 equiv M_2$; otherwise, they are not equivalent.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=155")[Source: Hopcroft et al., Ch 4, pp. 155–165] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=105")[Source: KLP Mishra, Ch 3, pp. 105–112]

#v(12pt)

// ==========================================
// SECTION 5
// ==========================================
= Finite State Machines with Output (Moore & Mealy Machines)

For transducer applications, finite state machines produce output strings during state transitions.

== Moore Machine

#alert("DEFINITION", [
  A Moore machine is a 6-tuple:
  $ M = (Q, Sigma, Delta, delta, lambda, q_0) $
  where:
  - $Q, Sigma, delta, q_0$ are as defined for a DFA.
  - $Delta$ is the finite *output alphabet*.
  - $lambda: Q -> Delta$ is the *output function*, mapping each state to an output symbol.
  
  *Output Rule*: The output depends *only* on the current state.
  For an input string $w = a_1 a_2 ... a_n$ of length $n$, the output string length is $n + 1$:
  $ text("Output") = lambda(q_0) lambda(q_1) lambda(q_2) ... lambda(q_n) $
])

== Mealy Machine

#alert("DEFINITION", [
  A Mealy machine is a 6-tuple:
  $ M = (Q, Sigma, Delta, delta, lambda, q_0) $
  where $lambda: Q times Sigma -> Delta$ maps state-input pairs to output symbols.
  
  *Output Rule*: The output depends on *both* the current state and the current input symbol.
  For an input string $w = a_1 a_2 ... a_n$ of length $n$, the output string length is $n$:
  $ text("Output") = lambda(q_0, a_1) lambda(q_1, a_2) ... lambda(q_{n-1}, a_n) $
])

== Inter-Conversion Algorithms

=== Algorithm 1: Conversion of Moore Machine to Mealy Machine
Given Moore Machine $M = (Q, Sigma, Delta, delta, lambda_"Moore", q_0)$:
Construct Mealy Machine $M' = (Q, Sigma, Delta, delta, lambda_"Mealy", q_0)$ with identical states:
$ lambda_"Mealy"(q, a) = lambda_"Moore"(delta(q, a)) quad forall q in Q, a in Sigma $

=== Algorithm 2: Conversion of Mealy Machine to Moore Machine
Given Mealy Machine $M = (Q, Sigma, Delta, delta, lambda_"Mealy", q_0)$:
1. For each state $q in Q$, examine all incoming transitions to $q$.
2. If state $q$ receives transitions producing different output symbols $b_1, b_2, ... in Delta$, split state $q$ into multiple sub-states $q_{b_1}, q_{b_2}, ...$.
3. Assign output function $lambda_"Moore"(q_b) = b$.
4. Re-route all transitions incoming to $q$ producing output $b$ to state $q_b$, and replicate all outgoing transitions of $q$ for each split sub-state.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=84")[Source: KLP Mishra, Ch 3, pp. 84–88] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=99")[Source: Hopcroft et al., Ch 3, pp. 99–101]

#v(12pt)

// ==========================================
// SECTION 6
// ==========================================
= Real-World Applications of Finite Automata

Finite Automata serve as foundational computational structures across modern computer science disciplines:

1. *Lexical Analysis in Compilers*:
   - Scanner generators (e.g. `lex`, `flex`) construct DFAs from regular expressions to tokenize program source code into identifiers, keywords, numbers, and operators.
2. *Pattern Matching and String Searching*:
   - Algorithms like Knuth-Morris-Pratt (KMP) and Aho-Corasick construct deterministic state transitions to perform fast linear-time $O(n)$ pattern matching over text streams.
3. *Digital Logic and Controller Design*:
   - Hardware sequential circuits, traffic light controllers, vending machines, and protocol stacks (e.g., TCP state machines) are modeled and verified using finite state transducers.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=68")[Source: Hopcroft et al., Ch 2, pp. 68–71] | #link("file:///Users/ashley/Documents/SEM5/.syllabus/SPPU%20TE%20IT%202024%20Pattern%20Final_31072026.pdf#page=20")[Source: SPPU Syllabus PCC-303-ITT, p. 20]

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#1e293b"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Theory of Computation Unit 1 Theory Notes — SPPU TE IT 2024 Pattern
  ]
]
