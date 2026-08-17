// Typst Theory Notes - Operating Systems (Unit 2)
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — UNIT 2]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Process Description & Control]]
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 2: PROCESS DESCRIPTION AND CONTROL]
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
The following table outlines the curriculum mapping and priority weightage for Unit 2.

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
  [*Process Concept & States*], [Process memory address space (Text, Data, Heap, Stack), 5-State model, 7-State model with swapping mechanics, PCB structure & attributes.], [High Priority \ (8-10 Marks Qs)],
  [*Process Control & POSIX API*], [OS execution models, Mode Switch vs Context Switch overhead, POSIX process management (`fork`, `exec`, `wait`, `exit`), Zombie vs Orphan processes.], [High Priority \ (8-10 Marks Qs)],
  [*Threads & Multithreading*], [Processes vs Threads, Single vs Multithreaded architecture, User-Level Threads (ULT) vs Kernel-Level Threads (KLT), Mapping models (1:1, M:1, M:N), Pthreads.], [High Priority \ (6-8 Marks Qs)],
  [*CPU Scheduling Principles*], [Types of Schedulers (Long/Medium/Short-term), Scheduling criteria metrics, Preemptive vs Non-Preemptive algorithms (FCFS, SJF, SRTF, Priority, RR, MLQ, MLFQ).], [High Priority \ (8-10 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Process Description and Process Control Block

== Process Concept and Address Space Architecture
A *Process* is defined as a program in execution. While a program is a passive entity stored on disk (executable file), a process is an active entity possessing an assigned processor counter, set of CPU registers, allocated system resources, and an isolated virtual address space.

1. *Text Segment (Code Segment):* Contains executable binary machine instructions read from disk. Usually marked read-only to permit safe sharing across concurrent instances.
2. *Data Segment:*
   - *Initialized Data:* Stores global and static variables explicitly initialized by the programmer.
   - *Uninitialized Data (BSS):* Stores global and static variables initialized to zero by default at process startup.
3. *Heap Segment:* Dynamically allocated memory space managed at runtime via memory calls (`malloc()`, `calloc()`, `new`, `free()`). Grows upwards toward higher memory addresses.
4. *Stack Segment:* Stores temporary stack frames for active function calls (local variables, function arguments, return addresses, saved register states). Grows downwards toward lower memory addresses.

== Process State Transitions: 5-State vs. 7-State Model

1. *Five-State Process Model:*
   - *New:* Process is being created by the OS but not yet loaded into main memory ready queue.
   - *Ready:* Process is resident in RAM, fully prepared to execute, awaiting CPU assignment.
   - *Running:* Instructions are actively being executed by a CPU core.
   - *Blocked (Waiting):* Process cannot execute until an external event or I/O operation completes.
   - *Terminated (Exit):* Process has halted execution; resources are reclaimed by the OS.

2. *Seven-State Process Model (Swapping Mechanics):*
   When main memory becomes overcommitted, the OS *Medium-Term Scheduler* swaps suspended processes out of RAM to secondary storage (swap disk area), introducing two suspended states:
   - *Ready / Suspend:* Process is in secondary storage but ready to execute as soon as it is swapped back into RAM.
   - *Blocked / Suspend:* Process is in secondary storage and waiting for an I/O event.

#figure-box(
  "Figure 2.1: Seven-State Process Transition Diagram with Medium-Term Swapping Triggers",
  [
    #rect(
      width: 100%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #align(center)[
          `New` $->$ `Ready` $<->$ `Running` $->$ `Terminated` \
          #v(3pt)
          `Running` $->$ `Blocked` $->$ `Blocked/Suspend` $->$ `Ready/Suspend` $->$ `Ready` \
          #v(2pt)
          #text(size: 8pt, style: "italic")[Swapping Triggers: Suspend (RAM -> Swap Disk) | Activate (Swap Disk -> RAM)]
        ]
      ]
    )
  ]
)

== Structure and Attributes of Process Control Block (PCB)
The *Process Control Block (PCB)* is the central data structure maintained in kernel memory to represent and control each active process.

