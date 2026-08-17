// Typst Theory Notes - Operating Systems (Unit 1)
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — UNIT 1]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Overview of Operating System]]
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

// Custom Alert block - Deep Crimson High Contrast
#let alert(type, content) = {
  let colors = (
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
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[UNIT 1: OVERVIEW OF OPERATING SYSTEM]
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
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 1.

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
  [*OS Objectives & Functions*], [Dual role (User interface vs Resource Manager), 3 core objectives, Dual-mode execution (Kernel/User mode), System calls, Trap instructions.], [High Priority \ (6-8 Marks Qs)],
  [*Evolution of Operating Systems*], [Serial Processing, Simple Batch Systems (Resident Monitor, JCL), Multiprogrammed Batch Systems, Time-Sharing Systems (Time slicing).], [High Priority \ (8-10 Marks Qs)],
  [*Modern OS Developments*], [Microkernel architecture vs Monolithic, Symmetric Multiprocessing (SMP), Multithreading, Distributed Systems, RTOS, Object-Oriented OS design.], [Medium Priority \ (5-6 Marks Qs)],
  [*Virtual Machines & Virtualization*], [Virtualization concepts, Hypervisors (Type 1 Bare-Metal vs Type 2 Hosted), Full Virtualization, Para-virtualization, Containerization, VT-x / AMD-V.], [High Priority \ (8-10 Marks Qs)],
  [*BASH Shell Scripting*], [Shell architecture, Core Linux commands, Permissions (`chmod`/`chown`), Process management, I/O Redirection & Piping, Shell scripting syntax, Control structures, Annotated scripts.], [High Priority \ (8-10 Marks Qs)]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 1
// ==========================================
= Operating System Objectives and Functions

== Definition and Dual Role of an Operating System
An *Operating System (OS)* is an essential layer of system software that manages computer hardware resources, provides common execution services for application programs, and acts as an authoritative intermediary between physical hardware components and system users.

From an architectural perspective, an OS operates in two fundamental capacities:

1. *User / Computer Interface (Hardware Abstraction Layer):*
   - Raw hardware primitives (CPU instruction sets, disk sector addresses, interrupt lines, memory controller registers) are excessively complex for application developers to program directly.
   - The OS abstracts raw physical hardware into high-level, clean conceptual models such as *processes, virtual memory address spaces, files, sockets, and device streams*.
   - System functionality is exposed to applications through standardized software interfaces: *System Calls*, *Command Line Interfaces (CLI)*, and *Graphical User Interfaces (GUI)*.

2. *System Resource Manager:*
   - A computer system comprises finite physical resources: Processor cores (CPU), Main Memory (RAM), Secondary Storage (SSDs/HDDs), and Input/Output (I/O) peripheral devices.
   - The OS manages resource allocation in a controlled, safe, and multiplexed manner across competing applications via two allocation strategies:
     - *Time Multiplexing:* Programs take sequential turns utilizing a shared physical resource over time intervals (e.g., CPU thread scheduling, printer queue management).
     - *Space Multiplexing:* Multiple programs concurrently receive a dedicated portion of a physical resource (e.g., RAM memory partitioning, disk block allocation).

== Three Core Operational Objectives
An Operating System is engineered to satisfy three primary operational objectives:

1. *Convenience:* Hides the low-level physical complexity of computer hardware behind intuitive abstractions. Programmers write high-level applications without managing raw hardware registers or disk head movements.
2. *Efficiency:* Maximizes hardware utilization (CPU processing cycles, RAM throughput, storage bandwidth) while minimizing contention and resource management overhead.
3. *Ability to Evolve (Extensibility):* Facilitates the seamless addition, testing, and introduction of new system functions, device drivers, and hardware support without disrupting existing applications.

== Hardware Protection and Dual-Mode Operation
To prevent errant user applications from crashing the system, corrupting physical RAM, or bypassing security controls, modern processor hardware and operating systems enforce *Dual-Mode Execution*.

#table(
  columns: (1.2fr, 1fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.even(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Mode Bit]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Hardware & Memory Access]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Instruction Privilege Set]*]
  ),
  [ *User Mode* ], [ Mode Bit = 1 ], [ Restricted hardware access. Isolated exclusively within allocated process memory address space. ], [ Unprivileged instructions only. Privileged actions trigger an immediate hardware trap. ],
  [ *Kernel Mode* \ (Supervisor Mode) ], [ Mode Bit = 0 ], [ Complete, unrestricted access to physical RAM, CPU registers, I/O ports, and bus controllers. ], [ Full privileged instruction set (disable interrupts, modify page tables, initiate direct disk I/O). ]
)

