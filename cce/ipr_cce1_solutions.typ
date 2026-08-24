// Typst Solutions - Intellectual Property Rights & Cyber Laws (CCE1 Question Bank Model Solutions)
// Course Code: OE329COMT / OE-329 | SPPU TE IT 2024 Pattern

#let accent-color = rgb("#b91c1c") // Crimson Red Accent
#let accent-light = rgb("#fef2f2") // Soft Red background
#let text-color = rgb("#0f172a")   // Deep high-contrast dark text

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: accent-color, weight: "bold")[IPR & CYBER LAWS — CCE1 SOLUTIONS]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Grouped & Consolidated Model Answer Key]]
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
      align(left)[#text(size: 8pt, fill: accent-color, weight: "bold")[SPPU TE IT (2024 Pattern)] #text(size: 8pt, fill: rgb("#64748b"))[ | OE329COMT]],
      align(right)[#text(size: 8pt, fill: rgb("#64748b"))[Page #counter(page).display() of #counter(page).final().first()]]
    )
  }
)

#set text(
  font: "Helvetica",
  size: 9.5pt,
  fill: text-color
)

#set par(
  justify: true,
  leading: 0.65em
)

#set heading(numbering: none)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (left: 4pt + accent-color),
  inset: (left: 10pt, y: 7pt),
  fill: accent-light,
  radius: (right: 4pt),
  text(fill: text-color, size: 12.5pt, weight: "bold")[#it.body]
)

#show heading.where(level: 2): it => block(
  width: 100%,
  inset: (y: 5pt),
  text(fill: rgb("#dc2626"), size: 11pt, weight: "bold")[#it.body]
)

#show heading.where(level: 3): it => block(
  width: 100%,
  inset: (y: 3pt),
  text(fill: text-color, size: 9.5pt, weight: "bold", style: "italic")[#it.body]
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

// Custom Alert block - Crimson High Contrast
#let alert(type, content) = {
  let colors = (
    "NOTE": (border: rgb("#b91c1c"), bg: rgb("#fef2f2")),
    "TIP": (border: rgb("#059669"), bg: rgb("#ecfdf5")),
    "IMPORTANT": (border: rgb("#1e293b"), bg: rgb("#f1f5f9")),
    "WARNING": (border: rgb("#b91c1c"), bg: rgb("#fef2f2")),
    "EXAMPLE": (border: rgb("#0284c7"), bg: rgb("#f0f9ff")),
    "GROUP": (border: rgb("#b91c1c"), bg: rgb("#fef2f2"))
  )
  let c = colors.at(type, default: (border: rgb("#b91c1c"), bg: rgb("#fef2f2")))
  
  rect(
    width: 100%,
    stroke: (left: 4pt + c.border),
    fill: c.bg,
    inset: 9pt,
    radius: (right: 4pt),
    [
      #text(weight: "bold", fill: c.border)[#type:] \
      #v(2pt)
      #text(fill: text-color)[#content]
    ]
  )
}

// Figure Block Styling for Standard Diagrams
#let figure-box(title, content) = {
  rect(
    width: 100%,
    stroke: 0.5pt + rgb("#cbd5e1"),
    fill: rgb("#f8fafc"),
    inset: 9pt,
    radius: 4pt,
    [
      #align(center)[
        #content
        #v(4pt)
        #text(size: 8.5pt, weight: "bold", fill: rgb("#475569"))[#title]
      ]
    ]
  )
}

// Title Header Page 1
#align(left)[
  #text(size: 9pt, fill: accent-color, weight: "bold")[IPR AND CYBER LAWS (TE IT - 2024 Pattern)] \
  #v(2pt)
  #text(size: 17pt, fill: text-color, weight: "bold")[CCE1 EXAMINATION QUESTION BANK — MASTER CONSOLIDATED SOLUTIONS]
]

#v(6pt)
#rect(
  width: 100%,
  stroke: 1pt + accent-color,
  fill: accent-light,
  radius: 4pt,
  inset: 9pt,
  [
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 7pt,
      [#text(weight: "bold", fill: text-color)[Course Pattern:] TE IT - 2024 Pattern (SPPU)],
      [#text(weight: "bold", fill: text-color)[Academic Term:] Semester V (2025-26 / 2026-27)],
      [#text(weight: "bold", fill: text-color)[Document Type:] Master Consolidated Solutions (Redundancy Grouped)],
      [#text(weight: "bold", fill: text-color)[Course Code:] OE329COMT / OE-329]
    )
  ]
)

#v(6pt)
#line(length: 100%, stroke: 1.5pt + accent-color)
#v(6pt)

#alert("IMPORTANT", [
  *Consolidated Question Bank Architecture:* This master document groups and unifies all overlapping and redundant questions from the official CCE1 Question Bank (covering all 20 questions across Unit 1 and Unit 2) into *8 Comprehensive Topic Solutions*. All mapped question numbers, BTL levels, and marks weightage are clearly delineated.
])

