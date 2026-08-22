# Learning Record Format (`NNNN-<dash-case-name>.md`)

Learning records live in `Teach/<Topic>/Learning Records/` and use sequential four-digit zero-padded numbering: `0001-slug.md`, `0002-slug.md`, etc.

They are the teaching equivalent of ADRs (Architectural Decision Records): they capture non-obvious lessons, verified mastery, corrected misconceptions, and stated prior knowledge that guide future sessions and establish the user's Zone of Proximal Development (ZPD).

## Template

```md
---
title: "LR-{NNNN}: {Short Title of What Was Established}"
type: learning-record
topic: "{Topic}"
created: YYYY-MM-DD
updated: YYYY-MM-DD
status: active # or "superseded by [[0002-{slug}|LR-0002]]"
tags:
  - teach/{topic-slug}
  - learning-record
---

[[../{Topic}|← {Topic} MOC]] · [[../MISSION|🎯 Mission]] · [[../Lessons/{NNNN}-{lesson-slug}|📖 Related Lesson]]

# LR-{NNNN}: {Short Title}

{1–3 sentences: what was learned or established, and why it matters for future teaching sessions.}

---

## 🔍 Evidence
- {Demonstrated in [[../Lessons/{NNNN}-{lesson-slug}|Lesson {NNNN}]] by solving the lock contention exercise correctly on first attempt.}

---

## 🚀 Implications for Curriculum
- {Unlocks teaching lock-free atomic queues next; skip elementary mutex introductions.}
```

## Numbering

Scan `Teach/<Topic>/Learning Records/` for the highest existing number and increment by one (`0001`, `0002`, ...).

## When to write a learning record

Write one when any of the following occurs:

1. **Demonstrated Genuine Mastery**: The user applied a concept correctly in an exercise or project, establishing a new floor for the next lesson.
2. **Disclosed Prior Knowledge**: "I already have production experience with Go channels." Record depth so future sessions do not re-teach the basics.
3. **Corrected Misconception**: The user previously held an incorrect mental model and worked through why it failed. These predict future stumbling blocks.
4. **Mission Shift**: The user discovered new priorities during practice. Cross-link to `[[../MISSION]]` and update it.

### What does NOT qualify

- Material that was merely covered in a lesson without evidence of user retention.
- Pure terminology definitions already captured in `[[../GLOSSARY]]`.
- Session activity logs or timestamps.

## Supersession

When a later record deepens or corrects an earlier one, update the frontmatter of the older record to `status: superseded by [[NNNN-slug|LR-NNNN]]` rather than deleting it.
