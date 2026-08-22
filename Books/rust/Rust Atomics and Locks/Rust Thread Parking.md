---
title: Thread Parking
type: implementation
status: seed
created: 2026-08-18
tags:
  - rust
  - concurrency
  - threads
aliases:
  - Thread Parking in Rust
  - std::thread::park
category: Books/Rust
---

# Thread Parking in Rust

![[Thread Parking]]

`std::thread::park`
Thread parking lets a thread park itself so it no longer consumes CPU cycles while waiting for other threads to wake it. Other threads can call the `unpark` method on the thread object they get from `spawn` or `std::thread::current()`.

```rust
use std::collections::VecDeque;
use std::sync::Mutex;
use std::thread;
use std::time::Duration;

fn main() {
	let queue = Mutex::new(VecDeque::new());
	
	thread::scope(|s| {
		let t = s.spawn(|| loop {
			let item = queue.lock().unwrap().pop_front();
			if let Some(item) = item {
				dbg!(item);
			} else {
				thread::park();
			}
		});
		
		for i in 0.. {
			queue.lock().unwrap().push_back(i);
			t.thread().unpark();
			thread::sleep(Duration::from_secs(1));
		}
	});
}
```

The main thread keeps pushing a number into the queue every second, then unparks. The thread is in an infinite loop that pops all the elements one by one, and when the queue is empty, it parks itself.

Note: if we call `unpark` before the thread is parked, it immediately resumes and never sleeps. But if we call `unpark` twice and `park` twice, only the first `park` is skipped; the second `park` will still put the thread to sleep.
