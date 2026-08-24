---
name: grill-me
description: A relentless interview to sharpen a plan or design, logging the session to a vault note.
disable-model-invocation: true
created: 2026-08-23
updated: 2026-08-24
---

# Grill Me

Conduct a relentless interview to stress-test a plan, architecture, or design idea, logging the entire session into an Obsidian note following vault rules.

## Instructions

1. Execute the interview using the `grilling` workflow.
2. Initialize and incrementally log the session under `Grill/<Topic>.md` adhering to [GRILL-SESSION-FORMAT.md](../grilling/GRILL-SESSION-FORMAT.md).
3. Follow all vault rules:
   - Complete YAML frontmatter with `title`, `type: grill-session`, `status: seed`, `created: YYYY-MM-DD`, `updated: YYYY-MM-DD`, `tags: [grill, ...]`, `aliases`, `summary`, `topics`, and `related: ["[[...]]"]`.
   - Scan the vault for existing notes and connect concepts using `[[Wikilinks]]`.
   - Record questions (`❓`), recommendations (`➡️`), and user decisions (`💬`) round-by-round.
   - Finalize the note (update `status: evergreen`, `summary`, and settled decisions) once the frontier is empty and the user confirms shared understanding.
