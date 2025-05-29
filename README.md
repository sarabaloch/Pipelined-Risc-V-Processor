# RISC-V Pipelined Processor Project

## Overview
This project implements a 5-stage pipelined RISC-V processor capable of executing the Bubble Sort algorithm. The implementation progresses through three main tasks:

1. **Single-cycle processor** with sorting capability
2. **Basic pipelined processor** (5-stage pipeline)
3. **Enhanced pipelined processor** with hazard handling

## Key Features
- Bubble Sort implementation in RISC-V assembly
- 5-stage pipeline (IF, ID, EX, MEM, WB)
- Hazard detection and handling (data/control hazards)
- Performance comparison between single-cycle and pipelined versions

## Results
- Successful sorting implementation on single-cycle processor
- Functional pipelined processor with individual instruction execution
- Theoretical performance improvement (174 cycles pipelined vs 428 cycles single-cycle)

## Challenges
- Branch unit implementation
- Pipeline synchronization
- Load/store instruction handling in final task

For full project details, methodology, and implementation specifics, please see the [Project Report](ProjectReport.pdf). 
Credit to my teammate, Maria Adnan, for working extensively on the report as well as documentation of all changes while I handled code.
