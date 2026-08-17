// Typst Theory Notes - Intellectual Property Rights & Cyber Laws (Unit 1)
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
        align(left)[#text(size: 8pt, fill: accent-color, weight: "bold")[IPR & CYBER LAWS — UNIT 1]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Introduction to Intellectual Property Rights]]
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

#set heading(numbering: "1.1")

// Styling headings matching workspace template
#show heading: set text(fill: text-color)
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

// Custom Alert block - High Contrast
#let alert(type, content) = {
  let colors = (
    NOTE: (border: rgb("#b91c1c"), bg: rgb("#fef2f2")),
    "TIP": (border: rgb("#059669"), bg: rgb("#ecfdf5")),
    "IMPORTANT": (border: rgb("#1e293b"), bg: rgb("#f1f5f9")),
    "WARNING": (border: rgb("#b91c1c"), bg: rgb("#fef2f2")),
    "EXAMPLE": (border: rgb("#0284c7"), bg: rgb("#f0f9ff"))
  )
  let c = colors.at(type, default: (border: rgb("#0f766e"), bg: rgb("#f0fdf4")))
  
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
  #text(size: 17pt, fill: text-color, weight: "bold")[UNIT 1: INTRODUCTION TO INTELLECTUAL PROPERTY RIGHTS (IPR)]
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
      [#text(weight: "bold", fill: text-color)[Academic Term:] Semester V (2026)],
      [#text(weight: "bold", fill: text-color)[Status:] Publication-Grade Theory Guide],
      [#text(weight: "bold", fill: text-color)[Course Code:] OE329COMT / OE-329]
    )
  ]
)

#v(6pt)
#line(length: 100%, stroke: 1.5pt + accent-color)
#v(6pt)

=== Syllabus Mapping & Unit Structure
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 1.

#table(
  columns: (1.5fr, 3fr, 1.2fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 7pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Sub-Topic]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Syllabus Coverage]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Exam Weightage]*]
  ),
  [Meaning & Concept of IPR], [Property definitions, intangible assets, statutory monopoly, justification theories], [High (4–6 Marks)],
  [Need & Importance in Engineering], [Engineering R&D amortization, tech transfer, commercialization, startup innovation], [High (4–6 Marks)],
  [Types of Intellectual Property], [Patents, Copyrights, Trademarks, Designs, GIs, Trade Secrets, IC Layouts, Plant Varieties], [High (6–8 Marks)],
  [International Organizations], [WIPO structure & treaties, WTO TRIPS Agreement 7 pillars & enforcement], [High (4–6 Marks)],
  [Overview of IPR in India], [Legislative framework, CGPDTM administration, Patent Offices, statutory acts], [Medium (4 Marks)],
  [IPR in Engineering Design], [Electronics, embedded systems, software copyright vs patentability, trade secrets], [High (4–6 Marks)],
  [Landmark Case Study], [*Novartis AG v. Union of India*: Sec 3(d), evergreening, therapeutic efficacy], [High (6–8 Marks)]
)

#v(8pt)

= Meaning and Concept of Intellectual Property Rights (IPR)

== Definition of Property and Intellectual Property
In jurisprudence, *property* denotes a bundle of legal rights exercisable over a domain of value. Property is fundamentally classified into two distinct legal realms:
1. *Tangible Property:* Physical assets having material existence, subdivided into *movable property* (e.g., machinery, equipment, hardware) and *immovable property* (e.g., real estate, land, industrial plants). Physical possession grants direct physical custody and exclusion rights.
2. *Intangible Property:* Non-physical rights holding commercial value. *Intellectual Property (IP)* represents intangible property created through human intellect, creative cognition, technical ingenuity, and inventive synthesis.

*Intellectual Property Rights (IPR)* are statutory, legal rights granted by government authorities to creators and inventors over their intellectual creations. These rights grant the titleholder a *negative right*—the exclusive privilege to exclude unauthorized third parties from manufacturing, using, copying, offering for sale, selling, or importing the protected creation without prior license or consent for a specified statutory period.

