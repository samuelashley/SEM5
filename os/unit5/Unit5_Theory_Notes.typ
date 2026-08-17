// Typst Theory Notes - Operating Systems (Unit 5)
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — UNIT 5]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Input/Output & File Management]]
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 5: INPUT/OUTPUT & FILE MANAGEMENT]
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
The following table outlines the curriculum mapping and priority weightage for Unit 5.

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
  [*I/O System Architecture*], [I/O Modes (Programmed I/O, Interrupt-Driven I/O, Direct Memory Access DMA), I/O Buffering strategies (Single, Double, Circular).], [High Priority \ (6-8 Marks Qs)],
  [*Disk Architecture & Access*], [Hard disk geometry (Platters, Tracks, Sectors, Cylinders), Disk Access Time components ($T_s, T_r, T_t$).], [High Priority \ (6-8 Marks Qs)],
  [*Disk Scheduling Algorithms*], [FCFS, SSTF, SCAN (Elevator), C-SCAN, LOOK, C-LOOK algorithms, Total head movement calculations.], [High Priority \ (10-12 Marks Qs)],
  [*File System Structure*], [File Concept, File Attributes, Operations, Directory structures (Single-level, Two-level, Tree, Acyclic Graph).], [Medium Priority \ (5-6 Marks Qs)],
  [*File Allocation & Unix Inodes*], [Allocation methods (Contiguous, Linked FAT, Indexed), Unix Inode Structure (Direct/Indirect blocks), Free space management, Security.], [High Priority \ (10-12 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Input/Output System Architecture and Buffering

== Organization of I/O Execution Functions

1. *Programmed I/O:*
   - The CPU directly controls I/O operations by continually polling status registers of the I/O module until the operation completes.
   - *Drawback:* Severe CPU busy-waiting (spinlock), wasting valuable processing cycles.

2. *Interrupt-Driven I/O:*
   - The CPU issues an I/O command to the device module and immediately switches execution to another process.
   - When the device completes I/O, it raises a hardware *Interrupt Signal* on the interrupt bus, forcing the CPU to execute the corresponding Interrupt Service Routine (ISR).

3. *Direct Memory Access (DMA):*
   - Designed for high-speed bulk data transfers (HDDs, SSDs, Network Interface Cards).
   - A dedicated *DMA Controller* transfers entire data blocks directly between physical RAM memory and the I/O module without CPU intervention.
   - The CPU is interrupted only twice: once at transfer initialization and once when the entire block transfer finishes.

== I/O Buffering Strategies

1. *Single Buffering:* OS assigns a single memory buffer in kernel RAM. While the user process consumes data from the buffer, the I/O device transfers the next block into kernel space.
2. *Double Buffering (Ping-Ponging):* OS assigns two kernel memory buffers ($B_1$ and $B_2$). The device fills $B_1$ while the process reads $B_2$, then swaps roles seamlessly.
3. *Circular Buffering:* OS maintains a queue of three or more buffers managed via producer-consumer semantics to handle bursty I/O throughput.

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.even(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Interrupt-Driven I/O]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Direct Memory Access (DMA)]*]
  ),
  [ *CPU Involvement* ], [ High (CPU handles every byte/word transfer via ISR). ], [ Minimal (CPU initializes block count & base address). ],
  [ *Transfer Mechanism* ], [ Data moves through CPU registers ($D \to "CPU" \to "RAM"$). ], [ Data moves directly over system bus ($D \to "RAM"$). ],
  [ *Interrupt Frequency* ], [ Interrupts CPU after every single byte or word. ], [ Interrupts CPU once per entire data block transfer. ],
  [ *Optimal Use Case* ], [ Low-speed byte devices (Keyboard, Mouse, Serial ports). ], [ High-speed block devices (Disk drives, 10GbE NICs). ]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=440")[Source: Stallings, Ch 11, p. 440-465] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=515")[Source: Silberschatz, Ch 13, p. 515-540]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 2
// ==========================================
= Hard Disk Architecture and Disk Scheduling

== Hard Disk Geometry and Access Time Math
A magnetic Hard Disk Drive (HDD) consists of stacked physical *Platters* spinning on a central spindle ($5400 - 15000 "RPM"$).
- Each platter surface is coated with magnetic material divided into concentric rings called *Tracks*.
- Identical track positions across all platter surfaces form a *Cylinder*.
- Tracks are subdivided into 512-byte or 4096-byte *Sectors*.

=== Components of Disk Access Time
1. *Seek Time ($T_s$):* Time required for the read/write head arm to move physically to the target cylinder track.
2. *Rotational Latency ($T_r$):* Time required for the target sector to rotate underneath the read/write head.
   - Average Rotational Latency: $T_{r,"avg"} = 1 / (2 * "RPM") " minutes"$.
