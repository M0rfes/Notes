# Grill Session Format

Grill session logs live in `Grill/<Topic>.md` (e.g. `Grill/RAG Caching Strategy.md` or `Grill/Distributed Lock Manager.md`).

Create the `Grill/` directory lazily: only when the first grill session is started.

## Vault Rules & Metadata

Every session log must follow standard vault rules:

1. **YAML Frontmatter**:
   - `title`: Human-readable title of the session (e.g. `Grill: RAG Caching Strategy`).
   - `type`: `grill-session`
   - `status`: `seed` (while interview is active) -> `evergreen` (when interview concludes and understanding is confirmed).
   - `created`: `YYYY-MM-DD`
   - `updated`: `YYYY-MM-DD` (kept in sync whenever the file is updated).
   - `tags`: Lowercase kebab-case tags including `grill`, domain tags (e.g. `architecture`, `database`, `llms`), and specific topic tags.
   - `aliases`: Array of search aliases.
   - `summary`: 1-2 sentence executive summary of what was stress-tested and the agreed conclusion.
   - `topics`: List of discussed concepts.
   - `related`: Array of Obsidian wikilinks (`[[Note Name]]` or `[[Folder/Note Name|Alias]]`) to existing notes across the vault.

2. **Wikilinking**:
   - Scan the vault for relevant notes and cross-link concepts mentioned in the session log.
   - When using `grill-with-docs`, cross-link to generated `[[docs/adr/NNNN-slug|ADRs]]` and `[[CONTEXT|Glossary / Context]]` terms.

3. **Incremental Logging**:
   - Create the note at the start of Round 1.
   - Append each round (`### Round N`) and update settled decisions after the user responds.
   - Finalize `status`, `summary`, and `updated` when the session completes.

---

## Note Template

```markdown
---
title: "Grill: {Topic}"
type: grill-session
status: seed
created: {YYYY-MM-DD}
updated: {YYYY-MM-DD}
tags:
  - grill
  - {domain-tag}
  - {topic-tag}
aliases:
  - "Grilling: {Topic}"
  - "{Topic} Grill Session"
summary: "{1-2 sentences: what plan or design was stress-tested and what key conclusions were reached.}"
topics:
  - "{Topic 1}"
  - "{Topic 2}"
related:
  - "[[{Existing Vault Note 1}]]"
  - "[[{Existing Vault Note 2}]]"
---

# Grill Session: {Topic}

> [!NOTE]
> **Objective**: {What plan, architecture, or idea is being stress-tested}
> **Status**: {In Progress | Concluded}

## Context & Problem Statement

{1-3 paragraphs describing the initial problem, proposal, or context being stress-tested, linking to existing vault notes with [[Wikilinks]].}

## Design Tree & Rounds Log

### Round 1

❓ **Q1** - **{Question Title}**: {Question body and choices}

➡️ **Recommended**: {Recommended answer and rationale}

💬 **Decision**: {User's answer and settled rationale}

---

❓ **Q2** - **{Question Title}**: {Question body and choices}

➡️ **Recommended**: {Recommended answer and rationale}

💬 **Decision**: {User's answer and settled rationale}

---

### Round 2

{Subsequent rounds appended as they occur}

---

## Settled Decisions & Blueprint

{Synthesized summary of all final decisions, architectural constraints, and accepted trade-offs.}

- **{Decision Area 1}**: {Agreed path and reason}
- **{Decision Area 2}**: {Agreed path and reason}

## Deferred & Out of Scope

- {Any ideas, features, or questions explicitly deferred for future sessions}

## Next Steps / Actions

- [ ] {Action item or spec to generate}
- [ ] {ADR or code implementation step}
```
