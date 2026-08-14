---
title: Tokenization in LLMs
type: research
status: seed
created: 2026-03-29
updated: 2026-03-30
tags: [LLM, tokenization, research, NLP]
aliases: [Tokenization Techniques, Tokens]
summary: A research note exploring different tokenization methods used in LLMs, including character-level, word-level, and sub-word techniques like BPE.
entities: [ChatML, LLM, Byte Pair Encoding, BPE]
topics: [Character-Level Tokenization, Word-Level Tokenization, Sub-word Tokenization, Special Tokens, ChatML]
related: [LLMs/needle-in-a-haystack-20-03-2026.md, LLMs/LLMs.md]
---

# Tokenization

There are multiple ways to approach **[[Tokenization]]** in **[[LLM]]**:

1. **[[Character-Level Tokenization]]**
2. **[[Word-Level Tokenization]]**
3. **[[Sub-word Tokenization]]**

## Character-Level Tokenization
#Character-Level-Tokenization
We treat each character as a token. This is very inefficient because the model will have to learn spelling from scratch instead of the relation between words, and would need thousands of tokens to write a simple paragraph.

## Word-Level Tokenization
#Word-level-tokenization
In this approach, we treat every word in our vocabulary as a distinct token. 

**Drawbacks:**
- There are over 171,000 words in common use. Including every variation (e.g., "run", "runs", "ran", "running") would require millions of entries, which is too computationally expensive.
- **Vocabulary Cut-off:** To work around this, vocabularies are cut off at the most frequently used words. This forces the use of a special token `<|unk|>` to mark an unknown word.
- If a sentence is full of `<|unk|>` tokens, the model loses the meaning completely.

### Special Tokens
We also need special tokens for:
- **`<|bos|>` (Beginning of Sequence):** Marks the start of a conversation.
- **`<|eos|>` (End of Sequence):** Marks the end of a conversation. Without this, the model might just cut off mid-sentence or ramble forever.
- **`<|pad|>` (Padding):** Crucial for the math behind the scenes.

**Padding** is needed because models are trained to process batches of words. If the model works on a group of 5 words and our sentence cannot be chunked into a group of 5, we add the `<|pad|>` token to ensure 5 tokens per batch.

## ChatML Format
#ChatML_format 
**[[ChatML]]** is a specific format for structuring conversations:
- **`<|im_start|>`**: Marks the beginning of a message from a specific role.
- **`<|im_sep|>`**: Separates the role name (system, user, assistant) from the actual message content.
- **`<|im_end|>`**: Marks the end of that message.

**Structure:**
```
<|im_start|>role<|im_sep|>content goes here<|im_end|>
```

This allows the model to clearly understand: "Who is speaking?" and "What did they say?" Without these special token markers, the model would see a single continuous blob of text, with no way to tell where the system instructions end and the user's question begins.

## Sub-word Tokenization
#Sub-word-Tokenization
This is the modern standard for [[LLM]]. It breaks words into smaller meaningful units, balancing the efficiency of word-level tokenization with the flexibility of character-level.

- **[[Byte Pair Encoding]] (BPE)**: Used by GPT models. It iteratively merges the most frequent pairs of characters or character sequences.
- **[[WordPiece]]**: Used by BERT. Similar to BPE but uses a likelihood-based merge rule rather than just frequency.
- **[[Unigram]]**: Used by T5. It starts with a large vocabulary and removes tokens that increase the overall loss the least.

Sub-word tokenization allows the model to handle "unseen" words by breaking them into known sub-components (e.g., "unfriendly" -> "un" + "friendly").