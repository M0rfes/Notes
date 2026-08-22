# RESOURCES.md Format

`RESOURCES.md` lives at `Teach/<Topic>/RESOURCES.md`. It is the curated set of trusted sources and communities for this topic. Knowledge for lessons must be drawn from here, not from unverified parametric guesses.

## Structure

```md
---
title: "{Topic} Resources"
type: resources
topic: "{Topic}"
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags:
  - teach/{topic-slug}
  - resources
---

[[{Topic}|← {Topic} MOC]]

# {Topic} Resources

> [!NOTE] Curation Standards
> Only high-trust primary sources, official specifications, peer-reviewed materials, and well-moderated practitioner communities are listed here.

---

## 📚 Knowledge (Primary Sources)

- [Book: _Rust Atomics and Locks_ by Mara Bos](https://marabos.nl/atomics/)
  - **Vault Note**: [[Books/rust/Rust Atomics and Locks/Basics of Rust Concurrency|Mara Bos - Concurrency Notes]]
  - **Use for**: Low-level atomics, memory ordering, building custom sync primitives.
- [Official Documentation: Rust `std::sync`](https://doc.rust-lang.org/std/sync/)
  - **Use for**: Standard library synchronization primitives (Mutex, RwLock, Condvar).

---

## 👥 Wisdom (Communities & Practice)

- [Rust Users Forum](https://users.rust-lang.org/)
  - **Use for**: Architecture reviews, tricky lifetime/concurrency compiler error triage.
- [Reddit: r/rust](https://reddit.com/r/rust)
  - **Use for**: Ecosystem news, crate recommendations, community feedback.

---

## ⚠️ Knowledge Gaps

- {List any subtopic currently lacking a verified high-trust primary source, driving future investigation.}

---

## 👤 Learner Preferences

- {e.g., Prefers written documentation over video tutorials; opt-in/opt-out preferences regarding community participation.}
```

## Rules

- **High-trust only.** Prefer primary sources, official documentation, recognized experts, and peer-reviewed work.
- **Annotate every entry.** Always explain what the source covers and exactly when to consult it.
- **Cross-link to vault book notes.** If the user has notes on books or articles in `Books/`, link to them directly via `[[Books/...]]`.
- **Group by Knowledge vs. Wisdom.** Mirrors the teaching philosophy in [SKILL.md](./SKILL.md).
- **Prune stale sources.** Remove inaccurate or shallow sources to keep signal high.
