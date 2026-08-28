---
title: C Typedef
type: implementation
status: seed
created: 2026-08-28
updated: 2026-08-28
tags:
  - c
  - types
  - typedef
aliases:
  - C Typedef
  - typedef in C
category: Books/C
---
# Typedef in C

![[Type Alias]]

`typedef` is a keyword used to declare a [[Type Alias|type alias]] for an existing type. For all computational purposes both are the same type; `typedef` is largely just for syntax.

```c
#include <stdio.h>

typedef int USD;

int main(void) {
    USD cur = 50;
    int num = 10;

    int total = cur + num; // Perfectly valid
    printf("Total: %d\n", total); // Outputs: Total: 60

    return 0;
}
```

`USD` is still valid; it's just another name for the type.

## Typedef with Structs

```c
typedef struct {} Point;

Point point = {};

struct Point2 {};
struct Point2 point2 = {};
```

With `struct`, the above pattern of naming an anonymous struct to `Point` using `typedef` is so we don't have to type `struct Point` the type and name each time we want to use point, unlike `struct Point2`.

## Recursive Structs

```c
typedef struct Node {
    int val;
    struct Node* left;
    struct Node* right;
} Node;

Node node = {};
```

We can use a `typedef` for a named struct when defining a recursive struct.
