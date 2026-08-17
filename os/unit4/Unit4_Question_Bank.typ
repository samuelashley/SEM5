// Typst Practice Question Bank - Operating Systems (Unit 4: Memory Management & Virtual Memory)
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — UNIT 4]],
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 4: PRACTICE QUESTION BANK & ANSWER KEY]
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

1. *Memory Partitioning & Fragmentation:*
   - Differentiate between Internal Fragmentation and External Fragmentation. Explain how Compaction and the Buddy System mitigate fragmentation. _[SPPU Nov 2023, Marks: 8]_
   - Compare First Fit, Best Fit, and Worst Fit dynamic memory placement strategies. _[SPPU May 2024, Marks: 6]_

2. *Paging, Segmentation, and Address Translation:*
   - Explain the hardware address translation mechanism in Paging. Describe the fields of a Page Table Entry (PTE). _[SPPU Dec 2022, Marks: 8]_
   - Explain Two-Level Paging and Inverted Page Tables. How do they reduce page table memory overhead? _[SPPU Nov 2023, Marks: 8]_
   - Differentiate between Paging and Segmentation with respect to block size, user visibility, and hardware table structures. _[SPPU May 2023, Marks: 6]_

3. *Virtual Memory, TLB, and Thrashing:*
   - Explain the step-by-step lifecycle of handling a Page Fault in Demand Paging. _[SPPU May 2024, Marks: 8]_
   - Describe the Translation Lookaside Buffer (TLB) and state the formula for Effective Access Time (EAT). _[SPPU Dec 2023, Marks: 6]_
   - What is Thrashing? Explain how the Working Set Model and Page Fault Frequency (PFF) prevent thrashing. _[SPPU Nov 2023, Marks: 8]_

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION B: NUMERICAL PRACTICE PROBLEMS
// ==========================================
= Section B: Numerical Practice Problems

== Practice Problem 1: Page Replacement Algorithms Trace
Given the page reference string:
`1, 2, 3, 4, 1, 2, 5, 1, 2, 3, 4, 5`

For a system with *3 allocated physical frames* (initially empty), compute total page faults and page hits using:
- (a) FIFO Algorithm _[Marks: 4]_
- (b) Optimal (OPT) Algorithm _[Marks: 4]_
- (c) LRU Algorithm _[Marks: 4]_

== Practice Problem 2: TLB Effective Access Time Math
A memory system has a RAM access time of $100 "ns"$ and a TLB search time of $20 "ns"$.
Calculate EAT for:
- (a) TLB Hit Ratio $= 85\%$ _[Marks: 3]_
- (b) TLB Hit Ratio $= 95\%$ _[Marks: 3]_

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// MANDATORY ANSWER KEY AT END OF FILE
// ==========================================
= Mandatory Final Answer Key

Below are the verified solutions for self-verification:

- *Practice Problem 1 (a) — FIFO Algorithm (3 Frames):*
  - Trace: `1(F), 2(F), 3(F), 4(F), 1(F), 2(F), 5(F), 1(H), 2(H), 3(F), 4(F), 5(F)`
  - *Page Faults:* *9*, *Page Hits:* *3*, *Hit Ratio:* $25\%$

- *Practice Problem 1 (b) — Optimal Algorithm (3 Frames):*
  - Trace: `1(F), 2(F), 3(F), 4(F-rep 3), 1(H), 2(H), 5(F-rep 4), 1(H), 2(H), 3(F-rep 5), 4(F-rep 3), 5(F-rep 4)`
  - *Page Faults:* *7*, *Page Hits:* *5*, *Hit Ratio:* $41.67\%$

- *Practice Problem 1 (c) — LRU Algorithm (3 Frames):*
  - Trace: `1(F), 2(F), 3(F), 4(F-rep 1), 1(F-rep 2), 2(F-rep 3), 5(F-rep 4), 1(H), 2(H), 3(F-rep 5), 4(F-rep 1), 5(F-rep 2)`
  - *Page Faults:* *10*, *Page Hits:* *2*, *Hit Ratio:* $16.67\%$

- *Practice Problem 2 — TLB EAT Math:*
  - (a) $alpha = 85\% ==> "EAT" = 0.85 * (20 + 100) + 0.15 * (20 + 200) = 102 + 33 = bold("135 ns")$
  - (b) $alpha = 95\% ==> "EAT" = 0.95 * (120) + 0.05 * (220) = 114 + 11 = bold("125 ns")$

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Unit 4 Practice Question Bank & Answer Key — SPPU TE IT 2024 Pattern
  ]
]
