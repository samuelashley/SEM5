// Typst Theory Notes - Intellectual Property Rights & Cyber Laws (Unit 4)
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
        align(left)[#text(size: 8pt, fill: accent-color, weight: "bold")[IPR & CYBER LAWS — UNIT 4]],
        align(right)[#text(size: 8pt, fill: rgb("#475569"))[Fundamentals of Cyber Laws]]
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
    "NOTE": (border: rgb("#b91c1c"), bg: rgb("#fef2f2")),
    "TIP": (border: rgb("#059669"), bg: rgb("#ecfdf5")),
    "IMPORTANT": (border: rgb("#1e293b"), bg: rgb("#f1f5f9")),
    "WARNING": (border: rgb("#b91c1c"), bg: rgb("#fef2f2")),
    "EXAMPLE": (border: rgb("#0284c7"), bg: rgb("#f0f9ff"))
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
  #text(size: 17pt, fill: text-color, weight: "bold")[UNIT 4: FUNDAMENTALS OF CYBER LAWS]
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
The following table outlines the exam-oriented curriculum mapping and priority weightage for Unit 4.

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
  [Introduction to Cyber Laws], [Need for cyber legal framework, borderless nature, e-commerce, UNCITRAL Model Law], [High (4–6 Marks)],
  [IT Act 2000 & Amendments], [Structure of IT Act 2000, 2008 Amendments (Sec 43A, 66A-F, 69, 79), Intermediary liability], [High (6–8 Marks)],
  [Digital Signatures & E-Gov], [Public-Private key PKI, hash functions, CCA, Electronic Signatures (Sec 3A), E-governance], [High (6–8 Marks)],
  [Taxonomy of Cyber-Crimes], [Hacking (Sec 43/66), Phishing (Sec 66D), Identity Theft (Sec 66C), Ransomware, Cyber Terrorism (66F)], [High (6–8 Marks)],
  [Cyber Laws in Engineering], [IoT security, SCADA/Smart Grid critical infrastructure, hardware sensor spoofing, SPDI Rules], [High (4–6 Marks)],
  [Landmark Case Studies], [*Shreya Singhal v. UOI* (Sec 66A invalidation) & *State of TN v. Suhas Katti* (Sec 67 conviction)], [High (6–8 Marks)]
)

#v(8pt)

= Introduction to Cyber Laws and Legal Frameworks

== Need for Cyber Laws in the Digital Age
Traditional legal systems (such as the Indian Penal Code, 1860) were codified to govern tangible, physical human behavior within fixed geographical borders. The rapid proliferation of digital computing, computer networks, and the global Internet introduced unprecedented legal challenges:

1. *Borderless Nature of Cyberspace:* Cyber transactions and digital communications operate across sovereign international boundaries in milliseconds, rendering traditional territorial jurisdiction obsolete.
2. *Speed, Scale, and Anonymity:* Digital crimes can be automated, target millions of users simultaneously, and execute behind proxy servers, spoofed IP addresses, and encrypted networks.
3. *Inadequacy of Paper-Based Laws:* Traditional laws mandated physical signatures, paper documents, and physical presence for valid contracts, hindering the growth of electronic commerce (*E-Commerce*) and digital governance.
4. *Protection of Electronic Assets:* Computer code, digital databases, cloud servers, and electronic funds required specialized statutory penal protection against unauthorized access, data theft, and malicious code.

== Legislative Origin: The UNCITRAL Model Law
In 1996, the *United Nations Commission on International Trade Law (UNCITRAL)* adopted the *UNCITRAL Model Law on Electronic Commerce*. It established the legal principle of *Functional Equivalence*—mandating that electronic records and electronic signatures be accorded the same legal recognition, validity, and enforceability as paper-based records and handwritten signatures.

India enacted the *Information Technology Act, 2000 (IT Act 2000)* on May 17, 2000 (effective October 17, 2000) based directly on the UNCITRAL Model Law, making India the 12th nation in the world to adopt a comprehensive cyber legal framework.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Intro, pp. 3–15] | UNCITRAL Model Law 1996]]

