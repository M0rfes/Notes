---
title: RAG
type: research
status: seed
created: 2026-03-29
updated: 2026-03-30
tags:
  - rag
  - research
  - architecture
aliases:
  - RAG
  - Retrieval-Augmented Generation
summary: Overview of RAG modalities and strategies for augmenting LLM queries with external, up-to-date, or private data.
entities:
  - LLM
  - Vector Database
  - MLLM
topics:
  - Everything as Text RAG
  - Hybrid Multimodal RAG
  - Full Multimodal RAG
  - Chunking
  - Embeddings
  - RAG Strategies
related:
  - LLMs/Agentic RAG.md
  - LLMs/Knowledge Graphs.md
  - LLMs/Re-ranking.md
  - LLMs/Tokenization.md
---
# Retrieval-Augmented Generation (RAG)

[[RAG]] or **Retrieval-augmented generation** means augmenting the query before passing it to the [[LLM]] for final inference. We need [[RAG]] to pass up-to-date or private data that the LLM might not have been trained on.

In traditional [[RAG]], we **[[chunk]]** our data and generate **[[embeddings]]** that are stored in a **[[Vector Database]]**. This allows us to perform a syntactic search to add context to the user query.

---

## Modalities of RAG

There are multiple ways to approach the data modality in [[RAG]]:

### 1. Everything as Text RAG
We turn everything into text and generate an embedding from it.
- **Process**: Images are run through an [[image-to-caption]] service; audio and video are turned into transcripts.
- **Storage**: Results are saved in a [[Vector Database]].
- **Pros/Cons**: Simple, but causes loss of context. It is only as good as the captioning and transcript models. If an image is poorly summarized, the LLM's answer will be suboptimal.

### 2. Hybrid Multimodal RAG ([[HYMMRag]])
Here, we save not only the summary of the media but also the location of the media.
- **Process**: This data is sent to a **[[MLLM]]** (Multimodal LLM) which can perform inference directly on images, audio, and video.
- **Result**: Allows the LLM to answer with much richer context.

### 3. Full Multimodal RAG ([[FMMRag]])
We use a multimodal embedding stack trained to put text, images, audio, and video into a shared **[[vector]]** space.
- **Process**: The retrieval process pulls out text, images, video frames, or audio timestamps.
- **Result**: Enables the system to be more grounded and accurate, managing large contexts by pulling specific relevant segments.

---

## RAG Strategies

While the above covers modalities, we also have different strategies to execute [[RAG]]:

1. **[[Re-ranking]]**
2. **[[Agentic RAG]]**
3. **[[Knowledge Graphs]]** (GraphRAG)
