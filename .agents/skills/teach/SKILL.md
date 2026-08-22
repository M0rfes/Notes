---
name: teach
description: Teach the user a new skill or concept within an Obsidian vault wiki structure under Teach/<Topic>/. Use when the user asks to learn a topic, wants structured interactive lessons, or asks to be taught something.
argument-hint: "What would you like to learn about?"
---

The user has asked you to teach them something. This is a stateful request — they intend to learn the topic over multiple sessions within their Obsidian vault.

## Teaching Workspace (`Teach/<Topic>/`)

All teaching content lives inside the `Teach/` folder in the Obsidian vault, organized under a dedicated topic directory: `Teach/<Topic>/` (e.g. `Teach/Rust Concurrency/`, `Teach/Distributed Systems/`).

The state of their learning is captured in this directory as an interconnected wiki:

- `Teach/<Topic>/<Topic>.md`: The main **Map of Content (MOC)** and curriculum hub for the topic. Acts as the entry point linking all lessons, reference notes, mission, resources, and learning records. See [MOC-FORMAT.md](./MOC-FORMAT.md).
- `Teach/<Topic>/MISSION.md`: Captures the _reason_ and real-world goal the user is pursuing. Grounds all teaching decisions. See [MISSION-FORMAT.md](./MISSION-FORMAT.md).
- `Teach/<Topic>/RESOURCES.md`: Curated trusted sources (books, papers, documentation) and wisdom communities (forums, study groups), cross-linked to existing vault reading notes. See [RESOURCES-FORMAT.md](./RESOURCES-FORMAT.md).
- `Teach/<Topic>/GLOSSARY.md`: Canonical terminology and tight definitions for the topic, linking to vault concept notes. See [GLOSSARY-FORMAT.md](./GLOSSARY-FORMAT.md).
- `Teach/<Topic>/NOTES.md`: Scratchpad for the teacher to record learner preferences, pacing notes, and working context.
- `Teach/<Topic>/Lessons/NNNN-<dash-case-name>.md`: Self-contained Obsidian Markdown lessons. Each lesson teaches one tightly-scoped skill tied to the mission. See [LESSON-FORMAT.md](./LESSON-FORMAT.md).
- `Teach/<Topic>/Reference/*.md`: Compressed markdown reference sheets, cheat sheets, syntax summaries, and algorithmic workflows. Designed for quick review.
- `Teach/<Topic>/Learning Records/NNNN-<dash-case-name>.md`: Sequential records of verified understanding, mastered milestones, corrected misconceptions, and prior knowledge. Loosely equivalent to ADRs (Architectural Decision Records). See [LEARNING-RECORD-FORMAT.md](./LEARNING-RECORD-FORMAT.md).

## Philosophy

To learn at a deep level, the user needs three things:

- **Knowledge**, captured from high-quality, high-trust resources. Never trust unverified parametric knowledge; verify against documentation, books, and primary sources.
- **Skills**, acquired through highly relevant interactive lessons with active recall and tight feedback loops.
- **Wisdom**, which comes from interacting with real-world practitioners and communities.

### Fluency vs Storage Strength

Distinguish between two types of memory strength:

- **Fluency strength**: In-the-moment ease of retrieval (can create an illusion of competence).
- **Storage strength**: Long-term durable retention and transferability.

Build storage strength through **desirable difficulty**:
1. **Retrieval Practice**: Active recall via foldable Obsidian question/solution callouts (`> [!QUESTION]` and `> [!FAQ]- Solution`).
2. **Spacing**: Revisiting and building upon earlier concepts across subsequent lessons.
3. **Interleaving**: Mixing related sub-skills during practice rather than isolated massed repetition.

## Wiki Interlinking & Obsidian Syntax

Every file created in `Teach/<Topic>/` must behave as part of an interconnected personal wiki / digital garden:

1. **Wikilinks (`[[...]]`)**:
   - Link between lessons: `[[0001-slug|← Previous]]` and `[[0003-slug|Next →]]`.
   - Link to structural hubs: `[[<Topic>|Topic Hub]]`, `[[MISSION|Mission]]`, `[[GLOSSARY#Term|Term]]`, `[[RESOURCES|Resources]]`.
   - **Cross-link with the wider Vault**: Scan existing vault directories (e.g. `Coding/`, `Architecture/`, `Books/`, `LLMs/`) and insert wikilinks to relevant concept and reference notes.
   - Include a top breadcrumb bar in every document:
     `[[<Topic>|← <Topic>]] · [[MISSION|Mission]] · [[GLOSSARY|Glossary]] · [[RESOURCES|Resources]]`

2. **Transclusions / Embeds (`![[...]]`)**:
   - Embed atomic glossary definitions or reference snippets directly into lessons: `![[GLOSSARY#Term]]` or `![[Reference/Cheat Sheet#Section]]`.
   - Embed lesson summaries or learning record overviews into the main Topic MOC.

3. **Callouts (`> [!...]`)**:
   - `> [!NOTE]` / `> [!INFO]`: Core concepts and takeaways.
   - `> [!TIP]`: Practical mental models, rules of thumb, and heuristics.
   - `> [!WARNING]`: Common traps, anti-patterns, and edge cases.
   - `> [!QUESTION]`: Retrieval prompts and active recall questions.
   - `> [!FAQ]- Solution (Click to reveal)`: Collapsible callouts for quiz solutions and exercise explanations to prevent accidental spoiler peeking.

4. **Visuals & Diagrams**:
   - Use Mermaid diagrams (` ```mermaid `) for architectures, workflows, state transitions, and memory layouts.
   - Use formatted syntax-highlighted code blocks (` ```rust `, ` ```python `, etc.).

5. **YAML Frontmatter**:
   - Every file must start with valid YAML frontmatter specifying `title`, `type` (`teach-moc`, `lesson`, `reference`, `learning-record`, `mission`, `glossary`, `notes`), `topic`, `created`, `tags`, and `aliases`.

6. **Interactive Checklists**:
   - Use GitHub-style task checkboxes (`- [ ]`) for hands-on exercises and step-by-step application tasks.

## The Mission

Every lesson must tie directly to the `MISSION.md` — the user's concrete real-world goal.

If `MISSION.md` is not yet populated or is vague, interview the user before generating lessons. Push for concrete outcomes ("Ship a multithreaded web scraper in Rust") over abstract desires ("Learn Rust concurrency").

When the mission shifts, update `MISSION.md` and record a Learning Record.

## Zone of Proximal Development (ZPD)

Keep the user challenged "just enough". Before authoring a new lesson:
1. Read existing `Learning Records/` to identify what is already mastered.
2. Select the next logical concept that bridges current knowledge to the mission.
3. Keep the scope tight: one single win per lesson completable in 5–10 minutes.

## Lessons Workflow

When teaching a topic:
1. Check existing lessons in `Teach/<Topic>/Lessons/` to determine the next sequence number (`0001`, `0002`, ...).
2. Author the lesson in Obsidian Markdown using [LESSON-FORMAT.md](./LESSON-FORMAT.md).
3. Cross-link to `GLOSSARY.md`, `MISSION.md`, related reference sheets, and vault notes.
4. Update the Topic MOC (`Teach/<Topic>/<Topic>.md`) with the new lesson link.
5. If the user successfully demonstrates understanding during the lesson, create a new learning record in `Teach/<Topic>/Learning Records/` using [LEARNING-RECORD-FORMAT.md](./LEARNING-RECORD-FORMAT.md).
6. If the `obsidian` CLI is available, open the newly created lesson for the user (`obsidian open file="Teach/<Topic>/Lessons/0001-<name>.md"`).
