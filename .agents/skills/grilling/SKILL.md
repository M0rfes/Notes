---
name: grilling
description: Grill the user relentlessly about a plan, decision, or idea, while logging the session to a vault note. Use when the user wants to stress-test their thinking, or uses any 'grill' trigger phrases.
created: 2026-08-23
updated: 2026-08-24
---

# Grilling

Interview the user relentlessly until you reach a shared understanding. Map this as a **design tree**: every decision branches into the decisions that hang off it.

Log the entire session incrementally into a dedicated note file in `Grill/<Topic>.md` following vault conventions. See [GRILL-SESSION-FORMAT.md](./GRILL-SESSION-FORMAT.md) for the note template and metadata schema.

## The Design Tree & Rounds

Work the tree in **rounds**. The **frontier** is every decision or concept whose prerequisites are already settled: the questions you can ask _now_ without guessing at answers you haven't heard yet. Ask open-ended questions without providing multiple-choice options or pre-revealing recommended answers. Wait for the user to type their own response in free text.

Format a round like so:

```
❓ **Q1** - **<question title>**: <open-ended question body prompting for the user's explanation, architecture reasoning, or concept recall>

---

❓ **Q2** - **<question title>**: <open-ended question body prompting for the user's explanation, architecture reasoning, or concept recall>
```

Each round the user answers reshapes the tree: evaluate the user's typed response to gauge depth of understanding, uncover misconceptions, or settle design paths. Settled decisions push the frontier outward and unblock questions that depended on them. Recompute the frontier and ask the next round. A question whose answer depends on another question still open in this round belongs to a _later_ round, not this one.

## Facts vs Decisions

Finding _facts_ is your job, never the user's. When a frontier question needs a fact from the environment (filesystem, tools, etc.), dispatch a sub-agent to find it; don't ask the user for anything you could look up yourself. Don't block on it: a running exploration is an unsettled prerequisite, so only the questions downstream of it wait for the sub-agent to report; ask the rest of the frontier now. The _decisions and answers_ are the user's: put each open-ended question to them and wait.

## Session Logging & Vault Rules

Every grilling session must be recorded in an Obsidian vault note in `Grill/<Topic>.md`:

1. **Vault Rules & Frontmatter**:
   - Begin with valid YAML frontmatter: `title`, `type: grill-session`, `status: seed` (update to `evergreen` upon completion), `created: YYYY-MM-DD`, `updated: YYYY-MM-DD`, `tags: [grill, ...]`, `aliases`, `summary`, `topics`, and `related: ["[[...]]"]`.
   - Scan the vault and add `[[Wikilinks]]` pointing to relevant concept notes, architecture docs, or tools.
2. **Live Incremental Updates**:
   - Initialize the file when Round 1 starts.
   - Update the note after each round with the asked questions, the user's typed response, and an evaluation of understanding or settled decisions.
   - Finalize `status`, `summary`, and the Settled Decisions / Knowledge Assessment section when the frontier is empty.

## Completion

The session is done when the frontier is empty: every branch of the design tree visited, nothing left silently assumed. Finalize the session log and do not act on the plan until the user confirms you have reached a shared understanding.