== Fundamental Jurisprudential Characteristics of IPR
SPPU examination evaluators emphasize six mandatory statutory characteristics defining Intellectual Property Rights:
1. *Intangibility:* Subject matter possesses no physical shape or chemical boundary. Protection applies to the underlying *information, expression, design, or inventive concept* embodied within physical media.
2. *Statutory Creation:* Unlike natural common-law rights, IPRs are strict *statutory creations* enacted through national legislation (e.g., Indian Patents Act, 1970; Copyright Act, 1957). They exist solely within the boundaries defined by applicable legal statutes.
3. *Territoriality:* IPRs are strictly *territorial in scope*. A patent, trademark, or industrial design granted by the Indian Patent Office (IPO) provides legal protection exclusively within the sovereign geographical boundaries of India. Obtaining protection in foreign jurisdictions requires separate filings under applicable international filing systems (e.g., PCT or Madrid System).
4. *Time-Limited Monopoly:* Rights are granted for a fixed statutory duration (e.g., *20 years* for patents, *60 years post-mortem* for copyrights, *10 years renewable* for trademarks). Upon statutory expiry, the invention or creation passes irreversibly into the *public domain* for unrestricted public utilization.
5. *Negative Right of Exclusion:* An IPR title does not automatically grant an unconditioned positive right to commercialize (which remains subject to public health, safety, and environmental regulatory laws). Instead, it grants the legal authority to *prohibit unauthorized commercial exploitation* by third parties.
6. *Assignability and Commercial Licensing:* IP assets can be sold, assigned, licensed, mortgaged, or franchised like physical property, enabling revenue generation through royalties and technology transfer agreements.

== Theoretical & Philosophical Justifications of IPR
Legal scholars justify statutory IP monopolies through four classical economic and philosophical theories:

1. *Utilitarian / Economic Incentive Theory (Jeremy Bentham, John Stuart Mill):*
   - *Premise:* Research and development (R&D) in engineering requires substantial capital investment, specialized labor, and technical risk, while copying an existing technical design requires negligible marginal cost.
   - *Mechanism:* In the absence of statutory protection, market competitors would instantly free-ride on original innovations, destroying the incentive to invest in R&D. Society grants a temporary commercial monopoly to reward inventors, ensuring maximum technological progress and long-term public welfare.

2. *Locke's Labour Theory / Natural Rights Theory (John Locke):*
   - *Premise:* Every human being owns their own body and labor. When an individual mixes their intellectual labor with raw ideas or uncultivated resources, they acquire a natural property right in the resulting creation ("Sweat of the Brow" doctrine).
   - *Application:* Inventors and authors deserve exclusive ownership because their personal mental labor brought the novel solution into physical existence.

3. *Hegel's Personality Theory (Georg Wilhelm Friedrich Hegel):*
   - *Premise:* An author or designer's creative work is an explicit extension and manifestation of their internal personality, intellect, and individual self-expression.
   - *Application:* Protecting moral rights (*droit moral*) ensures that an author's reputation and work cannot be distorted, mutilated, or misattributed without consent.

4. *Social Planning / Public Bargain Theory:*
   - *Premise:* IPR represents a bilateral contract between the sovereign State and the inventor.
   - *Bargain:* The inventor agrees to fully disclose the complete technical specifications and working details of the invention to the public; in return, the State grants a temporary 20-year exclusive commercial monopoly.

