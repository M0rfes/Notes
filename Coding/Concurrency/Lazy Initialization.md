---
title: Lazy Initialization
type: concept
status: seed
created: 2026-08-18
updated: 2026-08-18
tags:
  - concurrency
  - lazy-initialization
aliases:
  - Once Initialization
---
# Lazy Initialization

Lazy initialization is a pattern where a constant or expensive resource is calculated only when first requested and then stored for subsequent use.

In concurrent programs, lazy initialization must be synchronized to prevent [[Race Conditions|race conditions]] where multiple [[Threads|threads]] attempt initialization simultaneously.
