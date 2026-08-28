---
title: C Flexible Array Members
type: implementation
status: seed
created: 2026-08-28
updated: 2026-08-28
tags:
  - c
  - memory
  - structs
aliases:
  - C Flexible Array Members
  - Flexible Array Members in C
  - FAM in C
category: Books/C
---
# Flexible Array Members in C

![[Flexible Array Member]]

```c
#include <stdlib.h>

struct S {
    int size;
    int array[];
};

int main(void) {
    int size = 5;
    struct S* s;
    s = malloc(sizeof(struct S) + size * sizeof(int));

    return 0;
}
```

`sizeof` returns the size of `struct S` excluding the [[Flexible Array Member|Flexible Array Member]]. Hence the need to add `size * sizeof(int)` in `malloc`.
The Flexible Array has to be the last member of the struct.
The Flexible Array can't be the only member of the struct.
