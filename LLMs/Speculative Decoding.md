---
title: Speculative Decoding
type: research
status: seed
created: 2026-07-31
updated: 2026-07-31
tags: [LLM, speculative-decoding, optimization, inference, throughput]
aliases: [Speculative Decoding]
summary: An optimization technique using a smaller model to generate candidate tokens validated in a single pass by a larger model to increase token throughput.
topics: [Autoregressive Generation, Draft Model, Parallel Validation]
related: [LLMs/LLMs.md, LLMs/decoder.md, LLMs/vLLM.md]
---

# Speculative Decoding

**[[Speculative Decoding]]** is an optimisation technique used to increase token generation speed and token throughput in [[LLM|LLM]].

### Context & Motivation
- **Autoregressive Constraint**: Due to the [[LLMs/decoder|autoregressive]] nature of the [[LLMs/Encoder|transformer]] architecture, standard inference generates only one token at a time, meaning one forward pass results in one token.
- **Resource Intensity**: Bigger models require significantly more resources and time to generate new tokens.
- **Efficiency Gap**: In most cases, a smaller model could generate the exact same tokens with significantly fewer resources and in far less time.

### Core Mechanism
- **Draft Generation**: A smaller model generates $X$ new candidate tokens along with their confidence scores.
- **Parallel Validation**: A bigger model validates all $X$ tokens in a single forward pass.
- **Throughput Yield**:
  - **Best Case**: Yields up to $X$ tokens in a single pass of the larger model.
  - **Worst Case**: Yields 1 token in a single pass (otherwise generates one token and repeats).

#### Example
1. The smaller model generates $5$ tokens ($X_1, X_2, X_3, X_4, X_5$) with corresponding confidence scores ($S_1, S_2, S_3, S_4, S_5$).
2. The bigger model verifies all $5$ tokens in a single pass, accepting anywhere from $0$ to $5$ tokens.

### Implementation Approaches
- **Two-Model Architecture**: Using a separate smaller model alongside the main larger model.
- **Single-Model Integration**: Baking draft-generation capability directly into the model architecture.

### Drawbacks & Trade-offs
- **Wasted Compute**: Across draft iterations, if a large chunk of draft tokens is rejected, compute is wasted on generating those $X$ draft tokens and subsequently rejecting them.
 