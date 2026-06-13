---
type: concept
tags: [aidd, talehandlinger, fejl]
created: 2026-06-14
updated: 2026-06-14
source_count: 0
---
# To slags forkert

## Definition
I agentic engineering skifter fejlene karakter: fra logiske/syntaktiske fejl
(compile-fejl) til **fortolkningsfejl**. Austins talehandlingsteori giver to
slags forkert, når en talehandling mislykkes:

- **Misfire** — handlingen lykkes ikke; betingelserne for at den overhovedet kan
  udføres er ikke til stede.
- **Abuse** (misbrug) — handlingen lykkes på overfladen, men de oprigtige
  betingelser var ikke opfyldt. Resultatet "ser rigtigt ud", men er det ikke.

## Hvorfor det betyder noget
Agentens hallucinationer og *drift* er typisk **abuse**, ikke misfire: agenten
producerer kode der består de tests vi troede var nok, men som er misaligned med
det egentlige problem — ofte fordi vi forlod loopet og lod den udfylde det vi
ikke havde tænkt igennem. At kunne skelne de to slags forkert er at kunne
diagnosticere hvad der gik galt, og hvor.

## Nøgleidéer
- En talehandling siger noget om verden, og verden stiller betingelser for
  talehandlingen (vellykkethedsbetingelser hos Austin og Searle).
- "Done" der driver væk fra den der ejer intentionen, lader agenten afgøre "done"
  på dine vegne — en kilde til abuse.

## Relateret
- [[concepts/aidd]]
- [[concepts/sprog-som-konstruktion]]
- [[concepts/intent-specification]]
