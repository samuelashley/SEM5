// Typst Solved Examples - Operating Systems (Unit 2: Process Scheduling)
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — UNIT 2]],
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

// Custom Alert block - Deep Crimson High Contrast
#let alert(type, content) = {
  let colors = (
    "INTUITION": (border: rgb("#9f1239"), bg: rgb("#fff1f2")),
    "NOTE": (border: rgb("#9f1239"), bg: rgb("#fff1f2")),
    "TIP": (border: rgb("#059669"), bg: rgb("#ecfdf5")),
    "IMPORTANT": (border: rgb("#1e293b"), bg: rgb("#f1f5f9")),
    "WARNING": (border: rgb("#b91c1c"), bg: rgb("#fef2f2")),
    "EXAMPLE": (border: rgb("#be123c"), bg: rgb("#fff1f2"))
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 2: CPU SCHEDULING SOLVED NUMERICAL EXAMPLES]
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
// VARIATION 1: FCFS
// ==========================================
= Variation 1: First-Come, First-Served (FCFS) Scheduling

#alert("INTUITION", [
  *Algorithm Logic & Formula Overview:*
  - *Selection Criterion:* Processes are executed strictly in order of their Arrival Time ($T_A$).
  - *Mode:* Non-preemptive. Once execution begins, the CPU is held until burst completion.
  - *Formulas:*
    1. Completion Time ($T_C$): Time when process finishes execution.
    2. Turnaround Time ($T_T$): $T_T = T_C - T_A$
    3. Waiting Time ($T_W$): $T_W = T_T - T_B$
])

== Problem Statement
Consider the following set of five processes with their Arrival Times and CPU Burst Times:

#table(
  columns: (1fr, 1fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Process ID]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Arrival Time ($T_A$ ms)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Burst Time ($T_B$ ms)]*]
  ),
  [$P_1$], [0], [3],
  [$P_2$], [1], [6],
  [$P_3$], [2], [4],
  [$P_4$], [3], [5],
  [$P_5$], [4], [2]
)

Calculate Completion Time, Turnaround Time, Waiting Time, and Average Turnaround Time (ATAT) & Average Waiting Time (AWT) using FCFS.

== Step-by-Step Solution

=== 1. Execution Timeline & Gantt Chart
- At $t=0$, $P_1$ arrives and executes from $t=0$ to $t=3$.
- At $t=3$, $P_2$ executes from $t=3$ to $t=9$.
- At $t=9$, $P_3$ executes from $t=9$ to $t=13$.
- At $t=13$, $P_4$ executes from $t=13$ to $t=18$.
- At $t=18$, $P_5$ executes from $t=18$ to $t=20$.

```
+-------+---------------+-----------+---------------+-------+
|  P1   |      P2       |    P3     |      P4       |  P5   |
+-------+---------------+-----------+---------------+-------+
0       3               9          13              18      20
```

=== 2. Detailed Tabular Results

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.even(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Process]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_A$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_B$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_C$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_T = T_C - T_A$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_W = T_T - T_B$]*]
  ),
  [$P_1$], [0], [3], [3], [$3 - 0 = 3$], [$3 - 3 = 0$],
  [$P_2$], [1], [6], [9], [$9 - 1 = 8$], [$8 - 6 = 2$],
  [$P_3$], [2], [4], [13], [$13 - 2 = 11$], [$11 - 4 = 7$],
  [$P_4$], [3], [5], [18], [$18 - 3 = 15$], [$15 - 5 = 10$],
  [$P_5$], [4], [2], [20], [$20 - 4 = 16$], [$16 - 2 = 14$]
)

=== 3. Summary Calculations
- *Total Turnaround Time:* $3 + 8 + 11 + 15 + 16 = 53$ ms
- *Average Turnaround Time (ATAT):* $53 / 5 = 10.60$ ms
- *Total Waiting Time:* $0 + 2 + 7 + 10 + 14 = 33$ ms
- *Average Waiting Time (AWT):* $33 / 5 = 6.60$ ms

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// VARIATION 2: NON-PREEMPTIVE SJF
// ==========================================
= Variation 2: Non-Preemptive Shortest Job First (SJF)

