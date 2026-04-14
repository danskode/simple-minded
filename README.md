# [TOPIC] — LLM Wiki Template

A Claude-maintained personal knowledge base. You curate sources. Claude does the bookkeeping: summarizing, cross-referencing, filing, and keeping pages current.

**The wiki is the artifact. Chat history is disposable.**

---

## What This Is

An LLM-maintained wiki that compounds over time. Unlike RAG — where you retrieve chunks on demand — this wiki builds persistent, cross-referenced pages that grow richer with every source you add. Claude writes and updates the pages; you decide what goes in.

The template is topic-agnostic. Use it for research, professional learning, a domain you're studying, or any subject where you want knowledge to accumulate rather than disappear into chat history.

---

## Prerequisites

- [Claude Code](https://claude.ai/code) CLI installed and authenticated

---

## Setup

```bash
# 1. Clone the template
git clone https://github.com/your-username/simple-wiki my-wiki
cd my-wiki

# 2. Open in Claude Code
claude .

# 3. Run the setup wizard
/start-new-wiki
```

The `/start-new-wiki` skill will ask you four questions:
- What is this wiki about?
- What language will you write in?
- Which types of sources will you import?
- What are your main subject categories?

It then creates the right directory structure, updates `CLAUDE.md` with your taxonomy, and leaves you ready to ingest your first source.

---

## Core Workflow

### Ingest a source

Add a file to `raw/` (article, PDF, transcript, etc.), then:

```
ingest raw/articles/my-article.md
```

Claude reads the source, writes a summary page, updates all relevant wiki pages, and files everything in the index. A single source typically touches 5–15 pages.

### Ask a question

Just ask. Claude reads the index, finds relevant pages, and synthesizes an answer with citations. If the answer is worth keeping, it gets filed back as a wiki page.

```
what does the literature say about X?
how does concept A relate to concept B?
```

### Find gaps

```
gap analysis
```

Claude groups your pages into clusters, identifies pairs with few cross-links, and creates `connections/` bridge pages for meaningful gaps. New research questions go into `questions/`.

### Health check

```
lint the wiki
```

Claude checks for contradictions, orphan pages, missing cross-references, and stale claims — and fixes what it can inline.

---

## Directory Layout

```
wiki-root/
├── CLAUDE.md              ← operating manual for Claude
├── README.md              ← this file
├── .claude/
│   └── skills/
│       ├── start-new-wiki/    ← first-time setup wizard
│       └── gem-til-rendered/  ← save a response as a standalone doc
├── wiki/
│   ├── index.md           ← master catalog (Claude reads this first)
│   ├── log.md             ← append-only operations log
│   ├── overview.md        ← living synthesis of the subject
│   ├── concepts/          ← core concepts
│   ├── patterns/          ← recurring patterns or frameworks
│   ├── models/            ← models, systems, or formal structures
│   ├── tools/             ← tools, software, or methods
│   ├── papers/            ← source summaries
│   ├── people/            ← key people
│   ├── synthesis/         ← cross-cutting analysis
│   ├── connections/       ← bridge pages linking concept clusters
│   └── questions/         ← open research questions
├── raw/                   ← your source files (immutable)
│   └── [subdirs]/         ← created by /start-new-wiki
├── rendered/              ← standalone output documents
└── tools/
    └── search.sh          ← keyword search across wiki/
```

**`raw/` is immutable.** Never edit files there — they are the source of truth that wiki pages are derived from.

---

## Skills Included

| Skill | How to invoke | What it does |
|-------|--------------|--------------|
| `/start-new-wiki` | Once, after cloning | Setup wizard: configures topic, media types, taxonomy |
| `/gem-til-rendered` | After any response | Saves the response as a formatted standalone document in `rendered/` |

---

## Tips

- **Keep `raw/` immutable.** If you want to annotate a source, do it in the wiki page, not the raw file.
- **File good answers back.** If Claude synthesizes something useful, ask it to save it as a wiki page — otherwise it disappears into chat history.
- **Run gap analysis every 10 ingests.** That's roughly when clusters become rich enough for meaningful bridges to emerge.
- **The `connections/` and `questions/` pages are where the real value is.** They capture insights that don't exist in any single source.
- **Use `wiki/log.md` to orient yourself.** Read the last 10 entries at the start of a new session to remember where you left off.
