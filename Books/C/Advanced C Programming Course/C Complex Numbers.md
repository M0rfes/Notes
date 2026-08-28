---
title: C Complex Numbers
type: implementation
status: seed
created: 2026-08-28
updated: 2026-08-28
tags:
  - c
  - math
  - types
aliases:
  - C Complex Numbers
  - Complex Numbers in C
  - complex.h
category: Books/C
---
# Complex Numbers in C

![[Complex Numbers]]

```c
#include <complex.h>

float complex point = 1.0 + 2.0*I;
double complex point2 = 1.0 + 3.0*I;
```

Also, there are a few functions in the `<complex.h>` headers; the rest just let us work with [[Complex Numbers|complex numbers]].

Again, complex is an optional feature of C11, so check `__STDC_NO_COMPLEX__`.
