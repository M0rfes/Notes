---
name: enrich
description: Enriches an Obsidian note by adding frontmatter metadata, tags, wikilinks to existing vault notes, fact-checking, and reorganizing thoughts into a logical structure, while strictly preserving the user's original writing without adding any AI-generated text.
---

# Enrich Note Skill

Use this skill when the user asks to enrich a note or pass a note to be processed by `enrich`.

## Objectives

When processing a note, perform the following tasks in order:

1. **Add / Update YAML Frontmatter**
   - Ensure the note starts with a valid YAML frontmatter block (`---`).
   - Include standard properties such as `tags:`, `created:` (or current date), `aliases:`, and any relevant status/category fields.

2. **Discover & Add Wikilinks (`[[Note Title]]`)**
   - Scan the Obsidian vault for existing notes.
   - Cross-reference concepts, titles, or terms mentioned in the note text against existing vault notes.
   - Convert exact or matching terms into internal wikilinks (e.g., `[[Target Note]]` or `[[Target Note|alias]]`).

3. **Add Tags**
   - Identify main themes and add relevant `#tags` in the note or under the `tags:` key in frontmatter.

4. **Fact-Check & Correct Errors**
   - Fact-check claims, names, dates, numbers, or technical statements in the text.
   - If an error is detected, correct the specific erroneous fact directly in-place within the user's sentence.
   - Do NOT append AI warnings, fact-check callouts, notes, or commentary.

5. **Order & Restructure Thoughts**
   - Group related points and reorder sentences, bullet points, or sections into a logical flow (e.g., chronological, thematic, or hierarchical order).
   - Add clean Markdown headers (`#`, `##`, `###`) or bullet points (`- `) to structure the user's thoughts cleanly.

---

## CRITICAL RULE: No AI-Generated Text

> [!IMPORTANT]
> **DO NOT ADD ANY TEXT THAT THE USER DID NOT WRITE.**
> - **Allowed**: Reordering sentences/bullets, adding Markdown markup (`#`, `- `, `*`), adding YAML frontmatter fields, adding wikilink brackets (`[[ ]]`), adding tags (`#tag`), and fixing factual inaccuracies in-place.
> - **Forbidden**: Adding summaries, introductions, conclusions, transitions, explanatory notes, AI commentary, or new ideas/words not written by the user.