#figure-box(
  "Figure 1.1: Conceptual Spectrum and Statutory Properties of Intellectual Property",
  [
    #rect(
      width: 95%,
      stroke: 0.5pt + rgb("#94a3b8"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #grid(
          columns: (1fr, 1fr, 1fr),
          column-gutter: 8pt,
          align: center,
          [
            #block(
              width: 100%, stroke: 1pt + rgb("#0f766e"), fill: rgb("#f0fdf4"), inset: 6pt, radius: 3pt,
              [*Human Intellect & Innovation*\ #text(size: 8pt, fill: rgb("#475569"))[Cognitive Synthesis & R&D]]
            )
          ],
          [
            #block(
              width: 100%, stroke: 1pt + rgb("#0284c7"), fill: rgb("#f0f9ff"), inset: 6pt, radius: 3pt,
              [*Statutory IP Framework*\ #text(size: 8pt, fill: rgb("#475569"))[Negative Right to Exclude]]
            )
          ],
          [
            #block(
              width: 100%, stroke: 1pt + rgb("#7c3aed"), fill: rgb("#f5f3ff"), inset: 6pt, radius: 3pt,
              [*Public Domain Entry*\ #text(size: 8pt, fill: rgb("#475569"))[Statutory Expiry & Open Access]]
            )
          ]
        )
        #v(4pt)
        #text(size: 8pt, fill: rgb("#334155"))[*Core Pillars:* Territoriality | Fixed Duration | Full Disclosure | Assignability & Licensing]
      ]
    )
  ]
)

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 1, pp. 3–16] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah E. Bouchoux, Intellectual Property, Ch 1, pp. 1–12]]]

#v(8pt)

= Need for and Importance of IPR in Engineering and Innovation

== Rationale in Engineering R&D and Technology Development
Engineering innovation in modern industrial domains—such as semiconductor design, artificial intelligence, automotive systems, biomedical devices, and telecommunications—demands massive upfront Capital Expenditure (*CapEx*) and extensive multi-year R&D cycles.

1. *Amortization of High R&D Costs:* 
   Developing a novel microchip layout, custom hardware accelerator, or proprietary software framework requires millions of dollars in engineering salaries, prototyping, testbed validation, and fabrication tools. Statutory IP protection prevents competitors from reverse-engineering or cloning the product in days, allowing the original innovator to recoup R&D investments through premium market pricing.

2. *Transition to Knowledge-Based Economy:*
   Modern global enterprise valuation has shifted dramatically from physical tangible assets (factories, heavy machinery) to *intangible intellectual capital* (patent portfolios, trade secrets, software codebases, registered industrial brands). IP portfolios constitute up to 80% of total market valuation for leading technology firms.

3. *Facilitating Technology Transfer & Industrial Licensing:*
   Robust IP legal frameworks enable engineering institutions and technology startups to license technical blueprints, patented algorithms, and proprietary know-how to global manufacturing partners via *royalty-bearing licensing agreements*, cross-licensing deals, and joint-venture technology transfers.

4. *De-Risking Startup Capital & Entrepreneurship:*
   Venture capital (VC) investors and institutional funding agencies evaluate IP ownership as a critical risk mitigation metric. A strong, defendable patent or trade secret portfolio creates an enterprise *moat*, protecting technology startups from aggressive market displacement by established industry incumbents.

5. *Catalyzing National Innovation Ecosystems & "Make in India":*
   National initiatives like *Make in India* and *Digital India* rely on strong statutory IP enforcement to attract foreign direct investment (FDI), encourage local manufacturing, foster indigenous technical research, and promote high-value engineering exports.

#figure-box(
  "Figure 1.2: Engineering Innovation Lifecycle and IPR Protection Matrix",
  [
    #rect(
      width: 95%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #grid(
          columns: (1.2fr, 1fr, 1.2fr, 1.2fr),
          column-gutter: 6pt,
          align: center,
          [
            #block(width: 100%, fill: rgb("#f1f5f9"), inset: 5pt, radius: 3pt, [*1. Concept & R&D*\ #text(size: 7.5pt)[Trade Secret / Lab Log]])
          ],
          [
            #block(width: 100%, fill: rgb("#e0f2fe"), inset: 5pt, radius: 3pt, [*2. Design Phase*\ #text(size: 7.5pt)[Copyright / IC Layout]])
          ],
          [
            #block(width: 100%, fill: rgb("#dcfce7"), inset: 5pt, radius: 3pt, [*3. Prototype & Filing*\ #text(size: 7.5pt)[Patent / Industrial Design]])
          ],
          [
            #block(width: 100%, fill: rgb("#fae8ff"), inset: 5pt, radius: 3pt, [*4. Market Launch*\ #text(size: 7.5pt)[Trademark / Licensing]])
          ]
        )
      ]
    )
  ]
)

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Intro, pp. 3–12] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/652-patent-copyright-trademark-an-intellectual-property-desk-reference-(www.tawcer.com).pdf")[Source: Richard Stim, IP Desk Reference, Ch 1]]]

