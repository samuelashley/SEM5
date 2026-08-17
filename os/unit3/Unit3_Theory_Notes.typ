// Typst Theory Notes - Operating Systems (Unit 3)
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — UNIT 3]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Concurrency Control & Deadlocks]]
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 3: CONCURRENCY CONTROL & DEADLOCKS]
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
The following table outlines the curriculum mapping and priority weightage for Unit 3.

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
  [*Process Synchronization*], [Principles of Concurrency, Race Conditions, Critical Section Problem, 3 Core Requirements (Mutual Exclusion, Progress, Bounded Waiting), Software Solutions (Peterson's Algorithm).], [High Priority \ (8-10 Marks Qs)],
  [*Hardware & OS Primitives*], [Hardware Atomic Instructions (`TestAndSet`, `CompareAndSwap`), Disabling Interrupts, Mutex Locks, Counting & Binary Semaphores, Monitors.], [High Priority \ (8-10 Marks Qs)],
  [*Classical Synchronization*], [Producer-Consumer Problem, Readers-Writers Problem, Dining Philosophers Problem, IPC Mechanisms (Pipes, Shared Memory, Message Passing).], [High Priority \ (8-10 Marks Qs)],
  [*Deadlock Principles & RAG*], [Principles of Deadlock, 4 Coffman Conditions (Mutual Exclusion, Hold & Wait, No Preemption, Circular Wait), Resource Allocation Graphs (RAG).], [High Priority \ (6-8 Marks Qs)],
  [*Deadlock Handling Methods*], [Deadlock Prevention (Condition Invalidation), Deadlock Avoidance (Banker's Safety & Resource-Request Algorithms), Detection & Recovery (Wait-For Graph).], [High Priority \ (10-12 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Principles of Concurrency and Process Synchronization

== Principles of Concurrency and Race Condition
In a concurrent execution environment, multiple processes or threads execute interleaved on a single processor or concurrently across multi-core CPUs. When concurrent processes access and manipulate shared data items simultaneously, the final outcome depends on the precise order of execution, leading to a *Race Condition*.

1. *Definition of Race Condition:* A flaw in a concurrent system where the output is non-deterministic and depends on the uncontrolled relative timing or sequence of thread execution.
2. *Printer Spooler Classic Example:*
   - Two processes ($P_1$ and $P_2$) want to print a document. Both read the shared variable `in` (pointing to next free slot `7` in print directory).
   - $P_1$ reads `in = 7`. Before $P_1$ can store its file name at slot `7`, a CPU timer interrupt occurs and context-switches execution to $P_2$.
   - $P_2$ reads `in = 7`, writes its file name at slot `7`, increments `in` to `8`, and exits.
   - When $P_1$ resumes, it overwrites slot `7` with its own file name, erasing $P_2$'s print job forever.

== The Critical Section Problem and Core Requirements
A *Critical Section* is a segment of code in a process that accesses shared resources (shared variables, memory tables, global files) that must not be concurrently accessed by more than one process.

#figure-box(
  "Figure 3.1: Critical Section Execution Structure",
  [
    #rect(
      width: 100%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #align(center)[
          `Entry Section` *(Requests permission to enter Critical Section)* \
          #v(3pt)
          #line(length: 80%, stroke: 1pt + rgb("#9f1239")) \
          #v(3pt)
          *Critical Section* *(Accesses Shared Variables & System Resources)* \
          #v(3pt)
          #line(length: 80%, stroke: 1pt + rgb("#9f1239")) \
          #v(3pt)
          `Exit Section` *(Notifies waiting processes & releases locks)* \
          #v(3pt)
          `Remainder Section` *(Executes non-critical process code)*
        ]
      ]
    )
  ]
)

=== Three Mandatory Requirements for Valid Solutions
To qualify as a valid solution to the Critical Section Problem, an algorithm must satisfy three strict formal criteria expected by SPPU paper evaluators:

1. *Mutual Exclusion:* If process $P_i$ is executing in its critical section, no other process can be executing in their critical section for that shared resource simultaneously.
2. *Progress:* If no process is executing in its critical section and some processes wish to enter, only those processes not executing in their remainder section can participate in deciding which process enters next. This selection cannot be postponed indefinitely.
3. *Bounded Waiting:* There must be a bound or limit on the number of times that other processes are allowed to enter their critical sections after a process has made a request to enter, before that request is granted (prevents *starvation*).

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=205")[Source: Stallings, Ch 5, p. 205-225] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=191")[Source: Silberschatz, Ch 5, p. 191-215]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 2
// ==========================================
= Synchronization Primitives and Hardware Mechanisms

