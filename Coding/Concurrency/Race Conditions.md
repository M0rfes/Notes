---
title: Race Conditions
type: concept
status: seed
created: 2026-08-18
updated: 2026-08-18
tags:
  - concurrency
aliases:
  - Race Condition
  - Data Race
---

# Race Conditions

A race condition occurs when multiple [[Threads|threads]] access and attempt to modify shared state concurrently, and the final outcome depends on the timing or interleaving of execution.

If two threads check a condition and both see an uninitialized state, both may restart the computation, whichever finishes first.
