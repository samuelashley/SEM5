// Typst Theory Notes - Operating Systems (Unit 4)
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — UNIT 4]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Memory Management & Virtual Memory]]
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

// Academic Figure Box helper
#let figure-box(title, body) = align(center)[
  #block(
    width: 92%,
    stroke: 0.75pt + rgb("#9f1239"),
    fill: rgb("#fff1f2"),
    radius: 4pt,
    inset: 10pt,
    [
      #body
      #v(4pt)
      #text(size: 8.5pt, weight: "bold", fill: rgb("#9f1239"))[#title]
    ]
  )
]

// Title Header Page 1
#align(left)[
  #text(size: 9pt, fill: rgb("#9f1239"), weight: "bold")[OPERATING SYSTEM (TE IT - 2024 Pattern)] \
  #v(2pt)
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 4: MEMORY MANAGEMENT & VIRTUAL MEMORY]
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
      [#text(weight: "bold", fill: rgb("#0f172a"))[Status:] Publication-Grade Theory Guide],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Code:] PCC-301-ITT]
    )
  ]
)

#v(6pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(6pt)

=== Syllabus Mapping & Unit Structure
The following table outlines the curriculum mapping and priority weightage for Unit 4.

#table(
  columns: (1.5fr, 3fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 7pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Syllabus Topic]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[In-Depth Exam Coverage]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Priority / Weightage]*]
  ),
  [*Memory Partitioning*], [Fixed vs Dynamic Partitioning, Internal & External Fragmentation, Compaction, Buddy System (power-of-2 allocation math).], [High Priority \ (6-8 Marks Qs)],
  [*Contiguous Allocation & Placement*], [Memory Management Unit (MMU), Logical vs Physical Address Space, Placement Strategies (First Fit, Best Fit, Worst Fit, Next Fit).], [High Priority \ (8-10 Marks Qs)],
  [*Paging & Segmentation*], [Page & Frame mapping, Page Table Entries (PTE), 2-Level & Inverted Paging, Segmentation, Hardware Address Translation math.], [High Priority \ (10-12 Marks Qs)],
  [*Virtual Memory & TLB*], [Demand Paging, Page Fault Lifecycle, Translation Lookaside Buffer (TLB), Hit Ratio & Effective Access Time (EAT) calculations.], [High Priority \ (8-10 Marks Qs)],
  [*Page Replacement & Thrashing*], [Page Replacement Algorithms (FIFO, Optimal, LRU, MRU), Belady's Anomaly, Thrashing, Working Set Model, Page Fault Frequency.], [High Priority \ (10-12 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Memory Management Requirements and Partitioning

== Five Core Requirements of Memory Management

1. *Relocation:* The OS must dynamically map logical process instructions to physical RAM addresses at runtime as processes are loaded, swapped out, and reloaded.
2. *Protection:* User processes must be hardware-restricted from accessing or modifying the physical memory space of other processes or the OS kernel without permission.
3. *Sharing:* The OS must permit multiple concurrent processes to safely share a single copy of common memory regions (e.g., shared code libraries, shared memory IPC segments).
4. *Logical Organization:* Memory is organized as modular, linear user segments (main program, modules, data arrays, stacks) corresponding to human program structure.
5. *Physical Organization:* The OS manages the physical hierarchy separating fast, volatile primary RAM from slow, non-volatile secondary storage (disk/SSD).

== Memory Partitioning Schemes: Fixed vs. Dynamic Partitioning

1. *Fixed (Static) Partitioning:*
   - Main memory is divided into fixed-size static regions (equal or unequal sizes) at system initialization.
   - *Internal Fragmentation:* Occurs when a process allocated to a partition is smaller than the partition size; the wasted internal memory cannot be used by any other process.

2. *Dynamic (Variable) Partitioning:*
   - Memory partitions are created dynamically, allocating the exact amount of RAM required by a process.
   - *External Fragmentation:* As processes terminate, memory becomes broken into small, non-contiguous free gaps. Although total free RAM is sufficient, no single contiguous hole can satisfy an incoming request.
   - *Compaction:* OS shuffle mechanism that relocates processes in RAM to merge all free spaces into one large contiguous block (incurs high CPU relocation overhead).

3. *The Buddy System:*
   - Memory blocks are allocated in powers of two ($2^K$). If a request of size $s$ requires a block, the OS splits a free block of size $2^U$ into two equal "buddies" of size $2^{U-1}$ until the smallest power-of-two block $2^K >= s$ is reached.
   - When a process terminates, adjacent free buddies of identical size are automatically merged back into $2^{K+1}$.

#table(
  columns: (1.2fr, 1.3fr, 1.3fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.even(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Fixed Partitioning]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Dynamic Partitioning]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Buddy System]*]
  ),
  [ *Partition Size* ], [ Static, predetermined size. ], [ Variable, exact process size. ], [ Powers of two ($2^K$ bytes). ],
  [ *Fragmentation Type* ], [ Severe *Internal Fragmentation*. ], [ Severe *External Fragmentation*. ], [ Moderate Internal & External. ],
  [ *Management Overhead* ], [ Very low. ], [ High (Requires Compaction). ], [ Moderate (Fast power-of-2 merging). ],
  [ *Degree of Multiprogramming* ], [ Limited by fixed partition count. ], [ Dynamic, limited only by total RAM. ], [ Flexible and highly responsive. ]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=305")[Source: Stallings, Ch 7, p. 305-330] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=345")[Source: Silberschatz, Ch 8, p. 345-365]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 2