#v(8pt)

= Unit 1: Introduction to Intellectual Property Rights (CO302.1)

== Topic 1.1: IPR Meaning, Concept, Major Types & Strategic Importance in Engineering
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q1:* Explain meaning, concept, types, and importance of IPR in engineering and innovation. [BTL2, 5 Marks]
  - *Q3:* Explain need for IPR in protecting engineering designs with examples from electronics, electrical, software. [BTL2, 5 Marks]
  - *Q5:* Explain major types of IPR and distinguish relevance to engineering innovations. [BTL2, 5 Marks]
  - *Q6:* Explain role of IPR in encouraging research, innovation, technology transfer, commercialization, investment. [BTL2, 5 Marks]
])

*1. Meaning & Statutory Concept of IPR:*
*Intellectual Property Rights (IPR)* are legal and statutory monopoly rights conferred by a sovereign state upon creators, inventors, and enterprises over creations of human intellect (inventions, software designs, literary/artistic expressions, distinctive signs, and trade secrets). These rights grant exclusive legal control to commercialize the intellectual asset for a predetermined statutory duration while legally prohibiting unauthorized exploitation by competitors.

*2. Comprehensive Parameter-Based Matrix of Major IPR Types:*

#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[IPR Type]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Subject Matter Protected]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Statutory Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Engineering Innovation Example]*]
  ),
  [*Patent*], [Novel, non-obvious technological inventions and functional processes], [20 Years from filing date], [Novel lithium-solid-state battery electrolyte chemistry],
  [*Copyright*], [Original literary expression, source code, firmware, schematics], [Lifetime + 60 Years (Individual) / 60 Years (Corp)], [Operating system kernel source code, embedded C firmware],
  [*Trademark*], [Distinctive signs, brand names, logos, domain marks], [10 Years (Renewable indefinitely)], [\"NVIDIA\", \"Snapdragon\", \"TensorFlow\" brand marks],
  [*Industrial Design*], [Aesthetic non-functional 2D/3D shapes, patterns, configurations], [10 Years + 5 Years extension (15 Years Max)], [Ergonomic outer chassis contours of Apple MacBook],
  [*Trade Secret*], [Confidential formulas, manufacturing methods, proprietary datasets], [Indefinite (as long as kept strictly secret)], [Google Search Ranking algorithm, proprietary catalyst formula]
)

*3. Need & Domain-Specific Applications:*
- *Electronics & VLSI:* Semiconductor Integrated Circuits Layout-Design Act (SICLDA), 2000 & Hardware Patents protect ASIC architectures against chip decapsulation cloning.
- *Electrical Systems:* Utility patents protect novel regenerative motor controllers; industrial designs protect transformer enclosures.
- *Software Engineering:* Copyright Act, 1957 protects literal source code; Patents protect technical hardware-interfacing algorithms; Trade Secrets protect deep learning weights.

*4. Role in R&D, Technology Transfer & Commercialization:*
- *Incentivizing R&D:* 20-year exclusivity ensures recovery of massive R&D capital expenditure.
- *Technology Transfer:* Standard Essential Patents (SEPs) enable global technology standards (Wi-Fi, 5G) under FRAND licensing.
- *Venture Capital Attractiveness:* Defensible patent portfolios serve as essential collateral for startup investments.

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah Bouchoux, Ch 1, p. 1-30] | #link("file://.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: Dr. M.K. Bhandari, Ch 1, p. 1-28]]]

#v(6pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(6pt)

== Topic 1.2: International IPR Treaties & Frameworks (WIPO, WTO & TRIPS Impact on India)
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q2:* Apply roles of WIPO and WTO to explain relevance to IPR in engineering design in India. [BTL3, 5 Marks]
  - *Q8:* Explain functions of WIPO and its contribution to international protection of IP. [BTL2, 5 Marks]
  - *Q9:* Apply WTO-TRIPS framework to explain how international standards influence IPR in India. [BTL3, 5 Marks]
])

*1. WIPO (World Intellectual Property Organization) Functions:*
- Specialized UN agency administering 26 international treaties (Paris Convention, Berne Convention, PCT).
- *Patent Cooperation Treaty (PCT):* Allows Indian engineers to file one unified international patent application, securing priority dates across 155+ member nations.
- *WIPO ADR Center:* Neutral international arbitration for cross-border technology licensing disputes.

*2. WTO & TRIPS Agreement Foundations:*
- *National Treatment (Art 3):* Equal treatment for foreign and domestic IP holders.
- *Most-Favoured-Nation (MFN - Art 4):* Privileges granted to one nation must be extended to all WTO members.

