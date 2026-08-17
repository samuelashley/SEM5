// Typst Theory Notes - Intellectual Property Rights & Cyber Laws (Unit 3)
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
        align(left)[#text(size: 8pt, fill: accent-color, weight: "bold")[IPR & CYBER LAWS — UNIT 3]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[IPR Management and Innovation]]
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
  let c = colors.at(type, default: (border: rgb("#7c3aed"), bg: rgb("#f5f3ff")))
  
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
  #text(size: 17pt, fill: text-color, weight: "bold")[UNIT 3: IPR MANAGEMENT AND INNOVATION]
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
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 3.

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
  [IPR Commercialization & Licensing], [Modes of commercialization, licensing types, assignment, licensing contract clauses], [High (6–8 Marks)],
  [Infringement & Legal Remedies], [Direct/indirect infringement, civil remedies (injunctions, Anton Piller), criminal remedies], [High (6–8 Marks)],
  [Technology Transfer & Valuation], [University-industry models, TTOs, Bayh-Dole model, Cost/Market/DCF IP valuation], [High (4–6 Marks)],
  [IPR in Startups & "Make in India"], [IP audits, FTO searches, SIPP scheme, 80% fee rebate, National IPR Policy 2016], [High (4–6 Marks)],
  [Basics of Patent Search], [Databases (InPASS, Google Patents), Boolean logic, search on LED / Solar / EV charging], [High (6–8 Marks)],
  [Landmark Case Study], [*Natco Pharma v. Bayer Corp*: Sec 84 compulsory licensing of Nexavar anti-cancer drug], [High (6–8 Marks)]
)

#v(8pt)

= IPR Commercialization and Licensing Strategies

== Concept of IP Commercialization
*IP Commercialization* is the process of translating technical research, inventive concepts, and protected intellectual assets into commercially viable products, services, or market spin-offs. Developing an IP asset without commercialization represents an unrecouped financial liability; commercialization transforms legal titles into revenue streams, market equity, and competitive advantage.

== Primary Pathways to IP Commercialization
1. *Direct Exploitation / Internal Manufacturing:*
   The IP owner manufactures, markets, and sells the protected product directly. Provides maximum profit margins and operational control but demands high upfront capital expenditure (*CapEx*) and market distribution infrastructure.
2. *IP Licensing:*
   The IP owner (*licensor*) grants written permission to a third party (*licensee*) to manufacture, use, or sell the protected IP asset in exchange for financial consideration (upfront fees and running royalties), while retaining legal ownership/title.
3. *IP Assignment (Outright Sale):*
   The complete, permanent transfer of all ownership rights, title, and interest in an IP asset from the assignor to the assignee. Governed by formal written contract (e.g., Section 68 of the Patents Act requires written registered instruments).
4. *Joint Ventures & Strategic Alliances:*
   Cooperative commercial partnerships where two or more firms pool technical IP assets, manufacturing capabilities, and capital to co-develop new technological solutions.
5. *Franchising:*
   A specialized commercial model combining trademark licensing, proprietary business trade secrets, and technical operational assistance.

== Comprehensive Taxonomy of IP Licensing Agreements
- *Exclusive License:* The licensee receives the sole right to exploit the IP asset to the complete exclusion of all others, including the licensor.
- *Non-Exclusive License:* The licensor retains the right to exploit the IP asset directly and grant simultaneous licenses to multiple competing third parties.
- *Sole License:* The licensee receives exploitation rights, and the licensor agrees not to grant licenses to third parties, but the licensor retains the right to exploit the IP directly.
- *Cross-Licensing Agreement:* Two or more technology firms enter a bilateral contract exchanging licenses to use each other's patent portfolios without cash exchange, preventing patent blocking in complex industries (e.g., telecommunications and semiconductors).
- *Voluntary vs. Compulsory Licensing:* Voluntary licensing is negotiated by mutual commercial consent. Compulsory licensing is a statutory mandate imposed by the State under Section 84 of the Patents Act in public interest.

