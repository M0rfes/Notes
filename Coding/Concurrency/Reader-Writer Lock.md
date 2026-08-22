---
title: RwLock
type: concept
status: seed
created: 2026-08-18
tags:
  - concurrency
  - locks
aliases:
  - RwLock
---

# Reader-Writer Lock

Where a [[Mutex]] only lets you take exclusive access even when a shared reference would have been enough, a Reader-Writer Lock (RwLock) lets you have one exclusive mutable reference OR multiple shared read references.

An RwLock is optimal for data that is read frequently but written to infrequently.
