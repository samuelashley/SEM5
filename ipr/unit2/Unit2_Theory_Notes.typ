// Typst Theory Notes - Intellectual Property Rights & Cyber Laws (Unit 2)
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
        align(left)[#text(size: 8pt, fill: accent-color, weight: "bold")[IPR & CYBER LAWS — UNIT 2]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Patents, Copyrights and Trademarks]]
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
  let c = colors.at(type, default: (border: rgb("#1e40af"), bg: rgb("#eff6ff")))
  
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
  #text(size: 17pt, fill: text-color, weight: "bold")[UNIT 2: PATENTS, COPYRIGHTS AND TRADEMARKS]
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
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 2.

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
  [Patent Law & Filing Procedure], [Patent concept, types of applications, criteria, 8-step IPO procedure, rights & limits], [High (6–8 Marks)],
  [Copyright Scope & Engineering], [Copyright meaning, scope in software/embedded systems, idea-expression dichotomy, fair dealing], [High (6–8 Marks)],
  [Trademark & Branding], [Trademark registration, distinctiveness spectrum, infringement vs passing off, digital branding], [High (6–8 Marks)],
  [Industrial Designs & GIs], [Designs Act 2000 criteria & copyright overlap, GI Act 1999 rationale & famous Indian GIs], [High (4–6 Marks)],
  [Case Study: Patent Infringement], [*Bajaj Auto v. TVS Motor*: DTS-i engine technology patent litigation & speedy trial guidelines], [High (6–8 Marks)],
  [Case Study: Cyber Trademark], [*Yahoo! Inc. v. Akash Arora*: Domain name passing off & transborder reputation in digital space], [High (6–8 Marks)]
)

#v(8pt)

= Patent Law: Concept, Types, Criteria and Grant Procedure

== Statutory Definition and Concept of Patent
Under Section 2(1)(m) of the *Indian Patents Act, 1970*, a *patent* is defined as a statutory grant issued by the Patent Office for any invention. Section 2(1)(j) defines an *invention* as _"a new product or process involving an inventive step and capable of industrial application."_

A patent provides a *20-year statutory monopoly* from the international/national filing date, conferring upon the patentee exclusive legal authority under Section 48 to prevent unauthorized third parties from making, using, offering for sale, selling, or importing the patented product or process into India.

== Types of Patent Applications in the Indian Context
The Indian Patent Office (IPO) recognizes six primary categories of patent applications:
1. *Ordinary Application:* Filed directly with the IPO without claiming priority from any previous application or foreign convention country. Can be filed as a *Provisional Application* (to establish an early priority date) followed by a *Complete Specification* within 12 months.
2. *Convention Application (Section 135):* Filed in India claiming priority from an earlier application filed in a *Paris Convention* member country within a strict *12-month priority window*.
3. *PCT International Application:* Filed under the *Patent Cooperation Treaty (PCT)*, designating multiple member countries through a single international filing.
4. *PCT National Phase Application (Section 138):* Filed in India entering the national examination phase after the PCT international phase within *31 months* from the earliest priority date.
5. *Patent of Addition (Section 54):* Filed for any improvement or modification of an existing invention for which a main patent application has been filed or granted. It expires concurrently with the main patent and requires no separate annual renewal fees.
6. *Divisional Application (Section 16):* Filed when a single parent patent application contains claims covering more than one distinct invention (violating the principle of unity of invention).

== Statutory Criteria of Patentability with Engineering Examples
To qualify for a patent grant under Indian law, an engineering invention must satisfy three cumulative statutory requirements alongside non-exclusion under Section 3:

1. *Novelty / New Invention (Section 2(1)(l)):*
   - *Requirement:* The invention must not have been published in any document or used publicly anywhere in the world prior to the date of filing (no *prior art* anticipation).
   - *Engineering Example:* A novel dual-stage thermal management architecture for electric vehicle (EV) battery packs that has never appeared in any research journal, patent database, or public trade show.

2. *Inventive Step / Non-Obviousness (Section 2(1)(ja)):*
   - *Requirement:* A feature of an invention that involves technical advance as compared to existing knowledge or has economic significance (or both), making the invention *non-obvious to a Person Having Ordinary Skill in the Art (PHOSITA)*.
   - *Engineering Example:* Synthesizing a specific gallium-nitride (GaN) semiconductor doping topology that reduces switching power loss by 40% in high-frequency solar inverters, which could not be deduced by a standard power electronics engineer from existing literature.