#v(8pt)

= The Information Technology Act, 2000 and 2008 Amendments

== Architecture and Objectives of the IT Act, 2000
The Information Technology Act, 2000 (Act No. 21 of 2000) provides legal recognition for electronic transactions, facilitates e-commerce, enables electronic filing with government agencies, and defines cyber offences and penalties.

*Primary Statutory Objectives:*
- Grant legal recognition to electronic records and digital signatures.
- Facilitate electronic governance (*E-Governance*) in government departments.
- Amend the Indian Penal Code 1860, Indian Evidence Act 1872, and Reserve Bank of India Act 1934 to admit electronic evidence.
- Establish a regulatory infrastructure for *Certifying Authorities (CA)* and Cyber Appellate Tribunals.

== Key Amendments under the IT (Amendment) Act, 2008
The 2008 Amendment (effective October 27, 2009) fundamentally modernized Indian cyber law to address emerging cyber security threats, data privacy, and technological neutrality:

1. *Technology-Neutral Electronic Signatures (Section 3A):* Expanded beyond asymmetric Public Key Infrastructure (PKI) to recognize alternative electronic signature techniques (e.g., Aadhaar e-Sign, e-KYC).
2. *Corporate Data Protection & Compensation (Section 43A):* Imposed strict compensation liability on body corporates handling Sensitive Personal Data or Information (*SPDI*) for negligence in implementing reasonable security practices.
3. *New Cyber Crime Penal Provisions (Sections 66A to 66F):* Inserted specific penal provisions covering identity theft (66C), cheating by personation (66D), privacy violation (66E), and cyber terrorism (66F).
4. *Lawful Interception & Decryption (Section 69):* Empowered Central and State Governments to intercept, monitor, or decrypt electronic information for national security and public order.
5. *Intermediary Liability & Safe Harbor Guidelines (Section 79):* Granted conditional immunity to network service providers, search engines, and web platforms (*intermediaries*) provided they act as passive conduits and comply with government notice-and-takedown directives.

#table(
  columns: (1.2fr, 1.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { accent-color } else if calc.odd(y) { accent-light } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Section]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Offence / Provision]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Statutory Mandate & Punishment]*]
  ),
  [*Section 43*], [Civil Computer Damage], [Penalty up to ₹1 Crore for unauthorized access, downloading, or virus insertion.],
  [*Section 43A*], [Corporate SPDI Negligence], [Body corporate liable to pay compensation to affected victims for data breach.],
  [*Section 66*], [Computer-Related Offence], [Hacking/dishonest computer acts: Imprisonment up to 3 years or fine up to ₹5 Lakh.],
  [*Section 66C*], [Identity Theft], [Fraudulent use of digital signature/password: Up to 3 years prison + ₹1 Lakh fine.],
  [*Section 66D*], [Cheating by Personation], [Phishing/impersonation using computer resource: Up to 3 years prison + ₹1 Lakh fine.],
  [*Section 66E*], [Privacy Violation], [Capturing/transmitting images of private body parts without consent: Up to 3 years prison.],
  [*Section 66F*], [Cyber Terrorism], [Disrupting critical infrastructure or threatening national security: *Life Imprisonment*.],
  [*Section 79*], [Intermediary Safe Harbor], [Exemption from liability for third-party content if due diligence observed.]
)

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Intro, pp. 3–15] | IT Act 2000 Bare Act]]

#v(8pt)

= Digital Signatures, Electronic Signatures and E-Governance

== Technical and Legal Framework of Digital Signatures
Under Section 2(1)(p) and Section 3 of the IT Act, a *Digital Signature* is an authentication of an electronic record using an *Asymmetric Crypto-system* and *Hash Function*.

