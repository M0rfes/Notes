---
title: Preprocessor Directives
type: concept
status: seed
created: 2026-08-28
updated: 2026-08-28
tags:
  - c
  - preprocessor
  - compilation
aliases:
  - Preprocessor Directive
  - Preprocessor Constants
  - Macro Substitution
  - '#define'
---
# Preprocessor Directives

A preprocessor directive is a directive, rather than a keyword; it tells the preprocessor to perform a search-and-replace.

A preprocessor directive begins with `#` followed by spaces or tabs, then the directive name, the term, and the value; it ends as soon as it encounters the first newline.

Any `\` followed by a newline, i.e. `\n`, is removed. These make directives logically only one line long.
