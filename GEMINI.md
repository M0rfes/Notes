---
title: //GEMINI
type: system-reference
status: active
created: 2026-03-29
updated: 2026-03-29
tags: [system, project-management, ai-instructions]
aliases: [Project Context, Gemini CLI Instructions]
summary: Foundational project context and agent mandates for the Obsidian vault and Gemini Scribe integration.
entities: [Gemini CLI, Gemini Scribe]
topics: [Directory Structure, Usage Guidelines, Engineering Standards]
related: [gemini-scribe/AGENTS.md]
---

# Project Overview
This project is an **Obsidian Vault** designed for Personal Knowledge Management (PKM) with a heavy focus on AI-assisted workflows. It utilizes the **Gemini Scribe** plugin to integrate Google's Gemini models directly into the note-taking process.

The vault includes specialized configurations for AI agents and custom skills to automate and enhance research, summarization, and content generation.

## Directory Overview
The vault is structured to support both Obsidian's native features and the custom requirements of the Gemini Scribe plugin:

- **`.obsidian/`**: Core Obsidian configuration, workspace settings, and community plugins (`gemini-scribe`, `obsidian-git`).
- **`gemini-scribe/`**: Primary hub for AI-related configurations.
    - **`Agent-Sessions/`**: Histories and outputs from Gemini-driven agent sessions.
    - **`Prompts/`**: Markdown-based prompt templates used by the plugin.
    - **`skills/`**: Custom agent skills.
- **`.gemini/`**: CLI-level agent skills (e.g., `obsidian-cli`) for advanced vault interaction.
- **`LLMs/`**: Technical repository for AI concepts like [[Tokenization]] and [[Needle-in-a-Haystack]].
- **`Daily Notes/`**: Chronological logs managed via a dedicated template.

## Usage
1. **AI Interaction**: Use the Gemini Scribe plugin to run prompts in `gemini-scribe/Prompts/`.
2. **PKM Development**: Organized using systems like PARA or Zettelkasten.
3. **Advanced Debugging**: Use the `obsidian-cli` skill for technical inspection.
4. **Agent Context**: Refer to [[gemini-scribe/AGENTS.md]] for detailed organizational progress and preferences.
