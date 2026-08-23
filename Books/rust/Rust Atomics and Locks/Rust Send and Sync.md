---
title: Send Sync
type: implementation
status: seed
created: 2026-08-18
updated: 2026-08-18
tags:
  - rust
  - concurrency
  - thread-safety
  - auto-traits
aliases:
  - Send and Sync in Rust
  - Auto Traits
category: Books/Rust
---

# Thread Safety in Rust: Send and Sync

![[Send and Sync]]

## Send

A type `T` is `Send` if its ownership can be transferred to another thread.
e.g., `Arc<T>` is `Send`, but `Rc<T>` is not.

## Sync

A type `T` is `Sync` if its shared reference is of type `Send` (i.e., `T` is `Sync` if `&T` is `Send`).
e.g., `i32` is `Sync`, but `Cell<i32>` is not `Sync`.

All primitive types are `Send` and `Sync`.

## Auto Traits

Auto traits are traits which are implemented for a type if all of its fields implement them.

i.e.

```rust
struct User {
	id: i32,
}
```

Here, `User` is both `Send` and `Sync` because `id` is `Send` and `Sync`.

To opt out, you can add a property that's not `Send` or `Sync`, like a `Cell`:

```rust
use std::cell::Cell;
use std::marker::PhantomData;

struct User {
	id: i32,
	__not_sync: PhantomData<Cell<()>>,
}
```

Now `User` is not `Sync` or `Send`.

Raw pointers like `*const T` and `*mut T` are neither `Send` nor `Sync` as the compiler cannot guarantee thread safety for them.

```rust
struct Org {
	user: *mut usize,
}

unsafe impl Send for Org {}
unsafe impl Sync for Org {}
```

We need to use `unsafe` because the compiler can't guarantee that the value the user references is `Send` or `Sync`.
