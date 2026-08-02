---
title: Encoder (LLM)
type: research
status: seed
created: 2026-07-26
updated: 2026-07-26
tags: [LLM, encoder, transformer, attention, NLP]
aliases: [Encoder, Encoder-only models, Bidirectional Encoder]
summary: Encoder layers in transformers extract features from the full input via bidirectional attention; used alone for NLU tasks or with a decoder in seq2seq models.
entities: [BERT, Transformer, Attention Is All You Need]
topics: [Bidirectional Attention, Feature Extraction, Masked Language Modeling, Encoder-Decoder]
related: [LLMs/decoder.md, LLMs/LLMs.md, LLMs/Tokenization.md, LLMs/RAG.md]
---

# Encoder

Encoders, when talking about [[LLMs]], are referring to the feature extracting layer rather then talking about changing the fomrat in which the information is stored. typecly encoder is the peace of software which takes data in one format and outputs it in another format. but encoder in llm refer to a layer of transformer and attention that can look at the full text and extract the features which is fead to the [[decoder]] layer that then generates the output text one token at a time. not all models use both encoder and decoder although they wear introduced togather. encoder only models are useful for tasks like fill in the balnk or sentiment analysis. encoders can look at the full text and generate attention from both direction left and right.

## Examples
- **BERT**, **RoBERTa**: encoder-only; pretrain with masked language modeling (fill-in-the-blank), then fine-tune for classification, NER, etc.
- **T5**, **BART**, original Transformer (translation): encoder–decoder; encoder reads source, decoder generates target.
- Input `"The cat sat on the mat"`: every token can attend to every other token (bidirectional self-attention).

## Facts
- Introduced with the decoder in *Attention Is All You Need* (Vaswani et al., 2017) for machine translation.
- Bidirectional (non-causal) self-attention: position *i* may attend to positions *j* for all *j* in the sequence.
- Encoder-only models map tokens → contextual embeddings; they do not generate open-ended text autoregressively.
- Common NLU uses: sentiment, classification, extractive QA, embeddings for [[RAG|retrieval]].
