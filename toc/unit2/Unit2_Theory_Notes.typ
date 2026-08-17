// Typst Theory Notes - Theory of Computation (Unit 2)
// Course Code: PCC-303-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[THEORY OF COMPUTATION — UNIT 2]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Regular Expressions & Regular Languages]]
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 2: REGULAR EXPRESSIONS AND LANGUAGES]
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
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 2.

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
  [*Regular Expression (RE) Fundamentals*], [Formal Definition of RE, Primitive terms ($ø, epsilon, a$), Operators (Union $+$, Concatenation $\cdot$, Kleene Star $*$), Identities & Algebraic Laws, Equivalence of REs.], [High Priority \ (4-6 Marks Qs)],
  [*Equivalence of RE & Regular Languages*], [Equivalence theorem, Converting algebraic RE to Regular Languages (RL), Properties of Regular Sets.], [High Priority \ (6-8 Marks Qs)],
  [*RE to FA Conversion (Direct Method)*], [McNaughton-Yamada-Thompson Construction, Direct Conversion of RE to $epsilon$-NFA / NFA / DFA.], [High Priority \ (8-10 Marks Qs)],
  [*FA to RE Conversion (Arden's Theorem)*], [Arden's Theorem statement & proof ($R = Q + R P ==> R = Q P^*$), System of linear equations method, State Elimination Method.], [High Priority \ (8-10 Marks Qs)],
  [*Closure Properties of Regular Languages*], [Closure under Union, Concatenation, Kleene Star, Intersection, Complement, Difference, Reversal, and Homomorphism.], [High Priority \ (8-10 Marks Qs)],
  [*Applications of RE*], [Password & Input Validation Systems, Pattern Matching, Intrusion Detection Systems (IDS), Lexical Analysis.], [Medium Priority \ (4-6 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Regular Expressions (RE) and Algebraic Identities

== Definition and Operators of Regular Expressions

A Regular Expression (RE) is an algebraic declaration that specifies a regular language over an alphabet $Sigma$.

#alert("DEFINITION", [
  Let $Sigma$ be an alphabet. A *Regular Expression* over $Sigma$ and the set $L(R)$ of strings it denotes are defined inductively:
  
  *Base Cases*:
  1. $ø$ is a regular expression representing the empty language $L(ø) = ø$.
  2. $epsilon$ is a regular expression representing the language $L(epsilon) = \{epsilon\}$.
  3. For each symbol $a in Sigma$, $a$ is a regular expression representing $L(a) = \{a\}$.
  
  *Inductive Steps*: If $r_1$ and $r_2$ are regular expressions denoting $L(r_1)$ and $L(r_2)$ respectively:
  1. *Union (Disjunction)*: $(r_1 + r_2)$ or $(r_1 | r_2)$ denotes $L(r_1) union L(r_2)$.
  2. *Concatenation*: $(r_1 r_2)$ or $(r_1 \cdot r_2)$ denotes $L(r_1) L(r_2)$.
  3. *Kleene Closure*: $(r_1^*)$ denotes $(L(r_1))^*$.
])

== Precedence of RE Operators
When evaluating regular expressions without explicit parentheses, the standard operator precedence order is:
1. *Kleene Star ($*$)*: Highest precedence (applies to the immediate preceding character or parenthesized subexpression).
2. *Concatenation ($\cdot$)*: Second highest precedence.
3. *Union ($+$ or $|$)*: Lowest precedence.

== Algebraic Identities and Laws of Regular Expressions

#alert("NOTE", [
  For any regular expressions $P, Q, R$:
  - *Identity for Union*: $P + ø = P$, $P + P = P$ (Idempotence).
  - *Identity for Concatenation*: $P epsilon = epsilon P = P$.
  - *Annihilator for Concatenation*: $P ø = ø P = ø$.
  - *Commutativity of Union*: $P + Q = Q + P$.
  - *Associativity*: $(P + Q) + R = P + (Q + R)$, $(P Q) R = P (Q R)$.
  - *Distributivity*: $P (Q + R) = P Q + P R$, $(P + Q) R = P R + Q R$.
  - *Closure Identities*:
    - $ø^* = epsilon$, $epsilon^* = epsilon$.
    - $P^* P^* = P^*$, $(P^*)^*= P^*$.
    - $P P^* = P^* P = P^+$.
    - $(P + Q)^* = (P^* Q^*)^* = (P^* + Q^*)^*$.
    - $P (Q P)^* = (P Q)^* P$.
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=85")[Source: Hopcroft et al., Ch 3, pp. 85–91] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=149")[Source: KLP Mishra, Ch 5, pp. 149–153]