3. *Industrial Applicability / Utility (Section 2(1)(ac)):*
   - *Requirement:* The invention must be capable of being made or used in an industry. Purely theoretical or non-reproducible concepts are ineligible.
   - *Engineering Example:* A scalable robotic manufacturing end-effector tool capable of automated precision soldering on printed circuit board assemblies.

== Non-Patentable Subject Matter under Section 3
Section 3 of the Patents Act, 1970 explicitly excludes specific subject matter from patentability:
- *Sec 3(a):* Frivolous inventions or claims contrary to well-established natural laws (e.g., perpetual motion machines).
- *Sec 3(b):* Inventions contrary to public order, morality, or causing serious prejudice to human, animal, or plant life.
- *Sec 3(c):* Discovery of a scientific principle or abstract theory, or discovery of any living/non-living substance occurring in nature.
- *Sec 3(d):* Mere discovery of a new form of a known substance without enhanced therapeutic efficacy (the *Novartis* rule).
- *Sec 3(f):* Mere arrangement, re-arrangement, or duplication of known devices working independently in a known way.
- *Sec 3(k):* Mathematical methods, business methods, *computer programs per se*, or algorithms.
- *Sec 3(m):* Mere scheme, rule, or method of performing mental act or method of playing game.

== Step-by-Step Patent Grant Procedure in India
The Indian Patent Office follows a strict statutory workflow for patent examination and grant:

#figure-box(
  "Figure 2.1: Step-by-Step Patent Filing, Examination, and Grant Workflow in India",
  [
    #rect(
      width: 95%,
      stroke: 0.5pt + rgb("#cbd5e1"),
      fill: rgb("#ffffff"),
      inset: 8pt,
      radius: 4pt,
      [
        #grid(
          columns: (1fr, 1.2fr, 1.2fr, 1fr),
          column-gutter: 6pt,
          align: center,
          [
            #block(width: 100%, fill: rgb("#f1f5f9"), inset: 5pt, radius: 3pt, [*Step 1: Filing*\ #text(size: 7.5pt)[Form 1 + Provisional / Complete Specs]])
          ],
          [
            #block(width: 100%, fill: rgb("#e0f2fe"), inset: 5pt, radius: 3pt, [*Step 2: Publication*\ #text(size: 7.5pt)[Sec 11A Journal at 18 Months]])
          ],
          [
            #block(width: 100%, fill: rgb("#fef3c7"), inset: 5pt, radius: 3pt, [*Step 3: RFE & FER*\ #text(size: 7.5pt)[Form 18 Filing & Exam Report]])
          ],
          [
            #block(width: 100%, fill: rgb("#dcfce7"), inset: 5pt, radius: 3pt, [*Step 4: Opposition & Grant*\ #text(size: 7.5pt)[Sec 25(1) & Sec 43 Grant]])
          ]
        )
        #v(4pt)
        #text(size: 8pt, fill: rgb("#334155"))[*Key Milestones:* RFE within 48 months | Response to FER within 6 months | Annual Renewal (3rd to 20th year)]
      ]
    )
  ]
)

1. *Step 1: Application Filing (Section 7 & 10):* File Form 1 along with Provisional or Complete Specification (Form 2) detailing the title, abstract, detailed technical description, drawings, and legal *claims* defining the scope of protection.
2. *Step 2: Statutory Publication (Section 11A):* Every patent application remains confidential until it is published in the official Patent Office Journal *18 months* from the filing/priority date (early publication available via Form 9).
3. *Step 3: Request for Examination (RFE - Section 11B):* Examination is not automatic. The applicant must file Form 18 within *48 months* from the priority/filing date.
4. *Step 4: Examination & First Examination Report (FER):* The Patent Examiner conducts prior art searches and issues an FER detailing objections regarding novelty, inventive step, or Section 3 exclusions. The applicant must respond within *6 months* (extendable by 3 months).
5. *Step 5: Pre-Grant Opposition (Section 25(1)):* Any person may file a pre-grant opposition in writing against the grant of patent on grounds such as prior publication, lack of inventive step, or non-patentability.
6. *Step 6: Grant of Patent (Section 43):* If all examination objections and pre-grant oppositions are resolved, the Controller grants the patent, enters it into the Register of Patents, and issues a Patent Certificate.
7. *Step 7: Post-Grant Opposition (Section 25(2)):* Any *interested person* (competitor) may file a post-grant opposition within *1 year* from the date of publication of the patent grant.
8. *Step 8: Maintenance & Renewal Fees:* To keep the patent valid for 20 years, annual renewal fees must be paid starting from the 3rd year onwards.

