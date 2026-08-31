// Typst Solutions - Intellectual Property Rights & Cyber Laws (CCE1 Question Bank Model Solutions - Descriptive Master)
// Course Code: OE329COMT / OE-329 | SPPU TE IT 2024 Pattern

#let accent-color = rgb("#b91c1c") // Crimson Red Accent
#let accent-border = rgb("#991b1b") // Deep Crimson Border
#let accent-light = rgb("#fef2f2") // Soft Red background
#let text-color = rgb("#0f172a")   // Deep high-contrast dark text

#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 2.2cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: accent-color, weight: "bold")[IPR & CYBER LAWS — CCE1 SOLUTIONS]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[SPPU Master Model Theory Solutions]]
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
  stroke: (left: 4pt + accent-border),
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
    "GROUP": (border: rgb("#b91c1c"), bg: rgb("#fef2f2")),
    "DEFINITION": (border: rgb("#991b1b"), bg: rgb("#fef2f2"))
  )
  let c = colors.at(type, default: (border: rgb("#b91c1c"), bg: rgb("#fef2f2")))
  
  rect(
    width: 100%,
    stroke: (left: 4pt + c.border),
    fill: c.bg,
    inset: 8pt,
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
    inset: 8pt,
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
  #text(size: 16pt, fill: text-color, weight: "bold")[CCE1 EXAMINATION QUESTION BANK — DESCRIPTIVE MASTER MODEL SOLUTIONS]
]

#v(4pt)
#rect(
  width: 100%,
  stroke: 1pt + accent-border,
  fill: accent-light,
  radius: 4pt,
  inset: 8pt,
  [
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 6pt,
      [#text(weight: "bold", fill: text-color)[Course Pattern:] TE IT - 2024 Pattern (SPPU)],
      [#text(weight: "bold", fill: text-color)[Academic Term:] Semester V (2025-26 / 2026-27)],
      [#text(weight: "bold", fill: text-color)[Document Type:] Master In-Depth Descriptive Solutions (All 20 Questions)],
      [#text(weight: "bold", fill: text-color)[Course Code:] OE329COMT / OE-329]
    )
  ]
)

#v(4pt)
#line(length: 100%, stroke: 1.5pt + accent-border)
#v(4pt)

#alert("IMPORTANT", [
  *SPPU Master Theory Examination Standard:* This authoritative document synthesizes and provides comprehensive, exhaustive model theory solutions for all 20 questions from the official CCE1 Question Bank (Unit 1: 10 Questions, Unit 2: 10 Questions) grouped into *9 Detailed Technical Topics*. Every section contains formal statutory legal definitions under Indian acts (Patents Act 1970, Copyright Act 1957, Trade Marks Act 1999, Designs Act 2000, IT Act 2000), point-wise analytical breakdowns, parameter-based comparative matrices, end-to-end procedural workflows, and complete engineering innovation case studies.
])

#v(6pt)

= Unit 1: Introduction to Intellectual Property Rights (CO302.1)

== Topic 1.1: IPR Meaning, Concept, Statutory Foundations, Taxonomy & Strategic Role in Engineering
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q1:* Explain the meaning, concept, types, and importance of Intellectual Property Rights in engineering and innovation. [BTL2, 5 Marks]
  - *Q3:* Explain the need for Intellectual Property Rights in protecting innovations and engineering designs, with suitable examples from electronics, electrical systems, and software. [BTL2, 5 Marks]
  - *Q5:* Explain the major types of Intellectual Property Rights and distinguish their relevance to engineering innovations with suitable examples. [BTL2, 5 Marks]
  - *Q6:* Explain the role of IPR in encouraging research, innovation, technology transfer, commercialization, and investment in engineering. [BTL2, 5 Marks]
])

*1. Academic & Statutory Concept of Intellectual Property Rights (IPR):*
*Intellectual Property Rights (IPR)* are legal and statutory monopoly rights conferred by a sovereign state upon creators, inventors, and enterprises over the non-physical creations of the human intellect (inventions, technological processes, software code, circuit layouts, artistic designs, distinctive brand symbols, and confidential trade secrets). 

*Key Legal Characteristics of IPR:*
1. *Negative / Exclusionary Right:* An IPR does not automatically grant an unconstrained positive right to use the technology (which may require regulatory clearances), but primarily grants the *exclusive legal power to prohibit, exclude, and prosecute unauthorized commercial exploitation, manufacture, sale, or import by competitors*.
2. *Territorial Nature:* Intellectual property rights granted under national laws (e.g., the Indian Patents Act, 1970) are enforceable strictly within the geographic jurisdiction of the granting nation, requiring multi-national filings for global protection.
3. *Time-Bound Statutory Monopoly:* Rights are granted for a predetermined statutory period (e.g., 20 years for patents, 15 years for industrial designs) in exchange for *full public disclosure* of the technical specification, after which the technology enters the public domain for societal advancement.
4. *Incorporeal / Intangible Property:* IP can be assigned, licensed, mortgaged, transferred, or franchised in the same manner as physical real estate assets.

*2. Comprehensive Parameter-Based Matrix of Major IPR Types in Engineering:*