#v(8pt)

= Taxonomy and Classification of Intellectual Property

Intellectual Property is broadly divided into *Industrial Property* (Patents, Trademarks, Industrial Designs, GIs, Trade Secrets, IC Layouts, Plant Varieties) and *Copyright & Related Rights*. The following detailed breakdown and parameter comparison table cover all eight core forms recognized under Indian and global IP frameworks.

== Comprehensive Parameter-Based Comparison Table
The table below details the statutory parameters for all eight forms of Intellectual Property as required in SPPU examinations.

#table(
  columns: (1fr, 1.3fr, 1.2fr, 1.1fr, 1.4fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[IP Category]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Protected Subject Matter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Key Criteria]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Statutory Term]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Engineering / Industrial Example]*]
  ),
  [*Patent*], [Inventions, novel products, industrial processes], [Novelty, Inventive Step, Industrial Applicability], [20 Years from filing date], [Dual-clutch transmission mechanism, novel solar inverter circuit],
  [*Copyright*], [Literary, artistic, software source code, databases], [Originality of expression, fixed in tangible medium], [Lifetime of author + 60 Years], [DBMS kernel C++ code, CAD structural software manual],
  [*Trademark*], [Brand names, logos, symbols, slogans, trade dress], [Distinctiveness, graphical representation, non-descriptive], [10 Years (Renewable indefinitely)], ["Intel Inside" wordmark, Apple bitten logo, Cisco emblem],
  [*Industrial Design*], [Aesthetic shape, surface pattern, 3D geometry of article], [Newness, originality, eye appeal, non-functional], [10 Years (Extendable by 5 years = Max 15)], [Aerodynamic shell of electric scooter, smartphone casing],
  [*Geographical Indication (GI)*], [Goods possessing origin-based quality, reputation, traits], [Geographical origin link, traditional reputation], [10 Years (Renewable indefinitely)], [Darjeeling Tea, Kolhapuri Chappal, Pochampally Ikat],
  [*Trade Secret*], [Confidential algorithms, formulas, technical data, client lists], [Commercial value due to secrecy, reasonable security measures], [Unlimited (As long as secrecy is maintained)], [Google Search PageRank algorithm, Coca-Cola chemical formula],
  [*Semiconductor IC Layout*], [Topography, transistor layout, masking artwork of microchips], [Originality, non-obvious to layout creators], [10 Years from registration/first commercial use], [3D layout architecture of Intel Core i9 processor, RISC-V SoC layout],
  [*Plant Varieties (PVPFR)*], [Novel plant breeds, transgenic crop seeds, farmer varieties], [Distinctness, Uniformity, Stability, Novelty (DUS)], [15 Years (Crops/Varieties), 18 Years (Trees/Vines)], [Bt-Cotton insect-resistant seed line, high-yield hybrid wheat seed]
)

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 1, pp. 6–10] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah E. Bouchoux, IP Law, Ch 1–4]]]

#v(8pt)

= International Intellectual Property Organizations and Treaties

Global commercialization of engineering technology requires harmonization across international legal systems. Two primary international institutions govern global IP administration: the *World Intellectual Property Organization (WIPO)* and the *World Trade Organization (WTO)*.

== World Intellectual Property Organization (WIPO)
Established by the *Stockholm Convention of 1967* (effective 1970) and becoming a specialized agency of the *United Nations (UN)* in 1974, WIPO is headquartered in Geneva, Switzerland.

1. *Core Objectives and Functions:*
   - Harmonize national IP legislation and administrative procedures across member states.
   - Administer international IP treaties, classification systems, and global registration agreements.
   - Provide technical assistance, legal training, and IP infrastructure development for developing nations.
   - Administer alternative dispute resolution (ADR) through the *WIPO Arbitration and Mediation Center*.

