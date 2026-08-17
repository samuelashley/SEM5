// Typst Solved Examples - Operating Systems (Unit 4: Page Replacement & Address Translation)
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — UNIT 4]],
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 4: PAGE REPLACEMENT SOLVED NUMERICAL EXAMPLES]
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
// PROBLEM 1: PAGE REPLACEMENT TRACE
// ==========================================
= Problem 1: Page Replacement Trace (FIFO, OPT, LRU)

#alert("INTUITION", [
  *Algorithm Rules:*
  - *FIFO:* Replace the page that was loaded earliest into RAM (queue order).
  - *Optimal (OPT):* Replace the page that will not be referenced for the longest time in the future.
  - *LRU:* Replace the page that has not been used for the longest time in the past.
  - *Hit Ratio Calculation:* $"Hit Ratio" = "Hits" / "Total References"$.
  - *Fault Ratio Calculation:* $"Fault Ratio" = "Faults" / "Total References"$.
])

== Problem Statement
Consider the page reference string:
`7, 0, 1, 2, 0, 3, 0, 4, 2, 3, 0, 3, 2, 1, 2, 0, 1, 7, 0, 1`

For a system with *3 allocated physical RAM frames* (initially empty), compute the number of page faults and page hits using:
- (a) FIFO Algorithm
- (b) Optimal Page Replacement (OPT) Algorithm
- (c) Least Recently Used (LRU) Algorithm

== Step-by-Step Solution

=== (a) First-In, First-Out (FIFO) Algorithm (3 Frames)
Trace of 3-frame queue over time:
- `7`: [7, -, -] (Fault 1)
- `0`: [7, 0, -] (Fault 2)
- `1`: [7, 0, 1] (Fault 3)
- `2`: Replaces `7` $\to$ [2, 0, 1] (Fault 4)
- `0`: [2, 0, 1] (Hit 1)
- `3`: Replaces `0` $\to$ [2, 3, 1] (Fault 5)
- `0`: Replaces `1` $\to$ [2, 3, 0] (Fault 6)
- `4`: Replaces `2` $\to$ [4, 3, 0] (Fault 7)
- `2`: Replaces `3` $\to$ [4, 2, 0] (Fault 8)
- `3`: Replaces `0` $\to$ [4, 2, 3] (Fault 9)
- `0`: Replaces `4` $\to$ [0, 2, 3] (Fault 10)
- `3`: [0, 2, 3] (Hit 2)
- `2`: [0, 2, 3] (Hit 3)
- `1`: Replaces `2` $\to$ [0, 1, 3] (Fault 11)
- `2`: Replaces `3` $\to$ [0, 1, 2] (Fault 12)
- `0`: [0, 1, 2] (Hit 4)
- `1`: [0, 1, 2] (Hit 5)
- `7`: Replaces `0` $\to$ [7, 1, 2] (Fault 13)
- `0`: Replaces `1` $\to$ [7, 0, 2] (Fault 14)
- `1`: Replaces `2` $\to$ [7, 0, 1] (Fault 15)

*FIFO Results:*
- Total References: 20
- *Total Page Faults:* *15*
- *Total Page Hits:* *5*
- *Hit Ratio:* $5 / 20 = 25\%$

