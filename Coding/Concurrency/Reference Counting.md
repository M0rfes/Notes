---
title: Reference Counting
type: concept
status: seed
created: 2026-08-18
updated: 2026-08-18
tags:
  - concurrency
  - smart-pointers
  - reference-counting
  - memory
aliases:
  - Ref Counting
---
# Reference Counting

Reference counting is a smart pointer mechanism that gives you a reference-counted value. It keeps a count of all owners and drops the value only when the counter reaches 0.

The count increases by 1 each time the pointer is cloned. Unlike deep cloning, this does not create a new value on the heap; instead, it increments the counter next to the value. Each time a clone is dropped, the counter is decremented; if the counter reaches 0, the actual value is dropped.

Standard reference counting gives a read-only reference by default and is not thread-safe if the counter increments and decrements are non-atomic.