== Patentees' Statutory Rights and Limitations
- *Statutory Rights (Section 48):* For product patents, the right to prevent third parties from making, using, selling, or importing the product. For process patents, the right to prevent third parties from using the process or selling products directly obtained from that process.
- *Statutory Limitations & Exceptions:*
  - *Compulsory Licensing (Section 84):* Any person can apply for a compulsory license after *3 years* from patent grant if reasonable requirements of the public are not satisfied, the invention is not available at an affordable price, or it is not worked in India.
  - *Government Use (Section 100):* Central Government may use any patented invention for its own purposes.
  - *Bolar Exception / Regulatory Exemption (Section 107A):* Conducting research, making, or using a patented invention solely for regulatory submission (e.g., US FDA or Indian CDSCO approval) does not constitute infringement.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 45–59, pp. 480–600] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah E. Bouchoux, IP Law, Ch 11–16]]]

#v(8pt)

= Copyright Law: Scope, Doctrines and Engineering Applications

== Definition and Concept of Copyright
Under Section 14 of the *Copyright Act, 1957*, *copyright* means the exclusive right to do or authorize the doing of specific acts in respect of a work or any substantial part thereof. Unlike patent rights, copyright protection arises *automatically* upon the creation and fixation of an original work in a tangible medium, without mandatory registration (though registration provides prima facie evidentiary proof in court).

The statutory duration for published literary, dramatic, musical, and artistic works is the *author's lifetime plus 60 years* post-mortem.

== Fundamental Copyright Doctrines in Technology
1. *Idea-Expression Dichotomy:*
   Copyright protects only the *original expression* of an idea, never the underlying idea, procedure, process, system, or operational concept itself. Multiple software developers can write independent code (expressions) implementing the exact same sorting algorithm (idea).
2. *Doctrine of Merger:*
   When an underlying idea can only be expressed in one or a very limited number of ways, the idea and expression "merge." In such cases, copyright protection is denied to the expression to prevent monopolizing the idea itself.
3. *Modicum of Creativity vs. Sweat of the Brow:*
   The Supreme Court of India in *Eastern Book Company v. D.B. Modak (2008)* rejected the English "Sweat of the Brow" doctrine (which rewarded pure labor/expense) and adopted the Canadian standard of *"Modicum of Creativity"*—requiring that a work display minimal personal intellectual effort, judgment, and skill to claim copyright.

== Scope of Copyright in Engineering and Software Systems
In modern computer science and IT engineering, Section 2(o) of the Copyright Act explicitly classifies *computer programs* as *literary works*.

1. *Software Source Code & Object Code:*
   - Both high-level human-readable source code (C++, Python, Java) and machine-executable object code (binary binaries, assembly instructions) are protected against literal copying, unauthorized reproduction, and distribution.
2. *Firmware and Embedded Microcontroller Systems:*
   - Microcode burned into ROM, EEPROM, or Flash memory of embedded microcontrollers (e.g., automotive ECU firmware, IoT sensor code) is protected as literary software code.
3. *Database Protection:*
   - Database schemas, data structures, and compiled digital datasets are protected as literary compilations provided the selection and arrangement exhibit a modicum of creativity.
4. *Graphical User Interfaces (GUIs) & Software Manuals:*
   - Visual icons, layout designs, CAD blueprints, system architecture documentation, and user manuals receive protection as artistic or literary works.

== Permitted Uses and Statutory Fair Dealing (Section 52)
Section 52 of the Indian Copyright Act details statutory exceptions where use without license does not constitute infringement:
- *Fair Dealing for Private Use & Research (Sec 52(1)(a)):* Personal study, academic research, criticism, or review.
- *Software Interoperability & Reverse Engineering (Sec 52(1)(ab)):* The reproduction or adaptation of a computer program by a lawful possessor to study functionality, test security vulnerabilities, or achieve *interoperability* with independently created computer programs.
- *Backup Copy Creation (Sec 52(1)(aa)):* Making backup copies of a legally acquired software program for archival safety against loss or corruption.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 1–16, pp. 17–210] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah E. Bouchoux, IP Law, Ch 5–10]]]

#v(8pt)

= Trademark Law: Registration, Branding and Digital Protection