*3. Direct Influence on Indian IPR Legislation:*
- *Product Patents:* Patents (Amendment) Act, 2005 introduced full product patents for pharmaceuticals and chemical substances (repealing Section 5).
- *Uniform 20-Year Term:* Standardized all patent terms to 20 years from filing.
- *Section 3(d) Safeguards:* Prevents evergreening of patents by rejecting minor modifications lacking enhanced therapeutic/technical efficacy.

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: Dr. M.K. Bhandari, Ch 2, p. 45-82]]]

#v(6pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(6pt)

== Topic 1.3: Scenario-Based Applied IPR Protection (Smart Home, EV Charging & Innovations)
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q4:* Apply IPR concepts to an engineering innovation and identify forms of protection. [BTL3, 5 Marks]
  - *Q7:* Apply IPR concepts to a newly developed smart home automation system (hardware, software, design, brand). [BTL3, 5 Marks]
  - *Q10:* Apply IPR concepts to an innovative electric vehicle charging system. [BTL3, 5 Marks]
])

*1. Integrated Multi-Layered Protection Framework:*

#figure-box("Figure 1.1: Multi-Tiered Engineering Innovation Protection Moat", [
  #image("images/ipr_fig1_1.svg", width: 96%)
])

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/652-patent-copyright-trademark-an-intellectual-property-desk-reference-(www.tawcer.com).pdf")[Source: Stim, Ch 1 & 10, p. 5-35]]]

#v(12pt)
#line(length: 100%, stroke: 1.5pt + accent-color)
#v(12pt)

= Unit 2: Patents, Copyrights, Trademarks & Industrial Designs (CO302.2)

== Topic 2.1: Patent Foundations, Criteria, Grant Procedure in India & Patentee Rights
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q1:* Explain concept, types, patentability criteria, rights, and Indian registration procedure with examples. [BTL2, 5 Marks]
  - *Q5:* Explain concept and types of patents and major patentability criteria with engineering examples. [BTL2, 5 Marks]
  - *Q6:* Explain major steps in obtaining a patent in India from filing to grant and state patentee rights. [BTL2, 5 Marks]
])

*1. Statutory Concept & Types of Applications:*
A *Patent* is an exclusive 20-year legal monopoly granted under the Indian Patents Act, 1970 for novel, non-obvious, and industrially applicable inventions in exchange for full public disclosure.
- *Types:* Ordinary Application, Convention Application (Paris Convention priority), PCT National Phase Application, Patent of Addition (for improvements).

*2. Three Statutory Patentability Criteria (Section 2(1)(j)):*
1. *Novelty:* Must not be anticipated by prior publication or use anywhere in the world (Prior Art).
2. *Inventive Step (Non-Obviousness):* Technical advance non-obvious to a person skilled in the relevant art.
3. *Industrial Applicability:* Must be capable of industrial manufacture and physical repeatability.

*3. End-to-End Patent Registration Workflow in India:*

#figure-box("Figure 2.1: End-to-End Indian Patent Granting Procedure", [
  #image("images/ipr_fig2_1.svg", width: 96%)
])

*4. Rights of Patent Holder (Section 48):*
- Exclusive right to prevent unauthorized making, using, selling, or importing the patented product/process.
- Statutory right to assign, transfer, or license the patent for royalties.

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: Dr. M.K. Bhandari, Ch 4, p. 85-132]]]

#v(6pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(6pt)

== Topic 2.2: Comparative Analysis of IPR Disciplines (Patents, Copyrights, Trademarks, Designs, GIs)
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q2:* Apply concepts of copyright, trademark, industrial design, GI to engineering examples and protection provided. [BTL3, 5 Marks]
  - *Q10:* Explain industrial design and GI; distinguish them from patents and trademarks with examples. [BTL2, 5 Marks]
])

*Parameter-Based Comparison Across All Major IPR Disciplines:*

#table(
  columns: (1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Industrial Design]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Geographical Indication]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Patent]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Trademark]*]
  ),
  [*Primary Protection*], [Aesthetic visual exterior shape & styling], [Regional origin & traditional product quality], [Functional technical invention & process], [Commercial brand identity, logo, and source],
  [*Functionality Covered?*], [Strictly NO (Purely non-functional aesthetics)], [NO (Regional pedigree & reputation)], [YES (Core functional mechanism)], [NO (Brand differentiation only)],
  [*Ownership*], [Single Enterprise / Individual Designer], [Community of producers in designated region], [Inventor / Assignee Enterprise], [Individual, Company, or Trust],
  [*Statutory Term*], [15 Years Maximum (10 + 5)], [10 Years (Renewable indefinitely)], [20 Years Fixed from Filing Date], [10 Years (Renewable indefinitely)],
  [*Representative Example*], [Coca-Cola contour glass bottle shape], [Darjeeling Tea, Banarasi Silk], [Novel fuel-injection pump mechanism], [\"Coca-Cola\" Spencerian script logo]
)

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: Dr. M.K. Bhandari, Ch 6 & 7, p. 185-220]]]

