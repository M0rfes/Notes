---
title: Agentic Retrieval-Augmented Generation (Agentic RAG)
type: research
status: seed
created: 2026-03-29
updated: 2026-03-30
tags:
  - rag
  - ai-agents
  - research
  - agentic-rag
aliases:
  - Agentic RAG
summary: Evolution of RAG into dynamic, autonomous systems where an LLM uses reasoning to manage the retrieval process, tool selection, and self-correction.
entities:
  - Ottomator Agents
  - LangGraph
  - LlamaIndex
  - CrewAI
  - Haystack
topics:
  - Semantic Search
  - Hybrid Search
  - BM25
  - Retrieval Tools
  - Autonomous Choice
  - Self-RAG
  - CRAG
  - Router Pattern
related:
  - LLMs/RAG.md
  - LLMs/Re-ranking.md
  - LLMs/Knowledge Graphs.md
---

# Agentic RAG

[[RAG]] (Source: [Ottomator Agents](https://github.com/coleam00/ottomator-agents/tree/main/all-rag-strategies#2-agentic-rag))

**Agentic RAG** represents a shift from static "retrieve-then-generate" pipelines to dynamic, autonomous systems. Instead of a fixed linear flow, an [[AI-Agents|Agent]] uses a reasoning loop to decide how to find, evaluate, and use information.

### Core Architectural Patterns

1.  **[[Router Pattern]]**: The LLM acts as a dispatcher, classifying the query and routing it to the most relevant index or tool (e.g., "Documentation Index" vs. "Web Search" vs. "SQL Database").
2.  **Query Decomposition**: Complex, multi-part questions are broken down into simpler sub-queries. The agent executes these in parallel or sequence and synthesises the results.
3.  **Self-Reflective / Corrective RAG (CRAG)**:
    *   **Retrieve**: Pull initial documents.
    *   **Grade**: An agent evaluates the relevance of the retrieved chunks.
    *   **Correct**: If relevance is low, the agent triggers a secondary search (e.g., web search) or reformulates the query to try again.
4.  **Multi-Agent Collaboration**: Specialised agents handle different stages (e.g., a "Researcher" finds data, a "Grader" verifies it, and a "Writer" compiles the final response).

### Key Tools & Frameworks

| Framework | Primary Strength | Use Case |
| :--- | :--- | :--- |
| **[[LangGraph]]** | Graph-based state management | Complex, cyclical workflows with "time-travel" debugging. |
| **[[LlamaIndex]]** | Data-centric retrieval | Advanced indexing, chunking, and metadata filtering. |
| **[[CrewAI]]** | Role-based agent teams | Orchestrating multiple agents with specific roles and backstories. |
| **[[Haystack]]** | Modular pipelines | Production-ready, highly customizable retrieval components. |

### How It Works: The Decision Loop
Unlike traditional [[RAG]], the agent has access to a suite of **Retrieval Tools**:
- `semantic_search()`: For deep conceptual matching using [[Vector Database]].
- `keyword_search()`: Using [[BM25]] for exact terminology and names.
- `web_search()`: For up-to-the-minute info outside the local knowledge base.
- `sql_query()`: For precise retrieval from structured databases.

**[[Hybrid Search]]** (Vector + BM25) is the baseline, but the agent decides *which* tool to use and *when* to stop searching.

# When to use
- **Multi-hop Queries**: Questions that require connecting facts from different documents.
- **Ambiguous Queries**: When the system needs to ask for clarification or try multiple search strategies.
- **Structured Data**: When dealing with [[CSV]]s or SQL tables where semantic embeddings might truncate context.
- **High-Precision Tasks**: Where "hallucinating" on poor retrieval is not an option (e.g., legal or medical).

### Comparison: Traditional vs. Agentic RAG
| Feature | Traditional RAG | Agentic RAG |
| :--- | :--- | :--- |
| **Workflow** | Linear (Retrieve -> Generate) | Iterative (Looping/Reasoning) |
| **Decision Making** | Predefined by code | Autonomous (LLM-driven) |
| **Complexity** | Low | High |
| **Latency** | Predictable | Variable (Multiple iterations) |
| **Accuracy** | Fixed by initial search | High (Self-correcting) |

### Pros & Cons
- ✅ **Pros**: Highly flexible; self-correcting; handles complex/ambiguous queries better than fixed pipelines.
- ❌ **Cons**: Higher latency and cost due to multiple LLM calls; non-deterministic behavior makes testing harder.

### Emerging Trends
- **[[Model Context Protocol]] (MCP)**: A standardized way to connect agents to tools and data.
- **Small Language Models ([[SLMs]])**: Using faster, specialized models for the "[[Router Pattern| routing]]" and "grading" steps to reduce latency.
