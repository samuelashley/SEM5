// Typst Playlist Mapping - Operating Systems
// Course Code: PCC-301-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[OPERATING SYSTEM — PLAYLIST MAPPING]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Gate Smashers Exam Guide]]
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

#set heading(numbering: none)

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

// Title Header Page 1
#align(left)[
  #text(size: 9pt, fill: rgb("#9f1239"), weight: "bold")[SPPU OPERATING SYSTEM EXAM-FOCUSED PLAYLIST MAPPING]   #v(2pt)
  #text(size: 16pt, fill: rgb("#0f172a"), weight: "bold")[Gate Smashers OS Playlist Exam Mapping Guide]
]

#v(4pt)
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
      [#text(weight: "bold", fill: rgb("#0f172a"))[Document Type:] Exam Playlist Mapping],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Code:] PCC-301-ITT]
    )
  ]
)

#v(4pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)

=== Introduction and Purpose
This document provides an exam-focused, structured mapping of the Gate Smashers Operating System (OS) YouTube playlist to the official SPPU TE IT (2024 Pattern) Operating System Syllabus. It classifies all 92 videos from the playlist into the five core syllabus units.

#rect(
  width: 100%,
  stroke: (left: 4pt + rgb("#9f1239")),
  fill: rgb("#fff1f2"),
  inset: 8pt,
  radius: (right: 4pt),
  [
    *Exam Preparation Note:* Lectures highlighted in *bold* represent sure-shot exam topics that are explicitly tested in SPPU end-semester exams and fully covered in the unit-wise theory notes (such as System Calls, CPU Scheduling, Semaphores, Banker's Algorithm, Paging, TLB, and Disk Scheduling). Focus on these lectures first for maximum marks!
  ]
)