#v(6pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(6pt)

== Topic 2.3: Software & Embedded Systems Copyright Protection & Trademark Registration
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q3:* Scope of copyright for software and embedded systems; describe trademark registration with branding examples. [BTL2, 5 Marks]
  - *Q8:* Explain copyright protection for software and embedded systems; illustrate scope of protection with examples. [BTL2, 5 Marks]
])

*1. Scope of Software Copyright (Indian Copyright Act, 1957 - Section 2(o)):*
- *Protected Scope:* Literal source code, compiled binaries, embedded microcode on microcontrollers, user manual documentation, and UI visual iconography (as artistic works).
- *Idea-Expression Dichotomy:* Algorithms, mathematical logic, and system architectures are NOT protected by copyright; only the literal written code expression is protected against verbatim copying and piracy.
- *Duration:* Lifetime of author + 60 years.

*2. Trademark Registration & Protection (Trade Marks Act, 1999):*
- Distinctive signs, emblems, phrases, or sound marks identifying commercial origin.
- *Procedure:* Trademark search across 45 classes $->$ Form TM-A filing $->$ Examination $->$ Journal publication for 4-month opposition $->$ 10-year renewable registration.
- *Examples:* Intel inside logo, Android green robot logo, Microsoft Windows wordmark.

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah Bouchoux, Ch 6, p. 110-135]]]

#v(6pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(6pt)

== Topic 2.4: Patentability Evaluations for Engineering Innovations (Solar Irrigation & Drone)
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q4:* Apply patentability criteria to an engineering innovation and identify multi-disciplinary protection. [BTL3, 5 Marks]
  - *Q7:* Apply patentability criteria to an innovative solar-powered irrigation system. [BTL3, 5 Marks]
])

*1. Detailed Case Evaluation: Solar-Powered Irrigation System:*
- *Novelty Test:* Closed-loop MPPT pump modulation coupled dynamically with soil salinity/moisture feedback has not been anticipated in prior art. (*Passed*)
- *Inventive Step Test:* Modulating solar charge parameters directly from soil impedance curves represents a non-obvious engineering advancement that saves 40% battery capacity. (*Passed*)
- *Industrial Applicability:* Repeatable manufacturing and deployment across farms worldwide. (*Passed*)
- *Section 3(k) Check:* Produces a tangible technical effect on physical hardware (modulating pump and water valves), overcoming pure software exclusions.
- *Verdict:* *Fully Qualifies for Patent Protection*.

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah Bouchoux, Ch 2, p. 40-62]]]

#v(6pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(6pt)

== Topic 2.5: Comprehensive Multi-Moat IPR Strategy for Smartphone Products
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q9:* Apply appropriate IPR protection to a smartphone product (invention, software, appearance, brand name) with justifications. [BTL3, 5 Marks]
])

*1. Smartphone Multi-Tiered Moat Strategy:*

#table(
  columns: (1.2fr, 1.8fr, 1.4fr, 1.6fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Smartphone Asset]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Specific Component Details]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[IPR Mechanism]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Strategic Justification]*]
  ),
  [*Technical Inventions*], [Under-display optical fingerprint scanner; 120W fast-charging circuit; 5G beamforming antenna], [*Patents* (Patents Act, 1970)], [Prevents rival smartphone manufacturers from copying high-tech internal circuits and physical sensor innovations.],
  [*Software & Firmware*], [Mobile Operating System kernel code, camera image signal processing firmware, default apps], [*Copyright* (Copyright Act, 1957)], [Provides immediate global protection against unauthorized copying, reverse-engineering, and pirated distribution of OS code.],
  [*External Appearance*], [Curved bezel-less glass display curvature, distinct rear camera island layout, button chamfers], [*Industrial Designs* (Designs Act, 2000)], [Prevents competitors from manufacturing visually identical cosmetic look-alike phone shells in the market.],
  [*Brand & Commercials*], [Brand name \"Galaxy / iPhone\", company logo, signature boot chime sound mark], [*Trademarks* (Trade Marks Act, 1999)], [Secures brand identity, consumer goodwill, and prevents counterfeit devices from deceiving buyers.]
)

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/652-patent-copyright-trademark-an-intellectual-property-desk-reference-(www.tawcer.com).pdf")[Source: Stim, Ch 10, p. 200-225]]]
