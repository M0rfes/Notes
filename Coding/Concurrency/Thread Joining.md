---
title: Thread Joining
type: concept
status: seed
created: 2026-08-18
tags:
  - concurrency
  - threads
aliases:
  - Joining Threads
  - JoinHandle
---

# Thread Joining

To wait for spawned [[Threads|threads]] to finish their execution before exiting from main, we can join the thread handle.

Joining waits for the target thread to finish and returns its result or indicates if the thread panicked.
