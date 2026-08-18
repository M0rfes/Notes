---
name: zettelkasten
description: Decomposes a monolithic note into atomic Zettelkasten notes by extracting independent concepts into language-agnostic concept notes and implementation-specific notes, linking them via wikilinks and embeds (![[...]]), and converting the original note into a Map of Content (MOC), strictly preserving the user's writing without adding AI-generated text.
---

# Zettelkasten Extraction Skill

Use this skill when the user asks to turn a note into a Zettelkasten, extract atomic ideas from a note, or split monolithic notes into linked atomic notes.

## Principles of Zettelkasten in this Vault

1. **Atomicity**: Each note must focus on a single, independent idea (one concept per note).
2. **Two-Layer Architecture**:
   - **Layer 1: Concept Notes (Language/Framework-Agnostic)**: Fundamental theoretical concepts, definitions, patterns, and principles (e.g. `Threads`, `Mutex`, `Interior Mutability`).
   - **Layer 2: Implementation Notes (Language/Framework-Specific)**: Concrete examples, API syntax, language-specific mechanics (e.g. `Rust Threads`, `Rust Mutex`, `Rust Cell and RefCell`).
3. **Embeds and Linking**:
   - Implementation notes embed their corresponding concept note at the top using Obsidian embed syntax: `![[Concept Note]]`.
   - Notes reference other related vault notes with inline wikilinks: `[[Note Title]]` or `[[Note Title|Alias]]`.
4. **Map of Content (MOC)**:
   - The original note remains at its file path and serves as a structured MOC / chapter overview, embedding the extracted implementation notes (`![[Implementation Note]]`) under relevant headers (`## [[Implementation Note|Section Title]]`).

---

## Workflow Steps

When a note is passed to this skill, execute the following steps in order:

### 1. Scan and Map Overlaps
- Read the entire source note.
- Identify all independent atomic ideas, separating:
  - Language-agnostic / theoretical concepts
  - Language-specific / library-specific implementations
- Plan the resulting note titles, target folder destinations, and dependency links.

### 2. Extract Concept Notes (Layer 1)
- Create individual concept notes for every independent theoretical idea in the appropriate domain folder (e.g., `Coding/Concurrency/`, `Architecture/`, etc.).
- Include standard YAML frontmatter:
  ```yaml
  ---
  title: <Concept Name>
  type: concept
  status: seed
  created: <YYYY-MM-DD>
  tags:
    - <tag1>
    - <tag2>
  aliases:
    - <Alias 1>
    - <Alias 2>
  ---
  ```
- Use the user's conceptual explanation as the note body.
- Convert references to other concepts into wikilinks `[[Other Concept]]`.

### 3. Extract Implementation Notes (Layer 2)
- Create individual implementation notes containing the concrete code examples, language mechanics, and practical considerations.
- Include standard YAML frontmatter:
  ```yaml
  ---
  title: <Language/Context Specific Name>
  type: implementation
  status: seed
  created: <YYYY-MM-DD>
  tags:
    - <language>
    - <topic>
  aliases:
    - <Alias 1>
  category: <Category>
  ---
  ```
- Embed the core concept at the top:
  ```markdown
  # <Implementation Title>

  ![[Corresponding Concept]]
  ```
- Include the user's code blocks and technical commentary below the embed.

### 4. Convert Original Note into a Map of Content (MOC)
- Replace the monolithic content of the original note with an organized MOC structure.
- Organize sections using wikilink headings and embeds:
  ```markdown
  # <Chapter / Main Topic Title>

  ## [[Implementation Note 1|Section 1]]
  ![[Implementation Note 1]]

  ## [[Implementation Note 2|Section 2]]
  ![[Implementation Note 2]]
  ```

### 5. Cross-Link Across Vault
- Scan existing vault notes to discover cross-linking opportunities.
- Add wikilinks where relevant concepts intersect with existing notes in `Architecture/`, `LLMs/`, `Agents/`, `Coding/`, etc.

---

## CRITICAL RULE: Zero AI-Generated Text

> [!IMPORTANT]
> **DO NOT ADD ANY NEW AI-GENERATED CONTENT OR TEXT THAT THE USER DID NOT WRITE.**
> - **Allowed**: Splitting and reorganizing existing text chunks, adding YAML frontmatter, adding wikilinks (`[[ ]]`), adding embeds (`![[ ]]`), adding Markdown headers (`#`, `##`), and fixing minor grammatical errors/typos.
> - **Forbidden**: Fabricating explanations, adding AI summaries, introductions, transitions, or unsolicited opinions not present in the user's original writing.
