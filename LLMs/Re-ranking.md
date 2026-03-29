---
title: Re-ranking Strategy in RAG
type: research
status: seed
created: 2026-03-29
updated: 2026-03-29
tags: [LLM, RAG, Re-ranking, research]
aliases: [Two-Stage Retrieval, Reranking]
summary: Two-stage retrieval process where initial candidates are filtered by a specialized ranking engine for better precision.
entities: [Ranking Engine]
topics: [Two-Stage Retrieval, Vector Search, Precision Filtering, Candidate Selection]
related: [LLMs/RAG.md]
---

# Re-ranking

[[RAG]] (Source: [Ottomator Agents](https://github.com/coleam00/ottomator-agents/tree/main/all-rag-strategies#1-re-ranking))

### What It Is
A **two-stage retrieval process**:
1. **Stage 1**: Perform a broad vector search to find a larger set (20-50+) of candidates.
2. **Stage 2**: Use a specialized **[[Ranking engine]]** to filter and rank these candidates against the query, passing only the top **K** (e.g., 5) to the LLM.

### Pros & Cons
- ✅ **Pros**: Significantly better precision. Allows more potential knowledge to be considered without overwhelming the LLM's context.
- ❌ **Cons**: Slightly slower than pure vector search. Increases compute cost per query.
