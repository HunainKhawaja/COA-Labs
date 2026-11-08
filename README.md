
<div align="center">

# Computer Organization & Architecture
### Laboratory Projects | Fall 2026

**Verilog HDL · RISC-V Assembly · Digital Logic · Processor Design**

![Verilog](https://img.shields.io/badge/Verilog-HDL-5968BA?style=flat-square)
![RISC--V](https://img.shields.io/badge/RISC--V-Assembly-283272?style=flat-square)
![Labs](https://img.shields.io/badge/Labs-09-2B8A78?style=flat-square)
![Semester](https://img.shields.io/badge/Semester-Fall%202026-4B5563?style=flat-square)

</div>

---

## Overview

A collection of hands-on **Computer Organization & Architecture (COA)** laboratory projects completed as part of **EL-2012** at **FAST-NUCES, Islamabad**.

These labs cover fundamental digital logic circuits, combinational and behavioral Verilog modeling, RISC-V assembly programming, and essential processor components.

The repository demonstrates practical implementations of digital systems through hardware description languages, processor-level programming, and simulation tools.

## Lab Index

| Lab | Topic | Key Concepts |
|:---:|---|---|
| [01](Lab_01/) | Digital Logic Fundamentals | Logic gates, gate-level and dataflow modeling |
| [02](Lab_02/) | Combinational Circuits | Half/full adders, decoders and multiplexers |
| [03](Lab_03/) | Behavioral Verilog | 4-bit adder-subtractor and logic selection |
| [04](Lab_04/) | RISC-V Fundamentals | Arithmetic, logical and memory instructions |
| [05](Lab_05/) | Control Flow in RISC-V | Branching, jumps and conditional instructions |
| [06](Lab_06/) | RISC-V Procedures | Procedure calls, stack operations and Fibonacci |
| [07](Lab_07/) | Arithmetic Logic Unit | ALU design, arithmetic operations and testbenches |
| [08](Lab_08/) | Program Counter & Instruction Memory | Address sequencing and instruction fetching |
| [09](Lab_09/) | Register File Design | Register selection, decoding and data operations |

---

## Tools & Technologies

- **Verilog HDL** — Digital circuit design and hardware modeling
- **ModelSim** — Simulation and waveform analysis
- **RISC-V Assembly** — Low-level processor programming
- **Venus Simulator** — RISC-V instruction execution
- **Logisim** — Digital logic circuit simulation

---

## Repository Structure

```text
COA-Labs/
├── Lab_01/
│   ├── l1t1/
│   ├── l1t2/
│   └── ...
├── Lab_02/
├── Lab_03/
├── Lab_04/
├── Lab_05/
├── Lab_06/
├── Lab_07/
├── Lab_08/
├── Lab_09/
├── EXTRACTION_NOTES.md
└── README.md
```

Each lab contains its corresponding tasks, organized using the naming convention:

- `l1t1` — Lab 1, Task 1
- `l1t2` — Lab 1, Task 2
- `l3t2` — Lab 3, Task 2

Source files use `.v` for Verilog and `.s` for RISC-V Assembly. Tasks containing multiple implementations are organized with descriptive filenames.

---

## Learning Outcomes

Through these laboratory exercises, the following concepts were explored:

- Digital logic design using Verilog HDL
- Gate-level, dataflow and behavioral modeling
- Combinational circuit implementation
- RISC-V arithmetic and logical instructions
- Memory operations and control flow
- Stack management and procedure execution
- Arithmetic Logic Unit (ALU) design
- Program Counter and instruction-memory implementation
- Register File architecture and data selection

---

## Running the Projects

**Verilog Projects (Labs 1–3, 7–9)**

1. Open ModelSim.
2. Create a project and add the relevant `.v` file.
3. Compile the Verilog modules.
4. Simulate the relevant testbench.
5. Observe the simulation results and waveforms.

**RISC-V Assembly Projects (Labs 4–6)**

1. Open the Venus RISC-V simulator.
2. Load the relevant `.s` source file.
3. Assemble and execute the program.
4. Inspect registers, memory and output.

> **Note:** Source code has been organized from the original laboratory reports and preserved as submitted. Some programs may require debugging or simulator-specific configuration. Refer to `EXTRACTION_NOTES.md` for additional details.

---

## Author

**Hunain Khawaja**  
BS Computer Engineering  
FAST — National University of Computer and Emerging Sciences, Islamabad

**GitHub:** [HunainKhawaja](https://github.com/HunainKhawaja)

---

<div align="center">

### Computer Organization & Architecture | Fall 2026

*Exploring digital systems, processor architecture and low-level computing.*

</div>
