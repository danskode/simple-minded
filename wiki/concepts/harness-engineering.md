---
type: concept
tags: [aidd, harness, agenter, ekte]
created: 2026-06-14
updated: 2026-06-14
source_count: 0
---
# Harness Engineering

## Definition
En agent er et **harness + en sprogmodel**. Sprogmodellen er en matematisk model,
der har lært statistiske mønstre i sprog. Harnesset er alt det, der styrer dens
inferens og rammer:

- **Kontekst og RAG** — hvad den slutter ud fra
- **Tools og MCP-servere** — hvad den kan gøre med kontekst og model
- **System prompt og regler** — hvilke regler den følger
- **Skills, slash commands, hooks, markdown-filer** (fx `claude.md`, `agents.md`)
  — guides den har til rådighed for at løse opgaver

## Hvorfor det betyder noget
Harnesset er der, hvor udvikleren sætter rammerne for den kunstige kollega: får
sin **intent** til udtryk, styrer konteksten og sikrer mod fejlfortolkninger.
Intent er det afgørende; harness er i dag løsningen.

## ekte
**ekte** er harnesset bygget ud fra AIDD-tankerne — et transparent
harness-engineering-læringsværktøj der demonstrerer AIDD i praksis. simple-minded
(denne wiki) er ekte's videnslager.

## Relateret
- [[concepts/aidd]]
- [[concepts/intent-specification]]
- [[concepts/fra-determinisme-til-probabilisme]]