#table(
  columns: (1.1fr, 1.4fr, 1.4fr, 1.1fr, 1.4fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5.5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[IPR Discipline]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Subject Matter Protected]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Statutory Indian Law]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Statutory Term]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Engineering Example]*]
  ),
  [*Patent*], [Novel, non-obvious, industrially applicable technological inventions, functional mechanisms, and chemical compositions.], [The Patents Act, 1970 (amended 2005)], [20 Years from filing date], [Novel Silicon Carbide (SiC) power inverter topology for EV drivetrains.],
  [*Copyright*], [Original literary expression, computer source code, object binaries, microcode, firmware, system documentation, and UI schematics.], [The Copyright Act, 1957 (amended 2012)], [Lifetime of Author + 60 Years (Corp: 60 Years)], [Linux / Android operating system kernel source code and RTOS microcode.],
  [*Trademark*], [Distinctive words, logos, device marks, slogans, shape of goods, or sound marks identifying commercial origin.], [The Trade Marks Act, 1999], [10 Years (Renewable indefinitely)], [\"Intel Inside\" logo, \"Snapdragon\" processor brand mark, \"NVIDIA\" wordmark.],
  [*Industrial Design*], [Aesthetic, non-functional 2D/3D visual exterior shapes, contours, surface patterns, or styling applied to an article.], [The Designs Act, 2000], [10 Years + 5 Years extension (15 Years Max)], [Aerodynamic visual chassis styling of Tesla Cybertruck or Apple iPad chassis.],
  [*Trade Secret*], [Confidential technical formulas, internal algorithms, manufacturing procedures, and datasets providing competitive edge.], [Common Law of Breach of Confidence / Indian Contract Act, 1872], [Indefinite (as long as kept secret)], [Google Search PageRank weighting heuristics, proprietary catalyst recipes.],
  [*Semiconductor Layout-Design*], [3D topographical configuration of transistors, interconnect layers, and dielectric masks on semiconductor ICs.], [Semiconductor Integrated Circuits Layout-Design Act (SICLDA), 2000], [10 Years from registration/use], [3nm photolithographic mask layout of Apple M3 silicon microprocessor.]
)

*3. Need for IPR Protection Across Engineering Disciplines:*
- *1. Electronics & VLSI Systems:* Developing modern Application-Specific Integrated Circuits (ASICs) and microcontrollers costs hundreds of millions of dollars in foundry tape-outs. Without layout-design rights (SICLDA, 2000) and hardware patents, competitors could deploy acid-etch decapsulation, electron microscopy, and optical scanning to clone physical chip silicon in weeks at a fraction of the cost.
- *2. Electrical Power Systems:* High-voltage grid switchgear, solid-state transformers, and regenerative motor controllers involve intensive physical stress engineering. Utility patents protect functional inverter commutation algorithms and thermal heat-sink geometries against reverse-engineering by low-cost manufacturers.
- *3. Software & Computing Systems:* Software has high fixed R&D costs but near-zero marginal reproduction costs. Copyright law protects literal source code against bitwise piracy, technical software patents protect computer-implemented inventions that deliver a tangible technical effect on hardware, and trade secrets protect sensitive proprietary deep-learning weights.

*4. Multi-Faceted Role of IPR in the Modern Engineering Ecosystem:*
1. *Incentivizing Research & Development (R&D):* R&D is highly capital-intensive and risky. Exclusive patent monopolies provide innovators with a secure window to price products without price-war competition, ensuring complete recovery of CapEx and generating profits for reinvestment.
2. *Enabling Technology Transfer & Global Licensing:* Standard Essential Patents (SEPs) allow inventors to contribute proprietary technologies (e.g., 5G NR, Wi-Fi 6, HEVC video compression) to international standards organizations (IEEE, ITU) under Fair, Reasonable, and Non-Discriminatory (FRAND) licensing terms, earning billions in global royalties.
3. *Attracting Venture Capital & Investment:* Investors require verifiable proof of a "defensible technological moat." A robust patent portfolio protects startup intellectual assets from being swallowed by tech giants and serves as critical balance-sheet valuation collateral.
4. *Promoting Knowledge Dissemination:* Unlike trade secrets, patents require exhaustive public disclosure of the "best mode of operation." Engineers worldwide study published patent specifications to build non-infringing incremental improvements, accelerating global technological progress.

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah Bouchoux, Ch 1, p. 1-30] | #link("file://.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: Dr. M.K. Bhandari, Ch 1, p. 1-28]]]

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== Topic 1.2: International IPR Treaties & Multilateral Frameworks (WIPO, WTO & TRIPS Impact on India)
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q2:* Apply the roles of WIPO and WTO to explain their relevance to IPR protection in engineering design and innovation in India. [BTL3, 5 Marks]
  - *Q8:* Explain the functions of WIPO and its contribution to the international protection of intellectual property. [BTL2, 5 Marks]
  - *Q9:* Apply the provisions of the WTO-TRIPS framework to explain how international IPR standards influence IPR protection in India. [BTL3, 5 Marks]
])

*1. World Intellectual Property Organization (WIPO) Functions & Contributions:*
Established in 1967 (headquartered in Geneva, Switzerland) as a specialized agency of the United Nations, *WIPO* serves as the global forum for intellectual property services, policy, information, and cooperation.

