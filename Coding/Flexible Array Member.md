---
title: Flexible Array Member
type: concept
status: seed
created: 2026-08-28
updated: 2026-08-28
tags:
  - c
  - memory
  - structs
aliases:
  - Flexible Array Members
  - FAM
  - Flexible Array
---
# Flexible Array Member

A [[Teach/C17/GLOSSARY#Flexible Array Member (FAM)|flexible array member]] is an unsized array declared as the last member of a struct to support contiguous variable-length payload allocation.

- `sizeof` returns the size of the struct excluding the Flexible Array Member. Hence the need to add `size * sizeof(type)` in dynamic allocation.
- The Flexible Array has to be the last member of the struct.
- The Flexible Array can't be the only member of the struct.
