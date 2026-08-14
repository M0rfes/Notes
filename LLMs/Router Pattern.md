---
title: Router Pattern
type: research
status: seed
created: 2026-07-31
updated: 2026-07-31
tags: [LLM, agent, rag, router-pattern, routing]
aliases: [Router Pattern, Semantic Router]
summary: An architectural pattern where an LLM or classifier acts as a dispatcher to direct incoming queries to specialized tools, indexes, or prompt pathways.
topics: [Query Routing, Tool Dispatching, Agentic RAG, Classifier Routing]
related: [LLMs/Agentic RAG.md, Agents/Agents.md, LLMs/Re-ranking.md]
---

# Router Pattern

The **[[Router Pattern]]** is an architectural pattern used in **[[Agents|AI Agents]]** and **[[Agentic RAG]]** where a classifier or [[LLM|LLM]] acts as a dispatcher, evaluating incoming user queries and routing them to the most appropriate execution path, index, or tool.

### Core Functions
- **Query Classification**: Classifies intent (e.g., technical support vs. billing vs. general conversation).
- **Index/Tool Selection**: Directs queries to specific search indexes (e.g., `vector_search()`, `sql_query()`, or `web_search()`).
- **Cost & Latency Optimization**: Can route simpler queries to [[SLMs]] (Small Language Models) or cache, reserving larger models for complex tasks.

### Common Approaches
1. **LLM-based Routing**: Using function calling or structured outputs (Pydantic/JSON schema) to return a destination route.
2. **Semantic Routing**: Computing query embeddings and using vector distance against fixed route vectors for ultra-fast, low-cost routing.
3. **Keyword / Heuristic Routing**: Using deterministic rules or BM25 classifiers for predictable routing.
