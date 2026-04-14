# [TOPIC] Wiki — Schema & Maintainer Instructions

You are the maintainer of a personal knowledge base on [TOPIC]. This document is your operating manual. Read it at the start of every session.

---

## What This Wiki Is

A persistent, compounding knowledge base. You maintain it. The human curates sources and asks questions. You do all the bookkeeping: summarizing, cross-referencing, filing, and keeping pages current.

The wiki is the artifact. Chat history is disposable. If something is worth knowing, it lives in a wiki page.

---

## Directory Layout

```
wiki-root/
├── CLAUDE.md              ← this file
├── wiki/
│   ├── index.md           ← master catalog (read first on every query)
│   ├── log.md             ← append-only ops log
│   ├── overview.md        ← living synthesis of the subject
│   ├── concepts/          ← core concepts
│   ├── patterns/          ← recurring patterns or frameworks
│   ├── models/            ← models, systems, or formal structures
│   ├── tools/             ← tools, software, or methods
│   ├── papers/            ← source summaries (articles, papers, transcripts)
│   ├── people/            ← key people
│   ├── synthesis/         ← cross-cutting analysis and comparisons
│   ├── connections/       ← bridge pages linking concepts across clusters
│   └── questions/         ← open questions from gap analysis
└── raw/
    └── [subdirs]/         ← immutable source files, configured by /start-new-wiki
```

**Raw sources are immutable.** Never modify files under `raw/`. They are the source of truth.

---

## Frontmatter Schema

Every wiki page must begin with this YAML frontmatter:

```yaml
---
type: concept | pattern | model | tool | paper | person | synthesis | connection | question
tags: [tag1, tag2]
created: YYYY-MM-DD
updated: YYYY-MM-DD
source_count: 0
---
```

- `type` must be one of: `concept | pattern | model | tool | paper | person | synthesis | connection | question`
- `tags` should use the taxonomy categories below
- `source_count` increments each time a new source informs this page
- Update `updated` whenever the page changes

---

## Page Templates

### Concept (`concepts/`)
```markdown
---
type: concept
tags: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
source_count: 0
---
# Concept Name

## Definition
One clear paragraph.

## Why It Matters
Relevance to the subject.

## Key Ideas
- 

## Nuances & Caveats
- 

## Open Questions
- 

## Related
- [[concepts/related]]
- [[patterns/related]]

## Sources
- [[raw/articles/filename]] — one-line summary
```

### Pattern (`patterns/`)
```markdown
---
type: pattern
tags: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
source_count: 0
---
# Pattern Name

## Intent
What problem this solves.

## Structure
How it works — steps or diagram description.

## When to Use
Conditions where this pattern fits.

## Trade-offs
Pros and cons.

## Examples in Practice
Real implementations or use cases.

## Contradictions & Debates
Where sources disagree on this pattern.

## Related
- [[patterns/related]]
- [[concepts/related]]

## Sources
```

### Model (`models/`)
```markdown
---
type: model
tags: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
source_count: 0
---
# Model Name

## Overview
What it is, key characteristics.

## Structure
Known structural details.

## Strengths
## Limitations
## Compared To
- [[models/other-model]]

## Sources
```

### Tool (`tools/`)
```markdown
---
type: tool
tags: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
source_count: 0
---
# Tool Name

## What It Is
One paragraph.

## Key Capabilities
- 

## When to Use
## When Not to Use
## Compared To
- [[tools/other-tool]] — key difference

## Limitations & Gotchas
## Sources
```

### Paper (`papers/`)
```markdown
---
type: paper
tags: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
source_count: 1
---
# Source Title (Author, Year)

## Core Claim
One sentence.

## Key Findings
- 

## Methodology
## Limitations Acknowledged
## How It Updates the Wiki
Which pages were updated after ingesting this.

## Contradicts
- [[papers/other-paper]] — what specifically conflicts

## Source
- [[raw/articles/filename]]
```

### Person (`people/`)
```markdown
---
type: person
tags: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
source_count: 0
---
# Full Name

## Role & Affiliation
## Key Contributions
- 
## Key Ideas They Champion
- [[concepts/related]]

## Notable Works
## Sources
```

### Connection (`connections/`)
```markdown
---
type: connection
tags: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
clusters: [cluster-a, cluster-b]
---
# Bridge: [Concept A] × [Concept B]

## The Gap
Why these two concept clusters are not naturally connected — what makes them feel like different domains.

## The Bridge
The insight or mechanism that links them. What becomes visible when you look at both simultaneously.

## Novel Questions It Opens
- 
- 

## Related
- [[concepts/...]]
- [[concepts/...]]
```

