# 1x3 Packet Router Design & UVM Verification

## Overview
This repository contains the RTL design and an end-to-end UVM 1.2 testbench for an 8-bit, 3-channel packet router[span_3](start_span)[span_3](end_span). The router features FSM destination decoding, parity checking, and internal FIFO buffers for data flow management[span_4](start_span)[span_4](end_span).

## Verification Architecture
The verification environment is architected using **SystemVerilog** and **UVM 1.2**[span_5](start_span)[span_5](end_span). 

* **UVCs:** Implemented reusable active and passive Universal Verification Components (sequencers, drivers, monitors)[span_6](start_span)[span_6](end_span).
* **Scoreboard:** Utilizes a TLM analysis scoreboard with dynamic queuing for automated, cycle-accurate packet comparison[span_7](start_span)[span_7](end_span).
* **Coverage:** Achieved 100% functional and code coverage closure under randomized regressions by defining covergroups and cross-coverage bins for packet lengths, output addresses, and corrupt parity payloads[span_8](start_span)[span_8](end_span).

## Tech Stack
* **Languages:** Verilog HDL, SystemVerilog[span_9](start_span)[span_9](end_span)
* **Methodology:** UVM 1.2, Constrained-Random Verification (CRV), OOP[span_10](start_span)[span_10](end_span)
* **EDA Tools:** QuestaSim / Synopsys VCS[span_11](start_span)[span_11](end_span)