#alert("INTUITION", [
  *Algorithm Logic:*
  - *Selection Criterion:* From ready processes at time $t$, select process with smallest Burst Time ($T_B$).
  - *Tie-Breaker:* Smaller Arrival Time ($T_A$).
  - *Mode:* Non-preemptive.
])

== Problem Statement
Using same processes: $P_1(0, 3)$, $P_2(1, 6)$, $P_3(2, 4)$, $P_4(3, 5)$, $P_5(4, 2)$, compute metrics under Non-Preemptive SJF.

== Step-by-Step Solution

=== 1. Execution Breakdown
- At $t=0$: Only $P_1$ present -> $P_1$ runs $0 -> 3$.
- At $t=3$: Ready queue has $P_2(6), P_3(4), P_4(5), P_5(2)$. Smallest is $P_5(2) -> P_5$ runs $3 -> 5$.
- At $t=5$: Ready queue has $P_3(4), P_4(5), P_2(6)$. Smallest is $P_3(4) -> P_3$ runs $5 -> 9$.
- At $t=9$: Ready queue has $P_4(5), P_2(6)$. Smallest is $P_4(5) -> P_4$ runs $9 -> 14$.
- At $t=14$: $P_2(6)$ runs $14 -> 20$.

=== 2. Gantt Chart
```
+-------+---+-------+-----------+---------------+
|  P1   |P5 |  P3   |    P4     |      P2       |
+-------+---+-------+-----------+---------------+
0       3   5       9          14              20
```

=== 3. Tabular Calculations

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Process]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_A$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_B$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_C$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_T = T_C - T_A$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_W = T_T - T_B$]*]
  ),
  [$P_1$], [0], [3], [3], [$3 - 0 = 3$], [$3 - 3 = 0$],
  [$P_5$], [4], [2], [5], [$5 - 4 = 1$], [$1 - 2 -> 0$],
  [$P_3$], [2], [4], [9], [$9 - 2 = 7$], [$7 - 4 = 3$],
  [$P_4$], [3], [5], [14], [$14 - 3 = 11$], [$11 - 5 = 6$],
  [$P_2$], [1], [6], [20], [$20 - 1 = 19$], [$19 - 6 = 13$]
)

- *Average Turnaround Time (ATAT):* $41 / 5 = 8.20$ ms
- *Average Waiting Time (AWT):* $22 / 5 = 4.40$ ms

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// VARIATION 3: PREEMPTIVE SJF / SRTF
// ==========================================
= Variation 3: Shortest Remaining Time First (SRTF)

#alert("INTUITION", [
  *Algorithm Logic:*
  - *Mode:* Preemptive.
  - *Mechanism:* Upon new arrival, if new process burst $<$ currently running remaining burst, preempt immediately!
])

== Problem Statement
Processes: $P_1(0, 7)$, $P_2(2, 4)$, $P_3(4, 1)$, $P_4(5, 4)$.

== Step-by-Step Solution

=== 1. Execution Timeline
- At $t=0$: $P_1$ starts ($T_{"rem"}=7$).
- At $t=2$: $P_2(4)$ arrives. $P_1$ remaining $= 5$. Since $4 < 5$, $P_2$ preempts $P_1$! $P_2$ runs.
- At $t=4$: $P_3(1)$ arrives. $P_2$ remaining $= 2$. Since $1 < 2$, $P_3$ preempts $P_2$! $P_3$ runs $4 -> 5$.
- At $t=5$: $P_3$ finishes ($T_C=5$). $P_4(4)$ arrives. Ready: $P_2(2), P_4(4), P_1(5)$. $P_2$ runs $5 -> 7$.
- At $t=7$: $P_2$ finishes ($T_C=7$). Ready: $P_4(4), P_1(5)$. $P_4$ runs $7 -> 11$.
- At $t=11$: $P_4$ finishes ($T_C=11$). $P_1$ runs remaining $5 -> 16$.

