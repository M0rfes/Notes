---
title: Send Sync
type: concept
status: seed
created: 2026-08-18
tags:
  - concurrency
  - type-system
  - thread-safety
aliases:
  - Thread Safety Traits
---

# Send and Sync

Thread safety markers determine how types can cross thread boundaries:

- **Send**: A type `T` is `Send` if its ownership can be transferred to another [[Threads|thread]].
- **Sync**: A type `T` is `Sync` if its shared reference is of type `Send` (i.e., `T` is `Sync` if `&T` is `Send`).

All primitive types are `Send` and `Sync`. Types are automatically `Send` and `Sync` if all of their fields are `Send` and `Sync`.
