# GLOSSARY.md Format

`GLOSSARY.md` lives at `Teach/<Topic>/GLOSSARY.md`. It is the canonical vocabulary for the topic workspace. All lessons, exercises, and learning records should adhere to its terminology.

Using Markdown headings (`### Term`) enables precise anchor linking (`[[GLOSSARY#Term]]`) and transclusion (`![[GLOSSARY#Term]]`) across all Obsidian lessons.

## Structure

```md
---
title: "{Topic} Glossary"
type: glossary
topic: "{Topic}"
created: YYYY-MM-DD
tags:
  - teach/{topic-slug}
  - glossary
---

[[{Topic}|← {Topic} MOC]]

# {Topic} Glossary

> [!NOTE] Canonical Language
> {1-2 sentence description of the scope of vocabulary covered here.}

---

## Core Synchronization

### Mutex
Mutual exclusion primitive that ensures only one thread accesses shared data at any given moment.
- **Vault Concept**: [[Coding/Concurrency/Mutex|Concept: Mutex]]
- _Avoid_: Lockbox, semaphore (when referring specifically to exclusive access)

### Deadlock
A condition where two or more threads are unable to proceed because each is waiting for a lock held by another in a circular chain.
- **Vault Concept**: [[Coding/Concurrency/Race Conditions|Concept: Race Conditions & Deadlocks]]
- _Avoid_: Freeze, hang, lockup

---

## Memory & Hardware

### Memory Ordering
Rules governing the visibility and execution order of memory operations across multiple CPU cores.
- **Vault Concept**: [[Coding/Concurrency/Memory Ordering|Concept: Memory Ordering]]
- _Avoid_: Core sync, CPU timing
```

## Rules

- **Use Heading Anchors (`### Term`)**: Every term must be an H3 heading so it can be referenced across the wiki via `[[GLOSSARY#Term]]` or embedded via `![[GLOSSARY#Term]]`.
- **Add a term only when understood**: The glossary is a record of compressed, verified knowledge. Wait until the concept is introduced and mastered before promoting it here.
- **Be opinionated**: Pick the most precise industry term and explicitly list `_Avoid_` aliases to enforce clear thinking.
- **Keep definitions tight**: 1–2 sentences defining what the term *is*, not a full tutorial.
- **Cross-link with Vault Concepts**: When matching concept notes exist in the user's vault (e.g. in `Coding/`, `Architecture/`), link to them.
- **Revise as understanding deepens**: Update definitions in-place as nuances are learned.