== Definition and Commercial Functions of Trademarks
Under Section 2(1)(zb) of the *Trade Marks Act, 1999*, a *trademark* is defined as a mark capable of being represented graphically and which is capable of distinguishing the goods or services of one person from those of others. It may include a shape of goods, their packaging, and combinations of colors.

*Core Industrial Functions:*
1. *Source Identifiers:* Indicates the single commercial origin of goods or services to consumers.
2. *Quality Guarantee:* Assures consumers of a consistent level of quality and performance across products bearing the mark.
3. *Goodwill and Brand Value:* Serves as a primary marketing tool, embedding corporate reputation and brand equity.

== The Spectrum of Trademark Distinctiveness
Trademarks are legally categorized along a five-tier spectrum of distinctiveness:
1. *Fanciful / Coined Marks (Strongest):* Invented words having no pre-existing dictionary meaning (e.g., *Kodak, Xerox, Google*). Highly distinctive and easily registrable.
2. *Arbitrary Marks (Strong):* Real dictionary words applied to completely unrelated goods (e.g., *Apple* for computers, *Amazon* for e-commerce).
3. *Suggestive Marks (Moderate):* Suggests a quality or trait of the product without explicitly describing it, requiring consumer imagination (e.g., *Microsoft, Netflix, Airbus*).
4. *Descriptive Marks (Weak):* Directly describes the ingredients, function, or characteristics of the product (e.g., *Quick Pay, High Speed*). Unregistrable unless it has acquired *secondary meaning* / distinctiveness through long exclusive commercial use.
5. *Generic Terms (Unregistrable):* Common name for the product category itself (e.g., *Computer, Smartphone*). Cannot be owned by any single entity.

== Non-Conventional Trademarks in Modern Industry
With technological advancement, non-conventional trademarks have gained statutory recognition:
- *Sound Marks:* Registered auditory signatures (e.g., *Yahoo! Yodel*, *Intel 5-note chime*, *ICICI corporate jingle*).
- *Shape / 3D Marks:* Distinctive physical shape or packaging of goods (e.g., *Coca-Cola contour bottle*, *Toblerone triangular shape*).
- *Color Marks:* Specific single colors or distinctive color combinations associated with a brand (e.g., *Magenta* for T-Mobile).

== Trademark Registration Procedure in India
1. *Prior Art Search:* Conduct an online search on the IPO Public Search portal to verify availability.
2. *Application Filing (Form TM-A):* Submit application indicating mark, class (under the 45 *Nice Classification* classes), applicant details, and date of first commercial use.
3. *Examination & FER:* Examiner reviews for *Absolute Grounds of Refusal (Sec 9)* (lack of distinctiveness, descriptive nature) and *Relative Grounds of Refusal (Sec 11)* (identity or deceptive similarity to an existing mark causing likelihood of confusion).
4. *Publication in Trademark Journal:* Published for public notice to invite third-party oppositions within *4 months (Section 21)*.
5. *Registration & Renewal:* Issued for *10 years*, renewable indefinitely every 10 years upon payment of renewal fees.

== Infringement vs. Passing Off
#table(
  columns: (1.5fr, 2fr, 2fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 7pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Statutory Infringement (Section 29)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Common Law Passing Off]*]
  ),
  [*Nature of Right*], [Statutory remedy under Trade Marks Act, 1999], [Common law tortious remedy based on equity],
  [*Applicability*], [Applies *only* to registered trademarks], [Applies to *unregistered* marks and domain names],
  [*Burden of Proof*], [Simpler: Prove identity/similarity & registration], [Requires proving Classic Trinity: Goodwill, Deception, Damage],
  [*Jurisdiction*], [District Court where plaintiff resides/carries business], [District Court where cause of action / defendant resides]
)

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 22–35, pp. 261–430] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah E. Bouchoux, IP Law, Ch 1–4]]]

#v(8pt)

= Industrial Designs and Geographical Indications (GIs)

== Industrial Designs (The Designs Act, 2000)
1. *Definition of Design (Section 2(d)):*
   Features of shape, configuration, pattern, ornament, or composition of lines or colors applied to any two-dimensional or three-dimensional article by any industrial process, which in the finished article *appeal to and are judged solely by the eye*.

2. *Key Exclusions:*
   Excludes any mode or principle of construction, mere mechanical devices, trademarks, or artistic works covered under the Copyright Act.

3. *Statutory Term of Protection:*
   *10 years* from the date of registration, extendable by *5 years* upon application (Maximum *15 years* total).