*Core Functions of WIPO:*
1. *Administering International IP Treaties:* WIPO administers 26 multilateral conventions, including the *Paris Convention for the Protection of Industrial Property (1883)* (establishing 12-month priority rights) and the *Berne Convention for the Protection of Literary and Artistic Works (1886)* (establishing automatic copyright without formal registration).
2. *Operating Global Patent & Trademark Filing Systems:*
   - *Patent Cooperation Treaty (PCT):* Enables an Indian innovator to file a single unified international patent application in English at the Indian Patent Office, securing priority across 155+ member countries and deferring expensive foreign national-phase translation and attorney costs for up to 30/31 months.
   - *Madrid System:* Facilitates centralized international trademark registration across 130 countries through a single application.
   - *Hague System:* Centralized filing for international industrial designs.
3. *Alternative Dispute Resolution (WIPO ADR Center):* Provides neutral, expert arbitration and mediation procedures to resolve cross-border technology licensing disputes, patent infringements, and domain name disputes without protracted litigation in multiple foreign national courts.
4. *Development Agenda & Technical Infrastructure:* Delivers global patent databases (PATENTSCOPE) and assists developing nations like India in modernizing patent offices with automated electronic filing and examination workflows.

*2. World Trade Organization (WTO) & The TRIPS Agreement (1995):*
The *Agreement on Trade-Related Aspects of Intellectual Property Rights (TRIPS)* is the most comprehensive multilateral agreement on IP, making IPR enforcement a legally binding condition of global trade under the WTO framework.

*Foundational Pillars of the TRIPS Framework:*
- *1. Principle of National Treatment (Article 3):* Member states must treat nationals of other WTO member countries no less favorably than their own citizens regarding IPR protection and enforcement.
- *2. Most-Favoured-Nation Treatment (MFN - Article 4):* Any advantage, favor, privilege, or immunity granted by a member to the nationals of any other country must be accorded immediately and unconditionally to all other WTO members.
- *3. Universal Minimum Standards of Protection:* Mandates compulsory minimum terms (20 years for patents, 50/70 years for copyrights, 10 years for trademarks), statutory protection for computer programs as literary works, and strict civil and criminal enforcement remedies against commercial-scale counterfeiting and IP piracy.

*3. Direct Influence of TRIPS on Indian IPR Legislation:*
India signed the WTO-TRIPS agreement in 1995, triggering massive legislative overhauls to align domestic laws with international standards:

1. *Transition from Process to Product Patents (Patents Amendment Act, 2005):*
   - Under the original Patents Act of 1970 (Section 5), India granted only *process patents* (not product patents) for pharmaceuticals, chemicals, and food substances. This allowed domestic generic pharma firms to reverse-engineer molecules via alternate chemical pathways.
   - TRIPS compliance forced the repeal of Section 5 in 2005, instituting full *Product Patents* across all fields of technology.
2. *Standardization of 20-Year Patent Term:* Uniformly extended patent duration from the earlier 7/14 years to a standard 20 years from the date of filing for all technological categories.
3. *Statutory Safeguards Against "Patent Evergreening" (Section 3(d)):*
   - To prevent pharmaceutical and chemical monopolies from extending expired patents through trivial molecular tweaks, the Indian Parliament enacted *Section 3(d)*.
   - Under Section 3(d), mere discovery of a new form of a known substance (salts, esters, polymorphs) is non-patentable unless it demonstrates *significantly enhanced therapeutic or technical efficacy* (upheld by Supreme Court in the landmark *Novartis Glivec* case).
4. *Robust Compulsory Licensing Framework (Section 84 & 92):*
   - Preserved under the TRIPS *Doha Declaration on Public Health*, enabling the Indian Controller General to grant compulsory licenses if patented technologies are unavailable to the public at reasonably affordable prices (invoked in *Natco Pharma vs. Bayer* for the kidney cancer drug Nexavar).
5. *Modernization of Copyright and Trademark Laws:* Enactment of the Trade Marks Act, 1999 (protecting service marks, well-known marks, and shape marks) and the Copyright (Amendment) Act, 2012 (securing digital rights management, technological protection measures, and statutory music royalties).

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: Dr. M.K. Bhandari, Ch 2, p. 45-82] | #link("file://.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah Bouchoux, Ch 14, p. 320-345]]]

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== Topic 1.3: Scenario-Based Applied IPR Strategy: Smart Home Automation System
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q4:* Apply appropriate IPR concepts to an engineering innovation and identify suitable forms of protection for its design, technology, or software. [BTL3, 5 Marks]
  - *Q7:* Apply IPR concepts to a newly developed smart home automation system and identify appropriate protection for its hardware, software, design, and brand. [BTL3, 5 Marks]
])

*1. Engineering System Decomposition & Multi-Tiered IP Moat:*
A modern IoT Smart Home Automation System integrates custom physical electronics, embedded microcontrollers, mobile cloud applications, industrial enclosures, and customer branding. Protecting such an innovation requires deploying an *integrated multi-tiered IPR strategy*:

#figure-box("Figure 1.1: Multi-Tiered Engineering Innovation Protection Moat", [
  #image("images/ipr_fig1_1.svg", width: 96%)
])

*2. Detailed Component-Wise Protection & Justification Matrix:*