### Question (`questions/`)
```markdown
---
type: question
tags: []
created: YYYY-MM-DD
status: open   # open | exploring | answered
---
# Question: [One-sentence research question]

## Origin
Which gap or connection page prompted this question.

## What We Know
Relevant wiki knowledge that bears on this question.

## What's Missing
The specific gap — what evidence, concept, or experiment would answer this.

## Related
- [[connections/...]]
- [[concepts/...]]
```

---

## Operations

### INGEST — when user says "ingest [source]"

1. **Read** the source file in `raw/`
2. **Brief the user** — 3-5 bullet summary + flag anything surprising or contradictory
3. **Write** a summary page under `wiki/papers/` or a named page under `wiki/` matching the source type
4. **Update** all relevant concept, pattern, model, tool, and people pages:
   - Add source to `## Sources` section
   - Increment `source_count` in frontmatter
   - Update `updated` date
   - Note any contradictions with `> **⚠ Contradiction with [[page]]:** description`
   - Strengthen claims that are now confirmed by multiple sources
   - Check if the source bridges two previously disconnected concept clusters → if so, create a `connections/` page
5. **Update housekeeping:**
   - Add new pages to `wiki/index.md` under the correct category
   - Update `wiki/overview.md` if the source shifts the overall picture
   - Append to `wiki/log.md`: `## [YYYY-MM-DD] ingest | Source Title`

A single source typically touches 5–15 wiki pages. Do not cut corners on cross-referencing.

### QUERY — when user asks a question

1. Read `wiki/index.md` to identify relevant pages
2. Run `./tools/search.sh "keywords"` for broader keyword search if needed
3. Read the relevant pages
4. Synthesize a response with `[[page]]` citations inline
5. **File back:** if the answer represents new synthesis, create or update a wiki page. Good answers should not disappear into chat history.

### GAP ANALYSIS — when user says "gap analysis" or "what am I missing?"

1. Read `wiki/index.md` to enumerate all pages
2. Group pages into clusters by shared tags and cross-links
3. Identify cluster pairs with few or no connections (good gap: ≥3 pages each, ≤1 shared link)
4. For each significant gap: ask "what insight would bridge these two clusters?"
5. Create a `connections/bridge-name.md` page for each meaningful bridge found
6. Create `questions/question-name.md` for any novel research questions the bridge surfaces
7. Update `index.md` (add entries under Connections and Questions) and `log.md`

**What makes a good gap:** Two well-developed clusters that rarely cite each other.

**Why synthesis pages are legitimate:**
The wiki's advantage over RAG is that it can hold insights which only emerge from reading multiple sources *together* — no single raw file contains them. A connections page captures exactly this kind of compiled insight.

A synthesis page (`connection` or `question`) is only valid if it meets all three criteria:
1. It connects at least two wiki pages that each have raw sources behind them
2. The insight is non-obvious — not just "these things are related" but specifically *how* and *why*
3. It is clearly typed (`type: connection` or `type: question`) so it is distinguishable from source-backed pages

### LINT — when user says "lint the wiki"

Check for and report:
- [ ] Contradictions between pages
- [ ] Stale claims superseded by newer sources
- [ ] Orphan pages (no inbound links from index or other pages)
- [ ] Concepts mentioned inline without their own page
- [ ] Missing cross-references between pages that should link
- [ ] Pages with `source_count: 0` that should have sources
- [ ] Suggested new sources or queries to fill gaps

For each issue found, either fix it inline or add a `> **TODO:**` callout with a specific action.

---

## Cross-Reference Conventions

- Always use wikilinks: `[[concepts/page-name]]` or `[[concepts/page-name|display text]]`
- When a concept is mentioned on a page for the first time, link it
- Contradiction callout: `> **⚠ Contradiction with [[page]]:** explanation`
- Stale callout: `> **⚠ May be stale:** reason`
- Todo callout: `> **TODO:** action needed`

---

## Taxonomy

> **TODO:** Run `/start-new-wiki` to configure tags for your topic.
> Until then, use descriptive freeform tags in frontmatter.

---

## Log Format

Every operation appended to `wiki/log.md`:
```
## [YYYY-MM-DD] ingest | Source Title
- Created: wiki/papers/filename.md
- Updated: concepts/page.md, overview.md, index.md

## [YYYY-MM-DD] query | Question summary
- Filed back: wiki/synthesis/page.md

## [YYYY-MM-DD] lint | Health check
- Fixed: 3 missing links, 1 contradiction flagged

## [YYYY-MM-DD] gap-analysis | Gap analysis pass
- Created: connections/bridge-name.md
- Created: questions/question-name.md
```

Log entries are append-only. Never edit past entries.

---

## Session Start Checklist

At the start of every session:
0. If `wiki/index.md` is empty, run `/start-new-wiki` first
1. Read this file (CLAUDE.md)
2. Read `wiki/log.md` tail (last 10 entries) to understand recent activity
3. Read `wiki/index.md` to have the catalog in context
4. Then proceed with the user's request
