// Typst Theory Notes - Theory of Computation (Unit 4)
// Course Code: PCC-303-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[THEORY OF COMPUTATION — UNIT 4]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Pushdown Automata & Turing Machines]]
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
    "DEFINITION": (border: rgb("#334155"), bg: rgb("#f8fafc")),
    "INTUITION": (border: rgb("#475569"), bg: rgb("#f8fafc"))
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 4: PUSHDOWN AUTOMATA AND TURING MACHINES]
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
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 4.

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
  [*Pushdown Automata (PDA) Fundamentals*], [Formal 7-tuple definition ($Q, Sigma, Gamma, delta, q_0, Z_0, F$), Instantaneous Description (ID: $(q, w, alpha)$), Transition rules (push, pop, no-op).], [High Priority \ (6-8 Marks Qs)],
  [*Modes of Acceptance & Equivalence*], [Acceptance by Final State $L(M)$ vs. Empty Stack $N(M)$, Equivalence algorithms ($L(M) arrow.l.r N(M)$), Equivalence of CFG and PDA.], [High Priority \ (8-10 Marks Qs)],
  [*Deterministic PDA (DPDA) & Parsing*], [Definition of DPDA, Strict subset relationship ($"DCFL" subset "CFL"$), Unambiguous parsing, LL(k) and LR(k) parser foundations.], [High Priority \ (6-8 Marks Qs)],
  [*Turing Machine (TM) Fundamentals*], [Formal 7-tuple definition ($Q, Sigma, Gamma, delta, q_0, B, F$), Infinite tape model, Read/Write head movements ($L, R$), Instantaneous Description ($X_1 ... X_{i-1} q X_i ... X_k$).], [High Priority \ (8-10 Marks Qs)],
  [*Turing Machine Design & Computations*], [Designing TMs for languages ($a^n b^n$, $a^n b^n c^n$, $\{w w^R\}$), TMs as integer function computers (1's complement, addition, multiplication).], [High Priority \ (8-10 Marks Qs)],
  [*Turing Machine Variants & Universal TM*], [Multi-Tape TM, Nondeterministic TM (NTM), Universal Turing Machine (UTM: stored-program model), Linear Bounded Automata (LBA).], [High Priority \ (6-8 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Pushdown Automata (PDA) Models

A Pushdown Automaton is a finite automaton equipped with an auxiliary Infinite Stack memory (Last-In, First-Out).

== Formal 7-Tuple Definition of a Pushdown Automaton

#alert("DEFINITION", [
  A Non-Deterministic Pushdown Automaton (PDA) $M$ is defined as a 7-tuple:
  $ M = (Q, Sigma, Gamma, delta, q_0, Z_0, F) $
  where:
  1. $Q$ is a finite non-empty set of *control states*.
  2. $Sigma$ is a finite non-empty set of *input symbols* (input alphabet).
  3. $Gamma$ is a finite non-empty set of *stack symbols* (stack alphabet).
  4. $delta: Q times (Sigma union \{epsilon\}) times Gamma -> P_f (Q times Gamma^*)$ is the *transition function*, mapping a state, optional input symbol, and top stack symbol to a finite set of next state and stack replacement string pairs.
  5. $q_0 in Q$ is the designated *initial state*.
  6. $Z_0 in Gamma$ is the *start stack symbol*.
  7. $F subset.eq Q$ is the set of *final (accepting) states*.
])

== Instantaneous Description (ID) of a PDA

The complete configuration of a PDA at any step of computation is captured by its Instantaneous Description (ID).

#alert("DEFINITION", [
  An *Instantaneous Description (ID)* of a PDA is a triple:
  $ (q, w, gamma) in Q times Sigma^* times Gamma^* $
  where:
  - $q$ is the current control state.
  - $w$ is the remaining unread input string.
  - $gamma$ is the complete stack contents, written with the *top of stack at the leftmost symbol*.

  *Turnstile Transition Relation (|-)*:
  If $delta(q, a, Z)$ contains $(p, alpha)$ for $a in Sigma union \{epsilon\}$:
  $ (q, a w, Z beta) |- (p, w, alpha beta) $
  - *Pop Operation*: $alpha = epsilon$ (removes $Z$ from top of stack).
  - *No-Op / Change Symbol*: $alpha = Y$ (replaces top symbol $Z$ with $Y$).
  - *Push Operation*: $alpha = Y Z$ or $Y_1 Y_2 ... Z$ (pushes new symbols onto stack above $Z$).
])