#table(
  columns: (1.2fr, 1.8fr, 1.3fr, 1.7fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5.5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Subsystem]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Engineering Component Details]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Applicable IPR]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Legal Scope & Strategic Justification]*]
  ),
  [*Hardware & Electronics*], [Zero-voltage switching (ZVS) solid-state relay circuit; ultra-low-power dual-mesh Zigbee/Matter communication antenna.], [*Patents* \ (Patents Act, 1970)], [Protects core technical functionality, novel power-saving circuits, and switching mechanisms against physical hardware cloning by rivals (20 years exclusivity).],
  [*Firmware & Mobile Code*], [C/C++ embedded RTOS firmware running on microcontroller; iOS/Android smartphone application source code; cloud REST APIs.], [*Copyright* \ (Copyright Act, 1957)], [Protects literal source code, compiled binaries, and API architectures against unauthorized copying, decompilation, and commercial software piracy.],
  [*AI Models & Algorithms*], [Proprietary neural network weights for occupant habit learning; local edge anomaly detection heuristics.], [*Trade Secrets* \ (Contract Law)], [Protects core AI hyperparameters and dataset weights indefinitely via strict employee NDAs, avoiding mandatory public disclosure in patent filings.],
  [*Industrial Enclosure*], [Sleek minimalist wall touch-panel chassis; chamfered edges; hidden LED indicator diffusers; flush mounting bracket.], [*Industrial Design* \ (Designs Act, 2000)], [Protects visual external aesthetic shape and styling against counterfeit look-alike switchboards in the consumer market (15 years term).],
  [*Brand & Visual Identity*], [Brand name \"AuraHome\", stylized connected-home logo emblem, and distinct power-on activation chime sound.], [*Trademarks* \ (Trade Marks Act, 1999)], [Secures brand reputation, builds consumer trust, and legally prevents market competitors from selling knockoffs under deceptive names.]
)

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/652-patent-copyright-trademark-an-intellectual-property-desk-reference-(www.tawcer.com).pdf")[Source: Stim, Ch 1 & 10, p. 5-35] | #link("file://.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah Bouchoux, Ch 1, p. 15-40]]]

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== Topic 1.4: Scenario-Based Applied IPR Strategy: Electric Vehicle (EV) Fast-Charging System
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q10:* Apply IPR concepts to an innovative electric vehicle charging system and identify the possible forms of IPR protection for its technology, software, design, and branding. [BTL3, 5 Marks]
])

*1. Engineering System Overview:*
An innovative Electric Vehicle Fast-Charging Station involves ultra-high-power DC fast-charging power electronics (350kW+), liquid-cooled cabling, smart grid load balancing, automated billing software, and public infrastructure kiosks.

*2. Comprehensive Multi-Disciplinary IPR Framework:*

1. *Patents (Indian Patents Act, 1970) — Functional Technical Inventions:*
   - *Active Liquid-Cooled Nozzle & Cable:* Closed-loop dielectric fluid immersion cable that prevents thermal runaway during 500A continuous charging.
   - *Gallium Nitride (GaN) / SiC Bidirectional Inverter:* High-efficiency AC-to-DC conversion circuit achieving $98.5\%$ energy efficiency with sub-harmonic filtering.
   - *Dynamic DC Bus Voltage Modulation System:* Real-time automated power routing that dynamically redistributes power between multiple charging bays based on vehicle battery state of charge (SoC).

2. *Copyright (Indian Copyright Act, 1957) — Software & Control Algorithms:*
   - *Controller Firmware:* Embedded C++ microcode executing the ISO 15118 "Plug & Charge" encrypted TLS vehicle handshake and automated payment authentication.
   - *Cloud Management Backend:* Open Charge Point Protocol (OCPP 2.0.1) server code, driver mobile app UI layout, and automated invoice generation modules.
   - *Technical Documentation & Circuit Schematics:* Installation schematics, user safety manuals, and PCB CAD layout drawings.

3. *Industrial Designs (Designs Act, 2000) — Aesthetic Exterior Styling:*
   - *Kiosk Pillar Enclosure:* Aerodynamic, weather-resistant curved charging pillar geometry with illuminated cable holster docks.
   - *Charging Gun Ergonomics:* Proprietary handle contouring, textured grip surface, and latch button aesthetic geometry.

4. *Trademarks (Trade Marks Act, 1999) — Brand Identity & Source Identification:*
   - *Wordmark:* \"VoltPulse Ultra\" registered across Class 9 (Electrical Apparatus) and Class 37 (Charging Station Services).
   - *Visual Device Mark:* Stylized electric lightning bolt integrated into the letter 'V'.
   - *Sound Mark:* Distinctive high-frequency resonant chime played when the charging plug successfully locks into the vehicle inlet.

5. *Trade Secrets (Contractual Protection) — Confidential Data & Heuristics:*
   - *Dynamic Peak-Shaving Grid Optimization Heuristics:* Proprietary mathematical algorithms that predict local electrical grid tariff spikes and optimize battery storage discharge without exposing internal code to competitors.

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: Dr. M.K. Bhandari, Ch 1 & 4, p. 15-35, 110-130]]]

#v(8pt)
#line(length: 100%, stroke: 1.5pt + accent-border)
#v(8pt)

= Unit 2: Patents, Copyrights, Trademarks & Industrial Designs (CO302.2)