=== Step-by-Step Hardware Mode Transition Mechanism
1. *System Call / Software Trap Initiation:* A user application requires a privileged kernel service (e.g., `read()` from disk file). It populates CPU registers with service arguments and executes a software trap instruction (e.g., `syscall` or `int 0x80`).
2. *Hardware Privilege Escalation:* The CPU hardware automatically switches the Mode Bit from `1` to `0`, saves the user Program Counter (PC) and CPU registers onto the kernel stack, and jumps to the address defined in the kernel *Interrupt Vector Table*.
3. *Kernel Routine Execution:* The kernel validates argument registers, verifies caller permissions, executes the requested privileged driver or file routine, and prepares return values.
4. *Privilege De-escalation & Return:* The kernel executes a privileged return-from-trap instruction (e.g., `sysret` or `iret`). The hardware restores the Mode Bit to `1`, restores user CPU registers, and resumes user application execution.

#figure-box(
  "Figure 1.1: Hardware Dual-Mode Transition Sequence during System Call Execution",
  [
    #rect(
      width: 100%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #align(center)[
          *User Space (User Mode: Mode Bit = 1)* \
          `User Process Calls sys_read()` $->$ `Trap Instruction Executed` \
          #v(3pt)
          #line(length: 80%, stroke: 1pt + rgb("#9f1239"))
          #v(3pt)
          *Kernel Space (Kernel Mode: Mode Bit = 0)* \
          `Mode Bit Set to 0` $->$ `Execute Kernel Service Routine` $->$ `Return-From-Trap (Mode Bit = 1)`
        ]
      ]
    )
  ]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=39")[Source: Stallings, Ch 2, p. 39-45] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=3")[Source: Silberschatz, Ch 1, p. 3-25]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 2
// ==========================================
= The Evolution of Operating Systems

Operating systems have evolved through distinct technological generations driven by hardware advancements and the continuous demand for higher processing efficiency.

== 1. Serial Processing (1940s – 1950s)
In early electronic computers (vacuum tubes and mainframes), no Operating System existed. Programmers interacted directly with bare physical hardware.

1. *Direct Console Access:* Users reserved computer processing time in fixed blocks using physical sign-up logs.
2. *Manual Setup Procedures:* Running a program required manually loading the compiler tape, source code punch cards, assembling object code, linking libraries, and mounting output paper tapes.
3. *Core Limitations:*
   - *Scheduling Inefficiency:* Reserved machine time was wasted if a program finished early or aborted immediately due to a syntax error.
   - *Excessive Setup Time:* Machine time was predominantly consumed setting up physical paper tapes and toggle switches rather than executing code.

== 2. Simple Batch Systems (1950s – 1960s)
To eliminate idle setup time, manufacturers introduced the *Resident Monitor* (the earliest OS kernel predecessor).

1. *Batch Processing Workflow:* Operators collected jobs from programmers, batched similar jobs onto magnetic tapes, and submitted the tape to the resident monitor.
2. *Automated Job Sequencing:* The resident monitor remained permanently loaded in lower physical RAM. Upon job completion, it automatically loaded and executed the next job without operator intervention.
3. *Key Technical Controls:*
   - *Job Control Language (JCL):* Special control cards specifying job requirements to the monitor (e.g., `$JOB`, `$FORT`, `$RUN`, `$END`).
   - *Memory Protection:* Hardware base registers prevented running user jobs from overwriting the resident monitor memory space.
   - *Timer Interrupts:* Hardware timers prevented a single job from monopolizing the CPU in an infinite loop.

== 3. Multiprogrammed Batch Systems (1960s – 1970s)
In simple batch systems, the CPU remained severely underutilized ($80\% - 90\%$ idle time) because I/O devices (card readers, tape drives) were orders of magnitude slower than electronic CPU clock speeds.

1. *Multiprogramming Principle:* Multiple jobs are loaded simultaneously into distinct partitions of physical RAM.
2. *Interleaved Execution:* When the active job pauses to wait for an I/O operation to complete, the OS context-switches the CPU to execute another memory-resident job.
3. *Efficiency Gain:* Increases CPU utilization from $15\% - 20\%$ in uniprogramming up to $80\% - 95\%$ in multiprogramming.