== Critical Clauses in an IP Licensing Contract
An enforceable IP licensing contract must contain ten essential clauses:
1. *Grant Clause:* Explicitly defines the scope of rights granted (make, use, sell, import).
2. *Territorial Scope:* Defines geographical boundaries (e.g., India only, South Asia, Worldwide).
3. *Field of Use:* Restricts commercial exploitation to specific technical markets (e.g., automotive use only).
4. *Financial Consideration & Royalty Structure:*
   - *Upfront Execution Fee:* Initial lump-sum payment upon contract signing.
   - *Running Royalty:* Ongoing percentage (e.g., 3% to 7%) of net sales revenue.
   - *Minimum Guaranteed Annual Royalty (MGAR):* Floor amount payable regardless of sales volume to ensure licensee active working.
5. *Duration & Termination:* Defines contract term and conditions for default termination.
6. *Grant-Back Clause:* Specifies ownership of improvements or modifications made by the licensee.
7. *Indemnification & Patent Validity Warranties:* Allocation of legal liability if the licensed IP infringes third-party rights.
8. *Audit Rights:* Licensor's right to inspect licensee financial books to verify royalty accuracy.
9. *Dispute Resolution & Governing Law:* Choice of jurisdiction and arbitration mechanisms.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 28, 56, pp. 371–374, 567–578] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah E. Bouchoux, IP Law, Ch 16]]]

#v(8pt)

= Infringement of IPR and Legal Remedies

== Taxonomy of IP Infringement
Infringement occurs when a third party exploits protected subject matter without the consent, license, or authorization of the IP titleholder.
1. *Direct Infringement:* The unauthorized manufacture, sale, reproduction, or importation of the exact patented product, copyrighted work, or registered trademark.
2. *Indirect / Contributory Infringement:* Supplying a non-staple custom component designed specifically for an infringing assembly, knowing it has no other commercial use.
3. *Inducement to Infringe:* Actively encouraging, aiding, or instructing another party to commit IP infringement (e.g., providing instructions on bypassing software DRM).

== Civil Legal Remedies in Indian Courts
Civil suits for IP infringement are instituted in District Courts or High Courts having original jurisdiction. Indian jurisprudence provides three primary classes of civil relief:

1. *Injunctions (Statutory Preventive Relief):*
   - *Temporary / Interlocutory Injunction (Order 39 Rules 1 & 2 CPC):* Restrains defendant activities during suit pendency. Requires establishing: (i) *Prima facie* case, (ii) Balance of convenience in plaintiff's favor, and (iii) Irreparable injury if refused.
   - *Permanent / Perpetual Injunction (Section 38 Specific Relief Act):* Granted upon final suit decree, permanently barring infringement.
   - *Anton Piller Order:* Ex-parte court order permitting plaintiff representatives to enter defendant premises unannounced to inspect, search, and seize infringing goods, machinery, and records to prevent evidence destruction.
   - *Mareva Injunction:* Asset-freezing order restraining defendant from disposing of or transferring assets out of court jurisdiction.
   - *John Doe / Ashok Kumar Order:* Injunction issued against unknown, unnamed infringers (e.g., rogue pirate websites or unknown counterfeit manufacturers).

2. *Damages or Account of Profits (Compensatory Relief):*
   - The plaintiff must *elect* between two mutually exclusive financial remedies:
     - *Damages:* Compensation for actual financial loss suffered due to diverted sales.
     - *Account of Profits:* Disgorgement of all net profits illegally earned by the infringer.

3. *Delivery-Up and Destruction:*
   Order directing the defendant to surrender all infringing labels, products, dies, blocks, and manufacturing equipment for destruction.

== Criminal and Administrative Remedies
- *Criminal Penalties under Copyright Act (Section 63):* Knowing infringement of copyright is a cognizable criminal offense punishable with imprisonment from *6 months to 3 years* and fines between *₹50,000 and ₹2 Lakh*.
- *Criminal Penalties under Trade Marks Act (Section 103/104):* Applying false trademarks or selling goods with false marks attracts 6 months to 3 years imprisonment and ₹50,000 to ₹2 Lakh fine.
- *Administrative Customs Enforcement:* Under the *Intellectual Property Rights (Imported Goods) Enforcement Rules, 2007*, IP owners can register rights with Indian Customs to intercept, detain, and confiscate counterfeit imports at border ports.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 15, 33, 58, pp. 173–208, 401–412, 583–598]]]

