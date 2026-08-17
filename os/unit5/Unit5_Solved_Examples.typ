// Typst Solved Examples - Operating Systems (Unit 5: Disk Scheduling & Inode Calculations)
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — UNIT 5]],
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 5: DISK SCHEDULING & INODE SOLVED NUMERICAL EXAMPLES]
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
// PROBLEM 1: DISK SCHEDULING ALGORITHMS
// ==========================================
= Problem 1: Disk Scheduling Cylinder Head Movements

#alert("INTUITION", [
  *Algorithm Rules & Calculations:*
  - Total Head Movement is calculated by adding the absolute difference $|C_{"next"} - C_{"current"}|$ for each head movement step.
  - *FCFS:* Sequential queue processing.
  - *SSTF:* Move to request with minimum $|C_{"next"} - C_{"current"}|$.
  - *SCAN:* Move in initial direction up to boundary cylinder ($0$ or $199$), then reverse.
  - *LOOK:* Move in initial direction up to max/min request cylinder, then reverse (does not go to physical disk boundary).
])

== Problem Statement
Consider a disk queue with requests for I/O to blocks on cylinders:
`98, 183, 37, 122, 14, 124, 65, 67`

The disk head is currently at cylinder *53*, moving toward *higher cylinders* (larger cylinder numbers). Total cylinders on disk: $0$ to $199$.

Calculate the total number of head movements (in cylinders) using:
- (a) FCFS Disk Scheduling
- (b) SSTF Disk Scheduling
- (c) SCAN Disk Scheduling
- (d) LOOK Disk Scheduling

== Step-by-Step Solution

=== (a) FCFS Algorithm
- Head trajectory: $53 \to 98 \to 183 \to 37 \to 122 \to 14 \to 124 \to 65 \to 67$
- Movements:
  1. $|98 - 53| = 45$
  2. $|183 - 98| = 85$
  3. $|37 - 183| = 146$
  4. $|122 - 37| = 85$
  5. $|14 - 122| = 108$
  6. $|124 - 14| = 110$
  7. $|65 - 124| = 59$
  8. $|67 - 65| = 2$
- *Total Head Movement (FCFS):* $45 + 85 + 146 + 85 + 108 + 110 + 59 + 2 = bold{640 " cylinders"}$

=== (b) SSTF Algorithm
- Starting at $53$, active queue: $\{14, 37, 65, 67, 98, 122, 124, 183\}$
  1. From $53$, closest is $65$: $|65 - 53| = 12$
  2. From $65$, closest is $67$: $|67 - 65| = 2$
  3. From $67$, closest is $37$: $|37 - 67| = 30$
  4. From $37$, closest is $14$: $|14 - 37| = 23$
  5. From $14$, closest is $98$: $|98 - 14| = 84$
  6. From $98$, closest is $122$: $|122 - 98| = 24$
  7. From $122$, closest is $124$: $|124 - 122| = 2$
  8. From $124$, closest is $183$: $|183 - 124| = 59$
- *Total Head Movement (SSTF):* $12 + 2 + 30 + 23 + 84 + 24 + 2 + 59 = bold{236 " cylinders"}$

=== (c) SCAN (Elevator) Algorithm (Moving High $\to$ Boundary 199)
- Head moves toward higher cylinders up to boundary $199$, then reverses down to remaining requests:
- Path: $53 \to 65 \to 67 \to 98 \to 122 \to 124 \to 183 \to bold{199} \to 37 \to 14$
- Calculation formula: $(199 - 53) + (199 - 14) = 146 + 185$
- *Total Head Movement (SCAN):* $bold{331 " cylinders"}$

=== (d) LOOK Algorithm (Moving High $\to$ Max Request 183)
- Head moves toward higher cylinders up to max request $183$ (does NOT go to boundary $199$), then reverses down to $14$:
- Path: $53 \to 65 \to 67 \to 98 \to 122 \to 124 \to bold{183} \to 37 \to 14$
- Calculation formula: $(183 - 53) + (183 - 14) = 130 + 169$
- *Total Head Movement (LOOK):* $bold{299 " cylinders"}$

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// PROBLEM 2: UNIX INODE MAXIMUM FILE SIZE
// ==========================================
= Problem 2: Unix Inode Maximum File Size Math

== Problem Statement
Consider a Unix file system using an Inode with:
- 12 Direct block pointers
- 1 Single indirect pointer
- 1 Double indirect pointer
- 1 Triple indirect pointer

Disk block size $= 1 "KB" = 1024 "bytes"$. Each block pointer requires $4 "bytes"$.

Calculate the maximum file size supported by this Inode architecture.

== Step-by-Step Solution

=== 1. Block Pointer Capacity
- Number of pointers per indirect block $= 1024 / 4 = 256 " pointers"$.

=== 2. Capacity Contribution by Pointer Type
1. *Direct Blocks (12 pointers):*
   - $12 * 1 "KB" = 12 "KB"$
2. *Single Indirect Block (1 pointer):*
   - $256 * 1 "KB" = 256 "KB"$
3. *Double Indirect Block (1 pointer):*
   - $256 * 256 * 1 "KB" = 65,536 "KB" = 64 "MB"$
4. *Triple Indirect Block (1 pointer):*
   - $256 * 256 * 256 * 1 "KB" = 16,777,216 "KB" = 16 "GB"$

=== 3. Maximum Supported File Size
- $"Max File Size" = 12 "KB" + 256 "KB" + 64 "MB" + 16 "GB" approx bold{16.064 " GB"}$

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Unit 5 Solved Examples — SPPU TE IT 2024 Pattern
  ]
]
