---
title: Threads
type: concept
status: seed
created: 2026-08-18
tags:
  - concurrency
  - threads
aliases:
  - OS Threads
  - Thread Lifecycle
---

# Threads

Every program starts with one OS thread, and the thread remains alive as long as the program runs. Once the program stops executing, the thread is cleaned up.

When the main thread is terminated, all threads forked or spawned from it are also cleaned up, whether they have finished executing or not.
