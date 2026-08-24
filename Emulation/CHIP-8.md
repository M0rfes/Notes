---
title: CHIP-8
type: concept
status: seed
created: 2026-08-23
updated: 2026-08-24
tags:
  - emulation
  - architecture
  - hardware
  - chip-8
  - virtual-machine
aliases:
  - CHIP-8 Specifications
  - CHIP8
  - COSMAC VIP
---

# Specifications

[[Teach/C17/C17|CHIP-8]] has the following components:

- _Memory_: CHIP-8 has direct access to up to 4 kilobytes of RAM
- _Display_: 64 x 32 pixels (or 128 x 64 for SUPER-CHIP) monochrome, ie. black or white
- A _program counter_, often called just “PC”, which points at the current instruction in memory
- One 16-bit _index register_ called “I” which is used to point at locations in memory
- A _stack_ for 16-bit addresses, which is used to call subroutines/functions and return from them
- An 8-bit _delay timer_ which is decremented at a rate of 60 Hz (60 times per second) until it reaches 0
- An 8-bit _sound timer_ which functions like the delay timer, but which also gives off a beeping sound as long as it’s not 0
- 16 8-bit (one byte) general-purpose _variable_ [[Coding/Register Storage|registers]] numbered `0` through `F` hexadecimal, ie. 0 through 15 in decimal, called `V0` through `VF`
    - `VF` is also used as a _flag register_; many instructions will set it to either 1 or 0 based on some rule, for example, using it as a carry flag

## Memory

CHIP-8 has a total RAM of 4 KB, i.e 4096 bytes in size, and the Index register and Program counter can only address 12 bits, which is 4096 addresses, i.e 12 bits can go from 
`000000000000 = 0` to `111111111111 = 4095` to a total of 4096 addresses.

> [!NOTE]
> The index register, program counter and stack entries are all actually 16 bits long. In theory, they could increment beyond 4 kB of memory addresses. In practice, no CHIP-8 games do that. Early CHIP-8 computers usually had less than 4 kB of RAM anyway.

ALL 4KBs are in RAM; CHIP-8 ROMs can modify themselves because all memory is writable.

> [!NOTE]
> CHIP-8 programs you find online as binary files are often called “ROMs”, like game files for video game emulators, but unlike games on console cartridges they were not actually ROM (which means “read-only memory”).

The [[Teach/C17/Lessons/0002-binary-file-io-and-rom-loading|ROM]] should be loaded at address `0x200`, and fonts are loaded from `0x000` to `0x1ff` or `0x050` to `0x09f`, 512 bytes.

### Fonts

CHIP-8 built-in fonts with sprite data representing hex decimals from 0 to F; each font is 4 pixels wide by 5 pixels tall.

```c
0xF0, 0x90, 0x90, 0x90, 0xF0, // 0
0x20, 0x60, 0x20, 0x20, 0x70, // 1
0xF0, 0x10, 0xF0, 0x80, 0xF0, // 2
0xF0, 0x10, 0xF0, 0x10, 0xF0, // 3
0x90, 0x90, 0xF0, 0x10, 0x10, // 4
0xF0, 0x80, 0xF0, 0x10, 0xF0, // 5
0xF0, 0x80, 0xF0, 0x90, 0xF0, // 6
0xF0, 0x10, 0x20, 0x40, 0x40, // 7
0xF0, 0x90, 0xF0, 0x90, 0xF0, // 8
0xF0, 0x90, 0xF0, 0x10, 0xF0, // 9
0xF0, 0x90, 0xF0, 0x90, 0x90, // A
0xE0, 0x90, 0xE0, 0x90, 0xE0, // B
0xF0, 0x80, 0x80, 0x80, 0xF0, // C
0xE0, 0x90, 0x90, 0x90, 0xE0, // D
0xF0, 0x80, 0xF0, 0x80, 0xF0, // E
0xF0, 0x80, 0xF0, 0x80, 0x80  // F
```

## Display

The display is a 64-pixel-wide and 32-pixel-tall monochrome array, i.e each pixel is either on or off and can be represented by a 64x32 boolean array. The original display ran at 60 Hz. But most emulators redraw when instructions that modify the display are executed.

