// Typst Theory Notes - Theory of Computation (Unit 3)
// Course Code: PCC-303-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[THEORY OF COMPUTATION — UNIT 3]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Context-Free Grammars & Languages]]
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 3: CONTEXT-FREE GRAMMARS AND LANGUAGES]
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
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 3.

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
  [*Chomsky Hierarchy & Regular Grammars*], [Chomsky Hierarchy classification (Types 0, 1, 2, 3), Left Linear Grammar (LLG), Right Linear Grammar (RLG), Inter-conversions (LLG $arrow.l.r$ RLG), RG to FA & FA to RG conversions.], [High Priority \ (6-8 Marks Qs)],
  [*Context-Free Grammar (CFG) Fundamentals*], [Formal 4-tuple definition ($V, T, P, S$), Sentential forms, Yield of derivations, Context-Free Language (CFL) definition, Language generation.], [High Priority \ (6-8 Marks Qs)],
  [*Derivations & Parse Trees*], [Leftmost Derivation (LMD), Rightmost Derivation (RMD), Derivation/Parse Trees, Yield of parse tree, Inherent structural equivalence.], [High Priority \ (8-10 Marks Qs)],
  [*Ambiguity in Grammars*], [Definition of Ambiguous Grammar, Multiple parse trees for single string, Converting ambiguous arithmetic grammars to unambiguous via operator precedence & associativity.], [High Priority \ (8-10 Marks Qs)],
  [*CFG Simplification & Normal Forms*], [Eliminating Useless Symbols, $epsilon$-productions (Nullable variables), Unit productions ($A -> B$), Chomsky Normal Form (CNF: $A -> B C | a$), Greibach Normal Form (GNF: $A -> a alpha$).], [High Priority \ (8-10 Marks Qs)],
  [*CYK Membership Algorithm*], [Cocke-Younger-Kasami (CYK) Dynamic Programming Membership Algorithm for testing $w in L(G)$ in $O(n^3 |G|)$ time using CNF grammar table.], [High Priority \ (8-10 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Formal Grammars and Chomsky Hierarchy

== Definition of a Formal Grammar
A formal grammar is a mathematical system for generating strings of a language via rewriting rules.

#alert("DEFINITION", [
  A formal grammar $G$ is defined as a 4-tuple:
  $ G = (V, T, P, S) $
  where:
  1. $V$ is a finite set of *Variables* (non-terminals) representing syntactic categories.
  2. $T$ is a finite set of *Terminal symbols* disjoint from $V$ ($V inter T = ø$), forming the alphabet of generated strings.
  3. $P$ is a finite set of *Production rules* of the form $alpha -> beta$, where $alpha, beta in (V union T)^*$ and $alpha$ contains at least one non-terminal ($alpha !in T^*$).
  4. $S in V$ is the distinguished *Start symbol*.
])

== The Chomsky Hierarchy of Languages and Grammars

Noam Chomsky classified formal grammars into four hierarchical types based on constraints imposed on production rules $alpha -> beta$:

#table(
  columns: (0.8fr, 1.5fr, 2.2fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#1e293b") } else if calc.odd(y) { rgb("#f1f5f9") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Type]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Grammar / Language]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Production Constraint ($alpha -> beta$)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Accepting Automaton]*]
  ),
  [*Type 0*], [Unrestricted / Recursively Enumerable], [No restriction ($alpha in (V union T)^+$ contains $>= 1$ variable)], [Turing Machine (TM)],
  [*Type 1*], [Context-Sensitive Grammar (CSG)], [$|alpha| <= |beta|$ (non-contracting, except $S -> epsilon$)], [Linear Bounded Automaton (LBA)],
  [*Type 2*], [Context-Free Grammar (CFG)], [$alpha in V$ (single non-terminal on LHS)], [Pushdown Automaton (PDA)],
  [*Type 3*], [Regular Grammar (RG)], [$A -> a B | a$ (Right Linear) or $A -> B a | a$ (Left Linear)], [Finite Automaton (FA)]
)

== Regular Grammars: Right Linear and Left Linear Grammars

#alert("DEFINITION", [
  1. *Right Linear Grammar (RLG)*: All production rules are of the form:
     $ A -> w B quad text("or") quad A -> w quad text("where ") A, B in V, w in T^* $
  2. *Left Linear Grammar (LLG)*: All production rules are of the form:
     $ A -> B w quad text("or") quad A -> w quad text("where ") A, B in V, w in T^* $
  
  *Important*: A regular grammar must be strictly Right Linear OR strictly Left Linear. Mixing RLG and LLG rules in the same grammar yields a Context-Free Grammar.
])

