# ARM Assembly Programming Exercises - CO224

![ARM Architecture](https://img.shields.io/badge/Architecture-ARM32-red)
![University](https://img.shields.io/badge/University-Peradeniya-blue)

This repository contains ARM Assembly programs developed for the **CO224 - Software Architecture** course, covering fundamental concepts of low-level programming.

## 📁 Lab Exercises

### Lab 1: Introduction to Assembly
- Basic arithmetic operations
- Register manipulation
- Memory access (load/store)
- Simple program structure

### Lab 2: Branching & Conditions
- Conditional execution
- Comparison operations
- If-else structures
- Looping constructs

### Lab 3: Function Call & Return
- Subroutine implementation
- Stack operations
- Parameter passing
- Preservation of registers

## 🛠️ Development Environment
- **Emulator:** QEMU
- **Assembler:** GNU ARM Assembler (as)
- **Debugger:** GDB
- **Platform:** Raspberry Pi (ARMv6/7)

## 🔧 How to Build & Run
- **Assemble :** arm-linux-gnueabi-as program.s -o program.o

- **Link :**  arm-linux-gnueabi-ld program.o -o program

- **Run in QEMU :** qemu-arm ./program
