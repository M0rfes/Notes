---
title: Atomic Operations
type: concept
status: seed
created: 2026-08-18
updated: 2026-08-18
tags:
  - concurrency
  - atomics
aliases:
  - Atomics
---

# Atomic Operations

The word _atomic_ comes from the Greek word _ἄτομος_, meaning an indivisible item that can't be cut into further smaller parts.

Atomic operations are the smallest operations on data that either occur or do not; there is no half-done state. Two [[Threads|threads]] can update an atomic variable without creating an inconsistent state where both reads return the same value and update it at the same time.

The implementation of atomics and which types are available depends on the system architecture and OS.
