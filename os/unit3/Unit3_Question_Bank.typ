// Typst Practice Question Bank - Operating Systems (Unit 3: Concurrency Control & Deadlocks)
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — UNIT 3]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Practice Question Bank & Answer Key]]
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

// Raw blocks custom styling
#show raw.where(block: true): it => rect(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: rgb("#f8fafc"),
  inset: 8pt,
  radius: 4pt,
  it
)

// Title Header Page 1
#align(left)[
  #text(size: 9pt, fill: rgb("#9f1239"), weight: "bold")[OPERATING SYSTEM (TE IT - 2024 Pattern)] \
  #v(2pt)
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 3: PRACTICE QUESTION BANK & ANSWER KEY]
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
      [#text(weight: "bold", fill: rgb("#0f172a"))[Document Type:] Question Bank with Answer Key],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Code:] PCC-301-ITT]
    )
  ]
)

#v(6pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(6pt)

// ==========================================
// SECTION A: THEORY QUESTIONS
// ==========================================
= Section A: Important Theory Questions

1. *Critical Section Problem & Synchronization:*
   - Define a Race Condition with an example. Explain the three formal criteria required to solve the Critical Section Problem. _[SPPU Nov 2023, Marks: 8]_
   - Explain the hardware-assisted atomic instructions `TestAndSet` and `CompareAndSwap`. How do they enforce mutual exclusion? _[SPPU May 2024, Marks: 6]_

2. *Semaphores and Classical Synchronization:*
   - Differentiate between Counting Semaphores and Binary Semaphores. Explain the non-busy-waiting implementation of `wait()` and `signal()` operations. _[SPPU Dec 2022, Marks: 8]_
   - Provide a complete semaphore-based solution for the Bounded-Buffer Producer-Consumer Problem. _[SPPU Nov 2023, Marks: 8]_
   - Describe the Dining Philosophers Problem. Explain how deadlock occurs and how it can be prevented using semaphores. _[SPPU May 2023, Marks: 8]_

3. *Deadlocks and Handling Strategies:*
   - State and explain the four Coffman conditions necessary for a deadlock to occur. _[SPPU May 2024, Marks: 6]_
   - Differentiate between Deadlock Prevention, Deadlock Avoidance, and Deadlock Detection. _[SPPU Dec 2023, Marks: 8]_

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION B: NUMERICAL PRACTICE PROBLEMS
// ==========================================
= Section B: Numerical Practice Problems

== Practice Problem 1: Banker's Algorithm Safety Test
Consider a system with 5 processes ($P_0, P_1, P_2, P_3, P_4$) and 3 resource types ($A, B, C$). Total instances: $A = 10, B = 5, C = 7$.

At time $t_0$:

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

- (a) Compute the Need Matrix. _[Marks: 4]_
- (b) Find the Safe Sequence using the Safety Algorithm. _[Marks: 4]_

== Practice Problem 2: Resource Request Algorithm
Using the system snapshot from Practice Problem 1:
- If process $P_1$ requests $(1, 0, 2)$, can the request be granted immediately? Show all intermediate calculations. _[SPPU Nov 2023, Marks: 8]_

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// MANDATORY ANSWER KEY AT END OF FILE
// ==========================================
= Mandatory Final Answer Key

Below are the verified solutions for self-verification:

- *Practice Problem 1 (a) — Need Matrix:*
  - $"Need"[P_0] = (7, 4, 3)$
  - $"Need"[P_1] = (1, 2, 2)$
  - $"Need"[P_2] = (6, 0, 0)$
  - $"Need"[P_3] = (0, 1, 1)$
  - $"Need"[P_4] = (4, 3, 1)$

- *Practice Problem 1 (b) — Safety Algorithm:*
  - Initial $"Work" = (3, 3, 2)$.
  - $P_1$ executes $\to "Work" = (5, 3, 2)$.
  - $P_3$ executes $\to "Work" = (7, 4, 3)$.
  - $P_4$ executes $\to "Work" = (7, 4, 5)$.
  - $P_0$ executes $\to "Work" = (7, 5, 5)$.
  - $P_2$ executes $\to "Work" = (10, 5, 7)$.
  - *System Status:* Safe State.
  - *Safe Sequence:* $\langle P_1, P_3, P_4, P_0, P_2 \rangle$.

- *Practice Problem 2 — Resource Request:*
  - $"Request"[P_1] (1,0,2) \le "Need"[P_1] (1,2,2)$ (True) and $\le "Available" (3,3,2)$ (True).
  - Tentative State: $"Available" = (2, 3, 0)$, $"Allocation"[P_1] = (3, 0, 2)$, $"Need"[P_1] = (0, 2, 0)$.
  - Safety check succeeds with Safe Sequence $\langle P_1, P_3, P_4, P_0, P_2 \rangle$.
  - *Decision:* Request Granted immediately.

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Unit 3 Practice Question Bank & Answer Key — SPPU TE IT 2024 Pattern
  ]
]