#v(12pt)

// ==========================================
// SECTION 2
// ==========================================
= Equivalence of Regular Expressions and Regular Languages

== Definition of Regular Languages (RL)
A language $L subset.eq Sigma^*$ is defined as a *Regular Language* if and only if there exists a finite automaton (DFA, NFA, or $epsilon$-NFA) that accepts $L$, or equivalently, if $L$ can be described by a regular expression $R$.

#alert("IMPORTANT", [
  *Equivalence Theorem (Kleene's Theorem)*:
  A language $L$ is accepted by a Finite Automaton if and only if $L$ is represented by a Regular Expression.
  
  $ "Finite Automata (DFA / NFA)" <===> "Regular Language (RL)" <===> "Regular Expression (RE)" $
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=92")[Source: Hopcroft et al., Ch 3, pp. 92–93] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/Sipser_Introduction.to.the.Theory.of.Computation.3E.pdf#page=87")[Source: Sipser, Ch 1, pp. 87–90]

#v(12pt)

// ==========================================
// SECTION 3
// ==========================================
= Conversion of Regular Expression to Finite Automata

== Thompson's Construction (Direct Method for RE to $epsilon$-NFA)

Thompson's construction algorithm recursively builds an $epsilon$-NFA from a given regular expression $R$.

#alert("DEFINITION", [
  *Base Structural Rules*:
  1. For $r = ø$: Initial state $q_0$ with no transitions to final state $q_f$.
  2. For $r = epsilon$: $q_0 -->^epsilon q_f$.
  3. For $r = a$ ($a in Sigma$): $q_0 -->^a q_f$.

  *Composite Structural Rules*:
  1. *Union ($r_1 + r_2$)*: Introduce new start state $q_0$ with $epsilon$-moves to start states of $N(r_1)$ and $N(r_2)$, and $epsilon$-moves from their final states to a new final state $q_f$.
  2. *Concatenation ($r_1 r_2$)*: Connect final state of $N(r_1)$ to start state of $N(r_2)$ via $epsilon$-transition.
  3. *Kleene Star ($r_1^*$)*: Introduce new start state $q_0$ and final state $q_f$. Add $epsilon$-moves from $q_0 --> q_f$, $q_0 --> "start"(N(r_1))$, $"final"(N(r_1)) --> q_f$, and loopback $"final"(N(r_1)) --> "start"(N(r_1))$.
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=102")[Source: Hopcroft et al., Ch 3, pp. 102–107] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=160")[Source: KLP Mishra, Ch 5, pp. 160–165]

#v(12pt)

// ==========================================
// SECTION 4
// ==========================================
= Conversion of Finite Automata to Regular Expressions

== Arden's Theorem

Arden's Theorem provides a systematic algebraic tool to solve set equations for converting Finite Automata to Regular Expressions.

#alert("DEFINITION", [
  *Statement of Arden's Theorem*:
  Let $P$ and $Q$ be two regular expressions over $Sigma$. If $P$ does not contain the empty string $epsilon$ ($epsilon !in L(P)$), then the linear equation in $R$:
  $ R = Q + R P $
  has a *unique solution* given by:
  $ R = Q P^* $
])

#alert("NOTE", [
  *Proof of Arden's Theorem*:
  1. *Existence*: Substitute $R = Q P^*$ into RHS:
     $ "RHS" = Q + (Q P^*) P = Q (epsilon + P^* P) = Q P^* = "LHS" $
  2. *Uniqueness*: Repeatedly substitute $R = Q + R P$ into itself:
     $ R = Q + (Q + R P) P = Q + Q P + R P^2 = Q (epsilon + P + P^2 + ... + P^k) + R P^{k+1} $
     As $k \to infinity$, $Q (epsilon + P + P^2 + ...) = Q P^*$. Since $epsilon !in L(P)$, $R P^{k+1}$ contains strings of length at least $k+1$, contributing nothing to finite strings denoted by $R$. Thus $R = Q P^*$.
])