4. *Copyright vs. Industrial Design Overlap (Section 15 Copyright Act):*
   - If an artistic work is registered as a design under the Designs Act, copyright in that artistic work ceases.
   - If an artistic work is *capable* of design registration but is *not* registered, copyright in the work *ceases as soon as the article is reproduced more than 50 times* by an industrial process by the owner or licensee.

5. *Piracy of Registered Design (Section 22):*
   Unauthorized industrial application of a registered design or importing/selling infringing articles attracts statutory damages up to ₹50,000 per registered design.

== Geographical Indications (The GI Act, 1999)
1. *Definition of GI (Section 2(1)(e)):*
   An indication which identifies goods (agricultural, natural, or manufactured) as originating in a definite territory, region, or locality where a given quality, reputation, or other characteristic of such goods is essentially attributable to its geographical origin.

2. *Statutory Term & Authorized Users:*
   Registered for *10 years* (renewable indefinitely). Unlike trademarks, a GI is owned collectively by an association of producers, and individual artisans/producers register as *Authorized Users*. GIs cannot be assigned, licensed, or mortgaged.

3. *Famous Indian GIs:*
   - *Darjeeling Tea* (First GI registered in India, 2004)
   - *Kolhapuri Chappal* (Footwear, Maharashtra/Karnataka)
   - *Kanchipuram Silk & Pochampally Ikat* (Textiles)
   - *Mysore Sandal Soap & Alphonsos Mango* (Industrial/Agricultural)

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 17–21, 36–44, pp. 211–258, 437–476]]]

#v(8pt)

= Landmark Case Study 1: Bajaj Auto Ltd. v. TVS Motor Company Ltd. (2009) 9 SCC 797

The *Bajaj Auto v. TVS Motor* case is a compulsory engineering case study in the SPPU syllabus focusing on patent infringement litigation in automotive technology and procedural guidelines for IP disputes.

== Technological Background and Patent Claim
1. *The Patentee (Bajaj Auto Ltd.):* Bajaj held Indian Patent No. 195950 for *Digital Twin Spark Ignition (DTS-i)* technology. The patent claimed an internal combustion engine fitted with *two spark plugs* placed at diametrically opposite locations in the combustion chamber to improve lean-burn efficiency, fuel economy, and lower engine emissions in small 4-stroke two-wheeler engines.
2. *The Alleged Infringer (TVS Motor Company Ltd.):* TVS launched its 125cc motorcycle *TVS Flame*, featuring a *CC-VT engine* that also incorporated twin spark plugs.
3. *The Legal Claim:* Bajaj filed a suit for patent infringement in the Madras High Court seeking a permanent injunction restraining TVS from manufacturing or selling *TVS Flame*.

== Main Legal Issues & Procedural Bottlenecks
1. *Substantive Patent Issue:* Did TVS' CC-VT engine infringe Bajaj's DTS-i patent, or was TVS' three-valve configuration with twin spark plugs an independent, non-infringing technical advance? TVS challenged Bajaj's patent validity, alleging prior art anticipation and lack of inventive step.
2. *Procedural Injunction Delay:* The suit triggered an intense interlocutory legal battle:
   - A Single Judge of the Madras High Court granted an interim injunction restraining TVS.
   - A Division Bench of the High Court reversed the injunction on appeal, allowing TVS to launch the bike.
   - The dispute reached the *Supreme Court of India* purely on the question of the interlocutory injunction, while the actual suit trial remained pending for years.

== Supreme Court Guidelines on IP Litigation
In a landmark judgment authored by Justice Markandey Katju, the Supreme Court expressed severe dissatisfaction over the prolonged delays in resolving IP disputes through temporary injunction hearings ("trial by affidavits").

#alert("IMPORTANT", [
  *Supreme Court Directions in Bajaj v. TVS (2009):* \
  1. *Speedy Trial Mandate:* Trial courts across India are directed to hear and decide patent, trademark, copyright, and industrial design suits *on merits within 3 to 4 months* from filing. \
  2. *Discouraging Interlocutory Battles:* Courts must avoid spending years deciding temporary injunction applications, as prolonged interim orders ruin commercial investments before the actual validity of the patent is established. \
  3. *Appointment of Scientific Advisors:* Trial courts dealing with complex engineering patents must utilize scientific advisors (Section 115) to quickly evaluate technical claims.
])

