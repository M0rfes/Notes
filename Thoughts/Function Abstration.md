---
title: Function Abstraction and Local Reasoning
type: thought
status: seed
created: 2026-08-22
updated: 2026-08-22
tags:
  - clean-code
  - refactoring
  - software-design
  - local-reasoning
  - dry
  - single-responsibility
aliases:
  - Function Abstraction
  - Local Reasoning vs DRY
  - Refactoring for Local Reasoning
summary: The real reason to extract functions is to maintain local reasoning, not just DRY reuse, preventing monolithic function bloat and multiple reasons to change.
topics:
  - Local Reasoning
  - DRY Principle
  - Single Responsibility Principle
  - Refactoring
---

# Function Abstraction and Local Reasoning

Usually, when discussing functions, the advice is to abstract them to maintain the DRY principle (i.e., refactor code when you need to repeat the same steps). While a good rule when starting, the real reason to create, refactor to, or abstract to a function should be to maintain **local reasoning**.

The rule "refactor into a function only when you need to reuse it" is how you get a 300-line function, because the same steps aren't required anywhere else; instead, the rule should be to maintain local reasoning.

Functions are more for humans than for machines; remember, a human will see your code before a machine will. The CPU doesn't see functions; the compiler has to do a lot of extra work just to turn your functions into instructions—managing return addresses, parameter addresses, and inlining where possible.

## The Slippery Slope of "DRY" Bloat

For example, we have a function that grants product licenses:
- Initially, it only added an entry to the licenses table for the user.
- Now sales wanted an endpoint to attach a license to a user on their behalf, so we added that feature to the same method because that function is where we link users with licenses; keep it DRY.
- Now we have anonymous checkout, so if a user doesn't exist, create one, link them again, and it goes to the same function because DRY after all.

And we realised that the function is over 100 lines and none of it makes any sense; there are a bunch of `if` checks to create different resources.

These examples are kind of poor, but I can't give a simple one because the 300-line function I am talking about (to maintain DRY, or simply because no other flow uses these steps, so there's no need to refactor) spans a long stretch of time.

## Refactoring for Local Reasoning

Instead, we should have refactored based on local reasoning. You should refactor when you can reason about what a function does at a glance.
- e.g., the link-licenses-to-user function should be its own function even if no other code calls it, and it is only done at one spot.
- This way, all it cares about is a valid user and license, not `userId` or `licenseId`, because then we need to check whether those are valid IDs; they should be valid objects, and it should just link them, even if the call is just `user.link(license)`.
- Now every other flow should be broken into a separate function.

## Single Responsibility in Practice

You might argue that this is what I would do; it's easy when we are just pondering about code. But in practice, it's easy to fall into the habit of just adding one more line, one more `if` check, to bloat the function because the rest of the setup is already done.

Even the **Single Responsibility Principle** says a function, method, or class should have one reason to change, but the link flow now has multiple:
- If we change how a user is created, it changes.
- If we change which products sales is allowed to link, it changes, etc.