2. *Major WIPO-Administered Treaties:*
   - *Paris Convention for the Protection of Industrial Property (1883):* Established the fundamental principles of *National Treatment* (foreign applicants receive equal treatment as nationals) and the *Right of Priority* (12-month priority window for patents/designs to file in foreign member countries retaining the original filing date).
   - *Berne Convention for the Protection of Literary and Artistic Works (1886):* Established *automatic protection* without mandatory registration formalties and the principle of *National Treatment* for copyright works.
   - *Patent Cooperation Treaty (PCT, 1970):* Streamlines international patent applications. Allows an applicant to file a single *international patent application* ("PCT application") designating over 150 member nations, granting an extended 30/31-month window before entering the national phase in individual patent offices.
   - *Madrid Agreement and Protocol (Trademarks):* Enables centralized international registration of marks through a single filing with WIPO.
   - *Hague Agreement (Industrial Designs):* Centralized international registration framework for industrial design rights.
   - *WIPO Copyright Treaty (WCT, 1996):* Special agreement under the Berne Convention addressing digital technologies, software codebases, and digital rights management (DRM) anti-circumvention measures.

== World Trade Organization (WTO) & TRIPS Agreement
The *Agreement on Trade-Related Aspects of Intellectual Property Rights (TRIPS Agreement)* was negotiated during the Uruguay Round of the General Agreement on Tariffs and Trade (GATT) and signed in Marrakesh in 1994, coming into effect on *January 1, 1995*. TRIPS integrated IP protection directly into international trade obligations under the WTO.

1. *Seven Covered Pillars of TRIPS:*
   TRIPS mandates minimum statutory standards across seven IP fields: (i) Copyright and Related Rights, (ii) Trademarks, (iii) Geographical Indications, (iv) Industrial Designs, (v) Patents, (vi) Integrated Circuit Layout-Designs, and (vii) Undisclosed Information (Trade Secrets).

2. *Core Pillars & Mandatory Principles:*
   - *National Treatment (Article 3):* Member countries must accord foreign nationals treatment no less favorable than that accorded to their own nationals regarding IP protection.
   - *Most-Favoured-Nation (MFN) Treatment (Article 4):* Any advantage, favor, privilege, or immunity granted by a WTO member state to the nationals of *any* country must be extended immediately and unconditionally to the nationals of all other member states.
   - *Enforcement Mechanisms & Dispute Settlement:* Unlike WIPO conventions, compliance with TRIPS is enforced via the WTO's powerful *Dispute Settlement Body (DSB)*, allowing trade sanctions for non-compliance.
   - *20-Year Minimum Patent Term:* Mandated a uniform patent term of 20 years from the date of filing across all technological fields, requiring product patent protection for pharmaceuticals and agrochemicals (forcing India's 2005 Patent Act Amendment).

#table(
  columns: (1.2fr, 2fr, 2fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 7pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[WIPO (World Intellectual Property Org)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[WTO — TRIPS Agreement]*]
  ),
  [*Institutional Affiliation*], [Specialized Agency of the United Nations (UN)], [Independent International Trade Body (WTO)],
  [*Primary Mandate*], [Promote creative activity and IP administration], [Integrate IP rights into global trade rules & enforce standards],
  [*Key Treaties*], [Paris Conv, Berne Conv, PCT, Madrid Protocol], [TRIPS Agreement (Annex 1C of Marrakesh Agreement)],
  [*Enforcement Power*], [Consensual, technical assistance, no trade sanctions], [Binding Dispute Settlement Body (DSB) with trade sanctions],
  [*Key Impact on India*], [Centralized PCT patent filing for global applications], [Mandated 2005 Patent Amendment introducing product patents]
)

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Preface & pp. 7–12, 734–740]]]

#v(8pt)

= Overview of IPR Legal and Administrative Infrastructure in India

== Historical Evolution of Indian IP Laws
1. *Pre-Independence Era:* The Indian Patents and Designs Act was enacted in 1911 based on British colonial law.
2. *Ayyanagar Committee Report (1959):* Post-independence, Justice N. Rajagopala Ayyangar recommended restricting patent scope in pharmaceuticals and food products to *process patents only* (prohibiting product patents) to foster indigenous generic manufacturing and ensure affordable medicines. This resulted in the landmark *Patents Act, 1970*.
3. *Post-TRIPS Harmonization Phase (1995–2005):* Upon joining the WTO in 1995, India amended its IP legislation in three phases (1999 Mailbox provision, 2002 extension of patent term to 20 years, and the *2005 Amendment Act* re-introducing product patents for pharmaceuticals, agrochemicals, and chemicals, while inserting *Section 3(d)* to prevent evergreening).

