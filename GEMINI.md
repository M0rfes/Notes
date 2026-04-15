# //GEMINI

Foundational project context and agent mandates for the Obsidian vault and Gemini Scribe integration.

## Project Overview
This project is an **Obsidian Vault** designed for Personal Knowledge Management (PKM) with a heavy focus on AI-assisted workflows. It serves as a technical repository for Large Language Models (LLMs), AI systems engineering, and software architecture research, while also functioning as a production environment for professional content creation (e.g., LinkedIn posts).

### Main Technologies
- **Obsidian**: Core note-taking and PKM platform.
- **Gemini Scribe**: Integration of Google's Gemini models for prompts, summarization, and content generation.
- **Obsidian Git**: Version control and synchronization.
- **Notebook Navigator**: Advanced navigation and visualization within the vault.
- **NotebookLM**: (External) Used for deep source analysis and infographic creation via custom skills.

## Directory Overview
The vault is organized into functional domains to support both native Obsidian features and custom AI requirements:

- **`LLMs/`**: Primary technical repository covering Tokenization, Quantization, vLLM, RAG (Agentic, GraphRAG), and more.
- **`Architecture/`**: Deep-dive research on systems design (Microservices, DDIA).
- **`gemini-scribe/`**: Primary hub for AI-related configurations.
    - **`Prompts/`**: Markdown-based prompt templates (e.g., `Note Organizer`, `LinkedIn Author`).
    - **`Agent-Sessions/`**: Histories and outputs from AI-driven sessions.
    - **`skills/`**: Custom agent skills.
- **`posts/`**: Staging area for generated content, organized by date (e.g., `posts/YYYY-MM-DD/`).
- **`Agents/`**: Specialized research and personas for autonomous systems.
- **`Daily Notes/`**: Chronological logs for tracking progress and methodology (e.g., 'Eat the Frog').
- **`.gemini/`**: CLI-level agent skills (e.g., `obsidian-cli`, `notebooklm`) for advanced vault interaction.

## Key Files
- **`gemini-scribe/AGENTS.md`**: Contains comprehensive organizational progress, preferences, and custom instructions for AI agents.
- **`gemini-scribe/example-prompts.json`**: Reference for common AI tasks (synthesis, drafting, review).
- **`Statements/Statements.md`**: High-level declarations and foundational project principles.

## Usage & Conventions
### Note Structure
All notes should follow a standardized YAML frontmatter schema to ensure consistency and discoverability:
```yaml
---
title: 
type: # research, journal, reference, task, etc.
status: seed # seed, budding, evergreen
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: []
aliases: []
summary: 
entities: []
topics: []
related: []
---
```

### Naming Conventions
- **Technical/Study Notes**: Maintain a temporal record using the `topic-DD-MM-YYYY` suffix (e.g., `Agentic-RAG-01-04-2026`).
- **Core Concepts**: Files in the `LLMs/` directory may use direct topical names for evergreen content.

### AI Interaction Mandates
- **Technical Precision**: Prioritize data from `LLMs/`, `Architecture/`, and `tools/` for technical queries.
- **Content Alignment**: Drafts in `posts/` must be grounded in the technical research found in the vault.
- **Workflow**: Follow the **Research -> Strategy -> Execution** cycle for complex tasks, utilizing specialized skills like `linkedin-content-system` for content pipelines.