// ==========================================
= Contiguous Memory Allocation and Placement Strategies

== Memory Management Unit (MMU) and Address Translation
The CPU generates *Logical (Virtual) Addresses*, whereas physical RAM memory controller hardware understands *Physical Addresses*.
- *Relocation Register (Base Register):* Holds the starting physical RAM address of the active process.
- *Limit Register:* Specifies the exact size bound of the process memory space.
- *Hardware Translation Formula:*
  $"Physical Address" = "Logical Address" + "Relocation Register"$
  If $"Logical Address" >= "Limit Register"$, the MMU generates a hardware *Segmentation Fault / Trap*.

== Dynamic Memory Placement Strategies

1. *First Fit:* Allocates the *first* available free hole from the beginning of RAM that is large enough. Fast, low search overhead.
2. *Best Fit:* Searches the entire memory list to allocate the *smallest* hole that is large enough. Leaves behind tiny unusable residual holes (high external fragmentation).
3. *Worst Fit:* Allocates the *largest* available free hole. Leaves behind larger remaining holes, but requires searching the entire memory list.
4. *Next Fit:* Similar to First Fit, but starts searching from the location of the last allocated block rather than the beginning of memory.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=350")[Source: Silberschatz, Ch 8, p. 350-370] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Deitel-H.M.-Deitel-P.J.-etc.-Operating-Systems.pdf#page=180")[Source: Deitel, Ch 5, p. 180-205]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 3
// ==========================================
= Non-Contiguous Allocation: Paging and Segmentation

== Fundamental Principles of Paging
Paging is a non-contiguous memory management scheme that completely eliminates External Fragmentation.

1. *Pages and Frames:*
   - *Physical RAM* is divided into fixed-size physical blocks called *Frames*.
   - *Logical Memory* of a process is divided into equal-sized blocks called *Pages*.
   - Frame size is always equal to Page size (typically $4 "KB" = 4096 "bytes"$).

2. *Page Table Architecture:*
   The OS maintains a dedicated *Page Table* for each process. The Page Table maps logical Page Numbers ($p$) to physical Frame Numbers ($f$).