#figure-box(
  "Figure 4.1: Public Key Infrastructure (PKI) Asymmetric Encryption & Hash Mechanism",
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
            #block(width: 100%, fill: rgb("#f1f5f9"), inset: 5pt, radius: 3pt, [*1. Raw Document*\ #text(size: 7.5pt)[Electronic Record]])
          ],
          [
            #block(width: 100%, fill: rgb("#e0f2fe"), inset: 5pt, radius: 3pt, [*2. Hash Function*\ #text(size: 7.5pt)[Fixed 256-bit Digest]])
          ],
          [
            #block(width: 100%, fill: rgb("#fef3c7"), inset: 5pt, radius: 3pt, [*3. Encrypt (Private Key)*\ #text(size: 7.5pt)[Digital Signature Created]])
          ],
          [
            #block(width: 100%, fill: rgb("#dcfce7"), inset: 5pt, radius: 3pt, [*4. Verify (Public Key)*\ #text(size: 7.5pt)[Authenticity Confirmed]])
          ]
        )
        #v(4pt)
        #text(size: 8pt, fill: rgb("#334155"))[*Core Security Guarantees:* Authentication | Data Integrity | Non-Repudiation]
      ]
    )
  ]
)

1. *Asymmetric Key Pair:*
   - *Private Key:* Known only to the signer; used to create the digital signature.
   - *Public Key:* Published in a Digital Signature Certificate (*DSC*); used by recipients to verify the signature.
2. *Hash Function (SHA-256):* Computes a unique, fixed-length mathematical fingerprint (*digest*) of the document. Any modification to the document alters the hash value, detecting tampering.
3. *Three Core Security Guarantees:*
   - *Authentication:* Verifies the signer's exact identity.
   - *Integrity:* Ensures document content has not been altered in transit.
   - *Non-Repudiation:* Signer cannot deny creating the signature.

== Certifying Authorities (CA) and Regulatory Infrastructure
Sections 17 to 34 govern the hierarchical Trust Architecture in India:
- *Controller of Certifying Authorities (CCA):* Top-level government authority under MeitY that licenses and regulates Certifying Authorities.
- *Licensed Certifying Authorities (CAs):* Commercial entities (e.g., *eMudhra, NSDL, C-DAC, Tata Communications*) authorized to issue Digital Signature Certificates (*DSC Class 1, Class 2, Class 3*) to citizens and enterprises.

== Legal Framework for E-Governance (Sections 4 to 10)
- *Section 4 (Legal Recognition of Electronic Records):* Mandates that where any law requires information to be in writing or printed form, electronic records satisfy the requirement.
- *Section 5 (Legal Recognition of Electronic Signatures):* Authenticated electronic signatures are legally equivalent to physical handwritten signatures.
- *Section 6 (E-Governance in Government Services):* Authorizes electronic filing of forms, applications, and issuance of government licenses, permits, and receipts.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Intro, pp. 3–15] | IT Act 2000, Ch 2–6]]

#v(8pt)

= Taxonomy of Cyber-Crimes and Statutory Offence Analysis

Cyber-crimes encompass unlawful acts where a computer, mobile device, or network serves as either the tool, the target, or the environment of the crime.

== Detailed Categorization of Cyber-Crimes under the IT Act
1. *Hacking and Unlawful Data Access (Section 43 & 66):*
   - *Mechanism:* Penetrating computer systems without authorization to alter, destroy, steal, or delete data/source code.
   - *Statutory Penalty:* Up to 3 years imprisonment and/or fine up to ₹5 Lakh.

2. *Phishing and Social Engineering Fraud (Section 66D):*
   - *Mechanism:* Deceptive spoofing of legitimate bank or enterprise web portals/emails to trick users into revealing sensitive credentials (passwords, PINs, OTPs).
   - *Statutory Provision:* Penalized under Section 66D as *cheating by personation using a computer resource*.

