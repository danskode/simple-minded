---
name: gem-til-rendered
description: Gem det seneste svar som et struktureret dokument i rendered/. Brug dette når du vil gemme en forklaring eller et svar fra wikien til fremtidig reference.
disable-model-invocation: true
---

# Gem til rendered

Gem det seneste svar som et standalone-dokument i `rendered/`-mappen. Formatet skal være ensartet og læsbart uden for wiki-kontekst.

## Filnavn

Brug emnet som filnavn på dansk, med bindestreger i stedet for mellemrum, fx `hvad-er-sdd.md`. Spørg brugeren hvis du er i tvivl om filnavnet.

## Dokumentstruktur

Brug præcis denne struktur:

```markdown
# [Titel]

[En indledende beskrivelse på 1-3 afsnit — hvad er det, hvad er grundidéen]

## Opsummering

[De vigtigste punkter som en kort liste eller kort tekst — præcis hvad man skal huske]

## Konklusion

[1 afsnit: hvad betyder det i praksis, hvad skal man gøre med denne viden]

## Relaterede emner

- **[Emne]** — én sætning om sammenhængen
- **[Emne]** — én sætning om sammenhængen
```

## Regler

- Skriv på dansk
- Hold sproget direkte og uden unødig akademisk tunge — det er til praktisk brug
- Undgå [[wikilinks]] i det renderede dokument; brug almindelig fed tekst til emnenavne
- Ikke mere end 5 relaterede emner
- Gem filen med Write-værktøjet til `rendered/[filnavn].md`
- Bekræft filnavnet overfor brugeren når den er gemt