3. *Hardware Address Translation Math:*
   For a $m$-bit logical address space and $2^n$-byte page size:
   - *Page Number ($p$):* High-order $m - n$ bits ($p = "Logical Address" / "Page Size"$).
   - *Page Offset ($d$):* Low-order $n$ bits ($d = "Logical Address" \bmod "Page Size"$).
   - *Physical Address Formula:* $"Physical Address" = (f * "Page Size") + d$.

#figure-box(
  "Figure 4.1: Hardware Address Translation with Paging and Page Table",
  [
    #rect(
      width: 100%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #align(center)[
          `CPU Logical Address` $[ p \mid d ]$ $->$ `Page Table Lookup at index p` $->$ `Retrieve Frame Number f` \
          #v(3pt)
          #line(length: 85%, stroke: 1pt + rgb("#9f1239")) \
          #v(3pt)
          `Combine Frame Number f with Offset d` $->$ `Physical Memory Address` $[ f \mid d ]$
        ]
      ]
    )
  ]
)

== Hierarchical (Two-Level) and Inverted Page Tables

1. *Two-Level Paging:*
   On 32-bit systems with $4 "KB"$ pages, a single page table requires $4 "MB"$ of contiguous RAM per process. Two-Level paging splits the page number into an *Outer Page Table* ($p_1$) and an *Inner Page Number* ($p_2$), paging the page table itself.

2. *Inverted Page Table:*
   Rather than maintaining one page table per process, an Inverted Page Table has a single entry for each physical RAM frame in the system, indexed by $\langle "PID", p \rangle$. Drastically reduces page table memory consumption.

== Segmentation and Comparison with Paging
*Segmentation* divides logical memory into variable-length user-centric segments (Main program, Functions, Data arrays, Stack).
- *Segment Table:* Maps Segment Number ($s$) to Segment Base Address ($b$) and Segment Limit ($L$).
- Address translation checks if Offset $d < L$; if valid, $"Physical Address" = b + d$.

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Paging]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Segmentation]*]
  ),
  [ *Block Size* ], [ Fixed physical size (e.g., $4 "KB"$). ], [ Variable logical length. ],
  [ *User Visibility* ], [ Completely transparent to user/programmer. ], [ Visible to programmer (logical modules). ],
  [ *Fragmentation* ], [ Internal fragmentation only; zero external. ], [ External fragmentation; zero internal. ],
  [ *Hardware Table* ], [ Page Table (maps page $p \to$ frame $f$). ], [ Segment Table (maps segment $s \to$ base $b$, limit $L$). ]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=340")[Source: Stallings, Ch 8, p. 340-370] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Andrew-S.-Tanenbaum-Modern-Operating-Systems.pdf#page=190")[Source: Tanenbaum, Ch 3, p. 190-220]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 4
// ==========================================
= Virtual Memory and Translation Lookaside Buffer (TLB)

== Fundamental Principle of Virtual Memory & Demand Paging
*Virtual Memory* decouples logical user memory from physical RAM, allowing execution of processes whose total memory space exceeds available physical RAM.

1. *Demand Paging:* Pages are loaded into physical RAM only when referenced during execution (Lazy Swapper / Pager).
2. *Page Table Entry (PTE) Bits:*
   - *Valid / Invalid (Present) Bit:* `1` if page is currently loaded in RAM; `0` if page resides on secondary disk.
   - *Dirty (Modify) Bit:* `1` if page content was modified in RAM (must be written back to disk on replacement).
   - *Protection Bits:* Read, Write, Execute access permissions.

== Page Fault Handling Lifecycle
A *Page Fault* occurs when a process attempts to access a page marked invalid (Present bit = `0`).

#figure-box(
  "Figure 4.2: Step-by-Step Page Fault Handling Lifecycle Sequence",
  [
    #rect(
      width: 100%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #align(center)[
          `Memory Access Instruction` $->$ `PTE Valid Bit = 0` $->$ `CPU Hardware Trap to OS Kernel` \
          #v(3pt)
          #line(length: 85%, stroke: 1pt + rgb("#9f1239")) \
          #v(3pt)
          `Find Free RAM Frame` $->$ `Read Page from Disk into Frame` $->$ `Update PTE (Set Valid=1, Frame=f)` \
          #v(3pt)
          #line(length: 85%, stroke: 1pt + rgb("#9f1239")) \
          #v(3pt)
          `Restore Saved Process Context` $->$ `Restart Faulting Instruction`
        ]
      ]
    )
  ]
)