== Administrative Infrastructure under CGPDTM
The administrative management of IP in India is centralized under the *Controller General of Patents, Designs and Trade Marks (CGPDTM)*, an executive agency under the *Department for Promotion of Industry and Internal Trade (DPIIT)*, Ministry of Commerce and Industry, Government of India.

1. *Indian Patent Offices (IPO):* Headquartered in Kolkata, with four territorial branch offices handling patent examination and grant:
   - *Kolkata Patent Office* (Eastern Region)
   - *Mumbai Patent Office* (Western Region - Maharashtra, Gujarat, Goa, MP)
   - *New Delhi Patent Office* (Northern Region)
   - *Chennai Patent Office* (Southern Region)
2. *Trade Marks Registry (TMR):* Headquartered in Mumbai with branches in Ahmedabad, Chennai, Delhi, and Kolkata.
3. *Geographical Indications Registry (GIR):* Located in Chennai.
4. *Design Office:* Located within the Patent Office, Kolkata.
5. *Copyright Office:* Administered under DPIIT, located in New Delhi.

== Key Statutory Acts Governing IP in India
#table(
  columns: (1.8fr, 1fr, 2.5fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Statutory Enactment]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Enacted / Amended]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Primary Statutory Function & Scope]*]
  ),
  [*The Patents Act, 1970*], [1970 (Amended 2005, 2024)], [Grants 20-year monopoly for novel inventions fulfilling novelty, inventive step, and industrial applicability.],
  [*The Copyright Act, 1957*], [1957 (Amended 2012)], [Protects original literary (including software source code), dramatic, musical, and artistic works.],
  [*The Trade Marks Act, 1999*], [1999 (Amended 2010)], [Governs registration, protection against deceptive similarity, and passing off for commercial marks.],
  [*The Designs Act, 2000*], [2000], [Protects novel visual shape, configuration, pattern, and aesthetic appeal of manufactured articles.],
  [*Geographical Indications Act, 1999*], [1999], [Protects goods originating from specific geographical territories possessing distinctive quality/reputation.],
  [*Semiconductor IC Layout-Design Act*], [2000], [Protects original 3D layout topographies and masking patterns of semiconductor microchips.],
  [*PVPFR Act, 2001*], [2001], [Protects plant breeder rights for novel varieties while safeguarding traditional farmer rights.],
  [*Trade Secrets (Common Law)*], [Common Law], [Enforced via Section 27 of Indian Contract Act, 1872 & common law breach of confidence suits.]
)

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Intro, pp. 3–15]]]

#v(8pt)

= IPR in Engineering Design and IT / Software Systems

Modern engineering design sits at the intersection of mechanical, electronic, and computer software domains. Securing comprehensive IP protection requires a multi-layered legal strategy.

== Electronics and Semiconductor IC Layout Protection
In integrated circuit (IC) engineering, microchip functionality relies on complex 3D layout topographies of transistors, interconnects, and silicon layers.
- *The Semiconductor Integrated Circuits Layout-Design Act, 2000 (SICLD Act):* Protects the original layout topography of microchips.
- *Statutory Protection Period:* *10 years* from the date of filing or first commercial exploitation anywhere in the world.
- *Criteria:* The layout design must be *original* (not created by mere reproduction of another layout) and inherently distinctive. Reverse engineering for academic research or evaluation is permitted as a statutory exception.

== Electrical Systems & Embedded Hardware Protection
Physical engineering systems, such as custom printed circuit boards (PCBs), solar inverter topologies, motor controllers, and EV battery management units (BMUs), qualify for dual protection:
1. *Patents:* Protect novel electrical circuit configurations, switching methods, and hardware controller architectures that produce a tangible technical output.
2. *Industrial Designs:* Protect the unique external aesthetic casing, heat-sink shape, or ergonomic industrial housing under the Designs Act, 2000.

