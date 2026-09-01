---
name: enrich
description: Enriches an Obsidian note by adding frontmatter metadata, tags, wikilinks to existing vault notes, fact-checking, reorganizing thoughts into a logical structure, placing root notes into appropriate directories, and handling consolidation with user confirmation, while strictly preserving the user's original writing without adding any AI-generated text.
created: 2026-08-23
updated: 2026-08-31
---

# Enrich Note Skill

Use this skill when the user asks to enrich a note, clean up a raw note, or pass a note to be processed by `enrich`.

## Objectives

When processing a note, perform the following tasks in order:

1. **Vault Placement & Directory Organization**
   - If the note is currently located at the root of the vault:
     - Determine the most appropriate category/domain directory for the note based on its subject matter (e.g., `Architecture/`, `Coding/`, `LLMs/`, `Tools/`, `Thoughts/`, etc.).
     - If an appropriate directory exists, move the note into it.
     - If no matching directory exists, create a new logically named directory (e.g., `Emulation/`, `Hardware/`, `Systems/`, etc.) and place the note inside it.

2. **Add / Update YAML Frontmatter**
   - Ensure the note starts with a valid YAML frontmatter block (`---`).
   - Include standard properties such as `title:`, `type:`, `status:`, `created:` (YYYY-MM-DD), `updated:` (YYYY-MM-DD, matching `created` on initial creation and updated whenever modifying existing notes), `tags:`, `aliases:`, and any relevant category/domain fields.
   - **Preserve Existing Frontmatter Properties**: Never remove or strip existing frontmatter properties. In particular, always preserve the `flashcard` property (e.g., `flashcard: "false"` or `flashcard: "true"`) and any other pre-existing metadata fields.

3. **Discover & Add Wikilinks (`[[Note Title]]`)**
   - Scan the Obsidian vault for existing notes across all directories.
   - Cross-reference concepts, titles, or terms mentioned in the note text against existing vault notes.
   - Convert exact or matching terms into internal wikilinks (e.g., `[[Target Note]]` or `[[Target Note|alias]]`).

4. **Add Tags**
   - Identify main themes and add relevant tags under `tags:` in the frontmatter or inline where appropriate.

5. **Fact-Check & Correct Errors**
   - Fact-check claims, names, dates, numbers, units, or technical statements in the text.
   - If an error is detected (e.g., confusing bits with bytes, wrong opcode specs, erroneous hardware limits), correct the specific erroneous fact directly in-place within the user's sentence.
   - Do NOT append AI warnings, fact-check callouts, notes, or commentary.

6. **Order & Restructure Thoughts**
   - Group related points and reorder sentences, bullet points, or sections into a logical flow (e.g., chronological, thematic, or hierarchical order).
   - Add clean Markdown headers (`#`, `##`, `###`) or bullet points (`- `) to structure the user's thoughts cleanly.

---

## Consolidation Workflow (Handling Overlapping / Repeated Notes)

When encountering repeated, duplicated, or overlapping concepts across multiple vault notes:

- **Option 1: Consolidate Repeated Points into One Note**
  - **MANDATORY**: **ALWAYS ask the user for confirmation BEFORE extracting text and consolidating it from other notes.** Provide a clear summary of what will be merged and where. Never extract or modify source notes without user approval.
- **Option 2: Cross-Link & Tag Related Notes (Non-Destructive)**
  - Link the notes together using reciprocal wikilinks (`[[Other Note]]`).
  - Add matching category/cluster tags (e.g., `#cluster/<topic>` or dedicated thematic tags) to indicate they belong together and address related points, preserving each note intact.

---

## Teach Directory Protection (`Teach/`)

> [!IMPORTANT]
> **Content in `Teach/` is managed exclusively by the `teach` skill.**
> - **Allowed**: Discovering and linking to content inside `Teach/` using standard Obsidian wikilinks (`[[Teach/Topic/...]]`) and embeds (`![[Teach/Topic/...]]`).
> - **Forbidden**: Modifying, decomposing, rewriting, or extracting content out of `Teach/` notes during note enrichment or consolidation.

---

## CRITICAL RULE: No AI-Generated Text

> [!IMPORTANT]
> **DO NOT ADD ANY TEXT THAT THE USER DID NOT WRITE.**
> - **Allowed**: Reordering sentences/bullets, adding Markdown markup (`#`, `- `, `*`), adding YAML frontmatter fields (while preserving existing properties like `flashcard`), adding wikilink brackets (`[[ ]]`), adding tags (`#tag`), and fixing factual inaccuracies in-place.
> - **Forbidden**: Adding summaries, introductions, conclusions, transitions, explanatory notes, AI commentary, or new ideas/words not written by the user.