=== (b) Optimal Page Replacement (OPT) Algorithm (3 Frames)
- `7`: [7, -, -] (Fault 1)
- `0`: [7, 0, -] (Fault 2)
- `1`: [7, 0, 1] (Fault 3)
- `2`: `7` used farthest in future $\to$ Replaces `7` $\to$ [2, 0, 1] (Fault 4)
- `0`: [2, 0, 1] (Hit 1)
- `3`: `1` used farthest in future $\to$ Replaces `1` $\to$ [2, 0, 3] (Fault 5)
- `0`: [2, 0, 3] (Hit 2)
- `4`: `0` or `3` next; `2` used farthest $\to$ Replaces `2` $\to$ [4, 0, 3] (Fault 6)
- `2`: `0` and `3` used next $\to$ Replaces `4` $\to$ [2, 0, 3] (Fault 7)
- `3`: [2, 0, 3] (Hit 3)
- `0`: [2, 0, 3] (Hit 4)
- `3`: [2, 0, 3] (Hit 5)
- `2`: [2, 0, 3] (Hit 6)
- `1`: `2` and `0` used next $\to$ Replaces `3` $\to$ [2, 0, 1] (Fault 8)
- `2`: [2, 0, 1] (Hit 7)
- `0`: [2, 0, 1] (Hit 8)
- `1`: [2, 0, 1] (Hit 9)
- `7`: `2` not used again $\to$ Replaces `2` $\to$ [7, 0, 1] (Fault 9)
- `0`: [7, 0, 1] (Hit 10)
- `1`: [7, 0, 1] (Hit 11)

*Optimal Results:*
- *Total Page Faults:* *9*
- *Total Page Hits:* *11*
- *Hit Ratio:* $11 / 20 = 55\%$

=== (c) Least Recently Used (LRU) Algorithm (3 Frames)
- `7`: [7, -, -] (Fault 1)
- `0`: [7, 0, -] (Fault 2)
- `1`: [7, 0, 1] (Fault 3)
- `2`: Replaces `7` (least recent) $\to$ [2, 0, 1] (Fault 4)
- `0`: [2, 0, 1] (Hit 1)
- `3`: Replaces `1` $\to$ [2, 0, 3] (Fault 5)
- `0`: [2, 0, 3] (Hit 2)
- `4`: Replaces `2` $\to$ [4, 0, 3] (Fault 6)
- `2`: Replaces `3` $\to$ [4, 0, 2] (Fault 7)
- `3`: Replaces `0` $\to$ [4, 3, 2] (Fault 8)
- `0`: Replaces `4` $\to$ [0, 3, 2] (Fault 9)
- `3`: [0, 3, 2] (Hit 3)
- `2`: [0, 3, 2] (Hit 4)
- `1`: Replaces `0` $\to$ [1, 3, 2] (Fault 10)
- `2`: [1, 3, 2] (Hit 5)
- `0`: Replaces `3` $\to$ [1, 0, 2] (Fault 11)
- `1`: [1, 0, 2] (Hit 6)
- `7`: Replaces `2` $\to$ [1, 0, 7] (Fault 12)
- `0`: [1, 0, 7] (Hit 7)
- `1`: [1, 0, 7] (Hit 8)

*LRU Results:*
- *Total Page Faults:* *12*
- *Total Page Hits:* *8*
- *Hit Ratio:* $8 / 20 = 40\%$

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// PROBLEM 2: TLB EFFECTIVE ACCESS TIME
// ==========================================
= Problem 2: TLB Effective Access Time (EAT) Calculation

== Problem Statement
Consider a paging system with:
- Physical RAM access time $m = 100 "ns"$.
- TLB lookup search time $epsilon = 20 "ns"$.
- TLB Hit Ratio $alpha = 80\% = 0.80$.

*Questions:*
- (a) Compute the Effective Access Time (EAT).
- (b) What will be the EAT if the TLB Hit Ratio increases to $98\%$?

== Step-by-Step Solution

=== (a) EAT for $alpha = 80\%$
$"EAT" = alpha * (epsilon + m) + (1 - alpha) * (epsilon + 2m)$
- $"EAT" = 0.80 * (20 + 100) + (1 - 0.80) * (20 + 2 * 100)$
- $"EAT" = 0.80 * (120) + 0.20 * (220)$
- $"EAT" = 96 + 44 = bold("140 ns")$

=== (b) EAT for $alpha = 98\%$
- $"EAT" = 0.98 * (120) + 0.02 * (220)$
- $"EAT" = 117.6 + 4.4 = bold("122 ns")$

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Unit 4 Solved Examples — SPPU TE IT 2024 Pattern
  ]
]
