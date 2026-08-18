---
title: Atomic Reference Counting
type: concept
status: seed
created: 2026-08-18
tags:
  - concurrency
  - smart-pointers
  - atomics
aliases:
  - ARC
---

# Atomic Reference Counting

Atomic [[Reference Counting]] provides reference counting with a guarantee that any increment or decrement operation is [[Atomic Operations|atomic]], meaning no two [[Threads|threads]] can simultaneously mutate the count.

This allows the reference-counted pointer to be safely shared and sent across threads.
