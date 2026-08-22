---
title: Scalability
type: concept
status: seed
created: 2026-08-21
tags:
  - concurrency
  - architecture
  - scalability
aliases:
  - Horizontal and Vertical Scaling
  - System Scalability
---

# Scalability

[[Concurrency]] can help us achieve scalability by allowing us to scale out (scale horizontally) rather than scale up (scale vertically).
- Scaling vertically means buying more RAM or a faster processor to get only marginal improvements, and vertical scaling stops once you have already bought the fastest system.
- But we can scale horizontally by distributing the work across multiple machines.

[[Concurrency]] can be used to decouple the system. If only one service needs to scale, that can be done easily in a [[Coupling|decoupled]] system rather than to scale everything on a [[Coupling|tightly coupled]] system.