== Topic 2.1: Patent Foundations, Statutory Patentability Criteria, Application Types & Patentee Rights
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q1:* Explain the concept, types, patentability criteria, rights of a patent holder, and the patent registration procedure in the Indian context, with suitable engineering examples. [BTL2, 5 Marks]
  - *Q5:* Explain the concept and types of patents and discuss the major patentability criteria with suitable engineering examples. [BTL2, 5 Marks]
  - *Q6:* Explain the major steps involved in obtaining a patent in India, from filing the application to grant, and state the rights of a patent holder. [BTL2, 5 Marks]
])

*1. Statutory Concept & Definition of a Patent:*
Under *Section 2(1)(m)* of the *Indian Patents Act, 1970*, a *Patent* is an exclusive legal right and monopoly granted by the Government of India to an inventor or assignee for a period of *20 years from the date of filing*, conferring the legal authority to exclude all third parties from making, using, offering for sale, selling, or importing the patented invention in India, in exchange for a complete, enabling public disclosure of the invention in the patent specification.

*2. Types of Patent Applications in India:*
1. *Provisional Application:* Filed when an invention is conceptually complete but undergoing fine-tuning. It secures an immediate *Priority Date* at minimal cost. The applicant has a mandatory statutory deadline of *12 months* to file the Complete Specification (otherwise the application is deemed abandoned).
2. *Complete (Non-Provisional) Application:* Contains full, detailed descriptions, technical working examples, engineering drawings, and precise legal *Claims* defining the exact boundaries of statutory monopoly.
3. *Convention Application (Paris Convention):* Filed in India claiming the priority date of an earlier application filed in a Paris Convention member country (must be filed within 12 months of foreign priority).
4. *PCT National Phase Application:* Filed in India within 31 months from the earliest international priority date established under the Patent Cooperation Treaty.
5. *Patent of Addition (Section 54):* Filed for improvements, modifications, or enhancements on an existing granted parent patent. No separate annual renewal maintenance fees are required; it expires concurrently with the parent patent.
6. *Divisional Application (Section 16):* Carved out from an earlier parent application if the original specification contained more than one distinct, non-unified invention.

*3. The Three Statutory Patentability Criteria (Section 2(1)(j)):*
To qualify for a patent under Indian law, an invention must simultaneously satisfy three cumulative criteria:

#table(
  columns: (1.2fr, 1.8fr, 1.8fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5.5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Statutory Criterion]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Legal Definition & Standard]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Engineering Example]*]
  ),
  [*1. Novelty (Section 2(1)(l))*], [The invention must be genuinely new and must not form part of the prior state of the art anywhere in the world through prior public publication, patenting, or commercial use before the priority date.], [A novel solid-state lithium-metal battery utilizing a dual-polymer electrolyte membrane never previously published or sold anywhere in the world.],
  [*2. Inventive Step / Non-Obviousness (Section 2(1)(ja))*], [The invention must feature a technical advancement as compared to existing knowledge, or have economic significance, or both, making the invention *non-obvious to a Person Having Ordinary Skill in the Art (PHOSITA)*.], [Interleaving high-frequency PWM switching pulses in a 3-phase inverter to cancel third-order harmonics without adding bulky analog LC filters (non-obvious leap).],
  [*3. Industrial Applicability (Section 2(1)(ac))*], [The invention must be capable of being made or used in an industry, producing a repeatable, concrete physical utility (cannot be a purely abstract theoretical conjecture).], [A manufacturing process for mass-producing carbon-nanotube reinforced composite wind turbine blades on an automated assembly line.]
)

*4. Statutory Non-Patentable Inventions (Section 3 Exclusions in India):*
- *Section 3(a):* Inventions that are frivolous or contrary to well-established natural laws (e.g., perpetual motion machines).
- *Section 3(b):* Commercial exploitation contrary to public order, morality, or causing serious prejudice to human, animal, plant life or environment.
- *Section 3(c):* Mere discovery of a scientific principle or abstract formulation.
- *Section 3(d):* Mere discovery of a new form of a known substance which does not result in enhanced efficacy (prevents patent evergreening).
- *Section 3(f):* Mere arrangement or rearrangement of known devices functioning independently.
- *Section 3(k):* *A mathematical or business method or a computer program per se or algorithms* (Software is patentable in India ONLY when tied to hardware to produce a tangible technical effect / industrial outcome).
- *Section 4:* Inventions relating to atomic energy (completely prohibited).

*5. Exclusive Statutory Rights of a Patent Holder (Section 48):*
1. *For Patented Products:* The exclusive right to prevent unauthorized third parties from making, using, offering for sale, selling, or importing that product in India.
2. *For Patented Processes:* The exclusive right to prevent unauthorized parties from using the process, as well as using, offering for sale, selling, or importing the direct product obtained from that process.
3. *Right to Assign & License:* The patentee can sell all rights via assignment or grant exclusive/non-exclusive licenses to third parties in exchange for lump-sum fees and recurring royalties.
4. *Right to Seek Civil Remedies (Section 108):* Can initiate infringement lawsuits in High Courts / Commercial Courts to obtain permanent injunctions, preliminary injunctions, seizure of infringing stock, and either punitive damages or an *account of profits*.

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: Dr. M.K. Bhandari, Ch 4, p. 85-132] | #link("file://.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah Bouchoux, Ch 2, p. 40-75]]]

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== Topic 2.2: End-to-End Patent Registration Procedure in India
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q1:* Explain the patent registration procedure in the Indian context with suitable engineering examples. [BTL2, 5 Marks]
  - *Q6:* Explain the major steps involved in obtaining a patent in India, from filing the application to grant. [BTL2, 5 Marks]
])

