---
title: Scoped Threads
type: concept
status: seed
created: 2026-08-18
updated: 2026-08-18
tags:
  - concurrency
  - threads
aliases:
  - Thread Scopes
---

# Scoped Threads

Scoped [[Threads|threads]] are used to spawn threads that finish execution before the scope is exited. This lets threads borrow local variables because the data outlives their scope.

All threads spawned in the scope will be joined before the scope exits. Multiple read references can be shared across threads, but only one mutable reference is allowed at a time.
