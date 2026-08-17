// Typst Playlist Mapping & Exam Guide - Theory of Computation
// Course Code: PCC-303-ITT | SPPU TE IT 2024 Pattern

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[THEORY OF COMPUTATION — PLAYLIST MAPPING]],
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
      align(left)[#text(size: 8pt, fill: rgb("#0f172a"), weight: "bold")[SPPU TE IT (2024 Pattern)] #text(size: 8pt, fill: rgb("#64748b"))[ | PCC-303-ITT]],
      align(right)[#text(size: 8pt, fill: rgb("#64748b"))[Page #counter(page).display() of #counter(page).final().first()]]
    )
  }
)

#set text(
  font: "Helvetica",
  size: 9.5pt,
  fill: rgb("#0f172a") // Deep high-contrast dark text
)

#set par(
  justify: true,
  leading: 0.65em
)

#set heading(numbering: none)

// Styling headings - Option 5: Dark Slate & Steel Scheme
#show heading: set text(fill: rgb("#0f172a"))
#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (left: 4pt + rgb("#1e293b")), // Dark Slate Accent
  inset: (left: 10pt, y: 7pt),
  fill: rgb("#f1f5f9"), // Soft Slate background
  radius: (right: 4pt),
  text(fill: rgb("#0f172a"), size: 12.5pt, weight: "bold")[#it.body]
)

#show heading.where(level: 2): it => block(
  width: 100%,
  inset: (y: 5pt),
  text(fill: rgb("#334155"), size: 11pt, weight: "bold")[#it.body]
)

// Custom Alert block - Dark Slate & Steel High Contrast
#let alert(type, content) = {
  let colors = (
    "NOTE": (border: rgb("#1e293b"), bg: rgb("#f1f5f9")),
    "TIP": (border: rgb("#059669"), bg: rgb("#ecfdf5")),
    "IMPORTANT": (border: rgb("#0f172a"), bg: rgb("#e2e8f0")),
    "WARNING": (border: rgb("#b91c1c"), bg: rgb("#fef2f2"))
  )
  let c = colors.at(type, default: (border: rgb("#1e293b"), bg: rgb("#f1f5f9")))
  
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

// Title Header Page 1
#align(left)[
  #text(size: 9pt, fill: rgb("#334155"), weight: "bold")[THEORY OF COMPUTATION (TE IT - 2024 Pattern)] \
  #v(2pt)
  #text(size: 17pt, fill: rgb("#0f172a"), weight: "bold")[GATE SMASHERS PLAYLIST EXAM MAPPING]
]

#v(6pt)
#rect(
  width: 100%,
  stroke: 1pt + rgb("#1e293b"),
  fill: rgb("#f1f5f9"),
  radius: 4pt,
  inset: 9pt,
  [
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 7pt,
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Pattern:] TE IT - 2024 Pattern (SPPU)],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Academic Term:] Semester V (2026)],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Playlist Channel:] Gate Smashers (YouTube)],
      [#text(weight: "bold", fill: rgb("#0f172a"))[Course Code:] PCC-303-ITT]
    )
  ]
)

#v(6pt)
#line(length: 100%, stroke: 1.5pt + rgb("#1e293b"))
#v(6pt)

#alert("NOTE", [
  *How to Use This Mapping:* This document aligns the complete Gate Smashers Theory of Computation (TOC) YouTube playlist into the five core syllabus units of Savitribai Phule Pune University (SPPU).
  
  *Exam Preparation Note:* Lectures highlighted in *bold* represent high-priority exam topics explicitly tested in SPPU end-semester examinations and fully detailed in the unit-wise theory notes (e.g., DFA Construction, Minimization, NFA to DFA, Epsilon NFA, Moore & Mealy Machines, Arden's Theorem, Closure Properties, CFG Derivation Trees, Pushdown Automata, Turing Machines, and Decidability).
])

#v(4pt)
#rect(
  width: 100%,
  stroke: 0.5pt + rgb("#cbd5e1"),
  fill: rgb("#f8fafc"),
  inset: 8pt,
  radius: 4pt,
  [
    #text(weight: "bold", fill: rgb("#1e293b"))[Quick Statistics:] \
    - *Total Playlist Videos Extracted:* 68 (Total Duration: 10h 35m)
    - *Unit 1 (Finite Automata):* 27 Videos (4h 06m)
    - *Unit 2 (Regular Expressions & Languages):* 14 Videos (2h 02m)
    - *Unit 3 (Context-Free Grammars & Languages):* 13 Videos (1h 53m)
    - *Unit 4 (Pushdown Automata & Turing Machines):* 9 Videos (1h 29m)
    - *Unit 5 (Decidability & Computational Complexity):* 5 Videos (1h 03m)
  ]
)

