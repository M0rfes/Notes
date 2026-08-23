---
title: Defensive Programming
type: thought
status: seed
created: 2026-08-18
updated: 2026-08-18
tags:
  - defensive-programming
  - error-handling
  - software-design
  - frontend
  - backend
aliases:
  - Defensive Programming
  - UI Resilience
summary: Perspectives on when to apply defensive programming at input boundaries versus avoiding excessive defensive checks against internal backend services and broken invariants.
topics:
  - Defensive Programming
  - Input Validation
  - Error Boundaries
  - Invariants
  - Team Dynamics
related:
  - Architecture/Coupling.md
  - Architecture/building-microservices-16-02-2026.md
---
# Defensive Programming

There is a time and a place for [[Defensive Programming|defensive programming]].

## Validating User Input

The advice is not to trust user input and be defensive there. We put validators on form values; we put validators on the HTTP request body and query.

## Internal Boundaries and Backend Services

But we should draw a line at putting validators on responses to [[Architecture/Coupling|services]] managed by our own BE team. If you need to be defensive against the code of your own team members, you have gone too far; these will introduce too many edge cases.

## Invariants and UI Failures

The attitude that, no matter what, the UI should not break is one I push back against. If the BE starts returning a string instead of what should be an array, the FE should not be the one validating it and falling back to an empty array; the UI can show an error using [[ErrorBoundary|error boundary]] or simply break cause your [[Invariants|invariants]] have broken.

## Team Dynamics

Also, if you see the BE as an antagonist to your code, you will soon start to see the BE devs as antagonists to you.