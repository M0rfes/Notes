# Note Refactorer Skill

This skill allows the agent to systematically organize and refactor messy Markdown notes in an Obsidian vault following a specific structural and semantic schema.

## 🛠️ Expertise
- Identifying note types (idea, journal, meeting, project, etc.).
- Inferring recurring patterns (topics, projects, people, technologies).
- YAML front matter injection and standardization.
- Semantic wikilinking (`[[link]]`) and minimal tagging.
- Maintaining original voice while improving structure.

## 📝 Procedural Guidance

### Research Phase
1. **Identify Files:** Locate the messy notes requested for refactoring.
2. **Contextual Analysis:** If multiple notes are provided, compare them first to identify cross-note structures, shared people, or projects.

### Strategy Phase
For each note, determine:
- The **Type** and **Status**.
- Key **Entities** (people, tools, locations).
- **Links** that should be created (high confidence only).
- **Tags** (broad classification, 2-5 max).

### Execution Phase
Apply the following YAML schema:
```yaml
---
title: 
type: 
status: seed
created: 
updated: 
tags: []
aliases: []
summary: 
entities: []
topics: []
related: []
---
```

**Rules:**
- **No Hallucination:** Do not invent facts.
- **Wikilinks:** Only for important, recurring concepts (people, projects, domains).
- **Refactoring:** Reorganize lightly for clarity; do NOT change the writing voice.
- **Summary:** Single sentence in the YAML.

## 📤 Output Requirements
After updating a file, provide:
1. A list of links added and why.
2. Inferred patterns identified.
3. Candidate MOC (Map of Content) suggestions (e.g., [[Projects]], [[People]]).

## 🚨 Safety & Integrity
- Always preserve the `created` date if it exists in current metadata.
- Ensure `updated` is set to the current date.
- Never delete content unless it is a clear duplication that hinders readability.
