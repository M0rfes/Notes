---
title: Lock Poisoning
type: concept
status: seed
created: 2026-08-18
tags:
  - concurrency
  - locks
  - error-handling
aliases:
  - Poisoned Lock
---

# Lock Poisoning

Lock poisoning occurs when a [[Threads|thread]] panics while holding a [[Mutex]] or [[Reader-Writer Lock]].

Subsequent attempts to acquire the lock for read or write will return an error indicating the lock is poisoned. The lock still behaves as it should by putting other threads to sleep, but signals that the protected state may be invalid.
