---
title: Rust Rc
type: implementation
status: seed
created: 2026-08-18
tags:
  - rust
  - reference-counting
  - smart-pointers
aliases:
  - Rc in Rust
  - std::rc::Rc
category: Books/Rust
---

# Rc in Rust

![[Reference Counting]]

`std::rc::Rc` is a smart pointer that gives you a reference-counted value. It keeps a count of all owners and drops the value only when the counter reaches 0. The count goes up by one each time the pointer is cloned with `Rc::clone(&rc)`.

Unlike `Box::new().clone()`, these do not create a new value on the heap; instead, it just increments the counter next to the value. Each time a clone is dropped, the counter is decremented; if the counter reaches 0, the actual value is dropped.

Note: `Rc` gives a read-only reference; to get a mutable reference, you can either use [[Interior Mutability|interior mutability]] or `Rc::get_mut` or `Rc::make_mut` to get a mutable reference. It only works with a single reference; to get the number of references an `Rc` has, use `Rc::strong_count`.

```rust
use std::rc::Rc;

fn main() {
	let mut num = Rc::new(5);
	if let Some(val) = Rc::get_mut(&mut num) {
		*val = 42;
	}
	
	println!("{num:?}"); // 42
}
```

It's a zero-cost abstraction way of taking a mutable reference from an `Rc`.

`Rc` can't be sent across threads because it's not thread-safe and doesn't implement [[Send and Sync|Send and Sync]], because if two threads try to update the count at once, it will result in inconsistent behaviour.
