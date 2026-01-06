# Line Follower Robot using FPGA

## Overview
This project implements a line follower robot using FPGA-based control logic.
IR sensor inputs are processed using Verilog HDL to generate motor control signals
for autonomous line following. The design is verified using RTL simulation in Vivado.

## Objective
- To design a hardware-based line follower robot using FPGA
- To process sensor inputs using RTL logic
- To generate real-time motor control signals

## Tools & Technologies
- Vivado Design Suite
- Verilog HDL
- FPGA Development Board
- IR Sensors
- DC Motors / Motor Driver

## Project Structure
- `src/` : Verilog source files (line follower control logic)
- `tb/` : Testbench files for simulation
- `constraints/` : XDC constraints file
- `docs/` : RTL schematic and simulation waveform

## Working Principle
- IR sensors detect the line position
- Sensor inputs are compared and decoded using RTL logic
- Control commands are generated based on sensor values
- Motor driver signals (`m1a`, `m1b`, `m2a`, `m2b`) control robot movement

## Simulation & Verification
- Behavioral simulation performed using Vivado
- Sensor input patterns applied through testbench
- Motor control outputs verified using waveform analysis

## Applications
- Autonomous mobile robots
- Industrial path-following systems
- Educational robotics platforms

## Future Enhancements
- Support for more sensors
- PID-based motor control
- Integration with obstacle detection

## Author
**Gaurav Sai**  
B.Tech – Electronics and Communication Engineering

