# simple-minded — videnslager til ekte

Et agnostisk template til en LLM-vedligeholdt wiki — videnslageret bag
[ekte](https://github.com/danskode/ekte), den personlige AI developer harness.

Du kuraterer kilderne; agenten gør bogføringen: opsummerer, krydshenviser, filer
og holder siderne aktuelle. **Wikien er artefaktet. Chatten er forgængelig.** Er
noget værd at vide, bor det på en wiki-side — ikke i en samtale der forsvinder.

I modsætning til RAG, hvor man henter tekststumper on demand, bygger denne wiki
persistente, krydshenviste sider der bliver rigere for hver kilde du tilføjer.

## Agnostisk

Repoet er rene data: markdown-sider + et indeks + et lille søgeskript. Det er
**ekte** (med den LLM/agent du har valgt) der forbruger og vedligeholder wikien —
intet her er bundet til en bestemt model eller et bestemt værktøj. Der er ingen
`CLAUDE.md`: ekte er styringen, og driften sker via ekte og `wiki-maintainer`-skill'en.

## Opsætning via ekte

```bash
ekte init          # vælg "wiki" → simple-minded klones som dit videnslager
```

Under opsætningen kan du tilvælge **standard AIDD-indhold** (færdige wiki-sider om
AIDD) — det ligger på `aidd`-branchen. Vælger du fra, får du et tomt template på
`main`.

## Brug i ekte

| Handling | Hvordan |
|---|---|
| Slå op | `/wiki "spørgsmål"` — ekte finder relevante sider og syntetiserer et svar |
| Gem et svar som side | `/wiki-gem <titel>` |
| Ingest, gap-analyse, lint | aktivér `wiki-maintainer`-skill'en (auto-installeres når du tilvælger wiki) |

`wiki-maintainer` bærer drifts-viden (hvordan man ingester en kilde, finder huller
mellem klynger og holder wikien sund). Den er obligatorisk når wiki er tilvalgt.

## Mappestruktur

```
wiki-root/
├── README.md              ← denne fil
├── wiki/
│   ├── index.md           ← masterkatalog (læses først ved opslag)
│   ├── log.md             ← append-only driftslog
│   ├── overview.md        ← levende syntese af emnet
│   ├── concepts/          ← kernebegreber
│   ├── patterns/          ← mønstre og frameworks
│   ├── models/            ← modeller og formelle strukturer
│   ├── tools/             ← værktøjer og metoder
│   ├── papers/            ← kilde-opsummeringer
│   ├── people/            ← nøglepersoner
│   ├── synthesis/         ← tværgående analyse
│   ├── connections/       ← bro-sider mellem begrebsklynger
│   └── questions/         ← åbne spørgsmål fra gap-analyse
├── raw/                   ← dine kildefiler (ukrænkelige)
├── rendered/              ← selvstændige output-dokumenter
└── tools/
    └── search.sh          ← nøgleordssøgning på tværs af wiki/
```

**`raw/` er ukrænkelig.** Ret aldrig filer der — de er kilden som siderne udledes
fra. Vil du annotere en kilde, gør det på wiki-siden.

## Side-skema

Hver side starter med YAML-frontmatter (samme felter som ekte genererer ved
`/wiki-gem`):

```yaml
---
type: concept | pattern | model | tool | paper | person | synthesis | connection | question
tags: [tag1, tag2]
created: YYYY-MM-DD
updated: YYYY-MM-DD
source_count: 0
---
```

Krydshenvis med wikilinks: `[[concepts/side-navn]]`. Marker modsigelser med
`> **⚠ Modsigelse med [[side]]:** forklaring`.
