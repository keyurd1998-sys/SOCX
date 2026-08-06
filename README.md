# SOCX ASIC Design Flow Learning Repository

This repository is an educational walkthrough of a digital ASIC design flow using Cadence tools. It is designed for engineering students who already understand basic digital logic but are new to the Cadence design environment.

The flow here starts from RTL and moves through constraints, synthesis, and design-for-test implementation. The goal is not only to show the commands, but also to explain why each step matters in real ASIC development.

---

## 🎯 Learning Objectives

By the end of this learning path, a student should be able to:

- Understand the overall RTL-to-GDS-style ASIC flow.
- Read and interpret timing constraints written in SDC/Tcl.
- Run Cadence Genus for synthesis and understand the generated outputs.
- Understand the purpose of scan insertion, DFT rules, and ATPG.
- Recognize the difference between functional RTL, synthesized gate-level netlist, and test-ready logic.
- Follow a structured documentation path through the repository.

---

## 🧭 What This Repository Contains

This project brings together several key stages of a modern digital implementation flow:

- RTL source files in [RTL](RTL)
- Timing and environment constraints in [CONSTRAINTS](CONSTRAINTS)
- Synthesis flow and reports in [SYNTHESIS](SYNTHESIS)
- DFT and scan-related stages in [DFT](DFT)

The design is centered around a digital system that includes UART-related blocks, an ALU, FIFOs, clock dividers, synchronizers, and control logic.

---

## 🌳 Repository Structure

```text
SOCX/
├── README.md
├── CONSTRAINTS/
│   ├── README.md
│   ├── cons.tcl
│   └── TOP_cons.tcl
├── DFT/
│   ├── 0_DRC_CHECK/
│   ├── 1_DRC_FIX/
│   ├── 2_SCAN_INITIAL/
│   ├── 3_SCAN_WITH_ATPG_ANALYSIS_N_TPI/
│   ├── 4_SCAN_COMPRESSION_ANALYSIS/
│   ├── 5_INSERT_SCAN_COMPRESSION_LOGIC/
│   └── 6_INSERT_JTAG_LOGIC/
├── RTL/
│   ├── ALU_16B.v
│   ├── Async_fifo.v
│   ├── TOP.sv
│   └── ...
└── SYNTHESIS/
    ├── README.md
    ├── synth.tcl
    ├── genus.cmd
    └── TOP_Synth/
```

---

## 🧰 Prerequisites

Before using this repository, make sure you have:

- A Linux-based workstation or server.
- Cadence Genus installed and licensed.
- Cadence Modus ATPG available if you want to run the DFT/ATPG flow.
- Access to the standard-cell timing library files used by the scripts.
- A basic understanding of:
  - RTL design
  - Verilog/SystemVerilog
  - Tcl scripting
  - Clocking and timing concepts

> In many university or corporate environments, the standard cell libraries are not stored inside this repository. The scripts expect them to be available in a separate library path, such as a shared lab directory.

---

## ⚙️ Required Cadence Tools

The current repository is mainly built around the following tools:

- Genus: synthesis, mapping, reporting, and netlist generation
- Modus: ATPG generation and test pattern execution
- Optional future stage: Innovus for placement and routing

### Common launch commands

#### 1. Start Genus in interactive GUI mode

```bash
genus
```

Once inside the Genus console, you can source a script manually:

```tcl
genus@root:> source SYNTHESIS/synth.tcl
```

#### 2. Run Genus in batch mode

```bash
genus -files SYNTHESIS/synth.tcl
```

#### 3. Run Modus ATPG in batch mode

```bash
modus -files DFT/5_INSERT_SCAN_COMPRESSION_LOGIC/runmodus.atpg.tcl
```

> If your environment uses a setup script for Cadence tools, source it first. The exact path depends on your lab or installation.

---

## 🔄 Top-Level Design Flow

This repository follows a practical ASIC implementation path:

