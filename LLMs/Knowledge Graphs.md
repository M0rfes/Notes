---
title: Knowledge Graphs in RAG (GraphRAG)
type: research
status: seed
created: 2026-03-29
updated: 2026-03-29
tags: [LLM, GraphRAG, Knowledge-Graphs, RAG, research]
aliases: [GraphRAG, Knowledge Graph RAG]
summary: Combining vector search with graph databases to capture complex entity relationships missed by pure semantic search.
entities: [Neo4j, FalkorDB, Microsoft, LightRAG]
topics: [Entity Extraction, Relationship Mapping, Graph Databases, RAG Strategies]
related: [LLMs/Microsoft graphRag.md, LLMs/LightRAG.md, LLMs/RAG.md]
---

# Knowledge Graphs (GraphRAG)

[[RAG]] (Source: [Ottomator Agents](https://github.com/coleam00/ottomator-agents/tree/main/all-rag-strategies#3-knowledge-graphs))

### What It Is
Combines vector search with graph databases (e.g., **[[Neo4j]]**, **[[FalkorDB]]**) to capture complex entity relationships that pure vector embeddings might miss.

[Reference Video](https://youtu.be/EUG65dIY-2k?si=uOf6JurMc74Pimbu)

### Implementations
Several libraries facilitate **#GraphRag**:
1. **[[Microsoft graphRag]]**
2. **[[LightRAG]]**

#TODO: Deep dive into specific implementation differences.

### Pros & Cons
- ✅ **Pros**: Captures deep relationships missed by vectors; excellent for highly interconnected data.
- ❌ **Cons**: Requires setup (e.g., [[Neo4j]]), entity extraction, and graph maintenance. Slower and more expensive than pure vector retrieval.