1. *Process Identification:* Unique *Process ID (PID)*, Parent PID (PPID), User ID (UID), and Group ID (GID).
2. *Processor State Information:* Program Counter (PC), CPU data registers, Stack Pointer (SP), Index registers, and Condition Code flags.
3. *Process Control Information:*
   - *Process State:* Current status (Ready, Running, Blocked, Suspended).
   - *Scheduling Priority:* Priority level, CPU usage metrics, scheduling queue pointers.
   - *Memory Management:* Base and limit registers, Page Table pointers, or Segment Table references.
   - *I/O & Accounting:* List of open file descriptors, allocated I/O devices, total CPU time consumed, memory quotas.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=105")[Source: Stallings, Ch 3, p. 105-130] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=105")[Source: Silberschatz, Ch 3, p. 105-125]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 2
// ==========================================
= Process Control & POSIX API

== Mode Switch vs. Context Switch

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.even(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Mode Switch]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Context Switch]*]
  ),
  [ *Definition* ], [ Transition of CPU hardware execution privilege between User Mode ($1$) and Kernel Mode ($0$). ], [ Saving execution context of current process and restoring saved context of another process. ],
  [ *Process Identity* ], [ Process identity remains unchanged (same process continues execution in kernel space). ], [ Process identity changes (CPU switches from Process $P_A$ to Process $P_B$). ],
  [ *Overhead* ], [ Minimal overhead (saves minimal PC and register flags onto kernel stack). ], [ Significant overhead (saves full PCB state, flushes CPU cache lines, reloads Page Tables/TLB). ],
  [ *Triggering Cause* ], [ Hardware interrupt, software trap instruction, or system call invocation. ], [ Time quantum expiration, higher-priority preemption, or process entering blocked state. ]
)

== POSIX Process Management API and Lifecycle
In UNIX/Linux systems, process creation follows a distinct copy-and-replace lifecycle using C system calls.

1. *`fork()` System Call:*
   - Creates an exact duplicate child process of the caller parent process.
   - Child receives a duplicate copy of parent address space (optimized via *Copy-On-Write (COW)*).
   - *Return Values:* Returns `0` to the child process, returns child's `PID` to parent process, and `-1` on failure.

2. *`exec()` Family System Calls:* Replaces the current process virtual memory space with a new executable binary program from disk.

3. *`wait()` / `waitpid()` System Calls:* Blocks parent execution until child process completes, retrieving child's exit status code.

4. *`exit()` System Call:* Terminates calling process, releases allocated RAM/files, and leaves exit status code in PCB.

=== Zombie vs. Orphan Processes
- *Zombie Process:* A process that has completed execution via `exit()`, but its entry remains in the kernel Process Table because its parent has not yet executed `wait()` to read its exit status code.
- *Orphan Process:* A child process whose parent process terminated before calling `wait()`. Inherited automatically by the `init` / `systemd` process (PID 1), which periodically calls `wait()` to reap them.

#figure-box(
  "Figure 2.2: Parent-Child Process Lifecycle via POSIX System Calls",
  [
    #rect(
      width: 100%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #align(center)[
          *Parent Process:* `fork()` $->$ `wait()` *(Blocks)* $----------------------------->$ `Reaps Exit Code` \
          #v(3pt)
          #line(length: 85%, stroke: 1pt + rgb("#9f1239")) \
          #v(3pt)
          *Child Process:* `Executes Duplicate` $->$ `exec()` *(Replaces Code)* $->$ `exit()` *(Sends SIGCHLD)*
        ]
      ]
    )
  ]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=126")[Source: Silberschatz, Ch 3, p. 126-145] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Andrew-S.-Tanenbaum-Modern-Operating-Systems.pdf#page=85")[Source: Tanenbaum, Ch 2, p. 85-105]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 3
// ==========================================
= Threads and Multithreading

== Thread Concept and Multithreaded Process Architecture
A *Thread* is the fundamental unit of CPU utilization. It represents an independent sequential stream of execution within a process.

1. *Shared Resources Across Threads in Process:* Memory address space (Text, Data, Heap segments), open file descriptors, child processes, signals, and environment settings.
2. *Per-Thread Private State:* Unique Thread ID (TID), Program Counter (PC), CPU Data Registers, and isolated Thread Execution Stack.

