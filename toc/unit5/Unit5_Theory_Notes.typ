// Typst Theory Notes - Theory of Computation (Unit 5)
// Course Code: PCC-303-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[THEORY OF COMPUTATION — UNIT 5]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Decidability & Complexity]]
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 5: DECIDABILITY AND COMPUTATIONAL COMPLEXITY]
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
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 5.

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
  [*Decidability & Language Classes*], [Church-Turing Thesis, Recursive Languages (Decidable), Recursively Enumerable Languages (Semi-decidable), Complement closure properties theorem.], [High Priority \ (6-8 Marks Qs)],
  [*Decidable & Undecidable Problems*], [Decidable problems for Regular & Context-Free Languages (Emptiness, Finiteness, Membership), Undecidability definition, Halting Problem proof ($H_("TM")$).], [High Priority \ (8-10 Marks Qs)],
  [*Reducibility & Post Correspondence*], [Mapping Reducibility ($L_1 <=_m L_2$), Post Correspondence Problem (PCP) & Modified PCP (MPCP) statement & proof of undecidability.], [High Priority \ (8-10 Marks Qs)],
  [*Computational Complexity Classes*], [Time Complexity $T(n)$, Class P (Polynomial Time), Class NP (Nondeterministic Polynomial Time), Polynomial-time reducibility ($<=_p$).], [High Priority \ (8-10 Marks Qs)],
  [*NP-Completeness & Classic Problems*], [Definition of NP-Hard and NP-Complete, Cook-Levin Theorem (Boolean Satisfiability - SAT), 3-SAT, Vertex Cover, Clique, Traveling Salesperson Problem.], [High Priority \ (8-10 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Church-Turing Thesis and Decidability Foundations

== The Church-Turing Thesis
The Church-Turing Thesis posits that the intuitive, informal notion of an effective algorithm or computation is precisely captured by the mathematical model of a Turing Machine.

#alert("DEFINITION", [
  *Church-Turing Thesis*:
  Any algorithmic process that can be performed by a human or digital computer can be simulated by a Turing Machine.
])

== Recursive vs. Recursively Enumerable Languages

#alert("DEFINITION", [
  1. *Recursive Language (Decidable Language)*: A language $L subset.eq Sigma^*$ for which there exists a Turing Machine $M$ that *halts on all inputs* $w in Sigma^*$:
     - If $w in L$, $M$ halts in an accepting state.
     - If $w !in L$, $M$ halts in a rejecting state.
  2. *Recursively Enumerable (RE) Language (Turing-Recognizable)*: A language $L$ for which there exists a Turing Machine $M$ such that:
     - If $w in L$, $M$ halts in an accepting state.
     - If $w !in L$, $M$ either halts in a non-accepting state OR loops infinitely.
])

#alert("IMPORTANT", [
  *Complement Closure Theorem*:
  A language $L$ is *Recursive* if and only if both $L$ and its complement $L^c$ are *Recursively Enumerable (RE)*.
  
  *Proof Outline*: Run TMs $M_1$ (recognizing $L$) and $M_2$ (recognizing $L^c$) in parallel step-by-step. Since every string $w$ belongs to either $L$ or $L^c$, exactly one TM will halt and accept, guaranteeing a total decider algorithm.
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=375")[Source: Hopcroft et al., Ch 9, pp. 375–385] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/Sipser_Introduction.to.the.Theory.of.Computation.3E.pdf#page=195")[Source: Sipser, Ch 3, pp. 195–210]

#v(12pt)

// ==========================================
// SECTION 2
// ==========================================
= Decidable and Undecidable Problems

A decision problem is a question with a binary Yes/No answer over a set of inputs.

== Decidability of Formal Language Properties

#table(
  columns: (1.5fr, 1fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#1e293b") } else if calc.odd(y) { rgb("#f1f5f9") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Decision Problem]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Regular]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Context-Free]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Recursively Enumerable]*]
  ),
  [*Membership Problem ($w in L$)*], [Decidable], [Decidable (CYK)], [Undecidable (Halting)],
  [*Emptiness Problem ($L = ø$)*], [Decidable], [Decidable], [Undecidable],
  [*Finiteness Problem ($|L| < infinity$)*], [Decidable], [Decidable], [Undecidable],
  [*Equivalence ($L_1 = L_2$)*], [Decidable], [Undecidable], [Undecidable],
  [*Ambiguity of Grammar*], [N/A], [Undecidable], [N/A]
)

== The Halting Problem of Turing Machines

#alert("DEFINITION", [
  *Statement of Halting Problem ($H_("TM")$)*:
  Given a Turing Machine $M$ and an input string $w$, determine whether $M$ eventually halts when run on $w$.
  
  $ H_("TM") = \{ (M, w) : M " is a TM that halts on input " w \} $
])