*1. End-to-End Indian Patent Granting Workflow:*
The process of obtaining a patent in India is governed by the Controller General of Patents, Designs and Trade Marks (CGPDTM) across four regional Patent Offices (Mumbai, Delhi, Chennai, Kolkata):

#figure-box("Figure 2.1: End-to-End Indian Patent Granting Procedure", [
  #image("images/ipr_fig2_1.svg", width: 96%)
])

*2. Detailed 8-Stage Registration Procedure:*

- *Stage 1: Prior Art Search & Drafting Patent Specification*
  - The inventor conducts a worldwide prior art search across patent databases (PATENTSCOPE, Google Patents, InPASS).
  - Drafts specification using statutory forms: *Form 1* (Application for grant), *Form 2* (Provisional / Complete Specification with technical claims), *Form 3* (Statement of foreign filings), and *Form 5* (Declaration of Inventorship).

- *Stage 2: Filing Application & Priority Date Securing*
  - Application is filed electronically via the InPASS portal. If a provisional specification was filed, the Complete Specification must be submitted strictly within *12 months*.

- *Stage 3: Statutory Publication in the Official Patent Journal (Section 11A)*
  - Applications are kept strictly confidential for *18 months* from the filing/priority date, after which they are published automatically in the weekly Official Patent Journal.
  - *Early Publication:* The applicant can request accelerated publication within 1 month by submitting *Form 9* with the prescribed statutory fee.

- *Stage 4: Pre-Grant Opposition Window (Section 25(1))*
  - After publication and before patent grant, *any person* can submit a pre-grant opposition in writing on statutory grounds (prior anticipation, obviousness, non-patentability under Section 3).

- *Stage 5: Request for Examination (RFE - Section 11B)*
  - Examination is NOT automatic. The applicant or any interested party must file *Form 18* (Request for Examination) within *48 months* from the priority date (or *Form 18A* for Expedited Examination available to Startups, MSMEs, and Female applicants).

- *Stage 6: Technical Examination & First Examination Report (FER)*
  - A technical Patent Examiner scrutinizes the application for novelty, inventive step, and industrial applicability, and issues a *First Examination Report (FER)* detailing formal and technical objections.
  - The applicant is granted a statutory window of *6 months* (extendable by 3 months via Form 4) to submit detailed written rebuttals and amend claims to overcome examiner objections.

- *Stage 7: Controller Hearing & Final Grant of Patent (Section 43)*
  - If objections persist, the Controller schedules a quasi-judicial hearing. If satisfied, the Controller issues an official order granting the patent, publishes the grant in the Journal, and issues the official sealed *Letters Patent Certificate*.

- *Stage 8: Post-Grant Opposition (Section 25(2)) & Maintenance Renewals*
  - Within *12 months* from the date of publication of the grant, any *person interested* (e.g., an industry competitor) can file a post-grant opposition before an Opposition Board.
  - To maintain the patent in force for its full 20-year term, the patentee must pay annual *renewal maintenance fees* starting from the 3rd year.

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: Dr. M.K. Bhandari, Ch 4, p. 105-145]]]

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== Topic 2.3: Comparative Analysis Across All IPR Disciplines (Patents, Copyrights, Trademarks, Designs & GIs)
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q2:* Apply the concepts of copyright, trademark, industrial design, and geographical indication to suitable engineering or industrial examples. Explain the type of protection provided in each case. [BTL3, 5 Marks]
  - *Q10:* Explain industrial design and geographical indication and distinguish them from patents and trademarks with suitable examples. [BTL2, 5 Marks]
])

*1. Deep Conceptual Overview of Distinct IPR Disciplines:*
- *1. Industrial Designs (The Designs Act, 2000):* Protects the visual, ornamental, and non-functional aesthetic appearance (features of shape, configuration, pattern, ornament, or composition of lines/colors) applied to an article of manufacture by an industrial process. It does *not* protect the underlying mechanical working principle or functional utility.
- *2. Geographical Indications (The Geographical Indications of Goods Act, 1999):* An IP right conferred on a community of producers originating from a specific geographic territory where a given quality, reputation, or characteristic of the good is essentially attributable to its geographic origin, climate, or traditional human skills.
- *3. Trademarks (The Trade Marks Act, 1999):* Protects distinctive commercial source indicators (brand names, logos, slogans, packaging shapes) to prevent consumer confusion and protect commercial goodwill.
- *4. Patents (The Patents Act, 1970):* Protects functional, technical inventions solving real-world technological challenges.

*2. Comprehensive 8-Parameter Comparative Matrix Across All Disciplines:*

