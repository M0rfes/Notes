---
name: grill-with-docs
description: A relentless interview to sharpen a plan or design, logging the session to a vault note and creating docs (ADRs and glossary) as decisions crystallize.
disable-model-invocation: true
created: 2026-08-23
updated: 2026-08-24
---

# Grill with Docs

Conduct a relentless interview to sharpen a plan or design, logging the entire session into a vault note and producing domain-modeling documents (`CONTEXT.md` glossary and ADRs) inline as decisions are reached.

## Instructions

1. Execute the interview using the `grilling` and `domain-modeling` workflows.
2. Initialize and incrementally maintain the session log in `Grill/<Topic>.md` following [GRILL-SESSION-FORMAT.md](../grilling/GRILL-SESSION-FORMAT.md).
3. Adhere strictly to vault rules:
   - Complete YAML frontmatter with `title`, `type: grill-session`, `status: seed`, `created: YYYY-MM-DD`, `updated: YYYY-MM-DD`, `tags: [grill, ...]`, `aliases`, `summary`, `topics`, and `related: ["[[...]]"]`.
   - Discover and link existing notes across the vault using `[[Wikilinks]]`.
4. Capture documentation as decisions crystallize:
   - **Glossary**: Update `CONTEXT.md` inline whenever domain terminology is clarified or settled.
   - **ADRs**: When a decision meets the ADR bar (hard to reverse, surprising without context, or result of a real trade-off), create `docs/adr/NNNN-slug.md` using [ADR-FORMAT.md](../domain-modeling/ADR-FORMAT.md).
   - Cross-link created ADRs and glossary terms directly inside the `Grill/<Topic>.md` session log.
5. Finalize the session log note (`status: evergreen`, `summary`, `updated`, and final blueprint) once the frontier is empty and the user confirms shared understanding.
