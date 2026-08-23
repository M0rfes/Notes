---
title: Mutex
type: concept
status: seed
created: 2026-08-18
updated: 2026-08-18
tags:
  - concurrency
  - locks
aliases:
  - Mutual Exclusion
  - Locks
---

# Mutex

A Mutex (mutual exclusion) works as an exclusive reference: only one [[Threads|thread]] can hold the lock at a time.

When sharing data between threads via a Mutex, conflicting access does not cause a panic; instead, waiting threads are put to sleep and woken up when the lock is released.