#alert("NOTE", [
  *Proof of Undecidability via Diagonalization*:
  1. Assume by contradiction that there exists a decider TM $H(M, w)$ that outputs "YES" if $M$ halts on $w$, and "NO" if $M$ loops forever on $w$.
  2. Construct a new machine $D(M)$ that takes a string representation of TM $M$:
     - $D$ calls $H(M, M)$.
     - If $H$ returns "YES" (halts), $D$ enters an infinite loop.
     - If $H$ returns "NO" (loops), $D$ halts immediately.
  3. Now run $D$ on its own description: $D(D)$.
     - If $D(D)$ halts, $H(D, D)$ outputs "YES" $==> D(D)$ loops infinitely (Contradiction).
     - If $D(D)$ loops, $H(D, D)$ outputs "NO" $==> D(D)$ halts (Contradiction).
  4. Hence, no such decider $H$ can exist. The Halting Problem is *Undecidable*.
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=386")[Source: Hopcroft et al., Ch 9, pp. 386–398] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=320")[Source: KLP Mishra, Ch 10, pp. 320–335]

#v(12pt)

// ==========================================
// SECTION 3
// ==========================================
= Reducibility and Post Correspondence Problem (PCP)

Reducibility is the primary technique for proving new problems undecidable by transforming known undecidable problems.

== Mapping Reducibility ($L_1 <=_m L_2$)
A language $L_1$ is mapping reducible to $L_2$ ($L_1 <=_m L_2$) if there exists a computable function $f: Sigma^* -> Sigma^*$ such that for all $w in Sigma^*$:
$ w in L_1 <==> f(w) in L_2 $
If $L_1$ is undecidable and $L_1 <=_m L_2$, then $L_2$ is also *undecidable*.

== Post Correspondence Problem (PCP)

#alert("DEFINITION", [
  *Post Correspondence Problem (PCP)*:
  Given two lists of strings of equal length over alphabet $Sigma$:
  $ A = (w_1, w_2, ..., w_k) quad "and" quad B = (x_1, x_2, ..., x_k) $
  Is there a sequence of indices $i_1, i_2, ..., i_m$ ($1 <= i_j <= k, m >= 1$) such that:
  $ w_{i_1} w_{i_2} ... w_{i_m} = x_{i_1} x_{i_2} ... x_{i_m} $
  
  *Theorem*: PCP is *undecidable* in the general case (proved by reducing TM computation histories to PCP instances).
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=401")[Source: Hopcroft et al., Ch 9, pp. 401–412] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=336")[Source: KLP Mishra, Ch 10, pp. 336–345]

#v(12pt)

// ==========================================
// SECTION 4
// ==========================================
= Computational Complexity Classes (P, NP, NP-Complete)

Complexity theory measures the time and space resources required by algorithms to solve decidable problems.

== Time Complexity and Class P

#alert("DEFINITION", [
  1. *Time Complexity $T(n)$*: The maximum number of transition steps taken by a deterministic TM $M$ on any input of length $n$.
  2. *Class P*: The class of all decision problems solvable by a Deterministic Turing Machine in *polynomial time* $O(n^k)$ for some constant $k$.
     - Examples: Shortest path (Dijkstra), Minimum Spanning Tree (Kruskal), DFA State Minimization, Parsing CNF (CYK).
])

== Class NP and Polynomial-Time Reducibility

#alert("DEFINITION", [
  1. *Class NP (Nondeterministic Polynomial Time)*: The class of decision problems solvable by a Nondeterministic Turing Machine in polynomial time, OR equivalently, problems whose candidate solutions can be *verified* in polynomial time by a Deterministic TM.
  2. *Polynomial-Time Reduction ($L_1 <=_p L_2$)*: A language $L_1$ is polynomial-time reducible to $L_2$ if there exists a polynomial-time computable function $f$ such that $w in L_1 <==> f(w) in L_2$.
])

== NP-Hardness and NP-Completeness

#alert("DEFINITION", [
  1. *NP-Hard*: A language $L$ is NP-Hard if for *every* language $L' in "NP"$, $L' <=_p L$.
  2. *NP-Complete*: A language $L$ is NP-Complete if:
     - $L in "NP"$, AND
     - $L$ is NP-Hard ($L' <=_p L$ for all $L' in "NP"$).
])

#alert("IMPORTANT", [
  *Cook-Levin Theorem*:
  The Boolean Satisfiability Problem (*SAT*) is *NP-Complete*. It was the first problem proven to be NP-complete by simulating Nondeterministic Polynomial-Time TMs using logical Boolean formulas.
])

== Classic NP-Complete Problems
1. *SAT & 3-SAT*: Boolean formula satisfiability.
2. *Vertex Cover Problem*: Finding a set of $k$ vertices touching all graph edges.
3. *Clique Problem*: Finding a complete subgraph of size $k$.
4. *Hamiltonian Cycle & Traveling Salesperson Problem (TSP)*.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=425")[Source: Hopcroft et al., Ch 10, pp. 425–455] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/Sipser_Introduction.to.the.Theory.of.Computation.3E.pdf#page=275")[Source: Sipser, Ch 7, pp. 275–310]

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#1e293b"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Theory of Computation Unit 5 Theory Notes — SPPU TE IT 2024 Pattern
  ]
]