#table(
  columns: (1fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
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
  [*Primary Protection*], [Aesthetic, non-functional visual exterior shape & styling.], [Regional origin, traditional reputation, and artisanal quality.], [Functional technical invention, mechanism, and process.], [Commercial brand identity, source indicator, and logo.],
  [*Core Objective*], [Enhances visual appeal to attract consumer purchases.], [Prevents unauthorized regional misrepresentation & protects heritage.], [Incentivizes technical R&D and functional engineering.], [Prevents market deception & protects commercial goodwill.],
  [*Functionality Covered?*], [Strictly NO (Purely aesthetic; functional shapes rejected).], [NO (Regional pedigree, agricultural or artisanal skill).], [YES (Core functional technical mechanism and operation).], [NO (Purely commercial brand source differentiation).],
  [*Ownership Model*], [Single Enterprise / Individual Industrial Designer.], [Community / Collective association of regional producers.], [Individual Inventor or Assignee Enterprise.], [Individual, Commercial Enterprise, or Trust.],
  [*Governing Act*], [The Designs Act, 2000], [The GI of Goods Act, 1999], [The Patents Act, 1970], [The Trade Marks Act, 1999],
  [*Statutory Term*], [15 Years Maximum \ (10 Years + 5 Years renewal)], [10 Years \ (Renewable indefinitely)], [20 Years Fixed \ (Non-renewable)], [10 Years \ (Renewable indefinitely)],
  [*Threshold Test*], [Visual Novelty & Originality (Not prior published).], [Territorial link & authentic regional characteristics.], [Novelty, Inventive Step, Industrial Applicability.], [Distinctiveness & Non-descriptiveness.],
  [*Representative Example*], [Sleek contour glass shape of Coca-Cola bottle; Dyson fan loop.], [Darjeeling Tea, Banarasi Silk, Alphonso Mango, Kanchipuram Silk.], [Novel fuel-injection common-rail pump mechanism.], [\"Apple\" logo, \"Coca-Cola\" script, \"Nike Swoosh\" device mark.]
)

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: Dr. M.K. Bhandari, Ch 6 & 7, p. 185-225] | #link("file://.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah Bouchoux, Ch 8 & 9, p. 180-215]]]

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== Topic 2.4: Software & Embedded Systems Copyright Protection & Industrial Trademark Registration
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q3:* Explain the scope of copyright protection for software and embedded systems, and describe trademark registration and protection with suitable industrial branding examples. [BTL2, 5 Marks]
  - *Q8:* Explain copyright protection for software and embedded systems. Illustrate the scope of protection with suitable examples. [BTL2, 5 Marks]
])

*1. Scope of Software Copyright Protection (Indian Copyright Act, 1957 - Section 2(o)):*
Under the Indian Copyright Act, computer software is legally classified and protected as a *Literary Work*.

*Key Legal Dimensions of Software Copyright:*
1. *Subject Matter Protected:*
   - *Source Code:* Human-readable code written in high-level languages (Python, C++, Java, Rust).
   - *Object Code & Binaries:* Machine-executable binary code ($0$s and $1$s) compiled for specific chip architectures.
   - *Embedded Microcode & Firmware:* Low-level firmware flashed into microcontroller ROM, EEPROM, or Flash memory for device booting and hardware control.
   - *Preparatory Material & Documentation:* Software architecture diagrams, flowcharts, data schemas, API documentation, and user manuals.
2. *The Idea-Expression Dichotomy (*Baker v. Selden* Doctrine):*
   - Copyright law strictly protects the *specific written expression of code*, but *never* the underlying mathematical idea, algorithm, business logic, or functional system architecture.
   - *Example:* If an engineer writes a unique C++ implementation of the QuickSort algorithm, copyright protects the literal syntax and variable structures against copy-pasting. However, a competitor is completely free to write their own independent code expressing the same QuickSort algorithm without infringing copyright.
3. *Statutory Fair Dealing Exceptions in Software (Section 52(1)(aa)–(ad)):*
   - Making backup copies for archival purposes by a lawful owner.
   - Decompilation / reverse-engineering strictly necessary to achieve *interoperability* with an independently created computer program.
   - Non-commercial academic research, personal observation, and educational study.
4. *Statutory Duration:* Lifetime of the author + *60 years* (or 60 years from publication if authored by a corporate enterprise).

*2. Trademark Registration & Protection Process in Industrial Branding:*
A *Trademark* under the *Trade Marks Act, 1999* is a visual symbol, word, logo, label, or combination of colors used by an enterprise to distinguish its goods and services from those of competitors.

*Functions of an Industrial Trademark:*
- Identifies the commercial origin and manufacturer of the engineering product.
- Guarantees consistent quality standards to industrial clients and consumers.
- Serves as the prime vehicle for marketing, advertising, and establishing goodwill.

*Five-Stage Trademark Registration Workflow in India:*
1. *Stage 1: Comprehensive Trademark Search:* Conducting thorough phonetic, visual, and semantic similarity searches on the public InPASS/TM database across the relevant 45 NICE Classification classes (e.g., Class 9 for computer hardware/software, Class 42 for IT SaaS services).
2. *Stage 2: Filing Application (Form TM-A):* Filing application with the Trade Marks Registry along with representation of mark and date of user claim.
3. *Stage 3: Examination & Examination Report:* The Examiner reviews the mark under:
   - *Absolute Grounds for Refusal (Section 9):* Rejects marks that are non-distinctive, purely descriptive of goods (e.g., trying to trademark "FAST CHARGER" for chargers), or customary.
   - *Relative Grounds for Refusal (Section 11):* Rejects marks identical or confusingly similar to earlier existing registered trademarks.