== Hardware-Assisted Synchronization: Atomic Instructions
Software solutions (like Peterson's algorithm) incur high overhead and are difficult to scale on modern out-of-order execution multiprocessors. Modern hardware provides special *Atomic Instructions* executed indivisibly by CPU memory bus locking controllers.

1. *`TestAndSet` Instruction:* Atomically reads a memory location and sets its value to `true` in a single un-interruptible bus cycle.
```c
boolean TestAndSet(boolean *target) {
    boolean rv = *target;
    *target = TRUE;
    return rv;
}
// Mutual Exclusion Usage: while (TestAndSet(&lock)); /* Busy wait */
```

2. *`CompareAndSwap` (CAS) Instruction:* Atomically compares the value at a memory location with an expected value, updating it to a new value only if they match.

== OS Synchronization Support: Semaphores and Mutex Locks

1. *Mutex Lock:* A simplified binary flag (`available`) designed for mutual exclusion. A thread calls `acquire()` before entering the critical section and `release()` upon leaving.
2. *Semaphore:* An integer variable `S` accessed exclusively through two standard atomic operations: `wait()` (historically $P$) and `signal()` (historically $V$).

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.even(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Counting Semaphore]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Binary Semaphore / Mutex]*]
  ),
  [ *Value Range* ], [ Unrestricted integer range ($0$ to $N$). ], [ Strictly constrained to binary values ($0$ or $1$). ],
  [ *Resource Management* ], [ Controls access to finite multi-instance resource pools (e.g., $N$ database connections). ], [ Controls exclusive single-instance access to a critical section. ],
  [ *Initialization* ], [ Initialized to available resource capacity count $N$. ], [ Initialized to $1$ (available) or $0$ (locked). ],
  [ *Ownership Rule* ], [ Any thread can invoke `signal()` to release a slot. ], [ Only the acquiring thread should release the mutex lock. ]
)

=== Implementation of Non-Busy Waiting Semaphores
To eliminate CPU-wasting busy-waiting (spinlocks), OS kernels implement semaphores using a system wait queue:

```c
typedef struct {
    int value;
    struct process *queue; // List of blocked process PCBs
} semaphore;

void wait(semaphore *S) {
    S->value--;
    if (S->value < 0) {
        // Add calling process PCB to S->queue
        block(); // Transition process state to Blocked
    }
}

void signal(semaphore *S) {
    S->value++;
    if (S->value <= 0) {
        // Remove process P from S->queue
        wakeup(P); // Transition process P state to Ready
    }
}
```

== High-Level Language Support: Monitors
A *Monitor* is a high-level language synchronization construct (supported in Java, Concurrent Pascal) that encapsulates private data variables, internal procedure methods, and condition variables within an abstract data type.
- *Implicit Mutual Exclusion:* Only one process can execute inside a monitor procedure at any given instant.
- *Condition Variables:* `condition x, y;` accessed via `x.wait()` (suspends caller process) and `x.signal()` (resumes one suspended process).

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=226")[Source: Stallings, Ch 5, p. 226-250] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=225")[Source: Silberschatz, Ch 5, p. 225-255]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 3
// ==========================================
= Classical Synchronization Problems and IPC

== The Producer-Consumer Problem (Bounded Buffer)
One or more producer processes generate data items placed into a bounded buffer of capacity $N$, while consumer processes remove items concurrently.

1. *Synchronization Semaphores Used:*
   - `mutex` (Binary Semaphore, Init $= 1$): Ensures mutual exclusion for buffer insertion/removal.
   - `empty` (Counting Semaphore, Init $= N$): Tracks number of empty buffer slots.
   - `full` (Counting Semaphore, Init $= 0$): Tracks number of populated buffer slots.

2. *Algorithmic Implementation:*
```c
// Producer Process Code
do {
    // produce item in next_produced
    wait(&empty); // Decrement empty slots
    wait(&mutex); // Enter critical section
    buffer[in] = next_produced;
    in = (in + 1) % N;
    signal(&mutex); // Exit critical section
    signal(&full);  // Increment full slots
} while (TRUE);

// Consumer Process Code
do {
    wait(&full);  // Decrement full slots
    wait(&mutex); // Enter critical section
    next_consumed = buffer[out];
    out = (out + 1) % N;
    signal(&mutex); // Exit critical section
    signal(&empty); // Increment empty slots
    // consume item in next_consumed
} while (TRUE);
```