3. *Identity Theft (Section 66C):*
   - *Mechanism:* Fraudulent acquisition and unauthorized use of another person's digital signature, password, biometric identity, or unique identification feature.

4. *Ransomware & Malicious Software Attacks (Section 43 & 66):*
   - *Mechanism:* Deploying cryptographic malware (e.g., WannaCry, Ryuk) that encrypts system files, demanding cryptocurrency payment for decryption keys.
   - *Legal Categorization:* Unauthorized data encryption constitutes computer damage under Section 43/66; if targeting public utilities, it escalates to *Cyber Terrorism (Section 66F)*.

5. *Cyber Terrorism (Section 66F):*
   - *Trigger:* Acts committed with intent to threaten the unity, integrity, security, or sovereignty of India, or deny access to authorized personnel, or infect critical infrastructure (smart grids, defense networks, nuclear power controllers).
   - *Statutory Punishment:* Mandatory *Life Imprisonment*.

6. *Cyber Obscenity and Stalking (Sections 67, 67A, 67B):*
   - *Mechanism:* Transmitting or publishing sexually explicit content, child pornography, or engaging in online harassment/stalking.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Intro, pp. 3–15] | IT Act 2000, Ch 11]]

#v(8pt)

= Cyber Laws in Engineering Systems (IoT, Smart Grids & Critical Infrastructure)

Modern engineering deployments rely on *Cyber-Physical Systems (CPS)*, Industrial Control Systems (*ICS*), and the *Internet of Things (IoT)*. These architectures introduce unique cybersecurity vulnerabilities requiring statutory regulatory compliance.

== Internet of Things (IoT) Security and Privacy Compliance
IoT systems incorporate embedded microcontrollers, sensor arrays, and cloud telemetry endpoints.
- *Hardware Sensor Spoofing & Tampering:* Attackers inject malicious sensor data (e.g., spoofing temperature or pressure telemetry in industrial chemical plants). Penalized under Section 43/66 for introducing computer contaminants.
- *Data Privacy & SPDI Rules (Section 43A):* IoT vendors collecting personal health, location, or biometric data from consumer devices must comply with the *Information Technology (Reasonable Security Practices and Procedures and Sensitive Personal Data or Information) Rules, 2011*, requiring end-to-end encryption and strict access controls.

== Smart Grid & SCADA Critical Infrastructure Protection
Electrical power grids utilize *SCADA (Supervisory Control and Data Acquisition)* and smart meter networks.
- *Critical Information Infrastructure (CII - Section 70):* The Central Government notifies smart grid control centers as *Protected Systems* under Section 70. Unauthorized access to a protected system carries up to *10 years imprisonment*.
- *NCIIPC Role:* The *National Critical Information Infrastructure Protection Centre (NCIIPC)* acts as the national nodal agency for protecting smart grids, nuclear facilities, and banking networks against cyber warfare.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Intro, pp. 3–15] | MeitY SPDI Rules 2011]]

#v(8pt)

= Landmark Case Study 1: Shreya Singhal v. Union of India (2015) 5 SCC 1

The landmark judgment in *Shreya Singhal v. Union of India* is India's most significant constitutional case study on freedom of speech, cyber law, and statutory overbreadth.

== Background & Factual Matrix
1. *The Arrest Incident:* Following the death of a prominent political leader in Mumbai, two young women (Shaheen Dhada and Rinu Srinivasan) posted and liked a Facebook status questioning the voluntary shutdown of the city. Mumbai police arrested them under *Section 66A of the IT Act, 2000*.
2. *Public Interest Litigation (PIL):* Law student Shreya Singhal filed a PIL in the Supreme Court challenging the constitutional validity of Section 66A, alleging it violated the fundamental right to freedom of speech and expression under *Article 19(1)(a)* of the Constitution of India.

