---
title: Interior Mutability
type: concept
status: seed
created: 2026-08-18
tags:
  - memory
  - type-system
aliases:
  - Shared Mutability
---

# Interior Mutability

Interior mutability lets you mutate a value via a shared/read reference.

Normally, the type system guarantees there cannot be an active read reference while a write reference exists to the same value. Interior mutability enables mutating values behind a shared reference by either copying/replacing values (single-threaded cell types) or tracking borrows at runtime (borrow-checked cells or thread-safe locks).