== The Readers-Writers Problem
A shared database is accessed by multiple concurrent processes. *Readers* only read data, while *Writers* modify data.
- Multiple readers can read simultaneously without conflict.
- Writers require exclusive access (no readers or other writers permitted).
- *Solution Primitives:* Binary semaphores `rw_mutex` (Init $= 1$), `mutex` (Init $= 1$), and integer `read_count` (Init $= 0$).

== The Dining Philosophers Problem
Five philosophers sit around a circular table with five chopsticks. Each philosopher requires two adjacent chopsticks (left and right) to eat.
- Illustrates allocation of multiple resources among competing processes without causing deadlock or starvation.
- *Deadlock Pitfall:* If all 5 philosophers grab their left chopstick simultaneously, all wait forever for their right chopstick (Circular Wait).

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Andrew-S.-Tanenbaum-Modern-Operating-Systems.pdf#page=120")[Source: Tanenbaum, Ch 2, p. 120-145] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=257")[Source: Silberschatz, Ch 6, p. 257-275]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 4
// ==========================================
= Deadlock Principles and Resource Allocation Graphs

== Principles of Deadlock and 4 Coffman Conditions
A *Deadlock* is a set of blocked processes, each holding a physical/logical resource and waiting to acquire a resource held by another process in the set.

=== The Four Necessary and Sufficient Coffman Conditions
Deadlock can arise if and only if all four *Coffman conditions* hold simultaneously in a system:

1. *Mutual Exclusion:* At least one resource must be held in a non-shareable mode (only one process can use the resource at a time).
2. *Hold and Wait:* A process must be currently holding at least one resource while waiting to acquire additional resources held by other processes.
3. *No Preemption:* Resources cannot be forcibly preempted from a process; they can only be released voluntarily after the process completes its task.
4. *Circular Wait:* A closed chain of processes $\{P_0, P_1, ..., P_n\}$ exists such that $P_0$ waits for a resource held by $P_1$, $P_1$ waits for $P_2$, and $P_n$ waits for a resource held by $P_0$.

== Resource Allocation Graphs (RAG)
A *Resource Allocation Graph (RAG)* is a directed graph $G = (V, E)$ used to model system resource allocations.
- *Vertices ($V$):* Partitioned into Process nodes $P = \{P_1, P_2, ..., P_n\}$ (represented as Circles) and Resource type nodes $R = \{R_1, R_2, ..., R_m\}$ (represented as Rectangles containing instance dots).
- *Edges ($E$):*
  - *Request Edge ($P_i \to R_j$):* Directed edge from process to resource node.
  - *Assignment Edge ($R_j \to P_i$):* Directed edge from specific resource instance dot to process node.

#figure-box(
  "Figure 3.2: Single-Instance RAG with Cycle (Deadlock) vs Multi-Instance RAG",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 10pt,
      rect(
        width: 100%, stroke: 0.5pt + rgb("#be123c"), fill: rgb("#ffffff"), inset: 6pt, radius: 3pt,
        [
          #align(center)[
            *Single-Instance RAG (1 dot/resource)* \
            #v(2pt)
            `P1` $->$ `R1` $->$ `P2` $->$ `R2` $->$ `P1` \
            #v(2pt)
            #text(size: 8pt, weight: "bold", fill: rgb("#9f1239"))[Cycle Present $==>$ System Deadlocked!]
          ]
        ]
      ),
      rect(
        width: 100%, stroke: 0.5pt + rgb("#be123c"), fill: rgb("#ffffff"), inset: 6pt, radius: 3pt,
        [
          #align(center)[
            *Multi-Instance RAG ($N$ dots/resource)* \
            #v(2pt)
            `P1` $->$ `R1` $->$ `P2` $->$ `R2` $->$ `P1` \
            #v(2pt)
            #text(size: 8pt, style: "italic")[Cycle Present $==>$ Deadlock NOT Guaranteed (Depends on free instances)]
          ]
        ]
      )
    )
  ]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=265")[Source: Stallings, Ch 6, p. 265-285] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=315")[Source: Silberschatz, Ch 7, p. 315-335]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 5
// ==========================================
= Deadlock Handling Strategies

