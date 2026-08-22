---
title: "LR-0004: Standard I/O Return Conventions & fread Parameters"
type: learning-record
topic: "C17"
created: 2026-08-22
updated: 2026-08-22
status: active
tags:
  - teach/c17
  - learning-record
  - stdio
---

[[../C17|← C17 MOC]] · [[../MISSION|🎯 Mission]] · [[../Reference/Standard IO and Binary File Streams|Standard I/O Reference]]

# LR-0004: Standard I/O Return Conventions & `fread` Parameters

Clarified low-level C standard I/O semantics: `fseek` uses the Unix status return convention where `0` indicates success and non-zero indicates error. `fread` parameter separation (`size` of single element vs `nmemb` count) enables structured record-based reading where the return value represents the count of complete records transferred rather than raw bytes.

---

## 🔍 Evidence
- Investigated `fseek` return guarantees (`!= 0`) and decomposed the 4 parameters of `fread` for both raw byte buffers and structured record arrays.

---

## 🚀 Implications for Curriculum
- Documented canonical rules in [[../Reference/Standard IO and Binary File Streams|Standard I/O Reference]].
- Solid foundation set for binary file parsing and memory buffer manipulation.
