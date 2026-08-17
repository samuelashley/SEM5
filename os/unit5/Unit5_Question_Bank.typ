// Typst Practice Question Bank - Operating Systems (Unit 5: I/O & File Management)
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — UNIT 5]],
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 5: PRACTICE QUESTION BANK & ANSWER KEY]
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

1. *I/O Architecture & Buffering:*
   - Compare Programmed I/O, Interrupt-Driven I/O, and Direct Memory Access (DMA). Why is DMA preferred for high-speed data transfer? _[SPPU Nov 2023, Marks: 8]_
   - Explain Single Buffering, Double Buffering, and Circular Buffering in I/O management. _[SPPU May 2024, Marks: 6]_

2. *Disk Architecture & Scheduling:*
   - Explain the components of total Disk Access Time (Seek Time, Rotational Latency, Transfer Time). _[SPPU Dec 2022, Marks: 6]_
   - Compare FCFS, SSTF, SCAN, C-SCAN, and LOOK disk scheduling algorithms. Explain how SSTF can lead to starvation. _[SPPU Nov 2023, Marks: 8]_

3. *File Allocation & Unix Inode:*
   - Compare Contiguous, Linked (FAT), and Indexed file allocation methods with respect to random access speed and fragmentation. _[SPPU May 2023, Marks: 8]_
   - Draw and explain the structure of a Unix Inode. Show how direct, single indirect, double indirect, and triple indirect pointers enable large file support. _[SPPU May 2024, Marks: 8]_

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION B: NUMERICAL PRACTICE PROBLEMS
// ==========================================
= Section B: Numerical Practice Problems

== Practice Problem 1: Disk Head Movement Calculations
A disk queue contains requests for cylinders: `98, 183, 37, 122, 14, 124, 65, 67`.
The head is currently at cylinder *53*, moving toward *higher cylinders* (0 to 199).

Compute total head movement (in cylinders) using:
- (a) FCFS Disk Scheduling _[Marks: 3]_
- (b) SSTF Disk Scheduling _[Marks: 3]_
- (c) SCAN Disk Scheduling _[Marks: 3]_
- (d) LOOK Disk Scheduling _[Marks: 3]_

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// MANDATORY ANSWER KEY AT END OF FILE
// ==========================================
= Mandatory Final Answer Key

Below are the verified solutions for self-verification:

- *Practice Problem 1 — Disk Head Movements:*
  - *(a) FCFS:* $53 \to 98 \to 183 \to 37 \to 122 \to 14 \to 124 \to 65 \to 67$
    - *Total Movement:* $45 + 85 + 146 + 85 + 108 + 110 + 59 + 2 = bold{640 " cylinders"}$
  - *(b) SSTF:* $53 \to 65 \to 67 \to 37 \to 14 \to 98 \to 122 \to 124 \to 183$
    - *Total Movement:* $12 + 2 + 30 + 23 + 84 + 24 + 2 + 59 = bold{236 " cylinders"}$
  - *(c) SCAN (Elevator to boundary 199):* $53 \to 65 \to 67 \to 98 \to 122 \to 124 \to 183 \to 199 \to 37 \to 14$
    - *Total Movement:* $(199 - 53) + (199 - 14) = 146 + 185 = bold{331 " cylinders"}$
  - *(d) LOOK (To max request 183):* $53 \to 65 \to 67 \to 98 \to 122 \to 124 \to 183 \to 37 \to 14$
    - *Total Movement:* $(183 - 53) + (183 - 14) = 130 + 169 = bold{299 " cylinders"}$

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Unit 5 Practice Question Bank & Answer Key — SPPU TE IT 2024 Pattern
  ]
]