== Modes of Acceptance: Final State vs. Empty Stack

#alert("IMPORTANT", [
  1. *Acceptance by Final State ($L(M)$)*: The set of strings that drive the PDA from initial ID $(q_0, w, Z_0)$ to a state in $F$, regardless of stack contents:
     $ L(M) = \{ w in Sigma^* : (q_0, w, Z_0) |-^* (p, epsilon, gamma) text(" for some ") p in F, gamma in Gamma^* \} $
  2. *Acceptance by Empty Stack ($N(M)$)*: The set of strings that empty the stack completely, regardless of the final state reached:
     $ N(M) = \{ w in Sigma^* : (q_0, w, Z_0) |-^* (p, epsilon, epsilon) text(" for any ") p in Q \} $
  
  *Equivalence Theorem*: A language $L$ is accepted by some PDA $M_1$ by final state if and only if $L$ is accepted by some PDA $M_2$ by empty stack ($L(M_1) = N(M_2) = L$).
])

== Deterministic Pushdown Automata (DPDA)

#alert("DEFINITION", [
  A PDA $M = (Q, Sigma, Gamma, delta, q_0, Z_0, F)$ is *Deterministic (DPDA)* if:
  1. For any $q in Q, a in Sigma, Z in Gamma$, the set $delta(q, a, Z)$ contains at most one element.
  2. If $delta(q, epsilon, Z)$ is non-empty, then $delta(q, a, Z)$ must be empty for all $a in Sigma$.
  
  *Structural Hierarchy*: Deterministic Context-Free Languages (DCFL) form a *strict proper subset* of Context-Free Languages ($"DCFL" subset "CFL"$). For example, the language of even-length palindromes $L = \{w w^R : w in \{a, b\}^*\}$ is a CFL but *not* a DCFL.
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=225")[Source: Hopcroft et al., Ch 6, pp. 225–240] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=205")[Source: KLP Mishra, Ch 7, pp. 205–220]

#v(12pt)

// ==========================================
// SECTION 2
// ==========================================
= Equivalence of CFG and PDA

#alert("IMPORTANT", [
  *Theorem of Equivalence*:
  A language $L$ is context-free ($L = L(G)$ for some CFG $G$) if and only if $L$ is accepted by a Pushdown Automaton ($L = N(M)$ for some PDA $M$).
])

== Conversion of CFG to PDA (Top-Down Parser Simulation)
Given CFG $G = (V, T, P, S)$, construct a 1-state PDA $M = (\{q\}, T, V union T, delta, q, S, ø)$ accepting by empty stack:
1. For the start state, place $S$ on top of the stack ($Z_0 = S$).
2. For each non-terminal production $A -> alpha in P$, add rule:
   $ delta(q, epsilon, A) text(" contains ") (q, alpha) $
3. For each terminal symbol $a in T$, add match rule:
   $ delta(q, a, a) = \{(q, epsilon)\} $

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=241")[Source: Hopcroft et al., Ch 6, pp. 241–250] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=221")[Source: KLP Mishra, Ch 7, pp. 221–228]

#v(12pt)

// ==========================================
// SECTION 3
// ==========================================
= Turing Machine (TM) Foundations

A Turing Machine is an abstract computing device possessing a finite control unit, a read/write head, and an *infinitely long two-way tape* divided into cells.

== Formal 7-Tuple Definition of a Turing Machine

#alert("DEFINITION", [
  A Deterministic Turing Machine $M$ is defined as a 7-tuple:
  $ M = (Q, Sigma, Gamma, delta, q_0, B, F) $
  where:
  1. $Q$ is a finite non-empty set of *control states*.
  2. $Sigma$ is a finite non-empty set of *input symbols*.
  3. $Gamma$ is a finite non-empty set of *tape symbols*, such that $Sigma subset "Strict" Gamma$.
  4. $delta: Q times Gamma -> Q times Gamma times \{L, R\}$ is the *transition function*, mapping current state and scanned tape symbol to a next state, a replacement symbol to write, and a head movement direction (Left $L$ or Right $R$).
  5. $q_0 in Q$ is the designated *initial state*.
  6. $B in Gamma minus Sigma$ is the *blank symbol*, filling all tape cells not containing input.
  7. $F subset.eq Q$ is the set of *final (halting/accepting) states*.
])