#v(8pt)

// ==========================================
// UNIT 1
// ==========================================
= Unit 1: Finite Automata (4h 06m)
_Syllabus Topics Covered: Symbols, Alphabet, Strings, Formal Languages, DFA Construction, Transition Tables/Diagrams, Extended Transition Function, DFA Minimization, NFA, $epsilon$-NFA, Conversions ($epsilon$-NFA $-->$ NFA $-->$ DFA), Moore & Mealy Machines, Inter-conversions._

#table(
  columns: (3.5fr, 1.2fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#1e293b") } else if calc.odd(y) { rgb("#f1f5f9") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [Lec-1: Syllabus of TOC for GATE / NET / Imp Points], [6:03], [#link("https://www.youtube.com/watch?v=XslI8h7cGDs&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-2: Introduction to TOC | What is Language in TOC*], [12:21], [#link("https://www.youtube.com/watch?v=V19S3Mqfrzo&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [Lec-3: What is Automata in TOC | Theory of Computation], [5:18], [#link("https://www.youtube.com/watch?v=aoUEXRlvmxc&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-4: Power of Sigma $Sigma$ in TOC | Kleene closure*], [8:31], [#link("https://www.youtube.com/watch?v=4Q2rE6R31GU&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [Lec-5: What is Grammar in TOC | Must Watch], [11:08], [#link("https://www.youtube.com/watch?v=5Jd54dxQ1_Q&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-6: What is DFA in TOC with examples*], [13:14], [#link("https://www.youtube.com/watch?v=CiXJnosT0UE&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-7: DFA Example 1 | How to Construct DFA*], [8:12], [#link("https://www.youtube.com/watch?v=vsEKN2f22bE&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-8: DFA Example 2 | Strings ending with 'a'*], [5:51], [#link("https://www.youtube.com/watch?v=cEX7V3c2CWc&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-9: DFA starting with 'a' and ending with 'b'*], [8:34], [#link("https://www.youtube.com/watch?v=v9IwDI0GtpE&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-10: DFA Not starting with 'a' OR Not ending with 'b'*], [7:24], [#link("https://www.youtube.com/watch?v=gUeh54lmlik&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-11: DFA of binary strings divisible by 3*], [7:26], [#link("https://www.youtube.com/watch?v=o04gL2iIflY&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-12: DFA 2nd symbol '0' and 4th symbol '1'*], [7:19], [#link("https://www.youtube.com/watch?v=CqHj4wV5s68&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-13: DFA for Even a and Even b | Combination cases*], [9:35], [#link("https://www.youtube.com/watch?v=8Vz9XpL1XbE&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-14: Equivalence of DFA with examples*], [8:51], [#link("https://www.youtube.com/watch?v=yYJ4wT08y_4&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-15: Minimization of DFA with example*], [17:00], [#link("https://www.youtube.com/watch?v=0XaGAkY09Wc&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [Lec-16: Limitations and Applications of DFA], [12:40], [#link("https://www.youtube.com/watch?v=EX4tL2XN098&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-17: What is NFA in TOC | Nondeterministic Automata*], [9:01], [#link("https://www.youtube.com/watch?v=e_3G60N_Yp0&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-18: Design NFA where 2nd last bit is 1*], [6:09], [#link("https://www.youtube.com/watch?v=wXvO3hW2_6E&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-19: DFA vs NFA with examples*], [7:57], [#link("https://www.youtube.com/watch?v=b4S45O3N8r8&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-20: Convert NFA to DFA with example*], [9:37], [#link("https://www.youtube.com/watch?v=i-S69eE_1x0&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-21: Epsilon NFA Formal Definition ($epsilon$-NFA)*], [7:55], [#link("https://www.youtube.com/watch?v=7c_G4w5O98Y&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-22: Eliminate Epsilon moves ($epsilon$-NFA to NFA)*], [7:40], [#link("https://www.youtube.com/watch?v=ZCzOfjmp7Bw&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-23: Conversion from Epsilon $epsilon$-NFA to DFA*], [10:46], [#link("https://www.youtube.com/watch?v=K2qy4af98ys&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-24: Moore Machine in TOC with example*], [9:51], [#link("https://www.youtube.com/watch?v=h4v7x0IMhtI&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-25: Mealy Machine in TOC Formal Definition*], [7:45], [#link("https://www.youtube.com/watch?v=_88FzOc9GzA&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-26: Difference between Mealy and Moore Machine*], [7:55], [#link("https://www.youtube.com/watch?v=kikut5SJVTE&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-27: Moore to Mealy Conversion with example*], [8:46], [#link("https://www.youtube.com/watch?v=JM_xEXqYUgI&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-28: Mealy to Moore Conversion with Example*], [12:11], [#link("https://www.youtube.com/watch?v=MsYkgGHR93s&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]]
)

