// Typst Playlist Mapping - Cloud Computing
// Course Code: PEC-321A-IT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[CLOUD COMPUTING — PLAYLIST MAPPING]],
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
      align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[SPPU TE IT (2024 Pattern)] #text(size: 8pt, fill: rgb("#64748b"))[ | PEC-321A-IT]],
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

// Styling headings - Royal Blue & Navy Scheme
#show heading: set text(fill: rgb("#0f172a"))
#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (left: 4pt + rgb("#1d4ed8")),
  inset: (left: 10pt, y: 7pt),
  fill: rgb("#eff6ff"),
  radius: (right: 4pt),
  text(fill: rgb("#0f172a"), size: 12.5pt, weight: "bold")[#it.body]
)

#show heading.where(level: 2): it => block(
  width: 100%,
  inset: (y: 5pt),
  text(fill: rgb("#2563eb"), size: 11pt, weight: "bold")[#it.body]
)

// Title Header Page 1
#align(left)[
  #text(size: 9pt, fill: rgb("#1d4ed8"), weight: "bold")[SPPU CLOUD COMPUTING EXAM-FOCUSED PLAYLIST MAPPING]   #v(2pt)
  #text(size: 16pt, fill: rgb("#0f172a"), weight: "bold")[Gate Smashers Cloud Computing Playlist Exam Mapping Guide]
]

#v(4pt)
#rect(
  width: 100%,
  stroke: 1pt + rgb("#1d4ed8"),
  fill: rgb("#eff6ff"),
  radius: 4pt,
  inset: 9pt,
  [
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 7pt,
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Pattern:] TE IT - 2024 Pattern (SPPU)],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Academic Term:] Semester V (2026)],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Document Type:] Exam Playlist Mapping],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Code:] PEC-321A-IT]
    )
  ]
)

#v(4pt)
#line(length: 100%, stroke: 1.5pt + rgb("#1d4ed8"))
#v(4pt)

=== Introduction and Purpose
This document provides an exam-focused, structured mapping of the Gate Smashers Cloud Computing YouTube playlist to the official SPPU TE IT (2024 Pattern) Cloud Computing Syllabus (PEC-321A-IT). It classifies all 44 videos from the playlist into the core syllabus units.

#rect(
  width: 100%,
  stroke: (left: 4pt + rgb("#1d4ed8")),
  fill: rgb("#eff6ff"),
  inset: 8pt,
  radius: (right: 4pt),
  [
    *Exam Preparation Note:* Lectures highlighted in *bold* represent high-yield exam topics that are explicitly tested in SPPU end-semester exams and fully covered in the unit-wise theory notes (such as IaaS/PaaS/SaaS Service Models, Public/Private/Hybrid Deployment Models, Hypervisors, Docker & Containers, CAP Theorem, AWS/Azure Services, and RBAC Security). Focus on these lectures first for maximum marks!
  ]
)