== Software IP Framework: Copyright vs. Patentability
The protection of computer software and IT algorithms represents a major exam focus area in SPPU.

1. *Software Protection under Copyright (Section 2(o) Copyright Act, 1957):*
   - Computer programs, source code, object code, and system documentation are explicitly categorized as *literary works*.
   - *Scope:* Copyright protects the *literal expression* of the code against direct copying, duplication, or piracy.
   - *Limitation:* Copyright does *not* protect the underlying algorithm, functional logic, structure, sequence, or system operation (Idea-Expression Dichotomy).

2. *Software Patentability in India (Section 3(k) Patents Act, 1970):*
   - Section 3(k) explicitly states that *"a mathematical or business method or a computer program per se or algorithms"* are *not patentable*.
   - *The "Computer Program Per Se" Bar and Technical Effect Exception:* Under the Computer-Related Inventions (CRI) Guidelines of the Indian Patent Office, software code in isolation cannot be patented. However, if a computer program is integrated with novel hardware or produces a *technical effect* / solves a specific technical problem (e.g., controlling an ABS braking system, optimizing motor speed, or hardware signal processing), the overall system or method *is* patentable.

#figure-box(
  "Figure 1.3: Software & Engineering System IP Protection Boundary Matrix",
  [
    #rect(
      width: 95%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #grid(
          columns: (1fr, 1.2fr, 1.2fr),
          column-gutter: 8pt,
          align: center,
          [
            #block(width: 100%, stroke: 1pt + rgb("#0284c7"), fill: rgb("#f0f9ff"), inset: 6pt, radius: 3pt, [*Source / Object Code*\ #text(size: 8pt)[Copyright (Sec 2(o))\ Protection: 60 Yrs Post-Mortem]])
          ],
          [
            #block(width: 100%, stroke: 1pt + rgb("#0f766e"), fill: rgb("#f0fdf4"), inset: 6pt, radius: 3pt, [*Software + Hardware System*\ #text(size: 8pt)[Patentable if Technical Effect proven (Sec 3(k) Exception)]])
          ],
          [
            #block(width: 100%, stroke: 1pt + rgb("#b91c1c"), fill: rgb("#fef2f2"), inset: 6pt, radius: 3pt, [*Trade Secret / AI Models*\ #text(size: 8pt)[Confidential NDA Protection (Breach of Confidence)]])
          ]
        )
      ]
    )
  ]
)

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 2, 50, pp. 25–54, 687–695] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah E. Bouchoux, IP Law, Ch 9]]]

#v(8pt)

= Landmark Case Study: Novartis AG v. Union of India (2013) 6 SCC 1

The landmark judgment in *Novartis AG v. Union of India* (2013) is a core compulsory case study in the SPPU IPR syllabus. It highlights the tension between private intellectual property rights and public health, while defining the statutory boundary of *patentability criteria under Section 3(d)* of the Indian Patents Act, 1970.

== Background & Factual Matrix of the Case
1. *The Product:* Novartis AG, a Swiss multinational pharmaceutical company, developed an anti-cancer drug named *Glivec* (Imatinib Mesylate), highly effective in treating Chronic Myeloid Leukemia (CML).
2. *Original Patent & Subsequent Modification:* Novartis obtained a US patent for the active free base *Imatinib* in 1993. Subsequently, Novartis developed the *beta-crystalline form* of Imatinib Mesylate, claiming that it possessed 30% higher bioavailability, superior thermodynamic stability, and lower hygroscopicity compared to the original compound.
3. *Patent Application in India:* In 1998, Novartis filed a patent application for the beta-crystalline form of Imatinib Mesylate at the Chennai Patent Office under the temporary "Mailbox" arrangement.

== Core Legal Controversy & Statutory Provisions
Upon examination in 2006 (after the 2005 Patent Amendment), the Assistant Controller of Patents rejected Novartis' application under *Section 3(d)* of the Patents Act, 1970. Novartis challenged the rejection, taking the legal battle to the Madras High Court, the Intellectual Property Appellate Board (IPAB), and ultimately the *Supreme Court of India*.

