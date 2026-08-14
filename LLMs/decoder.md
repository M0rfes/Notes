---
title: Decoder (LLM)
type: research
status: seed
created: 2026-07-26
updated: 2026-07-26
tags: [LLM, decoder, transformer, attention, autoregressive]
aliases: [Decoder, Decoder-only models, Causal Decoder]
summary: Decoder layers generate tokens autoregressively with causal (left-to-right) attention; the dominant architecture for modern generative LLMs.
entities: [GPT, Transformer, Attention Is All You Need]
topics: [Autoregressive Generation, Causal Attention, Encoder-Decoder, Next-Token Prediction]
related: [LLMs/Encoder.md, LLMs/LLMs.md, LLMs/Tokenization.md, LLMs/Token Caching.md]
---

# Decoder

Decoders are a layer of [[LLM]] that generate the next token in autoregressive models.
Unlike [[Encoder|encoders]], decoders can't see the full text; when calculating attention, they can only do it from start to end, i.e., left to right for English.
In general, decoding is the piece of software that takes the encoded format and turns it into the original format. But in LLMs, decoders are the layer that generates one token at a time. The name decoder comes from the original paper where transformers were used to translate text from language A to language B [[Encoder|encoder]] extracted features from language A, aka encoded it, and the decoder generated the language B, aka decoded the vectors.
Decoder-only models are good for language generation tasks.

## Examples
- **GPT-2 / GPT-3 / GPT-4-class**, **LLaMA**, **Mistral**: decoder-only; train with next-token prediction.
- Original Transformer / **T5**: decoder attends to its own past tokens (causal mask) and to encoder outputs (cross-attention).
- Generating `"The cat sat"`: when predicting `sat`, attention may use `The` and `cat` only—not future tokens.

## Facts
- Causal (masked) self-attention: position *i* attends only to positions *j ≤ i*.
- Autoregressive loop: predict token → append → repeat until EOS or max length.
- Name comes from *Attention Is All You Need* (2017): decode target language from encoder representations of the source.
- Decoder-only models dominate open-ended generation; KV [[Token Caching|caching]] speeds repeated left-to-right steps at inference.