#v(4pt)
=== Quick Statistics:
- *Total Mapped Playlist Videos:* 44 (Total Duration: 6h 46m)
- *Unit 1 (Fundamentals of Cloud Computing):* 9 Videos (1h 27m)
- *Unit 2 (Virtualization and Containerization):* 9 Videos (1h 16m)
- *Unit 3 (Cloud Platforms and Services):* 8 Videos (1h 26m)
- *Unit 4 (Cloud Security and Risk Management):* 8 Videos (1h 8m)
- *Unit 5 (Modern Cloud Environment and Emerging Technologies):* 6 Videos (52m)
- *General Overview & Career Foundations (General Overview & Career Foundations):* 4 Videos (34m)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)
= Unit 1: Fundamentals of Cloud Computing (1h 27m)
_Syllabus Topics Covered: Introduction to Cloud Computing, Need & Economic Drivers (CapEx vs OpEx), Evolution of Cloud Computing, NIST 5 Essential Characteristics, Core Advantages & Limitations, Cloud Service Models (IaaS, PaaS, SaaS), Cloud Deployment Models (Public, Private, Hybrid, Community Cloud), Cloud Architecture, Cloud Storage & Data Management._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#1d4ed8") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [L-1.1: Lec-2: What is Cloud Computing | Evolution and Applications | Easiest introduction in Hindi], [21:40], [#link("https://www.youtube.com/watch?v=aaL61HouKLs")[Play ↗]],
  [L-1.2: Lec-3 : Cloud Computing vs Others | Real life Example], [8:03], [#link("https://www.youtube.com/watch?v=iros47DmeKY")[Play ↗]],
  [L-1.3: Lec-4: Introduction to Cloud Computing with Real Life Examples | Key Characteristics & Benefits], [8:45], [#link("https://www.youtube.com/watch?v=3X4JfYf06_g")[Play ↗]],
  [L-1.4: Lec-8 : Cloud Architecturewith Real life examples | Cloud Computing Architecture], [7:49], [#link("https://www.youtube.com/watch?v=pGe4VZbSmTw")[Play ↗]],
  [*L-1.5: Lec-9 : Cloud Computing Services Models - Saas, Paas and Iaas explained in Hindi*], [10:11], [#link("https://www.youtube.com/watch?v=lsvpvCU6Oxs")[Play ↗]],
  [*L-1.6: Lec-10 : SaaS, PaaS & IaaS - Cloud Computing Made Simple!*], [8:28], [#link("https://www.youtube.com/watch?v=0OfDnUZ_pJM")[Play ↗]],
  [L-1.7: Lec-11: Various Standards & Frameworks in Cloud Computing], [7:51], [#link("https://www.youtube.com/watch?v=Dh1TiR0wifs")[Play ↗]],
  [*L-1.8: Lec-13 : Storage in Cloud | Microsoft Azure Storage Services with Real life examples*], [9:34], [#link("https://www.youtube.com/watch?v=X__dZujBTF4")[Play ↗]],
  [*L-1.9: Lec - 24 : Cost Models: Understanding CapEx vs. OpEx, consumption-based Pricing*], [5:32], [#link("https://www.youtube.com/watch?v=89qsRB8Kobw")[Play ↗]],
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 2: Virtualization and Containerization (1h 16m)
_Syllabus Topics Covered: Introduction to Virtualization, Benefits and Applications, Types of Virtualization (Full, Para, OS-level, Network, Storage, VDI), Hypervisors (Type-I Bare-Metal vs Type-II Hosted), Virtual Machines & VMware Ecosystem, VM vs Containers, Docker Fundamentals (Engine, Images, Containers), Basic Container Deployment, Introduction to Kubernetes Architecture._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#1d4ed8") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [*L-2.1: Lec -14 : OS Virtualization with Examples | Virtualization Types with Real life example*], [6:49], [#link("https://www.youtube.com/watch?v=MnU-t31MtRY")[Play ↗]],
  [*L-2.2: Lec-15 : Type 1 vs Type 2 Virtualization Explained: A Complete Guide for Cloud Computing Beginners*], [5:25], [#link("https://www.youtube.com/watch?v=AHfoL3C9sQc")[Play ↗]],
  [*L-2.3: Lec-16 : What is Hypervisor | Types of Hypervisor*], [6:28], [#link("https://www.youtube.com/watch?v=73XTW67TOZ0")[Play ↗]],
  [*L-2.4: Lec-17: Introduction to VMware & Hypervisor Ecosystem with Real life Applications | Cloud Computing*], [8:48], [#link("https://www.youtube.com/watch?v=GTftALde2WM")[Play ↗]],
  [*L-2.5: Lec-18 : Virtual Machine vs Containers | Cloud Computing*], [9:52], [#link("https://www.youtube.com/watch?v=1Pmn3tEZTCw")[Play ↗]],
  [*L-2.6: Lec-35 : What is Docker Best Explanation with Real Life Examples*], [9:46], [#link("https://www.youtube.com/watch?v=ftIS44dFS9U")[Play ↗]],
  [*L-2.7: Lec-36 : Best Docker Practice for Beginners | How Containers run in Docker with Implementation*], [10:20], [#link("https://www.youtube.com/watch?v=9AlfKjJZZHM")[Play ↗]],
  [L-2.8: Lec-37 : Image vs Container with Real Life Example & Demo], [6:48], [#link("https://www.youtube.com/watch?v=ruwRxZPvRKo")[Play ↗]],
  [*L-2.9: Lec-38 : What is Kubernetes? Full Architecturewith Real Life Examples*], [12:18], [#link("https://www.youtube.com/watch?v=7ZObcqEq7hU")[Play ↗]],
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 3: Cloud Platforms and Services (1h 26m)
_Syllabus Topics Covered: AWS Cloud Components, Amazon EC2 and S3 Concepts, Microsoft Azure Overview & VNet, Networking in Cloud (CIDR Addressing, Subnetting, Ports), Cloud Infrastructure Provisioning (EC2 Live Demo), Proxy Servers & Nginx Web Server Deployment._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#1d4ed8") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [*L-3.1: Lec-12 : Components of AWS Cloud | Cloud Computing Components*], [13:32], [#link("https://www.youtube.com/watch?v=XXZ_inMtJsk")[Play ↗]],
  [*L-3.2: Lec -19 : Amazon AWS VPC & Microsoft Azure VNet | Cloud Network with Examples*], [4:50], [#link("https://www.youtube.com/watch?v=qDz4cOadD2Y")[Play ↗]],
  [L-3.3: Lec - 20 : What is CIDR Addressing | Classless Inter-Domain Routing with Examples | Most Important], [14:16], [#link("https://www.youtube.com/watch?v=7u0XnqS-5xs")[Play ↗]],
  [L-3.4: Lec -21: Subnet in CIDR addressing with Easiest Example | Subnet in IP Addressing], [15:27], [#link("https://www.youtube.com/watch?v=jNC1DOO6zK8")[Play ↗]],
  [L-3.5: Lec-22 : What are Ports in Networking Why Ports are Used?], [9:34], [#link("https://www.youtube.com/watch?v=cPWn6Sse4Ss")[Play ↗]],
  [*L-3.6: Lec-31 : How to Create Instance on AWS EC2 | Amazon EC2 Explained with Live Demo*], [12:09], [#link("https://www.youtube.com/watch?v=N017WB88LbI")[Play ↗]],
  [L-3.7: Lec-32 : What is Proxy Server & Reverse Proxy? Best Explanation with Real Life Examples], [8:23], [#link("https://www.youtube.com/watch?v=myq6-bz7OpY")[Play ↗]],
  [L-3.8: Lec-33 : What is Nginx? Best Explanation with Real Life Examples], [8:33], [#link("https://www.youtube.com/watch?v=h9oPJ-myTDk")[Play ↗]],
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 4: Cloud Security and Risk Management (1h 8m)
_Syllabus Topics Covered: Service Level Agreements (SLA), Data Privacy & Compliance (DPDP Act 2023), Cloud Migration (7-Step Model & Migration Challenges), OAuth 2.0 Authentication, Cloud Security Threats & Mitigation, Endpoints & API Security, Role-Based Access Control (RBAC vs ABAC)._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#1d4ed8") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [*L-4.1: Lec-23 : SLA: Service Level Agreement in Cloud Computing | Need & Use of SLA*], [5:18], [#link("https://www.youtube.com/watch?v=EYrQNUNtPa4")[Play ↗]],
  [L-4.2: Lec-25 : New Rules in Digital Personal Data Protection Act-2023], [10:17], [#link("https://www.youtube.com/watch?v=1Gh7IsYsNkM")[Play ↗]],
  [*L-4.3: Lec-26 : Seven 7 Step Model of Cloud Migration | Cloud Computing for Beginners*], [11:09], [#link("https://www.youtube.com/watch?v=v34tcdiBIA8")[Play ↗]],
  [*L-4.4: Lec-27 : Challenge in Cloud Migration | Why it happens*], [9:06], [#link("https://www.youtube.com/watch?v=n-J8xUKWsK4")[Play ↗]],
  [L-4.5: Lec-41 : OAuth 2.0 Explained Simply! How Login with Google & Facebook Works?], [6:08], [#link("https://www.youtube.com/watch?v=UGaO0H_1aFQ")[Play ↗]],
  [*L-4.6: Lec-42 : Cloud Security Threats and Mitigation Strategies*], [11:35], [#link("https://www.youtube.com/watch?v=SMMemzKTF7s")[Play ↗]],
  [*L-4.7: Lec-43 : What Are Endpoints? Master API & Cloud Security in Minutes!*], [6:43], [#link("https://www.youtube.com/watch?v=BtOA1lH0t1I")[Play ↗]],
  [*L-4.8: Lec-44 : Introduction to Role-based access control (RBAC) | RBAC vs. ABAC*], [8:05], [#link("https://www.youtube.com/watch?v=nVScsbRJjP8")[Play ↗]],
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= Unit 5: Modern Cloud Environment and Emerging Technologies (52m)
_Syllabus Topics Covered: Future Trends in Cloud, AI as a Service (AIaaS), Multi-Cloud & Hybrid Cloud, Serverless Computing (AWS Lambda vs EC2), Microservices Architecture vs Monolithic, Version Control (Git & GitHub), Software Development to Cloud Deployment Pipeline._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#1d4ed8") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [L-5.1: Lec-5: Future of Cloud Computing | AI as a Service | Artificial Intelligence as a Service], [5:23], [#link("https://www.youtube.com/watch?v=ZpQH79-9vzw")[Play ↗]],
  [L-5.2: Lec-28 : What is Multi Cloud with Examples | Cloud Computing for Beginners], [6:44], [#link("https://www.youtube.com/watch?v=9XBrZQdTcJo")[Play ↗]],
  [*L-5.3: Lec-29 : What is Serverless? | AWS Lambda vs EC2 | Serverless Vs Server Based*], [9:08], [#link("https://www.youtube.com/watch?v=SDt36JcxTW4")[Play ↗]],
  [L-5.4: Lec-30 : What are MicroServices & its Uses | Microservice Architecture vs Monolithic with examples], [10:34], [#link("https://www.youtube.com/watch?v=eJPSNSaIDmY")[Play ↗]],
  [L-5.5: Lec-34 : What is Version Control | Git & GitHub with examples], [9:08], [#link("https://www.youtube.com/watch?v=d50BUkHbB2o")[Play ↗]],
  [*L-5.6: Lec-39 : How Development Deployment is Done | Pre Virtualization Era*], [11:26], [#link("https://www.youtube.com/watch?v=s-7-ug4jaU0")[Play ↗]],
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

= General Overview & Career Foundations (34m)
_Introductory, Syllabus & Career Preparation Lectures: Complete Syllabus Analysis, Cloud Roadmap for Beginners, Career Options, and AWS Certified Cloud Practitioner Guide._

#table(
  columns: (3fr, 0.8fr, 0.8fr),
  fill: (x, y) => if y == 0 { rgb("#1d4ed8") } else if calc.odd(y) { rgb("#eff6ff") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [L-0.1: Lec- 1 : Complete Cloud Computing Syllabus | Cloud Computing for Interviews, College], [10:26], [#link("https://www.youtube.com/watch?v=dmGybCohHsw")[Play ↗]],
  [L-0.2: Lec-6 : Complete Roadmap Cloud Computing for Beginners | How to Master in Cloud Computing], [8:45], [#link("https://www.youtube.com/watch?v=cJ0jQUhI9CI")[Play ↗]],
  [L-0.3: Lec-7: CareerOptions in Cloud Computing | Cloud Computing for Beginners], [7:09], [#link("https://www.youtube.com/watch?v=PJFWZmpPkzg")[Play ↗]],
  [L-0.4: Lec-40 : Cloud Beginner Certification | Certified Cloud Practitioner | Best Way to make Career!], [7:50], [#link("https://www.youtube.com/watch?v=2h3zfTKSjdA")[Play ↗]],
)

#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(8pt)