== Conversion of FA to RE using Arden's Theorem (System of Linear Equations)
Given a DFA/NFA with states $q_1, q_2, ..., q_n$ where $q_1$ is the initial state:
1. Write a state transition equation for each state $q_i$:
   $ q_i = sum_j q_j w_{j i} + "(add " epsilon " if " q_i " is initial state " q_1 ")" $
   where $w_{j i}$ is the symbol labeling the transition from $q_j$ to $q_i$.
2. Solve the system of algebraic equations for state variables using Arden's Theorem ($R = Q + R P ==> R = Q P^*$).
3. The overall regular expression for the FA is the sum of expressions for all final states $q_f in F$:
   $ R_("total") = sum_(q_f in F) q_f $

== State Elimination Method
An alternative structural method to convert FA to RE:
1. Construct a Generalized Transition Graph (GTG) with single initial state $q_0$ and single final state $q_f$.
2. Eliminate intermediate states one by one. When eliminating state $q_k$, update transition labels between remaining states $p$ and $q$ via:
   $ R'_{p q} = R_{p q} + R_{p k} (R_{k k})^* R_{k q} $
3. Repeat until only $q_0$ and $q_f$ remain. The final edge label is the regular expression.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=152")[Source: KLP Mishra, Ch 5, pp. 152–158] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=93")[Source: Hopcroft et al., Ch 3, pp. 93–98]

#v(12pt)

// ==========================================
// SECTION 5
// ==========================================
= Closure Properties of Regular Languages

Regular languages are closed under various operations, meaning applying these operations on regular languages yields another regular language.

#alert("IMPORTANT", [
  *Summary of Closure Properties*:
  1. *Union*: If $L_1, L_2$ are regular, $L_1 union L_2$ is regular (by parallel FA construction or $R_1 + R_2$).
  2. *Concatenation*: If $L_1, L_2$ are regular, $L_1 L_2$ is regular (by sequential FA construction or $R_1 R_2$).
  3. *Kleene Closure*: If $L$ is regular, $L^*$ is regular.
  4. *Complement*: If $L$ is regular over $Sigma$, $L^c = Sigma^* minus L$ is regular (swap final & non-final states in DFA).
  5. *Intersection*: If $L_1, L_2$ are regular, $L_1 inter L_2$ is regular (by Product Automaton construction or De Morgan's Law: $L_1 inter L_2 = (L_1^c union L_2^c)^c$).
  6. *Difference*: $L_1 minus L_2 = L_1 inter L_2^c$ is regular.
  7. *Reversal*: $L^R = \{ w^R : w in L \}$ is regular (reverse all transition arrows in FA and swap initial & final states).
  8. *Homomorphism*: If $h: Sigma -> Gamma^*$ is a homomorphism, $h(L)$ is regular.
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=133")[Source: Hopcroft et al., Ch 4, pp. 133–148] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=170")[Source: KLP Mishra, Ch 5, pp. 170–178]

#v(12pt)

// ==========================================
// SECTION 6
// ==========================================
= Real-World Applications of Regular Expressions

1. *Password & Input Validation Systems*:
   - Form field validation (e.g. email verification, strong password criteria) via regex engines.
2. *Intrusion Detection Systems (IDS) & Log Analysis*:
   - Deep packet inspection engines and security audit tools (e.g. `Snort`, `grep`) use regex pattern matching to detect signature vectors and unauthorized access logs.
3. *Lexical Analysis in Compilers*:
   - Standard lexer tools (`flex`, `lex`) match token streams (identifiers, literals, operators) using compiled minimal DFAs derived from regular expressions.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=109")[Source: Hopcroft et al., Ch 3, pp. 109–114] | #link("file:///Users/ashley/Documents/SEM5/.syllabus/SPPU%20TE%20IT%202024%20Pattern%20Final_31072026.pdf#page=20")[Source: SPPU Syllabus PCC-303-ITT, p. 20]

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#1e293b"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Theory of Computation Unit 2 Theory Notes — SPPU TE IT 2024 Pattern
  ]
]
