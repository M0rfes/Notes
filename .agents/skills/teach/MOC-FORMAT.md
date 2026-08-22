# Topic MOC Format (`<Topic>.md`)

The Topic Map of Content lives at `Teach/<Topic>/<Topic>.md` (or `Teach/<Topic>/Index.md`). It is the primary wiki hub and navigation center for the entire learning journey.

## Template

```md
---
title: "{Topic} Hub"
type: teach-moc
topic: "{Topic}"
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags:
  - teach/{topic-slug}
  - moc
aliases:
  - "{Topic} Curriculum"
  - "{Topic} Map of Content"
---

# {Topic}

> [!NOTE] Topic Overview
> {1-2 sentence overview of the topic being learned and its scope.}

## Compass
- [[MISSION|🎯 Mission & Goals]]: {Brief 1-line reason for learning}
- [[GLOSSARY|📖 Canonical Glossary]]: {Number of terms defined}
- [[RESOURCES|📚 Trusted Sources & Communities]]: Primary literature and forums
- [[NOTES|📝 Teacher Scratchpad]]: Learner preferences and working notes

---

## 🗺️ Curriculum Track

Track progress across the learning journey:

- [x] [[Lessons/0001-first-lesson-slug|0001 - Title of First Lesson]]
- [ ] [[Lessons/0002-second-lesson-slug|0002 - Title of Second Lesson]]
- [ ] [[Lessons/0003-third-lesson-slug|0003 - Title of Third Lesson]]

---

## 📌 Quick Reference & Cheat Sheets

Compressed knowledge sheets for rapid review:

- [[Reference/{topic}-cheat-sheet|{Topic} Cheat Sheet]]
- [[Reference/{subtopic}-syntax-guide|{Subtopic} Syntax Guide]]

---

## 🧠 Learning Records (Mastery Log)

Verified insights and milestones:

- [[Learning Records/0001-{slug}|LR-0001: {Short Title}]]
- [[Learning Records/0002-{slug}|LR-0002: {Short Title}]]

---

## 🌐 Vault Connections

Existing notes in the vault related to this topic:

- [[Coding/{Related Note}|{Related Note}]]
- [[Architecture/{Related Architecture Note}|{Related Architecture Note}]]
- [[Books/{Book Note}|{Book Note}]]
```

## Rules

- **Maintain as a living index**: Update this file every time a new lesson, reference sheet, or learning record is created.
- **Bi-directional linking**: Ensure every lesson links back to this MOC via `[[{Topic}|← {Topic} MOC]]`.
- **Progress tracking**: Use markdown task checkboxes (`- [x]` for completed lessons, `- [ ]` for upcoming ones).
- **Vault integration**: Link to existing relevant vault notes so learning connects to the user's broader knowledge base.