#v(4pt)
=== Quick Statistics:
- *Total Playlist Videos Extracted:* 92 (Total Duration: 20h 18m)
- *Unit 1 (Overview of OS):* 12 Videos (2h 6m)
- *Unit 2 (Process Description & Control):* 11 Videos (1h 51m)
- *Unit 3 (Concurrency Control & Deadlocks):* 21 Videos (6h 37m)
- *Unit 4 (Memory Management & Virtual Memory):* 27 Videos (6h 9m)
- *Unit 5 (I/O & File Management):* 21 Videos (3h 33m)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 1: Overview of Operating System (2h 6m)
_Syllabus Topics Covered: OS Objectives & Functions, Evolution of OS, Developments Leading to Modern OS, Virtual Machines, Dual-Mode Execution, System Calls, Fork(), and BASH Linux commands._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [L-1.1: Introduction to Operating System and its Functions with English Subtitles], [18:59], [#link("https://www.youtube.com/watch?v=WJ-UaAaumNA")[Play ↗]],
  [*L-1.2: Batch Operating System - Types of Operating System*], [7:12], [#link("https://www.youtube.com/watch?v=povNcHSasgs")[Play ↗]],
  [*L-1.3: Multiprogramming and Multitasking Operating System in Hindi with real life examples*], [6:34], [#link("https://www.youtube.com/watch?v=3MqyDWDpZoI")[Play ↗]],
  [*L-1.4: Types of OS(Real Time OS, Distributed, Clustered & Embedded OS)*], [8:15], [#link("https://www.youtube.com/watch?v=YQZbIT9FcUk")[Play ↗]],
  [L-1.5: Process States in Operating System- Schedulers(Long term,Short term,Medium term)], [20:54], [#link("https://www.youtube.com/watch?v=2dJdHMpCLIg")[Play ↗]],
  [L-1.6: Imp Linux Commands(Operating System) - Must Watch for College/University & Competitive exams], [10:58], [#link("https://www.youtube.com/watch?v=-Mq8Mm_NGxI")[Play ↗]],
  [*L-1.7: System Calls in Operating system and its types in Hindi*], [10:07], [#link("https://www.youtube.com/watch?v=tWPa-rZiGM8")[Play ↗]],
  [*L-1.8: Fork System call with Example - Fork() system call questions*], [10:02], [#link("https://www.youtube.com/watch?v=ixq5cpdEO2Q")[Play ↗]],
  [L-1.9: Questions on Fork System Call With Explanation - Operating System], [6:39], [#link("https://www.youtube.com/watch?v=uMMvYLB4cys")[Play ↗]],
  [*L-1.10: User mode and Kernel mode in operating system in hindi*], [6:46], [#link("https://www.youtube.com/watch?v=8duV1LLHHJU")[Play ↗]],
  [*L-1.11: Process Vs Threads in Operating System*], [11:17], [#link("https://www.youtube.com/watch?v=ITc09gOrqZk")[Play ↗]],
  [*L-1.12: User Level Vs Kernel Level Thread in Operating System - All Imp Points*], [8:29], [#link("https://www.youtube.com/watch?v=-NONm-Jq34Y")[Play ↗]]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 2: Process Description and Control (1h 51m)
_Syllabus Topics Covered: Process Concept, 5-state & 7-state models, PCB, ULT vs KLT, POSIX Pthreads, Preemptive vs Non-Preemptive CPU Scheduling (FCFS, SJF, SRTF, Round Robin, Priority, Multilevel Queue, MLFQ)._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [*L-2.1: Process Scheduling Algorithms (Preemption Vs Non-Preemption) - CPU Scheduling in OS*], [10:31], [#link("https://www.youtube.com/watch?v=zFnrUVqtiOY")[Play ↗]],
  [*L-2.2: What is Arrival, Burst, Completion, Turnaround, Waiting and Response time in CPU Scheduling*], [8:59], [#link("https://www.youtube.com/watch?v=n7Owxwfr6Ko")[Play ↗]],
  [*L-2.3: First Come First Serve(FCFS) CPU Scheduling Algorithm with Example*], [10:34], [#link("https://www.youtube.com/watch?v=MZdVAVMgNpA")[Play ↗]],
  [*L-2.4: Shortest Job First(SJF) Scheduling  Algorithm with  Example - Operating System*], [9:14], [#link("https://www.youtube.com/watch?v=VCIVXPoiLpU")[Play ↗]],
  [*L-2.5: Shortest Remaining Time First (SJF With Preemption) Scheduling Algorithm with  Example - OS*], [13:37], [#link("https://www.youtube.com/watch?v=hoN7_VMzw_g")[Play ↗]],
  [L-2.6: Question on Shortest Job First(SJF) with Preemption Scheduling Algorithm], [7:52], [#link("https://www.youtube.com/watch?v=kbfCRoNAPbY")[Play ↗]],
  [*L-2.7: Round Robin(RR) CPU Scheduling Algorithm with  Example*], [16:23], [#link("https://www.youtube.com/watch?v=TxjIlNYRZ5M")[Play ↗]],
  [*L-2.8: Pre-emptive Priority  Scheduling Algorithm with  Example - Operating System*], [10:30], [#link("https://www.youtube.com/watch?v=rsDGfFxSgiY")[Play ↗]],
  [L-2.9: Example of Mix Burst Time(CPU & I/O both) in CPU Scheduling - Tough Question], [14:19], [#link("https://www.youtube.com/watch?v=0T5PlFVA9_k")[Play ↗]],
  [*L-2.10: Multi Level Queue Scheduling - Operating System*], [3:41], [#link("https://www.youtube.com/watch?v=hBPYP0ZEvS8")[Play ↗]],
  [*L-2.11: Multilevel Feedback Queue Scheduling - Operating System*], [5:22], [#link("https://www.youtube.com/watch?v=-94WGbrWveI")[Play ↗]]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 3: Concurrency Control (6h 37m)
_Syllabus Topics Covered: Process Synchronization, Race Condition, Critical Section, Test & Set, Turn Variable, Counting & Binary Semaphores, Producer-Consumer, Readers-Writers, Dining Philosophers, Resource Allocation Graphs, Deadlock Prevention, Banker's Algorithm._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [*L-3.1: Process Synchronization - Process Types - Race Condition - Operating System-1*], [17:02], [#link("https://www.youtube.com/watch?v=3Eaw1SSIqRg")[Play ↗]],
  [L-3.2: Producer Consumer Problem - Process Synchronization Problem in Operating System], [26:36], [#link("https://www.youtube.com/watch?v=iMD1Z3f9ioI")[Play ↗]],
  [L-3.3: Printer-Spooler Problem - Process Synchronization Problem in Operating System], [13:15], [#link("https://www.youtube.com/watch?v=16NMm0jvu2w")[Play ↗]],
  [*L-3.4: Critical Section Problem -  Mutual Exclusion, Progress and Bounded Waiting - Operating System*], [25:36], [#link("https://www.youtube.com/watch?v=qMQsd7Iy5jo")[Play ↗]],
  [L-3.5: LOCK Variable in OS - Process Synchronization], [7:24], [#link("https://www.youtube.com/watch?v=TrV_dOX_YHw")[Play ↗]],
  [L-3.6: Test and Set Instruction in OS - Process Synchronization], [9:09], [#link("https://www.youtube.com/watch?v=9hzoO4hBXFw")[Play ↗]],
  [L-3.7: Turn Variable - Strict Alteration Method - Process Synchronization], [8:21], [#link("https://www.youtube.com/watch?v=kMlJT1BDIMg")[Play ↗]],
  [*L-3.8: Semaphores - Wait, Signal Operation - Counting Semaphore - Example- Operating system*], [24:42], [#link("https://www.youtube.com/watch?v=eoGkJWgxurQ")[Play ↗]],
  [*L-3.9: What is Binary Semaphore - Easiest Explanation - Operating system*], [12:23], [#link("https://www.youtube.com/watch?v=l5-3mbBV1BQ")[Play ↗]],
  [*L-3.10: Practice Question on Binary Semaphore in Operating System*], [16:00], [#link("https://www.youtube.com/watch?v=Tav67viXmpA")[Play ↗]],
  [*L-3.11: Solution of Producer Consumer Problem using Semaphore - Operating System*], [17:30], [#link("https://www.youtube.com/watch?v=hh9g5kKl_aE")[Play ↗]],
  [*L-3.12: Solution of Readers-writers  Problem using Binary semaphore*], [21:11], [#link("https://www.youtube.com/watch?v=Zdzp5k3eSYg")[Play ↗]],
  [*L-3.13: Dining philosophers Problem and Solution using Semaphore in Operating System*], [35:13], [#link("https://www.youtube.com/watch?v=HHoB2t_B6MI")[Play ↗]],
  [*L-4.1: DEADLOCK concept - Example - Necessary condition - Operating System*], [12:21], [#link("https://www.youtube.com/watch?v=rWFH6PLOIEI")[Play ↗]],
  [L-4.2: Resource Allocation Graph in Deadlock - Single Instance with example - Operating System], [26:18], [#link("https://www.youtube.com/watch?v=BW74JYB3QOM")[Play ↗]],
  [L-4.3: Multi-Instance Resource Allocation Graph with Example - Operating System], [21:42], [#link("https://www.youtube.com/watch?v=hJhB2ddOQtg")[Play ↗]],
  [*L-4.4: Deadlock Handling Methods and Deadlock Prevention - Operating System*], [24:49], [#link("https://www.youtube.com/watch?v=pPM9Ajqmy_4")[Play ↗]],
  [*L-4.5: Deadlock Avoidance Banker's Algorithm with Example -With English Subtitles*], [24:04], [#link("https://www.youtube.com/watch?v=7gMLNiEz3nw")[Play ↗]],
  [L-4.6: GATE 2018 Question on Banker's Algorithm - Deadlock avoidance - Operating System], [16:02], [#link("https://www.youtube.com/watch?v=k8BHyy6gBls")[Play ↗]],
  [L-4.7: Question Explaination on Deadlock - Operating System], [15:46], [#link("https://www.youtube.com/watch?v=mGBjd2WoODs")[Play ↗]],
  [L-4.8: GATE 2018 Question Explaination on deadlock - Operating system], [22:15], [#link("https://www.youtube.com/watch?v=6uEf_F1S-Jo")[Play ↗]]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 4: Memory Management (6h 9m)
_Syllabus Topics Covered: Contiguous & Non-contiguous allocation, Fixed/Variable partitioning, First/Best/Worst fit, Paging, Page tables, 2-Level & Inverted Paging, Segmentation, Virtual Memory, Demand Paging, TLB, Page replacement (FIFO, Optimal, LRU, MRU), Belady's Anomaly, Thrashing._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [L-5.1: Memory Management and Degree of Multiprogramming - Operating System], [23:41], [#link("https://www.youtube.com/watch?v=eESIFJz7mJw")[Play ↗]],
  [L-5.2: Memory management  Techniques - Contiguous and non-Contiguous - Operating System], [11:46], [#link("https://www.youtube.com/watch?v=FrTttJLN7Kw")[Play ↗]],
  [*L-5.3: Internal Fragmentation - Fixed  size Partitioning - Memory management - Operating System*], [18:53], [#link("https://www.youtube.com/watch?v=bK-VhQA512c")[Play ↗]],
  [L-5.4: Variable size Partitioning -  Memory management - Operating System], [15:11], [#link("https://www.youtube.com/watch?v=JdPmsrYqRDY")[Play ↗]],
  [*L-5.5: First Fit, Next Fit, Best Fit, Worst fit Memory Allocation - Memory Management - OS*], [16:22], [#link("https://www.youtube.com/watch?v=N3rG_1CEQkQ")[Play ↗]],
  [L-5.6: GATE Question Solved on First Fit,Best Fit and Worst fit Memory Allocation - Operating System], [14:02], [#link("https://www.youtube.com/watch?v=W7wDlABjCQI")[Play ↗]],
  [L-5.7: GATE 2007 Question Solved on First Fit, Best Fit and Worst fit with timeline - OS], [15:41], [#link("https://www.youtube.com/watch?v=XOFTINaUZt8")[Play ↗]],
  [*L-5.8: Need of Paging - Memory Management - Operating System*], [14:20], [#link("https://www.youtube.com/watch?v=I2TbCGNv1xQ")[Play ↗]],
  [*L-5.9: What is Paging - Memory management -  Operating System*], [25:54], [#link("https://www.youtube.com/watch?v=6c-mOFZwP_8")[Play ↗]],
  [L-5.10: Question Explanation on Logical address and Physical address space - Operating System], [15:25], [#link("https://www.youtube.com/watch?v=30P73tWmU0s")[Play ↗]],
  [L-5.11: Question Explanation on Paging - Memory Management - Operating System], [13:52], [#link("https://www.youtube.com/watch?v=L80DakYu4uw")[Play ↗]],
  [*L-5.12: Page Table Entries - Format of Page Table - Operating System*], [10:39], [#link("https://www.youtube.com/watch?v=JyPMJnnkNmQ")[Play ↗]],
  [*L-5.13: 2-Level Paging in Operating System - Multilevel Paging*], [15:45], [#link("https://www.youtube.com/watch?v=PiEq1CoP0ds")[Play ↗]],
  [L-5.14: Inverted paging - Memory Management - Operating System], [10:35], [#link("https://www.youtube.com/watch?v=spApKfUa8BI")[Play ↗]],
  [L-5.15: Paging Questions in Operating System(OS) - Imp Question for all competitive exams], [7:53], [#link("https://www.youtube.com/watch?v=ucNJMcX-duE")[Play ↗]],
  [L-5.16: What is Thrashing - Operating System], [8:34], [#link("https://www.youtube.com/watch?v=IyWaK8pbN6A")[Play ↗]],
  [L-5.17: Segmentation Vs Paging - Segmentation Working - Operating system], [16:30], [#link("https://www.youtube.com/watch?v=dz9Tk6KCMlQ")[Play ↗]],
  [L-5.18: Overlay - Memory Management - Operating system], [11:12], [#link("https://www.youtube.com/watch?v=Quj-Goz4VMA")[Play ↗]],
  [*L-5.19: Virtual Memory - Page fault - Significance of virtual memory - Operating System*], [20:18], [#link("https://www.youtube.com/watch?v=o2_iCzS9-ZQ")[Play ↗]],
  [*L-5.20: Translation Lookaside Buffer(TLB) in Operating System in Hindi*], [12:23], [#link("https://www.youtube.com/watch?v=Z2T2vnyZl0o")[Play ↗]],
  [L-5.21: Numerical on Translation Lookaside Buffer (TLB) - Operating System], [4:31], [#link("https://www.youtube.com/watch?v=Z4vzWxCcDCY")[Play ↗]],
  [*L-5.22: Page Replacement Introduction - FIFO Page Replacement algorithm - Operating System*], [16:07], [#link("https://www.youtube.com/watch?v=8rcUs5RutX0")[Play ↗]],
  [L-5.23: Belady's Anomaly in FIFO page Replacement with example - Operating System], [12:26], [#link("https://www.youtube.com/watch?v=pR1uhp--COc")[Play ↗]],
  [*L-5.24: Optimal Page Replacement algorithm - Operating System*], [13:07], [#link("https://www.youtube.com/watch?v=q2BpMvPhhrY")[Play ↗]],
  [*L-5.25: Least Recently Used  Page Replacement Algorithm - Operating System*], [7:57], [#link("https://www.youtube.com/watch?v=dYIoWkCvd6A")[Play ↗]],
  [L-5.26: Most recently used page replacement algorithm - Operating System], [6:42], [#link("https://www.youtube.com/watch?v=H3BU_Do_l-Q")[Play ↗]],
  [TLBs Toughest Question asked in GATE exam - Operating System], [9:53], [#link("https://www.youtube.com/watch?v=10tZ7JBiN0w")[Play ↗]]
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 5: Input/Output and File Management (3h 33m)
_Syllabus Topics Covered: Hard Disk Architecture, Disk Access Time, Disk Scheduling (FCFS, SSTF, SCAN, C-SCAN, LOOK, C-LOOK), File System overview, File attributes & operations, Contiguous, Linked & Indexed file allocation, Unix Inode Structure, Protection & Security._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#9f1239") } else if calc.odd(y) { rgb("#fff1f2") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [Lec-0:Operating System Syllabus Discussion for all College/University & Competitive exams (GATE,NET)], [13:01], [#link("https://www.youtube.com/watch?v=bkSWJJZNgf8")[Play ↗]],
  [L-6.1: Hard Disk Architecture in Operating System in Hindi], [11:35], [#link("https://www.youtube.com/watch?v=sveZw_GG_cs")[Play ↗]],
  [*L-6.2: Disk Access Time with Example - Seek Time, Rotational Time and Transfer Time*], [15:13], [#link("https://www.youtube.com/watch?v=udZi6uiR8bM")[Play ↗]],
  [*L-6.3: Disk Scheduling Algorithm - Operating System*], [6:08], [#link("https://www.youtube.com/watch?v=9uoa_p8q47Y")[Play ↗]],
  [L-6.4: FCFS in Disk scheduling with Example - Operating System], [8:44], [#link("https://www.youtube.com/watch?v=yP89YlEGCqA")[Play ↗]],
  [*L-6.5: SSTF in Disk scheduling with Example - Operating System*], [8:30], [#link("https://www.youtube.com/watch?v=P_dA8VGJjA8")[Play ↗]],
  [*L-6.6: SCAN Algorithm in Disk scheduling with Example - Operating System*], [7:54], [#link("https://www.youtube.com/watch?v=xouo556RGiE")[Play ↗]],
  [L-6.7: LOOK Algorithm in Disk scheduling with Example - Operating System], [4:28], [#link("https://www.youtube.com/watch?v=Q2qcqX_hvR0")[Play ↗]],
  [*L-6.8: C-SCAN Algorithm in Disk scheduling with Example - Operating System*], [5:22], [#link("https://www.youtube.com/watch?v=vLqZ6ZMBkX8")[Play ↗]],
  [*L-6.9: C-LOOK Algorithm in Disk scheduling with Example - Operating System*], [4:59], [#link("https://www.youtube.com/watch?v=gwCgG5ORXW8")[Play ↗]],
  [L-6.10: Important Questions on Operating System - Must Watch - NTA NET June 2021], [9:41], [#link("https://www.youtube.com/watch?v=AF3FoARvtcc")[Play ↗]],
  [L-7.1: File System in Operating System - Windows, Linux, Unix, Android etc.], [9:55], [#link("https://www.youtube.com/watch?v=0LtuQhNFFe0")[Play ↗]],
  [L-7.2: File Attributes & Operations in Operating System], [11:14], [#link("https://www.youtube.com/watch?v=q1wGGZbOr4s")[Play ↗]],
  [*L-7.3: Allocation Methods in operating system in hindi - Contiguous vs NonContiguous*], [5:59], [#link("https://www.youtube.com/watch?v=J6wVO4pvUCw")[Play ↗]],
  [L-7.4: Contiguous Allocation in Operating system - Advantages & Disadvantages], [12:37], [#link("https://www.youtube.com/watch?v=XHx-ms5Ldi4")[Play ↗]],
  [L-7.5: Linked List allocation in file allocation with example - Operating system], [10:55], [#link("https://www.youtube.com/watch?v=irGdM3iIS54")[Play ↗]],
  [L-7.6: Indexed File Allocation in Operating System], [10:43], [#link("https://www.youtube.com/watch?v=S6lLRz7SQUw")[Play ↗]],
  [*L-7.7: Unix Inode Structure with Numerical Example - OS*], [10:26], [#link("https://www.youtube.com/watch?v=BJ13GsC0_os")[Play ↗]],
  [Lec-8: Protection & Security in Operating system - Full OS playlist], [20:54], [#link("https://www.youtube.com/watch?v=DKb7KhfoZmU")[Play ↗]],
  [Top 15 OS Interview Questions - Operating System Interview - Placement Strategy], [15:37], [#link("https://www.youtube.com/watch?v=K1GFwYzCQlw")[Play ↗]],
  [Linker & Loader with example], [9:54], [#link("https://www.youtube.com/watch?v=j7VU5A8ajSA")[Play ↗]]
)

#v(8pt)
#line(length: 100%, stroke: 1.5pt + rgb("#9f1239"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Operating Systems Gate Smashers Playlist Mapping — SPPU TE IT 2024 Pattern
  ]
]