=== Conversion of Regular Grammar (RLG) to Finite Automaton (FA)
Given RLG $G = (V, T, P, S)$:
1. Define FA states $Q = V union \{q_f\}$, where $q_f$ is a new final state.
2. Initial state is $S$, and $F = \{q_f\}$ (if $S -> epsilon in P$, add $S$ to $F$).
3. For each production $A -> a B$, add transition $delta(A, a) = B$.
4. For each production $A -> a$, add transition $delta(A, a) = q_f$.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=189")[Source: Hopcroft et al., Ch 5, pp. 189–195] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=121")[Source: KLP Mishra, Ch 4, pp. 121–130]

#v(12pt)

// ==========================================
// SECTION 2
// ==========================================
= Context-Free Grammars (CFG) and Derivations

== Definition of Context-Free Grammar and Sentential Forms

#alert("DEFINITION", [
  A *Context-Free Grammar (CFG)* is a 4-tuple $G = (V, T, P, S)$ where every production rule in $P$ has the form:
  $ A -> alpha quad text("where ") A in V text(" and ") alpha in (V union T)^* $
  
  - *Derivation Step ($=>$)*: If $A -> alpha in P$, and $gamma A delta in (V union T)^*$, then $gamma A delta => gamma alpha delta$.
  - *Reflexive Transitive Closure ($=>^*$)*: Sequence of zero or more derivation steps.
  - *Sentential Form*: Any string $alpha in (V union T)^*$ such that $S =>^* alpha$.
  - *Sentence*: A sentential form containing only terminal symbols ($w in T^*$).
  - *Context-Free Language (CFL)*: $L(G) = \{ w in T^* : S =>^* w \}$.
])

== Leftmost and Rightmost Derivations

1. *Leftmost Derivation (LMD)*: At each derivation step, the *leftmost non-terminal* in the sentential form is replaced (denoted $=>_text("lm")$).
2. *Rightmost Derivation (RMD)*: At each derivation step, the *rightmost non-terminal* in the sentential form is replaced (denoted $=>_text("rm")$).

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=196")[Source: Hopcroft et al., Ch 5, pp. 196–203] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=131")[Source: KLP Mishra, Ch 4, pp. 131–138]

#v(12pt)

// ==========================================
// SECTION 3
// ==========================================
= Parse Trees and Ambiguity in Grammars

== Parse Trees (Derivation Trees)
A parse tree is a graphical representation of the hierarchical structure of a derivation in a CFG.

#alert("DEFINITION", [
  In a parse tree for a CFG $G = (V, T, P, S)$:
  1. The root node is labeled with the start symbol $S$.
  2. Interior nodes are labeled with non-terminal variables $V$.
  3. Leaf nodes are labeled with terminal symbols $T$ or $epsilon$.
  4. If an interior node labeled $A$ has children $X_1, X_2, ..., X_k$ from left to right, then $A -> X_1 X_2 ... X_k in P$.
  5. The *yield* of a parse tree is the string of leaf terminals obtained by reading leaves from left to right.
])

== Ambiguous Grammars

#alert("DEFINITION", [
  A Context-Free Grammar $G$ is *ambiguous* if there exists at least one string $w in L(G)$ that has:
  - Two or more distinct parse trees, OR
  - Two or more distinct Leftmost Derivations, OR
  - Two or more distinct Rightmost Derivations.
])

=== Eliminating Ambiguity: Operator Precedence and Associativity
Grammars for arithmetic expressions are often ambiguous (e.g. $E -> E + E | E * E | id$). Ambiguity is eliminated by imposing explicit precedence levels:
- Primary expressions / identifiers ($F$)
- Multiplicative terms ($T -> T * F | F$ — left-associative $*$)
- Additive expressions ($E -> E + T | T$ — left-associative $+$)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=205")[Source: Hopcroft et al., Ch 5, pp. 205–214] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=139")[Source: KLP Mishra, Ch 4, pp. 139–145]

#v(12pt)

// ==========================================
// SECTION 4
// ==========================================
= Simplification of Context-Free Grammars

Simplification transforms a CFG into a cleaner, equivalent form without altering $L(G)$.

== 1. Elimination of Useless Symbols
A symbol $X in (V union T)$ is *useful* if there exists a derivation $S =>^* alpha X beta =>^* w$ where $w in T^*$. A symbol is useless if it is non-generating or unreachable.

- *Algorithm*:
  1. *Find Generating Symbols*: Set $V_1 = \{ A in V : A -> w in P text(" for ") w in T^* \}$. Iteratively add $A$ if $A -> alpha$ where $alpha in (V_1 union T)^*$. Eliminate non-generating symbols.
  2. *Find Reachable Symbols*: Set $Y_1 = \{S\}$. Iteratively add symbols on RHS of productions for variables in $Y_1$. Eliminate unreachable symbols.