== Translation Lookaside Buffer (TLB) and Effective Access Time (EAT)
Because paging requires two RAM accesses per instruction (one for Page Table, one for Data), hardware designers add a fast hardware associative cache called the *Translation Lookaside Buffer (TLB)*.

#figure-box(
  "Figure 4.3: Hardware Address Translation with TLB Cache",
  [
    #rect(
      width: 100%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #align(center)[
          `Logical Page Number p` $->$ `Parallel TLB Search` \
          #v(2pt)
          *TLB Hit:* `Retrieve Frame Number f immediately from TLB` $(t_{"TLB"} + t_{"RAM"})$ \
          *TLB Miss:* `Access Page Table in RAM` $->$ `Update TLB` $(t_{"TLB"} + 2 * t_{"RAM"})$
        ]
      ]
    )
  ]
)

=== Effective Access Time (EAT) Formula
Let $alpha$ be the TLB Hit Ratio, $epsilon$ be the TLB search time, and $m$ be physical RAM access time:
$"EAT" = alpha * (epsilon + m) + (1 - alpha) * (epsilon + 2m)$

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=390")[Source: Silberschatz, Ch 9, p. 390-420] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Andrew-S.-Tanenbaum-Modern-Operating-Systems.pdf#page=210")[Source: Tanenbaum, Ch 3, p. 210-240]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 5
// ==========================================
= Page Replacement Algorithms and Thrashing

== Page Replacement Algorithms Overview
When a page fault occurs and no physical RAM frames are free, the OS must select a *Victim Page* to replace.

#table(
  columns: (1fr, 1.1fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Algorithm]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Replacement Rule]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Key Features]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Major Drawbacks & Anomalies]*]
  ),
  [ *FIFO* ], [ Replaces the oldest page loaded into RAM. ], [ Simple queue implementation. ], [ *Belady's Anomaly:* Page faults increase when allocated frames increase! ],
  [ *Optimal (OPT)* ], [ Replaces page that will not be used for longest time in future. ], [ Lowest possible page fault rate. ], [ Impossible to implement in real systems (requires future knowledge). ],
  [ *LRU* ], [ Replaces page that has not been used for longest past time. ], [ Excellent practical approximation of OPT. ], [ Requires hardware stack or 64-bit counter per PTE. ],
  [ *MRU* ], [ Replaces page most recently used. ], [ Useful for specific file scanning patterns. ], [ High page fault rate for general workloads. ]
)

== Belady's Anomaly in FIFO
*Belady's Anomaly* is the counter-intuitive phenomenon where increasing the number of allocated RAM frames results in an *increase* in the total number of page faults for the FIFO algorithm. (LRU and Optimal algorithms are stack algorithms and are immune to Belady's anomaly).

== Thrashing and Working Set Model
*Thrashing* occurs when a process does not have enough physical RAM frames to support its active pages. The process spends more time swapping pages in and out of disk than executing instructions, causing CPU utilization to collapse to near zero.

1. *Working Set Model:* Based on locality of reference. The Working Set $W(t, Delta)$ is the set of pages referenced by the process during the most recent time window $Delta$.
2. *Page Fault Frequency (PFF):* Establishes upper and lower bounds on page fault rates. If fault rate exceeds upper threshold, OS allocates more frames to process; if fault rate falls below lower threshold, OS reclaims unused frames.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=375")[Source: Stallings, Ch 8, p. 375-405] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=420")[Source: Silberschatz, Ch 9, p. 420-450]

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Unit 4 Theory Notes — SPPU TE IT 2024 Pattern
  ]
]
