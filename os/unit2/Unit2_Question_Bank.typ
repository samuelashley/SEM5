// Typst Practice Question Bank - Operating Systems (Unit 2: Process Control & Scheduling)
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — UNIT 2]],
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

// Styling headings - Deep Crimson & Wine Red Scheme (Option 2)
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 2: PRACTICE QUESTION BANK & ANSWER KEY]
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
// SECTION 1: THEORY QUESTIONS
// ==========================================
= Section A: Important Theory Questions

1. *Process Description and Control Block:*
   - Explain the concept of a process. Draw and explain the 7-State Process Model with state transition details. _[SPPU Nov 2023, Marks: 8]_
   - Describe the structure and attributes of a Process Control Block (PCB). Explain why the PCB is critical during context switching. _[SPPU May 2024, Marks: 6]_

2. *Process Control API & Multithreading:*
   - Differentiate between a Mode Switch and a Context Switch with respect to execution overhead and CPU register saving. _[SPPU Dec 2022, Marks: 6]_
   - Explain the `fork()`, `exec()`, and `wait()` system calls. Differentiate between a Zombie Process and an Orphan Process. _[SPPU Nov 2023, Marks: 8]_
   - Compare User-Level Threads (ULT) and Kernel-Level Threads (KLT). What happens in ULT when a thread makes a blocking I/O call? _[SPPU May 2023, Marks: 6]_

3. *CPU Scheduling Principles:*
   - Define CPU Scheduling criteria: Throughput, Turnaround Time, Waiting Time, Response Time, and CPU Utilization. _[SPPU May 2024, Marks: 6]_
   - Explain Multilevel Feedback Queue (MLFQ) scheduling and describe how it prevents starvation. _[SPPU Dec 2023, Marks: 6]_

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 2: NUMERICAL PRACTICE PROBLEMS
// ==========================================
= Section B: Numerical CPU Scheduling Practice Problems

== Practice Problem 1: FCFS and SJF Scheduling
Consider the following set of processes:

#table(
  columns: (1fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Process]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Arrival Time ($T_A$ ms)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Burst Time ($T_B$ ms)]*]
  ),
  [$P_1$], [0], [8],
  [$P_2$], [1], [4],
  [$P_3$], [2], [9],
  [$P_4$], [3], [5]
)

Draw Gantt charts and calculate Average Turnaround Time (ATAT) and Average Waiting Time (AWT) using:
- (a) FCFS Scheduling _[Marks: 4]_
- (b) Non-Preemptive SJF Scheduling _[Marks: 4]_

== Practice Problem 2: Preemptive SRTF Scheduling
Consider the process table:

#table(
  columns: (1fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Process]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Arrival Time ($T_A$ ms)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Burst Time ($T_B$ ms)]*]
  ),
  [$P_1$], [0], [6],
  [$P_2$], [1], [3],
  [$P_3$], [2], [1],
  [$P_4$], [3], [4]
)

Draw the SRTF Gantt chart and compute Completion Time, Turnaround Time, and Waiting Time for each process. Find ATAT and AWT. _[SPPU Nov 2023, Marks: 8]_

== Practice Problem 3: Round Robin Scheduling ($q = 3$ ms)
Given the processes below:

#table(
  columns: (1fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.even(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Process]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Arrival Time ($T_A$ ms)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Burst Time ($T_B$ ms)]*]
  ),
  [$P_1$], [0], [7],
  [$P_2$], [2], [4],
  [$P_3$], [4], [2]
)

Construct the Round Robin Gantt chart for Time Quantum $q = 3$ ms and calculate ATAT and AWT. _[SPPU May 2024, Marks: 8]_

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// MANDATORY ANSWER KEY AT END OF FILE
// ==========================================
= Mandatory Final Answer Key

Below are the verified numerical answers for verification:

- *Practice Problem 1 (a) — FCFS:*
  - Gantt Chart Execution: $P_1(0 -> 8), P_2(8 -> 12), P_3(12 -> 21), P_4(21 -> 26)$
  - Completion Times: $P_1 = 8, P_2 = 12, P_3 = 21, P_4 = 26$
  - Turnaround Times: $P_1 = 8, P_2 = 11, P_3 = 19, P_4 = 23$
  - Waiting Times: $P_1 = 0, P_2 = 7, P_3 = 10, P_4 = 18$
  - *ATAT = 15.25 ms*, *AWT = 8.75 ms*

- *Practice Problem 1 (b) — Non-Preemptive SJF:*
  - Gantt Chart Execution: $P_1(0 -> 8), P_2(8 -> 12), P_4(12 -> 17), P_3(17 -> 26)$
  - Completion Times: $P_1 = 8, P_2 = 12, P_4 = 17, P_3 = 26$
  - Turnaround Times: $P_1 = 8, P_2 = 11, P_4 = 14, P_3 = 24$
  - Waiting Times: $P_1 = 0, P_2 = 7, P_4 = 9, P_3 = 15$
  - *ATAT = 14.25 ms*, *AWT = 7.75 ms*

- *Practice Problem 2 — SRTF:*
  - Gantt Chart Execution: $P_1(0 -> 1), P_2(1 -> 2), P_3(2 -> 3), P_2(3 -> 5), P_4(5 -> 9), P_1(9 -> 14)$
  - Completion Times: $P_1 = 14, P_2 = 5, P_3 = 3, P_4 = 9$
  - Turnaround Times: $P_1 = 14, P_2 = 4, P_3 = 1, P_4 = 6$
  - Waiting Times: $P_1 = 8, P_2 = 1, P_3 = 0, P_4 = 2$
  - *ATAT = 6.25 ms*, *AWT = 2.75 ms*

- *Practice Problem 3 — Round Robin ($q = 3$ ms):*
  - Gantt Chart Execution: $P_1(0 -> 3), P_2(3 -> 6), P_1(6 -> 9), P_3(9 -> 11), P_2(11 -> 12), P_1(12 -> 13)$
  - Completion Times: $P_1 = 13, P_2 = 12, P_3 = 11$
  - Turnaround Times: $P_1 = 13, P_2 = 10, P_3 = 7$
  - Waiting Times: $P_1 = 6, P_2 = 6, P_3 = 5$
  - *ATAT = 10.00 ms*, *AWT = 5.67 ms*

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Unit 2 Practice Question Bank & Answer Key — SPPU TE IT 2024 Pattern
  ]
]
