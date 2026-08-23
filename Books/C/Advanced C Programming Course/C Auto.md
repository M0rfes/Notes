---
title: C Auto Storage Class
type: implementation
status: seed
created: 2026-08-23
tags:
  - c
  - memory
  - storage-classes
aliases:
  - C Auto
  - auto in C
category: Books/C
---

# Auto Storage Class in C

![[Automatic Storage Duration]]

You don't need to specify auto unless you are shadowing a global variable and want to be specific about the shadowing.

```c
int main(void) {
	int i = 10;
	auto int j = 10;
}
```

Both i and j are auto.