#v(8pt)

= Technology Transfer and Industry Collaboration

== University-Industry Technology Transfer Mechanisms
Modern engineering innovation relies heavily on technology transfer from academic research laboratories to commercial industry partners.

1. *Technology Transfer Offices (TTOs):* Dedicated university departments that evaluate lab inventions, manage patent prosecution, negotiate licensing contracts, and foster spinoff ventures.
2. *The Bayh-Dole Model (US 1980 / Global Standard):* Permits universities and research institutions to retain IP ownership generated from publicly funded government research grants, incentivizing researchers to commercialize technology rather than letting lab discoveries remain dormant.
3. *Sponsored Research & Collaborative Agreements:* Corporate entities fund specific academic R&D programs in exchange for pre-negotiated option rights to license resulting patents.

== Intellectual Property Valuation Methodologies
Determining the monetary value of an IP asset is required for licensing royalty calculations, corporate M&A, taxation, and venture capital equity financing.

#table(
  columns: (1.2fr, 2fr, 2fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 7pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Valuation Approach]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Core Valuation Principle]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Engineering Applicability & Limitations]*]
  ),
  [*Cost Approach*], [Valuation based on total cost incurred to re-create or replace the IP asset (R&D labor, testing, legal filing).], [Suitable for early-stage prototype tech; fails to capture future commercial earning potential.],
  [*Market Approach*], [Valuation based on comparable arm's-length market transactions of similar IP assets in the industry.], [Requires active public IP market data; difficult for breakthrough pioneer inventions with no comparables.],
  [*Income / DCF Approach*], [Present value of projected future net cash flows / royalty streams generated, discounted at a risk-adjusted discount rate.], [Gold standard for commercialized patents; highly sensitive to accurate market adoption projections.]
)

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 56, pp. 567–578] | #link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/deborah_e-_bouchoux_intellectual_property_the_lbookzz-org.pdf")[Source: Deborah E. Bouchoux, IP Law, Ch 16]]]

#v(8pt)

= IPR in Startups, Entrepreneurship and Innovation Ecosystem

== Strategic IP Management Practices for Engineering Startups
Startups operate in high-risk environments where intellectual property forms their primary valuation asset.
1. *IP Audit:* A systematic review and inventory of all proprietary assets (source code, hardware schematics, brand names, trade secrets) owned, licensed, or used by the startup to identify IP leakage or ownership gaps.
2. *Freedom to Operate (FTO) Search:* A clearance search conducted prior to commercial product launch to ensure that selling the startup's product will not infringe active third-party patents.
3. *Patent Landscape Analysis:* Mapping global competitor patent filings to identify technology trends, white spaces for new R&D, and potential litigation threats.

== Indian Government Initiatives & Startup Support Infrastructure
To foster indigenous innovation, the Government of India has instituted specialized statutory incentives for registered startups and educational institutions:

1. *SIPP Scheme (Scheme for Facilitating Start-ups Intellectual Property Protection):*
   - Government empanels IP Facilitators to assist startups in patent, trademark, and design filing.
   - The Central Government pays all professional facilitator fees directly; startups pay only basic statutory filing fees.
2. *80% Rebate in Patent Filing Fees:*
   - Startups, MSMEs, and educational institutions receive an *80% statutory fee reduction* for patent filing and prosecution compared to large corporate entities.
3. *Fast-Track / Expedited Examination (Form 18A):*
   - Startups can request expedited patent examination, reducing patent grant timelines from 48 months down to *6 to 12 months*.
4. *National IPR Policy (2016) & "Make in India":*
   - *Motto:* "Creative India; Innovative India".
   - Aligns Indian IP administration with global standards, accelerates examination backlogs, and promotes indigenous manufacturing under *Make in India*.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Intro, pp. 3–15]]]

#v(8pt)