== Instantaneous Description (ID) of a Turing Machine

An ID of a Turing Machine represents the complete current configuration:
$ X_1 X_2 ... X_{i-1} q X_i X_{i+1} ... X_k $
- The string $X_1 X_2 ... X_k in Gamma^*$ represents non-blank tape contents.
- The control state $q in Q$ is written immediately to the left of symbol $X_i$ currently scanned by the read/write head.

*Turnstile Transition Rules*:
- If $delta(q, X_i) = (p, Y, R)$, head moves Right:
  $ X_1 ... X_{i-1} q X_i X_{i+1} ... X_k |- X_1 ... X_{i-1} Y p X_{i+1} ... X_k $
- If $delta(q, X_i) = (p, Y, L)$, head moves Left:
  $ X_1 ... X_{i-1} q X_i X_{i+1} ... X_k |- X_1 ... p X_{i-1} Y X_{i+1} ... X_k $

#alert("IMPORTANT", [
  *Language Accepted by a Turing Machine*:
  $ L(M) = \{ w in Sigma^* : q_0 w |-^* alpha_1 p alpha_2 text(" for some ") p in F, alpha_1, alpha_2 in Gamma^* \} $
  A string $w$ is accepted if $M$ eventually enters an accepting state $p in F$ and halts.
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=319")[Source: Hopcroft et al., Ch 8, pp. 319–335] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=261")[Source: KLP Mishra, Ch 8, pp. 261–280]

#v(12pt)

// ==========================================
// SECTION 4
// ==========================================
= Turing Machine Design & Integer Computations

Turing Machines function as language acceptors and integer function computers.

#alert("INTUITION", [
  *Turing Machine Design Logic for $a^n b^n c^n$*:
  1. Scan left-to-right: Replace first unmarked $a$ with $X$, search right for first unmarked $b$ and replace with $Y$, search right for first unmarked $c$ and replace with $Z$.
  2. Move head left past $X, Y, Z$ back to first unmarked $a$.
  3. Repeat match cycle until all $a, b, c$ symbols are converted to $X, Y, Z$.
  4. Verify no remaining extra symbols exist. Enter final accepting state $q_f$.
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=281")[Source: KLP Mishra, Ch 8, pp. 281–295] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=336")[Source: Hopcroft et al., Ch 8, pp. 336–342]

#v(12pt)

// ==========================================
// SECTION 5
// ==========================================
= Turing Machine Variants and Universal TM

== 1. Multi-Tape Turing Machine
Has multiple storage tapes, each with its own read/write head. A Multi-Tape TM with $k$ tapes is *equivalent* in computational power to a standard single-tape TM (can be simulated with quadratic time slowdown $O(n^2)$).

== 2. Non-Deterministic Turing Machine (NTM)
The transition function maps to a finite set of next moves:
$ delta: Q times Gamma -> P_f (Q times Gamma times \{L, R\}) $
Every NTM is *equivalent* in computational recognition power to a Deterministic TM (simulated via breadth-first search of computation tree).

== 3. Universal Turing Machine (UTM)
A single static Turing Machine $U$ that takes as input a string encoding of another TM $M$ and an input $w$ ($angle.l M, w angle.r$), and simulates the execution of $M$ on $w$. The UTM is the theoretical blueprint for modern general-purpose stored-program computers.

== 4. Linear Bounded Automata (LBA)
A non-deterministic Turing Machine whose tape head is restricted to move only within the bounded portion of tape occupied by initial input w. LBAs recognize Context-Sensitive Languages (Type 1).

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=343")[Source: Hopcroft et al., Ch 8, pp. 343–360] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=296")[Source: KLP Mishra, Ch 8, pp. 296–310]

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#1e293b"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Theory of Computation Unit 4 Theory Notes — SPPU TE IT 2024 Pattern
  ]
]