It is used to draw a “sprite” on the screen. Each sprite consists of 8-bit bytes, where each bit corresponds to a horizontal pixel; sprites are between 1 and 15 bytes tall. They’re drawn to the screen by treating all 0 bits as transparent, and all the 1 bits will “flip” the pixels in the locations of the screen that it’s drawn to.

> [!NOTE]
> This method of drawing will inevitably cause some flickering objects; when a sprite is moved, it’s first erased from the screen (by simply drawing it again, flipping all its lit pixels) and then re-drawn in the new position, so it will disappear for a little while, often causing a flickering effect.

## Stack

CHIP-8 has a stack, a first-in, last-out data structure that holds 16-bit (12-bit in reality) addresses that are just return addresses for the subroutines (“functions”); there can be a max of 16 subroutines, i.e., the stack can only hold up to 16 addresses.

Early [[Teach/C17/Lessons/0001-c17-standards-and-modern-toolchain|interpreters]] reserved some memory for the stack, and some programs would use that knowledge to operate the stack directly and save stuff there, but you don’t need to do that. You can just use a variable outside the emulated memory.

## Timers

There are 2 Timer registers: the sound timer and the delay timer; both are 8-bit. They should decrement themselves 60 times a second, i.e., 60 Hz.
The sound timer should make the computer beep until it's zero.
The speed of the fetch/decode/execute loop is independent of the timer.
Chip-8 games will check the delay timer and will delay themselves if they want to.

## Keypad
The earliest computers that CHIP-8 were used with had hexadecimal keypads. These had 16 keys, labelled `0` through `F`, and were arranged in a 4x4 grid.

These keypads all had different layouts, but the COSMAC VIP used the following layout, which was re-used on the HP48 calculators, so that’s what everyone implements these days:

| 1   | 2   | 3   | C   |
| --- | --- | --- | --- |
| 4   | 5   | 6   | D   |
| 7   | 8   | 9   | E   |
| A   | 0   | B   | F   |

We will just map the digits from the keyboard to the virtual keys.

## Fetch/Decode/Execute Loop

The main loop of the emulator includes:
- **Fetch** the instruction from memory at the current PC (program counter)
- **Decode** the instruction to find out what the emulator should do
- **Execute** the instruction and do what it tells you

### Timing
The original CHIP-8 interpreter ran on machines with CPU speed of 1MHz to 4MHz. That comes to about 700 instructions per second; if we run the programs at the native speed the programs will be unplayable.

### Fetch
Reading the instruction pointed to by PC (program counter). Each instruction is 2 bytes (16 bits long), so you will need to read two successive bytes from memory and combine them into one 16-bit instruction, and increment PC by 2 (or 4 to skip an instruction depending on instructions read).

### Decode
CHIP-8 instructions are divided into broad categories by the first “nibble”, or “half-byte”, i.e. 4 bits, which is the first hexadecimal number.

Although every instruction will have a first nibble that tells you what kind of instruction it is, the rest of the nibbles will have different meanings. To differentiate these meanings, we usually call them different things, but all of them can be any hexadecimal number from `0` to `F`:

- `X`: The second nibble. Used to look up one of the 16 registers (`VX`) from `V0` through `VF`.
- `Y`: The third nibble. Also used to look up one of the 16 registers (`VY`) from `V0` through `VF`.
- `N`: The fourth nibble. A 4-bit number.
- `NN`: The second byte (third and fourth nibbles). An 8-bit immediate number.
- `NNN`: The second, third and fourth nibbles. A 12-bit immediate memory address.

### Execute
Depending on the implementation, these can be a switch case or a function execution using a function pointer and jump table.
## Instructions
- `00E0` (clear screen)
- `1NNN` (jump)
- `6XNN` (set register `VX`)
- `7XNN` (add value to register `VX`)
- `ANNN` (set index register I)
- `DXYN` (display/draw)

### `0NNN`: Execute machine language routine
These instructions don't need to be implemented in the emulator, as it would push the execution and execute the subroutine written at address NNN instead of the host machine.

### `00E0`: Clear screen
This is pretty simple: it should clear the display, setting all pixels to 0.