== Overview of Deadlock Strategies
Modern operating systems employ four major strategies to handle deadlocks:

#table(
  columns: (1fr, 1.2fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Strategy]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Core Mechanism]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Advantages]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Disadvantages]*]
  ),
  [ *Ignorance* \ (Ostrich) ], [ Ignore problem completely. Assume deadlocks occur rarely (Used in Linux, Windows). ], [ Zero runtime monitoring overhead. ], [ System hangs if deadlock occurs; requires manual reboot. ],
  [ *Prevention* ], [ Restrict resource requests by invalidating at least 1 Coffman condition. ], [ Prevents deadlocks structurally. ], [ Low resource utilization and throughput. ],
  [ *Avoidance* ], [ Dynamic tracking of max resource claims via Banker's Algorithm. ], [ High resource utilization. ], [ Requires priori knowledge of max process resource demands. ],
  [ *Detection & Recovery* ], [ Periodically run detection algorithms; recover via termination or preemption. ], [ Flexible resource allocation. ], [ High overhead of detection algorithms and lost work. ]
)

== Deadlock Prevention Techniques
Prevents deadlocks by designing system protocols so that at least one Coffman condition can never hold:

1. *Eliminating Mutual Exclusion:* Read-only files can be shared concurrently. However, non-shareable hardware (prointers, tape drives) fundamentally require mutual exclusion.
2. *Eliminating Hold and Wait:* Require a process to request and receive all required resources before starting execution, or release current resources before requesting new ones (leads to low resource utilization).
3. *Eliminating No Preemption:* If a process holding resources requests another resource that cannot be immediately assigned, all currently held resources are forcibly preempted.
4. *Eliminating Circular Wait:* Impose a strict total ordering of all resource types $F: R \to NN$. Processes must request resources strictly in increasing numerical order.

== Deadlock Avoidance: Banker's Algorithm
Deadlock avoidance dynamic protocols evaluate resource requests in real-time to guarantee the system remains in a *Safe State*.

#figure-box(
  "Figure 3.3: System State Space Transitions (Safe vs Unsafe State)",
  [
    #rect(
      width: 100%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #align(center)[
          *Safe State* *(Safe Sequence Exists $==>$ NO Deadlock possible)* \
          #v(2pt)
          #line(length: 75%, stroke: 0.75pt + rgb("#9f1239")) \
          #v(2pt)
          *Unsafe State* *(Resource Request Accepted $==>$ MAY lead to Deadlock)* $->$ *Deadlock State*
        ]
      ]
    )
  ]
)

=== Banker's Algorithm Vectors and Matrices
For $n$ processes and $m$ resource types:
- `Available[m]`: Available instances of each resource type.
- `Max[n][m]`: Maximum resource demand of process $P_i$.
- `Allocation[n][m]`: Currently allocated resource instances to process $P_i$.
- `Need[n][m]`: Remaining resource demand of process $P_i$ (`Need[i][j] = Max[i][j] - Allocation[i][j]`).

=== 1. Safety Algorithm
1. Let `Work = Available` (vector of length $m$) and `Finish[i] = FALSE` for $i = 0, 1, ..., n-1$.
2. Find an index $i$ such that:
   `Finish[i] == FALSE` AND `Need[i] <= Work`
3. If no such $i$ exists, go to step 4.
   Otherwise:
   `Work = Work + Allocation[i]`
   `Finish[i] = TRUE`
   Go to step 2.
4. If `Finish[i] == TRUE` for all $i$, then the system is in a *Safe State* (the order of processes forms a *Safe Sequence*).

=== 2. Resource-Request Algorithm
When a request vector `Request[i]` is made by process $P_i$:
1. If `Request[i] <= Need[i]`, go to step 2. Else error (exceeded max claim).
2. If `Request[i] <= Available`, go to step 3. Else $P_i$ must wait (insufficient resources).
3. Pretend to allocate resources to $P_i$:
   `Available = Available - Request[i]`
   `Allocation[i] = Allocation[i] + Request[i]`
   `Need[i] = Need[i] - Request[i]`
4. Run *Safety Algorithm*. If Safe $->$' Grant request. Else $->$' Rollback allocation and force $P_i$ to wait.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=286")[Source: Stallings, Ch 6, p. 286-310] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=336")[Source: Silberschatz, Ch 7, p. 336-360]

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Unit 3 Theory Notes — SPPU TE IT 2024 Pattern
  ]
]