== 2. Elimination of Nullable / $epsilon$-Productions
An $epsilon$-production is of the form $A -> epsilon$. A variable $A$ is *nullable* if $A =>^* epsilon$.

- *Algorithm*:
  1. Identify all nullable variables ($A -> epsilon in P$ or $A -> B_1 ... B_k$ where all $B_i$ are nullable).
  2. For every production $A -> X_1 X_2 ... X_m$, substitute all combinations of nullable variables with $epsilon$ (omitting them), preserving the non-empty options. Delete all original $A -> epsilon$ rules.

== 3. Elimination of Unit Productions
A *unit production* is of the form $A -> B$ where $A, B in V$.

- *Algorithm*:
  1. For each variable $A$, find its *unit pairs* $(A, B)$ such that $A =>^* B$ using only unit productions.
  2. For each pair $(A, B)$, if $B -> alpha$ is a non-unit production, add $A -> alpha$ to $P$. Delete all unit productions $A -> B$.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=231")[Source: Hopcroft et al., Ch 7, pp. 231–243] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=180")[Source: KLP Mishra, Ch 6, pp. 180–190]

#v(12pt)

// ==========================================
// SECTION 5
// ==========================================
= Normal Forms: CNF and GNF

Normal forms restrict production rules into standardized canonical forms.

== Chomsky Normal Form (CNF)

#alert("DEFINITION", [
  A Context-Free Grammar $G$ (with $epsilon !in L(G)$) is in *Chomsky Normal Form (CNF)* if every production rule is of the form:
  $ A -> B C quad text("or") quad A -> a quad text("where ") A, B, C in V text(" and ") a in T $
])

=== Conversion Algorithm to CNF:
1. Simplify grammar (eliminate useless symbols, $epsilon$-productions, and unit productions).
2. For productions with RHS length $>= 2$, replace each terminal $a$ with a new variable $C_a$ and add $C_a -> a$.
3. For productions with RHS length $k >= 3$ (e.g. $A -> B_1 B_2 ... B_k$), introduce cascade variables $D_1, D_2, ...$ to break the rule into binary pairs:
   $ A -> B_1 D_1, quad D_1 -> B_2 D_2, quad ..., quad D_{k-2} -> B_{k-1} B_k $

== Greibach Normal Form (GNF)

#alert("DEFINITION", [
  A CFG $G$ is in *Greibach Normal Form (GNF)* if every production rule is of the form:
  $ A -> a alpha quad text("where ") A in V, a in T, text(" and ") alpha in V^* $
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=244")[Source: Hopcroft et al., Ch 7, pp. 244–248] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=191")[Source: KLP Mishra, Ch 6, pp. 191–198]

#v(12pt)

// ==========================================
// SECTION 6
// ==========================================
= Dynamic Programming Membership: CYK Algorithm

The Cocke-Younger-Kasami (CYK) algorithm determines whether a string $w$ of length $n$ belongs to $L(G)$ for a grammar $G$ in CNF.

#alert("DEFINITION", [
  *CYK Triangular Table Construction*:
  Let $w = a_1 a_2 ... a_n$. Construct a triangular table $V_{i, j}$ ($1 <= i <= n, 1 <= j <= n - i + 1$), where $V_{i, j}$ contains the set of variables $A in V$ that derive substring $w[i ... i+j-1]$ of length $j$ starting at index $i$.
  
  *Algorithm Steps*:
  1. *Base Level ($j = 1$)*: For $i = 1$ to $n$:
     $ V_{i, 1} = \{ A in V : A -> a_i in P \} $
  2. *Inductive Substrings ($j = 2$ to $n$)*: For length $j$, start index $i$:
     $ V_{i, j} = union_(k=1)^(j-1) \{ A in V : A -> B C in P, text(" with ") B in V_{i, k} text(" and ") C in V_{i+k, j-k} \} $
  3. *Membership Decision*: String $w in L(G)$ if and only if start symbol $S in V_{1, n}$.
])

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/John-E.-Hopcroft-Rajeev-Motwani-Jeffrey-D.-Ullman-Introduction-to-Automata-Theory-Languages-and-Computations-Prentice-Hall-2006.pdf#page=249")[Source: Hopcroft et al., Ch 7, pp. 249–252] | #link("file:///Users/ashley/Documents/SEM5/toc/studymaterial/toc-klp-mishra.pdf#page=199")[Source: KLP Mishra, Ch 6, pp. 199–202]

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#1e293b"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Theory of Computation Unit 3 Theory Notes — SPPU TE IT 2024 Pattern
  ]
]