== User-Level Threads (ULT) vs. Kernel-Level Threads (KLT)

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[User-Level Threads (ULT)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Kernel-Level Threads (KLT)]*]
  ),
  [ *Management Layer* ], [ Managed entirely by user-space runtime thread library (e.g., POSIX GNU Portable Threads). ], [ Managed directly by OS kernel scheduler. ],
  [ *OS Kernel Visibility* ], [ Invisible to OS kernel; kernel sees only a single process. ], [ Directly visible and scheduled individually by OS kernel. ],
  [ *Switching Overhead* ], [ Extremely fast (user-mode context switch without kernel intervention). ], [ Slower (requires kernel mode switch and hardware state save). ],
  [ *Blocking I/O Effect* ], [ If one ULT executes a blocking system call, entire process blocks! ], [ If one KLT blocks, kernel schedules another thread of the process. ],
  [ *Multiprocessing* ], [ Cannot utilize multiple physical CPU cores concurrently. ], [ Scales seamlessly across multi-core symmetric multiprocessors. ]
)

== Multithreading Mapping Models

1. *Many-to-One Model ($M:1$):* Maps multiple user-level threads to a single kernel thread. Fast switching, but cannot use multi-core CPUs and blocks process on single thread I/O.
2. *One-to-One Model ($1:1$):* Maps each user thread directly to an individual kernel thread (Standard in Linux, Windows). Provides true multi-core concurrency.
3. *Many-to-Many Model ($M:N$):* Multiplexes $M$ user threads onto $N$ kernel threads ($M \ge N$). Achieves optimal balance of speed and multi-core scalability.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=155")[Source: Stallings, Ch 4, p. 155-180] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=161")[Source: Silberschatz, Ch 4, p. 161-185]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 4
// ==========================================
= CPU Scheduling Principles and Algorithms

== Processor Scheduler Types and Scheduling Metrics

1. *Long-Term Scheduler (Job Scheduler):* Selects processes from disk queue and loads them into RAM ready queue. Controls *Degree of Multiprogramming*.
2. *Medium-Term Scheduler (Swapper):* Handles process swapping between main memory and secondary swap disk to adjust memory load.
3. *Short-Term Scheduler (CPU Scheduler):* Selects from RAM ready queue and assigns CPU core execution. Executes extremely frequently (every $10 - 100 "ms"$).

=== Core Quantitative Scheduling Criteria
- *CPU Utilization:* Percentage of time CPU actively executes instructions ($40\% - 90\%$).
- *Throughput:* Number of completed processes per unit time.
- *Turnaround Time ($T_T$):* Interval from process arrival to complete termination ($T_T = T_C - T_A$).
- *Waiting Time ($T_W$):* Total time spent waiting inside ready queue ($T_W = T_T - T_B$).
- *Response Time ($T_R$):* Interval from process arrival to first CPU response.

== Comprehensive Comparison of CPU Scheduling Algorithms

#table(
  columns: (1fr, 1.1fr, 1.3fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Algorithm]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Preemptive?]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Key Advantages]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Major Drawbacks & Pitfalls]*]
  ),
  [ *FCFS* ], [ Non-Preemptive ], [ Simple, fair, zero scheduling overhead. ], [ *Convoy Effect:* Short processes wait behind long CPU-bound process. ],
  [ *SJF* ], [ Non-Preemptive ], [ Mathematically optimal minimum average waiting time. ], [ Impossible to know exact next CPU burst time; *Starvation* of long jobs. ],
  [ *SRTF* ], [ Preemptive ], [ Minimizes turnaround time for incoming short jobs. ], [ Frequent context-switch overhead; starvation of long jobs. ],
  [ *Priority* ], [ Both supported ], [ Assigns CPU based on critical task importance. ], [ *Indefinite Starvation:* Resolved via *Aging* (gradually increasing priority). ],
  [ *Round Robin* ], [ Preemptive ], [ Excellent response time for interactive systems. ], [ Performance depends on quantum $q$ ($q$ too small $->$ high overhead; $q$ huge $->$ FCFS). ],
  [ *MLFQ* ], [ Preemptive ], [ Adaptive; separates CPU-bound & I/O-bound jobs. ], [ Complex configuration of queues, demotion rules, and time slices. ]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=385")[Source: Stallings, Ch 9, p. 385-420] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=261")[Source: Silberschatz, Ch 6, p. 261-295]

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Unit 2 Theory Notes — SPPU TE IT 2024 Pattern
  ]
]