== 4. Time-Sharing Systems (1970s – Present)
While multiprogrammed batch systems maximized CPU utilization, they lacked interactive user feedback. *Time-Sharing (Multitasking)* was engineered to provide interactive multi-user access.

1. *Time Slicing / Quantum:* The OS assigns each user process a fixed execution time slice ($10 - 50 "ms"$) via hardware clock interrupts.
2. *Preemptive Context Switching:* When a process's quantum expires, the OS preempts it, saves register state, and switches execution to the next user process in the ready queue.
3. *Interactive Illusion:* Rapid millisecond switching creates the illusion that each user possesses a dedicated computer system.

=== Parameter-Based Comparison of OS Evolutionary Eras

#table(
  columns: (1.1fr, 1.2fr, 1.2fr, 1.3fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Serial Processing]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Simple Batch]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Multiprogrammed]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Time-Sharing]*]
  ),
  [ *Primary Goal* ], [ Direct hardware access. ], [ Minimize setup time. ], [ Maximize CPU utilization. ], [ Minimize response time. ],
  [ *Memory Jobs* ], [ 1 job in RAM. ], [ 1 job + Resident Monitor. ], [ Multiple jobs in RAM. ], [ Multiple interactive jobs. ],
  [ *CPU Switch* ], [ None (Manual). ], [ Sequential on completion. ], [ Non-preemptive on I/O wait. ], [ Preemptive on Time Quantum. ],
  [ *User Interface* ], [ Hardware switches/tapes. ], [ Punch cards & JCL. ], [ Batch job submissions. ], [ Interactive CLI/Terminals. ],
  [ *CPU Efficiency* ], [ Extremely Low ($<5\%$). ], [ Low ($15\%-20\%$). ], [ High ($80\%-95\%$). ], [ Optimized for Response Time. ]
)

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=46")[Source: Stallings, Ch 2, p. 46-58] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Deitel-H.M.-Deitel-P.J.-etc.-Operating-Systems.pdf#page=34")[Source: Deitel, Ch 1, p. 34-48]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 3
// ==========================================
= Developments Leading to Modern Operating Systems

== 1. Monolithic vs. Microkernel Architecture

1. *Monolithic Kernel Architecture:*
   - All OS core services (File Systems, Virtual Memory Manager, CPU Scheduler, Device Drivers, Network Stacks) execute within a single unified address space in *Kernel Mode*.
   - *Advantage:* Maximum execution speed due to direct kernel function calls without IPC overhead.
   - *Disadvantage:* Poor fault isolation—a single bug in a third-party device driver can crash the entire operating system kernel (*Kernel Panic / BSOD*).

2. *Microkernel Architecture:*
   - Strips down kernel mode code to the absolute minimal required mechanisms: *low-level address space management*, *thread scheduling primitives*, and *Inter-Process Communication (IPC)*.
   - Non-essential services (File Systems, Device Drivers, Protocol Stacks) are moved outside kernel mode to execute as isolated *User-Space Servers*.
   - *Advantage:* Exceptional system reliability and security (a driver crash simply restarts the user-space server without bringing down the kernel).
   - *Disadvantage:* Performance overhead due to frequent IPC context switches between user servers and kernel mode.

#figure-box(
  "Figure 1.2: Structural Comparison of Monolithic Kernel vs. Microkernel Address Space",
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 10pt,
      rect(
        width: 100%, stroke: 0.5pt + rgb("#be123c"), fill: rgb("#ffffff"), inset: 6pt, radius: 3pt,
        [
          #align(center)[
            *Monolithic Kernel Architecture* \
            #v(2pt)
            #text(size: 8pt)[User Applications (User Mode)] \
            #line(length: 90%, stroke: 0.5pt + rgb("#9f1239")) \
            #text(size: 8pt)[VMM | Scheduler | IPC | File System | Drivers \ (All inside Kernel Mode Space)]
          ]
        ]
      ),
      rect(
        width: 100%, stroke: 0.5pt + rgb("#be123c"), fill: rgb("#ffffff"), inset: 6pt, radius: 3pt,
        [
          #align(center)[
            *Microkernel Architecture* \
            #v(2pt)
            #text(size: 8pt)[User Apps | File Server | Drivers (User Mode)] \
            #line(length: 90%, stroke: 0.5pt + rgb("#9f1239")) \
            #text(size: 8pt)[Minimal Microkernel: IPC | Scheduling | RAM Maps \ (Only Core Mechanisms in Kernel Mode)]
          ]
        ]
      )
    )
  ]
)

