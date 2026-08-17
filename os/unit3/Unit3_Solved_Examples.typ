// Typst Solved Examples - Operating Systems (Unit 3: Deadlocks & Banker's Algorithm)
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — UNIT 3]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Solved Numerical Examples]]
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
      align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[SPPU TE IT (2024 Pattern)] #text(size: 8pt, fill: rgb("#64748b"))[ | PCC-301-ITT]],
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

#set heading(numbering: "1.1")

// Styling headings - Deep Crimson & Wine Red Scheme
#show heading: set text(fill: rgb("#0f172a"))
#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (left: 4pt + rgb("#9f1239")),
  inset: (left: 10pt, y: 7pt),
  fill: rgb("#fff1f2"),
  radius: (right: 4pt),
  text(fill: rgb("#0f172a"), size: 12.5pt, weight: "bold")[#it.body]
)

#show heading.where(level: 2): it => block(
  width: 100%,
  inset: (y: 5pt),
  text(fill: rgb("#be123c"), size: 11pt, weight: "bold")[#it.body]
)

// Alert block
#let alert(type, content) = {
  let colors = (
    "INTUITION": (border: rgb("#9f1239"), bg: rgb("#fff1f2")),
    "NOTE": (border: rgb("#9f1239"), bg: rgb("#fff1f2"))
  )
  let c = colors.at(type, default: (border: rgb("#9f1239"), bg: rgb("#fff1f2")))
  
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
  #text(size: 9pt, fill: rgb("#9f1239"), weight: "bold")[OPERATING SYSTEM (TE IT - 2024 Pattern)] \
  #v(2pt)
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 3: BANKER'S ALGORITHM SOLVED NUMERICAL EXAMPLES]
]

#v(6pt)
#rect(
  width: 100%,
  stroke: 1pt + rgb("#9f1239"),
  fill: rgb("#fff1f2"),
  radius: 4pt,
  inset: 9pt,
  [
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 7pt,
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Pattern:] TE IT - 2024 Pattern (SPPU)],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Academic Term:] Semester V (2026)],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Document Type:] Solved Numerical Guide],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Code:] PCC-301-ITT]
    )
  ]
)

#v(6pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(6pt)

// ==========================================
// PROBLEM 1: BANKER'S SAFETY ALGORITHM
// ==========================================
= Problem 1: Banker's Safety Algorithm & Safe Sequence

#alert("INTUITION", [
  *Problem Logic & Steps:*
  1. *Calculate Need Matrix:* $"Need"[i][j] = "Max"[i][j] - "Allocation"[i][j]$.
  2. *Initialize Vector:* Set $"Work" = "Available"$ and $"Finish"[i] = "FALSE"$ for all processes.
  3. *Iterative Search:* Find an unfinished process $P_i$ where $"Need"[i] \le "Work"$.
  4. *Simulate Execution:* Assume $P_i$ completes, releases its allocated resources: $"Work" = "Work" + "Allocation"[i]$, set $"Finish"[i] = "TRUE"$.
  5. *Result Verification:* If all processes complete ($"Finish" = "TRUE"$), the system is in a *Safe State*.
])

== Problem Statement
Consider a system with 5 processes ($P_0, P_1, P_2, P_3, P_4$) and 3 resource types ($A, B, C$).
Total physical instances available: $A = 10, B = 5, C = 7$.

At time $t_0$, the snapshot of the system is as follows:

#table(
  columns: (1fr, 1.2fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Process]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Allocation (A B C)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Max (A B C)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Available (A B C)]*]
  ),
  [$P_0$], [0 1 0], [7 5 3], [3 3 2],
  [$P_1$], [2 0 0], [3 2 2], [ ],
  [$P_2$], [3 0 2], [9 0 2], [ ],
  [$P_3$], [2 1 1], [2 2 2], [ ],
  [$P_4$], [0 0 2], [4 3 3], [ ]
)

*Questions:*
- (a) Compute the Need Matrix.
- (b) Is the system currently in a Safe State? Determine the Safe Sequence.

== Step-by-Step Solution

=== Step 1: Calculation of Need Matrix ($"Need" = "Max" - "Allocation"$)
- $"Need"[P_0] = (7,5,3) - (0,1,0) = (7, 4, 3)$
- $"Need"[P_1] = (3,2,2) - (2,0,0) = (1, 2, 2)$
- $"Need"[P_2] = (9,0,2) - (3,0,2) = (6, 0, 0)$
- $"Need"[P_3] = (2,2,2) - (2,1,1) = (0, 1, 1)$
- $"Need"[P_4] = (4,3,3) - (0,0,2) = (4, 3, 1)$

=== Step 2: Execution of Safety Algorithm
Initialize $"Work" = (3, 3, 2)$ and $"Finish" = ["F", "F", "F", "F", "F"]$.