3. *Transfer Time ($T_t$):* Time required to transfer the requested data bytes.
   - $T_t = b / (r * N)$, where $b$ is bytes to transfer, $r$ is rotation speed, and $N$ is bytes per track.

#figure-box(
  "Figure 5.1: Components of Total Hard Disk Access Time",
  [
    #rect(
      width: 100%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #align(center)[
          `Total Disk Access Time` $= T_s " (Seek Time)" + T_r " (Rotational Latency)" + T_t " (Transfer Time)"$ \
          #v(3pt)
          #text(size: 8pt, style: "italic")[Seek Time (3-10 ms) dominates total access time $==>$ Disk Scheduling minimizes Seek Head Movement!]
        ]
      ]
    )
  ]
)

== Disk Scheduling Algorithms Comparison

#table(
  columns: (1fr, 1.1fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Algorithm]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Head Movement Rule]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Key Advantages]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Major Drawbacks]*]
  ),
  [ *FCFS* ], [ Services requests in exact order of arrival. ], [ Completely fair; zero starvation risk. ], [ Wild head swings; very high total seek distance. ],
  [ *SSTF* ], [ Services request closest to current head position. ], [ Minimizes average seek time. ], [ *Starvation* of requests located far from active head area. ],
  [ *SCAN* \ (Elevator) ], [ Moves head toward one end, servicing requests until disk boundary, then reverses. ], [ Low variance in response time; eliminates starvation. ], [ Favors requests near boundary turnaround points. ],
  [ *C-SCAN* ], [ Moves head in one direction servicing requests; jumps back to start without servicing. ], [ Provides uniform wait time across all cylinders. ], [ Extra unserviced return trip overhead. ],
  [ *LOOK / C-LOOK* ], [ Same as SCAN/C-SCAN, but head reverses immediately at *last request* (no boundary trip). ], [ Prevents unnecessary head travel to physical disk ends. ], [ Preferred standard for production disk controllers. ]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=475")[Source: Stallings, Ch 11, p. 475-500] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=465")[Source: Silberschatz, Ch 10, p. 465-490]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 3
// ==========================================
= File Systems, Allocation Methods, and Unix Inodes

== File Allocation Methods

1. *Contiguous File Allocation:*
   - Each file occupies a contiguous set of disk blocks.
   - *Advantage:* Maximum sequential read performance (single seek operation).
   - *Disadvantage:* External fragmentation and difficulty expanding file size.

2. *Linked File Allocation (FAT):*
   - Each file is a linked list of disk blocks; directory entry contains pointer to first and last blocks.
   - *Advantage:* Zero external fragmentation; easy file expansion.
   - *Disadvantage:* Slow random access (requires traversing links sequentially); pointer corruption destroys file.

3. *Indexed File Allocation (Unix Inode):*
   - Each file possesses a dedicated index block (*Inode*) containing an array of direct and indirect disk block pointers.
   - *Advantage:* Fast direct and random access; supports dynamic file expansion without external fragmentation.

#figure-box(
  "Figure 5.2: Structure of Unix Inode with Direct & Multi-Level Indirect Pointers",
  [
    #rect(
      width: 100%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #align(center)[
          *Inode Block:* Mode, Owner, Size, Timestamps \
          #v(2pt)
          `Direct Block Pointers (0 to 11)` $->$ `Direct Data Blocks` \
          `Single Indirect Pointer` $->$ `Block of Direct Pointers` $->$ `Data Blocks` \
          `Double Indirect Pointer` $->$ `Block of Single Indirect Pointers` $->$ `Data Blocks` \
          `Triple Indirect Pointer` $->$ `Block of Double Indirect Pointers` $->$ `Data Blocks`
        ]
      ]
    )
  ]
)

== Directory Structures and Protection

1. *Directory Structures:* Single-Level, Two-Level, Tree-Structured (Paths: `/usr/home/file.txt`), Acyclic Graph (Shared files via hard/soft links).
2. *File Protection & Access Control:*
   - *Access Control Matrix:* Grid specifying explicit permissions for each User $U_i$ on File $F_j$.
   - *Access Control Lists (ACL):* Attached to each file, listing users and permitted operations (`rwx`).
   - *Capability Lists:* Attached to each user, listing accessible files and rights.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=510")[Source: Stallings, Ch 12, p. 510-545] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Andrew-S.-Tanenbaum-Modern-Operating-Systems.pdf#page=260")[Source: Tanenbaum, Ch 4, p. 260-295]

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Unit 5 Theory Notes — SPPU TE IT 2024 Pattern
  ]
]