=== 2. Gantt Chart
```
+---+-------+---+-------+-----------+---------------+
|P1 |  P2   |P3 |  P2   |    P4     |      P1       |
+---+-------+---+-------+-----------+---------------+
0   2       4   5       7          11              16
```

=== 3. Tabular Calculations

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.even(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Process]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_A$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_B$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_C$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_T = T_C - T_A$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_W = T_T - T_B$]*]
  ),
  [$P_1$], [0], [7], [16], [$16 - 0 = 16$], [$16 - 7 = 9$],
  [$P_2$], [2], [4], [7], [$7 - 2 = 5$], [$5 - 4 = 1$],
  [$P_3$], [4], [1], [5], [$5 - 4 = 1$], [$1 - 1 = 0$],
  [$P_4$], [5], [4], [11], [$11 - 5 = 6$], [$6 - 4 = 2$]
)

- *Average Turnaround Time (ATAT):* $28 / 4 = 7.00$ ms
- *Average Waiting Time (AWT):* $12 / 4 = 3.00$ ms

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// VARIATION 4: ROUND ROBIN
// ==========================================
= Variation 4: Round Robin (RR) Scheduling

#alert("INTUITION", [
  *Algorithm Logic:*
  - *Quantum ($q=2$ ms):* Run at most $q$ units.
  - *Ready Queue Rule:* Put preempted process at the back of ready queue *after* adding any newly arrived processes at that instant.
])

== Problem Statement
Processes $P_1(0, 5)$, $P_2(1, 4)$, $P_3(2, 2)$, $P_4(4, 1)$ with $q = 2$ ms.

== Step-by-Step Solution

=== 1. Trace of Ready Queue
- At $t=0$: Ready $[P_1]$. $P_1$ runs $0 -> 2$ (rem 3). $P_2(1), P_3(2)$ arrive. Queue -> $[P_2, P_3, P_1]$.
- At $t=2$: $P_2$ runs $2 -> 4$ (rem 2). $P_4(4)$ arrives. Queue -> $[P_3, P_1, P_4, P_2]$.
- At $t=4$: $P_3$ runs $4 -> 6$ (rem 0). $P_3$ finishes ($T_C=6$). Queue -> $[P_1, P_4, P_2]$.
- At $t=6$: $P_1$ runs $6 -> 8$ (rem 1). Queue -> $[P_4, P_2, P_1]$.
- At $t=8$: $P_4$ runs $8 -> 9$ (rem 0). $P_4$ finishes ($T_C=9$). Queue -> $[P_2, P_1]$.
- At $t=9$: $P_2$ runs $9 -> 11$ (rem 0). $P_2$ finishes ($T_C=11$). Queue -> $[P_1]$.
- At $t=11$: $P_1$ runs $11 -> 12$ (rem 0). $P_1$ finishes ($T_C=12$).

=== 2. Gantt Chart
```
+---+---+---+---+--+---+---+
|P1 |P2 |P3 |P1 |P4|P2 |P1 |
+---+---+---+---+--+---+---+
0   2   4   6   8  9  11  12
```

=== 3. Tabular Calculations

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Process]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_A$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_B$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_C$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_T = T_C - T_A$]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[$T_W = T_T - T_B$]*]
  ),
  [$P_1$], [0], [5], [12], [$12 - 0 = 12$], [$12 - 5 = 7$],
  [$P_2$], [1], [4], [11], [$11 - 1 = 10$], [$10 - 4 = 6$],
  [$P_3$], [2], [2], [6], [$6 - 2 = 4$], [$4 - 2 = 2$],
  [$P_4$], [4], [1], [9], [$9 - 4 = 5$], [$5 - 1 = 4$]
)

- *Average Turnaround Time (ATAT):* $31 / 4 = 7.75$ ms
- *Average Waiting Time (AWT):* $19 / 4 = 4.75$ ms

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Unit 2 Solved Examples — SPPU TE IT 2024 Pattern
  ]
]
