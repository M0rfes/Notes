---
title: Memory Ordering
type: concept
status: seed
created: 2026-08-18
tags:
  - concurrency
  - atomics
  - memory-model
aliases:
  - CPU Ordering
  - Memory Model
---

# Memory Ordering

All [[Atomic Operations|atomic operations]] take an ordering parameter that controls what guarantees we get about the relative ordering of operations.

> [!NOTE]
> The CPU might decide to perform operations out of order, i.e., group all assignments together even if, in the code, they are not in that order. So T1 might see V1 V2 V3 getting assigned but T2 might see V2 V3 V1 in that order.