4. *Stage 4: Journal Publication & Public Opposition Window:* The mark is advertised in the Trade Marks Journal. Any third party has a statutory window of *4 months* to file a formal opposition.
5. *Stage 5: Registration Certificate:* If no opposition is filed, the Registrar issues the official Registration Certificate and the mark gains the ® symbol. Registration is valid for *10 years* and can be renewed indefinitely every 10 years via *Form TM-R*.

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah Bouchoux, Ch 6 & 7, p. 110-165] | #link("file://.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: Dr. M.K. Bhandari, Ch 3 & 5, p. 55-80, 150-180]]]

#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(4pt)

== Topic 2.5: Applied Patentability & Multi-Moat Case Studies (Solar Irrigation & Smartphone)
#alert("GROUP", [
  *Consolidated Questions Covered:*
  - *Q4:* Apply patentability criteria to a proposed engineering innovation and identify how patents, industrial designs, trademarks, and geographical indications can protect different aspects of the innovation. [BTL3, 5 Marks]
  - *Q7:* Apply patentability criteria to a proposed innovative solar-powered irrigation system and determine whether the invention could qualify for patent protection. [BTL3, 5 Marks]
  - *Q9:* Apply appropriate IPR protection to a smartphone product, considering its technical invention, software, external appearance, and brand name. Justify your choices. [BTL3, 5 Marks]
])

*1. Case Study 1: Patentability Evaluation of an Innovative Solar-Powered Irrigation System:*

- *Proposed Innovation Profile:* An automated agricultural irrigation system comprising solar photovoltaic panels, a variable-frequency brushless DC pump, depth-calibrated capacitive soil moisture/salinity sensors, and an embedded closed-loop microcontroller executing an adaptive Maximum Power Point Tracking (MPPT) algorithm that dynamically matches solar irradiance with soil water uptake kinetics.

- *Rigorous Patentability Evaluation:*
  1. *Novelty Test (Passed):* A worldwide prior art search confirms that while standalone solar pumps and standalone soil moisture sensors exist, the *closed-loop dynamic coupling of real-time soil dielectric impedance with variable-frequency MPPT pump motor commutation* has never been disclosed in prior art.
  2. *Inventive Step / Non-Obviousness Test (Passed):* Integrating soil impedance feedback directly into the MPPT power-switching loop prevents pump cavitation and saves $35\%$ energy compared to conventional threshold switching. This technical advancement is non-obvious to a standard irrigation technician or electrical engineer.
  3. *Industrial Applicability Test (Passed):* The system can be repeatedly manufactured in volume and deployed across diverse farming environments.
  4. *Section 3(k) Statutory Check (Passed):* Although the system relies on an algorithm, the software produces a *tangible technical effect on physical hardware* (modulates motor voltage, controls fluid valves, and prevents solar cell overheating), successfully bypassing the Section 3(k) exclusion.
  - *Final Legal Verdict:* *The innovation fully qualifies for patent protection under Section 2(1)(j) of the Indian Patents Act, 1970.*

*2. Case Study 2: Smartphone Multi-Moat Strategic Protection Blueprint:*

#table(
  columns: (1.1fr, 1.8fr, 1.3fr, 1.8fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 5.5pt,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Smartphone Asset]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Specific Engineering Subsystem]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[IPR Mechanism]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Strategic Justification & Legal Basis]*]
  ),
  [*Technical Inventions*], [Under-display ultrasonic 3D fingerprint scanner; 120W dual-cell charge pump circuit; 5G phased-array beamforming antenna.], [*Patents* \ (Patents Act, 1970)], [Grants exclusive 20-year legal monopoly to prevent rival manufacturers from copying high-tech internal circuits, sensor architectures, and battery management systems.],
  [*Software & Firmware*], [Mobile Operating System kernel code, camera image signal processing (ISP) firmware, default system utility apps, UI visual icons.], [*Copyright* \ (Copyright Act, 1957)], [Provides immediate, automatic worldwide protection against unauthorized source code copying, binary dumping, and pirate distribution of proprietary OS builds.],
  [*External Aesthetics*], [Curved edge display glass radii, rear camera island lens layout geometry, speaker grille micro-hole pattern, button chamfers.], [*Industrial Designs* \ (Designs Act, 2000)], [Prevents competitor brands from manufacturing cosmetic look-alike phone bodies that imitate the iconic physical exterior styling of the flagship device.],
  [*Brand & Visual Signs*], [Brand name \"Galaxy / iPhone\", stylized company logo, product series wordmark, signature boot chime sound mark.], [*Trademarks* \ (Trade Marks Act, 1999)], [Secures brand identity, protects commercial reputation, and legally prevents counterfeit devices from deceiving retail consumers.],
  [*Proprietary Algorithms*], [Low-light computational photography noise-reduction neural weights, predictive battery longevity heuristics.], [*Trade Secrets* \ (Contract Law)], [Protects proprietary AI hyperparameters and training datasets indefinitely without mandatory public specification disclosure.]
)

#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file://.studymaterial/ipr/652-patent-copyright-trademark-an-intellectual-property-desk-reference-(www.tawcer.com).pdf")[Source: Stim, Ch 10, p. 200-230] | #link("file://.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah Bouchoux, Ch 2 & 6, p. 45-70, 115-140]]]
