---
title: Thread Parking
type: concept
status: seed
created: 2026-08-18
tags:
  - concurrency
  - threads
aliases:
  - Parking
  - Unparking
---

# Thread Parking

Thread parking lets a [[Threads|thread]] park itself so it no longer consumes CPU cycles while waiting for other threads to wake it.

Other threads can call `unpark` on the thread handle to wake it up. If `unpark` is called before the thread is parked, the wake-up token is saved and the next `park` returns immediately without sleeping. Calling `unpark` multiple times only skips the first `park`.