### `1NNN`: Jump
This instruction should simply set PC to `NNN`, causing the program to jump to that memory location. Do not increment the PC afterwards; it jumps directly there.

### `00EE` and `2NNN`: Subroutines
`2NNN` calls the subroutine at memory location `NNN`. In other words, just like `1NNN`, you should set PC to `NNN`. However, the difference between a jump and a call is that this instruction should first push the current PC to the stack, so the subroutine can return later.

Returning from a subroutine is done with `00EE`, and it does this by removing (“popping”) the last address from the stack and setting the PC to it.

### `3XNN`, `4XNN`, `5XY0` and `9XY0`: Skip conditionally
These instructions do the same thing: They either do nothing, or they skip one two-byte instruction (increment PC by 2) if some condition is true.
They execute the next instruction if and only if the condition is _not_ true. Since these conditional branch instructions can only skip one instruction, they’re usually followed by a jump/call (`1NNN`/`2NNN`) instruction which jumps to the actual “`if` code block” that should be executed if the condition _is_ true.
`3XNN` will skip one instruction if the value in `VX` is equal to `NN`, and `4XNN` will skip if they are _not_ equal.
`5XY0` skips if the values in `VX` and `VY` are equal, while `9XY0` skips if they are _not_ equal.

### `6XNN`: Set
Simply set the register `VX` to the value `NN`.

### `7XNN`: Add
Add the value `NN` to `VX`.

Note that on most other systems, and even in some of the other CHIP-8 instructions, this would set the carry flag if the result overflowed 8 bits; in other words, if the result of the addition is over 255.

For this instruction, this is not the case. If `V0` contains `FF` and you execute `7001`, the CHIP-8’s flag register `VF` is not affected.

