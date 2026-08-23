---
title: Tool Calling
type: note
status: seed
created: 2026-07-25
updated: 2026-07-25
tags:
  - agents
  - llm
  - tool-calling
  - niah
aliases:
  - Function Calling
  - Tool Use
summary: Tool calling enables LLMs to run code and perform tasks beyond text generation, introducing a 4-message architecture and requiring careful context and tool design for long-horizon agentic tasks.
entities:
  - LLM
  - Harness
topics:
  - Tool Calling
  - Agentic Architecture
  - Message Types
  - Workflows
  - Needle-in-a-Haystack
  - Context Management
related:
  - Agents/Agents.md
  - LLMs/LLMs.md
  - LLMs/Router Pattern.md
  - LLMs/needle-in-a-haystack-20-03-2026.md
  - "[[MCP]]"
  - "[[SLM]]"
---
# Tool Calling

Tool calling is an [[LLM|LLM]] feature that lets models run code or perform tasks beyond just producing text. Tool calls are the core capability that makes [[Agents]] possible.

## Evolution of Message Architecture

* **Before Tool Calling**: Chat interactions only had **2 types of messages**:
  1. User Message
  2. AI Message

* **After Tool Calling**: Agentic architectures introduce **4 types of messages**:
  1. User Message (`user`)
  2. AI Message (`assistant`)
  3. Tool Call Message (`assistant` requesting tool execution)
  4. Tool Response Message (`tool` returning execution results)

> [!NOTE]
> The chat interface (the harness) hides the Tool Call and Tool Response messages from the end user.

---

## How Tool Calling Works

1. **Providing Tools**: We provide the LLM with a list of available tool names, which are mostly functions that the harness (the code calling the LLM) has implemented.
2. **Function Selection**: The LLM gives us the function name and the arguments the function should be called with, wrapped in a **Tool Call** message type.
3. **Execution & Feedback**: Our code executes the function and passes the function's response back to the LLM, wrapped in a **Tool Response** message type.

---

## Tool Calling vs. Traditional NLP Chatbots

Tool calling is very similar to workflows which were used to power earlier NLP-based chatbots:

| Aspect | Traditional NLP Chatbots | LLM Tool Calling |
| :--- | :--- | :--- |
| **Trigger Mechanism** | Users have to explicitly ask for a workflow to be executed. | The LLM can autonomously decide which workflow/tool it wants to run. |
| **Execution Capability** | Executes a single predefined workflow when recognized. | Can chain together multiple workflows autonomously to achieve a goal. |

---

## Tool Selection & Context Limits

The ability of a model to pick the right tool depends heavily on its **[[LLMs/needle-in-a-haystack-20-03-2026|Needle-in-a-Haystack]]** (NIAH) performance:

* **Context Window Degradation**: As the context window grows, the model might start to hallucinate tools or lose the ability to pick the right tool.
* **Long-Horizon Tasks**: For long-horizon tasks, models must maintain the ability to select the correct tool even when context size becomes huge.
* **Specialized Fine-Tuning**: Certain models are specifically fine-tuned for tool calling and agentic workflows to mitigate context degradation.

### Best Practices to Prevent Tool Failures
1. **Avoid Context Bloat**: Do not use too many tools, as large tool sets bloat the context window.
2. **Eliminate Redundancy**: Avoid having two tools that perform the same task to prevent model confusion.

---

## Example of Tool Calling

Below is a standard JSON message sequence illustrating the 4-message lifecycle during a tool call:

### 1. Tool Definition (Provided by Harness)
```json
{
  "name": "get_weather",
  "description": "Get the current weather for a given city",
  "parameters": {
    "type": "object",
    "properties": {
      "location": {
        "type": "string",
        "description": "The city name, e.g. San Francisco"
      }
    },
    "required": ["location"]
  }
}
```

### 2. The 4-Message Lifecycle Payload

```json
[
  {
    "role": "user",
    "content": "What is the weather like in Tokyo?"
  },
  {
    "role": "assistant",
    "content": null,
    "tool_calls": [
      {
        "id": "call_abc123",
        "type": "function",
        "function": {
          "name": "get_weather",
          "arguments": "{\"location\": \"Tokyo\"}"
        }
      }
    ]
  },
  {
    "role": "tool",
    "tool_call_id": "call_abc123",
    "content": "{\"temperature\": \"22°C\", \"condition\": \"Sunny\"}"
  },
  {
    "role": "assistant",
    "content": "The weather in Tokyo is currently sunny with a temperature of 22°C."
  }
]
```