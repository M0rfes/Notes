---
title: "Standard I/O & Binary File Streams in C17"
type: reference
topic: "C17"
created: 2026-08-22
updated: 2026-08-22
tags:
  - teach/c17
  - reference
  - stdio
  - file-io
---

[[../C17|← C17 MOC]] · [[../Lessons/0002-binary-file-io-and-rom-loading|Lesson 0002]]

# Standard I/O & Binary File Streams Reference (C17)

> [!NOTE] Production Standards
> Low-level file stream management in C requires strict error code checking, binary mode flags, and understanding record-based reading (`size` vs `nmemb`).

---

## 1. Return Code Conventions in C

Unlike modern languages with exceptions or `Result<T, E>` types, C standard library functions use two distinct return conventions:

| Convention | Success Value | Error / Failure Value | Examples |
| :--- | :--- | :--- | :--- |
| **Status / Error Code** | **`0`** (`EXIT_SUCCESS`) | **Non-zero** (or `< 0`, setting `errno`) | `fseek()`, `fclose()`, `strcmp()`, `pthread_create()` |
| **Value / Count / Handle** | Valid object / count | `NULL` or `EOF` (`-1`) | `fopen()` (`NULL`), `fread()` (items read), `ftell()` (`-1L`) |

> [!TIP] The `fseek` Check Pattern
> According to ISO C17 (§7.21.9.2), `fseek` returns *nonzero* on failure. Always test `if (fseek(f, offset, origin) != 0)` to handle any non-zero error code portably.

---

## 2. Deep Dive: `fread` Parameters

```c
size_t fread(void *ptr, size_t size, size_t nmemb, FILE *stream);
```

`fread` is designed for **structured record reading**, not just unstructured byte streams:

| Parameter | Type | Purpose | In Raw Byte Streams (e.g. ROMs) | In Structured Records (e.g. Structs) |
| :--- | :--- | :--- | :--- | :--- |
| `ptr` | `void*` | Destination buffer address in memory. | `&chip8->memory.memory[0x200]` | `player_array` |
| `size` | `size_t` | **Size of a single element** (in bytes). | `sizeof(uint8_t)` (= 1 byte) | `sizeof(Player)` (= 40 bytes) |
| `nmemb` | `size_t` | **Number of elements** to read. | `file_size` (e.g. 512 bytes) | `10` (for 10 players) |
| `stream` | `FILE*` | Open file stream handle. | `file` | `file` |

$$\text{Total Bytes Read} = \text{size} \times \text{nmemb}$$

### Why `size` and `nmemb` are Split:
`fread` returns the **number of whole elements successfully read (`nmemb`)**, not the raw byte count.
- If reading 10 `Player` structs (40 bytes each) and the file cuts off after 7 full structs (280 bytes), `fread` returns **`7`**.
- This enables instant validation: `if (fread(team, sizeof(Player), 10, f) != 10) { /* handle incomplete read */ }`.

---

## 3. Determining File Size Safely

```c
// 1. Seek to end of file
if (fseek(file, 0, SEEK_END) != 0) {
    // Error handling
}

// 2. Get byte offset
long file_size = ftell(file);
if (file_size <= 0) {
    // Empty or non-seekable file
}

// 3. Always rewind before reading
rewind(file); // Equivalent to: fseek(file, 0, SEEK_SET);
```

---

## 4. Binary Mode (`"rb"`) vs Text Mode (`"r"`)

- **`"rb"` (Binary)**: Reads the raw bytes verbatim from disk into memory with zero transformation. Mandatory for ROMs, images, network payloads, and executables.
- **`"r"` (Text)**: The C runtime may translate newline sequences (e.g., converting `\r\n` to `\n` on Windows or legacy systems), which will corrupt binary opcodes and shift memory offsets.