=== Parameter-Based Comparison: Monolithic vs. Microkernel

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.even(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Monolithic Kernel]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Microkernel]*]
  ),
  [ *Kernel Mode Size* ], [ Large (Includes all OS subsystem services). ], [ Minimal (Core IPC, basic memory maps, thread primitives). ],
  [ *Fault Isolation* ], [ Poor (Driver crash brings down entire system). ], [ Excellent (Driver crash is isolated within user space). ],
  [ *Execution Speed* ], [ Faster (Direct function calls in kernel RAM). ], [ Slower (Message-passing IPC & context switch overhead). ],
  [ *Extensibility* ], [ Difficult (Requires kernel compilation/modules). ], [ Easy (Add or modify user-space server processes). ],
  [ *Industry Examples* ], [ Linux, Windows NT, FreeBSD, macOS (Hybrid). ], [ Mach, L4, QNX, MINIX 3. ]
)

== 2. Symmetric Multiprocessing (SMP) and Real-Time Systems

1. *Symmetric Multiprocessing (SMP):*
   - Multiple physical CPU cores share a common physical RAM address space and I/O bus.
   - All processors are equal peers; any CPU core can execute user threads or kernel code concurrently.
   - The OS scheduler enforces multi-core load balancing, mutual exclusion locking, and CPU cache coherence.

2. *Real-Time Operating Systems (RTOS):*
   - Engineered for environment control systems where correctness depends on meeting strict temporal deadlines.
   - *Hard Real-Time:* Missing a deadline results in catastrophic system failure (e.g., automotive airbag, flight control system).
   - *Soft Real-Time:* Missing a deadline degrades service quality but does not cause complete system failure (e.g., video playback).

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/William%20Stallings%20-%20Operating%20Systems%20(1).pdf#page=59")[Source: Stallings, Ch 2, p. 59-75] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Andrew-S.-Tanenbaum-Modern-Operating-Systems.pdf#page=15")[Source: Tanenbaum, Ch 1, p. 15-28]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 4
// ==========================================
= Virtual Machines and Virtualization

== Fundamental Principles of Virtualization
*Virtualization* abstracts physical hardware (CPU, RAM, Disks, NICs) into software representations known as *Virtual Machines (VMs)*.

1. *Host System:* The underlying physical server hardware and host operating system.
2. *Guest System:* The virtualized guest operating system executing inside an isolated VM environment.
3. *Virtual Machine Monitor (VMM) / Hypervisor:* The core virtualization software layer that intercepts privileged guest instructions, manages hardware resource allocation, and enforces VM boundary isolation.

== Hypervisor Classification: Type 1 vs. Type 2

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Type 1 Hypervisor (Bare-Metal)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Type 2 Hypervisor (Hosted)]*]
  ),
  [ *Architecture Level* ], [ Runs directly on bare physical server hardware. No host OS underneath. ], [ Runs as an application layer on top of an existing host operating system. ],
  [ *Overhead & Speed* ], [ Minimal virtualization overhead; near-native hardware speed. ], [ Higher latency due to host OS abstraction and device driver layers. ],
  [ *Resource Management* ], [ Directly schedules hardware CPU cores and physical memory pages. ], [ Relies on host OS process scheduler for physical hardware access. ],
  [ *Target Environment* ], [ Enterprise cloud data centers (AWS, Azure, private clouds). ], [ Desktop development, software testing, cross-platform emulation. ],
  [ *Examples* ], [ VMware ESXi, KVM, Xen, Microsoft Hyper-V. ], [ Oracle VirtualBox, VMware Workstation, Parallels. ]
)

== Virtualization Approaches

1. *Full Virtualization:* The hypervisor provides a complete software emulation of underlying physical hardware. The Guest OS runs *unmodified* using *Binary Translation* for sensitive instructions.
2. *Para-virtualization:* The Guest OS kernel is modified specifically to be aware of the hypervisor. Privileged instructions are replaced with direct API calls to the hypervisor called *Hypercalls*.
3. *OS-Level Virtualization (Containerization):* Isolates user-space instances using kernel features (*namespaces* and *cgroups*) while sharing a single host kernel (e.g., Docker, LXC).

