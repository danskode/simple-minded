---
type: synthesis
tags: [aidd, intent, spec]
created: 2026-06-14
updated: 2026-06-14
source_count: 0
---
# Intent-linjen: fra spec til AIDD

## Den røde tråd
En række forfattere bevæger sig væk fra rigide specifikationer og mod fokus på
*intent*. AIDD samler trådene og tilføjer et nuanceret sprogsyn.

| Bidrag | Person | Kerneidé (paraphraseret) |
|---|---|---|
| SDD / MDE | Fowler / Kent | Strukturér udviklingen via specifikationer — men kan blive for omfangsrig til at eksekvere på. |
| Intent Specification Language (ISL) | Marconi | Definér formelt *hvad* der skal ske frem for *hvordan*; arbejdsgang: Spec → Resolve → Generate → Lock → Audit. Kritik: falder selv i kanalmetaforens fælde. |
| Intent, Context, Expectations (ICE) / IDSD | Ahuja | En spec holder ikke af sig selv — nogen skal blive i loopet mens den kører. En *intent* har ønske, afgrænsninger, mislykkede/vellykkede scenarier og relationer. Test: giv den til en der ikke var i dit hoved og find hullerne. |
| Intent Driven Development (IDD) | Molinari | Vend forholdet om: 80% på constraints + verifikation, 20% til AI'ens implementering. Intent er kildekoden; koden er det kompilerede artefakt. Mennesket ejer de rigide strukturer. |
| Intent Architect | Santos | Udviklerens vigtigste rolle bliver at definere intentioner, grænser og kvalitetskriterier — brief (goal, non-goals, constraints, interfaces, acceptance checks) + review. |
| **AIDD** | (ekte) | Architecture of Intent-Driven Development: kombinerer ovenstående med psykologi, talehandlingsteori og kanalmetaforens sammenbrud. Se [[concepts/aidd]]. |

## Hvad AIDD tilføjer
De øvrige bidrag beskriver *hvad* man skal gøre (eksternalisér intent, bliv i
loopet, ejer de rigide strukturer). AIDD tilføjer *hvorfor* det virker — via
[[concepts/sprog-som-konstruktion]] og [[concepts/to-slags-forkert]] — og *hvor*
man gør det: i harnesset, se [[concepts/harness-engineering]].

## Relateret
- [[concepts/aidd]]
- [[concepts/intent-specification]]