== Industry Impact in Engineering
The judgment transformed Indian IP jurisprudence by forcing lower courts to fast-track technical patent trials, ensuring that high-tech engineering disputes are decided on empirical evidence and full trial rather than endless interim injunction stay orders.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 58, pp. 590–593 (PDF pp. 668–671)] | Supreme Court Judgment: (2009) 9 SCC 797]]

#v(8pt)

= Landmark Case Study 2: Yahoo! Inc. v. Akash Arora & Anr. 1999 (19) PTC 201 (Del)

The *Yahoo! Inc. v. Akash Arora* judgment by the Delhi High Court is a pioneering Indian case study governing trademark protection, passing off, and domain names in cyberspace.

== Background & Factual Matrix
1. *The Plaintiff (Yahoo! Inc.):* Yahoo! Inc., a global internet pioneer based in California, USA, owned the famous global mark *"Yahoo!"* and operated the world-renowned web directory and search portal at `www.yahoo.com` since 1994.
2. *The Defendant (Akash Arora / Net Link Information Systems):* The defendant registered the domain name `www.yahooshopping.com` and `www.yahooindia.com` to offer internet web portal and directory services aimed at Indian internet users.
3. *The Injunction Suit:* Yahoo! Inc. filed a passing-off suit in the Delhi High Court seeking an interim injunction to restrain Akash Arora from operating under domain names incorporating the word "Yahoo".

== Key Legal Controversies
1. Could domain names on the Internet be treated as equivalent to traditional commercial trademarks?
2. Could a foreign company claim legal protection in India for a passing-off action when it had *no physical office or registered trademark in India* at the time?

== Delhi High Court Ruling & Legal Principles
Justice 1.K. Mehra of the Delhi High Court ruled decisively in favor of Yahoo! Inc., granting an interim injunction based on the following historic principles:

1. *Domain Names as Digital Trademarks:*
   The High Court held that on the Internet, a *domain name* is not merely an IP address or web location. It serves the exact same source-identifying function as a traditional trademark in the physical market. Consumers associate a domain name with a specific corporate identity, quality, and business reputation.

2. *Deceptive Similarity in Cyberspace:*
   The domain name `YahooIndia.com` was held to be *phonetically, visually, and structurally identical* to Yahoo! Inc.'s `Yahoo.com`. An average internet user seeking Yahoo!'s services in India would easily be misled into believing that `YahooIndia.com` was an official Indian subsidiary or regional portal of Yahoo! Inc.

3. *Transborder Reputation Doctrine:*
   The Court held that in the internet age, business reputation transcends physical national boundaries (*Transborder Goodwill*). Even if Yahoo! Inc. did not possess a physical branch office or local trademark registration in India, its global reputation reached Indian internet users via the worldwide web, entitling it to passing-off protection.

4. *Rejection of Defendant's Defenses:*
   The defendant's argument that "Yahoo" was a dictionary word and that suffixing "India" created a distinct name was rejected. The Court held that "Yahoo" had acquired secondary meaning and distinctive global goodwill.

#table(
  columns: (1.5fr, 2fr, 2fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 7pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Parameter]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Akash Arora Position (Defendant)]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Delhi High Court Holding (Yahoo! Inc.)]*]
  ),
  [*Domain Status*], [Claimed domain names are mere internet address routing codes], [Domain names act as digital trademarks identifying commercial source],
  [*Territorial Scope*], [Plaintiff had no physical office or TM registration in India], [Internet creates *Transborder Reputation* accessible across borders],
  [*Likelihood of Confusion*], [Adding "India" (`YahooIndia.com`) avoids confusion], [Identical prefix creates extreme likelihood of consumer deception],
  [*Legal Remedy*], [Claimed passing off applies only to physical goods], [Passing off extended to internet domain names & digital services]
)

== Significance in Digital Space & Cyber Laws
*Yahoo! Inc. v. Akash Arora* laid the foundation for domain name dispute jurisprudence in India, paving the way for protection against *cybersquatting* and aligning Indian courts with international ICANN UDRP (Uniform Domain-Name Dispute-Resolution Policy) standards.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 22, pp. 274, 352 (PDF pp. 352, 436)] | Landmark Judgment: 1999 (19) PTC 201 (Del)]]

#v(12pt)
#line(length: 100%, stroke: 1pt + accent-color)
#align(center)[#text(size: 9pt, fill: rgb("#64748b"), weight: "bold")[END OF UNIT 2 THEORY NOTES — IPR AND CYBER LAWS]]