== Hardware-Assisted Virtualization (Intel VT-x / AMD-V)
Modern CPUs provide native hardware virtualization extensions to resolve trap-and-emulate issues on x86 architectures:
- Introduces two CPU execution modes: *VMX Root Operation* (Hypervisor) and *VMX Non-Root Operation* (Guest OS).
- Provides *Extended Page Tables (EPT)* / *Nested Page Tables (NPT)* for hardware-accelerated memory address translation from Guest Physical Memory $->$ Host Physical RAM.

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Abraham%20Silberschatz-Operating%20System%20Concepts%20(9th,2012_12).pdf#page=725")[Source: Silberschatz, Ch 18, p. 725-735] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Andrew-S.-Tanenbaum-Modern-Operating-Systems.pdf#page=63")[Source: Tanenbaum, Ch 1, p. 63-68]

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

// ==========================================
// SECTION 5
// ==========================================
= BASH Shell Scripting

== Shell Architecture and Stream Redirection

1. *Shell Role:* A user-space command interpreter program acting as an interface between CLI users and the OS kernel (Variants: `sh`, `bash`, `zsh`, `ksh`).
2. *Standard File Descriptors:*
   - *stdin (FD 0):* Standard input stream (default: keyboard).
   - *stdout (FD 1):* Standard output stream (default: terminal display).
   - *stderr (FD 2):* Standard error stream (default: terminal display).
3. *Redirection Operators:*
   - `cmd > file.txt`: Redirects `stdout` to `file.txt` (overwrites).
   - `cmd >> file.txt`: Redirects `stdout` to `file.txt` (appends).
   - `cmd 2> err.log`: Redirects `stderr` to `err.log`.
   - `cmd1 | cmd2`: *Pipeline* — Connects `stdout` of `cmd1` directly into `stdin` of `cmd2` via kernel pipe buffer.

== Core Linux Command & Permission Bit Reference

#table(
  columns: (1.1fr, 1.4fr, 1.8fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.even(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Category]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Command Syntax]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Operational Description]*]
  ),
  [ *File & Directory* ], [ `ls -la` \ `mkdir -p dir` \ `rm -rf path` ], [ List all files including hidden with permissions. \ Create directory hierarchy. \ Forcefully remove files/directories recursively. ],
  [ *Permissions* ], [ `chmod 755 script.sh` \ `chmod u+x file` \ `chown user:grp file` ], [ Set octal permissions (`rwxr-xr-x`). \ Grant execute permission to owner. \ Change file owner user and group. ],
  [ *Process Control* ], [ `ps aux` \ `top` \ `kill -9 PID` \ `cmd &` ], [ Display all running processes with CPU/RAM. \ Interactive real-time process manager. \ Send SIGKILL signal to forcefully terminate PID. \ Run command in background asynchronously. ]
)

=== Octal Permission Bit Calculation
Permissions are divided into 3 triads: *Owner (u)*, *Group (g)*, *Others (o)*.
- Read ($r = 4$), Write ($w = 2$), Execute ($x = 1$).
- Example `755`: Owner $= 4+2+1 = 7 ("rwx")$, Group $= 4+0+1 = 5 ("r-x")$, Others $= 4+0+1 = 5 ("r-x")$.

== BASH Script Programming Syntax

```bash
#!/bin/bash
# Shebang line: Specifies execution interpreter

# 1. Variable Assignment & Command Substitution
TARGET_DIR="./backup"
CURRENT_DATE=$(date +%Y%m%d)

# 2. Argument Checking & Positional Parameters
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILE_NAME="$1"

# 3. File Test & Branching Logic
if [ -f "$FILE_NAME" ] && [ -r "$FILE_NAME" ]; then
    mkdir -p "$TARGET_DIR"
    cp "$FILE_NAME" "${TARGET_DIR}/${FILE_NAME}_${CURRENT_DATE}.bak"
    echo "[SUCCESS] File backed up successfully. Exit status: $?"
else
    echo "[ERROR] File does not exist or lacks read permission."
    exit 2
fi
```

#v(4pt)
#link("file:///Users/ashley/Documents/SEM5/os/studymaterial/abs-guide.pdf#page=1")[Source: Mendel Cooper, ABS Guide, p. 1-50] | #link("file:///Users/ashley/Documents/SEM5/os/studymaterial/Deitel-H.M.-Deitel-P.J.-etc.-Operating-Systems.pdf#page=124")[Source: Deitel, Ch 3, p. 124-137]

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Unit 1 Theory Notes — SPPU TE IT 2024 Pattern
  ]
]