= Basics of Patent Search and Practical Search Methodology

== Objectives and Classification of Patent Searches
Conducting a structured patent search is a mandatory step before filing a patent application or launching a new engineering product.

#figure-box(
  "Figure 3.1: Systematic Patent Search Methodology & Query Structuring Pipeline",
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
            #block(width: 100%, fill: rgb("#f1f5f9"), inset: 5pt, radius: 3pt, [*1. Define Concept*\ #text(size: 7.5pt)[Technical keywords & features]])
          ],
          [
            #block(width: 100%, fill: rgb("#e0f2fe"), inset: 5pt, radius: 3pt, [*2. Identify Class*\ #text(size: 7.5pt)[IPC / CPC System Codes]])
          ],
          [
            #block(width: 100%, fill: rgb("#fef3c7"), inset: 5pt, radius: 3pt, [*3. Query Syntax*\ #text(size: 7.5pt)[Boolean AND / OR / Wildcards]])
          ],
          [
            #block(width: 100%, fill: rgb("#dcfce7"), inset: 5pt, radius: 3pt, [*4. Prior Art Analysis*\ #text(size: 7.5pt)[Filter & Novelty Report]])
          ]
        )
      ]
    )
  ]
)

1. *Novelty / Patentability Search:* Conducted prior to filing a patent application to verify that the technical features are novel over worldwide prior art.
2. *Freedom to Operate (FTO) Search:* Conducted prior to launching a product in a specific country to identify active in-force patents that might be infringed.
3. *Patent Validity / Invalidity Search:* Conducted during patent litigation to find prior art that can invalidate a competitor's patent.
4. *State-of-the-Art / Landscape Search:* Comprehensive search analyzing patent trends in a technological field to guide long-term corporate R&D investment.

== Major Public Patent Databases
- *InPASS (Indian Patent Advanced Search System):* Official Indian Patent Office search portal (`ipindiaservices.gov.in/publicsearch`) supporting full-text, patentee, abstract, and IPC search across Indian patents.
- *Google Patents:* Global search engine (`patents.google.com`) indexing over 120 million patent documents from 100+ patent offices with machine translation.
- *WIPO PATENTSCOPE:* Global database (`patentscope.wipo.int`) accessing international PCT applications and national collections.
- *Espacenet:* European Patent Office portal (`worldwide.espacenet.com`) offering access to 140+ million patent documents worldwide.

== Boolean Operators and Search Query Construction
- *IPC / CPC Classification Codes:* Hierarchical classification system dividing technology into sections (e.g., `F` for Mechanical, `H` for Electricity, `G` for Physics).
- *Boolean Operators:* `AND` (combines concepts), `OR` (expands synonyms), `NOT` (excludes irrelevant terms).
- *Wildcards & Truncation:* Asterisk `*` matches multiple characters (e.g., `sens*` matches sensor, sensing, sensitive); Question mark `?` matches single character.

== Practical Patent Search Guidelines across Engineering Domains
The syllabus mandates practical understanding of patent searching in three specific engineering domains:

#table(
  columns: (1.2fr, 1.4fr, 2.4fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Engineering Domain]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[IPC / CPC Classification]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Constructed Search Query String]*]
  ),
  [*LED Technology*], [IPC: `F21K 9/00` (Light source with semiconductor units), `H01L 33/00` (Semiconductor LEDs)], [`("LED driver" OR "light emitting diode") AND ("current control" OR "thermal dissipation") AND IPC=(H01L33/* OR F21K9/*)`],
  [*Solar Inverter Systems*], [IPC: `H02M 7/00` (Conversion of AC/DC), `H02J 7/00` (Circuit arrangements for charging), `H01L 31/00`], [`("photovoltaic inverter" OR "solar inverter") AND ("MPPT" OR "maximum power point tracking") AND ("grid-tied" OR "grid-connected")`],
  [*EV Charging Infrastructure*], [IPC: `B60L 53/00` (Methods/equipment for charging electric road vehicles), `H02J 7/00`], [`("electric vehicle" OR "EV") AND ("fast charging" OR "inductive charging" OR "wireless power transfer") AND IPC=(B60L53/*)`]
)

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 47, pp. 515–525] | Indian Patent Office Manual]]