#alert("IMPORTANT", [
  *Section 3(d) of Indian Patents Act, 1970:* \
  The following are declared *NOT* to be inventions: \
  _"The mere discovery of a new form of a known substance which does not result in the enhancement of the known efficacy of that substance or the mere discovery of any new property or new use for a known substance..."_ \
  *Explanation to Sec 3(d):* Salts, esters, ethers, polymorphs, metabolites, pure form, isomers, and other derivatives of a known substance shall be considered to be the *same substance*, unless they differ significantly in properties with regard to *efficacy*.
])

== The Concept of "Evergreening" in Patents
*Evergreening* refers to corporate strategies employed by patent owners to extend their 20-year statutory monopoly beyond expiration by filing secondary patents for minor, incremental, or trivial modifications of known compounds (such as new crystalline forms, salts, isomers, or dosages) without introducing genuine inventive novelty.
- *Legislative Intent of Sec 3(d):* Inserted during the 2005 TRIPS-compliant amendment specifically to prevent evergreening in pharmaceutical and chemical innovations, safeguarding public access to generic drugs.

== Key Supreme Court Holdings & Legal Test
In a historic judgment authored by Justice Aftab Alam, the Supreme Court of India dismissed Novartis' appeal on *April 1, 2013*, holding as follows:

1. *Deeming Fiction under Explanation to Sec 3(d):*
   Statutorily, all derivatives, polymorphs, and salts of a known substance are deemed to be the *same substance*. The burden of proof lies heavily on the patent applicant to demonstrate significant enhancement of efficacy.

2. *Strict Test of "Therapeutic Efficacy" for Medicines:*
   - The Court rejected Novartis' argument that a 30% increase in bioavailability or improved physical stability automatically satisfied Section 3(d).
   - The Supreme Court held that in the context of medicine, "efficacy" means strictly *Therapeutic Efficacy*—the direct capacity of the substance to cure, heal, or suppress disease.
   - Physical properties inherent to a new form (e.g., solubility, hygroscopicity, thermal stability) do not constitute enhanced therapeutic efficacy unless they directly translate to superior clinical therapeutic performance in patients.

3. *Rejection of Evergreening:*
   The beta-crystalline form was held to be a mere derivative of the known substance Imatinib with no proven enhancement of therapeutic efficacy, failing the threshold of Section 3(d).

#table(
  columns: (1.5fr, 2fr, 2fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 7pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Novartis AG Position (Appellant)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Supreme Court Holding (Union of India)]*]
  ),
  [*Claimed Subject Matter*], [Beta-crystalline form of Imatinib Mesylate], [Derivative / polymorph of known substance Imatinib],
  [*Efficacy Argument*], [30% higher bioavailability & thermal stability], [Bioavailability is a physical property, not therapeutic efficacy],
  [*Interpretation of Sec 3(d)*], [Any beneficial property enhancement qualifies], [Strictly *Therapeutic Efficacy* required for medicines],
  [*Policy Outcome*], [Sought 20-year secondary patent extension], [Patent refused; generic manufacture permitted (Glivec price dropped from ₹1.2 Lakh/month to ₹8,000/month)]
)

== Global Significance and Public Welfare Impact
- *Public Health & Affordable Healthcare:* The ruling ensured that life-saving generic cancer drugs could be produced by Indian pharmaceutical manufacturers at a fraction of Western monopoly prices, benefiting millions of patients across developing nations.
- *TRIPS Compliance:* The Supreme Court affirmed that Section 3(d) fully complies with India's obligations under the WTO TRIPS Agreement, utilizing TRIPS flexibilities to balance private innovation incentives with sovereign public health duties.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 45, pp. 492–494 (PDF pp. 570–572)] | Landmark Judgment: (2013) 6 SCC 1]]

#v(12pt)
#line(length: 100%, stroke: 1pt + accent-color)
#align(center)[#text(size: 9pt, fill: rgb("#64748b"), weight: "bold")[END OF UNIT 1 THEORY NOTES — IPR AND CYBER LAWS]]