== Statutory Text of Section 66A
Section 66A criminalized sending any information through a computer resource that was:
_(a) grossly offensive or of a menacing character; or (b) known to be false, for the purpose of causing annoyance, inconvenience, danger, insult, injury, hatred or ill will..._ Punishment: Up to 3 years imprisonment.

== Key Supreme Court Holdings (Bench of Justice J. Chelameswar & Justice R.F. Nariman)
On *March 24, 2015*, the Supreme Court delivered a historic judgment:

1. *Unconstitutional Invalidation of Section 66A:*
   The Supreme Court struck down *Section 66A in its entirety* as unconstitutional.
2. *Doctrine of Vagueness and Overbreadth:*
   Terms like "grossly offensive", "annoyance", or "inconvenience" were undefined, open-ended, and vague. The Court held that a penal statute is unconstitutionally vague if an ordinary citizen cannot determine what acts are prohibited, leading to arbitrary police abuse and a *chilling effect* on free speech.
3. *Discussion/Advocacy vs. Incitement:*
   The Court established that speech can only be restricted under Article 19(2) if it reaches the clear threshold of *incitement to violence or public disorder*. Mere discussion or advocacy of an unpopular cause, even if annoying, is constitutionally protected.
4. *Upholding Section 69A & Section 79 Intermediary Guidelines:*
   - *Section 69A (Website Blocking):* Upheld because it contained strict procedural safeguards and committee review.
   - *Section 79 (Intermediary Liability):* Clarified that intermediaries (platforms) are required to take down content under Section 79(3)(b) *only upon receiving a formal court order or government directive*, not upon mere private complaints.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Intro, pp. 3–15] | Supreme Court Judgment: (2015) 5 SCC 1]]

#v(8pt)

= Landmark Case Study 2: State of Tamil Nadu v. Suhas Katti (2004 C.C. No. 4680/2004)

The *Suhas Katti* case is India's first landmark criminal conviction under *Section 67 of the IT Act, 2000*, establishing digital forensics procedures for cyber harassment.

== Background & Factual Matrix
1. *The Offence:* The accused, Suhas Katti, created a fake profile and posted obscene, defamatory messages about a divorced woman on an online Yahoo message group, including her phone number.
2. *Victim Harassment:* The victim received persistent harassing phone calls from strangers believing the online postings were genuine.
3. *Cyber Police Investigation:* The victim lodged a complaint with the Chennai Cyber Crime Cell. Police tracked IP addresses, obtained ISP login logs from Yahoo, seized the accused's computer hardware, and conducted digital forensic hashing to preserve evidence.

== Judicial Verdict and Legal Significance
On *November 5, 2004*, the Additional Chief Metropolitan Magistrate, Egmore, Chennai convicted Suhas Katti:
- *Statutory Conviction:* Guilty under *Section 67 of IT Act, 2000* (transmitting obscene content electronically) and Sections 469, 509 of the Indian Penal Code (IPC).
- *Sentence:* 2 years rigorous imprisonment and ₹500 fine under Sec 67 IT Act, alongside concurrent IPC sentences.
- *Precedential Value:* Demonstrated that electronic evidence (ISP logs, email headers, IP tracking) is fully admissible under Section 65B of the Indian Evidence Act, proving that cyber anonymity cannot shield online harassers from criminal conviction.

#v(4pt)
#align(right)[#text(size: 8pt, fill: rgb("#64748b"))[#link("file:///Users/ashley/Documents/SEM5/.studymaterial/ipr/law-relating-to-intellectual-property-rights-3rd_compress.pdf")[Source: V.K. Ahuja, Law Relating to IPR (3rd Ed.), Intro, pp. 3–15] | Magistrate Court Judgment: C.C. No. 4680/2004]]

#v(12pt)
#line(length: 100%, stroke: 1pt + accent-color)
#align(center)[#text(size: 9pt, fill: rgb("#64748b"), weight: "bold")[END OF UNIT 4 THEORY NOTES — IPR AND CYBER LAWS]]
