---
title: Rust Cell
type: implementation
status: seed
created: 2026-08-18
tags:
  - rust
  - interior-mutability
aliases:
  - Interior Mutability in Rust
  - std::cell::Cell
  - std::cell::RefCell
category: Books/Rust
---

# Interior Mutability in Rust

![[Interior Mutability]]

## Cell

`std::cell::Cell<T>` lets you mutate a value via a shared/read reference to avoid undefined behaviour; it only lets you copy `T` if `T` implements `Copy` or replace `T`.
It can also be used only in a single thread.

```rust
fn f(a: &i32, b: &mut i32) {
	let before = *a;
	*b += 1;
	let after = *a;
	if before != after {
		x(); // never happens
	}
}
```

`x` is never called because Rust guarantees that both `a` and `b` can't reference the same number, as there can't be a read reference `&a` while we have a write reference `&mut b` to the same value.

But with `Cell`:

```rust
use std::cell::Cell;

fn f(a: &Cell<i32>, b: &Cell<i32>) {
	let before = a.get();
	b.set(b.get() + 1);
	let after = a.get();
	if before != after {
		x();
	}
}
```

`x` might be called now, as both `a` and `b` can point to the same value.

Use `cell.take()` when `T` doesn't implement `Copy`.

```rust
use std::cell::Cell;

fn f(vec: &Cell<Vec<i32>>) {
	let mut v = vec.take();
	v.push(4);
	vec.set(v);
}
```

`take` replaces the internal vector with an empty vector.

## RefCell

`std::cell::RefCell` lets you take a mutable reference to the value without cloning it, at a small runtime cost. It maintains a count along with the value, and taking a mutable reference while there are shared references, or vice versa, causes a panic.

```rust
use std::cell::RefCell;

fn f(vec: &RefCell<Vec<i32>>) {
	vec.borrow_mut().push(1);
}
```

But both `Cell` and `RefCell` can't be sent across threads.