#v(8pt)

= Landmark Case Study: Natco Pharma Ltd. v. Bayer Corporation (2012 / 2014 IPAB / Bom HC)

The *Natco Pharma v. Bayer Corporation* case is India's first landmark case study on *Compulsory Licensing under Section 84* of the Patents Act, 1970.

== Background & Factual Matrix
1. *The Patentee (Bayer Corporation):* Bayer held Indian Patent No. 215758 for *Sorafenib Tosylate* (marketed under the brand name *Nexavar*), a life-saving targeted drug for advanced renal cell carcinoma (kidney cancer) and hepatocellular carcinoma (liver cancer).
2. *Monopoly Pricing and Importation:* Bayer imported Nexavar from Germany and priced it at *₹2,80,428 per month* (120 tablets for one month of treatment). Bayer satisfied less than 2% of total eligible Indian cancer patients.
3. *The Applicant (Natco Pharma Ltd.):* Natco, an Indian generic pharmaceutical manufacturer, approached Bayer for a voluntary license to manufacture the drug locally at *₹8,800 per month* (a 96% price reduction). Bayer flatly refused.
4. *Compulsory License Application:* Natco filed an application before the Controller General of Patents under *Section 84* of the Patents Act, 1970 for the grant of a compulsory license.

== Statutory Requirements under Section 84(1)
Under Section 84(1), any person can apply for a compulsory license after *3 years* from patent grant by proving any of three statutory grounds:
- *Sec 84(1)(a):* Reasonable requirements of the public have not been satisfied.
- *Sec 84(1)(b):* Patented invention is not available to the public at a reasonably affordable price.
- *Sec 84(1)(c):* Patented invention is not worked in the territory of India.

== Controller's Order and Legal Findings
On *March 9, 2012*, the Controller General of Patents granted India's *FIRST Compulsory License* to Natco Pharma, finding that Natco successfully proved all three statutory grounds:

1. *Public Requirements Not Met (Sec 84(1)(a)):* Bayer supplied the drug to only 2% of cancer patients, failing public demand.
2. *Unaffordable Monopoly Price (Sec 84(1)(b)):* A price of ₹2.80 Lakh/month was held to be exorbitant and not "reasonably affordable" to the Indian public.
3. *Not Worked in India (Sec 84(1)(c)):* Bayer imported 100% of the drug from Germany and did not manufacture it locally in India.

#alert("IMPORTANT", [
  *Terms of Compulsory License Granted to Natco:* \
  1. *Price Ceiling:* Natco permitted to sell generic Sorafenib Tosylate at *₹8,800 per month* (down from ₹2,80,428/month). \
  2. *Royalty Payment:* Natco directed to pay Bayer a *6% royalty* on net sales (increased to *7%* by IPAB on appeal). \
  3. *Non-Exclusive & Non-Assignable:* License was non-exclusive, non-transferable, and restricted to the Indian territory for the balance term of the patent.
])

== Appellate Confirmation & Public Policy Significance
- *IPAB & Bombay High Court Affirmation:* Bayer challenged the Controller's order before the Intellectual Property Appellate Board (IPAB in 2013) and the Bombay High Court Division Bench (2014). Both appellate bodies upheld the compulsory license, affirming that importation alone without local manufacturing justification failed Section 84.
- *Global Precedent under TRIPS Flexibilities:* Proved that developing nations can utilize *TRIPS Article 31 flexibilities* to issue compulsory licenses for life-saving technologies, ensuring public healthcare access without violating international IP law.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Ch 56, pp. 569–574 (PDF pp. 647–649)] | IPAB Order: 2013 (54) PTC 19 (IPAB)]]

#v(12pt)
#line(length: 100%, stroke: 1pt + accent-color)
#align(center)[#text(size: 9pt, fill: rgb("#64748b"), weight: "bold")[END OF UNIT 3 THEORY NOTES — IPR AND CYBER LAWS]]
