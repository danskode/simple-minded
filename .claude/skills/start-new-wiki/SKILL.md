---
name: start-new-wiki
description: First-time setup wizard for a new wiki. Run this once after cloning the template. Guides you through topic, language, media types, and taxonomy — then creates the right directory structure and updates CLAUDE.md, README.md, and the wiki starter pages.
disable-model-invocation: true
---

# Start New Wiki

This is a one-time setup wizard. Run it after cloning the template and before ingesting any sources.

## Step 1 — Gather information

Ask the user the following questions conversationally (not all at once):

1. **Topic:** What is this wiki about? Ask for 1–2 sentences describing the subject and scope.

2. **Language:** What language will wiki pages be written in? (This affects how Claude formats responses and page content.)

3. **Media types:** Which types of sources will you import? Let the user select all that apply:
   - Articles and blog posts
   - PDFs and academic papers
   - YouTube or video transcripts
   - Podcast or audio transcripts
   - Images and screenshots
   - Other (ask what)

4. **Taxonomy:** What are your main subject categories? Ask the user to list them as comma-separated words or short phrases (e.g. "history, economics, people, events, primary sources"). These become the tag vocabulary used in frontmatter.

## Step 2 — Create raw/ subdirectories

Based on the media type answers, create the following directories (only create what was selected):

| Selected | Directory |
|----------|-----------|
| Articles and blog posts | `raw/articles/` |
| PDFs and academic papers | `raw/papers/` |
| YouTube or video transcripts | `raw/transcripts/` |
| Podcast or audio transcripts | `raw/transcripts/` (or `raw/audio/` if both video and audio were selected) |
| Images and screenshots | `raw/assets/` |
| Other | `raw/other/` |

Place a `.gitkeep` file in each created directory.

## Step 3 — Update CLAUDE.md

1. Replace `[TOPIC]` in the title and first paragraph with the user's topic description.
2. Replace the Taxonomy section placeholder with the user's categories, formatted as:

```
tag-name        — short description of what this tag covers
tag-name        — short description
```

Convert the user's category names to snake_case tags. Infer sensible one-line descriptions from context. Include a `people` and `synthesis` tag by default if not already listed.

## Step 4 — Update wiki/index.md

Replace the H1 placeholder comment with:
```markdown
# [Topic Title] — Wiki Index
```

## Step 5 — Update wiki/overview.md

Replace `YYYY-MM-DD` placeholders with today's date and update the H1:
```markdown
# [Topic Title] — Overview
```

## Step 6 — Update README.md

Replace `[TOPIC]` with the actual topic title throughout the file.

## Step 7 — Append to wiki/log.md

```
## [YYYY-MM-DD] setup | Wiki initialized for [topic]
- Language: [language]
- Media types: [list]
- Taxonomy: [tag list]
- raw/ dirs created: [list]
```

## Step 8 — Confirm to user

List everything that was created and updated. Then tell the user:

> Wiki is ready. Add your first source to `raw/` and say **"ingest [filename]"** to begin.
