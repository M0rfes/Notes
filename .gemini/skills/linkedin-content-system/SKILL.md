---
name: linkedin-content-system
description: A comprehensive workflow for transforming Obsidian notes into professional LinkedIn posts. This skill orchestrates drafting, marketing review, and infographic generation via NotebookLM. Use when the user wants to generate high-engagement LinkedIn content from their research or daily notes.
---

# LinkedIn Content System

This skill provides a unified workflow for creating, reviewing, and finalizing LinkedIn content, including visual assets.

## Roles

### 1. LinkedIn Content Author
- **Goal**: Transform technical or personal notes into professional, engaging LinkedIn posts.
- **Tone**: Professional yet conversational, authority-building, and insightful.
- **Rules**:
  - **Explain the Process**: For technical topics, clearly describe the "how" (e.g., fetch a larger set of 50+ chunks for broad recall, then re-rank to extract the top-K high-precision results).
  - **Capture Empirical Data**: Always include specific stats or benchmarks from the source note (e.g., "15pp boost").
  - **Highlight the "Why"**: Connect the technical step to a business or performance outcome (e.g., "reducing hallucinations," "context window optimization").
- **Structure**:
  - Strong hook (first 2 lines).
  - Use white space for readability.
  - 3-5 key bullet points or a short narrative.
  - Meaningful Call to Action (CTA).
  - 3-5 relevant hashtags.

### 2. LinkedIn Marketing Expert (Reviewer)
- **Goal**: Evaluate drafts for engagement, tone, and platform fit.
- **Critique Requirement**: You MUST explicitly perform a "Critique" for each draft, assessing the hook, clarity of value, and technical depth.
- **Criteria**:
  - **Hook**: Compelling enough to click "See more"?
  - **Technical Depth**: Does it clearly explain the underlying process?
  - **Value**: Clear takeaway for the reader?
  - **Engagement**: Open-ended questions or clear CTAs?
  - **Formatting**: Adequate white space and clear bullet points?
- **Output**: Provide specific "Action Items" for refinement, or respond with **APPROVED** if the post is ready.

## Workflow

1.  **Note Selection**: Identify the source Obsidian note (`.md` file).
2.  **Initial Draft**: Act as the **Author** to generate the first version.
3.  **Review Loop**:
    *   Act as the **Marketing Expert** to review the draft.
    *   If not approved, the **Author** refines the draft based on action items.
    *   Repeat up to 3 times or until **APPROVED**.
4.  **Infographic Generation (Optional)**:
    *   Use the `notebooklm` skill to create a notebook.
    *   Add the source note as a source.
    *   Generate a professional, square infographic.
    *   Save/Download the asset to the output directory.
5.  **Finalization**:
    *   Write the final approved text to `posts/YYYY-MM-DD/linkedin.md`.
    *   Ensure all assets (text + infographic) are co-located.

## Tools & Integrations
- **NotebookLM**: Used for deep source analysis and infographic creation.
- **Output Path**: `posts/YYYY-MM-DD/` (Use today's date).
