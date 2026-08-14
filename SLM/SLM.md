---
tags:
  - slm
  - llm
  - ai
  - edge-computing
  - data-privacy
  - fine-tuning
created: 2026-08-14
aliases:
  - Small Language Models
  - Small Language Model
related: [Quantisation, Router Pattern, Speculative Decoding, MCP]
---

# SLM

SLMs, i.e., small language models, range from a few million to 10 billion parameters. SLMs are not a new technology; they are based on the same Transformer architecture as [[LLM|LLMs]] introduced in Attention Is All You Need ([https://arxiv.org/abs/1706.03762](https://arxiv.org/abs/1706.03762)).

## Benefits

The benefits of SLM are its smaller footprints and low resource requirements for inference and fine-tuning. Unlike an [[LLM]], we don't need a multi-billion-USD cluster for fine-tuning; SLM can be fine-tuned on domain-specific and/or proprietary data on commodity hardware.

SLM is important and required for fields where data privacy is not an option, like healthcare, pharma, biotech, finance, etc., where we can't afford any data attached to a prompt leaking out.

## Agentic Applications

Unlike general coding harnesses like Codex, Claude Code Copilot, etc we don't need frontier [[LLM|LLMs]] for [[Agents|agentic]] applications, and according to an NVIDIA research paper: "Small Language Models are the Future of [[Agentic RAG|Agentic]] AI" ([https://arxiv.org/abs/2506.02153](https://arxiv.org/abs/2506.02153))
SLMs are a great fit for [[Agents|agentic]] applications to be deployed on the edge or on end-user devices.

## Risks of Using an External LLM Provider

The risk of using an [[LLM]] provider that's outside of your control as an org

- _Deployment outside your organisation's network_—Any information you include in a prompt may leave your company and, depending on the usage terms, be used to fine-tune the model and be exposed to other customers. You've likely read of cases in which employees at large corporations sent sensitive or proprietary data to external model-hosting services (for example, at Samsung, as discussed in "Samsung Bans Staff's AI Use After Spotting ChatGPT Data Leak" [Bloomberg, May 2, 2023, [https://mng.bz/AGEE](https://mng.bz/AGEE)], and others).
- _Data leakage risks_—Because the model is hosted on infrastructure you don't control, a weak cybersecurity posture (unknown to you and hard to mitigate) can allow malicious actors to access private data. There is evidence that something like this happened once with ChatGPT ("OpenAI Confirms ChatGPT Data Breach," Trend Micro's blog, May 13, 2023, [https://news.trendmicro.com/2023/05/13/openai-chatgpt-data-breach/](https://news.trendmicro.com/2023/05/13/openai-chatgpt-data-breach/)).
- _Model or version drift_—A provider can update a model without notice, potentially changing the behaviour and accuracy of applications built on top of it.
- _Cost unpredictability_—[[Tokenization|Token]]-based billing can spike, as a provider can decide at any time to change their subscription prices.
- _Closeness_—You don't have details about how an [[LLM]] was implemented and trained, so there's no chance of reproducibility or interpretability, both of which are often requirements in heavily regulated sectors. You also may not see infrastructure or model-version changes.
- _Transparency_—Data used to train closed-source models isn't publicly disclosed, so there's no way to verify whether it's biased or contains copyrighted data used without the owner's permission.
- _Hallucinations_—Generated information may conflict with the source (intrinsic hallucination) or be unverifiable from the available source (extrinsic hallucination). Intrinsic hallucinations can occur even in an organisation's models trained on proprietary data—a challenge with [[LLM|LLMs]] in general. But extrinsic hallucinations can't be mitigated when you don't have access to, or knowledge of, the training data.
- _Compliance_—Commercial and closed source [[LLM|LLMs]] Because of their generalist nature, they don't follow any sectoral rules.
- _Harmful content generation_—Models can not only reflect societal biases and stereotyping but can also produce unsafe content. In rare cases where a provider has set safety filters on generalist models, these filters can unnecessarily block legitimate content as a side effect.
- _Code generation_—This emergent [[LLM]] ability makes it possible for a broader audience, including people with limited coding skills, to inadvertently generate code with malicious elements or even produce malware. Many third-party [[LLM|LLMs]] lack robust guardrails, and those that exist can be bypassed with carefully crafted prompts. Organisations can build their own guardrails (which isn't a trivial task) or shift the responsibility to internal users to properly validate outputs.

## Vendor Lock-In

Using an [[LLM]] from a provider also ties us to the options they offer and the prices they set. If GPT-4 has been working fine for your workflows, but OpenAI decides it will no longer run GPT-4 models and the only option is to use a much more expensive GPT-5 model, we don't have options. Or a model can be adjusted to perform worse or use more [[Tokenization|tokens]] than needed. An organisation can't plan for long-running toolchains if the prices or performance can change on short or no notice