1. RTL Development
   - The design is written in Verilog/SystemVerilog inside [RTL](RTL).
   - The top module is the main entry point for the complete design.

2. Timing and Physical Constraints
   - The constraints are collected in [CONSTRAINTS](CONSTRAINTS).
   - These define clocks, generated clocks, input/output delays, and environmental rules.

3. Synthesis with Genus
   - The flow in [SYNTHESIS](SYNTHESIS) reads the RTL, applies constraints, maps logic to technology cells, and writes reports and netlists.

4. Design-for-Test Insertion
   - The stages under [DFT](DFT) introduce scan chains, check DFT rules, fix violations, and analyze compression options.

5. ATPG Generation
   - Test patterns are generated so the chip can be tested after fabrication.

6. Physical Design (future stage)
   - The next logical step after synthesis and DFT is placement and routing, usually done with Innovus.

---

## 📦 Key Inputs and Outputs

### Inputs

- RTL files from [RTL](RTL)
- SDC/Tcl constraints from [CONSTRAINTS](CONSTRAINTS)
- Standard-cell libraries and technology files
- Parameter values used during elaboration

### Outputs

- Synthesized gate-level netlists
- Timing reports and QoR summaries
- Scan chain reports and ATPG files
- Test-ready netlists for DFT analysis

---

## 🧠 How to Use This Repository as a Student

A good study order is:

1. Start with [CONSTRAINTS](CONSTRAINTS) to learn how timing constraints shape synthesis.
2. Move to [SYNTHESIS](SYNTHESIS) to see how RTL becomes a gate-level implementation.
3. Explore [DFT](DFT) to understand how testability is added to the design.
4. Compare the scripts with the generated reports to connect theory to tool behavior.

---

## 📚 Proposed Documentation Structure

The documentation in this repository is intended to be expanded step by step. The planned structure is:

- [CONSTRAINTS](CONSTRAINTS) — explanation of clock definitions, generated clocks, I/O delays, and DRC-style constraints
- [SYNTHESIS](SYNTHESIS) — interpretation of synthesis scripts, netlist generation, and report analysis
- [DFT/0_DRC_CHECK](DFT/0_DRC_CHECK) — how DFT rule checks are performed
- [DFT/1_DRC_FIX](DFT/1_DRC_FIX) — how violations are corrected
- [DFT/2_SCAN_INITIAL](DFT/2_SCAN_INITIAL) — initial scan chain setup
- [DFT/3_SCAN_WITH_ATPG_ANALYSIS_N_TPI](DFT/3_SCAN_WITH_ATPG_ANALYSIS_N_TPI) — ATPG and test point analysis
- [DFT/4_SCAN_COMPRESSION_ANALYSIS](DFT/4_SCAN_COMPRESSION_ANALYSIS) — scan compression evaluation
- [DFT/5_INSERT_SCAN_COMPRESSION_LOGIC](DFT/5_INSERT_SCAN_COMPRESSION_LOGIC) — compression logic insertion and ATPG generation
- [DFT/6_INSERT_JTAG_LOGIC](DFT/6_INSERT_JTAG_LOGIC) — JTAG-based test infrastructure

Each of these sections will include:

- What the stage is for
- Which files are important
- Which commands to run
- What inputs and outputs to expect
- A line-by-line explanation of the Tcl scripts

---

## ✅ Recommended First Steps

If you are new to this flow, begin here:

```bash
cd SOCX
ls
```

Then read the documentation in this order:

1. [CONSTRAINTS](CONSTRAINTS)
2. [SYNTHESIS](SYNTHESIS)
3. [DFT](DFT)

This will give you a solid introduction to how a real digital IC implementation flow is organized in practice.

---

## 💡 Final Note

The most important skill in Cadence-based design is not just learning syntax. It is learning how to connect the RTL intent, the timing constraints, the synthesis decisions, and the test strategy into one coherent implementation story.

This repository is intended to help you develop exactly that intuition.