1. *Check $P_0$:* $"Need"[P_0] = (7,4,3) \le "Work"(3,3,2)$? *False* ($7 > 3$). $P_0$ must wait.
2. *Check $P_1$:* $"Need"[P_1] = (1,2,2) \le "Work"(3,3,2)$? *True!*
   - $P_1$ executes and finishes.
   - New $"Work" = "Work" + "Allocation"[P_1] = (3,3,2) + (2,0,0) = (5, 3, 2)$.
   - $"Finish"[P_1] = "TRUE"$. Sequence: $\langle P_1 \rangle$.
3. *Check $P_3$:* $"Need"[P_3] = (0,1,1) \le "Work"(5,3,2)$? *True!*
   - $P_3$ executes and finishes.
   - New $"Work" = (5,3,2) + (2,1,1) = (7, 4, 3)$.
   - $"Finish"[P_3] = "TRUE"$. Sequence: $\langle P_1, P_3 \rangle$.
4. *Check $P_4$:* $"Need"[P_4] = (4,3,1) \le "Work"(7,4,3)$? *True!*
   - $P_4$ executes and finishes.
   - New $"Work" = (7,4,3) + (0,0,2) = (7, 4, 5)$.
   - $"Finish"[P_4] = "TRUE"$. Sequence: $\langle P_1, P_3, P_4 \rangle$.
5. *Check $P_0$:* $"Need"[P_0] = (7,4,3) \le "Work"(7,4,5)$? *True!*
   - $P_0$ executes and finishes.
   - New $"Work" = (7,4,5) + (0,1,0) = (7, 5, 5)$.
   - $"Finish"[P_0] = "TRUE"$. Sequence: $\langle P_1, P_3, P_4, P_0 \rangle$.
6. *Check $P_2$:* $"Need"[P_2] = (6,0,0) \le "Work"(7,5,5)$? *True!*
   - $P_2$ executes and finishes.
   - New $"Work" = (7,5,5) + (3,0,2) = (10, 5, 7)$.
   - $"Finish"[P_2] = "TRUE"$. Sequence: $\langle P_1, P_3, P_4, P_0, P_2 \rangle$.

=== Summary Conclusion
All processes finished execution ($"Finish"[i] = "TRUE"$ for all $i$).
- *System State:* *Safe State*.
- *Valid Safe Sequence:* $\langle P_1, P_3, P_4, P_0, P_2 \rangle$.

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// PROBLEM 2: RESOURCE-REQUEST ALGORITHM
// ==========================================
= Problem 2: Resource-Request Evaluation

== Problem Statement
Using the same system snapshot from Problem 1 (Available $= (3, 3, 2)$), suppose process $P_1$ submits a new resource request:
$"Request"[P_1] = (1, 0, 2)$.

Can this request be granted immediately by the OS?

== Step-by-Step Solution

=== Step 1: Check Bounds
1. $"Request"[P_1] (1,0,2) \le "Need"[P_1] (1,2,2)$? *True!*
2. $"Request"[P_1] (1,0,2) \le "Available" (3,3,2)$? *True!*

=== Step 2: Pretend Resource Allocation to $P_1$
- $"Available" = "Available" - "Request"[P_1] = (3,3,2) - (1,0,2) = (2, 3, 0)$.
- $"Allocation"[P_1] = "Allocation"[P_1] + "Request"[P_1] = (2,0,0) + (1,0,2) = (3, 0, 2)$.
- $"Need"[P_1] = "Need"[P_1] - "Request"[P_1] = (1,2,2) - (1,0,2) = (0, 2, 0)$.

=== Step 3: Run Safety Algorithm on New System State
Initialize $"Work" = (2, 3, 0)$.

1. *Check $P_1$:* $"Need"[P_1] (0,2,0) \le "Work"(2,3,0)$? *True!*
   - New $"Work" = (2,3,0) + (3,0,2) = (5, 3, 2)$.
2. *Check $P_3$:* $"Need"[P_3] (0,1,1) \le "Work"(5,3,2)$? *True!*
   - New $"Work" = (5,3,2) + (2,1,1) = (7, 4, 3)$.
3. *Check $P_4$:* $"Need"[P_4] (4,3,1) \le "Work"(7,4,3)$? *True!*
   - New $"Work" = (7,4,3) + (0,0,2) = (7, 4, 5)$.
4. *Check $P_0$:* $"Need"[P_0] (7,4,3) \le "Work"(7,4,5)$? *True!*
   - New $"Work" = (7,4,5) + (0,1,0) = (7, 5, 5)$.
5. *Check $P_2$:* $"Need"[P_2] (6,0,0) \le "Work"(7,5,5)$? *True!*
   - New $"Work" = (7,5,5) + (3,0,2) = (10, 5, 7)$.

=== Summary Conclusion
System remains in a Safe State with Safe Sequence $\langle P_1, P_3, P_4, P_0, P_2 \rangle$.
- *Decision:* The OS grants the request immediately.

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Unit 3 Solved Examples — SPPU TE IT 2024 Pattern
  ]
]
