---
title: Agentic Retrieval-Augmented Generation (Agentic RAG)
type: research
status: seed
created: 2026-03-29
updated: 2026-03-29
tags: [LLM, RAG, AI-Agents, research]
aliases: [Agentic RAG]
summary: Exploration of agentic retrieval strategies where an LLM autonomously chooses between different retrieval tools.
entities: [Ottomator Agents]
topics: [Semantic Search, Hybrid Search, BM25, Retrieval Tools, Autonomous Choice]
related: [LLMs/RAG.md]
---

# Agentic RAG

[[RAG]] (Source: [Ottomator Agents](https://github.com/coleam00/ottomator-agents/tree/main/all-rag-strategies#2-agentic-rag))

### What It Is
The agent autonomously chooses between multiple retrieval tools based on the query. For example:
1. `search_knowledge_base()`: Semantic search over chunks (often including **hybrid search**: dense vector + sparse keyword/BM25).
2. `retrieve_full_document()`: Pull entire documents when chunks are insufficient.

**Hybrid search** (combining dense vector embeddings with sparse keyword search like BM25) is typically part of this strategy, giving the agent access to both semantic similarity and keyword matching.

### How It Works
We let the agent pick between querying the **[[Vector Database]]** for syntactic search and/or performing a text search based on keywords to retrieve commonly used chunks.

### Pros & Cons
- ✅ **Pros**: Flexible; adapts to query needs automatically.
- ❌ **Cons**: More complex; less predictable behavior compared to fixed retrieval flows.
