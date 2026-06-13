---
type: concept
tags: [aidd, idd, intent]
created: 2026-06-14
updated: 2026-06-14
source_count: 0
---
# Intent Specification

## Definition
At gøre det underforståede eksplicit, *før* agenten handler. En intent-spec er
en bevidst formning af den kontekst agenten læser, så den skaber den rigtige
forståelse i stedet for at udfylde huller arbitrært.

## Hvorfor det betyder noget
Alt hvad du ikke siger, udfylder agenten med antagelser. Det er her forkerte
resultater opstår. Intent specification flytter arbejdet fra at *rette* output
til at *forme* forståelsen på forhånd.

## Nøgleidéer
- Forståelse skabes hos modtageren (agenten), ikke i selve teksten — se
  [[concepts/sprog-som-konstruktion]].
- Det underforståede er farligt: uudtalte krav bliver til gæt (og dermed *abuse*,
  se [[concepts/to-slags-forkert]]).
- En god spec validerer sig selv: den efterlader så få huller som muligt. Test:
  giv den til en der ikke var i dit hoved, og find hvor agenten stadig må gætte.
- Intent er kildekoden; den genererede kode er det kompilerede artefakt.

## Relateret
- [[concepts/aidd]]
- [[concepts/sprog-som-konstruktion]]
- [[concepts/to-slags-forkert]]
- [[synthesis/intent-lineage]]
