# MISSION.md Format

`MISSION.md` lives at `Teach/<Topic>/MISSION.md`. It captures the _reason_ the user is learning this topic. Every teaching decision (what to teach next, which resources to surface, which exercises to design) traces back to this document.

## Template

```md
---
title: "Mission: {Topic}"
type: mission
topic: "{Topic}"
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags:
  - teach/{topic-slug}
  - mission
---

[[{Topic}|← {Topic} MOC]]

# Mission: {Topic}

> [!NOTE] Overarching Goal
> {A crisp 1-2 sentence statement of the user's primary real-world target.}

---

## 🎯 Why
{1-3 sentences. The concrete real-world goal the user is chasing. What changes in their life or work when they have this skill? Avoid abstract framings like "to understand X"; push for the underlying outcome.}

---

## 🏆 Success Looks Like
- [ ] {A specific, observable thing the user will be able to build or do}
- [ ] {Another specific capability}
- [ ] {Benchmark or milestone linked to [[{Topic}|{Topic} Curriculum]]}

---

## ⚙️ Constraints
- {Time availability, hardware/environment constraints, learning preferences}

---

## 🚫 Out of Scope
- {Adjacent topics the user explicitly does not want to chase right now, protecting the zone of proximal development}
```

## Rules

- **One mission per topic workspace.** If the user wants to learn two unrelated things, create separate folders under `Teach/<TopicA>/` and `Teach/<TopicB>/`.
- **Concrete over abstract.** "Ship a multithreaded web crawler in Rust" beats "Learn Rust concurrency."
- **Push back on vagueness.** If the user cannot articulate why, interview them before authoring lessons.
- **Revise when reality shifts.** When the user's goal evolves, update this file in place and link to the relevant [[Learning Records/|Learning Record]].
- **Keep it focused.** A mission is a compass, not an exhaustive syllabus.
