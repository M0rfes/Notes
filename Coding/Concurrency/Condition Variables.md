---
title: Condition Variables
type: concept
status: seed
created: 2026-08-18
tags:
  - concurrency
  - synchronization
aliases:
  - Condvar
---

# Condition Variables

A Condition Variable is used to notify one or more [[Threads|threads]] of an event when the shared data is protected by a [[Mutex]].

A condition variable takes the lock guard, unlocks the mutex, and puts the thread to sleep. When a notification is received, it re-acquires the mutex lock and returns the guard.