Note: On the COSMAC VIP, all of these instructions changed the value of `VF`. Some of them are mentioned below. For the ones that don’t mention affecting `VF`, the resulting value in `VF` is undefined. This is because the CHIP-8 interpreter dispatched these instructions to the 1802 CPU’s [ALU](https://en.wikipedia.org/wiki/Arithmetic_logic_unit) circuit, and while doing so it would change the CPU’s flag register, which always gets copied to `VF`.

#### `8XY0`: Set
`VX` is set to the value of `VY`.

#### `8XY1`: Binary OR
`VX` is set to the [bitwise/binary logical disjunction (OR)](https://en.wikipedia.org/wiki/Bitwise_operation#OR) of `VX` and `VY`. `VY` is not affected.

#### `8XY2`: Binary AND
`VX` is set to the [bitwise/binary logical conjunction (AND)](https://en.wikipedia.org/wiki/Bitwise_operation#AND) of `VX` and `VY`. `VY` is not affected.

#### `8XY3`: Logical XOR
`VX` is set to the [bitwise/binary exclusive OR (XOR)](https://en.wikipedia.org/wiki/Bitwise_operation#XOR) of `VX` and `VY`. `VY` is not affected.

#### `8XY4`: Add
`VX` is set to the value of `VX` plus the value of `VY`. `VY` is not affected.

Unlike `7XNN`, this addition _will_ affect the carry flag. If the result is larger than 255 (and thus overflows the 8-bit register `VX`), the flag register `VF` is set to 1. If it doesn’t overflow, `VF` is set to 0.

#### `8XY5` and `8XY7`: Subtract
These both subtract the value in one register from the other, and put the result in `VX`. In both cases, `VY` is not affected.

`8XY5` sets `VX` to the result of `VX` - `VY`.

`8XY7` sets `VX` to the result of `VY` - `VX`.

This subtraction will also affect the carry flag, but note that it’s opposite from what you might think. If the minuend (the first operand) is larger than or equal to the subtrahend (second operand), `VF` will be set to 1. If the subtrahend is larger, and we “underflow” the result, `VF` is set to 0. Another way of thinking of it is that `VF` is set to 1 before the subtraction, and then the subtraction either borrows from `VF` (setting it to 0) or not.

#### `8XY6` and `8XYE`: Shift

> Ambiguous instruction!

In the CHIP-8 interpreter for the original COSMAC VIP, this instruction did the following: It put the value of `VY` into `VX`, and then shifted the value in `VX` 1 bit to the right (`8XY6`) or left (`8XYE`). `VY` was not affected, but the flag register `VF` would be set to the bit that was shifted out.

However, starting with CHIP-48 and SUPER-CHIP in the early 1990s, these instructions were changed so that they shifted `VX` in place and ignored the `Y` completely.

This is one of the main differences between implementations that cause problems for programs. Since different games expect different behaviour, you could consider making the behaviour configurable by the user.

Step by step:

1. (Optional, or configurable) Set `VX` to the value of `VY`
2. Shift the value of `VX` one bit to the right (`8XY6`) or left (`8XYE`)
3. Set `VF` to 1 if the bit that was shifted out was 1, or 0 if it was 0

### `ANNN`: Set index

This sets the index register I to the value `NNN`.

### `BNNN`: Jump with offset

> Ambiguous instruction!

In the original COSMAC VIP interpreter, this instruction jumped to the address `NNN` plus the value in the register `V0`. This was mainly used for “jump tables”, to quickly be able to jump to different subroutines based on some input.

Starting with CHIP-48 and SUPER-CHIP, it was (probably unintentionally) changed to work as `BXNN`: It will jump to the address `XNN`, plus the value in the register `VX`. So the instruction `B220` will jump to address `220` plus the value in the register `V2`.

The `BNNN` instruction was not widely used, so you might be able to just implement the first behavior (if you pick one, that’s definitely the one to go with). If you want to support a wide range of CHIP-8 programs, make this “quirk” configurable.

### `CXNN`: Random
This instruction generates a random number, binary-ANDs it with the value NN, and places the result in `VX`.


> Note that you should not simply generate a random number between 0 and `NN`! You need to do a binary AND.

### `DXYN`: Display

This is the most involved instruction. It will draw an `N` pixels tall sprite from the memory location that the `I` index register is holding to the screen, at the horizontal X coordinate in `VX` and the Y coordinate in `VY`. All the pixels that are “on” in the sprite will flip the pixels on the screen that it is drawn to (from left to right, from most to least significant bit). If any pixels on the screen were turned “off” by this, the `VF` flag register is set to 1. Otherwise, it’s set to 0.

Sounds hard? Well, it is, a little.

The first thing to do is to get the X and Y coordinates from `VX` and `VY`.

> A common mistake here is to use `X` and `Y` directly; don’t do that, fetch them from the registers.

One area where people get confused is whether sprites should wrap if they go over the edge of the screen. The answer is yes and no.

The sprite's starting position will wrap. In other words, an X coordinate of 5 is the same as an X of 68 (since the screen is 64 pixels wide). Another way of saying it is that the coordinates are _modulo_ (or binary AND) the size of the display (when counting from 0).

However, the actual drawing of the sprite should not wrap. If a sprite is drawn near the edge of the screen, it should be clipped, and not wrap. The sprite should be partly drawn near the edge, and the other part should not reappear on the opposite side of the screen.

Skip this if you want to try to implement it yourself first, but here’s a step by step summary of what this instruction should do:

- Set the X coordinate to the value in `VX` _modulo_ 64 (or, equivalently, `VX & 63`, where & is the binary AND operation)
- Set the Y coordinate to the value in `VY` _modulo_ 32 (or `VY & 31`)
- Set `VF` to 0
- For `N` rows:
    - Get the Nth byte of sprite data, counting from the memory address in the `I` register (`I` is not incremented)
    - For each of the 8 pixels/bits in this sprite row (from left to right, ie. from most to least significant bit):
        - If the current pixel in the sprite row is on and the pixel at coordinates X,Y on the screen is also on, turn off the pixel and set `VF` to 1
        - Or if the current pixel in the sprite row is on and the screen pixel is not, draw the pixel at the X and Y coordinates
        - If you reach the right edge of the screen, stop drawing this row
        - Increment X (`VX` is not incremented)
    - Increment Y (`VY` is not incremented)
    - Stop if you reach the bottom edge of the screen


### `EX9E` and `EXA1`: Skip if key
Like the earlier skip instructions, these two also skip the following instruction based on a condition. These skip based on whether the player is currently pressing a key or not.

These instructions (unlike the later `FX0A`) don’t wait for input, they just check if the key is currently being held down.

`EX9E` will skip one instruction (increment PC by 2) if the key corresponding to the value in `VX` is pressed.

`EXA1` skips if the key corresponding to the value in `VX` is _not_ pressed.

Since the keypad is hexadecimal, the valid values here are keys `0`–`F`.

### `FX07`, `FX15` and `FX18`: Timers

These all manipulate the timers.

- `FX07` sets `VX` to the current value of the delay timer
- `FX15` sets the delay timer to the value in `VX`
- `FX18` sets the sound timer to the value in `VX`

Note that there’s no instruction to read the sound timer; the sound timer will simply make a beeping sound as long as it’s above 0.

### `FX1E`: Add to index

The index register I will get the value in `VX` added to it.

> Unlike other arithmetic instructions, this did not affect `VF` on overflow on the original COSMAC VIP. However, it seems that some interpreters set `VF` to 1 if I “overflows” from `0FFF` to above `1000` (outside the normal addressing range). This wasn’t the case on the original COSMAC VIP, at least, but apparently the CHIP-8 interpreter for Amiga behaved this way. At least one known game, _Spacefight 2091!_, relies on this behavior. I don’t know of any games that rely on this _not happening_, so perhaps it’s safe to do it like the Amiga interpreter did.

### `FX0A`: Get key

This instruction “blocks”; it stops executing instructions and waits for key input (or loops forever, unless a key is pressed).

In other words, if  PC is incremented after fetching each instruction, then it should be _decremented_ again here unless a key is pressed. Otherwise, PC should simply not be incremented.

Although this instruction stops the program from executing further instructions, the timers (delay timer and sound timer) should still be decreased while it’s waiting.

If a key is pressed while this instruction is waiting for input, its hexadecimal value will be placed in VX , and execution will continue.

> On the original COSMAC VIP, the key was only registered when it was pressed _and then released_.

### `FX29`: Font character

The index register I is set to the address of the hexadecimal character in `VX`. The font is stored from `0x000` to `0x1FF`.

> An 8-bit register can hold two hexadecimal numbers, but this would only point to one character. The original COSMAC VIP interpreter just took the last nibble of `VX` and used that as the character.

### `FX33`: Binary-coded decimal conversion
This instruction is a little involved. It takes the number in `VX` (which is one byte, so it can be any number from 0 to 255) and converts it to three decimal digits, storing these digits in memory at the address in the index register I. For example, if `VX` contains 156 (or `9C` in hexadecimal), it would put the number 1 at the address in I, 5 in address I + 1, and 6 in address I + 2.

### `FX55` and `FX65`: Store and load memory

> Ambiguous instruction!

These two instructions store registers to memory, or load them from memory, respectively.

For `FX55`, the value of each variable register from `V0` to `VX` inclusive (if `X` is 0, then only `V0`) will be stored in successive memory addresses, starting with the one that’s stored in `I`. `V0` will be stored at the address in `I`, `V1` will be stored in `I + 1`, and so on, until `VX` is stored in `I + X`.

`FX65` does the opposite; it takes the value stored at the memory addresses and loads them into the variable registers instead.

The original CHIP-8 interpreter for the COSMAC VIP actually incremented the `I` register while it worked. Each time it stored or loaded one register, it incremented `I`. After the instruction was finished, `I` would end up being set to the new value `I + X + 1`.

However, modern interpreters (starting with CHIP48 and SUPER-CHIP in the early 90s) used a temporary variable for indexing, so when the instruction was finished, `I` would still hold the same value as it did before.


## Troubleshooting

Your emulator is done! What’s that? Something’s not working?

To make your life easier, you should add some rudimentary debugging capabilities. For example, you should be able to step through CHIP-8 instructions one by one, pausing the regular loop. You should also be able to print the contents of registers and memory. That way you can step through a program and see that it behaves like you expect.

One thing you should do is print out an error message if your emulator tries to execute an unknown instruction. There aren’t many of them, but if you suddenly try to execute a lot of `0000` instructions, you know you’ve somehow reached uninitialized memory, or maybe you’re trying to execute data (like graphics/sprites) as code.

Like I said before, you should start out by getting the IBM logo program to run. Once you can draw to the screen properly, run one of the CHIP-8 test programs you can find online. They will check your instructions and tell you which ones aren’t working properly. (Note that for the ambiguous instructions, they will mostly expect the “modern” behavior.)

If you’re still stumped, you can of course ask for help in the comments to this article below. There are also some great places to ask for help:

- [/r/EmuDev on reddit](https://reddit.com/r/EmuDev)
- [The Emulation Development Discord server](https://discord.com/invite/7nuaqZ2) (there’s a #chip-8 channel)

## What Next

If you’re like most people, you are now done with your obligatory “Hello, world!” emulator, and are ready to tackle your dream project. You could move on to emulating the Intel 8080 Space Invaders arcade cabinet if you want to learn more. Or perhaps you want to make a Game Boy emulator next; it has a lot more instructions and the screen drawing is more complex, but it’s still not too complicated to get a lot of games running.

But if you think CHIP-8 is an interesting platform, there are many things you could do.

### Make Your Own CHIP-8 Game

Now that you know CHIP-8’s instruction set pretty thoroughly, why not try to make a game that can run in your own emulator?

Although CHIP-8 is from the 70s originally, most games for it by this point are actually fairly modern - every October for a decade, an annual game jam called “Octojam” was organized, where people made games/programs for CHIP-8 (and SUPER-CHIP/XO-CHIP). It’s sadly not held anymore, but you can check out past jams and games at [Octojam.com](http://octojam.com/).

If you do make a game, you can submit it to the public [CHIP-8 Archive](https://johnearnest.github.io/chip8Archive/?sort=platform). You can also find lots of great games to test your emulator with here.

Typing in raw bytes to program your game isn’t very user friendly in 2020, so most people now use [Octo](http://johnearnest.github.io/Octo/), a high-level assembler for CHIP-8. There are also more traditional assemblers out there.

### Add SUPER-CHIP Support

SUPER-CHIP, which debuted on HP48 graphing calculators in 1991, makes things a little less primitive. It expands the resolution to 128 x 64, and adds some instructions for scrolling the display and drawing larger sprites in one go.

It also changes the semantics of some CHIP-8 instructions, as I’ve detailed above, so options for toggling that behavior (“quirks”) will be a good idea. With SUPER-CHIP support, you will be able to run most programs you can find scattered around the net.

Here’s a good quick guide to [Mastering Super-CHIP](http://johnearnest.github.io/Octo/docs/SuperChip.html).

### Add Debug Capabilities

This would make your emulator useful to two groups of people: People who develop CHIP-8 games will be able to debug their games, and people who develop CHIP-8 emulators will be able to develop side by side with your emulator to see what they’re doing wrong.

Debug interfaces can be very cool to make. [Look at this beauty!](https://twitter.com/kraptor/status/1153936421209509888)

Plus, learning how to make a debug interface will be very useful for other emulator projects. For more advanced systems, you’ll basically be doing it blind if you don’t have a way to inspect your emulator’s state.

### Add XO-CHIP Support

XO-CHIP is a modern extension of SUPER-CHIP. It adds two more colors, advanced sound capabilities, and supports 64 kb of memory. There aren’t too many XO-CHIP interpreters out there, so you could make something pretty unique. [Read more about XO-CHIP here.](http://johnearnest.github.io/Octo/docs/XO-ChipSpecification.html)

### Make a CHIP-8 Emulator for an Obscure System

CHIP-8 runs on everything. There’s an emulator for the SNES!

But maybe there’s some platform that’s missing a good emulator? Maybe you want to try learning homebrew development for an old console, and think CHIP-8 would be a simple experiment? What about a really good ncurses emulator that you can run over SSH? Or what about a Telnet server you can connect to and play CHIP-8 on? Or how about playing CHIP-8 in your web browser’s inspect mode, like [Inspect This Snake](https://twitter.com/matthewrayfield/status/1189531704647733248)?