#v(10pt)

// ==========================================
// UNIT 2
// ==========================================
= Unit 2: Regular Expressions and Languages (2h 02m)
_Syllabus Topics Covered: Definition and Identities of RE, Operators of RE, RE to FA conversion (Thompson's construction), Arden's Theorem & Proof, FA to RE conversion, Closure properties of RLs, Applications of RE._

#table(
  columns: (3.5fr, 1.2fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#1e293b") } else if calc.odd(y) { rgb("#f1f5f9") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [*Lec-29: Regular Expressions in TOC with examples*], [9:59], [#link("https://www.youtube.com/watch?v=_gazATZF0R8&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-30: Regular Expressions for Finite Languages*], [8:29], [#link("https://www.youtube.com/watch?v=rjG5LwbqAp4&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-31: Regular Expressions for Infinite Languages*], [13:46], [#link("https://www.youtube.com/watch?v=QddGS_Revb4&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [Lec-32: Important Questions on Regular Expressions], [5:51], [#link("https://www.youtube.com/watch?v=BGBZF8isXZc&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-33: Pumping Lemma for regular languages*], [12:00], [#link("https://www.youtube.com/watch?v=XrPxNI1qQdY&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-34: Closure properties of regular languages*], [9:33], [#link("https://www.youtube.com/watch?v=WdmbZnUesRw&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [Lec-35: Quotient operation in TOC with example], [9:52], [#link("https://www.youtube.com/watch?v=2k8r4HGdxBw&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [Lec-36: Reversal Operation in TOC], [6:28], [#link("https://www.youtube.com/watch?v=U2N1_O-CFts&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [Lec-37: INIT Operation in TOC], [5:50], [#link("https://www.youtube.com/watch?v=Rz3AGScgtMs&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [Lec-38: Regular languages Not Closed under Infinite Union], [3:06], [#link("https://www.youtube.com/watch?v=V8fejrQkfzw&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-39: Closure Properties Of Various Languages*], [12:33], [#link("https://www.youtube.com/watch?v=tJTp4mfyTQ8&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [Lec-40: Languages, Automata, Grammars Comparison], [12:21], [#link("https://www.youtube.com/watch?v=whJio_5kehM&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-41: Homomorphism in Regular Languages*], [5:32], [#link("https://www.youtube.com/watch?v=EoQUZrdlnic&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-42: Inverse Homomorphism in Regular Languages*], [7:13], [#link("https://www.youtube.com/watch?v=Q-HAP2Ade8I&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]]
)

#v(10pt)

// ==========================================
// UNIT 3
// ==========================================
= Unit 3: Context-Free Grammars and Languages (1h 53m)
_Syllabus Topics Covered: Chomsky Hierarchy, Regular Grammars (RG, LLG, RLG), Conversions (LLG $arrow.l.r$ RLG, RG $arrow.l.r$ FA), Context-Free Grammar (CFG) Definition, Derivation/Parse Trees, Leftmost/Rightmost Derivations, Ambiguity, CFG Simplification, CYK Algorithm._

#table(
  columns: (3.5fr, 1.2fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#1e293b") } else if calc.odd(y) { rgb("#f1f5f9") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [*Lec-43: CFL and CFG Introduction & Syllabus*], [4:03], [#link("https://www.youtube.com/watch?v=vah_mUPXBbc&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-44: Closure Properties of CFL*], [8:57], [#link("https://www.youtube.com/watch?v=78K913GS8U4&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [Lec-45: Questions on DCFL and CFL], [11:05], [#link("https://www.youtube.com/watch?v=0KsU-gavbE4&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-46: What is Context Free Grammar (CFG)*], [7:57], [#link("https://www.youtube.com/watch?v=PbufibPLiYQ&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-47: Convert CFL to CFG with examples*], [15:00], [#link("https://www.youtube.com/watch?v=SlSA9vEXCm4&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-48: Derivation Tree / Parse Tree with example*], [6:33], [#link("https://www.youtube.com/watch?v=eDAOxyZkl68&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-49: Left Most & Right Most Derivation in CFG*], [6:22], [#link("https://www.youtube.com/watch?v=nUVmsW68K0Y&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-50: Ambiguous vs Unambiguous Grammar*], [9:30], [#link("https://www.youtube.com/watch?v=kFJaUtkn9wo&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [Lec-51: Recursive vs Non-Recursive CFG], [5:44], [#link("https://www.youtube.com/watch?v=Ov1N3UJEe28&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-52: Remove Unit Production from CFG*], [7:10], [#link("https://www.youtube.com/watch?v=Yw8MbMhstZg&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-53: Remove Null Production from CFG*], [7:48], [#link("https://www.youtube.com/watch?v=BLt4pJRBZdA&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-54: CYK Algorithm | Membership Algorithm in CFG*], [17:00], [#link("https://www.youtube.com/watch?v=glVl5IGf8LI&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-55: CNF vs GNF | Normal Forms for CFG*], [6:33], [#link("https://www.youtube.com/watch?v=xRMn6HK84io&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]]
)

#v(10pt)

// ==========================================
// UNIT 4
// ==========================================
= Unit 4: Pushdown Automata and Turing Machines (1h 29m)
_Syllabus Topics Covered: Formal Definition of PDA, Instantaneous Description (ID), Acceptance by Final State vs Empty Stack, Design of PDA, Equivalence of CFG and PDA, Turing Machine (TM) Formal Definition, IDs, Language Acceptance, Design of TM, TM Variants, Multi-Tape TM, Universal Turing Machine._

#table(
  columns: (3.5fr, 1.2fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#1e293b") } else if calc.odd(y) { rgb("#f1f5f9") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [*Lec-56: What is Pushdown Automata in TOC*], [10:58], [#link("https://www.youtube.com/watch?v=iL6YrS_f1YM&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-57: Design PDA for $0^n 1^{2n}$ CFL Language*], [13:13], [#link("https://www.youtube.com/watch?v=7lcwlNNCP1E&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-58: Design PDA for $\{w \mid n_a(w) = n_b(w)\}$*], [11:25], [#link("https://www.youtube.com/watch?v=fc7wLWiDNBM&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [Lec-59: What is Linear Bounded Automata (LBA)], [4:37], [#link("https://www.youtube.com/watch?v=0OgKbFx3mH0&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-60: Introduction to Turing Machine Definition*], [9:03], [#link("https://www.youtube.com/watch?v=741ccLNycnA&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-61: Design Turing Machine for $a^n b^n$*], [11:56], [#link("https://www.youtube.com/watch?v=LE_7krgRGt8&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-62: Design Turing Machine for $a^n b^n c^n$*], [11:18], [#link("https://www.youtube.com/watch?v=QuMscaeIRCo&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-63: Turing Machine for 1's Complement*], [8:06], [#link("https://www.youtube.com/watch?v=ast_i508wmk&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-64: Modifications and Variants in Turing Machine*], [9:20], [#link("https://www.youtube.com/watch?v=1z7l6UkSjxk&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]]
)

#v(10pt)

// ==========================================
// UNIT 5
// ==========================================
= Unit 5: Decidability and Computational Complexity (1h 03m)
_Syllabus Topics Covered: Church-Turing Thesis, Recursive vs Recursively Enumerable Languages, Decidable Problems for Regular & CFL, Undecidability, Halting Problem, Pumping Lemma applications, Computational Complexity (P, NP, NP-Complete, NP-Hard, SAT, Cook's Theorem, Node Cover)._

#table(
  columns: (3.5fr, 1.2fr, 1fr),
  fill: (x, y) => if y == 0 { rgb("#1e293b") } else if calc.odd(y) { rgb("#f1f5f9") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 6pt,
  align: horizon + left,
  table.header(
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Lecture Topic / Title]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Duration]*],
    [*#text(fill: rgb("#ffffff"), weight: "bold")[Watch Link]*]
  ),
  [*Lec-65: Recursive vs Recursive Enumerable Languages*], [6:56], [#link("https://www.youtube.com/watch?v=gm3ootzBNDw&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-66: Decidability & Undecidability Table in TOC*], [7:57], [#link("https://www.youtube.com/watch?v=oCBi3g0N358&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-67: Important Questions on Decidability & Closure*], [8:38], [#link("https://www.youtube.com/watch?v=FvqG9RQWIQc&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-68: TOC Most Imp 10 Questions Part 1*], [31:00], [#link("https://www.youtube.com/watch?v=VcKBVdoumQw&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]],
  [*Lec-69: TOC Most Imp 10 Questions Part 2*], [8:55], [#link("https://www.youtube.com/watch?v=EnZOhbg3KbY&list=PLxCzCOWd7aiFM9Lj5G9G_76adtyb4ef7i")[Play ↗]]
)

#v(16pt)

#line(length: 100%, stroke: 1.5pt + rgb("#1e293b"))
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: rgb("#64748b"), style: "italic")[
    End of Theory of Computation Gate Smashers Playlist Mapping — SPPU TE IT 2024 Pattern
  ]
]
